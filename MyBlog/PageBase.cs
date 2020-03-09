//using ACON.Base.Dac;
//using log4net;
//using log4net.Config;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace MyBlog
{
	public class PageBase : Page
	{
        #region ################## Variable ##################
        //public static readonly ILog logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        //enum BlogSetting
        //{
        //  enum_IsOpenAll,
        //  enum_IsNotOpen,
        //  enum_IsNeighborOpen,
        //  enum_IsNeighborBothOpen,
        //}
        //enum BlogOption
        //{
        //    enum_IsWriteComment,
        //    enum_IsSearchBlog,
        //    enum_IsLinkdata,
        //}
        #endregion

        #region ################## Property ##################
        /// <summary>
        /// 사번
        /// </summary>
        public string SessionUserCode { get { return (Session["UserCode"] != null) ? Session["UserCode"].ToString() : string.Empty; } }
		/// <summary>
		/// 아이디
		/// </summary>
		public string SessionUserID { get { return (Session["UserID"] != null) ? Session["UserID"].ToString() : string.Empty; } }
		/// <summary>
		/// 이름
		/// </summary>
		public string SessionUserName { get { return (Session["UserName"] != null) ? Session["UserName"].ToString() : string.Empty; } }
		/// <summary>
		/// 부서코드
		/// </summary>
		public string SessionDeptCode { get { return (Session["DeptCode"] != null) ? Session["DeptCode"].ToString() : string.Empty; } }
		/// <summary>
		/// 부서명
		/// </summary>
		public string SessionDeptName { get { return (Session["DeptName"] != null) ? Session["DeptName"].ToString() : string.Empty; } }
		/// <summary>
		/// 파트코드
		/// </summary>
		public string SessionEtcDeptCode { get { return (Session["EtcDeptCode"] != null) ? Session["EtcDeptCode"].ToString() : string.Empty; } }
		/// <summary>
		/// 파트명
		/// </summary>
		public string SessionEtcDeptName { get { return (Session["EtcDeptName"] != null) ? Session["EtcDeptName"].ToString() : string.Empty; } }
		/// <summary>
		/// 이메일
		/// </summary>
		public string SessionEmail { get { return (Session["Email"] != null) ? Session["Email"].ToString() : string.Empty; } }
		/// <summary>
		/// 메뉴코드
		/// </summary>
		public string SessionMenuCode { get { return (Session["MenuCode"] != null) ? Session["MenuCode"].ToString() : string.Empty; } }

		public string SessionUserLogOn { get { return (Session["UserLogOn"] != null) ? Session["UserLogOn"].ToString() : string.Empty; } }
		public string SessionSystemAuth { get { return (Session["SystemAuth"] != null) ? Session["SystemAuth"].ToString() : string.Empty; } }
		public string SessionUserPasswordConfirm { get { return (Session["UserPasswordConfirm"] != null) ? Session["UserPasswordConfirm"].ToString() : string.Empty; } }

		public bool SessionAuthADMIN { get { return (Session["AuthADMIN"] != null) ? Convert.ToBoolean(Session["AuthADMIN"]): false; } }
		public bool SessionAuthIBOX  { get { return (Session["AuthIBOX"] != null) ?  Convert.ToBoolean(Session["AuthIBOX"] ): false; } }
		public bool SessionAuthX2 { get { return (Session["AuthX2"] != null) ? Convert.ToBoolean(Session["AuthX2"]) : false; } }
		public bool SessionAuthX3 { get { return (Session["AuthX3"] != null) ? Convert.ToBoolean(Session["AuthX3"]) : false; } }
		public bool SessionAuthXLBILL { get { return (Session["AuthXLBILL"] != null) ? Convert.ToBoolean(Session["AuthXLBILL"]) : false; } }

		#endregion

		#region ################## Constructor ################
		public PageBase()
		{
			//BasicConfigurator.Configure();
			//XmlConfigurator.Configure(new System.IO.FileInfo(HttpContext.Current.Request.MapPath(ConfigurationManager.AppSettings["log4net.Path"])));
		}
		#endregion

		#region ################## Method ####################


		#region 사용자 정보 쿠키 암호화
		public void SetCookieUserInfo()
		{
			if (Session["UserID"] != null)
			{
				string key = ConfigurationManager.AppSettings["WebAdminKey"];
				HttpCookie cookie = new HttpCookie("ARCHEAGE_ADMIN_AUTH", HttpUtility.UrlEncode(Utility.Encrypt(key, Session["UserID"].ToString())));
				cookie.Domain = ConfigurationManager.AppSettings["WebAdminDomain"];
				Response.SetCookie(cookie);
			}
		}
		#endregion

		#region 시스템 정보 쿠키
		public void SetCookieSystem(string sysInfo)
		{
			Response.SetCookie(new HttpCookie("SYSTEM_INFO", sysInfo));
		}
		#endregion


		#region 세션정보 초기화
		/// <summary>
		/// 세션정보 초기화
		/// </summary>
		public static void SetSessionToNull()
		{
			if (HttpContext.Current.Session["UserLogOn"]           != null) HttpContext.Current.Session["UserLogOn"] = null;
			if (HttpContext.Current.Session["SystemAuth"]          != null) HttpContext.Current.Session["SystemAuth"] = null;
			if (HttpContext.Current.Session["UserCode"]            != null) HttpContext.Current.Session["UserCode"] = null;
			if (HttpContext.Current.Session["UserID"]              != null) HttpContext.Current.Session["UserID"] = null;
			if (HttpContext.Current.Session["UserName"]            != null) HttpContext.Current.Session["UserName"] = null;
			if (HttpContext.Current.Session["DeptCode"]            != null) HttpContext.Current.Session["DeptCode"] = null;
			if (HttpContext.Current.Session["DeptName"]            != null) HttpContext.Current.Session["DeptName"] = null;
			if (HttpContext.Current.Session["EtcDeptCode"]         != null) HttpContext.Current.Session["EtcDeptCode"] = null;
			if (HttpContext.Current.Session["EtcDeptName"]         != null) HttpContext.Current.Session["EtcDeptName"] = null;
			if (HttpContext.Current.Session["Email"]               != null) HttpContext.Current.Session["Email"] = null;
			if (HttpContext.Current.Session["UserPasswordConfirm"] != null) HttpContext.Current.Session["UserPasswordConfirm"] = null;
			if (HttpContext.Current.Session["MenuCode"]            != null) HttpContext.Current.Session["MenuCode"] = null;
		}
		#endregion

		#endregion

		#region ################## Event #####################

		protected override void OnInit(EventArgs e)
		{
			////보안연결 Redirect
			//string deployMode = ConfigurationManager.AppSettings["DeployMode"];
			//if (deployMode.ToUpper() == "LIVE" || deployMode.ToUpper() == "QA")
			//{
			//	if (!HttpContext.Current.Request.IsSecureConnection)
			//		HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri.ToLower().Replace("http://", "https://"));
			//}

			//logger.Info(this.SessionUserCode + "|" + HttpContext.Current.Request.RawUrl, SessionUserCode, SessionUserName);
			Utility.Log(this.SessionUserID + "(" + this.SessionUserCode + ")" + "|" + HttpContext.Current.Request.RawUrl, LogType.Info);
			base.OnInit(e);
		}

		protected override void OnPreLoad(EventArgs e)
		{
			//bool isAuth = false;
			string accessErrorPath = ConfigurationManager.AppSettings["AccessError"];

			//사용자정보 셋팅
			if (Session["UserLogOn"] == null)
			{
				//Form 인증
				//SetLoginInfo(null);
			}

			//최초 시스템 사용자 인증 설정
			if ((Session["SystemAuth"] == null || Convert.ToBoolean(Session["SystemAuth"]) == false) && Session["UserCode"] != null)
			{
				//using (BaseDac baseDac = new BaseDac())
				//{
				//	isAuth = baseDac.IsAuth(Session["UserCode"].ToString());
				//}

				//Session["SystemAuth"] = isAuth;

				//if (isAuth == false)
				//{
				//	//접근금지
				//	Response.Redirect(accessErrorPath);
				//}
			}

			//페이지 권한 인증
			if (Session["SystemAuth"] != null && Convert.ToBoolean(Session["SystemAuth"]))
			{
				//string filePath = Request.Path;
				//using (BaseBiz baseBiz = new BaseBiz())
				//{
				//	isAuth = baseBiz.IsPageAuth(
				//		filePath.Substring(Request.Path.LastIndexOf('/') + 1),
				//		filePath.Substring(0, Request.Path.LastIndexOf('/') + 1),
				//		Session["UserCode"].ToString()
				//		);
				//}

				//if (isAuth == false)
				//{
				//	//접근금지
				//	Response.Redirect(accessErrorPath);
				//}
			}
			//else
			//	Response.Redirect(accessErrorPath);

			base.OnPreLoad(e);
		}

		protected override void OnError(EventArgs e)
		{
			base.OnError(e);

			//에러 페이지
			//Exception currentError = Server.GetLastError();
			//string body = string.Empty;
			//string filePath = ConfigurationManager.AppSettings["PageErrorTemplate"];
			
			////파일내용을 읽어서 저장
			//using (StreamReader srContent = new StreamReader(HttpContext.Current.Server.MapPath(filePath)))
			//{
			//	body = srContent.ReadToEnd();
			//	srContent.Close();
			//	if (body.IndexOf("^DATE^") > 0) body       = body.Replace("^DATE^", DateTime.Now.ToString());
			//	if (body.IndexOf("^MEMBER^") > 0) body = body.Replace("^MEMBER^", SessionDeptName + " " + SessionUserName + "(" + SessionUserID + ")");
			//	if (body.IndexOf("^URL^") > 0) body        = body.Replace("^URL^", HttpContext.Current.Request.RawUrl);
			//	if (body.IndexOf("^MESSAGE^") > 0) body    = body.Replace("^MESSAGE^", currentError.Message);
			//	if (body.IndexOf("^SOURCE^") > 0) body     = body.Replace("^SOURCE^",  currentError.Source);
			//	if (body.IndexOf("^STACKTRACE^") > 0) body = body.Replace("^STACKTRACE^", currentError.StackTrace.Replace("\r\n","<br/>"));
			//}

			//Utility.Log(currentError.ToString(), LogType.Error);

			////try
			////{
			////	//메일보내기
			////	Exception exception = null;
			////	string server = ConfigurationManager.AppSettings["MailServer"];
			////	string sender = ConfigurationManager.AppSettings["ErrorEmail"];
			////	string receiver = ConfigurationManager.AppSettings["AdminEmail"];
			////	string title = "[IBOX ERROR] " + currentError.Message;
			////	Utility.SendEmail(server, sender, receiver.Split('|'), null, null, title, true, body, null, ref exception);
			////}
			////catch (Exception ex)
			////{
			////	Utility.Log("메일보내기 에러 : " + ex.ToString(), LogType.Error);
			////}

			////페이지 쓰기
			//Response.Write(body);
			//Server.ClearError();
		}

		#endregion

	}
}
