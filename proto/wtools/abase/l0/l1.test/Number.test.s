( function _l0_l1_Number_test_s()
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
// l0/l3/Number.s
//--

function is( test )
{
  test.case = 'null';
  var got = _.number.is( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.is( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.is( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.is( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.is( 2 );
  test.identical( got, true );

  test.case = 'Positive float Number';
  var got = _.number.is( 2.33 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.number.is( -2 );
  test.identical( got, true );

  test.case = 'Negative float Number';
  var got = _.number.is( -2.33 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.number.is( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.number.is( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.number.is( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.number.is( NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.number.is( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.number.is( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.number.is( -Infinity );
  test.identical( got, true );

  /* - */

  test.case = 'empty string';
  var got = _.number.is( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.is( 'abc' );
  test.identical( got, false );

  test.case = 'String positive Number';
  var got = _.number.is( '2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.is( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.is( new HashMap() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.is( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.is( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.is( function(){} );
  test.identical( got, false );
}

//

function isNotNan( test )
{
  test.case = 'null';
  var got = _.number.isNotNan( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.isNotNan( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.isNotNan( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.isNotNan( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.isNotNan( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.number.isNotNan( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.number.isNotNan( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.number.isNotNan( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.number.isNotNan( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.number.isNotNan( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.number.isNotNan( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.number.isNotNan( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.number.isNotNan( -Infinity );
  test.identical( got, true );

  /* - */

  test.case = 'empty string';
  var got = _.number.isNotNan( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.isNotNan( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.number.isNotNan( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.number.isNotNan( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.number.isNotNan( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.number.isNotNan( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.number.isNotNan( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.number.isNotNan( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.number.isNotNan( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.number.isNotNan( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.number.isNotNan( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.number.isNotNan( 'abc2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.isNotNan( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.isNotNan( new HashMap() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.isNotNan( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.isNotNan( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.isNotNan( function(){} );
  test.identical( got, false );
}

//

function isFinite( test )
{
  test.case = 'null';
  var got = _.number.isFinite( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.isFinite( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.isFinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.isFinite( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.isFinite( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.number.isFinite( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.number.isFinite( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.number.isFinite( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.number.isFinite( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.number.isFinite( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.number.isFinite( Infinity );
  test.identical( got, false );

  test.case = 'Positive Infinity';
  var got = _.number.isFinite( +Infinity );
  test.identical( got, false );

  test.case = 'Negative Infinity';
  var got = _.number.isFinite( -Infinity );
  test.identical( got, false );

  /* - */

  test.case = 'empty string';
  var got = _.number.isFinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.isFinite( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.number.isFinite( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.number.isFinite( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.number.isFinite( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.number.isFinite( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.number.isFinite( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.number.isFinite( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.number.isFinite( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.number.isFinite( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.number.isFinite( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.number.isFinite( 'abc2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.isFinite( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.isFinite( new HashMap() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.isFinite( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.isFinite( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.isFinite( function(){} );
  test.identical( got, false );
}

//

function isInfinite( test )
{
  test.case = 'null';
  var got = _.number.isInfinite( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.number.isInfinite( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.number.isInfinite( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.number.isInfinite( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.number.isInfinite( 2 );
  test.identical( got, false );

  test.case = 'Negative Number';
  var got = _.number.isInfinite( -2 );
  test.identical( got, false );

  test.case = 'Zero Number';
  var got = _.number.isInfinite( 0 );
  test.identical( got, false );

  test.case = '-Zero Number';
  var got = _.number.isInfinite( -0 );
  test.identical( got, false );

  test.case = '+Zero Number';
  var got = _.number.isInfinite( +0 );
  test.identical( got, false );

  test.case = 'NaN';
  var got = _.number.isInfinite( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.number.isInfinite( Infinity );
  test.identical( got, true );

  test.case = 'Positive Infinity';
  var got = _.number.isInfinite( +Infinity );
  test.identical( got, true );

  test.case = 'Negative Infinity';
  var got = _.number.isInfinite( -Infinity );
  test.identical( got, true );

  /* - */

  test.case = 'empty string';
  var got = _.number.isInfinite( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.number.isInfinite( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.number.isInfinite( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.number.isInfinite( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.number.isInfinite( '0' );
  test.identical( got, false );

  test.case = 'String +zero Number';
  var got = _.number.isInfinite( '+0' );
  test.identical( got, false );

  test.case = 'String -zero Number';
  var got = _.number.isInfinite( '-0' );
  test.identical( got, false );

  test.case = 'String Infinity Number';
  var got = _.number.isInfinite( 'Infinity' );
  test.identical( got, false );

  test.case = 'String Positive Infinity Number';
  var got = _.number.isInfinite( '+Infinity' );
  test.identical( got, false );

  test.case = 'String Negative Infinity Number';
  var got = _.number.isInfinite( '-Infinity' );
  test.identical( got, false );

  test.case = 'String Number with literals';
  var got = _.number.isInfinite( '2abc' );
  test.identical( got, false );

  test.case = 'String literals with number';
  var got = _.number.isInfinite( 'abc2' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.number.isInfinite( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.number.isInfinite( new HashMap() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.number.isInfinite( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.number.isInfinite( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.number.isInfinite( function(){} );
  test.identical( got, false );
}

//

function intIs( test )
{
  test.case = 'null';
  var got = _.intIs( null );
  test.identical( got, false );

  test.case = 'undefined';
  var got = _.intIs( undefined );
  test.identical( got, false );

  /* - */

  test.case = 'false';
  var got = _.intIs( false );
  test.identical( got, false );

  test.case = 'true';
  var got = _.intIs( true );
  test.identical( got, false );

  /* - */

  test.case = 'Positive Number';
  var got = _.intIs( 2 );
  test.identical( got, true );

  test.case = 'Negative Number';
  var got = _.intIs( -2 );
  test.identical( got, true );

  /* - */

  test.case = '2.00 Number';
  var got = _.intIs( 2.00 );
  test.identical( got, true );

  test.case = '2.50 Number';
  var got = _.intIs( 2.50 );
  test.identical( got, false );

  test.case = '2.49 Number';
  var got = _.intIs( 2.49 );
  test.identical( got, false );

  test.case = '2.00000000001 Number';
  var got = _.intIs( 2.00000000001 );
  test.identical( got, false );

  test.case = '-2.00000000001 Number';
  var got = _.intIs( -2.00000000001 );
  test.identical( got, false );

  test.case = '-2.00 Number';
  var got = _.intIs( -2.00 );
  test.identical( got, true );

  test.case = '-2.49 Number';
  var got = _.intIs( -2.49 );
  test.identical( got, false );

  test.case = '-2.50 Number';
  var got = _.intIs( -2.50 );
  test.identical( got, false );

  test.case = '-2.51 Number';
  var got = _.intIs( -2.51 );
  test.identical( got, false );

  /* - */

  test.case = 'Negative Number';
  var got = _.intIs( -2 );
  test.identical( got, true );

  test.case = 'Zero Number';
  var got = _.intIs( 0 );
  test.identical( got, true );

  test.case = '-Zero Number';
  var got = _.intIs( -0 );
  test.identical( got, true );

  test.case = '+Zero Number';
  var got = _.intIs( +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.intIs( NaN );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.intIs( Infinity );
  test.identical( got, false );

  test.case = 'Positive Infinity';
  var got = _.intIs( +Infinity );
  test.identical( got, false );

  test.case = 'Negative Infinity';
  var got = _.intIs( -Infinity );
  test.identical( got, false );

  /* - */

  test.case = 'empty string';
  var got = _.intIs( '' );
  test.identical( got, false );

  test.case = 'string with literal symbols';
  var got = _.intIs( 'abc' );
  test.identical( got, false );

  /* - */

  test.case = 'String positive Number';
  var got = _.intIs( '2' );
  test.identical( got, false );

  test.case = 'String negative Number';
  var got = _.intIs( '-2' );
  test.identical( got, false );

  test.case = 'String zero Number';
  var got = _.intIs( '0' );
  test.identical( got, false );

  /* - */

  test.case = 'Set';
  var got = _.intIs( new Set() );
  test.identical( got, false );

  test.case = 'HashMap';
  var got = _.intIs( new HashMap() );
  test.identical( got, false );

  test.case = 'Object';
  var got = _.intIs( {} );
  test.identical( got, false );

  test.case = 'Array';
  var got = _.intIs( [] );
  test.identical( got, false );

  test.case = 'function';
  var got = _.intIs( function(){} );
  test.identical( got, false );
}

/* - */

function areAll( test )
{
  test.case = 'empty array';
  var got = _.number.s.areAll( [] );
  test.identical( got, false );

  /* - */

  test.case = 'array of stings';
  var got = _.number.s.areAll( [ 'a', 'b' ] );
  test.identical( got, false );

  test.case = 'array of stings of numbers';
  var got = _.number.s.areAll( [ '1', '2' ] );
  test.identical( got, false );

  test.case = 'array of stings and numbers';
  var got = _.number.s.areAll( [ 'a', 1 ] );
  test.identical( got, false );

  /* - */

  test.case = 'array of integers';
  var got = _.number.s.areAll( [ 1, 2 ] );
  test.identical( got, true );

  test.case = 'array of floats';
  var got = _.number.s.areAll( [ 1.00, 2.22 ] );
  test.identical( got, true );

  test.case = 'array of special number values';
  var got = _.number.s.areAll( [ Infinity, -Infinity, NaN ] );
  test.identical( got, true );

  /* - */

  test.case = 'Typed array';
  var got = _.number.s.areAll( new I8x([ 1, 2 ]) );
  test.identical( got, true );

  test.case = 'Object of numbers';
  var got = _.number.s.areAll({ '0' : 1, '1' : 2 });
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areAll() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areAll( [ 1, 2 ], 'extra' ) );

}

//

function areFinite( test )
{

  test.case = 'empty array';
  var got = _.number.s.areFinite([]);
  test.identical( got, false );

  test.open( 'strings, numbers' )

  test.case = 'numbers 1, 1, string 1 ';
  var got = _.number.s.areFinite([ 1, 1, '1' ]);
  test.identical( got, false );

  test.case = 'strings 1, 1, -1 ';
  var got = _.number.s.areFinite([ '1', '1', '-1' ]);
  test.identical( got, false );

  test.close( 'strings, numbers' )

  /* - */

  test.open( 'numbers' )

  test.case = 'array 1, 1, -1 ';
  var got = _.number.s.areFinite([ 1, 1, -1 ]);
  test.identical( got, true );

  test.case = 'array 1.2, 0.9999, -1 ';
  var got = _.number.s.areFinite([ 1.2, 0.9999, -1 ]);
  test.identical( got, true );

  test.case = 'array 1, 1, NaN ';
  var got = _.number.s.areFinite([ 1, 1, NaN ]);
  test.identical( got, false );

  test.case = 'array NaN, NaN, NaN ';
  var got = _.number.s.areFinite([ NaN, NaN, NaN ]);
  test.identical( got, false );

  test.case = 'array 1, 1, Infinity ';
  var got = _.number.s.areFinite([ 1, 1, Infinity ]);
  test.identical( got, false );

  test.case = 'array 1, 1, -Infinity ';
  var got = _.number.s.areFinite([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.close( 'numbers' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areFinite() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areFinite( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function arePositive( test )
{
  test.case = '1 1 1';
  var got = _.number.s.arePositive([ 1, 1, 1 ]);
  test.identical( got, true );

  test.case = '-1 1 1';
  var got = _.number.s.arePositive([ -1, 1, 1 ]);
  test.identical( got, false );

  test.case = '1 1 -Infinity';
  var got = _.number.s.arePositive([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.case = '1 1 Infinity';
  var got = _.number.s.arePositive([ 1, 1, Infinity ]);
  test.identical( got, true );

  test.case = '1 1 -0 ';
  var got = _.number.s.arePositive([ 1, 1, -0 ]);
  test.identical( got, true );

  test.case = '1 1 0 ';
  var got = _.number.s.arePositive([ 1, 1, 0 ]);
  test.identical( got, true );

  test.case = '-0.000000000000000000001 1 0 ';
  var got = _.number.s.arePositive([ -0.000000000000000000001, 1, 0 ]);
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.arePositive() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.arePositive( [ 1, 2, 0.7 ], 'extra' ) );
}

//

function areInt( test )
{
  test.case = '1 1 1';
  var got = _.number.s.areInt([ 1, 1, 1 ]);
  test.identical( got, true );

  test.case = '-1 1 1';
  var got = _.number.s.areInt([ -1, 1, 1 ]);
  test.identical( got, true );

  /* */

  test.case = '1 1 -Infinity';
  var got = _.number.s.areInt([ 1, 1, -Infinity ]);
  test.identical( got, false );

  test.case = '1 1 Infinity';
  var got = _.number.s.areInt([ 1, 1, Infinity ]);
  test.identical( got, false );

  test.case = '1 1 NaN';
  var got = _.number.s.areInt([ 1, 1, NaN ]);
  test.identical( got, false );

  /* */

  test.case = '1.00 1 0.00 ';
  var got = _.number.s.areInt([ 1.00, 1, 0.00 ]);
  test.identical( got, true );

  test.case = '1.1 1 0 ';
  var got = _.number.s.areInt([ 1.1, 1, 0 ]);
  test.identical( got, false );

  test.case = '0.000000000000000000001 1 0 ';
  var got = _.number.s.areInt([ 0.000000000000000000001, 1, 0 ]);
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.s.areInt() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.s.areInt( [ 1, 2, 0.7 ], 'extra' ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Number.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l3/Number.s

    is,
    isNotNan,
    isFinite,
    isInfinite,
    intIs,
    areAll,
    areFinite,
    arePositive,
    areInt,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
