var xOp7Up,xOp6Dn,xIE4Up,xIE4,xIE5,xIE6,xNN4,xUA=navigator.userAgent.toLowerCase();

function xNum()
{
  for(var i=0; i<arguments.length; ++i){if(isNaN(arguments[i]) || typeof(arguments[i])!='number') return false;}
  return true;
}


function xStr(s)
{
  for(var i=0; i<arguments.length; ++i){if(typeof(arguments[i])!='string') return false;}
  return true;
}

function xClientWidth()
{
  var w=0;
  if(xOp6Dn) w=window.innerWidth;
  else if(document.compatMode == 'CSS1Compat' && !window.opera && document.documentElement && document.documentElement.clientWidth)
    w=document.documentElement.clientWidth;
  else if(document.body && document.body.clientWidth)
    w=document.body.clientWidth;
  else if(xDef(window.innerWidth,window.innerHeight,document.height)) {
    w=window.innerWidth;
    if(document.height>window.innerHeight) w-=16;
  }
  return w;
}

function xGetElementById(e)
{
  if(typeof(e)!='string') return e;
  if(document.getElementById) e=document.getElementById(e);
  else if(document.all) e=document.all[e];
  else e=null;
  return e;
}

function xGetElementsByAttribute(sTag, sAtt, sRE, fn)
{
  var a, list, found = new Array(), re = new RegExp(sRE, 'i');
  list = xGetElementsByTagName(sTag);
  for (var i = 0; i < list.length; ++i) {
    a = list[i].getAttribute(sAtt);
    if (!a) {a = list[i][sAtt];}
    if (typeof(a)=='string' && a.search(re) != -1) {
      found[found.length] = list[i];
      if (fn) fn(list[i]);
    }
  }
  return found;
}

function xTop(e, iY)
{
  if(!(e=xGetElementById(e))) return 0;
  var css=xDef(e.style);
  if(css && xStr(e.style.top)) {
    if(xNum(iY)) e.style.top=iY+'px';
    else {
      iY=parseInt(e.style.top);
      if(isNaN(iY)) iY=0;
    }
  }
  else if(css && xDef(e.style.pixelTop)) {
    if(xNum(iY)) e.style.pixelTop=iY;
    else iY=e.style.pixelTop;
  }
  return iY;
}

function initDigistLightbox() { dlbo = new digist_lightbox(); }

function digist_lightbox() {
	this.bLytebox = true;
	this.resizedOnly = false;
	this.slideInterval = 2000;
}

function xScrollTop(e, bWin)
{
  var offset=0;
  if (!xDef(e) || bWin || e == document || e.tagName.toLowerCase() == 'html' || e.tagName.toLowerCase() == 'body') {
    var w = window;
    if (bWin && e) w = e;
    if(w.document.documentElement && w.document.documentElement.scrollTop) offset=w.document.documentElement.scrollTop;
    else if(w.document.body && xDef(w.document.body.scrollTop)) offset=w.document.body.scrollTop;
  }
  else {
    e = xGetElementById(e);
    if (e && xNum(e.scrollTop)) offset = e.scrollTop;
  }
  return offset;
}

function xDef()
{
  for(var i=0; i<arguments.length; ++i){if(typeof(arguments[i])=='undefined') return false;}
  return true;
}
