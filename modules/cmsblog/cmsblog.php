<?php
if (!defined('_PS_VERSION_')){
  exit;
 } 
 
require_once(dirname(__FILE__) . '/classes/NdiagaCmsBlog.php');  



  class CmsBlog extends Module
  
  { 
  
  public function __construct()
  {
    $this->name = 'cmsblog';
    $this->tab = 'front_office_features';
    $this->version = '1.0.0';
    $this->author = 'NdiagaSoft';
    $this->need_instance = 0;
    $this->ps_versions_compliancy = array('min' => '1.6', 'max' =>_PS_VERSION_);
    $this->bootstrap = true;
 
    parent::__construct();
 
    $this->displayName = $this->l('CMS Blog');
    $this->description = $this->l('Create a simple blog with CMS pages.');
 
    $this->confirmUninstall = $this->l('Are you sure you want to uninstall?'); 
    
  }
  
  
  
  public function install()
{
  if (Shop::isFeatureActive())
    Shop::setContext(Shop::CONTEXT_ALL);
	$sql = array();
	
        $sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'cmsblog` (
                  `id_cmsblog` int(10) unsigned NOT NULL AUTO_INCREMENT,                  
				  `id_cms_category` int(10) NOT NULL,				  	
                   `number_post` int(10) NOT NULL,				  
				  `cmsblog_img` varchar(250) NULL,                  				  
                  PRIMARY KEY (`id_cmsblog`)
                ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8';
		
      
 
  if (!parent::install() ||  	
    !$this->registerHook('header')||	
	!$this->registerHook('displayHome')||
    !$this->runSql($sql)||
    !Configuration::updateValue('POST_NUMBER',5) 	
  )
    return false;
 
  return true;
}
       public function uninstall()
    {
        $sql = array();
	
        $sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'cmsblog`';
		
		
		if (!parent::uninstall()||
		    !$this->runSql($sql)||
            !Configuration::deleteByName('POST_NUMBER')			
           )
                return false;
           
           return true;
    }
	
	
   public function runSql($sql) {
        foreach ($sql as $s) {
			if (!Db::getInstance()->Execute($s)){
				return FALSE;
			}
        }
        
        return TRUE;
    }	
  
        public function getContent()
    {
          $output = null;
		  
		 
		  
		    if (Tools::isSubmit('submit'.$this->name))
      {
        $my_module_name =Tools::getValue('POST_NUMBER');
		$test_one=Tools::getValue('test_one');
        if (!$my_module_name || empty($my_module_name) || !Validate::isGenericName($my_module_name))
            $output .= $this->displayError($this->l('Invalid Configuration value'));
        else
        {
            Configuration::updateValue('POST_NUMBER', $my_module_name);
			Configuration::updateValue('test_one', $test_one);
			$cat=new NdiagaCmsBlog();
			$cat->number_post=$my_module_name;
			$cat->id_cms_category=Tools::getValue('id_cms_category');
			$cat->cmsblog_img='';
			
			if(!empty($cat) && empty($cat->id)){ 
			$cat->add();
			}
			else { $cat->update();}
		
            $output.= $this->displayConfirmation($this->l('Settings updated'));
        }
      }  	  
			   
		
		   $output.=$this->displayForm().'</br>'.$this->InnovativesLabs();
      
            return $output;
			
			
    }  
	
   
   
	
	
    
        public function hookDisplayHeader()
      {
           $this->context->controller->addCSS(($this->_path).'css/cmsblog.css', 'all');
      }    
   
  
  
      public function innovativesLabs(){
  
          return $this->display(__FILE__, 'innovativeslabs.tpl');
  
      }
  
  
      public function hookdisplayHome()
   {
     
	 
	 $id_cms_category=NdiagaCmsBlog::loadDefaultCatery();
	 $cmsCats=NdiagaCmsBlog::getCMSCategories(false, (int)$id_cms_category);
	 $cmsPages=NdiagaCmsBlog::getCMSPages($id_cms_category, false);
	  
	 $this->context->smarty->assign(array(	            				
                'cmsCats' =>$cmsCats,
                'id_cms_category'=>$id_cms_category,
                'Into_text'	=>Configuration::get('test_one'),
                'cmsPages'=>$cmsPages				
		        
            ));
			
   
       return $this->display(__FILE__, 'displayHome.tpl');
		
   }

  
  
  
  	   public function displayForm()
  {
    // Get default language
    $default_lang = (int)Configuration::get('PS_LANG_DEFAULT');
	$id_shop=Context::getContext()->shop->id;;
	$id_lang=(int)Context::getContext()->language->id; 
    
	
	//$cms_categories=CMSCategory::getCategories($id_lang,true,true);
	$cms_categories=CMSCategory::getSimpleCategories($id_lang);
    // Init Fields form array
    $fields_form[0]['form'] = array(
        'legend' => array(
            'title' => $this->l('Settings'),
			'icon' => 'icon-cogs'
        ),
        'input' => array(
            array(
                'type' => 'text',
                'label' => $this->l('Intro Text:'),
                'name' => 'test_one',
                'size' => 20,
                'required' => true,				
				'desc' => $this->l('add some text.')
            ),			

            array(
                'type' => 'text',
                'label' => $this->l('Post Number:'),
                'name' => 'POST_NUMBER',
                'size' => 20,
                'required' => true,
				'desc' => $this->l('How many articles to show in the home page.')
            ),				
			array(
					'type' => 'select',
					'label' => $this->l('Select a CMS Category'),
					'name' => 'id_cms_category',
					
					'options' => array(
						'query' =>$cms_categories,
						'id' => 'id_cms_category',
						'name' => 'name'
						
					),
					'desc' => $this->l('Select the default CMS category for the Blog.')
                      ),
					  
			 

      					  
        ),
        'submit' => array(
            'title' => $this->l('Save'),           
        )
    );
     
    $helper = new HelperForm();
     
    // Module, token and currentIndex
    $helper->module = $this;
    $helper->name_controller = $this->name;
    $helper->token = Tools::getAdminTokenLite('AdminModules');
    $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;
     
    // Language
    $helper->default_form_language = $default_lang;
    $helper->allow_employee_form_lang = $default_lang;
     
    // Title and toolbar
    $helper->title = $this->displayName;
    $helper->show_toolbar = true;        // false -> remove toolbar
    $helper->toolbar_scroll = true;      // yes - > Toolbar is always visible on the top of the screen.
    $helper->submit_action = 'submit'.$this->name;
    $helper->toolbar_btn = array(
        'save' =>
        array(
            'desc' => $this->l('Save'),
            'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules'),
        ),
        'back' => array(
            'href' => AdminController::$currentIndex.'&token='.Tools::getAdminTokenLite('AdminModules'),
            'desc' => $this->l('Back to list')
        )
    );
     
    /*Load current value*/    
	
    $helper->fields_value['POST_NUMBER'] =Configuration::get('POST_NUMBER')? Configuration::get('POST_NUMBER'):Tools::getValue('POST_NUMBER');
	$helper->fields_value['id_cms_category'] =Configuration::get('id_cms_category')? Configuration::get('id_cms_category'):Tools::getValue('id_cms_category');
	
	$helper->fields_value['test_one'] =Configuration::get('test_one')? Configuration::get('test_one'):Tools::getValue('test_one');
	
	
     
    return $helper->generateForm($fields_form);
	
	
    }   
 
   
   
  
  
  }

