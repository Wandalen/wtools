( function _l0_l1_HashMap_test_s_()
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

  /* */

  test.case = 'hashmap';
  var src = new HashMap();
  test.true( _.hashMap.is( src ) );
  test.true( _.hashMap.like( src ) );

  /* */

  test.case = 'map.pure';
  var src = Object.create( null );
  test.true( !_.hashMap.is( src ) );
  test.true( !_.hashMap.like( src ) );

  /* */

  test.case = 'map.polluted';
  var src = {};
  test.true( !_.hashMap.is( src ) );
  test.true( !_.hashMap.like( src ) );

  /* */

  test.case = 'set';
  var src = new Set;
  test.true( !_.hashMap.is( src ) );
  test.true( !_.hashMap.like( src ) );

  /* */

  test.case = 'undefined';
  var src = undefined;
  test.true( !_.hashMap.is( src ) );
  test.true( !_.hashMap.like( src ) );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.HashMap.l0.l1', /* xxx : make optional name. deduce if not defined */
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
