( function _l0_l9_Props_test_s()
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

//--
// implementation
//--

/* qqq : for junior : extend */
function dichotomy( test )
{

  /* */

  test.case = 'map.pure';
  var src = Object.create( null );
  test.true( _.props.is( src ) );
  test.true( _.props.like( src ) );

  /* */

  test.case = 'map.polluted';
  var src = {};
  test.true( _.props.is( src ) );
  test.true( _.props.like( src ) );

  /* */

  test.case = 'number';
  var src = 13;
  test.true( _.props.is( src ) );
  test.true( _.props.like( src ) );

  /* */

}

// --
// define test suite
// --

const Proto =
{

  name : 'Tools.Props.l0.l9',
  silencing : 1,

  tests :
  {

    dichotomy,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
