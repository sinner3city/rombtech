<!-- Block search module TOP -->

<div id="search_widget" class="search_widget nav-top-search" data-search-controller-url="{$search_controller_url}">
  <form method="get" action="{$search_controller_url}" class="nav-top-search__form">
    <input type="hidden" name="controller" value="search" />

    <input type="text" name="s" value="" placeholder="Szukaj w katalogu" aria-label="Szukaj"
      class="ui-autocomplete-input nav-top-search__input" autocomplete="off" />
    <button type="submit" class="nav-top-search__btn nav-top__link link--search">
      <i class="material-icons">search</i>
    </button>
  </form>
</div>

<!-- /Block search module TOP -->