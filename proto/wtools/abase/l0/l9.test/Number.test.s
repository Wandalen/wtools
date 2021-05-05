( function _l0_l9_Number_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

//--
// l0/l5/Number.s
//--

function bigIntFrom( test )
{
  test.open( 'numbers' );

  test.case = '1';
  var got = _.bigInt.from( 1 );
  test.identical( got, 1n );

  test.case = '-1';
  var got = _.bigInt.from( -1 );
  test.identical( got, -1n );

  test.case = '-10000000000';
  var got = _.bigInt.from( -10000000000 );
  test.identical( got, -10000000000n );

  test.case = '1e5';
  var got = _.bigInt.from( 1e5 );
  test.identical( got, 100000n );

  test.case = '100000000000000000000';
  var got = _.bigInt.from( 100000000000000000000 );
  test.identical( got, 100000000000000000000n );

  test.case = '1e10';
  var got = _.bigInt.from( 1e10 );
  test.identical( got, 10000000000n );

  test.close( 'numbers' );

  /* - */

  test.open( 'string' );

  test.case = '1';
  var got = _.bigInt.from( '1' );
  test.identical( got, 1n );

  test.case = '100000';
  var got = _.bigInt.from( '100000' );
  test.identical( got, 100000n );

  test.case = '-10000';
  var got = _.bigInt.from( '-10000' );
  test.identical( got, -10000n );

  test.close( 'string' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bigInt.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bigInt.from( 1, 'extra' ) );

  test.case = 'not a number or string argument';
  test.shouldThrowErrorSync( () => _.bigInt.from( {} ) );
}

//--
// l0/l8/Number.s
//--

function numbersTotal( test )
{

  test.case = 'empty array';
  var got = _.number.s.total([]);
  test.identical( got, 0 );

  /* - */

  test.open( 'number input' )

  test.case = 'input 1, 2, 3';
  var got = _.number.s.total([ 1, 2, 3 ]);
  test.identical( got, 6 );

  test.case = 'input 1000, 200, 3';
  var got = _.number.s.total([ 1000, 200, 3 ]);
  test.identical( got, 1203 );

  test.case = 'input 1.00, 2.00, 3.00';
  var got = _.number.s.total([ 1.00, 2.00, 3.00 ]);
  test.identical( got, 6 );

  test.case = 'input 1.50, 2.50, 3';
  var got = _.number.s.total([ 1.50, 2.50, 3 ]);
  test.identical( got, 7 );

  test.case = 'input 1.55, 2.55, 3.05';
  var got = _.number.s.total([ 1.55, 2.55, 3.05 ]);
  test.eq( got, 7.15 );

  test.case = 'input 1.555, 2.555, 3.111';
  var got = _.number.s.total([ 1.555, 2.555, 3.111 ]);
  test.identical( got, 7.221 );

  test.case = 'input 1.5555, 2.555, 3.11';
  var got = _.number.s.total([ 1.5555, 2.555, 3.11 ]);
  test.eq( got, 7.2205 );

  test.case = 'input 1, 1, 0.99999999999999999999999';
  var got = _.number.s.total([ 1, 1, 0.99999999999999999999999 ]);
  test.eq( got, 2.99999999999999999999999 );

  test.close( 'number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.total() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.total( [ 1, 2, 0.7 ], 'extra' ) );

  test.case = 'input : \'a\', \'b\'';
  test.shouldThrowErrorSync( () => _.number.s.total([ 'a', 'b' ] ) );

  test.case = 'input : \'1\', \'2\', \'3\'';
  test.shouldThrowErrorSync( () => _.number.s.total([ '1', '2', '3' ]) );

  test.case = 'input : 1, 2, \'3\'';
  test.shouldThrowErrorSync( () => _.number.s.total([ 1, 2, '3' ]) );
}

//

function from( test )
{
  test.case = 'null';
  var got = _.number.from( null );
  test.identical( got, 0 );

  test.case = 'undefined';
  var got = _.number.from( undefined );
  test.identical( got, NaN );

  test.case = 'false';
  var got = _.number.from( false );
  test.identical( got, 0 );

  test.case = 'true';
  var got = _.number.from( true );
  test.identical( got, 1 );

  test.case = 'Number';
  var got = _.number.from( 2 );
  test.identical( got, 2 );

  test.case = 'NaN';
  var got = _.number.from( NaN );
  test.identical( got, NaN );

  test.case = 'Infinity';
  var got = _.number.from( Infinity );
  test.identical( got, Infinity );

  test.case = 'empty string';
  var got = _.number.from( '' );
  test.identical( got, NaN );

  test.case = 'string with literal symbols';
  var got = _.number.from( 'abc' );
  test.identical( got, NaN );

  test.case = 'string with digit symbols';
  var got = _.number.from( '12' );
  test.identical( got, 12 );

  test.case = 'string with floating point digit symbols';
  var got = _.number.from( '12.33' );
  test.identical( got, 12.33 );

  test.case = 'Set';
  var got = _.number.from( new Set() );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.number.from( new HashMap() );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.number.from( function(){} );
  test.identical( got, NaN );

  /* */

  test.case = 'empty array';
  var src = [];
  var got = _.number.from( src );
  test.identical( got, 0 );

  test.case = 'empty object';
  var src = {};
  var got = _.number.from( src );
  test.identical( got, NaN );

  test.case = 'array with numbers';
  var src = [ 1, 2, 3 ];
  var got = _.number.from( src );
  test.identical( got, NaN );

  /* */

  test.case = 'empty bufferTyped';
  var src = new U8x( [] );
  var got = _.number.from( src );
  test.identical( got, 0 );

  test.case = 'bufferTyped with numbers';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.number.from( src );
  test.identical( got, NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.from( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function numbersFrom( test )
{
  test.case = 'null';
  var got = _.number.s.from( null );
  test.identical( got, 0 );

  test.case = 'undefined';
  var got = _.number.s.from( undefined );
  test.identical( got, NaN );

  test.case = 'false';
  var got = _.number.s.from( false );
  test.identical( got, 0 );

  test.case = 'true';
  var got = _.number.s.from( true );
  test.identical( got, 1 );

  test.case = 'Number';
  var got = _.number.s.from( 2 );
  test.identical( got, 2 );

  test.case = 'NaN';
  var got = _.number.s.from( NaN );
  test.identical( got, NaN );

  test.case = 'Infinity';
  var got = _.number.s.from( Infinity );
  test.identical( got, Infinity );

  test.case = 'empty string';
  var got = _.number.s.from( '' );
  test.identical( got, NaN );

  test.case = 'string with literal symbols';
  var got = _.number.s.from( 'abc' );
  test.identical( got, NaN );

  test.case = 'string with digit symbols';
  var got = _.number.s.from( '12' );
  test.identical( got, 12 );

  test.case = 'Set';
  var got = _.number.s.from( new Set() );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.number.s.from( new HashMap() );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.number.s.from( function(){} );
  test.identical( got, NaN );

  /* */

  test.case = 'empty array';
  var src = [];
  var got = _.number.s.from( src );
  test.identical( got, [] );
  test.true( got !== src );

  test.case = 'array with numbers';
  var src = [ 1, 2, 3 ];
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 2, 3 ] );
  test.true( got !== src );

  test.case = 'array with strings without digits';
  var src = [ '', 'a', 'str' ];
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.true( got !== src );

  test.case = 'array with strings with digits';
  var src = [ '1', '1.2', '12.3' ];
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );
  test.true( got !== src );

  test.case = 'array with elements, which does not convert to number';
  var src = [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ];
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );
  test.true( got !== src );

  /* */

  test.case = 'empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.number.s.from( src );
  test.identical( got, [] );

  test.case = 'argumentsArray with numbers';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'argumentsArray with strings without digits';
  var src = _.argumentsArray.make( [ '', 'a', 'str' ] );
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'argumentsArray with strings with digits';
  var src = _.argumentsArray.make( [ '1', '1.2', '12.3' ] );
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 1.2, 12.3 ] );

  test.case = 'argumentsArray with elements, which does not convert to number';
  var src = _.argumentsArray.make( [ new Set( [ 1, 2 ] ), [ 1, 2 ], { a : 2 } ] );
  var got = _.number.s.from( src );
  test.identical( got, [ NaN, NaN, NaN ] );

  /* */

  test.case = 'empty bufferTyped';
  var src = new U8x( [] );
  var got = _.number.s.from( src );
  test.identical( got, [] );

  test.case = 'bufferTyped with numbers';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.number.s.from( src );
  test.identical( got, [ 1, 2, 3 ] );

  /* */

  test.case = 'empty map';
  var src = {};
  var got = _.number.s.from( src );
  test.identical( got, {} );
  test.true( got !== src );

  test.case = 'map, values is numbers';
  var src = { a : 1, b : 2, c : 3 };
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.true( got !== src );

  test.case = 'map, values is not digit literals';
  var src = { a : '', b : 'a', c : 'str' };
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

  test.case = 'map, values is digit literals';
  var src = { a : '1', b : '1.2', c : '12.3' };
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.true( got !== src );

  test.case = 'map, values does not convert to number';
  var src = { a : new Set(), b : [ 1, 2 ], c : { a : 2 } };
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

  /* */

  test.case = 'empty pure map';
  var src = Object.create( null );
  var got = _.number.s.from( src );
  test.identical( got, {} );
  test.true( got !== src );

  test.case = 'map, values is numbers';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  src.c = 3;
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 2, c : 3 } );
  test.true( got !== src );

  test.case = 'map, values is not digit literals';
  var src = Object.create( null );
  src.a = '';
  src.b = 'a';
  src.c = 'str';
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

  test.case = 'map, values is digit literals';
  var src = Object.create( null );
  src.a = '1';
  src.b = '1.2';
  src.c = '12.3';
  var got = _.number.s.from( src );
  test.identical( got, { a : 1, b : 1.2, c : 12.3 } );
  test.true( got !== src );

  test.case = 'map, values does not convert to number';
  var src = Object.create( null );
  src.a = new Set();
  src.b = [ 1, 2 ];
  src.c = { a : 2 };
  var got = _.number.s.from( src );
  test.identical( got, { a : NaN, b : NaN, c : NaN } );
  test.true( got !== src );

  /* - */

  test.open( 'instance of constructor' );

  function Constr()
  {
    this.x = arguments[ 0 ];
    this.y = arguments[ 1 ];
    return this;
  };

  test.case = 'empty instance';
  var src = new Constr();
  var got = _.number.s.from( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.true( got !== src );

  test.case = 'numbers as properties';
  var src = new Constr( 1, 2 );
  var got = _.number.s.from( src );
  test.identical( got, { x : 1, y : 2 } );
  test.true( got !== src );

  test.case = 'not digit literals as properties';
  var src = new Constr( '', 'a' );
  var got = _.number.s.from( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.true( got !== src );

  test.case = 'digit literals as properties';
  var src = new Constr( '1', '1.2' );
  var got = _.number.s.from( src );
  test.identical( got, { x : 1, y : 1.2 } );
  test.true( got !== src );

  test.case = 'value of properties is not convertable to number';
  var src = new Constr( [ 1, 2 ], { a : 2 } );
  var got = _.number.s.from( src );
  test.identical( got, { x : NaN, y : NaN } );
  test.true( got !== src );

  test.close( 'instance of constructor' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.from( [ 1, 2 ], 'extra' ) );

  test.case = 'src has not converted type';
  test.shouldThrowErrorSync( () => _.number.s.from( Symbol.for( 'a' ) ) );
  test.shouldThrowErrorSync( () => _.number.s.from( [ 1, Symbol.for( 'a' ) ] ) );
}

//

function fromStr( test )
{
  test.case = 'src - empty string';
  var src = '';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string with space';
  var src = ' ';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string integer';
  var src = '1';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with other literals';
  var src = '1 a';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with other literals';
  var src = '1aa';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string';
  var src = 'a';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string';
  var src = 'a1';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string integer with space after';
  var src = '1 ';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with space before';
  var src = ' 1';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with spaces';
  var src = '  1  ';
  var got = _.number.fromStr( src );
  test.identical( got, 1 );

  test.case = 'src - string negative integer';
  var src = '-1';
  var got = _.number.fromStr( src );
  test.identical( got, -1 );

  test.case = 'src - string float';
  var src = '1.01';
  var got = _.number.fromStr( src );
  test.identical( got, 1.01 );

  test.case = 'src - string negative float';
  var src = '-1.01';
  var got = _.number.fromStr( src );
  test.identical( got, -1.01 );

  test.case = 'src - string float without 0 before dot';
  var src = '.01';
  var got = _.number.fromStr( src );
  test.identical( got, 0.01 );

  test.case = 'src - string negative float without 0 before dot';
  var src = '-.01';
  var got = _.number.fromStr( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = 'NaN';
  var got = _.number.fromStr( src );
  test.identical( got, NaN );

  test.case = 'src - string +0';
  var src = '+0';
  var got = _.number.fromStr( src );
  test.identical( got, +0 );

  test.case = 'src - string -0';
  var src = '-0';
  var got = _.number.fromStr( src );
  test.identical( got, -0 );

  test.case = 'src - string Infinity';
  var src = 'Infinity';
  var got = _.number.fromStr( src );
  test.identical( got, Infinity );

  test.case = 'src - string -Infinity';
  var src = '-Infinity';
  var got = _.number.fromStr( src );
  test.identical( got, -Infinity );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.fromStr() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.fromStr( '1', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.number.fromStr( null ) );
  test.shouldThrowErrorSync( () => _.number.fromStr( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.number.fromStr( 1 ) );
}

//

function fromStrMaybe( test )
{
  test.case = 'src - number integer';
  var src = 1;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - number negative integer';
  var src = -1;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1 );

  test.case = 'src - number float';
  var src = 1.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1.01 );

  test.case = 'src - number negative float';
  var src = -1.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1.01 );

  test.case = 'src - number float without 0 before dot';
  var src = 0.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0.01 );

  test.case = 'src - number negative float without 0 before dot';
  var src = -0.01;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = NaN;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, NaN );

  test.case = 'src - number +0';
  var src = +0;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, +0 );

  test.case = 'src - number -0';
  var src = -0;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0 );

  test.case = 'src - number Infinity';
  var src = Infinity;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, Infinity );

  test.case = 'src - number -Infinity';
  var src = -Infinity;
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -Infinity );

  /* */

  test.case = 'src - empty string';
  var src = '';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '' );

  test.case = 'src - string with space';
  var src = ' ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0 );

  test.case = 'src - string with spaces';
  var src = '   ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0 );

  test.case = 'src - string integer';
  var src = '1';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string BigInt';
  var src = '1n';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '1n' );

  test.case = 'src - string integer with other literals';
  var src = '1 a';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '1 a' );

  test.case = 'src - string integer with other literals';
  var src = '1aa';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, '1aa' );

  test.case = 'src - string';
  var src = 'a';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 'a' );

  test.case = 'src - string integer with space after';
  var src = '1 ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with space before';
  var src = ' 1';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string integer with spaces';
  var src = '  1  ';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1 );

  test.case = 'src - string negative integer';
  var src = '-1';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1 );

  test.case = 'src - string float';
  var src = '1.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 1.01 );

  test.case = 'src - string negative float';
  var src = '-1.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -1.01 );

  test.case = 'src - string float without 0 before dot';
  var src = '.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 0.01 );

  test.case = 'src - string negative float without 0 before dot';
  var src = '-.01';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0.01 );

  test.case = 'src - number NaN';
  var src = 'NaN';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, 'NaN' );

  test.case = 'src - string +0';
  var src = '+0';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, +0 );

  test.case = 'src - string -0';
  var src = '-0';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -0 );

  test.case = 'src - string Infinity';
  var src = 'Infinity';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, Infinity );

  test.case = 'src - string -Infinity';
  var src = '-Infinity';
  var got = _.number.fromStrMaybe( src );
  test.identical( got, -Infinity );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe( '1', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe( null ) );
  test.shouldThrowErrorSync( () => _.number.fromStrMaybe( [ 1 ] ) );
}

//

function numbersSlice( test )
{

  test.open( 'number' )

  test.case = 'src - number 100';
  var src = 100;
  var got = _.number.s.slice( src );
  test.identical( got, 100 );

  test.case = 'src - number 1.00';
  var src = 1.00;
  var got = _.number.s.slice( src );
  test.identical( got, 1.00 );

  test.case = 'src - number 1.99';
  var src = 1.99;
  var got = _.number.s.slice( src );
  test.identical( got, 1.99 );

  test.close( 'number' )

  /* - */

  test.open( 'array' )

  test.case = 'src - array [ 1, 2, 3 ], no range';
  var src = [ 1, 2, 3 ];
  var got = _.number.s.slice( src );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ] with range [ 1, 3 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, 1, 3 );
  test.identical( got, [ 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ 1, undefined ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, 1 );
  test.identical( got, [ 2, 3, 4, 5 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ undefined, 3 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, undefined, 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ 0, 0 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, 0, 0 );
  test.identical( got, [] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ -1, 2 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, -1, 2 );
  test.identical( got, [] );

  test.case = 'src - array [ 1, 2, 3, 4, 5 ], with range [ -1, -2 ]';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.number.s.slice( src, -1, -2 );
  test.identical( got, [] );

  test.close( 'array' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.slice() );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.number.s.slice( null ) );
  test.shouldThrowErrorSync( () => _.number.s.slice( '1' ) );
  test.shouldThrowErrorSync( () => _.number.s.slice( [ 1, 2, '3' ] ) );
}

//

function random( test )
{
  test.case = 'range - 0';
  var got = _.number.random( 0 );
  test.identical( got, 0 );

  test.case = 'range > 0';
  var got = _.number.random( 10 );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range < 0';
  var got = _.number.random( -10 );
  test.ge( got, -10 );
  test.le( got, 0 );

  /* */

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] === 0';
  var got = _.number.random( [ 0, 0 ] );
  test.identical( got, 0 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] > 0';
  var got = _.number.random( [ 10, 10 ] );
  test.identical( got, 10 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] < 0';
  var got = _.number.random( [ -10, -10 ] );
  test.identical( got, -10 );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] >  0';
  var got = _.number.random( [ 0, 10 ] );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] ===  0';
  var got = _.number.random( [ 10, 0 ] );
  test.ge( got, 0 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] < range[ 1 ]';
  var got = _.number.random( [ 5, 10 ] );
  test.ge( got, 5 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] > range[ 1 ]';
  var got = _.number.random( [ 10, 5 ] );
  test.ge( got, 5 );
  test.le( got, 10 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] <  0';
  var got = _.number.random( [ 0, -10 ] );
  test.ge( got, -10 );
  test.le( got, 0 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] ===  0';
  var got = _.number.random( [ -10, 0 ] );
  test.ge( got, -10 );
  test.le( got, 0 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] > range[ 1 ]';
  var got = _.number.random( [ -5, -10 ] );
  test.ge( got, -10 );
  test.le( got, -5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] < range[ 1 ]';
  var got = _.number.random( [ -10, -5 ] );
  test.ge( got, -10 );
  test.le( got, -5 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] < 0';
  var got = _.number.random( [ 5, -10 ] );
  test.ge( got, -10 );
  test.le( got, 5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] > 0';
  var got = _.number.random( [ -10, 5 ] );
  test.ge( got, -10 );
  test.le( got, 5 );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.random() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.random( [ 0, 2 ], 'extra' ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.number.random( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.number.random( { a : 1 } ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.number.random( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.number.random( [ 1, 2, 3 ] ) );
}

//

function intRandom( test )
{
  test.case = 'range - 0';
  var got = _.intRandom( 0 );
  test.identical( got, 0 );

  test.case = 'range === 1';
  var got = _.intRandom( 1 );
  test.true( got === 0 || got === 1 );

  test.case = 'range > 0';
  var got = _.intRandom( 10 );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range < 0';
  var got = _.intRandom( -10 );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.true( Math.floor( got ) === got );

  /* */

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] === 0';
  var got = _.intRandom( [ 0, 0 ] );
  test.identical( got, 0 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] > 0';
  var got = _.intRandom( [ 10, 10 ] );
  test.identical( got, 10 );

  test.case = 'range[ 0 ] === range[ 1 ], range[ 0 ] < 0';
  var got = _.intRandom( [ -10, -10 ] );
  test.identical( got, -10 );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] === 1';
  var got = _.intRandom( [ 0, 1 ] );
  test.true( got === 0 || got === 1 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] >  0';
  var got = _.intRandom( [ 0, 10 ] );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] ===  0';
  var got = _.intRandom( [ 10, 0 ] );
  test.ge( got, 0 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 1 ] - range[ 1 ] === 1';
  var got = _.intRandom( [ 5, 6 ] );
  test.true( got === 5 || got === 6 );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] < range[ 1 ]';
  var got = _.intRandom( [ 5, 10 ] );
  test.ge( got, 5 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] > range[ 1 ]';
  var got = _.intRandom( [ 10, 5 ] );
  test.ge( got, 5 );
  test.le( got, 10 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -1';
  var got = _.intRandom( [ 0, -1 ] );
  test.true( got === -1 || got === 0 );

  test.case = 'range[ 0 ] === 0, range[ 1 ] <  0';
  var got = _.intRandom( [ 0, -10 ] );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] ===  0';
  var got = _.intRandom( [ -10, 0 ] );
  test.ge( got, -10 );
  test.le( got, 0 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] - range[ 1 ] === 1';
  var got = _.intRandom( [ -6, -5 ] );
  test.true( got === -6 || got === -5 );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] > range[ 1 ]';
  var got = _.intRandom( [ -5, -10 ] );
  test.ge( got, -10 );
  test.le( got, -5 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] < range[ 1 ]';
  var got = _.intRandom( [ -10, -5 ] );
  test.ge( got, -10 );
  test.le( got, -5 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] > 0, range[ 1 ] < 0';
  var got = _.intRandom( [ 5, -10 ] );
  test.ge( got, -10 );
  test.le( got, 5 );
  test.true( Math.floor( got ) === got );

  test.case = 'range[ 0 ] < 0, range[ 1 ] > 0';
  var got = _.intRandom( [ -10, 5 ] );
  test.ge( got, -10 );
  test.le( got, 5 );
  test.true( Math.floor( got ) === got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.intRandom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.intRandom( [ 0, 2 ], 'extra' ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.intRandom( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.intRandom( { a : 1 } ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.intRandom( [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.intRandom( [ 1, 2, 3 ] ) );
}

//

function numbersMake( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.number.s.make( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.number.s.make( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.number.s.make( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.case = 'num = 1.99, len = 2';
  var got = _.number.s.make( 1.99, 2 );
  test.identical( got, [ 1.99, 1.99 ] );

  test.case = 'num = -1.99999999, len = 3';
  var got = _.number.s.make( -1.99999999, 3 );
  test.identical( got, [ -1.99999999, -1.99999999, -1.99999999 ] );

  test.case = 'num = NaN, len = 3';
  var got = _.number.s.make( NaN, 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'num = Infinity, len = 3';
  var got = _.number.s.make( Infinity, 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'num = -Infinity, len = 3';
  var got = _.number.s.make( -Infinity, 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );


  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.number.s.make( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.number.s.make( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.number.s.make( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.01, -3 ], len = 3';
  var got = _.number.s.make( [ 1.00, 2.01, -3 ], 3 );
  test.identical( got, [ 1.00, 2.01, -3 ] );

  test.case = 'arr = [ NaN, NaN, NaN ], len = 3';
  var got = _.number.s.make( [ NaN, NaN, NaN ], 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'arr = [ Infinity, Infinity, Infinity ], len = 3';
  var got = _.number.s.make( [ Infinity, Infinity, Infinity ], 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'arr = [ -Infinity, -Infinity, -Infinity ], len = 3';
  var got = _.number.s.make( [ -Infinity, -Infinity, -Infinity ], 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );

  test.case = 'arr = [ NaN, Infinity, -Infinity ], len = 3';
  var got = _.number.s.make( [ NaN, Infinity, -Infinity ], 3 );
  test.identical( got, [ NaN, Infinity, -Infinity ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.make() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.make( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.number.s.make( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.number.s.make( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.number.s.make( [ '1', 1, 1 ], 4 ) );

  test.case = 'not number';
  test.shouldThrowErrorSync( () => _.number.s.make( '1', 4 ) );
}

//

function numbersFromNumber( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.number.s.fromNumber( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.number.s.fromNumber( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.number.s.fromNumber( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.case = 'num = 1.99, len = 2';
  var got = _.number.s.fromNumber( 1.99, 2 );
  test.identical( got, [ 1.99, 1.99 ] );

  test.case = 'num = -1.99999999, len = 3';
  var got = _.number.s.fromNumber( -1.99999999, 3 );
  test.identical( got, [ -1.99999999, -1.99999999, -1.99999999 ] );

  test.case = 'num = NaN, len = 3';
  var got = _.number.s.fromNumber( NaN, 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'num = Infinity, len = 3';
  var got = _.number.s.fromNumber( Infinity, 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'num = -Infinity, len = 3';
  var got = _.number.s.fromNumber( -Infinity, 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );


  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.number.s.fromNumber( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.number.s.fromNumber( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.number.s.fromNumber( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.01, -3 ], len = 3';
  var got = _.number.s.fromNumber( [ 1.00, 2.01, -3 ], 3 );
  test.identical( got, [ 1.00, 2.01, -3 ] );

  test.case = 'arr = [ NaN, NaN, NaN ], len = 3';
  var got = _.number.s.fromNumber( [ NaN, NaN, NaN ], 3 );
  test.identical( got, [ NaN, NaN, NaN ] );

  test.case = 'arr = [ Infinity, Infinity, Infinity ], len = 3';
  var got = _.number.s.fromNumber( [ Infinity, Infinity, Infinity ], 3 );
  test.identical( got, [ Infinity, Infinity, Infinity ] );

  test.case = 'arr = [ -Infinity, -Infinity, -Infinity ], len = 3';
  var got = _.number.s.fromNumber( [ -Infinity, -Infinity, -Infinity ], 3 );
  test.identical( got, [ -Infinity, -Infinity, -Infinity ] );

  test.case = 'arr = [ NaN, Infinity, -Infinity ], len = 3';
  var got = _.number.s.fromNumber( [ NaN, Infinity, -Infinity ], 3 );
  test.identical( got, [ NaN, Infinity, -Infinity ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( [ '1', 1, 1 ], 4 ) );

  test.case = 'not number';
  test.shouldThrowErrorSync( () => _.number.s.fromNumber( '1', 4 ) );
}

//

function numbersFromInt( test )
{
  test.open( '2 numbers input' )

  test.case = 'num = 1, len = 0';
  var got = _.number.s.fromInt( 1, 0 );
  test.identical( got, [] );

  test.case = 'num = 1, len = 2';
  var got = _.number.s.fromInt( 1, 2 );
  test.identical( got, [ 1, 1 ] );

  test.case = 'num = 1.00, len = 2';
  var got = _.number.s.fromInt( 1.00, 2 );
  test.identical( got, [ 1.00, 1.00 ] );

  test.close( '2 numbers input' )

  /* - */

  test.open( 'array and number input' )

  test.case = 'arr = [], len = 0';
  var got = _.number.s.fromInt( [], 0 );
  test.identical( got, [] );

  test.case = 'arr = [ 1, 1, 1 ], len = 3';
  var got = _.number.s.fromInt( [ 1, 1, 1 ], 3 );
  test.identical( got, [ 1, 1, 1 ] );

  test.case = 'arr = [ 1, 2, 3 ], len = 3';
  var got = _.number.s.fromInt( [ 1, 2, 3 ], 3 );
  test.identical( got, [ 1, 2, 3 ] );

  test.case = 'arr = [ 1.00, 2.00, -3 ], len = 3';
  var got = _.number.s.fromInt( [ 1.00, 2.00, -3 ], 3 );
  test.identical( got, [ 1.00, 2.00, -3 ] );

  test.close( 'array and number input' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromInt() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( 0, 2, 'extra' ) );

  test.case = 'len < size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( [ 1, 1, 1 ], 2 ) );

  test.case = 'len > size of an array';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( [ 1, 1, 1 ], 4 ) );

  test.case = 'not number in array';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( [ '1', 1, 1 ], 4 ) );

  test.case = 'not a number';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( '1', 4 ) );

  test.case = 'not an integer';
  test.shouldThrowErrorSync( () => _.number.s.fromInt( 1.99, 2 ) );
}


// --
// declaration
// --

const Proto =
{

  name : 'Tools.Number.l0.l9',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l8/Number.s

    bigIntFrom,

    // l0/l8/Number.s

    numbersTotal,
    from,
    numbersFrom,
    fromStr,
    fromStrMaybe,

    numbersSlice,

    random,
    intRandom,

    numbersMake,
    numbersFromNumber,
    numbersFromInt,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
