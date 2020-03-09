using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace MyBlog
{
    public partial class Register : PageBase
    {
        #region ################## Variable ##################
        public string _user_name;
        public string _user_email;
        public string _user_password;
        public string _user_gender;
        public string _user_name_eng;
        public DateTime _user_create_time;
        public bool _is_useradmin;
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
            this._user_password = txtUserPassword.Text;
            this._user_gender = gender.Value;
            this._user_name_eng = firstname.Value + lastname.Value; 
            this._user_create_time = DateTime.Now;
            this._is_useradmin = subscription.Checked;
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

        #region 계정 생성 함수
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {

            // 이미 가입되어있는 이름, 이메일 인지 확인
            SqlParameter[] Params = new SqlParameter[]
            {
                 new SqlParameter("@user_name", SqlDbType.VarChar, 50),
                 new SqlParameter("@user_email", SqlDbType.VarChar, 100),
            };

            Params[0].Value = _user_name;
            Params[1].Value = _user_email;


            int retValue = 0;
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Account_CheckOverlap", Params));
            if (retValue == 1)
            {
                lblMsg.Text = "이미 존재하는 이름 입니다."; return;
            }
            else if (retValue == 2)
            {
                lblMsg.Text = "이미 등록된 이메일 입니다."; return;
            }
             




            SqlParameter[] arParams = new SqlParameter[]
                {
                 new SqlParameter("@user_name", SqlDbType.VarChar, 50),
                 new SqlParameter("@user_email", SqlDbType.VarChar, 100),
                 new SqlParameter("@user_password", SqlDbType.VarChar, 50),
                 new SqlParameter("@user_gender", SqlDbType.VarChar, 50),
                 new SqlParameter("@user_name_eng", SqlDbType.VarChar, 50),
                 new SqlParameter("@user_create_time", SqlDbType.DateTime),
                 new SqlParameter("@user_addmin", SqlDbType.TinyInt),
                };

            arParams[0].Value = _user_name;
            arParams[1].Value = _user_email;
            arParams[2].Value = _user_password;
            arParams[3].Value = _user_gender;
            arParams[4].Value = _user_name_eng;
            arParams[5].Value = _user_create_time;
            arParams[6].Value = _is_useradmin;

            retValue = 0;
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Account_Create", arParams));
            if(retValue==1)
            {
                Utility.ScriptStartExec(this.Page, "alert('계정이 생성되었습니다.');");
            }
            else
            {
                Utility.ScriptStartExec(this.Page, "alert('계정생성에 실패하였습니다.');");
            }
        }

        #endregion

        #endregion
    }
}