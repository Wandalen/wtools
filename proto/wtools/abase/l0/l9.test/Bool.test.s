( function _l0_l9_Bool_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

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

//--
// l0/l5/Bool.s
//--

function areEquivalentShallow ( test )
{
  test.case = 'true - true';
  var got = _.bool.areEquivalentShallow( true, true );
  test.identical( got, true );

  test.case = 'false - false';
  var got = _.bool.areEquivalentShallow( false, false );
  test.identical( got, true );

  test.case = '1 - true';
  var got = _.bool.areEquivalentShallow( 1, true );
  test.identical( got, true );

  test.case = '0 - false';
  var got = _.bool.areEquivalentShallow( 0, false );
  test.identical( got, true );

  test.case = '1 - 1';
  var got = _.bool.areEquivalentShallow( 1, 1 );
  test.identical( got, true );

  test.case = '0 - 0';
  var got = _.bool.areEquivalentShallow( 1, 1 );
  test.identical( got, true );

  /* */

  test.case = 'true - false';
  var got = _.bool.areEquivalentShallow( true, false );
  test.identical( got, false );

  test.case = '1 - false';
  var got = _.bool.areEquivalentShallow( 1, false );
  test.identical( got, false );

  test.case = '0 - true';
  var got = _.bool.areEquivalentShallow( 0, true );
  test.identical( got, false );

  test.case = '1 - 0';
  var got = _.bool.areEquivalentShallow( 1, 0 );
  test.identical( got, false );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( () => _.bool.areEquivalentShallow() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.bool.areEquivalentShallow( true, true, true ) );

  test.case = 'not a boollike';
  test.shouldThrowErrorSync( () => _.bool.areEquivalentShallow( {}, [] ) );

}

//--
// l0/l8/Bool.s
//--

function from( test )
{
  test.case = 'string \'1\'';
  var got = _.bool.from( '1' );
  test.identical( got, true );

  test.case = 'string \'0\'';
  var got = _.bool.from( '0' );
  test.identical( got, false );

  test.case = 'string \'true\'';
  var got = _.bool.from( 'true' );
  test.identical( got, true );

  test.case = 'string \'false\'';
  var got = _.bool.from( 'false' );
  test.identical( got, false );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.from( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.bool.from( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.bool.from( -10 );
  test.identical( got, true );

  test.case = 'number positive input';
  var got = _.bool.from( 10 );
  test.identical( got, true );

  /* */

  test.case = 'bool false input';
  var got = _.bool.from( false );
  test.identical( got, false );

  test.case = 'bool true input';
  var got = _.bool.from( true );
  test.identical( got, true );

  /* */

  if( !Config.debug )
  return;

  test.case = 'empty object input';
  test.shouldThrowErrorSync( () => _.bool.from( {} ) );

  test.case = 'object input';
  test.shouldThrowErrorSync( () => _.bool.from( { name : 'a', age : 100 } ) );

  test.case = 'empty array input';
  test.shouldThrowErrorSync( () => _.bool.from( [] ) );

  test.case = 'array input';
  test.shouldThrowErrorSync( () => _.bool.from( [ 1, 2, 3 ] ) );

  test.case = 'Symbol( maybe ) input';
  test.shouldThrowErrorSync( () => _.bool.from( _.maybe ) );

  test.case = 'Symbol( another )input';
  test.shouldThrowErrorSync( () => _.bool.from( Symbol.for( 'another' ) ) );

  test.case = 'string empty input';
  test.shouldThrowErrorSync( () => _.bool.from( '' ) );

  test.case = 'string input';
  test.shouldThrowErrorSync( () => _.bool.from( 'hello' ) );
}

//

function fromMaybe( test )
{
  test.case = 'string \'1\'';
  var got = _.bool.fromMaybe( '1' );
  test.identical( got, true );

  test.case = 'string \'0\'';
  var got = _.bool.fromMaybe( '0' );
  test.identical( got, false );

  test.case = 'string \'true\'';
  var got = _.bool.fromMaybe( 'true' );
  test.identical( got, true );

  test.case = 'string \'false\'';
  var got = _.bool.fromMaybe( 'false' );
  test.identical( got, false );

  test.case = 'string \'hello\'';
  var got = _.bool.fromMaybe( 'hello' );
  test.identical( got, 'hello' );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.fromMaybe( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.bool.fromMaybe( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.bool.fromMaybe( -10 );
  test.identical( got, true );

  test.case = 'number positive input';
  var got = _.bool.fromMaybe( 10 );
  test.identical( got, true );

  /* */

  test.case = 'empty object input';
  var got = _.bool.fromMaybe( {} );
  test.identical( got, {} );

  test.case = 'object input';
  var got = _.bool.fromMaybe( { name : 'a', age : 99 } );
  test.identical( got, { name : 'a', age : 99 } );

  test.case = 'empty array input';
  var got = _.bool.fromMaybe( [] );
  test.identical( got, [] );

  test.case = 'array input';
  var got = _.bool.fromMaybe( [ 1, 2, 3 ] );
  test.identical( got, [ 1, 2, 3 ] );

  /* */

  test.case = 'bool false input';
  var got = _.bool.fromMaybe( false );
  test.identical( got, false );

  test.case = 'bool true input';
  var got = _.bool.fromMaybe( true );
  test.identical( got, true );

  /* */

  test.case = 'Symbol( maybe ) input';
  var got = _.bool.fromMaybe( _.maybe );
  test.identical( got, _.maybe );

  test.case = 'Symbol( another )input';
  var got = _.bool.fromMaybe( Symbol.for( 'another' ) );
  test.identical( got, Symbol.for( 'another' ) );
}

//

function fromForce( test )
{
  test.case = 'empty string';
  var got = _.bool.fromForce( '' );
  test.identical( got, false );

  test.case = 'string \'1\'';
  var got = _.bool.fromForce( '1' );
  test.identical( got, true );

  test.case = 'string \'0\'';
  var got = _.bool.fromForce( '0' );
  test.identical( got, false );

  test.case = 'string \'true\'';
  var got = _.bool.fromForce( 'true' );
  test.identical( got, true );

  test.case = 'string \'false\'';
  var got = _.bool.fromForce( 'false' );
  test.identical( got, false );

  test.case = 'string \'undefined\'';
  var got = _.bool.fromForce( 'undefined' );
  test.identical( got, false );

  test.case = 'string \'null\'';
  var got = _.bool.fromForce( 'null' );
  test.identical( got, false );

  test.case = 'string \'hello\'';
  var got = _.bool.fromForce( 'hello' );
  test.identical( got, true );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.fromForce( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.bool.fromForce( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.bool.fromForce( -10 );
  test.identical( got, true );

  test.case = 'number positive input';
  var got = _.bool.fromForce( 10 );
  test.identical( got, true );

  /* */

  test.case = 'empty object input';
  var got = _.bool.fromForce( {} );
  test.identical( got, true );

  test.case = 'object input';
  var got = _.bool.fromForce( { name : 'a', age : 99 } );
  test.identical( got, true );

  test.case = 'empty array input';
  var got = _.bool.fromForce( [] );
  test.identical( got, true );

  test.case = 'array input';
  var got = _.bool.fromForce( [ 1, 2, 3 ] );
  test.identical( got, true );

  /* */

  test.case = 'bool false input';
  var got = _.bool.fromForce( false );
  test.identical( got, false );

  test.case = 'bool true input';
  var got = _.bool.fromForce( true );
  test.identical( got, true );

  /* */

  test.case = 'Symbol( maybe ) input';
  var got = _.bool.fromForce( _.maybe );
  test.identical( got, true );

  test.case = 'Symbol( another )input';
  var got = _.bool.fromForce( Symbol.for( 'another' ) );
  test.identical( got, true );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Bool.l0.l9',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l3/Bool.s

    is,
    like,
    likeFalse,
    likeTrue,

    // l0/l5/Bool.s

    areEquivalentShallow,

    // l0/l8/Bool.s

    from,
    fromMaybe,
    fromForce
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
