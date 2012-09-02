if (history && history.pushState) {
    function slide_to(target){
        var scrollToPosition = $(target).offset().top;
        console.log(scrollToPosition);

        $('html').animate({ 'scrollTop': scrollToPosition }, 600, function(){
            //window.location.hash = "" + target;
            // This hash change will jump the page to the top of the div with the same id
            // so we need to force the page to back to the end of the animation
            $('html').animate({ 'scrollTop': scrollToPosition }, 0);
        });

    }

    $(document).ready(function(){

        $('#photo_gallery').on("click", ".pagination a[href]", function() {
            slide_to($('#photo_gallery'));
            $.getScript(this.href);
            history.pushState(null,"",this.href);
            return false;
        });

        $(window).bind("popstate", function() {
            $.getScript(location.href);
        });
    });
}
