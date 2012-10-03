$(document).ready(function() {
  
  $('.data-table').each(function(){
    $(this).dataTable({
      "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
      "sPaginationType": "bootstrap",
      "bServerSide": true,
      "sAjaxSource": $(this).data('source')
    })
  })
  
})  