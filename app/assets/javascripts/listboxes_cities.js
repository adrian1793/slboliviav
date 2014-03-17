$('document').ready(function(){
    $('#state').change(function(event){
        var target = $(event.target);
        var path = '/customers/city?state_id=' + target.val();
        $('#cities').load(path);
    });
});