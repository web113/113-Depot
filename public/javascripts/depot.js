var jq = $.noConflict();
var quantity = 0;
var that = null;

jq(document).ready(function() {
  dragAndDrop();
  jq(".item_quantity").live("click", modify);
  jq("td input").live("blur", afterModify);
  jq(".need_to_login").click(login);
  jq("#to_logout").click(logout);
  jq("#searchButton").click(search);
  jq("#register").click(register);
});

var setElementHoverEffect = function(element) {
  element.css("z-index", "10");
  element.mouseover(function() {
    jq(this).css("background-color", "#1F7A1F"); 
  });

  element.mouseout(function() {
    jq(this).css("background-color", "#114411");
  });
};

var setHoverEffect = function() {
  setElementHoverEffect(jq("#current_item"));
  setElementHoverEffect(jq(".line_item"));
};

var makeDraggable = function(element) {
  jq(element).draggable({
    start: function(event, ui) {
      that = jq(this);
      jq(this).css("z-index", "20");
    }, 
    stop: function(event, ui) {
      that = null;
      jq(this).css("z-index", "10");
    }, 
    revert: "invalid"
  });
};

var makeDroppable = function(element) {
  jq(element).droppable({
    over: function(event, ui) {
      if (that) {
        that.find("[value=del]").click();
        that = null;
      }
    }
  });
};

var dragAndDrop = function() {
  makeDraggable("#current_item");
  makeDraggable(".line_item");
  makeDroppable("#main");
  setHoverEffect();
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
    new Effect.Highlight($$("#current_item")[0], {
      startcolor: "#88ff88", endcolor: "#114411"
    });
    setHoverEffect();
  }
};

var login = function() {
  var url = "http://" + location.host + jq("#login").children().eq(0).attr("href");
  location.href = url;
};

var logout = function() {
  jq("#logout").children().find('[value=Logout]').click();
};

var search = function() {
  jq(this).next().children().eq(0).click();
};

var showResult = function(result) {
  if (result != "true") {
    alert("Sorry, we haven't got enough books for you to buy!");
  }
};

var register = function() {
  var url = "http://" + location.host + "/users/new";
  location.href = url + location.search;
};
