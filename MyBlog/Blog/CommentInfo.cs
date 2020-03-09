using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace MyBlog
{
    public class CommentInfo
    {
        public int comment_num { get; set; }
        public int blog_num { get; set; }
        public string comment_writer { get; set; }
        public DateTime? comment_create_time { get; set; }
        public string comment_contents { get; set; }

        public CommentInfo()
        {

        }

    }
}