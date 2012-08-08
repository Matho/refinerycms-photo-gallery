$(function() {
    $('form#form_edit_photos').on("click", ".form-photo-field .form-actions-right .confirm-delete", function() {
        if ( confirm( $(this).attr('data-confirm') ) ) {
            $.ajax({
                type: "POST",
                dataType: 'script',
                data: { '_method': 'delete' },
                url: this.href
            });
        }

        //TODO if all fields are deleted, show info - 0 photos and dont show form actions

        return false;
    });

    $('#more_photo_options_field #toggle_advanced_options').click(function(e){
        e.preventDefault();
        $('#more_options').animate({opacity: 'toggle', height: 'toggle'}, 250);

        $('html,body').animate({
            scrollTop: $('#toggle_advanced_options').parent().offset().top
        }, 250);
    });

    $(".chzn-select").chosen();

});