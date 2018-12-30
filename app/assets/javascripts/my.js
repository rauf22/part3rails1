
  jQuery(document).ready(function($) {
    $('.my-slider').unslider({
      autoplay:true,
      arrows:false
    });
  });

function setEqualHeight(columns) { 
  var tallestcolumn = 0; 
  columns.each( function() { 
    currentHeight = $(this).height(); 
    if(currentHeight > tallestcolumn) { tallestcolumn = currentHeight; } } ); 
    columns.height(tallestcolumn); 
  } 
  
  $(document).ready(function() { setEqualHeight($(".block4-main-content")); });