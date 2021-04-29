( function _l0_l9_Set_test_s_()
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

function areIdenticalShallow( test )
{
  test.open( 'identical' );

  test.case = 'empty';
  var src1 = new Set();
  var src2 = new Set();
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'strings';
  var src1 = new Set([ 'str1', 'str2' ]);
  var src2 = new Set([ 'str1', 'str2' ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'numbers';
  var src1 = new Set([ 1, 2 ]);
  var src2 = new Set([ 1, 2 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'bool';
  var src1 = new Set([ true, false ]);
  var src2 = new Set([ true, false ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'null';
  var src1 = new Set([ null, null ]);
  var src2 = new Set([ null, null ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'undefined';
  var src1 = new Set([ undefined, undefined ]);
  var src2 = new Set([ undefined, undefined ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'symbol';
  var src1 = new Set([ _.undefined, _.undefined ]);
  var src2 = new Set([ _.undefined, _.undefined ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'bigInt';
  var src1 = new Set([ 10n, 9n ]);
  var src2 = new Set([ 10n, 9n ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. object empty';
  var obj = {};
  var obj2 = {}
  var src1 = new Set([ obj, obj2 ]);
  var src2 = new Set([ obj, obj2 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. object non-empty';
  var obj = { a : 1 };
  var obj2 = { a : 1 }
  var src1 = new Set([ obj, obj2 ]);
  var src2 = new Set([ obj, obj2 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. array empty';
  var arr = [];
  var arr2 = []
  var src1 = new Set([ arr, arr2 ]);
  var src2 = new Set([ arr, arr2 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.case = 'non-primitive, same refference. array non-empty';
  var arr = [ 1, 2 ];
  var arr2 = [ 1, 2 ]
  var src1 = new Set([ arr, arr2 ]);
  var src2 = new Set([ arr, arr2 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'empty - non-empty';
  var src1 = new Set();
  var src2 = new Set([ 1 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'strings';
  var src1 = new Set([ 'str1', 'str22' ]);
  var src2 = new Set([ 'str1', 'str2' ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'numbers';
  var src1 = new Set([ 1, 2 ]);
  var src2 = new Set([ 1, 3 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'bool';
  var src1 = new Set([ true, true ]);
  var src2 = new Set([ true, false ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'null undefined';
  var src1 = new Set([ undefined, undefined ]);
  var src2 = new Set([ null, undefined ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'symbol';
  var src1 = new Set([ _.undefined, _.null ]);
  var src2 = new Set([ _.undefined, _.nothing ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'bigInt';
  var src1 = new Set([ 10n, 9n ]);
  var src2 = new Set([ 10n, 8n ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'same bigInt - number';
  var src1 = new Set([ 10n, 8 ]);
  var src2 = new Set([ 10, 8n ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. object empty';
  var src1 = new Set([ {}, {} ]);
  var src2 = new Set([ {}, {} ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. object non-empty';
  var src1 = new Set([ { a : 1 }, { a : 2 } ]);
  var src2 = new Set([ { a : 1 }, { a : 2 } ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. array';
  var src1 = new Set([ [], [] ]);
  var src2 = new Set([ [], [] ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, not same refference. array non-empty';
  var src1 = new Set([ [ 1, 2, 3 ], [ 4, 5 ] ]);
  var src2 = new Set([ [ 1, 2, 3 ], [ 4, 5 ] ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.case = 'non-primitive, one not set';
  var src1 = new Set([ 1, 2 ]);
  var src2 = [ 1, 2 ];
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );
  var src1 = [ 1, 2 ];
  var src2 = new Set([ 1, 2 ]);
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );
  var src1 = [ 1, 2 ];
  var src2 = { '0' : 1, '1' : 2 };
  var got = _.set.identicalShallow( src1, src2 );
  test.identical( got, false );

  test.close( 'not identical' );
}

//

function exportStringShallowDiagnostic( test )
{

  test.case = 'empty';
  var src = new Set();
  var expected = '{- Set with 0 elements -}';
  var got = _.set.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'strings';
  var src = new Set([ 'str1', 'str2' ]);
  var expected = '{- Set with 2 elements -}';
  var got = _.set.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'numbers';
  var src = new Set([ 1, 2, 3 ]);
  var expected = '{- Set with 3 elements -}';
  var got = _.set.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'bool';
  var src = new Set([ true, false, true, false ]);
  var expected = '{- Set with 2 elements -}';
  var got = _.set.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no args'
  test.shouldThrowErrorSync( () => _.set.exportStringShallowDiagnostic() );

  test.case = 'redundant args'
  test.shouldThrowErrorSync( () => _.set.exportStringShallowDiagnostic( new Set(), new Set() ) );

  test.case = 'not set'
  test.shouldThrowErrorSync( () => _.set.exportStringShallowDiagnostic( new HashMap() ) );
}

//

/* qqq : extend */
function but( test )
{

  // test.case = 'basic, 2 args';
  // var src1 = new Set([ 1, 2, 3 ]);
  // var src2 = new Set([ 2, 3, 4 ]);
  // var got = _.set.but( src1, src2 );
  // test.true( got !== src1 );
  // test.true( got !== src2 );
  // test.true( _.set.is( got ) );
  // var exp = new Set([ 1 ]);
  // test.identical( got, exp );

  test.case = 'basic, 3 args';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 2, 3, 4 ]);
  var got = _.set.but( null, src1, src2 );
  test.true( got !== src1 );
  test.true( got !== src2 );
  test.true( _.set.is( got ) );
  var exp = new Set([ 1 ]);
  test.identical( got, exp );

}

//

/* qqq : extend */
function only( test )
{

  // test.case = 'basic, 2 args';
  // var src1 = new Set([ 1, 2, 3 ]);
  // var src2 = new Set([ 2, 3, 4 ]);
  // var got = _.set.only( src1, src2 );
  // test.true( got !== src1 );
  // test.true( got !== src2 );
  // test.true( _.set.is( got ) );
  // var exp = new Set([ 2, 3 ]);
  // test.identical( got, exp );

  test.case = 'basic, 3 args';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 2, 3, 4 ]);
  var got = _.set.only( null, src1, src2 );
  test.true( got !== src1 );
  test.true( got !== src2 );
  test.true( _.set.is( got ) );
  var exp = new Set([ 2, 3 ]);
  test.identical( got, exp );

}

//

/* qqq : extend */
function diff( test )
{

  test.case = 'basic, 2 args';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 2, 3, 4 ]);
  var got = _.set.diff( src1, src2 );
  test.true( got.src1 !== src1 );
  test.true( got.src2 !== src2 );
  test.true( _.mapIs( got ) );
  test.true( _.set.is( got.src1 ) );
  test.true( _.set.is( got.src2 ) );
  var exp =
  {
    'src1' : new Set([ 1 ]),
    'src2' : new Set([ 4 ]),
    'diff' : new Set([ 1, 4 ]),
    'identical' : false,
  }
  test.identical( got, exp );

  test.case = 'basic, 3 args';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 2, 3, 4 ]);
  var got = _.set.diff( null, src1, src2 );
  test.true( got.src1 !== src1 );
  test.true( got.src2 !== src2 );
  test.true( _.mapIs( got ) );
  test.true( _.set.is( got.src1 ) );
  test.true( _.set.is( got.src2 ) );
  var exp =
  {
    'src1' : new Set([ 1 ]),
    'src2' : new Set([ 4 ]),
    'diff' : new Set([ 1, 4 ]),
    'identical' : false,
  }
  test.identical( got, exp );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Set.l0.l9',
  silencing : 1,

  tests :
  {

    areIdenticalShallow,
    exportStringShallowDiagnostic,

    but,
    only,
    diff,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
