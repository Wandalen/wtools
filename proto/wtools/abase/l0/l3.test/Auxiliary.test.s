( function _l0_l3_Auxiliary_test_s_()
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
// exporter
// --

function exportStringDiagnosticShallow( test )
{

  test.case = 'pure empty map';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  var expected = '{- Map.pure with 1 elements -}';
  src.x = 1;
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'empty polluted map';
  var src = {};
  var expected = '{- Map.polluted with 0 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'polluted map';
  var src = { a : 7, b : 13 };
  var expected = '{- Map.polluted with 2 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var expected = '{- Aux.pure.prototyped with 0 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'prototyped from pure map deep';
  var prototype1 = Object.create( null );
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  var expected = '{- Aux.pure.prototyped with 0 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'prototyped from pure map deep with props';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  var expected = '{- Aux.pure.prototyped with 2 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'prototyped from polluted map';
  var prototype = {};
  var src = Object.create( prototype );
  var expected = '{- Aux.polluted.prototyped with 0 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'prototyped from polluted map deep';
  var prototype1 = {};
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  var expected = '{- Aux.polluted.prototyped with 0 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'prototyped from polluted map deep with props';
  var prototype1 = {};
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  var expected = '{- Aux.polluted.prototyped with 2 elements -}';
  var got = _.aux.exportStringDiagnosticShallow( src );
  test.identical( got, expected );


  if( !Config.debug )
  return;

  test.case = 'no args'
  test.shouldThrowErrorSync( () => _.aux.exportStringDiagnosticShallow() );

  test.case = 'redundant args'
  test.shouldThrowErrorSync( () => _.aux.exportStringDiagnosticShallow( {}, 13 ) );

  test.case = 'not aux'
  test.shouldThrowErrorSync( () => _.aux.exportStringDiagnosticShallow( [] ) );
}

//

function identicalShallow( test )
{

  test.case = 'same map';
  var src = { a : 1 }
  var got = _.aux.identicalShallow( src, src );
  test.identical( got, true );

  test.case = 'same values';
  var got = _.aux.identicalShallow( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'same values with nested objects';
  var got = _.aux.identicalShallow( { a : 7, b : { c : 13 } }, { a : 7, b : { c : 13 } } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'not the same values in'
  var got = _.aux.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 14 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the first argument'
  var got = _.aux.identicalShallow( { 'a' : 7, 'b' : 13, 'с' : 15 }, { 'a' : 7, 'b' : 13 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the second argument'
  var got = _.aux.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 13, 'с' : 15 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty maps, standrard'
  var got = _.aux.identicalShallow( {}, {} );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, pure'
  var got = _.aux.identicalShallow( Object.create( null ), Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, one standard another pure'
  var got = _.aux.identicalShallow( {}, Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'not object-like 1 arg';
  var got = _.aux.identicalShallow( [ 'a', 7, 'b', 14 ], { a : 7, b : 14 } );
  var expected = false;
  test.identical( got, expected );
  var got = _.aux.identicalShallow( { a : 7, b : 14 }, [ 'a', 7, 'b', 14 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'not object-like arguments';
  var got = _.aux.identicalShallow( [ 'a', 7, 'b', 14 ], [ 'a', 7, 'b', 14 ] );
  var expected = false;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.aux.identicalShallow();
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.aux.identicalShallow( {} );
  });

  test.case = 'redundant arguments';
  test.shouldThrowErrorSync( function()
  {
    _.aux.identicalShallow( {}, {}, {}, 'redundant argument' );
  });

}

// --
// container interface
// --

function aptLeft( test )
{

  /* */

  test.case = 'left';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.aux.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 'a', 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.aux.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 'b', 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.aux.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 'c', 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      3,
      'c',
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.aux.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 3, 'c', 2, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      3,
      'c',
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = Object.create( Object.create( null ) );
  var ops = [];
  var got = _.aux.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
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
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var exp = [ 1, 'a', 0, true ];
  var got = _.aux.aptLeft( src );
  test.identical( got, exp );
  var exp = [ 1, 'a', 0, true ];
  var got = _.aux.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = Object.create( Object.create( null ) );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.aux.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.aux.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRight( test )
{

  /* */

  test.case = 'left';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  debugger;
  var got = _.aux.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  debugger;
  var exp = [ 11, 'a', 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      1,
      'a',
      0,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.aux.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 'b', 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.aux.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 'c', 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.aux.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 1, 'a', 0, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      1,
      'a',
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = Object.create( Object.create( null ) );
  var ops = [];
  var got = _.aux.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
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
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var exp = [ 3, 'c', 2, true ];
  var got = _.aux.aptRight( src );
  test.identical( got, exp );
  var exp = [ 3, 'c', 2, true ];
  var got = _.aux.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = Object.create( Object.create( null ) );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.aux.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.aux.last( src );
  test.identical( got, exp );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Auxiliary.l0.l3',
  silencing : 1,

  tests :
  {

    exportStringDiagnosticShallow,
    identicalShallow,

    aptLeft,
    aptRight,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
