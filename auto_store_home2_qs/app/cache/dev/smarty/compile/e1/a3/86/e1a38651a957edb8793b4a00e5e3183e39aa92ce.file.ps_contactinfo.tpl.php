<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:17
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\ps_contactinfo\ps_contactinfo.tpl" */ ?>
<?php /*%%SmartyHeaderCode:188175a0296a51853f0-32186267%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e1a38651a957edb8793b4a00e5e3183e39aa92ce' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\ps_contactinfo\\ps_contactinfo.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '188175a0296a51853f0-32186267',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'contact_infos' => 0,
    'urls' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a51c5400_22075006',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a51c5400_22075006')) {function content_5a0296a51c5400_22075006($_smarty_tpl) {?>

<div class="block-contact col-md-4 links wrapper">
  <div class="hidden-sm-down">
    <h4 class="text-uppercase block-contact-title"><?php echo smartyTranslate(array('s'=>'Store information','d'=>'Shop.Theme.Global'),$_smarty_tpl);?>
</h4>
      <?php echo $_smarty_tpl->tpl_vars['contact_infos']->value['address']['formatted'];?>

      <?php if ($_smarty_tpl->tpl_vars['contact_infos']->value['phone']) {?>
        <br>
        
        <?php echo smartyTranslate(array('s'=>'Call us: [1]%phone%[/1]','sprintf'=>array('[1]'=>'<span>','[/1]'=>'</span>','%phone%'=>$_smarty_tpl->tpl_vars['contact_infos']->value['phone']),'d'=>'Shop.Theme.Global'),$_smarty_tpl);?>

      <?php }?>
      <?php if ($_smarty_tpl->tpl_vars['contact_infos']->value['fax']) {?>
        <br>
        
        <?php echo smartyTranslate(array('s'=>'Fax: [1]%fax%[/1]','sprintf'=>array('[1]'=>'<span>','[/1]'=>'</span>','%fax%'=>$_smarty_tpl->tpl_vars['contact_infos']->value['fax']),'d'=>'Shop.Theme.Global'),$_smarty_tpl);?>

      <?php }?>
      <?php if ($_smarty_tpl->tpl_vars['contact_infos']->value['email']) {?>
        <br>
        
        <?php echo smartyTranslate(array('s'=>'Email us: [1]%email%[/1]','sprintf'=>array('[1]'=>'<span>','[/1]'=>'</span>','%email%'=>$_smarty_tpl->tpl_vars['contact_infos']->value['email']),'d'=>'Shop.Theme.Global'),$_smarty_tpl);?>

      <?php }?>
  </div>
  <div class="hidden-md-up">
    <div class="title">
      <a class="h3" href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['pages']['stores'], ENT_QUOTES, 'UTF-8');?>
"><?php echo smartyTranslate(array('s'=>'Store information','d'=>'Shop.Theme.Global'),$_smarty_tpl);?>
</a>
    </div>
  </div>
</div>
<?php }} ?>
