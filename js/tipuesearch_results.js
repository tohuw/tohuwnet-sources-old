$(document).ready(function() {
    $('#tipue_search_input').tipuesearch({
        'mode': 'json',
        'contentLocation': '/js/searchcontent.js',
        'show': {{ site.data.search.results_count }},
        'showURL': false
    });
});
