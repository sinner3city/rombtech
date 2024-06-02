{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
  {if $field.name eq "alias"}
    {* we don't ask for alias here *}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name="address_form_url"}
    <form
      method="POST"
      action="{url entity='order' params=['id_address' => $id_address]}"
      data-id-address="{$id_address}"
      data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
    >
{/block}

{block name='form_fields' append}
  <input type="hidden" name="saveAddress" value="{$type}">
  {if $type === "delivery"}
    <div class="form-group row">

      <div class="custom-checkbox">
        <label>
          <input name = "use_same_address" id="use_same_address" type = "checkbox" value = "1" {if $use_same_address} checked {/if}>
          <span class="ck--fake"><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
          <span class="ck--label">{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</span>
        </label>
      </div>


    </div>
  {/if}
{/block}

{block name='form_buttons'}
  {if !$form_has_continue_button}
    <a class="js-cancel-address cancel-address" href="{url entity='order' params=['cancelAddress' => {$type}]}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
    
    <button type="submit" class="btn btn-primary">{l s='Save' d='Shop.Theme.Actions'}</button>
  {else}
    <form>
      {if $customer.addresses|count > 0}
        <a class="js-cancel-address cancel-address mg-hor-s" href="{url entity='order' params=['cancelAddress' => {$type}]}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
      {/if}

      
      <button type="submit" class="continue btn btn-primary" name="confirm-addresses" value="1">
        {l s='Zapisz adres' d='Shop.Theme.Actions'}
    </button>
    </form>
  {/if}
{/block}
