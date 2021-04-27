( function _l0_l5_Long_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include5.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

//--
// long
//--

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
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 0 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end - 0';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 0, 0 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end > src.length';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 0, 5 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end - -1';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 0, -1 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    /* */

    test.case = 'start > 0';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 2 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start > 0, end === start';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 2, 2 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start > 0, end > src.length';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 2, 5 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start > 0, end < start';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, 2, -1 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    /* */

    test.case = 'start < 0';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, -2 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, end === start';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, -2, -2 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, end > src.length';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, -2, 5 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, end < start';
    var srcLong = makeLong( null );
    var got = _.longSlice( srcLong, -2, -4 );
    var expected = makeLong( null );
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
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start - 0, end - 0';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 0, 0 );
    var expected = makeLong( null );
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
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start < src.length, end === start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 2, 2 );
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = '0 < start > src.length, end === start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, 5, 5 );
    var expected = makeLong( null );
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
    var expected = makeLong( null );
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
    var expected = makeLong( null );
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
    var expected = makeLong( null );
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
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length < |start|, end === start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -5, -5 );
    var expected = makeLong( null );
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
    var expected = makeLong( null );
    test.identical( got, expected );
    test.true( srcLong !== got );

    test.case = 'start < 0, src.length < |start|, end < start';
    var srcLong = makeLong( [ 1, 2, 3, 4 ] );
    var got = _.longSlice( srcLong, -5, -7 );
    var expected = makeLong( null );
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

// --
//
// --

const Proto =
{

  name : 'Tools.Long.l0.l5',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // long, l0/l5

    longSlice,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
