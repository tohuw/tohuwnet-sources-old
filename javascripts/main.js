// Submit the search form automatically if at least 3 characters are entered
$('input#search_box')
    .on('input', function() {
        if ($('input#search_box').val().length > 2) {
            $('input#search_box').submit();
        }
    });
