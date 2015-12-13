(function($){

  $.fn.dropDownList = function(options) {
    return this.each(function() {
      var buildDefaultOptions = function () {
              var opts = $.extend({}, $.fn.dropDownList.defaultOptions);
              return opts;
          },
          ops = $.extend(buildDefaultOptions(), options),

          element = $(this),
          editor = $('<select>').appendTo(element.parent()),

          init = function () {
            $(ops.listValue).each(function() {
                editor.append($("<option>").attr('value',this.val).text(this.text));
            });

            editor.css('position', 'absolute').hide();
          };

      init();

      var showEditor = function () {
        if (element.length) {
          var tmp = "option[text='" + element.text() + "']";

          editor.find(tmp).attr("selected",true);
        }

        editor
            .show()
            .offset(element.offset())
            .css(element.css(ops.properties))
            .width(element.width())
            .height(element.height())
            .focus();
      };

      var  setElementText = function () {
        var id = editor.val(),
            text = editor.find("option:selected").text();
            evt = $.Event('change');

        console.log('text is: ' + text);
        element.val(text).trigger(evt, text);
        element.data("id", id);
        element.text(text);
      };

      editor.blur(function () {
        setElementText();
        editor.hide();
      });

      element.on('click keypress dblclick', showEditor);
    });

  };

}(jQuery));


$.fn.dropDownList.defaultOptions = {
  properties: ['padding', 'padding-top', 'padding-bottom', 'padding-left', 'padding-right',
            'text-align', 'font', 'font-size', 'font-family', 'font-weight',
            'border', 'border-top', 'border-bottom', 'border-left', 'border-right'],
  listValue: [{val : 1, text: 'One'},
              {val : 2, text: 'Two'},
              {val : 3, text: 'Three'}]
};

