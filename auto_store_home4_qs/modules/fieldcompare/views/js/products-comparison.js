$(document).ready(function () {
    $(document).on('click', '.add_to_compare', function (e) {
        e.preventDefault();
        if (typeof addToCompare != 'undefined') {
            var productId = parseInt($(this).data('id-product'));
            var product = [];
            addToCompare(productId, product);
        }
    });

    reloadProductComparison();
    compareButtonsStatusRefresh();
    totalCompareButtons();
});

function ShowModalCompare(product, status) {
    $(".PopupCompare").remove();
    var fieldhtml = "";
    fieldhtml += '<div class="PopupCompare">';
    fieldhtml += '<div class="PopupCompareInner">';
    if (status == 1) {
        fieldhtml += '<h3><i class="material-icons">&#xE834;</i>' + compare_title + '<span class="close-popcompare"><i class="material-icons">&#xE5C9;</i></span></h3>';
        fieldhtml += '<div class="noty_text_body">';
        fieldhtml += '<p>';
        fieldhtml += compare_text;
        fieldhtml += '</br>';
        fieldhtml += '<a href="' + productcompare_url + '"><strong>' + compare_button + '</strong></a>';
        fieldhtml += '</p>';
        fieldhtml += '</div>';
    } else if (status == 0) {
        fieldhtml += '<h3><i class="material-icons">&#xE160;</i>' + compare_title_error + '<span class="close-popcompare"><i class="material-icons">&#xE5C9;</i></span></h3>';
        fieldhtml += '<div class="noty_text_body" style="color: #f00;">';
        fieldhtml += productcompare_max_item;
        fieldhtml += '<a href="' + productcompare_url + '"><strong>' + compare_button + '</strong></a>';
        fieldhtml += '</div>';
    } else {
        fieldhtml += '<h3><i class="material-icons">&#xE834;</i>' + compare_title_success + '<span class="close-popcompare"><i class="material-icons">&#xE5C9;</i></span></h3>';
        fieldhtml += '<div class="noty_text_body">';
        fieldhtml += compare_success;
        fieldhtml += '<a href="' + productcompare_url + '"><strong>' + compare_button + '</strong></a>';
        fieldhtml += '</div>';
    }
    fieldhtml += '</div>';
    fieldhtml += '</div>';
    $(fieldhtml).appendTo("body");
    $(".close-popcompare").click(function () {
        $(".PopupCompare").remove();
    });
    setTimeout(function () {
        $(".PopupCompare").remove();
    }, 10000);
}

function addToCompare(productId, product)
{

    var totalValueNow = parseInt($('.bt_compare').next('.compare_product_count').val());
    var action, totalVal;
    if ($.inArray(parseInt(productId), comparedProductsIds) === -1)
        action = 'add';
    else
        action = 'remove';

    $.ajax({
        headers: {"cache-control": "no-cache"},
        url: productcompare_url,
        async: true,
        cache: false,
        data: {
            "ajax": 1,
            "action": action,
            "id_product": productId,
            "token": static_token
        },
        success: function (data) {
            if (action === 'add' && (comparedProductsIds == null || comparedProductsIds.length < comparator_max_item)) {
                if (comparedProductsIds == null)
                    comparedProductsIds = [];
                comparedProductsIds.push(parseInt(productId)),
                        compareButtonsStatusRefresh(),
                        totalVal = totalValueNow + 1,
                        $('.bt_compare').next('.compare_product_count').val(totalVal),
                        totalValue(totalVal);
                setTimeout(function () {
                    ShowModalCompare(product, 1);
                }, 300);
                $("#count-compare").html(parseInt($("#count-compare").html()) + 1);
            } else if (action === 'remove') {
                comparedProductsIds.splice($.inArray(parseInt(productId), comparedProductsIds), 1),
                        compareButtonsStatusRefresh(),
                        totalVal = totalValueNow - 1,
                        $('.bt_compare').next('.compare_product_count').val(totalVal),
                        totalValue(totalVal);
                setTimeout(function () {
                    ShowModalCompare(product, -1);
                }, 300);
                $("#count-compare").html(parseInt($("#count-compare").html()) - 1);
            } else
            {
                ShowModalCompare(product, 0);
            }
            totalCompareButtons();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("TECHNICAL ERROR: \n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus);
        }
    });
}

function reloadProductComparison()
{
    $(document).on('click', 'a.cmp_remove', function (e) {
        e.preventDefault();
        var idProduct = parseInt($(this).data('id-product'));
        $.ajax({
            headers: {"cache-control": "no-cache"},
            url: productcompare_url,
            async: false,
            cache: false,
            data: {
                "ajax": 1,
                "action": 'remove',
                "id_product": idProduct,
                "token": static_token
            },
        });
        $('td.product-' + idProduct).fadeOut(600);

        var compare_product_list = get('compare_product_list');
        var bak = compare_product_list;
        var new_compare_product_list = [];
        compare_product_list = decodeURIComponent(compare_product_list).split('|');
        for (var i in compare_product_list)
            if (parseInt(compare_product_list[i]) != idProduct)
                new_compare_product_list.push(compare_product_list[i]);
        if (new_compare_product_list.length)
            window.location.search = window.location.search.replace(bak, new_compare_product_list.join(encodeURIComponent('|')));
    });
}
;

function compareButtonsStatusRefresh()
{
    $('.add_to_compare').each(function () {
        if ($.inArray(parseInt($(this).data('id-product')), comparedProductsIds) !== -1)
            $(this).addClass('checked');
        else
            $(this).removeClass('checked');
    });
}

function totalCompareButtons()
{
    var totalProductsToCompare = parseInt($('.bt_compare .total-compare-val').html());
    if (typeof totalProductsToCompare !== "number" || totalProductsToCompare === 0)
        $('.bt_compare').attr("disabled", true);
    else
        $('.bt_compare').attr("disabled", false);
}

function totalValue(value)
{
    $('.bt_compare').find('.total-compare-val').html(value);
}

function get(name)
{
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location.search);

    if (results == null)
        return "";
    else
        return results[1];
}
