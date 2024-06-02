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
	
	$.post(nip24BaseDir + "modules/gusapinip24pl/ajax.php", {
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
			
			$.post(nip24BaseDir + "modules/gusapinip24pl/ajax.php", {
					'ajax': 'true',
					'action': 'get',
					'nip': nip,
					'force': force,
					'form': form
				},
				function(data) {
					var form_id = data['form_id'];
					
					$.each(data, function(id, value) {
						if ($(form_id + ' ' + id).length > 0) {
							$(form_id + ' ' + id).val(value);
							
							$(form_id + ' ' + id).parent().removeClass('form-error');
							$(form_id + ' ' + id).parent().removeClass('form-ok');

							if (value.length > 0) {
								$(form_id + ' ' + id).parent().addClass('form-ok');
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

/**
 * Get search block HTML code
 * @param form form name
 * @return string
 */
function nip24GetSearchBlock(form)
{
	return '<div id="nip24_' + form + '_form" class="std nip24-search-block">'
		+ '<p class="info-title">' + nip24StrEnter + '</p>'
		+ '<div class="form-group row">'
		+ '<label for="nip24_' + form + '_form_nip" class="col-md-3 form-control-label">' + nip24StrVatID + '</label>'
		+ '<div class="col-md-6">'
		+ '<input id="nip24_' + form + '_form_nip" class="form-control validate" data-validate="isGenericName" name="nip" type="text"></input>'
		+ '</div>'
		+ '</div>'
		+ '<div class="form-group row">'
		+ '<div class="col-md-3"></div>'
		+ '<div class="col-md-6">'
		+ '<button id="nip24_' + form + '_form_get" class="nip24-btn-fetch btn btn-primary" type="button" name="get" onclick="nip24GetInvoiceData(false, \'' + form + '\');">' + nip24StrGet + '</button>'
		+ '<p id="nip24_' + form + '_form_err" class="nip24-err required" style="display:none;">' + nip24StrVatIDInvalid + '</p>'
		+ '<p id="nip24_' + form + '_form_q" class="nip24-q required" style="display:none;">' + nip24StrOutdated + ' <a href="javascript:nip24GetInvoiceData(true, \'' + form + '\');">' + nip24StrUpdate + '</a></p>'
		+ '</div>'
		+ '</div>'
		+ '<div class="clearfix"></div>'
		+ '</div>';
}

$(document).ready(function() {
	if ($('#add_address').length > 0) {
		$('#add_address').prepend(nip24GetSearchBlock('add'));
	}

	if ($('#delivery-address div.js-address-form').length > 0) {
		$('#delivery-address div.js-address-form').prepend(nip24GetSearchBlock('delivery'));
	}

	if ($('#invoice-address div.js-address-form').length > 0) {
		$('#invoice-address div.js-address-form').prepend(nip24GetSearchBlock('invoice'));
	}

	if ($('div.address-form div.js-address-form form').length > 0) {
		$('div.address-form div.js-address-form form').prepend(nip24GetSearchBlock('address'));
	}

	if ($('#new_account_form').length > 0) {
		if ($('#new_account_form #guest_email').length > 0) {
			$(nip24GetSearchBlock('guest')).insertBefore($('#new_account_form #guest_email').parent());
		}
		else if ($('#new_account_form #email').length > 0) {
			$(nip24GetSearchBlock('guest')).insertBefore($('#new_account_form #email').parent());
		}

		$(nip24GetSearchBlock('invoice')).insertBefore($('#new_account_form #firstname_invoice').parent());
	}
});

/* EOF */