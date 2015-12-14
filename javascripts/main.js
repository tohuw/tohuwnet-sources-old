// Toggle flyout when hamburger is clicked
$('#menu').click(function() {
    if ($('#cover').hasClass('active')) {
        $('#flyout').removeClass('slide-in');
        $('#flyout').addClass('slide-out');
        $('#cover').removeClass('active');
        $('html').removeClass('covered');
    } else {
        $('html').addClass('covered');
        $('#cover').addClass('active');
        $('#flyout').removeClass('slide-out');
        $('#flyout').addClass('slide-in');
    }
});

// Hide active modal if cover is clicked
$('#cover').click(function() {
    $('#flyout').removeClass('slide-in');
    $('#flyout').addClass('slide-out');
    $('#cover').removeClass('active');
    $('html').removeClass('covered');
});

// Submit the search form automatically if at least 3 characters are entered
$('#search_box').on('input', function() {
    if ($(this).val().length > 2) {
        $(this).submit();
        $('#search-results').addClass('active');
    }
});

// Close the search results when the "close button" is clicked
$('#search-results .close-button').click(function() {
    $('#search-results').removeClass('active');
    $('#search_box').val('');
});
