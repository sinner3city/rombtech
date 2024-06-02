<div class="panel" id="hookDashboardZoneOne_fblogin">
    <div class="panel-heading">
        <i class="icon-puzzle-piece"></i> {l s='Facebook Login' mod='fblogin'}
    </div>
    {if $update_availablility != NULL}
        <div class="alert alert-danger">
            {$update_availablility|replace:'http://MyPresta.eu':'<a href="https://mypresta.eu" target="blank">MyPresta.eu</a>' nofilter}
        </div>
    {/if}
    <ul class="data_list_large">
        <li>
            <span class="data_label size_l">
                {l s='Customer accounts' mod='fblogin'}
                <small class="text-muted"><br>
                    {l s='Created with facebook login module' mod='fblogin'}
                </small>
			</span>
            <span class="data_value size_xxl">
			{$nb_of_fb_accounts}
			</span>
        </li>
    </ul>
    <span class="data_label size_md">
        {l s='Last 3 accounts' mod='fblogin'}
    </span>
    <table class="table table-bordered clearfix">
        {$last_accounts nofilter}
    </table>
</div>