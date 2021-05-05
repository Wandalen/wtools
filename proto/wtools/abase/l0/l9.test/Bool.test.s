( function _l0_l9_Bool_test_s()
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

function coerceFrom( test )
{
  test.case = 'empty string';
  var got = _.bool.coerceFrom( '' );
  test.identical( got, false );

  test.case = 'string \'1\'';
  var got = _.bool.coerceFrom( '1' );
  test.identical( got, true );

  test.case = 'string \'0\'';
  var got = _.bool.coerceFrom( '0' );
  test.identical( got, false );

  test.case = 'string \'true\'';
  var got = _.bool.coerceFrom( 'true' );
  test.identical( got, true );

  test.case = 'string \'false\'';
  var got = _.bool.coerceFrom( 'false' );
  test.identical( got, false );

  test.case = 'string \'undefined\'';
  var got = _.bool.coerceFrom( 'undefined' );
  test.identical( got, false );

  test.case = 'string \'null\'';
  var got = _.bool.coerceFrom( 'null' );
  test.identical( got, false );

  test.case = 'string \'hello\'';
  var got = _.bool.coerceFrom( 'hello' );
  test.identical( got, true );

  /* */

  test.case = 'number 1 input';
  var got = _.bool.coerceFrom( 1 );
  test.identical( got, true );

  test.case = 'number 0 input';
  var got = _.bool.coerceFrom( 0 );
  test.identical( got, false );

  test.case = 'number negative input';
  var got = _.bool.coerceFrom( -10 );
  test.identical( got, true );

  test.case = 'number positive input';
  var got = _.bool.coerceFrom( 10 );
  test.identical( got, true );

  /* */

  test.case = 'empty object input';
  var got = _.bool.coerceFrom( {} );
  test.identical( got, true );

  test.case = 'object input';
  var got = _.bool.coerceFrom( { name : 'a', age : 99 } );
  test.identical( got, true );

  test.case = 'empty array input';
  var got = _.bool.coerceFrom( [] );
  test.identical( got, true );

  test.case = 'array input';
  var got = _.bool.coerceFrom( [ 1, 2, 3 ] );
  test.identical( got, true );

  /* */

  test.case = 'bool false input';
  var got = _.bool.coerceFrom( false );
  test.identical( got, false );

  test.case = 'bool true input';
  var got = _.bool.coerceFrom( true );
  test.identical( got, true );

  /* */

  test.case = 'Symbol( maybe ) input';
  var got = _.bool.coerceFrom( _.maybe );
  test.identical( got, true );

  test.case = 'Symbol( another )input';
  var got = _.bool.coerceFrom( Symbol.for( 'another' ) );
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

    // l0/l8/Bool.s

    from,
    fromMaybe,
    coerceFrom,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
