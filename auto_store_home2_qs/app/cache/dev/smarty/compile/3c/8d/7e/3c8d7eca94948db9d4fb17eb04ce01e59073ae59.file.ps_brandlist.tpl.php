<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:16
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_brandlist\views\templates\hook\ps_brandlist.tpl" */ ?>
<?php /*%%SmartyHeaderCode:80145a0296a4eb2ab0-97371050%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3c8d7eca94948db9d4fb17eb04ce01e59073ae59' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_brandlist\\views\\templates\\hook\\ps_brandlist.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '80145a0296a4eb2ab0-97371050',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'display_link_brand' => 0,
    'page_link' => 0,
    'brands' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a4ede992_79743111',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a4ede992_79743111')) {function content_5a0296a4ede992_79743111($_smarty_tpl) {?>

<div id="search_filters_brands">
  <section class="facet">
    <h1 class="h6 text-uppercase facet-label">
      <?php if ($_smarty_tpl->tpl_vars['display_link_brand']->value) {?><a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['page_link']->value, ENT_QUOTES, 'UTF-8');?>
" title="<?php echo smartyTranslate(array('s'=>'Brands','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
"><?php }?>
        <?php echo smartyTranslate(array('s'=>'Brands','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>

      <?php if ($_smarty_tpl->tpl_vars['display_link_brand']->value) {?></a><?php }?>
    </h1>
    <div>
      <?php if ($_smarty_tpl->tpl_vars['brands']->value) {?>
        <?php echo $_smarty_tpl->getSubTemplate ("module:ps_brandlist/views/templates/_partials/".((string)$_smarty_tpl->tpl_vars['brand_display_type']->value).".tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('brands'=>$_smarty_tpl->tpl_vars['brands']->value), 0);?>

      <?php } else { ?>
        <p><?php echo smartyTranslate(array('s'=>'No brand','d'=>'Shop.Theme.Catalog'),$_smarty_tpl);?>
</p>
      <?php }?>
    </div>
  </section>
</div>
<?php }} ?>
