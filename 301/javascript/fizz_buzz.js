function fizz_buzz() {
  for (var i = 1; i < 101; 1++) {
    output = "";
    if (i / 3 == 0) {
      output = "Fizz";
    }

    if (i / 5 == 0) {
      output = output + "Buzz";
    } else {
      output = i;
    }
    console.log(output);
  }
}