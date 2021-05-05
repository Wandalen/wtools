( function _l0_l9_Countable_test_s_()
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

function typing( test ) /* qqq for junior : extend for like. first discuss ( file Countable.tests.s ) */
{

  /* */

  test.case = `countable made`;
  var src = _.diagnostic.objectMake({ elements : [ '1', '10' ], countable : 1 } );
  test.true( _.countable.like( src ) );
  test.true( _.countable.is( src ) );
  test.true( !_.vector.like( src ) );
  test.true( !_.vector.is( src ) );
  test.true( !_.longLike( src ) );
  test.true( !_.longIs( src ) );
  test.true( !_.argumentsArray.like( src ) );
  test.true( !_.arrayIs( src ) );

  /* */

}

// function typing( test ) /* qqq for junior : extend for like. first discuss ( file Countable.tests.s ) */
// {
//
//   /* */
//
//   test.case = `primitive - str`;
//   var src = 'abc';
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `primitive - bool`;
//   var src = true;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `primitive - number`;
//   var src = 1;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `routine`;
//   var src = routine;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `raw buffer`;
//   var src = new BufferRaw( 13 );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `countable`;
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `countable made`;
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '10' ], countable : 1 } );
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `vector`;
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `typed buffer`;
//   var src = new F32x([ 0, 10 ]);
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `arguments array`;
//   var src = _.argumentsArray.make();
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( _.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* */
//
//   test.case = `array`;
//   var src = [ 1, 3 ];
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( _.argumentsArray.like( src ) );
//   test.true( _.arrayIs( src ) );
//
//   /* - */
//
//   function _iterate()
//   {
//
//     let iterator = Object.create( null );
//     iterator.next = next;
//     iterator.index = 0;
//     iterator.instance = this;
//     return iterator;
//
//     function next()
//     {
//       let result = Object.create( null );
//       result.done = this.index === this.instance.elements.length;
//       if( result.done )
//       return result;
//       result.value = this.instance.elements[ this.index ];
//       this.index += 1;
//       return result;
//     }
//
//   }
//
//   /* */
//
//   function countableConstructor( o )
//   {
//     return countableMake( this, o );
//   }
//
//   /* */
//
//   function countableMake( dst, o )
//   {
//     if( dst === null )
//     dst = Object.create( null );
//     _.props.extend( dst, o );
//     if( o.countable )
//     dst[ Symbol.iterator ] = _iterate;
//     return dst;
//   }
//
//   /* */
//
//   function routine () {}
//
// }
//
// //
//
// function typingExtended( test )
// {
//   /*
//     Not covered types :
//
//     printer
//     consequence
//     worker
//     logger
//     procedure
//  */
//
//
//   test.case = 'number';
//   var src = 1;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'bool & boolLike & fuzzy';
//   var src = true;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'boolLike & number & fuzzyLike';
//   var src = 1;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'fuzzy';
//   var src = _.maybe;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'bigint';
//   var src = 10n;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'str & regexpLike';
//   var src = 'str';
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'regexp & objectLike & constructible & constructibleLike';
//   var src = /hello/g;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'ArgumentsArray & arrayLike';
//   var src = _.argumentsArray.make();
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( _.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'unroll';
//   var src = _.unroll.make([ 2, 3, 4 ]);
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( _.argumentsArray.like( src ) );
//   test.true( _.arrayIs( src ) );
//
//   test.case = 'array';
//   var src = [ 2, 3, 4 ];
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( _.argumentsArray.like( src ) );
//   test.true( _.arrayIs( src ) );
//
//   test.case = 'long & longLike';
//   var src = _.long.make([ 1, 2 ]);
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( _.argumentsArray.like( src ) );
//   test.true( _.arrayIs( src ) );
//
//   test.case = 'vector & vectorLike';
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'countable & countableLike';
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Global & GlobalReal';
//   var src = global;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Global & GlobalDerived';
//   var src = Object.create( global );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Object & ObjectLike & Container & ContainerLike';
//   var src = { [ Symbol.iterator ] : 1 };
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
//   var src = { a : 1 };
//   Object.setPrototypeOf( src, { b : 2 } )
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
//   var src = Object.create( null );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
//   var src = {};
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'HashMap';
//   var src = new HashMap();
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Set & SetLike';
//   var src = new Set();
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'BufferNode';
//   var src = BufferNode.from( 'str' );
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'BufferRaw';
//   var src = new BufferRaw( 'str' );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'BufferRawShared';
//   var src = new BufferRawShared( 'str' );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'BufferTyped';
//   var src = new I8x( 20 );
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'BufferView';
//   var src = new BufferView( new BufferRaw( 20 ) )
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'BufferBytes & BufferTyped';
//   var src = new U8x( 20 );
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'err';
//   var src = _.err( 'error' );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'escape';
//   var src = _.escape.make( 1 );
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'interval & BufferTyped';
//   var src = new F32x( 2 );
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'pair';
//   var src = _.pair.make();
//   test.true( _.countable.like( src ) );
//   test.true( _.countable.is( src ) );
//   test.true( _.vector.like( src ) );
//   test.true( _.vector.is( src ) );
//   test.true( _.longLike( src ) );
//   test.true( _.longIs( src ) );
//   test.true( _.argumentsArray.like( src ) );
//   test.true( _.arrayIs( src ) );
//
//   test.case = 'path & str';
//   var src = '/a/b/';
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'propertyTransformer & filter';
//   var src = _.props.condition[ 'dstAndSrcOwn' ];
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'propertyTransformer & mapper';
//   var src = _.props.mapper[ 'assigning' ];
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'routine & routineLike';
//   var src = routine;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'time';
//   var src = _.time.now();
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'timer';
//   var src = _.time._begin( Infinity );;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//   _.time.cancel( src );
//
//   test.case = 'date & objectLike';
//   var src = new Date();
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'null';
//   var src = null;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'undefined';
//   var src = undefined;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Symbol null';
//   var src = _.null;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Symbol undefined';
//   var src = _.undefined;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Symbol Nothing';
//   var src = _.nothing;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'primitive';
//   var src = 5;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'Symbol';
//   var src = Symbol( 'a' );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'ConsequenceLike & promiseLike & promise';
//   var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'stream';
//   var src = require( 'stream' ).Readable();
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   // test.case = 'console';
//   // var src = console;
//   // test.true( !_.countable.like( src ) );
//   // test.true( !_.countable.is( src ) );
//   // test.true( !_.vector.like( src ) );
//   // test.true( !_.vector.is( src ) );
//   // test.true( !_.longLike( src ) );
//   // test.true( !_.longIs( src ) );
//   // test.true( !_.argumentsArray.like( src ) );
//   // test.true( !_.arrayIs( src ) );
//
//   test.case = 'printerLike';
//   var src = _global.logger;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   test.case = 'process';
//   var src = process;
//   test.true( !_.countable.like( src ) );
//   test.true( !_.countable.is( src ) );
//   test.true( !_.vector.like( src ) );
//   test.true( !_.vector.is( src ) );
//   test.true( !_.longLike( src ) );
//   test.true( !_.longIs( src ) );
//   test.true( !_.argumentsArray.like( src ) );
//   test.true( !_.arrayIs( src ) );
//
//   /* - */
//
//   function _iterate()
//   {
//
//     let iterator = Object.create( null );
//     iterator.next = next;
//     iterator.index = 0;
//     iterator.instance = this;
//     return iterator;
//
//     function next()
//     {
//       let result = Object.create( null );
//       result.done = this.index === this.instance.elements.length;
//       if( result.done )
//       return result;
//       result.value = this.instance.elements[ this.index ];
//       this.index += 1;
//       return result;
//     }
//
//   }
//
//   /* */
//
//   function countableConstructor( o )
//   {
//     return countableMake( this, o );
//   }
//
//   /* */
//
//   function countableMake( dst, o )
//   {
//     if( dst === null )
//     dst = Object.create( null );
//     _.props.extend( dst, o );
//     if( o.countable )
//     dst[ Symbol.iterator ] = _iterate;
//     return dst;
//   }
//
//   function routine () {}
//
// }
//
// //
//
// function countablesAreIdenticalShallow( test )
// {
//   test.open( 'identical' );
//
//   test.case = 'arrays empty';
//   var src1 = [];
//   var src2 = []
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'arrays non-empty with primitives';
//   var src1 = [ 1, 'str', true, 10n, _.nothing ];
//   var src2 = [ 1, 'str', true, 10n, _.nothing ]
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'arrays non-empty with non-primitives, same reference';
//   var objE = {};
//   var objF = { a : 1, b : 2 };
//   var arrE = [];
//   var arrF = [ 1, 2, 3 ];
//   var src1 = [ objE, objF, arrE, arrF ];
//   var src2 = [ objE, objF, arrE, arrF ]
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'typed buffer';
//   var src1 = new F32x( 5 );
//   var src2 = new F32x( 5 );
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'argumentsArray';
//   var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
//   var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = `object countable - non empty, non-vector`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector & vectorLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'countable & countableLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = `object countable - non empty, non-vector`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.close( 'identical' );
//
//   /* - */
//
//   test.open( 'not identical' );
//
//   test.case = 'arrays non-empty with num';
//   var src1 = [ 1 ];
//   var src2 = [ 2 ];
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with str';
//   var src1 = [ 'str' ];
//   var src2 = [ 'str2' ];
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with bool';
//   var src1 = [ false ];
//   var src2 = [ true ];
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with bigInt';
//   var src1 = [ 10n ];
//   var src2 = [ 11n ];
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with bigInt and same number';
//   var src1 = [ 10n ];
//   var src2 = [ 10 ]
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with Symbol';
//   var src1 = [ _.nothing ];
//   var src2 = [ _.null ]
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with empty objects, not the same reference';
//   var got = _.countable.identicalShallow( [ {} ], [ {} ] );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with non-empty objects, not the same reference';
//   var got = _.countable.identicalShallow( [ { a : 1 } ], [ { a : 1 } ] );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with empty arrays, not the same reference';
//   var got = _.countable.identicalShallow( [ [] ], [ [] ] );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with non-empty arrays, not the same reference';
//   var got = _.countable.identicalShallow( [ [ 1, 2 ] ], [ [ 1, 2 ] ] );
//   test.identical( got, false );
//
//   test.case = 'typed buffer';
//   var src1 = new F32x( 5 );
//   var src2 = new F32x( 6 );
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'argumentsArray';
//   var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
//   var src2 = _.argumentsArray.make([ 1, 2, 4 ]);
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = `object countable - non empty, non-vector, not same array`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector & vectorLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '11' ], countable : 1, length : 2 });
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'countable & countableLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '11' ], countable : 1 });
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = `object countable - non empty, non-vector`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
//   var got = _.countable.identicalShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.close( 'not identical' );
//
//   /* - */
//
//   function _iterate()
//   {
//
//     let iterator = Object.create( null );
//     iterator.next = next;
//     iterator.index = 0;
//     iterator.instance = this;
//     return iterator;
//
//     function next()
//     {
//       let result = Object.create( null );
//       result.done = this.index === this.instance.elements.length;
//       if( result.done )
//       return result;
//       result.value = this.instance.elements[ this.index ];
//       this.index += 1;
//       return result;
//     }
//
//   }
//
//   /* */
//
//   function countableConstructor( o )
//   {
//     return countableMake( this, o );
//   }
//
//   /* */
//
//   function countableMake( dst, o )
//   {
//     if( dst === null )
//     dst = Object.create( null );
//     _.props.extend( dst, o );
//     if( o.countable )
//     dst[ Symbol.iterator ] = _iterate;
//     return dst;
//   }
// }
//
// //
//
//
// function countablesAreEquivalentShallow( test )
// {
//   test.open( 'identical' );
//
//   test.case = 'arrays empty';
//   var src1 = [];
//   var src2 = []
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'arrays non-empty with primitives';
//   var src1 = [ 1, 'str', true, 10n, _.nothing ];
//   var src2 = [ 1, 'str', true, 10n, _.nothing ]
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'arrays non-empty with non-primitives, same reference';
//   var objE = {};
//   var objF = { a : 1, b : 2 };
//   var arrE = [];
//   var arrF = [ 1, 2, 3 ];
//   var src1 = [ objE, objF, arrE, arrF ];
//   var src2 = [ objE, objF, arrE, arrF ]
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'argumentsArray';
//   var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
//   var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = `object countable - non empty, non-vector, not same array`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector & vectorLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'countable & countableLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//   test.case = `object countable - non empty, non-vector`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, true );
//
//
//   test.close( 'identical' );
//
//   /* - */
//
//   test.open( 'not identical' );
//
//   test.case = 'arrays non-empty with num';
//   var src1 = [ 1 ];
//   var src2 = [ 2 ];
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with str';
//   var src1 = [ 'str' ];
//   var src2 = [ 'str2' ];
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with bool';
//   var src1 = [ false ];
//   var src2 = [ true ];
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with bigInt';
//   var src1 = [ 10n ];
//   var src2 = [ 11n ];
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with bigInt and same number';
//   var src1 = [ 10n ];
//   var src2 = [ 10 ]
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with Symbol';
//   var src1 = [ _.nothing ];
//   var src2 = [ _.null ]
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with empty objects, not the same reference';
//   var got = _.countable.equivalentShallow( [ {} ], [ {} ] );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with non-empty objects, not the same reference';
//   var got = _.countable.equivalentShallow( [ { a : 1 } ], [ { a : 1 } ] );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with empty arrays, not the same reference';
//   var got = _.countable.equivalentShallow( [ [] ], [ [] ] );
//   test.identical( got, false );
//
//   test.case = 'arrays non-empty with non-empty arrays, not the same reference';
//   var got = _.countable.equivalentShallow( [ [ 1, 2 ] ], [ [ 1, 2 ] ] );
//   test.identical( got, false );
//
//   test.case = 'typed buffer';
//   var src1 = new F32x( 5 );
//   var src2 = new F32x( 6 );
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'argumentsArray';
//   var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
//   var src2 = _.argumentsArray.make([ 1, 2, 4 ]);
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = `object countable - non empty, non-vector, not same array`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector & vectorLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '11' ], countable : 1, length : 2 });
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'countable & countableLike';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '11' ], countable : 1 });
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.case = `object countable - non empty, non-vector`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var src2 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
//   var got = _.countable.equivalentShallow( src1, src2 );
//   test.identical( got, false );
//
//   test.close( 'not identical' );
//
//   /* */
//
//   test.open( 'not identical, equivalent' );
//
//   test.case = 'set and array';
//   var src1 = new Set([ 1, 2, 3 ]);
//   var src2 = [ 1, 2, 3 ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   debugger;
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.case = 'buffer typed and array';
//   var src1 = new F32x([ 1, 2, 3 ])
//   var src2 = [ 1, 2, 3 ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.case = 'vectorLike and array';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var src2 = [ '1', '10' ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.case = 'countable and array';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var src2 = [ '1', '10' ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.case = 'countable made and array';
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '10' ], countable : 1 } );
//   var src2 = [ '1', '10' ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.case = `vector and array`;
//   var src1 = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var src2 = [ '1', '10' ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.case = `argumentsArray and array`;
//   var src1 = _.argumentsArray.make([ '1', '10' ]);
//   var src2 = [ '1', '10' ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.case = `argumentsArray and array`;
//   var src1 = _.argumentsArray.make([ '1', '10' ]);
//   var src2 = [ '1', '10' ];
//   test.identical( _.countable.identicalShallow( src1, src2 ), false );
//   test.identical( _.countable.equivalentShallow( src1, src2 ), true );
//
//   test.close( 'not identical, equivalent' );
//
//   /* - */
//
//   function _iterate()
//   {
//
//     let iterator = Object.create( null );
//     iterator.next = next;
//     iterator.index = 0;
//     iterator.instance = this;
//     return iterator;
//
//     function next()
//     {
//       let result = Object.create( null );
//       result.done = this.index === this.instance.elements.length;
//       if( result.done )
//       return result;
//       result.value = this.instance.elements[ this.index ];
//       this.index += 1;
//       return result;
//     }
//
//   }
//
//   /* */
//
//   function countableConstructor( o )
//   {
//     return countableMake( this, o );
//   }
//
//   /* */
//
//   function countableMake( dst, o )
//   {
//     if( dst === null )
//     dst = Object.create( null );
//     _.props.extend( dst, o );
//     if( o.countable )
//     dst[ Symbol.iterator ] = _iterate;
//     return dst;
//   }
// }
//
// //
//
// function exportStringDiagnosticShallow( test )
// {
//   test.case = 'array empty';
//   var src = [];
//   var expected = '{- Array with 0 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   test.case = 'array non-empty';
//   var src = [ 1, 2, 3 ];
//   var expected = '{- Array with 3 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   test.case = 'unroll empty';
//   var src = _.unroll.make([]);
//   var expected = '{- Array.unroll with 0 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   test.case = 'unroll non-empty';
//   var src = _.unroll.make([ 1, 2, 3 ]);
//   var expected = '{- Array.unroll with 3 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   test.case = 'vector & vectorLike';
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
//   var expected = '{- countableConstructor.countable with 2 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   test.case = 'countable & countableLike';
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
//   var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   test.case = `object countable - empty, non-vector`;
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [], countable : 1 } );
//   var expected = '{- Object.countable with 0 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   test.case = `object countable - non empty, non-vector`;
//   var src = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
//   var expected = '{- Object.countable with 3 elements -}';
//   var got = _.countable.exportStringDiagnosticShallow( src );
//   test.identical( got, expected );
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without argument';
//   test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow() );
//
//   test.case = 'too many args';
//   test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow( [], [] ) );
//
//   test.case = 'wrong type';
//   test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow( {} ) );
//
//   /* - */
//
//   function _iterate()
//   {
//
//     let iterator = Object.create( null );
//     iterator.next = next;
//     iterator.index = 0;
//     iterator.instance = this;
//     return iterator;
//
//     function next()
//     {
//       let result = Object.create( null );
//       result.done = this.index === this.instance.elements.length;
//       if( result.done )
//       return result;
//       result.value = this.instance.elements[ this.index ];
//       this.index += 1;
//       return result;
//     }
//
//   }
//
//   /* */
//
//   function countableConstructor( o )
//   {
//     return countableMake( this, o );
//   }
//
//   /* */
//
//   function countableMake( dst, o )
//   {
//     if( dst === null )
//     dst = Object.create( null );
//     _.props.extend( dst, o );
//     if( o.countable )
//     dst[ Symbol.iterator ] = _iterate;
//     return dst;
//   }
// }

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Countable.l0.l9',
  silencing : 1,

  tests :
  {

    typing,
    // dichotomyExtended,
    // countablesAreIdenticalShallow,
    // countablesAreEquivalentShallow,
    // exportStringDiagnosticShallow

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
