( function _l0_l3_HashMap_test_s_()
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

function areIdenticalShallow( test )
{
  test.open( 'identical' );

  test.case = 'empty';
  var src1 = new HashMap();
  var src2 = new HashMap();
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'strings';
  var src1 = new HashMap([ [ 'str1', 'str2' ] ]);
  var src2 = new HashMap([ [ 'str1', 'str2' ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'numbers';
  var src1 = new HashMap([ [ 1, 2 ] ]);
  var src2 = new HashMap([ [ 1, 2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'bool';
  var src1 = new HashMap([ [ true, false ] ]);
  var src2 = new HashMap([ [ true, false ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'null';
  var src1 = new HashMap([ [ null, null ] ]);
  var src2 = new HashMap([ [ null, null ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'undefined';
  var src1 = new HashMap([ [ undefined, undefined ] ]);
  var src2 = new HashMap([ [ undefined, undefined ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'symbol';
  var src1 = new HashMap([ [ _.undefined, _.undefined ] ]);
  var src2 = new HashMap([ [ _.undefined, _.undefined ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'bigInt';
  var src1 = new HashMap([ [ 10n, 9n ] ]);
  var src2 = new HashMap([ [ 10n, 9n ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. object empty';
  var obj = {};
  var obj2 = {}
  var src1 = new HashMap([ [ obj, obj2 ] ]);
  var src2 = new HashMap([ [ obj, obj2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. object non-empty';
  var obj = { a : 1 };
  var obj2 = { a : 1 }
  var src1 = new HashMap([ [ obj, obj2 ] ]);
  var src2 = new HashMap([ [ obj, obj2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. array empty';
  var arr = [];
  var arr2 = []
  var src1 = new HashMap([ [ arr, arr2 ] ]);
  var src2 = new HashMap([ [ arr, arr2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. array non-empty';
  var arr = [ 1, 2 ];
  var arr2 = [ 1, 2 ]
  var src1 = new HashMap([ [ arr, arr2 ] ]);
  var src2 = new HashMap([ [ arr, arr2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'empty - non-empty';
  var src1 = new HashMap();
  var src2 = new HashMap([ [ 1 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'strings';
  var src1 = new HashMap([ [ 'str1', 'str22' ] ]);
  var src2 = new HashMap([ [ 'str1', 'str2' ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'numbers';
  var src1 = new HashMap([ [ 1, 2 ] ]);
  var src2 = new HashMap([ [ 1, 3 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'bool';
  var src1 = new HashMap([ [ true, true ] ]);
  var src2 = new HashMap([ [ true, false ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'null undefined';
  var src1 = new HashMap([ [ undefined, undefined ] ]);
  var src2 = new HashMap([ [ null, undefined ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'symbol';
  var src1 = new HashMap([ [ _.undefined, _.null ] ]);
  var src2 = new HashMap([ [ _.undefined, _.nothing ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'bigInt';
  var src1 = new HashMap([ [ 10n, 9n ] ]);
  var src2 = new HashMap([ [ 10n, 8n ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'same bigInt - number';
  var src1 = new HashMap([ [ 10n, 8 ] ]);
  var src2 = new HashMap([ [ 10, 8n ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. object empty';
  var src1 = new HashMap([ [ {}, {} ] ]);
  var src2 = new HashMap([ [ {}, {} ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. object non-empty';
  var src1 = new HashMap([ [ { a : 1 }, { a : 2 } ] ]);
  var src2 = new HashMap([ [ { a : 1 }, { a : 2 } ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. array';
  var src1 = new HashMap([ [ [], [] ] ]);
  var src2 = new HashMap([ [ [], [] ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. array non-empty';
  var src1 = new HashMap([ [ [ 1, 2, 3 ], [ 4, 5 ] ] ]);
  var src2 = new HashMap([ [ [ 1, 2, 3 ], [ 4, 5 ] ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = '1 hash map and 1 not';
  var src1 = new HashMap([ [ 'a', 1 ] ]);
  var src2 = { a : 1 };
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );
  var src1 = { a : 1 };
  var src2 = new HashMap([ [ 'a', 1 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );
  var src1 = [ 'a', 1 ];
  var src2 = new HashMap([ [ 'a', 1 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  /* */

  test.case = 'non-primitive, key not same refference. object empty';
  var key1 = {};
  var key2 = {};
  var val = {};
  var src1 = new HashMap([ [ key1, val ] ]);
  var src2 = new HashMap([ [ key2, val ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, key not same refference. object non-empty';
  var key1 = { a : 1 };
  var key2 = { a : 1 };
  var val = { b : 2 };
  var src1 = new HashMap([ [ key1, val ] ]);
  var src2 = new HashMap([ [ key2, val ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, val not same refference. object empty';
  var key = {};
  var val1 = {};
  var val2 = {};
  var src1 = new HashMap([ [ key, val1 ] ]);
  var src2 = new HashMap([ [ key, val2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, val not same refference. object non-empty';
  var key = { a : 1 };
  var val1 = { b : 2 };
  var val2 = { b : 2 };
  var src1 = new HashMap([ [ key, val1 ] ]);
  var src2 = new HashMap([ [ key, val2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  /* */

  test.case = 'non-primitive, key not same refference. array empty';
  var key1 = [];
  var key2 = [];
  var val = [];
  var src1 = new HashMap([ [ key1, val ] ]);
  var src2 = new HashMap([ [ key2, val ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, key not same refference. array non-empty';
  var key1 = [ 1, 2 ];
  var key2 = [ 1, 2 ];
  var val = [ 2, 3 ];
  var src1 = new HashMap([ [ key1, val ] ]);
  var src2 = new HashMap([ [ key2, val ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, val not same refference. array empty';
  var key = [];
  var val1 = [];
  var val2 = [];
  var src1 = new HashMap([ [ key, val1 ] ]);
  var src2 = new HashMap([ [ key, val2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, val not same refference. array non-empty';
  var key = [ 1, 2 ];
  var val1 = [ 2, 3 ];
  var val2 = [ 2, 3 ];
  var src1 = new HashMap([ [ key, val1 ] ]);
  var src2 = new HashMap([ [ key, val2 ] ]);
  var got = _.hashMap.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.close( 'not identical' );
}

//

function exportStringDiagnosticShallow( test )
{
  test.case = 'empty';
  var src = new HashMap();
  var expected = '{- HashMap with 0 elements -}';
  var got = _.hashMap.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'strings';
  var src = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var expected = '{- HashMap with 2 elements -}';
  var got = _.hashMap.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'numbers';
  var src = new HashMap([ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ] ]);
  var expected = '{- HashMap with 3 elements -}';
  var got = _.hashMap.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'bool';
  var src = new HashMap([ [ true, 1 ], [ true, 2 ], [ false, 3 ] ]);
  var expected = '{- HashMap with 2 elements -}';
  var got = _.hashMap.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no args'
  test.shouldThrowErrorSync( () => _.hashMap.exportStringDiagnosticShallow() );

  test.case = 'redundant args'
  test.shouldThrowErrorSync( () => _.hashMap.exportStringDiagnosticShallow( new HashMap(), new HashMap() ) );

  test.case = 'not hashMap'
  test.shouldThrowErrorSync( () => _.hashMap.exportStringDiagnosticShallow( new Set() ) );

}

//

function aptLeft( test )
{

  /* */

  test.case = 'left';
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptLeft( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptLeft( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptLeft( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptLeft( src, function( val )
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
  var src = _.hashMap.fromProps({});
  var ops = [];
  var got = _.hashMap.aptLeft( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var exp = [ 1, 'a', 0, true ];
  var got = _.hashMap.aptLeft( src );
  test.identical( got, exp );
  var exp = [ 1, 'a', 0, true ];
  var got = _.hashMap.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = _.hashMap.fromProps({});
  var exp = [ undefined, undefined, -1, false ];
  var got = _.hashMap.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.hashMap.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRight( test )
{

  /* */

  test.case = 'left';
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptRight( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptRight( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptRight( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.hashMap.aptRight( src, function( val )
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
  var src = _.hashMap.fromProps({});
  var ops = [];
  var got = _.hashMap.aptRight( src, function( val )
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
  var src = _.hashMap.fromProps({ a : 1, b : 2, c : 3 });
  var exp = [ 3, 'c', 2, true ];
  var got = _.hashMap.aptRight( src );
  test.identical( got, exp );
  var exp = [ 3, 'c', 2, true ];
  var got = _.hashMap.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = _.hashMap.fromProps({});
  var exp = [ undefined, undefined, -1, false ];
  var got = _.hashMap.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.hashMap.last( src );
  test.identical( got, exp );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.HashMap.l0.l3', /* xxx : make optional name. deduce if not defined */
  silencing : 1,

  tests :
  {

    areIdenticalShallow,
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
