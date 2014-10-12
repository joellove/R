// date picker의 서버 실행 위치 (끝에 / 붙임)
var calendarRoot = "/";

// 출력용
var months = new Array("1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월");
var weeks = new Array("일", "월", "화", "수", "목", "금", "토");
var alts = new Array("이전 해", "다음 해", "이전 달", "다음 달", "이번 달", "닫기", "오늘");
var buttons = new Array("images/arrow_left.gif", "images/arrow_right.gif", "images/arrow_left.gif", "images/arrow_right.gif", "images/today.gif", "images/close.gif");
var buttonWidths = new Array(5, 5, 5, 5, 13, 13);

// 카렌다를 버튼 아래에 출력하면 true, 버튼 위에 출력하면 false
isPlacedUnder = true;

// 카렌다의 폭
calendarWidth = 140;

// 날짜 출력 포맷
// yyyy : 4자리 년도
// yy : 2자리 년도
// mm : 월
// dd : 일
dayFormat = "yyyy-mm-dd";