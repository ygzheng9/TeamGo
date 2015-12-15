(function($){

  $.fn.dropDownList = function(options) {
    return this.each(function() {
      var buildDefaultOptions = function () {
              var opts = $.extend({}, $.fn.dropDownList.defaultOptions);
              return opts;
          },

          ops = $.extend(buildDefaultOptions(), options),

          url = '/' + ops.res + '.json',

          element = $(this),
          editor = $('<select>').appendTo(element.parent()),
          active,

          init = function () {
            $.get(url, function(data) {
              $(data).each(function() {
                editor.append($("<option>").attr('value',this.id).text(this.display_name));
              });
            });

            editor.css('position', 'absolute').hide();
          };

      init();

      var showEditor = function (e) {
        active = element.find('td:focus');

        editor.show()
            .offset(element.offset())
            .css(element.css(ops.properties))
            .width(element.width())
            .height(element.height() + 16)   // add td's padding to dropdown
            .focus();

        if (element.length) {
          var tmp = element.text();
          editor.find("option").filter(function(index) {
              return tmp === $(this).text();
          }).attr("selected", "selected");
        }

        e.preventDefault();
        e.stopPropagation();
      };

      var  setElementText = function () {
        var id = editor.val(),
            text = editor.find("option:selected").text();
            evt = $.Event('change');

        // console.log('text is: ' + text);
        // element.val(text).trigger(evt, text);
        element.val(text);
        element.data("id", id);
        element.text(text);
      };

      editor.blur(function () {
        setElementText();
        editor.hide();
      });

    element.on('click keypress dblclick', showEditor)
      .css('cursor', 'pointer');

    element.find('td').prop('tabindex', 1);

    $(window).on('resize', function () {
      if (editor.is(':visible')) {
        editor.offset(active.offset())
        .width(active.width())
        .height(active.height());
      }
    });
  });  // end of this.each
};

}(jQuery));


$.fn.dropDownList.defaultOptions = {
  properties: ['padding', 'padding-top', 'padding-bottom', 'padding-left', 'padding-right',
            'text-align', 'font', 'font-size', 'font-family', 'font-weight',
            'border', 'border-top', 'border-bottom', 'border-left', 'border-right'],
  res: 'teammembers'
};

