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
    public partial class Read : PageBase
    {
        #region ################## Variable ##################
        public int _sn;
        public string   _blog_code;
        public string   _blog_writer;
        public string   _blog_name;
        public string   _blog_contents;
        public string   _blog_setting_data;
        public string   _blog_option_data;
        public DateTime _blog_create_time;
        public int      _blog_read_count;
        DataTable GetCommentsdtList = null;
        public string WC_Files;
        public int WC_FileSize;
        public string WC_FileName;
        public int _commentCount = 0;
        public string []_TagDatarr;
        public int[] _Tagnumarr;
        #endregion

        #region ################## Property ##################
        public string[] AttachFiles { get; set; }
        #endregion

        #region ################## Page Load #################
        protected void Page_Load(object sender, EventArgs e)
        {
            InitValiable(); //전역변수 초기화
            InitParameter();//파라메터 초기화
            InitServerControl();//서버컨트롤 초기화
            BindingPage(); //해당 페이지 바인딩
            BindingComment(); //해당 페이지 바인딩
            BindingAttachFile(); //해당 첨부파일 바인딩
            BindingTagData(); //해당 태그정보 바인딩
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
            this._sn = Convert.ToInt32(Utility.GetQuery("sn"));
        }
        #endregion

        #region 서버컨트롤 초기화
        private void InitServerControl()
        {

        }
        #endregion

        #region 블로그페이지 정보 바인딩
        private void BindingPage()
        {
            DataTable dtList = null;
            DataSet ds;
            SqlParameter[] arParams = new SqlParameter[]
            {
                  new SqlParameter("@sn", SqlDbType.Int),
            
            };
            arParams[0].Value = _sn;
            ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_GetPage", arParams);
            dtList = ds.Tables[0];

            
            
            if (dtList != null )
            {
                DataRow[] rows = dtList.Select();
                _blog_code = rows[0]["blog_code"].ToString();
                _blog_writer = rows[0]["blog_writer"].ToString();
                _blog_name = rows[0]["blog_name"].ToString();
                _blog_contents = rows[0]["blog_contents"].ToString();
                _blog_setting_data = rows[0]["blog_setting_data"].ToString();
                _blog_option_data = rows[0]["blog_option_data"].ToString();
                _blog_create_time = Convert.ToDateTime(rows[0]["blog_create_time"]);
                if(!DBNull.Value.Equals(rows[0]["blog_read_count"]))
                _blog_read_count = Convert.ToInt32(rows[0]["blog_read_count"]);
            }
        }
        #endregion

        #region 블로그첨부파일 정보 바인딩
        private void BindingAttachFile()
        {
            DataTable dtList = null;
            DataSet ds;
            SqlParameter[] arParams = new SqlParameter[]
            {
                  new SqlParameter("@blog_num", SqlDbType.Int),

            };
            arParams[0].Value = _sn;
            ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Attach_file_Get", arParams);
            dtList = ds.Tables[0];

            if (dtList != null)
            {
                DataRow[] rows = dtList.Select();

                if(rows.Length != 0)
                {
                    if (!DBNull.Value.Equals(rows[0]["file_size"]))
                    {
                        WC_Files = rows[0]["file_contents"].ToString();
                        WC_FileSize = Convert.ToInt32(rows[0]["file_size"]);
                        WC_FileName = rows[0]["file_count"].ToString();
                        AttachFiles = WC_Files.Split('|');
                        GetAttachFile(); //첨부파일 추가
                    }
                }
              
           
            }
        }
        #endregion

        

        #region 댓글 정보 바인딩
        private void BindingComment()
        {
       
            DataSet ds;
            SqlParameter[] arParams = new SqlParameter[]
            {
                  new SqlParameter("@sn", SqlDbType.Int),

            };
            arParams[0].Value = _sn;
            ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_GetComments", arParams);
            GetCommentsdtList = ds.Tables[0];


            if (GetCommentsdtList != null)
            {
                List<CommentInfo> returnCommonInfoList = new List<CommentInfo>();
                DataRow[] rows = GetCommentsdtList.Select();
                int checkoverlap = 0;
                for (int i = 0; i < rows.Length; ++i)
                {
                    if (checkoverlap != Convert.ToInt32(rows[i]["comment_num"]))
                    {
                        CommentInfo tempCommon = new CommentInfo();
                        tempCommon.comment_num = Convert.ToInt32(rows[i]["comment_num"]);
                        tempCommon.blog_num = Convert.ToInt32(rows[i]["blog_num"]);
                        tempCommon.comment_writer = rows[i]["comment_writer"].ToString();
                        tempCommon.comment_create_time = Convert.ToDateTime(rows[i]["comment_create_time"]);
                        tempCommon.comment_contents = rows[i]["comment_contents"].ToString();
                        returnCommonInfoList.Add(tempCommon);
                        checkoverlap = Convert.ToInt32(rows[i]["comment_num"]);
                    }
                }

                this.rptList.DataSource = returnCommonInfoList;
                this.rptList.DataBind();

            }


        }
        #endregion

        #region 태그정보 바인딩
        private void BindingTagData()
        {

            DataTable dtList = null;
            DataSet ds;

            SqlParameter[] arParams = new SqlParameter[]
             {
                  new SqlParameter("@sn", SqlDbType.Int)

             };

            arParams[0].Value = _sn;

            ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Tag_Data_Get", arParams);
            dtList = ds.Tables[0];

            if(dtList!=null)
            {
                DataRow[] rows = dtList.Select();
                _TagDatarr = new string[rows.Length];
                _Tagnumarr = new int[rows.Length];
                for (int i = 0; i < rows.Length; ++i)
                {
                    _TagDatarr[i] = rows[i]["tag_data"].ToString();
                    _Tagnumarr[i] = Convert.ToInt32(rows[i]["blog_num"]);
                }


            }




        }
        #endregion



        #region 바인딩된 블로그정보중 저자 보여주기
        protected string ShowWriter(string writer)
        {
            return writer;
        }
        #endregion

        #region 바인딩된 블로그정보중 읽은수 보여주기
        protected string ShowReadCount(string readcount)
        {
            return readcount;
        }
        #endregion

        #region 바인딩된 블로그정보중 번호 보여주기
        protected string ShowSerailNum(string num)
        {
            return num;
        }
        #endregion

        #region 바인딩된 블로그정보중 생성날짜 보여주기
        protected string ShowDate(DateTime regDate)
        {
            return string.Format("{0:yyyy-MM-dd}", regDate);
        }
        #endregion

        #region 바인딩된 블로그정보중 블로그이름 보여주기
        protected string ShowTitle(string title, string serialNo)
        {
            string returnString = "";
            returnString += "<a href='Read.aspx?sn=" + serialNo;
            returnString += "' style= \"color:black\">" + title + "</a>";
            return returnString;
        }

        #endregion

        #region 이미지 보여주기
        protected string ShowImg(string Img)
        {
            return Img;
        }
        #endregion
        #region 내용 보여주기
        protected string ShowContents(string Contents)
        {
            return Contents;
        }
        #endregion

        #region 첨부파일 셋팅
        private void GetAttachFile()
        {
            //if (this._workEntity.AttachFiles != null && this._workEntity.AttachFiles.Length > 0)
            if (WC_Files != "" && AttachFiles.Length > 0)
            {
                string[] fileList = new string[AttachFiles.Length];
                //실제상대경로로 바꾼다
                for (int i = 0; i < AttachFiles.Length; i++)
                {
                    fileList[i] = (AttachFiles[i].Split(';'))[0];
                }


                //다운받을수 있게 링크 처리
                foreach (string file in fileList)
                {
                    //< img src = "/images/redminimg.jpg" alt = "Alternate Text" />
                    string fileImage = "<img src='/Images/{0}' border=0 width=16 height=16 align='absbottom'>";
                    string ext = file.Substring(file.LastIndexOf(".") + 1).ToLower();
                    if (ext == "jpg" || ext == "jpeg" || ext == "gif" || ext == "png" || ext == "ico")
                        fileImage = string.Format(fileImage, "file_img.png");
                    else if (ext == "xls" || ext == "xlsx")
                        fileImage = string.Format(fileImage, "file_xls.png");
                    else if (ext == "ppt" || ext == "pptx")
                        fileImage = string.Format(fileImage, "file_ppt.png");
                    else if (ext == "doc" || ext == "docx")
                        fileImage = string.Format(fileImage, "file_doc.png");
                    else
                        fileImage = string.Format(fileImage, "file_none.png");


                    //암호화 하여 넘김
                    string key = (Path.GetFileName(file).Split('_'))[0];
                    if (key != "")
                    {
                        key = key.Substring(0, 8);
                        this.ltrAttachFile.Text += "<a href='Download.aspx"
                            + "?key=" + key
                            + "&path=" + Utility.Encrypt(key, file)
                            + "' target='page'>"
                            + fileImage + " "
                            + file.Substring(file.IndexOf("_") + 1) + "</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                    }

                }
            }
        }
        #endregion

     
        

        #endregion

        #region ################## Event #####################
        #region 댓글 생성
        protected void lnbWriteReply_Click(object sender, EventArgs e)
        {
          

            SqlParameter[] arParams = new SqlParameter[]
            {
             new SqlParameter("@blog_num", SqlDbType.Int),
             new SqlParameter("@comment_writer", SqlDbType.VarChar, 50),
             new SqlParameter("@comment_create_time", SqlDbType.DateTime),
             new SqlParameter("@comment_contents", SqlDbType.VarChar),
            };

            arParams[0].Value = _sn;
            if (Session["UserName"] != null)
                arParams[1].Value = Session["UserName"].ToString();
            else
                Response.Redirect("../Login/Login.aspx");
            //arParams[1].Value = "로그인X";
            arParams[2].Value = DateTime.Now;
            arParams[3].Value = this.WriteCommenttextbox.Text;
         
            int retValue = 0;
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Comment_Write", arParams));


            //게시글의 답글수 저장
            arParams = new SqlParameter[]
            {
               new SqlParameter("@sn", SqlDbType.Int)
            };
            arParams[0].Value = _sn;
            _commentCount = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_GetComments_Count_Get", arParams));

            SqlParameter[] arParam = new SqlParameter[]
            {
                new SqlParameter("@blog_num", SqlDbType.Int),
                new SqlParameter("@blog_command_count", SqlDbType.VarChar, 50)
            };
            arParam[0].Value = _sn;
            arParam[1].Value = _commentCount;
            DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Command_Count_Edit", arParam);

            Response.Redirect(Request.RawUrl);

        }
        #endregion

        #region 답글 생성
        protected void lnbWriteReplyReply_Click(object sender, EventArgs e)
        {
            var data = Request.Form["__EVENTARGUMENT"];

            string[] replyarray = data.Split(';');

            SqlParameter[] arParams = new SqlParameter[]
            {
             new SqlParameter("@comment_num", SqlDbType.Int),
             new SqlParameter("@reply_writer", SqlDbType.VarChar, 50),
             new SqlParameter("@reply_create_time", SqlDbType.DateTime),
             new SqlParameter("@reply_contents", SqlDbType.VarChar),
            };

            arParams[0].Value = replyarray[0];
            if (Session["UserName"] != null)
                arParams[1].Value = Session["UserName"].ToString();
            else
                Response.Redirect("../Login/Login.aspx");
            //arParams[1].Value = "로그인X";
            arParams[2].Value = DateTime.Now;
            arParams[3].Value = replyarray[1];

            int retValue = 0;
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Reply_Write", arParams));

            //게시글의 답글수 저장
            arParams = new SqlParameter[]
            {
             new SqlParameter("@sn", SqlDbType.Int)
            };
            arParams[0].Value = _sn;
            _commentCount = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_GetComments_Count_Get", arParams));

            SqlParameter[] arParam = new SqlParameter[]
            {
                new SqlParameter("@blog_num", SqlDbType.Int),
                new SqlParameter("@blog_command_count", SqlDbType.VarChar, 50)
            };
            arParam[0].Value = _sn;
            arParam[1].Value = _commentCount;
            DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Command_Count_Edit", arParam);


            Response.Redirect(Request.RawUrl);

        }
        #endregion


        #region 답글 정보 바인딩 ( 중첩 리피터 )
        protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //중첩리피터 (답글) 바인드
            Repeater nestedRepeater = (Repeater)e.Item.FindControl("rptListreply"); // 중첩리피터
            var commentnum= ((Label)e.Item.FindControl("comment_num_Label")).Text;

            List<ReplyInfo> returnReplyInfoList = new List<ReplyInfo>();
         
            if (GetCommentsdtList != null)
            {
                DataRow[] rows = GetCommentsdtList.Select();
                for (int i=0; i<rows.Length; ++i)
                {
                    if(commentnum == rows[i]["comment_num"].ToString() && !rows[i]["reply_num"].Equals(DBNull.Value) )
                    {
                        ReplyInfo tempReply = new ReplyInfo();
                        tempReply.reply_num = Convert.ToInt32(rows[i]["reply_num"]);
                        tempReply.comment_num = Convert.ToInt32(rows[i]["comment_num"]);
                        tempReply.reply_writer = rows[i]["reply_writer"].ToString();
                        tempReply.reply_create_time = Convert.ToDateTime(rows[i]["reply_create_time"]);
                        tempReply.reply_contents = rows[i]["reply_contents"].ToString();
                        returnReplyInfoList.Add(tempReply);
                    }
                }
            }
            nestedRepeater.DataSource = returnReplyInfoList;
            nestedRepeater.DataBind();
        
        }

        #endregion

        #region 블로그 삭제
        protected void lnbDeleteBlog_Click(object sender, EventArgs e)
        {
            var sn = Request.Form["__EVENTARGUMENT"];
            //주제 분류 변경
            SqlParameter[] Params = new SqlParameter[]
            {
               new SqlParameter("@sn", SqlDbType.Int)
            };
            Params[0].Value = sn;
            DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Delete", Params);

            Response.Redirect("Blog.aspx");

        }
        #endregion

        #endregion


    }
}