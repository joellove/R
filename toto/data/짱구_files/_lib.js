
String.prototype.trim = function()
{
 return this.replace(/(^\s*)|(\s*$)/gi, "");
}
/*

function totopbottom() {
if (document.body.scrollTop == 0) {
window.scrollTo(0,document.body.scrollHeight);
} else {
window.scrollTo(0,0);
}
}
function topbottom() {
document.body.ondblclick = totopbottom;
}

*/

function CheckCart(v) {
	  var urls = '/action/ajax_cart_action.php';
	  var parm = '&action=Loading&v='+v;
	  new ajax.xhr.Request( urls , parm, GameCartCallback  , "GET" );
	}

function is_numeric( v, o ) {
  var chk = v.replace(/[^.0-9]/g,'');
  if( v != chk ) { window.alert('숫자 또는 . 만 입력해주세요.'); o.value = chk; return false; }
}

function is_numericbar( v, o ) {
  var chk = v.replace(/[^+-.0-9]/g,'');
  if( v != chk ) { window.alert('숫자 또는 . - 만 입력해주세요.'); o.value = chk; return false; }
}

function is_onlynumeric( v, o ) {
  var chk = v.replace(/[^0-9]/g,'');
  if( v != chk ) { window.alert('숫자만 입력해주세요.'); o.value = chk; return false; }
}

function is_banknumeric( v, o ) {
  var chk = v.replace(/[^-0-9]/g,'');
  if( v != chk ) { window.alert('숫자 또는 - 만 입력해주세요.'); o.value = chk; return false; }
}

function checkPointorMoney(v) {
  var pt = /[0-9]+0{2}/;
  return pt.test(v);

}

function checkEmail(v) {
  var pt = /[a-zA-Z\d\-\.]+@([a-zA-Z\d\-]+(\.[a-zA-Z\d\-]{2,4})+)/;
  return pt.test(v);
}

function checkIDPass(v) {
  var chk = v.replace(/[^a-zA-Z0-9]/g,'');
  var pt = /[a-zA-Z0-9]{4,16}/;
  if( v == chk && pt.test(v) ) return true;
  else return false;
}

function LogIn() {
  var f = document.HiddenActionForm;

  var login_id        = document.getElementById( "login_id" );
  var login_pass      = document.getElementById( "login_pass" );

		var str="select ,insert ,update ,delete ,merge ,commit,rollback,create ,alter ,drop ,truncate ,grant ,revoke ,union ,alter ,and ,or ,--,'";
		var str = str.split(",");
		var sz = str.length;
		   
		var val = login_id.value;

		val = val.toLowerCase(); //대문자->소문자로 변환
		   
		for(var i=0; i<sz; i++)
		{
			if(val.indexOf(str[i],0) > -1){
			//if(val.indexOf(str[i])!=-1){
				   alert(str[i]);
				   alert(val);
				   alert("잘못된값입니다");
				   return false;
				   break;
				}
		}


  if ( login_id.value.trim() == "" || !checkIDPass(login_id.value.trim()) ) {
    alert("'회원아이디'를 4~16자리로 입력해주세요.(영문대,소문자 및 숫자만 허용)");
    login_id.focus();
  } else if ( login_pass.value.trim() == "" || !checkIDPass(login_pass.value.trim()) ) {
    alert("'비밀번호'를 4~16자리로 입력해주세요.(영문대,소문자 및 숫자만 허용)");
    login_pass.focus();
  } else {
    f.HAF_Value_0.value = "MemberLogin";
    f.HAF_Value_1.value = login_id.value.trim();
    f.HAF_Value_2.value = login_pass.value.trim();

    f.method = "POST";
    f.action = "/action/member_action.php";
    f.submit();
  };
}

function LogOut() {
  var f = document.HiddenActionForm;
  f.HAF_Value_0.value = "MemberLogout";
  f.method = "POST";
  f.action = "/action/member_action.php";
  f.submit();
}

function ALogOut() {
  var f = document.HiddenActionForm;
  f.HAF_Value_0.value = "AdminLogout";
  f.method = "POST";
  f.action = "/action/member_action.php";
  f.submit();
}

function ChargeRequestCancel( k ) {
  if ( confirm("충전 요청을 취소하시겠습니까?") ) {
    var f = document.HiddenActionForm;
    f.HAF_Value_0.value = "RequestMoneyChargeCancel";
    f.HAF_Value_1.value = k;
    f.method = "POST";
    f.action = "/action/money_action.php";
    f.submit();
  };
}

function ChargeRequestDelete( k ) {
	  if ( confirm("충전 요청을 삭제하시겠습니까?") ) {
		    var f = document.HiddenActionForm;
		    f.HAF_Value_0.value = "RequestMoneyChargeDelete";
		    f.HAF_Value_1.value = k;
		    f.method = "POST";
		    f.action = "/action/money_action.php";
		    f.submit();
		  };
}

function ExchangeRequestDelete( k ) {
	  if ( confirm("환전 요청을 삭제하시겠습니까?") ) {
		    var f = document.HiddenActionForm;
		    f.HAF_Value_0.value = "RequestMoneyExchangeDelete";
		    f.HAF_Value_1.value = k;
		    f.method = "POST";
		    f.action = "/action/money_action.php";
		    f.submit();
		  };
}

function BetHistoryDelete( k ) {
	  if ( confirm("베팅 내역을 삭제하시겠습니까?") ) {
		    var f = document.HiddenActionForm;
		    f.HAF_Value_0.value = "BetHistoryDelete";
		    f.HAF_Value_1.value = k;
		    f.method = "POST";
		    f.action = "/action/money_action.php";
			//alert(f.HAF_Value_1.value);
		    f.submit();
		  };
}

function BoardReplyWrite( b_key ) {
  var f = document.HiddenActionForm;

  var comment = document.getElementById( "comment" );
  var brnick = document.getElementById( "brnick" );

  if ( comment.value.trim() == "" ) {
    alert("내용을 입력해 주세요.");
    comment.focus();
  } else if ( confirm("등록하시겠습니까?") ) {
    f.HAF_Value_0.value = "BoardReplyWrite";
    f.HAF_Value_1.value = b_key;
    f.HAF_Value_2.value = comment.value.replace(/\n/g, "<br />").trim();
    f.HAF_Value_3.value = brnick.value.trim();
    f.method = "POST";
    f.action = "/action/board_action.php";
    f.submit();
  };
}

function BoardReplyDelete( b_key, br_key ,auth ) {
  var f = document.HiddenActionForm;
  if ( confirm("삭제하시겠습니까?") ) {
    f.HAF_Value_0.value = "BoardReplyDelete";
    f.HAF_Value_1.value = b_key;
    f.HAF_Value_2.value = br_key;
    f.HAF_Value_3.value = auth;

    f.method = "POST";
    f.action = "/action/board_action.php";
    f.submit();
  };
}

function BoardDelete( b_key, vars, auth ) {
  var f = document.HiddenActionForm;
  if ( confirm("삭제하시겠습니까?") ) {
    f.HAF_Value_0.value = "BoardDelete";
    f.HAF_Value_1.value = b_key;
    f.HAF_Value_2.value = vars;
    f.HAF_Value_3.value = auth;

    f.method = "POST";
    f.action = "/action/board_action.php";
    f.submit();
  };
}

function BoardGameResultWrite123( bg_key ) {
    location.href = "/board/board_write.php?tn=betting&bgkey=" + bg_key;
};

function BoardGameResultWrite1234( bg_key ) {
  var f = document.HiddenActionForm;
  if ( confirm("베팅정보를 등록하시겠습니까?") ) {
    f.HAF_Value_0.value = "BoardGameResultWrite123";
    f.HAF_Value_1.value = bg_key;

    f.method = "POST";
    f.action = "/action/board_action.php";
    f.submit();
  };
};

function comma(n) { 
    var reg = /(^[+-]?\d+)(\d{3})/; 
    n += ''; 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2'); 
    return n; 
} 

function CalcCart( price ) {
  if ( price != "" ) {
    var BettingQuota = document.getElementById( "BettingQuota" );
    var BettingQuotaMoney = document.getElementById( "BettingQuotaMoney" );
    var BettingPrice = parseInt(parseFloat(BettingQuota.innerHTML) * price);
    //if ( BettingPrice > 3000000 ) BettingPrice = 3000000;
    BettingQuotaMoney.innerHTML = comma(BettingPrice);
	document.getElementById( "BetQuota" ).value = BettingPrice;
  };
}

function CalcCart1(val1) {
    var BettingQuota = document.getElementById( "BettingQuota" );
	var BettingMoney = document.getElementById( "BettingMoney" );
    var BettingQuotaMoney = document.getElementById( "BettingQuotaMoney" );
    var BettingPrice = parseInt( val1 / BettingQuota.innerHTML);
    //if ( BettingPrice > 3000000 ) BettingPrice = 3000000;
    BettingQuotaMoney.innerHTML = comma(parseInt( BettingPrice * BettingQuota.innerHTML));
    BettingMoney.value = BettingPrice;
	document.getElementById( "BetQuota" ).value = BettingPrice * BettingQuota.innerHTML;
}

function GameCartDelete ( cgl_key ) {
  if ( cgl_key != "" ) {
    var BettingMoney = document.getElementById( "BettingMoney" ).value;
    var urls = '/action/ajax_cart_action.php';
    var parm = '&action=DeleteCart&cgl_key=' + cgl_key + '&g_price=' + BettingMoney;
    new ajax.xhr.Request( urls , parm, GameCartCallback  , "GET" );
  };
}

function GameCartAllDelete () {
  var BettingMoney = document.getElementById( "BettingMoney" ).value;
  var urls = '/action/ajax_cart_action.php';
  var parm = '&action=AllDeleteCart&g_price=' + BettingMoney;
  new ajax.xhr.Request( urls , parm, GameCartCallback  , "GET" );
}


function GameCartInsert ( g_key, g_result, g1, g2 ) {
  if ( g_key != "" ) {
    var BettingMoney = document.getElementById( "BettingMoney" ).value;
	var gtype = "";
	if(g1 == "Full" && g2 == "WDL") gtype = "A";
	if(g1 == "Full" && g2 == "Handicap") gtype = "B";
	if(g1 == "Special") gtype = "C";
    var urls = '/action/ajax_cart_action.php';
    var parm = '&action=InsertCart&g_key=' + g_key + '&g_result=' + g_result +'&g_price=' + BettingMoney +'&gtype=' + gtype;
    new ajax.xhr.Request( urls , parm, GameCartCallback  , "GET" );
  };
}

function GameCartLoading() {
  var urls = '/action/ajax_cart_action.php';
  var parm = '&action=Loading&v=1';
  new ajax.xhr.Request( urls , parm, GameCartCallback  , "GET" );
};

function GameCartCallback (req) {
    if (req.readyState == 4) {
      if (req.status == 200) {
        GameCartRefresh( req.responseText );
        GameCartAllListBlank();
        GameCartCheckedListLoading();
      } else {
        alert("에러 발생: "+req.status);
      }
    }
}

function GameCartRefresh( _html ) {
  var alwayStalker = document.getElementById( "alwayStalker" );
  alwayStalker.innerHTML = _html;
}

function GameCartCheckedList( g_key , g_result) {
  if ( g_key && g_result) {
    var g_win = document.getElementById( g_key + "_Win" );
    var g_draw = document.getElementById( g_key + "_Draw" );
    var g_lose = document.getElementById( g_key + "_Lose" );
    var g_handiwin = document.getElementById( g_key + "_HandiWin" );
    var g_handilose = document.getElementById( g_key + "_HandiLose" );
    var g_under = document.getElementById( g_key + "_Under" );
    var g_over = document.getElementById( g_key + "_Over" );
    var g_odd = document.getElementById( g_key + "_Odd" );
    var g_even = document.getElementById( g_key + "_Even" );

    /*if ( g_win ) g_win.bgColor = "#000000";
    if ( g_draw ) g_draw.bgColor = "#000000";
    if ( g_lose ) g_lose.bgColor = "#000000";
    if ( g_handiwin ) g_handiwin.bgColor = "#000000";
    if ( g_handilose ) g_handilose.bgColor = "#000000";
    if ( g_under ) g_under.bgColor = "#000000";
    if ( g_over ) g_over.bgColor = "#000000";
    if ( g_odd ) g_odd.bgColor = "#000000";
    if ( g_even ) g_even.bgColor = "#000000";*/

    if ( g_win ) g_win.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_draw ) g_draw.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_lose ) g_lose.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_handiwin ) g_handiwin.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_handilose ) g_handilose.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_under ) g_under.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_over ) g_over.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_odd ) g_odd.style.backgroundImage = "url('/images/game_list_bg.gif')";
    if ( g_even ) g_even.style.backgroundImage = "url('/images/game_list_bg.gif')";

    if ( g_win ) g_win.style.color = "#ffffff";
    if ( g_draw ) g_draw.style.color = "#ffffff";
    if ( g_lose ) g_lose.style.color = "#ffffff";
    if ( g_handiwin ) g_handiwin.style.color = "#ffffff";
    if ( g_handilose ) g_handilose.style.color = "#ffffff";
    if ( g_under ) g_under.style.color = "#ffffff";
    if ( g_over ) g_over.style.color = "#ffffff";
    if ( g_odd ) g_odd.style.color = "#ffffff";
    if ( g_even ) g_even.style.color = "#ffffff";

    /*if ( g_win ) g_win.background = "/images/game_list_bg.gif";
    if ( g_draw ) g_draw.background = "/images/game_list_bg.gif";
    if ( g_lose ) g_lose.background = "/images/game_list_bg.gif";
    if ( g_handiwin ) g_handiwin.background = "/images/game_list_bg.gif";
    if ( g_handilose ) g_handilose.background = "/images/game_list_bg.gif";
    if ( g_under ) g_under.background = "/images/game_list_bg.gif";
    if ( g_over ) g_over.background = "/images/game_list_bg.gif";
    if ( g_odd ) g_odd.background = "/images/game_list_bg.gif";
    if ( g_even ) g_even.background = "/images/game_list_bg.gif";*/

    var g_result =  document.getElementById( g_key + "_" + g_result );
    //if ( g_result) g_result.bgColor = "#35B4FF";
	if ( g_result) {
		g_result.style.backgroundImage = "url('/images/game_list_bg1.gif')";
		g_result.style.color = "#181310";
	}
	//if ( g_result) g_result.background = "/images/game_list_bg1.gif";
  };
}

function GameCartCheckedListLoading() {
  var urls = '/action/ajax_cart_action.php';
  var parm = '&action=CheckedList';
  new ajax.xhr.Request( urls , parm, GameCartCheckedListLoadingback  , "GET" );
}

function GameCartCheckedListLoadingback (req) {
    if (req.readyState == 4) {
      if (req.status == 200) {
        eval ( req.responseText );
      } else {
        alert("에러 발생: "+req.status);
      }
    }
}

function GameCartAllListBlank() {
  var obj = document.getElementById("gamelist");
  if ( obj ) SearchTag( obj );
}

function SearchTag( obj ) {

  var _pattern =/Win|Draw|Lose|Under|Over/
  for( var i=0; i < obj.childNodes.length; i++ ) {
    var cnode = obj.childNodes.item(i);
//alert(i);
    if( cnode.id ) {
      if( _pattern.test( cnode.id ) ) {
		  cnode.style.backgroundImage = "url('/images/game_list_bg.gif')";
		  cnode.style.color = "#ffffff";
	  }
      //if( _pattern.test( cnode.id ) ) cnode.bgColor='#000000';
    };
    if( cnode.childNodes.length > 0 ) SearchTag( cnode );
  }
}

function GameCartBuy( cnt, val1, val2 , val3) {
  var BettingMoney = document.getElementById( "BettingMoney" );
  var BetQuota = document.getElementById( "BetQuota" );
  var f = document.HiddenActionForm;
  //var bet_idchk = 'val3';
   if ( cnt < 1 ) {//cnt - 폴더수 , val1 - 1회배팅금액 , va2 -단폴더1회
    alert("구매할 게임이 없습니다.");
  } else if (val3==0)
  {
	  alert("해당 아이디로 배팅하실수 없습니다.\n고객센터로 문의 바랍니다.");
	   BettingMoney.focus();
  } else if ( BettingMoney.value < 4999 ) {
    alert("최소 배팅금액은 5000원 부터 입니다.");
    BettingMoney.focus();
  } else if ( cnt == 1 && (BettingMoney.value > val1) && val1 > 0) {
    alert("단폴더 제한금액은 "+val1+" 입니다.");
    BettingMoney.focus();
  } else if ( BettingMoney.value > val2  && val2 > 0) {
    alert("1회 배팅제한금액은 "+val2+" 입니다.");
    BettingMoney.focus();
  } else if ( confirm("선택한 게임을 구매하시겠습니까?\n경기 배당률이 변경된 경우도 있습니다. 구매전 꼭 확인하세요.") ) {
    f.HAF_Value_0.value = "BuyCart";
    f.HAF_Value_1.value = BettingMoney.value;
    f.HAF_Value_2.value = BetQuota.value;

    f.method = "POST";
    f.action = "/action/ajax_cart_action.php";
    f.submit();
  };
}

/*function GameCartBuyCancel( cnt1, cnt2 ) {
  var BettingMoney = document.getElementById( "BettingMoney" );
  var f = document.HiddenActionForm;
  if ( confirm("배팅취소는 하루에 한번만 5분이내에 할 수 있습니다.\n배팅을 취소하시겠습니까?") ) {
    f.HAF_Value_0.value = "BuyCartCancel";
    f.HAF_Value_1.value = cnt1;
	f.HAF_Value_2.value = cnt2;

    f.method = "POST";
    f.action = "/action/ajax_cart_action.php";
    f.submit();
  }
}*/

function GameCartBuyCancel( cnt1, cnt2, t ) {
	
  var BettingMoney = document.getElementById( "BettingMoney" );
  var f = document.HiddenActionForm;
  var d  = new Date();
  var s = 
  leadingZeros(d.getFullYear(), 4) + '-' +
  leadingZeros(d.getMonth() + 1, 2) + '-' +
  leadingZeros(d.getDate(), 2) + ' ' +
  
  leadingZeros(d.getHours(), 2) + ':' +
  leadingZeros(d.getMinutes(), 2);
 
  if(t<=s){
	  alert('배팅취소 가능시간이 아닙니다. 배팅취소는 경기 시작전 1시간이내에만 가능합니다.');
	  location.reload();
  } else {
  if ( confirm("배팅취소는 하루에 한번만 경기시작전 1시간이내에 할 수 있습니다.\n배팅을 취소하시겠습니까?") ) {
    f.HAF_Value_0.value = "BuyCartCancel";
    f.HAF_Value_1.value = cnt1;
	f.HAF_Value_2.value = cnt2;

    f.method = "POST";
    f.action = "/action/ajax_cart_action.php";
    f.submit();
  }
  }
}


function leadingZeros(n, digits) {
 // 1 -> 01 과 같이 변경하기
 var zero = '';
 n = n.toString();
 
 if (n.length < digits) {
  for (i = 0; i < digits - n.length; i++)
  zero += '0';
 }
 return zero + n;
}

function SearchGame( f, sch_gtype1, sch_gtype2 ) {
  var sch_league  = document.getElementById( "sch_league" ).value.trim();
  var sch_sdate   = document.getElementById( "sch_sdate" ).value.trim();
  var sch_edate   = document.getElementById( "sch_edate" ).value.trim();

  location.href = "./" + f + ".php?sch_league=" + sch_league + "&sch_sdate=" + sch_sdate + "&sch_edate=" + sch_edate + "&sch_gtype1=" + sch_gtype1 + "&sch_gtype2=" + sch_gtype2;
}

	function chktag( v, o ) {
		var chk = v.replace(/[<>]/g,'');
		if( v != chk ) { window.alert('<>기호를 사용할수없습니다.'); o.value = chk; return false; }
	}