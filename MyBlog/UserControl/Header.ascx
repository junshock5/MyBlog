﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="MyBlog.UserControl.Header" %>

		<header id="header">
			<div id="logo-group">

				<!-- PLACE YOUR LOGO HERE -->
				<span id="logo"> <img src="../img/logo.png" alt="SmartAdmin"> </span>
				<!-- END LOGO PLACEHOLDER -->

				<!-- Note: The activity badge color changes when clicked and resets the number to 0
					 Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
			<%--	<span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 21 </b> </span>--%>

				<!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
			<%--	<div class="ajax-dropdown">

					<!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
					<div class="btn-group btn-group-justified" data-toggle="buttons">
						<label class="btn btn-default">
							<input type="radio" name="activity" id="ajax/notify/mail.html">
							Msgs (14) </label>
						<label class="btn btn-default">
							<input type="radio" name="activity" id="ajax/notify/notifications.html">
							notify (3) </label>
						<label class="btn btn-default">
							<input type="radio" name="activity" id="ajax/notify/tasks.html">
							Tasks (4) </label>
					</div>

					<!-- notification content -->
					<div class="ajax-notifications custom-scroll">

						<div class="alert alert-transparent">
							<h4>Click a button to show messages here</h4>
							This blank page message helps protect your privacy, or you can show the first message here automatically.
						</div>

						<i class="fa fa-lock fa-4x fa-border"></i>

					</div>
					<!-- end notification content -->

					<!-- footer: refresh area -->
					<span> Last updated on: 12/12/2013 9:43AM
						<button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..." class="btn btn-xs btn-default pull-right">
							<i class="fa fa-refresh"></i>
						</button> </span>
					<!-- end footer -->

				</div>--%>
				<!-- END AJAX-DROPDOWN -->
			</div>

			<!-- #PROJECTS: projects dropdown -->
	<%--		<div class="project-context hidden-xs">

				<span class="label">Projects:</span>
				<span class="project-selector dropdown-toggle" data-toggle="dropdown">Recent projects <i class="fa fa-angle-down"></i></span>

				<!-- Suggestion: populate this list with fetch and push technique -->
				<ul class="dropdown-menu">
					<li>
						<a href="javascript:void(0);">Online e-merchant management system - attaching integration with the iOS</a>
					</li>
					<li>
						<a href="javascript:void(0);">Notes on pipeline upgradee</a>
					</li>
					<li>
						<a href="javascript:void(0);">Assesment Report for merchant account</a>
					</li>
					<li class="divider"></li>
					<li>
						<a href="javascript:void(0);"><i class="fa fa-power-off"></i> Clear</a>
					</li>
				</ul>
				<!-- end dropdown-menu-->

			</div>--%>
			<!-- end projects dropdown -->

			<!-- #TOGGLE LAYOUT BUTTONS -->
			<!-- pulled right: nav area -->
			<div class="pull-right">
				
				<!-- collapse menu button -->
				<div id="hide-menu" class="btn-header pull-right">
					<span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
				</div>
				<!-- end collapse menu -->
				
				<!-- #MOBILE -->
				<!-- Top menu profile link : this shows only when top menu is active -->
				<ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
					<li class="">
						<a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown"> 
							<img src="../img/avatars/sunny.png" alt="John Doe" class="online" />  
						</a>
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Setting</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="Profile.aspx" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> <u>P</u>rofile</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="toggleShortcut"><i class="fa fa-arrow-down"></i> <u>S</u>hortcut</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full <u>S</u>creen</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="Login.aspx" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i> <strong><u>L</u>ogout</strong></a>
							</li>
						</ul>
					</li>
				</ul>

				<!-- logout button -->
				<div id="logout" class="btn-header transparent pull-right">
					<span> 
                        <a href="Blog.aspx?LogOut=true"   title="Sign Out" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser">
                            <i class="fa fa-sign-out"></i>
                        </a> 
					</span>
				</div>
				<!-- end logout button -->

				<!-- search mobile button (this is hidden till mobile view port) -->
				<div id="search-mobile" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
				</div>
				<!-- end search mobile button -->
				
				<!-- #SEARCH -->
				<!-- input: search field -->
				<%--<div class="header-search pull-right"> 
					<input id="search-fld" type="text" name="param" placeholder="Find reports and more">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
					<a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
				</div>--%>
				<!-- end input: search field -->

				<!-- fullscreen button -->
				<div id="fullscreen" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
				</div>
				<!-- end fullscreen button -->
				
				<!-- #Voice Command: Start Speech -->
		<%--		<div id="speech-btn" class="btn-header transparent pull-right hidden-sm hidden-xs">
					<div> 
						<a href="javascript:void(0)" title="Voice Command" data-action="voiceCommand"><i class="fa fa-microphone"></i></a> 
						<div class="popover bottom"><div class="arrow"></div>
							<div class="popover-content">
								<h4 class="vc-title">Voice command activated <br><small>Please speak clearly into the mic</small></h4>
								<h4 class="vc-title-error text-center">
									<i class="fa fa-microphone-slash"></i> Voice command failed
									<br><small class="txt-color-red">Must <strong>"Allow"</strong> Microphone</small>
									<br><small class="txt-color-red">Must have <strong>Internet Connection</strong></small>
								</h4>
								<a href="javascript:void(0);" class="btn btn-success" onclick="commands.help()">See Commands</a> 
								<a href="javascript:void(0);" class="btn bg-color-purple txt-color-white" onclick="$('#speech-btn .popover').fadeOut(50);">Close Popup</a> 
							</div>
						</div>
					</div>
				</div>--%>
				<!-- end voice command -->

				<!-- multiple lang dropdown : find all flags in the flags page -->
		<%--		<ul class="header-dropdown-list hidden-xs">
					<li>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="../img/blank.gif" class="flag flag-us" alt="United States"> <span> English (US) </span> <i class="fa fa-angle-down"></i> </a>
						<ul class="dropdown-menu pull-right">
							<li class="active">
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-us" alt="United States"> English (US)</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-fr" alt="France"> Français</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-es" alt="Spanish"> Español</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-de" alt="German"> Deutsch</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-jp" alt="Japan"> 日本語</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-cn" alt="China"> 中文</a>
							</li>	
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-it" alt="Italy"> Italiano</a>
							</li>	
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-pt" alt="Portugal"> Portugal</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-ru" alt="Russia"> Русский язык</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="../img/blank.gif" class="flag flag-kr" alt="Korea"> 한국어</a>
							</li>						
							
						</ul>
					</li>
				</ul>--%>
				<!-- end multiple lang -->

			</div>
			<!-- end pulled right: nav area -->

		</header>