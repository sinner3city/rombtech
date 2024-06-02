{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  {hook h='displayPersonalInformationTop' customer=$customer}

  {if $customer.is_logged && !$customer.is_guest}
    <div class="flex-row-center">
      <p class="identity">
        {* [1][/1] is for a HTML tag. *}
        {l s='Connected as [1]%firstname% %lastname%[/1].'
                d='Shop.Theme.Customeraccount'
                sprintf=[
                  '[1]' => "<a href='{$urls.pages.identity}'>",
        '[/1]' => "</a>",
        '%firstname%' => $customer.firstname,
        '%lastname%' => $customer.lastname
        ]
        }
      </p>
      <p>
        {* [1][/1] is for a HTML tag. *}
        {l
                s='Not you? [1]Log out[/1]'
                d='Shop.Theme.Customeraccount'
                sprintf=[
                '[1]' => "<a href='{$urls.actions.logout}'>",
        '[/1]' => "</a>"
        ]
        }
      </p>
    </div>
    {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
      <p><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>
    {/if}

    <div class="step-button-next">
      <form method="GET" action="{$urls.pages.order}">
        <button class="continue btn btn-primary float-xs-right" name="controller" type="submit" value="order">
          {l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </form>

    </div>

  {else}


    <div class="login-by login-by__google   t-center">
      <h4>Połącz konto z: </h4><br>
      {hook h='displayCustomerAccountForm'}

    </div>


    <ul class="nav nav-inline my-2 check-account flex-row-center-mid hide" role="tablist">


      <li class="nav-item">
        <a class="btn--secondary nav-link {if !$show_login_form}active2{/if}" data-link-action="show-login-form"
          data-toggle="tab" href="#checkout-login-form" role="tab" aria-controls="checkout-login-form" {if $show_login_form}
          aria-selected="true" {/if}>
          Masz już konto? Zaloguj się
          {* <!-- {l s='Sign in' d='Shop.Theme.Actions'} --> *}
        </a>
      </li>
      <li class="nav-item">
        <strong class="nav-separator">lub</strong>
      </li>


      <li class="nav-item  ">
        <a class="btn--primary nav-link  {if $show_login_form}active{/if}" data-toggle="tab" href="#checkout-guest-form"
          role="tab" aria-controls="checkout-guest-form" {if !$show_login_form} aria-selected="true" {/if}>
          Zamów jako nowy klient
        {*if $guest_allowed}
                {l s='Order as a guest' d='Shop.Theme.Checkout'}

        {else}

          {l s='Create an account' d='Shop.Theme.Customeraccount'}

        {/if*}
      </a>
    </li>
  </ul>



  <div class="tab-content flex-row-center">
    <div class="tab-pane active {if !$show_login_form}{/if}" id="checkout-login-form" role="tabpanel"
      {if !$show_login_form}aria-hidden="true" {/if}>
      {* <!-- <h3 class="step-subtitle"><strong>Masz już konto?</strong> Zaloguj się</h3> --> *}
      {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}

      {* <div class="logowanie">
    <h4 class="title">lub zaloguj się</h4>
      {render file='checkout/_partials/login-form.tpl' ui=$login_form}
      </div> *}
    </div>

    <div class="tab-pane {if $show_login_form}{/if}" id="checkout-guest-form" role="tabpanel"
      {if $show_login_form}aria-hidden="true" {/if}>
      {* <!-- <h3 class="step-subtitle">Podaj informacje do realizacji</h3> --> *}
      {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
    </div>

  </div>


{/if}
{/block}