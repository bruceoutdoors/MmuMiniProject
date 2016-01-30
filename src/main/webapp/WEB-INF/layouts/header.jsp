<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="app.model.User"%>
<%@page import="core.LoginManager"%>
<center>
    <a href="${pageContext.request.contextPath}/" data-toggle="tooltip" title="Click to Home Page!">
        <img src="${pageContext.request.contextPath}/images/banner.png" alt="page banner" style="width:60%;height:60%" class="img-responsive"></img></a>
    <%
        String welcomeMessage = "";
        User u = LoginManager.getCurrentUser();
        if (u != null) {
            welcomeMessage = "Hey there, " + u.getUserName() + ". You role is " + u.getRoleId().getRoleName();
            if (u.isStudent()) {
                welcomeMessage += ". Your specialization is " + u.getStudent().getSpecId().getSpecName();
            }
        } else {
            welcomeMessage = "Hello stranger. Please login to access this system.";
        }
    %>
    <h5><%= welcomeMessage%></h5>

    <% if (u != null) { %>
    <a href="${pageContext.request.contextPath}/account/edit" class="btn btn-primary"><span class="fa fa-pencil-square-o"></span> Edit Account</a> || 
    <% if (u.isAdmin()) { %>
    <a href="${pageContext.request.contextPath}/user" class="btn btn-info"><span class="fa fa-user"></span> Edit Users</a> || 
    <% } %>
    <% if (u.isStudent()) { %>
    <a href="${pageContext.request.contextPath}/account/project" class="btn btn-success"><span class="fa fa-database"></span> My Projects</a> || 
    <% } else { %>
    <a href="${pageContext.request.contextPath}/project" class="btn btn-success"><span class="fa fa-database"></span> Projects</a> || 
    <% }%>
    <a onclick="return confirm('Are you sure you want to log out?')" href="${pageContext.request.contextPath}/account/logout" class="btn btn-danger"><span class="fa fa-sign-out"></span> Logout</a>
    <% } else { %>
    <a href="${pageContext.request.contextPath}/account/login" class="btn btn-primary"><span class="fa fa-sign-in"></span> Login</a>
    || <a href="${pageContext.request.contextPath}/user/new">create user</a>
    <% }%>

    <%-- Show alerts (fill properties "alertMsg" and optional "alertType"), if exists --%>
    <s:if test="%{alertMsg != null}" >
        <div class="alert alert-<s:property value="alertType" default="info" />">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <s:property escapeHtml="false" value="alertMsg" />
        </div>
    </s:if>
</center>
<br/><br/>


