( function _l0_l9_Pair_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

//--
// tests
//--

function is( test )
{
  test.case = 'an empty array';
  var got = _.pair.is( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a pair';
  var got = _.pair.is( [ 1, [] ] );
  var expected  = true;
  test.identical( got, expected );

  test.case = 'a pair, but not array';
  var got = _.pair.is( new F32x([ 1, 3 ]) );
  var expected  = true;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.pair.is( {} );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'number';
  var got = _.pair.is( 6 );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.pair.is( 'abc' );
  var expected  = false;
  test.identical( got, expected );
}

//

function instanceOf( test )
{
  test.case = 'an empty array';
  var got = [] instanceof _.pair;
  var expected = false;
  test.identical( got, expected );

  test.case = 'a pair';
  var got = [ 1, [] ] instanceof _.pair;
  var expected  = true;
  test.identical( got, expected );

  test.case = 'a pair, but not array';
  var src = new F32x([ 1, 3 ]);
  var got = src instanceof _.pair;
  var expected  = true;
  test.identical( got, expected );

  test.case = 'object';
  var got = {} instanceof _.pair;
  var expected  = false;
  test.identical( got, expected );

  test.case = 'number';
  var got = 6 instanceof _.pair;
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = 'abc' instanceof _.pair;
  var expected  = false;
  test.identical( got, expected );
}

//

function isOf( test )
{
  test.case = 'an empty array';
  var got = _.pair.isOf( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a pair';
  var got = _.pair.isOf( [ 1, [] ], Array );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'a pair of arrays';
  var got = _.pair.isOf( [ [ 1 ], [] ], Array );
  var expected  = true;
  test.identical( got, expected );

  test.case = 'a pair, but not array';
  var got = _.pair.isOf( new F32x([ 1, 3 ]) );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'a pair, but not array';
  var got = _.pair.isOf( new F32x([ 1, 3 ]), Array );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.pair.isOf( {}, Array );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'number';
  var got = _.pair.isOf( 6, Array );
  var expected  = false;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.pair.isOf( 'abc', Array );
  var expected  = false;
  test.identical( got, expected );
}

//

function make( test )
{
  test.case = 'no arguments';
  var got = _.pair.make();
  var expected = [ undefined, undefined ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );

  test.case = 'single argument - array';
  var src = [ 'x', 3 ];
  var got = _.pair.make( src );
  var expected = [ 'x', 3 ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - F32x';
  var src = new F32x([ 1, 3 ]);
  var got = _.pair.make( src );
  var expected = new F32x([ 1, 3 ]);
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - array - zero length';
  var src = [];
  var got = _.pair.make( src );
  var expected = [ undefined, undefined ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - F32x - zero length';
  var src = new F32x([]);
  var got = _.pair.make( src );
  var expected = new F32x([ 0, 0 ]);
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - Array';
  var got = _.pair.make( Array );
  var expected = [ undefined, undefined ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );

  test.case = 'single argument - F32x';
  var got = _.pair.make( F32x );
  var expected = new F32x([ 0, 0 ]);
  test.identical( got, expected );
  test.true( _.pair.is( got ) );

  test.case = 'two arguments';
  var got = _.pair.make( 'x', 3 );
  var expected = [ 'x', 3 ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () =>
  {
    test.case = 'single argument - Array - length 1';
    var src = new Array([ 1 ]);
    var got = _.pair.make( src );
  });

  test.shouldThrowErrorSync( () =>
  {
    test.case = 'single argument - F32x - length 1';
    var src = new F32x([ 1 ]);
    var got = _.pair.make( src );
  });
}

//

function construct( test )
{

  test.case = 'no arguments';
  var got = new _.pair;
  var expected = [ undefined, undefined ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );

  test.case = 'single argument - array';
  var src = [ 'x', 3 ];
  var got = new _.pair( src );
  var expected = [ 'x', 3 ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - F32x';
  var src = new F32x([ 1, 3 ]);
  var got = new _.pair( src );
  var expected = new F32x([ 1, 3 ]);
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - array - zero length';
  var src = [];
  var got = new _.pair( src );
  var expected = [ undefined, undefined ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - F32x - zero length';
  var src = new F32x([]);
  var got = new _.pair( src );
  var expected = new F32x([ 0, 0 ]);
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  test.case = 'single argument - Array';
  var got = new _.pair( Array );
  var expected = [ undefined, undefined ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );

  test.case = 'single argument - F32x';
  var got = new _.pair( F32x );
  var expected = new F32x([ 0, 0 ]);
  test.identical( got, expected );
  test.true( _.pair.is( got ) );

  test.case = 'two arguments';
  var got = new _.pair( 'x', 3 );
  var expected = [ 'x', 3 ];
  test.identical( got, expected );
  test.true( _.pair.is( got ) );
  test.true( src !== got );

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () =>
  {
    test.case = 'single argument - Array - length 1';
    var src = new Array([ 1 ]);
    var got = new _.pair( src );
  });

  test.shouldThrowErrorSync( () =>
  {
    test.case = 'single argument - F32x - length 1';
    var src = new F32x([ 1 ]);
    var got = new _.pair( src );
  });

}

// --
//
// --

const Proto =
{

  name : 'Tools.Pair.l0.l9',
  silencing : 1,

  tests :
  {

    is,
    instanceOf,
    isOf,

    make,
    construct,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
