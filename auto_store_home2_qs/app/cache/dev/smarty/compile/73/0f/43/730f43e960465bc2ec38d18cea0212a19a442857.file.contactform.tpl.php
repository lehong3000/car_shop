<?php /* Smarty version Smarty-3.1.19, created on 2017-11-08 06:31:16
         compiled from "D:\xampp\htdocs\auto_store\dong-goi\auto-store_home1_qs\themes\classic\modules\contactform\views\templates\widget\contactform.tpl" */ ?>
<?php /*%%SmartyHeaderCode:240835a0296a4da5a96-36703263%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '730f43e960465bc2ec38d18cea0212a19a442857' => 
    array (
      0 => 'D:\\xampp\\htdocs\\auto_store\\dong-goi\\auto-store_home1_qs\\themes\\classic\\modules\\contactform\\views\\templates\\widget\\contactform.tpl',
      1 => 1503903076,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '240835a0296a4da5a96-36703263',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'urls' => 0,
    'contact' => 0,
    'notifications' => 0,
    'notif' => 0,
    'contact_elt' => 0,
    'order' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a0296a4e28a75_54046363',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a0296a4e28a75_54046363')) {function content_5a0296a4e28a75_54046363($_smarty_tpl) {?>
<section class="contact-form">
  <form action="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['urls']->value['pages']['contact'], ENT_QUOTES, 'UTF-8');?>
" method="post" <?php if ($_smarty_tpl->tpl_vars['contact']->value['allow_file_upload']) {?>enctype="multipart/form-data"<?php }?>>

    <?php if ($_smarty_tpl->tpl_vars['notifications']->value) {?>
      <div class="col-xs-12 alert <?php if ($_smarty_tpl->tpl_vars['notifications']->value['nw_error']) {?>alert-danger<?php } else { ?>alert-success<?php }?>">
        <ul>
          <?php  $_smarty_tpl->tpl_vars['notif'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['notif']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['notifications']->value['messages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['notif']->key => $_smarty_tpl->tpl_vars['notif']->value) {
$_smarty_tpl->tpl_vars['notif']->_loop = true;
?>
            <li><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['notif']->value, ENT_QUOTES, 'UTF-8');?>
</li>
          <?php } ?>
        </ul>
      </div>
    <?php }?>

    <?php if (!$_smarty_tpl->tpl_vars['notifications']->value||$_smarty_tpl->tpl_vars['notifications']->value['nw_error']) {?>
      <section class="form-fields">

        <div class="form-group row">
          <div class="col-md-9 col-md-offset-3">
            <h3><?php echo smartyTranslate(array('s'=>'Contact us','d'=>'Shop.Theme.Global'),$_smarty_tpl);?>
</h3>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-md-3 form-control-label"><?php echo smartyTranslate(array('s'=>'Subject','d'=>'Shop.Forms.Labels'),$_smarty_tpl);?>
</label>
          <div class="col-md-6">
            <select name="id_contact" class="form-control form-control-select">
              <?php  $_smarty_tpl->tpl_vars['contact_elt'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['contact_elt']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['contact']->value['contacts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['contact_elt']->key => $_smarty_tpl->tpl_vars['contact_elt']->value) {
$_smarty_tpl->tpl_vars['contact_elt']->_loop = true;
?>
                <option value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['contact_elt']->value['id_contact'], ENT_QUOTES, 'UTF-8');?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['contact_elt']->value['name'], ENT_QUOTES, 'UTF-8');?>
</option>
              <?php } ?>
            </select>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-md-3 form-control-label"><?php echo smartyTranslate(array('s'=>'Email address','d'=>'Shop.Forms.Labels'),$_smarty_tpl);?>
</label>
          <div class="col-md-6">
            <input
              class="form-control"
              name="from"
              type="email"
              value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['contact']->value['email'], ENT_QUOTES, 'UTF-8');?>
"
              placeholder="<?php echo smartyTranslate(array('s'=>'your@email.com','d'=>'Shop.Forms.Help'),$_smarty_tpl);?>
"
            >
          </div>
        </div>

        <?php if ($_smarty_tpl->tpl_vars['contact']->value['orders']) {?>
          <div class="form-group row">
            <label class="col-md-3 form-control-label"><?php echo smartyTranslate(array('s'=>'Order reference','d'=>'Shop.Forms.Labels'),$_smarty_tpl);?>
</label>
            <div class="col-md-6">
              <select name="id_order" class="form-control form-control-select">
                <option value=""><?php echo smartyTranslate(array('s'=>'Select reference','d'=>'Shop.Forms.Help'),$_smarty_tpl);?>
</option>
                <?php  $_smarty_tpl->tpl_vars['order'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['order']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['contact']->value['orders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['order']->key => $_smarty_tpl->tpl_vars['order']->value) {
$_smarty_tpl->tpl_vars['order']->_loop = true;
?>
                  <option value="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['order']->value['id_order'], ENT_QUOTES, 'UTF-8');?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['order']->value['reference'], ENT_QUOTES, 'UTF-8');?>
</option>
                <?php } ?>
              </select>
            </div>
            <span class="col-md-3 form-control-comment">
              <?php echo smartyTranslate(array('s'=>'optional','d'=>'Shop.Forms.Help'),$_smarty_tpl);?>

            </span>
          </div>
        <?php }?>

        <?php if ($_smarty_tpl->tpl_vars['contact']->value['allow_file_upload']) {?>
          <div class="form-group row">
            <label class="col-md-3 form-control-label"><?php echo smartyTranslate(array('s'=>'Attachment','d'=>'Shop.Forms.Labels'),$_smarty_tpl);?>
</label>
            <div class="col-md-6">
              <input type="file" name="fileUpload" class="filestyle" data-buttonText="<?php echo smartyTranslate(array('s'=>'Choose file','d'=>'Shop.Theme.Actions'),$_smarty_tpl);?>
">
            </div>
            <span class="col-md-3 form-control-comment">
              <?php echo smartyTranslate(array('s'=>'optional','d'=>'Shop.Forms.Help'),$_smarty_tpl);?>

            </span>
          </div>
        <?php }?>

        <div class="form-group row">
          <label class="col-md-3 form-control-label"><?php echo smartyTranslate(array('s'=>'Message','d'=>'Shop.Forms.Labels'),$_smarty_tpl);?>
</label>
          <div class="col-md-9">
            <textarea
              class="form-control"
              name="message"
              placeholder="<?php echo smartyTranslate(array('s'=>'How can we help?','d'=>'Shop.Forms.Help'),$_smarty_tpl);?>
"
              rows="3"
            ><?php if ($_smarty_tpl->tpl_vars['contact']->value['message']) {?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['contact']->value['message'], ENT_QUOTES, 'UTF-8');?>
<?php }?></textarea>
          </div>
        </div>

      </section>

      <footer class="form-footer text-sm-right">
        <input class="btn btn-primary" type="submit" name="submitMessage" value="<?php echo smartyTranslate(array('s'=>'Send','d'=>'Shop.Theme.Actions'),$_smarty_tpl);?>
">
      </footer>
    <?php }?>

  </form>
</section>
<?php }} ?>
