$(function () {
  let STARTER = function () {
    let animationWorking = false;
    let checkBodyAnimation;
    let current = $(window).scrollTop();
    let eventTimeout;
    let eventResizeTimeout;
    let lazyDelay;
    let getWHa;
    let lastScroll;

    // Helpers
    // ==========================================================

    $('img[src^="https://upload"]').each(function (e) {
      $(this)
        .attr("data-fancybox", "gallery")
        .wrap('<figure class="fs-gallery__item"></figure>')
        .prependTo(".fs-gallery");
    });

    $(".dev-close").on("click", function (e) {
      e.preventDefault();
      $(".dev-ops").hide();
    });

    function checkMobile() {
      if (getWH("width") <= 1024) {
        $("body").addClass("body--mobile");
        $("body").addClass("animation--end animation--loaded");
      } else {
        $("body").removeClass("body--mobile");
      }
    }

    let localS = {
      save: function (name, value) {
        localStorage.setItem(name, value);
      },
      get: function (name) {
        let getName = localStorage.getItem(name);
        return getName;
      },
      remove: function (name) {
        localStorage.getItem(name);
      },
    };

    let sessionS = {
      save: function (name, value) {
        sessionStorage.setItem(name, value);
      },
      get: function (name) {
        let getName = sessionStorage.getItem(name);
        return getName;
      },
      remove: function (name) {
        sessionStorage.getItem(name);
      },
    };

    function getCookie(name) {
      const cookies = document.cookie.split(";");
      for (let i = 0; i < cookies.length; i++) {
        let c = cookies[i].trim().split("=");
        if (c[0] === name) {
          return c[1];
        }
      }
      return "";
    }

    function setCookie(name, value, days, path, domain, secure) {
      let cookie = `${name}=${encodeURIComponent(value)}`;

      // setCookie('name', 'John Doe', 90);
      if (days) {
        const expiry = new Date();
        expiry.setDate(expiry.getDate() + days);
        cookie += `; expires=${expiry.toUTCString()}`;
      }

      if (path) cookie += `; path=${path}`;
      if (domain) cookie += `; domain=${domain}`;
      if (secure) cookie += `; secure`;

      document.cookie = cookie;
    }

    this.showAlert = function (msg) {
      let template, $main, $alert;
      template = '<div id="alert"><h1>Wystąpił błąd:</h1>' + msg + "</div>";
      $main = $("body");

      $("#alert").remove();
      $(template).prependTo($main);
      $alert = $("#alert");
      $alert.fadeIn(600);

      setTimeout(function () {
        $alert.fadeOut(600);
      }, 3000);
    };

    let getWH = function (value) {
      // get width and height
      let w = window,
        d = document,
        e = d.documentElement,
        g = d.getElementsByTagName("body")[0],
        x = w.innerWidth || e.clientWidth || g.clientWidth,
        y = w.innerHeight || e.clientHeight || g.clientHeight;
      let b = $("body");
      b.attr("data-width", x);
      b.attr("data-height", y);
      if (value === "width") {
        return parseInt(x);
      } else {
        return parseInt(y);
      }
    };

    this.priceWithTax = function (price) {
      let priceNoTax = price;
      let priceTax = parseInt(priceNoTax.replace(/\s/g, "")) * 1.23;

      // console.log(priceTax.toString().replace(".", ","));
      return priceTax.toString().replace(".", ",");
    };

    this.scrollTo = (function () {
      $(document).on("click", ".js__scroll", function (e) {
        e.preventDefault();
        let $self = $(this);
        let goto = $self.attr("href");
        let speed = 700;

        if (goto == "#category") {
          speed = 400;
        }

        if (!animationWorking) {
          animationWorking = true;
          $("html, body")
            .stop()
            .animate(
              {
                scrollTop: $(goto).offset().top - 120,
              },
              speed,
              function () {}
            )
            .promise()
            .then(function () {
              animationWorking = false;
            });
        }
      });
    })();

    // PRESTA FIXY
    // ==========================================================

    this.fixCloseModals = (function () {
      function closeModal(e) {
        // console.log(e.key);
        if (e.key === "Escape") {
          $(".modal .close").trigger("click");
          $("body").removeClass("fav-menu-active");
          $("body").removeClass("menu--active");
          $("body").removeClass("menu--active");
          $("body").removeClass("body--opacity");
        }
      }

      $(document).on("keydown", function (e) {
        closeModal(e);
      });

      $(document).on("click", function (e) {
        if (e.target.className == "modal-dialog") {
          setTimeout(function () {
            $(".modal .close").trigger("click");
          }, 600);
        }
      });
    })();

    // MENU RWD
    // ==========================================================

    $(document).on("click", ".nav-top__link.link--burger", function (e) {
      e.preventDefault();
      let $body = $("body");
      $body.toggleClass("menu--active body--opacity");
      $body.removeClass("panel-top--active");
      $(window).trigger("scroll");
    });

    // ANIMATIONS
    // ==========================================================

    function bodyAnimation() {
      clearInterval(checkBodyAnimation);
      $("body").addClass("animation--loaded");
      setTimeout(function () {
        $("body").addClass("animation--start");
      }, 10);

      setTimeout(function () {
        $("body").addClass("animation--active");
      }, 400);

      setTimeout(function () {
        $("body").addClass("animation--end");

        setTimeout(function () {
          // $('.banner--home').addClass('hover--on');
        }, 2500);
      }, 2200);

      if (!$('body[id*="index"]').length) {
        $("body").addClass("animation--start");
        $("body").addClass("animation--end");
      }
    }

    // Lazyloading
    // ==========================================================

    function lazyInit() {
      window.lazyLoadInstance = new LazyLoad({});
    }
    // Ulubione
    // ==========================================================

    function addToFav() {
      let favArr = [];

      if (!localS.get("fav")) {
        favArr = [];
      } else {
        favArr = JSON.parse(localS.get("fav"));
        setFav();
      }

      function setFav() {
        favArr.forEach(function (id) {
          // console.log(id);
          $('[data-id-product="' + id + '"]').addClass("fav--active");
        });
      }

      $(document).on("click", ".art__fav-link", function (e) {
        e.preventDefault();
        let $self = $(this).closest("[data-id-product]");
        let $item = $self.closest("[data-id-product]");
        let id = $self.data("id-product");

        if (!$self.hasClass("fav--active")) {
          $self.addClass("fav--active");
          if (!favArr.includes(id)) {
            favArr.push(id);
          }
        } else {
          $self.removeClass("fav--active");
          var favRemove = favArr.indexOf(id);
          if (favRemove !== -1) {
            favArr.splice(favRemove, 1);
          }
        }

        localS.save("fav", JSON.stringify(favArr));
      });

      $(".art__grid a").on("click", function (e) {
        e.preventDefault();
        let grid = $(this).data("grid");
        $(".art__grid a").removeClass("active");
        $(this).addClass("active");
        $(this).parent().next(".art__list").attr("data-col", grid);
      });
    }

    // Autogrids
    // ==========================================================

    function updateGrids() {
      if (
        !$("body").hasClass("page-product") &&
        !$("body").hasClass("page-index")
      ) {
        if (getCookie("grid")) {
          if ($(".list--products .art").length < 3) {
            changeGrid(4);
          } else {
            changeGrid(getCookie("grid"));
          }
        } else {
          if ($(".list--products .art").length > 16) {
            changeGrid(4);
          } else {
            changeGrid(4);
          }
        }
      }
    }

    function changeGrid(grid) {
      if ($("body").hasClass("grid--" + grid)) {
        return false;
      } else {
        // $("body").addClass("grid--transform");
        $("body").removeClass("grid--6 grid--5 grid--4 grid--3 grid--2");
        $("body").addClass("grid--" + grid);
        $(".btn-grid .grid--active").removeClass("grid--active");
        $(".btn-grid .grid--" + grid).addClass("grid--active");
        $('.list--products[data-slider="false"]').attr("data-col", grid);
      }

      setTimeout(function () {
        $("body").removeClass("grid--transform");
      }, 250);
    }

    function grids() {
      updateGrids();

      $(document).on("click", ".btn-grid", function (e) {
        e.preventDefault();

        $("body").addClass("grid--transform");

        let $active = $(this).find(".grid--active");
        let $next = $active.next("i");
        let next;

        if ($next.hasClass("grid--disabled")) {
          $next = $active.next().next();
        }

        if ($next.length) {
          $active.removeClass("grid--active");
          $next.addClass("grid--active");
        } else {
          $active.removeClass("grid--active");
          $(this)
            .find('i:not(".grid--disabled")')
            .first()
            .addClass("grid--active");
        }

        next = $(this).find(".grid--active").data("grid");

        $('.list--products[data-slider="false"]').attr("data-col", next);

        // localS.save('grid', next);
        setCookie("grid", next, 3, "/");

        changeGrid(next);
      });
    }

    // QuickMode
    // ==========================================================

    function quickMode() {
      $(document).on("click", ".modal.quickview .close", function (e) {
        $("body").removeClass("qm");
        $(".product-item__quick.quick--active").removeClass("quick--active");
        $(
          ".category-cover, .category-heading, #category-description .category-top-menu"
        ).slideDown(500);
      });

      $(document).on("click", ".product-item__quick", function (e) {
        $(this).addClass("quick--active");
        $("body").addClass("qm");
        $(".product-item__quick.quick--active")
          .not($(this))
          .removeClass("quick--active");
        $(
          ".category-cover, .category-heading, #category-description, .category-top-menu"
        ).slideUp(600);
      });

      $(document).on("click", ".qm .art__link-art", function (e) {
        e.preventDefault();
        let $qm = $(this).parent().find(".product-item__quick");
        $qm.trigger("click");
      });
    }

    // FacetFilters
    // ==========================================================

    function filters() {
      $(document).on("click", ".filter-active-label", function (e) {
        e.preventDefault();
        $(".js-search-filters-clear-all i").trigger("click");
      });

      $(document).on("click", ".filter-label-rwd", function (e) {
        e.preventDefault();
        $(".filter-wrapper").toggleClass("filters--open");
      });

      $(document).on("click", ".filter-titler", function (e) {
        e.preventDefault();
        $(".filter-wrapper").toggleClass("filters--open");
      });

      $(document).on("click", ".facet-title", function (e) {
        e.preventDefault();

        let $self = $(this);
        let $list = $self.closest(".facet").find(".facet-list");

        $(".facet-title").not($self).removeClass("active");
        $(".facet-title").not($self).parent().attr("aria-expanded", "false");
        // $list.removeClass('list--open');
        $(".facet-list").not($list).slideUp(250);

        if ($self.hasClass("active")) {
          $self.removeClass("active");
          $self.parent().attr("aria-expanded", "false");
          // $list.removeClass('list--open');
          $list.stop().slideUp(250);
        } else {
          $self.parent().attr("aria-expanded", "true");
          // $list.addClass('list--open');
          $self.addClass("active");
          $list.stop().slideDown(250);
        }
      });

      // $('.main-filter-active').attr('aria-expanded', false);

      $(document).on("click", '[data-toggle="showfilter"]', function (e) {
        e.preventDefault();
        let $self = $(this);
        let aria = $self.attr("aria-expanded");

        $('[data-toggle="showfilter"]').not($self).attr("aria-expanded", false);
        // $('[data-toggle="showfilter"]').not($self).next('.collapse').removeClass("show");

        // console.log('click');

        if (aria == "false") {
          $self.attr("aria-expanded", true);
          $(this).next(".collapse").addClass("show");
        } else {
          $self.attr("aria-expanded", false);
          $(this).next(".collapse").removeClass("show");
        }
      });
    }

    // Brands
    // ==========================================================

    function brandsHomepage() {
      if ($(".section--brands")) {
        $(".section--brands").load(
          prestashop.urls.base_url + "brands .page-brands",
          function () {
            $('.section--brands [data-slider="build"]').each(function () {
              $(this).wrapInner(
                '<div class="splide"><div class="splide__track"><ul class="splide__list">'
              );

              if ($(this).data("splide")) {
                $(this)
                  .find(".splide")
                  .attr("data-splide", JSON.stringify($(this).data("splide")));
              }

              $(this)
                .find(".splide__list > *")
                .wrap('<li class="splide__slide">');
            });

            let splideBuilded = {};
            $('.section--brands [data-slider="build"]').each(function (
              e,
              index
            ) {
              let $self = $(this);
              splideBuilded[e] = new Splide(this.querySelector(".splide"), {});

              splideBuilded[e].on("drag", function () {
                const { Autoplay } = splideBuilded[e].Components;
                Autoplay.pause();
              });
              splideBuilded[e].mount();
            });
          }
        );
      }
    }

    // Swpier
    // ==========================================================

    function sliderBuild(ops) {
      let cl = "";

      $('[data-slider="build"]').each(function () {
        if (!$(this).find(".slide").length) {
          $(this).wrapInner(
            '<div class="splide"><div class="splide__track"><ul class="splide__list">'
          );

          if (ops) {
            console.log(ops);
            $(this).find(".splide").attr("data-splide", JSON.stringify(ops));
          } else if ($(this).data("splide")) {
            $(this)
              .find(".splide")
              .attr("data-splide", JSON.stringify($(this).data("splide")));
          }

          $(this)
            .find(".splide__list > *")
            .not(".slider-nav")
            .wrap('<li class="splide__slide">');
        }
      });

      let splideBuilded = {};
      $('[data-slider="build"]').each(function (e, index) {
        let $self = $(this);
        splideBuilded[e] = new Splide(this.querySelector(".splide"), {});

        splideBuilded[e].on("drag", function () {
          const { Autoplay } = splideBuilded[e].Components;
          Autoplay.pause();
        });
        splideBuilded[e].mount();
      });
    }

    function sliders() {
      sliderBuild();

      if ($('#product .list--products[data-slider="true"]').length) {
        $('.list--products[data-slider="true"]').each(function () {
          let splideNew = new Splide(this.querySelector(".splide"), {
            type: "loop",
            perPage: 4,
            perMove: 1,
            // drag: "free",
            lazyLoad: "sequential",
            autoplay: false,
            padding: { left: "0", right: "0" },
            // focus: 'center',
            breakpoints: {
              2700: {
                perPage: 4,
              },
              1920: {
                perPage: 4,
              },
              980: {
                perPage: 3,
                padding: { left: "0", right: "0" },
              },
              767: {
                perPage: 2,
                arrows: false,
              },
              480: {
                perPage: 1,
                arrows: false,
                padding: { left: "0", right: "60px" },
              },
              // 640: {
              //     perPage: 2,
              // },
              // 480: {
              //     perMove: 1,
              // }
            },
          });
          splideNew.on("drag", function () {
            const { Autoplay } = splideNew.Components;
            Autoplay.pause();
          });
          splideNew.mount();
        });
      }

      if ($('.list--products[data-slider="box"]').length) {
        $('.list--products[data-slider="box"]').each(function () {
          let splideBox = new Splide(this.querySelector(".splide"), {
            padding: 0,
            interval: 8000,
            pauseOnHover: true,
            perPage: 1,
            perMove: 1,
            lazyLoad: "sequential",
            autoplay: true,
            breakpoints: {
              2700: { perPage: 1, padding: 0 },
              980: { perPage: 1, padding: 0 },
              480: { perPage: 1, padding: 0 },
            },
          });
          splideBox.on("drag", function () {
            const { Autoplay } = splideBox.Components;
            Autoplay.pause();
          });
          splideBox.mount();
        });
      }

      if ($(".splide--categories").length) {
        let splideCat = new Splide(".splide--categories", {
          perPage: 4,
          perMove: 1,
          // drag: "free",
          lazyLoad: "sequential",
          focus: "center",
          autoplay: false,
          autoScroll: {
            speed: 2,
          },
          type: "loop",
          breakpoints: {
            1366: {
              perPage: 3,
            },
            980: {
              perPage: 3,
            },
            767: {
              perPage: 2,
              arrows: false,
            },
            480: {
              perPage: 1,
              perMove: 1,
              // rewind: false,
            },
          },
        });
        splideCat.on("drag", function () {
          const { Autoplay } = splideCat.Components;
          Autoplay.pause();
        });
        splideCat.mount(window.splide.Extensions);
      }

      if ($(".fs-slider-home").length) {
        let splideHomeBanner = new Splide(".fs-slider-home", {
          perPage: 1,
          perMove: 1,
          autoplay: true,
          interval: 6000,
          // focus: "center",
          type: "loop",
          paginationDirection: "ttb",
          // drag: "free",
          rewind: true,
          pauseOnHover: true,
          pauseOnFocus: true,
          // speed: 1400,
        });
        // const { Autoplay } = splideHomeBanner.Components;
        // Autoplay.pause();
        // splideHomeBanner.on('drag', function () {
        //      const { Autoplay } = splideHomeBanner.Components;
        //      Autoplay.pause();
        // });

        splideHomeBanner.on("drag", function () {
          const { Autoplay } = splideHomeBanner.Components;
          Autoplay.pause();
        });
        splideHomeBanner.mount();
      }

      if ($('#index .list--products[data-slider="true"]').length) {
        $('.list--products[data-slider="true"]').each(function () {
          let splideNew = new Splide(this.querySelector(".splide"), {
            type: "slide",
            perPage: 6,
            perMove: 2,
            drag: "true",
            lazyLoad: "sequential",
            autoplay: true,
            interval: 5000,
            arrows: true,
            // focus: 'center',
            padding: { left: "0", right: "60px" },
            gap: 20,
            breakpoints: {
              2700: {
                perPage: 5,
              },
              1920: {
                perPage: 4,
              },
              980: {
                perPage: 3,
              },
              767: {
                perPage: 2,
                arrows: false,
              },
              560: {
                perPage: 1,
                arrows: false,
              },
              // 640: {
              //     perPage: 2,
              // },
              // 480: {
              //     perMove: 1,
              // }
            },
          });
          splideNew.on("drag", function () {
            const { Autoplay } = splideNew.Components;
            Autoplay.pause();
          });
          splideNew.mount();
        });
      }

      if ($(".section--news").length) {
        let splideNews = new Splide(".section--news", {
          type: "slide",
          perPage: 3,
          perMove: 1,
          // autoplay: false,
          // interval: 1000,
          rewind: false,
          gap: 20,
          breakpoints: {
            2700: {
              perPage: 3,
              perMove: 1,
            },
            1920: {
              perPage: 3,
              perMove: 1,
            },
            1024: {
              perPage: 3,
              perMove: 1,
              padding: { left: "0", right: "60px" },
            },
            900: {
              perPage: 2,
              perMove: 1,
              padding: { left: "0", right: "60px" },
            },
            600: {
              perPage: 1,
              perMove: 1,
              padding: { left: "0", right: "60px" },
            },
          },
          //   type: "loop",
          // speed: 1400,
        });
        // const { Autoplay } = splideNews.Components;
        // Autoplay.pause();
        // splideNews.on('drag', function () {
        //      const { Autoplay } = splideNews.Components;
        //      Autoplay.pause();
        // });
        splideNews.mount();
      }

      $(".splide--slide").each(function () {});

      //   Splide.defaults = {
      //     type: "loop",
      //     autoplay: false,
      //     perPage: 4,
      //     interval: 8000,
      //     pauseOnHover: true,
      //     speed: 800,
      //     waitForTransition: false,
      //     padding: { left: "0", right: "60px" },
      //     pagination: false,
      //     breakpoints: {
      //       1200: {
      //         perPage: 3,
      //       },
      //       980: {
      //         perPage: 2,
      //       },
      //       767: {
      //         perPage: 1,
      //         arrows: false,
      //       },
      //       520: {
      //         perPage: 1,
      //         perMove: 1,
      //         arrows: false,
      //         autoplay: false,
      //         padding: { left: "0", right: "20px" },
      //       },
      //     },
      //   };
    }

    // Show Top Reabate
    // ==========================================================

    function showRebateInfo() {
      // let reb = prestashop.cart.discounts[1].name;

      // console.log(prestashop.cart.discounts[0].hasOwnProperty('name'));
      if (prestashop.cart.discounts.length > 0) {
        if (prestashop.cart.discounts[0].hasOwnProperty("name")) {
          let reb = prestashop.cart.discounts[0];
          $(".rebate-topinfo").addClass("show");
          $(".rebate-topinfo__val").text(
            "-" + parseInt(reb.reduction_percent, 10) + "% "
          );
          $(".rebate-topinfo__name").text(reb.description);
        }
      } else {
        $(".rebate-topinfo").hide();
      }
    }

    // detal btn back
    // if ($(".breadcrumb li:last").prev().find("a").attr("href")) {
    //   $(".detal-back-btn").attr(
    //     "href",
    //     $("#product .breadcrumb li:last").prev().find('a').attr('href')
    //   );
    // } else {
    //   $(".detal-back-btn").attr(
    //     "href",
    //     $(".breadcrumb li:first").find("a").attr("href")
    //   );
    // }

    $(".detal-back-btn").attr(
      "href",
      $("#product .breadcrumb li:last").prev().find("a").attr("href")
    );

    // Load promo section
    // ==========================================================

    function promoBasket() {
      if ($(".load--promo").length) {
        $(".load--promo .promo-list").load(
          prestashop.urls.base_url +
            "/index.php?controller=prices-drop #js-product-list",
          function () {
            let splideOps = {
              type: "loop",
              // drag: "free",
              padding: { left: "0", right: "15px" },
              perPage: 1,
              perMove: 1,
              autoplay: true,
              breakpoints: {
                1200: { perPage: 1, padding: 0 },
                980: { perPage: 1, padding: 0 },
                480: { perPage: 1 },
              },
            };

            $("[data-slider]").attr("data-slider", "build");
            sliderBuild(splideOps);

            window.lazyLoadInstance.update();
          }
        );
      }
    }

    // Promo Counter
    // ==========================================================

    function promoCounter() {
      function counter() {
        if ($(".promo-counterjs").length) {
          Date.prototype.addHours = function (h) {
            this.setHours(this.getHours() + h);
            return this;
          };

          let promoTime = sessionStorage.getItem("promoTime");

          if (promoTime === null) {
            sessionStorage.setItem("promoTime", new Date().addHours(4));
          }

          promoTime = sessionStorage.getItem("promoTime");

          let countTo = new Date(promoTime);
          let now = Date.now();
          let timeDifference = countTo - now;

          if (timeDifference <= 0) {
            sessionStorage.setItem("promoTime", new Date().addHours(1));
            promoTime = sessionStorage.getItem("promoTime");
            console.log("koniec promocji");
          }

          countDownToTime(promoTime);
        }
      }

      function countDownToTime(countTo) {
        countTo = new Date(countTo).getTime();
        var now = new Date(),
          countTo = new Date(countTo),
          timeDifference = countTo - now;

        var secondsInADay = 60 * 60 * 1000 * 24,
          secondsInAHour = 60 * 60 * 1000;

        days = Math.floor((timeDifference / secondsInADay) * 1);
        hours = Math.floor(
          ((timeDifference % secondsInADay) / secondsInAHour) * 1
        );
        mins = Math.floor(
          (((timeDifference % secondsInADay) % secondsInAHour) / (60 * 1000)) *
            1
        );
        secs = Math.floor(
          ((((timeDifference % secondsInADay) % secondsInAHour) % (60 * 1000)) /
            1000) *
            1
        );

        $(".counter").each(function () {
          var idEl = $(this);
          updateCounterDisplay(idEl, days, "d");
          updateCounterDisplay(idEl, hours, "h");
          updateCounterDisplay(idEl, mins, "m");
          updateCounterDisplay(idEl, secs, "s");
          clearTimeout(countDownToTime.interval);
          countDownToTime.interval = setTimeout(function () {
            countDownToTime(countTo);
          }, 1000);
        });
      }

      function updateCounterDisplay(element, timeUnit, unitClass) {
        if (splitNum(timeUnit, 1)[1] == "") {
          element.find(`.field--${unitClass}`)[0].innerHTML = "0";
          element.find(`.field--${unitClass}`)[1].innerHTML = splitNum(
            timeUnit,
            1
          )[0];
        } else {
          element.find(`.field--${unitClass}`)[0].innerHTML = splitNum(
            timeUnit,
            1
          )[0];
          element.find(`.field--${unitClass}`)[1].innerHTML = splitNum(
            timeUnit,
            1
          )[1];
        }
      }

      function splitNum(num, pos) {
        num = num.toString();
        return [num.substring(0, pos), num.substring(pos)];
      }

      $(document).on(
        "click",
        '[data-link-action="remove-voucher"]',
        function (e) {
          setTimeout(function () {
            counter();
            $(".promo-counterjs").addClass("visible");
          }, 2000);
        }
      );

      counter();
    }

    // order fixes

    function orderPage() {
      $(".checkout-step-3 .delivery-option")
        .find("input:checked")
        .closest(".delivery-radio")
        .addClass("border--selected");
      $(".checkout-step-3 .delivery-option").on("click", function () {
        $(".checkout-step-3 .delivery-radio").removeClass("border--selected");
        $(this).closest(".delivery-radio").addClass("border--selected");
      });
    }

    function fixMenuDropdown() {
      $(".page-menu__item.link")
        .not("#category-2")
        .mouseenter(function () {
          $(".page-menu__droplist").removeClass("show");
        });

      var timeoutId;

      $(".page-menu__item.has-drop")
        .not("#category-2")
        .mouseenter(function () {
          // Przechwytujemy aktualne sub-menu
          var $currentSubmenu = $(this).find(".page-menu__droplist").first();

          // Jeśli istnieje już aktywny timeout, go czyścimy
          if (timeoutId) {
            clearTimeout(timeoutId);
          }

          // Zamykamy wszystkie inne sub-menu oprócz tego, na które właśnie najechano
          $(".page-menu__droplist")
            .not($currentSubmenu)
            .first()
            .removeClass("show");

          // Pokazujemy sub-menu dla bieżącego elementu
          $currentSubmenu.addClass("show");
        })
        .mouseleave(function () {
          var $submenu = $(this).find(".page-menu__droplist").first();

          // Ustawiamy timeout, aby opóźnić znikanie menu
          timeoutId = setTimeout(function () {
            $submenu.removeClass("show");
          }, 500); // Czas opóźnienia wynosi 1 sekundę (1000 milisekund)
        });
    }

    function smallChanges() {
      // $(
      //   '<img src="https://fshop.pl/demo/themes/classic/assets/media/platnosci/pay.webp" />'
      // ).appendTo("#payment-option-3-container label");

      // $("<span>Zapłać później</span>").prependTo(
      //   "#payment-option-4-container label"
      // );

      $("#history table tr").each(function () {
        const tdurl = $(this).find(".details-history-press").attr("href");
        $(this).on("click", function () {
          // console.log(tdurl);
          window.location = tdurl;
        });
        // $(this).wrap('<div class="table-wrap"></div>');
      });

      $('a[href^="/"]')
        .not('a[href^="//"]')
        .each(function () {
          const url = $(this).attr("href");
          $(this).attr("href", prestashop.urls.base_url.slice(0, -1) + url);
        });

      if (getWH("width") < 768) {
        $('#index [data-slider="true"]').attr("data-col", 6);
      }

      $('img[src^="https://localhost/fshop"]').each(function () {
        $(this).attr(
          "src",
          $(this)
            .attr("src")
            .replace(
              "https://localhost/fshop/",
              window.prestashop.urls.base_url
            )
        );
      });

      $('a[href^="https://localhost/fshop"]').each(function () {
        $(this).attr(
          "href",
          $(this)
            .attr("href")
            .replace(
              "https://localhost/fshop/",
              window.prestashop.urls.base_url
            )
        );
      });
    }

    // Toggle
    // ==========================================================

    function toggleSection() {
      $(".toggle-content__link").on("click", function (e) {
        e.preventDefault();

        let $self = $(this);
        let $content = $self.next();
        $self.toggleClass("active");

        if ($self.hasClass("active")) {
          $content.stop().slideDown(600);
        } else {
          $content.stop().slideUp(400);
        }
      });
      $(".toggle-content__link.link--active").each(function () {
        $(this).trigger("click");
      });
    }

    function showDemo() {
      if (location.pathname.includes("demo")) {
        $(".demohide").removeClass("demohide");
      }
    }

    function eventsOnScroll() {
      if (!eventTimeout) {
        eventTimeout = setTimeout(function () {
          eventTimeout = null;
          // productGallery(current);
        }, 150);
      }
    }

    function eventsOnResize() {
      if (!eventResizeTimeout) {
        eventResizeTimeout = setTimeout(function () {
          eventResizeTimeout = null;
          // autoGrids();
          // prodSlider();

          getWH();
          checkMobile();
          if (getWH("width") < 768) {
            $('#index [data-slider="true"]').attr("data-col", 6);
          }
        }, 150);
      }
    }

    $(window).on("scroll", function () {
      current = $(window).scrollTop();
      eventsOnScroll(current);
    });

    $(window).on("resize", function () {
      current = $(window).scrollTop();
      eventsOnResize(current);
    });

    if (typeof prestashop !== "undefined") {
      prestashop.on("updateProductList", function (event) {
        console.log("updateProductList");
        setTimeout(function () {
          window.lazyLoadInstance.update();
          updateGrids();
        }, 100);
      });

      prestashop.on("updateFacets", function (event) {
        console.log("updateFacets");
        setTimeout(function () {
          window.lazyLoadInstance.update();
          updateGrids();
        }, 100);
      });

      prestashop.on("updateCart", function (event) {
        console.log("updateCart");
      });

      prestashop.on("changedCheckoutStep", function (event) {
        console.log("changedCheckoutStep");
      });

      prestashop.on("updatedProduct", function (event) {
        console.log("updatedProduct");
      });

      prestashop.on("responsive update", function (event) {
        $("body").removeClass("qm");
      });
    }

    // TUTAJ WRZUCAJMY JAKIES INITY Z ZEWNETRZNYCH WTYCZEK

    function pluginsLoaded() {
      Fancybox.bind("[data-fancybox]", {
        // Your custom options
      });
    }

    $(window).on("load", function () {
      lazyInit();
      checkMobile();
      getWH();
      bodyAnimation();
      grids();
      quickMode();
      filters();
      brandsHomepage();
      toggleSection();
      // promoBasket();
      promoCounter();
      showDemo();
      orderPage();
      fixMenuDropdown();
      smallChanges();
      sliders();

      pluginsLoaded();

      $(".history-go-back").on("click", function (e) {
        e.preventDefault();

        window.location =
          window.prestashop.breadcrumb.links.at(-2).url ||
          window.history.back();
        // window.history.back();
      });
    });
  };

  window.firmowy = new STARTER();
});
