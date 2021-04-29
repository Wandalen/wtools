( function _l0_l1_Container_test_s()
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

//--
// dichotomy
//--

/* qqq : extend with other checks */
function dichotomy( test )
{

  test.case = 'not';
  test.identical( _.container.is( null ), false );
  test.identical( _.container.is( undefined ), false );
  test.identical( _.container.is( 'str' ), false );
  test.identical( _.container.is( 0 ), false );
  test.identical( _.container.is( 1 ), false );
  test.identical( _.container.is( false ), false );
  test.identical( _.container.is( true ), false );
  test.identical( _.container.is( new Date() ), false );

  test.case = 'map';
  test.identical( _.container.is( {} ), true );
  test.identical( _.container.is( { a : 1 } ), true );
  test.identical( _.container.is( Object.create( null ) ), true );

  test.case = 'instance';
  let src = new function Con() { this.a = 1 };
  test.identical( _.container.is( src ), false );

  test.case = 'hashMap';
  test.identical( _.container.is( new HashMap ), true );
  test.identical( _.container.is( new HashMap([ [ 'a', 'b' ] ]) ), true );

  test.case = 'array';
  test.identical( _.container.is( [] ), true );
  test.identical( _.container.is( [ false ] ), true );

  test.case = 'typed buffer';
  test.identical( _.container.is( new F32x() ), true );
  test.identical( _.container.is( new F32x([ 1, 2, 3 ]) ), true );

  test.case = 'set';
  test.identical( _.container.is( new Set ), true );
  test.identical( _.container.is( new Set([ 'a', 'b' ]) ), true );

}

//

function instanceOfContainer( test )
{

  test.case = 'not';
  test.identical( null instanceof _.container, false );
  test.identical( undefined instanceof _.container, false );
  test.identical( 'str' instanceof _.container, false );
  test.identical( 0 instanceof _.container, false );
  test.identical( 1 instanceof _.container, false );
  test.identical( false instanceof _.container, false );
  test.identical( true instanceof _.container, false );
  test.identical( new Date() instanceof _.container, false );

  test.case = 'map';
  test.identical( {} instanceof _.container, true );
  var map = { a : 1 };
  test.identical( map instanceof _.container, true );
  var map = Object.create( null );
  test.identical( map instanceof _.container, true );

  test.case = 'hashMap';
  test.identical( new HashMap instanceof _.container, true );
  test.identical( new HashMap([ [ 'a', 'b' ] ]) instanceof _.container, true );

  test.case = 'array';
  test.identical( [] instanceof _.container, true );
  test.identical( [ false ] instanceof _.container, true );

  test.case = 'typed buffer';
  test.identical( new F32x() instanceof _.container, true );
  test.identical( new F32x([ 1, 2, 3 ]) instanceof _.container, true );

  test.case = 'set';
  test.identical( new Set instanceof _.container, true );
  test.identical( new Set([ 'a', 'b' ]) instanceof _.container, true );

}

// --
// define test suite
// --

const Proto =
{

  name : 'Tools.Container.l0.l1',
  silencing : 1,

  tests :
  {

    // dichotomy

    dichotomy,
    instanceOfContainer,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
