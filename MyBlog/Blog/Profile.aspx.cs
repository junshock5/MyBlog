using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace MyBlog
{
    public partial class Profile : PageBase
    {
        #region ################## Variable ##################
        public DateTime _NowDate;
        public String _UserName;
        public bool _IsNeighborhood;
        public List<string> _NeighborhoodList = new List<string>();

        #endregion

        #region ################## Property ##################

        #endregion

        #region ################## Page Load #################
        protected void Page_Load(object sender, EventArgs e)
        {
            InitValiable(); //전역변수 초기화
            InitParameter();//파라메터 초기화
            InitServerControl();//서버컨트롤 초기화
            BindingNeighborhoodData();//이웃정보 바인딩

            if (!IsPostBack)
            {

            }
        }
        #endregion

        #region ################## Method ####################

        #region 전역변수 초기화
        private void InitValiable()
        {
            this._NowDate = DateTime.Now;
            this._UserName = Utility.GetQuery("username");

            //주제 분류 변경
            SqlParameter[] Params = new SqlParameter[]
            {
               new SqlParameter("@user_name", SqlDbType.VarChar, 50),
               new SqlParameter("@user_target", SqlDbType.VarChar, 50)
            };
            if (Session["UserName"]==null)
                Session["UserName"] = "";
            Params[0].Value = Session["UserName"].ToString();
            Params[1].Value = _UserName;
            this._IsNeighborhood = Convert.ToBoolean(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Neighborhood_Check", Params));

        }
        #endregion

        #region 파라메터 초기화
        private void InitParameter()
        {
        }
        #endregion

        #region 서버컨트롤 초기화
        private void InitServerControl()
        {

        }
        #endregion

        #region 이웃정보 바인딩
        private void BindingNeighborhoodData()
        {
            //if (_UserName == Session["UserName"].ToString()) // 자신이 추가한 이웃정보 가져오기 
            //{
            //}
            //else   // 자신의 블로그가 아닌경우 해당 블로그의 추가한 이웃정보 가져오기
            //{
            //}
            DataTable dtList = null;
            DataSet ds;
            SqlParameter[] Params = new SqlParameter[]
                {
                   new SqlParameter("@user_name", SqlDbType.VarChar, 50)
                };
            Params[0].Value = _UserName;
        
            ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Neighborhood_Get", Params);
            dtList = ds.Tables[0];

            if (dtList != null)
            {
                DataRow[] rows = dtList.Select();
                for (int i = 0; i < rows.Length; ++i)
                {
                    _NeighborhoodList.Add(rows[i]["nb_target"].ToString());

                }
            }
        }
        #endregion


        #endregion

        #region ################## Event #####################
        #region 이웃추가
        protected void lnbaddNeighborhood_Click(object sender, EventArgs e)
        {
            SqlParameter[] Params = new SqlParameter[]
            {
               new SqlParameter("@user_name", SqlDbType.VarChar, 50),
               new SqlParameter("@user_target", SqlDbType.VarChar, 50)
            };
            Params[0].Value = Session["UserName"].ToString();
            Params[1].Value = _UserName;
            DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Neighborhood_Add", Params);

            Response.Redirect(Request.RawUrl);
        }
        #endregion

        #region 이웃삭제
        protected void lnbdeleteNeighborhood_Click(object sender, EventArgs e)
        {
            SqlParameter[] Params = new SqlParameter[]
            {
               new SqlParameter("@user_name", SqlDbType.VarChar, 50),
               new SqlParameter("@user_target", SqlDbType.VarChar, 50)
            };
            Params[0].Value = Session["UserName"].ToString();
            Params[1].Value = _UserName;
            DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Neighborhood_Delete", Params);

            Response.Redirect(Request.RawUrl);
        }
        #endregion

        #endregion


    }
}