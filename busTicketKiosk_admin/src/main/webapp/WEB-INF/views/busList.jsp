<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>버스 정보 페이지</h1>
	<div class="container" id="sch_div">
		<p>검색을 원하는 버스코드를 입력해주세요.</p>
		<input type="text" name="sch_txt">
		<button class="btn" name="sch_btn">버스검색하기</button>
	</div>
	<hr>
	<div class="container" id="list_div">
		<h2>버스 목록</h2>
		<table id="tbl" border="1">
			<thead>
				<tr>
					<th>버스코드</th>
					<th>좌석수</th>
					<th>등급</th>
					<th>회사</th>
					<th>번호판</th>
					<th>운전기사</th>
				</tr>
			</thead>
		</table>
	</div>
	<hr>
	<div class="container" id="reg_div">
		<h2>버스 등록</h2>
		<p>기존에 등록된 버스코드는 입력할 수 없습니다.</p>
		<table>
			<tr>
				<th>버스코드</th>
				<td>
					<input type="text" name="busNo">
				</td>
			</tr>
			<tr>
				<th>좌석수</th>
				<td>
					<input type="text" name="seat">
				</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<input type="text" name="grade">
				</td>
			</tr>
			<tr>	
				<th>회사</th>
				<td>
					<input type="text" name="company">
				</td>
			</tr>
			<tr>	
				<th>번호판</th>
				<td>
					<input type="text" name="plate">
				</td>
			</tr>
			<tr>	
				<th>운전기사</th>
				<td>
					<input type="text" name="driver">
				</td>
			</tr>
		</table>
		<br>
		<input type="button" value="버스등록" onclick="return regProcess()">
		<div id="regResult">등록 결과</div>
	</div>
	<br>
	
<script type="text/javascript" src="js/busList.js" ></script>
</body>
</html>