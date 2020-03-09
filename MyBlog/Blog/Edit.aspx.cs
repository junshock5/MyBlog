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
using System.IO;

namespace MyBlog
{
    public partial class Edit : PageBase
    {
        #region ################## Variable ##################
        public int _sn;
        public string _blog_code;
        public string _blog_writer;
        public string _blog_name;
        public string _blog_contents;
        public string _blog_setting_data;
        public string _blog_option_data;
        public DateTime _blog_create_time;
        public int _blog_read_count;
        //
        public string _Blog_writer;
        public string _Blog_name;
        public string _Blog_setting_data;
        public string _Blog_option_data;
        public DateTime _Blog_create_time;

        public static string _File_Size;
        public static string _File_Count;

        public string WC_Files;
        public int    WC_FileSize;
        public string WC_FileName;
        #endregion

        #region ################## Property ##################
        public string[] AttachFiles { get; set; }
        #endregion

        #region ################## Page Load #################
        protected void Page_Load(object sender, EventArgs e)
        {
          
            InitParameter();//파라메터 초기화
            InitValiable(); //전역변수 초기화
            //BindingAttachFile(); //해당 첨부파일 바인딩
            if (!IsPostBack)
            {
                InitServerControl();//서버컨트롤 초기화
            }
        }
        #endregion

        #region ################## Method ####################

        #region 전역변수 초기화
        private void InitValiable()
        {
            // 기존 블로그 셋팅을 위한 전역변수
            DataTable dtList = null;
            DataSet ds;
            SqlParameter[] arParams = new SqlParameter[]
            {
                  new SqlParameter("@sn", SqlDbType.Int),

            };
            arParams[0].Value = _sn;
            ds = DBHelper.ExecuteDataset(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_GetPage", arParams);
            dtList = ds.Tables[0];

            if (dtList != null)
            {
                DataRow[] rows = dtList.Select();
                _blog_code = rows[0]["blog_code"].ToString();
                _blog_writer = rows[0]["blog_writer"].ToString();
                _blog_name = rows[0]["blog_name"].ToString();
                _blog_contents = rows[0]["blog_contents"].ToString();
                _blog_setting_data = rows[0]["blog_setting_data"].ToString();
                _blog_option_data = rows[0]["blog_option_data"].ToString();
                _blog_create_time = Convert.ToDateTime(rows[0]["blog_create_time"]);
                if (!DBNull.Value.Equals(rows[0]["blog_read_count"]))
                    _blog_read_count = Convert.ToInt32(rows[0]["blog_read_count"]);
            }

            // 변경할 블로그 변수 셋팅
            if (Session["UserName"] != null)
                this._Blog_writer = Session["UserName"].ToString();
            else this._Blog_writer = "";
            this._Blog_name = blogname.Value;
            //this._Blog_contents = Session["UserName"].ToString();

            string settingdata = "";
            if (setting1.Checked == true) if (settingdata == "") settingdata += setting1.Value; else settingdata += "|" + setting1.Value;
            if (setting2.Checked == true) if (settingdata == "") settingdata += setting2.Value; else settingdata += "|" + setting2.Value;
            if (setting3.Checked == true) if (settingdata == "") settingdata += setting3.Value; else settingdata += "|" + setting3.Value;
            if (setting4.Checked == true) if (settingdata == "") settingdata += setting4.Value; else settingdata += "|" + setting4.Value;

            string optiondata = "";
            if (option1.Checked == true) if (optiondata == "") optiondata += option1.Value; else optiondata += "|" + option1.Value;
            if (option2.Checked == true) if (optiondata == "") optiondata += option2.Value; else optiondata += "|" + option2.Value;
            if (option3.Checked == true) if (optiondata == "") optiondata += option3.Value; else optiondata += "|" + option3.Value;
            if (option4.Checked == true) if (optiondata == "") optiondata += option4.Value; else optiondata += "|" + option4.Value;
            if (option5.Checked == true) if (optiondata == "") optiondata += option5.Value; else optiondata += "|" + option5.Value;
            if (option6.Checked == true) if (optiondata == "") optiondata += option6.Value; else optiondata += "|" + option6.Value;


            this._Blog_setting_data = settingdata;
            this._Blog_option_data = optiondata;
            this._Blog_create_time = DateTime.Now;


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
            blogname.Value = _blog_name;
            Blog_contents.InnerHtml = _blog_contents;
            SqlParameter[] arParams = new SqlParameter[]
            {
                                  new SqlParameter("@blog_num", SqlDbType.Int)
            };
            arParams[0].Value = _sn;
            var subjectname = DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Subject_Category_Get", arParams);
            subjectcategory.SelectedValue = subjectname.ToString();

            if (setting1.Value == _blog_setting_data)
                setting1.Checked = true;
            else if (setting2.Value == _blog_setting_data)
                setting2.Checked = true;
            else if (setting3.Value == _blog_setting_data)
                setting3.Checked = true;
            else if (setting4.Value == _blog_setting_data)
                setting4.Checked = true;

            string[] optiondata = _blog_option_data.Split('|');

            for (int i = 0; i < optiondata.Length; ++i)
            {
                if (option1.Value == optiondata[i])
                    option1.Checked = true;
                if (option2.Value == optiondata[i])
                    option2.Checked = true;
                if (option3.Value == optiondata[i])
                    option3.Checked = true;
                if (option4.Value == optiondata[i])
                    option4.Checked = true;
                if (option5.Value == optiondata[i])
                    option5.Checked = true;
                if (option6.Value == optiondata[i])
                    option6.Checked = true;
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

                if (!DBNull.Value.Equals(rows[0]["file_size"]))
                {
                    WC_Files = rows[0]["file_contents"].ToString();
                    WC_FileSize = Convert.ToInt32(rows[0]["file_size"]);
                    WC_FileName = rows[0]["file_count"].ToString();
                }
                AttachFiles = WC_Files.Split('|');
            }
            //여기서 기존 다운로드 박스에다가 add 하기
            for(int i=0; i< Convert.ToInt32(WC_FileName); ++i)
            {
                this.lstAttachFile.Items.Add(
                new ListItem(AttachFiles[i]));
                fupAttachFile.SaveAs(Server.MapPath(AttachFiles[i]));
                //this.lstAttachFile.Items.Add(
                //new ListItem(
                //fupAttachFile.FileName.Replace(" ", "") + "(" + Utility.GetFileSize(fupAttachFile.PostedFile.ContentLength) + ")",
                //fupAttachFile.PostedFile.ContentLength.ToString())
                //);
            }
            this.spanFileCount.InnerText = this.lstAttachFile.Items.Count.ToString();
            this.spanFileSize.InnerText = WC_FileSize.ToString();
            hdfAttachFile.Value = WC_Files;



        }
        #endregion


        #endregion

        #region ################## Event #####################


        #region 블로그 편집
        protected void lnbEditBlog_Click(object sender, EventArgs e)
        {
            var blogContents = Request.Form["__EVENTARGUMENT"];

            SqlParameter[] arParams = new SqlParameter[]
            {
             new SqlParameter("@blog_num", SqlDbType.Int),
             new SqlParameter("@blog_code", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_writer", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_name", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_contents", SqlDbType.VarChar),
             new SqlParameter("@blog_setting_data", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_option_data", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_create_time", SqlDbType.DateTime),
            };
            arParams[0].Value = _sn;
            arParams[1].Value = "";
            arParams[2].Value = _blog_writer;
            arParams[3].Value = blogname.Value;
            arParams[4].Value = blogContents;
            arParams[5].Value = _Blog_setting_data;
            arParams[6].Value = _Blog_option_data;
            arParams[7].Value = _blog_create_time;



            DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Edit", arParams);

            //주제 분류 변경
            SqlParameter[] Params = new SqlParameter[]
            {
               new SqlParameter("@blog_num", SqlDbType.Int),
               new SqlParameter("@subject_name", SqlDbType.VarChar, 50),
            };
            Params[0].Value = _sn;
            Params[1].Value = subjectcategory.SelectedValue;
            DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Subject_Category_Edit", Params);
            //주제 분류 변경 끝

            //첨부 파일 변경
            SqlParameter[] Param = new SqlParameter[]
            {
               new SqlParameter("@blog_num", SqlDbType.Int),
               new SqlParameter("@file_contents", SqlDbType.VarChar),
               new SqlParameter("@file_size", SqlDbType.VarChar, 50),
               new SqlParameter("@file_count", SqlDbType.VarChar, 50),
            };
            Param[0].Value = _sn;
            Param[1].Value = hdfAttachFile.Value;
            if (_File_Size == null)
                _File_Size = "";
            if (_File_Count == null)
                _File_Count = "";
            Param[2].Value = _File_Size;
            Param[3].Value = _File_Count;
            DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Attach_file_Edit", Param);


            //첨부 파일 변경 끝
            Response.Redirect("Blog.aspx");

        }
        #endregion

        #region 첨부파일 추가
        protected void lnbAddAttachFile_Click(object sender, EventArgs e)
        {
            if (fupAttachFile.HasFile)
            {
                string path = ConfigurationManager.AppSettings["UploadData"];
                DateTime today = DateTime.Now;
                string year = today.Year.ToString();
                string month = (today.Month < 10) ? "0" + today.Month.ToString() : today.Month.ToString();
                string day = (today.Day < 10) ? "0" + today.Day.ToString() : today.Day.ToString();
                string second = (today.Second < 10) ? "0" + today.Second.ToString() : today.Second.ToString();
                string dateSeq = year + month + day + second + today.Millisecond.ToString();
                string saveFileName = dateSeq + "_" + fupAttachFile.FileName.Replace(" ", "");

                try
                {
                    path += "MYBLOG/" + year + "/" + month + "/" + day + "/";
                    if (!Directory.Exists(Server.MapPath(path)))
                        Directory.CreateDirectory(Server.MapPath(path));

                    if (fupAttachFile.PostedFile.ContentLength >= 104857600) // 100 MB
                    {
                        Utility.ScriptEndExecAlert(this.Page, "100MB이상의 파일은 올릴 수 없습니다.");
                    }
                    else
                    {// Upload
                        fupAttachFile.SaveAs(Server.MapPath(path + saveFileName));

                        //리스트 추가
                        this.lstAttachFile.Items.Add(
                            new ListItem(
                                fupAttachFile.FileName.Replace(" ", "") + "(" + Utility.GetFileSize(fupAttachFile.PostedFile.ContentLength) + ")",
                                fupAttachFile.PostedFile.ContentLength.ToString())
                                );
                        this.spanFileCount.InnerText = this.lstAttachFile.Items.Count.ToString();
                        _File_Count = this.lstAttachFile.Items.Count.ToString();
                        decimal size = 0;
                        foreach (ListItem li in this.lstAttachFile.Items)
                            size += Convert.ToDecimal(li.Value);

                        this.spanFileSize.InnerText = Utility.GetFileSize(size);
                        _File_Size = size.ToString();
                        if (this.hdfAttachFile.Value == string.Empty)
                            this.hdfAttachFile.Value = path + saveFileName + ";" + size.ToString();
                        else
                            this.hdfAttachFile.Value += "|" + path + saveFileName + ";" + size.ToString();

                        //System.Web.HttpContext.Current.Response.Write(this.hdfAttachFile.Value);
                        hdfAttachFile.Value = this.hdfAttachFile.Value;
                    }
                }
                catch (Exception ex)
                {
                    Utility.ScriptEndExecAlert(this.Page, ex.Message);

                }

            }
            else
            {

            }
        }
        #endregion

        #region 첨부파일 삭제
        protected void lnbDelAttachFile_Click(object sender, EventArgs e)
        {
            int selectedIdx = this.lstAttachFile.SelectedIndex;

            string orgFile = this.hdfAttachFile.Value;

            string[] fileList = orgFile.Split('|');

            for (int i = 0; i < fileList.Length; i++)
            {
                fileList[i] = (fileList[i].Split(';'))[0];
            }

            try
            {
                if (File.Exists(Server.MapPath(fileList[selectedIdx])))
                {
                    File.Delete(Server.MapPath(fileList[selectedIdx]));
                    orgFile = "";

                    for (int i = 0; i < fileList.Length; i++)
                    {
                        if (i != selectedIdx)
                        {
                            if (orgFile == string.Empty)
                                orgFile = fileList[i] + ";" + this.lstAttachFile.Items[i].Value;
                            else
                                orgFile += "|" + fileList[i] + ";" + this.lstAttachFile.Items[i].Value;
                        }
                    }

                    this.lstAttachFile.Items.RemoveAt(selectedIdx);
                    this.spanFileCount.InnerText = this.lstAttachFile.Items.Count.ToString();
                    _File_Count = this.lstAttachFile.Items.Count.ToString();
                    decimal size = 0;
                    foreach (ListItem li in this.lstAttachFile.Items)
                        size += Convert.ToDecimal(li.Value);

                    this.spanFileSize.InnerText = Utility.GetFileSize(size);
                    _File_Size = size.ToString();
                    this.hdfAttachFile.Value = orgFile;
                }
                else
                    Utility.ScriptEndExecAlert(this.Page, "파일이 없습니다.");


            }
            catch (Exception ex)
            {
                Utility.ScriptEndExecAlert(this.Page, ex.Message);
            }
        }
        #endregion



        #endregion


    }
}