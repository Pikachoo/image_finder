function show_image(id){
    var image;
    var tags;
    var url = '/api/v1/images?id=' + id;
    var share_url = window.location.host + '/images/' +id;
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
        $('#modal_image').text(html);

        if (tags.length > 0){
            tags_html = '<div class="ui segment">';
            $.each(tags, function (index, value) {
                tags_html = tags_html +  '<a href="/tags/' + value.id + '/images/" > ' + value.name + '</a>'
            });
            tags_html = tags_html + '</div>';
        }


        var title_html =   '<div class="ui segment">'+
                                '<div class="ui image-header centered">'+
                                    '<a>' + share_url + '</a>'+
                                    '<i class="arrow circle down icon blue"/>'+
                                '</div>'+
                           '</div>';
        var image_html = '<a href="/images/' + id + '"> ' +
                        '<div class="ui image" onclick="show_image(2);"> ' +
                            '<img src="' + image.file.url + '" id="'+ id +'"> ' +
                        '</div> ' +
                    '</a>';

        var html = '<div class="ui modal">' +
                        '<i class="close_modal close icon"></i>' +
                        '<div class="header centered">' +
                           'Image' +
                        '</div> ' +
                        '<div class="image content"> ' +
                            '<div class="ui segment"> ' +
                                title_html + image_html + tags_html +
                            '</div> ';


        html = html + '</div> ' +  '</div>';

        $('#modal_image').append(html);



        // init modal window
        $("img").load(function () {
            $('.ui.modal')
                .modal('show')
                .modal({'closable': 'true'})
            ;
            fontSize();

            $('.close_modal').click(function () {
                $('.ui.modal').modal('hide');
                $($('.ui.modal')[0].parentElement).text('')

            });
        });



    });

}

function fontSize() {
    $.each($(".image-header"), function (index, item) {
        var fontSize = $(item.parentElement).innerWidth()* 0.05; // 10% of container width
        $(item).css('font-size', fontSize);
    });
};
