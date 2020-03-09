<%@ Page Language="C#" MasterPageFile="~/Master/Blog.Master" AutoEventWireup="true" CodeBehind="Write.aspx.cs" Inherits="MyBlog.Write" EnableEventValidation="false"  ValidateRequest="false"  %>

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

				    	<span class="widget-icon"><font size="5" color="white"> 블로그 글쓰기</font></span>

				</span>
				<!-- breadcrumb -->

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

			<!-- MAIN CONTENT   여기서부터 컨텐츠시작 -->
			<div id="content">

<%--                <div class="alert alert-danger alert-block" >
			    	<a class="close" data-dismiss="alert" href="#">×</a>
			    	<h4 class="alert-heading">CKEditor Warning!</h4>
			    	If you plan to use CKEditor in your project for this theme, please be sure to read full documentation of its use on their website. It is important to note that CKEditor may conflict with other editors and textareas. You must destroy the CKeditor instance before pulling it into another object.
			    </div>--%>
                <div class="note">
					<strong>제목</strong> 최대 50글자
				</div>
                <section>
					<label class="label"></label>
	<%--				<label class="select">
						<select id="usercategory"  runat="server" >
							<option value="0">카테고리</option>
							<option value="1">날짜</option>
							<option value="2">장소</option>
							<option value="3">기타</option>
						</select> <i></i> </label>--%>

                     <label class="label"></label>
					<label class="input">
						<input id="blogname"  runat="server" type="text" maxlength="50" style="width:300px;" placeholder="제목을 입력하세요">
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

						<div class="summernote">
						
						</div>
						
						<div class="widget-footer smart-form">

						<div class="btn-group">
							
							<button class="btn btn-sm btn-primary" type="button">
								<i class="fa fa-times"></i> Cancel
							</button>	
										
						</div>
						<div class="btn-group">
							
							<button class="btn btn-sm btn-success" type="button">
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
														<select ID="subjectcategory" runat="server" >
															<option value="사진">사진</option>
															<option value="공연전시">공연전시</option>
															<option value="건강의학">건강의학</option>
															<option value="게임">게임</option>
															<option value="스포츠">스포츠</option>
                                                            <option value="세계여행">세계여행</option>
														</select> <i></i> </label>
												</section>
                                                <section>
													<label class="label">태그달기</label>
													<%--<textarea id="tagList" name="post.tag.names" rows="1" cols="60" class="box_input" data-place-holder="태그와 태그는 쉼표로 구분하며, 30개까지 입력하실 수 있습니다." maxlength="6000" style="overflow: hidden; line-height: 14px; height: 20px; resize: none;">태그와 태그는 쉼표로 구분하며, 30개까지 입력하실 수 있습니다.</textarea>--%>
											         <%--<input type="text" class="autocomplete" id="autocomplete" onfocus="true"  rows="1" cols="60" runat="server" maxlength="6000" style="overflow: hidden; line-height: 14px; height: 20px; resize: none;">(태그와 태그는 쉼표로 구분하며, 30개까지 입력하실 수 있습니다.)<br />--%>
                                                    <asp:TextBox runat="server"  onkeydown="if(event.keyCode==13){AddTag();return false;}else{return true;}" placeholder="#"
                                                        class="autocomplete" id="autocomplete" onfocus="true"  rows="1" cols="60" maxlength="6000" style="overflow: hidden; line-height: 14px; height: 20px; resize: none;">
                                                    </asp:TextBox> <button  type="button" onclick="AddTag();">추가</button> (태그와 태그는 쉼표로 구분하며, 30개까지 입력하실 수 있습니다.)
                                                    <!--태그 정보-->
                                                    <div class="container">
                                                    	<table>
                                                    		<tr>
                                                    			<td class="left">태그정보:
                                                    				<span id="applist">
                                                    					<asp:HiddenField ID="hdfReferLine" runat="server" />
                                                    					<span id="spanReferView"></span>
                                                                        <asp:HiddenField ID="ltrReferLine" runat="server" />
                                                                    </span></td>
                                                    		</tr>
                                                    	</table>
                                                    </div>
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
																<input type="checkbox" name="checkbox" checked="checked" ID="option1" runat="server" value="댓글허용">
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
<%--                                              	 	<a href="#" id="btn_tempsave" class="btnArea _returnFalse" onclick="clickcr(this,'wbt','','wbt.save',event);"><img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_temporarysave2.gif" alt="임시저장" title="Ctrl+S를 클릭해도 임시저장 됩니다." style="cursor: pointer;" width="66" height="30"></a>
                                              	   	<a href="#" id="btn_preview" class="btnArea _returnFalse" onclick="clickcr(this,'wbt','','wbt.preview',event);">
                                                    <img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_preview3.gif" alt="미리보기" style="cursor:pointer" width="66" height="30"></a>
                                                    <a href="#"  id="btn_submit" class="btnArea _returnFalse" onclick="createBlog();">
                                                    <img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_confirm02_2.gif" alt="확인" style="cursor:pointer" width="68" height="30"></a>
                                                    <a href="Blog.aspx" id="btn_back" class="btnArea" target="_self" style="position:absolute; top: 0px; left: 1249px;"><img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_write_cancel02_2.gif" alt="작성취소" width="65" height="30"></a><div class="rbtn">--%>
                                                    <a href="Blog.aspx" id="btn_back" class="btn btn-danger" target="_self" style="cursor:pointer" >작성취소</a><div class="rbtn">
                                                    <a class="btn btn-primary"  style="cursor:pointer" onclick="createBlog();">확인</a>
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

        <asp:LinkButton ID="lnbCreateBlog" runat="server" Width=0 Height=0 onclick="lnbCreateBlog_Click" ></asp:LinkButton>
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
			
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
                var autocomplete_text = ["#C++", "#C", "#ASP.NET", "#MVC패턴", "#Node.js"];
                <%--var availableTags =<%= sJSON%>;--%>
                 var selectedItems= [];
                $('#<%=autocomplete.ClientID.ToString()%>').autocomplete({
                    source: autocomplete_text,
                    minLength: 0,
                    select:function(event, ui) {
                                        
                        selectedItems.push(ui.item.label);
                      }
                }).focus(function () {
                    try {
                        $(this).autocomplete("search");
                    }
                    catch (e) {

                    }
                })
            })();
      //      var oEditors_price = [];
		    //nhn.husky.EZCreator.createInIFrame({
		    //	oAppRef: oEditors_price,
		    //	elPlaceHolder: "ir_MakeWork",
		    //	sSkinURI: "/Utils/SmartEditor2.9/SmartEditor2Skin.html",
		    //	fCreator: "createSEditor2"
      //      });
                 
            function createBlog() {
                var markup = $('.summernote').summernote('code');
     <%--           var contents = {
                     biz_content: oEditors_price.getById["ir_MakeWork"].getIR()
                };
                oEditors_price.getById["ir_MakeWork"].exec("UPDATE_CONTENTS_FIELD", []);
                document.getElementById("<%=biz_MakeWork.ClientID%>").value = contents.biz_content;--%>
                __doPostBack("<%=lnbCreateBlog.UniqueID%>",markup);
            };

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
          

            function AddTag() {
                var searchList = document.getElementById("<%=autocomplete.ClientID%>").value; 
                var oReferLine = document.getElementById("<%=hdfReferLine.ClientID%>"); 
	            if (oReferLine.value == "")
	            	oReferLine.value = searchList;
	            else {
	            	//중복검증
	            	//(oReferLine.value + "|" + searchList).split("|").unique();
                    //var users = (oReferLine.value + "|" + searchList).split("|");
                    if (searchList.includes('#',0) == false) {
                        searchList = "#" + searchList;
                    }
                    oReferLine.value += "," + searchList;
                    oReferLine.value = unique(oReferLine.value.split(','));
	            }

	            //표시하기
	            if (oReferLine.value != "") {
	            	var display = "";
	            	var userLines = oReferLine.value.split(",");
	            	//userLines = userLines.unique();
                    var oltrLine = "";
	            	for (var i = 0; i < userLines.length; i++) {
                        if (userLines[i] != "") {   
	            	        display += "<span class='line'>" + userLines[i] + "<img src='../Images/btn_layer_close.gif' title='태그정보' align='absmiddle' style='cursor:pointer;' onclick='Removetagname(this)' order='" + i + "'></span>";
                        }
                        if (!oltrLine)
                           oltrLine += userLines[i];
                        else oltrLine += '|'+userLines[i];
	            	}
	            	$("span#spanReferView").html(display);
                }
                document.getElementById("<%=ltrReferLine.ClientID%>").value = oltrLine;
                document.getElementById("<%=autocomplete.ClientID%>").value = "";
             
            }

            function unique(tagnamearr) {
                var result=[];
               for(var i = 0; i < tagnamearr.length; i++) {
                     if(!result.includes(tagnamearr[i])) {
                         result.push(tagnamearr[i]);
                     }
                 }
                return result;
            };

            function Removetagname(oUser) {
                var order = parseInt(oUser.getAttribute("order"));
	            var oReferLine =document.getElementById("<%=hdfReferLine.ClientID%>"); 
	            var referLines = oReferLine.value.split(",");
	            var changedValue = "";

	            for (var i = 0; i < referLines.length; i++) {
	            	if (i != order) {
	            		if (changedValue == "")
	            			changedValue = referLines[i];
	            		else
	            			changedValue += "|" + referLines[i];
	            	}
	            }

	            oReferLine.value = changedValue;

	            if (changedValue != "") {
	            	var display = "";
	            	var userLines = changedValue.split("|");
	            	for (var i = 0; i < userLines.length; i++) {
	            	    if (userLines[i] != "") {
	            	        display += "<span class='line'>" + userLines[i] + "<img src='../Images/btn_layer_close.gif' title='진행참조 해제' align='absmiddle' style='cursor:pointer;' onclick='Removetagname(this)' order='" + i + "'></span>";
	            	    }
	            	}
	            	$("span#spanReferView").html(display);
	            }
	            else
	            	$("span#spanReferView").html("");
                }
		</script>
</asp:Content>