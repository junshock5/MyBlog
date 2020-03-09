using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyBlog
{
    public partial class Error404 : System.Web.UI.Page
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

        #endregion

        #region ################## Event #####################

        #endregion
    }
}