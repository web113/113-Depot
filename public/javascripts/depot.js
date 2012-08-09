var jq = $.noConflict();
var quantity = 0;

jq(document).ready(function() {
  dragAndDrop();
  jq(".item_quantity").live("click", modify);
  jq("td input").live("blur", afterModify);
});

var dragAndDrop = function() {
  var that = null;
  
  jq("#current_item").draggable({
    start: function(event, ui) {
      that = jq(this);
    }, 
    stop: function(event, ui) {
      that = null;
    }, 
    revert: "invalid"
  });

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
        that.find("[value=del]").click();
        that = null;
      }
    }
  });
};

var modify = function() {
  var html = jq(this).html();
  var number = html.substring(0, html.length - 2);
  var nextElement = jq(this).next();
  quantity = number;

  jq(this).remove();
  
  var inputBox = '<td><input type="text" value="' + number + '"/></td>';
  jq(inputBox).insertBefore(nextElement).children().eq(0).focus();
};

var afterModify = function() {
  var number = jq(this).val();
  var nextElement = jq(this).parent().next();

  if (number > 0) {
    quantity = number;
  }

  jq(this).parent().remove();

  var td = '<td class="item_quantity">' + quantity + '&times; </td>';
  jq(td).insertBefore(nextElement);
  updateForm(nextElement, quantity);
  nextElement.parent().children().find("[value=update]").click();

  if (number <= 0) {
    alert("The quantity must be greater than 0!");
  }
};

var updateForm = function(element, number) {
  var form = element.parent().children().find("[value=update]").parent().parent();
  var queryString = form.attr("action") + "&number=" + number;
  form.attr("action", queryString);
}

var showEffect = function(flag) {
  if (flag == "false") {
    new Effect.Shake($$("#current_item")[0]);
  }
};
