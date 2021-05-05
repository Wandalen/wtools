( function _l0_l9_Symbol_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;

// --
// tests
// --


function is( test )
{
  test.case = 'without argument';
  var got = _.symbol.is();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.symbol.is( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.symbol.is( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.symbol.is( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.symbol.is( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.symbol.is( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.symbol.is( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.symbol.is( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.symbol.is( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.symbol.is( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.symbol.is( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.symbol.is( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.symbol.is( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.symbol.is( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.symbol.is( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.symbol.is( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.symbol.is( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.symbol.is( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.symbol.is( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.symbol.is( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.symbol.is( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.symbol.is( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.symbol.is( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.symbol.is( src );
  test.identical( got, false );
}

//

function exportStringCodeShallow( test )
{
  test.case = 'Symbol( a )';
  var src = Symbol( 'a' );
  var expected = `Symbol.for( 'a' )`;
  var got = _.symbol.exportStringCodeShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol.for( a )';
  var src = Symbol.for( 'a' );
  var expected = `Symbol.for( 'a' )`;
  var got = _.symbol.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToSymbol( got ), src );

  /* error eslint : Symbol(), passes */
  // test.case = 'Symbol()';
  // var src = Symbol();
  // var expected = `Symbol.for()`;
  // var got = _.symbol.exportStringCodeShallow( src );
  // test.identical( got, expected );

  test.case = 'Symbol.for()';
  var src = Symbol.for();
  var expected = `Symbol.for( 'undefined' )`;
  var got = _.symbol.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToSymbol( got ), src );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = `Symbol.for( 'null' )`;
  var got = _.symbol.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToSymbol( got ), src );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = `Symbol.for( 'undefined' )`;
  var got = _.symbol.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToSymbol( got ), src );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = `Symbol.for( 'nothing' )`;
  var got = _.symbol.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToSymbol( got ), src );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.symbol.exportStringCodeShallow() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.symbol.exportStringCodeShallow( 1 ) );

  /* - */

  function strToSymbol( stringSymbol )
  {
    return Function( `return ${stringSymbol}` )();
  }
}

//

function exportStringDiagnosticShallow( test )
{

  test.case = 'Symbol( a )';
  var src = Symbol( 'a' );
  var expected = '{- Symbol a -}';
  var got = _.symbol.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol.for( a )';
  var src = Symbol.for( 'a' );
  var expected = '{- Symbol a -}';
  var got = _.symbol.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  /* error eslint : Symbol(), passes */
  // test.case = 'Symbol()';
  // var src = Symbol();
  // var expected = '{- Symbol -}';
  // var got = _.symbol.exportStringDiagnosticShallow( src );
  // test.identical( got, expected );

  test.case = 'Symbol.for()';
  var src = Symbol.for();
  var expected = '{- Symbol undefined -}';
  var got = _.symbol.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = '{- Symbol null -}';
  var got = _.symbol.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = '{- Symbol undefined -}';
  var got = _.symbol.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = '{- Symbol nothing -}';
  var got = _.symbol.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.symbol.exportStringDiagnosticShallow() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.symbol.exportStringDiagnosticShallow( 1 ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Symbol.l0.l9',
  silencing : 1,

  tests :
  {
    is,
    exportStringCodeShallow,
    exportStringDiagnosticShallow
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
