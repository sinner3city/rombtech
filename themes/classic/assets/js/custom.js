$(function () {
  let CUSTOM = function () {
    let animationWorking = false;
    let current = $(window).scrollTop();
    let eventTimeout;
    let eventResizeTimeout;

    // LAYOUT/MODULES Upgrades UX
    // ==========================================================

    $(document).on("click", '[data-toggle="dropdown"]', function (e) {
      e.preventDefault();

      // $(this).next('.category-sub__drop').
    });

    $(".block-categories").insertAfter(".category-heading");
    $("#js-active-search-filters").insertAfter(".block-categories");
    $("#js-product-list-header").insertBefore(".block-categories");

    $(document).on("change", ".payment-option input", function () {
      $("#order-summary-content").addClass("active");
    });

    $(".block_newsletter").on("click", function (e) {
      $(".block_newsletter .gdpr_consent").slideDown();
    });

    $("#menu-icon").on("click", function (e) {
      e.preventDefault();
      $("body").toggleClass("page-menu-active");
    });

    $(".panel__close").on("click", function (e) {
      e.preventDefault();
      let $self = $(this).closest(".panel");
      let panel = $(this).closest(".panel").data("panel");
      $self.removeClass("panel-top--active");
      $("body").removeClass("panel-" + panel + "--active");

      sessionS.save("pbottom", "off");
    });

    $(".has-drop > a").on("click", function (e) {
      // e.preventDefault();
      // $(this).closest('.page-menu__item').toggleClass('link--active');
    });

    $(".page-menu__arrow").on("click", function (e) {
      e.preventDefault();

      $(this)
        .closest(".page-menu__item")
        .not("#category-2")
        .toggleClass("link--active");
    });

    $(".page-header .nav-top-search__btn").on("click", function (e) {
      //   e.preventDefault();
      $(this).closest("form").toggleClass("form--active");
    });

    $(".breadcrumbs__item:visible:last .sep").hide();

    $("#tab-content [style]").removeAttr("style");

    // $(document).on("click", ".nav-link", function (e) {
    //   let $self = $(this);
    //   let $target = $($self.attr("href"));
    // });

    $(document).on(
      "click",
      ".product-customization .title--drop",
      function (e) {
        e.preventDefault();
        let $self = $(this);
        let $parent = $self.closest(".product-customization");
        let $form = $(".card-block", $parent);

        $parent.toggleClass("custom--active");

        if ($parent.hasClass("custom--active")) {
          $form.stop().slideDown(500);
        } else {
          $form.stop().slideUp(350);
        }
      }
    );

    $(".page-product #product-details").text();

    // INIT
    // ==========================================================

    function smallChanges() {
      $(".page-content.page-cms [style]").removeAttr("style");
      $("#lnk-promocje").appendTo(
        ".page-header #category-2 > .page-menu__droplist > .page-menu__list"
      );

      if ($(".fs-gallery__item").length === 1) {
        $(".fs-gallery__item").addClass("center-foto");
        $(".ico-swipe-mobile").remove();
        $(".fs-gallery").addClass("overflow-hidden");
      }

      $("#lnk-katalog-produktow").prependTo(
        ".page-header #category-2 > .page-menu__droplist > .page-menu__list"
      );

      // $(document).on("click", ".btn-fastmode", function (e) {
      //   e.preventDefault();
      //   $(".list--products .art").first().find(".quick-view").trigger("click");
      // });

      $("#lnk-katalog-produktow a").attr(
        "href",
        $(".page__panel-logo").attr("href")
      );

      $('.page-menu__list[data-depth="0"]')
        .clone(true, true)
        .appendTo("#js__menu-clone");
      // $("#lnk-promocje a").attr(
      //   "href",
      //   $("#link-product-page-prices-drop-3").attr("href")
      // );

      // $("#lnk-promocje a").attr(
      //   "href",
      //   $("#link-product-page-prices-drop-3").attr("href")
      // );

      // $('a[href]').each(function () {
      //   if (!$(this).attr('href').includes('https'))  {
      //     const base = window.prestashop.urls.base_url;
      //     const thisurl = $(this).attr('href');
      //     $(this).attr('href', base + thisurl);
      //   }
      // });

      if ($("window").width() < 768) {
      }
    }

    function eventsOnScroll() {
      if (!eventTimeout) {
        eventTimeout = setTimeout(function () {
          eventTimeout = null;
        }, 150);
      }
    }

    function eventsOnResize() {
      if (!eventResizeTimeout) {
        eventResizeTimeout = setTimeout(function () {
          eventResizeTimeout = null;
        }, 150);
      }
    }

    $(window).on("scroll", function () {
      // current = $(window).scrollTop();
      // eventsOnScroll(current);
    });

    $(window).on("resize", function () {
      // current = $(window).scrollTop();
      // eventsOnResize(current);
    });

    $(window).on("load", function () {
      smallChanges();
    });
  };

  window.fscustom = new CUSTOM();
});
