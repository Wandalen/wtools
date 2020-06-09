const _ = require( 'wTools' );

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
