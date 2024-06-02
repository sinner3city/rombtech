<div class="panel" id="hookDashboardZoneOne_facelogin">
    <div class="panel-heading">
        <i class="icon-puzzle-piece"></i> {l s='Facebook Login' mod='facelogin'}
    </div>
    <ul class="data_list_large">
        <li>
            <span class="data_label size_l">
                {l s='Customer accounts' mod='facelogin'}
                <small class="text-muted"><br>
                    {l s='Created with facebook login module' mod='facelogin'}
                </small>
			</span>
            <span class="data_value size_xxl">
			{$nb_of_fb_accounts}
			</span>
        </li>
    </ul>
    <span class="data_label size_md">
        {l s='Last 3 accounts' mod='facelogin'}
    </span>
    <table class="table table-bordered clearfix">
        {$last_accounts nofilter}
    </table>
</div>