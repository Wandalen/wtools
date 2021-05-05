( function _l0_l3_Itself_test_s_()
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

function exportStringDiagnosticShallow( test )
{

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = { [ Symbol.iterator ] : 1 };
  var exp = '{- Map.polluted -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var exp = '{- Aux.polluted.prototyped -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var exp = '{- Map.pure -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var exp = '{- Map.polluted -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  test.case = 'vector & vectorLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var exp = '{- countableConstructorPolluted.countable -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  test.case = 'countable & countableLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], countable : 1 });
  var exp = '{- countableConstructorPolluted.countable.constructible -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  test.case = `object countable - empty, non-vector`;
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [], countable : 1 } );
  var exp = '{- countableConstructorPolluted.countable.constructible -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  test.case = `object countable - non empty, non-vector`;
  var src = __.diagnostic.objectMake({ /* ttt */ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var exp = '{- Map.polluted -}';
  var got = _.blank.exportStringDiagnosticShallow( src );
  test.identical( got, exp );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.blank.exportStringDiagnosticShallow() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.blank.exportStringDiagnosticShallow( [], [] ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.countable.exportStringDiagnosticShallow( {} ) );

}

//

function identicalShallow( test )
{

  test.case = 'same map';
  var src = { a : 1 }
  var got = _.blank.identicalShallow( src, src );
  test.identical( got, true );

  test.case = 'same values';
  var got = _.blank.identicalShallow( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var exp = false;
  test.identical( got, exp );

  test.case = 'same values with nested objects';
  var got = _.blank.identicalShallow( { a : 7, b : { c : 13 } }, { a : 7, b : { c : 13 } } );
  var exp = false;
  test.identical( got, exp );

  test.case = 'not the same values in'
  var got = _.blank.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 14 } );
  var exp = false;
  test.identical( got, exp );

  test.case = 'different number of keys, more in the first argument'
  var got = _.blank.identicalShallow( { 'a' : 7, 'b' : 13, 'с' : 15 }, { 'a' : 7, 'b' : 13 } );
  var exp = false;
  test.identical( got, exp );

  test.case = 'different number of keys, more in the second argument'
  var got = _.blank.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 13, 'с' : 15 } );
  var exp = false;
  test.identical( got, exp );

  test.case = 'empty maps, standrard'
  var got = _.blank.identicalShallow( {}, {} );
  var exp = false;
  test.identical( got, exp );

  test.case = 'empty maps, pure'
  var got = _.blank.identicalShallow( Object.create( null ), Object.create( null ) );
  var exp = false;
  test.identical( got, exp );

  test.case = 'empty maps, one standard another pure'
  var got = _.blank.identicalShallow( {}, Object.create( null ) );
  var exp = false;
  test.identical( got, exp );

  test.case = 'not object-like 1 arg';
  var got = _.blank.identicalShallow( [ 'a', 7, 'b', 14 ], { a : 7, b : 14 } );
  var exp = false;
  test.identical( got, exp );
  var got = _.blank.identicalShallow( { a : 7, b : 14 }, [ 'a', 7, 'b', 14 ] );
  var exp = false;
  test.identical( got, exp );

  test.case = 'not object-like arguments';
  var got = _.blank.identicalShallow( [ 'a', 7, 'b', 14 ], [ 'a', 7, 'b', 14 ] );
  var exp = false;
  test.identical( got, exp );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.blank.identicalShallow();
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.blank.identicalShallow( {} );
  });

  // test.case = 'redundant arguments';
  // test.shouldThrowErrorSync( function()
  // {
  //   _.blank.identicalShallow( {}, {}, 'redundant argument' );
  // });

}

//

function aptLeftItself( test )
{

  /* */

  test.case = 'left';
  var src = _.diagnostic.objectMake({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.blank.aptLeft( src, function( val )
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
  var got = _.blank.aptLeft( src, function( val )
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
  var got = _.blank.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.blank.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = _.diagnostic.objectMake({});
  var exp = [ undefined, undefined, -1, false ];
  var got = _.blank.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.blank.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRightItself( test )
{

  /* */

  test.case = 'left';
  var src = _.diagnostic.objectMake({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.blank.aptRight( src, function( val )
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
  var got = _.blank.aptRight( src, function( val )
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
  var got = _.blank.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.blank.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = Object.create( null );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.blank.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.blank.last( src );
  test.identical( got, exp );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Itself.l0.l3',
  silencing : 1,

  tests :
  {

    exportStringDiagnosticShallow,
    identicalShallow,

    aptLeftItself,
    aptRightItself,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
