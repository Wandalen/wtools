if( typeof module !== 'undefined' )
require( '../staging/abase/wTools.s' );

var _ = wTools;

//returns '{ routine add }'
console.log( 'toStrMethods',_.toStrMethods( ( function add(){} ),{} ) );

//returns '{ routine add }'
console.log( 'toStr( onlyRoutines : 0 )',_.toStr( ( function add(){} ),{ onlyRoutines : 0 } ) );

//returns '{ routine add }'
console.log( 'toStr( onlyRoutines : 1 )',_.toStr( ( function add(){} ),{ onlyRoutines : 1 } ) );

//returns '{ a : 1, b : 2 }'
console.log( _.toStr( { a : 1, b : 2 } ) );

//returns '{ a : 1, b : 2 }'
console.log( _.toStr( { a : 1, b : 2 },{ wrap : 0 } ) );

//returns '{ a : 1, b : 2 }'
console.log( _.toStr( { a : 1, b : 2, c : { subd : 'some test', sube : true, subf : { x : 1 } } },{ levels : 3 } ) );
console.log( _.toStr( { a : 1, b : 2, c : { subd : 'some test', sube : true, subf : { x : 1 } } },{ levels : 3, dtab : '-' } ) );
