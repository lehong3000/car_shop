<?php
/*
*  2015 Fieldthemes
*
*  @author Fieldthemes <fieldthemes@gmail.com>
*/

if (!defined('_PS_VERSION_'))
	exit;
use PrestaShop\PrestaShop\Core\Module\WidgetInterface;
use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Core\Product\ProductListingPresenter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;
use PrestaShop\PrestaShop\Adapter\BestSales\BestSalesProductSearchProvider;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchContext;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchQuery;
use PrestaShop\PrestaShop\Core\Product\Search\SortOrder;
class FieldBestSellers extends Module
{
	public function __construct()
	{
		$this->name = 'fieldbestsellers';
		$this->tab = 'front_office_features';
		$this->version = '1.0';
		$this->author = 'Fieldthemes';
		$this->need_instance = 0;
		$this->bootstrap = true;

		parent::__construct();

		$this->displayName = $this->l('Field Bestsellers');
		$this->description = $this->l('Adds a slider displaying bestseller products.');
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
	}

	public function install()
	{
		$this->_clearCache('*');

		if (!parent::install()
			|| !$this->registerHook('header')
			|| !$this->registerHook('bestsellers')
			|| !$this->registerHook('leftColumn')
			|| !$this->registerHook('actionOrderStatusPostUpdate')
			|| !$this->registerHook('addproduct')
			|| !$this->registerHook('updateproduct')
			|| !$this->registerHook('deleteproduct')
			|| !ProductSale::fillProductSales()
		)
			return false;
                        $this->_createConfigs();
                        $this->_createTab();
                        $this->generateCss();
                        
		return true;
	}

	public function uninstall()
	{
		$this->_clearCache('*');
                $this->_deleteConfigs();
                $this->_deleteTab();
                
		return parent::uninstall();
	}
        
        /* ------------------------------------------------------------- */
        /*  CREATE CONFIGS
        /* ------------------------------------------------------------- */
        private function _createConfigs()
        {
            $languages = $this->context->language->getLanguages();
            foreach ($languages as $language){
                $title[$language['id_lang']] = 'Top sellers';
            }
            $response = Configuration::updateValue('FIELD_BESTSELLERS_TO_DISPLAY', 3);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_DISPLAY', 1);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_TITLE', $title);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_MAXITEM', 1);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_MEDIUMITEM', 1);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_ROWITEM', 3);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_AUTOSCROLL', 0);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_AUTOSCROLLDELAY', 5000);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_PAUSEONHOVER', 0);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_PAGINATION', 0);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_NAVIGATION', 0);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_BG_IMAGE', '');
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_BG_COVER', 0);
            $response &= Configuration::updateValue('FIELD_BESTSELLERS_BG_REPEAT', 0);

            return $response;
        }
        
        /* ------------------------------------------------------------- */
        /*  DELETE CONFIGS
        /* ------------------------------------------------------------- */
        private function _deleteConfigs()
        {
            $response = Configuration::deleteByName('FIELD_BESTSELLERS_TITLE');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_MAXITEM');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_MEDIUMITEM');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_ROWITEM');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_AUTOSCROLL');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_PAGINATION');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_NAVIGATION');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_AUTOSCROLLDELAY');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_PAUSEONHOVER');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_TO_DISPLAY');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_DISPLAY');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_BG_IMAGE');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_BG_COVER');
            $response &= Configuration::deleteByName('FIELD_BESTSELLERS_BG_REPEAT');

            return $response;
        }
        
        /* ------------------------------------------------------------- */
        /*  CREATE THE TAB MENU
        /* ------------------------------------------------------------- */
        private function _createTab()
        {
            $response = true;

            // First check for parent tab
            $parentTabID = Tab::getIdFromClassName('AdminFieldMenu');

            if ($parentTabID) {
                $parentTab = new Tab($parentTabID);
            } else {
                $parentTab = new Tab();
                $parentTab->active = 1;
                $parentTab->name = array();
                $parentTab->class_name = "AdminFieldMenu";
                foreach (Language::getLanguages() as $lang){
                    $parentTab->name[$lang['id_lang']] = "Fieldthemes";
                }
                $parentTab->id_parent = 0;
                $parentTab->module = '';
                $response &= $parentTab->add();
            }
// Check for parent tab2
			$parentTab_2ID = Tab::getIdFromClassName('AdminFieldMenuSecond');
			if ($parentTab_2ID) {
				$parentTab_2 = new Tab($parentTab_2ID);
			}
			else {
				$parentTab_2 = new Tab();
				$parentTab_2->active = 1;
				$parentTab_2->name = array();
				$parentTab_2->class_name = "AdminFieldMenuSecond";
				foreach (Language::getLanguages() as $lang) {
					$parentTab_2->name[$lang['id_lang']] = "FieldThemes Configure";
				}
				$parentTab_2->id_parent = $parentTab_2->id;
				$parentTab_2->module = '';
				$response &= $parentTab_2->add();
			}
			// Created tab
            $tab = new Tab();
            $tab->active = 1;
            $tab->class_name = "AdminFieldTopSellers";
            $tab->name = array();
            foreach (Language::getLanguages() as $lang){
                $tab->name[$lang['id_lang']] = "Configure top sellers";
            }
            $tab->id_parent = $parentTab_2->id;
            $tab->module = $this->name;
            $response &= $tab->add();

            return $response;
        }


        /* ------------------------------------------------------------- */
        /*  DELETE THE TAB MENU
        /* ------------------------------------------------------------- */
        private function _deleteTab()
        {
            $id_tab = Tab::getIdFromClassName('AdminFieldTopSellers');
			if($id_tab){
				$tab = new Tab($id_tab);
				$tab->delete();
			}
			// Get the number of tabs inside our parent tab
			// If there is no tabs, remove the parent
			$parentTab_2ID = Tab::getIdFromClassName('AdminFieldMenuSecond');
			if($parentTab_2ID){
				$tabCount_2 = Tab::getNbTabs($parentTab_2ID);
				if ($tabCount_2 == 0) {
					$parentTab_2 = new Tab($parentTab_2ID);
					$parentTab_2->delete();
				}
			}
			// Get the number of tabs inside our parent tab
			// If there is no tabs, remove the parent
			$parentTabID = Tab::getIdFromClassName('AdminFieldMenu');
			if($parentTabID){
				$tabCount = Tab::getNbTabs($parentTabID);
				if ($tabCount == 0){
					$parentTab = new Tab($parentTabID);
					$parentTab->delete();
				}
			}
			return true;
        }


	public function hookAddProduct($params)
	{
		$this->_clearCache('*');
	}

	public function hookUpdateProduct($params)
	{
		$this->_clearCache('*');
	}

	public function hookDeleteProduct($params)
	{
		$this->_clearCache('*');
	}

	public function hookActionOrderStatusPostUpdate($params)
	{
		$this->_clearCache('*');
	}

	/**
	 * Called in administration -> module -> configure
	 */
	public function getContent()
	{
                $languages = $this->context->language->getLanguages();
		$output = '';
		if (Tools::isSubmit('submitBestSellers'))
		{
                        $title = array();

                        foreach ($languages as $language){
                            if (Tools::isSubmit('FIELD_BESTSELLERS_TITLE_'.$language['id_lang'])){
                                $title[$language['id_lang']] = Tools::getValue('FIELD_BESTSELLERS_TITLE_'.$language['id_lang']);
                            }
                        }
                        if (isset($title) && $title){
                            Configuration::updateValue('FIELD_BESTSELLERS_TITLE', $title);
                        }

                        if (Tools::isSubmit('FIELD_BESTSELLERS_AUTOSCROLL')){
                            Configuration::updateValue('FIELD_BESTSELLERS_AUTOSCROLL', Tools::getValue('FIELD_BESTSELLERS_AUTOSCROLL'));
                        }
                        if (Tools::isSubmit('FIELD_BESTSELLERS_BG_IMAGE')){
                            Configuration::updateValue('FIELD_BESTSELLERS_BG_IMAGE', Tools::getValue('FIELD_BESTSELLERS_BG_IMAGE'));
                        }
                        if (Tools::isSubmit('FIELD_BESTSELLERS_BG_COVER')){
                            Configuration::updateValue('FIELD_BESTSELLERS_BG_COVER', Tools::getValue('FIELD_BESTSELLERS_BG_COVER'));
                        }
                        if (Tools::isSubmit('FIELD_BESTSELLERS_DISPLAY')){
                            Configuration::updateValue('FIELD_BESTSELLERS_DISPLAY', (int)Tools::getValue('FIELD_BESTSELLERS_DISPLAY'));
                        }
                        if (Tools::isSubmit('FIELD_BESTSELLERS_PAUSEONHOVER')){
                            Configuration::updateValue('FIELD_BESTSELLERS_PAUSEONHOVER', (int)Tools::getValue('FIELD_BESTSELLERS_PAUSEONHOVER'));
                        }
                        if (Tools::isSubmit('FIELD_BESTSELLERS_PAGINATION')){
                            Configuration::updateValue('FIELD_BESTSELLERS_PAGINATION', (int)Tools::getValue('FIELD_BESTSELLERS_PAGINATION'));
                        }
                        if (Tools::isSubmit('FIELD_BESTSELLERS_NAVIGATION')){
                            Configuration::updateValue('FIELD_BESTSELLERS_NAVIGATION', (int)Tools::getValue('FIELD_BESTSELLERS_NAVIGATION'));
                        }
                        if (Tools::isSubmit('FIELD_BESTSELLERS_MAXITEM') || Tools::isSubmit('FIELD_BESTSELLERS_MEDIUMITEM') || Tools::isSubmit('FIELD_BESTSELLERS_ROWITEM') || Tools::isSubmit('FIELD_BESTSELLERS_TO_DISPLAY')){
                            if (Validate::isInt(Tools::getValue('FIELD_BESTSELLERS_MAXITEM')) && Validate::isInt(Tools::getValue('FIELD_BESTSELLERS_MEDIUMITEM')) && Validate::isInt(Tools::getValue('FIELD_BESTSELLERS_ROWITEM')) && Validate::isInt(Tools::getValue('FIELD_BESTSELLERS_TO_DISPLAY'))){
                                Configuration::updateValue('FIELD_BESTSELLERS_ROWITEM', Tools::getValue('FIELD_BESTSELLERS_ROWITEM'));
                                Configuration::updateValue('FIELD_BESTSELLERS_MAXITEM', Tools::getValue('FIELD_BESTSELLERS_MAXITEM'));
                                Configuration::updateValue('FIELD_BESTSELLERS_MEDIUMITEM', Tools::getValue('FIELD_BESTSELLERS_MEDIUMITEM'));
                                Configuration::updateValue('FIELD_BESTSELLERS_TO_DISPLAY', Tools::getValue('FIELD_BESTSELLERS_TO_DISPLAY'));
                            } else {
                                $errors[] = $this->l('value must be a numeric value!');
                            }
                        }
                        $this->generateCss();
			$this->_clearCache('*');
                        if (isset($errors) && count($errors))
                            $output .= $this->displayError(implode('<br />', $errors));
                        else
                            $output .= $this->displayConfirmation($this->l('Settings updated'));
		}

		return $output.$this->displayForm();
	}

	public function displayForm()
	{
                $id_default_lang = $this->context->language->id;
                $languages = $this->context->language->getLanguages();
                
		$fields_form = array(
			'form' => array(
				'legend' => array(
					'title' => $this->l('Settings'),
					'icon' => 'icon-cogs'
				),
				'input' => array(
                                        array(
                                                'type' => 'text',
                                                'name' => 'FIELD_BESTSELLERS_TITLE',
                                                'label' => $this->l('Title'),
                                                'desc' => $this->l('This title will appear just before the bestseller block, leave it empty to hide it completely'),
                                                'required' => false,
                                                'lang' => true,
                                            ),
                                        array(
						'type' => 'background_image',
						'label' => $this->l('Content  background image'),
						'name' => 'FIELD_BESTSELLERS_BG_IMAGE',
						'size' => 30,
					),
					array(
						'type' => 'select',
						'label' => $this->l('Content background repeat'),
						'name' => 'FIELD_BESTSELLERS_BG_REPEAT',
						'options' => array(
							'query' => array(array(
								'id_option' => 3,
								'name' => $this->l('Repeat XY')
								),
							array(
								'id_option' => 2,
								'name' => $this->l('Repeat X')
								),
							array(
								'id_option' => 1,
								'name' => $this->l('Repeat Y')
								),
							array(
								'id_option' => 0,
								'name' => $this->l('No repeat')
								)
							),
							'id' => 'id_option',
							'name' => 'name'
							)
					),
                                        array(
						'type' => 'switch',
						'label' => $this->l('Background-size: cover'),
						'name' => 'FIELD_BESTSELLERS_BG_COVER',
						'is_bool' => true,
						'desc' => $this->l('If enable image background will cover entire block'),
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => true,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => false,
								'label' => $this->l('Disabled')
							)
						),
					),
					array(
						'type' => 'text',
						'label' => $this->l('Items to display'),
						'name' => 'FIELD_BESTSELLERS_TO_DISPLAY',
						'desc' => $this->l('Determine the number of product to display in this block'),
                                                'suffix' => 'item',
						'class' => 'fixed-width-xs',
					),
					array(
						'type' => 'switch',
						'label' => $this->l('Always display this block'),
						'name' => 'FIELD_BESTSELLERS_DISPLAY',
						'desc' => $this->l('Show the block even if no best sellers are available.'),
						'is_bool' => true,
						'values' => array(
							array(
								'id' => 'active_on',
								'value' => 1,
								'label' => $this->l('Enabled')
							),
							array(
								'id' => 'active_off',
								'value' => 0,
								'label' => $this->l('Disabled')
							)
						),
					),
                                        array(
                                                'type' => 'text',
                                                'name' => 'FIELD_BESTSELLERS_MAXITEM',
                                                'label' => $this->l('Column item'),
                                                'desc' => $this->l('Number column of item showing'),
                                                'suffix' => 'item',
                                                'class' => 'fixed-width-xs',
                                                'required' => false,
                                                'lang' => false,
                                        ),
                                        array(
                                                'type' => 'text',
                                                'name' => 'FIELD_BESTSELLERS_MEDIUMITEM',
                                                'label' => $this->l('Column item on medium screen'),
                                                'desc' => $this->l('Number column of item showing'),
                                                'suffix' => 'item',
                                                'class' => 'fixed-width-xs',
                                                'required' => false,
                                                'lang' => false,
                                        ),
                                        array(
                                                'type' => 'text',
                                                'name' => 'FIELD_BESTSELLERS_ROWITEM',
                                                'label' => $this->l('Row item'),
                                                'desc' => $this->l('Number row of item showing'),
                                                'suffix' => 'item',
                                                'class' => 'fixed-width-xs',
                                                'required' => false,
                                                'lang' => false,
                                        ),
                                        array(
                                            'type' => 'switch',
                                            'label' => $this->l('Auto scroll'),
                                            'desc' => $this->l('Scroll the item automatically'),
                                            'name' => 'FIELD_BESTSELLERS_AUTOSCROLL',
                                            'required' => false,
                                            'is_bool' => true,
                                            'values' => array(
                                                array(
                                                    'id' => 'autoscroll_on',
                                                    'value' => 1,
                                                    'label' => $this->l('On')
                                                ),
                                                array(
                                                    'id' => 'autoscroll_off',
                                                    'value' => 0,
                                                    'label' => $this->l('Off')
                                                )
                                            )
                                        ),
                                        array(
                                            'type' => 'text',
                                            'name' => 'FIELD_BESTSELLERS_AUTOSCROLLDELAY',
                                            'label' => $this->l('Auto scroll delay'),
                                            'desc' => $this->l('Delay between the auto scrolls'),
                                            'suffix' => 'milliseconds',
                                            'required' => false,
                                            'lang' => false,
                                        ),
                                        array(
                                            'type' => 'switch',
                                            'label' => $this->l('Pause on hover'),
                                            'desc' => $this->l('Pause the carousel on mouse hover'),
                                            'name' => 'FIELD_BESTSELLERS_PAUSEONHOVER',
                                            'required' => false,
                                            'is_bool' => true,
                                            'values' => array(
                                                array(
                                                    'id' => 'pauseonhover_on',
                                                    'value' => 1,
                                                    'label' => $this->l('On')
                                                ),
                                                array(
                                                    'id' => 'pauseonhover_off',
                                                    'value' => 0,
                                                    'label' => $this->l('Off')
                                                )
                                            )
                                        ),
                                        array(
                                            'type' => 'switch',
                                            'label' => $this->l('Show pagination'),
                                            'name' => 'FIELD_BESTSELLERS_PAGINATION',
                                            'required' => false,
                                            'is_bool' => true,
                                            'values' => array(
                                                array(
                                                    'id' => 'pagination_on',
                                                    'value' => 1,
                                                    'label' => $this->l('On')
                                                ),
                                                array(
                                                    'id' => 'pagination_off',
                                                    'value' => 0,
                                                    'label' => $this->l('Off')
                                                )
                                            )
                                        ),
                                        array(
                                            'type' => 'switch',
                                            'label' => $this->l('Show navigation'),
                                            'name' => 'FIELD_BESTSELLERS_NAVIGATION',
                                            'required' => false,
                                            'is_bool' => true,
                                            'values' => array(
                                                array(
                                                    'id' => 'navigation_on',
                                                    'value' => 1,
                                                    'label' => $this->l('On')
                                                ),
                                                array(
                                                    'id' => 'navigation_off',
                                                    'value' => 0,
                                                    'label' => $this->l('Off')
                                                )
                                            )
                                        )
				),
				'submit' => array(
					'title' => $this->l('Save')
				)
			)
		);

		$helper = new HelperForm();
		$helper->module = $this;
                $helper->name_controller = $this->name;
                $helper->token = Tools::getAdminTokenLite('AdminModules');
                $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;

                $helper->default_form_language = $id_default_lang;
                $helper->allow_employee_form_lang = $id_default_lang;

                $helper->title = $this->displayName;
                $helper->show_toolbar = true;
                $helper->toolbar_scroll = true;
                $helper->submit_action = 'submitBestSellers';

                foreach($languages as $language){
                    $helper->languages[] = array(
                        'id_lang' => $language['id_lang'],
                        'iso_code' => $language['iso_code'],
                        'name' => $language['name'],
                        'is_default' => ($id_default_lang == $language['id_lang'] ? 1 : 0)
                    );
                }

                // Load current values  
                $helper->fields_value['FIELD_BESTSELLERS_MAXITEM'] = Configuration::get('FIELD_BESTSELLERS_MAXITEM');
                $helper->fields_value['FIELD_BESTSELLERS_MEDIUMITEM'] = Configuration::get('FIELD_BESTSELLERS_MEDIUMITEM');
                $helper->fields_value['FIELD_BESTSELLERS_ROWITEM'] = Configuration::get('FIELD_BESTSELLERS_ROWITEM');
                $helper->fields_value['FIELD_BESTSELLERS_AUTOSCROLL'] = Configuration::get('FIELD_BESTSELLERS_AUTOSCROLL');
                $helper->fields_value['FIELD_BESTSELLERS_AUTOSCROLLDELAY'] = Configuration::get('FIELD_BESTSELLERS_AUTOSCROLLDELAY');
                $helper->fields_value['FIELD_BESTSELLERS_PAUSEONHOVER'] = Configuration::get('FIELD_BESTSELLERS_PAUSEONHOVER');
                $helper->fields_value['FIELD_BESTSELLERS_PAGINATION'] = Configuration::get('FIELD_BESTSELLERS_PAGINATION');
                $helper->fields_value['FIELD_BESTSELLERS_NAVIGATION'] = Configuration::get('FIELD_BESTSELLERS_NAVIGATION');
                $helper->fields_value['FIELD_BESTSELLERS_TO_DISPLAY'] = Configuration::get('FIELD_BESTSELLERS_TO_DISPLAY');
                $helper->fields_value['FIELD_BESTSELLERS_DISPLAY'] = Configuration::get('FIELD_BESTSELLERS_DISPLAY');
                $helper->fields_value['FIELD_BESTSELLERS_BG_IMAGE'] = Configuration::get('FIELD_BESTSELLERS_BG_IMAGE');
                $helper->fields_value['FIELD_BESTSELLERS_BG_COVER'] = Configuration::get('FIELD_BESTSELLERS_BG_COVER');
                $helper->fields_value['FIELD_BESTSELLERS_BG_REPEAT'] = Configuration::get('FIELD_BESTSELLERS_BG_REPEAT');

                foreach($languages as $language){
                    $helper->fields_value['FIELD_BESTSELLERS_TITLE'][$language['id_lang']] = Configuration::get('FIELD_BESTSELLERS_TITLE', $language['id_lang']);
                }

		return $helper->generateForm(array($fields_form));
	}

	/* ------------------------------------------------------------- */
        /*  PREPARE FOR HOOK
        /* ------------------------------------------------------------- */

        private function _prepHook($params)
        {
            $id_default_lang = $this->context->language->id;
            $fieldbestsellers = array(
                'FIELD_BESTSELLERS_TITLE' => Configuration::get('FIELD_BESTSELLERS_TITLE', $id_default_lang),
                'FIELD_BESTSELLERS_MAXITEM' => Configuration::get('FIELD_BESTSELLERS_MAXITEM'),
                'FIELD_BESTSELLERS_MEDIUMITEM' => Configuration::get('FIELD_BESTSELLERS_MEDIUMITEM'),
                'FIELD_BESTSELLERS_ROWITEM' => Configuration::get('FIELD_BESTSELLERS_ROWITEM'),
                'FIELD_BESTSELLERS_AUTOSCROLL' => Configuration::get('FIELD_BESTSELLERS_AUTOSCROLL'),
                'FIELD_BESTSELLERS_AUTOSCROLLDELAY' => Configuration::get('FIELD_BESTSELLERS_AUTOSCROLLDELAY'),
                'FIELD_BESTSELLERS_PAUSEONHOVER' => Configuration::get('FIELD_BESTSELLERS_PAUSEONHOVER'),
                'FIELD_BESTSELLERS_PAGINATION' => Configuration::get('FIELD_BESTSELLERS_PAGINATION'),
                'FIELD_BESTSELLERS_NAVIGATION' => Configuration::get('FIELD_BESTSELLERS_NAVIGATION'),
                'FIELD_BESTSELLERS_TO_DISPLAY' => Configuration::get('FIELD_BESTSELLERS_TO_DISPLAY'),
                'FIELD_BESTSELLERS_DISPLAY' => Configuration::get('FIELD_BESTSELLERS_DISPLAY')
            );

            $this->smarty->assign('fieldbestsellers', $fieldbestsellers);
        }

	public function hookHeader($params)
	{
		if (Configuration::get('PS_CATALOG_MODE'))
			return;
                if (file_exists($this->_path . 'views/css/hook/fieldbestsellers_s_'.(int)$this->context->shop->getContextShopID().'.css')){
                    if (Shop::getContext() == Shop::CONTEXT_GROUP)
                        $this->context->controller->addCSS($this->_path . 'views/css/hook/fieldbestsellers_g_'.(int)$this->context->shop->getContextShopGroupID().'.css', 'all');
                    elseif (Shop::getContext() == Shop::CONTEXT_SHOP)
                        $this->context->controller->addCSS($this->_path . 'views/css/hook/fieldbestsellers_s_'.(int)$this->context->shop->getContextShopID().'.css', 'all');
                } else {
                    $this->generateCss();
                    if (Shop::getContext() == Shop::CONTEXT_GROUP)
                        $this->context->controller->addCSS($this->_path . 'views/css/hook/fieldbestsellers_g_'.(int)$this->context->shop->getContextShopGroupID().'.css', 'all');
                    elseif (Shop::getContext() == Shop::CONTEXT_SHOP)
                        $this->context->controller->addCSS($this->_path . 'views/css/hook/fieldbestsellers_s_'.(int)$this->context->shop->getContextShopID().'.css', 'all');
                }
	}
	/* ------------------------------------------------------------- */
	/*  getBestSellers
	/* ------------------------------------------------------------- */
	protected function getBestSellers($params)
	{		
        if (Configuration::get('PS_CATALOG_MODE')) {
            return false;
        }

        $searchProvider = new BestSalesProductSearchProvider(
            $this->context->getTranslator()
        );

        $context = new ProductSearchContext($this->context);

        $query = new ProductSearchQuery();

        $nProducts = (int) Configuration::get('FIELD_BESTSELLERS_TO_DISPLAY');

        $query
            ->setResultsPerPage($nProducts)
            ->setPage(1)
        ;

        $query->setSortOrder(SortOrder::random());

        $result = $searchProvider->runQuery(
            $context,
            $query
        );

        $assembler = new ProductAssembler($this->context);

        $presenterFactory = new ProductPresenterFactory($this->context);
        $presentationSettings = $presenterFactory->getPresentationSettings();
        $presenter = new ProductListingPresenter(
            new ImageRetriever(
                $this->context->link
            ),
            $this->context->link,
            new PriceFormatter(),
            new ProductColorsRetriever(),
            $this->context->getTranslator()
        );

        $products_for_template = [];
		$products_besseler=$result->getProducts();
		if(is_array($products_besseler)){
        foreach ($products_besseler as $rawProduct) {
            $products_for_template[] = $presenter->present(
                $presentationSettings,
                $assembler->assembleProduct($rawProduct),
                $this->context->language
            );
        }
		 return $products_for_template;
		}
        return $products_for_template;
	}
	/* ------------------------------------------------------------- */
	/*  hookBestsellers
	/* ------------------------------------------------------------- */
	public function hookBestsellers($params)
	{
		$best_sellers = $this->getBestSellers($params);
		if(count($best_sellers) < 1 && Configuration::get('FIELD_BESTSELLERS_DISPLAY') == 0){
		    return;
		} else {
		$this->_prepHook($params);
		}
		$this->smarty->assign(array(
			'best_sellers' => $best_sellers
		));
		return $this->display(__FILE__, 'fieldbestsellers.tpl');
	}
	/* ------------------------------------------------------------- */
	/*  hookDisplayHome
	/* ------------------------------------------------------------- */
	public function hookDisplayHome($params){
		return $this->hookBestsellers($params);
	}
	/* ------------------------------------------------------------- */
	/*  hookRightColumn
	/* ------------------------------------------------------------- */
	public function hookRightColumn($params)
	{
		return $this->hookBestsellers($params);
	}
	/* ------------------------------------------------------------- */
	/*  hookLeftColumn
	/* ------------------------------------------------------------- */
	public function hookLeftColumn($params)
	{
		return $this->hookBestsellers($params);
	}  
	/* ------------------------------------------------------------- */
    public function generateCss()
	{
		$css = '';
                if (Configuration::get('FIELD_BESTSELLERS_BG_IMAGE')){
                    $css .= '
                    #best-sellers_block_right {
                        background-image: url('.Configuration::get('FIELD_BESTSELLERS_BG_IMAGE').') !important;
                        background-repeat: '.$this->convertBgRepeat(Configuration::get('FIELD_BESTSELLERS_BG_REPEAT')).' !important;
                    }

                    ';
                } else {
                    $css .= '#best-sellers_block_right {}';
                }
		if (Configuration::get('FIELD_BESTSELLERS_BG_COVER')){
			$css .= '#best-sellers_block_right{
				    background-size: cover;
			}';
                }
		if (Shop::getContext() == Shop::CONTEXT_GROUP)
			$my_file = $this->local_path.'views/css/hook/fieldbestsellers_g_'.(int)$this->context->shop->getContextShopGroupID().'.css';
		elseif (Shop::getContext() == Shop::CONTEXT_SHOP)
			$my_file = $this->local_path.'views/css/hook/fieldbestsellers_s_'.(int)$this->context->shop->getContextShopID().'.css';
		
		$fh = fopen($my_file, 'w') or die("can't open file");
		fwrite($fh, $css);
		fclose($fh);
	}

	public function convertBgRepeat($value)
	{
			switch ($value)
			{
				case 3 :
					$repeat_option = 'repeat';
					break;
				case 2 :
					$repeat_option = 'repeat-x';
					break;
				case 1 :
					$repeat_option = 'repeat-y';
					break;
				default :
					$repeat_option = 'no-repeat';
			}
			return $repeat_option;
	}
}
