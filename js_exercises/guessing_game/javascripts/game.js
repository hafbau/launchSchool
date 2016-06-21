$(function(){

    var my_number = Math.ceil(100 * Math.random()),
        guess_count = 0;

    $("form").on("submit", function(e) {
      e.preventDefault();

      var guess = +$("#guess").val(),
          status_p;

      guess_count++;

      if(guess === my_number) {
        status_p = "You guessed right! It took " + guess_count + " guesses";

      } else if(guess < my_number) {
        status_p = "My number is greater than " + guess;

      } else {
        status_p = "My number is less than " + guess;
      };

      $("main > p").text(status_p);
    });
  
  $("a").click(function(e) {
    e.preventDefault();

    my_number = Math.ceil(100 * Math.random());
    guess_count = 0;
    $("p").text("Guess a number between 1 and 100");
    $("#guess").val("");
  })
});