( function _l0_l9_Primitive_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

function dichotomy( test )
{

  test.case = 'check Symbol';
  test.identical( _.primitive.is( Symbol( 'a' ) ), true );
  test.identical( _.primitive.like( Symbol( 'a' ) ), true );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Primitive.l0.l9',
  silencing : 1,

  tests :
  {

    dichotomy,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
