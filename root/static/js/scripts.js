/* scripts */
$('#orderby').change(function () {
    location.href = location.href.replace(location.search, '') + '?sort=' + $('#orderby').val();
});

$('[id *= "page-"').change(function(){
	page = $(this).attr("id").split("-")[1];
	if(location.search('page='))
	location.href = location.href.replace(location.search, 'page=') + '&page=' + page;
});