﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TagContent.ascx.cs" Inherits="MyBlog.UserControl.TagContent" %>

<%--<div class="well padding-10">
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

<h5 class="margin-top-0"><i class="fa fa-tags"></i> Popular Tags:</h5>

<asp:Repeater ID="rptList" runat="server" >
 	<ItemTemplate>
	<div class="row">
		<div class="col-lg-6">
			<ul class="list-unstyled">
				<li>
					<a href="Blog.aspx?cg=0&page=1&tag=<%#Eval("tag_data").ToString().Replace("#","") %>"><span class="badge badge-info"><%#Eval("tag_data") %></span></a>
				</li>
			</ul>
		</div>
	</div>
 	</ItemTemplate>
 </asp:Repeater>