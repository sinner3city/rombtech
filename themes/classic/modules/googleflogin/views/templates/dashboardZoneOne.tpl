<div class="panel" id="hookDashboardZoneOne_googleflogin">
    <div class="panel-heading">
        <i class="icon-puzzle-piece"></i> {l s='Google Login' mod='googleflogin'}
    </div>
    <ul class="data_list_large">
        <li>
            <span class="data_label size_l">
                {l s='Customer accounts' mod='googleflogin'}
                <small class="text-muted"><br>
                    {l s='Created with google login module' mod='googleflogin'}
                </small>
			</span>
            <span class="data_value size_xxl">
			{$nb_of_fb_accounts}
			</span>
        </li>
    </ul>
    <span class="data_label size_md">
        {l s='Last 10 accounts' mod='googleflogin'}
    </span>
    <table class="table table-bordered clearfix">
        {$last_accounts nofilter}
    </table>
</div>