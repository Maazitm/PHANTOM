!function(e){var t={};function r(n){var a;return(t[n]||(a=t[n]={i:n,l:!1,exports:{}},e[n].call(a.exports,a,a.exports,r),a.l=!0,a)).exports}r.m=e,r.c=t,r.d=function(e,t,n){r.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},r.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},r.t=function(e,t){if(1&t&&(e=r(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(r.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var a in e)r.d(n,a,function(t){return e[t]}.bind(null,a));return n},r.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return r.d(t,"a",t),t},r.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},r.p="",r(r.s=5)}([function(e,t,r){var n=r(2);function a(e,t){var r,a,i=n.AFExtractNums(e);return t=t||new Date,e&&(!n.AFTimeGarbageRegExp.test(e)||!i||i.length<2||3<i.length||(a=!!n.AFPMRegExp.test(e),e=!!n.AFAMRegExp.test(e),r=new Number(i[0]),a?r<12&&(r+=12):e&&12<=r&&(r-=12),a=i[1],e=3==i.length?i[2]:0,t.setHours(r),t.setMinutes(a),t.setSeconds(e),t.getHours()!=r)||t.getMinutes()!=a||t.getSeconds()!=e)?null:t}function i(e,t){var r=new Date;if(r.setHours(12,0,0),e){var i=function(e){for(var t=0,r=0;r<e.length;r++)switch(e.charAt(r)){case"\\":r++;break;case"y":t+=1}return t}(t),u=function(e){for(var t="",r=0;r<e.length;r++)switch(e.charAt(r)){case"\\":r++;break;case"m":-1==t.indexOf("m")&&(t+="m");break;case"d":-1==t.indexOf("d")&&(t+="d");break;case"j":case"y":-1==t.indexOf("y")&&(t+="y")}return-1==t.indexOf("m")&&(t+="m"),-1==t.indexOf("d")&&(t+="d"),-1==t.indexOf("y")&&(t+="y"),t}(t),l=function(e){var t,r="";return(t=n.AFExtractRegExp(n.AFPMRegExp,e))&&(r=t[1],e=t[0]),(t=n.AFExtractRegExp(n.AFAMRegExp,e))&&(e=t[0]),(t=n.AFExtractRegExp(n.AFTimeLongRegExp,e))||(t=n.AFExtractRegExp(n.AFTimeShortRegExp,e))?(t[1]+=r,t):null}(e),c=(l&&(e=l[0]),n.AFExtractNums(e));if(!c)return null;if(3==c.length)return s=+c[u.indexOf("y")],2<i&&s<100||9999<s?null:(r=m(s=o(s),c[u.indexOf("m")]-1,c[u.indexOf("d")]),l?r=a(l[1],r):r&&r.setHours(0,0,0),r);if(g=function(e){for(var t=0;t<n.AFMonthsRegExp.length;t++){var r=e.match(n.AFMonthsRegExp[t]);if(r)return function(e){var t=(t=new RegExp(e+" ([0-9]+)","i")).exec("January 1 February 2 March 3 April 4 May 5 June 6 July 7 August 8 September 9 October 10 November 11 December 12 Sept 9 Jan 1 Feb 2 Mar 3 Apr 4 Jun 6 Jul 7 Aug 8 Sep 9 Oct 10 Nov 11 Dec 12 ");return e&&t?+t[1]:0}(r[r.length-1])}return 0}(e),2==c.length){if(g)return v=u.indexOf("y")<u.indexOf("d")?(s=+c[0],c[1]):(s=+c[1],c[0]),2<i&&s<100||9999<s?null:(r=m(s=o(s),g-1,v),l?r=a(l[1],r):r&&r.setHours(0,0,0),r);if(u.indexOf("y")<u.indexOf("d")){if(g=u.indexOf("y")<u.indexOf("m")?(s=+c[0],c[1]):(s=+c[1],c[0]),2<i&&s<100||9999<s)return null;r=m(s=o(s),g-1,1)}else s=r.getFullYear(),r=u.indexOf("d")<u.indexOf("m")?m(s,c[1]-1,c[0]):m(s,c[0]-1,c[1]);l?r=a(l[1],r):r&&r.setHours(0,0,0)}else{if(1!=c.length)return null;if(g)if(u.indexOf("y")<u.indexOf("d")){if(s=+c[0],2<i&&s<100||9999<s)return null;r=m(s=o(s),g-1,1)}else r=m(s=r.getFullYear(),g-1,c[0]);else{if(t.length!=e.length)return null;for(var s="",g="",v="",p=0;p<t.length;p++)switch(t.charAt(p)){case"\\":p++;break;case"y":s+=e.charAt(p);break;case"m":g+=e.charAt(p);break;case"d":v+=e.charAt(p)}if(s*=1,(g*=1)&&--g,(v*=1)||(v+=1),2<i&&s<100||9999<s)return null;r=m(s=o(s),g,v)}l?r=a(l[1],date):r&&r.setHours(0,0,0)}}return r}function u(e){if(event.value){if(-1!=event.value.indexOf("GMT+")){var t=AFParseGMTDateString(event.value);if(t)return void(event.value=util.printd(e,t))}t=i(event.value,e),event.value=t?util.printd(e,t):""}}function l(e){event.willCommit&&!i(n.AFMergeChange(event),e)&&(event.willCommit&&!event.silenceErrors?(e=util.printf(ScriptString.invalid_date_error_message,null!=event.target?event.target.name:"",e),app.alert(e)):app.beep(0),event.rc=!1)}function o(e){return e<100&&50<=e?e+=1900:0<=e&&e<50&&(e+=2e3),e}function m(e,t,r){var n=new Date;return n.setFullYear(e,t,r),n.getFullYear()!=e||n.getMonth()!=t||n.getDate()!=r?null:n}e.exports={AFDate_Format:function(e){u(["m/d","m/d/yy","mm/dd/yy","mm/yy","d-mmm","d-mmm-yy","dd-mmm-yy","yy-mm-dd","mmm-yy","mmmm-yy","mmm d, yyyy","mmmm d, yyyy","m/d/yy h:MM tt","m/d/yy HH:MM"][e])},AFDate_FormatEx:u,AFDate_Keystroke:function(e){l(["m/d","m/d/yy","mm/dd/yy","mm/yy","d-mmm","d-mmm-yy","dd-mmm-yy","yy-mm-dd","mmm-yy","mmmm-yy","mmm d, yyyy","mmmm d, yyyy","m/d/yy h:MM tt","m/d/yy HH:MM"][e])},AFDate_KeystrokeEx:l,AFTime_Format:function(e){var t;event.value&&((t=a(event.value,null))?event.value=util.printd(["HH:MM","h:MM tt","HH:MM:ss","h:MM:ss tt"][e],t):event.value="")},AFTime_FormatEx:function(e){var t;event.value&&(t=a(event.value,null),event.value=t?util.printd(e,t):"")},AFTime_Keystroke:function(e){var t;event.willCommit&&!a(event.value,null)&&(event.willCommit&&!event.silenceErrors?(t=util.printf(ScriptString.invalid_value_format_error_message,null!=event.target?event.target.name:""),app.alert(t)):app.beep(0),event.rc=!1)},AFParseDateEx:i,printd:function(e,t){for(var r=["January","February","March","April","May","June","July","August","September","October","November","December"],n=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],a=(0===e?e="D:yyyymmddHHMMss":1===e?e="yyyy.mm.dd HH:MM:ss":2===e&&(e="m/d/yy h:MM:ss tt"),t?t instanceof Date||(t=new Date(t)):t=new Date,e.match(/(\\.|m+|d+|y+|H+|h+|M+|s+|t+|[^\\mdyHhMst]*)/g)),i="",u=0;u<a.length;++u){var l=a[u];switch(l){case"mmmm":i+=r[t.getMonth()];break;case"mmm":i+=r[t.getMonth()].substring(0,3);break;case"mm":i+=util.printf("%02d",t.getMonth()+1);break;case"m":i+=t.getMonth()+1;break;case"dddd":i+=n[t.getDay()];break;case"ddd":i+=n[t.getDay()].substring(0,3);break;case"dd":i+=util.printf("%02d",t.getDate());break;case"d":i+=t.getDate();break;case"yyyy":i+=t.getFullYear();break;case"yy":i+=t.getFullYear()%100;break;case"HH":i+=util.printf("%02d",t.getHours());break;case"H":i+=t.getHours();break;case"hh":i+=util.printf("%02d",(t.getHours()+11)%12+1);break;case"h":i+=(t.getHours()+11)%12+1;break;case"MM":i+=util.printf("%02d",t.getMinutes());break;case"M":i+=t.getMinutes();break;case"ss":i+=util.printf("%02d",t.getSeconds());break;case"s":i+=t.getSeconds();break;case"tt":i+=t.getHours()<12?"am":"pm";break;case"t":i+=t.getHours()<12?"a":"p";break;default:i+="\\"==l[0]?l[1]:l}}return i}}},function(e,t,r){var n=r(2);function a(e){var t=typeof e;return"number"==t?e:"string"==t&&(t=n.AFExtractNums(e))?(t=t.join("."),(t=0<=e.indexOf("-.")?"0."+t:t)*(0<=e.indexOf("-")?-1:1)):null}function i(e,t,r,a,i,u){var l,o,m=n.AFMergeChange(event);m&&(o=1<t?(l=n.AFNumberCommaSepCommitRegExp,n.AFNumberCommaSepEntryRegExp):(l=n.AFNumberDotSepCommitRegExp,n.AFNumberDotSepEntryRegExp),n.AFExactMatch(event.willCommit?l:o,m)||(event.willCommit&&!event.silenceErrors?(l=util.printf(ScriptString.invalid_value_error_message,null!=event.target?event.target.name:""),app.alert(l)):app.beep(0),event.rc=!1),event.willCommit)&&1<t&&(o=event.value,m=new RegExp(","),o=o.replace(m,"."),event.value=+o)}new RegExp("[0-9]+"),e.exports={AFNumber_Format:function(e,t,r,n,i,u){var l=a(event.value),o=l<0?-1:1,m=event.target,c="";null==l||isNaN(l)?(console.reportError("Could not convert value to number: "+event.value),event.value=""):(1!=r&&3!=r||(m.textColor=0<o?color.black:color.red),l=util.printf("%,"+t+"."+e+"f",l),o<0&&u&&0==r&&(c="-"),(2==r||3==r)&&o<0&&(c+="("),u&&(c+=i),c+=l=0==r&&!u||"-"!=l.substring(0,1)?l:l.substring(1),u||(c+=i),(2==r||3==r)&&o<0&&(c+=")"),event.value=c)},AFNumber_Keystroke:i,AFMakeNumber:a,AFPercent_Format:function(e,t,r){var n=100*a(event.value);t="%,"+t+"."+e+"f";null==n?event.value="":(n=util.printf(t,n),event.value=r?"%"+n:n+"%")},AFPercent_Keystroke:function(e,t){return i(0,t)}}},function(e,t){e.exports={AFExtractRegExp:function(e,t){var r=[];return(match=e.exec(t))?(r.length=2,r[0]=t.substring(0,match.index)+t.substring(match.index+match[0].length),r[1]=match,r):null},AFMergeChange:function(e){var t,r=e.value;return e.willCommit?e.value:(t=0<=e.selStart?r.substring(0,e.selStart):"",r=0<=e.selEnd&&e.selEnd<=r.length?r.substring(e.selEnd,r.length):"",t+e.change+r)},AFExtractNums:function(e){return(e=(e="."!=e.charAt(0)&&","!=e.charAt(0)?e:"0"+e).match(/[0-9]+/g))&&1<=e.length?e:null},AFExactMatch:function(e,t){if(Array.isArray(e)){for(var r=0;r<e.length;r++)if((n=t.match(e[r]))&&0<n.length&&n[0]==t)return!0}else{if(!(e instanceof RegExp))return!1;var n;if((n=t.match(e))&&0<n.length&&n[0]==t)return!0}return!1},AFTimeGarbageRegExp:/[0-9]{1,2}:[0-9]{1,2}(:[0-9]{1,2})?(\\s)*(am|pm)?/i,AFPMRegExp:/pm/i,AFAMRegExp:/am/i,AFTimeLongRegExp:/[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}/,AFTimeShortRegExp:/[0-9]{1,2}:[0-9]{1,2}/,AFMonthsRegExp:[/January/i,/February/i,/March/i,/April/i,/May/i,/June/i,/July/i,/August/i,/September/i,/October/i,/November/i,/December/i,/Sept/i,/Jan/i,/Feb/i,/Mar/i,/Apr/i,/Jun/i,/Jul/i,/Aug/i,/Sep/i,/Oct/i,/Nov/i,/Dec/i,/(?:)/i],AFNumberDotSepCommitRegExp:[/[+-]?[0-9]+(\.[0-9]+)?/i,/[+-]?\.[0-9]+/i,/[+-]?[0-9]+\./i],AFNumberCommaSepCommitRegExp:[/[+-]?[0-9]+([.,][0-9]+)?/i,/[+-]?[.,][0-9]+/i,/[+-]?[0-9]+[.,]/i],AFNumberCommaSepEntryRegExp:/[+-]?[0-9]*,?[0-9]*/i,AFNumberDotSepEntryRegExp:/[+-]?[0-9]*\.?[0-9]*/i,AFZipCommitRegExp:/[0-9]{5}/i,AFZipEntryRegExp:/[0-9]{0,5}/i,AFZip4CommitRegExp:/[0-9]{5}(\.|[- ])?[0-9]{4}/i,AFZip4EntryRegExp:/[0-9]{0,5}(\.|[- ])?[0-9]{0,4}/i,AFPhoneCommitRegExp:[/[0-9]{3}(\.|[- ])?[0-9]{4}/i,/[0-9]{3}(\.|[- ])?[0-9]{3}(\.|[- ])?[0-9]{4}/i,/\([0-9]{3}\)(\.|[- ])?[0-9]{3}(\.|[- ])?[0-9]{4}/i,/011(\.|[- [0-9])*/i],AFPhoneEntryRegExp:[/[0-9]{0,3}(\.|[- ])?[0-9]{0,3}(\.|[- ])?[0-9]{0,4}/i,/\([0-9]{0,3}/i,/\([0-9]{0,3}\)(\.|[- ])?[0-9]{0,3}(\.|[- ])?[0-9]{0,4}/i,/\([0-9]{0,3}(\.|[- ])?[0-9]{0,3}(\.|[- ])?[0-9]{0,4}/i,/[0-9]{0,3}\)(\.|[- ])?[0-9]{0,3}(\.|[- ])?[0-9]{0,4}/i,/011(\.|[- [0-9])*/i],AFSSNCommitRegExp:/[0-9]{3}(\.|[- ])?[0-9]{2}(\.|[- ])?[0-9]{4}/i,AFSSNEntryRegExp:/[0-9]{0,3}(\.|[- ])?[0-9]{0,2}(\.|[- ])?[0-9]{0,4}/i}},function(e,t,r){var n=r(2);function a(e){return"9"==e||"X"==e||"A"==e||"O"==e}function i(e,t){for(var r=t;r<e.length;r++)if(a(e.charAt(r)))return r;return-1}function u(e){return"0"<=e&&e<="9"}function l(e){return"a"<=e&&e<="z"||"A"<=e&&e<="Z"}function o(e,t){switch(t){case"9":return u(e);case"A":return l(e);case"O":return u(r=e)||l(r);case"X":return 1;default:return e==t}var r}e.exports={AFSpecial_Format:function(e){var t=event.value;if(t){switch(e){case 0:var r="99999";break;case 1:r="99999-9999";break;case 2:r=10<=util.printx("9999999999",t).length?"(999) 999-9999":"999-9999";break;case 3:r="999-99-9999"}event.value=util.printx(r,t)}},AFSpecial_Keystroke:function(e){var t,r,a=n.AFMergeChange(event);if(a){switch(e){case 0:t=n.AFZipCommitRegExp,r=n.AFZipEntryRegExp;break;case 1:t=n.AFZip4CommitRegExp,r=n.AFZip4EntryRegExp;break;case 2:t=n.AFPhoneCommitRegExp,r=n.AFPhoneEntryRegExp;break;case 3:t=n.AFSSNCommitRegExp,r=n.AFSSNEntryRegExp}n.AFExactMatch(event.willCommit?t:r,a)||(event.willCommit&&!event.silenceErrors?(e=util.printf(ScriptString.invalid_value_format_error_message,null!=event.target?event.target.name:""),app.alert(e)):app.beep(0),event.rc=!1)}},AFSpecial_KeystrokeEx:function(e){var t=n.AFMergeChange(event);if(t&&e.length){var r=util.printf(ScriptString.invalid_value_format_error_message,e);if(event.willCommit)return-1!=i(e,t.length)?(event.silenceErrors||app.alert(r),void(event.rc=!1)):void(event.value=event.value+e.substring(t.length,e.length));for(var u=0,l=event.selStart,m=0,c=0;c<t.length;){var s=e.charAt(m),g=t.charAt(c);if(!o(g,s)){var v=i(e,m),p=event.selStart+event.change.length+u;if(!(m<e.length&&!a(s)&&-1!=v&&o(g,e.charAt(v))&&l<=c+u&&c+u<=p))return event.silenceErrors||app.alert(r),void(event.rc=!1);s=e.substring(m,v),event.change=event.change.substring(0,c+u-l)+s+event.change.substring(c+u-l),u+=s.length,m=v}c++,m++}}}}},function(e,t,r){r(2);var n=r(1);function a(e,t,r){var n=+t;return t=+t,r=+r,"AVG"==e||"SUM"==e?n=t+r:"PRD"==e?n=t*r:"MIN"==e?n=Math.min(t,r):"MAX"==e&&(n=Math.max(t,r)),n}e.exports={AFSimple:a,AFSimple_Calculate:function(e,t){for(var r,i=0,u="PRD"==e?1:0,l="string"==typeof(t=t)?((r=new RegExp).compile(",[ ]?"),t.split(r)):t,o=0;o<l.length;o++)for(var m=doc.getField(l[o]).getArray(),c=0;c<m.length;c++){var s=n.AFMakeNumber(m[c].value);u=a(e,u=0!=o||0!=c||"MIN"!=e&&"MAX"!=e?u:s,s);i++}"AVG"==e&&0<i&&(u/=i),"AVG"!=e&&"SUM"!=e&&"PRD"!=e||(u=+u.toFixed(6)),event.value=u}}},function(e,t,r){AFNumber_Format=function(e,t,n,a,i,u){return r(1).AFNumber_Format(e,t,n,a,i,u)},AFNumber_Keystroke=function(e,t,n,a,i,u){return r(1).AFNumber_Keystroke(e,t,n,a,i,u)},AFMakeNumber=function(e){return r(1).AFMakeNumber(e)},AFPercent_Format=function(e,t,n){return r(1).AFPercent_Format(e,t,n)},AFPercent_Keystroke=function(e,t,n){return r(1).AFPercent_Keystroke(e,t,n)},AFDate_Format=function(e){return r(0).AFDate_Format(e)},AFDate_FormatEx=function(e){return r(0).AFDate_FormatEx(e)},AFDate_Keystroke=function(e){return r(0).AFDate_Keystroke(e)},AFDate_KeystrokeEx=function(e){return r(0).AFDate_KeystrokeEx(e)},AFTime_Format=function(e){return r(0).AFTime_Format(e)},AFTime_FormatEx=function(e){return r(0).AFTime_FormatEx(e)},AFTime_Keystroke=function(e){return r(0).AFTime_Keystroke(e)},AFParseDateEx=function(e,t){return r(0).AFParseDateEx(e,t)},_printd=function(e,t){return r(0).printd(e,t)},AFSpecial_Format=function(e){return r(3).AFSpecial_Format(e)},AFSpecial_Keystroke=function(e){return r(3).AFSpecial_Keystroke(e)},AFSpecial_KeystrokeEx=function(e){return r(3).AFSpecial_KeystrokeEx(e)},AFSimple=function(e,t,n){return r(4).AFSimple(e,t,n)},AFSimple_Calculate=function(e,t){return r(4).AFSimple_Calculate(e,t)},AFRange_Validate=function(e,t,n,a){return r(6).AFRange_Validate(e,t,n,a)}},function(e,t){e.exports={AFRange_Validate:function(e,t,r,n){var a;""!=event.value&&(a="",e&&r?(event.value<t||event.value>n)&&(a=util.printf(ScriptString.invalid_value_greater_than_and_less_than_error_message,t,n)):e?event.value<t&&(a=util.printf(ScriptString.invalid_value_greater_than_or_equal_to_error_message,t)):r&&event.value>n&&(a=util.printf(ScriptString.invalid_value_less_than_or_equal_to_error_message,n)),""!=a)&&(event.silenceErrors||app.alert(a,0),event.rc=!1)}}}]);