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
	String sql="insert into money0727 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.setString(2, saleno);
	pstmt.setString(3, pcost);
	pstmt.setString(4, amount);
	pstmt.setString(5, price);
	pstmt.setString(6, pcode);
	pstmt.setString(7, sdate);
	pstmt.executeUpdate();
	%>
	
		<script>
		alert("회원 매출 등록이 완료 되었습니다!");
		location.href="select_money.jsp";
		</script>
		<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>