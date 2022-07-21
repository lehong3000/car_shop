<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:17
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_supplierlist\views\templates\_partials\supplier_form.tpl" */ ?>
<?php /*%%SmartyHeaderCode:108315a0296a5a1a747-71788255%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b8eb1d2c7ad60740b40bfc237d6b4830fd384bc4' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_supplierlist\\views\\templates\\_partials\\supplier_form.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '108315a0296a5a1a747-71788255',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'suppliers' => 0,
    'supplier' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a5a2d0c6_96954545',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a5a2d0c6_96954545')) {function content_5a0296a5a2d0c6_96954545($_smarty_tpl) {?>

<form action="#">
  <select onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
    <option value=""><?php echo smartyTranslate(array('s'=>'All suppliers','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</option>
    <?php  $_smarty_tpl->tpl_vars['supplier'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['supplier']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['suppliers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['supplier']->key => $_smarty_tpl->tpl_vars['supplier']->value) {
$_smarty_tpl->tpl_vars['supplier']->_loop = true;
?>
      <option value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['supplier']->value['link'], ENT_QUOTES, 'UTF-8');?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['supplier']->value['name'], ENT_QUOTES, 'UTF-8');?>
</option>
    <?php } ?>
  </select>
</form>
<?php }} ?>
