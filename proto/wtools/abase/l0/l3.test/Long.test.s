( function _l0_l3_Long_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

//--
// long
//--

function identical( test )
{
  test.case = 'empty arrays';
  var got = _.long.identical( [], [] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'arrays are equal';
  var got = _.long.identical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'array-like arguments';
  function src1()
  {
    return arguments;
  };
  function src2()
  {
    return arguments;
  };
  var got = _.long.identical( src1( 3, 7, 33 ), src2( 3, 7, 13 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'arrays are not equal';
  var got = _.long.identical( [ 1, 2, 3, 'Hi!' ], [ 1, 2, 3, 'Hello there!' ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'arrays length are not equal';
  var got = _.long.identical( [ 1, 2, 3 ], [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.long.identical() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.long.identical( [ 1, 2, 3 ] ) );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.long.identical( [ 1, 2, 3 ], [ 1, 2 ], {}, 'extra' ) );
};

// --
//
// --

const Proto =
{

  name : 'Tools.Long.l0.l3',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // long l0/l3

    identical,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
