<%@ Page Language="C#" MasterPageFile="~/Master/Blog.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MyBlog.Edit"   EnableEventValidation="false" %>

<%@ Register src="../UserControl/Header.ascx" TagName="ucHeader" TagPrefix="uc1" %>
<%@ Register src="../UserControl/LeftPanel.ascx" TagName="ucLeftPanel" TagPrefix="uc2" %>
<%@ Register src="../UserControl/Footer.ascx" TagName="ucFooter" TagPrefix="uc3" %>
<%@ Register src="../UserControl/Shortcut.ascx" TagName="ucShortcut" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">
        <!-- HEADER -->
        <uc1:ucHeader ID="ucHeader" runat="server" />
		<!-- END HEADER -->

		<!-- Left panel : Navigation area -->
		<!-- Note: This width of the aside area can be adjusted through LESS variables -->
		<uc2:ucLeftPanel ID="ucLeftPanel" runat="server" />
		<!-- END NAVIGATION -->

		<!-- MAIN PANEL -->
		<div id="main" role="main">
			<!-- RIBBON -->
			<div id="ribbon">


                <span class="breadcrumb">
                        <span class="ribbon-button-alignment"> 
				        	<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
				        		<i class="fa fa-refresh"></i>
				        	</span> 
				        </span>

				    	<span class="widget-icon"> <font size="5" color="white"> 블로그 편집</font></span>

				</span>
		

			</div>
			<!-- END RIBBON -->

			<!-- MAIN CONTENT   여기서부터 컨텐츠시작 -->
			<div id="content">
                <div class="note">
					<strong>제목</strong> 최대 50글자
				</div>
                <section>
					<label class="label"></label>
<%--					<label class="select">
						<select id="usercategory"  runat="server" >
							<option value="0">카테고리</option>
							<option value="1">날짜</option>
							<option value="2">장소</option>
							<option value="3">기타</option>
						</select> <i></i> </label>--%>
                     <label class="label"></label>
					<label class="input">
						<input id="blogname"  runat="server"  type="text" maxlength="50" style="width:300px;" >
					</label>
				</section>

<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row -->
	
	<div class="row">
		

		<!-- NEW WIDGET START -->
		<article class="col-sm-12 col-md-12 col-lg-12">
			
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-color-blue" id="wid-id-0" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-fullscreenbutton="false" data-widget-sortable="false">

<%--				<header>
					<span class="widget-icon"> <i class="fa fa-pencil"></i> </span>
					<h2>블로그 글쓰기</h2>
				</header>--%>
                <asp:HiddenField ID="biz_MakeWork" runat="server" />
		      <%--  <textarea name="ir_MakeWork"  id="ir_MakeWork" style="width:auto;height:500px;"></textarea>--%>

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body no-padding">

						<div class="summernote" id="Blog_contents" runat="server">
<%--						<%=_blog_contents %>--%>
						</div>
						
						<div class="widget-footer smart-form">

						<div class="btn-group">
							
							<button class="btn btn-sm btn-primary" type="button">
								<i class="fa fa-times"></i> Cancel
							</button>	
										
						</div>
						<div class="btn-group">
							
							<button class="btn btn-sm btn-success" type="button"">
								<i class="fa fa-check"></i> Save
							</button>	
						</div>

							<label class="checkbox pull-left">
								<input type="checkbox" checked="checked" name="autosave" id="autosave">
								<i></i>Auto Save 
							</label> 

						</div>
	
					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

                <!-- Start 네이버 select 정보 -->
                <div>

				
									<!-- widget content -->
									<div class="widget-body no-padding">
										<div class="smart-form">
											<fieldset>
                                                <section>
                                                    <div>
													<label class="label">첨부파일</label>
                                                     <asp:HiddenField ID="hdfAttachFile" runat="server" />
                                                         <asp:FileUpload ID="fupAttachFile" runat="server"  Width="70%" style="font-size:12px;"/>
                                                           <a class="btn btn-primary" href="javascript:AddAttachFile()"><span>추가</span></a>						
	                                                      <a class="btn btn-primary" href="javascript:DelSelectedFile()"><span>삭제</span></a>
                                                     </div>
                                                      <div>
	                                                     <span class="box"><asp:ListBox id="lstAttachFile" runat="server" Width="70%" /></span>
	                                                 	<span class="detail" style="display:inline-block; vertical-align:bottom;">
	                                                 		개수 : <span id="spanFileCount" runat="server">0</span>
	                                                 		<br />
	                                                 		크기 : <span id="spanFileSize" runat="server">0</span>
	                                                 	</span>
	                                                 	<asp:LinkButton ID="lnbAddAttachFile" runat="server" Width="0" Height="0" OnClick="lnbAddAttachFile_Click"></asp:LinkButton>
	                                                 	<asp:LinkButton ID="lnbDelAttachFile" runat="server" Width="0" Height="0" OnClick="lnbDelAttachFile_Click"></asp:LinkButton>
	                                                 </div>                     
                                                    <span style="font-size:10px">(최대 크기: 100 MB)</span>
												</section>
												<section>
													<label class="label">주제분류</label>
													<label class="select">
                                                    <asp:DropDownList ID="subjectcategory" runat="server">
                                                            	<asp:ListItem Value="사진">사진</asp:ListItem>
                                                              	<asp:ListItem Value="공연전시">공연전시</asp:ListItem>
                                                              	<asp:ListItem Value="건강의학">건강의학</asp:ListItem>
                                                              	<asp:ListItem Value="게임">게임</asp:ListItem>
                                                              	<asp:ListItem Value="스포츠">스포츠</asp:ListItem>
                                                              	<asp:ListItem Value="세계여행">세계여행</asp:ListItem>
                                                    </asp:DropDownList> <i></i> </label>
												</section>
                                                <section>
													설정정보 
                                                    <div class="inline-group">
														<label class="radio">
															<input type="radio" name="radio-inline" ID="setting1" runat="server" value="전체공개">
															<i></i>전체공개</label>
														<label class="radio">
															<input type="radio" name="radio-inline" ID="setting2" runat="server" value="이웃공개">
															<i></i>이웃공개</label>
														<label class="radio">
															<input type="radio" name="radio-inline" ID="setting3" runat="server" value="서로이웃공개">
															<i></i>서로이웃공개</label>
														<label class="radio">
															<input type="radio" name="radio-inline" ID="setting4" runat="server" value="비공개">
															<i></i>비공개</label>								
													</div>
												</section>
									
                                                	<section>
					                                옵션
													<div class="row">
														<div class="col col-4">
															<label class="checkbox">
																<input type="checkbox" name="checkbox" ID="option1" runat="server" value="댓글허용">
																<i></i>댓글허용</label>
															<label class="checkbox">
																<input type="checkbox" name="checkbox" ID="option2" runat="server" value="검색허용">
																<i></i>검색허용</label>
															<label class="checkbox">
																<input type="checkbox" name="checkbox" ID="option3" runat="server" value="블로그/카페 보내기 링크허용">
																<i></i>블로그/카페 보내기 링크허용</label>
														</div>
														<div class="col col-4">
															<label class="checkbox">
																<input type="checkbox" name="checkbox" ID="option4" runat="server" value="페이스북 공유">
																<i></i>페이스북 공유</label>
															<label class="checkbox">
																<input type="checkbox" name="checkbox" ID="option5" runat="server" value="트위터 공유">
																<i></i>트위터 공유</label>
															<label class="checkbox">
																<input type="checkbox" name="checkbox" ID="option6" runat="server" value="이 설정을 기본값으로 유지">
																<i></i>이 설정을 기본값으로 유지</label>
														</div>
														
													</div>
												</section>
											</fieldset>
                                            
											<footer>
											      <!-- 임시저장 확인 작성취소 버튼 -->
                                                  <div class="btn_post" id="writeBtnArea" style="position: relative;width: 100%;text-align: center;  margin-top: 40px;">
                                              	 	<a href="#" id="btn_tempsave" class="btnArea _returnFalse" onclick="clickcr(this,'wbt','','wbt.save',event);"><img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_temporarysave2.gif" alt="임시저장" title="Ctrl+S를 클릭해도 임시저장 됩니다." style="cursor: pointer;" width="66" height="30"></a>
                                              	   	<a href="#" id="btn_preview" class="btnArea _returnFalse" onclick="clickcr(this,'wbt','','wbt.preview',event);">
                                                    <img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_preview3.gif" alt="미리보기" style="cursor:pointer" width="66" height="30"></a>
                                                    <a href="#"  id="btn_submit" class="btnArea _returnFalse" onclick="editBlog();">
                                                    <img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_confirm02_2.gif" alt="확인" style="cursor:pointer" width="68" height="30"></a>
                                                    <a href="Blog.aspx" id="btn_back" class="btnArea" target="_self" style="position:absolute; top: 0px; left: 1249px;"><img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_write_cancel02_2.gif" alt="작성취소" width="65" height="30"></a><div class="rbtn">
                                              	    </div>
                                              	 </div>
                                                  <!-- 임시저장 확인 작성취소 버튼 -->
											</footer>
										</div>
				
									</div>
									<!-- end widget content -->
				
								</div>
                <!-- Start 네이버 select 정보 -->
			</div>
			<!-- end widget -->

		</article>
		<!-- WIDGET END -->

	</div>


	<!-- end row -->

</section>
<!-- end widget grid -->
     
</div>
<!-- END MAIN CONTENT -->

		</div>
		<!-- END MAIN PANEL -->

		<!-- PAGE FOOTER -->
		<uc3:ucFooter ID="ucFooter" runat="server" />
		<!-- END PAGE FOOTER -->

		<!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
		Note: These tiles are completely responsive,
		you can add as many as you like
		-->
		<uc4:ucShortcut ID="ucShortcut" runat="server" />
		<!-- END SHORTCUT AREA -->

        <asp:LinkButton ID="lnbEditBlog" runat="server" Width=0 Height=0 onclick="lnbEditBlog_Click" ></asp:LinkButton>
		<!--========================Script========================== -->
		<!-- Demo purpose only -->
		<script src="../js/demo.min.js"></script>

		<script>
		
			// DO NOT REMOVE : GLOBAL FUNCTIONS!

			$(document).ready(function() {
				
				pageSetUp();

				/*
				 * SUMMERNOTE EDITOR
				 */
				
				$('.summernote').summernote({
					height: 500,
					toolbar: [
				    ['style', ['style']],
				    ['font', ['bold', 'italic', 'underline', 'clear']],
				    ['fontname', ['fontname']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['table', ['table']],
				    ['insert', ['link', 'picture', 'hr']],
				    ['view', ['fullscreen', 'codeview', 'help']]

				  ]
				});
			
				/*
				 * MARKDOWN EDITOR
				 */

				$("#mymarkdown").markdown({
					autofocus:false,
					savable:true
				})
							
           
			})

		</script>

		<!-- Your GOOGLE ANALYTICS CODE Below -->
		<script>
			var _gaq = _gaq || [];
				_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
				_gaq.push(['_trackPageview']);
			
            (function () {
                bindingOption();

				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
            })();

                            
            function editBlog() {
                var markup = $('.summernote').summernote('code');
                __doPostBack("<%=lnbEditBlog.UniqueID%>",markup);
            };

            function bindingOption() { 
                $('input:radio[name=radio-inline]:input[value=<%=_blog_setting_data%>]').attr("checked", true);
                var optionsplit = '<%=_blog_option_data%>'.split('|');
                for (var i in optionsplit) {
                    $('input:checkbox[name=checkbox]:input[value="'+optionsplit[i]+'"]').attr("checked", true);
                }
            }

            function AddAttachFile() {
                var oAttach = document.getElementById("<%=fupAttachFile.ClientID%>");

                if (oAttach.value == "") {
                    alert("첨부할 파일을 선택하세요!");
                }
                else {
                    __doPostBack("<%=lnbAddAttachFile.UniqueID%>", '');
                }
            }
            function DelSelectedFile() {
  	           var oList = document.getElementById("<%=lstAttachFile.ClientID%>");

  	           if (oList.options.length == 0) {
  	               alert("삭제할 파일이 없습니다.");
  	           }
  	           else {
  	               var idx = oList.options.selectedIndex;

  	               if (idx == -1)
  	                   alert("삭제할 파일을 선택해 주세요.");
  	               else
  	                   __doPostBack("<%=lnbDelAttachFile.UniqueID%>", '');
  	           }
  	           
            }
		</script>
</asp:Content>