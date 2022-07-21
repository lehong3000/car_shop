<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:17
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_customersignin\ps_customersignin.tpl" */ ?>
<?php /*%%SmartyHeaderCode:319335a0296a52b6ba7-90648625%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a88b278035a27da8b3c83fd683afec9a19609610' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_customersignin\\ps_customersignin.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '319335a0296a52b6ba7-90648625',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'logged' => 0,
    'logout_url' => 0,
    'my_account_url' => 0,
    'customerName' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a52d93e2_02332971',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a52d93e2_02332971')) {function content_5a0296a52d93e2_02332971($_smarty_tpl) {?>
<div id="_desktop_user_info">
  <div class="user-info">
    <?php if ($_smarty_tpl->tpl_vars['logged']->value) {?>
      <a
        class="logout hidden-sm-down"
        href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['logout_url']->value, ENT_QUOTES, 'UTF-8');?>
"
        rel="nofollow"
      >
        <i class="material-icons">&#xE7FF;</i>
        <?php echo smartyTranslate(array('s'=>'Sign out','d'=>'Shop.Theme.Actions'),$_smarty_tpl);?>

      </a>
      <a
        class="account"
        href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['my_account_url']->value, ENT_QUOTES, 'UTF-8');?>
"
        title="<?php echo smartyTranslate(array('s'=>'View my customer account','d'=>'Shop.Theme.Customeraccount'),$_smarty_tpl);?>
"
        rel="nofollow"
      >
        <i class="material-icons hidden-md-up logged">&#xE7FF;</i>
        <span class="hidden-sm-down"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['customerName']->value, ENT_QUOTES, 'UTF-8');?>
</span>
      </a>
    <?php } else { ?>
      <a
        href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['my_account_url']->value, ENT_QUOTES, 'UTF-8');?>
"
        title="<?php echo smartyTranslate(array('s'=>'Log in to your customer account','d'=>'Shop.Theme.Customeraccount'),$_smarty_tpl);?>
"
        rel="nofollow"
      >
        <i class="material-icons">&#xE7FF;</i>
        <span class="hidden-sm-down"><?php echo smartyTranslate(array('s'=>'Sign in','d'=>'Shop.Theme.Actions'),$_smarty_tpl);?>
</span>
      </a>
    <?php }?>
  </div>
</div>
<?php }} ?>
