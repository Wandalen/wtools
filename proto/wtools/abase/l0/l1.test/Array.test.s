( function _l0_l1_Array_test_s_()
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
//
//--

/* qqq : for junior : extend with other checks */
function dichotomy( test )
{

  test.case = 'an empty array';
  var got = _.arrayIs( [] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.arrayIs( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.arrayIs( {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'number';
  var got = _.arrayIs( 6 );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.arrayIs( 'abc' );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'boolean';
  var got = _.arrayIs( true );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'function';
  var got = _.arrayIs( function(){  } );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'a pseudo array';
  var got = ( function()
  {
    return _.arrayIs( arguments );
  } )('Hello there!');
  var expected = false;
  test.identical( got, expected );

  test.case = 'no argument';
  var got = _.arrayIs();
  var expected  = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.arrayIs( null );
  var expected  = false;
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;
}

//

function aptLeft( test )
{

  /* */

  test.case = 'left';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptLeft( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 0, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptLeft( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 1, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src
    ],
    [
      2,
      1,
      1,
      src
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptLeft( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 2, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src
    ],
    [
      2,
      1,
      1,
      src
    ],
    [
      3,
      2,
      2,
      src
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptLeft( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 3, 2, 2, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src
    ],
    [
      2,
      1,
      1,
      src
    ],
    [
      3,
      2,
      2,
      src
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = [];
  var ops = [];
  var got = _.array.aptLeft( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, -1, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = [ 1, 2, 3 ];
  var exp = [ 1, 0, 0, true ];
  var got = _.array.aptLeft( src );
  test.identical( got, exp );
  var exp = [ 1, 0, 0, true ];
  var got = _.array.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = [];
  var exp = [ undefined, -1, -1, false ];
  var got = _.array.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, -1, -1, false ];
  var got = _.array.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRight( test )
{

  /* */

  test.case = 'left';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptRight( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 0, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src
    ],
    [
      2,
      1,
      1,
      src
    ],
    [
      1,
      0,
      0,
      src
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptRight( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 1, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src
    ],
    [
      2,
      1,
      1,
      src
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptRight( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 2, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = [ 1, 2, 3 ];
  var ops = [];
  var got = _.array.aptRight( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 1, 0, 0, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src
    ],
    [
      2,
      1,
      1,
      src
    ],
    [
      1,
      0,
      0,
      src
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = [];
  var ops = [];
  var got = _.array.aptRight( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, -1, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = [ 1, 2, 3 ];
  var exp = [ 3, 2, 2, true ];
  var got = _.array.aptRight( src );
  test.identical( got, exp );
  var exp = [ 3, 2, 2, true ];
  var got = _.array.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = [];
  var exp = [ undefined, -1, -1, false ];
  var got = _.array.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, -1, -1, false ];
  var got = _.array.last( src );
  test.identical( got, exp );

  /* */

}

// --
// maker
// --

function arrayMake( test )
{
  test.case = 'without arguments';
  var got = _.array.make();
  var expected = [];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );

  // test.case = 'src = undefined';
  // var src = undefined;
  // var got = _.array.make( src );
  // var expected = [];
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = null';
  var src = null;
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = empty array';
  var src = [];
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = array, src.length = 1';
  var src = [ 0 ];
  var got = _.array.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = array, src.length > 1';
  var src = [ 1, 2, 3 ];
  var got = _.array.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = number, src = 0';
  var got = _.array.make( 0 );
  var expected = new Array( 0 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = number, src > 0';
  var got = _.array.make( 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = null, length = 3';
  var got = _.array.make( null, 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = array, length = 3';
  var got = _.array.make( [], 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty U8x';
  var src = new U8x();
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = U8x, src.length = 1';
  var src = new U8x( 1 );
  var got = _.array.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = U8x, src.length > 1';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.array.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty I16x';
  var src = new I16x();
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = I16x, src.length = 1';
  var src = new I16x( 1 );
  var got = _.array.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = I16x, src.length > 1';
  var src = new I16x( [ 1, 2, 3 ] );
  var got = _.array.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty F32x';
  var src = new F32x();
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = F32x, src.length = 1';
  var src = new F32x( 1 );
  var got = _.array.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = F32x, src.length > 1';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.array.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty arguments array';
  var src = _.argumentsArray.make( [] );
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = arguments array, src.length = 1';
  var src = _.argumentsArray.make( [ {} ] );
  var got = _.array.make( src );
  var expected = [ {} ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = arguments array, src.length > 1';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.array.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty unroll';
  var src = _.unroll.make( [] );
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  test.case = 'src = unroll, src.length = 1';
  var src = _.unroll.make( [ 'str' ] );
  var got = _.array.make( src );
  var expected = [ 'str' ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  test.case = 'src = unroll, src.length > 1';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.array.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty Set';
  var src = new Set( [] );
  var got = _.array.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  test.case = 'src = Set, src.length = 1';
  var src = new Set( [ 'str' ] );
  var got = _.array.make( src );
  var expected = [ 'str' ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = Set, src.length > 1';
  var src = new Set( [ 1, 2, 3 ] );
  var got = _.array.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.array.make( 1, 3 ) );
  // test.shouldThrowErrorSync( () => _.array.make( [], 3 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.array.make( {} ) );
  test.shouldThrowErrorSync( () => _.array.make( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.array.make( undefined ) );
  test.shouldThrowErrorSync( () => _.array.make( [], undefined ) );

}

//

/* qqq : for junior : rewrite test routines arrayMake* with subroutine typeEach(). ask */
function arrayMakeUndefined( test )
{
  test.case = 'without arguments';
  var got = _.array.makeUndefined();
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );

  test.case = 'src = null';
  var src = null;
  var got = _.array.makeUndefined( src );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = null, length = null';
  // var src = null;
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array();
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = null, length = number';
  var src = null;
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = null, length = long';
  var src = null;
  var got = _.array.makeUndefined( src, [ 1, 2, 3, 4 ] );
  var expected = new Array( 4 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = number, src = 0';
  var got = _.array.makeUndefined( 0 );
  var expected = new Array( 0 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = number, src = 0, length > src';
  // var got = _.array.makeUndefined( 0, 2 );
  // var expected = new Array( 2 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );
  //
  // test.case = 'src = number, src = 0, length - long';
  // var got = _.array.makeUndefined( 0, [ 1, 2, 3 ] );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = number, src > 0';
  var got = _.array.makeUndefined( 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = number, length = null';
  // var src = 2;
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 2 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );
  //
  // test.case = 'src = number, src > 0, length < src';
  // var got = _.array.makeUndefined( 3, 1 );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );
  //
  // test.case = 'src = number, src > 0, length - empty long';
  // var got = _.array.makeUndefined( 3, [] );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  /* */

  test.case = 'src = empty array';
  var src = [];
  var got = _.array.makeUndefined( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = empty array, length = null';
  // var src = [];
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = empty array, length = 2';
  var src = [];
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = empty array, length = long';
  var src = [];
  var got = _.array.makeUndefined( src, _.unroll.make( [ 0, 1, 2, 3 ] ) );
  var expected = new Array( 4 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = array, src.length = 1';
  var src = [ 0 ];
  var got = _.array.makeUndefined( src );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = array, src.length = 1, length = null';
  // var src = [ 0 ];
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = array, src.length = 1, length = 2';
  var src = [ 0 ];
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = array, src.length = 1, length = long';
  var src = [ 0 ];
  var got = _.array.makeUndefined( src, [ 1, 2, 3 ] );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = array, src.length > 1';
  var src = [ 1, 2, 3 ];
  var got = _.array.makeUndefined( src );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = array, src.length > 1, length - null';
  // var src = [ 1, 2, 3 ];
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = array, src.length > 1, length < src.length';
  var src = [ 1, 2, 3 ];
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = array, src.length > 1, length - long';
  var src = [ 1, 2, 3 ];
  var got = _.array.makeUndefined( src, [ 5 ] );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty U8x';
  var src = new U8x();
  var got = _.array.makeUndefined( src );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = empty U8x, length = null';
  // var src = new U8x();
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = empty U8x, length = 2';
  var src = new U8x();
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = U8x, src.length = 1';
  var src = new U8x( 1 );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = U8x, src.length = 1, length = null';
  // var src = new U8x( 1 );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = U8x, src.length = 1, length > src.length';
  var src = new U8x( 1 );
  var got = _.array.makeUndefined( src, 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = U8x, src.length > 1';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = U8x, src.length > 1, length < src.length';
  // var src = new U8x( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = U8x, src.length > 1, length < src.length';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, 0 );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = U8x, src.length > 1, length - long';
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, [ 0 ] );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty I16x';
  var src = new I16x();
  var got = _.array.makeUndefined( src );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = empty I16x, length = null';
  // var src = new I16x();
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = empty I16x, length = 2';
  var src = new I16x();
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = I16x, src.length = 1';
  var src = new I16x( 1 );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = I16x, src.length = 1, length = null';
  // var src = new I16x( 1 );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = I16x, src.length = 1, length > src.length';
  var src = new I16x( 1 );
  var got = _.array.makeUndefined( src, 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = I16x, src.length > 1';
  var src = new I16x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = I16x, src.length > 1, length = null';
  // var src = new I16x( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = I16x, src.length > 1, length < src.length';
  var src = new I16x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, 0 );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = I16x, src.length > 1, length - empty long';
  var src = new I16x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, [] );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty F32x';
  var src = new F32x();
  var got = _.array.makeUndefined( src );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = empty F32x, length = null';
  // var src = new F32x();
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = empty F32x, length = 2';
  var src = new F32x();
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = F32x, src.length = 1';
  var src = new F32x( 1 );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = F32x, src.length = 1, length = null';
  // var src = new F32x( 1 );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = F32x, src.length = 1, length > src.length';
  var src = new F32x( 1 );
  var got = _.array.makeUndefined( src, 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = F32x, src.length > 1';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = F32x, src.length > 1, length = null';
  // var src = new F32x( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = F32x, src.length > 1, length < src.length';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, 0 );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = F32x, src.length > 1, length - long';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, [ 1, 2, 3, 4, 5 ] );
  var expected = new Array( 5 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty arguments array';
  var src = _.argumentsArray.make( [] );
  var got = _.array.makeUndefined( src );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  // test.case = 'src = empty arguments array, length = null';
  // var src = _.argumentsArray.make( [] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.argumentsArray.is( got ) );
  // test.true( src !== got );

  test.case = 'src = empty arguments array, length > 0';
  var src = _.argumentsArray.make( [] );
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = arguments array, src.length = 1';
  var src = _.argumentsArray.make( [ {} ] );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  // test.case = 'src = arguments array, src.length = 1, length = null';
  // var src = _.argumentsArray.make( [ {} ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.argumentsArray.is( got ) );
  // test.true( src !== got );

  test.case = 'src = arguments array, src.length = 1, length > src.length';
  var src = _.argumentsArray.make( [ {} ] );
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = arguments array, src.length > 1';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  // test.case = 'src = arguments array, src.length > 1, length = null';
  // var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.argumentsArray.is( got ) );
  // test.true( src !== got );

  test.case = 'src = arguments array, src.length > 1, length < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, 1 );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = arguments array, src.length > 1, length - long';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, [ 0, 0, 0 ] );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty unroll';
  var src = _.unroll.make( [] );
  var got = _.array.makeUndefined( src );
  var expected = new Array();
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  // test.case = 'src = empty unroll, length = null';
  // var src = _.unroll.make( [] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.unrollIs( got ) );
  // test.true( src !== got );

  test.case = 'src = empty unroll, length = 2';
  var src = _.unroll.make( [] );
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  test.case = 'src = unroll, src.length = 1';
  var src = _.unroll.make( [ 'str' ] );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  // test.case = 'src = unroll, src.length = 1, length = null';
  // var src = _.unroll.make( [ 'str' ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.unrollIs( got ) );
  // test.true( src !== got );

  test.case = 'src = unroll, src.length = 1, length > src.length';
  var src = _.unroll.make( [ 'str' ] );
  var got = _.array.makeUndefined( src, 2 );
  var expected = new Array( 2 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  test.case = 'src = unroll, src.length > 1';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  // test.case = 'src = unroll, src.length > 1, length = null';
  // var src = _.unroll.make( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.unrollIs( got ) );
  // test.true( src !== got );

  test.case = 'src = unroll, src.length > 1, length < src.length';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, 1 );
  var expected = new Array( 1 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  test.case = 'src = unroll, src.length > 1, length - long';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.array.makeUndefined( src, [] );
  var expected = new Array( 0 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.unrollIs( got ) );
  test.true( src !== got );

  /* */

  // test.case = 'src = empty Set';
  // var src = new Set( [] );
  // var got = _.array.makeUndefined( src );
  // var expected = new Array();
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );

  // test.case = 'src = empty Set, length = null';
  // var src = new Set( [] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 0 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );

  // test.case = 'src = empty Set, length = 2';
  // var src = new Set( [] );
  // var got = _.array.makeUndefined( src, 2 );
  // var expected = new Array( 2 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );
  //
  // test.case = 'src = Set, src.size = 1';
  // var src = new Set( [ 'str' ] );
  // var got = _.array.makeUndefined( src );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );
  //
  // // test.case = 'src = Set, src.length = 1, length = null';
  // var src = new Set( [ 'str' ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );

  // test.case = 'src = Set, src.length = 1, length > src.length';
  // var src = new Set( [ 'str' ] );
  // var got = _.array.makeUndefined( src, 2 );
  // var expected = new Array( 2 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );
  //
  // test.case = 'src = unroll, src.length > 1';
  // var src = new Set( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );

  // test.case = 'src = unroll, src.length > 1, length = null';
  // var src = new Set( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, null );
  // var expected = new Array( 3 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );

  // test.case = 'src = unroll, src.length > 1, length < src.length';
  // var src = new Set( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, 1 );
  // var expected = new Array( 1 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );
  //
  // test.case = 'src = unroll, src.length > 1, length - long';
  // var src = new Set( [ 1, 2, 3 ] );
  // var got = _.array.makeUndefined( src, [ 1, 2, 3, 4, 5, 6 ] );
  // var expected = new Array( 6 );
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( !_.set.is( got ) );
  // test.true( src !== got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.array.makeUndefined( 1, 3 ) );
  test.shouldThrowErrorSync( () => _.array.makeUndefined( 1, [] ) );
  test.shouldThrowErrorSync( () => _.array.makeUndefined( 1, 3, 'extra' ) );
  test.shouldThrowErrorSync( () => _.array.makeUndefined( [], 3, 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.array.makeUndefined( {} ) );
  test.shouldThrowErrorSync( () => _.array.makeUndefined( 'wrong' ) );

  test.case = 'wrong type of length';
  test.shouldThrowErrorSync( () => _.array.makeUndefined( [], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.array.makeUndefined( [], {} ) );
  test.shouldThrowErrorSync( () => _.array.makeUndefined( [], null ) );
  test.shouldThrowErrorSync( () => _.array.makeUndefined( 1, null ) );

}

arrayMakeUndefined.timeOut = 15000;

//

function arrayFrom( test )
{
  test.case = 'src = null';
  var src = null;
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  // test.case = 'src = undefined';
  // var src = undefined;
  // var got = _.array.from( src );
  // var expected = [];
  // test.equivalent( got, expected );
  // test.true( _.arrayIs( got ) );
  // test.true( src !== got );

  test.case = 'src = number';
  var src = 5;
  var got = _.array.from( src );
  var expected = new Array( 5 );
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = empty array';
  var src = [];
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src === got );

  test.case = 'src = empty unroll';
  var src = _.unroll.make( [] );
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( _.unrollIs( got ) );
  test.true( src === got );

  test.case = 'src = empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = empty I8x';
  var src = new I8x();
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = empty U16x';
  var src = new U16x();
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = empty F32x';
  var src = new F32x();
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = array, src.length = 1';
  var src = [ 1 ];
  var got = _.array.from( src );
  var expected = [ 1 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src === got );

  test.case = 'src = unroll, src.length = 1';
  var src = _.unroll.make( [ 1 ] );
  var got = _.array.from( src );
  var expected = [ 1 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( _.unrollIs( got ) );
  test.true( src === got );

  test.case = 'src = argumentsArray, src.length = 1';
  var src = _.argumentsArray.make( [ 'str' ] );
  var got = _.array.from( src );
  var expected = [ 'str' ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = I8x, src.length = 1';
  var src = new I8x( [ 1 ] );
  var got = _.array.from( src );
  var expected = [ 1 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = U16x, src.length = 1';
  var src = new U16x( [ 1 ] );
  var got = _.array.from( src );
  var expected = [ 1 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = F32x, src.length = 1';
  var src = new F32x( [ 2 ] );
  var got = _.array.from( src );
  var expected = [ 2 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = array, src.length > 1';
  var src = [ 1, 2, 'str' ];
  var got = _.array.from( src );
  var expected = [ 1, 2, 'str' ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src === got );

  test.case = 'src = unroll, src.length = 1';
  var src = _.unroll.make( [ 1, 2, 'str' ] );
  var got = _.array.from( src );
  var expected = [ 1, 2, 'str' ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( _.unrollIs( got ) );
  test.true( src === got );

  test.case = 'src = argumentsArray, src.length = 1';
  var src = _.argumentsArray.make( [ 1, 2, 'str' ] );
  var got = _.array.from( src );
  var expected = [ 1, 2, 'str' ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( !_.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src = I8x, src.length = 1';
  var src = new I8x( [ 1, 2, 3 ] );
  var got = _.array.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = U16x, src.length = 1';
  var src = new U16x( [ 1, 2, 3 ] );
  var got = _.array.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  test.case = 'src = F32x, src.length = 1';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.array.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src = array from _.array.make, src = empty array';
  var src = _.array.make( [] );
  var got = _.array.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src === got );

  test.case = 'src = array from _.array.make, src.length = 1';
  var src = _.array.make( [ 'a' ] );
  var got = _.array.from( src );
  var expected = [ 'a' ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src === got );

  test.case = 'src = array from _.array.make, src.length > 1';
  var src = _.array.make( [ 1, 2, 3 ] );
  var got = _.array.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.arrayIs( got ) );
  test.true( src === got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.array.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.array.from( 1, 3 ) );
  test.shouldThrowErrorSync( () => _.array.from( [], 3 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.array.from( {} ) );
  test.shouldThrowErrorSync( () => _.array.from( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.array.from( undefined ) );

}

// --
//
// --

const Proto =
{

  name : 'Tools.Array.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    dichotomy,

    // maker

    arrayMake,
    arrayMakeUndefined,
    arrayFrom,

  }

}

/* qqq for Dmytro : this test suite fails with shoulding:0. check also other test suites */

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
