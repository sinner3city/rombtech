<?php



class vatValidation
{
	const WSDL = "http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl";
	private $_client = null;

	private $_options  = array(
						'debug' => false,
						);	
	
	private $_valid = false;
	private $_data = array();
	
	public function __construct($options = array()) {
		
		foreach($options as $option => $value) {
			$this->_options[$option] = $value;
		}
		
		if(!class_exists('SoapClient')) {
			throw new Exception('The Soap library has to be installed and enabled');
		}
				
		try {
			$this->_client = new SoapClient(self::WSDL, array('trace' => false, 'connection_timeout' => 6));
		} catch(Exception $e) {
			$this->trace('Vat Translation Error', $e->getMessage());
		}
	}

	public function check($countryCode, $vatNumber) {

		$rs = $this->_client->checkVat( array('countryCode' => $countryCode, 'vatNumber' => $vatNumber) );

		if($this->isDebug()) {
			$this->trace('Web Service result', $this->_client->__getLastResponse());	
		}

		if($rs->valid) {

			//d($rs);
			$this->_valid = true;

			$this->_data = array(
				'denomination' => 	$rs->name,
				'name' => 			$rs->name,
				'address' => 		$rs->address,
			);
			return true;
		} else {
			$this->_valid = false;
			$this->_data = array();
		    return false;
		}
	}

	public function isValid() {
		return $this->_valid;
	}
	
	public function getDenomination() {
		return isset($this->_data['denomination']) ? $this->_data['denomination'] : '';
	}
	
	public function getName() {
		return isset($this->_data['name']) ? $this->_data['name'] : '';
	}
	
	public function getAddress() {
		return isset($this->_data['address']) ? $this->_data['address'] : '';
	}
	
	public function isDebug() {
		return ($this->_options['debug'] === true);
	}
	private function trace($title,$body) {
		echo '<h2>TRACE: '.$title.'</h2><pre>'. htmlentities($body).'</pre>';
	}
	
}

?>
