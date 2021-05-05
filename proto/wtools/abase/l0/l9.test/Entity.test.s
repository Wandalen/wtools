( function _l0_l9_Entity_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// exporter
// --

function exportStringDiagnosticShallow( test )
{

  /* xxx qqq : for junior : countable, non-vector cases? */

  test.case = 'number';
  var src = 1;
  var expected = '1';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  var expected = 'true';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 0;
  var expected = '0';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'fuzzy';
  var src = _.maybe;
  var expected = '{- Symbol maybe -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'bigint';
  var src = 10n;
  var expected = '10n';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'str & regexpLike';
  var src = 'str';
  var expected = 'str';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  var expected = '/hello/g';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  var expected = '{- ArgumentsArray with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var expected = '{- ArgumentsArray with 3 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'unroll';
  var src = _.unroll.make([ 2, 3, 4 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  var expected = '{- Array with 3 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'long & longLike';
  var src = _.long.make([ 1, 2 ]);
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'vector & vectorLike';
  var src = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var expected = '{- countableConstructorPolluted.countable with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'countable & countableLike';
  var src = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var expected = '{- countableConstructorPolluted.countable.constructible with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = __.diagnostic.objectMake({ new : 0, elements : [], countable : 1 } );
  var expected = '{- Map.polluted with 8 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Global & GlobalReal';
  var src = global;
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringDiagnosticShallow( src ), expected ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( global );
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringDiagnosticShallow( src ), expected ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike'; /* qqq for junior : bad : this is aux! lack of Object & Countable cases | aaa : Added. */
  var src = { [ Symbol.iterator ] : 1 };
  var expected = '{- Map.polluted with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & Container & ContainerLike with `exportString` method';
  var src =
  {
    [ Symbol.iterator ] : 1,
    exportString : () => 'Custom string transformation'
  };
  var expected = '{- Map.polluted with 1 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var expected = '{- Aux.polluted.prototyped with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted with `exportString` method';
  var src = { a : 1 };
  var proto =
  {
    b : 2,
    exportString : () => 'Custom string transformation'
  }
  Object.setPrototypeOf( src, proto )
  var expected = '{- Aux.polluted.prototyped with 3 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with `exportString` method';
  var src = Object.create( null );
  src.exportString = () => 'Custom string transformation'
  var expected = '{- Map.pure with 1 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var expected = '{- Map.pure with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var expected = '{- Map.polluted with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src = { a : 1, b : 2, c : 3 };
  var expected = '{- Map.polluted with 3 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'HashMap';
  var src = new HashMap();
  var expected = '{- HashMap with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'HashMap with 2 elems';
  var src = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var expected = '{- HashMap with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Set & SetLike';
  var src = new Set();
  var expected = '{- Set with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Set with 3 elems';
  var src = new Set([ 1, 2, 3 ]);
  var expected = '{- Set with 3 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'BufferNode';
  var src = BufferNode.from( 'str' );
  var expected = '{- BufferNode with 3 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  var expected = '{- BufferRaw -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  var expected = '{- BufferRawShared -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  var expected = '{- I8x with 20 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) );
  var expected = '{- DataView.constructible -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  var expected = '{- U8x with 20 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'err';
  var src = _.err( 'error' );
  var expected = '{- Error.constructible -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  var expected = '{- Escape 1 -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'interval & BufferTyped';
  var src = new F32x( 2 );
  var expected = '{- F32x with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'pair';
  var src = _.pair.make();
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'path & str';
  var src = '/a/b/';
  var expected = '/a/b/';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'propertyTransformer & filter';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
  var expected = '{- routine dstAndSrcOwn -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'propertyTransformer & mapper';
  var src = _.props.mapper[ 'assigning' ];
  var expected = '{- routine assigning -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'routine & routineLike';
  var src = routine;
  var expected = '{- routine routine -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'timer';
  var src = _.time._begin( Infinity );
  var expected = '{- Map.pure with 9 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );
  _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date( '2021-02-19T11:26:42.840Z' );
  var expected = '2021-02-19T11:26:42.840Z';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'null';
  var src = null;
  var expected = 'null';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'undefined';
  var src = undefined;
  var expected = 'undefined';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = '{- Symbol null -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = '{- Symbol undefined -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = '{- Symbol nothing -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'primitive';
  var src = 5;
  var expected = '5';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var expected = '{- Symbol a -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var expected = '{- Promise.constructible -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  var expected = '{- Readable.constructible -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  // test.case = 'console';
  // var src = console;
  // var expected = '{- Console.constructible with 1 elements -}';
  // test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  /* qqq : for junior : introduce namespace::printer | aaa : Done. */
  test.case = 'Map polluted'; /* qqq : bad : for junior : this is not printer! this is placeholder for printer. add cases with printers | aaa : Added. */
  var src = _global.logger;
  var expected = '{- Map.polluted with 9 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'printerLike';
  var src = new __.Logger();
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'printerLike with output to console';
  var src = new __.Logger({ output : console });
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  test.case = 'process';
  var src = process;
  var expected = '{- process.constructible -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src ), expected );

  /* */

  test.open( 'option::widthLimit' );

  test.case = 'string, widthLimit 0';
  var src = '0123456'
  var expected = '0123456';
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 0 } ), expected );

  test.case = 'string, widthLimit 1';
  var src = '0123456'
  var expected = '0';
  debugger;
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 1 } ), expected );
  debugger;

  test.case = 'string, widthLimit 5';
  var src = '0123456'
  var expected = '01256';
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 5 } ), expected );

  test.case = 'string, widthLimit > str.length';
  var src = '0123456'
  var expected = '0123456';
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 10 } ), expected );

  /* */

  test.case = 'map, widthLimit 0';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 0 } ), expected );

  test.case = 'map, widthLimit 1';
  var src = Object.create( null );
  var expected = '{';
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 1 } ), expected );

  test.case = 'map, widthLimit 10';
  var src = Object.create( null );
  var expected = '{- Mats -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 10 } ), expected );

  test.case = 'map, widthLimit > str.length';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringDiagnosticShallow( src, { widthLimit : 100 } ), expected );


  test.close( 'option::widthLimit' );

  /* - */

  function routine () {}

}

//


function exportStringCodeShallow( test )
{

  test.case = 'number';
  var src = 1;
  var expected = '1';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  var expected = 'true';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 0;
  var expected = '0';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'fuzzy';
  var src = _.maybe;
  var expected = 'Symbol.for( \'maybe\' )';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'bigint';
  var src = 10n;
  var expected = '10n';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'str & regexpLike';
  var src = 'str';
  var expected = '\'str\'';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  var expected = '/hello/g';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  var expected = '{- ArgumentsArray with 0 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var expected = '{- ArgumentsArray with 3 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'unroll';
  var src = _.unroll.make([ 2, 3, 4 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  var expected = '{- Array with 3 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'long & longLike';
  var src = _.long.make([ 1, 2 ]);
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'vector & vectorLike';
  var src = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var expected = '{- countableConstructorPolluted.countable with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'countable & countableLike';
  var src = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var expected = '{- countableConstructorPolluted.countable.constructible with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = __.diagnostic.objectMake({ new : 0, elements : [], countable : 1 } );
  var expected = '{- Map.polluted with 8 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Global & GlobalReal';
  var src = global;
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringCodeShallow( src ), expected ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( global );
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringCodeShallow( src ), expected ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike'; /* qqq for junior : bad : this is aux! lack of Object & Countable cases | aaa : Added. */
  var src = { [ Symbol.iterator ] : 1 };
  var expected = '{- Map.polluted with 0 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & Container & ContainerLike with `exportString` method';
  var src =
  {
    [ Symbol.iterator ] : 1,
    exportString : () => 'Custom string transformation'
  };
  var expected = '{- Map.polluted with 1 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var expected = '{- Aux.polluted.prototyped with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted with `exportString` method';
  var src = { a : 1 };
  var proto =
  {
    b : 2,
    exportString : () => 'Custom string transformation'
  }
  Object.setPrototypeOf( src, proto )
  var expected = '{- Aux.polluted.prototyped with 3 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with `exportString` method';
  var src = Object.create( null );
  src.exportString = () => 'Custom string transformation'
  var expected = '{- Map.pure with 1 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var expected = '{- Map.pure with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var expected = '{- Map.polluted with 0 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src = { a : 1, b : 2, c : 3 };
  var expected = '{- Map.polluted with 3 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'HashMap';
  var src = new HashMap();
  var expected = '{- HashMap with 0 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'HashMap with 2 elems';
  var src = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var expected = '{- HashMap with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Set & SetLike';
  var src = new Set();
  var expected = '{- Set with 0 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Set with 3 elems';
  var src = new Set([ 1, 2, 3 ]);
  var expected = '{- Set with 3 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'BufferNode';
  var src = BufferNode.from( 'str' );
  var expected = '{- BufferNode with 3 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  var expected = '{- BufferRaw -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  var expected = '{- BufferRawShared -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  var expected = '{- I8x with 20 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) );
  var expected = '{- DataView.constructible -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  var expected = '{- U8x with 20 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'err';
  var src = _.err( 'error' );
  var expected = '{- Error.constructible -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  var expected = '{- Escape 1 -}'; /* xxx2 : qqq : bad */
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'interval & BufferTyped';
  var src = new F32x( 2 );
  var expected = '{- F32x with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'pair';
  var src = _.pair.make();
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'path & str';
  var src = '/a/b/';
  var expected = '\'/a/b/\'';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'propertyTransformer & filter';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
  var expected = '{- routine dstAndSrcOwn -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'propertyTransformer & mapper';
  var src = _.props.mapper[ 'assigning' ];
  var expected = '{- routine assigning -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'routine & routineLike';
  var src = routine;
  var expected = '{- routine routine -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'timer';
  var src = _.time._begin( Infinity );
  var expected = '{- Map.pure with 9 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );
  _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date( '2021-02-19T11:26:42.840Z' );
  var expected = 'new Date( \'2021-02-19T11:26:42.840Z\' )';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'null';
  var src = null;
  var expected = 'null';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'undefined';
  var src = undefined;
  var expected = 'undefined';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = 'Symbol.for( \'null\' )';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = 'Symbol.for( \'undefined\' )';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = 'Symbol.for( \'nothing\' )';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'primitive';
  var src = 5;
  var expected = '5';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var expected = 'Symbol.for( \'a\' )';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var expected = '{- Promise.constructible -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  var expected = '{- Readable.constructible -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  // test.case = 'console';
  // var src = console;
  // var expected = '{- Console.constructible with 1 elements -}';
  // test.identical( _.entity.exportStringCodeShallow( src ), expected );

  /* qqq : for junior : introduce namespace::printer | aaa : Done. */
  test.case = 'Map polluted'; /* qqq : bad : for junior : this is not printer! this is placeholder for printer. add cases with printers | aaa : Added. */
  var src = _global.logger;
  var expected = '{- Map.polluted with 9 elements -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'printerLike';
  var src = new __.Logger();
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'printerLike with output to console';
  var src = new __.Logger({ output : console });
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  test.case = 'process';
  var src = process;
  var expected = '{- process.constructible -}';
  test.identical( _.entity.exportStringCodeShallow( src ), expected );

  /* - */

  function routine () {}

}

// --
// tests
// --

function assign( test )
{
  test.case = 'src null';
  var dst = 'string';
  var src = null;
  var got = _.entity.assign2( dst, src );
  var expected = null;
  test.identical( got, expected );

  test.case = 'dst.copy';
  var dst =
  {
    copy : function( src )
    {
      for( var i in src )
      this[ i ] = src[ i ]
    }
  };
  var src = { src : 'string', num : 123 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected =
  {
    copy : dst.copy,
    src : 'string',
    num : 123

  };
  test.identical( got, expected );

  test.case = 'src.clone';
  var dst = 1;
  var src = { src : 'string', num : 123, clone : function() { return { src : 'string', num : 123 } } }
  var got = _.entity.assign2( dst, src  );
  var expected = { src : 'string', num : 123 };
  test.identical( got, expected );
  test.true( got !== expected );
  test.true( got !== src );

  test.case = 'src.slice returns copy of array';
  var dst = [ ];
  var src = [ 1, 2, 3 ];
  var got = _.entity.assign2( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.case = 'dst.set ';
  var dst = { set : function( src ){ this.value = src[ 'value' ]; } };
  var src = { value : 100 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected = { set : dst.set, value : 100 };
  test.identical( got, expected );

  test.case = 'onRecursive ';
  var dst = { };
  var src = { value : 100, a : {  b : 101 } };
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  _.entity.assign2( dst, src, onRecursive  );
  var got = dst;
  var expected = src;
  test.identical( got, expected );

  test.case = 'atomic ';
  var src = 2;
  var got = _.entity.assign2( null, src );
  var expected = src;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.entity.assign2( );
  });

  test.case = 'src.clone throws "unexpected"';
  test.shouldThrowErrorSync( function()
  {
    var dst = {};
    var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
    _.entity.assign2( dst, src  );
  });

}

//

function assignFieldFromContainer( test )
{
  test.case = 'non recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = dst[ name ];
  test.identical( got, expected );

  test.case = 'undefined';
  var dst ={};
  var src = { a : undefined };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  var got = _.entity.assign2FieldFromContainer( dst, src, name, onRecursive );
  var expected = dst[ name ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.assign2FieldFromContainer() );
}

//

function sizeOfUncountable( test )
{

  test.case = 'undefined';
  var src = undefined;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'null';
  var src = null;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'false';
  var src = false;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'true';
  var src = true;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'zero';
  var src = 0;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'number';
  var src = 34;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'NaN';
  var src = NaN;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'Infinity';
  var src = Infinity;
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'empty string';
  var src = '';
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 0 );

  test.case = 'string';
  var src = 'str';
  test.identical( _.entity.sizeOfUncountable( src ), 11 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 11 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 7 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 3 );

  test.case = 'symbol';
  var src = Symbol.for( 'x' );
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 8 );

  test.case = 'BufferTyped';
  var src = new U8x( [ 1, 2, 3, 4 ] );
  test.identical( _.entity.sizeOfUncountable( src ), 12 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 12 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 4 );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 10 );
  test.identical( _.entity.sizeOfUncountable( src ), 18 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 18 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 14 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 10 );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 10 ) );
  test.identical( _.entity.sizeOfUncountable( src ), 18 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 18 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 14 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 10 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var src = BufferNode.from( [ 1, 2, 3, 4 ] );
    test.identical( _.entity.sizeOfUncountable( src ), 12 );
    test.identical( _.entity.sizeOfUncountable( src, 8 ), 12 );
    test.identical( _.entity.sizeOfUncountable( src, 4 ), 8 );
    test.identical( _.entity.sizeOfUncountable( src, 0 ), 4 );
  }

  test.case = 'function';
  var src = function(){};
  test.identical( _.entity.sizeOfUncountable( src ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 8 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 4 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 0 );

  test.case = 'regexp';
  var src = /abcde/g;
  test.identical( _.entity.sizeOfUncountable( src ), 14 );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), 14 );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), 10 );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), 6 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  var src = new Constr1();
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'Set';
  var src = new Set( [ 1, 2, undefined, 4 ] );
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'map';
  var src = { a : 1, b : 2, c : { d : 3 } };
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'HashMap';
  var src = new HashMap( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] );
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'empty array';
  var src = [];
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'array';
  var src = [ [ 23, 17 ], undefined, 34 ];
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'argumentsArray';
  var src = _.argumentsArray.make( [ 1, [ 2, 3 ], 4 ] );
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'unroll';
  var src = _.unroll.make( [ 1, 2, [ 3, 4 ] ] );
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true
    }
  };
  Object.defineProperties( src, o );
  test.identical( _.entity.sizeOfUncountable( src ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 8 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 4 ), NaN );
  test.identical( _.entity.sizeOfUncountable( src, 0 ), NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.sizeOfUncountable() );
  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.sizeOfUncountable( 1, 2, 3 ) );

}

//

/* zzz : find better solution instead of `_.look ?` */

function entitySize( test )
{

  test.case = 'undefined';
  var src = undefined;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'null';
  var src = null;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'false';
  var src = false;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'true';
  var src = true;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'zero';
  var src = 0;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'number';
  var src = 34;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'NaN';
  var src = NaN;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'Infinity';
  var src = Infinity;
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'empty string';
  var src = '';
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 0 );

  test.case = 'string';
  var src = 'str';
  test.identical( _.entity.sizeOf( src ), 11 );
  test.identical( _.entity.sizeOf( src, 8 ), 11 );
  test.identical( _.entity.sizeOf( src, 4 ), 7 );
  test.identical( _.entity.sizeOf( src, 0 ), 3 );

  test.case = 'symbol';
  var src = Symbol.for( 'x' );
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 8 );

  test.case = 'BufferTyped';
  var src = new U8x( [ 1, 2, 3, 4 ] );
  test.identical( _.entity.sizeOf( src ), 12 );
  test.identical( _.entity.sizeOf( src, 8 ), 12 );
  test.identical( _.entity.sizeOf( src, 4 ), 8 );
  test.identical( _.entity.sizeOf( src, 0 ), 4 );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 10 );
  test.identical( _.entity.sizeOf( src ), 18 );
  test.identical( _.entity.sizeOf( src, 8 ), 18 );
  test.identical( _.entity.sizeOf( src, 4 ), 14 );
  test.identical( _.entity.sizeOf( src, 0 ), 10 );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 10 ) );
  test.identical( _.entity.sizeOf( src ), 18 );
  test.identical( _.entity.sizeOf( src, 8 ), 18 );
  test.identical( _.entity.sizeOf( src, 4 ), 14 );
  test.identical( _.entity.sizeOf( src, 0 ), 10 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var src = BufferNode.from( [ 1, 2, 3, 4 ] );
    test.identical( _.entity.sizeOf( src ), 12 );
    test.identical( _.entity.sizeOf( src, 8 ), 12 );
    test.identical( _.entity.sizeOf( src, 4 ), 8 );
    test.identical( _.entity.sizeOf( src, 0 ), 4 );
  }

  test.case = 'function';
  var src = function(){};
  test.identical( _.entity.sizeOf( src ), 8 );
  test.identical( _.entity.sizeOf( src, 8 ), 8 );
  test.identical( _.entity.sizeOf( src, 4 ), 4 );
  test.identical( _.entity.sizeOf( src, 0 ), 0 );

  test.case = 'regexp';
  var src = /abcde/g;
  test.identical( _.entity.sizeOf( src ), 14 );
  test.identical( _.entity.sizeOf( src, 8 ), 14 );
  test.identical( _.entity.sizeOf( src, 4 ), 10 );
  test.identical( _.entity.sizeOf( src, 0 ), 6 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  var src = new Constr1();
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'Set';
  var src = new Set( [ 1, 2, undefined, 4 ] );
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'map';
  var src = { a : 1, b : 2, c : { d : 3 } };
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'HashMap';
  var src = new HashMap( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] );
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'empty array';
  var src = [];
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'array';
  var src = [ [ 23, 17 ], undefined, 34 ];
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'argumentsArray';
  var src = _.argumentsArray.make( [ 1, [ 2, 3 ], 4 ] );
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'unroll';
  var src = _.unroll.make( [ 1, 2, [ 3, 4 ] ] );
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true
    }
  };
  Object.defineProperties( src, o );
  test.identical( _.entity.sizeOf( src ), NaN );
  test.identical( _.entity.sizeOf( src, 8 ), NaN );
  test.identical( _.entity.sizeOf( src, 4 ), NaN );
  test.identical( _.entity.sizeOf( src, 0 ), NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.sizeOf() );
  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entity.sizeOf( 1, 2, 3 ) );
}

// --
//
// --

const Proto =
{

  name : 'Tools.Entity.l0.l9',
  silencing : 1,

  tests :
  {

    exportStringDiagnosticShallow,
    exportStringCodeShallow,

    assign,
    assignFieldFromContainer,

    sizeOfUncountable,
    entitySize,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
