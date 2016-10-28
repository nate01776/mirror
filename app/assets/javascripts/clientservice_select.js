var salon_stylists = null;
var salon_services = null;
var position_num = null;
var options = []

$(document).ready(function() {

  salon_stylists = gon.salon_stylists;
  salon_services = gon.salon_services;

  $("#clientservice_service_id").change(function() {
    var val = $(this).val();
    options = [null]

  $.each(salon_stylists, function(position, data) {
    position_num = position;
    $.each(data.services, function(pos, dat) {
      if (dat.name === $("#clientservice_service_id").val()) {
        var to_push = salon_stylists[position_num].stylist;
        options.push(
          "<option value=" + to_push.id + ">" + to_push.first_name + " " + to_push.last_name + "</option>"
        );
      }
    });
  });

    $("#clientservice_stylist_id").html(options);
  });

})
