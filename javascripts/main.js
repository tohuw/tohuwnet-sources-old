// Clear the search form when focus is lost
$('input#search_box')
    .blur(function() {
        $('input#search_box').val('');
    });

// Submit the search form automatically if at least 3 characters are entered
$('input#search_box')
    .on('input', function() {
        if ($('input#search_box').val().length > 2) {
            $('div#search_results').removeClass('no_results');
            $('input#search_box').submit();
        }
    });
