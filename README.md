# calculus

[Download](https://drive.google.com/file/d/1-kqgS6AktMADm1iL6aKXf0klItZH_0KQ/view?usp=sharing)

## CaluculationGenerator class

It takes five parameters :

- double `minValue`, the minimum value of numbers in the calculus
- double `maxValue`, the maximum value of numbers in the calculus
- list of Symbols `symbols`, the symbols that can be present in the calculus (+ - / \*)
- int `maxCalculations`, the numbers of operation in the calculus
- int `precision`, the numbers of decimal.

It returns a calculus as a String.

### How it works ?

It sets a base value with random between `minValue` and `maxValue`.

After, it add a symbol from `symbols` and a number as many times as `maxCalculation`.

## Computer class

It takes a String that is the calculation to compute.

### How it works ?

It parse the values with spaces like : `1 + 2 \* 3` -> `["1", "+", "2", "\*", "3"]`.

It crea nvnte a new list that contain double and fill it with the following pattern :

- If there is no priority like addition or subtraction, add it to the new list like : `["1", "+"]` -> `[1]`.

- If there is a priority like multiplication or division, it computes the value without adding it to the list of double like: `["2", "*", "3"]` -> `["6"]`.

And add the last number to the list of double.

After that, it adds all the values ​​together to give a result.

To visualize the process, here is an example of what happen:

```bash
1 + 2 * 3 * 4 + 5
[]
-----------------
2 * 3 * 4 + 5
[1]
-----------------
6 * 4 + 5
[1]
-----------------
24 + 5
[1]
-----------------
5
[1, 24]
-----------------

[1, 24, 5]
-----------------
result = 1 + 24 + 5 = 30
```

## AnswerGenerator class

It takes two parameters :

- double `value`, that is the value of the calculus in order to create false answer around it.
- int `precision`, that is the number of decimals in false answers.

It returns a List of String that contains tree false answers.

In order to create answers around the `value` we create a `deviation` from a percentage that is initialised to 10%, and we create a wrong answer from random in the range of `value` +- `deviation` and we increment the value of the percentage of 10% after each answer.
