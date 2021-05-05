( function _l0_l1_Primitive_test_s_()
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

/* qqq : for junior : extend with like and other dichotomies */
function dichotomy( test )
{

  test.case = 'without argument';
  var got = _.primitive.is();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.primitive.is( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.primitive.is( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.primitive.is( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.primitive.is( 0 );
  test.identical( got, true );

  test.case = 'check empty string';
  var got = _.primitive.is( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.primitive.is( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.primitive.is( NaN );
  test.identical( got, true );

  test.case = 'check Symbol';
  var got = _.primitive.is( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.primitive.is( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.primitive.is( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.primitive.is( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.primitive.is( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.primitive.is( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.primitive.is( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.primitive.is( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.primitive.is( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.primitive.is( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.primitive.is( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.primitive.is( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.primitive.is( 'str' );
  test.identical( got, true );

  test.case = 'check not empty array';
  var got = _.primitive.is( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.primitive.is( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.primitive.is( src );
  test.identical( got, false );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Primitive.l0.l1',
  silencing : 1,

  tests :
  {

    dichotomy,

  },

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
