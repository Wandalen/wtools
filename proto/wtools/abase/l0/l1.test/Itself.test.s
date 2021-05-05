( function _l0_l1_Itself_test_s_()
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
  var got = _.itself.is();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.itself.is( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.itself.is( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.itself.is( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.itself.is( 0 );
  test.identical( got, true );

  test.case = 'check itself string';
  var got = _.itself.is( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.itself.is( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.itself.is( NaN );
  test.identical( got, true );

  test.case = 'check Symbol';
  var got = _.itself.is( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check itself array';
  var got = _.itself.is( [] );
  test.identical( got, true );

  test.case = 'check itself arguments array';
  var got = _.itself.is( _.argumentsArray.make( [] ) );
  test.identical( got, true );

  test.case = 'check itself unroll';
  var got = _.itself.is( _.unroll.make( [] ) );
  test.identical( got, true );

  test.case = 'check itself map';
  var got = _.itself.is( {} );
  test.identical( got, true );

  test.case = 'check itself pure map';
  var got = _.itself.is( Object.create( null ) );
  test.identical( got, true );

  test.case = 'check itself Set';
  var got = _.itself.is( new Set( [] ) );
  test.identical( got, true );

  test.case = 'check itself Map';
  var got = _.itself.is( new HashMap( [] ) );
  test.identical( got, true );

  test.case = 'check itself BufferRaw';
  var got = _.itself.is( new BufferRaw() );
  test.identical( got, true );

  test.case = 'check itself BufferTyped';
  var got = _.itself.is( new U8x() );
  test.identical( got, true );

  test.case = 'check number';
  var got = _.itself.is( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.itself.is( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.itself.is( 'str' );
  test.identical( got, true );

  test.case = 'check not itself array';
  var got = _.itself.is( [ null ] );
  test.identical( got, true );

  test.case = 'check not itself map';
  var got = _.itself.is( { '' : null } );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.itself.is( src );
  test.identical( got, true );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Itself.l0.l1',
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
