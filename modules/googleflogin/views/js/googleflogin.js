!function(){var e=document.createElement("script");e.type="text/javascript",e.async=!0,e.src="https://apis.google.com/js/client:plusone.js?onload=render";var o=document.getElementsByTagName("script")[0];o.parentNode.insertBefore(e,o)}();const rungoogleloader=()=>$(".gloader").fadeIn(500),stopgoogleloader=()=>$(".gloader").fadeOut(3500),googleflogin_fshop=()=>{const e={client_id:ggoogleflogin_appid,scope:"openid profile email",immediate:"false"};$(".gloader").fadeIn(500),gapi.auth.authorize(e,handleAuthResult)},handleAuthResult=e=>{if(e&&!e.error){const o=e.access_token;tryGetEmail(o)}else stopgoogleloader()},tryGetEmail=e=>{const o="https://www.googleapis.com/oauth2/v2/userinfo?access_token="+e;$.get(o).done((e=>{stopgoogleloader(),$.post(ggl_loginloader,{resp:e,back:$.urlParam("back")},(e=>{}))})).fail((()=>{stopgoogleloader()}))};$.urlParam=e=>{const o=new RegExp("[?&]"+e+"=([^&#]*)").exec(window.location.href);return null===o?null:o[1]||0};