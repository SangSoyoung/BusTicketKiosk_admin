// 버스 목록 페이지 
//window.onload = listProcess;
window.addEventListener("load", listProcess);

let sch_txt = document.querySelector("input[name='sch_txt']");
sch_txt.addEventListener("keyup", function() {
  console.log("something")
});

let sch_btn = document.querySelector("input[name='sch_btn']");
sch_btn.addEventListener("click", function() {
  console.log("something")
});


// 버스 목록 출력
function listProcess() {

	const xhr = new XMLHttpRequest();
	xhr.onload = function() {
		
		var tbl = document.querySelector("#tbl");
		tbl.innerHTML = "<thead><tr><th>버스코드</th><th>좌석수</th><th>등급</th><th>회사</th><th>번호판</th><th>운전기사</th></tr></thead>"
		
		var json = JSON.parse(this.responseText);
		
		for(var i = 0; i < json.length; i++){
			
			var txt_busNo = document.createTextNode(json[i].busNo);
			var txt_seat = document.createTextNode(json[i].seat);
			var txt_grade = document.createTextNode(json[i].grade);
			var txt_company = document.createTextNode(json[i].company);
			var txt_plate = document.createTextNode(json[i].plate);
			var txt_driver = document.createTextNode(json[i].driver);
			
			var atag = document.createElement("a");
			atag.setAttribute("href", "busTimetable?busNo="+json[i].busNo);
			atag.appendChild(txt_busNo);
			
			var row = tbl.insertRow(-1);
			var cell_busNo = row.insertCell(0);
			var cell_seat = row.insertCell(1);
			var cell_grade = row.insertCell(2);
			var cell_company = row.insertCell(3);
			var cell_plate = row.insertCell(4);
			var cell_driver = row.insertCell(5);
			
			cell_busNo.appendChild(atag);
			cell_seat.appendChild(txt_seat);
			cell_grade.appendChild(txt_grade);
			cell_company.appendChild(txt_company);
			cell_plate.appendChild(txt_plate);
			cell_driver.appendChild(txt_driver);
		}
	}
	
	xhr.open("get", "getbusList", true);
	xhr.send();
};


// 버스 검색
function searchProcess() {

	const xhr = new XMLHttpRequest();
	xhr.onload = function() {
		
		var tbl = document.querySelector("#tbl");
		tbl.innerHTML = "<thead><tr><th>버스코드</th><th>좌석수</th><th>등급</th><th>회사</th><th>번호판</th><th>운전기사</th></tr></thead>"
		
		var json = JSON.parse(this.responseText);
		
		for(var i = 0; i < json.length; i++){
			
			var txt_busNo = document.createTextNode(json[i].busNo);
			var txt_seat = document.createTextNode(json[i].seat);
			var txt_grade = document.createTextNode(json[i].grade);
			var txt_company = document.createTextNode(json[i].company);
			var txt_plate = document.createTextNode(json[i].plate);
			var txt_driver = document.createTextNode(json[i].driver);
			
			var atag = document.createElement("a");
			atag.setAttribute("href", "busTimetable?busNo="+json[i].busNo);
			atag.appendChild(txt_busNo);
			
			var row = tbl.insertRow(-1);
			var cell_busNo = row.insertCell(0);
			var cell_seat = row.insertCell(1);
			var cell_grade = row.insertCell(2);
			var cell_company = row.insertCell(3);
			var cell_plate = row.insertCell(4);
			var cell_driver = row.insertCell(5);
			
			cell_busNo.appendChild(atag);
			cell_seat.appendChild(txt_seat);
			cell_grade.appendChild(txt_grade);
			cell_company.appendChild(txt_company);
			cell_plate.appendChild(txt_plate);
			cell_driver.appendChild(txt_driver);
		}
	}
	
	xhr.open("get", "searchBus?keyword="+encodeURI(sch_txt.value), true);
	xhr.send();
};



// 버스 등록
let putBusNo = document.querySelector("input[name='busNo']").value;
let putSeat = document.querySelector("input[name='seat']").value;
let putGrade = document.querySelector("input[name='grade']").value;
let putCompany = document.querySelector("input[name='company']").value;
let putPlate = document.querySelector("input[name='plate']").value;
let putDriver = document.querySelector("input[name='driver']").value;
let regResult = document.querySelector("#regResult");

function regProcess(){
	
	if(putBusNo == ''){
			alert("버스 코드를 입력해주세요~");
			return false;
	} 
		
	const xhr = new XMLHttpRequest();
	xhr.onload = function() {
		regResult.innerHTML = xhr.responseText;
		listProcess();
		putBusNo = "";
		putSeat = "";
		putGrade = "";
		putCompany = "";
		putPlate = "";
		putDriver = "";
		regResult = "";
	}
	xhr.open("get", "insertBus?busNo="+encodeURI(putBusNo)+"&seat="+encodeURI(putSeat)+"&grade="+encodeURI(grade)+"&company="+encodeURI(putCompany)+"&plate="+encodeURI(putPlate)+"&driver="+encodeURI(putDriver), true);
	xhr.send();
}
