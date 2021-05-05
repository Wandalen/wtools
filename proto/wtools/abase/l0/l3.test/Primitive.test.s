( function _l0_l3_Primitive_test_s_()
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

// --
// tests
// --

function identicalShallow( test )
{
  test.open( 'identical' );

  test.case = 'null';
  var got = _.primitive.identicalShallow( null, null );
  test.identical( got, true );

  test.case = 'undefined';
  var got = _.primitive.identicalShallow( undefined, undefined );
  test.identical( got, true );

  test.case = 'symbol _.nothing';
  var got = _.primitive.identicalShallow( _.nothing, _.nothing );
  test.identical( got, true );

  test.case = 'empty string';
  var got = _.primitive.identicalShallow( '', '' );
  test.identical( got, true );

  test.case = 'non-empty string';
  var got = _.primitive.identicalShallow( 'aa', 'aa' );
  test.identical( got, true );

  test.case = 'number';
  var got = _.primitive.identicalShallow( 1, 1 );
  test.identical( got, true );

  test.case = 'zero';
  var got = _.primitive.identicalShallow( 0, 0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.primitive.identicalShallow( NaN, NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.primitive.identicalShallow( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'BigInt';
  var got = _.primitive.identicalShallow( 10n, 10n );
  test.identical( got, true );

  test.case = 'Bool';
  var got = _.primitive.identicalShallow( true, true );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'null - undefined';
  var got = _.primitive.identicalShallow( null, undefined );
  test.identical( got, false );

  test.case = 'symbols _.nothing - _.null';
  var got = _.primitive.identicalShallow( _.nothing, _.null );
  test.identical( got, false );

  test.case = 'empty string - non-empty';
  var got = _.primitive.identicalShallow( '', 'a' );
  test.identical( got, false );

  test.case = 'non-empty strings';
  var got = _.primitive.identicalShallow( 'aa', 'aab' );
  test.identical( got, false );

  test.case = 'numbers';
  var got = _.primitive.identicalShallow( 1, 2 );
  test.identical( got, false );

  test.case = '-0 and +0';
  var got = _.primitive.identicalShallow( -0, +0 );
  test.identical( got, false );

  test.case = 'NaN - number';
  var got = _.primitive.identicalShallow( NaN, 1 );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.primitive.identicalShallow( -Infinity, Infinity );
  test.identical( got, false );

  test.case = 'BigInt';
  var got = _.primitive.identicalShallow( 10n, 9n );
  test.identical( got, false );

  test.case = 'same BigInt and number';
  var got = _.primitive.identicalShallow( 10n, 10 );
  test.identical( got, false );

  test.case = 'Bool';
  var got = _.primitive.identicalShallow( true, false );
  test.identical( got, false );

  test.case = 'non primitives 1 arg';
  var got = _.primitive.identicalShallow( 1, { a : 1 } );
  test.identical( got, false );
  var got = _.primitive.identicalShallow( { a : 1 }, 1 );
  test.identical( got, false );
  var got = _.primitive.identicalShallow( [ 1 ], 1 );
  test.identical( got, false );

  test.case = 'non primitives';
  var got = _.primitive.identicalShallow( {}, {} );
  test.identical( got, false );

  test.close( 'not identical' );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( () => _.primitive.identicalShallow() )

  // test.case = 'extra arguments';
  // test.shouldThrowErrorSync( () => _.primitive.identicalShallow( 1, 1, 1 ) )

}

//

function equivalentShallow( test )
{
  test.open( 'identical' );

  test.case = 'null';
  var got = _.primitive.equivalentShallow( null, null );
  test.identical( got, true );

  test.case = 'undefined';
  var got = _.primitive.equivalentShallow( undefined, undefined );
  test.identical( got, true );

  test.case = 'symbol _.nothing';
  var got = _.primitive.equivalentShallow( _.nothing, _.nothing );
  test.identical( got, true );

  test.case = 'empty string';
  var got = _.primitive.equivalentShallow( '', '' );
  test.identical( got, true );

  test.case = 'non-empty string';
  var got = _.primitive.equivalentShallow( 'aa', 'aa' );
  test.identical( got, true );

  /* ?? */
  // test.case = 'string with spaces and non-empty string';
  // var got = _.primitive.equivalentShallow( ' aa ', 'aa' );
  // test.identical( got, true );

  test.case = 'number & boolLike';
  var got = _.primitive.equivalentShallow( 1, 1 );
  test.identical( got, true );

  test.case = 'number & number with accuracy';
  var got = _.primitive.equivalentShallow( 1, 2, 1 );
  test.identical( got, true );

  test.case = 'zero';
  var got = _.primitive.equivalentShallow( 0, 0 );
  test.identical( got, true );

  test.case = '-0 and +0';
  var got = _.primitive.equivalentShallow( -0, +0 );
  test.identical( got, true );

  test.case = 'NaN';
  var got = _.primitive.equivalentShallow( NaN, NaN );
  test.identical( got, true );

  test.case = 'Infinity';
  var got = _.primitive.equivalentShallow( Infinity, Infinity );
  test.identical( got, true );

  test.case = 'BigInt';
  var got = _.primitive.equivalentShallow( 10n, 10n );
  test.identical( got, true );

  test.case = 'Bool';
  var got = _.primitive.equivalentShallow( true, true );
  test.identical( got, true );

  test.case = 'Bool and bollLike';
  var got = _.primitive.equivalentShallow( true, 1 );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'null - undefined';
  var got = _.primitive.equivalentShallow( null, undefined );
  test.identical( got, false );

  test.case = 'symbols _.nothing - _.null';
  var got = _.primitive.equivalentShallow( _.nothing, _.null );
  test.identical( got, false );

  test.case = 'empty string - non-empty';
  var got = _.primitive.equivalentShallow( '', 'a' );
  test.identical( got, false );

  test.case = 'non-empty strings';
  var got = _.primitive.equivalentShallow( 'aa', 'aab' );
  test.identical( got, false );

  test.case = 'numbers';
  var got = _.primitive.equivalentShallow( 1, 2 );
  test.identical( got, false );

  test.case = 'NaN - number';
  var got = _.primitive.equivalentShallow( NaN, 1 );
  test.identical( got, false );

  test.case = 'Infinity';
  var got = _.primitive.equivalentShallow( -Infinity, Infinity );
  test.identical( got, false );

  // test.case = 'BigInt';
  // var got = _.primitive.equivalentShallow( 10n, 9n );
  // test.identical( got, false );

  // test.case = 'same BigInt and number';
  // var got = _.primitive.equivalentShallow( 10n, 10 );
  // test.identical( got, true );

  test.case = 'Bool';
  var got = _.primitive.equivalentShallow( true, false );
  test.identical( got, false );

  test.case = 'Bool and bollLike';
  var got = _.primitive.equivalentShallow( true, 0 );
  test.identical( got, false );

  test.case = 'non-primitive';
  var got = _.primitive.equivalentShallow( {}, {} );
  test.identical( got, false );

  test.close( 'not identical' );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( () => _.primitive.equivalentShallow() )

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.primitive.equivalentShallow( 1, 1, 1, 1 ) )

  // test.case = 'non primitive arguments';
  // test.shouldThrowErrorSync( () => _.primitive.equivalentShallow( {}, {} ) )

}

//

function exportStringCodeShallow( test )
{

  test.case = 'Number';
  var src = 10;
  var expected = '10';
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'string';
  var src = 'string';
  var expected = '\'string\'';
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'bool';
  var src = true;
  var expected = 'true';
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'bigInt';
  var src = 10n;
  var expected = '10n';
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol( a )';
  var src = Symbol( 'a' );
  var expected = `Symbol.for( 'a' )`;
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol.for( a )';
  var src = Symbol.for( 'a' );
  var expected = `Symbol.for( 'a' )`;
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol.for()';
  var src = Symbol.for();
  var expected = `Symbol.for( 'undefined' )`;
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = `Symbol.for( 'null' )`;
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = `Symbol.for( 'undefined' )`;
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = `Symbol.for( 'nothing' )`;
  var got = _.primitive.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToPrimitive( got ), src );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.primitive.exportStringCodeShallow() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.primitive.exportStringCodeShallow( {} ) );

  /* - */

  function strToPrimitive( string )
  {
    return Function( `return ${string}` )();
  }
}

//

function exportStringDiagnosticShallow( test )
{

  test.case = 'Number';
  var src = 10;
  var expected = '10';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'string';
  var src = 'string';
  var expected = 'string';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'bool';
  var src = true;
  var expected = 'true';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'bigInt';
  var src = 10n;
  var expected = '10n';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol( a )';
  var src = Symbol( 'a' );
  var expected = '{- Symbol a -}';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol.for( a )';
  var src = Symbol.for( 'a' );
  var expected = '{- Symbol a -}';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol.for()';
  var src = Symbol.for();
  var expected = '{- Symbol undefined -}';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = '{- Symbol null -}';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = '{- Symbol undefined -}';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = '{- Symbol nothing -}';
  var got = _.primitive.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.primitive.exportStringDiagnosticShallow() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.primitive.exportStringDiagnosticShallow( {} ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Primitive.l0.l3',
  silencing : 1,

  tests :
  {

    identicalShallow,
    equivalentShallow,

    exportStringCodeShallow,
    exportStringDiagnosticShallow,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
