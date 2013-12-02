/* scripts */
$('#orderby').change(function () {

    location.href = location.href.replace(location.search,'')+"?sort="+$("#orderby").val();
});


$('[id *= "page-"]').click(function(){
	page = $(this).attr("id").split("-")[1];
	path = location.href.split('&page=');
	if(path.length > 1)
		location.href = path[0]+path[1].substring(1) + '&page=' + page;
	else
	{
		test = location.href.split("?");
    	if(test.length>1)
			location.href = location.href + '&page=' + page;
		else
			location.href = location.href + '?&page=' + page;
	}
});