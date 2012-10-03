$(document).ready(function(){

  $("input.datepicker").each(function(){
    $(this).datepicker({
      
      dateFormat: "yy-mm-dd"
      
  })});
 
});