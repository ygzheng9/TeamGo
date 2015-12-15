var saveAll = function(e) {

  // column name
  var keys = ['company_id', 'display_seq', 'code', 'name', 'desc', 'teammember_id', 'uplevel_id'];

  // white list for column
  var fields = [2,3,4,5];

  // key is id, value is {column name: colum value}
  var tblObj = {};
  $("#task_types_idx tbody tr").each(function() {
    var id = $(this).data("id");

    var obj = {};
    $(this).find("td").each(function(i) {
      if ( $.inArray(i, fields) !== -1) {
        var colName = keys[i];

        if ( $(this).data('id') === undefined) {
          obj[colName] = $(this).text();
        } else {
          obj[colName] = $(this).data('id');
        }
      }
    });

    tblObj[id] = obj;
  });

  console.log(tblObj);

  // passing for rails, in rails: params["task_type"]
  // params["task_type"].keys, params["task_type"].values
  var param = {task_type: tblObj};

  $.post('/task_types/saveAll', param, function(data) {
    console.log(data);
  });

  // console.log('clicked.');
}