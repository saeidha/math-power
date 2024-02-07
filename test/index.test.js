const powerDigits = require('../src/index');

test('squares positive 2-digit numbers', () => {
    expect(powerDigits(12)).toBe(144);
    expect(powerDigits(56)).toBe(3136);
  });
  
  test('squares negative 2-digit numbers', () => {
    expect(powerDigits(-23)).toBe(529);
    expect(powerDigits(-71)).toBe(5041);
  });
  
  test('throws error for non-2-digit numbers below -99', () => {
    expect(() => powerDigits(-100)).toThrowError('Input must be a 2-digit number');
  });
  
  test('throws error for non-2-digit numbers above 99', () => {
    expect(() => powerDigits(100)).toThrowError('Input must be a 2-digit number');
  });
  
  // Add more tests as needed, considering:
  // - Decimals (round or throw error based on your logic)
  // - Zero input
  // - Large values that might cause overflow issues