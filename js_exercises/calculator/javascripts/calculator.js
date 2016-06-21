function $(id_class_tag_selector) {

};

$(function(){

    $("form").on("submit", function(e) {
      e.preventDefault();

      var numerator = $("#numerator").val(),
          denominator = $("#denominator").val(),
          operator = $("#operator :selected").val(),
          result;

      operation = numerator + operator + denominator;
      result = eval(operation);
      // switch(operator) {
      //   case "+":
      //     result = numerator + denominator;
      //     break;
      //   case "-":
      //     result = numerator - denominator;
      //     break;
      //   case "*":
      //     result = numerator * denominator;
      //     break;
      //   case "/":
      //     result = numerator / denominator;
      //     break;
      //   default:
      //    result = "NaN";
      // }
     
     $("h1").text(result)
    });
});