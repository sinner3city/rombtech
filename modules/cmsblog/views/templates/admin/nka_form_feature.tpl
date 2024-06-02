{literal}
<script>
function showUserFeatures(str) {
    if (str == "") {
        document.getElementById("txtHintFeature").innerHTML ="<p style='color:red;'>No Group Selected!</p>";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("txtHintFeature").innerHTML = xmlhttp.responseText;
            }
        };
        xmlhttp.open("GET","./../modules/featureslogo/getFeatures.php?q="+str,true);
        xmlhttp.send();
    }
}
</script>
{/literal}
<pre style="background:#333;color:#fff;"><h4> {l s='Managing features logo' mod='featureslogo'}</h4></pre>
<hr/>
<form id="dynamic_banner_form" class="defaultForm  form-horizontal" action="index.php?controller=AdminModules&amp;configure=featureslogo&amp;tab_module=front_office_features&amp;module_name=featureslogo&amp;token={$token}" method="post" enctype="multipart/form-data" novalidate="">
<input type="hidden" name="submitAddnewProductFeatureLogo" value="1">			
		<div class="panel" id="fieldset_0">												
	<div class="panel-heading">
	<i class="icon-edit"></i>						
	 {l s='Features logos' mod='featureslogo'}
   </div>   
   <div class="form-group">
	<label for="BANNER_TEXT" class="control-label col-lg-3 ">
	{l s='From group' mod='featureslogo'}
	</label>						
<div class="col-lg-9 ">
   <select name="id_feature"  id="id_feature" onchange="showUserFeatures(this.value)">
   {foreach from=$features_groups item=feature}
   <option value="{$feature.id_feature}" >
   {$feature.name}
   </option>
   {/foreach}
   </select>						
	<p class="help-block">	
	{l s='Select a type you wish to add: Payment/Shipping .' mod='featureslogo'}
	</p>																	
</div>							
</div>   
<div class="form-group">
	<label for="id_feature_value" class="control-label col-lg-3 ">
	 {l s='Feature:' mod='featureslogo'}
	</label>	
<div id="txtHintFeature">
<p class="help-block">	
	{l s='Select a feature group to display its values here.' mod='featureslogo'}
</p>	
</div>
					
</div>												
<div class="form-group">													
	<label for="BANNER_IMAGE_FEATURE" class="control-label col-lg-3 ">	
	{l s='Image:' mod='featureslogo'}
	</label>							
<div class="col-lg-9 ">
								
<div class="form-group">
	<div class="col-sm-6">
		<input id="BANNER_IMAGE_FEATURE" type="file" name="BANNER_IMAGE_FEATURE" class="hide">
		<div class="dummyfile input-group">
			<span class="input-group-addon"><i class="icon-file"></i></span>
			<input id="BANNER_IMAGE-name_features" type="text" name="filename" readonly="">
			<span class="input-group-btn">
				<button id="BANNER_IMAGE-selectbutton_features" type="button" name="submitAddAttachments" class="btn btn-default">
					<i class="icon-folder-open"></i> {l s='Add file' mod='featureslogo'}			
			</button>
	</span>
		</div>
	</div>
</div>

{literal}
<script type="text/javascript">

	$(document).ready(function(){
		$('#BANNER_IMAGE-selectbutton_features').click(function(e) {
			$('#BANNER_IMAGE_FEATURE').trigger('click');
		});

		$('#BANNER_IMAGE-name_features').click(function(e) {
			$('#BANNER_IMAGE_FEATURE').trigger('click');
		});

		$('#BANNER_IMAGE-name_features').on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#BANNER_IMAGE-name_features').on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#BANNER_IMAGE-name_features').on('drop', function(e) {
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
			$('#BANNER_IMAGE_FEATURE')[0].files = files;
			$(this).val(files[0].name);
		});

		$('#BANNER_IMAGE_FEATURE').change(function(e) {
			if ($(this)[0].files !== undefined)
			{
				var files = $(this)[0].files;
				var name  = '';

				$.each(files, function(index, value) {
					name += value.name+', ';
				});

				$('#BANNER_IMAGE-name_features').val(name.slice(0, -2));
			}
			else // Internet Explorer 9 Compatibility
			{
				var name = $(this).val().split(/[\\/]/);
				$('#BANNER_IMAGE-name_features').val(name[name.length-1]);
			}
		});

		if (typeof BANNER_IMAGE_max_files !== 'undefined')
		{
			$('#BANNER_IMAGE_FEATURE').closest('form').on('submit', function(e) {
				if ($('#BANNER_IMAGE_FEATURE')[0].files.length > BANNER_IMAGE_max_files) {
					e.preventDefault();
					alert('You can upload a maximum of  files');
				}
			});
		}
	});
</script>
{/literal}
																
								
<p class="help-block">	
	{l s='Add the associated image.' mod='featureslogo'}
</p>																	
</div>							
</div>										
						
	<div class="panel-footer">
<button type="submit" value="1" id="" name="submitAddnewProductFeatureLogo" class="btn btn-default pull-right" style="display:block;">
<i class="process-icon-save"></i>{l s='Save'}
</button>
</div>						
</div>
		
	</form>