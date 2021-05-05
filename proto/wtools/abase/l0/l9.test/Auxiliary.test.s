( function _l0_l9_Auxiliary_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;

// --
// tests
// --

/* qqq : for junior : extend please */
function dichotomy( test )
{

  test.case = 'undefined';
  var src = undefined;
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.like( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.aux.isPure( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'pure map';
  var src = Object.create( null );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.like( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.aux.isPure( src ), true );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.aux.isPopulated( src ), false );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Auxiliary.l0.l9',
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
