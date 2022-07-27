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
String pcost=request.getParameter("pcost");
String amount=request.getParameter("amount");
String price=request.getParameter("price");
String pcode=request.getParameter("pcode");
String sdate=request.getParameter("sdate");

try{
	String sql="update money0727 set pcost=?,amount=?,price=?,pcode=?,sdate=? where custno=? and saleno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(6, custno);
	pstmt.setString(7, saleno);
	pstmt.setString(1, pcost);
	pstmt.setString(2, amount);
	pstmt.setString(3, price);
	pstmt.setString(4, pcode);
	pstmt.setString(5, sdate);
	pstmt.executeUpdate();
	%>
	
		<script>
		alert("회원 매출 수정이 완료 되었습니다!");
		location.href="select_money.jsp";
		</script>
		<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>