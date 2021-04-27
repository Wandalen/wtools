( function _l0_l3_Object_test_s_()
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

//--
// exporter
//--

function exportStringShallowDiagnostic( test )
{

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = { [ Symbol.iterator ] : 1 };
  var expected = '{- Object -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var expected = '{- Aux.polluted.prototyped -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var expected = '{- Map.pure -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var expected = '{- Map.polluted -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'vector & vectorLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var expected = '{- countableConstructor.countable with 2 elements -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'countable & countableLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = `object countable - empty, non-vector`;
  var src = countableMake( null, { elements : [], withIterator : 1 } );
  var expected = '{- Object.countable with 0 elements -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = `object countable - non empty, non-vector`;
  var src = countableMake( null, { elements : [ '1', '2', '3' ], withIterator : 1 } );
  var expected = '{- Object.countable with 3 elements -}';
  var got = _.object.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.object.exportStringShallowDiagnostic() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.object.exportStringShallowDiagnostic( [], [] ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.countable.exportStringShallowDiagnostic( {} ) );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructor( o )
  {
    return countableMake( this, o );
  }

  /* */

  function countableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.props.extend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }
}

//

function identicalShallow( test )
{

  test.case = 'same map';
  var src = { a : 1 }
  var got = _.object.identicalShallow( src, src );
  test.identical( got, true );

  test.case = 'same values';
  var got = _.object.identicalShallow( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'same values with nested objects';
  var got = _.object.identicalShallow( { a : 7, b : { c : 13 } }, { a : 7, b : { c : 13 } } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'not the same values in'
  var got = _.object.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 14 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the first argument'
  var got = _.object.identicalShallow( { 'a' : 7, 'b' : 13, 'с' : 15 }, { 'a' : 7, 'b' : 13 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the second argument'
  var got = _.object.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 13, 'с' : 15 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty maps, standrard'
  var got = _.object.identicalShallow( {}, {} );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, pure'
  var got = _.object.identicalShallow( Object.create( null ), Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, one standard another pure'
  var got = _.object.identicalShallow( {}, Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'not object-like 1 arg';
  var got = _.object.identicalShallow( [ 'a', 7, 'b', 14 ], { a : 7, b : 14 } );
  var expected = false;
  test.identical( got, expected );
  var got = _.object.identicalShallow( { a : 7, b : 14 }, [ 'a', 7, 'b', 14 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'not object-like arguments';
  var got = _.object.identicalShallow( [ 'a', 7, 'b', 14 ], [ 'a', 7, 'b', 14 ] );
  var expected = false;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.object.identicalShallow();
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.object.identicalShallow( {} );
  });

  test.case = 'redundant arguments';
  test.shouldThrowErrorSync( function()
  {
    _.object.identicalShallow( {}, {}, 'redundant argument' );
  });

}

//

function aptLeftBlank( test )
{

  /* */

  test.case = 'left';
  var src = _.diagnostic.objectMake({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.object.aptLeft( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = Object.create( null );
  var ops = [];
  var got = _.object.aptLeft( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = _.diagnostic.objectMake({ a : 1, b : 2, c : 3 });
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = _.diagnostic.objectMake({});
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRightBlank( test )
{

  /* */

  test.case = 'left';
  var src = _.diagnostic.objectMake({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.object.aptRight( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = Object.create( null );
  var ops = [];
  var got = _.object.aptRight( src, function( val )
  {
    ops.push( _.longSlice( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = _.diagnostic.objectMake({ a : 1, b : 2, c : 3 });
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = Object.create( null );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.object.last( src );
  test.identical( got, exp );

  /* */

}

// --
//
// --

const Proto =
{

  name : 'Tools.Object.l3',
  silencing : 1,

  tests :
  {

    exportStringShallowDiagnostic,
    identicalShallow,

    aptLeftBlank,
    aptRightBlank,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
