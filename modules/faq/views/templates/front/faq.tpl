{extends file=$layout}


{block name='breadcrumbs'}{/block}

{block name='content'}

  <section id="main">

    

    
          
        <header class="page-header">
          <h1>
          FAQ - Najczęściej zadawane pytania
          {*l s='FAQ - Domande frequenti' mod='faq'*}
          </h1>
              </header>
            


          
              <div class="faq-container">

                      {$i = 0|truncate:0:""}
                      {foreach from=$faqs item=faq}
                      {$i++|truncate:0:""}
                      <details>
                      <summary> {$i} - {$faq.question nofilter}</summary>
                      <p class="answer">{$faq.answer nofilter}</p>
                      </details>
                      <br>
                      {/foreach}

                      </div>
                      

                </div>

</section>
{/block}