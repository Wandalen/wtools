# Тип `unroll`

Тип даних `unroll` - особливий вид масиву, здатний розготатись в іншому масиві при виконанні операції над останнім.

При виконанні над `unroll-масивом` операцій, призначених для звичайного масиву(`arrayPrepend`, `arrayAppend`, `arrayRemove`,
`arrayReplace`, `arrayFlatten` та будь-яких із Array.prototype), він веде себе як звичайний масив і не змінює свого типу.
```js
// creating unroll array
var unroll = _.unrollMake( [ 2, 3, 4 ] );
var result = _.arrayAppend( unroll, 5 ); // returns [ 2, 3, 4, 5 ]

console.log( _.unrollIs( result ) ); // true

unroll.push( 'str' );

console.log( _.unrollIs( unroll ) ); // true
```

Рутини призначені для роботи з `unroll-масивами` можна застосовувати до звичайних масивів, це не змінює їх тип.
```js
var arr = [ 0, 1, 2, 3 ];
var result = _.unrollPrepend( arr, 4 ); // returns [ 4, 0, 1, 2, 3 ]

console.log( _.unrollIs( result ) ); // false
```

При використанні рутин, в назві яких є префікс `unroll` - вміст `unroll-масивів` буде розгорнено.
В результаті розгортання `unroll-масивів`, кожен елемент `unroll-масиву` стане елементом масиву в якому знаходився
`unroll-масив`, а сам `unroll-масив` перестане бути елементом свого контейнера.
```js
var unroll1 = _.unrollMake( [ 7, [ 2 ] ] );
var unroll2 = _.unrollMake( [ 0, 1, 'str' ] );
var result = _.unrollAppend( unroll1, unroll2 ); // returns [ 7, [ 2 ], 0, 1, 'str' ]

console.log( _.unrollIs( result ) ); //  true
```
```js
var unroll1 = _.unrollMake( [ '5' ] );
var unroll2 = _.unrollMake( [ 'str', 3, [ 4 ] ] );

// creating an unroll-array from a given array
var result = _.unrollFrom( [ 1, 2, unroll1, unroll2 ] ); // returns [ 1, 2, '5', 'str', 3, [ 4 ] ]

console.log( _.unrollIs( result ) ); //  true
```
```js
var unroll1 = _.unrollMake( [ '5' ] );
var unroll2 = _.unrollMake( [ 'str', [ 3 ] ] );

// unrolling elements that are unroll-array
var result = _.unrollNormalize( [ 0, 7, unroll1, [ unroll2, unroll1 ] ] ); // returns [ 0, 7, '5', [ 'str', [ 3 ],  '5' ] ]

console.log( _.unrollIs( result ) ); // false
```

Результатом операції над багато-рівневим масивом `unroll-масивів` в якому є інші `unroll-масиви` буде плоский масив,
що складається із елементів, котрі містилися у вкладених `unroll-масивах`. Якщо масив має декілька рівнів вкладення,
то вкладені `unroll-масиви` розгортаються до найближчого звичайного масиву. Якщо на всіх рівнях вкладення знаходяться
`unroll-масиви`, то такий масив розгортається до плаского масиву.

### Підсумок

- При виконанні над вкладеним `unroll-масивом` операції для `unroll-масивів`, такий масив розгортається.
- При виконанні над `unroll-масивом` операції для звичайного масиву, він веде себе як звичайний масив.
- `Unroll-масиви` здатні розгортатись в інших `unroll-масивах` та в звичайних масивах.

[Повернутись до змісту](../README.md#концепції)
