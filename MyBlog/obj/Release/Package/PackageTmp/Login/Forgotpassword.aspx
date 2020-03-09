<%@ Page Language="C#" MasterPageFile="~/Master/Login.Master" AutoEventWireup="true" CodeBehind="Forgotpassword.aspx.cs" Inherits="MyBlog.Forgotpassword" %>

<%--<html lang="en-us" id="extr-page">--%>
<asp:Content ID="Content1" ContentPlaceHolderID="cplMain" runat="server">
	<div class="animated fadeInDown">

		<header id="header">
			<!--<span id="logo"></span>-->

			<div id="logo-group">
				<span id="logo"> <img src="../img/logo.png" alt="SmartAdmin"> </span>

				<!-- END AJAX-DROPDOWN -->
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
									Forgot Password
								</header>

								<fieldset>
									
									<section>
										<label class="label">Enter your email address</label>
										<label class="input"> <i class="icon-append fa fa-envelope"></i>
											<%--<input type="email" name="email">--%>
                                           <asp:TextBox ID="txtEmail" runat="server" type="email" name="email"></asp:TextBox>
											<b class="tooltip tooltip-top-right"><i class="fa fa-envelope txt-color-teal"></i> Please enter email address for password reset</b></label>
									</section>
									<section>
										<span class="timeline-seperator text-center text-primary"></span> <span class="font-sm">AND</span> 
									</section>
									<section>
										<label class="label">Your Username</label>
										<label class="input"> <i class="icon-append fa fa-user"></i>
										   <asp:TextBox ID="txtUserId" runat="server"  name="Username"></asp:TextBox>
											<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Enter your username</b> </label>
										<div class="note">
											<a href="Login.aspx">I remembered my password!</a>
										</div>
                                        <div class="note">
								            <div id="msg" style="color:Red;"><asp:Label id="lblMsg" runat="server" ForeColor="Red"></asp:Label>&nbsp;</div>
										</div> 
									</section>

								</fieldset>
								<footer>
									<%--<button type="submit" class="btn btn-primary">
										<i class="fa fa-refresh"></i> Reset Password
									</button>--%>
                                    <span id="Reset"  class="btn btn-primary"  onclick="fnCheckReset()">	<i class="fa fa-refresh"></i> Reset Password</span>
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

        <asp:LinkButton ID="lnbFindPassword" runat="server" Width=0 Height=0 OnClick="lnbFindPassword_Click"></asp:LinkButton>
		<!--================================================== -->	
		<script>
            function fnCheckReset() {
                var oId = document.getElementById("<%=txtUserId.ClientID%>").value;
                var oEmail = document.getElementById("<%=txtEmail.ClientID%>").value;
           
		    	var oMsg = document.getElementById("msg");
		    	var message = "";
		    	if (oEmail == "") {
		    		message = "이메일을 입력하세요";
                    //oId.focus();
                } else if (oId == "") {
		    		message = "이름을 입력하세요";
                    //oPwd.focus();
                }
		    	if (message == "") {

                    oId = "";
                    oPwd = "";
                    //__doPostBack('lnbLogon', '');
                     __doPostBack(  "<%=lnbFindPassword.UniqueID%>", '');
                
                } else {
                    oMsg.innerHTML = message;
                }
            }

		</script>

	</div>
<%--</html>--%>
</asp:Content>