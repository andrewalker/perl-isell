/* scripts */
$('#orderby').change(function () {
    location.href = location.href.replace(location.search, '') + '?sort=' + $('#orderby').val();
});
