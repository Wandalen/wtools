( function _l0_l3_Countable_test_s_()
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

function countablesAreIdenticalShallow( test )
{
  test.open( 'identical' );

  test.case = 'arrays empty';
  var src1 = [];
  var src2 = []
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'arrays non-empty with primitives';
  var src1 = [ 1, 'str', true, 10n, _.nothing ];
  var src2 = [ 1, 'str', true, 10n, _.nothing ]
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'arrays non-empty with non-primitives, same reference';
  var objE = {};
  var objF = { a : 1, b : 2 };
  var arrE = [];
  var arrF = [ 1, 2, 3 ];
  var src1 = [ objE, objF, arrE, arrF ];
  var src2 = [ objE, objF, arrE, arrF ]
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'typed buffer';
  var src1 = new F32x( 5 );
  var src2 = new F32x( 5 );
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'argumentsArray';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = `strange map`;
  var src1 = __.diagnostic.objectMake({ elements : [ '1', '2', '3' ], countable : 1, new : 0 });
  var src2 = __.diagnostic.objectMake({ elements : [ '1', '2', '3' ], countable : 1, new : 0 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = `object countable`;
  var src1 = __.diagnostic.objectMake({ elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ elements : [ '1', '2', '3' ], countable : 1 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'vector & vectorLike & true';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'vector & vectorLike & false';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', 10 ], countable : 1, length : 2 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ elements : [ '1', '2', '3' ], countable : 1, new : 1 });
  var src2 = __.diagnostic.objectMake({ elements : [ '1', '2', '3' ], countable : 1, new : 1 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'arrays non-empty with num';
  var src1 = [ 1 ];
  var src2 = [ 2 ];
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with str';
  var src1 = [ 'str' ];
  var src2 = [ 'str2' ];
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with bool';
  var src1 = [ false ];
  var src2 = [ true ];
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with bigInt';
  var src1 = [ 10n ];
  var src2 = [ 11n ];
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with bigInt and same number';
  var src1 = [ 10n ];
  var src2 = [ 10 ]
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with Symbol';
  var src1 = [ _.nothing ];
  var src2 = [ _.null ]
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with empty objects, not the same reference';
  var got = _.countable.identicalShallow( [ {} ], [ {} ] );
  test.identical( got, false );

  test.case = 'arrays non-empty with non-empty objects, not the same reference';
  var got = _.countable.identicalShallow( [ { a : 1 } ], [ { a : 1 } ] );
  test.identical( got, false );

  test.case = 'arrays non-empty with empty arrays, not the same reference';
  var got = _.countable.identicalShallow( [ [] ], [ [] ] );
  test.identical( got, false );

  test.case = 'arrays non-empty with non-empty arrays, not the same reference';
  var got = _.countable.identicalShallow( [ [ 1, 2 ] ], [ [ 1, 2 ] ] );
  test.identical( got, false );

  test.case = 'typed buffer';
  var src1 = new F32x( 5 );
  var src2 = new F32x( 6 );
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'argumentsArray';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 4 ]);
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = `object countable - non empty, non-vector, not same array`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'vector & vectorLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1, length : 2 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'countable & countableLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 });
  var got = _.countable.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.close( 'not identical' );

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
  //   _.props.extend( dst, o );
  //   if( o.countable )
  //   dst[ Symbol.iterator ] = _iterate;
  //   return dst;
  // }

}

//

function countablesAreEquivalentShallow( test )
{
  test.open( 'identical' );

  test.case = 'arrays empty';
  var src1 = [];
  var src2 = []
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'arrays non-empty with primitives';
  var src1 = [ 1, 'str', true, 10n, _.nothing ];
  var src2 = [ 1, 'str', true, 10n, _.nothing ]
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'arrays non-empty with non-primitives, same reference';
  var objE = {};
  var objF = { a : 1, b : 2 };
  var arrE = [];
  var arrF = [ 1, 2, 3 ];
  var src1 = [ objE, objF, arrE, arrF ];
  var src2 = [ objE, objF, arrE, arrF ]
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'argumentsArray';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, true );

  test.case = `object countable - non empty, non-vector, not same array`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'vector & vectorLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'countable & countableLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, true );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '2', '3' ], countable : 1 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'arrays non-empty with num';
  var src1 = [ 1 ];
  var src2 = [ 2 ];
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with str';
  var src1 = [ 'str' ];
  var src2 = [ 'str2' ];
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with bool';
  var src1 = [ false ];
  var src2 = [ true ];
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with bigInt';
  var src1 = [ 10n ];
  var src2 = [ 11n ];
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with bigInt and same number';
  var src1 = [ 10n ];
  var src2 = [ 10 ]
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with Symbol';
  var src1 = [ _.nothing ];
  var src2 = [ _.null ]
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'arrays non-empty with empty objects, not the same reference';
  var got = _.countable.equivalentShallow( [ {} ], [ {} ] );
  test.identical( got, false );

  test.case = 'arrays non-empty with non-empty objects, not the same reference';
  var got = _.countable.equivalentShallow( [ { a : 1 } ], [ { a : 1 } ] );
  test.identical( got, false );

  test.case = 'arrays non-empty with empty arrays, not the same reference';
  var got = _.countable.equivalentShallow( [ [] ], [ [] ] );
  test.identical( got, false );

  test.case = 'arrays non-empty with non-empty arrays, not the same reference';
  var got = _.countable.equivalentShallow( [ [ 1, 2 ] ], [ [ 1, 2 ] ] );
  test.identical( got, false );

  test.case = 'typed buffer';
  var src1 = new F32x( 5 );
  var src2 = new F32x( 6 );
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'argumentsArray';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 4 ]);
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = `object countable - non empty, non-vector, not same array`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'vector & vectorLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, new : 0, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1, new : 0, length : 2 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'countable & countableLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 });
  var got = _.countable.equivalentShallow( src1, src2 );
  test.identical( got, false );

  test.close( 'not identical' );

  /* */

  test.open( 'not identical, equivalent' );

  test.case = 'set and array';
  var src1 = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var src2 = [ 1, 2, 3 ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.identicalShallow( src2, src1 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );
  test.identical( _.countable.equivalentShallow( src2, src1 ), true );

  test.case = 'buffer typed and array';
  var src1 = new F32x([ 1, 2, 3 ])
  var src2 = [ 1, 2, 3 ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.identicalShallow( src2, src1 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );
  test.identical( _.countable.equivalentShallow( src2, src1 ), true );

  test.case = 'vectorLike and array';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = [ '1', '10' ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.identicalShallow( src2, src1 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );
  test.identical( _.countable.equivalentShallow( src2, src1 ), true );

  test.case = 'countable and array';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = [ '1', '10' ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.identicalShallow( src2, src1 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );
  test.identical( _.countable.equivalentShallow( src2, src1 ), true );

  test.case = 'countable made and array';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = [ '1', '10' ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );

  test.case = `vector and array`;
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = [ '1', '10' ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.identicalShallow( src2, src1 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );
  test.identical( _.countable.equivalentShallow( src2, src1 ), true );

  test.case = `argumentsArray and array`;
  var src1 = _.argumentsArray.make([ '1', '10' ]);
  var src2 = [ '1', '10' ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.identicalShallow( src2, src1 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );
  test.identical( _.countable.equivalentShallow( src2, src1 ), true );

  test.case = `argumentsArray and array`;
  var src1 = _.argumentsArray.make([ '1', '10' ]);
  var src2 = [ '1', '10' ];
  test.identical( _.countable.identicalShallow( src1, src2 ), false );
  test.identical( _.countable.identicalShallow( src2, src1 ), false );
  test.identical( _.countable.equivalentShallow( src1, src2 ), true );
  test.identical( _.countable.equivalentShallow( src2, src1 ), true );

  test.close( 'not identical, equivalent' );

}

//

function exportStringDiagnosticShallow( test )
{
  test.case = 'array empty';
  var src = [];
  var expected = '{- Array with 0 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'array non-empty';
  var src = [ 1, 2, 3 ];
  var expected = '{- Array with 3 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'unroll empty';
  var src = _.unroll.make([]);
  var expected = '{- Array.unroll with 0 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'unroll non-empty';
  var src = _.unroll.make([ 1, 2, 3 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'vector & vectorLike';
  var src = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var expected = '{- countableConstructorPolluted.countable with 2 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'countable & countableLike';
  var src = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var expected = '{- countableConstructorPolluted.countable.constructible with 2 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = `object countable - empty, non-vector`;
  var src = __.diagnostic.objectMake({ new : 1, elements : [], countable : 1 });
  var expected = '{- countableConstructorPolluted.countable.constructible with 0 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = `object countable - non empty, non-vector`;
  var src = __.diagnostic.objectMake({ new : 1, elements : [ '1', '2', '3' ], countable : 1 });
  var expected = '{- countableConstructorPolluted.countable.constructible with 3 elements -}';
  var got = _.countable.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow( [], [] ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow( {} ) );
  var src = __.diagnostic.objectMake({ elements : [ '1', '10' ], new : 0 });
  test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow( src ) );

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
  //   _.props.extend( dst, o );
  //   if( o.countable )
  //   dst[ Symbol.iterator ] = _iterate;
  //   return dst;
  // }

}

//

function aptLeft( test )
{

  /* */

  test.case = 'left';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptLeft( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 0, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptLeft( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 1, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src,
    ],
    [
      2,
      1,
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptLeft( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 2, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src,
    ],
    [
      2,
      1,
      1,
      src,
    ],
    [
      3,
      2,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptLeft( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 3, 2, 2, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      0,
      0,
      src,
    ],
    [
      2,
      1,
      1,
      src,
    ],
    [
      3,
      2,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = __.diagnostic.objectMake({ elements : [], countable : 1 });
  var ops = [];
  var got = _.countable.aptLeft( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, -1, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var exp = [ 1, 0, 0, true ];
  var got = _.countable.aptLeft( src );
  test.identical( got, exp );
  var exp = [ 1, 0, 0, true ];
  var got = _.countable.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = __.diagnostic.objectMake({ elements : [], countable : 1 });
  var exp = [ undefined, -1, -1, false ];
  var got = _.countable.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, -1, -1, false ];
  var got = _.countable.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRight( test )
{

  /* */

  test.case = 'left';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptRight( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 0, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src,
    ],
    [
      2,
      1,
      1,
      src,
    ],
    [
      1,
      0,
      0,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptRight( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 1, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src,
    ],
    [
      2,
      1,
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptRight( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 2, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var ops = [];
  var got = _.countable.aptRight( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 1, 0, 0, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      2,
      2,
      src,
    ],
    [
      2,
      1,
      1,
      src,
    ],
    [
      1,
      0,
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = __.diagnostic.objectMake({ elements : [], countable : 1 });
  var ops = [];
  var got = _.countable.aptRight( src, function( val )
  {
    ops.push( [ ... arguments ] );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, -1, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = __.diagnostic.objectMake({ elements : [ 1, 2, 3 ], countable : 1 });
  var exp = [ 3, 2, 2, true ];
  var got = _.countable.aptRight( src );
  test.identical( got, exp );
  var exp = [ 3, 2, 2, true ];
  var got = _.countable.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = __.diagnostic.objectMake({ elements : [], countable : 1 });
  var exp = [ undefined, -1, -1, false ];
  var got = _.countable.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, -1, -1, false ];
  var got = _.countable.last( src );
  test.identical( got, exp );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Countable.l0.l3',
  silencing : 1,

  tests :
  {

    countablesAreIdenticalShallow,
    countablesAreEquivalentShallow,
    exportStringDiagnosticShallow,

    aptLeft,
    aptRight,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
