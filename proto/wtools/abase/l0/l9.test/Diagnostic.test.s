( function _l0_l9_Diagnostic_test_s_()
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

function structureGenerate( test )
{

  test.case = 'implicity call';
  var got = _.diagnostic.structureGenerate();
  test.true( _.mapIs( got.result ) );
  test.identical( got.result[ 'number.big' ], 1 << 30 );
  test.true( _.number.is( got.size ) );

  test.case = 'defaultComplexity : 5, depth : 3';
  var got = _.diagnostic.structureGenerate({ defaultComplexity : 5, depth : 3 });
  test.true( _.mapIs( got.result ) );
  test.true( _.hashMap.is( got.result.hashMap ) );
  test.true( _.set.is( got.result.set ) );

}

structureGenerate.timeOut = 50000;

// --
//
// --

const Proto =
{

  name : 'Tools.Diagnostic',
  silencing : 1,
  enabled : 1,

  tests :
  {
    structureGenerate,
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
