function show_date_range(period) {
    switch (period) {
        case 'from_date':
            jQuery('#date_range_wrapper').show();
            jQuery('#from_date_wrapper').show();
            jQuery('#to_date_wrapper').hide();

            break;
        case 'between':
            jQuery('#date_range_wrapper').show();
            jQuery('#from_date_wrapper').show();
            jQuery('#to_date_wrapper').show();
            break;
        default:
            jQuery('#date_range_wrapper').hide()

    }

    return period;
}

jQuery(document).ready(function ($) {

    jQuery('#progress_report_form #project_id').on('change', function () {
        var project_id = $(this).prop('id');
        $('#progress_report_form').submit();
    })


    jQuery('#progress_report_form #period').on('change', function () {
        var progress_period = $(this).val();
        show_date_range(progress_period);

    })

    var period = jQuery('#progress_report_form #period');
    show_date_range(period.val());

});