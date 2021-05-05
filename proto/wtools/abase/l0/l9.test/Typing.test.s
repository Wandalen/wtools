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

function nothingIs( test )
{
  test.case = 'without argument';
  var got = _.nothingIs();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.nothingIs( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.nothingIs( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.nothingIs( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.nothingIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.nothingIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.nothingIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.nothingIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.nothingIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.nothingIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.nothingIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.nothingIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.nothingIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.nothingIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.nothingIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.nothingIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.nothingIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.nothingIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.nothingIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.nothingIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.nothingIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.nothingIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.nothingIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.nothingIs( src );
  test.identical( got, false );
}

//

function definedIs( test )
{
  test.case = 'without argument';
  var got = _.definedIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.definedIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.definedIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.definedIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.definedIs( 0 );
  test.identical( got, true );

  test.case = 'check empty string';
  var got = _.definedIs( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.definedIs( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.definedIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.definedIs( Symbol( 'a' ) );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.definedIs( [] );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var got = _.definedIs( _.argumentsArray.make( [] ) );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var got = _.definedIs( _.unroll.make( [] ) );
  test.identical( got, true );

  test.case = 'check empty map';
  var got = _.definedIs( {} );
  test.identical( got, true );

  test.case = 'check empty pure map';
  var got = _.definedIs( Object.create( null ) );
  test.identical( got, true );

  test.case = 'check empty Set';
  var got = _.definedIs( new Set( [] ) );
  test.identical( got, true );

  test.case = 'check empty Map';
  var got = _.definedIs( new HashMap( [] ) );
  test.identical( got, true );

  test.case = 'check empty BufferRaw';
  var got = _.definedIs( new BufferRaw() );
  test.identical( got, true );

  test.case = 'check empty BufferTyped';
  var got = _.definedIs( new U8x() );
  test.identical( got, true );

  test.case = 'check number';
  var got = _.definedIs( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.definedIs( 1n );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.definedIs( 'str' );
  test.identical( got, true );

  test.case = 'check not empty array';
  var got = _.definedIs( [ null ] );
  test.identical( got, true );

  test.case = 'check not empty map';
  var got = _.definedIs( { '' : null } );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.definedIs( src );
  test.identical( got, true );
}

// --
//
// --

function vectorAdapterIs( test )
{
  test.case = 'without argument';
  var got = _.vector.adapterIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.vector.adapterIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.vector.adapterIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.vector.adapterIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.vector.adapterIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.vector.adapterIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.vector.adapterIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.vector.adapterIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.vector.adapterIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.vector.adapterIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.vector.adapterIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.vector.adapterIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.vector.adapterIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.vector.adapterIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.vector.adapterIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.vector.adapterIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.vector.adapterIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.vector.adapterIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.vector.adapterIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.vector.adapterIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.vector.adapterIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.vector.adapterIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.vector.adapterIs( { '' : null } );
  test.identical( got, false );

  /* */

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = true;
  var got = _.vector.adapterIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = false;
  var got = _.vector.adapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src._vectorBuffer = true;
  var got = _.vector.adapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with own property "constructor"';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr2();
  src.constructor = Constr2;
  src._vectorBuffer = true;
  var got = _.vector.adapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer property';
  function Constr3()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr3();
  proto._vectorBuffer = true;
  var src = new Constr3();
  src.prototype = proto;
  var got = _.vector.adapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer and own "constructor" properties';
  function Constr4()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr4();
  proto._vectorBuffer = true;
  proto.constructor = Constr4;
  var src = new Constr4();
  src.prototype = proto;
  var got = _.vector.adapterIs( src );
  test.identical( got, false );

  /* Dmytro : the second part of routine in module wMathVector */
}

//

function constructorIsVad( test )
{
  test.case = 'without argument';
  var got = _.constructorIsVad();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.constructorIsVad( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.constructorIsVad( undefined );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.constructorIsVad( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.constructorIsVad( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.constructorIsVad( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.constructorIsVad( NaN );
  test.identical( got, false );

  /* */

  test.case = 'map has property prototype';
  var proto = { a : 1 };
  var src = {};
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, false );

  test.case = 'map has property prototype and prototype has property _vectorBuffer';
  var proto = { a : 1 };
  proto._vectorBuffer = true;
  var src = {};
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, true );

  /* */

  test.case = 'check instance of constructor prototyped by another instance without _vectorBuffer property';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr1();
  var src = new Constr1();
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, false );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer property';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr2();
  proto._vectorBuffer = true;
  var src = new Constr2();
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, true );

  test.case = 'check instance of constructor prototyped by another instance with _vectorBuffer and own "constructor" properties';
  function Constr3()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr3();
  proto._vectorBuffer = true;
  proto.constructor = Constr3;
  var src = new Constr3();
  src.prototype = proto;
  var got = _.constructorIsVad( src );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'src.prototype is undefined';
  test.shouldThrowErrorSync( () => _.constructorIsVad( [] ) );
  test.shouldThrowErrorSync( () => _.constructorIsVad( {} ) );

  /* Dmytro : the second part of routine in module wMathVector */
}

//

function streamIs( test )
{

  test.open( 'not stream' )

  test.case = 'check null';
  var got = _.streamIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.streamIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.streamIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.streamIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.streamIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.streamIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.streamIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.streamIs( Symbol( '' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.streamIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.streamIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.streamIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.streamIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.streamIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.streamIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.streamIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.streamIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.streamIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.streamIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.streamIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.streamIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.streamIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.streamIs( { '' : null } );
  test.identical( got, false );

  /* */

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = true;
  var got = _.streamIs( src );
  test.identical( got, false );

  /* - */

  test.case = 'check instance of constructor';
  var src = new function()
  {
    this.x = 1;
  };
  var got = _.streamIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with pipe field';
  var src = new function()
  {
    this.x = 1;
    this.pipe = 13;
  };
  var got = _.streamIs( src );
  test.identical( got, false );

  test.case = 'IMPORTANT! check instance of constructor with pipe method';
  var src = new function()
  {
    this.x = 1;
    this.pipe = () => '';
  };
  var got = _.streamIs( src );
  test.identical( got, false );

  test.close( 'not stream' );

  /* - */

  test.open( 'stream' )

  let stream = require( 'stream' );

  test.case = 'read stream';
  var src = new stream.Readable();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.case = 'read stream';
  var src = new stream.Writable();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.case = 'read stream';
  var src = new stream.Duplex();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.case = 'read stream';
  var src = new stream.Transform();
  var got = _.streamIs( src );
  test.identical( got, true );

  test.close( 'stream' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.streamIs() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.streamIs( 1, 2 ) );

}

streamIs.experimental = true;

//

function consequenceIs( test )
{
  test.case = 'without argument';
  var got = _.consequenceIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.consequenceIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consequenceIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consequenceIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consequenceIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consequenceIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consequenceIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consequenceIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consequenceIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consequenceIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consequenceIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consequenceIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consequenceIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consequenceIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consequenceIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consequenceIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consequenceIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consequenceIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consequenceIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consequenceIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consequenceIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consequenceIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.consequenceIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consequenceIs( src );
  test.identical( got, false );

  // instance of _.Consequence tested in module wConsequence
}

//

function consequenceLike( test )
{
  test.case = 'without argument';
  var got = _.consequenceLike();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.consequenceLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consequenceLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consequenceLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consequenceLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consequenceLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consequenceLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consequenceLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consequenceLike( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consequenceLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consequenceLike( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consequenceLike( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consequenceLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consequenceLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consequenceLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consequenceLike( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consequenceLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consequenceLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consequenceLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consequenceLike( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consequenceLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consequenceLike( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.consequenceLike( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consequenceLike( src );
  test.identical( got, true );

  // instance of _.Consequence tested in module wConsequence
}

//

function promiseIs( test )
{
  test.case = 'without argument';
  var got = _.promiseIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.promiseIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.promiseIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.promiseIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.promiseIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.promiseIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.promiseIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.promiseIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.promiseIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.promiseIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.promiseIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.promiseIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.promiseIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.promiseIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.promiseIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.promiseIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.promiseIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.promiseIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.promiseIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.promiseIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.promiseIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.promiseIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.promiseIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.promiseIs( src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.promiseIs( src );
  test.identical( got, false );
}

//

function promiseLike( test )
{
  test.case = 'without argument';
  var got = _.promiseLike();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.promiseLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.promiseLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.promiseLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.promiseLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.promiseLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.promiseLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.promiseLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.promiseLike( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.promiseLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.promiseLike( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.promiseLike( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.promiseLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.promiseLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.promiseLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.promiseLike( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.promiseLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.promiseLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.promiseLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.promiseLike( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.promiseLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.promiseLike( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.promiseLike( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with not own property "constructor"';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.promiseLike( src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var got = _.promiseLike( src );
  test.identical( got, false );
}

//

function typeOf( test )
{
  test.open( 'one argument' );

  test.case = 'check null';
  var src = null;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check zero';
  var src = 0;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Number' );

  test.case = 'check false';
  var src = false;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Boolean' );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Number' );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Array' );

  test.case = 'check empty arguments array';
  var src = _.argumentsArray.make( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Object' );

  test.case = 'check empty unroll';
  var src = _.unroll.make( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Array' );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Object' );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Set' );

  test.case = 'check HashMap';
  var src = new HashMap( [ [ 1, 1 ] ] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Map' );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'ArrayBuffer' );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Uint8Array' );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Constr' );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Promise' );

  test.case = 'function _Promise';
  var _Promise = Promise;
  function Promise(){}
  var src = new _Promise();
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Promise' );

  test.close( 'one argument' );

  /* - */

  test.open( 'two arguments' );

  test.case = 'check null';
  var src = null;
  var got = _.typeOf( src, null );
  test.identical( got, true );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.typeOf( src, null );
  test.identical( got, true );

  test.case = 'check zero';
  var src = 0;
  var src1 = 1;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check false';
  var src = false;
  var src1 = true;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check NaN';
  var src = NaN;
  var src1 = 2;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var src1 = [];
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArray.make( [] );
  var src1 = _.argumentsArray.make( [ 1, 2 ] );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unroll.make( [] );
  var src1 = [ 1, 2 ];
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var src1 = {};
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var src1 = null;
  var got = _.typeOf( src, src1 );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var src1 = new Set( [ 1, 2, 3 ] );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new HashMap( [ [ 1, 1 ] ] );
  var src1 = new HashMap();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var src1 = new U8x( 10 ).buffer;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var src1 = new U8x();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check instance of constructor';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.typeOf( src, src.constructor );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var src1 = new Promise( ( resolve, reject ) => { return resolve( 1 ) } );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'function _Promise';
  function _Promise(){}
  var src = new _Promise();
  var src1 = new _Promise();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.close( 'two arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.typeOf() );

  test.case = 'src - Symbol';
  test.shouldThrowErrorSync( () => _.typeOf( Symbol( 'a' ) ) );

  test.case = 'src - BigInt';
  test.shouldThrowErrorSync( () => _.typeOf( 1n ) );
}

//

function constructorIs( test )
{
  test.case = 'check null';
  var got = _.constructorIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.constructorIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.constructorIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.constructorIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.constructorIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.constructorIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.constructorIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.constructorIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.constructorIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.constructorIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.constructorIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.constructorIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.constructorIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.constructorIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.constructorIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.constructorIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.constructorIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.constructorIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.constructorIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.constructorIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.constructorIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with property constructor';
  var got = _.constructorIs( { 'constructor' : 1 } );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.constructorIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with property constructor';
  var src = Object.create( null );
  src.constructor = false;
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with own properties constructor and Composes';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.constructorIs( Constr2 );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.constructorIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.constructorIs( src );
  test.identical( got, true );
}

//

function instanceIs( test )
{
  test.case = 'check null';
  var got = _.instanceIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.instanceIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.instanceIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.instanceIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.instanceIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.instanceIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.instanceIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.instanceIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.instanceIs( [] );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var got = _.instanceIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.instanceIs( _.unroll.make( [] ) );
  test.identical( got, true );

  test.case = 'check empty map';
  var got = _.instanceIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.instanceIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.instanceIs( new Set( [] ) );
  test.identical( got, true );

  test.case = 'check empty Map';
  var got = _.instanceIs( new HashMap( [] ) );
  test.identical( got, true );

  test.case = 'check empty BufferRaw';
  var got = _.instanceIs( new BufferRaw() );
  test.identical( got, true );

  test.case = 'check empty BufferTyped';
  var got = _.instanceIs( new U8x() );
  test.identical( got, true );

  test.case = 'check number';
  var got = _.instanceIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.instanceIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.instanceIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.instanceIs( [ null ] );
  test.identical( got, true );

  test.case = 'check map with property constructor';
  var got = _.instanceIs( { 'constructor' : 1 } );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.instanceIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with property constructor';
  var src = Object.create( null );
  src.constructor = false;
  var got = _.instanceIs( src );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.instanceIs( src );
  test.identical( got, false );

  test.case = 'check instance of constructor with own properties constructor and Composes';
  function Constr1()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr1();
  src.constructor = true;
  src.Composes = true;
  var got = _.instanceIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.instanceIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.instanceIs( src );
  test.identical( got, true );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.instanceIs( src );
  test.identical( got, false );
}

//

function consoleIs( test )
{
  test.case = 'check null';
  var got = _.consoleIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consoleIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consoleIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consoleIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consoleIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consoleIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consoleIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consoleIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consoleIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consoleIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consoleIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consoleIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consoleIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consoleIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consoleIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consoleIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consoleIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consoleIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consoleIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consoleIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consoleIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.consoleIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.consoleIs( src );
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
  var got = _.consoleIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.consoleIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consoleIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.consoleIs( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.consoleIs( src );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.consoleIs() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.consoleIs( console, console ) );

  // instance of _.Logger tested in module wLogger
}

//

function loggerIs( test )
{
  test.case = 'check null';
  var got = _.loggerIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.loggerIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.loggerIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.loggerIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.loggerIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.loggerIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.loggerIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.loggerIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.loggerIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.loggerIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.loggerIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.loggerIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.loggerIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.loggerIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.loggerIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.loggerIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.loggerIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.loggerIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.loggerIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.loggerIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.loggerIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.loggerIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.loggerIs( src );
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
  var got = _.loggerIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.loggerIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.loggerIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.loggerIs( src );
  test.identical( got, false );

  test.case = 'check console';
  var src = console;
  var got = _.loggerIs( src );
  test.identical( got, false );

  // instance of _.Logger tested in module wLogger
}

//

/* qqq : extend test processIs */
/* qqq : make similar test processIs in module::Process, but wider */
function processIs( test )
{
  test.case = 'check null';
  var got = _.processIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.processIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.processIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.processIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.processIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.processIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.processIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.processIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.processIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.processIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.processIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.processIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.processIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.processIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.processIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.processIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.processIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.processIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.processIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.processIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.processIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.processIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.processIs( src );
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
  var got = _.processIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.processIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.processIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.processIs( src );
  test.identical( got, false );

  test.case = 'check process';
  debugger;
  var src = process;
  var got = _.processIs( src );
  debugger;
  test.identical( got, true );
}

//

function procedureIs( test )
{
  test.case = 'check null';
  var got = _.procedureIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.procedureIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.procedureIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.procedureIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.procedureIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.procedureIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.procedureIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.procedureIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.procedureIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.procedureIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.procedureIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.procedureIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.procedureIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.procedureIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.procedureIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.procedureIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.procedureIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.procedureIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.procedureIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.procedureIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.procedureIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.procedureIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.procedureIs( src );
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
  var got = _.procedureIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.procedureIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.procedureIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.procedureIs( src );
  test.identical( got, false );

  test.case = 'check process';
  var src = process;
  var got = _.procedureIs( src );
  test.identical( got, false );

  // instance of _.Procedure tested in module wProcedure
}

//

function definitionIs( test )
{
  test.case = 'check null';
  var got = _.definitionIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.definitionIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.definitionIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.definitionIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.definitionIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.definitionIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.definitionIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.definitionIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.definitionIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.definitionIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.definitionIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.definitionIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.definitionIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.definitionIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.definitionIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.definitionIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.definitionIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.definitionIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.definitionIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.definitionIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.definitionIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.definitionIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.definitionIs( src );
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
  var got = _.definitionIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.definitionIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.definitionIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.definitionIs( src );
  test.identical( got, false );

  test.case = 'check process';
  var src = process;
  var got = _.definitionIs( src );
  test.identical( got, false );

  /* aaa2 : ask */
  /* Dmytro : instances of another modules tested outside of module wTools */

  // instance of _.Definition tested in module wBlueprint
}

//

function traitIs( test )
{
  test.case = 'check null';
  var got = _.traitIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.traitIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.traitIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.traitIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.traitIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.traitIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.traitIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.traitIs( Symbol( 'a' ) );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.traitIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.traitIs( _.argumentsArray.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.traitIs( _.unroll.make( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.traitIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.traitIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.traitIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.traitIs( new HashMap( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.traitIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.traitIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.traitIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.traitIs( 1n );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.traitIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.traitIs( [ null ] );
  test.identical( got, false );

  test.case = 'check map with properties constructor and Composes';
  var got = _.traitIs( { 'constructor' : 1, 'Composes' : 1 } );
  test.identical( got, false );

  test.case = 'check pure map with properties constructor and Composes';
  var src = Object.create( null );
  src.constructor = false;
  src.Composes = 1;
  var got = _.traitIs( src );
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
  var got = _.traitIs( src );
  test.identical( got, false );

  test.case = 'check constructor';
  function Constr2()
  {
    this.x = 1;
    return this;
  };
  var got = _.traitIs( Constr2 );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.traitIs( src );
  test.identical( got, false );

  test.case = 'function _Promise';
  function Promise(){}
  var src = Promise;
  var got = _.traitIs( src );
  test.identical( got, false );

  test.case = 'check process';
  var src = process;
  var got = _.traitIs( src );
  test.identical( got, false );

  // instance of _.trait tested in module wBlueprint
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Typing.l0.l9',
  silencing : 1,

  tests :
  {

    nothingIs,
    definedIs,

    vectorAdapterIs, /* xxx */
    constructorIsVad,
    streamIs,

    consequenceIs,
    consequenceLike,
    promiseIs,
    promiseLike,

    typeOf,

    constructorIs,
    instanceIs,

    consoleIs,
    loggerIs,
    processIs,
    procedureIs,

    definitionIs, /* xxx : move to namespace::property */
    traitIs, /* xxx : move to namespace::property */

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
