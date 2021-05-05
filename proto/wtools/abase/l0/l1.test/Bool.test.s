( function _l0_l1_Bool_test_s()
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
// l0/l3/Bool.s
//--

function is( test )
{
  test.case = 'string empty input';
  var got = _.bool.is( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.bool.is( 'hello' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.is( 1 );
  test.identical( got, false );

  test.case = 'number 0 input';
  var got = _.bool.is( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.bool.is( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.bool.is( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.bool.is( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.bool.is( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.bool.is( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.bool.is( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.bool.is( false );
  test.identical( got, true );

  test.case = 'bool true input';
  var got = _.bool.is( true );
  test.identical( got, true );

}

//

function like( test )
{
  test.case = 'string empty input';
  var got = _.bool.like( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.bool.like( 'hello' );
  test.identical( got, false );

  test.case = 'string number';
  var got = _.bool.like( '1' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.like( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.bool.like( 0 );
  test.identical( got, true );

  test.case = 'number negative input';
  var got = _.bool.like( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.bool.like( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.bool.like( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.bool.like( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.bool.like( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.bool.like( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.bool.like( false );
  test.identical( got, true );

  test.case = 'bool true input';
  var got = _.bool.like( true );
  test.identical( got, true );
}

//

function likeFalse ( test )
{
  test.case = 'string empty input';
  var got = _.bool.likeFalse( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.bool.likeFalse( 'hello' );
  test.identical( got, false );

  test.case = 'string number';
  var got = _.bool.likeFalse( '1' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.likeFalse( 1 );
  test.identical( got, false );

  test.case = 'number 0 input';
  var got = _.bool.likeFalse( 0 );
  test.identical( got, true );

  test.case = 'number negative input';
  var got = _.bool.likeFalse( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.bool.likeFalse( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.bool.likeFalse( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.bool.likeFalse( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.bool.likeFalse( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.bool.likeFalse( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.bool.likeFalse( false );
  test.identical( got, true );

  test.case = 'bool true input';
  var got = _.bool.likeFalse( true );
  test.identical( got, false );
}

//

function likeTrue ( test )
{

  test.case = 'string empty input';
  var got = _.bool.likeTrue( '' );
  test.identical( got, false );

  test.case = 'string input';
  var got = _.bool.likeTrue( 'hello' );
  test.identical( got, false );

  test.case = 'string number';
  var got = _.bool.likeTrue( '1' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.likeTrue( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.bool.likeTrue( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.bool.likeTrue( -10 );
  test.identical( got, false );

  test.case = 'number positive input';
  var got = _.bool.likeTrue( 10 );
  test.identical( got, false );

  /* */

  test.case = 'empty object input';
  var got = _.bool.likeTrue( {} );
  test.identical( got, false );

  test.case = 'object input';
  var got = _.bool.likeTrue( { name : 'a', age : 99 } );
  test.identical( got, false );

  test.case = 'empty array input';
  var got = _.bool.likeTrue( [] );
  test.identical( got, false );

  test.case = 'array input';
  var got = _.bool.likeTrue( [ 1, 2, 3 ] );
  test.identical( got, false );

  /* */

  test.case = 'bool false input';
  var got = _.bool.likeTrue( false );
  test.identical( got, false );

  test.case = 'bool true input';
  var got = _.bool.likeTrue( true );
  test.identical( got, true );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Bool.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l3/Bool.s

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
