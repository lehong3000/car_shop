<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:17
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_productinfo\views\templates\hook\ps_productinfo.tpl" */ ?>
<?php /*%%SmartyHeaderCode:53615a0296a56098d9-59572207%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a637e1f055cf5edfe047f78f5dab09cefc5852b4' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_productinfo\\views\\templates\\hook\\ps_productinfo.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '53615a0296a56098d9-59572207',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'vars_nb_people' => 0,
    'vars_date_last_order' => 0,
    'vars_date_last_cart' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a5632641_50735171',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a5632641_50735171')) {function content_5a0296a5632641_50735171($_smarty_tpl) {?>
<div class="js-productinfo mt-1">
  <?php if (isset($_smarty_tpl->tpl_vars['vars_nb_people']->value)) {?>
    <p>
      <?php if ($_smarty_tpl->tpl_vars['vars_nb_people']->value['%nb_people%']==1) {?>
        <?php echo smartyTranslate(array('s'=>'1 person is currently watching this product.','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>

      <?php } else { ?>
        <?php echo smartyTranslate(array('s'=>'%nb_people% people are currently watching this product.','sprintf'=>$_smarty_tpl->tpl_vars['vars_nb_people']->value,'d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>

      <?php }?>
    </p>
  <?php }?>

  <?php if (isset($_smarty_tpl->tpl_vars['vars_date_last_order']->value)) {?>
    <p><?php echo smartyTranslate(array('s'=>'Last time this product was bought: %date_last_order%','sprintf'=>$_smarty_tpl->tpl_vars['vars_date_last_order']->value,'d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</p>
  <?php }?>

  <?php if (isset($_smarty_tpl->tpl_vars['vars_date_last_cart']->value)) {?>
    <p><?php echo smartyTranslate(array('s'=>'Last time this product was added to a cart: %date_last_cart%','sprintf'=>$_smarty_tpl->tpl_vars['vars_date_last_cart']->value,'d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</p>
  <?php }?>
</div>
<?php }} ?>
