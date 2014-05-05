$('document').ready(function(){
    $('#country').change(function(event){
        var target = $(event.target);
        var path = '/customers/state?country_id=' + target.val();
        $('#states').load(path);
    });

    $('#state').change(function(event){
        var target = $(event.target);
        var path = '/customers/city?state_id=' + target.val();
        $('#cities').load(path);
    });
});
