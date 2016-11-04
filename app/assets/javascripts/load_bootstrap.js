
$(document)
    .ready(function() {

        $('#left-menu').first()
            .sidebar('setting', {transition: 'overlay'})
            .sidebar('attach events', '.mobile-button')
        ;

        $('.ui.search')
            .search({
                apiSettings: {
                    url: 'http://localhost:3000/api/v1/tags?search_name={query}'
                },
                fields: {
                    results : 'tags',
                    title   : 'name',
                    url     : 'http://localhost:3000/api/v1/tags'
                }

            })
        ;

    })
;
