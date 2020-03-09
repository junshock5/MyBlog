using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Net.Mime;
using System.Configuration;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Reflection;
using System.Collections;

namespace MyBlog
{
	public class Utility
	{
		#region Static Method
		
		#region =============== 스크립트 관련 ===============

		#region 스크립트 실행 : 랜더링 이전
		/// <summary>
		/// 스크립트 실행 : 랜더링 이전
		/// </summary>
		/// <param name="page">페이지 개체</param>
		/// <param name="message">메시지</param>
		/// <remarks>페이지가 랜더링 되기전에 스크립트를 실행할 수 있다.</remarks>
		public static void ScriptStartExec(Page page, string message)
		{
			string script = "<script type='text/javascript'>{0}</script>";
			string cltKey = Guid.NewGuid().ToString();
			ClientScriptManager csm = page.ClientScript;

			script = string.Format(script, message);

			csm.RegisterClientScriptBlock(page.GetType(), cltKey, script);
		}
		#endregion

		#region 스크립트 알림 실행 : 랜더링 이전
		/// <summary>
		/// 스크립트 알림 실행 : 랜더링 이전
		/// </summary>
		/// <param name="page">페이지 개체</param>
		/// <param name="message">메시지</param>
		/// <remarks>페이지가 랜더링 되기전에 스크립트의 알림메시지를 실행할 수 있다.</remarks>
		public static void ScriptStartExecAlert(Page page, string message)
		{
			string script = "<script type='text/javascript'>alert('{0}')</script>";
			string cltKey = Guid.NewGuid().ToString();
			ClientScriptManager csm = page.ClientScript;

			script = string.Format(script, message.Replace("'", "＇").Replace("\r\n", "\\n"));

			csm.RegisterClientScriptBlock(page.GetType(), cltKey, script);
		}
		#endregion

		#region 스크립트 실행 : 랜더링 이후
		/// <summary>
		/// 스크립트 실행 : 랜더링 이후
		/// </summary>
		/// <param name="page">페이지 개체</param>
		/// <param name="message">메시지</param>
		/// <remarks>페이지가 랜더링 된 이후에 스크립트를 실행할 수 있다.</remarks>
		public static void ScriptEndExec(Page page, string message)
		{
			string script = "<script type='text/javascript'>{0}</script>";
			string cltKey = Guid.NewGuid().ToString();
			ClientScriptManager csm = page.ClientScript;

			script = string.Format(script, message);

			csm.RegisterStartupScript(page.GetType(), cltKey, script);
		}
		#endregion

		#region 스크립트 알림 실행 : 랜더링 이후
		/// <summary>
		/// 스크립트 알림 실행 : 랜더링 이후
		/// </summary>
		/// <param name="page">페이지 개체</param>
		/// <param name="message">메시지</param>
		/// <remarks>페이지가 랜더링 된 이후에 스크립트의 알림메시지를 실행할 수 있다.</remarks>
		public static void ScriptEndExecAlert(Page page, string message)
		{
			string script = "<script type='text/javascript'>alert('{0}')</script>";
			string cltKey = Guid.NewGuid().ToString();
			ClientScriptManager csm = page.ClientScript;

			script = string.Format(script, message.Replace("'", "＇").Replace("\r\n", "\\n"));

			csm.RegisterStartupScript(page.GetType(), cltKey, script);
		}
		#endregion

		#endregion
		
		#region 쿼리스트링값 가져오기
		/// <summary>
		/// 쿼리스트링값 가져오기
		/// </summary>
		/// <param name="name">쿼리명</param>
		/// <remarks>유니코드로 파싱된 데이터는 원래데이터로 변환하여 가져옴</remarks>
		public static string GetQuery(string name)
		{
			if (HttpContext.Current.Request.QueryString[name] == null)
				return string.Empty;
			else
				return HttpUtility.UrlDecode(HttpContext.Current.Request.QueryString[name]);

			//string query = name.Trim().ToLower();
			//string value = HttpContext.Current.Request.QueryString[name];

			//if (value.Trim() == string.Empty)
			//    return string.Empty;
			//else
			//    return HttpUtility.UrlDecode(value);
		}
		#endregion

		#region 개체로 넘기는 파라메터값 가져오기
		/// <summary>
		/// 개체로 넘기는 파라메터값 가져오기
		/// </summary>
		/// <param name="name">쿼리명</param>
		/// <remarks>Ajax에서 주로 사용</remarks>
		public static string GetParam(string name)
		{
			if (HttpContext.Current.Request[name] == null)
				return string.Empty;
			else
				return HttpUtility.UrlDecode(HttpContext.Current.Request[name]);
		}
		#endregion

		#region 파일확장자 구하기
		public static string GetFileExtension(string fileName)
		{
			if (fileName.IndexOf('.') == -1)
				return "";
			else
				return fileName.Substring(fileName.LastIndexOf(".") + 1);
		}
		#endregion

		#region 파일사이즈 구하기
		/// <summary>
		/// 파일사이즈 구하기
		/// </summary>
		/// <param name="size">파일크기(byte)</param>
		/// <remarks>바이트단위의 크기를 단위환산하여 보여준다 (ex)10.30 MB</remarks>
		/// <returns></returns>
		public static string GetFileSize(decimal size)
		{
			string retVal = "";
			if (size >= 1048576)
				retVal = string.Format("{0:#.00} MB", size / 1048576);
			else if (size >= 1024)
				retVal = string.Format("{0:#.00} KB", size / 1024);
			else
				retVal = size.ToString() + " byte";

			return retVal;
		}
		#endregion

		#region 중복되지 않는 파일명 구하기
		/// <summary>
		/// 중복되지 않는 파일명 구하기
		/// </summary>
		/// <param name="dirPath">경로</param>
		/// <param name="fileName">파일이름</param>
		/// <remarks>동일한 파일명이 존재할 경우 유니크한 파일이름으로 만든다. (ex)filename.exe -> filename(1).exe</remarks>
		/// <returns></returns>
		private static string GetUniqueFileNameWithPath(string dirPath, string fileName)
		{
			int indexOfDot = fileName.LastIndexOf(".");				//파일이름에서 . 의 위치를 알아낸다.
			string strName = fileName.Substring(0, indexOfDot);		//파일명만을 떼어낸다
			string strExt = fileName.Substring(++indexOfDot);		//파일의 확장자만을 떼어낸다.
			bool bExist = true;   //같은 이름의 파일의 존재여부, 우선 있다고 가정.
			int fileCount = 0;

			while (bExist)
			{
				if (File.Exists(Path.Combine(dirPath, fileName)))
				{
					fileCount++;
					fileName = strName + "(" + fileCount + ")." + strExt;
				}
				else
				{
					bExist = false;
				}
			}

			return Path.Combine(dirPath, fileName);
		}
		#endregion

		#region 지정된 QueryString Parameters 값 바꾸기
		/// <summary>
		/// 지정된 QueryString Parameters 값 바꾸기
		/// </summary>
		/// <param name="pathRaw">쿼리를 포함하는 페이지 주소</param>
		/// <param name="queryName">바꿔주고자 하는 쿼리스트링 이름</param>
		/// <param name="val">바꾸고 싶은 값</param>
		/// <returns></returns>
		public static string GetQueryStringExchange(string pathRaw, string queryName, string val)
		{
			// 하나만 값이 없으면 공백 리턴
			if (pathRaw == "")
				return "";

			// QueryString에 대한 Parameter가 하나도 없으면 공백 리턴
			if (pathRaw.IndexOf("?") == -1)
			{
				if (queryName == "" || val == "")
					return "";
				else
					return pathRaw + "?" + queryName + "=" + val;
			}

			string[] paths = pathRaw.Split('?');

			// 상대경로
			string path = paths[0];

			// QuerySttring Array splited
			string[] querys = paths[1].Split('&');
			// QueryString 조합문자열
			string combinedQry = "";
			// 만약 queryName의 값이 없을 경우 새로 추가해준다.
			bool isExist = false;

			foreach (string str in querys)
			{
				string[] qryUnits = str.Split('=');
				if (qryUnits[0].ToLower() == queryName.ToLower())
				{
					combinedQry += qryUnits[0] + "=" + val + "&";
					isExist = true;
				}
				else
					combinedQry += str + "&";
			}

			if (combinedQry.IndexOf("&") > 0)
			{
				if (isExist)
					combinedQry = combinedQry.Substring(0, combinedQry.Length - 1);
				else
					combinedQry += queryName + "=" + val;
			}

			return path + "?" + combinedQry;
		} 
		#endregion

		#region 페이징 링크 문자열
		/// <summary>
		/// 페이징 링크 문자열
		/// </summary>
		/// <param name="pageWidth">페이지크기( 5 | 10 | etc )</param>
		/// <param name="totalPage">전체레코드개수</param>
		/// <param name="currentPageNo">현재페이지번호(1...n)</param>
		/// <param name="pageRawPath">파라메터를 포함하는 페이지경로(page.aspx?a=1)</param>
		/// <param name="pageQryName">페이지번호를 인식하는 쿼리스트링 이름(p | page | etc)</param>
		/// <param name="imgStaticSrc">이미지절대경로("/ImageSrc/")</param>
		/// <param name="prev10OffImgSrc">이전 10개 이동 비활성화 이미지("btn/pre10Off.gif")</param>
		/// <param name="prev10OnImgSrc">이전 10개 이동 활성화 이미지("btn/pre10On.gif")</param>
		/// <param name="prevOffImgSrc">이전 이동 비활성화 이미지("btn/preOff.gif")</param>
		/// <param name="prevOnImgSrc">이전 이동 활성화 이미지("btn/preOn.gif")</param>
		/// <param name="next10OffImgSrc">다음 10개 이동 비활성화 이미지("btn/next10Off.gif")</param>
		/// <param name="next10OnImgSrc">다음 10개 이동 활성화 이미지("btn/next10On.gif")</param>
		/// <param name="nextOffImgSrc">다음 이동 비활성화 이미지("btn/nextOff.gif")</param>
		/// <param name="nextOnImgSrc">다음 이동 활성화 이미지("btn/nextOn.gif")</param>
		/// <remarks>게시판 페이징 문자열 만들기</remarks>
		/// <returns></returns>
		public static string GetPagingLinkSting(
			int pageWidth,
			int totalPage,
			int currentPageNo,
			string pageRawPath,
			string pageQryName,
			string imgStaticSrc = "",
			string prev10OffImgSrc = "",
			string prev10OnImgSrc = "",
			string prevOffImgSrc = "",
			string prevOnImgSrc = "",
			string next10OffImgSrc = "",
			string next10OnImgSrc = "",
			string nextOffImgSrc = "",
			string nextOnImgSrc = "")
		{
			//페이지 링크
			string link = "<div class='paging'>";

			link += "<span><a href='" + GetQueryStringExchange(pageRawPath, pageQryName, "1") + "' class='btn_sml'><span>처음</span></a><span>";

			//왼쪽 화살표 pageWidth만큼 앞으로 링크 설정
			if (pageWidth == 10)
			{
				if (currentPageNo < pageWidth)
					link += "<span><a href='javascript:void(0)' class='btn_sml'><span style='color:gray;cursor:default;'>-10</span></a></span>";
				else
					link += "<span><a href='" + GetQueryStringExchange(pageRawPath, pageQryName, Convert.ToString(currentPageNo - 10)) + "' class='btn_sml'><span>-10</span></a></span>";
			}

			//왼쪽 화살표 링크 설정
			if (currentPageNo == 1)
				link += "<span><a href='javascript:void(0)' class='btn_sml'><span style='color:gray;cursor:default;'>이전</span></a></span>";
			else
				link += "<span><a href='"+GetQueryStringExchange(pageRawPath, pageQryName, Convert.ToString(currentPageNo-1))+"' class='btn_sml'><span>이전</span></a></span>";

			int startNum = 0;
			int endNum = 0;

			if (totalPage > pageWidth)
			{
				if (currentPageNo % pageWidth == 0)
				{
					startNum = ((currentPageNo / pageWidth) - 1) * pageWidth + 1;
					if (startNum + pageWidth - 1 >= totalPage)
						endNum = totalPage;
					else
						endNum = startNum + pageWidth - 1;
				}
				else
				{
					startNum = (currentPageNo / pageWidth) * pageWidth + 1;
					if (startNum + pageWidth >= totalPage)
						endNum = totalPage;
					else
						endNum = startNum + pageWidth - 1;
				}
			}
			else
			{
				startNum = 1;
				endNum = totalPage;
			}

			for (; startNum <= endNum; startNum++)
			{
				if (startNum == currentPageNo)
					link += "<span class='current'>" + startNum + "</span><span class='split'>|</span>";
				else
					link += "<span class='number' onmouseover=\"this.style.backgroundColor='#ffccff'\" onmouseout=\"this.style.backgroundColor='#fff' \"><a href='" + GetQueryStringExchange(pageRawPath, pageQryName, Convert.ToString(startNum)) + "'>" + startNum + "</a></span><span class='split'>|</span>";
			}

			// 끝의 "|" 문자 삭제
			link = link.Substring(0, link.Length - 28);

			// 오른쪽 화살표 링크 설정
			if (currentPageNo == totalPage)
				link += "<span><a href='javascript:void(0)' class='btn_sml'><span style='color:gray;cursor:default;'>다음</span></a></span>";
			else
				link += "<span><a href='" + GetQueryStringExchange(pageRawPath, pageQryName, Convert.ToString(currentPageNo + 1)) + "' class='btn_sml'><span>다음</span></a></span>";

			
			if (pageWidth == 10)
			{
				// 오른쪽 화살표 pageWidth만큼 뒤로 링크 설정
				if (currentPageNo % pageWidth == 0)
				{
					int next10 = ((currentPageNo + 10) > totalPage) ? totalPage : currentPageNo + 10;
					link += "<span><a href='" + GetQueryStringExchange(pageRawPath, pageQryName, Convert.ToString(next10))+"' class='btn_sml'><span>+10</span></a></span>";
				}
				else
				{
					if ( (currentPageNo > (totalPage/pageWidth) * pageWidth) && (currentPageNo <= totalPage))
						link += "<span><a href='javascript:void(0)' class='btn_sml'><span style='color:gray;cursor:default;'>+10</span></a></span>";
					else
					{
						int next10 = ((currentPageNo+10)>totalPage) ? totalPage : currentPageNo +10;
						link += "<span><a href='"+GetQueryStringExchange(pageRawPath, pageQryName, Convert.ToString(next10))+"' class='btn_sml'><span>+10</span></a></span>";
					}

					
				}
			}

			link += "<span><a href='" + GetQueryStringExchange(pageRawPath, pageQryName, totalPage.ToString()) + "' class='btn_sml'><span>끝</span></a></span>";
			link += "</div>";

			return link;
		} 
		#endregion

		#region 이메일 보내기 : 심플버젼
		/// <summary>
		/// 이메일 보내기 : 심플버젼
		/// </summary>
		/// <param name="server">서버정보(IP or 서버명)</param>
		/// <param name="sender">보내는사람(홍길동;hong@xlgames.com or hong@xlgames.com)</param>
		/// <param name="receiver">받는사람(홍길동;hong@xlgames.com or hong@xlgames.com)</param>
		/// <param name="title">제목</param>
		/// <param name="content">내용</param>
		/// <param name="exception">처리예외값</param>
		public static void SendEmail(string server,
									 string sender,
									 string receiver,
									 string title,
									 string content,
									 ref Exception exception)
		{
			if (server == "") server = ConfigurationManager.AppSettings["MailServer"];
			SendEmail(server,
					  sender,
					  new string[1] { receiver },
					  null,
					  null,
					  title,
					  true,
					  content,
					  null,
					  ref exception);
		} 
		#endregion

		#region 이메일 보내기
		/// <summary>
		/// 이메일 보내기
		/// </summary>
		/// <param name="server">서버정보(IP or 서버명)</param>
		/// <param name="sender">보내는사람(홍길동;hong@xlgames.com or hong@xlgames.com)</param>
		/// <param name="receivers">받는사람(홍길동;hong@xlgames.com or hong@xlgames.com)</param>
		/// <param name="refers">참조</param>
		/// <param name="hiddenRefers">숨은참조</param>
		/// <param name="title">제목</param>
		/// <param name="isBodyHtml">HTML포멧여부</param>
		/// <param name="content">내용</param>
		/// <param name="attachFiles">첨부파일(물리경로)</param>
		/// <param name="exception">처리예외값</param>
		public static void SendEmail(string server,
									 string sender,
									 string[] receivers,
									 string[] refers,
									 string[] hiddenRefers,
									 string title,
									 bool isBodyHtml,
									 string content,
									 string[] attachFiles,
									 ref Exception exception)
		{
			MailMessage message = new MailMessage();

			if (server == "")
			{
				exception = new Exception("서버정보가 없습니다.");
				return;
			}
			if (sender == "")
			{
				exception = new Exception("보내는사람의 주소가 정확하지 않습니다.");
				return;
			}
			if (receivers == null || receivers.Length == 0)
			{
				exception = new Exception("받는사람의 주소가 정확하지 않습니다.");
				return;
			}
			if (title == "")
			{
				exception = new Exception("제목이 없습니다.");
				return;
			}
			if (content == "")
			{
				exception = new Exception("내용이 없습니다.");
				return;
			}

			try
			{
				//보내는사람
				message.From = GetMailAddress(sender);
				//받는사람
				foreach (string to in receivers)
				{
					message.To.Add(GetMailAddress(to));
				}
				//참조
				if (refers != null)
				{
					foreach (string cc in refers)
						message.CC.Add(GetMailAddress(cc));
				}
				//숨은참조
				if (hiddenRefers != null)
				{
					foreach (string bcc in hiddenRefers)
						message.Bcc.Add(GetMailAddress(bcc));
				}
				//제목

				message.Subject = title;
				message.SubjectEncoding = Encoding.GetEncoding("EUC-KR");
				//HTML 포멧 여부
				message.IsBodyHtml = isBodyHtml;
				//내용
				message.Body = content;
				message.BodyEncoding = Encoding.GetEncoding("EUC-KR");
				//첨부파일
				if (attachFiles != null)
				{
					foreach (string file in attachFiles)
					{
						Attachment data = new Attachment(file, MediaTypeNames.Application.Octet);
						ContentDisposition disposition = data.ContentDisposition;
						disposition.CreationDate = File.GetCreationTime(file);
						disposition.ModificationDate = File.GetLastWriteTime(file);
						disposition.ReadDate = File.GetLastAccessTime(file);
						message.Attachments.Add(data);
					}
				}

				if (ConfigurationManager.AppSettings["MailSendFlag"] == "true")
				{
					Task task = Task.Factory.StartNew(() => {
						using (SmtpClient client = new SmtpClient(server))
						{
							client.Timeout = 10000;
							client.Port = 25;
							client.Credentials = CredentialCache.DefaultNetworkCredentials;
							client.Send(message);
						}
					});
				}
				exception = null;
			}
			catch (Exception ex)
			{
				exception = ex;
			}
		}

		#region 이메일 필터링 리스트
		/// <summary>
		/// 이메일 필터링 리스트
		/// </summary>
		/// <param name="address">메일주소 문자열 배열(ex:조기제;miriamme@xlgames.com or miriamme@xlgames.com)</param>
		/// <remarks>메일주소를 이름과 주소로 구분하여 개체를 리턴한다.</remarks>
		/// <returns></returns>
		public static MailAddressCollection GetMailAddress(string[] address)
		{
			if (address == null || address.Length == 0) return null;

			//"이름;이메일주소" 를 가지고 있는 배열값
			MailAddressCollection mailList = new MailAddressCollection();
			foreach (string user in address)
			{
				mailList.Add(GetMailAddress(user));
			}

			return mailList;
		} 
		#endregion

		#region 이메일 필터링
		/// <summary>
		/// 이메일 필터링
		/// </summary>
		/// <param name="address">메일주소(ex:조기제;miriamme@xlgames.com or miriamme@xlgames.com)</param>
		/// <remarks>메일주소를 이름과 주소로 구분하여 개체를 리턴한다.</remarks>
		/// <returns></returns>
		public static MailAddress GetMailAddress(string address)
		{
			if (address == "") return null;

			//이름;이메일주소
			MailAddress retMail = null;
			string[] mails = address.Split(';');
			if (mails.Length == 1)
				retMail = new MailAddress(mails[0]);
			else
				retMail = new MailAddress(mails[1], mails[0], Encoding.UTF8);

			return retMail;
		} 
		#endregion
		
		#endregion

		#region =============== 암/복호화 ===============

		#region 암호화
		/// <summary>
		/// 암호화
		/// </summary>
		/// <param name="key">키(8자리만 가능)</param>
		/// <param name="value">암호화할 문자열</param>
		/// <returns></returns>
		public static string Encrypt(string key, string value)
		{
			byte[] pbyteKey = UTF8Encoding.ASCII.GetBytes(key);

			DESCryptoServiceProvider desCSP = new DESCryptoServiceProvider();
			desCSP.Mode = CipherMode.ECB;
			desCSP.Padding = PaddingMode.PKCS7;
			desCSP.Key = pbyteKey;
			desCSP.IV = pbyteKey;

			MemoryStream ms = new MemoryStream();
			CryptoStream cryptStream = new CryptoStream(ms, desCSP.CreateEncryptor(), CryptoStreamMode.Write);

			byte[] data = Encoding.UTF8.GetBytes(value.ToCharArray());

			cryptStream.Write(data, 0, data.Length);
			cryptStream.FlushFinalBlock();

			string strReturn = Convert.ToBase64String(ms.ToArray());

			cryptStream = null;
			ms = null;
			desCSP = null;

			return strReturn;
		}
		#endregion

		#region 복호화
		/// <summary>
		/// 복호화
		/// </summary>
		/// <param name="key">키</param>
		/// <param name="value">암호화된 문자열</param>
		/// <returns></returns>
		public static string Decrypt(string key, string value)
		{
			byte[] pbyteKey = UTF8Encoding.ASCII.GetBytes(key);

			DESCryptoServiceProvider desCSP = new DESCryptoServiceProvider();
			desCSP.Mode = CipherMode.ECB;
			desCSP.Padding = PaddingMode.PKCS7;
			desCSP.Key = pbyteKey;
			desCSP.IV = pbyteKey;

			MemoryStream ms = new MemoryStream();
			CryptoStream cryptStream = new CryptoStream(ms, desCSP.CreateDecryptor(), CryptoStreamMode.Write);

			key = key.Replace(" ", "+");

			byte[] data = Convert.FromBase64String(value);

			cryptStream.Write(data, 0, data.Length);
			cryptStream.FlushFinalBlock();

			string strReturn = Encoding.UTF8.GetString(ms.GetBuffer());

			cryptStream = null;
			ms = null;
			desCSP = null;

			return strReturn;
		}
		#endregion

		#endregion

		#region 랜덤문자(대문자+소문자+숫자) 조합 만들기
		/// <summary>
		/// 랜덤문자(대문자+소문자+숫자) 조합 만들기
		/// </summary>
		/// <param name="length">길이</param>
		/// <returns></returns>
		public static string GetRandomLetter(int length)
		{
			string letter = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			string createLetter = "";
			Random rnd = new Random();
			for (int i = 0; i < length; i++)
			{
				createLetter += letter.Substring(rnd.Next(letter.Length - 1), 1);
			}

			return createLetter;
		}
		#endregion

        #region 국가에 맞게 자금단위와 표기를 함께 리턴한다.
        /// <summary>
        /// GetFormatPrice 국가에 맞게 자금단위와 표기를 함께 리턴한다.
        /// </summary>
        /// <description>
        /// https://msdn.microsoft.com/en-us/library/system.globalization.numberformatinfo.currencypositivepattern(v=vs.110).aspx
        /// </description>
        public static string GetFormatPrice(decimal price)
        {
            var cultureInfo = System.Globalization.CultureInfo.CurrentCulture;
            var cultureFormat = cultureInfo.NumberFormat;

            String formattedAmount = null;
            if (price >= Decimal.Zero)
            {
                String pattern = null;
                switch (cultureFormat.CurrencyPositivePattern)
                {
                    case 0:
                        pattern = "{0}{1:N" + cultureFormat.CurrencyDecimalDigits + "}";
                        break;
                    case 1:
                        pattern = "{1:N" + cultureFormat.CurrencyDecimalDigits + "}{0}";
                        break;
                    case 2:
                        pattern = "{0} {1:N" + cultureFormat.CurrencyDecimalDigits + "}";
                        break;
                    case 3:
                        pattern = "{1:N" + cultureFormat.CurrencyDecimalDigits + "} {0}";
                        break;
                }
                formattedAmount = String.Format(cultureInfo, pattern, cultureFormat.CurrencySymbol, price);
            }
            else
            {
                formattedAmount = "";
            }

            return formattedAmount;

        }










		#endregion

		#region Dropdown 컨트롤에 항목 열거하기
		/// <summary>
		/// Enum KeyValue Pair List
		/// </summary>
		/// <param name="type"></param>
		/// <returns></returns>
        public static Dictionary<int, string> GetEnumKeyValues(Type type)
		{
			Dictionary<int, string> dic = new Dictionary<int, string>();
			foreach (var name in Enum.GetNames(type))
			{
				dic.Add((int)Enum.Parse(type, name), name);
			}
			return dic;
		}

		public static Dictionary<string, string> GetEnumForDropDownList<TEnum>(TEnum value)
		{
			return GetEnumForDropDownList<TEnum>(value, true, false, "");
		}

		public static Dictionary<string, string> GetEnumForDropDownList<TEnum>(TEnum value, bool isHead)
		{
			return GetEnumForDropDownList<TEnum>(value, isHead, false, "");
		}


		/// <summary>
		/// Enum KeyValue Pair List for DropDownList WebControl
		/// </summary>
		/// <typeparam name="TEnum"></typeparam>
		/// <param name="value">Enum Value for enum type</param>
		/// <param name="isHead">whether use or don't use to value of index zero</param>
		/// <param name="isValueString">whether inteager or string from value</param>
		/// <param name="headName">if isHead is true, value is headName</param>
		/// <returns></returns>
        public static Dictionary<string, string> GetEnumForDropDownList<TEnum>(TEnum value, bool isHead = true, bool isValueString = false, string headName = "")
		{
			Dictionary<string, string> dic = new Dictionary<string, string>();
			IEnumerable<TEnum> values = Enum.GetValues(value.GetType()).Cast<TEnum>();

			if (isHead)
			{
				if (headName != "")
					dic.Add("", headName);
				else
				{
					//add value of index 0;
					DescriptionAttribute[] descriptions = (DescriptionAttribute[])value.GetType().GetCustomAttributes(typeof(DescriptionAttribute), false);
					if (descriptions.Length > 0)
						dic.Add("", descriptions[0].Description);
				}
			}

			foreach (var val in values)
			{
				if (isValueString)
					dic.Add(val.ToString(), GetEnumDescription(val));
				else
					dic.Add(((int)Enum.Parse(value.GetType(), val.ToString())).ToString(), GetEnumDescription(val));
			}
			return dic;
		}

		public static string GetEnumDescription<TEnum>(TEnum value)
		{
			try
			{
				FieldInfo fi = value.GetType().GetField(value.ToString());
				DescriptionAttribute[] attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

				if ((attributes != null) && (attributes.Length > 0))
					return attributes[0].Description;
				else
					return value.ToString();
			}
			catch
			{
				return string.Empty;
			}
		}

		public static string GetEnumDescription(Type type, int selectedValue)
		{
			try
			{
				FieldInfo fi = type.GetField(Enum.GetName(type, selectedValue));
				DescriptionAttribute[] attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

				if ((attributes != null) && (attributes.Length > 0))
					return attributes[0].Description;
				else
					return Enum.GetName(type, selectedValue);
			}
			catch
			{
				return string.Empty;
			}
		}
		#endregion

		#region + 스트링포멧 설정
		/// <summary>
		/// 스트링포멧 설정
		/// </summary>
		/// <param name="text">원본문자열</param>
		/// <param name="format">
		/// '_' : 통과할문자 표기
		/// '-,+,!,...' : 표시할 문자 표기
		/// ex) yyyy-MM-dd : ____-__-__
		/// </param>
		/// <returns></returns>
		public static string GetStringCustomFormat(string text, string format)
		{
			if (text == null || format == null) return "";
			if (text == "") return "";
			if (format == "") return text;
			if (!format.ToArray().Contains('_')) return text;

			//format unit
			char[] fu = format.ToArray();
			//key and value to save the char and index number
			Dictionary<int,string> index = new Dictionary<int, string>();

			//saved data
			string saved = text;

			//save the char and index number
			for (int i = 0; i < fu.Length; i++)
			{
				if (fu[i] != '_')
					index.Add(i, fu[i].ToString());
			}

			foreach (KeyValuePair<int, string> kv in index)
			{
				if (kv.Key > saved.Length - 1) break;

				saved = saved.Insert(kv.Key, kv.Value);
			}

			return saved;
		}
        #endregion

        #region 로그쓰기
        /// <summary>
        /// 로그쓰기
        /// </summary>
        /// <param name="message">메시지</param>
        /// <param name="logType">로그타입</param>
        public static void Log(string message, LogType logType)
        {
            DateTime today = DateTime.Now;
            string year = today.Year.ToString();
            string month = today.Month < 10 ? "0" + today.Month.ToString() : today.Month.ToString();
            string fileName = string.Empty;

            //log4net.GlobalContext.Properties["Path"] = "\\" + year + "\\" + month;
            //log4net.GlobalContext.Properties["FileName"] = "Page_" + string.Format("{0:yyyyMMdd}", today) + ".log";
            //log4net.Config.XmlConfigurator.Configure();

            //switch (logType)
            //{
            //    case LogType.Info: _log.Info(message); break;
            //    case LogType.Error: _log.Error(message); break;
            //    case LogType.Debug: _log.Debug(message); break;
            //    case LogType.Warn: _log.Warn(message); break;
            //    case LogType.Fatal: _log.Fatal(message); break;
            //}
        }
        #endregion

        #endregion
    }

    public enum LogType { Info, Error, Debug, Warn, Fatal };
}
