<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:18
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\templates\checkout\_partials\cart-summary-items-subtotal.tpl" */ ?>
<?php /*%%SmartyHeaderCode:158875a0296a6d363b5-56089352%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '55a0f16c0e51174fc2553e344eb4d1075924cf48' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\templates\\checkout\\_partials\\cart-summary-items-subtotal.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '158875a0296a6d363b5-56089352',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'cart' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a6d443b0_39917785',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a6d443b0_39917785')) {function content_5a0296a6d443b0_39917785($_smarty_tpl) {?>

  <div class="card-block cart-summary-line cart-summary-items-subtotal clearfix" id="items-subtotal">
    <span class="label"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cart']->value['summary_string'], ENT_QUOTES, 'UTF-8');?>
</span>
    <span class="value"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['cart']->value['subtotals']['products']['amount'], ENT_QUOTES, 'UTF-8');?>
</span>
  </div>

<?php }} ?>
