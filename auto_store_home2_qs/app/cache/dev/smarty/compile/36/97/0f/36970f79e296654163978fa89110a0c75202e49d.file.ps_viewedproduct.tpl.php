<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:17
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_viewedproduct\views\template\hook\ps_viewedproduct.tpl" */ ?>
<?php /*%%SmartyHeaderCode:304375a0296a5ac5424-35332007%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '36970f79e296654163978fa89110a0c75202e49d' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_viewedproduct\\views\\template\\hook\\ps_viewedproduct.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '304375a0296a5ac5424-35332007',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'products' => 0,
    'product' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a5ad9025_80745827',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a5ad9025_80745827')) {function content_5a0296a5ad9025_80745827($_smarty_tpl) {?>
<section class="featured-products clearfix mt-3">
  <h2><?php echo smartyTranslate(array('s'=>'Viewed products','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</h2>
  <div class="products">
    <?php  $_smarty_tpl->tpl_vars["product"] = new Smarty_Variable; $_smarty_tpl->tpl_vars["product"]->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['products']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars["product"]->key => $_smarty_tpl->tpl_vars["product"]->value) {
$_smarty_tpl->tpl_vars["product"]->_loop = true;
?>
      <?php echo $_smarty_tpl->getSubTemplate ("catalog/_partials/miniatures/product.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('product'=>$_smarty_tpl->tpl_vars['product']->value), 0);?>

    <?php } ?>
  </div>
</section>
<?php }} ?>
