//= require jquery
//= require jquery_ujs
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions
//= require jquery.singlemask
//= require jquery.price_format
//= require bootstrap
//= require cocoon
//= require_self
//= autocomplete-rails
//= polls


var maskSetup = function (html) {
    html.find('input.date').inputmask("99/99/9999");
    html.find('input.cpf').inputmask("999.999.999-99");
    html.find('input.cnpj').inputmask("99.999.999/9999-99");
    html.find('input.phone').inputmask("(99)9999-9999");
    html.find('input.time').inputmask("99:99");
    html.find('input.height').inputmask("9.99");
    html.find('input.weight').inputmask("999.99");
    html.find("input.integer").singlemask(/\d/);
    html.find("input.decimal").priceFormat({
        prefix: '',
        centsSeparator: ',',
        thousandsSeparator: '.'
    });

    html.find("input[data-mask]").each(function () {
        var mask = $(this).data('mask').toString();
        $(this).inputmask(mask);
    });
}

$(function () {
    maskSetup($(document.body));

    $(document).bind('cocoon:after-insert', function(e, inserted_item) {
        maskSetup(inserted_item);
    });

    var selector = "input, textarea";
    var beforeChange = function(event){
      $(this).data("value", this.value);
    };

    var afterChange = function(event){
      var input = $(this);
      if(this.value !== input.data("value")){
        input.trigger("change").removeData("value");
      }
    };

    $(document.body)
      .on("focus",     selector, beforeChange)
      .on("keydown",   selector, beforeChange)
      .on("mousedown", selector, beforeChange)
      .on("keyup",     selector, afterChange)
      .on("mouseup",   selector, afterChange);

});
