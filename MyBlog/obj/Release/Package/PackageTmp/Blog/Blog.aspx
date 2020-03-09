<%@ Page Language="C#" MasterPageFile="~/Master/Blog.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="MyBlog.Blog" %>

<%@ Register src="../UserControl/Header.ascx" TagName="ucHeader" TagPrefix="uc1" %>
<%@ Register src="../UserControl/LeftPanel.ascx" TagName="ucLeftPanel" TagPrefix="uc2" %>
<%@ Register src="../UserControl/Footer.ascx" TagName="ucFooter" TagPrefix="uc3" %>
<%@ Register src="../UserControl/Shortcut.ascx" TagName="ucShortcut" TagPrefix="uc4" %>
<%@ Register src="../UserControl/HeaderNew.ascx" TagName="ucHeaderNew" TagPrefix="uc5" %>
<%@ Register src="~/UserControl/TagContent.ascx" TagName="ucTagContent" TagPrefix="uc6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">
    <style>
        .thumbnail{
      margin:10px;
      width:800px;
      height:200px;
      /*background-size: contain;*/
      border:1px solid gray;
      background-repeat: no-repeat;
      background-position: center center;
      /*background-repeat: no-repeat;
      background-position: center center;*/
      overflow: hidden;
    }
    .round{
      border-radius: 100%;
      border:0px solid black
    }
    </style>
		<!-- #HEADER -->
        <uc1:ucHeader ID="ucHeader" runat="server" />
<%--          <uc5:ucHeaderNew ID="ucHeader1" runat="server" />--%>
		<!-- END HEADER -->

		<!-- #NAVIGATION -->
		<!-- Left panel : Navigation area -->
		<uc2:ucLeftPanel ID="ucLeftPanel" runat="server" />
		<!-- END NAVIGATION -->

		<!-- MAIN PANEL -->
		<div id="main" role="main">

			<!-- RIBBON -->
			<div id="ribbon">

				<span class="ribbon-button-alignment"> 
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

				<!-- breadcrumb -->
				<ol class="breadcrumb">
					<li>블로그 메인</li>
				</ol>
				<!-- end breadcrumb -->

				<!-- You can also add more buttons to the
				ribbon for further usability

				Example below:

				<span class="ribbon-button-alignment pull-right">
				<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
				<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
				<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
				</span> -->

			</div>
			<!-- END RIBBON -->
			
			

			<!-- MAIN CONTENT -->
			<div id="content">

				<!-- row -->
				<div class="row">

					<!-- col -->
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
						<h1 class="page-title txt-color-blueDark">
							<!-- PAGE HEADER -->
									<div class="navbar navbar-inverse">
								
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->
                                <%if (_Tag == "") { %>
								<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
										<ul class="nav navbar-nav" style="font-size:10px;" id="category">
											<li class="">
												<a href="Blog.aspx?cg=0&page=1">전체(<%=TotalCount%>)</a>
											</li>
											<li class="">
												<a href="Blog.aspx?cg=1&page=1">사진</a>
											</li>       
                                            <li class="">        
												<a href="Blog.aspx?cg=2&page=1">공연·전시</a>
											</li>      
                                            <li>       
												<a href="Blog.aspx?cg=3&page=1">건강·의학</a>
											</li>      
                                            <li>       
												<a href="Blog.aspx?cg=4&page=1">게임</a>
											</li>     
                                             <li>     
												<a href="Blog.aspx?cg=5&page=1">스포츠</a>
											</li>      
                                             <li>      
												<a href="Blog.aspx?cg=6&page=1">세계여행</a>
											</li>            
										</ul>
								</div><!-- /.navbar-collapse -->
								  <% }%>
                                 <%else{%>
                                        <span  class="nav navbar-nav" style="font-size:20px;color:white"> '#<%=_Tag %>' 태그 검색 결과</span>
                                 <% }%>
							</div>
						</h1>
					</div>

					<!-- end col -->

					<!-- right side of the page with the sparkline graphs -->
					<!-- col -->
<%--					<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
						<!-- sparks -->
						<ul id="sparks">
							<li class="sparks-info">
								<h5> My Income <span class="txt-color-blue">$47,171</span></h5>
								<div class="sparkline txt-color-blue hidden-mobile hidden-md hidden-sm">
									1300, 1877, 2500, 2577, 2000, 2100, 3000, 2700, 3631, 2471, 2700, 3631, 2471
								</div>
							</li>
							<li class="sparks-info">
								<h5> Site Traffic <span class="txt-color-purple"><i class="fa fa-arrow-circle-up" data-rel="bootstrap-tooltip" title="Increased"></i>&nbsp;45%</span></h5>
								<div class="sparkline txt-color-purple hidden-mobile hidden-md hidden-sm">
									110,150,300,130,400,240,220,310,220,300, 270, 210
								</div>
							</li>
							<li class="sparks-info">
								<h5> Site Orders <span class="txt-color-greenDark"><i class="fa fa-shopping-cart"></i>&nbsp;2447</span></h5>
								<div class="sparkline txt-color-greenDark hidden-mobile hidden-md hidden-sm">
									110,150,300,130,400,240,220,310,220,300, 270, 210
								</div>
							</li>
						</ul>
						<!-- end sparks -->
					</div>--%>
					<!-- end col -->

				</div>
				<!-- end row -->
				 <%--     <%=WC_Contents %>--%>
				<div class="row">

					<div class="col-sm-9">

                        <%--여기부터가 블로그글--%>
						<div class="well padding-10">

                            <asp:Repeater ID="rptList" runat="server" >
				            	<ItemTemplate>
     <%--                               <%# (Eval("blog_setting_data").ToString().Contains("비공개") ==false ) ?    
                                            "옵션:"+Eval("blog_option_data")+"<br/>"+
                                            "셋팅:"+Eval("blog_setting_data")+"<br/>"+
                                            "<div class='row'>" +
                                               "<div class='col-md-8 padding-left-0'><br>"+
                                                 "<small class='font-xs'><i>	 <img class='round' src='../img/avatars/sunny.png' alt='me'  height='30' width='30'/>  <a href='Profile.aspx?username="+Eval("blog_writer").ToString()+"'"+
                                                 "style='color:black'>"+ShowSerailNum(Eval("blog_writer").ToString())+"</a></i></small></h8>"+
                                                 "<h2><strong>"+ ShowTitle(Eval("blog_name").ToString(),Eval("blog_num").ToString())+"</strong> </h2>"+
                                                "<div  class='thumbnail'>" + ShowContents(Eval("blog_contents").ToString()) + "</div> " +

                                                                                 "<div style='text-align:right'>" +
                                                                                 "<i class='fa fa-calendar'></i>" +
                                                "<a href='javascript:void(0);'>" + ShowDate((DateTime)Eval("blog_create_time")).ToString() + "</a>" +
                                                                                 "<i class='fa fa-comments'></i>" +
                                                "<a href='Read.aspx?sn=" + Eval("blog_num") + "'>" + ShowSerailNum(Eval("blog_command_count").ToString()) + "</a>" +
                                                                                 "</div>" +

                                                "</div>" +
                                            "</div>"+
                                            "<div style='text-align:left;margin:5px; padding-bottom:1px; border-bottom:1px solid #999; border-width:1px;'></div>"
                                            :
                                            "" %>--%>

                                    검색:<%# Eval("blog_option_data").ToString().Contains("검색허용") == true ? "<span>Y</span>" : "<span>N</span>" %>    <br />
                                    댓글:<%# Eval("blog_option_data").ToString().Contains("댓글허용") == true ? "<span>Y</span>" : "<span>N</span>" %>    <br />
                                    셋팅:<%# Eval("blog_setting_data").ToString() %>    
				                    <div class="row ">
							        	<div class="col-md-8 padding-left-0">
							        		<h8 class="margin-top-0"><br>
                                                <small class="font-xs"><i>	 <img class=" round" src="../img/avatars/sunny.png" alt="me"  height="30" width="30"/>  <a href="Profile.aspx?username=<%#Eval("blog_writer")%>" style="color:black"><%# ShowSerailNum(Eval("blog_writer").ToString()) %>
                                            </a></i></small></h8>                             
							        		
                                                <h2><strong><%# ShowTitle(Eval("blog_name").ToString(),Eval("blog_num").ToString()) %></strong> </h2>
							        			<div  class="thumbnail"><%# ShowContents(Eval("blog_contents").ToString()) %></div>
							        		
                                             <div style="text-align:right">
                                                	<i class="fa fa-calendar"></i>
							        				<a href="javascript:void(0);"><%# ShowDate((DateTime)Eval("blog_create_time")) %></a>
                                                    <i class="fa fa-comments"></i>
							        				<a href="Read.aspx?sn=<%#Eval("blog_num")%>"> <%# ShowSerailNum(Eval("blog_command_count").ToString()) %> </a> 
                                            </div>


							        	</div>
							        </div>
                                    <div style='text-align:left;margin:5px; padding-bottom:1px; border-bottom:1px solid #999; border-width:1px;'></div>
				            	</ItemTemplate>
				            </asp:Repeater>
                            <asp:Literal ID="ltrNone" runat="server"></asp:Literal>
                            <asp:Literal ID="ltrPaging" runat="server"></asp:Literal>
                            <br />

						</div>

					</div>

					<div class="col-sm-3">
						<div class="well padding-10">
							<h5 class="margin-top-0"><i class="fa fa-search"></i> Blog Search...</h5>
							<div class="input-group">
<%--								<input type="text" class="form-control">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" id="Search_Keyword">
										<i class="fa fa-search"></i>
									</button> </span>--%>
                                <asp:TextBox ID="Keyword_Search_Input" class="form-control" runat="server" style="width:250px;" 
                                    onkeydown="if(event.keyCode==13){Search();return false;}else{return true;}" ></asp:TextBox>
                                <asp:Button ID="Keyword_Search_btn" class="btn btn-default" runat="server" Text="Search" onclick="Keyword_Search_btn_Click" />
                                                  
							</div>
                            <!-- 내 블로그 / 글쓰기 -->
<%--                            <%if(Convert.ToBoolean(Session["UserLogOn"])==true){%>
                                   <div class="well padding-10">
                                 <a class="btn btn-primary" href="Profile.aspx?username=<%=Session["UserName"].ToString()%>"> 내 블로그 </a>
						         <a class="btn btn-warning" href="Write.aspx"> 글쓰기 </a>
                            </div>   	
                            <%}%>--%>
							<!-- /input-group -->
						</div>
						<!-- /well -->
                          <uc6:ucTagContent ID="ucTagContent" runat="server" />
				<%--		<div class="well padding-10">
							<h5 class="margin-top-0"><i class="fa fa-tags"></i> Popular Tags:</h5>
							<div class="row">
								<div class="col-lg-6">
									<ul class="list-unstyled">
										<li>
											<a href=""><span class="badge badge-info">Windows 8</span></a>
										</li>
										<li>
											<a href=""><span class="badge badge-info">C#</span></a>
										</li>
										<li>
											<a href=""><span class="badge badge-info">Windows Forms</span></a>
										</li>
										<li>
											<a href=""><span class="badge badge-info">WPF</span></a>
										</li>
									</ul>
								</div>
								<div class="col-lg-6">
									<ul class="list-unstyled">
										<li>
											<a href=""><span class="badge badge-info">Bootstrap</span></a>
										</li>
										<li>
											<a href=""><span class="badge badge-info">Joomla!</span></a>
										</li>
										<li>
											<a href=""><span class="badge badge-info">CMS</span></a>
										</li>
										<li>
											<a href=""><span class="badge badge-info">Java</span></a>
										</li>
									</ul>
								</div>
							</div>
						</div>--%>
						<!-- /well -->
<%--						<div class="well padding-10">
							<h5 class="margin-top-0"><i class="fa fa-thumbs-o-up"></i> Follow Us!</h5>
							<ul class="no-padding no-margin list-unstyled">
								<li>
									<p class="no-margin">
										<a title="Facebook" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-facebook fa-stack-1x"></i></span></a>
										<a title="Twitter" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x"></i></span></a>
										<a title="Google+" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-google-plus fa-stack-1x"></i></span></a>
										<a title="Linkedin" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-linkedin fa-stack-1x"></i></span></a>
										<a title="GitHub" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-github fa-stack-1x"></i></span></a>
										<a title="Bitbucket" href=""><span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-bitbucket fa-stack-1x"></i></span></a>
									</p>
								</li>
							</ul>
						</div>
						<div class="well padding-10">
							<h5 class="margin-top-0"><i class="fa fa-fire"></i> Popular Posts:</h5>
							<ul class="no-padding list-unstyled">
								<li>
									<a href="javascript:void(0);" class="margin-top-0">WPF vs. Windows Forms-Which is better?</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="padding-top-5 display-block">How to create responsive website with Bootstrap?</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="margin-top-5">The best Joomla! templates 2014</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="margin-top-5">ASP .NET cms list</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="margin-top-5">C# Hello, World! program</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="margin-top-5">Java random generator</a>
								</li>
							</ul>
						</div>
						<div class="well padding-10">
							<h5 class="margin-top-0"><i class="fa fa-video-camera"></i> Featured Videos:</h5>
							<div class="row">

								<div class="col-lg-12">

									<ul class="list-group no-margin">
										<li class="list-group-item">
											<a href=""> <span class="badge pull-right">15</span> Photograph </a>
										</li>
										<li class="list-group-item">
											<a href=""> <span class="badge pull-right">30</span> Life style </a>
										</li>
										<li class="list-group-item">
											<a href=""> <span class="badge pull-right">9</span> Food </a>
										</li>
										<li class="list-group-item">
											<a href=""> <span class="badge pull-right">4</span> Travel world </a>
										</li>
									</ul>

								</div>

								<div class="col-lg-12">
									<div class="margin-top-10">
										<iframe allowfullscreen="" frameborder="0" height="210" src="http://player.vimeo.com/video/87025094" width="100%"></iframe>
									</div>
								</div>
							</div>

						</div>--%>
						<!-- /well -->

					</div>

				</div>

			</div>
			<!-- END MAIN CONTENT -->

		</div>
		<!-- END MAIN PANEL -->

		<!-- PAGE FOOTER -->
		<uc3:ucFooter ID="ucFooter" runat="server" />
		<!-- END PAGE FOOTER -->

		<!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)-->
		<uc4:ucShortcut ID="ucShortcut" runat="server" />
		<!-- END SHORTCUT AREA -->

		<!--========================Script========================== -->
      	<script>
		$(document).ready(function() {
            pageSetUp();

            //$('#bs-example-navbar-collapse-2').click(function() {
            //	$('#fruits').val('hh');
            //});
             //$('#bs-example-navbar-collapse-2').children()[1]
           <%-- var a = $('#category').children()[<%=_cg%>].attr("class","active");--%>
            $('#category').each(function () {
             $(this).find('li').eq(<%=_cg%>).attr('class',"active");
        });
		})

		var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
			_gaq.push(['_trackPageview']);
        (function () {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
         })();
           
        // 키워드 검색
        function Search() {
            var url = "<%=Request.Path %>";
            var oKeyword = document.getElementById("<%=Keyword_Search_Input.ClientID%>");
            url += "?keyword=" + escape(oKeyword.value);
            location.href = url;
        }
		</script>
</asp:Content>