using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MyBlog.UserControl
{
    public partial class TagContent : System.Web.UI.UserControl
    {
        #region ################## Variable ##################

        #endregion

        #region ################## Property ##################
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

        #region 로그아웃시 세션정보 초기화
        private void LogOut()
        {
     
        }
        #endregion


        #region 태그정보 Repeater 바인딩
        private void BindingList()
        {
            DataTable dtList = null;
            DataSet ds;

            SqlParameter[] arParams = new SqlParameter[]
             {
                 new SqlParameter("@topcount", SqlDbType.Int),
             };
            arParams[0].Value = 5;

            ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Tag_Index_Data_Get", arParams);

            dtList = ds.Tables[0]; 


            if (dtList != null)
            {
               this.rptList.DataSource = dtList;
               this.rptList.DataBind();


                //DataRow[] rows = dtList.Select();
                //_blog_code = rows[0]["blog_code"].ToString();
                //_blog_code = rows[0]["blog_code"].ToString();
            }

        }
        #endregion


        #region ################## Event #####################

        #endregion


        #endregion


    }
}