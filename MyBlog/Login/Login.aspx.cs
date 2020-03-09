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
    public partial class Login : PageBase
    {
        #region ################## Variable ##################
        public static HttpCookie _cookie;
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
        }
        #endregion

        #region 서버컨트롤 초기화
        private void InitServerControl()
        {
            if (_cookie != null)
                txtUserId.Text = _cookie.Value;
            //txtUserId.Text= _cookie.Values["user_email"];

        }
        #endregion

        #endregion

        #region ################## Event #####################

        #region 로그인 버튼 이벤트
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlParameter[] arParams = new SqlParameter[]
            {
                 new SqlParameter("@user_email", SqlDbType.VarChar, 100),
                 new SqlParameter("@user_password", SqlDbType.VarChar, 50),
            };
 
            arParams[0].Value = this.hdf1.Value;
            arParams[1].Value = this.hdf2.Value;


            int retValue = 0;
            string errorMsg = "";
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Login_Check", arParams));
            if (retValue != 0)
            {
                SqlParameter[] Params = new SqlParameter[]
                {
                       new SqlParameter("@user_email", SqlDbType.VarChar, 100)
                };
                Params[0].Value = this.hdf1.Value;

                DataSet ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Login_GetData", Params);
                DataTable dtList = null;
                dtList = ds.Tables[0];

                if (dtList != null)
                {
                    DataRow[] rows = dtList.Select();

                    //인증
                    Session["UserLogOn"] = true;
                    Session["SystemAuth"] = true;

                    Session["UserCode"] = rows[0]["user_code"].ToString();
                    Session["UserName"] = rows[0]["user_name"].ToString();
                    Session["Email"] = rows[0]["user_email"].ToString();
                    Session["UserEngName"] = rows[0]["user_name_eng"].ToString();
                    Session["CreateTime"] = rows[0]["user_create_time"].ToString();
                    Session["UserAdmin"] = rows[0]["user_addmin"].ToString(); 

                    // 쿠키를 이용한 ID 기억하기
                    if(remember.Checked==true)
                    {
                        _cookie = new HttpCookie("user_email", this.hdf1.Value);
                        Response.Cookies.Add(_cookie);
                        _cookie.Expires = DateTime.Now.AddDays(999);
                    }


                }

                Response.Redirect("../Blog/Blog.aspx?page=1");
            }
            else
            {
                errorMsg = "아이디와 비밀번호를 확인해 주세요";
                this.lblMsg.Text = errorMsg;
            }
        }
        #endregion

        #endregion
    }
}