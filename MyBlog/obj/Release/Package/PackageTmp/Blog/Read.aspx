<%@ Page Language="C#" MasterPageFile="~/Master/Blog.Master" AutoEventWireup="true" CodeBehind="Read.aspx.cs" Inherits="MyBlog.Read"  EnableEventValidation="false" %>


<%@ Register src="../UserControl/Header.ascx" TagName="ucHeader" TagPrefix="uc1" %>
<%@ Register src="../UserControl/LeftPanel.ascx" TagName="ucLeftPanel" TagPrefix="uc2" %>
<%@ Register src="../UserControl/Footer.ascx" TagName="ucFooter" TagPrefix="uc3" %>
<%@ Register src="../UserControl/Shortcut.ascx" TagName="ucShortcut" TagPrefix="uc4" %>
<%@ Register src="~/UserControl/TagContent.ascx" TagName="ucTagContent" TagPrefix="uc6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">
		<!-- #HEADER -->
        <uc1:ucHeader ID="ucHeader" runat="server" />
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
                    
					<li><%=_blog_writer %></li><li>의 블로그 글</li>
				</ol>
			</div>
			<!-- END RIBBON -->
			
			

			<!-- MAIN CONTENT -->
			<div id="content">

				<!-- row -->
				<div class="row">

					<!-- col -->
					<div class="col-xs-12 col-sm-7 col-md-7 col-lg-7">
						<h1 class="page-title txt-color-blueDark">
							<!-- PAGE HEADER -->
							<%--<i class="fa-fw fa fa-language"></i> --%>
                            <strong><%=_blog_name%></strong>
						</h1>
					</div>
					<!-- end col -->

					<!-- right side of the page with the sparkline graphs -->
					<!-- col -->
			<%--		<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
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
				
				<div class="row">

					<div class="col-sm-9">

                   
						<div class="well padding-10">
                         <%-- 여기서부터 Contents시작--%>
							<div class="row">

               
                      
		
								<div class="col-md-8 padding-left-0">
                                <small class="font-xs"><i>	 <img class=" round" src="../img/avatars/sunny.png" alt="me" height="30" width="30"/> 
                                    <a href="javascript:void(0);" style="color:black;"><%=_blog_writer%>  
                                 </a></i></small>      
                                    &nbsp&nbsp&nbsp<span style="color:lightslategray;"><%=_blog_create_time %></span>
                                    <%=_blog_setting_data %> <%=_blog_option_data %>
                                     <br /> 
                                       <%if(WC_Files!=""){%>
                                       <a href="#" class="iconattachment icon"> </a>
                                             <asp:Literal ID="ltrAttachFile" runat="server" Text=""></asp:Literal>
                                       <%}else if(WC_Files==""){%>
    
                                       <%}%>
                                    <br />
                                        <%= _blog_contents %>

									<a class="btn btn-warning" href="Edit.aspx?sn=<%=_sn%>"> 수정 </a>
                                    <a class="btn btn-success" onclick="DeleteBlog(<%=_sn %>);"> 삭제 </a>
								</div>
							</div>
                          
						</div>

                        <%-- 여기서부터 태그정보 시작--%>
                       	<div class="well padding-10">
                                <%for (int i = 0; i < _TagDatarr.Length; ++i){%>
                                 <a href="Blog.aspx?cg=0&page=1&tag=<%=_TagDatarr[i].ToString().Replace("#","") %>"><%=_TagDatarr[i] %></a>
                                 <% } %>
						</div>
                        <%-- 여기서부터 태그정보 끝--%>

                          <%-- <asp:CheckBox ID="CheckBox0" runat="server" AutoPostBack="true"  /> --%>
                          <asp:Repeater ID="rptList" runat="server" OnItemDataBound="rptList_ItemDataBound">
				            	<ItemTemplate>
				                    <div class="row ">
							        	<div class="col-md-8 padding-left-0">
							        		<h8 class="margin-top-0"><br>
                                                <small class="font-xs"><i>	 <img class=" round" src="../img/avatars/sunny.png" alt="me"  height="30" width="30"/>  <a href="javascript:void(0);" style="color:black">
                                                    <%# ShowSerailNum(Eval("comment_writer").ToString()) %> <asp:Label ID="comment_num_Label" runat="server" Text=<%# ShowSerailNum(Eval("comment_num").ToString()) %> style="visibility:hidden"> </asp:Label> 
                                            </a></i></small></h8>                              	
							        			<div >
                                                    <%# ShowContents(Eval("comment_contents").ToString()) %>       
							        			</div>
                                            <%# ShowDate((DateTime)Eval("comment_create_time")) %> <br />
                                            <button ID="WriteReplyReply" class="btn btn-circle"  type="button" onclick="togleReplyTextarea(<%#Eval("comment_num").ToString() %>)"/>답글 </button><br />
                                            <div class='<%#Eval("comment_num")%>' style="display:none;" >
                                               <asp:TextBox ID="WriteReplytextbox"  runat="server" Width="423px" Height="72px" TextMode="MultiLine" ></asp:TextBox>
                                               <button ID="WriteReplyReplybtn" class="btn btn-circle"  type="button" onclick="ReplybtnWrite(<%#Eval("comment_num").ToString() %>)" />쓰기 </button>
                                            </div>
							        	</div>
							        </div>
                                    <%-- 답글시작--%>
                                    <asp:Repeater ID="rptListreply" runat="server" >
				                     	<ItemTemplate>
                                           <div class="row">
                                             
							               	<div class="col-md-8 padding-left-0" style="margin-left: 50px!important;border:1px solid">
							               		<h8 class="margin-top-0"><br>
                                                       └<small class="font-xs"><i>	 <img class=" round" src="../img/avatars/sunny.png" alt="me"  height="30" width="30"/>  <a href="javascript:void(0);" style="color:black">
                                                           <%# ShowSerailNum(Eval("reply_writer").ToString()) %> <asp:Label ID="comment_num_Label" runat="server" Text=<%# ShowSerailNum(Eval("reply_num").ToString()) %> style="visibility:hidden"> </asp:Label> 
                                                   </a></i></small></h8>                              	
							               			<div >
                                                           <%# ShowContents(Eval("reply_contents").ToString()) %>
                                                           			</div>
                                                   <%# ShowDate((DateTime)Eval("reply_create_time")) %> <br />
                                                   <button ID="WriteReplyReply" class="btn btn-circle"  type="button" onclick="togleReplyTextarea(<%#Eval("reply_num").ToString() %>)"/>답글 </button><br />
                                                   <div class='<%#Eval("reply_num")%>' style="display:none;" >
                                                      <asp:TextBox ID="WriteReplytextbox"  runat="server" Width="423px" Height="72px" TextMode="MultiLine" ></asp:TextBox>
                                                      <button ID="WriteReplyReplybtn" class="btn btn-circle"  type="button" onclick="ReplybtnWrite(<%#Eval("reply_num").ToString() %>)" />쓰기 </button>
                                                   </div>
							               	</div>
							               </div>
                                     <%--          <%# ShowDate((DateTime)Eval("reply_create_time")) %>
                                                  <%# ShowContents(Eval("reply_contents").ToString()) %>--%>
				                     	</ItemTemplate>
				                    </asp:Repeater>
                                    <%--  답글 끝--%>
				            	</ItemTemplate>
				            </asp:Repeater>
                            <asp:TextBox ID="WriteCommenttextbox" runat="server" Width="423px" Height="72px" TextMode="MultiLine"></asp:TextBox>


                            <% if (_blog_option_data.Contains("댓글허용") == true)
                            { %>
                            <asp:Button ID="WriteReply" class="btn btn-danger" runat="server" onclick="lnbWriteReply_Click" Text="댓글쓰기" />
                            <% } %>
					</div>

                 
					<div class="col-sm-3">
						<div class="well padding-10">
							<h5 class="margin-top-0"><i class="fa fa-search"></i> Blog Search...</h5>
							<div class="input-group">
								<input type="text" class="form-control">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button> </span>
							</div>
                            <!-- 내 블로그 / 글쓰기 -->
                            <%if(Convert.ToBoolean(Session["UserLogOn"])==true){%>
                                   <div class="well padding-10">
                                 <a class="btn btn-primary" href="Profile.aspx?username=<%=Session["UserName"].ToString()%>"> 내 블로그 </a>
						         <a class="btn btn-warning" href="Write.aspx"> 글쓰기 </a>
                            </div>   	
                            <%}%>
							<!-- /input-group -->
						</div>
						<!-- /well -->
                        <uc6:ucTagContent ID="ucTagContent" runat="server" />
<%--						<div class="well padding-10">
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
						</div>
						<div class="well padding-10">
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
        <asp:LinkButton ID="lnbWriteReply" runat="server" Width=0 Height=0 onclick="lnbWriteReplyReply_Click" ></asp:LinkButton>
        <asp:LinkButton ID="lnbDeleteBlog" runat="server" Width=0 Height=0 onclick="lnbDeleteBlog_Click" ></asp:LinkButton>
		<!--========================Script========================== -->
      	<script>
		$(document).ready(function() {
			 pageSetUp();
		})
		    
		</script>
		<script>
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

            function togleReplyTextarea(comment_num)
            {
                //if (comment_num의 벨류값이랑 해당 textarea의 value가 같을때)
                //    type=hidden을 not hidden상태로 바꾼다.
                //var product_question = $('textarea[name="product_question"]', this).val();
                $("." + comment_num.toString()).toggle();     
            }

            function ReplybtnWrite(comment_num) {
                __doPostBack("<%=lnbWriteReply.UniqueID%>", comment_num + ";" + $("." + comment_num.toString()).find("textarea").val());
            };

            function DeleteBlog(sn) {
                if (confirm("해당 블로그를 삭제하시겠 습니까?"))
                __doPostBack("<%=lnbDeleteBlog.UniqueID%>", sn);
            }
		</script>
</asp:Content>