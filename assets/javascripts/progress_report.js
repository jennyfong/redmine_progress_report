jQuery( document ).ready(function($) {

    jQuery('#progress_report_form #project_id').on('change', function(){
        var project_id = $(this).prop('id');
        $('#progress_report_form').submit();
    })

});