{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
  {if $nodes|count}
    <ul class="page-menu__list {if $depth === 1}flex-row flex-wrap{/if}" {if $depth == 0}{/if} data-depth="{$depth}">

      {foreach from=$nodes item=node}
        <li class="{if $node.children|count}has-drop{/if} {$node.type}{if $node.current} active {/if} page-menu__item"
          id="{$node.page_identifier}">
          {assign var=_counter value=$_counter+1}
          <a class="{if $depth >= 0}dropdown-item-on{/if}{if $depth === 1} dropdown-submenu{/if} page-menu__link"
            href="{$node.url}" data-depth="{$depth}" {if $node.open_in_new_window} target="_blank" {/if}>
            <span class="page-menu__label">{$node.label}</span>



            {if $node.children|count}
              {* Cannot use page identifier as we can have the same page several times *}
              {assign var=_expand_id value=10|mt_rand:100000}



            {/if}

          </a>

          {if $node.page_identifier != 'cms-category-5'}
            {if $node.children|count}
              <a href="#" class="page-menu__arrow">
                <span class="page-menu__drop-ico || material-icons">
                  expand_more
                </span>
              </a>
              <div {if $depth === 0} class="page-menu__droplist" {else} class="page-menu__droplist" {/if}
                id="top_sub_menu_{$_expand_id}">
                {menu nodes=$node.children depth=$node.depth parent=$node}
              </div>
            {/if}
          {/if}
        </li>
      {/foreach}
    </ul>
  {/if}
{/function}

<nav class="page-menu">
  <div class="page-menu__bg"></div>
  <div class="page-menu__scroll">
    {menu nodes=$menu.children}
  </div>
</nav>