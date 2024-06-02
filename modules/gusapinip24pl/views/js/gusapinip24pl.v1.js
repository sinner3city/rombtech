/**
 * Copyright 2015-2017 by NETCAT (www.netcat.pl)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author NETCAT
 * @copyright 2015-2017 by NETCAT (www.netcat.pl)
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */

/**
 * Fetch invoice data and fill form
 * @param force false - get current data, true - force refresh
 * @param form form name
 */
function nip24GetInvoiceData(force, form)
{
	// validate
	var nip = $('#nip24_' + form + '_form_nip').val();
	
	$.post(baseDir + "modules/gusapinip24pl/ajax.php", {
			'ajax': 'true',
			'action': 'check',
			'nip': nip
		},
		function(res) {
			$('#nip24_' + form + '_form_nip').parent().removeClass('form-error');
			$('#nip24_' + form + '_form_nip').parent().removeClass('form-ok');

			if (res.result != 'OK') {
				$('#nip24_' + form + '_form_nip').parent().addClass('form-error');

				$('#nip24_' + form + '_form_err').show();
				$('#nip24_' + form + '_form_q').hide();

				return;
			}

			// valid, fetch
			$('body').css('cursor', 'wait');
			
			$.post(baseDir + "modules/gusapinip24pl/ajax.php", {
					'ajax': 'true',
					'action': 'get',
					'nip': nip,
					'force': force,
					'form': form
				},
				function(data) {
					var form_id = data['form_id'];
					
					$.each(data, function(id, value) {
						if ($('#' + form_id + ' #' + id).length > 0) {
							$('#' + form_id + ' #' + id).val(value);
							
							$('#' + form_id + ' #' + id).parent().removeClass('form-error');
							$('#' + form_id + ' #' + id).parent().removeClass('form-ok');

							if (value.length > 0) {
								$('#' + form_id + ' #' + id).parent().addClass('form-ok');
							}
						}
					});
	
					$('body').css('cursor', 'default');
					
					$('#nip24_' + form + '_form_err').hide();
					$('#nip24_' + form + '_form_q').show();
				},
				'json'
			);	
		},
		'json'
	);	
}

/* EOF */