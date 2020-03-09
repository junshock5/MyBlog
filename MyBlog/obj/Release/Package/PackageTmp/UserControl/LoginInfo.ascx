<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginInfo.ascx.cs" Inherits="MyBlog.LoginInfo" %>

<span> <!-- User image size is adjusted inside CSS, it should stay as it --> 	
    <%if(Convert.ToBoolean(Session["UserLogOn"])==true){%>
       <a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
	   	 <img src="../img/avatars/sunny.png" alt="me" class="online" /> 
	   	 <span>
	   	 	 <%=Session["UserName"].ToString()%>
	   	 </span>
	   	 <i class="fa fa-angle-down"></i>
	   </a> 
    <%}else{%>
       <a href="../Login/Login.aspx" id="show-shortcut">
		<img src="../img/avatars/sunny.png" alt="me" class="online" /> 
		<span style="color:cornflowerblue">
			로그인
		</span>
       </a> 	
    <%}%>
</span>
	