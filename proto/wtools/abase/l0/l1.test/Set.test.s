( function _l0_l1_Set_test_s_()
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
// tests
// --

function dichotomy( test )
{

  test.case = 'empty set';
  var src = new Set();
  test.true( _.set.is( src ) );
  test.true( _.set.like( src ) );

  test.case = 'populated set';
  var src = new Set([ 1, 2 ]);
  test.true( _.set.is( src ) );
  test.true( _.set.like( src ) );

  test.case = 'array';
  var src = [ 1, 2 ];
  test.true( !_.set.is( src ) );
  test.true( !_.set.like( src ) );

  test.case = 'arguments array';
  var src = _.argumentsArray.from([ 1, 2 ]);
  test.true( !_.set.is( src ) );
  test.true( !_.set.like( src ) );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Set.l0.l1',
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
