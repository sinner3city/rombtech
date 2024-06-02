<?php

if ( ! defined( '_PS_VERSION_' ) ) {
	exit;
}

/**
 * CLASSY_CSSJSUpdater updater class for the module.
 */
class ClassyCustomcssupdater {

	private $product_id = 36509;
	private $store_url  = 'https://classydevs.com/';

	/**
	 * __construct
	 *
	 * @return void
	 */
	public function __construct() {

        $todate        = Configuration::get( 'CLASSY_CSSJS_DATE' );

        $stable = Configuration::get( 'CLASSY_CSSJS_STABLE' );
        $d_link = Configuration::get( 'CLASSY_CSSJS_DLINK' );

        if ( isset( $stable ) && isset( $d_link ) ) {
            if ( $stable == '' && $d_link == '' ) {
                $today = date( 'Y-m-d' );
                if ( $today > $todate ) {
                    Configuration::updateValue( 'CLASSY_CSSJS_DATE', $today );
                    $this->classycssjs_get_update();
                    Configuration::updateValue( 'CLASSY_CSSJS_STABLE', '' );
			        Configuration::updateValue( 'CLASSY_CSSJS_DLINK', '' );
                }
            } else {
                $this->show_notification( $stable, $d_link );
            }
        }
	}

    

	/**
	 * CLASSY_CSSJS_get_update checks the api if the module has update available.
	 */
	public function classycssjs_get_update() {
		$api_params = array(
			'edd_action' => 'get_version',
			'item_id'    => $this->product_id,
			'version'    => CLASSSY_CSSJS_VERSION,
			'url'        => _PS_BASE_URL_SSL_,
			'key'        => Configuration::get( 'PS_SHOP_EMAIL' ),
		);
		$url        = $this->store_url . '?' . http_build_query( $api_params );

		$response = $this->wp_remote_get(
			$url,
			array(
				'timeout' => 20,
				'headers' => '',
				'header'  => false,
				'json'    => true,
			)
		);

		$responsearray = Tools::jsonDecode( $response, true );
	}

	private function wp_remote_get( $url, $args = array() ) {
		return $this->getHttpCurl( $url, $args );
	}


	private function getHttpCurl( $url, $args ) {
		global $wp_version;
		if ( function_exists( 'curl_init' ) ) {
			$defaults = array(
				'method'      => 'GET',
				'timeout'     => 30,
				'redirection' => 5,
				'httpversion' => '1.0',
				'blocking'    => true,
				'headers'     => array(
					'Authorization'   => 'Basic ',
					'Content-Type'    => 'application/x-www-form-urlencoded;charset=UTF-8',
					'Accept-Encoding' => 'x-gzip,gzip,deflate',
				),
				'body'        => array(),
				'cookies'     => array(),
				'user-agent'  => 'Prestashop' . $wp_version,
				'header'      => true,
				'sslverify'   => false,
				'json'        => false,
			);

			$args         = array_merge( $defaults, $args );
			$curl_timeout = ceil( $args['timeout'] );
			$curl         = curl_init();
			if ( $args['httpversion'] == '1.0' ) {
				curl_setopt( $curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0 );
			} else {
				curl_setopt( $curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1 );
			}
			curl_setopt( $curl, CURLOPT_USERAGENT, $args['user-agent'] );
			curl_setopt( $curl, CURLOPT_URL, $url );
			curl_setopt( $curl, CURLOPT_CONNECTTIMEOUT, $curl_timeout );
			curl_setopt( $curl, CURLOPT_TIMEOUT, $curl_timeout );
			curl_setopt( $curl, CURLOPT_POST, 1 );
			curl_setopt( $curl, CURLOPT_POSTFIELDS, 'api=true' );
			$ssl_verify = $args['sslverify'];
			curl_setopt( $curl, CURLOPT_SSL_VERIFYPEER, $ssl_verify );
			curl_setopt( $curl, CURLOPT_SSL_VERIFYHOST, ( $ssl_verify === true ) ? 2 : false );
			$http_headers = array();
			if ( $args['header'] ) {
				curl_setopt( $curl, CURLOPT_HEADER, $args['header'] );
				foreach ( $args['headers'] as $key => $value ) {
					$http_headers[] = "{$key}: {$value}";
				}
			}
			curl_setopt( $curl, CURLOPT_FOLLOWLOCATION, false );
			if ( defined( 'CURLOPT_PROTOCOLS' ) ) { // PHP 5.2.10 / cURL 7.19.4
				curl_setopt( $curl, CURLOPT_PROTOCOLS, CURLPROTO_HTTP | CURLPROTO_HTTPS );
			}
			if ( is_array( $args['body'] ) || is_object( $args['body'] ) ) {
				$args['body'] = http_build_query( $args['body'] );
			}
			$http_headers[] = 'Content-Length: ' . strlen( $args['body'] );
			curl_setopt( $curl, CURLOPT_RETURNTRANSFER, 1 );
			$response = curl_exec( $curl );
			if ( $args['json'] ) {
				return $response;
			}
			$header_size    = curl_getinfo( $curl, CURLINFO_HEADER_SIZE );
			$responseHeader = substr( $response, 0, $header_size );
			$responseBody   = substr( $response, $header_size );
			$error          = curl_error( $curl );
			$errorcode      = curl_errno( $curl );
			$info           = curl_getinfo( $curl );
			curl_close( $curl );
			$info_as_response            = $info;
			$info_as_response['code']    = $info['http_code'];
			$info_as_response['message'] = 'OK';
			$response                    = array(
				'body'     => $responseBody,
				'headers'  => $responseHeader,
				'info'     => $info,
				'response' => $info_as_response,
				'error'    => $error,
				'errno'    => $errorcode,
			);
			return $response;
		}
		return false;
	}

	private function show_notification( $v, $d ) {
		$msg = 'There is a new version of Classy Product Extra Tab is available.';
        return;
        ?>
<div class="row">
    <div class="col-lg-12">
        <div class="update-content-area">
            <div class="update-ajax-loader" style="display:none">
                <div class="lds-dual-ring"></div>
            </div>
            <div class="update-logo-and-text">
                <div class="update-header-text-and-version">
                    <h4 class="update_msg"><?php echo $msg; ?></h4>
                    <h6 class="update_vsn"><?php echo 'Version: ' . $v; ?></h6>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
	}

	public static function init() {

		new ClassyCustomcssupdater();

	}

}