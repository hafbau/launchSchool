$(function() {
  var $ul = $("ul");

  function addItem(name, quantity) {
    $ul.append("<li>" + quantity + " " + name + "</li>");
  }

  $("form").on("submit", function(e) {
    e.preventDefault();
    var $f = $(this),
        name = $f.find("#name").val(),
        quantity = $f.find("#quantity").val() || 1;

    addItem(name, quantity);

    $f.get(0).reset();
  });
});