<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 매출 등록 화면</title>
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
int ma=0;
int ma1=0;
try{
	String sql="select max(custno),max(saleno) from money0727";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
		ma1=rs.getInt(2)+1;
	}else{
		System.out.println("조회 실패");
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<section class="sec1">
<br>
<h2>회원 매출 등록 화면</h2>
<br>
<hr>
<form name="form" method="post" action="insert_moneyProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">회원번호(자동생성)</th>
		<td>
			<input type="text" name="custno" value="<%=ma%>">
		</td>
</tr>
<tr>
	<th class="th1">판매번호(자동생성)</th>
		<td>
			<input type="text" name="saleno" value="<%=ma1%>">
		</td>
</tr>
<tr>
	<th class="th1">단가</th>
		<td>
			<input type="text" name="pcost">
		</td>
</tr>
<tr>
	<th class="th1">수량</th>
		<td>
			<input type="text" name="amount">
		</td>
</tr>
<tr>
	<th class="th1">가격</th>
		<td>
			<input type="text" name="price">
		</td>
</tr>
<tr>
	<th class="th1">상품코드</th>
		<td>
			<input type="text" name="pcode">
		</td>
</tr>
<tr>
	<th class="th1">판매일자</th>
		<td>
			<input type="text" name="sdate">
		</td>
</tr>


<tr>
	<td colspan="2" class="td1">
		<input type="button" value="등록" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
	</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>