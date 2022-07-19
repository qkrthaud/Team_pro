<%@page import="blogmember.BlogDTO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	String name = (String)pageContext.getAttribute("name");
	
	dto = dao.getDTO(name);
	
	BlogDTO bdto = new BlogDTO();
	int tnum = Integer.parseInt(request.getParameter("tNum"));
	out.print(dto.getName());
	out.print(dto.getId());
	out.print(dto.getNum());
	bdto.setTnum(tnum);
	bdto.setTitle(request.getParameter("contenttitle"));
	bdto.setContent(request.getParameter("contentmain"));
	
 	dao.blogContentInsert(dto, bdto);
 	
	response.sendRedirect(request.getContextPath()+"/blog/blogForm.jsp");
	
	/* 게시물 띄우기 구현 */
%>