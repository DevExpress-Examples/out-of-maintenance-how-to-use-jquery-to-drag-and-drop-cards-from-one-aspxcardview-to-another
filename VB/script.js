var rowKey = -1;

function OnControlsInitialized(s, e) {
    $('.draggableRow').draggable({ // http://api.jqueryui.com/draggable/
        helper: 'clone',
        start: function (ev, ui) {
            var $sourceElement = $(ui.helper.context);
            var $draggingElement = $(ui.helper);
            var sourceGrid = ASPxClientCardView.Cast($draggingElement.hasClass("left") ? "gridFrom" : "gridTo");

            //style elements
            $sourceElement.addClass("draggingStyle");
            $draggingElement.addClass("draggingStyle");

            //find card key
            var list = $draggingElement[0].classList;
            for (var i = 0; i < list.length; i++) {
                if (list[i].indexOf("cardKey") > -1) {
                    var values = list[i].split("_");
                    rowKey = values[1];
                    break;
                }
            }
        },
        stop: function (e, ui) {
            $(".draggingStyle").removeClass("draggingStyle");
        }
    });

    var settings = function (className) {
        return {
            tolerance: "intersect",
            accept: className,
            drop: function (ev, ui) {
                $(".targetGrid").removeClass("targetGrid");
                var leftToRight = ui.helper.hasClass("left");
                cbPanel.PerformCallback(rowKey + "|" + leftToRight);
            },
            over: function (ev, ui) {
                $(this).addClass("targetGrid");
            },
            out: function (ev, ui) {
                $(".targetGrid").removeClass("targetGrid");
            }
        };
    };

    //http://api.jqueryui.com/droppable/
    $(".droppableLeft").droppable(settings(".right"));
    $(".droppableRight").droppable(settings(".left"));
}