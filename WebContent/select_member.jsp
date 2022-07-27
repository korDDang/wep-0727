<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 목록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec1">
<h2>회원 정보 목록</h2>
<%
int cnt=0;
try{
	String sql="select count(*)from member0727";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>명의 회원이 있습니다</div>
<hr>
<table border="1" class="tab2">
	<tr>
		<th class="th1">no</th>
		<th class="th1">회원번호</th>
		<th class="th1">회원성명</th>
		<th class="th1">전화번호</th>
		<th class="th1">주소</th>
		<th class="th1">가입일자</th>
		<th class="th1">고객등급</th>
		<th class="th1">거주지역</th>
		<th class="th1">관심상품</th>
		<th class="th1">구분</th>
	</tr>
	<%
	int no=0;
	try{
		String sql="select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city,goods from member0727";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String custno=rs.getString(1);
			String custname=rs.getString(2);
			String phone=rs.getString(3);
			String address=rs.getString(4);
			String joindate=rs.getString(5);
			String grade=rs.getString(6);
			switch(grade){
			case "A" : grade="VIP";
			break;
			case "B" : grade="일반";
			break;
			case "C" : grade="직원";
			break;
			}
			String city=rs.getString(7);
			switch(city){
			case "01" : city="서울";
			break;
			case "02" : city="경기";
			break;
			case "10" : city="대전";
			break;
			case "20" : city="부산";
			break;
			case "30" : city="광주";
			break;
			case "40" : city="울산";
			break;
			case "50" : city="대구";
			break;
			case "60" : city="강원";
			break;
			case "70" : city="경상";
			break;
			case "80" : city="충청";
			break;
			case "90" : city="제주";
			break;
			}
			String goods=rs.getString(8);
			no++;
			System.out.println("조회 성공");
		
	%>
	<tr>
		<td class="td1"><%=no %></td>
		<td class="td1"><a href="update_member.jsp?custno=<%=custno %>"><%=custno %></a></td>
		<td class="td1"><%=custname %></td>
		<td class="td1"><%=phone %></td>
		<td class="td1"><%=address %></td>
		<td class="td1"><%=joindate %></td>
		<td class="td1"><%=grade %></td>
		<td class="td1"><%=city %></td>
		<td class="td1"><%=goods %></td>
		<td class="td1"><a href="delete_member.jsp?custno=<%=custno %>">삭제</a></td>
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
<div class="td1"><input type="button" value="작성" onclick="location.href='insert_member.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>