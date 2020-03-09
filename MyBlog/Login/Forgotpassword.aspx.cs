using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Configuration;

namespace MyBlog
{
    public partial class Forgotpassword : PageBase
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
            this._user_name = txtUserId.Text;
            this._user_email = txtEmail.Text;
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

        #endregion

        #region ################## Event #####################

        #region 이메일과 이름이 같은지 확인후 맞으면 비밀번호 페이지로 이동
        protected void lnbFindPassword_Click(object sender, EventArgs e)
        {

            SqlParameter[] arParams = new SqlParameter[]
            {
                 new SqlParameter("@user_email", SqlDbType.NVarChar, 100),
                 new SqlParameter("@user_name", SqlDbType.VarChar, 50),
            };

            arParams[0].Value = _user_email;
            arParams[1].Value = _user_name;


            int retValue = 0;
            string errorMsg = "";
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Account_CheckFind", arParams));
            if(retValue==1)
            {
                Response.Redirect("Changepassword.aspx?user_email="+ _user_email+ "&user_name="+ _user_name);
            }
            else
            {
                errorMsg = "이메일과 이름을 확인해 주세요";
                this.lblMsg.Text = errorMsg;
            }
        }
        #endregion

        #endregion


    }
}