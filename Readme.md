# How to use jQuery to drag and drop cards from one ASPxCardView to another
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/138994998/)**
<!-- run online end -->

<p>The example demonstrates how to use the jQuery framework to drag a card from one ASPxCardView to another.</p>
<p>- Use jQuery UI <a href="http://jqueryui.com/draggable/">Draggable</a> and <a href="http://jqueryui.com/droppable/">Droppable</a> plug-ins;<br />- Define "draggable" and "droppable" items:</p>

```aspx
<Styles>
    <Table CssClass="droppableLeft"></Table>
    <Card CssClass="draggableRow left"></Card>
</Styles>
```

<p>- Use the invisible <strong>ASPxGlobalEvents</strong> control and handle its client-side ControlsInitialized/EndCallback events;<br />- Initialize the defined draggable/droppable items via the corresponding jQuery selectors. The "start" event handler can be used to obtain the key of the dragged card:</p>

```js
var rowKey = -1;
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
}
```

<p>- Handle the "drop" event of the "droppable" items and perform a callback to the callback panel that has both ASPxCardViews nested inside to move a card's underlying data item between the data sources.</p>

```js
drop: function (ev, ui) {
	$(".targetGrid").removeClass("targetGrid");
	var leftToRight = ui.helper.hasClass("left");
	cbPanel.PerformCallback(rowKey + "|" + leftToRight);
}
```

<p>Select the "script.js" source file and review the comments to find an illustration of the above steps.</p>
<br />
<p><strong>See </strong><strong>A</strong><strong>lso:<br /></strong><a href="https://www.devexpress.com/Support/Center/p/T116869">T116869: GridView - How to drag and drop items from one grid to another</a><strong><br /></strong><a href="https://www.devexpress.com/Support/Center/p/E4582">E4582: How to reorder ASPxGridView rows using buttons or drag-and-drop</a></p>

<br/>


