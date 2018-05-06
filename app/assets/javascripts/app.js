$(function(){
  $('#house-selector').on('submit', function(e){
    e.preventDefault();
    var countyAttr = $('#county').val();
    var townAttr = $('#town').val();
    var minBedsAttr = $('#min_bedrooms').val();
    var maxBedsAttr = $('#max_bedrooms').val();
    var minPriceAttr = $('#min_price').val();
    var maxPriceAttr = $('#max_price').val();
    $.ajax({
      url: "/property-list",
      type: "POST",
      data: { county: countyAttr,
              town: townAttr,
              min_bedrooms: minBedsAttr,
              max_bedrooms: maxBedsAttr,
              min_price: minPriceAttr,
              max_price: maxPriceAttr },
      success: function(result){
        $("#property-list-wrapper").html(result);
      },
      error: function(){
        alert('Error occured');
      }
    });
  });
});
