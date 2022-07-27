<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈쇼핑 회원 수정 화면</title>
<script>
function check() {
	var doc=document.form;
	var chk=document.getElementsByName("goods")
	var cnt=0;
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked==true){
			cnt++;
			break;
		}
	}
	if(doc.custno.value==""){
		alert("회원번호를 입력하세요.");
		doc.custno.focus();
		return false;
	}if(doc.custname.value==""){
		alert("회원이름를 입력하세요.");
		doc.custname.focus();
		return false;
	}if(doc.address.value==""){
		alert("회원주소를 입력하세요.");
		doc.address.focus();
		return false;
	}if(doc.joindate.value==""){
		alert("가입일자를 입력하세요.");
		doc.joindate.focus();
		return false;
	}if(doc.grade.value==""){
		alert("고객등급을 입력하세요.");
		doc.grade.focus();
		return false;
	}if(doc.city.value==""){
		alert("가입일자를 입력하세요.");
		doc.city.focus();
		return false;
	}if(cnt==0){
		alert("관심상품을 입력하세요.");
		doc.goods.focus();
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
try{
	String sql="select custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city,goods from member0727 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String custname=rs.getString(1);
		String phone=rs.getString(2);
		String address=rs.getString(3);
		String joindate=rs.getString(4);
		String grade=rs.getString(5);
		String city=rs.getString(6);
		String goods=rs.getString(7);
		String gs[]=goods.split(",");
	
%>
<section class="sec1">
<br>
<h2>홈쇼핑 회원 수정 화면</h2>
<br>
<hr>
<form name="form" method="post" action="update_memberProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">회원번호(자동생성)</th>
		<td>
			<input type="text" name="custno" value="<%=custno%>">
		</td>
</tr>
<tr>
	<th class="th1">회원성명</th>
		<td>
			<input type="text" name="custname" value="<%=custname%>">
		</td>
</tr>
<tr>
	<th class="th1">회원전화</th>
		<td>
			<input type="text" name="phone" value="<%=phone%>">
		</td>
</tr>
<tr>
	<th class="th1">회원주소</th>
		<td>
			<input type="text" name="address" value="<%=address%>">
		</td>
</tr>
<tr>
	<th class="th1">가입일자</th>
		<td>
			<input type="text" name="joindate" value="<%=joindate%>">
		</td>
</tr>
<tr>
	<th class="th1">고객등급</th>
		<td>
			<select name="grade">
				<option value="A" <%=grade.equals("A")?"selected":"" %>>A : VIP</option>
				<option value="B" <%=grade.equals("B")?"selected":"" %>>B : 일반</option>
				<option value="C" <%=grade.equals("C")?"selected":"" %>>C : 직원</option>
			</select>
		</td>
</tr>
<tr>
	<th class="th1">도시코드</th>
		<td>
			<select name="city">
				<option value="01" <%=city.equals("01")?"selected":"" %>>01 : 서울</option>
				<option value="02" <%=city.equals("02")?"selected":"" %>>02 : 경기</option>
				<option value="10" <%=city.equals("10")?"selected":"" %>>10 : 대전</option>
				<option value="20" <%=city.equals("20")?"selected":"" %>>20 : 부산</option>
				<option value="30" <%=city.equals("30")?"selected":"" %>>30 : 광주</option>
				<option value="40" <%=city.equals("40")?"selected":"" %>>40 : 울산</option>
				<option value="50" <%=city.equals("50")?"selected":"" %>>50 : 대구</option>
				<option value="60" <%=city.equals("60")?"selected":"" %>>60 : 강원</option>
				<option value="70" <%=city.equals("70")?"selected":"" %>>70 : 경상</option>
				<option value="80" <%=city.equals("80")?"selected":"" %>>80 : 충청</option>
				<option value="90" <%=city.equals("90")?"selected":"" %>>90 : 제주</option>
			</select>
		</td>
</tr>
<tr>
	<th class="th1">관심상품</th>
		<td>
			<input type="checkbox" name="goods" value="의류" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("의류")){%>checked<%}}%>>의류
			<input type="checkbox" name="goods" value="식료품" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("식료품")){%>checked<%}}%>>식료품
			<input type="checkbox" name="goods" value="컴퓨터" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("컴퓨터")){%>checked<%}}%>>컴퓨터
			<input type="checkbox" name="goods" value="공산품" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("공산품")){%>checked<%}}%>>공산품
			<input type="checkbox" name="goods" value="관광" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("관광")){%>checked<%}}%>>관광
			<input type="checkbox" name="goods" value="전자제품" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("전자제품")){%>checked<%}}%>>전자제품
			<input type="checkbox" name="goods" value="건강제품" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("건강제품")){%>checked<%}}%>>건강제품
			<input type="checkbox" name="goods" value="운동기구" <%for(int i=0;i<gs.length;i++){if(gs[i].equals("운동기구")){%>checked<%}}%>>운동기구
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