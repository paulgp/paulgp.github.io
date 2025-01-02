/**
 * @author: Kaushik Gopal
 *
 * A jQuery function that displays the footnotes
 * on the side (sidenotes) for easier reading.
 *
 * This is as recommended by Edward Tufte's style sidenotes:
 * https://edwardtufte.github.io/tufte-css/#sidenotes
 *
 **/
(function () {

    $(window).on("load", function () {
        const $footnotes = $(".footnotes"),
            $postContent = $(".post-content");
        console.log($footnotes);
        loadSideNotesFromFootnotes($postContent, $footnotes);

        $(window).resize(function () {
            // console.log(" XXX -- RESIZE -- XXX ");

            // TODO: optimization if window width doesn't change that much
            // const new_ww = $(".wrapper").outerWidth();
            // if (new_ww === windowWidth) return;
            // windowWidth = new_ww;

            loadSideNotesFromFootnotes($postContent, $footnotes);
        });
    });

    function loadSideNotesFromFootnotes($postContent, $footnotes) {

        // remove any existing side notes to begin
        $(".sidenote").remove();

        //region Should we even show sidenotes?

        // has post content
        if ($postContent.length < 1) {
            $footnotes.show();  // previous resize could have hidden footnotes
            return;
        }
        const startPosition = $postContent.position().left
            + $postContent.outerWidth()
            + 60; // some padding

        // console.log(" ---> postWidth " + $postContent.position().left);
        // console.log(" ---> startPosition " + startPosition);
        // console.log(" ---> snStart " + (startPosition + startPosition / 3));
        // console.log(" ---> windowWidth " + $postContent.outerWidth());

        const viewportWidth = $(window).width(); // Get the viewport width
        const mainContentWidth = $postContent.outerWidth(true); // true includes margin
        const availableSpace = viewportWidth - mainContentWidth - 200; // Subtract main content width and some padding from viewport width

        let sideNoteWidth = startPosition / 5;
        // has room to show side content
        if (availableSpace < 2*sideNoteWidth) {
            $footnotes.show();  // previous resize could have hidden footnotes
            return;
        }
        //endregion
        // if (window.innerWidth < 1200) {
        //     $footnotes.show();  // previous resize could have hidden footnotes
        //     return;
        // }
        // let mainRegionWidth = $(".topnav").outerWidth();
        // let sideNoteWidth = $(".topnav").outerWidth() / 2;
        // console.log(" ---> mainRegionWidth " + mainRegionWidth);
        // console.log(" ---> mainRegionWidth " + sideNoteWidth);

        // if (window.width < (mainRegionWidth + (2 * sideNoteWidth))) {
        //     $footnotes.show();  // previous resize could have hidden footnotes
        //     return;
        // }
        const $fnItems = $footnotes.find("ol li");

        $("sup").each(function (index) {
            const $footnoteText = $fnItems.eq(index).text().trim();
            createSideNote($(this), $footnoteText, startPosition);
        });

        //$footnotes.hide();
    }

    function createSideNote(superscript, footnoteText, startPosition) {

        // console.log(" ---> " + superscript.text() + " : " + footnoteText);

        // construct side note <div>
        let div = $(document.createElement('div'))
            .text(footnoteText)
            .addClass("sidenote");

        const topPosition = superscript.offset();

        div.css({
            position: "absolute",
            left: startPosition,
            top: topPosition["top"],
            width: startPosition / 5,
        });

        if (startPosition > 420) {
            superscript.hover(function () {
                div.addClass("sidenote-hover");
            }, function () {
                div.removeClass("sidenote-hover");
            });
        } else {
            div.addClass("sidenote-hover");
        }

        // attach side note <div>
        $(document.body).append(div);
    }

})();