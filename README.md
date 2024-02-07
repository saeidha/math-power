Title: powerDigits - Squares 2-Digit Numbers

Description:

A lightweight Node.js package that squares 2-digit numbers, handling negatives and throwing errors for invalid inputs.

Installation:
Bash

```
npm install power-digits
```

Usage:
J

```
avaScriptconst powerDigits = require('power-digits');
console.log(powerDigits(12)); // Output: 144
console.log(powerDigits(-23)); // Output: 529// Throws an error for non-2-digit numbers
powerDigits(123); // throws Error: Input must be a 2-digit number
```


Use code with caution. Learn more

API:

The package provides a single exported function:

    powerDigits(number): number - Squares the given 2-digit number. Throws an error if the input is not a 2-digit number.

Contributing:

We welcome contributions! Please follow these guidelines:

    Fork the repository and make changes in a new branch.
    Write clear and concise commit messages.
    Include tests for your changes.
    Open a pull request for review.

License:

MIT

Additional Notes:

    This package requires Node.js version 14 or later.
    To handle decimals or other edge cases, consider adjusting the code and tests accordingly.
    Use clear and concise language in your README.md.
    Include relevant information like versioning, contributors, and future plans.

I hope this enhanced README.md provides a valuable starting point for your package! Feel free to customize it further and add more details as needed.
