( function _l0_l9_BigInt_test_s_()
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
  var got = _.bigInt.is();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.bigInt.is( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.bigInt.is( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.bigInt.is( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.bigInt.is( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.bigInt.is( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.bigInt.is( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.bigInt.is( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.bigInt.is( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.bigInt.is( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.bigInt.is( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.bigInt.is( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.bigInt.is( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.bigInt.is( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.bigInt.is( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.bigInt.is( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.bigInt.is( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.bigInt.is( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.bigInt.is( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.bigInt.is( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.bigInt.is( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.bigInt.is( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.bigInt.is( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.bigInt.is( src );
  test.identical( got, false );
}

//

function exportStringCodeShallow( test )
{
  test.case = '1n';
  var src = 1n;
  var expected = '1n';
  var got = _.bigInt.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToBigInt( got ), src );

  test.case = '1000n';
  var src = 1000n;
  var expected = '1000n';
  var got = _.bigInt.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToBigInt( got ), src );

  test.case = 'BigInt( 5 )';
  var src = BigInt( 5 );
  var expected = '5n'
  var got = _.bigInt.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToBigInt( got ), src );

  test.case = 'BigInt( \'5\' )';
  var src = BigInt( '5' );
  var expected = '5n'
  var got = _.bigInt.exportStringCodeShallow( src );
  test.identical( got, expected );
  test.identical( strToBigInt( got ), src );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.bigInt.exportStringCodeShallow() );

  test.case = 'not a bigInt';
  test.shouldThrowErrorSync( () => _.bigInt.exportStringCodeShallow( 1 ) );

  /* - */

  function strToBigInt( stringBigInt )
  {
    return Function( `return ${stringBigInt}` )();
  }
}


// --
// declaration
// --

const Proto =
{

  name : 'Tools.BigInt.l0.l9',
  silencing : 1,

  tests :
  {
    is,
    exportStringCodeShallow
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
