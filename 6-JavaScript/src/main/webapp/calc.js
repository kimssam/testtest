/* 객체 만드는 방법1 : 변수, 함수를 추가하는 방법*/
// 1. 빈 객체 생성
var calc = {};
// 2. 멤버변수 추가
calc.x = 0;
calc.y = 0;

// 3. 메소드 (=멤버함수) 추가
calc.setValue = function(p1, p2) {
	this.x = p1;
	this.y = p2;
}
calc.plus = function() {
	return this.x + this.y;
}
calc.minus = function() {
	return this.x - this.y;
}
calc.result = function() {
	var val1 = this.plus();
	var val2 = this.minus();
	document.write("<p>덧셈결과 : " + val1 + "</p>");
	document.write("<p>뺄셈결과 : " + val2 + "</p>");
}

/* 객체 만드는 방법2 : json 형태 */
// json : Javascriipt Object Notation (자바스크립트 객체 표현식)
// {이름: 데이터, 이름: 데이터}
var calc2 = {
	x: 0,
	y: 0,
	setValue: function(p1, p2) {		
		this.x = p1;
		this.y = p2;		
	},
	plus: function() {
		return this.x + this.y;
	},
	minus: function() {
		return this.x - this.y;
	},
	result: function() {
		var val1 = this.plus();
		var val2 = this.minus();
		document.write("<p>덧셈결과 : " + val1 + "</p>");
		document.write("<p>뺄셈결과 : " + val2 + "</p>");
	}	
};
























