
  
  

<div class="product-add-to-cart">
    {if !$configuration.is_catalog}
    

      {block name='product_quantity'}
        <div class="product-quantity clearfix">


          <div class="product-top-info">

                {block name='product_availability'}
                    <span id="product-availability">
                      {if $product.show_availability && $product.availability_message}
                          {if $product.availability == 'available'}
                          <i class="material-icons rtl-no-flip product-available">verified</i>
                          {elseif $product.availability == 'last_remaining_items'}
                          <i class="material-icons product-last-items">&#xE002;</i>
                          {else}
                          <i class="material-icons product-unavailable">&#xE14B;</i>
                          {/if}
                          {$product.availability_message}
                      {/if}
                    </span>
                {/block}

                <a href="#" onClick="window.print()" class="btn-print-cart">
                  <i class="material-icons"> print </i>
                  <span>Wydrukuj</span>
                </a>

        </div>

    {/block} <!-- end product_prices -->


    
                                        
    {block name='product_prices'}

        <div class="qty-add">

          <div class="qty">
            <input
              type="number"
              name="qty"
              id="quantity_wanted"
              value="{$product.quantity_wanted}"
              class="input-group"
              min="{$product.minimal_quantity}"
              aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
            >
          </div>
  
          <div class="add">
            <button
              class="btn btn-primary add-to-cart"
              data-button-action="add-to-cart"
              type="submit"
              {if !$product.add_to_cart_url}
                disabled
              {/if}

              {if $product.customization_required}
                data-tooltip="Wypełnij sekcję Dostosowanie Produktu (powyżej)" {/if}
            >
              <i class="material-icons shopping-cart">&#xE547;</i>
              <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
            </button>
            
          </div>

      </div>
      {*include file='catalog/_partials/product-prices.tpl'*}
  
          {hook h='displayProductActions' product=$product}
        </div>
      {/block}

  
      {block name='product_minimal_quantity'}
        <p class="product-minimal-quantity">
          {if $product.minimal_quantity > 1}
            {l
            s='The minimum purchase order quantity for the product is %quantity%.'
            d='Shop.Theme.Checkout'
            sprintf=['%quantity%' => $product.minimal_quantity]
            }
          {/if}
        </p>
      {/block}
    {/if}
  </div>
  