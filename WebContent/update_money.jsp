<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 매출 수정 화면</title>
<script>
function check() {
	var doc=document.form;
	if(doc.custno.value==""){
		alert("회원번호를 입력하세요.");
		doc.custno.focus();
		return false;
	}if(doc.saleno.value==""){
		alert("판매번호를 입력하세요.");
		doc.saleno.focus();
		return false;
	}else{
		doc.submit();
	}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<%
String custno=request.getParameter("custno");
String saleno=request.getParameter("saleno");
try{
	String sql="select pcost,amount,price,pcode,to_char(sdate,'YYYY-MM-DD') from money0727 where custno=? and saleno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.setString(2, saleno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String pcost=rs.getString(1);
		String amount=rs.getString(2);
		String price=rs.getString(3);
		String pcode=rs.getString(4);
		String sdate=rs.getString(5);
	
%>
<section class="sec1">
<br>
<h2>회원 매출 수정 화면</h2>
<br>
<hr>
<form name="form" method="post" action="update_moneyProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">회원번호(자동생성)</th>
		<td>
			<input type="text" name="custno" value="<%=custno%>">
		</td>
</tr>
<tr>
	<th class="th1">판매번호(자동생성)</th>
		<td>
			<input type="text" name="saleno" value="<%=saleno%>">
		</td>
</tr>
<tr>
	<th class="th1">단가</th>
		<td>
			<input type="text" name="pcost" value="<%=pcost%>">
		</td>
</tr>
<tr>
	<th class="th1">수량</th>
		<td>
			<input type="text" name="amount" value="<%=amount%>">
		</td>
</tr>
<tr>
	<th class="th1">가격</th>
		<td>
			<input type="text" name="price" value="<%=price%>">
		</td>
</tr>
<tr>
	<th class="th1">상품코드</th>
		<td>
			<input type="text" name="pcode" value="<%=pcode%>">
		</td>
</tr>
<tr>
	<th class="th1">판매일자</th>
		<td>
			<input type="text" name="sdate" value="<%=sdate%>">
		</td>
</tr>


<tr>
	<td colspan="2" class="td1">
		<input type="button" value="수정" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
	</td>
</tr>
<%
	}else{
		System.out.println("조회 실패");
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>