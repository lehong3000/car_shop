<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:07
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\admin\themes\default\template\controllers\logs\employee_field.tpl" */ ?>
<?php /*%%SmartyHeaderCode:264915a02969b868c65-24518944%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '810d53f831ca17922c68f9caad5dc1e4824953c7' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\admin\\themes\\default\\template\\controllers\\logs\\employee_field.tpl',
      1 => 1503903074,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '264915a02969b868c65-24518944',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'employee_image' => 0,
    'employee_name' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a02969b871724_49021811',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a02969b871724_49021811')) {function content_5a02969b871724_49021811($_smarty_tpl) {?>
<span class="employee_avatar_small">
	<img class="imgm img-thumbnail" alt="" src="<?php echo $_smarty_tpl->tpl_vars['employee_image']->value;?>
" width="32" height="32" />
</span>
<?php echo $_smarty_tpl->tpl_vars['employee_name']->value;?>

<?php }} ?>
