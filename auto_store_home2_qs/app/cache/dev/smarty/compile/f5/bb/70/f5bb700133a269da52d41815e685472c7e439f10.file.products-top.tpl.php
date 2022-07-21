<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:18
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\templates\catalog\_partials\products-top.tpl" */ ?>
<?php /*%%SmartyHeaderCode:251485a0296a6735a79-13675011%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f5bb700133a269da52d41815e685472c7e439f10' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\templates\\catalog\\_partials\\products-top.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '251485a0296a6735a79-13675011',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'listing' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a67f1549_93434051',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a67f1549_93434051')) {function content_5a0296a67f1549_93434051($_smarty_tpl) {?>
<div id="js-product-list-top" class="row products-selection">
  <div class="col-md-6 hidden-sm-down total-products">
    <?php if ($_smarty_tpl->tpl_vars['listing']->value['pagination']['total_items']>1) {?>
      <p><?php echo smartyTranslate(array('s'=>'There are %product_count% products.','d'=>'Shop.Theme.Catalog','sprintf'=>array('%product_count%'=>$_smarty_tpl->tpl_vars['listing']->value['pagination']['total_items'])),$_smarty_tpl);?>
</p>
    <?php } elseif ($_smarty_tpl->tpl_vars['listing']->value['pagination']['total_items']>0) {?>
      <p><?php echo smartyTranslate(array('s'=>'There is 1 product.','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</p>
    <?php }?>
  </div>
  <div class="col-md-6">
    <div class="row sort-by-row">

      
        <?php echo $_smarty_tpl->getSubTemplate ('catalog/_partials/sort-orders.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('sort_orders'=>$_smarty_tpl->tpl_vars['listing']->value['sort_orders']), 0);?>

      

      <?php if (!empty($_smarty_tpl->tpl_vars['listing']->value['rendered_facets'])) {?>
        <div class="col-sm-3 col-xs-4 hidden-md-up filter-button">
          <button id="search_filter_toggler" class="btn btn-secondary">
            <?php echo smartyTranslate(array('s'=>'Filter','d'=>'Shop.Theme.Actions'),$_smarty_tpl);?>

          </button>
        </div>
      <?php }?>
    </div>
  </div>
  <div class="col-sm-12 hidden-md-up text-sm-center showing">
    <?php echo smartyTranslate(array('s'=>'Showing %from%-%to% of %total% item(s)','d'=>'Shop.Theme.Catalog','sprintf'=>array('%from%'=>$_smarty_tpl->tpl_vars['listing']->value['pagination']['items_shown_from'],'%to%'=>$_smarty_tpl->tpl_vars['listing']->value['pagination']['items_shown_to'],'%total%'=>$_smarty_tpl->tpl_vars['listing']->value['pagination']['total_items'])),$_smarty_tpl);?>

  </div>
</div>
<?php }} ?>
