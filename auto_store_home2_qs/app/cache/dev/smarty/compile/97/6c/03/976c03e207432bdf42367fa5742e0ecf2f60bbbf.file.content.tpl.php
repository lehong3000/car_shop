<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:06
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\admin\themes\default\template\controllers\cms_content\content.tpl" */ ?>
<?php /*%%SmartyHeaderCode:66175a02969a53ab53-55516807%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '976c03e207432bdf42367fa5742e0ecf2f60bbbf' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\admin\\themes\\default\\template\\controllers\\cms_content\\content.tpl',
      1 => 1503903074,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '66175a02969a53ab53-55516807',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'cms_breadcrumb' => 0,
    'content' => 0,
    'url_prev' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a02969a56c3c2_43855753',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a02969a56c3c2_43855753')) {function content_5a02969a56c3c2_43855753($_smarty_tpl) {?>

<?php if (isset($_smarty_tpl->tpl_vars['cms_breadcrumb']->value)) {?>
	<ul class="breadcrumb cat_bar">
		<?php echo $_smarty_tpl->tpl_vars['cms_breadcrumb']->value;?>

	</ul>
<?php }?>

<?php echo $_smarty_tpl->tpl_vars['content']->value;?>

<?php if (isset($_smarty_tpl->tpl_vars['url_prev']->value)) {?>
	<script type="text/javascript">
	$(document).ready(function () {
		var re = /url_preview=(.*)/;
		var url = re.exec(window.location.href);
		if (typeof url !== 'undefined' && url !== null && typeof url[1] !== 'undefined' && url[1] === "1")
			window.open("<?php echo $_smarty_tpl->tpl_vars['url_prev']->value;?>
", "_blank");
	});
	</script>
<?php }?>
<?php }} ?>
