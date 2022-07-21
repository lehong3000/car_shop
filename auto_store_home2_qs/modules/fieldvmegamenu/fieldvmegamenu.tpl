<div class="block v-megamenu-container">
    <div class="v-megamenu-title bgcolor {if $page.page_name == "index"}Click{/if}">
        <i class="fa icon-reorder"></i>
        <h3 class="title_font">{l s='Categories' mod='fieldvmegamenu'}</h3>
    </div>
    <div class="v-megamenu">
        <ul>{$vmegamenu nofilter}</ul>
        
    </div>
</div>
<script >
	var CloseVmenu = '{l s="CLOSE MENU" mod="fieldvmegamenu"}';
	var MoreVmenu='{l s="MORE CATEGORIES" mod="fieldvmegamenu"}';
</script>