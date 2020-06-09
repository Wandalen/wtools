# Type <code>unroll</code>

<code>Unroll</code> - data type, it is a special kind of array, capable to be unrolled in another array when performing operations on it.

When performing regular array operations over `unroll-array`, it behaves like a regular array and does not change its type. Over `unroll-arrays` you can perform operations for the regular arrays: `Prepend`, `Append`, `Remove`, `Replace`, `Flatten`. If operations are performed by routines, which name has a prefix `unroll`, the nested `unroll-arrays` are unrolled. As a result of `unroll-arrays` unrolling, each element of `unroll-array` becomes an element of the array in which there was an `unroll-array`, and the `unroll-array` itself ceases to be an element of its container, it will be unrolled.

The result of an operation on a multilevel array of `unroll-arrays`, which contains other `unroll-arrays`, will be a flat array consisting of elements contained in nested `unroll-arrays`. If the array has multiple levels of nesting, then the nested `unroll-arrays` are unrolled to the nearest regular array. If at all levels of the nesting are `unroll-arrays`, then such array is unrolled to a flat array.

Routines designed to work with `unroll-arrays` can be applied to regular arrays. This routine does not change the type of array.

### Examples

Performing a regular array operation over the `unroll-array`

```js
// unroll array
var unroll = _.unrollMake( [ 2, 3, 4 ] );

var result = _.arrayAppend( unroll, 5 );
// returns [ 2, 3, 4, 5 ]
_.unrollIs( result );
// returns true
```

Performing a `unroll-arrays` operation over a regular array

```js
var result = _.unrollAppend( [ 0, 1, 2, 3 ], 4 );
// returns [ 0, 1, 2, 3, 4 ]
_.unrollIs( result );
// returns false
```

Adding elements to the `unroll-array` by `unroll` routine

```js
var unroll = _.unrollMake( [ 0, 1, 'str' ] );
var result = _.unrollAppend( unroll, 2, unroll );
// returns [ 0, 1, 'str', 2, 0, 1, 'str' ]
```

Adding elements to the regular array by `unroll` routine

```js
var unroll = _.unrollMake( [ 0, 1, 'str' ] );
var result = _.unrollAppend( [ 7, [ 2 ] ], unroll );
// returns [ 7, [ 2 ], 0, 1, 'str' ]
```

Unrolling of `unroll-arrays`

```js
var unroll1 = _.unrollMake( [ '5' ] );
var unroll2 = _.unrollMake( [ 'str', 3, [ 4 ] ] );
var result1 = _.unrollNormalize( _.unrollFrom( [ 1, 2, unroll1, unroll2 ] ) );
// returns [ 1, 2, '5', 'str', 3, [ 4 ] ]
```

Unrolling of `unroll-arrays`

```js
var unroll1 = _.unrollMake( [ '5' ] );
var unroll2 = _.unrollMake( [ 'str', [ 3 ] ] );
var result2 = _.unrollNormalize( [ 0, 7, unroll1, [ unroll2, unroll1 ] ] );
// returns [ 0, 7, '5', [ 'str', [ 3 ],  '5' ] ]
_.unrollIs( result2 );
// returns false
```

### Summary

- When `unroll-arrays` operation performing over a nested `unroll-array`, then such array unrolling.
- When performing regular array operations over `unroll-array`, it behaves like a regular array.
- `Unroll-arrays` can be unrolled in other `unroll-arrays` and regular arrays.

[Back to content](../README.md#Concepts)
