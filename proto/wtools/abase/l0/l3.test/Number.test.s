( function _l0_l3_Number_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

//--
// equaler
//--

function identicalStrictly( test )
{

  /* */

  test.case = 'empty strings';
  var got = _.number.identicalStrictly( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.number.identicalStrictly( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.number.identicalStrictly( '1', 1 );
  test.identical( got, false );

  /* - */

  test.case = 'numbers 1 and 1 ';
  var got = _.number.identicalStrictly( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1 ';
  var got = _.number.identicalStrictly( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1 ';
  var got = _.number.identicalStrictly( 1.00000000000001, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.2 and 1 ';
  var got = _.number.identicalStrictly( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00 ';
  var got = _.number.identicalStrictly( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0 ';
  var got = _.number.identicalStrictly( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0 ';
  var got = _.number.identicalStrictly( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.number.identicalStrictly( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0 ';
  var got = _.number.identicalStrictly( +0, -0 );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.identicalStrictly( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity ';
  var got = _.number.identicalStrictly( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity ';
  var got = _.number.identicalStrictly( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity ';
  var got = _.number.identicalStrictly( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.identicalStrictly( NaN, NaN );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.identicalStrictly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.identicalStrictly( 1, 2, 'extra' ) );
}

//

function identical( test )
{

  test.case = 'empty strings';
  var got = _.number.identical( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.number.identical( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.number.identical( '1', 1 );
  test.identical( got, false );

  /* - */

  test.case = 'numbers 1 and 1';
  var got = _.number.identical( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1';
  var got = _.number.identical( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1';
  var got = _.number.identical( 1.00000000000001, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.2 and 1';
  var got = _.number.identical( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00';
  var got = _.number.identical( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0';
  var got = _.number.identical( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0';
  var got = _.number.identical( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.number.identical( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0';
  var got = _.number.identical( +0, -0 );
  test.identical( got, true );

  test.case = 'numbers NaN and NaN';
  var got = _.number.identical( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity';
  var got = _.number.identical( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity';
  var got = _.number.identical( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity';
  var got = _.number.identical( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN';
  var got = _.number.identical( NaN, NaN );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.identical() );

  // test.case = 'extra arguments';
  // test.shouldThrowErrorSync( () => _.number.identical( 1, 2, 'extra' ) );

}

//

function equivalentBasic( test )
{

  test.case = 'empty strings';
  var got = _.number.equivalent( '', '' ); /* qqq for Yevhen : _.nubmer.areEquivalent should also work */
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.number.equivalent( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.number.equivalent( '1', 1 );
  test.identical( got, false );

  test.case = 'numbers 1 and 1 ';
  var got = _.number.equivalent( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1 ';
  var got = _.number.equivalent( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1 ';
  debugger;
  var got = _.number.equivalent( 1.00000000000001, 1 );
  debugger;
  test.identical( got, true );

  test.case = 'numbers 1.2 and 1 ';
  var got = _.number.equivalent( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00 ';
  var got = _.number.equivalent( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0 ';
  var got = _.number.equivalent( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0 ';
  var got = _.number.equivalent( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.number.equivalent( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0 ';
  var got = _.number.equivalent( +0, -0 );
  test.identical( got, true );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.equivalent( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity ';
  var got = _.number.equivalent( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity ';
  var got = _.number.equivalent( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity ';
  var got = _.number.equivalent( -Infinity, +Infinity );
  test.identical( got, false );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.equivalent( NaN, NaN );
  test.identical( got, true );

  /* qqq for Yevhen : extend */

  test.case = 'number 3 and big int 3';
  var got = _.number.equivalent( 3, 3n );
  test.identical( got, true );
  debugger;
  var got = _.number.equivalent( 3n, 3 );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.equivalent() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.equivalent( 1, 2, 0.7, 'extra' ) );

  test.case = 'negative accuracy';
  test.shouldThrowErrorSync( () => _.number.equivalent( 1, 1, -0.5 ) );

  test.case = 'not a number accuracy';
  test.shouldThrowErrorSync( () => _.number.equivalent( 1, 1, '-0.5' ) );

}

//

/* qqq for Yevhen : use `/ * * /` as delimeter between cases or nothing, not `//` */

function equivalentOptionAccuracy( test ) /* qqq for Yevhen : bad name, not option, it's argument! */
{
  test.open( 'positive numbers' )

  test.case = 'numbers 1.00 and 1.04999, acc = 0.05 ';
  var got = _.number.equivalent( 1.00, 1.04999, 0.05 );
  test.identical( got, true );

  test.case = 'numbers 1 and 1.04999, acc = 0.05 ';
  var got = _.number.equivalent( 1, 1.04999, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 1 and 2, acc = 1 ';
  var got = _.number.equivalent( 1, 2, 1 );
  test.identical( got, true );

  test.case = 'numbers 10 and 20, acc = 11 ';
  var got = _.number.equivalent( 10, 20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998001, acc = 0.001 ';
  var got = _.number.equivalent( 0.999, 0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers 0.999 and 0.998, acc = 0.0001 ';
  var got = _.number.equivalent( 0.999, 0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.000001 ';
  var got = _.number.equivalent( 0.999999, 0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.0000001 ';
  var got = _.number.equivalent( 0.999999, 0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers 0.9999999999 and 0.999999999801, acc = 0.0000000001 ';
  var got = _.number.equivalent( 0.9999999999, 0.999999999801, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.0000000001 ';
  var got = _.number.equivalent( 0.9999999999, 0.9999999998, 0.0000000001 );
  test.identical( got, false );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.00000000001 ';
  var got = _.number.equivalent( 0.9999999999, 0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers 0.99999999999 and 0.99999999998001, acc = 0.00000000001 ';
  var got = _.number.equivalent( 0.99999999999, 0.99999999998001, 0.00000000001 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998, acc = 0 ';
  var got = _.number.equivalent( 0.999, 0.998, 0 );
  test.identical( got, false );

  test.case = 'numbers 0.999 and 0.999, acc = 0 ';
  var got = _.number.equivalent( 0.999, 0.999, 0 );
  test.identical( got, true );

  test.case = 'numbers 999 and 999, acc = 0 ';
  var got = _.number.equivalent( 999, 999, 0 );
  test.identical( got, true );

  test.close( 'positive numbers' );

  /* - */

  test.open( 'negative numbers' )

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.number.equivalent( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.number.equivalent( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -1 and -2, acc = 1 ';
  var got = _.number.equivalent( -1, -2, 1 );
  test.identical( got, true );

  test.case = 'numbers -10 and -20, acc = 11 ';
  var got = _.number.equivalent( -10, -20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -0.999 and -0.9980001, acc = 0.001 ';
  var got = _.number.equivalent( -0.999, -0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers -0.999 and -0.998, acc = 0.0001 ';
  var got = _.number.equivalent( -0.999, -0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.000001 ';
  var got = _.number.equivalent( -0.999999, -0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.0000001 ';
  var got = _.number.equivalent( -0.999999, -0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers -0.9999999999 and -0.99999999980001, acc = 0.0000000001 ';
  var got = _.number.equivalent( -0.9999999999, -0.99999999980001, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers -0.9999999999 and -0.9999999998, acc = 0.00000000001 ';
  var got = _.number.equivalent( -0.9999999999, -0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers -0.99999999999 and -0.999999999980001, acc = 0.00000000001 ';
  var got = _.number.equivalent( -0.99999999999, -0.999999999980001, 0.00000000001 );
  test.identical( got, true );

  test.close( 'negative numbers' )

  /* - */

  test.open( 'negative and positive numbers' )

  test.case = 'numbers 10 and -20, acc = 30 ';
  var got = _.number.equivalent( 10, -20, 30 );
  test.identical( got, true );

  test.case = 'numbers 10 and -20, acc = 10 ';
  var got = _.number.equivalent( 10, -20, 10 );
  test.identical( got, false );

  test.close( 'negative and positive numbers' )

  /* - */

  test.open( 'big int' )

  /* qqq for Yevhen : extend */

  // test.case = 'number 3.01 and big int 3';
  // var got = _.number.equivalent( 3.1, 3n, 0.10001 );
  // test.identical( got, true );
  // var got = _.number.equivalent( 3n, 3.1, 0.10001 );
  // test.identical( got, true );

  test.close( 'big int' )

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Number.l3',
  silencing : 1,
  enabled : 1,

  tests :
  {

    identicalStrictly,
    identical,
    equivalentBasic,
    equivalentOptionAccuracy,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();