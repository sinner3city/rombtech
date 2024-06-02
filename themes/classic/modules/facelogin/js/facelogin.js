/*
 * PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
 *
 * @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
 * @copyright 2010-2020 VEKIA
 * @license   This program is not free software and you can't resell and redistribute it
 *
 * CONTACT WITH DEVELOPER http://mypresta.eu
 * support@mypresta.eu
 */

$(document).ready(function () {
  if (fblogin_include_app == true) {
    (function (d) {
      var js,
        id = "facebook-jssdk";
      if (d.getElementById(id)) {
        return;
      }
      js = d.createElement("script");
      js.id = id;
      js.async = true;
      js.src = "//connect.facebook.net/" + fblogin_langcode + "/all.js";
      d.getElementsByTagName("head")[0].appendChild(js);
    })(document);

    window.fbAsyncInit = function () {
      FB.init({
        appId: fblogin_appid,
        status: true,
        cookie: true,
        xfbml: true,
        oauth: true,
      });
    };
  }
});

function runloader() {
  $(".fbloader").fadeIn(500);
}
function stoploader() {
  $(".fbloader").fadeOut(3500);
}

function facelogin_fshop() {
  fblogin_fbinit_initiated = 0;
  FB.getLoginStatus(function (response) {
    if (typeof response !== "undefined") {
      fblogin_fbinit_initiated = 1;
    }
  });

  if (fblogin_fbinit_initiated == 0) {
    FB.init({
      appId: fblogin_appid,
      status: true,
      cookie: true,
      xfbml: true,
      oauth: true,
      version: "v3.0",
    });
  }

  if (typeof back !== "undefined") {
    getparam = "?back=" + back;
  } else {
    getparam = "";
  }
  runloader();
  FB.login(
    function (response) {
      if (response.authResponse) {
        FB.api(
          "/me?fields=id,name,email,first_name,last_name,gender",
          function (response) {
            $.post(
              baseDir + "modules/fblogin/ajax_fblogin.php" + getparam,
              { resp: response },
              function (data) {
                stoploader();
                eval(data);
              }
            );
          }
        );
      } else {
        stoploader();
      }
    },
    { scope: "email" }
  );
}
