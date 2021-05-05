( function _l0_l1_Object_test_s_()
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
// tests
//--

/* qqq : extend and implement tests for other routines */
function make( test )
{

  // test.case = 'without arguments';
  // var got = _.object.make();
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  //
  // test.case = 'src - null';
  // var got = _.object.make( null );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  //
  // test.case = 'src - undefined';
  // var got = _.object.make( undefined );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );

  /* */

  test.case = 'src - empty polluted map';
  var src = {};
  var got = _.object.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - not empty polluted map';
  var src = { a : 7, b : 13 };
  var got = _.object.make( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var src = Object.create( null );
  var got = _.object.make( src );
  var expected = {};
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  test.case = 'src - pure map';
  var src = Object.create( null );
  src.a = 7;
  src.b = 13;
  var got = _.object.make( src );
  var expected = { a : 7, b : 13 };
  test.identical( got, expected );
  test.true( _.mapIsPure( got ) );
  test.true( got !== src );

  // test.case = 'src - empty Map';
  // var src = new HashMap([]);
  // var got = _.object.make( src );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );
  //
  // test.case = 'src - pure map';
  // var src = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  // var got = _.object.make( src );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );

  /* */

  test.case = 'date';
  var src = new Date();
  var got = _.object.make( src );
  var expected = src;
  test.identical( got, expected );
  test.true( _.dateIs( got ) );
  test.true( got !== src );

  /* */

  test.case = 'regexp';
  var src = /abc/;
  var got = _.object.make( src );
  var expected = /abc/;
  test.identical( got, expected );
  test.true( _.regexpIs( got ) );
  test.true( got !== src );

  /* */

  // test.case = 'src - empty array';
  // var src = [];
  // var got = _.object.make( src );
  // var expected = {};
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );
  //
  // test.case = 'src - array with primitives';
  // var src = [ 0, 'str', null, undefined ];
  // var got = _.object.make( src );
  // var expected = { 0 : 0, 1 : 'str', 2 : null, 3 : undefined };
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );
  //
  // test.case = 'src - array with maps';
  // var src = [ { a : 7 }, { b : 13 } ];
  // var got = _.object.make( src );
  // var expected = { 0 : { a : 7 }, 1 : { b : 13 } };
  // test.identical( got, expected );
  // test.true( _.mapIsPure( got ) );
  // test.true( got !== src );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.object.make( { a : 1 }, { a : 'extra' } ) );

  test.case = 'wrong argument';
  test.shouldThrowErrorSync( () => _.object.make( '' ) );
  test.shouldThrowErrorSync( () => _.object.make( 1 ) );
  test.shouldThrowErrorSync( () => _.object.make( false ) );
  test.shouldThrowErrorSync( () => _.object.make( undefined ) );
  test.shouldThrowErrorSync( () => _.object.make( null ) );
  test.shouldThrowErrorSync( () => _.object.make( Map ) );
  test.shouldThrowErrorSync( () => _.object.make( [] ) );
  test.shouldThrowErrorSync( () => _.object.make() );

}

//

/* qqq : for junior : extend with other dichotomy checks */
function dichotomy( test )
{
  test.case = 'number';
  var src = 1;
  test.true( !_.object.isBasic( src ) );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  test.true( !_.object.isBasic( src ) );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 1;
  test.true( !_.object.isBasic( src ) );

  test.case = 'fuzzy';
  var src = _.maybe;
  test.true( !_.object.isBasic( src ) );

  test.case = 'bigint';
  var src = 10n;
  test.true( !_.object.isBasic( src ) );

  test.case = 'str & regexpLike';
  var src = 'str';
  test.true( !_.object.isBasic( src ) );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  test.true( !_.object.isBasic( src ) );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  test.true( !_.object.isBasic( src ) );

  test.case = 'unroll';
  var src = _.unroll.make([ 2, 3, 4 ]);
  test.true( !_.object.isBasic( src ) );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  test.true( !_.object.isBasic( src ) );

  test.case = 'long & longLike';
  var src = _.long.make([ 1, 2 ]);
  test.true( !_.object.isBasic( src ) );

  test.case = 'vector & vectorLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  test.true( _.object.isBasic( src ) );

  test.case = 'countable & countableLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
  test.true( _.object.isBasic( src ) );

  test.case = 'Global & GlobalReal';
  var src = global;
  test.true( !_.object.isBasic( src ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( global );
  test.true( !_.object.isBasic( src ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = { [ Symbol.iterator ] : 1 };
  test.true( _.object.isBasic( src ) );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  test.true( _.object.isBasic( src ) );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  test.true( _.object.isBasic( src ) );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  test.true( _.object.isBasic( src ) );

  test.case = 'HashMap';
  var src = new HashMap();
  test.true( !_.object.isBasic( src ) );

  test.case = 'Set & SetLike';
  var src = new Set();
  test.true( !_.object.isBasic( src ) );

  test.case = 'BufferNode';
  var src = BufferNode.from( 'str' );
  test.true( !_.object.isBasic( src ) );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  test.true( !_.object.isBasic( src ) );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  test.true( !_.object.isBasic( src ) );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  test.true( !_.object.isBasic( src ) );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) )
  test.true( !_.object.isBasic( src ) );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  test.true( !_.object.isBasic( src ) );

  test.case = 'err';
  var src = _.err( 'error' );
  test.true( !_.object.isBasic( src ) );

  test.case = 'interval & BufferTyped';
  var src = new F32x( 2 );
  test.true( !_.object.isBasic( src ) );

  test.case = 'pair';
  var src = _.pair.make();
  test.true( !_.object.isBasic( src ) );

  test.case = 'path & str';
  var src = '/a/b/';
  test.true( !_.object.isBasic( src ) );

  test.case = 'routine & routineLike';
  var src = routine;
  test.true( !_.object.isBasic( src ) );

  test.case = 'date & objectLike';
  var src = new Date();
  test.true( !_.object.isBasic( src ) );

  test.case = 'null';
  var src = null;
  test.true( !_.object.isBasic( src ) );

  test.case = 'undefined';
  var src = undefined;
  test.true( !_.object.isBasic( src ) );

  test.case = 'Symbol null';
  var src = _.null;
  test.true( !_.object.isBasic( src ) );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  test.true( !_.object.isBasic( src ) );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  test.true( !_.object.isBasic( src ) );

  test.case = 'primitive';
  var src = 5;
  test.true( !_.object.isBasic( src ) );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  test.true( !_.object.isBasic( src ) );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  test.true( !_.object.isBasic( src ) );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  test.true( _.object.isBasic( src ) );

  // test.case = 'console';
  // var src = console;
  // test.true( !_.object.isBasic( src ) );
  //
  // test.case = 'printerLike';
  // var src = _global_.logger;
  // test.true( _.object.isBasic( src ) );

  test.case = 'process';
  var src = process;
  test.true( !_.object.isBasic( src ) );

  /* - */

  // function _iterate()
  // {
  //
  //   let iterator = Object.create( null );
  //   iterator.next = next;
  //   iterator.index = 0;
  //   iterator.instance = this;
  //   return iterator;
  //
  //   function next()
  //   {
  //     let result = Object.create( null );
  //     result.done = this.index === this.instance.elements.length;
  //     if( result.done )
  //     return result;
  //     result.value = this.instance.elements[ this.index ];
  //     this.index += 1;
  //     return result;
  //   }
  //
  // }
  //
  // /* */
  //
  // function countableConstructor( o )
  // {
  //   return countableMake( this, o );
  // }
  //
  // /* */
  //
  // function countableMake( dst, o )
  // {
  //   if( dst === null )
  //   dst = Object.create( null );
  //   _.object.extend( dst, o );
  //   if( o.countable )
  //   dst[ Symbol.iterator ] = _iterate;
  //   return dst;
  // }

  function routine () {}

}

// --
// container
// --

function keys( test )
{

  test.case = 'trivial';

  var got = _.object.keys( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.object.keys( { a : 1, b : undefined } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.object.keys( { a : 7, b : 13 } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  var got = _.object.keys( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ '3', '7', '13' ];
  test.identical( got, expected );

  var f = () => {};
  Object.setPrototypeOf( f, String );
  f.a = 1;
  var got = _.object.keys( f );
  var expected = [ 'a' ];
  test.identical( got, expected );

  var got = _.object.keys( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = 'options';
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* onlyOwn off */

  var got = _.object.keys( a );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected );

  /* onlyOwn on */

  var o = { onlyOwn : 1 };
  var got = _.object.keys( a, o );
  var expected = [ 'a' ];
  test.identical( got, expected );

  /* enumerable/onlyOwn off */

  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  Object.defineProperty( b, 'k', { enumerable : 0 } );
  var got = _.object.keys( a, o );
  var expected = _.object.allKeys( a );
  test.identical( got, expected );

  /* enumerable off, onlyOwn on */

  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0 } );
  var got = _.object.keys( a, o );
  var expected = [ 'a', 'k' ]
  test.identical( got, expected );

  /* */

  test.case = 'onlyEnumerable : 0, onlyOwn : 0'
  var a = Object.create( null );
  a.a = 1;
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var b = Object.create( a );
  b.b = 2;
  var exp = [ 'b', 'a', 'k' ];
  var got = _.object.keys( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.keys();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.keys( 'wrong arguments' );
  });

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.object.keys( { x : 1 }, { 'wrong' : null } );
  });

}

//

function onlyOwnKeys( test )
{
  test.case = 'empty'
  var got = _.object.onlyOwnKeys( {} );
  var expected = [];
  test.identical( got, expected )

  /* */

  test.case = 'simplest'

  var got = _.object.onlyOwnKeys( { a : '1', b : '2' } );
  var expected = [ 'a', 'b' ];
  test.identical( got, expected )

  var got = _.object.onlyOwnKeys( new Date );
  var expected = [ ];
  test.identical( got, expected )

  /* */

  test.case = ''

  var a = { a : 1 };
  var b = { b : 2 };
  var c = { c : 3 };
  Object.setPrototypeOf( a, b );
  Object.setPrototypeOf( b, c );

  var got = _.object.onlyOwnKeys( a );
  var expected = [ 'a' ];
  test.identical( got, expected )

  var got = _.object.onlyOwnKeys( b );
  var expected = [ 'b' ];
  test.identical( got, expected )

  var got = _.object.onlyOwnKeys( c );
  var expected = [ 'c' ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable on/off';
  var a = { a : '1' };

  var got = _.object.onlyOwnKeys( a );
  var expected = [ 'a' ]
  test.identical( got, expected );

  Object.defineProperty( a, 'k', { enumerable : false } );
  var o = { onlyEnumerable : 0 };
  var got = _.object.onlyOwnKeys( a, o );
  var expected = [ 'a', 'k' ]
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnKeys();
  })

  test.case = 'invalid type';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnKeys( 1 );
  })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnKeys( { onlyOwn : 0 }, { 'wrong' : null } );
  })

}

//

function allKeys( test )
{
  var _expected =
  [
    '__defineGetter__',
    '__defineSetter__',
    'hasOwnProperty',
    '__lookupGetter__',
    '__lookupSetter__',
    'propertyIsEnumerable',
    '__proto__',
    'constructor',
    'toString',
    'toLocaleString',
    'valueOf',
    'isPrototypeOf'
  ]

  /* */

  test.case = 'empty'
  var got = _.object.allKeys( {} );
  test.identical( got.sort(), _expected.sort() )

  /* */

  test.case = 'one onlyOwn property'
  var got = _.object.allKeys( { a : 1 } );
  var expected = _expected.slice();
  expected.push( 'a' );
  test.identical( got.sort(), expected.sort() )

  /* */

  test.case = 'date'
  var got = _.object.allKeys( new Date );
  test.identical( got.length, 55 );

  /* */

  test.case = 'not enumerable'
  var a = { };
  Object.defineProperty( a, 'k', { enumerable : 0 } )
  var got = _.object.allKeys( a );
  var expected = _expected.slice();
  expected.push( 'k' );
  test.identical( got.sort(), expected.sort() );

  /* */

  test.case = 'from prototype'
  var a = { a : 1 };
  var b = { b : 1 };
  Object.setPrototypeOf( a, b );
  Object.defineProperty( a, 'k', { enumerable : 0 } );
  Object.defineProperty( b, 'y', { enumerable : 0 } );
  var got = _.object.allKeys( a );
  var expected = _expected.slice();
  expected = expected.concat( [ 'a', 'b', 'k', 'y' ] );
  test.identical( got.sort(), expected.sort() );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( function()
  {
    _.object.allKeys();
  })

  test.case = 'invalid argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.allKeys();
  })

  test.case = 'unknonlyOwn option';
  test.shouldThrowErrorSync( function()
  {
    _.object.allKeys( { onlyOwn : 0 }, { 'wrong' : null } );
  })

}

//

function vals( test )
{

  test.case = 'trivial';

  var got = _.object.vals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.object.vals( { a : 1, b : undefined } );
  var expected = [ 1, undefined ];
  test.identical( got, expected );

  var got = _.object.vals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.object.vals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.object.vals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = 'onlyOwn'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var o = { onlyOwn : 0, onlyEnumerable : 1 };
  var got = _.object.vals( a, o );
  var expected = [ 1, 2 ]
  test.identical( got, expected );

  /* */

  var o = { onlyOwn : 1, onlyEnumerable : 1 };
  var got = _.object.vals( a, o );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* */

  test.case = 'enumerable'
  var a = { a : 1 };
  Object.defineProperty( a, 'k', { enumerable : 0, value : 2 } );

  /* */

  var got = _.object.vals( a, { onlyEnumerable : 1, onlyOwn : 0 } );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* */

  test.case = 'onlyEnumerable : 0, onlyOwn : 0'
  var a = Object.create( null );
  a.a = 1;
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var b = Object.create( a );
  b.b = 2;
  var exp = [ 2, 1, 3 ];
  var got = _.object.vals( b, { onlyEnumerable : 0, onlyOwn : 0 } );
  test.identical( got, exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.vals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.vals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.object.vals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function onlyOwnVals( test )
{

  test.case = 'trivial';

  var got = _.object.onlyOwnVals( {} );
  var expected = [];
  test.identical( got, expected );

  var got = _.object.onlyOwnVals( { a : 7, b : 13 } );
  var expected = [ 7, 13 ];
  test.identical( got, expected );

  var got = _.object.onlyOwnVals( { 7 : 'a', 3 : 'b', 13 : 'c' } );
  var expected = [ 'b', 'a', 'c' ];
  test.identical( got, expected );

  var got = _.object.onlyOwnVals( new Date );
  var expected = [ ];
  test.identical( got, expected );

  /* */

  test.case = ' only onlyOwn values'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.object.onlyOwnVals( a );
  var expected = [ 1 ];
  test.identical( got, expected );

  /* enumerable off */

  test.case = 'enumerable - 0';
  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  Object.defineProperty( b, 'y', { enumerable : 0, value : 4 } );
  var got = _.object.onlyOwnVals( a, { onlyEnumerable : 0 } );
  var expected = [ 1, 3 ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnVals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnVals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function allVals( test )
{
  test.case = 'trivial';

  var got = _.object.allVals( {} );
  test.true( got.length !== 0 );

  /* */

  var got = _.object.allVals( { a : 7, b : 13 } );
  test.true( got.length !== 0 );
  test.true( got.indexOf( 7 ) !== -1 );
  test.true( got.indexOf( 13 ) !== -1 );

  /* */

  var got = _.object.allVals( new Date );
  test.true( got.length > _.object.allVals( {} ).length );

  /* */

  test.case = 'from prototype'
  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );

  /* */

  var got = _.object.allVals( a );
  var expected = [ 1 ];
  test.true( got.length > _.object.allVals( {} ).length );
  test.true( got.indexOf( 1 ) !== -1 );
  test.true( got.indexOf( 2 ) !== -1 );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.allVals();
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.allVals( 'wrong argument' );
  });

  test.case = 'wrong option';
  test.shouldThrowErrorSync( function()
  {
    _.object.allVals( { a : 1 }, { 'wrong' : null } );
  });

}

//

function pairs( test )
{

  test.case = 'empty';

  var got = _.object.pairs( {} );
  var expected = [];
  test.identical( got, expected );

  // var got = _.object.pairs( [] );
  // var expected = [];
  // test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.object.pairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  test.case = 'list of [ key, value ] pairs'
  var got = _.object.pairs( { a : 3, b : 13, c : 7 } );
  var expected = [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ];
  test.identical( got, expected );

  /* */

  test.case = 'date';
  var got = _.object.pairs( new Date );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'regexp';
  var got = _.object.pairs( /abc/ );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.object.pairs( a );
  var expected = [ [ 'a', 1 ], [ 'b', 2 ] ];
  test.identical( got, expected );

  /* using onlyOwn */

  var got = _.object.pairs( a, { onlyOwn : 1 } );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn on */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 1 };
  var got = _.object.pairs( a, o );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* using enumerable off, onlyOwn off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var o = { onlyEnumerable : 0, onlyOwn : 0 };
  var got = _.object.pairs( a, o );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'k', 3 ] );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.pairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.object.pairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.pairs( 'wrong argument' );
  });

  test.case = 'redundant argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.pairs( {}, 'wrong arguments' );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( () => _.object.pairs( null ) );
  test.shouldThrowErrorSync( () => _.object.pairs( [] ) );

}

//

function onlyOwnPairs( test )
{
  test.case = 'empty';
  var got = _.object.onlyOwnPairs( {} );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.object.onlyOwnPairs( { a : 7, b : 13 } );
  var expected = [ [ 'a', 7 ], [ 'b', 13 ] ];
  test.identical( got, expected );

  /* */

  // var arrObj = [];
  // arrObj[ 'k' ] = 1;
  // var got = _.object.onlyOwnPairs( arrObj );
  // var expected = [ [ 'k', 1 ] ];
  // test.identical( got, expected );

  /* */

  var got = _.object.onlyOwnPairs( new Date );
  var expected = [];
  test.identical( got, expected );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.object.onlyOwnPairs( a );
  var expected = [ [ 'a', 1 ] ];
  test.identical( got, expected );

  /* using enumerable off */

  Object.defineProperty( a, 'k', { enumerable : 0, value : 3 } );
  var got = _.object.onlyOwnPairs( a, { onlyEnumerable : 0 } );
  var expected = [ [ 'a', 1 ], [ 'k', 3 ] ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnPairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.object.onlyOwnPairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( () => _.object.onlyOwnPairs( null ) );
  test.shouldThrowErrorSync( () => _.object.onlyOwnPairs( [] ) );

}

//

function allPairs( test )
{
  test.case = 'empty';
  var got = _.object.allPairs( {} );
  test.true( got.length !== 0 );

  /* */

  test.case = 'list of [ key, value ] pairs';

  var got = _.object.allPairs( { a : 7, b : 13 } );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 7 ] );
  test.identical( got[ 1 ], [ 'b', 13 ] );

  /* */

  // var arrObj = [];
  // arrObj[ 'k' ] = 1;
  // var got = _.object.allPairs( arrObj );
  // test.true( got.length > 1 );
  // got = _.arrayFlatten( [], got );
  // test.true( got.indexOf( 'k' ) !== -1 );
  // test.identical( got[ got.indexOf( 'k' ) + 1 ], 1 );

  /* */

  var got = _.object.allPairs( new Date );
  test.true( got.length > 1 );
  var got2 = [];
  got.forEach( ( e ) => got2.push( ... e ) );
  test.true( got2.indexOf( 'constructor' ) !== -1 );
  test.identical( got2[ got2.indexOf( 'constructor' ) + 1 ].name, 'Date' );

  /* */

  test.case = 'from prototype';

  var a = { a : 1 };
  var b = { b : 2 };
  Object.setPrototypeOf( a, b );
  var got = _.object.allPairs( a );
  test.true( got.length > 2 );
  test.identical( got[ 0 ], [ 'a', 1 ] );
  test.identical( got[ 1 ], [ 'b', 2 ] );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no argument';
  test.shouldThrowErrorSync( function()
  {
    _.object.allPairs();
  });

  test.case = 'primitive';
  test.shouldThrowErrorSync( function()
  {
    _.object.allPairs( 1 );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( () => _.object.allPairs( null ) );
  test.shouldThrowErrorSync( () => _.object.allPairs( [] ) );

}

// --
//
// --

const Proto =
{

  name : 'Tools.Object.l0.l1',
  silencing : 1,

  tests :
  {

    make,
    dichotomy,

    // properties

    /* qqq : for junior : adjust and extend test for object. tests originally from map */
    keys,
    onlyOwnKeys,
    allKeys,
    vals,
    onlyOwnVals,
    allVals,
    pairs,
    onlyOwnPairs,
    allPairs,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
