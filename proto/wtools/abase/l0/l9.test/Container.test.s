( function _l0_l9_Container_test_s_()
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
// tests
// --

/* qqq : normalize the test, please | Dmytro : normalized, extended coverage, improved routine extendReplacing by using correct condition */

function extendReplacingDstNull( test )
{
  test.case = 'src - empty array';
  var dst = null;
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty array';
  var dst = undefined;
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = undefined;
  var src = [ 0, 1 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty simple map';
  var dst = null;
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty simple map';
  var dst = undefined;
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = { a : 1, b : 2 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty pure map';
  var dst = null;
  var src = Object.create( null );
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled pure map';
  var dst = null;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var dst = undefined;
  var src = Object.create( null );
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty Set';
  var dst = null;
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = null;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty Set';
  var dst = undefined;
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = undefined;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty HashMap';
  var dst = null;
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled HashMap';
  var dst = null;
  var src = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty HashMap';
  var dst = undefined;
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - primitive';
  var dst = null;
  var src = 'str';
  var got = _.container.extendReplacing( dst, src );
  var exp = 'str';
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  test.case = 'src - BufferRaw';
  var dst = undefined;
  var src = new BufferRaw( 10 );
  var got = _.container.extendReplacing( dst, src );
  var exp = new BufferRaw( 10 );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  /* - */

  test.open( 'src - not container' );

  test.case = 'dst - primitive, src - primitive';
  var dst = 'str';
  var got = _.container.extendReplacing( dst, 1 );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'dst - long, src - primitive';
  var dst = [ 1, 2 ];
  var got = _.container.extendReplacing( dst, 1 );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'dst - map, src - primitive';
  var dst = { a : 2 };
  var got = _.container.extendReplacing( dst, 'str' );
  var exp = 'str';
  test.identical( got, exp );

  test.case = 'dst - HashMap, src - primitive';
  var dst = new HashMap( [ [ undefined, undefined ] ] );
  var got = _.container.extendReplacing( dst, null );
  var exp = null;
  test.identical( got, exp );

  test.case = 'dst - Set, src - primitive';
  var dst = new Set( [ 1, 2 ] );
  var got = _.container.extendReplacing( dst, undefined );
  var exp = undefined;
  test.identical( got, exp );

  /* */

  test.case = 'dst - long, src - BufferRaw';
  var dst = [ 1, 2 ];
  var src = new BufferRaw();
  var got = _.container.extendReplacing( dst, src );
  var exp = new BufferRaw();
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - map, src - function';
  var dst = { a : 2 };
  var src = () => {};
  var got = _.container.extendReplacing( dst, src );
  var exp = src;
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - HashMap, src - BufferView';
  var dst = new HashMap( [ [ undefined, undefined ] ] );
  var src = new BufferView( new BufferRaw() );
  var got = _.container.extendReplacing( dst, src );
  var exp = new BufferView( new BufferRaw() );
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - Set, src - object';
  var dst = new Set( [ 1, 2 ] );
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.container.extendReplacing( dst, src );
  test.identical( got.x, 1 );
  test.true( got === src );

  test.close( 'src - not container' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.container.extendReplacing() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( [ 1, 3 ], [ 1, 3 ], [ 1, 3 ] ) );

  test.case = 'src is WeakMap';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( { a : 1 }, new WeakMap() ) );

  test.case = 'src is WeakSet';
  test.shouldThrowErrorSync( () => _.container.extendReplacing( new Set( [ 1, 2 ] ), new WeakSet( [ 1, 2 ] ) ) );
}

//

function extendReplacingDstMapAndHashMapLike( test )
{
  test.open( 'src - aixiliary' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = {};
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendReplacing( dst, src );
  var exp = { 'a' : 3, 'b' : 5, 'c' : 6 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - aixiliary' );

  /* - */

  test.open( 'src - hashMapLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new HashMap( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new HashMap( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = new HashMap();
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - hashMapLike' );
}

//

function extendReplacingDstLongAndSetLike( test )
{
  test.open( 'src - longLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src - empty';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2, 3 ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - long, src - long';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6, 7 ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 4, 5, 6, 7 ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long not extensible, src - long';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6 ];
  Object.preventExtensions( dst );
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 4, 5, 6 ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long not extensible, src - long';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6, 7 ];
  Object.preventExtensions( dst );
  test.shouldThrowErrorSync( () => _.container.extendReplacing( dst, src ) );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( src, [ 4, 5, 6, 7 ] );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = [];
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - longLike' );

  /* - */

  test.open( 'src - setLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src -empty';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2 ];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 1, 2, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendReplacing( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new Set();
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, different content';
  var dst = new Set( [ 1, 2 ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 1, 2, 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, almost identical content';
  var dst = new Set( [ 9, -16, 'str', null ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendReplacing( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.close( 'src - setLike' );
}

//

/* aaa : normalize the test, please | Dmytro : normalized, extended coverage */

function extendAppendingDstNull( test )
{
  test.case = 'src - empty array';
  var dst = null;
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = null;
  var src = [ 0, 1 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty array';
  var dst = undefined;
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled array';
  var dst = undefined;
  var src = [ 0, 1 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 0, 1 ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty simple map';
  var dst = null;
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = null;
  var src = { a : 1, b : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty simple map';
  var dst = undefined;
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = { a : 1, b : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty pure map';
  var dst = null;
  var src = Object.create( null );
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled pure map';
  var dst = null;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty pure map';
  var dst = undefined;
  var src = Object.create( null );
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = Object.create( null );
  src[ 'a' ] = 1;
  src[ 'b' ] = 2;
  var got = _.container.extendAppending( dst, src );
  var exp = { 'a' : 1, 'b' : 2 };
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty Set';
  var dst = null;
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = null;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty Set';
  var dst = undefined;
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled Set';
  var dst = undefined;
  var src = new Set( [ 0, 1 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 0, 1 ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - empty HashMap';
  var dst = null;
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled HashMap';
  var dst = null;
  var src = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - empty HashMap';
  var dst = undefined;
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'src - filled simple map';
  var dst = undefined;
  var src = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 2, 2 ] ] );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'src - primitive';
  var dst = null;
  var src = 'str';
  var got = _.container.extendAppending( dst, src );
  var exp = 'str';
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  test.case = 'src - BufferRaw';
  var dst = undefined;
  var src = new BufferRaw( 10 );
  var got = _.container.extendAppending( dst, src );
  var exp = new BufferRaw( 10 );
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got === src );

  /* - */

  test.open( 'src - not container' );

  test.case = 'dst - long, src - primitive';
  var dst = [ 1, 2 ];
  var got = _.container.extendAppending( dst, 1 );
  var exp = [ 1, 2, 1 ];
  test.identical( got, exp );

  test.case = 'dst - map, src - primitive';
  var dst = { a : 2 };
  var got = _.container.extendAppending( dst, 'str' );
  var exp = [ { a : 2 }, 'str' ];
  test.identical( got, exp );

  test.case = 'dst - HashMap, src - primitive';
  var dst = new HashMap( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, null );
  var exp = [ new HashMap( [ [ undefined, undefined ] ] ), null ];
  test.identical( got, exp );

  test.case = 'dst - Set, src - primitive';
  var dst = new Set( [ 1, 2 ] );
  var got = _.container.extendAppending( dst, undefined );
  var exp = [ new Set( [ 1, 2 ] ), undefined ];
  test.identical( got, exp );

  /* */

  test.case = 'dst - long, src - BufferRaw';
  var dst = [ 1, 2 ];
  var got = _.container.extendAppending( dst, new BufferRaw() );
  var exp = [ 1, 2, new BufferRaw() ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, src - function';
  var dst = { a : 2 };
  var func = () => {};
  var got = _.container.extendAppending( dst, func );
  var exp = [ { a : 2 }, func ];
  test.identical( got, exp );

  test.case = 'dst - HashMap, src - BufferView';
  var dst = new HashMap( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, new BufferView( new BufferRaw() ) );
  var exp = [ new HashMap( [ [ undefined, undefined ] ] ), new BufferView( new BufferRaw() ) ];
  test.identical( got, exp );

  test.case = 'dst - Set, src - object';
  var dst = new Set( [ 1, 2 ] );
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var constr = new Constr();
  var got = _.container.extendAppending( dst, constr );
  var exp = [ dst, constr ];
  test.identical( got, exp );

  test.close( 'src - not container' );

  /* - */

  test.open( 'dst - not container' );

  test.case = 'dst - primitive, src - primitive';
  var dst = 'str';
  var got = _.container.extendAppending( dst, 1 );
  var exp = 1;
  test.identical( got, exp );

  test.case = 'dst - primitive, src - long';
  var dst = 1;
  var src = [ 1, 2 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2 ];
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - primitive, src - map';
  var dst = 'str';
  var src = { a : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 2 };
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - primitive, src - HashMap';
  var dst = true;
  var src = new HashMap( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ undefined, undefined ] ] );
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - primitive, src - set';
  var dst = false;
  var src = new Set( [ 1, 2 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 1, 2 ] );
  test.identical( got, exp );
  test.true( got === src );

  /* */

  test.case = 'dst - BufferRaw, src - long';
  var dst = new BufferRaw();
  var src = [ 1, 2 ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2 ];
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - function, src - map';
  var dst = () => {};
  var src = { a : 2 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 2 };
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - BufferView, src - HashMap';
  var dst = new BufferView( new BufferRaw() );
  var src = new HashMap( [ [ undefined, undefined ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ undefined, undefined ] ] );
  test.identical( got, exp );
  test.true( got === src );

  test.case = 'dst - object, src - Set';
  function Constr()
  {
    this.x = 1;
    return this;
  };
  var dst = new Constr;
  var src = new Set( [ 1, 2 ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 1, 2 ] );
  test.identical( got, exp );
  test.true( got === src );

  test.close( 'dst - not container' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.container.extendAppending() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.container.extendAppending( [ 1, 3 ], [ 1, 3 ], [ 1, 3 ] ) );

  test.case = 'src is WeakMap';
  test.shouldThrowErrorSync( () => _.container.extendAppending( { a : 1 }, new WeakMap() ) );

  test.case = 'src is WeakSet';
  test.shouldThrowErrorSync( () => _.container.extendAppending( new Set( [ 1, 2 ] ), new WeakSet( [ 1, 2 ] ) ) );
}

//

function extendAppendingDstMapAndHashMapLike( test )
{
  test.open( 'src - aixiliary' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = { a : 3, b : 5, c : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { d : 3, e : 5, f : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = { a : 1, b : 2, c : 3 };
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ {} ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, {} ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), {} ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = {};
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), {} ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = { 'a' : 3, 'b' : 5, 'c' : 6 };
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), { 'a' : 3, 'b' : 5, 'c' : 6 } ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - aixiliary' );

  /* - */

  test.open( 'src - hashMapLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = {};
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 3, b : 5, c : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, different content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new HashMap( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3, d : 3, e : 5, f : 6 };
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = { a : 1, b : 2, c : 3 };
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, different content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new HashMap( [ [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ], [ 'd', 3 ], [ 'e', 5 ], [ 'f', 6 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap() ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long, src - empty';
  var dst = [ 9, -16 ];
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, new HashMap() ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - long';
  var dst = [ 9, -16 ];
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), new HashMap() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set(), new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = new HashMap();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), new HashMap() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16 ] ), new HashMap( [ [ 'a', 3 ], [ 'b', 5 ], [ 'c', 6 ] ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'src - hashMapLike' );
}

//

function extendAppendingDstLongAndSetLike( test )
{
  test.open( 'src - longLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [ {} ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ {}, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src - empty';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ { 'a' : 1, 'b' : 2, 'c' : 3 }, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { 'a' : 1, 'b' : 2, 'c' : 3 };
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ { 'a' : 1, 'b' : 2, 'c' : 3 }, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap(), 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ), 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = [];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2, 3 ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2, 3, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - map, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, 'str', null, 9, -16, 'str', null ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - Set, src - empty';
  var dst = new Set( [ 9, -16 ] );
  var src = [];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16 ] );
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.case = 'dst - Set';
  var dst = new Set( [ 9, -16 ] );
  var src = [ 9, -16, 'str', null ];
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );
  test.true( got !== src );

  test.close( 'src - longLike' );

  /* - */

  test.open( 'src - setLike' );

  test.case = 'dst - empty map, src - empty';
  var dst = {};
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ {}, new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty map';
  var dst = {};
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ {}, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map, src -empty';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ { a : 1, b : 2, c : 3 }, new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - map';
  var dst = { a : 1, b : 2, c : 3 };
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ { a : 1, b : 2, c : 3 }, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty HashMap, src - empty';
  var dst = new HashMap();
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap(), new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - empty HashMap';
  var dst = new HashMap();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap(), new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, src - empty';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ), new Set() ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'dst - HashMap, almost identical content';
  var dst = new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new HashMap( [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ] ), new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got !== dst );
  test.true( got !== src );

  /* */

  test.case = 'dst - empty long, src - empty';
  var dst = [];
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set() ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty long';
  var dst = [];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, different content';
  var dst = [ 1, 2 ];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ 1, 2, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - long, almost identical content';
  var dst = [ 9, -16, 'str', null ];
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = [ 9, -16, 'str', null, new Set( [ 9, -16, 'str', null ] ) ];
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst - empty Set, src - empty';
  var dst = new Set();
  var src = new Set();
  var got = _.container.extendAppending( dst, src );
  var exp = new Set();
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - empty Set';
  var dst = new Set();
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, different content';
  var dst = new Set( [ 1, 2 ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 1, 2, 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst - Set, almost identical content';
  var dst = new Set( [ 9, -16, 'str', null ] );
  var src = new Set( [ 9, -16, 'str', null ] );
  var got = _.container.extendAppending( dst, src );
  var exp = new Set( [ 9, -16, 'str', null ] );
  test.identical( got, exp );
  test.true( got === dst );

  test.close( 'src - setLike' );
}

// --
// define test suite
// --

const Proto =
{

  name : 'Tools.Container.l0.l9',
  silencing : 1,

  tests :
  {

    extendReplacingDstNull,
    extendReplacingDstMapAndHashMapLike,
    extendReplacingDstLongAndSetLike,

    extendAppendingDstNull,
    extendAppendingDstMapAndHashMapLike,
    extendAppendingDstLongAndSetLike,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
