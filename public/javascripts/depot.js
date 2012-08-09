var jq = $.noConflict();

jq(document).ready(function() {
  dragAndDrop();
  jq(".item_quantity").live("click", modify);
  jq("td input").live("blur", afterModify);
});

var dragAndDrop = function() {
  var that = null;

  jq(".line_item").draggable({
    start: function(event, ui) {
      that = jq(this);
    }, 
    stop: function(event, ui) {
      that = null;
    }, 
    revert: "invalid"
  });

  jq("#main").droppable({
    over: function(event, ui) {
      if (that) {
        that.remove();
      }
      alert("!!");
    }
  });
};

var modify = function() {
  var html = jq(this).html();
  var number = html.substring(0, html.length - 2);
  var nextElement = jq(this).next();

  jq(this).remove();
  
  var inputBox = '<td><input type="text" value="' + number + '"/></td>';
  jq(inputBox).insertBefore(nextElement).children().eq(0).focus();
};

var afterModify = function() {
  var number = jq(this).val();
  var nextElement = jq(this).parent().next();

  jq(this).parent().remove();

  var td = '<td class="item_quantity">' + number + '&times; </td>';
  jq(td).insertBefore(nextElement);
};
