function dish_quantity_sub() {
  var quantity = document.getElementById('dish-quantity');
  if (quantity.innerHTML == '0') return;
  quantity.innerHTML = parseInt(quantity.innerHTML) - 1;
  // $('#search-quantity').innerHTML = parseInt($('#search-quantity').innerHTML) + 1;
}

function dish_quantity_add() {
  var quantity = document.getElementById('dish-quantity');
  if (quantity.innerHTML == '1000') return;
  quantity.innerHTML = parseInt(quantity.innerHTML) + 1;
  // $('#search-quantity').innerHTML = parseInt($('#search-quantity').innerHTML) + 1;
}

function picker() {
  $('#datetimepicker').datetimepicker({
    format: 'YYYY-MM-DD HH:mm:00 UTC',
    daysOfWeekDisabled: [0, 6]
  });
}
function birth_date_picker() {
  $("#datetimepicker").datetimepicker({
    format: 'YYYY-MM-DD'
  });
}
