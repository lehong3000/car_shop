<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:17
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_rssfeed\views\templates\hook\ps_rssfeed.tpl" */ ?>
<?php /*%%SmartyHeaderCode:22625a0296a564aee5-46610640%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c69cb1388f9cbac61bf74c1cc37b4794e8b23be9' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_rssfeed\\views\\templates\\hook\\ps_rssfeed.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '22625a0296a564aee5-46610640',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'rss_links' => 0,
    'rss_link' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a5665569_21606043',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a5665569_21606043')) {function content_5a0296a5665569_21606043($_smarty_tpl) {?>

<div class="block-contact col-md-2 links wrapper">
  <h3 class="h3 hidden-sm-down"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['title']->value, ENT_QUOTES, 'UTF-8');?>
</h3>
  <div>
    <?php if ($_smarty_tpl->tpl_vars['rss_links']->value) {?>
      <ul>
        <?php  $_smarty_tpl->tpl_vars['rss_link'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['rss_link']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['rss_links']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['rss_link']->key => $_smarty_tpl->tpl_vars['rss_link']->value) {
$_smarty_tpl->tpl_vars['rss_link']->_loop = true;
?>
          <li><a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['rss_link']->value['link'], ENT_QUOTES, 'UTF-8');?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['rss_link']->value['title'], ENT_QUOTES, 'UTF-8');?>
" target="_blank"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['rss_link']->value['title'], ENT_QUOTES, 'UTF-8');?>
</a></li>
        <?php } ?>
      </ul>
    <?php } else { ?>
      <p><?php echo smartyTranslate(array('s'=>'No RSS feed added','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</p>
    <?php }?>
  </div>
</div>
<?php }} ?>
