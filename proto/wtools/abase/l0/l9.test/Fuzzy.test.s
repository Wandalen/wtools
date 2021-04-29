( function _l0_l9_Fuzzy_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

//--
// tests
//--

function is( test )
{
  test.case = 'string empty input';
  var got = _.fuzzy.is( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.fuzzy.is( 'hello' );
  test.identical( got, false );

  test.case = 'string number';
  var got = _.fuzzy.is( '1' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.fuzzy.is( 1 );
  test.identical( got, false );

  test.case = 'number 0 input';
  var got = _.fuzzy.is( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.fuzzy.is( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.fuzzy.is( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.fuzzy.is( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.fuzzy.is( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.fuzzy.is( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.fuzzy.is( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.fuzzy.is( false );
  test.identical( got, true );

  test.case = 'bool true input';
  var got = _.fuzzy.is( true );
  test.identical( got, true );

  /* */

  test.case = 'Symbol( maybe ) input';
  var got = _.fuzzy.is( _.maybe );
  test.identical( got, true );

  test.case = 'Symbol( another ) input';
  var got = _.fuzzy.is( Symbol.for( 'another' ) );
  test.identical( got, false );
}

//

function like( test )
{
  test.case = 'string empty input';
  var got = _.fuzzy.like( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.fuzzy.like( 'hello' );
  test.identical( got, false );

  test.case = 'string number';
  var got = _.fuzzy.like( '1' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.fuzzy.like( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.fuzzy.like( 0 );
  test.identical( got, true );

  test.case = 'number negative input';
  var got = _.fuzzy.like( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.fuzzy.like( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.fuzzy.like( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.fuzzy.like( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.fuzzy.like( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.fuzzy.like( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.fuzzy.like( false );
  test.identical( got, true );

  test.case = 'bool true input';
  var got = _.fuzzy.like( true );
  test.identical( got, true );

  /* */

  test.case = 'Symbol( maybe ) input';
  var got = _.fuzzy.like( _.maybe );
  test.identical( got, true );

  test.case = 'Symbol( another ) input';
  var got = _.fuzzy.like( Symbol.for( 'another' ) );
  test.identical( got, false );
}

//

function likeFalse( test )
{
  test.case = 'string empty input';
  var got = _.fuzzy.likeFalse( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.fuzzy.likeFalse( 'hello' );
  test.identical( got, false );

  test.case = 'string number';
  var got = _.fuzzy.likeFalse( '1' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.fuzzy.likeFalse( 1 );
  test.identical( got, false );

  test.case = 'number 0 input';
  var got = _.fuzzy.likeFalse( 0 );
  test.identical( got, true );

  test.case = 'number negative input';
  var got = _.fuzzy.likeFalse( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.fuzzy.likeFalse( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.fuzzy.likeFalse( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.fuzzy.likeFalse( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.fuzzy.likeFalse( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.fuzzy.likeFalse( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.fuzzy.likeFalse( false );
  test.identical( got, true );

  test.case = 'bool true input';
  var got = _.fuzzy.likeFalse( true );
  test.identical( got, false );

  /* */

  test.case = 'Symbol( maybe ) input';
  var got = _.fuzzy.likeFalse( _.maybe );
  test.identical( got, false );

  test.case = 'Symbol( another ) input';
  var got = _.fuzzy.likeFalse( Symbol.for( 'another' ) );
  test.identical( got, false );
}

//

function likeTrue( test )
{
  test.case = 'string empty input';
  var got = _.fuzzy.likeTrue( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.fuzzy.likeTrue( 'hello' );
  test.identical( got, false );

  test.case = 'string number';
  var got = _.fuzzy.likeTrue( '1' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.fuzzy.likeTrue( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.fuzzy.likeTrue( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.fuzzy.likeTrue( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.fuzzy.likeTrue( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.fuzzy.likeTrue( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.fuzzy.likeTrue( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.fuzzy.likeTrue( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.fuzzy.likeTrue( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.fuzzy.likeTrue( false );
  test.identical( got, false );

  test.case = 'bool true input';
  var got = _.fuzzy.likeTrue( true );
  test.identical( got, true );

  /* */

  test.case = 'Symbol( maybe ) input';
  var got = _.fuzzy.likeTrue( _.maybe );
  test.identical( got, false );

  test.case = 'Symbol( another )input';
  var got = _.fuzzy.likeTrue( Symbol.for( 'another' ) );
  test.identical( got, false );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Fuzzy.l0.l9',
  silencing : 1,
  enabled : 1,

  tests :
  {
    is,
    like,
    likeFalse,
    likeTrue,
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
