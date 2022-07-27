<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 매출 정보 조회(회원번호별 집계)</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec1">
<br>
<h2>회원 매출 정보 조회(회원번호별 집계)</h2>
<hr>
<table border="1" class="tab2">
	<tr>
		<th class="th1">no</th>
		<th class="th1">상품코드</th>
		<th class="th1">상품명</th>
		<th class="th1">매출</th>
	</tr>
	<%
	int no=0;
	try{
		String sql="select n.pcode,p.pname,sum(n.price) from product0727 p,money0727 n where n.pcode=p.pcode group by  n.pcode,p.pname order by pcode";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String pcode=rs.getString(1);
			String pname=rs.getString(2);
			String price=rs.getString(3);
			no++;
			System.out.println("조회 성공");
		
	%>
	<tr>
		<td class="td1"><%=no %></td>
		<td class="td1"><%=pcode %></td>
		<td class="td1"><%=pname %></td>
		<td class="td1"><%=price %></td>
	</tr>
	<% 
	}
	
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
	%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='insert_money.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>