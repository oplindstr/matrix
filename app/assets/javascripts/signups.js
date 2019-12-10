$(document).ready(function() {
  $('#signups_table').DataTable({
  	paging: false,
  	dom: 'Bfti',
  	buttons: [
        'copy'
    ]
  });
});