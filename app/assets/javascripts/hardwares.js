$(document).ready(function() {
  
  $('#hardwares').dataTable({
    "sDom": "<'row'<'span7'l><'pull-right'f>r>t<'row'<'span7'i><'pull-right'p>>",
    "sPaginationType": "bootstrap",
    "bServerSide": true,
    "sAjaxSource": $('#hardwares').data('source')
  })

})  