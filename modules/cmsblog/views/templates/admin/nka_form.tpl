{literal}
<script>
function showUser(str) {
    if (str == "") {
        document.getElementById("txtHint").innerHTML ="<p style='color:red;'>No Group Selected!</p>";
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
                document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
            }
        };
        xmlhttp.open("GET","./../modules/featureslogo/getAttributes.php?q="+str,true);
        xmlhttp.send();
    }
}
</script>
{/literal}

<pre style="background:#333777;color:#fff;"><h4> {l s='Managing Attributes logo' mod='featureslogo'}</h4></pre>
<hr/>
<form id="dynamic_banner_form" class="defaultForm  form-horizontal" action="index.php?controller=AdminModules&amp;configure=featureslogo&amp;tab_module=front_office_features&amp;module_name=featureslogo&amp;token={$token}" method="post" enctype="multipart/form-data" novalidate="">
<input type="hidden" name="submitAddnewProductAttributeLogo" value="1">			
		<div class="panel" id="fieldset_0">												
	<div class="panel-heading">
	<i class="icon-edit"></i>						
	 {l s='Attributes logos' mod='featureslogo'}
   </div>   
   <div class="form-group">
	<label for="BANNER_TEXT" class="control-label col-lg-3 ">
	{l s='From group' mod='featureslogo'}
	</label>						
<div class="col-lg-9 ">
   <select name="id_attribute_group"  id="id_attribute_group" onchange="showUser(this.value)">
   {foreach from=$attribute_groups item=group}
   <option value="{$group.id_attribute_group}"   >
   {$group.name}
   </option>
   {/foreach}
   </select>						
	<p class="help-block">	
	{l s='Select a type you wish to add: Payment/Shipping .' mod='featureslogo'}
	</p>																	
</div>							
</div>   
<div class="form-group">
	<label for="id_attribute" class="control-label col-lg-3 ">
	 {l s='Attribute:' mod='featureslogo'}
	</label>	
<div id="txtHint">
<p class="help-block">	
	{l s='Select an attribute group to display its values here.' mod='featureslogo'}
</p>	
</div>
					
</div>												
<div class="form-group">													
	<label for="BANNER_IMAGE" class="control-label col-lg-3 ">	
	{l s='Image:' mod='featureslogo'}
	</label>							
<div class="col-lg-9 ">
								
<div class="form-group">
	<div class="col-sm-6">
		<input id="BANNER_IMAGE" type="file" name="BANNER_IMAGE" class="hide">
		<div class="dummyfile input-group">
			<span class="input-group-addon"><i class="icon-file"></i></span>
			<input id="BANNER_IMAGE-name" type="text" name="filename" readonly="">
			<span class="input-group-btn">
				<button id="BANNER_IMAGE-selectbutton" type="button" name="submitAddAttachments" class="btn btn-default">
					<i class="icon-folder-open"></i> {l s='Add file' mod='featureslogo'}			
			</button>
	</span>
		</div>
	</div>
</div>

{literal}
<script type="text/javascript">

	$(document).ready(function(){
		$('#BANNER_IMAGE-selectbutton').click(function(e) {
			$('#BANNER_IMAGE').trigger('click');
		});

		$('#BANNER_IMAGE-name').click(function(e) {
			$('#BANNER_IMAGE').trigger('click');
		});

		$('#BANNER_IMAGE-name').on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#BANNER_IMAGE-name').on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#BANNER_IMAGE-name').on('drop', function(e) {
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
			$('#BANNER_IMAGE')[0].files = files;
			$(this).val(files[0].name);
		});

		$('#BANNER_IMAGE').change(function(e) {
			if ($(this)[0].files !== undefined)
			{
				var files = $(this)[0].files;
				var name  = '';

				$.each(files, function(index, value) {
					name += value.name+', ';
				});

				$('#BANNER_IMAGE-name').val(name.slice(0, -2));
			}
			else // Internet Explorer 9 Compatibility
			{
				var name = $(this).val().split(/[\\/]/);
				$('#BANNER_IMAGE-name').val(name[name.length-1]);
			}
		});

		if (typeof BANNER_IMAGE_max_files !== 'undefined')
		{
			$('#BANNER_IMAGE').closest('form').on('submit', function(e) {
				if ($('#BANNER_IMAGE')[0].files.length > BANNER_IMAGE_max_files) {
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
<button type="submit" value="1" id="" name="submitAddnewProductAttributeLogo" class="btn btn-default pull-right" style="display:block;">
<i class="process-icon-save"></i>{l s='Save'}
</button>
</div>						
</div>
		
	</form>