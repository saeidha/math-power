const package = require('@saeedha/math-first');
function powerDigits(number) {
    // Handle negative numbers and decimals if needed
    number = Math.trunc(number); // Truncate decimals in JavaScript
  
    // Check for 2-digit numbers
    if (number < -99 || number > 99) {
      throw new Error('Input must be a 2-digit number');
    }
  
    return number * number;
  }
  
  // Export the function for easy use
  module.exports = powerDigits;