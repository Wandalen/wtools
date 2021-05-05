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
  var got = _.number.equivalent( '', '' ); /* qqq for junior : _.nubmer.areEquivalent should also work */
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

  /* qqq for junior : extend */

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

/* qqq for junior : use `/ * * /` as delimeter between cases or nothing, not `//` */

function equivalentArgumentAccuracy( test ) /* qqq for junior : bad name, not option, it's argument! */
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

  /* qqq for junior : extend */

  // test.case = 'number 3.01 and big int 3';
  // var got = _.number.equivalent( 3.1, 3n, 0.10001 );
  // test.identical( got, true );
  // var got = _.number.equivalent( 3n, 3.1, 0.10001 );
  // test.identical( got, true );

  test.close( 'big int' )

}

//

function equivalentBasic2( test )
{

  test.case = 'empty strings';
  var got = _.number.equivalentShallow( '', '' );
  test.identical( got, false );

  test.case = 'equal string numbers';
  var got = _.number.equivalentShallow( '1', '1' );
  test.identical( got, false );

  test.case = 'string number and number';
  var got = _.number.equivalentShallow( '1', 1 );
  test.identical( got, false );

  test.case = 'numbers 1 and 1 ';
  var got = _.number.equivalentShallow( 1, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1 ';
  var got = _.number.equivalentShallow( 1.00, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.00000000000001 and 1 ';
  var got = _.number.equivalentShallow( 1.00000000000001, 1 );
  test.identical( got, true );

  test.case = 'numbers 1.2 and 1 ';
  var got = _.number.equivalentShallow( 1.2, 1 );
  test.identical( got, false );

  test.case = 'numbers 1.00 and 1.00 ';
  var got = _.number.equivalentShallow( 1.00, 1.00 );
  test.identical( got, true );

  test.case = 'numbers 0 and 0 ';
  var got = _.number.equivalentShallow( 0, 0 );
  test.identical( got, true );

  test.case = 'numbers +0 and +0 ';
  var got = _.number.equivalentShallow( +0, +0 );
  test.identical( got, true );

  test.case = 'numbers -0 and -0 ';
  var got = _.number.equivalentShallow( -0, -0 );
  test.identical( got, true );

  test.case = 'numbers +0 and -0 ';
  var got = _.number.equivalentShallow( +0, -0 );
  test.identical( got, true );

  test.case = 'numbers NaN and NaN ';
  var got = _.number.equivalentShallow( NaN, NaN );
  test.identical( got, true );

  test.case = 'numbers Infinity and Infinity ';
  var got = _.number.equivalentShallow( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and -Infinity ';
  var got = _.number.equivalentShallow( -Infinity, -Infinity );
  test.identical( got, true );

  test.case = 'numbers -Infinity and +Infinity ';
  var got = _.number.equivalentShallow( -Infinity, +Infinity );
  test.identical( got, false );


  /* qqq for junior : extend | aaa : Extended. */

  test.case = 'number 3 and big int 3';
  debugger;
  var got = _.number.equivalentShallow( 3, 3n );
  debugger;
  test.identical( got, true );
  var got = _.number.equivalentShallow( 3n, 3 );
  test.identical( got, true );

  test.case = 'number 3 and big int 4';
  var got = _.number.equivalentShallow( 3, 4n );
  test.identical( got, false );

  test.case = 'bigint 3 and number 4';
  var got = _.number.equivalentShallow( 3n, 4 );
  test.identical( got, false );

  test.case = 'bigint 3 and number 4.0';
  var got = _.number.equivalentShallow( 3n, 4.0 );
  test.identical( got, false );

  test.case = 'bigint 3 and number 3.0';
  var got = _.number.equivalentShallow( 3n, 3.0 );
  test.identical( got, true );

  test.case = 'big int 3 and big int 3';
  var got = _.number.equivalentShallow( 3n, 3n );
  test.identical( got, true );

  test.case = 'big int 3 and big int 4';
  var got = _.number.equivalentShallow( 3n, 4n );
  test.identical( got, false );

  test.case = 'big int 3 and big int -3';
  var got = _.number.equivalentShallow( 3n, -3n );
  test.identical( got, false );

  test.case = 'big int 0 and big int -0';
  var got = _.number.equivalentShallow( 0n, -0n );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.number.equivalentShallow() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.number.equivalentShallow( 1, 2, 0.7, 'extra' ) );

  test.case = 'negative accuracy';
  test.shouldThrowErrorSync( () => _.number.equivalentShallow( 1, 1, -0.5 ) );

  test.case = 'not a number accuracy';
  test.shouldThrowErrorSync( () => _.number.equivalentShallow( 1, 1, '-0.5' ) );
}

//

/* qqq for junior : use `/ * * /` as delimeter between cases or nothing, not `//` | aaa : Changed */

function equivalentArgumentAccuracy2( test ) /* qqq for junior : bad name, not option, it's argument! | aaa : Fixed */
{
  test.open( 'positive numbers' )

  test.case = 'numbers 1 and 1.0, acc = 0 ';
  var got = _.number.equivalentShallow( 1, 1.0, 0 );
  test.identical( got, true );

  test.case = 'numbers 1.00 and 1.04999, acc = 0.05 ';
  var got = _.number.equivalentShallow( 1.00, 1.04999, 0.05 );
  test.identical( got, true );

  test.case = 'numbers 1 and 1.04999, acc = 0.05 ';
  var got = _.number.equivalentShallow( 1, 1.04999, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 1 and 2, acc = 1 ';
  var got = _.number.equivalentShallow( 1, 2, 1 );
  test.identical( got, true );

  test.case = 'numbers 10 and 20, acc = 11 ';
  var got = _.number.equivalentShallow( 10, 20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 10 and 20.0, acc = 11 ';
  var got = _.number.equivalentShallow( 10, 20.0, 11 );
  test.identical( got, true );

  test.case = 'numbers 10.0 and 20, acc = 11 ';
  var got = _.number.equivalentShallow( 10.0, 20, 11 );
  test.identical( got, true );

  test.case = 'numbers 1 and 1.9, acc = 0.9 ';
  var got = _.number.equivalentShallow( 1, 1.9, 0.9 );
  test.identical( got, true );

  test.case = 'numbers 10 and 20, acc = 11.50 ';
  var got = _.number.equivalentShallow( 10, 20, 10.00 );
  test.identical( got, true );

  test.case = 'numbers 1 and 0.9, acc = 0.1';
  var got = _.number.equivalentShallow( 1, 0.9, 0.1 );
  test.identical( got, true );

  test.case = 'numbers 2.5 and 1.5, acc = 1';
  var got = _.number.equivalentShallow( 2.5, 1.5, 1 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998001, acc = 0.001 ';
  var got = _.number.equivalentShallow( 0.999, 0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers 0.999 and 0.998, acc = 0.0001 ';
  var got = _.number.equivalentShallow( 0.999, 0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.000001 ';
  var got = _.number.equivalentShallow( 0.999999, 0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers 0.999999 and 0.999998, acc = 0.0000001 ';
  var got = _.number.equivalentShallow( 0.999999, 0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers 0.9999999999 and 0.999999999801, acc = 0.0000000001 ';
  var got = _.number.equivalentShallow( 0.9999999999, 0.999999999801, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.0000000001 ';
  var got = _.number.equivalentShallow( 0.9999999999, 0.9999999998, 0.0000000001 );
  test.identical( got, false );

  test.case = 'numbers 0.9999999999 and 0.9999999998, acc = 0.00000000001 ';
  var got = _.number.equivalentShallow( 0.9999999999, 0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers 0.99999999999 and 0.99999999998001, acc = 0.00000000001 ';
  var got = _.number.equivalentShallow( 0.99999999999, 0.99999999998001, 0.00000000001 );
  test.identical( got, true );

  /* */

  test.case = 'numbers 0.999 and 0.998, acc = 0 ';
  var got = _.number.equivalentShallow( 0.999, 0.998, 0 );
  test.identical( got, false );

  test.case = 'numbers 0.999 and 0.999, acc = 0 ';
  var got = _.number.equivalentShallow( 0.999, 0.999, 0 );
  test.identical( got, true );

  test.case = 'numbers 999 and 999, acc = 0 ';
  var got = _.number.equivalentShallow( 999, 999, 0 );
  test.identical( got, true );

  test.close( 'positive numbers' );

  /* - */

  test.open( 'negative numbers' )

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.number.equivalentShallow( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  test.case = 'numbers -1.0001 and -1.05, acc = 0.05 ';
  var got = _.number.equivalentShallow( -1.0001, -1.05, 0.05 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -1 and -2, acc = 1 ';
  var got = _.number.equivalentShallow( -1, -2, 1 );
  test.identical( got, true );

  test.case = 'numbers -10 and -20, acc = 11 ';
  var got = _.number.equivalentShallow( -10, -20, 11 );
  test.identical( got, true );

  /* */

  test.case = 'numbers -0.999 and -0.9980001, acc = 0.001 ';
  var got = _.number.equivalentShallow( -0.999, -0.9980001, 0.001 );
  test.identical( got, true );

  test.case = 'numbers -0.999 and -0.998, acc = 0.0001 ';
  var got = _.number.equivalentShallow( -0.999, -0.998, 0.0001 );
  test.identical( got, false );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.000001 ';
  var got = _.number.equivalentShallow( -0.999999, -0.999998, 0.000001 );
  test.identical( got, true );

  test.case = 'numbers -0.999999 and -0.999998, acc = 0.0000001 ';
  var got = _.number.equivalentShallow( -0.999999, -0.999998, 0.0000001 );
  test.identical( got, false );

  /* */

  test.case = 'numbers -0.9999999999 and -0.99999999980001, acc = 0.0000000001 ';
  var got = _.number.equivalentShallow( -0.9999999999, -0.99999999980001, 0.0000000001 );
  test.identical( got, true );

  test.case = 'numbers -0.9999999999 and -0.9999999998, acc = 0.00000000001 ';
  var got = _.number.equivalentShallow( -0.9999999999, -0.9999999998, 0.00000000001 );
  test.identical( got, false );

  test.case = 'more than 10 digit after dot, numbers -0.99999999999 and -0.999999999980001, acc = 0.00000000001 ';
  var got = _.number.equivalentShallow( -0.99999999999, -0.999999999980001, 0.00000000001 );
  test.identical( got, true );

  test.close( 'negative numbers' )

  /* - */

  test.open( 'negative and positive numbers' )

  test.case = 'numbers 10 and -20, acc = 30 ';
  var got = _.number.equivalentShallow( 10, -20, 30 );
  test.identical( got, true );

  test.case = 'numbers 10 and -20, acc = 10 ';
  var got = _.number.equivalentShallow( 10, -20, 10 );
  test.identical( got, false );

  test.close( 'negative and positive numbers' )

  /* - */

  test.open( 'big int' )

  /* qqq for junior : extend | aaa : Done*/

  test.case = 'number 3.1 and big int 3, acc 0.10001';
  var got = _.number.equivalentShallow( 3.1, 3n, 0.10001 );
  test.identical( got, true );
  var got = _.number.equivalentShallow( 3n, 3.1, 0.10001 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 3n and BIF 2n, acc BIF 1n';
  var got = _.number.equivalentShallow( 3n, 2n, 1n );
  test.identical( got, true );

  test.case = 'BIF - BigInt( Math.pow( 2, 53 ) - 1 ) and BIF 10n, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 10n';
  var got = _.number.equivalentShallow( - BigInt( Math.pow( 2, 53 ) - 1 ), 10n, BigInt( Math.pow( 2, 53 ) - 1 ) + 10n );
  test.identical( got, true );

  test.case = 'BIF 4n and BIF 3n, acc FIB 1';
  var got = _.number.equivalentShallow( 4n, 3n, 1 );
  test.identical( got, true );

  test.case = 'BIF 3n and BIF 2n, acc FOB 1.01';
  var got = _.number.equivalentShallow( 3n, 2n, 1.01 );
  test.identical( got, true );

  /* */

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 100n, acc BIF 100';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 100n );
  test.identical( got, true );

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) - 1 ) + BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, BigInt( Math.pow( 2, 53 ) - 1 ) + 1n );
  test.identical( got, true );

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 100n, acc FIB 100';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 100 );
  test.identical( got, true );

  test.case = 'BIF BigInt( Math.pow( 2, 53 ) - 1 ) and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 100n, acc FOB 100';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ), BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 100.1 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 3n and FIB 2, acc BIF 1';
  var got = _.number.equivalentShallow( 3n, 2, 1n );
  test.identical( got, true );

  test.case = 'BIF - BigInt( Math.pow( 2, 53 ) - 1 ) and FIB 10, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 10n';
  var got = _.number.equivalentShallow( - BigInt( Math.pow( 2, 53 ) - 1 ), 10, BigInt( Math.pow( 2, 53 ) - 1 ) + 10n );
  test.identical( got, true );

  test.case = 'BIF 3n and FIB 2, acc FIB 1';
  var got = _.number.equivalentShallow( 3n, 2, 1 );
  test.identical( got, true );

  test.case = 'BIF 3n and FIB 2, acc FOB 1';
  var got = _.number.equivalentShallow( 3n, 2, 1.01 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 3n and FOB 2.99, acc BIF 1n';
  var got = _.number.equivalentShallow( 3n, 2.99, 1n );
  test.identical( got, true );

  test.case = 'BIF -BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB 0.5, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 2n';
  var got = _.number.equivalentShallow( -BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, 0.5, BigInt( Math.pow( 2, 53 ) - 1 ) + 2n );
  test.identical( got, true );

  test.case = 'BIF 3n and FOB 2.99, acc FIB 1';
  var got = _.number.equivalentShallow( 3n, 2.99, 1 );
  test.identical( got, true );

  test.case = 'BIF 3n and FOB 2.5, acc FOB 0.5';
  var got = _.number.equivalentShallow( 3n, 2.5, 0.5 );
  test.identical( got, true );

  /* */

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 200n, acc BIF 100n';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 200n, 100n );
  test.identical( got, true );

  test.case = 'BOF 2n * BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n';
  var got = _.number.equivalentShallow( 2n * BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 100n );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 200n, acc FIB 100';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 200n, 100 );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and BOF BigInt( Math.pow( 2, 53 ) -1 ) + 200n, acc FOB 100.1';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, BigInt( Math.pow( 2, 53 ) - 1 ) + 200n, 100.1 );
  test.identical( got, true );

  /* */

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB Math.pow( 2, 53 ) - 1, acc BIF 100n';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, Math.pow( 2, 53 ) - 1, 100n );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB 99, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, 99, BigInt( Math.pow( 2, 53 ) - 1 ) + 1n );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB Math.pow( 2, 53 ) - 1, acc FIB 100';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, Math.pow( 2, 53 ) - 1, 100 );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 100n and FIB Math.pow( 2, 53 ) - 1, acc FOB 100.1';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 100n, Math.pow( 2, 53 ) - 1, 100.1 );
  test.identical( got, true );

  /* */

  /* BOF and FOB */

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB Math.pow( 2, 53 ) - 1.5, acc BIF 2';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, Math.pow( 2, 53 ) - 1.5 /* BECOMES -2 */, 2n );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB -1.1 acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 2n';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, -1.1 /* -1n */, BigInt( Math.pow( 2, 53 ) - 1 ) + 2n /* -1.1 => -1n, 2n difference */ );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB -1.1 acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 2n';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, -1.1, BigInt( Math.pow( 2, 53 ) - 1 ) + 1n );
  test.identical( got, false );

  /* - SPECIAL CASES - */
  test.case = 'BOF BigInt( Number.MAX_VALUE ) and FOB 0.1, acc BOF BigInt( Number.MAX_VALUE )';
  var got = _.number.equivalentShallow( BigInt( Number.MAX_VALUE ) - 1n, 0.1, BigInt( Number.MAX_VALUE ) );
  test.identical( got, true );

  test.case = 'BOF BigInt( Number.MAX_VALUE ) and FOB 0.1, acc BigInt( Number.MAX_VALUE ) - 1n';
  var got = _.number.equivalentShallow( BigInt( Number.MAX_VALUE ) - 1n, 0.1, BigInt( Number.MAX_VALUE ) - 2n );
  test.identical( got, false );

  test.case = 'BOF BigInt( Number.MAX_VALUE ) and FOB 0.1, acc BigInt( Number.MAX_VALUE ) - 1n';
  var got = _.number.equivalentShallow( BigInt( Number.MAX_VALUE ), -0.9, BigInt( Number.MAX_VALUE ) - 1n);
  test.identical( got, false );
  /* - - */

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB Math.pow( 2, 53 ) - 1.5, acc FIB 2 ';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, Math.pow( 2, 53 ) - 1.5 /* BECOMES -2 */, 2 );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB Math.pow( 2, 53 ) - 1.5, acc FOB 1.5 ';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, Math.pow( 2, 53 ) - 1.5/* BECOMES -2 */, 1.5 );
  test.identical( got, false );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB Math.pow( 2, 53 ) - 1.5, acc FOB 1.5 ';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, Math.pow( 2, 53 ) - 1.5 /* BECOMES -2 */, 2.000001 );
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB Math.pow( 2, 52 ) - 1.5, acc FOB 4503599627370497.5';
                                    /*        9007199254740992n        */ /* 4503599627370494.5 */ /* 9007199254740992n - 4503599627370494.5 */
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, Math.pow( 2, 52 ) - 1.5, 4503599627370497 /* BECOMES ROUNDED UP 4503599627370498*/);
  test.identical( got, true );

  test.case = 'BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 1n and FOB Math.pow( 2, 52 ) - 1.5, acc FOB 4503599627370496.5';
  var got = _.number.equivalentShallow( BigInt( Math.pow( 2, 53 ) - 1 ) + 1n, Math.pow( 2, 52 ) - 1.5, 4503599627370496.5 /* BECOMES ROUNDED UP 4503599627370497*/);
  test.identical( got, false );

  /* - */

  test.case = 'FIB 3 and FIB 2, acc BIF 1';
  var got = _.number.equivalentShallow( 3, 2, 1n );
  test.identical( got, true );

  test.case = 'FIB - Math.pow( 2, 53 ) - 1 and FIB 5, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 5n';
  var got = _.number.equivalentShallow( - Math.pow( 2, 53 ) - 1, 5, BigInt( Math.pow( 2, 53 ) - 1 ) + 5n );
  test.identical( got, true );

  test.case = 'FIB 3 and FIB 2, acc FIB 1';
  var got = _.number.equivalentShallow( 3, 2, 1 );
  test.identical( got, true );

  test.case = 'FIB 3 and FIB 2, acc FOB 1';
  var got = _.number.equivalentShallow( 3, 2, 1.0001 );
  test.identical( got, true );

  /* */

  test.case = 'FIB 3 and FOB 2.99, acc BIF 1n';
  var got = _.number.equivalentShallow( 3, 2.99, 1n );
  test.identical( got, true );

  test.case = 'FIB - Math.pow( 2, 53 ) - 1 and FOB 4.99, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 5n';
  var got = _.number.equivalentShallow( - Math.pow( 2, 53 ) - 1, 4.99, BigInt( Math.pow( 2, 53 ) - 1 ) + 5n );
  test.identical( got, true );

  test.case = 'FIB 3 and FOB 2.99, acc FIB 1';
  var got = _.number.equivalentShallow( 3, 2.99, 1 );
  test.identical( got, true );

  test.case = 'FIB 3 and FOB 2.5, acc FOB 0.5';
  var got = _.number.equivalentShallow( 3, 2.5, 0.5 );
  test.identical( got, true );

  /* */

  test.case = 'FOB 3.6 and FOB 2.6, acc BIF 1n';
  var got = _.number.equivalentShallow( 3.6, 2.6, 1n );
  test.identical( got, true );

  test.case = 'FOB - Math.pow( 2, 53 ) - 2.5 and FOB 2.5, acc BOF BigInt( Math.pow( 2, 53 ) - 1 ) + 5n';
  var got = _.number.equivalentShallow( - Math.pow( 2, 53 ) - 2.5, 2.5, BigInt( Math.pow( 2, 53 ) - 1 ) + 5n );
  test.identical( got, true );

  test.case = 'FOB 3.6 and FOB 2.6, acc FIB 1';
  var got = _.number.equivalentShallow( 3.6, 2.6, 1 );
  test.identical( got, true );

  test.case = 'FOB 3.6 and FOB 2.5, acc FOB 1.1';
  var got = _.number.equivalentShallow( 3.6, 2.5, 1.1 );
  test.identical( got, true );

  /* */

  test.case = 'BIF 4 and FOB 3.51, acc FIB 0';
  var got = _.number.equivalentShallow( 4n, 3.51, 0 );
  test.identical( got, false );

  test.case = 'BIF 4 and FOB 3.95, acc FIB 0';
  var got = _.number.equivalentShallow( 3n, 3.95, 0 );
  test.identical( got, false );

  test.case = 'BIF 4 and FOB 3.1, acc FIB 0';
  var got = _.number.equivalentShallow( 4n, 3.1, 0 );
  test.identical( got, false );

  /* Additional */

  // test.case = 'bigint 4 and number 3, acc number 1';
  // var got = _.number.equivalentShallow( 4n, 3, 1 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3.0, acc number 1';
  // var got = _.number.equivalentShallow( 4n, 3.0, 1 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3.0, acc bigint 1';
  // var got = _.number.equivalentShallow( 4n, 3.0, 1n );
  // test.identical( got, true );

  // test.case = 'bigint 4 and bigint 3, acc number 1';
  // var got = _.number.equivalentShallow( 4n, 3n, 1 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and bigint 3, acc number 1.0';
  // var got = _.number.equivalentShallow( 4n, 3n, 1.01 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3.5, acc number 0.5';
  // var got = _.number.equivalentShallow( 4n, 3.5, 0.5 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3, acc number 1.01';
  // var got = _.number.equivalentShallow( 4n, 3, 1.01 );
  // test.identical( got, true );

  // test.case = 'bigint 4 and number 3, acc bigint 1';
  // var got = _.number.equivalentShallow( 4n, 3, 1n );
  // test.identical( got, true );

  // test.case = 'number 4 and number 3, acc bigint 1';
  // var got = _.number.equivalentShallow( 4, 3, 1n );
  // test.identical( got, true );

  // test.case = 'number 4 and number 3.0, acc bigint 1';
  // var got = _.number.equivalentShallow( 4, 3.0, 1n );
  // test.identical( got, true );

  // test.case = 'number 4.5 and number 3.5, acc bigint 1';
  // var got = _.number.equivalentShallow( 4.5, 3.5, 1n );
  // test.identical( got, true );

  // test.case = 'bigint 4 and bigint 3, acc bigint 1';
  // var got = _.number.equivalentShallow( 4n, 3n, 1n );
  // test.identical( got, true );

  /* */

  test.close( 'big int' )

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Number.l0.l3',
  silencing : 1,
  enabled : 1,

  tests :
  {

    identicalStrictly,
    identical,
    equivalentBasic,
    equivalentArgumentAccuracy,
    equivalentBasic2,
    equivalentArgumentAccuracy2,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
