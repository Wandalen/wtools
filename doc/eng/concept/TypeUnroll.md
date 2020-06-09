# Type `unroll`

Data type `unroll` - a special type of array that can be unrolled in another array when performing an operation on it.

When performing operations on the `unroll-array` that are intended for a regular array (`arrayPrepend`, `arrayAppend`, `arrayRemove`,
`arrayReplace`, `arrayFlatten` and any of Array.prototype), it behaves like a regular array and does not change its type.
```js
// creating unroll array
var unroll = _.unrollMake( [ 2, 3, 4 ] );
var result = _.arrayAppend( unroll, 5 ); // returns [ 2, 3, 4, 5 ]

console.log( _.unrollIs( result ) ); // true

unroll.push( 'str' );

console.log( _.unrollIs( unroll ) ); // true
```

Routines designed to work with `unroll-arrays` can be applied to regular arrays, it does not change their type.
```js
var arr = [ 0, 1, 2, 3 ];
var result = _.unrollPrepend( arr, 4 ); // returns [ 4, 0, 1, 2, 3 ]

console.log( _.unrollIs( result ) ); // false
```

When using routines whose name has the prefix `unroll` - the contents of `unroll-arrays` will be unrolled. 
As a result of unrolling of `unroll-arrays`, each element of `unroll-array` will become an element of an array in which
there was an `unroll-array`, and the `unroll-array` will cease to be an element of its container.
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

// unrolling elements(that are unroll-array) of the given array
var result = _.unrollNormalize( [ 0, 7, unroll1, [ unroll2, unroll1 ] ] ); // returns [ 0, 7, '5', [ 'str', [ 3 ],  '5' ] ]

console.log( _.unrollIs( result ) ); // false
```

When performing operations on a multidimensional `unroll-array` that contains other `unroll-arrays`, only the first level of
each element of this array will be unrolled(if the element is an `unroll-array`).
```js
var unroll1 = _.unrollMake( [ 1, 2 ] );
var unroll2 = _.unrollMake( [ 3, 4 ] );
var unroll3 = _.unrollMake( [ 5, 6 ] );

unroll1[ 2 ] = unroll2;
unroll2[ 2 ] = unroll3;

console.log( unroll1 ); // [ 1, 2, [ 3, 4, [ 5, 6 ] ] ]
console.log( unroll2 ); // [ 3, 4, [ 5, 6 ] ]
console.log( unroll3 ); // [ 5, 6 ]

var result = _.unrollNormalize( [ unroll1, unroll2, unroll3 ] );
console.log( result );
/*
[
  1, 2, [ 3, 4, [ 5, 6 ] ],
  3, 4, [ 5, 6 ],
  5, 6
]
*/
```

**Summary**

- `Unroll-arrays`, which are elements of other `unroll-arrays` and ordinary arrays - are able to unfold in them;
- When performing an operation for `unroll-arrays` on a nested `unroll-array` - such an array is unrolled;
- When performing an operation for regular arrays on a `unroll-array` it behaves like a regular array;
- When performing an operation for `unroll-arrays` on a multidimensional `unroll-array`, only the first level of
  each element of this array will be unrolled(if the element is an `unroll-array`).

[Back to content](../README.md#concepts)
