
<div id="ModuleIqitsizeguide" class="panel product-tab" style='padding: 15px'>
	<input type="hidden" name="submitted_tabs[]" value="ModuleIqitsizeguide" />
	<h3>{l s='Add or modify customizable properties' mod='fieldsizechart'}</h3>

	{if isset($display_common_field) && $display_common_field}
		<div class="alert alert-info">{l s='Warning, if you change the value of fields with an orange bullet %s, the value will be changed for all other shops for this product'  mod='fieldsizechart' sprintf=$bullet_common_field}</div>
	{/if}


<script type="text/javascript">
{literal}
$(document).ready(function(){
$('select#id_fieldsizechart').chosen({width: '250px'});
$('select#id_fieldsizechart').chosen input({width: '100%'});
});
{/literal}
</script>
<div class="form-group" style="display:inline-block; width: 100%;">
		<label class="control-label col-lg-4" for="id_fieldsizechart">{l s='Select from created guides' mod='fieldsizechart'}</label>
		<div class="col-lg-4">
			<select name="id_fieldsizechart" id="id_fieldsizechart" class="" style="width:250px">
				<option value="0"{if isset($selectedChart) && ($selectedChart == 0)}selected="selected"{/if}>- {l s='Choose (optional)' mod='fieldsizechart'} -</option>
				{if isset($guides)}
                                    {foreach from=$guides item=guide}
                                    <option value="{$guide.id_guide}" {if isset($selectedGuide) && ($guide.id_guide == $selectedGuide)}selected="selected"{/if}>{$guide.title}</option>
                                    {/foreach}
				{/if}
			</select>
		</div>
		<div class="col-lg-4">
			<a class="btn btn-link bt-icon confirm_leave" style="margin-bottom:0" href="{$link->getAdminLink('AdminModules')}&configure=fieldsizechart&addGuide=1">
				<i class="icon-plus-sign"></i> {l s='Create new guide' mod='fieldsizechart'} <i class="icon-external-link-sign"></i>
			</a>
		</div>
	</div>

<div class="panel-footer col-lg-12" style='margin-top: 30px'>
		<a href="{$link->getAdminLink('AdminProducts')}" class="btn btn-default"><i class="process-icon-cancel"></i> {l s='Cancel'}</a>
	</div>
</div>
        