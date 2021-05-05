( function _l0_l9_Printer_test_s_()
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
  test.case = 'check null';
  var got = _.printer.is( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.printer.is( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.printer.is( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.printer.is( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.printer.is( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.printer.is( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.printer.is( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.printer.is( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.printer.is( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.printer.is( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.printer.is( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.printer.is( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.printer.is( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.printer.is( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.printer.is( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.printer.is( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.printer.is( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.printer.is( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.printer.is( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.printer.is( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.printer.is( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.printer.is( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.printer.is( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.printer.is( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.printer.is( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.printer.is( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.printer.is( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.printer.is( src );
  test.identical( got, false );

  // instance of _.Logger tested in module wLogger
}

//

function like( test )
{
  test.case = 'check null';
  var got = _.printer.like( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.printer.like( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.printer.like( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.printer.like( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.printer.like( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.printer.like( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.printer.like( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.printer.like( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.printer.like( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.printer.like( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.printer.like( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.printer.like( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.printer.like( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.printer.like( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.printer.like( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.printer.like( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.printer.like( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.printer.like( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.printer.like( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.printer.like( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.printer.like( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.printer.like( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.printer.like( src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.printer.like( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.printer.like( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.printer.like( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.printer.like( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.printer.like( src );
  test.identical( got, true );

  test.case = 'check global logger';
  var src = _global.logger;
  var got = _.printer.like( src );
  test.identical( got, true );

  // instance of _.Logger tested in module wLogger
}

//


// --
// declaration
// --

const Proto =
{

  name : 'Tools.Printer.l0.l9',
  silencing : 1,

  tests :
  {
    is,
    like,
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
