using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MyBlog
{
    public partial class Changepassword : System.Web.UI.Page
    {
        #region ################## Variable ##################
        public string _user_email;
        public string _user_name;
        #endregion

        #region ################## Property ##################

        #endregion

        #region ################## Page Load #################
        protected void Page_Load(object sender, EventArgs e)
        {
            InitValiable(); //전역변수 초기화
            InitParameter();//파라메터 초기화
            InitServerControl();//서버컨트롤 초기화

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
            this._user_email = Utility.GetQuery("user_email");
            this._user_name = Utility.GetQuery("user_name");
        }
        #endregion

        #region 서버컨트롤 초기화
        private void InitServerControl()
        {

        }
        #endregion


        #endregion

        #region ################## Event #####################

        #region 비밀번호 변경
        protected void lnbChangePassword_Click(object sender, EventArgs e)
        {
            SqlParameter[] arParams = new SqlParameter[]
            {
                 new SqlParameter("@user_email", SqlDbType.VarChar, 100),
                 new SqlParameter("@user_name", SqlDbType.VarChar, 50),
                 new SqlParameter("@user_password", SqlDbType.VarChar, 50),
            };
            
            arParams[0].Value = _user_email;
            arParams[1].Value = _user_name;
            arParams[2].Value = txtUserPassword.Text;

            int retValue = 0;
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Account_ChangePassword", arParams));
            if (retValue == 1)
            {
                Utility.ScriptStartExec(this.Page, "alert('비밀번호가 변경 되었습니다.');");
            }

        }


        #endregion

        #endregion
    }
}