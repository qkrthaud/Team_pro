<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	System.out.println(id);
	System.out.println(pwd);
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPwd(pwd);
	
	MemberDAO dao = new MemberDAO();
	dto = dao.loginChk(dto);
	String blogMsg = "";
	boolean check = false;
	if(dto != null){
		session.setAttribute("login", dto);
		blogMsg = dto.getName();
	}else{

	}
	session.setAttribute("check", check);
	session.setAttribute("msg", blogMsg);
	response.sendRedirect(request.getContextPath()+"/blog/blogForm.jsp");
%>