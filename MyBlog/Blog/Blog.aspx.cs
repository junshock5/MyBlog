using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace MyBlog
{
    public partial class Blog : PageBase
    {
        #region ################## Variable ##################
        private const int _TOPSIZE = 5;
        private const int _PAGESIZE = 10;
        private int _Page=1;
        public string _LogOut;
        public string _SearchKeyword = "";
        public string WC_Contents;
        public int _cg = 0;
        public string _Tag = "";
        public bool _IsNeighborhood;
        #endregion

        #region ################## Property ##################
        public int TotalCount { get; set; }
        #endregion

        #region ################## Page Load #################
        protected void Page_Load(object sender, EventArgs e)
        {
            InitValiable(); //전역변수 초기화
            InitParameter();//파라메터 초기화
            InitServerControl();//서버컨트롤 초기화
            BindingList(); //리스트 바인딩
            if (!IsPostBack)
            {

            }
        }
        #endregion

        #region ################## Method ####################

        #region 전역변수 초기화
        private void InitValiable()
        {
            //주제 분류 변경
            //SqlParameter[] Params = new SqlParameter[]
            //{
            //   new SqlParameter("@user_name", SqlDbType.VarChar, 50),
            //   new SqlParameter("@user_target", SqlDbType.VarChar, 50)
            //};
            //Params[0].Value = Session["UserName"].ToString();
            //Params[1].Value = _UserName;
            //this._IsNeighborhood = Convert.ToBoolean(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Neighborhood_Check", Params));
        }
        #endregion

        #region 파라메터 초기화
        private void InitParameter()
        {
            if(Utility.GetQuery("page")!="")
            this._Page = Convert.ToInt32(Utility.GetQuery("page"));
            this._LogOut = Utility.GetQuery("LogOut").ToString();
            if(Utility.GetQuery("cg")!="")      
            this._cg = Convert.ToInt32(Utility.GetQuery("cg"));
            this._SearchKeyword = Utility.GetQuery("keyword");

            if (Utility.GetQuery("tag")!= "")
                this._Tag = Utility.GetQuery("tag").ToString();
        }
        #endregion

        #region 서버컨트롤 초기화
        private void InitServerControl()
        {
            if (_LogOut == "true")
                LogOut();
        }
        #endregion

        #region 로그아웃시 세션정보 초기화
        private void LogOut()
        {
            Session["UserLogOn"] = false;
            Session["SystemAuth"] = false;
            Session["UserCode"] = "";
            Session["UserName"] = "";
            Session["Email"] = "";
            Session["UserEngName"] = "";
            Session["CreateTime"] = "";
            Session["UserAdmin"] = "";
        }
        #endregion


        #region 블로그정보 Repeater 바인딩
        private void BindingList()
        {
            DataTable dtList = null;
            DataSet ds;
            if (_cg==0)
            {
                SqlParameter[] arParams = new SqlParameter[]
                 {
                     new SqlParameter("@total_count", SqlDbType.Int),
                     new SqlParameter("@top_size", SqlDbType.Int),
                     new SqlParameter("@page_num", SqlDbType.Int),
                     new SqlParameter("@keyword", SqlDbType.NVarChar),
                     new SqlParameter("@tag_data", SqlDbType.VarChar),
                     new SqlParameter("@user_name", SqlDbType.VarChar),
                 };

                arParams[0].Direction = ParameterDirection.Output;
                arParams[1].Value = _TOPSIZE;
                arParams[2].Value = _Page;
                arParams[3].Value = _SearchKeyword;
                arParams[4].Value = "#"+_Tag;
                string tempstring = "";
                if (Session["UserName"] != null)
                    tempstring = Session["UserName"].ToString();
                else tempstring = "";
                arParams[5].Value = tempstring;
                ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_GetList", arParams);
                dtList = ds.Tables[0];
                TotalCount = Convert.ToInt32(arParams[0].Value);
            }
            else
            {
                SqlParameter[] arParams = new SqlParameter[]
                {
                     new SqlParameter("@total_count", SqlDbType.Int),
                     new SqlParameter("@top_size", SqlDbType.Int),
                     new SqlParameter("@page_num", SqlDbType.Int),
                     new SqlParameter("@keyword", SqlDbType.NVarChar),
                     new SqlParameter("category_name" , SqlDbType.VarChar,50)
                };
                arParams[0].Direction = ParameterDirection.Output;
                arParams[1].Value = _TOPSIZE;
                arParams[2].Value = _Page;
                arParams[3].Value = _SearchKeyword;
                string category_name = "";
                switch (_cg)
                {
                    case 1: category_name = "사진"; break;
                    case 2: category_name = "공연전시"; break;
                    case 3: category_name = "건강의학"; break;
                    case 4: category_name = "게임"; break;
                    case 5: category_name = "스포츠"; break;
                    case 6: category_name = "세계여행"; break;
                }
               
                arParams[4].Value = category_name;
                ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Subject_Category_GetList", arParams);
                dtList = ds.Tables[0];
                TotalCount = Convert.ToInt32(arParams[0].Value);

            }

          

            if (dtList != null)
            {
                if (this.TotalCount == 0)
                {
                    this.ltrNone.Text = "<div style='text-align:center;margin:10px; padding-bottom:10px; border-bottom:1px solid #999;'>조회결과가 없습니다</div>";
                    this.rptList.Visible = false;
                }
                else
                {
                    this.rptList.DataSource = dtList;
                    this.rptList.DataBind();
                }

                DataRow[] rows = dtList.Select();
                if (rows.Any())
                    WC_Contents = rows[0]["blog_contents"].ToString();
                else
                {
                    this.ltrNone.Text = "<div style='text-align:center;margin:10px; padding-bottom:10px; border-bottom:1px solid #999;'>조회결과가 없습니다</div>";
                }
                //그림 뽑아보자.

                //페이징 구성
                if (this.TotalCount > _TOPSIZE)
                    this.ltrPaging.Text = Utility.GetPagingLinkSting(_PAGESIZE,
                                                                    ((this.TotalCount % _TOPSIZE) > 0) ? this.TotalCount / _TOPSIZE + 1 : this.TotalCount / _TOPSIZE,
                                                                    this._Page,
                                                                    Request.RawUrl,
                                                                    "page",
                                                                    "", "", "", "", "", "", "", "", "");
                Session["NowPageIndex"] = this._Page;

            }

        }
        #endregion

        #region 바인딩된 블로그정보중 저자 보여주기
        protected string ShowWriter(string writer)
        {
            return writer;
        }
        #endregion

        #region 바인딩된 블로그정보중 읽은수 보여주기
        protected string ShowReadCount(string readcount)
        {
            return readcount;
        }
        #endregion

        #region 바인딩된 블로그정보중 번호 보여주기
        protected string ShowSerailNum(string num)
        {
            return num;
        }
        #endregion

        #region 바인딩된 블로그정보중 생성날짜 보여주기
        protected string ShowDate(DateTime regDate)
        {
            return string.Format("{0:yyyy-MM-dd}", regDate);
        }
        #endregion

        #region 바인딩된 블로그정보중 블로그이름 보여주기
        protected string ShowTitle(string title, string serialNo)
        {
            string returnString = "";
            returnString += "<a href='Read.aspx?sn=" + serialNo;
            returnString += "' style= \"color:black\">" + title + "</a>";
            return returnString;
        }

        #endregion
        
        #region 이미지 보여주기
        protected string ShowImg(string Img)
        {
            return Img;
        }
        #endregion
        #region 내용 보여주기
        protected string ShowContents(string Contents)
        {
            return Contents;
        }
        #endregion

        #endregion

        #region ################## Event #####################

        #region 키워드 서치 버튼 이벤트
        protected void Keyword_Search_btn_Click(object sender, EventArgs e)
        {

            Response.Redirect("Blog.aspx?page=1&keyword=" + Keyword_Search_Input.Text);
        }
        #endregion


        #endregion


    }

    
}