const _ = require( 'wTools' );

var unroll1 = _.unrollMake( [ 1, 1, 3 ] );
var unroll2 = _.unrollMake( [ 4, 5, 6 ] );
var unroll3 = _.unrollMake( [ 7, 8, 9 ] );
unroll1[ 3 ] = unroll2;
unroll2[ 3 ] = unroll3;
console.log( unroll1 );

var result = _.unrollFrom( [ 'a', 'b', unroll1 ] );
console.log( result );
