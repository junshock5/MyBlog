using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//using System.Data.Linq.Mapping;

namespace MyBlog
{
    public class ReplyInfo
    {

        public int reply_num { get; set; }
        public int comment_num { get; set; }
        public string reply_writer { get; set; }
        public DateTime reply_create_time { get; set; }
        public string reply_contents { get; set; }

        public ReplyInfo()
        {
            //InitReplyInfo();
        }



    }
}