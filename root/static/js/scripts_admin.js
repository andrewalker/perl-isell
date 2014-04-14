/* scripts */
jQuery(function($) {
    $('[id *= "page-"]').click(function(e){
        var page = $(this).attr("id").split("-")[1];
        var path = location.href.split('&page=');
        if(path.length > 1) {
            location.href = path[0]+path[1].substring(1) + '&page=' + page;
        }
        else {
            test = location.href.split("?");
            if(test.length>1)
                location.href = location.href + '&page=' + page;
            else
                location.href = location.href + '?&page=' + page;
        }
        e.preventDefault();
    });
});
