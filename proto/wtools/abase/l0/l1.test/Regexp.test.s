( function _l0_l1_Regexp_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

/* qqq xxx : implement test routine _.regexp.isEmpty()

- among other values should check /(?:)/

*/

// --
// implementation
// --

/* qqq : for junior : extend. ask how to */
function dichotomy( test )
{

  test.case = 'undefined';
  var got = _.regexp.like( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.regexp.like( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.regexp.like( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.regexp.like( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.regexp.like( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.regexp.like( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.regexp.like( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  function Constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.regexp.like( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.regexp.like( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.regexp.like( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Set';
  var got = _.regexp.like( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.regexp.like( new HashMap( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.regexp.like( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.regexp.like( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.regexp.like( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.regexp.like( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.regexp.like( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'regexp';
  var got = _.regexp.like( /a/ );
  var expected = true;
  test.identical( got, expected );

  test.case = 'regexp empty';
  var got = _.regexp.like( /(?:)/ );
  var expected = true;
  test.identical( got, expected );

  test.case = 'regexp with flags';
  var got = _.regexp.like( /a/g );
  var expected = true;
  test.identical( got, expected );

  test.case = 'regexp complex';
  var got = _.regexp.like( /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}\1\d{4}/ );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.regexp.like( '' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.regexp.like( 'str' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'a string object';
  var got = _.regexp.like( new String( 'str' ) );
  var expected = true;
  test.identical( got, expected );

}

// --
// suite definition
// --

const Proto =
{

  name : 'Tools.l1.Regexp.l0.l1',
  silencing : 1,

  tests :
  {

    dichotomy,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
