const _ = require( 'wTools' );

/* operations for regular arrays are performed on `unroll-arrays` too  */
// creating unroll array
var unroll = _.unrollMake( [ 2, 3, 4 ] );
var result = _.arrayAppend( unroll, 5 ); // returns [ 2, 3, 4, 5 ]

console.log( _.unrollIs( result ) ); // true

unroll.push( 'str' );

console.log( _.unrollIs( unroll ) ); // true

/* operations for `unroll-arrays` are performed on regular arrays too */
var arr = [ 0, 1, 2, 3 ];
var result = _.unrollPrepend( arr, 4 ); // returns [ 4, 0, 1, 2, 3 ]

console.log( _.unrollIs( result ) ); // false

/* unrolling of 'unroll-arrays' */

var unroll1 = _.unrollMake( [ 7, [ 2 ] ] );
var unroll2 = _.unrollMake( [ 0, 1, 'str' ] );
var result = _.unrollAppend( unroll1, unroll2 ); // returns [ 7, [ 2 ], 0, 1, 'str' ]

console.log( _.unrollIs( result ) ); //  true

//

var unroll1 = _.unrollMake( [ '5' ] );
var unroll2 = _.unrollMake( [ 'str', 3, [ 4 ] ] );

// creating an unroll-array from a given array
var result = _.unrollFrom( [ 1, 2, unroll1, unroll2 ] ); // returns [ 1, 2, '5', 'str', 3, [ 4 ] ]

console.log( _.unrollIs( result ) ); //  true

//

var unroll1 = _.unrollMake( [ '5' ] );
var unroll2 = _.unrollMake( [ 'str', [ 3 ] ] );

// unrolling elements(that are unroll-array) of the given array
var result = _.unrollNormalize( [ 0, 7, unroll1, [ unroll2, unroll1 ] ] ); // returns [ 0, 7, '5', [ 'str', [ 3 ],  '5' ] ]

console.log( _.unrollIs( result ) ); // false

/* unrolling of multidimensional 'unroll-arrays' */
var unroll1 = _.unrollMake( [ 1, 2 ] );
var unroll2 = _.unrollMake( [ 3, 4 ] );
var unroll3 = _.unrollMake( [ 5, 6 ] );

unroll1[ 2 ] = unroll2;
unroll2[ 2 ] = unroll3;

console.log( unroll1 ); // [ 1, 2, [ 3, 4 [ 5, 6 ] ] ]
console.log( unroll2 ); // [ 3, 4, [ 5, 6 ] ]
console.log( unroll3 ); // [ 5, 6  ]

var result = _.unrollNormalize( [ unroll1, unroll2, unroll3 ] );
console.log( result );
/*
[
  1, 2, [ 3, 4, [ 5, 6 ] ],
  3, 4, [ 5, 6 ],
  5, 6
]
*/
