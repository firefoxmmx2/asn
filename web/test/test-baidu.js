(
function(){
var L=navigator.userAgent.indexOf("MSIE")!=-1&&!window.opera;
var S=(document.compatMode=="BackCompat");

function H(C){return document.getElementById(C)}
function J(C){return document.createElement(C)}
function O(G,U,C){if(L){G.attachEvent("on"+U,(
function(V){return 
function(){C.call(V)}})(G))}else{G.addEventListener(U,C,false)}}
function M(C){if(L){C.returnValue=false}else{C.preventDefault()}}
function P(C,U){var V=document.styleSheets;
if(!V||V.length<=0){var G=document.createElement("STYLE");
G.type="text/css";
var W=document.getElementsByTagName("HEAD")[0];
W.appendChild(G)}V=document.styleSheets;
V=V[V.length-1];
if(L){V.addRule(C,U)}else{V.insertRule(C+" { "+U+" }",V.cssRules.length)}}
function F(G){var U=document.forms[0];
for(var V in G){if(!N(V)){U.appendChild(C(V,G[V]))}else{N(V).value=G[V]}}
function C(W,Y){var X=J("INPUT");
X.type="hidden";
X.name=W;
X.id="bdsug_ipt_"+W;
X.value=Y;
return X}}
function N(V){var U=document.forms[0];
var G=false;
var C=U.getElementsByTagName("INPUT");
for(var W=0;
W<C.length;
W++){if(V==C[W].getAttribute("name")){G=C[W];
return G}else{G=false}}}
function K(G){var U=document.forms[0];
for(var C in G){if(C=="f"){if(N("f")){if(N("f").id=="bdsug_ipt_f"){U.removeChild(H("bdsug_ipt_f"))}else{N("f").value="8"}}}else{if(H("bdsug_ipt_"+C)){U.removeChild(H("bdsug_ipt_"+C))}}}}if(typeof window.baidu!="object"||window.baidu==null){window.baidu={}}baidu.sug={};
baidu.sugkeywatcher={};
var I=(
function(){
function C(Y){var W=this.__MSG_QS__;
if(!W[Y]){W[Y]=[]}for(var X=1,U=arguments.length,V;
X<U;
X++){W[Y].push(arguments[X])}}
function G(V){var W=this.__MSG_QS__[V.type];
if(W==null){return }for(var X=0,U=W.length;
X<U;
X++){W[X].rm(V)}}return{ini:
function(U){U.__MSG_QS__={};
U.on=C;
U.dm=G;
return U}}})();
var E=(
function(){var W=H("kw");
var C;
var g=0;
var e=0;
var U="";
var b="";
var f;
var Z=false;
var X=true;

function h(){if(X){E.dm({type:"start"});
X=false}}
function c(j){if(X){E.dm({type:"start"});
X=false}j=j||window.event;
if(j.keyCode==9||j.keyCode==27){E.dm({type:"hide_div"})}if(j.keyCode==13){M(j);
E.dm({type:"key_enter"})}if(C.style.display!="none"){if(j.keyCode==38){M(j);
E.dm({type:"key_up"})}if(j.keyCode==40){E.dm({type:"key_down"})}}else{if(j.keyCode==38||j.keyCode==40){E.dm({type:"need_data",wd:W.value})}}}
function G(){var j=W.value;
if(j==U&&j!=""&&j!=b&&j!=f){if(e==0){e=setTimeout(
function(){E.dm({type:"need_data",wd:j})},100)}}else{clearTimeout(e);
e=0;
U=j;
if(j==""){E.dm({type:"hide_div"})}if(b!=W.value){b=""}}}
function i(){g=setInterval(G,10)}
function Y(){clearInterval(g)}
function a(){if(Z){window.event.cancelBubble=true;
window.event.returnValue=false;
Z=false}}
function V(j){W.blur();
W.setAttribute("autocomplete",j);
W.focus()}W.setAttribute("autocomplete","off");
var d=false;
baidu.sugkeywatcher.on=
function(){if(!d){if(L){W.attachEvent("onkeydown",c)}else{W.addEventListener("keydown",c,false)}d=true}};
baidu.sugkeywatcher.off=
function(){if(d){if(L){W.detachEvent("onkeydown",c)}else{W.removeEventListener("keydown",c,false)}d=false}};
baidu.sugkeywatcher.on();
O(W,"mousedown",h);
O(W,"beforedeactivate",a);
return I.ini({rm:
function(j){switch(j.type){case"div_ready":C=j.sdiv;
b=W.value;
i();
break;
case"clk_submit":Y();
W.blur();
W.value=j.wd;
break;
case"ent_submit":Y();
W.blur();
break;
case"key_select":f=j.selected;
break;
case"close":Y();
V("on");
break;
case"mousedown_tr":Z=true;
break}}})})();
var T=(
function(){var e;
var X=H("kw");
var i;
var a=-1;
var C;
var j;
var l;

function k(){var m=i.rows;
for(var U=0;
U<m.length;
U++){m[U].className="ml"}}
function b(){if(typeof (i)!="undefined"&&i!=null&&e.style.display!="none"){var m=i.rows;
for(var U=0;
U<m.length;
U++){if(m[U].className=="mo"){return[U,m[U].cells[0].innerHTML]}}}return[-1,""]}
function f(){if(L){l.style.display="none"}e.style.display="none"}
function G(){k();
this.className="mo"}
function Y(U){T.dm({type:"mousedown_tr"});
if(!L){U.stopPropagation();
U.preventDefault();
return false}}
function Z(U){var m=U;
return 
function(){var n=C[m];
f();
T.dm({type:"clk_submit",oq:H("kw").value,wd:n,rsp:m})}}
function c(U){U=U||window.event;
M(U);
T.dm({type:"close"});
f();
(new Image()).src="http://s.baidu.com/w.gif?fm=suggestion&title=%B9%D8%B1%D5&t="+new Date().getTime()}
function V(){var U=[X.offsetWidth,X.offsetHeight];
e.style.width=((L&&S)?U[0]:U[0]-2)+"px";
e.style.top=((L&&S)?U[1]:U[1]-1)+"px";
e.style.display="block";
if(L){l.style.top=((L&&S)?U[1]:U[1]-1)+"px";
l.style.width=((L&&S)?U[0]:U[0]-2)+"px"}}
function g(){i=J("TABLE");
i.id="st";
i.cellSpacing=0;
i.cellPadding=2;
var p=J("tbody");
i.appendChild(p);
for(var U=0,m=C.length;
U<m;
U++){var o=p.insertRow(-1);
O(o,"mouseover",G);
O(o,"mouseout",k);
O(o,"mousedown",Y);
O(o,"click",Z(U));
var n=o.insertCell(-1);
n.innerHTML=C[U].replace(/&/g,"&amp;
")}e.innerHTML="";
e.appendChild(i);
V();
if(L){l.style.display="block";
l.style.left=0+"px";
l.style.top=X.offsetHeight+"px";
l.style.width=X.offsetWidth+"px";
l.style.height=e.offsetHeight-10+"px"}}
function W(){a=b()[0];
if(a==-1){T.dm({type:"submit"})}else{T.dm({type:"ent_submit",oq:j,wd:b()[1],rsp:a})}}
function h(){a=b()[0];
k();
if(a==0){T.dm({type:"key_select",selected:""});
H("kw").value=j;
a--;
K({oq:j,sug:C[a],n:1,rsp:a,f:3})}else{if(a==-1){a=C.length}a--;
var U=i.rows[a];
U.className="mo";
T.dm({type:"key_select",selected:C[a]});
H("kw").value=C[a];
F({oq:j,sug:C[a],n:1,rsp:a,f:3})}}
function d(){a=b()[0];
k();
if(a==C.length-1){T.dm({type:"key_select",selected:""});
H("kw").value=j;
a=-1;
K({oq:j,sug:C[a],n:1,rsp:a,f:3})}else{a++;
var U=i.rows[a];
U.className="mo";
T.dm({type:"key_select",selected:C[a]});
H("kw").value=C[a];
F({oq:j,sug:C[a],n:1,rsp:a,f:3})}}return I.ini({rm:
function(U){switch(U.type){case"div_ready":e=U.sdiv;
l=U.frm;
break;
case"give_data":j=U.data.q;
C=U.data.s;
if(C.length!=0){g()}else{f()}break;
case"key_enter":W();
break;
case"key_up":h();
break;
case"key_down":d();
break;
case"hide_div":f();
break;
case"mousedown_other":f();
break;
case"window_blur":f();
break;
case"need_resize":V();
break}}})})();
var R=(
function(){var C=document.forms[0];

function G(){if(H("bdsug_ipt_sug")){if(H("bdsug_ipt_sug").value==H("kw").value){K({n:1,sug:1})}else{K({f:1})}}}O(C,"submit",G);

function U(){G();
C.submit()}
function V(W){F(W);
K({sug:1,n:1});
C.submit()}return I.ini({rm:
function(W){switch(W.type){case"clk_submit":case"ent_submit":V({oq:W.oq,rsp:W.rsp,f:3});
break;
case"submit":U();
break}}})})();
var A=(
function(){var G={};

function U(C){if(typeof G[C]=="undefined"){A.dm({type:"request_data",wd:C})}else{A.dm({type:"give_data",data:G[C]})}}
function V(C){G[C.q]=C;
A.dm({type:"give_data",data:G[C.q]})}return I.ini({rm:
function(C){switch(C.type){case"response_data":V(C.data);
break;
case"need_data":U(C.wd);
break}}})})();
var Q=(
function(){var C;
var U;

function G(V){Q.dm({type:"need_cookie"});
if(C){document.body.removeChild(C)}C=J("SCRIPT");
C.src="http://suggestion.baidu.com/su?wd="+encodeURIComponent(V)+"&p="+U+"&t="+(new Date()).getTime();
C.charset="gb2312";
document.body.appendChild(C)}return I.ini({rm:
function(V){switch(V.type){case"request_data":G(V.wd);
break;
case"give_cookie":var W=V.sug;
if(W>0){W=3}U=W;
break}}})})();
baidu.sug=
function(C){baidu.dm({type:"response_data",data:C})};
baidu.initSug=
function(){baidu.dm({type:"init"})};
I.ini(baidu);
var D=(
function(){
function C(){if(navigator.cookieEnabled){document.cookie="su=0;
 domain=www.baidu.com"}}
function G(){var U=(navigator.cookieEnabled&&/sug=(\d)/.test(document.cookie)?RegExp.$1:3);
D.dm({type:"give_cookie",sug:U})}return I.ini({rm:
function(U){switch(U.type){case"close":C();
break;
case"need_cookie":G();
break}}})})();
var B=(
function(){var W=H("kw");
var C;
var Z=document.forms[0];
var V;

function X(){if(C.offsetWidth!=0&&W.offsetWidth!=C.offsetWidth){B.dm({type:"need_resize"})}}
function a(){C=J("DIV");
C.id="sd_"+new Date().getTime();
C.style.display="none";
Z.appendChild(C);
if(L){V=J("IFRAME");
V.style.display="none";
V.style.position="absolute";
C.parentNode.insertBefore(V,C)}}
function Y(b){b=b||window.event;
var c=b.target||b.srcElement;
if(c==W){return }while(c=c.parentNode){if(c==C){return }}B.dm({type:"mousedown_other"})}
function U(){B.dm({type:"window_blur"})}
function G(){B.dm({type:"div_ready",sdiv:C,frm:V});
setInterval(X,100);
O(document,"mousedown",Y);
O(window,"blur",U);
P("#"+C.id,"border:1px solid #817F82;
position:absolute;
top:28px;
left:0");
P("#"+C.id+" table","width:100%;
background:#fff;
cursor:default");
P("#"+C.id+" td","font:14px verdana");
P(".mo","background-color:#36c;
color:#fff");
P(".ml","background-color:#fff;
color:#000")}baidu.sug.initial=G;
return I.ini({rm:
function(b){switch(b.type){case"start":G();
break;
case"init":a();
break}}})})();
E.on("need_data",A);
E.on("close_div",T);
E.on("key_enter",T);
E.on("key_up",T);
E.on("key_down",T);
E.on("hide_div",T);
E.on("start",B);
A.on("request_data",Q);
A.on("give_data",T);
baidu.on("response_data",A);
baidu.on("init",B);
T.on("clk_submit",E,R);
T.on("ent_submit",E,R);
T.on("submit",R);
T.on("key_select",E);
T.on("close",E,D);
T.on("mousedown_tr",E);
B.on("mousedown_other",T);
B.on("need_resize",T);
B.on("div_ready",E,T);
B.on("window_blur",T);
Q.on("need_cookie",D);
D.on("give_cookie",Q);
window.baidu.initSug()})();
