<%@ Page Language="C#" MasterPageFile="~/Master/Login.Master" AutoEventWireup="true" CodeBehind="Changepassword.aspx.cs" Inherits="MyBlog.Changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">
    <div id="login">
		<header id="header">
			<div id="logo-group">
				<span id="logo"> <img src="../img/logo.png" alt="SmartAdmin"> </span>
			</div>
			<span id="extr-page-header-space"> <span class="hidden-mobile hiddex-xs">Already registered?</span> <a href="Login.aspx" class="btn btn-danger">Login</a> </span>
		</header>

		<div id="main" role="main">
			<!-- MAIN CONTENT -->
			<div id="content" class="container">

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 hidden-xs hidden-sm">
						<h1 class="txt-color-red login-header-big">SmartAdmin</h1>
						<div class="hero">

							<div class="pull-left login-desc-box-l">
								<h4 class="paragraph-header">It's Okay to be Smart. Experience the simplicity of SmartAdmin, everywhere you go!</h4>
								<div class="login-app-icons">
									<a href="javascript:void(0);" class="btn btn-danger btn-sm">Frontend Template</a>
									<a href="javascript:void(0);" class="btn btn-danger btn-sm">Find out more</a>
								</div>
							</div>
							
							<img src="../img/demo/iphoneview.png" alt="" class="pull-right display-image" style="width:210px">
							
						</div>

						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">About SmartAdmin - Are you up to date?</h5>
								<p>
									Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa.
								</p>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">Not just your average template!</h5>
								<p>
									Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi voluptatem accusantium!
								</p>
							</div>
						</div>

					</div>
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
						<div class="well no-padding">

						<%--	<form action="Register.aspx" id="smart-form-register" class="smart-form client-form">--%>
                            	<div id="smart-form-register" class="smart-form client-form">
								<header style="color:mediumpurple;">
									<h1><strong>Change Password</strong></h1>
								</header>
								<fieldset>
									<div class="row">
										<section class="col col-5">
											<h2>ID</h2>						
										</section>
											<section>			
                                        <h4><strong><asp:Label id="user_email" runat="server" ForeColor="mediumpurple"></asp:Label></strong></h4>
									</section>
									</div>
								<div class="row">
										<section class="col col-5">
											<h5>새 비밀번호</h5>			
										</section>
										<section>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
										<%--	<input type="password" name="password" placeholder="Password" id="password">--%>
                                            <asp:TextBox ID="txtUserPassword" runat="server"  placeholder="password" type="password" style="width:58%;"></asp:TextBox>
											<b class="tooltip tooltip-bottom-right">Don't forget your password</b> </label>
									</section>
									</div>

                                    <div class="row">
										<section class="col col-5">
												<h5>새 비밀번호 확인</h5>	
										</section>
											<section>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
										<%--	<input type="password" name="passwordConfirm" placeholder="Confirm password">--%>
                                            <asp:TextBox ID="passwordConfirm" runat="server"  placeholder="passwordConfirm" type="password" style="width:58%;"></asp:TextBox>
											<b class="tooltip tooltip-bottom-right">Don't forget your password</b> </label>
									</section>
									</div>

                                     <div class="note">
								            <div id="msg" style="color:Red;"><asp:Label id="lblMsg" runat="server" ForeColor="Red"></asp:Label>&nbsp;</div>
									</div> 

								</fieldset>
								<footer>
								<%--	<button type="submit" class="btn btn-primary">
										Register
									</button>--%>
                                  <%--  <asp:Button ID="btnCreateAccount" class="btn btn-primary" runat="server" Text="Register"  OnClick="btnCreateAccount_Click" />--%>
                                    <span id="CreateAccount"  class="btn btn-primary"  onclick="fnCheckPassword()">Change</span>
								</footer>

								<div class="message">
									<i class="fa fa-check"></i>
									<p>
										Thank you for your registration!
									</p>
								</div>
							</div>

						</div>
						<p class="note text-center">*FREE Registration ends on October 2015.</p>
						<h5 class="text-center">- Or sign in using -</h5>
						<ul class="list-inline text-center">
							<li>
								<a href="javascript:void(0);" class="btn btn-primary btn-circle"><i class="fa fa-facebook"></i></a>
							</li>
							<li>
								<a href="javascript:void(0);" class="btn btn-info btn-circle"><i class="fa fa-twitter"></i></a>
							</li>
							<li>
								<a href="javascript:void(0);" class="btn btn-warning btn-circle"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>


        <asp:LinkButton ID="lnbChangePassword" runat="server" Width=0 Height=0 OnClick="lnbChangePassword_Click"></asp:LinkButton>
		<!--================================================== -->	
		<script>
			runAllForms();
			
			// Model i agree button
			$("#i-agree").click(function(){
				$this=$("#terms");
				if($this.checked) {
					$('#myModal').modal('toggle');
				} else {
					$this.prop('checked', true);
					$('#myModal').modal('toggle');
				}
			});
			

            $(function () {
	          $("#<%=user_email.ClientID%>").text(getQueryVariable("user_email"));
            });

            function getQueryVariable(variable) {
            	var query = window.location.search.substring(1);
            	var vars = query.split("&");
            	for (var i=0;i<vars.length;i++) {
            		var pair = vars[i].split("=");
            		if(pair[0] == variable){return pair[1];}
            	}
            	return(false);
            }

            function fnCheckPassword() {
                var oPwd = document.getElementById("<%=txtUserPassword.ClientID%>").value;
                var oPwdc = document.getElementById("<%=passwordConfirm.ClientID%>").value;
   
		    	var oMsg = document.getElementById("msg");
		    	var message = "";

                if (oPwd == "") {
		    		message = "비밀번호를 입력하세요";
                    //oPwd.focus();
                }
                  else if (oPwd != oPwdc) {
		    		message = "동일한 비밀번호를 입력하세요";
                }

		    	if (message == "") {
  
                    oPwd = "";
                    oPwdc = "";
                    //__doPostBack('lnbLogon', '');
                    __doPostBack(  "<%=lnbChangePassword.UniqueID%>", '');
                  
                    /*이 함수가 바로 폼을 서브밋하는 역할을 합니다
                    우리는 개발자 맘대로 자바스크립트 함수에서 원하는 버튼 컨트롤의 서버측 Click 이벤트를 일으키게 만들 수 있다는 것입니다..*/
                } else {
                    oMsg.innerHTML = message;
                }
            }
		</script>
        </div>
<%--	</body>
</html>--%>
</asp:Content>