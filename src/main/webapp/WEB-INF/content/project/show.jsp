<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Projects</title>
        <jsp:include page="/WEB-INF/layouts/head.jsp" />
    </head>
    <body>
        <jsp:include page="/WEB-INF/layouts/header.jsp" />
        <div class="container">
            <h1><s:property value="project.projectTitle" /></h1>
            <div class="well">
                <p class="well"><strong>ID: </strong> <s:property value="project.projectId" /></p>
                <p class="well"><strong>Project Active: </strong> <s:property value="project.projectActive" /></p>
                    <s:if test="%{project.studentId != null}">
                <p class="well"><strong>Assigned Student: </strong> <s:property value="project.studentId.userName" /></p>
                    </s:if> 
                    <s:else>
                <p class="well"><strong>* No student assigned *</strong> </p>
                    </s:else>
                <p class="well"><strong>Project Specialization: </strong> <s:property value="project.specId.specName" /></p>
                <p class="well"><strong>Grade: </strong> <s:property value="project.projectGrade" /></p>
                <p class="well"><strong>Start date: </strong> <s:date name="project.startDate" format="dd-MM-yyyy hh:mma" /></p>
                <p class="well"><strong>Due date: </strong> <s:date name="project.dueDate"  nice="true"/></p>
                <p class="well"><strong>Submission Date: </strong> <s:date name="project.subDate" format="dd-MM-yyyy hh:mma" /></p>
                <p class="well"><strong>Lecturer: </strong> <s:property value="project.lecturerId.userName" /></p>
                    <s:if test="%{project.projectFile != null}">
                <p class="well"><strong>Project PDF File: </strong> <a href="<s:property value="project.projectFile"  />" target="_blank" 
                                             title="NOTE: If you running this locally, instead of clicking this link directly you need to copy the link address and paste it in another tab. This is because most modern browsers prevent users from accessing files locally for security reasons.">
                            Download Project File
                        </a></p>
                    </s:if>
                    <s:else>
                <p  class="well"><strong>No Project PDF File had been uploaded</strong> </p>
                    </s:else>
                <br>
                <p><strong>Description:</strong>  
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <s:property  escapeHtml="false" value="project.projectDescription" />
                        </div>
                    </div>

                </p>
            <h4><a href="${pageContext.request.contextPath}/project/<s:property value="id" />/edit">Edit  <i class="fa fa-pencil-square-o"></i></a></h4>
            </div>
            <h3><a href="${pageContext.request.contextPath}/project"><p style="position: fixed; bottom: 20px; right: 20px;"><span class="fa fa-chevron-left"></span> Back</p></a></h3>

            
            <form action="${pageContext.request.contextPath}/project/<s:property value="id" />">
                <input name="_method" type="hidden" value="delete" />
                <button  onclick="return confirm('Are you sure you want to delete?')" 
                         formmethod="post" type="submit" class="btn btn-danger"><span class="fa fa-trash"></span>  Delete</button>
            </form>

            <h3>Comments (<s:property value="comments.size" />)</h3>
            <ol>
                <s:iterator value="comments">
                    <li>
                        <ul>
                            <li>Date Commented: <s:date name="top.dateCreated" format="dd-MM-yyyy hh:mma" /></li>
                            <li>Name: <s:property value="top.userId.userName" /></li>
                            <li>Content: <s:property value="top.commentDescription" /></li>
                        </ul>
                    </li>
                    <br/>
                </s:iterator>
            </ol>
        </div>
        <jsp:include page="/WEB-INF/layouts/footer.jsp" />
    </body>
</html>
