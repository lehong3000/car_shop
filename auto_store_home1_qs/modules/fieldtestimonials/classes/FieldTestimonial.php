<?php
if (!defined('_CAN_LOAD_FILES_') AND _PS_VERSION_ > '1.5')
	exit;
class FieldTestimonial extends ObjectModel{
	public $id_fieldtestimonials;
	public $name_post;
	public $email;
	public $company;
	public $address;
	public $media_link;
	public $media_link_id;
	public $button_link;
	public $media;
	public $media_type;
	public $content;
	public $date_add;
	public $position;
	public $active;
	public static $definition = array(
		'table' => 'fieldtestimonials',
		'primary' => 'id_fieldtestimonials',
		'multilang' => true,
		'multishop' => true,
		'fields' => array(
			'name_post' => array('type' => self::TYPE_STRING, 'validate'=> 'isGenericName', 'required' => true, 'size' => 100),
			'email' => array('type' => self::TYPE_STRING, 'validate'=> 'isEmail', 'required' => true, 'size' => 100),
			'company' => array('type' => self::TYPE_STRING, 'validate'=> 'isGenericName', 'required' => false, 'size' => 255),
			'address' => array('type' => self::TYPE_STRING, 'validate'=> 'isGenericName', 'required' => true, 'size' => 500),
			'media_link' => array('type' => self::TYPE_STRING, 'validate'=> 'isUrl', 'required' => false, 'size' => 500),
			'media_link_id' => array('type' => self::TYPE_STRING, 'validate'=> 'isGenericName', 'required' => false, 'size' => 20),
			'button_link' => array('type' => self::TYPE_STRING, 'validate'=> 'isUrl', 'required' => false, 'size' => 500),
			'media' => array('type' => self::TYPE_STRING, 'validate'=> 'isGenericName', 'required' => false, 'size' => 255),
			'media_type' => array('type' => self::TYPE_STRING, 'validate'=> 'isGenericName', 'required' => false, 'size' => 255),
			'content' => array('type' => self::TYPE_HTML, 'lang' => true, 'validate'=> 'isCleanHtml','required' => true),
			'date_add' => array('type' => self::TYPE_DATE, 'validate'=> 'isDate', 'required' => false),
			'position' => array('type' => self::TYPE_INT, 'validate'=> 'isInt', 'required' => false),
			'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool', 'required' => false),
		)
	);
	public function __construct($id = NULL, $id_lang = NULL, $id_shop = null){
		Shop::addTableAssociation('fieldtestimonials', array('type' => 'shop'));
		parent::__construct($id, $id_lang, $id_shop);
	}
	public function add($autodate = true, $null_values = false){
		if ($this->position <= 0)
			$this->position = FieldTestimonial::getHigherPosition() + 1;
        return parent::add();
	}
	public function update($null_values = false){
		return parent::update($null_values);
	}
	public function delete(){
		$res=true ;
		$res &= parent::delete();
		$res &= Db::getInstance()->execute('
			DELETE FROM `'._DB_PREFIX_.'fieldtestimonials_shop`
			WHERE `id_shop` = '.(int)$this->id
		);
		if($res){
			if(file_exists(_FIELD_TESTIMONIAL_MEDIA_DIR_.$this->media))
			@unlink(_FIELD_TESTIMONIAL_MEDIA_DIR_.$this->media);
			return true;
		}
	}
	public function deleteImage($force_delete = false) {
		$res = parent::deleteImage($force_delete);
		if ($res) {
		if(file_exists(_FIELD_TESTIMONIAL_MEDIA_DIR_.$this->media))
			@unlink(_FIELD_TESTIMONIAL_MEDIA_DIR_.$this->media);
			return true;
		}
		return $res;
	}
	
	public static function getAllTestimonials($p = 1, $n = false, $id = false, $excpt_id = false){
		$context = Context::getContext();
		$id_shop = $context->shop->id;
		$sql= 'SELECT * FROM '._DB_PREFIX_.'fieldtestimonials lt ';
		$sql .=' INNER JOIN '._DB_PREFIX_.'fieldtestimonials_shop ls ON (lt.id_fieldtestimonials = ls.id_fieldtestimonials) ';
		$sql .=' WHERE lt.active = 1 AND ls.id_shop ='.$id_shop .( $id ? ' AND lt.id_fieldtestimonials ='.(int)$id :'').
		( $excpt_id ? ' AND lt.id_fieldtestimonials != '.(int)$excpt_id :'');
		$sql .= ' ORDER BY lt.position ASC '.($n ? ' LIMIT '.($p - 1) *$n .','.(int)$n: '');
		$results = Db::getInstance()->executeS($sql);
		return $results;
	}
	public function updatePosition($way, $position){
		if (!$res = Db::getInstance()->executeS('
			SELECT `id_fieldtestimonials`, `position`
			FROM `'._DB_PREFIX_.'fieldtestimonials`
			ORDER BY `position` ASC'
		))
		return false;
		foreach ($res as $testimonial)
		if ((int)$testimonial['id_fieldtestimonials'] == (int)$this->id)
		$moved_testimonial = $testimonial;
		if (!isset($moved_testimonial) || !isset($position))
		return false;
		// < and > statements rather than BETWEEN operator
		// since BETWEEN is treated differently according to databases
		return (Db::getInstance()->execute('
			UPDATE `'._DB_PREFIX_.'fieldtestimonials`
			SET `position`= `position` '.($way ? '- 1' : '+ 1').'
			WHERE `position`
			'.($way
		? '> '.(int)$moved_testimonial['position'].' AND `position` <= '.(int)$position
		: '< '.(int)$moved_testimonial['position'].' AND `position` >= '.(int)$position.'
		'))
		&& Db::getInstance()->execute('
			UPDATE `'._DB_PREFIX_.'fieldtestimonials`
			SET `position` = '.(int)$position.'
			WHERE `id_fieldtestimonials` = '.(int)$moved_testimonial['id_fieldtestimonials']));
	}
	/**
	 * Reorders testimonialspositions.
	 * Called after deleting a carrier.
	 *
	 * @since 1.5.0
	 * @return bool $return
	 */
	public static function cleanPositions()
	{
		$return = true;
		$sql = '
			SELECT `id_fieldtestimonials`
			FROM `'._DB_PREFIX_.'fieldtestimonials`
			ORDER BY `position` ASC';
		$result = Db::getInstance()->executeS($sql);
		$i = 0;
		foreach ($result as $value)
		$return = Db::getInstance()->execute('
			UPDATE `'._DB_PREFIX_.'fieldtestimonials`
			SET `position` = '.(int)$i++.'
			WHERE `id_fieldtestimonials` = '.(int)$value['id_fieldtestimonials']);
		return $return;
	}
	
	/**
	 * Gets the highest testimonials position
	 *
	 * @since 1.5.0
	 * @return int $position
	 */
	public static function getHigherPosition()
	{
		$sql = 'SELECT MAX(`position`)FROM `'._DB_PREFIX_.'fieldtestimonials`';
		$position = DB::getInstance()->getValue($sql);
		return (is_numeric($position)) ? $position : -1;
	}
	
	public static function getTypevideo($link =null){
		$defaultLinkCheck = array(
			'youtube' => 'www.youtube.com',
			'vimeo' => 'vimeo.com'
		);
		$exLink = explode('/',$link);
		$typevideoLink = $exLink[2] ;
		if ($defaultLinkCheck['youtube'] == $typevideoLink){
			$typevideo = 'youtube' ;
		}else {
			$typevideo = 'vimeo';
		}
		return $typevideo ;
	}
	public static function getIdFromLinkInput($link = null){
		if(empty($link)){
			return '';
		}else{
			$defaultLinkCheck = array(
			'youtube' => 'www.youtube.com',
			'vimeo' => 'vimeo.com'
		);
		$exLink = explode('/',$link); //
		$cmpYoutubeLink = @strcmp($exLink[2],$defaultLinkCheck['youtube']);
		$cmpVimeoLink = @strcmp($exLink[2],$defaultLinkCheck['vimeo']);
		if($cmpYoutubeLink == 0 AND !empty($exLink[3])){
			$youtube_id = explode('=',$exLink[3]);
			return end($youtube_id);
		}
		elseif($cmpVimeoLink == 0 AND !empty($exLink[3])){
			return end($exLink);
			}
		}
	}
}
