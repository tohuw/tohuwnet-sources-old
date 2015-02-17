// Search Form Effects
var searchPlaceholder = $('#tipue_search_input').attr("placeholder")

$('#tipue_search_input')
    .focus(function() {
        if (!($(this).attr("placeholder") == searchPlaceholder) && $(this).attr("class").indexOf("notresultspage") > 1) {
            $(this).attr("placeholder", searchPlaceholder);
        };
    })
    .mouseenter(function() {
        $(this).focus();
    })
    .blur(function() {
        if ($(this).attr("class").indexOf("notresultspage") > 1) {
            $(this).val("");
            $(this).attr("placeholder", "\uf002");
        }
    });
