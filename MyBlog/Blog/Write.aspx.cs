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
    public partial class Write : PageBase
    {
        #region ################## Variable ##################
        //public int      _Blog_num;
        //public string   _Blog_code;
        public string   _Blog_writer;
        public string   _Blog_name;
        //public string   _Blog_contents;
        public string   _Blog_setting_data;
        public string   _Blog_option_data;
        public DateTime _Blog_create_time;

        public static string _File_Size;
        public static string _File_Count;
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
            //this._Blog_num;
            //this._Blog_code;
            if (Session["UserName"] != null)
                this._Blog_writer = Session["UserName"].ToString();
            else this._Blog_writer = "";
            this._Blog_name = blogname.Value;
            //this._Blog_contents     = Session["UserName"].ToString();

            string settingdata = "";
            if (setting1.Checked == true)
            {
                if (settingdata == "")
                    settingdata += setting1.Value;
                else
                    settingdata += "|" + setting1.Value;
            }

            if (setting2.Checked==true) if (settingdata == "") settingdata += setting2.Value; else settingdata += "|" + setting2.Value;
            if (setting3.Checked==true) if (settingdata == "") settingdata += setting3.Value; else settingdata += "|" + setting3.Value;
            if (setting4.Checked==true) if (settingdata == "") settingdata += setting4.Value; else settingdata += "|" + setting4.Value;

            string optiondata = "";
            if (option1.Checked==true) if (optiondata == "") optiondata += option1.Value; else optiondata += "|" + option1.Value;
            if (option2.Checked==true) if (optiondata == "") optiondata += option2.Value; else optiondata += "|" + option2.Value;
            if (option3.Checked==true) if (optiondata == "") optiondata += option3.Value; else optiondata += "|" + option3.Value;
            if (option4.Checked==true) if (optiondata == "") optiondata += option4.Value; else optiondata += "|" + option4.Value;
            if (option5.Checked==true) if (optiondata == "") optiondata += option5.Value; else optiondata += "|" + option5.Value;
            if (option6.Checked==true) if (optiondata == "") optiondata += option6.Value; else optiondata += "|" + option6.Value;


            this._Blog_setting_data = settingdata;
            this._Blog_option_data  = optiondata;
            this._Blog_create_time = DateTime.Now;


            //string[] signList = this.hdfReferLine.Value.Split('|');
            //string[] users = null;
            ////참조인 설정
            //if (this.hdfReferLine.Value != string.Empty)
            //{
            //    users = this.hdfReferLine.Value.Split('|');
            //    for (int i = 0; i < users.Length; i++)
            //    {
            //        this.ltrReferLine.Text += "<span class='line'>" + (users[i].Split(';'))[2] +
            //            "<img src='/Web/Images/btn_layer_close.gif' title='진행참조 해제' align='absmiddle' style='cursor:pointer;' onclick='RemoveReferUser(this)' order='" + i.ToString() + "'></span>";
            //    }
            //}

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


        #region 블로그 생성
        protected void lnbCreateBlog_Click(object sender, EventArgs e)
        {
            //총댓글갯수 저장

            //SqlParameter[] arParam = new SqlParameter[]
            //{
            //        new SqlParameter("@blog_num", SqlDbType.Int)
            //};
            //arParam[0].Value = _sn;
            //_commentCount = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_GetComments_Count_Get", arParam));


            var blogContents = Request.Form["__EVENTARGUMENT"];

            SqlParameter[] arParams = new SqlParameter[]
            {
             new SqlParameter("@blog_code", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_writer", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_name", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_contents", SqlDbType.VarChar),
             new SqlParameter("@blog_setting_data", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_option_data", SqlDbType.VarChar, 50),
             new SqlParameter("@blog_create_time", SqlDbType.DateTime),
            };

            arParams[0].Value = "";
            arParams[1].Value = _Blog_writer;
            arParams[2].Value = _Blog_name;
            //arParams[3].Value = this.biz_MakeWork.Value;
            arParams[3].Value = blogContents;
            arParams[4].Value = _Blog_setting_data;
            arParams[5].Value = _Blog_option_data;
            arParams[6].Value = _Blog_create_time;



            int retValue = 0;
            retValue = Convert.ToInt32(DBHelper.ExecuteScalar(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Write", arParams));

            //주제 분류 저장
            SqlParameter[] Params = new SqlParameter[]
            {
               new SqlParameter("@blog_num", SqlDbType.Int),
               new SqlParameter("@subject_name", SqlDbType.VarChar, 50),

            };
            Params[0].Value = retValue;
            Params[1].Value = subjectcategory.Value;
            DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Subject_Category_Choose", Params);
            //주제 분류 저장 끝

            //첨부 파일 저장
            if(_File_Size!=null)
            {
                SqlParameter[] Param = new SqlParameter[]
                {
                    new SqlParameter("@blog_num", SqlDbType.Int),
                    new SqlParameter("@file_contents", SqlDbType.VarChar),
                    new SqlParameter("@file_size", SqlDbType.VarChar, 50),
                    new SqlParameter("@file_count", SqlDbType.VarChar, 50),
                
                };
                Param[0].Value = retValue;
                Param[1].Value = hdfAttachFile.Value;
                Param[2].Value = _File_Size;
                Param[3].Value = _File_Count;
                DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Attach_file_Save", Param);

            }

            //첨부 파일 저장 끝

            //태그 정보 저장
            string[] indexsize = ltrReferLine.Value.Split('|');
            arParams = new SqlParameter[]
            {
                new SqlParameter("@blog_num", SqlDbType.Int),
                new SqlParameter("@tag_data", SqlDbType.VarChar),
                new SqlParameter("@index", SqlDbType.Int),

            };
            arParams[0].Value = retValue;
            arParams[1].Value = ltrReferLine.Value;
            arParams[2].Value = indexsize.Length;
            DBHelper.ExecuteNonQuery(DBConnection.Myblog, CommandType.StoredProcedure, "SP_Blog_Tag_Create", arParams);


            //태그 정보 저장 끝

            Response.Redirect("Blog.aspx");
            //Utility.ScriptStartExec(this.Page, "alert('블로그 쓰기에 실패하였습니다.');");
            


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