( function _l0_l9_Typing_test_s_()
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

function is( test ) /* qqq : merge test wProto/prototypeIs in this one | Dmytro : routine extended by cases from wProto */
{
  test.case = 'check null';
  var got = _.prototype.is( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.prototype.is( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.prototype.is( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.prototype.is( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.prototype.is( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.prototype.is( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.prototype.is( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.prototype.is( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.prototype.is( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.prototype.is( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.prototype.is( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.prototype.is( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.prototype.is( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.prototype.is( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.prototype.is( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.prototype.is( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.prototype.is( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.prototype.is( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.prototype.is( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.prototype.is( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.prototype.is( [ null ] );
  test.identical( got, false );

  test.case = 'check map with property constructor';
  var got = _.prototype.is( { 'constructor' : 1 } );
  test.identical( got, true );

  /* */

  test.case = 'check regexp';
  var got = _.prototype.is( /x/ );
  test.identical( got, false );

  test.case = 'check Date constructor';
  var got = _.prototype.is( Date );
  test.identical( got, false );

  test.case = 'check instance of Date constructor';
  var got = _.prototype.is( new Date() );
  test.identical( got, false );

  test.case = 'check function';
  var got = _.prototype.is( function(){} );
  test.identical( got, false );

  test.case = 'check instance of function';
  var got = _.prototype.is( new ( function(){} )() );
  test.identical( got, false );

  test.case = 'check this.constructor';
  var got = _.prototype.is( Self.constructor );
  test.identical( got, false );

  test.case = 'check Self';
  var got = _.prototype.is( Self );
  test.identical( got, false );

  /* */

  test.case = 'check prototype of array';
  var got = _.prototype.is( Object.getPrototypeOf( [] ) );
  test.identical( got, true );

  test.case = 'check prototype of regexp';
  var got = _.prototype.is( Object.getPrototypeOf( /x/ ) );
  test.identical( got, true );

  test.case = 'check prototype of Date instance';
  var got = _.prototype.is( Object.getPrototypeOf( new Date() ) );
  test.identical( got, true );

  test.case = 'check prototype of BufferTyped instance';
  var got = _.prototype.is( Object.getPrototypeOf( new F32x() ) );
  test.identical( got, true );

  test.case = 'check prototype of function instance';
  var got = _.prototype.is( Object.getPrototypeOf( new (function(){})() ) );
  test.identical( got, true );

  test.case = 'check prototype of Self';
  var got = _.prototype.is( Object.getPrototypeOf( Self ) );
  test.identical( got, true );

  /* */

  test.case = 'check map with property constructor';
  var src = Object.create( null );
  src.constructor = false;
  var got = _.prototype.is( src );
  test.identical( got, true );

  test.case = 'check instance of constructor with own property "constructor"';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  var got = _.prototype.is( src );
  test.identical( got, true );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var proto = { constructor : true };
  Constr2.prototype = proto;
  var src = new Constr2();
  var got = _.prototypeIs( src );
  test.identical( src.constructor, true );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.prototype.is( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.prototype.is( src );
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.prototype.is() );

  test.case = 'extra argum.ints';
  test.shouldThrowErrorSync( () => _.prototype.is( {}, 'extra' ) );
}

//

function prototypeOf( test )
{
  test.open( 'subPrototype === superPrototype' );

  var prototypeOf = _.prototype.isPrototypeFor;

  test.case = 'check null';
  var src = null;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check undefined';
  var src = undefined;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check zero';
  var src = 0;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check false';
  var src = false;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check NaN';
  var src = NaN;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArray.make( [] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unroll.make( [] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BigIng';
  var src = 1n;
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = prototypeOf( src, src );
  test.identical( got, true );

  test.close( 'subPrototype === superPrototype' );

  /* - */

  test.open( 'one argument is undefines' );

  test.case = 'check null';
  var src = null;
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check undefined';
  var src = undefined;
  var got = prototypeOf( src, null );
  test.identical( got, false );

  test.case = 'check zero';
  var src = 0;
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check false';
  var src = false;
  var got = prototypeOf( undefined, src );
  test.identical( got, false );

  test.case = 'check NaN';
  var src = NaN;
  var got = prototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var src = _.argumentsArray.make( [] );
  var got = prototypeOf( src, null );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var src = _.unroll.make( [] );
  var got = prototypeOf( 0, src );
  test.identical( got, false );

  test.case = 'check map';
  var src = { a : 2 };
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = prototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = prototypeOf( src, false );
  test.identical( got, false );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = prototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check BigIng';
  var src = 1n;
  var got = prototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = prototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = prototypeOf( false, src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = prototypeOf( undefined, src );
  test.identical( got, false );


  test.close( 'one argument is undefines' );

  /* - */

  test.open( 'two objects' );

  test.case = 'subPrototype - Object.prototype, superPrototype - simple map';
  var src = {};
  var got = prototypeOf( Object.prototype, src );
  test.identical( got, true );

  test.case = 'subPrototype - simple map, superPrototype - Object.prototype';
  var src = {};
  var got = prototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - simple map';
  var src = {};
  var got = prototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - pure map';
  var src = {};
  var got = prototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = {};
  var got = prototypeOf( Object.create( null ), src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - Object.prototype';
  var src = Object.create( null );
  var got = prototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - Object.prototype, superPrototype - pure map';
  var src = Object.create( null );
  var got = prototypeOf( Object.prototype, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = Object.create( null );
  var got = prototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = Object.create( null );
  var got = prototypeOf( {}, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map';
  var src = Object.create( null );
  var got = prototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map from subPrototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( prototype, src );
  test.identical( got, true );

  test.case = 'subPrototype - pure map from superPrototype, superPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, prototype );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - Object.prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - Object.prototype, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( Object.prototype, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - simple map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( {}, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = prototypeOf( Object.create( null ), src );
  test.identical( got, false );

  /* */

  test.case = 'one constructor prototyped by another, not prototype';
  function proto01(){ this.a = 0; return this };
  function proto02(){ this.x = 1; return this };
  proto02.prototype = new proto01();
  function prototyped0(){ this.y = 1; return this };
  prototyped0.prototype = new proto02();
  var src = new prototyped0();
  var got = prototypeOf( src, proto02.prototype );
  test.identical( got, false );

  test.case = 'one constructor prototyped by another, prototype';
  function proto11(){ this.a = 0; return this };
  function proto12(){ this.x = 1; return this };
  proto12.prototype = new proto11();
  function prototyped1(){ this.y = 1; return this };
  prototyped1.prototype = new proto12();
  var src = new prototyped1();
  var got = prototypeOf( proto12.prototype, src );
  test.identical( got, true );

  test.close( 'two objects' );
}

//

function has2( test )
{

  test.case = 'map';
  var src = {};
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, src );
  test.identical( got, true );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, Object.prototype );
  test.identical( got, true );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( Object.prototype, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, {} );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( {}, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( Object.create( null ), src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, Object.create( null ) );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( null, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, null );
  test.identical( got, false );

  test.case = 'pure map';
  var src = Object.create( null );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, src );
  test.identical( got, true );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, Object.prototype );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( Object.prototype, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, {} );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( {}, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( Object.create( null ), src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, Object.create( null ) );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( null, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, null );
  test.identical( got, false );

  test.case = 'map chain';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, src );
  test.identical( got, true );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, prototype );
  test.identical( got, true );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( prototype, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, Object.prototype );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( Object.prototype, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, {} );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( {}, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( Object.create( null ), src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, Object.create( null ) );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( null, src );
  test.identical( got, false );
  var got = /*_.prototype.hasPrototype*/_.prototype.has( src, null );
  test.identical( got, false );

}

//

function has( test )
{
  test.open( 'subPrototype === superPrototype' );

  test.case = 'check null';
  var src = null;
  var got = _.prototype.has( src, src );
  test.identical( got, false );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.prototype.has( src, src );
  test.identical( got, false );

  test.case = 'check zero';
  var src = 0;
  var got = _.prototype.has( src, src );
  test.identical( got, false );

  test.case = 'check false';
  var src = false;
  var got = _.prototype.has( src, src );
  test.identical( got, false );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.prototype.has( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArray.make( [] );
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unroll.make( [] );
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check BigIng';
  var src = 1n;
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.prototype.has( src, src );
  test.identical( got, true );

  test.close( 'subPrototype === superPrototype' );

  /* - */

  test.open( 'one argument is undefines' );

  test.case = 'check null';
  var src = null;
  var got = _.prototype.has( src, undefined );
  test.identical( got, false );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.prototype.has( src, null );
  test.identical( got, false );

  test.case = 'check zero';
  var src = 0;
  var got = _.prototype.has( false, src );
  test.identical( got, false );

  test.case = 'check false';
  var src = false;
  var got = _.prototype.has( undefined, src );
  test.identical( got, false );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.prototype.has( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.prototype.has( false, src );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var src = _.argumentsArray.make( [] );
  var got = _.prototype.has( src, null );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var src = _.unroll.make( [] );
  var got = _.prototype.has( 0, src );
  test.identical( got, false );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.prototype.has( src, undefined );
  test.identical( got, false );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.prototype.has( null, src );
  test.identical( got, false );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.prototype.has( src, false );
  test.identical( got, false );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.prototype.has( null, src );
  test.identical( got, false );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.prototype.has( src, undefined );
  test.identical( got, false );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.prototype.has( false, src );
  test.identical( got, false );

  test.case = 'check BigIng';
  var src = 1n;
  var got = _.prototype.has( null, src );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.prototype.has( src, undefined );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.prototype.has( false, src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.prototype.has( undefined, src );
  test.identical( got, false );


  test.close( 'one argument is undefines' );

  /* - */

  test.open( 'two objects' );

  test.case = 'superPrototype - Object.prototype, subPrototype - simple map';
  var src = {};
  var got = _.prototype.has( Object.prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - simple map, subPrototype - Object.prototype';
  var src = {};
  var got = _.prototype.has( src, Object.prototype );
  test.identical( got, true );

  test.case = 'superPrototype - simple map, subPrototype - simple map';
  var src = {};
  var got = _.prototype.has( src, {} );
  test.identical( got, false );

  test.case = 'superPrototype - simple map, subPrototype - pure map';
  var src = {};
  var got = _.prototype.has( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - simple map';
  var src = {};
  var got = _.prototype.has( Object.create( null ), src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - Object.prototype';
  var src = Object.create( null );
  var got = _.prototype.has( src, Object.prototype );
  test.identical( got, false );

  test.case = 'superPrototype - Object.prototype, subPrototype - pure map';
  var src = Object.create( null );
  var got = _.prototype.has( Object.prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - simple map';
  var src = Object.create( null );
  var got = _.prototype.has( src, {} );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - simple map';
  var src = Object.create( null );
  var got = _.prototype.has( {}, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - pure map';
  var src = Object.create( null );
  var got = _.prototype.has( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - pure map from superPrototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map from subPrototype, subPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( src, prototype );
  test.identical( got, true );

  test.case = 'superPrototype - pure map from prototype, subPrototype - Object.prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( src, Object.prototype );
  test.identical( got, false );

  test.case = 'superPrototype - Object.prototype, subPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( Object.prototype, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map from prototype, subPrototype - simple map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( src, {} );
  test.identical( got, false );

  test.case = 'superPrototype - simple map, subPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( {}, src );
  test.identical( got, false );

  test.case = 'superPrototype - pure map from prototype, subPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'superPrototype - pure map, subPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.prototype.has( Object.create( null ), src );
  test.identical( got, false );

  /* */

  test.case = 'one constructor prototyped by another, has prototype';
  function proto01(){ this.a = 0; return this };
  function proto02(){ this.x = 1; return this };
  proto02.prototype = new proto01();
  function prototyped0(){ this.y = 1; return this };
  prototyped0.prototype = new proto02();
  var src = new prototyped0();
  var got = _.prototype.has( src, proto02.prototype );
  test.identical( got, true );

  test.case = 'one constructor prototyped by another, has not prototype';
  function proto11(){ this.a = 0; return this };
  function proto12(){ this.x = 1; return this };
  proto12.prototype = new proto11();
  function prototyped1(){ this.y = 1; return this };
  prototyped1.prototype = new proto12();
  var src = new prototyped1();
  var got = _.prototype.has( proto12.prototype, src );
  test.identical( got, false  );

  test.close( 'two objects' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.prototype.has() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.prototype.has( {} ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.prototype.has( {}, {}, 'extra' ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Prototype',
  silencing : 1,

  tests :
  {

    is,
    prototypeOf,

    has2,
    has, /* qqq : merge with has2 */

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
