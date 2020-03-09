<%@ Page Language="C#"  MasterPageFile="~/Master/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyBlog.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">
	<div class="animated fadeInDown">
		<header id="header">

			<div id="logo-group">
				<span id="logo"> <img src="../img/logo.png" alt="SmartAdmin"> </span>
			</div>

			<span id="extr-page-header-space"> <span class="hidden-mobile hiddex-xs">Need an account?</span> <a href="Register.aspx" class="btn btn-danger">Create account</a> </span>

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
							
							<img src="../img/demo/iphoneview.png" class="pull-right display-image" alt="" style="width:210px">

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
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
						<div class="well no-padding">
							<div id="login-form" class="smart-form client-form">
								<header>
									Sign In
								</header>

								<fieldset>
									
									<section>
										<label class="label">E-mail</label>
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<asp:TextBox ID="txtUserId" runat="server" ></asp:TextBox>
											<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Please enter email address/username</b></label>
                                            <asp:HiddenField ID="hdf1" runat="server" />
									</section>

									<section>
										<label class="label">Password</label>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
											<asp:TextBox ID="txtUserPassword" runat="server"  name="Password" type="password"></asp:TextBox>
											<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Enter your password</b> </label>
                                            <asp:HiddenField ID="hdf2" runat="server" />
										<div class="note">
											<a href="Forgotpassword.aspx">Forgot password?</a>
										</div>
                                        <div class="note">
								            <div id="msg" style="color:Red;"><asp:Label id="lblMsg" runat="server" ForeColor="Red"></asp:Label>&nbsp;</div>
										</div>             
									</section>

									<section>
										<label class="checkbox">
											<input type="checkbox" id="remember" checked="" runat="server" >
											<i></i>Remember ID</label>
									</section>
								</fieldset>
								<footer>
                                    	<span id="login"  class="btn btn-primary"  onclick="fnCheckLogin()">Login</span>
								</footer>
							</div>
						</div>
						<h5 class="text-center"> - Or sign in using -</h5>
															
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

        <asp:LinkButton ID="lnbLogon" runat="server" Width=0 Height=0 OnClick="btnLogin_Click"></asp:LinkButton>
		<!--================================================== -->	
		<script>
			runAllForms();

			$(function() {

            });

            function fnCheckLogin() {
                var oId = document.getElementById("<%=txtUserId.ClientID%>").value;
                var oPwd = document.getElementById("<%=txtUserPassword.ClientID%>").value;
            
		    	var oMsg = document.getElementById("msg");
		    	var message = "";
		    	if (oId == "") {
		    		message = "아이디를 입력하세요";
		    	} else if (oPwd == "") {
		    		message = "비밀번호를 입력하세요";
                }
		  
		    	if (message == "") {
                    document.getElementById("<%=hdf1.ClientID%>").value = oId;
                    document.getElementById("<%=hdf2.ClientID%>").value = oPwd;
                    oId = "";
                    oPwd = "";
                      __doPostBack(  "<%=lnbLogon.UniqueID%>", '');
                  
                } else {
                    oMsg.innerHTML = message;
                }
            }

		</script>
	</div>
</asp:Content>