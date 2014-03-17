
$('document').ready(function(){
    $('#practice_area').change(function(event){
        var target = $(event.target);
        var path = '/requests/speciality_areas?practice_area_id=' + target.val();
        $('#speciality_areas').load(path);
    });
    $('#request_type_litigio').change(function(event){
        $('#litigio').removeClass('non-visible');

    });
    $('#request_type_asesoramiento').change(function(event){
        $('#litigio').addClass('non-visible');

    });
});