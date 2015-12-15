(function($){

  $.fn.readOnly = function(options) {
    var element = $(this);

    return this.each(function() {
      var byPass = function(e) {
          e.preventDefault();
          e.stopPropagation();
      };

      element.on('click keypress dblclick', byPass)
        .css('cursor', 'pointer');

      element.find('td').prop('tabindex', 1);
  });  // end of this.each
};

}(jQuery));


