<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:16
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_brandlist\views\templates\_partials\brand_form.tpl" */ ?>
<?php /*%%SmartyHeaderCode:185435a0296a4eff751-18122593%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5fddee8c94a29dc4e8b00b7bb1fae281ad77fbf7' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_brandlist\\views\\templates\\_partials\\brand_form.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '185435a0296a4eff751-18122593',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'brands' => 0,
    'brand' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a4f11665_20014866',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a4f11665_20014866')) {function content_5a0296a4f11665_20014866($_smarty_tpl) {?>

<form action="#">
  <select onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
    <option value=""><?php echo smartyTranslate(array('s'=>'All brands','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</option>
    <?php  $_smarty_tpl->tpl_vars['brand'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['brand']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['brands']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['brand']->key => $_smarty_tpl->tpl_vars['brand']->value) {
$_smarty_tpl->tpl_vars['brand']->_loop = true;
?>
      <option value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['brand']->value['link'], ENT_QUOTES, 'UTF-8');?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['brand']->value['name'], ENT_QUOTES, 'UTF-8');?>
</option>
    <?php } ?>
  </select>
</form>
<?php }} ?>
