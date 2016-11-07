function show_image(id){
    var image;
    var tags;
    var url = '/api/v1/images?id=' + id;
    $.ajax({
        url: url,
        success: function (data, status) {
            image = data;
            tags = image.tags;
        }
    });


    $.when( $.ajax(url ) ).then(function( data, textStatus, jqXHR ) {
        var tags_html = '';
        var html = '';
        var share_link = '';
        $('#modal_image').text(html);

        if (tags.length > 0){
            tags_html = '<div class="ui segment">';
            $.each(tags, function (index, value) {
                tags_html = tags_html +  '<a href="/tags/' + value.id + '/images/" > ' + value.name + '</a>'
            });
            tags_html = tags_html + '</div>';
        }

        share_link = '<div class="ui segment"><p>Share link: <a> ' + window.location.host + image.file.url + '</a></p>'



        var html = '<div class="ui modal">' +
            '<i class="close_modal close icon"></i>' +
            '<div class="header">' +
            'Image' +
            '</div> ' +
            '<div class="image content"> ' +
            '<div class="ui segment"> ' +
            '<a href="/images/' + id + '"> ' +
            '<div class="ui image" onclick="show_image(2);"> ' +
            '<img src="' + image.file.url + '" id="'+ id +'"> ' +
            '</div> ' +
            '</a>';


        html = html + tags_html + share_link +  '</div> ' +
                                '</div> ' +
                                '</div>';

        $('#modal_image').append(html);


        // init modal window
        $("img").load(function () {
            $('.ui.modal')
                .modal('show')
                .modal({'closable': 'true'})
            ;
        });

        $('.close_modal').click(function () {
            $('.ui.modal').modal('hide');
            $($('.ui.modal')[0].parentElement).text('')

        });
    });


}
