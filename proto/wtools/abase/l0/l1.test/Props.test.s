( function _l0_l1_Props_test_s()
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

//--
// map checker
//--

/* qqq : extend for like */
function dichotomy( test )
{

  test.case = 'undefined';
  var src = undefined;
  test.identical( _.props.is( src ), false );

  test.case = 'null';
  var src = null;
  test.identical( _.props.is( src ), false );

  test.case = 'string';
  var src = 'str';
  test.identical( _.props.is( src ), true );

  test.case = 'number';
  var src = 13;
  test.identical( _.props.is( src ), true );

  test.case = 'symbol';
  var src = Symbol.for( 'a' );
  test.identical( _.props.is( src ), true );

  test.case = 'boolean false';
  var src = true;
  test.identical( _.props.is( src ), true );

  test.case = 'boolean true';
  var src = true;
  test.identical( _.props.is( src ), true );

  test.case = 'empty array';
  var src = [];
  test.identical( _.props.is( src ), true );

  test.case = 'date';
  var src = new Date();
  test.identical( _.props.is( src ), true );

  test.case = 'empty arguments array';
  var src = _.argumentsArray.make();
  test.identical( _.props.is( src ), true );

  test.case = 'pure empty map';
  var src = Object.create( null );
  test.identical( _.props.is( src ), true );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  test.identical( _.props.is( src ), true );

  test.case = 'pure map with constructor';
  var src = Object.create( null );
  test.identical( _.props.is( src ), true );

  test.case = 'from pure with iterator';
  var src = Object.create( null );
  src[ Symbol.iterator ] = function(){};
  test.identical( _.props.is( src ), true );

  test.case = 'empty polluted map';
  var src = {};
  test.identical( _.props.is( src ), true );

  test.case = 'polluted map';
  var src = { a : 7, b : 13 };
  test.identical( _.props.is( src ), true );

  test.case = 'polluted map with constructor';
  var src = {};
  test.identical( _.props.is( src ), true );

  test.case = 'from polluted with iterator';
  var src = {};
  src[ Symbol.iterator ] = function(){};
  test.identical( _.props.is( src ), true );

  test.case = 'new object';
  var src = new Object();
  test.identical( _.props.is( src ), true );

  test.case = 'routine';
  var src = routine;
  test.identical( _.props.is( src ), true );

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  test.identical( _.props.is( src ), true );

  test.case = 'prototyped from pure map deep';
  var prototype1 = Object.create( null );
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.props.is( src ), true );

  test.case = 'prototyped from pure map deep with props';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.props.is( src ), true );

  test.case = 'prototyped from polluted map';
  var prototype = {};
  var src = Object.create( prototype );
  test.identical( _.props.is( src ), true );

  test.case = 'prototyped from polluted map with constructor';
  var prototype = {};
  prototype.constructor = function(){}
  var src = Object.create( prototype );
  test.identical( _.props.is( src ), true );

  test.case = 'prototyped from polluted map deep';
  var prototype1 = {};
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.props.is( src ), true );

  test.case = 'prototyped from polluted map deep with props';
  var prototype1 = {};
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.props.is( src ), true );

  /* - */

  function routine () {}

}

//

/* qqq : extend and implement tests for other routines */
function make( test )
{

  // test.case = 'without arguments';
  // var got = _.props.make();
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  //
  // test.case = 'src - null';
  // var got = _.props.make( null );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  //
  // test.case = 'src - undefined';
  // var got = _.props.make( undefined );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );

  /* */

  test.case = 'src - empty map';
  var src = {};
  var got = _.props.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - not pure map';
  var src = { a : 7, b : 13 };
  var got = _.props.make( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var src = Object.create( null );
  var got = _.props.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - pure map';
  var src = Object.create( null );
  src.a = 7;
  src.b = 13;
  var got = _.props.make( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  // test.case = 'src - empty Map';
  // var src = new HashMap([]);
  // var got = _.props.make( src );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );
  //
  // test.case = 'src - pure map';
  // var src = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  // var got = _.props.make( src );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );

  /* */

  // test.case = 'src - empty array';
  // var src = [];
  // var got = _.props.make( src );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );
  //
  // test.case = 'src - array with primitives';
  // var src = [ 0, 'str', null, undefined ];
  // var got = _.props.make( src );
  // var expected = { 0 : 0, 1 : 'str', 2 : null, 3 : undefined };
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );
  //
  // test.case = 'src - array with maps';
  // var src = [ { a : 7 }, { b : 13 } ];
  // var got = _.props.make( src );
  // var expected = { 0 : { a : 7 }, 1 : { b : 13 } };
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.props.make( { a : 1 }, { a : 'extra' }, {} ) );

  test.case = 'wrong argument';
  test.shouldThrowErrorSync( () => _.props.make() );
  test.shouldThrowErrorSync( () => _.props.make( null ) );
  test.shouldThrowErrorSync( () => _.props.make( '' ) );
  test.shouldThrowErrorSync( () => _.props.make( 1 ) );
  test.shouldThrowErrorSync( () => _.props.make( false ) );
  test.shouldThrowErrorSync( () => _.props.make( undefined ) );
  test.shouldThrowErrorSync( () => _.props.make( [] ) );
  test.shouldThrowErrorSync( () => _.props.make( new HashMap ) );
  test.shouldThrowErrorSync( () => _.props.make( new Set ) );

}

//

function of( test )
{
  test.case = 'empty';

  var got = _.props.of( {} );
  test.identical( got, {} );

  var got = _.props.of( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.props.of( { a : 1 } );
  var expected = { a : 1 };
  test.identical( got, expected );

  var a = [];
  a.a = 1;
  var got = _.props.of( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  var got = _.props.of( new Date() );
  var expected = {};
  test.identical( got, expected );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.of( a );
  var expected = { a : 1, b : 2 };
  test.identical( got, expected );

  /* */

  var o = { onlyOwn : 1, onlyEnumerable : 1 };
  var got = _.props.of( a, o );
  var expected = { a : 1 };
  test.identical( got, expected );

  /* */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  var got = _.props.of( a, o );
  var expected = { a : 1, k : 3 };
  test.identical( got, expected );

  /* */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.of( a, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.true( Object.keys( got ).length > 3 );
  test.true( got.a === 1 );
  test.true( got.b === 2 );
  test.true( got.k === 3 );

  /* */

  var got = _.props.of( new Date(), { onlyEnumerable : 0, onlyOwn : 0 } );
  test.true( Object.keys( got ).length !== 0 );
  test.true( got.constructor.name === 'Date' );
  test.true( _.routine.is( got.getDate ) );
  test.true( _.routine.is( got.toString ) );

  /* */

  test.case = 'number';
  var got = _.props.of( 13, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.true( Object.keys( got ).length !== 0 );
  var got = _.props.of( 13 );
  test.true( Object.keys( got ).length === 0 );

  /* */

  test.case = 'string';
  var got = _.props.of( 's', { onlyEnumerable : 0, onlyOwn : 0 } );
  test.true( Object.keys( got ).length !== 0 );
  var got = _.props.of( 's' );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.of();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.of( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.of( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.of( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.of( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.of( { x : 1 }, { 'wrong' : null } );
  });

}

//

function own( test )
{
  test.case = 'empty';

  var got = _.props.onlyOwn( {} );
  test.identical( got, {} );

  var got = _.props.onlyOwn( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.props.onlyOwn( { a : 1 } );
  var expected = { a : 1 };
  test.identical( got, expected );

  var a = [];
  a.a = 1;
  var got = _.props.onlyOwn( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  var got = _.props.onlyOwn( new Date() );
  var expected = {};
  test.identical( got, expected );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.onlyOwn( a );
  var expected = { a : 1 };
  test.identical( got, expected );

  /* */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyOwn( a, { onlyEnumerable : 0 } );
  var expected = { a : 1, k : 3 };
  test.identical( got, expected );

  /* */

  var got = _.props.onlyOwn( new Date(), { onlyEnumerable : 0 } );
  test.identical( got, {} )

  /* */

  test.case = 'number';
  var got = _.props.onlyOwn( 13 );
  test.true( Object.keys( got ).length === 0 );

  /* */

  test.case = 'string';
  var got = _.props.onlyOwn( 's' );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwn();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwn( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwn( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwn( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwn( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwn( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyExplicit( test )
{
  test.case = 'empty';

  var got = _.props.onlyExplicit( {} );
  test.true( Object.keys( got ).length !== 0 )
  test.identical( got.constructor.name, 'Object' );

  var got = _.props.onlyExplicit( [] );
  test.true( Object.keys( got ).length !== 0 )
  test.identical( got.constructor.name, 'Array' );

  /* */

  test.case = 'trivial';

  var got = _.props.onlyExplicit( { a : 1 } );
  test.true( Object.keys( got ).length > 1 )
  test.identical( got.a, 1 );

  var a = [];
  a.a = 1;
  var got = _.props.onlyExplicit( a );
  test.true( Object.keys( got ).length > 1 )
  var expected = { a : 1 };
  test.identical( got.a, 1 );

  var got = _.props.onlyExplicit( new Date() );
  test.true( _.routine.is( got.getDate ) );
  test.identical( got.constructor.name, 'Date' );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.onlyExplicit( a );
  test.true( Object.keys( got ).length > 2 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /* */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyExplicit( a );
  test.true( Object.keys( got ).length > 3 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, 3 );

  /* */

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : undefined } );
  var got = _.props.onlyExplicit( a );
  test.true( Object.keys( got ).length > 3 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, undefined );

  /* */

  test.case = 'number';
  var got = _.props.onlyExplicit( 13 );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  test.case = 'string';
  var got = _.props.onlyExplicit( 's' );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicit();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicit( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicit( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyExplicit( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyExplicit( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicit( { x : 1 }, { 'wrong' : null } );
  });

}

//

function routines( test )
{
  test.case = 'empty';

  var got = _.props.routines( {} );
  test.identical( got, {} );

  var got = _.props.routines( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.props.routines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.props.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.a ) );

  var got = _.props.routines( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.c ) );

  /* */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.routines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.c ) );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0 };
  var got = _.props.routines( a, o );
  test.true( Object.keys( got ).length > 1 )
  test.true( _.routine.is( got.c ) );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  /* */

  a.y = function(){}
  var got = _.props.routines( a, { onlyOwn : 1 } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.y ) );

  /* onlyOwn : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  var got = _.props.routines( a, { onlyOwn : 0 } );
  test.true( Object.keys( got ).length === 2 )
  test.true( _.routine.is( got.y ) );
  test.true( _.routine.is( got.c ) );

  /* onlyOwn : 0, enumerable : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  var o = { onlyOwn : 0, onlyEnumerable : 0 };
  var got = _.props.routines( a, o );
  test.true( Object.keys( got ).length > 3 )
  test.true( _.routine.is( got.y ) );
  test.true( _.routine.is( got.c ) );
  test.true( _.routine.is( got.k ) );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  /* */

  test.case = 'number';
  var got = _.props.routines( 13 );
  test.true( Object.keys( got ).length === 0 );

  /* */

  test.case = 'string';
  var got = _.props.routines( 's' );
  test.true( Object.keys( got ).length === 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.routines();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.routines( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.routines( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.routines( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.routines( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.routines( { x : 1 }, { 'wrong' : null } );
  });

}

//

function ownRoutines( test )
{
  test.case = 'empty';

  var got = _.props.onlyOwnRoutines( {} );
  test.identical( got, {} );

  var got = _.props.onlyOwnRoutines( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.props.onlyOwnRoutines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.props.onlyOwnRoutines( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( _.routine.is( got.a ) );

  var got = _.props.routines( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.onlyOwnRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyOwnRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  var a = {};
  var b = {};
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  var got = _.props.onlyOwnRoutines( a );
  test.identical( got, {} );

  /* enumerable : 0 */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyOwnRoutines( { enumerable : 0 }, a );
  test.identical( got, {} );

  /* enumerable : 0 */

  var a = {};
  var b = {};
  Object.defineProperty( a, 'k', { enumerable : 0, value : function(){} } );
  var got = _.props.onlyOwnRoutines( a, { onlyEnumerable : 0 } );
  test.identical( got.k, a.k );
  test.true( _.routine.is( got.k ) );

  /* */

  test.case = 'number';
  var got = _.props.onlyOwnRoutines( 13 );
  test.true( Object.keys( got ).length === 0 );

  /* */

  test.case = 'string';
  var got = _.props.onlyOwnRoutines( 's' );
  test.true( Object.keys( got ).length === 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnRoutines();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnRoutines( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnRoutines( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnRoutines( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnRoutines( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnRoutines( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyExplicitRoutines( test )
{
  test.case = 'empty';

  var got = _.props.onlyExplicitRoutines( {} );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  var got = _.props.onlyExplicitRoutines( [] );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );

  /* */

  test.case = 'trivial';

  var got = _.props.onlyExplicitRoutines( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );
  test.true( _.routine.is( got.b ) );

  var a = [];
  a.a = function(){};
  var got = _.props.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length !== 0 );
  test.true( _.routine.is( got.__defineGetter__ ) );
  test.true( _.routine.is( got.__defineSetter__ ) );
  test.true( _.routine.is( got.a ) );

  var got = _.props.onlyExplicitRoutines( new Date() );
  test.true( Object.keys( got ).length !== 0 );
  test.identical( got.constructor.name, 'Date' );
  test.true( _.routine.is( got.getDate ) );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length > 1 );
  test.true( _.routine.is( got.c ) );

  /* */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length > 1 );
  test.true( _.routine.is( got.c ) );

  /* */

  Object.defineProperty( a, 'z', { enumerable : 0, value : function(){} } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : function(){} } );
  var got = _.props.onlyExplicitRoutines( a );
  test.true( Object.keys( got ).length > 2 );
  test.true( _.routine.is( got.c ) );
  test.true( _.routine.is( got.y ) );
  test.true( _.routine.is( got.z ) );

  /* */

  test.case = 'number';
  var got = _.props.onlyExplicitRoutines( 13 );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  test.case = 'string';
  var got = _.props.onlyExplicitRoutines( 's' );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitRoutines();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitRoutines( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitRoutines( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyExplicitRoutines( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyExplicitRoutines( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitRoutines( { x : 1 }, { 'wrong' : null } );
  });

}

//

function fields( test )
{
  test.case = 'empty';

  var got = _.props.fields( {} );
  test.identical( got, {} );

  var got = _.props.fields( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.props.fields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.a === 1 );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.props.fields( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.b === 1 );

  var got = _.props.fields( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.fields( a );
  test.true( Object.keys( got ).length === 2 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /* */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.fields( a );
  test.true( Object.keys( got ).length === 2 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /* enumerable : 0 */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.fields( a, { onlyEnumerable : 0 } );
  test.true( Object.keys( got ).length === 4 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, 3 );

  /* */

  a.y = function(){}
  var got = _.props.fields( a, { onlyOwn : 1 } );
  test.true( Object.keys( got ).length === 1 )
  test.identical( got.a, 1 );

  /* onlyOwn : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  var got = _.props.fields( a, { onlyOwn : 0, onlyEnumerable : 1 } );
  test.true( Object.keys( got ).length === 2 )
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );

  /* enumerable : 0 */

  var a = { a : 1, y : function(){} };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( b, 'k', { enumerable : 0, value : function(){} } );
  Object.defineProperty( b, 'z', { enumerable : 0, value : 3 } );
  var got = _.props.fields( a, { onlyEnumerable : 0 } );
  test.identical( Object.keys( got ).length, 4 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.z, 3 );

  /* */

  test.case = 'number';
  var got = _.props.fields( 13 );
  test.true( Object.keys( got ).length === 0 );

  /* */

  test.case = 'string';
  var got = _.props.fields( 's' );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.fields();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.fields( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.fields( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.fields( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.fields( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.fields( { x : 1 }, { 'wrong' : null } );
  });

}

//

function ownFields( test )
{
  test.case = 'empty';

  var got = _.props.onlyOwnFields( {} );
  test.identical( got, {} );

  var got = _.props.onlyOwnFields( [] );
  test.identical( got, {} );

  /* */

  test.case = 'trivial';

  var got = _.props.onlyOwnFields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.a === 1 );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.props.onlyOwnFields( a );
  test.true( Object.keys( got ).length === 1 )
  test.true( got.b === 1 );

  var got = _.props.onlyOwnFields( new Date() );
  test.identical( got, {} );

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.onlyOwnFields( a );
  test.true( Object.keys( got ).length === 1 );
  test.identical( got.a, 1 );

  /* */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyOwnFields( a );
  test.true( Object.keys( got ).length === 1 );
  test.identical( got.a, 1 );

  /* enumerable : 0 */

  Object.defineProperty( a, 'y', { enumerable : 0, value : 3 } );
  var got = _.props.onlyOwnFields( a, { onlyEnumerable : 0 } );
  test.true( Object.keys( got ).length === 3 )
  test.identical( got.a, 1 );
  test.identical( got.y, 3 );

  /* */

  test.case = 'number';
  var got = _.props.onlyOwnFields( 13 );
  test.true( Object.keys( got ).length === 0 );

  /* */

  test.case = 'string';
  var got = _.props.onlyOwnFields( 's' );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnFields();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnFields( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnFields( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnFields( 'x' );
  // });
  //
  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnFields( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnFields( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnFields( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyExplicitFields( test )
{
  test.case = 'empty';

  var got = _.props.onlyExplicitFields( {} );
  test.true( Object.keys( got ).length === 1 )
  test.identical( got.__proto__, {}.__proto__ );

  var got = _.props.onlyExplicitFields( [] );
  test.true( Object.keys( got ).length === 2 )
  test.identical( got.__proto__, [].__proto__ );
  test.identical( got.length, 0 );

  /* */

  test.case = 'trivial';

  var got = _.props.onlyExplicitFields( { a : 1, b : function(){} } );
  test.true( Object.keys( got ).length === 2 )
  test.true( got.a === 1 );
  test.true( got.__proto__ === {}.__proto__ );

  var a = [ ];
  a.a = function(){};
  a.b = 1;
  var got = _.props.onlyExplicitFields( a );
  console.log(got);
  test.true( Object.keys( got ).length === 3 )
  test.true( got.length === 0 );
  test.true( got.b === 1 );
  test.true( got.__proto__ === [].__proto__ );

  var str = new Date();
  var got = _.props.onlyExplicitFields( str );
  test.identical( got.__proto__, str.__proto__);

  /* */

  test.case = 'prototype'
  var a = { a : 1 };
  var b = { b : 2, c : function(){} };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.onlyExplicitFields( a );
  test.true( Object.keys( got ).length === 3 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.__proto__, b );

  /* */

  Object.defineProperty( b, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyExplicitFields( a );
  test.true( Object.keys( got ).length === 4 );
  test.identical( got.a, 1 );
  test.identical( got.b, 2 );
  test.identical( got.k, 3 );
  test.identical( got.__proto__, b );

  /* */

  test.case = 'number';
  var got = _.props.onlyExplicitFields( 13 );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  test.case = 'string';
  var got = _.props.onlyExplicitFields( 's' );
  test.true( Object.keys( got ).length !== 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitFields();
  });

  test.case = 'undefined';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitFields( undefined );
  });

  test.case = 'null';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitFields( null );
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyExplicitFields( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyExplicitFields( 'wrong argument' );
  // });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyExplicitFields( { x : 1 }, { 'wrong' : null } );
  });

}

// --
// container
// --

function keys( test )
{

  test.case = 'trivial';

  var got = _.props.keys( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.props.keys( { a : 1, b : undefined } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.props.keys( { a : 7, b : 13 } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.props.keys( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ '3', '7', '13' ];
  test.identical( got, expected );

  var f = () => {};
  Object.setPrototypeOf( f, String );
  f.a = 1;
  var got = _.props.keys( f );
  var expected = [ 'a' ];
  test.identical( got, expected );

  var got = _.props.keys( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = 'options';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* onlyOwn off */

  var got = _.props.keys( a );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  /* onlyOwn on */

  var o = { onlyOwn : 1 };
  var got = _.props.keys( a, o );
  var expected = [ 'a' ];
  test.identical( got, expected );

  /* enumerable/onlyOwn off */

  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  Object.defineProperty( b, 'k', { enumerable : 0 } );
  var got = _.props.keys( a, o );
  var expected = _.props.allKeys( a );
  test.identical( got, expected );

  /* enumerable off, onlyOwn on */

  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0 } );
  var got = _.props.keys( a, o );
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
  var got = _.props.keys( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  test.case = 'string'
  var got = _.props.keys( 'str' );
  test.true( got.length > 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.keys();
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.keys( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyOwnKeys( test )
{
  test.case = 'empty'
  var got = _.props.onlyOwnKeys( {} );
  var expected = [];
  test.identical( got, expected )

  /* */

  test.case = 'simplest'

  var got = _.props.onlyOwnKeys( { a : '1', b : '2' } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected )

  var got = _.props.onlyOwnKeys( new Date );
  var expected = [ ];
  test.identical( got, expected )

  /* */

  test.case = ''

  var a = { a : 1 };
  var b = { b : 2 };
  var c = { c : 3 };
  Object.setPrototypeOf( a, b );
  Object.setPrototypeOf( b, c );

  var got = _.props.onlyOwnKeys( a );
  var expected = [ 'a' ];
  test.identical( got, expected )

  var got = _.props.onlyOwnKeys( b );
  var expected = [ 'b' ];
  test.identical( got, expected )

  var got = _.props.onlyOwnKeys( c );
  var expected = [ 'c' ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable on/off';
  var a = { a : '1' };

  var got = _.props.onlyOwnKeys( a );
  var expected = [ 'a' ]
  test.identical( got, expected );

  Object.defineProperty( a, 'k', { enumerable : false } );
  var o = { onlyEnumerable : 0 };
  var got = _.props.onlyOwnKeys( a, o );
  var expected = [ 'a', 'k' ]
  test.identical( got, expected );

  /* */

  test.case = 'string'
  var got = _.props.onlyOwnKeys( 'str' );
  test.true( got.length > 0 );

  /* */

  test.case = 'number'
  var got = _.props.onlyOwnKeys( 13 );
  test.true( got.length === 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnKeys();
  })

  // test.case = 'invalid type';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnKeys( 1 );
  // })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnKeys( { onlyOwn : 0 }, { 'wrong' : null } );
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
  var got = _.props.allKeys( {} );
  test.identical( got.sort(), _expected.sort() )

  /* */

  test.case = 'one onlyOwn property'
  var got = _.props.allKeys( { a : 1 } );
  var expected = _expected.slice();
  expected.push( 'a' );
  test.identical( got.sort(), expected.sort() )

  /* */

  test.case = 'date'
  var got = _.props.allKeys( new Date );
  test.identical( got.length, 55 );

  /* */

  test.case = 'not enumerable'
  var a = { };
  Object.defineProperty( a, 'k', { enumerable : 0 } )
  var got = _.props.allKeys( a );
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
  var got = _.props.allKeys( a );
  var expected = _expected.slice();
  expected = expected.concat( [ 'a', 'b', 'k', 'y' ] );
  test.identical( got.sort(), expected.sort() );

  /* */

  test.case = 'string'
  var got = _.props.allKeys( 'str' );
  test.true( got.length > 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.props.allKeys();
  })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.props.allKeys( { onlyOwn : 0 }, { 'wrong' : null } );
  })

}

//

function vals( test )
{

  test.case = 'trivial';

  var got = _.props.vals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.props.vals( { a : 1, b : undefined } );
  var expected = [ 1, undefined ];
  test.identical( got, expected );

  var got = _.props.vals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.props.vals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.props.vals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = 'onlyOwn'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var o = { onlyOwn : 0, onlyEnumerable : 1 };
  var got = _.props.vals( a, o );
  var expected = [ 1, 2 ]
  test.identical( got, expected );

  /* */

  var o = { onlyOwn : 1, onlyEnumerable : 1 };
  var got = _.props.vals( a, o );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable'
  var a = { a : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0, value : 2 } );

  /* */

  var got = _.props.vals( a, { onlyEnumerable : 1, onlyOwn : 0 } );
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
  var got = _.props.vals( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  test.case = 'string'
  var got = _.props.vals( 'str' );
  test.true( got.length > 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.vals();
  });

  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.vals( 'wrong argument' );
  // });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.props.vals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function onlyOwnVals( test )
{

  test.case = 'trivial';

  var got = _.props.onlyOwnVals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.props.onlyOwnVals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.props.onlyOwnVals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.props.onlyOwnVals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = ' only onlyOwn values'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.onlyOwnVals( a );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* enumerable off */

  test.case = 'enumerable - 0';
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : 4 } );
  var got = _.props.onlyOwnVals( a, { onlyEnumerable : 0 } );
  var expected = [ 1, 3 ];
  test.identical( got, expected );

  /* */

  test.case = 'string'
  var got = _.props.onlyOwnVals( 'str' );
  test.true( got.length > 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnVals();
  });

  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnVals( 'wrong argument' );
  // });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function allVals( test )
{
  test.case = 'trivial';

  var got = _.props.allVals( {} );
  test.true( got.length !== 0 );

  /* */

  var got = _.props.allVals( { a : 7, b : 13 } );
  test.true( got.length !== 0 );
  test.true( got.indexOf( 7 ) !== -1 );
  test.true( got.indexOf( 13 ) !== -1 );

  /* */

  var got = _.props.allVals( new Date );
  test.true( got.length > _.props.allVals( {} ).length );

  /* */

  test.case = 'from prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.props.allVals( a );
  var expected = [ 1 ];
  test.true( got.length > _.props.allVals( {} ).length );
  test.true( got.indexOf( 1 ) !== -1 );
  test.true( got.indexOf( 2 ) !== -1 );

  /* */

  test.case = 'string'
  var got = _.props.allVals( 'str' );
  test.true( got.length > 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.allVals();
  });

  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.allVals( 'wrong argument' );
  // });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.props.allVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function pairs( test )
{

  test.case = 'empty';

  var got = _.props.pairs( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.props.pairs( [] );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.props.pairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'list of [ key, value ] pairs'
  var got = _.props.pairs( { a : 3, b : 13, c : 7 } );
  var expected = [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ];
  test.identical( got, expected );

  /* */

  var arrObj = [];
  arrObj[ 'k' ] = 1;
  var got = _.props.pairs( arrObj );
  var expected = [ [ 'k', 1 ] ];
  test.identical( got, expected );

  /* */

  var got = _.props.pairs( new Date );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.props.pairs( a );
  var expected = [ [ 'a', 1 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  /* using onlyOwn */

  var got = _.props.pairs( a, { onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn on */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  var got = _.props.pairs( a, o );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  var got = _.props.pairs( a, o );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'k', 3 ] );

  test.case = 'src - empty map';
  var got = _.props.pairs( {} );
  var expected = [];
  test.identical( got, expected );

  test.case = 'src - empty array';
  var got = _.props.pairs( [] );
  var expected = [];
  test.identical( got, expected );

  test.case = 'src - filled map';
  var got = _.props.pairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'src - filled map'
  var got = _.props.pairs( { a : 3, b : 13, 1 : 7 } );
  var expected = [ [ '1', 7 ], [ 'a', 3 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'src - array with literal key';
  var arrObj = [];
  arrObj[ 'k' ] = 1;
  var got = _.props.pairs( arrObj );
  var expected = [ [ 'k', 1 ] ];
  test.identical( got, expected );

  test.case = 'src - Date object';
  var got = _.props.pairs( new Date );
  var expected = [];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.props.pairs( a );
  var expected = [ [ 'a', 1 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.props.pairs( a, { onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs, not enumerable property';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.pairs( a, { onlyEnumerable : 0, onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  test.case = 'src - map prototyped by another map, onlyOwn pairs disable, not enumerable property';
  var a = Object.create( null );
  a.a = 1;
  var b = Object.create( null );
  b.b = 2;
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.pairs( a, { onlyEnumerable : 0, onlyOwn : 0 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  /* */

  test.case = 'string'
  var got = _.props.pairs( 'str' );
  test.true( got.length > 0 );

  /* */

  test.case = 'number'
  var got = _.props.pairs( 13 );
  test.true( got.length === 0 );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.props.pairs() );

  // test.case = 'wrong type of src';
  // test.shouldThrowErrorSync( () => _.props.pairs( 1 ) );
  // test.shouldThrowErrorSync( () => _.props.pairs( 'wrong' ) );

  /* */

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.pairs();
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.pairs( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.pairs( 'wrong argument' );
  // });

  test.case = 'redundant argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.pairs( {}, 'str' );
  });

  test.case = 'wrong type of array';
  test.shouldThrowErrorSync( function()
  {
    _.props.pairs( null );
  });

}

//

function onlyOwnPairs( test )
{
  test.case = 'empty';
  var got = _.props.onlyOwnPairs( {} );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.props.onlyOwnPairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  /* */

  var arrObj = [];
  arrObj[ 'k' ] = 1;
  var got = _.props.onlyOwnPairs( arrObj );
  var expected = [ [ 'k', 1 ] ];
  test.identical( got, expected );

  /* */

  var got = _.props.onlyOwnPairs( new Date );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.props.onlyOwnPairs( a );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.props.onlyOwnPairs( a, { onlyEnumerable : 0 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* */

  test.case = 'string'
  var got = _.props.onlyOwnPairs( 'str' );
  test.true( got.length > 0 );

  /* */

  test.case = 'number'
  var got = _.props.onlyOwnPairs( 13 );
  test.true( got.length === 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.onlyOwnPairs();
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnPairs( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.onlyOwnPairs( 'wrong argument' );
  // });

}

//

function allPairs( test )
{
  test.case = 'empty';
  var got = _.props.allPairs( {} );
  test.true( got.length !== 0 );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.props.allPairs( { a : 7, b : 13 } );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 7 ] );
  test.identical( got[ 1 ], [ 'b', 13 ] );

  /* */

  var got = _.props.allPairs( new Date );
  test.true( got.length > 1 );
  var got2 = [];
  got.forEach( ( e ) => got2.push( ... e ) );
  test.true( got2.indexOf( 'constructor' ) !== -1 );
  test.identical( got2[ got2.indexOf( 'constructor' ) + 1 ].name, 'Date' );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.props.allPairs( a );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'b', 2 ] );

  /* */

  test.case = 'string'
  var got = _.props.allPairs( 'str' );
  test.true( got.length > 0 );

  /* */

  test.case = 'number'
  var got = _.props.allPairs( 13 );
  test.true( got.length > 0 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.props.allPairs();
  });

  // test.case = 'primitive';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.allPairs( 1 );
  // });
  //
  // test.case = 'wrong type of argument';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.props.allPairs( 'wrong argument' );
  // });

}

// --
// define test suite
// --

const Proto =
{

  name : 'Tools.Props.l0.l1',
  silencing : 1,

  tests :
  {

    dichotomy,

    make,

    of,
    own,
    onlyExplicit,
    routines,
    ownRoutines,
    onlyExplicitRoutines,
    fields,
    ownFields,
    onlyExplicitFields,

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

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
