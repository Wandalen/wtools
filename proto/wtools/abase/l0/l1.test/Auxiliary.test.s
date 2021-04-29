( function _l0_l1_Auxiliary_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// maker
// --

/* qqq : extend and implement tests for other routines */
function make( test )
{

  test.case = 'without arguments';
  var got = _.aux.make();
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );

  test.case = 'src - null';
  var got = _.aux.make( null );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );

  // test.case = 'src - undefined';
  // var got = _.aux.make( undefined );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );

  /* */

  test.case = 'src - empty polluted map';
  var src = {};
  var got = _.aux.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - populated polluted map';
  var src = { a : 7, b : 13 };
  var got = _.aux.make( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var src = Object.create( null );
  var got = _.aux.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - pure map';
  var src = Object.create( null );
  src.a = 7;
  src.b = 13;
  var got = _.aux.make( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - empty Map';
  var src = new Map([]);
  var got = _.aux.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - pure map';
  var src = new Map( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.aux.make( src );
  var expected = { '2' : 2, 'a' : 1 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  /* */

  test.case = 'src - empty array';
  var src = [];
  var got = _.aux.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  // test.case = 'src - array with primitives';
  // var src = [ 0, 'str', null, undefined ];
  // var got = _.aux.make( src );
  // var expected = { 0 : 0, 1 : 'str', 2 : null, 3 : undefined };
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );
  //
  // test.case = 'src - array with maps';
  // var src = [ { a : 7 }, { b : 13 } ];
  // var got = _.aux.make( src );
  // var expected = { 0 : { a : 7 }, 1 : { b : 13 } };
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.aux.make( { a : 1 }, { a : 'extra' } ) );

  test.case = 'wrong argument';
  test.shouldThrowErrorSync( () => _.aux.make( '' ) );
  test.shouldThrowErrorSync( () => _.aux.make( 1 ) );
  test.shouldThrowErrorSync( () => _.aux.make( false ) );
  test.shouldThrowErrorSync( () => _.aux.make( undefined ) );
  test.shouldThrowErrorSync( () => _.aux.make( [ 0, 'str', null, undefined ] ) );
  test.shouldThrowErrorSync( () => _.aux.make( [ { a : 7 }, { b : 13 } ] ) );

}

//

function dichotomy( test )
{
  test.case = 'undefined';
  var src = undefined;
  test.identical( _.aux.is( src ), false );

  test.case = 'null';
  var src = null;
  test.identical( _.aux.is( src ), false );

  test.case = 'string';
  var src = 'str';
  test.identical( _.aux.is( src ), false );

  test.case = 'number';
  var src = 13;
  test.identical( _.aux.is( src ), false );

  test.case = 'symbol';
  var src = Symbol.for( 'a' );
  test.identical( _.aux.is( src ), false );

  test.case = 'boolean false';
  var src = true;
  test.identical( _.aux.is( src ), false );

  test.case = 'boolean true';
  var src = true;
  test.identical( _.aux.is( src ), false );

  test.case = 'empty array';
  var src = [];
  test.identical( _.aux.is( src ), false );

  test.case = 'date';
  var src = new Date();
  test.identical( _.aux.is( src ), false );

  test.case = 'empty arguments array';
  var src = _.argumentsArray.make();
  test.identical( _.aux.is( false ), false );

  test.case = 'pure empty map';
  var src = Object.create( null );
  test.identical( _.aux.is( src ), true );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  test.identical( _.aux.is( src ), true );

  test.case = 'pure map with constructor';
  var src = Object.create( null );
  test.identical( _.aux.is( src ), true );

  test.case = 'from pure with iterator';
  var src = Object.create( null );
  src[ Symbol.iterator ] = function(){};
  test.identical( _.aux.is( src ), true );

  test.case = 'empty polluted map';
  var src = {};
  test.identical( _.aux.is( src ), true );

  test.case = 'polluted map';
  var src = { a : 7, b : 13 };
  test.identical( _.aux.is( src ), true );

  test.case = 'polluted map with constructor';
  var src = {};
  test.identical( _.aux.is( src ), true );

  test.case = 'from polluted with iterator';
  var src = {};
  src[ Symbol.iterator ] = function(){};
  test.identical( _.aux.is( src ), true );

  test.case = 'new object';
  var src = new Object();
  test.identical( _.aux.is( src ), true );

  test.case = 'routine';
  var src = routine;
  test.identical( _.aux.is( src ), false );

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from pure map with iterator in prototype';
  var prototype = Object.create( null );
  prototype[ Symbol.iterator ] = function(){}
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), false );

  test.case = 'prototyped from pure map with iterator in prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  src[ Symbol.iterator ] = function(){}
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from pure map deep';
  var prototype1 = Object.create( null );
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from pure map deep with props';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from polluted map';
  var prototype = {};
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from polluted map with constructor';
  var prototype = {};
  prototype.constructor = function(){}
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), false );

  test.case = 'prototyped from polluted map with iterator in prototype';
  var prototype = {};
  prototype[ Symbol.iterator ] = function(){}
  var src = Object.create( prototype );
  test.identical( _.aux.is( src ), false );

  test.case = 'prototyped from polluted map with iterator in prototype';
  var prototype = {};
  var src = Object.create( prototype );
  src[ Symbol.iterator ] = function(){}
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from polluted map deep';
  var prototype1 = {};
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.aux.is( src ), true );

  test.case = 'prototyped from polluted map deep with props';
  var prototype1 = {};
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.aux.is( src ), true );

  /* - */

  function routine () {}

}

// --
// container
// --

function keys( test )
{

  test.case = 'trivial';

  var got = _.aux.keys( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.aux.keys( { a : 1, b : undefined } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.aux.keys( { a : 7, b : 13 } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.aux.keys( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ '3', '7', '13' ];
  test.identical( got, expected );

  // var f = () => {};
  // Object.setPrototypeOf( f, String );
  // f.a = 1;
  // var got = _.aux.keys( f );
  // var expected = [ 'a' ];
  // test.identical( got, expected );
  //
  // var got = _.aux.keys( new Date );
  // var expected = [ ];
  // test.identical( got, expected );

  /* */

  test.case = 'options';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* onlyOwn off */

  var got = _.aux.keys( a );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  /* onlyOwn on */

  var o = { onlyOwn : 1 };
  var got = _.aux.keys( a, o );
  var expected = [ 'a' ];
  test.identical( got, expected );

  /* enumerable/onlyOwn off */

  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  Object.defineProperty( b, 'k', { enumerable : 0 } );
  var got = _.aux.keys( a, o );
  var expected = _.aux.allKeys( a );
  test.identical( got, expected );

  /* enumerable off, onlyOwn on */

  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0 } );
  var got = _.aux.keys( a, o );
  var expected = [ 'a', 'k' ]
  test.identical( got, expected );

  /* */

  test.case = 'onlyEnumerable : 0, onlyOwn : 0'
  var a = Object.create( null );
  a.a = 1;
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var b = Object.create( a );
  b.b = 2;
  var exp = [ 'b', 'a', 'k' ];
  var got = _.aux.keys( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.keys();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.keys( 'wrong arguments' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.aux.keys( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyOwnKeys( test )
{
  test.case = 'empty'
  var got = _.aux.onlyOwnKeys( {} );
  var expected = [];
  test.identical( got, expected )

  /* */

  test.case = 'simplest'

  var got = _.aux.onlyOwnKeys( { a : '1', b : '2' } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected )

  // var got = _.aux.onlyOwnKeys( new Date );
  // var expected = [ ];
  // test.identical( got, expected )

  /* */

  test.case = ''

  var a = { a : 1 };
  var b = { b : 2 };
  var c = { c : 3 };
  Object.setPrototypeOf( a, b );
  Object.setPrototypeOf( b, c );

  var got = _.aux.onlyOwnKeys( a );
  var expected = [ 'a' ];
  test.identical( got, expected )

  var got = _.aux.onlyOwnKeys( b );
  var expected = [ 'b' ];
  test.identical( got, expected )

  var got = _.aux.onlyOwnKeys( c );
  var expected = [ 'c' ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable on/off';
  var a = { a : '1' };

  var got = _.aux.onlyOwnKeys( a );
  var expected = [ 'a' ]
  test.identical( got, expected );

  Object.defineProperty( a, 'k', { enumerable : false } );
  var o = { onlyEnumerable : 0 };
  var got = _.aux.onlyOwnKeys( a, o );
  var expected = [ 'a', 'k' ]
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnKeys();
  })

  test.case = 'invalid type';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnKeys( 1 );
  })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnKeys( { onlyOwn : 0 }, { 'wrong' : null } );
  })

}

//

function allKeys( test )
{
  var _expected =
  [
    '__defineGetter__',
    '__defineSetter__',
    'hasOwnProperty',
    '__lookupGetter__',
    '__lookupSetter__',
    'propertyIsEnumerable',
    '__proto__',
    'constructor',
    'toString',
    'toLocaleString',
    'valueOf',
    'isPrototypeOf'
  ]

  /* */

  test.case = 'empty'
  var got = _.aux.allKeys( {} );
  test.identical( got.sort(), _expected.sort() )

  /* */

  test.case = 'one onlyOwn property'
  var got = _.aux.allKeys( { a : 1 } );
  var expected = _expected.slice();
  expected.push( 'a' );
  test.identical( got.sort(), expected.sort() )

  /* */

  // test.case = 'date'
  // var got = _.aux.allKeys( new Date );
  // test.identical( got.length, 55 );

  /* */

  test.case = 'not enumerable'
  var a = { };
  Object.defineProperty( a, 'k', { enumerable : 0 } )
  var got = _.aux.allKeys( a );
  var expected = _expected.slice();
  expected.push( 'k' );
  test.identical( got.sort(), expected.sort() );

  /* */

  test.case = 'from prototype'
  var a = { a : 1 };
  var b = { b : 1 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0 } );
  Object.defineProperty( b, 'y', { enumerable : 0 } );
  var got = _.aux.allKeys( a );
  var expected = _expected.slice();
  expected = expected.concat( [ 'a', 'b', 'k', 'y' ] );
  test.identical( got.sort(), expected.sort() );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allKeys();
  })

  test.case = 'invalid argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allKeys();
  })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allKeys( { onlyOwn : 0 }, { 'wrong' : null } );
  })

}

//

function vals( test )
{

  test.case = 'trivial';

  var got = _.aux.vals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.aux.vals( { a : 1, b : undefined } );
  var expected = [ 1, undefined ];
  test.identical( got, expected );

  var got = _.aux.vals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.aux.vals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  // var got = _.aux.vals( new Date );
  // var expected = [ ];
  // test.identical( got, expected );

  /* */

  test.case = 'onlyOwn'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var o = { onlyOwn : 0, onlyEnumerable : 1 };
  var got = _.aux.vals( a, o );
  var expected = [ 1, 2 ]
  test.identical( got, expected );

  /* */

  var o = { onlyOwn : 1, onlyEnumerable : 1 };
  var got = _.aux.vals( a, o );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable'
  var a = { a : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0, value : 2 } );

  /* */

  var got = _.aux.vals( a, { onlyEnumerable : 1, onlyOwn : 0 } );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* */

  test.case = 'onlyEnumerable : 0, onlyOwn : 0'
  var a = Object.create( null );
  a.a = 1;
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var b = Object.create( a );
  b.b = 2;
  var exp = [ 2, 1, 3 ];
  var got = _.aux.vals( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.vals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.vals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.aux.vals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function onlyOwnVals( test )
{

  test.case = 'trivial';

  var got = _.aux.onlyOwnVals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.aux.onlyOwnVals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.aux.onlyOwnVals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  // var got = _.aux.onlyOwnVals( new Date );
  // var expected = [ ];
  // test.identical( got, expected );

  /* */

  test.case = ' only onlyOwn values'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.aux.onlyOwnVals( a );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* enumerable off */

  test.case = 'enumerable - 0';
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : 4 } );
  var got = _.aux.onlyOwnVals( a, { onlyEnumerable : 0 } );
  var expected = [ 1, 3 ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnVals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnVals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function allVals( test )
{
  test.case = 'trivial';

  var got = _.aux.allVals( {} );
  test.true( got.length !== 0 );

  /* */

  var got = _.aux.allVals( { a : 7, b : 13 } );
  test.true( got.length !== 0 );
  test.true( got.indexOf( 7 ) !== -1 );
  test.true( got.indexOf( 13 ) !== -1 );

  /* */

  // var got = _.aux.allVals( new Date );
  // test.true( got.length > _.aux.allVals( {} ).length );

  /* */

  test.case = 'from prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.aux.allVals( a );
  var expected = [ 1 ];
  test.true( got.length > _.aux.allVals( {} ).length );
  test.true( got.indexOf( 1 ) !== -1 );
  test.true( got.indexOf( 2 ) !== -1 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allVals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allVals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function pairs( test )
{

  test.case = 'empty';

  var got = _.aux.pairs( {} );
  var expected = [];
  test.identical( got, expected );

  // var got = _.aux.pairs( [] );
  // var expected = [];
  // test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.aux.pairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'list of [ key, value ] pairs'
  var got = _.aux.pairs( { a : 3, b : 13, c : 7 } );
  var expected = [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ];
  test.identical( got, expected );

  /* */

  // var arrObj = [];
  // arrObj[ 'k' ] = 1;
  // var got = _.aux.pairs( arrObj );
  // var expected = [ [ 'k', 1 ] ];
  // test.identical( got, expected );
  //
  // /* */
  //
  // var got = _.aux.pairs( new Date );
  // var expected = [];
  // test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.aux.pairs( a );
  var expected = [ [ 'a', 1 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  /* using onlyOwn */

  var got = _.aux.pairs( a, { onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn on */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  var got = _.aux.pairs( a, o );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  var got = _.aux.pairs( a, o );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'k', 3 ] );

  test.case = 'src - empty map';
  var got = _.aux.pairs( {} );
  var expected = [];
  test.identical( got, expected );

  // test.case = 'src - empty array';
  // var got = _.aux.pairs( [] );
  // var expected = [];
  // test.identical( got, expected );

  test.case = 'src - filled map';
  var got = _.aux.pairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'src - filled map'
  var got = _.aux.pairs( { a : 3, b : 13, 1 : 7 } );
  var expected = [ [ '1', 7 ], [ 'a', 3 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  // test.case = 'src - array with literal key';
  // var arrObj = [];
  // arrObj[ 'k' ] = 1;
  // var got = _.aux.pairs( arrObj );
  // var expected = [ [ 'k', 1 ] ];
  // test.identical( got, expected );
  //
  // test.case = 'src - Date object';
  // var got = _.aux.pairs( new Date );
  // var expected = [];
  // test.identical( got, expected );

  test.case = 'src - map prototyped by another map';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.aux.pairs( a );
  var expected = [ [ 'a', 1 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.aux.pairs( a, { onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs, not enumerable property';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.aux.pairs( a, { onlyEnumerable : 0, onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs disable, not enumerable property';
  var a = Object.create( null );
  a.a = 1;
  var b = Object.create( null );
  b.b = 2;
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.aux.pairs( a, { onlyEnumerable : 0, onlyOwn : 0 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.aux.pairs() );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.aux.pairs( 1 ) );
  test.shouldThrowErrorSync( () => _.aux.pairs( 'wrong' ) );

  /* */

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.pairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.aux.pairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.pairs( 'wrong argument' );
  });

  test.case = 'redundant argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.pairs( {}, 'wrong arguments' );
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.aux.pairs( null );
  });

}

//

function onlyOwnPairs( test )
{
  test.case = 'empty';
  var got = _.aux.onlyOwnPairs( {} );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.aux.onlyOwnPairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  /* */

  // var arrObj = [];
  // arrObj[ 'k' ] = 1;
  // var got = _.aux.onlyOwnPairs( arrObj );
  // var expected = [ [ 'k', 1 ] ];
  // test.identical( got, expected );
  //
  // /* */
  //
  // var got = _.aux.onlyOwnPairs( new Date );
  // var expected = [];
  // test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.aux.onlyOwnPairs( a );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.aux.onlyOwnPairs( a, { onlyEnumerable : 0 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnPairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnPairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.onlyOwnPairs( 'wrong argument' );
  });

}

//

function allPairs( test )
{
  test.case = 'empty';
  var got = _.aux.allPairs( {} );
  test.true( got.length !== 0 );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.aux.allPairs( { a : 7, b : 13 } );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 7 ] );
  test.identical( got[ 1 ], [ 'b', 13 ] );

  /* */

  // var arrObj = [];
  // arrObj[ 'k' ] = 1;
  // var got = _.aux.allPairs( arrObj );
  // test.true( got.length > 1 );
  // got = _.arrayFlatten( [], got );
  // test.true( got.indexOf( 'k' ) !== -1 );
  // test.identical( got[ got.indexOf( 'k' ) + 1 ], 1 );
  //
  // /* */
  //
  // var got = _.aux.allPairs( new Date );
  // test.true( got.length > 1 );
  // got = _.arrayFlatten( [], got );
  // test.true( got.indexOf( 'constructor' ) !== -1 );
  // test.identical( got[ got.indexOf( 'constructor' ) + 1 ].name, 'Date' );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.aux.allPairs( a );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'b', 2 ] );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allPairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allPairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.aux.allPairs( 'wrong argument' );
  });

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Auxiliary.l0.l1',
  silencing : 1,

  tests :
  {

    make,
    dichotomy,

    keys,
    onlyOwnKeys,
    allKeys,

    vals,
    onlyOwnVals,
    allVals,

    pairs,
    onlyOwnPairs,
    allPairs,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
