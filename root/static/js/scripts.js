/* scripts */
$('#orderby').change(function () {
    location.href = location.search ? location.href + '&sort=' + $('#orderby').val() : location.href + '?sort=' + $('#orderby').val();
});
