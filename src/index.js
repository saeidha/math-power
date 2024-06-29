const package = require('@saeedha/math-first');

// Basic arithmetic module
class Arithmetic {
  // Addition
  static add(a, b) {
    return a + b;
  }

  // Subtraction
  static subtract(a, b) {
    return a - b;
  }

  // Multiplication
  static multiply(a, b) {
    return a * b;
  }

  // Division
  static divide(a, b) {
    if (b === 0) {
      throw new Error('Division by zero');
    }
    return a / b;
  }
}

// Trigonometry module
class Trigonometry {
  // Sine
  static sin(angle) {
    return Math.sin(angle);
  }

  // Cosine
  static cos(angle) {
    return Math.cos(angle);
  }

  // Tangent
  static tan(angle) {
    return Math.tan(angle);
  }

  // Degrees to radians conversion
  static degreesToRadians(degrees) {
    return degrees * (Math.PI / 180);
  }

  // Radians to degrees conversion
  static radiansToDegrees(radians) {
    return radians * (180 / Math.PI);
  }
}

// Exponentiation and logarithms module
class ExponentiationLogarithms {
  // Exponentiation
  static power(base, exponent) {
    return Math.pow(base, exponent);
  }

  // Natural logarithm
  static log(value) {
    return Math.log(value);
  }

  // Logarithm with a specified base
  static logarithm(base, value) {
    return Math.log(value) / Math.log(base);
  }
}

// Calculus module
class Calculus {
  // Numerical differentiation
  static differentiate(func, point, h = 0.0001) {
    return (func(point + h) - func(point)) / h;
  }

  // Numerical integration
  static integrate(func, a, b, dx = 0.0001) {
    let sum = 0;
    for (let x = a; x < b; x += dx) {
      sum += func(x) * dx;
    }
    return sum;
  }

  // Trapezoidal rule for numerical integration
  static trapezoidalRule(func, a, b, n) {
    let sum = 0;
    const h = (b - a) / n;
    for (let i = 1; i < n; i++) {
      sum += func(a + i * h);
    }
    return h * ((func(a) + func(b)) / 2 + sum);
  }
}

// Linear algebra module
class LinearAlgebra {
  // Matrix multiplication
  static matrixMultiply(matrix1, matrix2) {
    // Check if the matrices are valid for multiplication
    if (matrix1[0].length !== matrix2.length) {
      throw new Error('Invalid matrices for multiplication');
    }

    // Initialize the result matrix with appropriate dimensions
    let result = new Array(matrix1.length);
    for (let i = 0; i < matrix1.length; i++) {
      result[i] = new Array(matrix2[0].length).fill(0);
    }

    // Perform matrix multiplication
    for (let i = 0; i < matrix1.length; i++) {
      for (let j = 0; j < matrix2[0].length; j++) {
        for (let k = 0; k < matrix1[0].length; k++) {
          result[i][j] += matrix1[i][k] * matrix2[k][j];
        }
      }
    }

    return result;
  }

  // Eigenvalues calculation using a simple method (e.g., power iteration)
  static eigenvalues(matrix, iterations = 1000, epsilon = 0.0001) {
    // Check if the matrix is square
    if (matrix.length !== matrix[0].length) {
      throw new Error('Eigenvalues can only be calculated for square matrices');
    }

    // Initialize a random vector as the starting point
    let vector = new Array(matrix.length).fill(1);

    // Power iteration method
    for (let i = 0; i < iterations; i++) {
      // Multiply the matrix by the vector
      let newVector = LinearAlgebra.matrixMultiply(matrix, [vector]);

      // Normalize the new vector
      let magnitude = Math.sqrt(newVector.reduce((acc, val) => acc + val * val, 0));
      newVector = newVector.map(val => val / magnitude);

      // Check for convergence
      let diff = newVector.map((val, index) => Math.abs(val - vector[index]));
      if (diff.every(val => val < epsilon)) {
        break;
      }

      vector = newVector;
    }

    // Calculate the eigenvalue from the resulting vector
    let eigenvalue = LinearAlgebra.matrixMultiply([vector], matrix)[0][0];

    return eigenvalue;
  }
}

// Example usage:
const matrix1 = [
  [1, 2, 3],
  [4, 5, 6]
];

const matrix2 = [
  [7, 8],
  [9, 10],
  [11, 12]
];

console.log(LinearAlgebra.matrixMultiply(matrix1, matrix2)); // Output: [[58, 64], [139, 154]]


// Statistics module
class Statistics {
  // Mean calculation
  static mean(values) {
    const sum = values.reduce((acc, val) => acc + val, 0);
    return sum / values.length;
  }

  // Median calculation
  static median(values) {
    const sortedValues = values.slice().sort((a, b) => a - b);
    const mid = Math.floor(sortedValues.length / 2);
    if (sortedValues.length % 2 === 0) {
      return (sortedValues[mid - 1] + sortedValues[mid]) / 2;
    } else {
      return sortedValues[mid];
    }
  }

  // Standard deviation calculation
  static standardDeviation(values) {
    const mean = Statistics.mean(values);
    const squaredDiffs = values.map(val => Math.pow(val - mean, 2));
    const variance = Statistics.mean(squaredDiffs);
    return Math.sqrt(variance);
  }
}

// Example usage:
console.log(Arithmetic.add(5, 3)); // Output: 8
console.log(Trigonometry.sin(Math.PI / 2)); // Output: 1
console.log(ExponentiationLogarithms.power(2, 3)); // Output: 8
console.log(Calculus.differentiate(x => x * x, 2)); // Output: 4.0001 (Approximately)
console.log(Statistics.mean([1, 2, 3, 4, 5])); // Output: 3


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