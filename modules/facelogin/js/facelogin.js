function runloader(){$(".fbloader").fadeIn(500)}function stoploader(){$(".fbloader").fadeOut(3500)}function facelogin_fshop(){facelogin_fbinit_initiated=0,FB.getLoginStatus(function(e){void 0!==e&&(facelogin_fbinit_initiated=1)}),0==facelogin_fbinit_initiated&&FB.init({appId:facelogin_appid,status:!0,cookie:!0,xfbml:!0,oauth:!0,version:"v3.0"}),getparam="undefined"!=typeof back?"?back="+back:"",runloader(),FB.login(function(response){response.authResponse?FB.api("/me?fields=id,name,email,first_name,last_name,gender",function(response){$.post(baseDir+"modules/facelogin/ajax_facelogin.php"+getparam,{resp:response},function(data){stoploader(),eval(data)})}):stoploader()},{scope:"email"})}$(document).ready(function(){var e,n,o;!0==facelogin_include_app&&(o="facebook-jssdk",!(e=document).getElementById(o)&&((n=e.createElement("script")).id=o,n.async=!0,n.src="//connect.facebook.net/pl_PL/all.js",e.getElementsByTagName("head")[0].appendChild(n)),window.fbAsyncInit=function(){FB.init({appId:facelogin_appid,status:!0,cookie:!0,xfbml:!0,oauth:!0})})});