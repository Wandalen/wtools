( function _l0_l1_Long_test_s_()
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
// long
//--

/* qqq : for junior : merge routines is and like to routine dichotomy and extend */
function is( test )
{
  test.case = 'an empty array';
  var got = _.long.is( [] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.long.is( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.case = 'a pseudo array';
  var got = _.long.is( arguments );
  var expected = true;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.long.is( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'typed array buffer';
  var got = _.long.is( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.long.is();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.long.is( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.long.is( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.long.is( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'number';
  var got = _.long.is( 1 );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.long.is( true );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.long.is( {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'object with fields and iteraor method';
  var src = new function()
  {
    this[ Symbol.iterator ] = function ()
    {
      return { next() { return { done : true } } }
    }
  }
  var got = _.long.is( src );
  var expected  = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;
}

//

function like( test )
{
  test.case = 'an empty array';
  var got = _.long.like( [] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.long.like( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.case = 'a pseudo array';
  var got = _.long.like( arguments );
  var expected = true;
  test.identical( got, expected );

  test.case = 'raw array buffer';
  var got = _.long.like( new BufferRaw( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'typed array buffer';
  var got = _.long.like( new F32x( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.long.like();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.long.like( null );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.long.like( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.long.like( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'number';
  var got = _.long.like( 1 );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.long.like( true );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'empty object';
  var got = _.long.like( {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'object with fields';
  var got = _.long.like( { 0 : 1, 1 : 2, length : 2 } );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'object with fields and iteraor method';
  var src = new function()
  {
    this[ Symbol.iterator ] = function ()
    {
      return { next() { return { done : true } } }
    }
  }

  test.identical( _.arrayIs( src ), false );
  test.identical( _.argumentsArray.like( src ), false );
  test.identical( _.long.is( src ), false );
  test.identical( _.long.like( src ), false );
  test.identical( _.vector.is( src ), false );
  test.identical( _.vector.like( src ), false );
  test.identical( _.countable.is( src ), true );
  test.identical( _.countable.like( src ), true );

  /* qqq for Yevhen : write very good test "typing" testing routines which check 'countable', 'vector', 'long', 'array' */

  /* - */

  if( !Config.debug )
  return;
}

// --
//
// --

function makeCommon( test )
{

  methodEach({ tools : 'default', type : 'Array' });
  methodEach({ tools : 'Array', type : 'Array' });
  methodEach({ tools : 'F32x', type : 'F32x' });

  /* - */

  function methodEach( env )
  {

    env.method = 'makeEmpty';
    act( env );
    env.method = 'makeUndefined';
    act( env );
    env.method = 'make';
    act( env );
    env.method = 'cloneShallow';
    act( env );

  }

  /* - */

  function act( env )
  {

    /* */

    if( env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, no args`;
      var got = tools( env ).long[ env.method ]();
      test.true( got instanceof _global_[ env.type ] );
      test.identical( got.length, 0 );
    }

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, length`;
      var got = tools( env ).long[ env.method ]( 3 );
      test.true( got instanceof _global_[ env.type ] );
      test.true( got.length === 3 );
    }

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, empty array`;
    var got = tools( env ).long[ env.method ]( [] );
    test.true( got instanceof Array );
    test.identical( got.length, 0 );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, 1 element`;
    var got = tools( env ).long[ env.method ]( [ 2 ] );
    test.true( got instanceof Array );
    if( env.method === 'makeEmpty' )
    test.identical( got.length, 0 );
    else
    test.identical( got.length, 1 );
    if( env.method === 'make' || env.method === 'cloneShallow' )
    test.identical( got, [ 2 ] );

    /* */

    test.case = `${__.entity.exportStringSolo( env )}, 2 elements`;
    var got = tools( env ).long[ env.method ]( [ 2, 3 ] );
    test.true( got instanceof Array );
    if( env.method === 'makeEmpty' )
    test.identical( got.length, 0 );
    else
    test.identical( got.length, 2 );
    if( env.method === 'make' || env.method === 'cloneShallow' )
    test.identical( got, [ 2, 3 ] );

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, empty and length`;
      var got = tools( env ).long[ env.method ]( [], 2 );
      test.true( got instanceof Array );
      test.identical( got.length, 2 );
    }

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, non-empty and length longer`;
      var got = tools( env ).long[ env.method ]( [ 3, 4 ], 3 );
      test.true( got instanceof Array );
      test.identical( got.length, 3 );
      if( env.method === 'make' )
      test.identical( got, [ 3, 4, undefined ] );
    }

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, non-empty and length shorter`;
      var got = tools( env ).long[ env.method ]( [ 3, 4 ], 1 );
      test.true( got instanceof Array );
      test.identical( got.length, 1 );
      if( env.method === 'make' )
      test.identical( got, [ 3 ] );
    }

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, non-empty and ins longer`;
      var got = tools( env ).long[ env.method ]( [ 3, 4 ], [ 2, 3, 4 ] );
      test.true( got instanceof Array );
      test.identical( got.length, 3 );
      if( env.method === 'make' )
      test.identical( got, [ 2, 3, 4 ] );
    }

    /* */

    if( env.method !== 'makeEmpty' && env.method !== 'cloneShallow' )
    {
      test.case = `${__.entity.exportStringSolo( env )}, non-empty and ins shorter`;
      var got = tools( env ).long[ env.method ]( [ 3, 4 ], [ 2 ] );
      test.true( got instanceof Array );
      test.identical( got.length, 1 );
      if( env.method === 'make' )
      test.identical( got, [ 2 ] );
    }

    /* */

  }

  /* */

  function tools( env )
  {
    if( env.tools === 'default' )
    return _;
    // return _[ env.tools ].asDefault.long;
    return _.withLong[ env.tools ];
  }

  /* - */

}

//

function longMakeWithArrayAndUnroll( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  }
  var list =
  [
    array,
    unroll,
    longConstr,
  ];

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    test.case = 'src = null, not ins';
    var got = _.long.make( null );
    var expected = [];
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = _.long.make( 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = _.long.make( 5, null );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins = number';
    var got = _.long.make( null, 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = undefined';
    // var got = _.long.make( 5, undefined );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = makeLong( [] );
    var got = _.long.make( src );
    var expected = makeLong( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src.length - 1, positive number';
    var src = makeLong( [ 2 ] );
    var got = _.long.make( src );
    var exp = makeLong( [ 2 ] );
    test.identical( got, exp );
    test.true( got !== src );

    test.case = 'src.length - 1, negative number';
    var src = makeLong( [ -1 ] );
    var got = _.long.make( src );
    var exp = makeLong( [ -1 ] );
    test.identical( got, exp );
    test.true( got !== src );

    test.case = 'the irrational numbers in src';
    var src = makeLong( [ 1.5 ] );
    var got = _.long.make( src );
    var exp = makeLong( [ 1.5 ] );
    test.identical( got, exp );
    test.true( got !== src );

    test.case = 'src = long, not ins';
    var src = makeLong([ 1, 2, 3 ]);
    var got = _.long.make( src );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.identical( got.length, 3 );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = makeLong( [] );
    var got = _.long.make( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = long, ins = null';
    // var src = makeLong( [ 1, 2, 3 ] );
    // var got = _.long.make( src, null );
    // var expected = makeLong( [ 1, 2, 3 ] );
    // test.identical( got, expected );
    // test.true( got !== src );
    // test.true( _.arrayIs( got ) );

    test.case = 'ins = number, ins < src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _.long.make( src, 2 );
    var expected = makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    test.case = 'ins = number, ins > src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _.long.make( src, 4 );
    var expected = makeLong( [ 1, 2, 3, undefined ] )
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    test.case = 'ins = long, ins.length > src.length';
    var src = makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.long.make( src, ins );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    test.case = 'src = new long, ins = array'
    var src = makeLong( 2 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = _.long.make( src, ins );
    var expected = makeLong( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = Array constructor, ins = null';
    // var got = _.long.make( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = Array constructor, ins = number';
    var got = _.long.make( Array, 3 );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = long';
    var ins = makeLong( [ 1, 1, 1, 1, 1 ] );
    var got = _.long.make( U32x, ins );
    var expected = new U32x( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );
    test.true( got !== ins );

    test.case = 'src = long constructor, ins = number';
    var src = makeLong( 5 );
    var got = _.long.make( src.constructor, 2 );
    var expected = makeLong([ undefined, undefined ]);
    test.identical( got, expected );
    test.true( got !== ins );

    // test.case = 'src = long constructor, ins = null';
    // var src = makeLong( 5 );
    // var got = _.long.make( src.constructor, null );
    // var expected = makeLong();
    // test.identical( got, expected );
    // test.true( got !== ins );
    //
    // test.case = 'src = long constructor, ins = undefined';
    // var src = makeLong( 5 );
    // var got = _.long.make( src.constructor, undefined );
    // var expected = makeLong( 0 );
    // test.identical( got, expected );
    // test.true( got !== ins );

  }

  /* - */

  if( !Config.debug )
  return;

  // qqq : for Dmytro : add test case
  // test.case = 'without arguments';
  // test.shouldThrowErrorSync( () => _.long.make() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.long.make( [ 1, 2, 3 ], 4, 'extra argument' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.long.make( 'wrong argument', 1 ) );
  test.shouldThrowErrorSync( () => _.long.make( -1 ) );
  test.shouldThrowErrorSync( () => _.long.make( 1, 1 ) );
  test.shouldThrowErrorSync( () => _.long.make( new BufferRaw( 3 ), 2 ) );
  test.shouldThrowErrorSync( () => _.long.make( ( e ) => { return { [ e ] : e } }, 5 ) );
  if( Config.interpreter === 'njs' )
  {
    test.shouldThrowErrorSync( () => _.long.make( Array, BufferNode.from( [ 3 ] ) ) );
    test.shouldThrowErrorSync( () => _.long.make( BufferNode.alloc( 3 ), 2 ) );
  }

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.long.make( [ 1, 2, 3 ], 'wrong type of argument' ) );
  test.shouldThrowErrorSync( () => _.long.make( [ 1, 2, 3 ], Infinity  ) );

  /* qqq : for Dmytro : duplicate this cases in other tests routines */
  test.case = 'bad second argument';
  test.shouldThrowErrorSync( () => _.long.make( [ 1, 2, 3 ], null ) );
  test.shouldThrowErrorSync( () => _.long.make( 3, null ) );
  test.shouldThrowErrorSync( () => _.long.make( Array, null ) );
  test.shouldThrowErrorSync( () => _.long.make( null, null ) );
  test.shouldThrowErrorSync( () => _.long.make( [ 1, 2, 3 ], undefined ) );
  test.shouldThrowErrorSync( () => _.long.make( 3, undefined ) );
  test.shouldThrowErrorSync( () => _.long.make( Array, undefined ) );
  test.shouldThrowErrorSync( () => _.long.make( null, undefined ) );

}

//

/* qqq : for Dmytro : for junior : rewrite properly */
function longMakeWithArgumentsArray( test )
{
  test.case = 'src = null, not ins';
  var got = _.long.make( null );
  var expected = [];
  test.identical( got, expected );

  test.case = 'src = number, not ins';
  var got = _.long.make( 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* qqq : should throw error : add test cases */
  // test.case = 'src = number, ins = null';
  // var got = _.long.make( 5, null );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );

  test.case = 'src = null, ins = number';
  var got = _.long.make( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* qqq : should throw error : add test cases */
  // test.case = 'src = number, ins = undefined';
  // var got = _.long.make( 5, undefined );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );

  test.case = 'src = empty long, not ins';
  var src = _.argumentsArray.make( [] );
  var got = _.long.make( src );
  var expected = _.argumentsArray.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long, not ins';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.long.make( src );
  var expected = _.argumentsArray.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.identical( got.length, 3 );
  test.true( got !== src );

  test.case = 'src = empty long, ins = number';
  var src = _.argumentsArray.make( [] );
  var got = _.long.make( src, 2 );
  var expected = _.argumentsArray.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  /* qqq : should throw error : add test cases */
  // test.case = 'src = long, ins = null';
  // var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  // var got = _.long.make( src, null );
  // var expected = _./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
  // test.identical( got, expected );
  // test.true( got !== src );
  // test.true( _.arrayIs( got ) );

  test.case = 'ins = number, ins < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.long.make( src, 2 );
  var expected = _.argumentsArray.make( [ 1, 2 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'ins = number, ins > src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.long.make( src, 4 );
  var expected = _.argumentsArray.make( [ 1, 2, 3, undefined ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'ins = long, ins.length > src.length';
  var src = _.argumentsArray.make( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.long.make( src, ins );
  var expected = _.argumentsArray.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== ins );
  test.true( got !== src );

  test.case = 'src = new long, ins = array'
  var src = _.argumentsArray.make( 2 );
  var ins = [ 1, 2, 3, 4, 5 ];
  var got = _.long.make( src, ins );
  var expected = _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = Array constructor, ins = number';
  var got = _.long.make( Array, 3 );
  var expected = [ undefined, undefined, undefined ];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );

  test.case = 'src = BufferTyped constructor, ins = long';
  var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
  var got = _.long.make( U32x, ins );
  var expected = new U32x( [ 1, 1, 1, 1, 1 ] );
  test.identical( got, expected );
  test.true( _.bufferTypedIs(  got ) );
  test.true( got !== ins );
}

//

function longMakeWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    test.case = 'src = null, not ins';
    var got = _.long.make( null );
    var expected = [];
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = _.long.make( 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = _.long.make( 5, null );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins = number';
    var got = _.long.make( null, 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = undefined';
    // var got = _.long.make( 5, undefined );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = new makeLong( [] );
    var got = _.long.make( src );
    var expected = new makeLong( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, not ins';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _.long.make( src );
    var expected = new makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.identical( got.length, 3 );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = new makeLong( [] );
    var got = _.long.make( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = long, ins = null';
    // var src = new makeLong( [ 1, 2, 3 ] );
    // var got = _.long.make( src, null );
    // var expected = new makeLong( [ 1, 2, 3 ] );
    // test.identical( got, expected );
    // test.true( got !== src );
    // test.true( _.bufferTypedIs( got ) );

    test.case = 'ins = number, ins < src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _.long.make( src, 2 );
    var expected = new makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    test.case = 'ins = number, ins > src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _.long.make( src, 4 );
    // var expected = new long( [ 1, 2, 3, 0 ] )
    var expected = new makeLong( [ 1, 2, 3, 0 ] )
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    test.case = 'ins = long, ins.length > src.length';
    var src = new makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.long.make( src, ins );
    var expected = new makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    test.case = 'src = new long, ins = array'
    var src = new makeLong( 2 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = _.long.make( src, ins );
    var expected = new makeLong( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    // test.case = 'src = Array constructor, ins = null';
    // var got = _.long.make( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = Array constructor, ins = number';
    var got = _.long.make( Array, 3 );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = long';
    var ins = new makeLong( [ 1, 1, 1, 1, 1 ] );
    var got = _.long.make( U32x, ins );
    var expected = new U32x( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );
    test.true( got !== ins );

    test.case = 'src = long constructor, ins = number';
    var src = new makeLong( 5 );
    var got = _.long.make( src.constructor, 2 );
    var expected = new makeLong([ undefined, undefined ]);
    test.identical( got, expected );
    test.true( got !== ins );

    // test.case = 'src = long constructor, ins = null';
    // var src = new makeLong( 5 );
    // var got = _.long.make( src.constructor, null );
    // var expected = new makeLong();
    // test.identical( got, expected );
    // test.true( got !== ins );
    //
    // test.case = 'src = long constructor, ins = undefined';
    // var src = new makeLong( 5 );
    // var got = _.long.make( src.constructor, undefined );
    // var expected = new makeLong( 0 );
    // test.identical( got, expected );
    // test.true( got !== ins );
  }
}

//

function longMakeWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  }
  var list =
  [
    array,
    unroll,
    longConstr,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'src = null, not ins';
    var got = descriptor.long.make( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor.long.make( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor.long.make( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins = number';
    var got = descriptor.long.make( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor.long.make( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = makeLong( [] );
    var got = descriptor.long.make( src );
    var expected = makeLong( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src.length - 1, positive number';
    var src = makeLong( [ 2 ] );
    var got = descriptor.long.make( src );
    var exp = makeLong( [ 2 ] );
    test.identical( got, exp );
    test.true( got !== src );

    test.case = 'src.length - 1, negative number';
    var src = makeLong( [ -1 ] );
    var got = descriptor.long.make( src );
    var exp = makeLong( [ -1 ] );
    test.identical( got, exp );
    test.true( got !== src );

    test.case = 'the irrational numbers in src';
    var src = makeLong( [ 1.5 ] );
    var got = descriptor.long.make( src );
    var exp = makeLong( [ 1.5 ] );
    test.identical( got, exp );
    test.true( got !== src );

    test.case = 'src = long, not ins';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.identical( got.length, 3 );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = makeLong( [] );
    var got = descriptor.long.make( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = long, ins = null';
    // var src = makeLong( [ 1, 2, 3 ] );
    // var got = descriptor.long.make( src, null );
    // var expected = makeLong( [ 1, 2, 3 ] );
    // test.identical( got, expected );
    // test.true( got !== src );
    // test.true( _.arrayIs( got ) );

    test.case = 'ins = number, ins < src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src, 2 );
    var expected = makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    test.case = 'ins = number, ins > src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src, 4 );
    // var expected = long( [ 1, 2, 3, undefined ] )
    var expected = makeLong( [ 1, 2, 3, undefined ] )
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    test.case = 'ins = long, ins.length > src.length';
    var src = makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.long.make( src, ins );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    test.case = 'src = new long, ins = array'
    var src = makeLong( 2 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor.long.make( src, ins );
    var expected = makeLong( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.arrayIs( got ) );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor.long.make( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = Array constructor, ins = number';
    var got = descriptor.long.make( Array, 3 );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = long';
    var ins = makeLong( [ 1, 1, 1, 1, 1 ] );
    var got = descriptor.long.make( U32x, ins );
    var expected = new U32x( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );
    test.true( got !== ins );

    test.case = 'src = long constructor, ins = number';
    var src = makeLong( 5 );
    var got = descriptor.long.make( src.constructor, 2 );
    var expected = makeLong([ undefined, undefined ]);
    test.identical( got, expected );
    test.true( got !== ins );

    // test.case = 'src = long constructor, ins = null';
    // var src = makeLong( 5 );
    // var got = descriptor.long.make( src.constructor, null );
    // var expected = makeLong();
    // test.identical( got, expected );
    // test.true( got !== ins );
    //
    // test.case = 'src = long constructor, ins = undefined';
    // var src = makeLong( 5 );
    // var got = descriptor.long.make( src.constructor, undefined );
    // var expected = makeLong( 0 );
    // test.identical( got, expected );
    // test.true( got !== ins );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.long.make() );

      test.case = 'extra argument';
      test.shouldThrowErrorSync( () => descriptor.long.make( [ 1, 2, 3 ], 4, 'extra argument' ) );

      test.case = 'wrong type of src';
      test.shouldThrowErrorSync( () => descriptor.long.make( 'wrong argument', 1 ) );
      test.shouldThrowErrorSync( () => descriptor.long.make( 1, 1 ) );
      test.shouldThrowErrorSync( () => descriptor.long.make( new BufferRaw( 3 ), 2 ) );
      test.shouldThrowErrorSync( () => descriptor.long.make( ( e ) => { return { [ e ] : e } }, 5 ) );
      if( Config.interpreter === 'njs' )
      {
        test.shouldThrowErrorSync( () => descriptor.long.make( Array, BufferNode.from( [ 3 ] ) ) );
        test.shouldThrowErrorSync( () => descriptor.long.make( BufferNode.alloc( 3 ), 2 ) );
      }

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => descriptor.long.make( [ 1, 2, 3 ], 'wrong type of argument' ) );
      test.shouldThrowErrorSync( () => descriptor.long.make( [ 1, 2, 3 ], Infinity  ) );
    }
  }
}

longMakeWithArrayAndUnrollLongDescriptor.timeOut = 15000;

//

function longMakeWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];
    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'src = null, not ins';
    var got = descriptor.long.make( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor.long.make( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor.long.make( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins = number';
    var got = descriptor.long.make( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor.long.make( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.long.make( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src = empty long, ins = number';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.long.make( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = long, ins = null';
    // var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    // var got = descriptor.long.make( src, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
    // test.identical( got, expected );

    test.case = 'ins = number, ins < src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'ins = number, ins > src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src, 4 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3, undefined ] )
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'ins = long, ins.length > src.length';
    var src = _.argumentsArray.make( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.long.make( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    test.case = 'src = new long, ins = array'
    var src = _.argumentsArray.make( 2 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor.long.make( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== src );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor.long.make( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = Array constructor, ins = number';
    var got = descriptor.long.make( Array, 3 );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = long';
    var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
    var got = descriptor.long.make( U32x, ins );
    var expected = new U32x( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );
    test.true( got !== ins );
  }
}

longMakeWithArgumentsArrayLongDescriptor.timeOut = 10000;

//

function longMakeWithBufferTypedLongDescriptor( test )
{
  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'src = null, not ins';
    var got = descriptor.long.make( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor.long.make( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor.long.make( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins = number';
    var got = descriptor.long.make( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor.long.make( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = new makeLong( [] );
    var got = descriptor.long.make( src );
    var expected = new makeLong( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, not ins';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src );
    var expected = new makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.identical( got.length, 3 );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = new makeLong( [] );
    var got = descriptor.long.make( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = long, ins = null';
    // var src = new makeLong( [ 1, 2, 3 ] );
    // var got = descriptor.long.make( src, null );
    // var expected = new makeLong( [ 1, 2, 3 ] );
    // test.identical( got, expected );
    // test.true( got !== src );
    // test.true( _.bufferTypedIs( got ) );

    test.case = 'ins = number, ins < src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src, 2 );
    var expected = new makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    test.case = 'ins = number, ins > src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.make( src, 4 );
    var expected = new makeLong( [ 1, 2, 3, 0 ] )
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    test.case = 'ins = long, ins.length > src.length';
    var src = new makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.long.make( src, ins );
    var expected = new makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    test.case = 'src = new long, ins = array'
    var src = new makeLong( 2 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor.long.make( src, ins );
    var expected = new makeLong( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( _.bufferTypedIs( got ) );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor.long.make( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = Array constructor, ins = number';
    var got = descriptor.long.make( Array, 3 );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = long';
    var ins = new makeLong( [ 1, 1, 1, 1, 1 ] );
    var got = descriptor.long.make( U32x, ins );
    var expected = new U32x( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );
    test.true( got !== ins );

    test.case = 'src = long constructor, ins = number';
    var src = makeLong( 5 );
    var got = descriptor.long.make( src.constructor, 2 );
    var expected = new makeLong([ undefined, undefined ]);
    test.identical( got, expected );
    test.true( got !== ins );

    // test.case = 'src = long constructor, ins = null';
    // var src = new makeLong( 5 );
    // var got = descriptor.long.make( src.constructor, null );
    // var expected = new makeLong();
    // test.identical( got, expected );
    // test.true( got !== ins );
    //
    // test.case = 'src = long constructor, ins = undefined';
    // var src = new makeLong( 5 );
    // var got = descriptor.long.make( src.constructor, undefined );
    // var expected = new makeLong( 0 );
    // test.identical( got, expected );
    // test.true( got !== ins );

  }
}

longMakeWithBufferTypedLongDescriptor.timeOut = 20000;

//

function longMakeEmptyWithArrayAndUnroll( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  };
  var list =
  [
    array,
    unroll,
    longConstr,
    Array,
  ];

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    test.case = 'without arguments';
    var got = _.long.makeEmpty();
    var expected = _./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    // test.case = 'src - null';
    // var got = _.long.makeEmpty( null );
    // var expected = _./*longDescriptor*/defaultLong.make( 0 );
    // test.identical( got, expected );

    test.case = 'src - empty long';
    var src = makeLong( [] );
    var got = _.long.makeEmpty( src );
    var expected = makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long';
    var src = makeLong( [ 1, 2, 3, 4, 5 ] );
    var got = _.long.makeEmpty( src );
    var expected = makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );
  }

  test.case = 'src - Array, constructor';
  var got = _.long.makeEmpty( Array );
  var expected = [];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.long.makeEmpty( [ 1, 2, 3 ], 'extra argument' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.long.makeEmpty( 1 ) );
  test.shouldThrowErrorSync( () => _.long.makeEmpty( undefined ) );
  test.shouldThrowErrorSync( () => _.long.makeEmpty( 'wrong argument' ) );
  test.shouldThrowErrorSync( () => _.long.makeEmpty( new BufferRaw( 3 ) ) );
  if( Config.interpreter === 'njs' )
  test.shouldThrowErrorSync( () => _.long.makeEmpty( BufferNode.alloc( 3 ) ) );

  test.case = 'src is function without constructor';
  test.shouldThrowErrorSync( () => _.long.makeEmpty( ( e ) => _.array.make( e ) ) );
}

//

function longMakeEmptyWithArgumentsArray( test )
{
  test.case = 'without arguments';
  var got = _.long.makeEmpty();
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  // test.case = 'src - null';
  // var got = _.long.makeEmpty( null );
  // var expected = _./*longDescriptor*/defaultLong.make( 0 );
  // test.identical( got, expected );

  test.case = 'src - empty long';
  var src = _.argumentsArray.make( [] );
  var got = _.long.makeEmpty( src );
  var expected = _.argumentsArray.make( 0 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long';
  var src = _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] );
  var got = _.long.makeEmpty( src );
  var expected = _.argumentsArray.make( 0 );
  test.identical( got, expected );
  test.true( got !== src );
}

//

function longMakeEmptyWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    test.case = 'without arguments';
    var got = _.long.makeEmpty();
    var expected = _./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    // test.case = 'src - null';
    // var got = _.long.makeEmpty( null );
    // var expected = _./*longDescriptor*/defaultLong.make( 0 );
    // test.identical( got, expected );

    test.case = 'src - empty long';
    var src = new makeLong( [] );
    var got = _.long.makeEmpty( src );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long';
    var src = new makeLong( [ 1, 2, 3, 4, 5 ] );
    var got = _.long.makeEmpty( src );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - constructor';
    var got = _.long.makeEmpty( makeLong );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
  }
}

//

function longMakeEmptyWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  }
  var list =
  [
    array,
    unroll,
    longConstr,
    Array,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'without arguments';
    var got = descriptor.long.makeEmpty();
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null';
    var got = descriptor.long.makeEmpty( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - empty long';
    var src = makeLong( [] );
    var got = descriptor.long.makeEmpty( src );
    var expected = makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long';
    var src = makeLong( [ 1, 2, 3, 4, 5 ] );
    var got = descriptor.long.makeEmpty( src );
    var expected = makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - Array, constructor';
    var got = descriptor.long.makeEmpty( Array );
    var expected = [];
    test.identical( got, expected );

    /* - */

    if( Config.debug )
    {
      test.case = 'extra argument';
      test.shouldThrowErrorSync( () => descriptor.long.makeEmpty( [ 1, 2, 3 ], 'extra argument' ) );

      test.case = 'wrong type of src';
      test.shouldThrowErrorSync( () => descriptor.long.makeEmpty( 1 ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeEmpty( undefined ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeEmpty( 'wrong argument' ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeEmpty( new BufferRaw( 3 ) ) );
      if( Config.interpreter === 'njs' )
      test.shouldThrowErrorSync( () => descriptor.long.makeEmpty( BufferNode.alloc( 3 ) ) );
    }
  }
}

longMakeEmptyWithArrayAndUnrollLongDescriptor.timeOut = 20000;

//

function longMakeEmptyWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'without arguments';
    var got = descriptor.long.makeEmpty();
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null';
    var got = descriptor.long.makeEmpty( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - empty long';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.long.makeEmpty( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long';
    var src = _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] );
    var got = descriptor.long.makeEmpty( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );
    test.true( got !== src );
  }
}

//

function longMakeEmptyWithBufferTypedLongDescriptor( test )
{
  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'without arguments';
    var got = descriptor.long.makeEmpty();
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null';
    var got = descriptor.long.makeEmpty( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - empty long';
    var src = new makeLong( [] );
    var got = descriptor.long.makeEmpty( src );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long';
    var src = new makeLong( [ 1, 2, 3, 4, 5 ] );
    var got = descriptor.long.makeEmpty( src );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long';
    var got = descriptor.long.makeEmpty( makeLong );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
  }
}

longMakeEmptyWithBufferTypedLongDescriptor.timeOut = 20000;

//

function _longMakeOfLengthWithArrayAndUnroll( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  }
  var list =
  [
    array,
    unroll,
    longConstr,
  ];

  /* tests */

  for( let t = 0; t < list.length; t++ )
  {
    test.open( list[ t ].name );
    testRun( list[ t ] );
    test.close( list[ t ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    test.case = 'src = null, not ins';
    var got = _._longMakeOfLength( null );
    var expected = [];
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = _._longMakeOfLength( 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = _._longMakeOfLength( 5, null );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = _._longMakeOfLength( 5, undefined );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = _._longMakeOfLength( null, 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = _._longMakeOfLength( null, makeLong( [ 1, 2, 3, 4, 5 ] ) );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = makeLong( [] );
    var got = _._longMakeOfLength( src );
    var expected = makeLong( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( src );
    var expected = makeLong([ 1, 2, 3 ]);
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = empty long, ins = null';
    var src = makeLong( [] );
    var got = _._longMakeOfLength( src, null );
    var expected = makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number';
    var src = makeLong( 10 );
    var got = _._longMakeOfLength( src.constructor, 4 );
    var expected = makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = makeLong( [] );
    var got = _._longMakeOfLength( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( src, 2 );
    var expected = makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = _._longMakeOfLength( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( src, 4 );
    var expected = makeLong( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _._longMakeOfLength( src, ins );
    var expected = makeLong( [ 0, 1, undefined ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = _._longMakeOfLength( src, ins );
    var expected = makeLong( 5 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = _._longMakeOfLength( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = _._longMakeOfLength( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _._longMakeOfLength() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _._longMakeOfLength( [ 1, 2, 3 ], 4, 'extra argument' ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _._longMakeOfLength( 'wrong argument', 1 ) );
  test.shouldThrowErrorSync( () => _._longMakeOfLength( 1, 1 ) );
  test.shouldThrowErrorSync( () => _._longMakeOfLength( BufferNode.alloc( 3 ), 2 ) );
  test.shouldThrowErrorSync( () => _._longMakeOfLength( new BufferRaw( 3 ), 2 ) );
  test.shouldThrowErrorSync( () => _._longMakeOfLength( Array, BufferNode.from( [ 3 ] ) ) );

  test.case = 'wrong type of len';
  test.shouldThrowErrorSync( () => _._longMakeOfLength( [ 1, 2, 3 ], 'wrong type of argument' ) );
  test.shouldThrowErrorSync( () => _._longMakeOfLength( [ 1, 2, 3 ], Infinity ) );
}

//

function _longMakeOfLengthWithArgumentsArray( test )
{
  test.case = 'src = null, not ins';
  var got = _._longMakeOfLength( null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src = number, not ins';
  var got = _._longMakeOfLength( 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* qqq : should throw error : add test cases */
  // test.case = 'src = number, ins = null';
  // var got = _._longMakeOfLength( 5, null );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );
  //
  // test.case = 'src = number, ins = undefined';
  // var got = _._longMakeOfLength( 5, undefined );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );

  test.case = 'src = null, ins - number';
  var got = _._longMakeOfLength( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src = null, ins - long';
  var got = _._longMakeOfLength( null, _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] ) );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src = empty long, not ins';
  var src = _.argumentsArray.make( [] );
  var got = _._longMakeOfLength( src );
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );

  test.case = 'src = long, not ins';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _._longMakeOfLength( src );
  var expected = _./*longDescriptor*/defaultLong.make( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = empty long, ins = null';
  var src = _.argumentsArray.make( [] );
  var got = _._longMakeOfLength( src, null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = empty long, ins = number';
  var src = _.argumentsArray.make( [] );
  var got = _._longMakeOfLength( src, 2 );
  var expected = _./*longDescriptor*/defaultLong.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long, ins = number, ins < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _._longMakeOfLength( src, 2 );
  var expected = _./*longDescriptor*/defaultLong.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long with an element, ins = empty array';
  var src = new F64x( 10 );
  var got = _._longMakeOfLength( src, [] );
  var expected = new F64x( 0 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long, ins = number, ins > src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _._longMakeOfLength( src, 4 );
  var expected = _./*longDescriptor*/defaultLong.make( 4 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long, ins = array, ins.length > src.length';
  var src = _.argumentsArray.make( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _._longMakeOfLength( src, ins );
  var expected = _./*longDescriptor*/defaultLong.make( 3 );
  test.identical( got, expected );
  test.true( got !== ins );
  test.true( got !== src );

  test.case = 'src = long, ins = array, ins.length === src.length'
  var src = _.argumentsArray.make( 5 );
  var ins = [ 1, 2, 3, 4, 5 ];
  var got = _._longMakeOfLength( src, ins );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );
  test.true( got !== src );

  // test.case = 'src = Array constructor, ins = null';
  // var got = _._longMakeOfLength( Array, null );
  // var expected = [];
  // test.identical( got, expected );
  // test.true( _.arrayIs( got ) );

  test.case = 'src = BufferTyped constructor, ins = number';
  var got = _._longMakeOfLength( U32x, 5 );
  var expected = new U32x( 5 );
  test.identical( got, expected );
  test.true( _.bufferTypedIs(  got ) );

  test.case = 'src = Array constructor, ins = long';
  var ins = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _._longMakeOfLength( Array, ins );
  var expected = [ undefined, undefined, undefined ];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( got !== ins );
}

//

function _longMakeOfLengthWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    U16x,
    F32x,
  ];

  /* tests */

  for( let t = 0; t < list.length; t++ )
  {
    test.open( list[ t ].name );
    testRun( list[ t ] );
    test.close( list[ t ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    test.case = 'src = null, not ins';
    var got = _._longMakeOfLength( null );
    var expected = [];
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = _._longMakeOfLength( 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = _._longMakeOfLength( 5, null );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = _._longMakeOfLength( 5, undefined );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = _._longMakeOfLength( null, 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = _._longMakeOfLength( null, new makeLong( [ 1, 2, 3, 4, 5 ] ) );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = new makeLong( [] );
    var got = _._longMakeOfLength( src );
    var expected = new makeLong( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( src );
    var expected = new makeLong([ 1, 2, 3 ]);
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = empty long, ins = null';
    var src = new makeLong( [] );
    var got = _._longMakeOfLength( src, null );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number';
    var src = new makeLong( 10 );
    var got = _._longMakeOfLength( src.constructor, 4 );
    var expected = new makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = new makeLong( [] );
    var got = _._longMakeOfLength( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( src, 2 );
    var expected = new makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = _._longMakeOfLength( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( src, 4 );
    var expected = new makeLong( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = new makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = _._longMakeOfLength( src, ins );
    var expected = new makeLong([ 1, 2, 3, 4, 5 ]);
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = _._longMakeOfLength( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = _._longMakeOfLength( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = new makeLong( [ 1, 2, 3 ] );
    var got = _._longMakeOfLength( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }
}

//

function _longMakeOfLengthWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  }
  var list =
  [
    array,
    unroll,
    longConstr,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'src = null, not ins';
    var got = descriptor._longMakeOfLength( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor._longMakeOfLength( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor._longMakeOfLength( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor._longMakeOfLength( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = descriptor._longMakeOfLength( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = descriptor._longMakeOfLength( null, makeLong( [ 1, 2, 3, 4, 5 ] ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = makeLong( [] );
    var got = descriptor._longMakeOfLength( src );
    var expected = makeLong( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src );
    var expected = makeLong([ 1, 2, 3 ]);
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = null';
    var src = makeLong( [] );
    var got = descriptor._longMakeOfLength( src, null );
    var expected = makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number';
    var src = makeLong( 10 );
    var got = descriptor._longMakeOfLength( src.constructor, 4 );
    var expected = makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = makeLong( [] );
    var got = descriptor._longMakeOfLength( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src, 2 );
    var expected = makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = descriptor._longMakeOfLength( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src, 4 );
    var expected = makeLong( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor._longMakeOfLength( src, ins );
    var expected = makeLong( [ 0, 1, undefined ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor._longMakeOfLength( src, ins );
    var expected = makeLong( 5 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor._longMakeOfLength( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = descriptor._longMakeOfLength( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( [ 1, 2, 3 ], 4, 'extra argument' ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( 'wrong argument', 1 ) );
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( 1, 1 ) );
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( BufferNode.alloc( 3 ), 2 ) );
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( new BufferRaw( 3 ), 2 ) );
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( Array, BufferNode.from( [ 3 ] ) ) );

      test.case = 'wrong type of len';
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( [ 1, 2, 3 ], 'wrong type of argument' ) );
      test.shouldThrowErrorSync( () => descriptor._longMakeOfLength( [ 1, 2, 3 ], Infinity ) );
    }
  }
}

_longMakeOfLengthWithArrayAndUnrollLongDescriptor.timeOut = 20000;

//

function _longMakeOfLengthWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'src = null, not ins';
    var got = descriptor._longMakeOfLength( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor._longMakeOfLength( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor._longMakeOfLength( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor._longMakeOfLength( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = descriptor._longMakeOfLength( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = descriptor._longMakeOfLength( null, _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = _.argumentsArray.make( [] );
    var got = descriptor._longMakeOfLength( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = null';
    var src = _.argumentsArray.make( [] );
    var got = descriptor._longMakeOfLength( src, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = _.argumentsArray.make( [] );
    var got = descriptor._longMakeOfLength( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = descriptor._longMakeOfLength( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src, 4 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = _.argumentsArray.make( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor._longMakeOfLength( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = _.argumentsArray.make( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor._longMakeOfLength( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );
    test.true( got !== src );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor._longMakeOfLength( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = descriptor._longMakeOfLength( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }
}

//

function _longMakeOfLengthWithBufferTypedLongDescriptor( test )
{
  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'src = null, not ins';
    var got = descriptor._longMakeOfLength( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor._longMakeOfLength( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor._longMakeOfLength( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor._longMakeOfLength( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = descriptor._longMakeOfLength( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = descriptor._longMakeOfLength( null, new makeLong( [ 1, 2, 3, 4, 5 ] ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = new makeLong( [] );
    var got = descriptor._longMakeOfLength( src );
    var expected = new makeLong( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src );
    var expected = new makeLong([ 1, 2, 3 ]);
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = null';
    var src = new makeLong( [] );
    var got = descriptor._longMakeOfLength( src, null );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number';
    var src = new makeLong( 10 );
    var got = descriptor._longMakeOfLength( src.constructor, 4 );
    var expected = new makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = new makeLong( [] );
    var got = descriptor._longMakeOfLength( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src, 2 );
    var expected = new makeLong( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = descriptor._longMakeOfLength( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( src, 4 );
    var expected = new makeLong( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = new makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor._longMakeOfLength( src, ins );
    var expected = new makeLong([ 1, 2, 3, 4, 5 ]);
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor._longMakeOfLength( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = descriptor._longMakeOfLength( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor._longMakeOfLength( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }
}

_longMakeOfLengthWithBufferTypedLongDescriptor.timeOut = 20000;

//

/* aaa : implement */
/* Dmytro : implemented */
/* aaa : no! */
/* Dmytro : improved test routines, split on separate types, tested with default longDescriptor and with no default */

function longMakeUndefinedWithArrayAndUnroll( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  }
  var list =
  [
    array,
    unroll,
    longConstr,
  ];

  /* tests */

  for( let t = 0; t < list.length; t++ )
  {
    test.open( list[ t ].name );
    testRun( list[ t ] );
    test.close( list[ t ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    /* aaa : thouse routines are too makeLong code to be such routine. use function nameOfRoutine(){} an move it out of run */
    /* aaa : bad names of routines. not clear what it does */
    /* aaa : bad names of routines. don't use nouns for routines */
    /* Dmytro : improved test routines, split on separate types, tested with default longDescriptor and with no default, removed unnacessary function and variables */

    test.case = 'without arguments';
    var got = _.long.makeUndefined();
    var expected = [];
    test.identical( got, expected );

    test.case = 'src = null, not ins';
    var got = _.long.makeUndefined( null );
    var expected = [];
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = _.long.makeUndefined( 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = _.long.makeUndefined( 5, null );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = _.long.makeUndefined( 5, undefined );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    // test.case = 'src = null, ins - number';
    // var got = _.long.makeUndefined( null, 5 );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = null, ins - long';
    // var got = _.long.makeUndefined( null, makeLong( [ 1, 2, 3, 4, 5 ] ) );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = makeLong( [] );
    var got = _.long.makeUndefined( src );
    var expected = makeLong( [] );
    test.identical( got, expected );
    /* aaa : analyze and fix that */
    /* Dmytro : this test case is the same as above. That is src defines only length, but longDescriptor defines type */
    // test.false( src.constructor.name === got.constructor.name );

    test.case = 'src = long, not ins';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( src );
    var expected = makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== src );
    /* aaa : improve this line. make it proepr + redable */
    /* Dmytro : line below not use strange subroutine */
    test.true( src.constructor.name === got.constructor.name );

    /* aaa : make sure each _.longMake, _.longFrom, _.array.make, _.array.from test routine has the same test case */
    /* Dmytro : each test routine that accepts two arguments has this test case */
    // test.case = 'src = empty long, ins = null';
    // var src = makeLong( [] );
    // var got = _.long.makeUndefined( src, null );
    // var expected = makeLong( 0 );
    // test.identical( got, expected );
    // test.true( got !== src );
    // test.true( src.constructor.name === got.constructor.name );

    /* aaa : make sure each _.longMake, _.longFrom, _.array.make, _.array.from test routine has the same test case */
    /* Dmytro : each test routine that accepts two arguments has this test case */
    test.case = 'src = long, ins = number';
    var src = makeLong( 10 );
    var got = _.long.makeUndefined( src, 4 );
    var expected = makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = makeLong( [] );
    var got = _.long.makeUndefined( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    /* aaa : make sure each _.longMake, _.longFrom, _.array.make, _.array.from test routine has the same test case */
    /* Dmytro : each test routine that accepts two arguments has this test case */
    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = _.long.makeUndefined( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    /* aaa : make sure each _.longMake, _.longFrom, _.array.make, _.array.from test routine has the same test case */
    /* Dmytro : each test routine that accepts two arguments has this test case */
    test.case = 'src = long, ins = number, ins > src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( src, 4 );
    var expected = makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.long.makeUndefined( src, ins );
    var expected = makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = _.long.makeUndefined( src, ins );
    var expected = makeLong( 5 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = _.long.makeUndefined( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    /* aaa : there are no such arguments */
    /* aaa : make sure all similar test routines has good naming of variables */
    /* Dmytro : each test routine that accepts two arguments has this test case */
    test.case = 'src = BufferTyped constructor, ins = number';
    var got = _.long.makeUndefined( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.long.makeUndefined( [ 1, 2, 3 ], 4, 'extra argument' ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.long.makeUndefined( 'wrong argument', 1 ) );
  test.shouldThrowErrorSync( () => _.long.makeUndefined( 1, 1 ) );
  test.shouldThrowErrorSync( () => _.long.makeUndefined( BufferNode.alloc( 3 ), 2 ) );
  test.shouldThrowErrorSync( () => _.long.makeUndefined( new BufferRaw( 3 ), 2 ) );
  test.shouldThrowErrorSync( () => _.long.makeUndefined( Array, BufferNode.from( [ 3 ] ) ) );

  test.case = 'wrong type of len';
  test.shouldThrowErrorSync( () => _.long.makeUndefined( [ 1, 2, 3 ], 'wrong type of argument' ) );
  test.shouldThrowErrorSync( () => _.long.makeUndefined( [ 1, 2, 3 ], Infinity ) );

  test.case = 'src - null, ins - number';
  test.shouldThrowErrorSync( () => _.long.makeUndefined( null, 5 ) );

  test.case = 'src - null, ins - long';
  test.shouldThrowErrorSync( () => _.long.makeUndefined( null, [ 1, 2, 3 ] ) );

  test.case = 'src - long, ins - null';
  test.shouldThrowErrorSync( () => _.long.makeUndefined( [ 1, 2, 3 ], null ) );
}

//

function longMakeUndefinedWithArgumentsArray( test )
{
  test.case = 'src = null, not ins';
  var got = _.long.makeUndefined( null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src = number, not ins';
  var got = _.long.makeUndefined( 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* qqq : should throw error : add test cases */
  // test.case = 'src = number, ins = null';
  // var got = _.long.makeUndefined( 5, null );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );
  //
  // test.case = 'src = number, ins = undefined';
  // var got = _.long.makeUndefined( 5, undefined );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );
  //
  // test.case = 'src = null, ins - number';
  // var got = _.long.makeUndefined( null, 5 );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );
  //
  // test.case = 'src = null, ins - long';
  // var got = _.long.makeUndefined( null, _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] ) );
  // var expected = _./*longDescriptor*/defaultLong.make( 5 );
  // test.identical( got, expected );

  test.case = 'src = empty long, not ins';
  var src = _.argumentsArray.make( [] );
  var got = _.long.makeUndefined( src );
  var expected = _.argumentsArray.make( [] );
  test.identical( got, expected );

  test.case = 'src = long, not ins';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.long.makeUndefined( src );
  var expected = _.argumentsArray.make( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  // test.case = 'src = empty long, ins = null';
  // var src = _.argumentsArray.make( [] );
  // var got = _.long.makeUndefined( src, null );
  // var expected = _./*longDescriptor*/defaultLong.make( 0 );
  // test.identical( got, expected );
  // test.true( got !== src );

  test.case = 'src = empty long, ins = number';
  var src = _.argumentsArray.make( [] );
  var got = _.long.makeUndefined( src, 2 );
  var expected = _.argumentsArray.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long, ins = number, ins < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.long.makeUndefined( src, 2 );
  var expected = _.argumentsArray.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long, ins = number, ins > src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.long.makeUndefined( src, 4 );
  var expected = _.argumentsArray.make( 4 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = long, ins = array, ins.length > src.length';
  var src = _.argumentsArray.make( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.long.makeUndefined( src, ins );
  var expected = _.argumentsArray.make( 3 );
  test.identical( got, expected );
  test.true( got !== ins );
  test.true( got !== src );

  test.case = 'src = long, ins = array, ins.length === src.length'
  var src = _.argumentsArray.make( 5 );
  var ins = [ 1, 2, 3, 4, 5 ];
  var got = _.long.makeUndefined( src, ins );
  var expected = _.argumentsArray.make( 5 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src = BufferTyped constructor, ins = number';
  var got = _.long.makeUndefined( U32x, 5 );
  var expected = new U32x( 5 );
  test.identical( got, expected );
  test.true( _.bufferTypedIs(  got ) );

  test.case = 'src = Array constructor, ins = long';
  var ins = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.long.makeUndefined( Array, ins );
  var expected = [ undefined, undefined, undefined ];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( got !== ins );
}

//

function longMakeUndefinedWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    U16x,
    F32x,
  ];

  /* tests */

  for( let t = 0; t < list.length; t++ )
  {
    test.open( list[ t ].name );
    testRun( list[ t ] );
    test.close( list[ t ].name );
  }

  /* test subroutine */

  function testRun( makeLong )
  {
    test.case = 'src = null, not ins';
    var got = _.long.makeUndefined( null );
    var expected = [];
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = _.long.makeUndefined( 5 );
    var expected = _./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = _.long.makeUndefined( 5, null );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = _.long.makeUndefined( 5, undefined );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = null, ins - number';
    // var got = _.long.makeUndefined( null, 5 );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = null, ins - long';
    // var got = _.long.makeUndefined( null, new makeLong( [ 1, 2, 3, 4, 5 ] ) );
    // var expected = _./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = new makeLong( [] );
    var got = _.long.makeUndefined( src );
    var expected = new makeLong( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( src );
    var expected = new makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = empty long, ins = null';
    // var src = new makeLong( [] );
    // var got = _.long.makeUndefined( src, null );
    // var expected = new makeLong( 0 );
    // test.identical( got, expected );
    // test.true( got !== src );
    // test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number';
    var src = new makeLong( 10 );
    var got = _.long.makeUndefined( src.constructor, 4 );
    var expected = new makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = new makeLong( [] );
    var got = _.long.makeUndefined( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = _.long.makeUndefined( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( src, 4 );
    var expected = new makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = new makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.long.makeUndefined( src, ins );
    var expected = new makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = new makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = _.long.makeUndefined( src, ins );
    var expected = new makeLong( 5 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = _.long.makeUndefined( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = _.long.makeUndefined( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = new makeLong( [ 1, 2, 3 ] );
    var got = _.long.makeUndefined( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }
}

//

function longMakeUndefinedWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );
  var longConstr = ( src ) =>
  {
    if( src )
    return _./*longDescriptor*/defaultLong.make( src );
    return _./*longDescriptor*/defaultLong.make( 0 );
  }
  var list =
  [
    array,
    unroll,
    longConstr,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'src = null, not ins';
    var got = descriptor.long.makeUndefined( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor.long.makeUndefined( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor.long.makeUndefined( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor.long.makeUndefined( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = descriptor.long.makeUndefined( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = descriptor.long.makeUndefined( null, makeLong( [ 1, 2, 3, 4, 5 ] ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = makeLong( [] );
    var got = descriptor.long.makeUndefined( src );
    var expected = makeLong( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src );
    var expected = makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = null';
    var src = makeLong( [] );
    var got = descriptor.long.makeUndefined( src, null );
    var expected = makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number';
    var src = makeLong( 10 );
    var got = descriptor.long.makeUndefined( src.constructor, 4 );
    var expected = makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = makeLong( [] );
    var got = descriptor.long.makeUndefined( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src, 2 );
    var expected = makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = descriptor.long.makeUndefined( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src, 4 );
    var expected = makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.long.makeUndefined( src, ins );
    var expected = makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor.long.makeUndefined( src, ins );
    var expected = makeLong( 5 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor.long.makeUndefined( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = descriptor.long.makeUndefined( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined() );

      test.case = 'extra arguments';
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( [ 1, 2, 3 ], 4, 'extra argument' ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( 'wrong argument', 1 ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( 1, 1 ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( BufferNode.alloc( 3 ), 2 ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( new BufferRaw( 3 ), 2 ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( Array, BufferNode.from( [ 3 ] ) ) );

      test.case = 'wrong type of len';
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( [ 1, 2, 3 ], 'wrong type of argument' ) );
      test.shouldThrowErrorSync( () => descriptor.long.makeUndefined( [ 1, 2, 3 ], Infinity ) );
    }
  }
}

longMakeUndefinedWithArrayAndUnrollLongDescriptor.timeOut = 20000;

//

function longMakeUndefinedWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'src = null, not ins';
    var got = descriptor.long.makeUndefined( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor.long.makeUndefined( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor.long.makeUndefined( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor.long.makeUndefined( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = descriptor.long.makeUndefined( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = descriptor.long.makeUndefined( null, _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.long.makeUndefined( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = null';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.long.makeUndefined( src, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.long.makeUndefined( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = descriptor.long.makeUndefined( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src, 4 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = _.argumentsArray.make( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.long.makeUndefined( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = _.argumentsArray.make( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor.long.makeUndefined( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );
    test.true( got !== src );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor.long.makeUndefined( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = descriptor.long.makeUndefined( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }
}

//

function longMakeUndefinedWithBufferTypedLongDescriptor( test )
{
  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  /* tests */

  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeLong )
  {
    test.case = 'src = null, not ins';
    var got = descriptor.long.makeUndefined( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src = number, not ins';
    var got = descriptor.long.makeUndefined( 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* qqq : should throw error : add test cases */
    // test.case = 'src = number, ins = null';
    // var got = descriptor.long.makeUndefined( 5, null );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );
    //
    // test.case = 'src = number, ins = undefined';
    // var got = descriptor.long.makeUndefined( 5, undefined );
    // var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    // test.identical( got, expected );

    test.case = 'src = null, ins - number';
    var got = descriptor.long.makeUndefined( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = null, ins - long';
    var got = descriptor.long.makeUndefined( null, new makeLong( [ 1, 2, 3, 4, 5 ] ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src = empty long, not ins';
    var src = new makeLong( [] );
    var got = descriptor.long.makeUndefined( src );
    var expected = new makeLong( [] );
    test.identical( got, expected );

    test.case = 'src = long, not ins';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src );
    var expected = new makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = null';
    var src = new makeLong( [] );
    var got = descriptor.long.makeUndefined( src, null );
    var expected = new makeLong( 0 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number';
    var src = new makeLong( 10 );
    var got = descriptor.long.makeUndefined( src.constructor, 4 );
    var expected = new makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty long, ins = number';
    var src = new makeLong( [] );
    var got = descriptor.long.makeUndefined( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = number, ins < src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src, 2 );
    var expected = new makeLong( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long with an element, ins = empty array';
    var src = new F64x( 10 );
    var got = descriptor.long.makeUndefined( src, [] );
    var expected = new F64x( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = long, ins = number, ins > src.length';
    var src = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( src, 4 );
    var expected = new makeLong( 4 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length > src.length';
    var src = new makeLong( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.long.makeUndefined( src, ins );
    var expected = new makeLong( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    test.case = 'src = long, ins = array, ins.length === src.length'
    var src = new makeLong( 5 );
    var ins = [ 1, 2, 3, 4, 5 ];
    var got = descriptor.long.makeUndefined( src, ins );
    var expected = new makeLong( 5 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( src.constructor.name === got.constructor.name );

    // test.case = 'src = Array constructor, ins = null';
    // var got = descriptor.long.makeUndefined( Array, null );
    // var expected = [];
    // test.identical( got, expected );
    // test.true( _.arrayIs( got ) );

    test.case = 'src = BufferTyped constructor, ins = number';
    var got = descriptor.long.makeUndefined( U32x, 5 );
    var expected = new U32x( 5 );
    test.identical( got, expected );
    test.true( _.bufferTypedIs(  got ) );

    test.case = 'src = Array constructor, ins = long';
    var ins = new makeLong( [ 1, 2, 3 ] );
    var got = descriptor.long.makeUndefined( Array, ins );
    var expected = [ undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( _.arrayIs( got ) );
    test.true( got !== ins );
  }
}

longMakeUndefinedWithBufferTypedLongDescriptor.timeOut = 20000;

//

// function longMakeZeroedWithArrayAndUnroll( test )
// {
//   var array = ( src ) => _.array.make( src );
//   var unroll = ( src ) => _.unroll.make( src );
//   var longConstr = ( src ) =>
//   {
//     if( src )
//     return _./*longDescriptor*/defaultLong.make( src );
//     return _./*longDescriptor*/defaultLong.make( 0 );
//   }
//   var list =
//   [
//     array,
//     unroll,
//     longConstr,
//   ];
//
//   /* tests */
//
//   for( let t = 0; t < list.length; t++ )
//   {
//     test.open( list[ t ].name );
//     testRun( list[ t ] );
//     test.close( list[ t ].name );
//   }
//
//   /* test subroutine */
//
//   function testRun( makeLong )
//   {
//     test.case = 'src = null, not ins';
//     var got = _.longMakeZeroed( null );
//     var expected = _./*longDescriptor*/defaultLong.make( 0 );
//     test.identical( got, expected );
//
//     test.case = 'src = number, not ins';
//     var got = _.longMakeZeroed( 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* qqq : should throw error : add test cases */
//     // test.case = 'src = number, ins = null';
//     // var got = _.longMakeZeroed( 5, null );
//     // var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//     //
//     // test.case = 'src = number, ins = undefined';
//     // var got = _.longMakeZeroed( 5, undefined );
//     // var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//
//     test.case = 'src = null, ins - number';
//     var got = _.longMakeZeroed( null, 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = null, ins - long';
//     var got = _.longMakeZeroed( null, makeLong( [ 1, 2, 3, 4, 5 ] ) );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, not ins';
//     var src = makeLong( [] );
//     var got = _.longMakeZeroed( src );
//     var expected = makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( src );
//     var expected = makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = null';
//     var src = makeLong( [] );
//     var got = _.longMakeZeroed( src, null );
//     var expected = makeLong( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number';
//     var src = makeLong( 10 );
//     var got = _.longMakeZeroed( src.constructor, 4 );
//     var expected = makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = number';
//     var src = makeLong( [] );
//     var got = _.longMakeZeroed( src, 2 );
//     var expected = makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( src, 2 );
//     var expected = makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = _.longMakeZeroed( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( src, 4 );
//     var expected = makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = makeLong( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = _.longMakeZeroed( src, ins );
//     var expected = makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = makeLong( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = _.longMakeZeroed( src, ins );
//     var expected = makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     // test.case = 'src = Array constructor, ins = null';
//     // var got = _.longMakeZeroed( Array, null );
//     // var expected = [];
//     // test.identical( got, expected );
//     // test.true( _.arrayIs( got ) );
//
//     test.case = 'src = BufferTyped constructor, ins = number';
//     var got = _.longMakeZeroed( U32x, 5 );
//     var expected = new U32x( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( _.bufferTypedIs(  got ) );
//
//     test.case = 'src = Array constructor, ins = long';
//     var ins = makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( Array, ins );
//     var expected = [ 0, 0, 0 ];
//     test.identical( got, expected );
//     test.true( _.arrayIs( got ) );
//     test.true( got !== ins );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.longMakeZeroed() );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( [ 1, 2, 3 ], 4, 'extra argument' ) );
//
//   test.case = 'wrong type of ins';
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( 'wrong argument', 1 ) );
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( 1, 1 ) );
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( BufferNode.alloc( 3 ), 2 ) );
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( new BufferRaw( 3 ), 2 ) );
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( Array, BufferNode.from( [ 3 ] ) ) );
//
//   test.case = 'wrong type of len';
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( [ 1, 2, 3 ], 'wrong type of argument' ) );
//   test.shouldThrowErrorSync( () => _.longMakeZeroed( [ 1, 2, 3 ], Infinity ) );
// }
//
// //
//
// function longMakeZeroedWithArgumentsArray( test )
// {
//   test.case = 'src = null, not ins';
//   var got = _.longMakeZeroed( null );
//   var expected = _./*longDescriptor*/defaultLong.make( 0 );
//   test.identical( got, expected );
//
//   test.case = 'src = number, not ins';
//   var got = _.longMakeZeroed( 5 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//   test.identical( got, expected );
//
//   /* qqq : should throw error : add test cases */
//   // test.case = 'src = number, ins = null';
//   // var got = _.longMakeZeroed( 5, null );
//   // var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//   // test.identical( got, expected );
//   //
//   // test.case = 'src = number, ins = undefined';
//   // var got = _.longMakeZeroed( 5, undefined );
//   // var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//   // test.identical( got, expected );
//
//   test.case = 'src = null, ins - number';
//   var got = _.longMakeZeroed( null, 5 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//   test.identical( got, expected );
//
//   test.case = 'src = null, ins - long';
//   var got = _.longMakeZeroed( null, _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] ) );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//   test.identical( got, expected );
//
//   test.case = 'src = empty long, not ins';
//   var src = _.argumentsArray.make( [] );
//   var got = _.longMakeZeroed( src );
//   var expected = _./*longDescriptor*/defaultLong.make( [] );
//   test.identical( got, expected );
//
//   test.case = 'src = long, not ins';
//   var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//   var got = _.longMakeZeroed( src );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = empty long, ins = null';
//   var src = _.argumentsArray.make( [] );
//   var got = _.longMakeZeroed( src, null );
//   var expected = _./*longDescriptor*/defaultLong.make( 0 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = empty long, ins = number';
//   var src = _.argumentsArray.make( [] );
//   var got = _.longMakeZeroed( src, 2 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = number, ins < src.length';
//   var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//   var got = _.longMakeZeroed( src, 2 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long with an element, ins = empty array';
//   var src = new F64x( 10 );
//   var got = _.longMakeZeroed( src, [] );
//   var expected = new F64x( 0 );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = number, ins > src.length';
//   var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//   var got = _.longMakeZeroed( src, 4 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = array, ins.length > src.length';
//   var src = _.argumentsArray.make( [ 0, 1 ] );
//   var ins = [ 1, 2, 3 ];
//   var got = _.longMakeZeroed( src, ins );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0 ] );
//   test.identical( got, expected );
//   test.true( got !== ins );
//   test.true( got !== src );
//
//   test.case = 'src = long, ins = array, ins.length === src.length'
//   var src = _.argumentsArray.make( 5 );
//   var ins = [ 1, 2, 3, 4, 5 ];
//   var got = _.longMakeZeroed( src, ins );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//   test.identical( got, expected );
//   test.true( got !== src );
//
//   // test.case = 'src = Array constructor, ins = null';
//   // var got = _.longMakeZeroed( Array, null );
//   // var expected = [];
//   // test.identical( got, expected );
//   // test.true( _.arrayIs( got ) );
//
//   test.case = 'src = BufferTyped constructor, ins = number';
//   var got = _.longMakeZeroed( U32x, 5 );
//   var expected = new U32x( [ 0, 0, 0, 0, 0 ] );
//   test.identical( got, expected );
//   test.true( _.bufferTypedIs(  got ) );
//
//   test.case = 'src = Array constructor, ins = long';
//   var ins = _.argumentsArray.make( [ 1, 2, 3 ] );
//   var got = _.longMakeZeroed( Array, ins );
//   var expected = [ 0, 0, 0 ];
//   test.identical( got, expected );
//   test.true( _.arrayIs( got ) );
//   test.true( got !== ins );
// }
//
// //
//
// function longMakeZeroedWithBufferTyped( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     U16x,
//     F32x,
//   ];
//
//   /* tests */
//
//   for( let t = 0; t < list.length; t++ )
//   {
//     test.open( list[ t ].name );
//     testRun( list[ t ] );
//     test.close( list[ t ].name );
//   }
//
//   /* test subroutine */
//
//   function testRun( makeLong )
//   {
//     test.case = 'src = null, not ins';
//     var got = _.longMakeZeroed( null );
//     var expected = _./*longDescriptor*/defaultLong.make( 0 );
//     test.identical( got, expected );
//
//     test.case = 'src = number, not ins';
//     var got = _.longMakeZeroed( 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* qqq : should throw error : add test cases */
//     // test.case = 'src = number, ins = null';
//     // var got = _.longMakeZeroed( 5, null );
//     // var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//     //
//     // test.case = 'src = number, ins = undefined';
//     // var got = _.longMakeZeroed( 5, undefined );
//     // var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//
//     test.case = 'src = null, ins - number';
//     var got = _.longMakeZeroed( null, 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = null, ins - long';
//     var got = _.longMakeZeroed( null, new makeLong( [ 1, 2, 3, 4, 5 ] ) );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, not ins';
//     var src = new makeLong( [] );
//     var got = _.longMakeZeroed( src );
//     var expected = new makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = new makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( src );
//     var expected = new makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = empty long, ins = null';
//     var src = new makeLong( [] );
//     var got = _.longMakeZeroed( src, null );
//     var expected = new makeLong( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number';
//     var src = new makeLong( 10 );
//     var got = _.longMakeZeroed( src.constructor, 4 );
//     var expected = new makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = number';
//     var src = new makeLong( [] );
//     var got = _.longMakeZeroed( src, 2 );
//     var expected = new makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = new makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( src, 2 );
//     var expected = new makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = _.longMakeZeroed( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = new makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( src, 4 );
//     var expected = new makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = new makeLong( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = _.longMakeZeroed( src, ins );
//     var expected = new makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = new makeLong( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = _.longMakeZeroed( src, ins );
//     var expected = new makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     // test.case = 'src = Array constructor, ins = null';
//     // var got = _.longMakeZeroed( Array, null );
//     // var expected = [];
//     // test.identical( got, expected );
//     // test.true( _.arrayIs( got ) );
//
//     test.case = 'src = BufferTyped constructor, ins = number';
//     var got = _.longMakeZeroed( U32x, 5 );
//     var expected = new U32x( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( _.bufferTypedIs(  got ) );
//
//     test.case = 'src = Array constructor, ins = long';
//     var ins = new makeLong( [ 1, 2, 3 ] );
//     var got = _.longMakeZeroed( Array, ins );
//     var expected = [ 0, 0, 0 ];
//     test.identical( got, expected );
//     test.true( _.arrayIs( got ) );
//     test.true( got !== ins );
//   }
// }
//
// //
//
// function longMakeZeroedWithArrayAndUnrollLongDescriptor( test )
// {
//   var array = ( src ) => _.array.make( src );
//   var unroll = ( src ) => _.unroll.make( src );
//   var longConstr = ( src ) =>
//   {
//     if( src )
//     return _./*longDescriptor*/defaultLong.make( src );
//     return _./*longDescriptor*/defaultLong.make( 0 );
//   }
//   var list =
//   [
//     array,
//     unroll,
//     longConstr,
//   ];
//
//   /* tests */
//
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withLong[ name ];
//
//     for( let i = 0; i < list.length; i++ )
//     {
//       test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
//       testRun( descriptor, list[ i ] );
//       test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
//     }
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* test subroutine */
//
//   function testRun( descriptor, makeLong )
//   {
//     test.case = 'src = null, not ins';
//     var got = descriptor.longMakeZeroed( null );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
//     test.identical( got, expected );
//
//     test.case = 'src = number, not ins';
//     var got = descriptor.longMakeZeroed( 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* qqq : should throw error : add test cases */
//     // test.case = 'src = number, ins = null';
//     // var got = descriptor.longMakeZeroed( 5, null );
//     // var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//     //
//     // test.case = 'src = number, ins = undefined';
//     // var got = descriptor.longMakeZeroed( 5, undefined );
//     // var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//
//     test.case = 'src = null, ins - number';
//     var got = descriptor.longMakeZeroed( null, 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = null, ins - long';
//     var got = descriptor.longMakeZeroed( null, makeLong( [ 1, 2, 3, 4, 5 ] ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, not ins';
//     var src = makeLong( [] );
//     var got = descriptor.longMakeZeroed( src );
//     var expected = makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src );
//     var expected = makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = null';
//     var src = makeLong( [] );
//     var got = descriptor.longMakeZeroed( src, null );
//     var expected = makeLong( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number';
//     var src = makeLong( 10 );
//     var got = descriptor.longMakeZeroed( src.constructor, 4 );
//     var expected = makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = number';
//     var src = makeLong( [] );
//     var got = descriptor.longMakeZeroed( src, 2 );
//     var expected = makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src, 2 );
//     var expected = makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = descriptor.longMakeZeroed( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src, 4 );
//     var expected = makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = makeLong( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = descriptor.longMakeZeroed( src, ins );
//     var expected = makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = makeLong( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = descriptor.longMakeZeroed( src, ins );
//     var expected = makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     // test.case = 'src = Array constructor, ins = null';
//     // var got = descriptor.longMakeZeroed( Array, null );
//     // var expected = [];
//     // test.identical( got, expected );
//     // test.true( _.arrayIs( got ) );
//
//     test.case = 'src = BufferTyped constructor, ins = number';
//     var got = descriptor.longMakeZeroed( U32x, 5 );
//     var expected = new U32x( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( _.bufferTypedIs(  got ) );
//
//     test.case = 'src = Array constructor, ins = long';
//     var ins = makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( Array, ins );
//     var expected = [ 0, 0, 0 ];
//     test.identical( got, expected );
//     test.true( _.arrayIs( got ) );
//     test.true( got !== ins );
//
//     /* - */
//
//     if( Config.debug )
//     {
//       test.case = 'without arguments';
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed() );
//
//       test.case = 'extra arguments';
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( [ 1, 2, 3 ], 4, 'extra argument' ) );
//
//       test.case = 'wrong type of ins';
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( 'wrong argument', 1 ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( 1, 1 ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( BufferNode.alloc( 3 ), 2 ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( new BufferRaw( 3 ), 2 ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( Array, BufferNode.from( [ 3 ] ) ) );
//
//       test.case = 'wrong type of len';
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( [ 1, 2, 3 ], 'wrong type of argument' ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeZeroed( [ 1, 2, 3 ], Infinity ) );
//     }
//   }
// }
//
// longMakeZeroedWithArrayAndUnrollLongDescriptor.timeOut = 20000;
//
// //
//
// function longMakeZeroedWithArgumentsArrayLongDescriptor( test )
// {
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withLong[ name ];
//
//     test.open( `descriptor - ${ name }` );
//     testRun( descriptor );
//     test.close( `descriptor - ${ name }` );
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* - */
//
//   function testRun( descriptor )
//   {
//     test.case = 'src = null, not ins';
//     var got = descriptor.longMakeZeroed( null );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
//     test.identical( got, expected );
//
//     test.case = 'src = number, not ins';
//     var got = descriptor.longMakeZeroed( 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* qqq : should throw error : add test cases */
//     // test.case = 'src = number, ins = null';
//     // var got = descriptor.longMakeZeroed( 5, null );
//     // var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//     //
//     // test.case = 'src = number, ins = undefined';
//     // var got = descriptor.longMakeZeroed( 5, undefined );
//     // var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//
//     test.case = 'src = null, ins - number';
//     var got = descriptor.longMakeZeroed( null, 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = null, ins - long';
//     var got = descriptor.longMakeZeroed( null, _.argumentsArray.make( [ 1, 2, 3, 4, 5 ] ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, not ins';
//     var src = _.argumentsArray.make( [] );
//     var got = descriptor.longMakeZeroed( src );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = null';
//     var src = _.argumentsArray.make( [] );
//     var got = descriptor.longMakeZeroed( src, null );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = number';
//     var src = _.argumentsArray.make( [] );
//     var got = descriptor.longMakeZeroed( src, 2 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src, 2 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = descriptor.longMakeZeroed( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src, 4 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = _.argumentsArray.make( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = descriptor.longMakeZeroed( src, ins );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = _.argumentsArray.make( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = descriptor.longMakeZeroed( src, ins );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     // test.case = 'src = Array constructor, ins = null';
//     // var got = descriptor.longMakeZeroed( Array, null );
//     // var expected = [];
//     // test.identical( got, expected );
//     // test.true( _.arrayIs( got ) );
//
//     test.case = 'src = BufferTyped constructor, ins = number';
//     var got = descriptor.longMakeZeroed( U32x, 5 );
//     var expected = new U32x( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( _.bufferTypedIs(  got ) );
//
//     test.case = 'src = Array constructor, ins = long';
//     var ins = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( Array, ins );
//     var expected = [ 0, 0, 0 ];
//     test.identical( got, expected );
//     test.true( _.arrayIs( got ) );
//     test.true( got !== ins );
//   }
// }
//
// //
//
// function longMakeZeroedWithBufferTypedLongDescriptor( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   /* tests */
//
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withLong[ name ];
//
//     for( let i = 0; i < list.length; i++ )
//     {
//       test.open( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
//       testRun( descriptor, list[ i ] );
//       test.close( `descriptor - ${ name }, makeLong - ${ list[ i ].name }` );
//     }
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* test subroutine */
//
//   function testRun( descriptor, makeLong )
//   {
//     test.case = 'src = null, not ins';
//     var got = descriptor.longMakeZeroed( null );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
//     test.identical( got, expected );
//
//     test.case = 'src = number, not ins';
//     var got = descriptor.longMakeZeroed( 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* qqq : should throw error : add test cases */
//     // test.case = 'src = number, ins = null';
//     // var got = descriptor.longMakeZeroed( 5, null );
//     // var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//     //
//     // test.case = 'src = number, ins = undefined';
//     // var got = descriptor.longMakeZeroed( 5, undefined );
//     // var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     // test.identical( got, expected );
//
//     test.case = 'src = null, ins - number';
//     var got = descriptor.longMakeZeroed( null, 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = null, ins - long';
//     var got = descriptor.longMakeZeroed( null, new makeLong( [ 1, 2, 3, 4, 5 ] ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     test.case = 'src = empty long, not ins';
//     var src = new makeLong( [] );
//     var got = descriptor.longMakeZeroed( src );
//     var expected = new makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = 'src = long, not ins';
//     var src = new makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src );
//     var expected = new makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = null';
//     var src = new makeLong( [] );
//     var got = descriptor.longMakeZeroed( src, null );
//     var expected = new makeLong( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number';
//     var src = new makeLong( 10 );
//     var got = descriptor.longMakeZeroed( src.constructor, 4 );
//     var expected = new makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = empty long, ins = number';
//     var src = new makeLong( [] );
//     var got = descriptor.longMakeZeroed( src, 2 );
//     var expected = new makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = number, ins < src.length';
//     var src = new makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src, 2 );
//     var expected = new makeLong( [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long with an element, ins = empty array';
//     var src = new F64x( 10 );
//     var got = descriptor.longMakeZeroed( src, [] );
//     var expected = new F64x( 0 );
//     test.identical( got, expected );
//     test.true( got !== src );
//
//     test.case = 'src = long, ins = number, ins > src.length';
//     var src = new makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( src, 4 );
//     var expected = new makeLong( [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length > src.length';
//     var src = new makeLong( [ 0, 1 ] );
//     var ins = [ 1, 2, 3 ];
//     var got = descriptor.longMakeZeroed( src, ins );
//     var expected = new makeLong( [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== ins );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'src = long, ins = array, ins.length === src.length'
//     var src = new makeLong( 5 );
//     var ins = [ 1, 2, 3, 4, 5 ];
//     var got = descriptor.longMakeZeroed( src, ins );
//     var expected = new makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     // test.case = 'src = Array constructor, ins = null';
//     // var got = descriptor.longMakeZeroed( Array, null );
//     // var expected = [];
//     // test.identical( got, expected );
//     // test.true( _.arrayIs( got ) );
//
//     test.case = 'src = BufferTyped constructor, ins = number';
//     var got = descriptor.longMakeZeroed( U32x, 5 );
//     var expected = new U32x( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( _.bufferTypedIs(  got ) );
//
//     test.case = 'src = Array constructor, ins = long';
//     var ins = new makeLong( [ 1, 2, 3 ] );
//     var got = descriptor.longMakeZeroed( Array, ins );
//     var expected = [ 0, 0, 0 ];
//     test.identical( got, expected );
//     test.true( _.arrayIs( got ) );
//     test.true( got !== ins );
//   }
// }
//
// longMakeZeroedWithBufferTypedLongDescriptor.timeOut = 20000;
//
// //
//
// function longMakeFillingWithArrayAndUnroll( test )
// {
//   var array = ( src ) => _.array.make( src );
//   var unroll = ( src ) => _.unroll.make( src );
//   var longConstr = ( src ) =>
//   {
//     if( src )
//     return _./*longDescriptor*/defaultLong.make( src );
//     return _./*longDescriptor*/defaultLong.make( 0 );
//   }
//   var list =
//   [
//     array,
//     unroll,
//     longConstr,
//   ];
//
//   /* tests */
//
//   for( let t = 0; t < list.length; t++ )
//   {
//     test.open( list[ t ].name );
//     testRun( list[ t ] );
//     test.close( list[ t ].name );
//   }
//
//   /* test subroutine */
//
//   function testRun( makeLong )
//   {
//     test.case = 'value - null, length - number';
//     var got = _.longMakeFilling( null, 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ null, null, null, null, null ] );
//     test.identical( got, expected );
//
//     test.case = `value - zero, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( 0, makeLong( 5 ) );
//     var expected = makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* */
//
//     test.case = 'type - null, value - string, length - number';
//     var got = _.longMakeFilling( null, 'str', 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = 'type - null, value - string, length - BufferTyped';
//     var got = _.longMakeFilling( null, 'str', new U8x( 5 ) );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - number`;
//     var got = _.longMakeFilling( makeLong( 0 ).constructor, [ 1 ], 3 );
//     var expected = makeLong( [ [ 1 ], [ 1 ], [ 1 ] ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - empty ${ makeLong.name }`;
//     var got = _.longMakeFilling( makeLong( 0 ).constructor, [ 1 ], makeLong( 0 ) );
//     var expected = makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - number`;
//     var got = _.longMakeFilling( makeLong( 0 ), { a : 1 }, 3 );
//     var expected = makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( makeLong( 0 ), { a : 1 }, makeLong( 3 ) );
//     var expected = makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - U8x, value - number, length - number`;
//     var got = _.longMakeFilling( U8x, 10, 3 );
//     var expected = new U8x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - I16x, value - number, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( I16x, 10, makeLong( 3 ) );
//     var expected = new I16x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - F32x instance, value - number, length - number`;
//     var got = _.longMakeFilling( new F32x( 10 ), 10, 3 );
//     var expected = new F32x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - F32x instance, value - number, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( new F32x( 10 ), 10, makeLong( 3 ) );
//     var expected = new F32x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.longMakeFilling() );
//
//   test.case = 'not enough arguments';
//   test.shouldThrowErrorSync( () => _.longMakeFilling( null ) );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.longMakeFilling( [ 1, 2, 3 ], 4, 4, 'extra' ) );
//
//   test.case = 'wrong type of type argument';
//   test.shouldThrowErrorSync( () => _.longMakeFilling( {}, 2, 2 ) );
//   test.shouldThrowErrorSync( () => _.longMakeFilling( undefined, 2, 2 ) );
//
//   test.case = 'wrong type of value';
//   test.shouldThrowErrorSync( () => _.longMakeFilling( undefined, 1 ) );
//   test.shouldThrowErrorSync( () => _.longMakeFilling( [], undefined, 1 ) );
//
//   test.case = 'wrong type of length';
//   test.shouldThrowErrorSync( () => _.longMakeFilling( [ 1, 2, 3 ], 'wrong' ) );
//   test.shouldThrowErrorSync( () => _.longMakeFilling( [ 1, 2, 3 ], 2, undefined ) );
// }
//
// //
//
// function longMakeFillingWithArgumentsArray( test )
// {
//   test.case = 'value - null, length - number';
//   var got = _.longMakeFilling( null, 5 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ null, null, null, null, null ] );
//   test.identical( got, expected );
//
//   test.case = `value - zero, length - ArgumentsArray`;
//   var got = _.longMakeFilling( 0, _.argumentsArray.make( 5 ) );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'type - null, value - string, length - number';
//   var got = _.longMakeFilling( null, 'str', 5 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//   test.identical( got, expected );
//
//   test.case = 'type - null, value - string, length - ArgumentsArray';
//   var got = _.longMakeFilling( null, 'str', _.argumentsArray.make( 5 ) );
//   var expected = _./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//   test.identical( got, expected );
//
//   test.case = `type - ArgumentsArray instance, value - map, length - number`;
//   var got = _.longMakeFilling( _.argumentsArray.make( 0 ), { a : 1 }, 3 );
//   var expected = _./*longDescriptor*/defaultLong.make( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//   test.identical( got, expected );
//
//   test.case = `type - ArgumentsArray instance, value - map, length - ArgumentsArray`;
//   var got = _.longMakeFilling( _.argumentsArray.make( 0 ), { a : 1 }, _.argumentsArray.make( 3 ) );
//   var expected = _./*longDescriptor*/defaultLong.make( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//   test.identical( got, expected );
//
//   test.case = `type - U8x, value - number, length - number`;
//   var got = _.longMakeFilling( U8x, 10, 3 );
//   var expected = new U8x( [ 10, 10, 10 ] );
//   test.identical( got, expected );
//
//   test.case = `type - I16x, value - number, length - ArgumentsArray`;
//   var got = _.longMakeFilling( I16x, 10, _.argumentsArray.make( 3 ) );
//   var expected = new I16x( [ 10, 10, 10 ] );
//   test.identical( got, expected );
//
//   test.case = `type - F32x instance, value - number, length - number`;
//   var got = _.longMakeFilling( new F32x( 10 ), 10, 3 );
//   var expected = new F32x( [ 10, 10, 10 ] );
//   test.identical( got, expected );
//
//   test.case = `type - F32x instance, value - number, length - ArgumentsArray`;
//   var got = _.longMakeFilling( new F32x( 10 ), 10, _.argumentsArray.make( 3 ) );
//   var expected = new F32x( [ 10, 10, 10 ] );
//   test.identical( got, expected );
//
//   /* */
//
//   if( !Config.debug )
//   return;
//
//   test.case = `type - ArgumentsArray constructor, value - array, length - number`;
//   test.shouldThrowErrorSync( () => _.longMakeFilling( _.argumentsArray.make( 0 ).constructor, [ 1 ], 3 ) );
// }
//
// //
//
// function longMakeFillingWithBufferTyped( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     U16x,
//     F32x,
//   ];
//
//   /* tests */
//
//   for( let t = 0; t < list.length; t++ )
//   {
//     test.open( list[ t ].name );
//     testRun( list[ t ] );
//     test.close( list[ t ].name );
//   }
//
//   /* test subroutine */
//
//
//   function testRun( makeLong )
//   {
//     test.case = 'value - null, length - number';
//     var got = _.longMakeFilling( null, 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ null, null, null, null, null ] );
//     test.identical( got, expected );
//
//     test.case = `value - zero, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( 0, new makeLong( 5 ) );
//     var expected = new makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* */
//
//     test.case = 'type - null, value - string, length - number';
//     var got = _.longMakeFilling( null, 'str', 5 );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = 'type - null, value - string, length - BufferTyped';
//     var got = _.longMakeFilling( null, 'str', new U8x( 5 ) );
//     var expected = _./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - number`;
//     var got = _.longMakeFilling( new makeLong, [ 1 ], 3 );
//     var expected = new makeLong( [ [ 1 ], [ 1 ], [ 1 ] ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - empty ${ makeLong.name }`;
//     var got = _.longMakeFilling( new makeLong, [ 1 ], new makeLong( 0 ) );
//     var expected = new makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - number`;
//     var got = _.longMakeFilling( new makeLong( 0 ), { a : 1 }, 3 );
//     var expected = new makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( new makeLong( 0 ), { a : 1 }, new makeLong( 3 ) );
//     var expected = new makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - Array, value - number, length - number`;
//     var got = _.longMakeFilling( Array, 10, 3 );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//
//     test.case = `type - Array, value - number, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( Array, 10, new makeLong( 3 ) );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//
//     test.case = `type - Array instance, value - number, length - number`;
//     var got = _.longMakeFilling( new Array( 10 ), 10, 3 );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//
//     test.case = `type - Array instance, value - number, length - ${ makeLong.name }`;
//     var got = _.longMakeFilling( new Array( 10 ), 10, new makeLong( 3 ) );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//   }
// }
//
// //
//
// function longMakeFillingWithArrayAndUnrollLongDescriptor( test )
// {
//   var array = ( src ) => _.array.make( src );
//   var unroll = ( src ) => _.unroll.make( src );
//   var longConstr = ( src ) =>
//   {
//     if( src )
//     return _./*longDescriptor*/defaultLong.make( src );
//     return _./*longDescriptor*/defaultLong.make( 0 );
//   }
//   var list =
//   [
//     array,
//     unroll,
//     longConstr,
//   ];
//
//   /* tests */
//
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withLong[ name ];
//
//     for( let i = 0; i < list.length; i++ )
//     {
//       test.open( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//       testRun( descriptor, list[ i ] );
//       test.close( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//     }
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* test subroutine */
//
//   function testRun( descriptor, makeLong )
//   {
//     test.case = 'value - null, length - number';
//     var got = descriptor.longMakeFilling( null, 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ null, null, null, null, null ] );
//     test.identical( got, expected );
//
//     test.case = `value - zero, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( 0, makeLong( 5 ) );
//     var expected = makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* */
//
//     test.case = 'type - null, value - string, length - number';
//     var got = descriptor.longMakeFilling( null, 'str', 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = 'type - null, value - string, length - BufferTyped';
//     var got = descriptor.longMakeFilling( null, 'str', new U8x( 5 ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - number`;
//     var got = descriptor.longMakeFilling( makeLong( 0 ).constructor, [ 1 ], 3 );
//     var expected = makeLong( [ [ 1 ], [ 1 ], [ 1 ] ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - empty ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( makeLong( 0 ).constructor, [ 1 ], makeLong( 0 ) );
//     var expected = makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - number`;
//     var got = descriptor.longMakeFilling( makeLong( 0 ), { a : 1 }, 3 );
//     var expected = makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( makeLong( 0 ), { a : 1 }, makeLong( 3 ) );
//     var expected = makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - U8x, value - number, length - number`;
//     var got = descriptor.longMakeFilling( U8x, 10, 3 );
//     var expected = new U8x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - I16x, value - number, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( I16x, 10, makeLong( 3 ) );
//     var expected = new I16x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - F32x instance, value - number, length - number`;
//     var got = descriptor.longMakeFilling( new F32x( 10 ), 10, 3 );
//     var expected = new F32x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - F32x instance, value - number, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( new F32x( 10 ), 10, makeLong( 3 ) );
//     var expected = new F32x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     /* - */
//
//     if( Config.debug )
//     {
//       test.case = 'without arguments';
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling() );
//
//       test.case = 'not enough arguments';
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( null ) );
//
//       test.case = 'extra arguments';
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( [ 1, 2, 3 ], 4, 4, 'extra' ) );
//
//       test.case = 'wrong type of type argument';
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( {}, 2, 2 ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( undefined, 2, 2 ) );
//
//       test.case = 'wrong type of value';
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( undefined, 1 ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( [], undefined, 1 ) );
//
//       test.case = 'wrong type of length';
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( [ 1, 2, 3 ], 'wrong' ) );
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( [ 1, 2, 3 ], 2, undefined ) );
//     }
//   }
// }
//
// longMakeFillingWithArrayAndUnrollLongDescriptor.timeOut = 15000;
//
// //
//
// function longMakeFillingWithArgumentsArrayLongDescriptor( test )
// {
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withLong[ name ];
//
//     test.open( `descriptor - ${ name }` );
//     testRun( descriptor );
//     test.close( `descriptor - ${ name }` );
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* test subroutine */
//
//   function testRun( descriptor )
//   {
//     test.case = 'value - null, length - number';
//     var got = descriptor.longMakeFilling( null, 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ null, null, null, null, null ] );
//     test.identical( got, expected );
//
//     test.case = `value - zero, length - ArgumentsArray`;
//     var got = descriptor.longMakeFilling( 0, _.argumentsArray.make( 5 ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* */
//
//     test.case = 'type - null, value - string, length - number';
//     var got = descriptor.longMakeFilling( null, 'str', 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = 'type - null, value - string, length - ArgumentsArray';
//     var got = descriptor.longMakeFilling( null, 'str', _.argumentsArray.make( 5 ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = `type - ArgumentsArray instance, value - map, length - number`;
//     var got = descriptor.longMakeFilling( _.argumentsArray.make( 0 ), { a : 1 }, 3 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - ArgumentsArray instance, value - map, length - ArgumentsArray`;
//     var got = descriptor.longMakeFilling( _.argumentsArray.make( 0 ), { a : 1 }, _.argumentsArray.make( 3 ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - U8x, value - number, length - number`;
//     var got = descriptor.longMakeFilling( U8x, 10, 3 );
//     var expected = new U8x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - I16x, value - number, length - ArgumentsArray`;
//     var got = descriptor.longMakeFilling( I16x, 10, _.argumentsArray.make( 3 ) );
//     var expected = new I16x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - F32x instance, value - number, length - number`;
//     var got = descriptor.longMakeFilling( new F32x( 10 ), 10, 3 );
//     var expected = new F32x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     test.case = `type - F32x instance, value - number, length - ArgumentsArray`;
//     var got = descriptor.longMakeFilling( new F32x( 10 ), 10, _.argumentsArray.make( 3 ) );
//     var expected = new F32x( [ 10, 10, 10 ] );
//     test.identical( got, expected );
//
//     /* */
//
//     if( Config.debug )
//     {
//       test.case = `type - ArgumentsArray constructor, value - array, length - number`;
//       test.shouldThrowErrorSync( () => descriptor.longMakeFilling( _.argumentsArray.make( 0 ).constructor, [ 1 ], 3 ) );
//     }
//   }
// }
//
// //
//
// function longMakeFillingWithBufferTypedLongDescriptor( test )
// {
//   var list =
//   [
//     I8x,
//     U16x,
//     U16x,
//     F32x,
//   ];
//
//   /* tests */
//
//   let times = 4;
//   for( let e in _.LongDescriptors )
//   {
//     let name = _.LongDescriptors[ e ].name;
//     let descriptor = _.withLong[ name ];
//
//     for( let i = 0; i < list.length; i++ )
//     {
//       test.open( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//       testRun( descriptor, list[ i ] );
//       test.close( `descriptor - ${ name }, long - ${ list[ i ].name }` );
//     }
//
//     if( times < 1 )
//     break;
//     times--;
//   }
//
//   /* test subroutine */
//
//   function testRun( descriptor, makeLong )
//   {
//     test.case = 'value - null, length - number';
//     var got = descriptor.longMakeFilling( null, 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ null, null, null, null, null ] );
//     test.identical( got, expected );
//
//     test.case = `value - zero, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( 0, new makeLong( 5 ) );
//     var expected = new makeLong( [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//
//     /* */
//
//     test.case = 'type - null, value - string, length - number';
//     var got = descriptor.longMakeFilling( null, 'str', 5 );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = 'type - null, value - string, length - BufferTyped';
//     var got = descriptor.longMakeFilling( null, 'str', new U8x( 5 ) );
//     var expected = descriptor./*longDescriptor*/defaultLong.make( [ 'str', 'str', 'str', 'str', 'str' ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - number`;
//     var got = descriptor.longMakeFilling( new makeLong, [ 1 ], 3 );
//     var expected = new makeLong( [ [ 1 ], [ 1 ], [ 1 ] ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } constructor, value - array, length - empty ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( new makeLong, [ 1 ], new makeLong( 0 ) );
//     var expected = new makeLong( [] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - number`;
//     var got = descriptor.longMakeFilling( new makeLong( 0 ), { a : 1 }, 3 );
//     var expected = new makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - ${ makeLong.name } instance, value - map, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( new makeLong( 0 ), { a : 1 }, new makeLong( 3 ) );
//     var expected = new makeLong( [ { a : 1 }, { a : 1 }, { a : 1 } ] );
//     test.identical( got, expected );
//
//     test.case = `type - Array, value - number, length - number`;
//     var got = descriptor.longMakeFilling( Array, 10, 3 );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//
//     test.case = `type - Array, value - number, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( Array, 10, new makeLong( 3 ) );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//
//     test.case = `type - Array instance, value - number, length - number`;
//     var got = descriptor.longMakeFilling( new Array( 10 ), 10, 3 );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//
//     test.case = `type - Array instance, value - number, length - ${ makeLong.name }`;
//     var got = descriptor.longMakeFilling( new Array( 10 ), 10, new makeLong( 3 ) );
//     var expected = new Array( 10, 10, 10 );
//     test.identical( got, expected );
//   }
// }
//
// longMakeFillingWithBufferTypedLongDescriptor.timeOut = 15000;

//

function longFrom( test )
{
  test.case = 'null';
  var src = null;
  var got = _.long.from( src );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );

  test.case = 'number';
  var src = 2;
  var got = _.long.from( src );
  test.identical( got, [ undefined, undefined ] );
  test.true( _.arrayIs( got ) );

  test.case = 'empty array';
  var src = [];
  var got = _.long.from( src );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );
  test.true( got === src );

  test.case = 'filled array';
  var src = [ 1, '', 'abc', undefined, null, false, true, 0 ];
  var got = _.long.from( src );
  test.identical( got, [ 1, '', 'abc', undefined, null, false, true, 0 ] );
  test.true( _.arrayIs( got ) );
  test.true( got === src );

  test.case = 'empty unroll';
  var src = _.unroll.make( [] );
  var got = _.long.from( src );
  test.identical( got, [] );
  test.true( _.arrayIs( got ) );
  test.true( got === src );

  test.case = 'filled unroll';
  var src = _.unroll.make( [ 1, '', 'abc', undefined, null, false, true, 0 ] );
  var got = _.long.from( src );
  test.identical( got, [ 1, '', 'abc', undefined, null, false, true, 0 ] );
  test.true( _.arrayIs( got ) );
  test.true( got === src );

  test.case = 'empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.long.from( src );
  test.identical( got, _.argumentsArray.make( [] ) );
  test.true( _.argumentsArray.is( got ) );
  test.true( got === src );

  test.case = 'filled argumentsArray';
  var src = _.argumentsArray.make( [ 1, '', 'abc', undefined, null, false, true, 0 ] );
  var got = _.long.from( src );
  test.identical( got, _.argumentsArray.make( [ 1, '', 'abc', undefined, null, false, true, 0 ] ) );
  test.true( _.argumentsArray.is( got ) );
  test.true( got === src );

  test.case = 'empty BufferTyped';
  var src = new U8x( [] );
  var got = _.long.from( src );
  test.identical( got, new U8x( [] ) );
  test.true( _.bufferTypedIs( got ) );
  test.true( got === src );

  var src = new I16x( [] );
  var got = _.long.from( src );
  test.identical( got, new I16x( [] ) );
  test.true( _.bufferTypedIs( got ) );
  test.true( got === src );

  test.case = 'filled BufferTyped';
  var src = new F32x( [ 1, 2, 3, 4, 0 ] );
  var got = _.long.from( src );
  test.identical( got, new F32x([ 1, 2, 3, 4, 0 ]) );
  test.true( _.bufferTypedIs( got ) );
  test.true( got === src );

  var src = new F64x( [ 1, 2, 3, 4, 0 ] );
  var got = _.long.from( src );
  test.identical( got, new F64x([ 1, 2, 3, 4, 0 ]) );
  test.true( _.bufferTypedIs( got ) );
  test.true( got === src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.long.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.long.from( 1, [] ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.long.from( 'str' ) );
  test.shouldThrowErrorSync( () => _.long.from( { 1 : 2 } ) );
}
//

function longSlice( test )
{

  test.open( 'Array' );
  runFor( makeArray );
  test.close( 'Array' );

  /* - */

  test.open( 'ArgumentsArray' );
  runFor( makeU8 );
  test.close( 'ArgumentsArray' );

  /* - */

  test.open( 'F32x' );
  runFor( makeF32 );
  test.close( 'F32x' );

  /* - */

  test.open( 'U8x' );
  runFor( makeU8 );
  test.close( 'U8x' );

  /* instance makers */

  function makeArray( src )
  {
    return _.array.make( src );
  }

  function makeArgumentsArray( src )
  {
    return arguments;
  }

  function makeF32( src )
  {
    var result = new F32x( src );
    return result;
  }

  function makeU8( src )
  {
    var result = new U8x( src );
    return result;
  }

  /* test routine */

  function runFor( makeLong )
  {
    test.open( 'src - empty long' );

    test.case = 'not start and end';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 0 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end - 0';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 0, 0 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end > src.length';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 0, 5 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end - -1';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 0, -1 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    /* */

    test.case = 'start > 0';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 2 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start > 0, end === start';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 2, 2 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start > 0, end > src.length';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 2, 5 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start > 0, end < start';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, 2, -1 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    /* */

    test.case = 'start < 0';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, -2 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, end === start';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, -2, -2 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, end > src.length';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, -2, 5 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, end < start';
    var srcLong = makeLong();
    var got = _.longSlice( srcLong, -2, -4 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.close( 'src - empty long' );

    /* - */

    test.open( 'src - filled long' );

    test.case = 'not start and end';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong );
    var expected = makeLong( [ 1, 2, 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 0 );
    var expected = makeLong( [ 1, 2, 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - undefined, end - 0';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, undefined, 0 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end - 0';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 0, 0 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - undefined, end < src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, undefined, 3 );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end < src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 0, 3 );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - undefined, end > src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, undefined, 5 );
    var expected = makeLong( [ 1, 2, 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end > src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 0, 5 );
    var expected = makeLong( [ 1, 2, 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - undefined, end - -1';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, undefined, -1 );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end - -1';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 0, -1 );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    /* */

    test.case = '0 < start < src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 2 );
    var expected = makeLong( [ 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start > src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 5 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start < src.length, end === start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 2, 2 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start > src.length, end === start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 5, 5 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start < src.length, end < src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 2, 3 );
    var expected = makeLong( [ 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start > src.length, end < src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 5, 3 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start < src.length, end > src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 2, 5 );
    var expected = makeLong( [ 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start > src.length, end > src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 5, 7 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start < src.length, end < start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 2, -1 );
    var expected = makeLong( [ 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start > src.length, end < start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 5, -1 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    /* */

    test.case = 'start < 0, src.length > |start|';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -2 );
    var expected = makeLong( [ 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length < |start|';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -5 );
    var expected = makeLong( [ 1, 2, 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length > |start|, end === start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -2, -2 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length < |start|, end === start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -5, -5 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length > |start|, end < src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -2, 3 );
    var expected = makeLong( [ 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length < |start|, end < src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -5, 3 );
    var expected = makeLong( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length > |start|, end > src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -2, 5 );
    var expected = makeLong( [ 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length < |start|, end > src.length';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -5, 5 );
    var expected = makeLong( [ 1, 2, 3, 4 ] );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length > |start|, end < start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -2, -4 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length < |start|, end < start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -5, -7 );
    var expected = makeLong();
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.close( 'src - filled long' );

    /* - */

    if( !Config.debug )
    return;

    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => _.longSlice() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => _.longSlice( [ 1, 2, 3 ], 1, 2, 'extra' ) );

    test.case = 'array is not long';
    test.shouldThrowErrorSync( () => _.longSlice( 'x' ) );
    test.shouldThrowErrorSync( () => _.longSlice( new BufferRaw() ) );

    test.case = 'f is not number';
    test.shouldThrowErrorSync( () => _.longSlice( [ 1 ], 'x', 1 ) );

    test.case = 'l is not number';
    test.shouldThrowErrorSync( () => _.longSlice( [ 1 ], 0, 'x' ) );
  }

}

longSlice.timeOut = 20000;

//

// function identical( test )
// {
//   test.case = 'empty arrays';
//   var got = _.long.identical( [], [] );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'arrays are equal';
//   var got = _.long.identical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
//   var expected = true;
//   test.identical( got, expected );
//
//   test.case = 'array-like arguments';
//   function src1()
//   {
//     return arguments;
//   };
//   function src2()
//   {
//     return arguments;
//   };
//   var got = _.long.identical( src1( 3, 7, 33 ), src2( 3, 7, 13 ) );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'arrays are not equal';
//   var got = _.long.identical( [ 1, 2, 3, 'Hi!' ], [ 1, 2, 3, 'Hello there!' ] );
//   var expected = false;
//   test.identical( got, expected );
//
//   test.case = 'arrays length are not equal';
//   var got = _.long.identical( [ 1, 2, 3 ], [ 1, 2 ] );
//   var expected = false;
//   test.identical( got, expected );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'no arguments';
//   test.shouldThrowErrorSync( function()
//   {
//     _.long.identical();
//   });
//
//   test.case = 'not enough arguments';
//   test.shouldThrowErrorSync( function()
//   {
//     _.long.identical( [ 1, 2, 3 ] );
//   });
//
//   test.case = 'extra argument';
//   test.shouldThrowErrorSync( function()
//   {
//     _.long.identical( [ 1, 2, 3 ], [ 1, 2 ], 'redundant argument' );
//   });
// };

//

function longLeftIndex( test )
{
  test.case = 'nothing';
  var got = _.longLeftIndex( [], 3 );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'second index';
  var got = _.longLeftIndex( [ 1, 2, 3 ], 3 );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'zero index';
  var got = _.longLeftIndex( [ 1, 2, 3 ], 3, ( el, ins ) => el < ins );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'nothing';
  var got = _.longLeftIndex( [ 1, 2, 3 ], 4 );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'nothing';
  var got = _.longLeftIndex( [ 1, 2, 3 ], 3, ( el, ins ) => el > ins );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'array-like arguments';
  function arr()
  {
    return arguments;
  }
  var _arr = arr( 3, 7, 13 );
  var got = _.longLeftIndex( _arr, 13 );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'fromIndex';
  var got = _.longLeftIndex( [ 0, 0, 0, 0 ], 0, 0 );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'fromIndex';
  var got = _.longLeftIndex( [ 0, 0, 0, 0 ], 0, 3 );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'fromIndex';
  var got = _.longLeftIndex( [ 0, 0, 0, 0 ], 0, -1 );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'fromIndex + evaluator';
  var got = _.longLeftIndex( [ 1, 1, 2, 2, 3, 3 ], 3, 2, ( el, ins ) => el < ins );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'fromIndex + evaluator x2';
  var evaluator1 = ( el ) => el + 1;
  var evaluator2 = ( ins ) => ins * 2;
  var got = _.longLeftIndex( [ 6, 6, 5, 5 ], 3, 2, evaluator1, evaluator2 );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'evaluator search first element of array';
  var evaluator = ( e ) => e[ 0 ];
  var got = _.longLeftIndex( [ 1, 2, 3, [ 2 ], 3, [ 4 ] ], [ 2 ], evaluator );
  var expected = 3;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'one argument';
  test.shouldThrowErrorSync( function()
  {
    var got = _.longLeftIndex( [ 1, 2, 3 ] );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.longLeftIndex();
  });

  test.case = 'third argument is wrong';
  test.shouldThrowErrorSync( function()
  {
    _.longLeftIndex( [ 1, 2, 3 ], 2, 'wrong argument' );
  });

};

//

function longRightIndex( test )
{

  test.case = 'nothing';
  var got = _.longRightIndex( [], 3 );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'second index';
  var got = _.longRightIndex( [ 1, 2, 3 ], 3 );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'zero index';
  var got = _.longRightIndex( [ 1, 2, 3 ], 3, function( el, ins ) { return el < ins } );
  var expected = 1;
  test.identical( got, expected );

  test.case = 'nothing';
  var got = _.longRightIndex( [ 1, 2, 3 ], 4 );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'nothing';
  var got = _.longRightIndex( [ 1, 2, 3 ], 3, function( el, ins ) { return el > ins } );
  var expected = -1;
  test.identical( got, expected );

  test.case = 'array-like arguments';
  function arr()
  {
    return arguments;
  }
  var _arr = arr( 3, 7, 13 );
  var got = _.longRightIndex( _arr, 13 );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'fifth index';
  var got = _.longRightIndex( 'abcdef', 'e', function( el, ins ) { return el > ins } );
  var expected = 5;
  test.identical( got, expected );

  test.case = 'third index';
  var got = _.longRightIndex( 'abcdef', 'd' );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'second index';
  var got = _.longRightIndex( 'abcdef', 'c', function( el ) { return el; } );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'fromIndex';
  var got = _.longRightIndex( [ 0, 0, 0, 0 ], 0, 0 );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'fromIndex';
  var got = _.longRightIndex( [ 0, 0, 0, 0 ], 0, 3 );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'fromIndex';
  var got = _.longRightIndex( [ 0, 1, 1, 0 ], 0, 1 );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'fromIndex';
  var got = _.longRightIndex( [ 0, 1, 1, 0 ], 1, 2 );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'fromIndex + evaluator';
  var got = _.longRightIndex( [ 1, 1, 2, 2, 3, 3 ], 3, 4, ( el, ins ) => el < ins );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'fromIndex + evaluator x2';
  var evaluator1 = ( el ) => el + 1;
  var evaluator2 = ( ins ) => ins * 2;
  var got = _.longRightIndex( [ 6, 6, 5, 5 ], 3, 2, evaluator1, evaluator2 );
  var expected = 2;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'one argument';
  test.shouldThrowErrorSync( function()
  {
    var got = _.longRightIndex( [ 1, 2, 3 ] );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.longRightIndex();
  });

  test.case = 'third argument is wrong';
  test.shouldThrowErrorSync( function()
  {
    _.longRightIndex( [ 1, 2, 3 ], 2, 'wrong argument' );
  });

};

//

function longLeft( test )
{
  test.case = 'empty array';
  var src = [];
  var got = _.longLeft( src, 1 );
  test.identical( got, { index : -1 } );

  test.case = 'array has not searched element';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3 );
  test.identical( got, { index : -1 } );

  test.case = 'array has duplicated searched element';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, { a : 2 } ];
  var got = _.longLeft( src, 3 );
  test.identical( got, { index : 2, element : 3 } );

  test.case = 'searches complex data without evaluators';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, [ 3 ] );
  test.identical( got, { index : -1 } );

  /* */

  test.case = 'array has not searched element, fromIndex';
  var src = [ 1, 2, 3, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, 4 );
  test.identical( got, { index : -1 } );

  test.case = 'array has duplicated searched element, fromIndex';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longLeft( src, 'str', 4 );
  test.identical( got, { index : 6, element : 'str' } );

  test.case = 'searches complex data, fromIndex';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, [ 3 ], 2 );
  test.identical( got, { index : -1 } );

  /* */

  test.case = 'array has not searched element, onEvaluate1';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, ( e ) => typeof e );
  test.identical( got, { index : 0, element : 1 } );

  test.case = 'array has duplicated searched element, onEvaluate1';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longLeft( src, 'str', ( e ) => e );
  test.identical( got, { index : 3, element : 'str' } );

  test.case = 'searches complex data, onEvaluate1';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, [ 3 ], ( e ) => e[ 0 ] );
  test.identical( got, { index : 3, element : [ 3 ] } );

  /* */

  test.case = 'array has not searched element, fromIndex, onEvaluate1';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, 2, ( e ) => typeof e );
  test.identical( got, { index : -1 } );

  test.case = 'array has duplicated searched element, fromIndex, onEvaluate1';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longLeft( src, 'str', 4, ( e ) => typeof e );
  test.identical( got, { index : 6, element : 'str' } );

  test.case = 'searches complex data, onEvaluate1';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, [ 3 ], 4, ( e ) => e[ 0 ] );
  test.identical( got, { index : -1 } );

  /* */

  test.case = 'array has not searched element, onEvaluate1, onEvaluate2';
  var src =[ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : 3, element : [ 3 ] } );

  test.case = 'array has duplicated searched element, onEvaluate1, onEvaluate2';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longLeft( src, 2, ( e ) => e.a, ( ins ) => ins );
  test.identical( got, { index : 7, element : { a : 2 } } );

  test.case = 'searches complex data, onEvaluate, onEvaluate2';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : 3, element : [ 3 ] } );

  /* */

  test.case = 'array has not searched element, fromIndex, onEvaluate1, onEvaluate2';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, 2, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : 3, element : [ 3 ] } );

  test.case = 'array has duplicated searched element, fromIndex, onEvaluate1, onEvaluate2';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longLeft( src, 2, 7, ( e ) => e.a, ( ins ) => ins );
  test.identical( got, { index : 7, element : { a : 2 } } );

  test.case = 'searches complex data, fromIndex, onEvaluate, onEvaluate2';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, 4, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : -1 } );

  /* */

  test.case = 'array has not searched element, equalizer';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, ( e, ins ) => e[ 0 ] === ins );
  test.identical( got, { index : 3, element : [ 3 ] } );

  test.case = 'array has duplicated searched element, equalizer';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longLeft( src, 2, ( e, ins ) => e.a === ins );
  test.identical( got, { index : 7, element : { a : 2 } } );

  test.case = 'searches complex data, equalizer';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longLeft( src, 3, ( e, ins ) => e[ 0 ] ===  ins );
  test.identical( got, { index : 3, element : [ 3 ] } );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.longLeft() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.longLeft( [ 1, 2 ], 1, 0, ( e ) => e, ( ins ) => ins, 'extra' ) );

  test.case = 'fromIndex is not a number';
  test.shouldThrowErrorSync( () => _.longLeft( [ 1, 2 ], 1, 'wrong' ) );

  test.case = 'onEvaluate1 is not a routine, not a number';
  test.shouldThrowErrorSync( () => _.longLeft( [ 1, 2 ], 1, 0, 'wrong' ) );

  test.case = 'onEvaluate1 has wrong length';
  test.shouldThrowErrorSync( () => _.longLeft( [ 1, 2 ], 1, 0, () => 1 ) );

  test.case = 'onEvaluate2 has wrong length';
  test.shouldThrowErrorSync( () => _.longLeft( [ 1, 2 ], 1, 0, ( e ) => e, () => 1 ) );
}

//

function longRight( test )
{
  test.case = 'empty array';
  var src = [];
  var got = _.longRight( src, 1 );
  test.identical( got, { index : -1 } );

  test.case = 'array has not searched element';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3 );
  test.identical( got, { index : -1 } );

  test.case = 'array has duplicated searched element';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, { a : 2 } ];
  var got = _.longRight( src, 3 );
  test.identical( got, { index : 5, element : 3 } );

  test.case = 'searches complex data without evaluators';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, [ 3 ] );
  test.identical( got, { index : -1 } );

  /* */

  test.case = 'array has not searched element, fromIndex';
  var src = [ 1, 2, 3, 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, 4 );
  test.identical( got, { index : 2, element : 3 } );

  test.case = 'array has duplicated searched element, fromIndex';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longRight( src, 'str', 4 );
  test.identical( got, { index : 3, element : 'str' } );

  test.case = 'searches complex data, fromIndex';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, [ 3 ], 2 );
  test.identical( got, { index : -1 } );

  /* */

  test.case = 'array has not searched element, onEvaluate1';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, ( e ) => typeof e );
  test.identical( got, { index : 1, element : 2 } );

  test.case = 'array has duplicated searched element, onEvaluate1';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longRight( src, 'str', ( e ) => e );
  test.identical( got, { index : 6, element : 'str' } );

  test.case = 'searches complex data, onEvaluate1';
  var src = [ 1, 2, [ 3 ], 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, [ 3 ], ( e ) => e[ 0 ] );
  test.identical( got, { index : 4, element : [ 3 ] } );

  /* */

  test.case = 'array has not searched element, fromIndex, onEvaluate1';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, 2, ( e ) => typeof e );
  test.identical( got, { index : 1, element : 2 } );

  test.case = 'array has duplicated searched element, fromIndex, onEvaluate1';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longRight( src, 'str', 4, ( e ) => typeof e );
  test.identical( got, { index : 3, element : 'str' } );

  test.case = 'searches complex data, onEvaluate1';
  var src = [ 1, 2, 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, [ 3 ], 4, ( e ) => e[ 0 ] );
  test.identical( got, { index : 3, element : [ 3 ] } );

  /* */

  test.case = 'array has not searched element, onEvaluate1, onEvaluate2';
  var src =[ 1, 2, [ 3 ], 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : 4, element : [ 3 ] } );

  test.case = 'array has duplicated searched element, onEvaluate1, onEvaluate2';
  var src = [ 1, 2, 3, { a : 2 }, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longRight( src, 2, ( e ) => e.a, ( ins ) => ins );
  test.identical( got, { index : 8, element : { a : 2 } } );

  test.case = 'searches complex data, onEvaluate, onEvaluate2';
  var src = [ 1, 2, [ 3 ], 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : 4, element : [ 3 ] } );

  /* */

  test.case = 'array has not searched element, fromIndex, onEvaluate1, onEvaluate2';
  var src = [ 1, 2, [ 3 ], 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, 2, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : 2, element : [ 3 ] } );

  test.case = 'array has duplicated searched element, fromIndex, onEvaluate1, onEvaluate2';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longRight( src, 2, 7, ( e ) => e.a, ( ins ) => ins );
  test.identical( got, { index : 7, element : { a : 2 } } );

  test.case = 'searches complex data, fromIndex, onEvaluate, onEvaluate2';
  var src = [ 1, 2, [ 3, 4 ], 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, 4, ( e ) => e[ 0 ], ( ins ) => ins );
  test.identical( got, { index : 4, element : [ 3 ] } );

  /* */

  test.case = 'array has not searched element, equalizer';
  var src = [ 1, 2, [ 3 ], 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, ( e, ins ) => e[ 0 ] === ins );
  test.identical( got, { index : 4, element : [ 3 ] } );

  test.case = 'array has duplicated searched element, equalizer';
  var src = [ 1, 2, 3, 'str', [ 3 ], 3, 'str', { a : 2 } ];
  var got = _.longRight( src, 2, ( e, ins ) => e.a === ins );
  test.identical( got, { index : 7, element : { a : 2 } } );

  test.case = 'searches complex data, equalizer';
  var src = [ 1, 2, [ 3 ], 'str', [ 3 ], { a : 2 } ];
  var got = _.longRight( src, 3, ( e, ins ) => e[ 0 ] ===  ins );
  test.identical( got, { index : 4, element : [ 3 ] } );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.longRight() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.longRight( [ 1, 2 ], 1, 0, ( e ) => e, ( ins ) => ins, 'extra' ) );

  test.case = 'fromIndex is not a number';
  test.shouldThrowErrorSync( () => _.longRight( [ 1, 2 ], 1, 'wrong' ) );

  test.case = 'onEvaluate1 is not a routine, not a number';
  test.shouldThrowErrorSync( () => _.longRight( [ 1, 2 ], 1, 0, 'wrong' ) );

  test.case = 'onEvaluate1 has wrong length';
  test.shouldThrowErrorSync( () => _.longRight( [ 1, 2 ], 1, 0, () => 1 ) );

  test.case = 'onEvaluate2 has wrong length';
  test.shouldThrowErrorSync( () => _.longRight( [ 1, 2 ], 1, 0, ( e ) => e, () => 1 ) );
}

// --
//
// --

const Proto =
{

  name : 'Tools.Long.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // long l0/l3

    is,
    like,

    // long, l0/l5

    makeCommon,

    longMakeWithArrayAndUnroll,
    longMakeWithArgumentsArray,
    longMakeWithBufferTyped,
    // longMakeWithArrayAndUnrollLongDescriptor, /* Dmytro : longDescriptor does not exists anymore */
    // longMakeWithArgumentsArrayLongDescriptor,
    // longMakeWithBufferTypedLongDescriptor,

    longMakeEmptyWithArrayAndUnroll,
    longMakeEmptyWithArgumentsArray,
    longMakeEmptyWithBufferTyped,
    // longMakeEmptyWithArrayAndUnrollLongDescriptor,
    // longMakeEmptyWithArgumentsArrayLongDescriptor,
    // longMakeEmptyWithBufferTypedLongDescriptor,

    // _longMakeOfLengthWithArrayAndUnroll, /* Dmytro : should be removed, routines do not exist and not used */
    // _longMakeOfLengthWithArgumentsArray,
    // _longMakeOfLengthWithBufferTyped,
    // _longMakeOfLengthWithArrayAndUnrollLongDescriptor,
    // _longMakeOfLengthWithArgumentsArrayLongDescriptor,
    // _longMakeOfLengthWithBufferTypedLongDescriptor,

    longMakeUndefinedWithArrayAndUnroll,
    longMakeUndefinedWithArgumentsArray,
    longMakeUndefinedWithBufferTyped,
    // longMakeUndefinedWithArrayAndUnrollLongDescriptor,
    // longMakeUndefinedWithArgumentsArrayLongDescriptor,
    // longMakeUndefinedWithBufferTypedLongDescriptor,

    // longMakeZeroedWithArrayAndUnroll,
    // longMakeZeroedWithArgumentsArray,
    // longMakeZeroedWithBufferTyped,
    // longMakeZeroedWithArrayAndUnrollLongDescriptor,
    // longMakeZeroedWithArgumentsArrayLongDescriptor,
    // longMakeZeroedWithBufferTypedLongDescriptor,
    //
    // longMakeFillingWithArrayAndUnroll,
    // longMakeFillingWithArgumentsArray,
    // longMakeFillingWithBufferTyped,
    // longMakeFillingWithArrayAndUnrollLongDescriptor,
    // longMakeFillingWithArgumentsArrayLongDescriptor,
    // longMakeFillingWithBufferTypedLongDescriptor,

    //

    longFrom,

    // longSlice,

    // identical,

    longLeftIndex,
    longRightIndex,

    longLeft,
    longRight,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
