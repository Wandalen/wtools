const _ = require( 'wTools' );

// unroll array
var unroll = _.unrollMake( [ 2, 3, 4 ] );
var result = _.arrayAppend( unroll, 5 ); // returns [ 2, 3, 4, 5 ]
console.log( _.unrollIs( result ) ); // true
