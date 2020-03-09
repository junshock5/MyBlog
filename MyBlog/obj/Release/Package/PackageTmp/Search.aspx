﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MyBlog.Search" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

		<title> SmartAdmin </title>
		<meta name="description" content="">
		<meta name="author" content="">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> 

		<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

		<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

		<!-- FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

		<!-- GOOGLE FONT -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

		<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
		<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">

	</head>
	
	<!--

	TABLE OF CONTENTS.
	
	Use search to find needed section.
	
	===================================================================
	
	|  01. #CSS Links                |  all CSS links and file paths  |
	|  02. #FAVICONS                 |  Favicon links and file paths  |
	|  03. #GOOGLE FONT              |  Google font link              |
	|  04. #APP SCREEN / ICONS       |  app icons, screen backdrops   |
	|  05. #BODY                     |  body tag                      |
	|  06. #HEADER                   |  header tag                    |
	|  07. #PROJECTS                 |  project lists                 |
	|  08. #TOGGLE LAYOUT BUTTONS    |  layout buttons and actions    |
	|  09. #MOBILE                   |  mobile view dropdown          |
	|  10. #SEARCH                   |  search field                  |
	|  11. #NAVIGATION               |  left panel & navigation       |
	|  12. #RIGHT PANEL              |  right panel userlist          |
	|  13. #MAIN PANEL               |  main panel                    |
	|  14. #MAIN CONTENT             |  content holder                |
	|  15. #PAGE FOOTER              |  page footer                   |
	|  16. #SHORTCUT AREA            |  dropdown shortcuts area       |
	|  17. #PLUGINS                  |  all scripts and plugins       |
	
	===================================================================
	
	-->
	
	<!-- #BODY -->
	<!-- Possible Classes

		* 'smart-style-{SKIN#}'
		* 'smart-rtl'         - Switch theme mode to RTL
		* 'menu-on-top'       - Switch to top navigation (no DOM change required)
		* 'no-menu'			  - Hides the menu completely
		* 'hidden-menu'       - Hides the main menu but still accessable by hovering over left edge
		* 'fixed-header'      - Fixes the header
		* 'fixed-navigation'  - Fixes the main menu
		* 'fixed-ribbon'      - Fixes breadcrumb
		* 'fixed-page-footer' - Fixes footer
		* 'container'         - boxed layout mode (non-responsive: will not work with fixed-navigation & fixed-ribbon)
	-->
	<body class="">

		<!-- HEADER -->
		<header id="header">
			<div id="logo-group">

				<!-- PLACE YOUR LOGO HERE -->
				<span id="logo"> <img src="img/logo.png" alt="SmartAdmin"> </span>
				<!-- END LOGO PLACEHOLDER -->

				<!-- Note: The activity badge color changes when clicked and resets the number to 0
				Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
				<span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 21 </b> </span>

				<!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
				<div class="ajax-dropdown">

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

				</div>
				<!-- END AJAX-DROPDOWN -->
			</div>

			<!-- projects dropdown -->
			<div class="project-context hidden-xs">

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

			</div>
			<!-- end projects dropdown -->

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
							<img src="img/avatars/sunny.png" alt="John Doe" class="online" />  
						</a>
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Setting</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="profile.html" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> <u>P</u>rofile</a>
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
								<a href="login.html" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i> <strong><u>L</u>ogout</strong></a>
							</li>
						</ul>
					</li>
				</ul>

				<!-- logout button -->
				<div id="logout" class="btn-header transparent pull-right">
					<span> <a href="login.html" title="Sign Out" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i class="fa fa-sign-out"></i></a> </span>
				</div>
				<!-- end logout button -->

				<!-- search mobile button (this is hidden till mobile view port) -->
				<div id="search-mobile" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
				</div>
				<!-- end search mobile button -->

				<!-- input: search field -->
				<form action="search.html" class="header-search pull-right">
					<input id="search-fld"  type="text" name="param" placeholder="Find reports and more" data-autocomplete='[
					"ActionScript",
					"AppleScript",
					"Asp",
					"BASIC",
					"C",
					"C++",
					"Clojure",
					"COBOL",
					"ColdFusion",
					"Erlang",
					"Fortran",
					"Groovy",
					"Haskell",
					"Java",
					"JavaScript",
					"Lisp",
					"Perl",
					"PHP",
					"Python",
					"Ruby",
					"Scala",
					"Scheme"]'>
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
					<a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
				</form>
				<!-- end input: search field -->

				<!-- fullscreen button -->
				<div id="fullscreen" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
				</div>
				<!-- end fullscreen button -->
				
				<!-- #Voice Command: Start Speech -->
				<div id="speech-btn" class="btn-header transparent pull-right hidden-sm hidden-xs">
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
				</div>
				<!-- end voice command -->

				<!-- multiple lang dropdown : find all flags in the flags page -->
				<ul class="header-dropdown-list hidden-xs">
					<li>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="img/blank.gif" class="flag flag-us" alt="United States"> <span> English (US) </span> <i class="fa fa-angle-down"></i> </a>
						<ul class="dropdown-menu pull-right">
							<li class="active">
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-us" alt="United States"> English (US)</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-fr" alt="France"> Français</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-es" alt="Spanish"> Español</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-de" alt="German"> Deutsch</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-jp" alt="Japan"> 日本語</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-cn" alt="China"> 中文</a>
							</li>	
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-it" alt="Italy"> Italiano</a>
							</li>	
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-pt" alt="Portugal"> Portugal</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-ru" alt="Russia"> Русский язык</a>
							</li>
							<li>
								<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-kr" alt="Korea"> 한국어</a>
							</li>						
							
						</ul>
					</li>
				</ul>
				<!-- end multiple lang -->

			</div>
			<!-- end pulled right: nav area -->

		</header>
		<!-- END HEADER -->

		<!-- Left panel : Navigation area -->
		<!-- Note: This width of the aside area can be adjusted through LESS variables -->
		<aside id="left-panel">

			<!-- User info -->
			<div class="login-info">
				<span> <!-- User image size is adjusted inside CSS, it should stay as it --> 
					
					<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
						<img src="img/avatars/sunny.png" alt="me" class="online" /> 
						<span>
							john.doe 
						</span>
						<i class="fa fa-angle-down"></i>
					</a> 
					
				</span>
			</div>
			<!-- end user info -->

			<nav>
				<!-- 
				NOTE: Notice the gaps after each icon usage <i></i>..
				Please note that these links work a bit different than
				traditional href="" links. See documentation for details.
				-->

				<ul>
					<li>
						<a href="#" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Dashboard</span></a>
						<ul>
							<li>
								<a href="index.html" title="Dashboard"><span class="menu-item-parent">Analytics Dashboard</span></a>
							</li>
							<li>
								<a href="dashboard-marketing.html" title="Dashboard"><span class="menu-item-parent">Marketing Dashboard</span></a>
							</li>
							<li>
								<a href="dashboard-social.html" title="Dashboard"><span class="menu-item-parent">Social Wall</span></a>
							</li>
						</ul>	
					</li>
					<li class="top-menu-invisible">
						<a href="#"><i class="fa fa-lg fa-fw fa-cube txt-color-blue"></i> <span class="menu-item-parent">SmartAdmin Intel</span></a>
						<ul>
							<li class="">
								<a href="layouts.html" title="Dashboard"><i class="fa fa-lg fa-fw fa-gear"></i> <span class="menu-item-parent">App Layouts</span></a>
							</li>
							<li class="">
								<a href="skins.html" title="Dashboard"><i class="fa fa-lg fa-fw fa-picture-o"></i> <span class="menu-item-parent">Prebuilt Skins</span></a>
							</li>
							<li>
								<a href="applayout.html"><i class="fa fa-cube"></i> App Settings</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="inbox.html"><i class="fa fa-lg fa-fw fa-inbox"></i> <span class="menu-item-parent">Outlook</span> <span class="badge pull-right inbox-badge margin-right-13">14</span></a>
					</li>
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">Graphs</span></a>
						<ul>
							<li>
								<a href="flot.html">Flot Chart</a>
							</li>
							<li>
								<a href="morris.html">Morris Charts</a>
							</li>
							<li>
								<a href="sparkline-charts.html">Sparklines</a>
							</li>
							<li>
								<a href="easypie-charts.html">EasyPieCharts</a>
							</li>
							<li>
								<a href="dygraphs.html">Dygraphs</a>
							</li>
							<li>
								<a href="chartjs.html">Chart.js</a>
							</li>
							<li>
								<a href="hchartable.html">HighchartTable <span class="badge pull-right inbox-badge bg-color-yellow">new</span></a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-table"></i> <span class="menu-item-parent">Tables</span></a>
						<ul>
							<li>
								<a href="table.html">Normal Tables</a>
							</li>
							<li>
								<a href="datatables.html">Data Tables <span class="badge inbox-badge bg-color-greenLight hidden-mobile">responsive</span></a>
							</li>
							<li>
								<a href="jqgrid.html">Jquery Grid</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-pencil-square-o"></i> <span class="menu-item-parent">Forms</span></a>
						<ul>
							<li>
								<a href="form-elements.html">Smart Form Elements</a>
							</li>
							<li>
								<a href="form-templates.html">Smart Form Layouts</a>
							</li>
							<li>
								<a href="validation.html">Smart Form Validation</a>
							</li>
							<li>
								<a href="bootstrap-forms.html">Bootstrap Form Elements</a>
							</li>
							<li>
								<a href="bootstrap-validator.html">Bootstrap Form Validation</a>
							</li>
							<li>
								<a href="plugins.html">Form Plugins</a>
							</li>
							<li>
								<a href="wizard.html">Wizards</a>
							</li>
							<li>
								<a href="other-editors.html">Bootstrap Editors</a>
							</li>
							<li>
								<a href="dropzone.html">Dropzone</a>
							</li>
							<li>
								<a href="image-editor.html">Image Cropping</a>
							</li>
							<li>
								<a href="ckeditor.html">CK Editor</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-desktop"></i> <span class="menu-item-parent">UI Elements</span></a>
						<ul>
							<li>
								<a href="general-elements.html">General Elements</a>
							</li>
							<li>
								<a href="buttons.html">Buttons</a>
							</li>
							<li>
								<a href="#">Icons</a>
								<ul>
									<li>
										<a href="fa.html"><i class="fa fa-plane"></i> Font Awesome</a>
									</li>
									<li>
										<a href="glyph.html"><i class="glyphicon glyphicon-plane"></i> Glyph Icons</a>
									</li>
									<li>
										<a href="flags.html"><i class="fa fa-flag"></i> Flags</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="grid.html">Grid</a>
							</li>
							<li>
								<a href="treeview.html">Tree View</a>
							</li>
							<li>
								<a href="nestable-list.html">Nestable Lists</a>
							</li>
							<li>
								<a href="jqui.html">JQuery UI</a>
							</li>
							<li>
								<a href="typography.html">Typography</a>
							</li>
							<li>
								<a href="#">Six Level Menu</a>
								<ul>
									<li>
										<a href="#"><i class="fa fa-fw fa-folder-open"></i> Item #2</a>
										<ul>
											<li>
												<a href="#"><i class="fa fa-fw fa-folder-open"></i> Sub #2.1 </a>
												<ul>
													<li>
														<a href="#"><i class="fa fa-fw fa-file-text"></i> Item #2.1.1</a>
													</li>
													<li>
														<a href="#"><i class="fa fa-fw fa-plus"></i> Expand</a>
														<ul>
															<li>
																<a href="#"><i class="fa fa-fw fa-file-text"></i> File</a>
															</li>
														</ul>
													</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>
										<a href="#"><i class="fa fa-fw fa-folder-open"></i> Item #3</a>
		
										<ul>
											<li>
												<a href="#"><i class="fa fa-fw fa-folder-open"></i> 3ed Level </a>
												<ul>
													<li>
														<a href="#"><i class="fa fa-fw fa-file-text"></i> File</a>
													</li>
													<li>
														<a href="#"><i class="fa fa-fw fa-file-text"></i> File</a>
													</li>
												</ul>
											</li>
										</ul>	
									</li>
									<li>
										<a href="#" class="inactive"><i class="fa fa-fw fa-folder-open"></i> Item #4 (disabled)</a>
									</li>	
									
								</ul>
							</li>
						</ul>
					</li>	
					<li>
						<a href="widgets.html"><i class="fa fa-lg fa-fw fa-list-alt"></i> <span class="menu-item-parent">Widgets</span></a>
					</li>
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-cloud"><em>3</em></i> <span class="menu-item-parent">Cool Features!</span></a>
						<ul>
							<li>
								<a href="calendar.html"><i class="fa fa-lg fa-fw fa-calendar"></i> <span class="menu-item-parent">Calendar</span></a>
							</li>
							<li>
								<a href="gmap-xml.html"><i class="fa fa-lg fa-fw fa-map-marker"></i> <span class="menu-item-parent">GMap Skins</span><span class="badge bg-color-greenLight pull-right inbox-badge">9</span></a>
							</li>
						</ul>
					</li>	
					<li class="active open">
						<a href="#"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <span class="menu-item-parent">App Views</span></a>
						<ul style="display:block;">
							<li>
								<a href="projects.html"><i class="fa fa-file-text-o"></i> Projects</a>
							</li>	
							<li>
								<a href="blog.html"><i class="fa fa-paragraph"></i> Blog</a>
							</li>
							<li>
								<a href="gallery.html"><i class="fa fa-picture-o"></i> Gallery</a>
							</li>
							<li>
								<a href="#"><i class="fa fa-comments"></i> Forum Layout</a>
								<ul>
									<li><a href="forum.html">General View</a></li>
									<li><a href="forum-topic.html">Topic View</a></li>
									<li><a href="forum-post.html">Post View</a></li>
								</ul>
							</li>
							<li>
								<a href="profile.html"><i class="fa fa-group"></i> Profile</a>
							</li>
							<li>
								<a href="timeline.html"><i class="fa fa-clock-o"></i> Timeline</a>
							</li>
							<li class="active">
								<a href="search.html"><i class="fa fa-search"></i>  Search Page</a>
							</li>
						</ul>		
					</li>
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-shopping-cart"></i> <span class="menu-item-parent">E-Commerce</span></a>
						<ul>
							<li><a href="orders.html">Orders</a></li>
							<li><a href="products-view.html">Products View</a></li>
							<li><a href="products-detail.html">Products Detail</a></li>
						</ul>
					</li>	
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-windows"></i> <span class="menu-item-parent">Miscellaneous</span></a>
						<ul>
							<li>
								<a href="../Landing_Page/" target="_blank">Landing Page <i class="fa fa-external-link"></i></a>
							</li>
							<li>
								<a href="pricing-table.html">Pricing Tables</a>
							</li>
							<li>
								<a href="invoice.html">Invoice</a>
							</li>
							<li>
								<a href="login.html" target="_top">Login</a>
							</li>
							<li>
								<a href="register.html" target="_top">Register</a>
							</li>
							<li>
								<a href="forgotpassword.html" target="_top">Forgot Password</a>
							</li>
							<li>
								<a href="lock.html" target="_top">Locked Screen</a>
							</li>
							<li>
								<a href="error404.html">Error 404</a>
							</li>
							<li>
								<a href="error500.html">Error 500</a>
							</li>
							<li>
								<a href="blank_.html">Blank Page</a>
							</li>
						</ul>
					</li>
					<li class="chat-users top-menu-invisible">
						<a href="#"><i class="fa fa-lg fa-fw fa-comment-o"><em class="bg-color-pink flash animated">!</em></i> <span class="menu-item-parent">Smart Chat API <sup>beta</sup></span></a>
						<ul>
							<li>
								<!-- DISPLAY USERS -->
								<div class="display-users">

									<input class="form-control chat-user-filter" placeholder="Filter" type="text">
									
								  	<a href="#" class="usr" 
									  	data-chat-id="cha1" 
									  	data-chat-fname="Sadi" 
									  	data-chat-lname="Orlaf" 
									  	data-chat-status="busy" 
									  	data-chat-alertmsg="Sadi Orlaf is in a meeting. Please do not disturb!" 
									  	data-chat-alertshow="true" 
									  	data-rel="popover-hover" 
									  	data-placement="right" 
									  	data-html="true" 
									  	data-content="
											<div class='usr-card'>
												<img src='img/avatars/5.png' alt='Sadi Orlaf'>
												<div class='usr-card-content'>
													<h3>Sadi Orlaf</h3>
													<p>Marketing Executive</p>
												</div>
											</div>
										"> 
									  	<i></i>Sadi Orlaf
								  	</a>
								  
									<a href="#" class="usr" 
										data-chat-id="cha2" 
									  	data-chat-fname="Jessica" 
									  	data-chat-lname="Dolof" 
									  	data-chat-status="online" 
									  	data-chat-alertmsg="" 
									  	data-chat-alertshow="false" 
									  	data-rel="popover-hover" 
									  	data-placement="right" 
									  	data-html="true" 
									  	data-content="
											<div class='usr-card'>
												<img src='img/avatars/1.png' alt='Jessica Dolof'>
												<div class='usr-card-content'>
													<h3>Jessica Dolof</h3>
													<p>Sales Administrator</p>
												</div>
											</div>
										"> 
									  	<i></i>Jessica Dolof
									</a>
								  
									<a href="#" class="usr" 
									  	data-chat-id="cha3" 
									  	data-chat-fname="Zekarburg" 
									  	data-chat-lname="Almandalie" 
									  	data-chat-status="online" 
									  	data-rel="popover-hover" 
									  	data-placement="right" 
									  	data-html="true" 
									  	data-content="
											<div class='usr-card'>
												<img src='img/avatars/3.png' alt='Zekarburg Almandalie'>
												<div class='usr-card-content'>
													<h3>Zekarburg Almandalie</h3>
													<p>Sales Admin</p>
												</div>
											</div>
										"> 
									  	<i></i>Zekarburg Almandalie
									</a>
								 
									<a href="#" class="usr" 
									  	data-chat-id="cha4" 
									  	data-chat-fname="Barley" 
									  	data-chat-lname="Krazurkth" 
									  	data-chat-status="away" 
									  	data-rel="popover-hover" 
									  	data-placement="right" 
									  	data-html="true" 
									  	data-content="
											<div class='usr-card'>
												<img src='img/avatars/4.png' alt='Barley Krazurkth'>
												<div class='usr-card-content'>
													<h3>Barley Krazurkth</h3>
													<p>Sales Director</p>
												</div>
											</div>
										"> 
									  	<i></i>Barley Krazurkth
									</a>
								  
									<a href="#" class="usr offline" 
									  	data-chat-id="cha5" 
									  	data-chat-fname="Farhana" 
									  	data-chat-lname="Amrin" 
									  	data-chat-status="incognito" 
									  	data-rel="popover-hover" 
									  	data-placement="right" 
									  	data-html="true" 
									  	data-content="
											<div class='usr-card'>
												<img src='img/avatars/female.png' alt='Farhana Amrin'>
												<div class='usr-card-content'>
													<h3>Farhana Amrin</h3>
													<p>Support Admin <small><i class='fa fa-music'></i> Playing Beethoven Classics</small></p>
												</div>
											</div>
										"> 
									  	<i></i>Farhana Amrin (offline)
									</a>
								  
									<a href="#" class="usr offline" 
										data-chat-id="cha6" 
									  	data-chat-fname="Lezley" 
									  	data-chat-lname="Jacob" 
									  	data-chat-status="incognito" 
									  	data-rel="popover-hover" 
									  	data-placement="right" 
									  	data-html="true" 
									  	data-content="
											<div class='usr-card'>
												<img src='img/avatars/male.png' alt='Lezley Jacob'>
												<div class='usr-card-content'>
													<h3>Lezley Jacob</h3>
													<p>Sales Director</p>
												</div>
											</div>
										"> 
									  	<i></i>Lezley Jacob (offline)
									</a>
									
									<a href="chat.html" class="btn btn-xs btn-default btn-block sa-chat-learnmore-btn">About the API</a>

								</div>
								<!-- END DISPLAY USERS -->
							</li>
						</ul>	
					</li>
				</ul>
			</nav>
			

			<span class="minifyme" data-action="minifyMenu"> 
				<i class="fa fa-arrow-circle-left hit"></i> 
			</span>

		</aside>
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
					<li>Home</li><li>Miscellaneous</li><li>Search Page</li>
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
				
					<div class="col-sm-12">
				
						<ul id="myTab1" class="nav nav-tabs bordered">
							<li class="active">
								<a href="#s1" data-toggle="tab">Search All <i class="fa fa-caret-down"></i></a>
							</li>
							<li>
								<a href="#s2" data-toggle="tab">Users</a>
							</li>
							<li>
								<a href="#s3" data-toggle="tab">Search History</a>
							</li>
							<li class="pull-right hidden-mobile">
								<a href="javascript:void(0);"> <span class="note">About 24,431 results (0.15 seconds) </span> </a>
							</li>
						</ul>
				
						<div id="myTabContent1" class="tab-content bg-color-white padding-10">
							<div class="tab-pane fade in active" id="s1">
								<h1> Search <span class="semi-bold">Everything</span></h1>
								<br>
								<div class="input-group input-group-lg hidden-mobile">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
											Everything <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li class="active">
												<a href="javascript:void(0)"><i class="fa fa-check"></i> Everything</a>
											</li>
											<li class="divider"></li>
											<li>
												<a href="javascript:void(0)">Users</a>
											</li>
											<li>
												<a href="javascript:void(0)">Projects</a>
											</li>
											<li>
												<a href="javascript:void(0)">Sites</a>
											</li>
										</ul>
									</div>
									<input class="form-control input-lg" type="text" placeholder="Search again..." id="search-project">
									<div class="input-group-btn">
										<button type="submit" class="btn btn-default">
											&nbsp;&nbsp;&nbsp;<i class="fa fa-fw fa-search fa-lg"></i>&nbsp;&nbsp;&nbsp;
										</button>
									</div>
								</div>
				
								<h1 class="font-md"> Search Results for <span class="semi-bold">Projects</span><small class="text-danger"> &nbsp;&nbsp;(2,281 results)</small></h1>
				
								<div class="search-results clearfix smart-form">
				
									<h4><i class="fa fa-plus-square txt-color-blue"></i>&nbsp;<a href="javascript:void(0);">SmartAdmin - Responsive Dashboard Template</a></h4>
				
									<div>
										<div class="rating display-inline">
											<input type="radio" name="stars-rating" id="stars-rating-5">
											<label for="stars-rating-5"><i class="fa fa-star"></i></label>
											<input type="radio" name="stars-rating" id="stars-rating-4">
											<label for="stars-rating-4"><i class="fa fa-star"></i></label>
											<input type="radio" name="stars-rating" id="stars-rating-3">
											<label for="stars-rating-3"><i class="fa fa-star"></i></label>
											<input type="radio" name="stars-rating" id="stars-rating-2">
											<label for="stars-rating-2"><i class="fa fa-star"></i></label>
											<input type="radio" name="stars-rating" id="stars-rating-1">
											<label for="stars-rating-1"><i class="fa fa-star"></i></label>
										</div>
										<br>
										<div class="url text-success">
											http://www.wrapbootstrap.com <i class="fa fa-caret-down"></i>
										</div>
										<p class="description">
											Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
										</p>
									</div>
				
								</div>
								<div class="search-results clearfix">
									<h4><a href="javascript:void(0);">SmartAdmin- Responsive Dashboard Template</a></h4>
									<div>
										<p class="note">
											<a href="javascript:void(0);"><i class="fa fa-thumbs-up"></i> Like this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-chain"></i> Share this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-star txt-color-yellow"></i> Favorite&nbsp;&nbsp;</a>
										</p>
										<div class="url text-success">
											http://www.wrapbootstrap.com <i class="fa fa-caret-down"></i>
										</div>
										<p class="description">
											It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here...
										</p>
									</div>
								</div>
								<div class="search-results clearfix">
									<h4><a href="javascript:void(0);">SmartAdmin- Responsive Dashboard Template</a>&nbsp;&nbsp;<a href="javascript:void(0);"><i class="fa fa-caret-up fa-lg"></i></a></h4>
									<img src="img/demo/sample.jpg" alt="">
									<div>
										<p class="note">
											<a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-chain"></i> Share this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-star txt-color-yellow"></i> Favorite&nbsp;&nbsp;</a>
										</p>
										<div class="url text-success">
											smartadmin/index.html?#ajax/gallery.html <i class="fa fa-caret-down"></i>
										</div>
										<p class="description">
											Oct 1, 2006 - Uploaded by 02842356107
											<br>
											<br>
											<a href="javascript:void(0)" class="btn btn-default btn-xs">Go to gallery</a>
										</p>
									</div>
				
								</div>
								<div class="search-results clearfix">
									<h4><a href="javascript:void(0);">Company project Timeline Stock</a>&nbsp;&nbsp;<a href="javascript:void(0);"><i class="fa fa-caret-up fa-lg"></i></a></h4>
				
									<div>
				
										<span class="sparkline txt-color-blueLight" data-sparkline-type="line" data-sparkline-width="150px" data-sparkline-height="25px"> 10,3,8,4,3,10,7,8,4,6,4,6,8,3 </span>
										<span class="display-inline note font-lg semi-bold"><small><i class="fa fa-arrow-circle-up text-success"></i> 143.43</small></span>
				
										<p class="note">
											<a href="javascript:void(0);"><i class="fa fa-thumbs-up"></i> Like this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-chain"></i> Share this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-star txt-color-yellow"></i> Favorite&nbsp;&nbsp;</a>
										</p>
										<div class="url text-success">
											Dashboard > Projects > IT Report <i class="fa fa-caret-down"></i>
										</div>
										<p class="description">
											Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.
										</p>
									</div>
				
								</div>
				
								<div class="search-results clearfix">
									<h4><a href="javascript:void(0);"> Company project Timeline Stock</a>&nbsp;&nbsp;<a href="javascript:void(0);"></a><small>[PDF]</small></h4>
									<span class="sparkline txt-color-blueLight display-inline" data-sparkline-type="pie"  data-sparkline-offset="90" data-sparkline-piesize="55px"> 10,3,8,4, </span>
									<div>
										<p class="note">
											<a href="javascript:void(0);"><i class="fa fa-thumbs-up"></i> Like this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-chain"></i> Share this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-star txt-color-yellow"></i> Favorite&nbsp;&nbsp;</a>
										</p>
										<div class="url text-success">
											Dashboard > Projects > IT Report <i class="fa fa-caret-down"></i>
										</div>
										<p class="description">
											Last updated by <a href="javascript:void(0);">Rusho Burthoth </a>
										</p>
									</div>
				
								</div>
				
								<div class="search-results clearfix">
									<h4><a href="javascript:void(0);">SmartAdmin- Responsive Dashboard Template</a></h4>
									<div>
										<p class="note">
											<a href="javascript:void(0);"><i class="fa fa-thumbs-up"></i> Like this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-chain"></i> Share this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-star txt-color-yellow"></i> Favorite&nbsp;&nbsp;</a>
										</p>
										<div class="url text-success">
											http://www.wrapbootstrap.com <i class="fa fa-caret-down"></i>
										</div>
									</div>
								</div>
				
								<div class="search-results clearfix">
									<h4><a href="javascript:void(0);">SmartAdmin- Responsive Dashboard Template</a></h4>
									<div>
										<p class="note">
											<a href="javascript:void(0);"><i class="fa fa-thumbs-up"></i> Like this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-chain"></i> Share this link&nbsp;&nbsp;</a>
											<a href="javascript:void(0);"><i class="fa fa-star txt-color-yellow"></i> Favorite&nbsp;&nbsp;</a>
										</p>
										<div class="url text-success">
											http://www.wrapbootstrap.com <i class="fa fa-caret-down"></i>
										</div>
										<p class="description">
											Last updated by <a href="javascript:void(0);">Rusho Burthoth </a>
										</p>
									</div>
								</div>
				
								<div class="text-center">
									<hr>
									<ul class="pagination no-margin">
										<li class="prev disabled">
											<a href="javascript:void(0);">Previous</a>
										</li>
										<li class="active">
											<a href="javascript:void(0);">1</a>
										</li>
										<li>
											<a href="javascript:void(0);">2</a>
										</li>
										<li>
											<a href="javascript:void(0);">3</a>
										</li>
										<li class="next">
											<a href="javascript:void(0);">Next</a>
										</li>
									</ul>
									<br>
									<br>
									<br>
								</div>
				
							</div>
				
							<div class="tab-pane fade" id="s2">
								<h1> Search <span class="semi-bold">Users</span></h1>
								<br>
								<div class="input-group input-group-lg">
									<input class="form-control input-lg" type="text" placeholder="Search again..." id="search-user">
									<div class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<i class="fa fa-fw fa-search fa-lg"></i>
										</button>
									</div>
								</div>
								<h1 class="font-md"> Search Results for <span class="semi-bold">Users</span><small class="text-danger"> &nbsp;&nbsp;(181 results)</small></h1>
								<br>
								<div class="table-responsive">
									
									<table id="resultTable" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th style="width:30px">Pic</th>
												<th>F.Name</th>
												<th>L.Name</th>
												<th>DOB</th>
												<th>Email / Username</th>
												<th>City</th>
												<th>Postal</th>
												<th>Phone</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
					
											<tr>
												<td><img src="img/avatars/male.png" alt="" width="20"></td><td>Noble</td><td>Saunders</td><td>2002-12-07</td><td>numbers@lipliquid.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>La Puerta</td><td>54076</td><td>558-908-4575</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Anna</td><td>Meeks</td><td>2007-04-05</td><td>carmel@forkform.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Holland</td><td>73490</td><td>255-757-8495<td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Millicent</td><td>Decker</td><td>2007-03-27</td><td>agustin.murray@babyback.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Leona</td><td>45960</td><td>207-445-7704</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Misty</td><td>Mcdowell</td><td>2002-12-09</td><td>mona.doreen@processproduce.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Sweetwater</td><td>94133</td><td>707-118-9601</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr class="danger">
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Cleo</td><td>Blue</td><td>1993-04-30</td><td>collin@berry.info <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Groesbeck</td><td>12764</td><td>543-827-8732</td><td><span class="label label-danger">Disabled</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Eliza</td><td>Proctor</td><td>2003-12-26</td><td>lawanda@event.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Alto</td><td>70454</td><td>453-985-9884</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr class="success">
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Chantel</td><td>Medina</td><td>1993-04-01</td><td>marilynn.lucretia@animalanswer.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Lozano</td><td>46151</td><td>789-917-1518</td><td><span class="label label-primary">ADMIN</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Tisha</td><td>Burns</td><td>1997-10-23</td><td>luella@square.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Dayton</td><td>18943</td><td>510-644-1193</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/female.png" alt=""  width="20"></td><td>Estelle</td><td>Barton</td><td>1993-01-21</td><td>rod.quinton@whilewhip.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Texline</td><td>29712</td><td>786-799-7584</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/female.png" alt=""  width="20"></td><td>Angeline</td><td>Roman</td><td>2002-11-23</td><td>katrina.claire.lindsey@letterlevel.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Ranchitos Las Lomas</td><td>87049</td><td>645-104-7232</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Barrett</td><td>Pearce</td><td>2013-04-16</td><td>katrina.claire.lindsey@smooth.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Flowella</td><td>45074</td><td>234-002-0762</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Margarita</td><td>Lancaster</td><td>2013-11-29</td><td>terra@smokesmooth.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Grand Saline</td><td>50886</td><td>354-908-6520</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/female.png" alt=""  width="20"></td><td>Rebekah</td><td>Hatcher</td><td>2003-01-03</td><td>janelle.lourdes.laurel@antany.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Laureles</td><td>26524</td><td>345-807-9800</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr class="warning">
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Lesley</td><td>Mccall</td><td>2000-07-27</td><td>pam.kelli@recordred.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Eagle Lake</td><td>83430</td><td>255-974-8448</td><td><span class="label label-warning">Inactive</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Josephine</td><td>Cooley</td><td>2006-10-31</td><td>magdalena@accountacid.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Stagecoach</td><td>89756</td><td>502-841-8206</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Joseph</td><td>Dawson</td><td>2013-01-25</td><td>yvonne.annette.june@streetstretch.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Oyster Creek</td><td>94520</td><td>954-256-3614</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Marlin</td><td>Dorsey</td><td>1994-12-08</td><td>jerrod.weston.hershel@specialsponge.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Lubbock</td><td>19131</td><td>510-209-3012</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Reginald</td><td>Nash</td><td>2000-11-26</td><td>mel@officeoil.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Port Mansfield</td><td>24679</td><td>390-385-6930</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Helga</td><td>Johnson</td><td>2000-03-09</td><td>kirby@stiffstill.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Oakhurst</td><td>52280</td><td>443-588-7234</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Silas</td><td>Arrington</td><td>2002-11-30</td><td>lula.lola@judgejump.org <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Bayou Vista</td><td>59377</td><td>729-309-5537</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/female.png" alt=""  width="20"></td><td>Thelma</td><td>Boyer</td><td>2004-10-26</td><td>athena.janel@attemptattention.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Keller</td><td>53463</td><td>958-473-4716</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/female.png" alt=""  width="20"></td><td>Sybil</td><td>Mahoney</td><td>1994-07-16</td><td>lara@water.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Mila Doce</td><td>96556</td><td>129-759-9595</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>David</td><td>Dean</td><td>1992-12-06</td><td>ma.justina.gussie@pumppunishment.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Columbus</td><td>88557</td><td>626-095-2870</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Dina</td><td>Steward</td><td>1997-11-26</td><td>clifton.willard.daryl@far.info <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Mason</td><td>54724</td><td>912-684-8315</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Raymundo</td><td>Massey</td><td>2005-08-30</td><td>lashawn.devon@bentberry.info <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Oak Valley</td><td>95324</td><td>680-005-5225</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Nick</td><td>Mcallister</td><td>2006-07-08</td><td>deann@pleasure.info <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>San Leanna</td><td>17585</td><td>408-044-0598</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Charlene</td><td>Nance</td><td>2013-01-13</td><td>armando.felix.jimmie@ableabout.org <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Edgewater-Paisano</td><td>93799</td><td>476-739-7850</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Judy</td><td>Corbett</td><td>2013-09-15</td><td>morton.jonas.forest@horse.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Roma</td><td>39019</td><td>575-417-6267</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Shauna</td><td>Elmore</td><td>1996-03-29</td><td>mel.marcelo@rootrough.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Channelview</td><td>18778</td><td>419-563-2551</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Archie</td><td>Castillo</td><td>2001-03-11</td><td>walker.tyree@fruitfull.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Martindale</td><td>77003</td><td>197-694-7475</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Ike</td><td>Yates</td><td>2005-08-08</td><td>kathi@fiction.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Denver City</td><td>96627</td><td>562-068-2504</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>James</td><td>Harrell</td><td>2001-07-05</td><td>rolando.clay@bitter.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Sanger</td><td>38876</td><td>971-978-5229</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Hung</td><td>Walsh</td><td>2012-03-10</td><td>rory@acidacross.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Buckholts</td><td>13087</td><td>914-948-4150</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/female.png" alt=""  width="20"></td><td>Frankie</td><td>Porter</td><td>2006-05-28</td><td>aron.leopoldo.everette@businessbut.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Fair Oaks Ranch</td><td>81496</td><td>935-811-1608</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Adrienne</td><td>Dickson</td><td>2000-05-09</td><td>felipe.bennie.gerardo@boiling.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Seabrook</td><td>67641</td><td>204-684-8982</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Ursula</td><td>Covington</td><td>2009-05-16</td><td>brianne.nilda@year.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Richland</td><td>35047</td><td>101-930-4222</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Wendy</td><td>Spence</td><td>1996-02-23</td><td>hilda.gwendolyn@brass.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Slaton</td><td>82159</td><td>936-779-1161</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Sarah</td><td>Mcdaniel</td><td>2003-08-03</td><td>danny@language.com <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Needville</td><td>16354</td><td>805-226-9457</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Bobbi</td><td>Taylor</td><td>2008-09-29</td><td>wesley@sunsupport.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Santa Fe</td><td>56008</td><td>781-448-8791</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Brendan</td><td>Mckay</td><td>2010-02-13</td><td>chong@example.org <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Las Colonias</td><td>63927</td><td>414-598-1649</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Beverley</td><td>Dodson</td><td>2012-08-10</td><td>curt.quentin@crush.info <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Study Butte-Terlingua</td><td>71556</td><td>937-937-2841</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Hassan</td><td>Bullock</td><td>2008-03-12</td><td>lena.christy@historyhole.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Hutchins</td><td>49192</td><td>108-577-5112</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Mack</td><td>Huber</td><td>1999-09-07</td><td>marquita@push.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Waelder</td><td>36982</td><td>812-883-4685</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Petra</td><td>Barnett</td><td>2003-10-24</td><td>elvia.alyce.deirdre@archargument.me <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Pittsburg</td><td>55769</td><td>624-871-4479</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Suzan</td><td>Case</td><td>2012-01-20</td><td>casey@cover.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Littlefield</td><td>30080</td><td>932-088-9855</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Jon</td><td>Mueller</td><td>2012-11-19</td><td>samual.paris@change.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Temple</td><td>30219</td><td>162-525-3454</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Loyd</td><td>Valenzuela</td><td>1993-08-28</td><td>jerrold.robt.hank@seaseat.edu <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Harker Heights</td><td>37310</td><td>295-305-4911</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Tracie</td><td>Ewing</td><td>2013-01-08</td><td>sang.deon@skysleep.info <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Kennard</td><td>67299</td><td>218-444-9426</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Jame</td><td>Cooper</td><td>2013-09-18</td><td>christi@substance.org <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Keene</td><td>84931</td><td>121-381-7120</td><td><span class="label label-success">Active</span></td>
											</tr>
											<tr>
												<td><img src="img/avatars/male.png" alt=""  width="20"></td><td>Clyde</td><td>Hudson</td><td>2008-08-22</td><td>elvia@smilesmoke.info <a href="javascript:void(0);" class="pull-right"><i class="fa fa-key"></i></a></td><td>Sunset</td><td>88755</td><td>561-388-1897</td><td><span class="label label-success">Active</span></td>
											</tr>
					
										</tbody>
									</table>
				
								</div>
								
								<div class="text-center">
									<hr>
									<ul class="pagination no-margin">
										<li class="prev disabled">
											<a href="javascript:void(0);">Previous</a>
										</li>
										<li class="active">
											<a href="javascript:void(0);">1</a>
										</li>
										<li>
											<a href="javascript:void(0);">2</a>
										</li>
										<li>
											<a href="javascript:void(0);">3</a>
										</li>
										<li>
											<a href="javascript:void(0);">4</a>
										</li>
										<li>
											<a href="javascript:void(0);">5</a>
										</li>
										<li class="next">
											<a href="javascript:void(0);">Next</a>
										</li>
									</ul>
									<br>
									<br>
									<br>
								</div>
							</div>
				
							<div class="tab-pane fade" id="s3">
								<h1> Search <span class="semi-bold">history</span></h1>
								<p class="alert alert-info">
									Your search history is turned off.
				
								</p>
				
								<span class="onoffswitch-title">Auto save Search History</span>
								<span class="onoffswitch">
									<input type="checkbox" name="save_history" class="onoffswitch-checkbox" id="save_history" checked="checked">
									<label class="onoffswitch-label" for="save_history"> <span class="onoffswitch-inner" data-swchon-text="ON" data-swchoff-text="OFF"></span> <span class="onoffswitch-switch"></span> </label> </span>
				
							</div>
						</div>
				
					</div>
				
				</div>
				
				<!-- end row -->

			</div>
			<!-- END MAIN CONTENT -->

		</div>
		<!-- END MAIN PANEL -->

		<!-- PAGE FOOTER -->
		<div class="page-footer">
			<div class="row">
				<div class="col-xs-12 col-sm-6">
					<span class="txt-color-white">SmartAdmin 1.9.0 <span class="hidden-xs"> - Web Application Framework</span> © 2017-2019</span>
				</div>

				<div class="col-xs-6 col-sm-6 text-right hidden-xs">
					<div class="txt-color-white inline-block">
						<i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i> <strong>52 mins ago &nbsp;</strong> </i>
						<div class="btn-group dropup">
							<button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown">
								<i class="fa fa-link"></i> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu pull-right text-left">
								<li>
									<div class="padding-5">
										<p class="txt-color-darken font-sm no-margin">Download Progress</p>
										<div class="progress progress-micro no-margin">
											<div class="progress-bar progress-bar-success" style="width: 50%;"></div>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="padding-5">
										<p class="txt-color-darken font-sm no-margin">Server Load</p>
										<div class="progress progress-micro no-margin">
											<div class="progress-bar progress-bar-success" style="width: 20%;"></div>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="padding-5">
										<p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span></p>
										<div class="progress progress-micro no-margin">
											<div class="progress-bar progress-bar-danger" style="width: 70%;"></div>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="padding-5">
										<button class="btn btn-block btn-default">refresh</button>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END PAGE FOOTER -->

		<!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
			Note: These tiles are completely responsive, you can add as many as you like
		-->
		<div id="shortcut">
			<ul>
				<li>
					<a href="inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
				</li>
				<li>
					<a href="calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
				</li>
				<li>
					<a href="gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
				</li>
				<li>
					<a href="invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
				</li>
				<li>
					<a href="gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
				</li>
				<li>
					<a href="profile.html" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
				</li>
			</ul>
		</div>
		<!-- END SHORTCUT AREA -->

		<!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script>
			if (!window.jQuery) {
				document.write('<script src="js/libs/jquery-3.2.1.min.js"><\/script>');
			}
		</script>

		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<script>
			if (!window.jQuery.ui) {
				document.write('<script src="js/libs/jquery-ui.min.js"><\/script>');
			}
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->

		<!-- Demo purpose only -->
		<script src="js/demo.min.js"></script>

		<!-- MAIN APP JS FILE -->
		<script src="js/app.min.js"></script>

		<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
		<!-- Voice command : plugin -->
		<script src="js/speech/voicecommand.min.js"></script>

		<!-- SmartChat UI : plugin -->
		<script src="js/smart-chat-ui/smart.chat.ui.min.js"></script>
		<script src="js/smart-chat-ui/smart.chat.manager.min.js"></script>

		<!-- PAGE RELATED PLUGIN(S) 
		<script src="..."></script>-->

		<script>
		
		// DO NOT REMOVE : GLOBAL FUNCTIONS!
		
		$(document).ready(function() {
			
			$("#search-project").focus();
		
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
			})();

		</script>

	</body>

</html>