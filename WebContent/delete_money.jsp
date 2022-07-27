<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String custno=request.getParameter("custno");
String saleno=request.getParameter("saleno");
try{
	String sql="delete from money0727 where custno=? and saleno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.setString(2, saleno);
	pstmt.executeUpdate();
	%>
	
		<script>
		alert("삭제 완료");
		location.href="select_money.jsp";
		</script>
		<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}
%>
</body>
</html>