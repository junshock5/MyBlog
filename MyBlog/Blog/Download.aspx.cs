using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

//
using System.Net.Mail;
using System.Net;
using System.Net.Mime;
using System.Configuration;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Reflection;
namespace MyBlog
{
    public partial class Download : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.Clear();
                Response.BufferOutput = false;
                string key = HttpUtility.UrlDecode(HttpContext.Current.Request.QueryString["key"]);
                string path = Decrypt(key, HttpUtility.UrlDecode(HttpContext.Current.Request.QueryString["path"]).Replace(" ", "+")).Replace("\0", "");
                string contentType = "";
                #region 브라우저 정보 판단
                if (Page.Request.UserAgent.IndexOf("MSIE") >= 0)
                {
                    //IE 5.0인 경우.
                    if (Page.Request.UserAgent.IndexOf("MSIE 5.0") >= 0)
                    {
                        contentType = "application/x-msdownload";
                    }
                    //IE 5.0이 아닌 경우.
                    else
                    {
                        contentType = "application/unknown";
                    }
                }
                else
                {
                    //Netscape등 기타 브라우저인 경우.
                    contentType = "application/unknown";
                }
                #endregion
                Response.ContentType = contentType;
                Response.AddHeader("Content-Disposition", "attachment;filename=" + Path.GetFileName(path));
                Response.WriteFile(path);
               

            }
            catch (Exception ex)
            {
                string script = "<script type='text/javascript'>alert('{0}')</script>";
                string cltKey = Guid.NewGuid().ToString();
                ClientScriptManager csm = Page.ClientScript;

                script = string.Format(script, ex.Message.Replace("'", "＇").Replace("\r\n", "\\n"));

                csm.RegisterClientScriptBlock(Page.GetType(), cltKey, script);
            }
        }

        private void getFileDownload()
        {
            Response.Clear();
            Response.BufferOutput = false;

            string strContentType = string.Empty;
            string strUrl = "?path=" + HttpUtility.UrlDecode(HttpContext.Current.Request.QueryString["path"]);
            int idx = strUrl.LastIndexOf("?path=", strUrl.Length);
            string strPath = strUrl.Substring(idx + 6, strUrl.Length - idx - 6);
            string strFileName = Path.GetFileName(strPath);
            string strFilePath = strPath.Substring(0, strPath.Length - strFileName.Length);
            #region 브라우저 정보 판단
            if (Page.Request.UserAgent.IndexOf("MSIE") >= 0)
            {
                //IE 5.0인 경우.
                if (Page.Request.UserAgent.IndexOf("MSIE 5.0") >= 0)
                {
                    strContentType = "application/x-msdownload";
                }
                //IE 5.0이 아닌 경우.
                else
                {
                    strContentType = "application/unknown";
                }
            }
            else
            {
                //Netscape등 기타 브라우저인 경우.
                strContentType = "application/unknown";
            }
            #endregion

            strFileName = HttpUtility.UrlEncode(strFileName, new UTF8Encoding(true, false)).Replace("+", "%20");
            Response.ContentEncoding = System.Text.UTF8Encoding.UTF8;
            Page.Response.ContentType = strContentType;
            Response.AddHeader("Content-Disposition", "attachment;filename=" + strFileName);
            Response.AddHeader("pragma", "no-cache");
            Page.Response.CacheControl = "public";
            Response.WriteFile(HttpUtility.UrlDecode(strFilePath + strFileName));
            Response.End();
        }


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

    }
}