# Evaluator

This is a routine or pair of routines that allow you to arbitrarily convert array elements before comparing them.
If the obtained values match - the evaluator returns <code>true</code>, otherwise - <code>false</code>.
The evaluator as a callback function is passed to the routines intended for working with [Long](./Long.md) types.

The evaluator accepts one argument, as opposed to [equalizer](./Equalizer.md).
If the evaluator consists of one routine, it applies to both the container elements passed in the first argument 
and the container elements passed in the second argument.

**Example: an evaluator consisting of one routine**

```js
var dst = [ { val : 3 }, { val : 0 }, { val : 5 } ];
var result = _.arrayRemoveElement( dst, { val : 0 }, ( e ) => e.val );
console.log( result );
// log : [ { val : 3 }, { val : 5 } ]
```
The `arrayRemoveElement` routine contains the following arguments:
- map array `dst` = `[ { val : 3 }, { val : 0 }, { val : 5 } ]`;
- comparison element `{ val : 0 }`;
- evaluator `( e ) => e.val`.

To remove the `{val: 0}` element from the `dst` container, you cannot simply use the comparison` === `.
You must first convert elements to their equivalent forms.
The `arrayRemoveElement` routine iterates over the elements of the array, applying the evaluator at each step to both
the container element and the comparison element.
And only then compares the returned values using the operator `===`.
In this case, the second element of the `dst` container will be removed.

The second argument can be a scalar, as in the example below.

```js
_.arrayRemoveElement( dst, 0, ( e ) => e.val );
console.log( result );
// log : [ { val : 3 }, { val : 0 }, { val : 5 } ]
```
Евалуатор не виявив жодного співпадіння, адже другий агрумен `0` після застосування евалуатора матиме значення `undefined`. 
Жоден елемент в контейнері `dst` після застосування евалуатора не перетвориться в таке значення.
Ця проблема вирішується у прикладі нижче.

Якщо евалуатор складається з двох рутин, то перша застосовується до елементів контейнера переданого в першому аргументі, 
а друга застосовується до елементів контейнера переданого в другому аргументі.

**Example: an evaluator consisting of two routines**

Можемо задати два евалуатора, окремо для першого та для другого аргумента.

```js
var dst = [ { val : 3 }, { val : 0 }, { val : 5 } ];
var evalutor1 = ( e ) => e.val;
var evalutor2 = ( e ) => e;
var result = _.arrayRemoveElement( dst, 0, evalutor1, evalutor2 );
console.log( result );
// log: [ { val : 3 }, { val : 5 } ]
```
Після виконання програми в контейнері `dst` не залишиться елемента `{ val : 0 }` попри те, що другий аргумент `0`.
Евалуатор `evalutor1` застосовується лише до контейнера `dst`, а евалуатор `evaluator2` застосовується лише 
другого аргумента, який є скаляром `0`. 

[Повернутись до змісту](../README.md#концепції)


[Back to content](../README.md#concepts)