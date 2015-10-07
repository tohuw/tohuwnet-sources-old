// Clear the search form when focus is lost
$('#search_box')
    .blur(function() {
        $(this).val('');
    });

// Submit the search form automatically if at least 3 characters are entered
$('#search_box')
    .on('input', function() {
        if ($(this).val().length > 2) {
            $(this).submit();
            $('#search_results').addClass('search_active');
        }
    });

// Close the search results when the "close button" is clicked
$('#search_results .close-button').click(function() {
    $('#search_results').removeClass('search_active');
});
