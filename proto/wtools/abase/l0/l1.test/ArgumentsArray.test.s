( function _l0_l1_ArgumentsArray_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

//--
// tests
//--

function dichotomy( test )
{

  test.case = 'argumentsArray from empty array';
  var src = _.argumentsArray.make( [] );
  test.true( _.argumentsArray.is( src ) );
  test.true( _.argumentsArray.like( src ) );
  test.true( !_.array.is( src ) );
  test.true( !_.array.like( src ) );

  test.case = 'array';
  var src = [ 1, 2, 3 ];
  test.true( !_.argumentsArray.is( src ) );
  test.true( _.argumentsArray.like( src ) );
  test.true( _.array.is( src ) );
  test.true( _.array.like( src ) );

}

//

function make( test )
{
  test.case = 'without arguments';
  var got = _.argumentsArray.make();
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );

  test.case = 'src - null';
  var got = _.argumentsArray.make( null );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );

  test.case = 'src - number, zero';
  var got = _.argumentsArray.make( 0 );
  var expected = new Array( 0 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - number, src > 0';
  var got = _.argumentsArray.make( 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty array';
  var src = [];
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with single element';
  var src = [ 0 ];
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with several elements';
  var src = [ 1, 2, 3 ];
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty unroll';
  var src = _.unroll.make( [] );
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with single element';
  var src = _.unroll.make( [ 0 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with several elements';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - argumentsArray with single element';
  var src = _.argumentsArray.make( [ 0 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - argumentsArray with several elements';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty BufferTyped';
  var src = new U8x( [] );
  var got = _.argumentsArray.make( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with single element';
  var src = new I16x( [ 0 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with several elements';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.argumentsArray.make( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.argumentsArray.make( 1, 3 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.argumentsArray.make( {} ) );
  test.shouldThrowErrorSync( () => _.argumentsArray.make( 'wrong' ) );
}

//

function from( test )
{
  test.case = 'src - null';
  var got = _.argumentsArray.from( null );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );

  test.case = 'src - number, zero';
  var got = _.argumentsArray.from( 0 );
  var expected = new Array( 0 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - number, src > 0';
  var got = _.argumentsArray.from( 3 );
  var expected = new Array( 3 );
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty array';
  var src = [];
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with single element';
  var src = [ 0 ];
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - array with several elements';
  var src = [ 1, 2, 3 ];
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty unroll';
  var src = _.unroll.make( [] );
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with single element';
  var src = _.unroll.make( [ 0 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - unroll with several elements';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* */

  test.case = 'src - empty argumentsArray';
  var src = _.argumentsArray.make( [] );
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src === got );

  test.case = 'src - argumentsArray with single element';
  var src = _.argumentsArray.make( [ 0 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src === got );

  test.case = 'src - argumentsArray with several elements';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src === got );

  /* */

  test.case = 'src - empty BufferTyped';
  var src = new U8x( [] );
  var got = _.argumentsArray.from( src );
  var expected = [];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with single element';
  var src = new I16x( [ 0 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 0 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  test.case = 'src - BufferTyped with several elements';
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.argumentsArray.from( src );
  var expected = [ 1, 2, 3 ];
  test.equivalent( got, expected );
  test.true( _.argumentsArray.is( got ) );
  test.true( src !== got );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.argumentsArray.from() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.argumentsArray.from( 1, 3 ) );
  test.shouldThrowErrorSync( () => _.argumentsArray.from( [], 3 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.argumentsArray.from( {} ) );
  test.shouldThrowErrorSync( () => _.argumentsArray.from( 'wrong' ) );
}

// --
//
// --

const Proto =
{

  name : 'Tools.ArgumentsArray.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {
    dichotomy,
    make,
    from,
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
