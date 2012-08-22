if (history && history.pushState) {
    $(document).ready(function(){

        $('#photo_gallery').on("click", ".pagination a[href]", function() {
            $.getScript(this.href);
            history.pushState(null,"",this.href);
            return false;
        });

        $(window).bind("popstate", function() {
            $.getScript(location.href);
        });
    });
}
