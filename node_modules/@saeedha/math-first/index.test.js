// index.test.js
const powerOf2 = require('./index');

test('powerOf2 function calculates the power of 2 for a given number of digits', () => {
  expect(powerOf2(0)).toBe(1);
  expect(powerOf2(1)).toBe(2);
  expect(powerOf2(2)).toBe(4);
  expect(powerOf2(3)).toBe(8);
  expect(powerOf2(5)).toBe(32);
});
