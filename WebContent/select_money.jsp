<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 매출 정보 목록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec1">
<h2>회원 매출 정보 목록</h2>
<%
DecimalFormat fo=new DecimalFormat("###,###");
int cnt=0;
try{
	String sql="select count(*)from money0727";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>건의 매출정보가 있습니다.</div>
<hr>
<table border="1" class="tab2">
	<tr>
		<th class="th1">no</th>
		<th class="th1">회원번호</th>
		<th class="th1">회원이름</th>
		<th class="th1">판매번호</th>
		<th class="th1">단가</th>
		<th class="th1">수량</th>
		<th class="th1">가격</th>
		<th class="th1">상품코드</th>
		<th class="th1">상품명</th>
		<th class="th1">판매일자</th>
	</tr>
	<%
	int no=0;
	try{
		String sql="select n.custno,m.custname,n.saleno,n.pcost,n.amount,n.price,n.pcode,p.pname,to_char(n.sdate,'YYYY-MM-DD') from money0727 n, member0727 m,product0727 p where n.custno=m.custno and n.pcode=p.pcode";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String custno=rs.getString(1);
			String custname=rs.getString(2);
			String saleno=rs.getString(3);
			int pcost=rs.getInt(4);
			String amount=rs.getString(5);
			int price=rs.getInt(6);
			String pcode=rs.getString(7);
			String pname=rs.getString(8);
			String sdate=rs.getString(9);
		
			no++;
			System.out.println("조회 성공");
		
	%>
	<tr>
		<td class="td1"><%=no %></td>
		<td class="td1"><%=custno %></td>
		<td class="td1"><%=custname %></td>
		<td class="td1"><%=saleno %></td>
		<td class="td1"><%=fo.format(pcost)%></td>
		<td class="td1"><%=amount %></td>
		<td class="td1"><%=fo.format(price)%></td>
		<td class="td1"><%=pcode %></td>
		<td class="td1"><%=pname %></td>
		<td class="td1"><%=sdate %></td>
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