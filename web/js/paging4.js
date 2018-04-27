
// Call template init (optional, but faster if called manually)
$.template.init();

// Table sort - DataTables
var table = $('#sorting-advanced');
table.dataTable({
    'aoColumnDefs': [
        { 'bSortable': false, 'aTargets': [ 0, 4 ] }
    ],
    'sPaginationType': 'full_numbers',
    'sDom': '<"dataTables_header"lfr>t<"dataTables_footer"ip>',
    'fnInitComplete': function( oSettings )
    {
        // Style length select
        table.closest('.dataTables_wrapper').find('.dataTables_length select').addClass('select blue-gradient glossy').styleSelect();
        tableStyled = true;
    }
});

// Table sort - styled
$('#sorting-example1').tablesorter({
    headers: {
        0: { sorter: false },
        5: { sorter: false }
    }
}).on('click', 'tbody td', function(event)
{
    // Do not process if something else has been clicked
    if (event.target !== this)
    {
        return;
    }

    var tr = $(this).parent(),
        row = tr.next('.row-drop'),
        rows;

    // If click on a special row
    if (tr.hasClass('row-drop'))
    {
        return;
    }

    // If there is already a special row
    if (row.length > 0)
    {
        // Un-style row
        tr.children().removeClass('anthracite-gradient glossy');

        // Remove row
        row.remove();

        return;
    }

    // Remove existing special rows
    rows = tr.siblings('.row-drop');
    if (rows.length > 0)
    {
        // Un-style previous rows
        rows.prev().children().removeClass('anthracite-gradient glossy');

        // Remove rows
        rows.remove();
    }

    // Style row
    tr.children().addClass('anthracite-gradient glossy');

    // Add fake row
    $('<tr class="row-drop">'+
        '<td colspan="'+tr.children().length+'">'+
        '<div class="float-right">'+
        '<button type="submit" class="button glossy mid-margin-right">'+
        '<span class="button-icon"><span class="icon-mail"></span></span>'+
        'Send mail'+
        '</button>'+
        '<button type="submit" class="button glossy">'+
        '<span class="button-icon red-gradient"><span class="icon-cross"></span></span>'+
        'Remove'+
        '</button>'+
        '</div>'+
        '<strong>Name:</strong> John Doe<br>'+
        '<strong>Account:</strong> admin<br>'+
        '<strong>Last connect:</strong> 05-07-2011<br>'+
        '<strong>Email:</strong> john@doe.com'+
        '</td>'+
        '</tr>').insertAfter(tr);

}).on('sortStart', function()
{
    var rows = $(this).find('.row-drop');
    if (rows.length > 0)
    {
        // Un-style previous rows
        rows.prev().children().removeClass('anthracite-gradient glossy');

        // Remove rows
        rows.remove();
    }
});

// Table sort - simple
$('#sorting-example2').tablesorter({
    headers: {
        5: { sorter: false }
    }
});
