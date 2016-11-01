
$(document)
    .ready(function() {

        $('#left-menu').first()
            .sidebar('setting', {transition: 'overlay'})
            .sidebar('attach events', '.mobile-button')
        ;

    })
;
