( function _l0_l1_Blank_test_s_()
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
  var got = _.blank.is();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.blank.is( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.blank.is( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.blank.is( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.blank.is( 0 );
  test.identical( got, true );

  test.case = 'check blank string';
  var got = _.blank.is( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.blank.is( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.blank.is( NaN );
  test.identical( got, true );

  test.case = 'check Symbol';
  var got = _.blank.is( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check blank array';
  var got = _.blank.is( [] );
  test.identical( got, true );

  test.case = 'check blank arguments array';
  var got = _.blank.is( _.argumentsArray.make( [] ) );
  test.identical( got, true );

  test.case = 'check blank unroll';
  var got = _.blank.is( _.unroll.make( [] ) );
  test.identical( got, true );

  test.case = 'check blank map';
  var got = _.blank.is( {} );
  test.identical( got, true );

  test.case = 'check blank pure map';
  var got = _.blank.is( Object.create( null ) );
  test.identical( got, true );

  test.case = 'check blank Set';
  var got = _.blank.is( new Set( [] ) );
  test.identical( got, true );

  test.case = 'check blank Map';
  var got = _.blank.is( new HashMap( [] ) );
  test.identical( got, true );

  test.case = 'check blank BufferRaw';
  var got = _.blank.is( new BufferRaw() );
  test.identical( got, true );

  test.case = 'check blank BufferTyped';
  var got = _.blank.is( new U8x() );
  test.identical( got, true );

  test.case = 'check number';
  var got = _.blank.is( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.blank.is( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.blank.is( 'str' );
  test.identical( got, true );

  test.case = 'check not blank array';
  var got = _.blank.is( [ null ] );
  test.identical( got, true );

  test.case = 'check not blank map';
  var got = _.blank.is( { '' : null } );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.blank.is( src );
  test.identical( got, true );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Blank.l0.l1',
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
