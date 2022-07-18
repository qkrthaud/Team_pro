<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("login");
	String msg = "";
	session.setAttribute("msg", msg);
	out.println("<script type='text/javascript'>");
	out.println("alert('로그아웃 되었습니다.');");
	out.println("</script>");
	response.sendRedirect(request.getContextPath()+"/blog/blogForm.jsp");
%>