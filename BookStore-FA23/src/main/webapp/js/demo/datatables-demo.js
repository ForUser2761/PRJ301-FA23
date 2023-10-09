// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});

$('#dataTable').DataTable( {
  colReorder: true
} );