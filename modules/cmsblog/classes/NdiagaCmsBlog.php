<?php


class NdiagaCmsBlog extends ObjectModel

{

	/** @var string Name */

	public $id_cmsblog;	

	/** @var string Name */

	
	/** @var string Name */

	public $number_post;	
	
	
	/** @var string Name */

	public $id_cms_category;
	

	/** @var string Name */

	public $cmsblog_img;	

    /**

     * @see ObjectModel::$definition

     */

    public static $definition = array(

        'table' => 'cmsblog',

        'primary' => 'id_cmsblog',

        'multilang' => FALSE,

        'fields' => array( 	            
			'number_post' =>array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),	
            'id_cms_category' =>array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId', 'required' => true),				
			'cmsblog_img'=>array('type' => self::TYPE_STRING, 'validate' => 'isCatalogName', 'size' => 32),	            	

        ),

    );
	
	
	 public static function loadDefaultCatery(){

        $result = Db::getInstance()->getRow('
		
            SELECT  cmb.`id_cms_category`

            FROM `'._DB_PREFIX_.'cmsblog` cmb

             '

        );

        

        return $result['id_cms_category'];

    }
	
	
	public static function getCMSCategories($recursive = false, $parent = 0)
	{
		if ($recursive === false)
		{
			$sql = 'SELECT bcp.`id_cms_category`, bcp.`id_parent`, bcp.`level_depth`, bcp.`active`, bcp.`position`, cl.`name`, cl.`link_rewrite`
					FROM `'._DB_PREFIX_.'cms_category` bcp
					INNER JOIN `'._DB_PREFIX_.'cms_category_lang` cl
					ON (bcp.`id_cms_category` = cl.`id_cms_category`)
					WHERE cl.`id_lang` = '.(int)Context::getContext()->language->id;
			if ($parent)
				$sql .= ' AND bcp.`id_parent` = '.(int)$parent;

			return Db::getInstance()->executeS($sql);
		}
		else
		{
			$sql = 'SELECT bcp.`id_cms_category`, bcp.`id_parent`, bcp.`level_depth`, bcp.`active`, bcp.`position`, cl.`name`, cl.`link_rewrite`
					FROM `'._DB_PREFIX_.'cms_category` bcp
					INNER JOIN `'._DB_PREFIX_.'cms_category_lang` cl
					ON (bcp.`id_cms_category` = cl.`id_cms_category`)
					WHERE cl.`id_lang` = '.(int)Context::getContext()->language->id;
			if ($parent)
				$sql .= ' AND bcp.`id_parent` = '.(int)$parent;

			$results = Db::getInstance()->executeS($sql);
			foreach ($results as $result)
			{
				$sub_categories = NdiagaCmsBlog::getCMSCategories(true, $result['id_cms_category']);
				if ($sub_categories && count($sub_categories) > 0)
					$result['sub_categories'] = $sub_categories;
				$categories[] = $result;
			}

			return isset($categories) ? $categories : false;
		}
       
	}
	
	
	public static function getCMSPages($id_cms_category, $id_shop = false)
	{
        $id_shop = ($id_shop !== false) ? $id_shop : Context::getContext()->shop->id;

		$sql = 'SELECT c.`id_cms`, cl.`meta_title`, cl.`link_rewrite` , cl.`content`
			FROM `'._DB_PREFIX_.'cms` c
			INNER JOIN `'._DB_PREFIX_.'cms_shop` cs
			ON (c.`id_cms` = cs.`id_cms`)
			INNER JOIN `'._DB_PREFIX_.'cms_lang` cl
			ON (c.`id_cms` = cl.`id_cms`)
			WHERE c.`id_cms_category` = '.(int)$id_cms_category.'
			AND cs.`id_shop` = '.(int)$id_shop.'
			AND cl.`id_lang` = '.(int)Context::getContext()->language->id.'
			AND c.`active` = 1
			ORDER BY `position`';

		return Db::getInstance()->executeS($sql);
	}
	
	
	
	
	
	
	
	
	
	
	
	

	    public function processImage($FILES,$id) { 

            if (isset($FILES['BANNER_IMAGE']) && isset($FILES['BANNER_IMAGE']['tmp_name']) && !empty($FILES['BANNER_IMAGE']['tmp_name'])) {

                if ($error = ImageManager::validateUpload($FILES['BANNER_IMAGE'], 4000000))

                    return $message='Invalid image';

                else {

                    $ext = substr($FILES['BANNER_IMAGE']['name'], strrpos($FILES['BANNER_IMAGE']['name'], '.') + 1);

                    $file_name = $id . '.' . $ext;

                    $path = _PS_MODULE_DIR_ .'cmsblog/uploads/' . $file_name;       



                    if (!move_uploaded_file($FILES['BANNER_IMAGE']['tmp_name'], $path))

                        return $message='An error occurred while attempting to upload the file.';

                    else {

                        $posts_types =ImageType::getImagesTypes('products');

                        foreach ($posts_types as  $image_type)

			{

            $dir = _PS_MODULE_DIR_ .'cmsblog/uploads/'.$id.'-'.stripslashes($image_type['name']).'.jpg';
            if (file_exists($dir))
						unlink($dir);

			}

			foreach ($posts_types as $image_type)

			{

             ImageManager::resize($path,_PS_MODULE_DIR_ .'cmsblog/uploads/'.$id.'-'.stripslashes($image_type['name']).'.jpg',

            (int)$image_type['width'], (int)$image_type['height']

            );

			}

                    }

                }

            } 		

			

    }


	

}



