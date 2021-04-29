( function _l0_l9_Routine_test_s_()
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
// test
// --

function vectorizeVectorizeArray( test )
{
  function routine()
  {
    if( arguments.length === 0 )
    return null;
    return _.longSlice( arguments );
  };
  var srcRoutine = routine;

  /* */

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'without arguments';
  var got = routine();
  test.identical( got, null );

  test.case = 'single argument';
  var src = 1;
  var got = routine( src );
  test.identical( got, [ 1 ] );
  test.true( got !== src );

  test.case = 'multiply arguments';
  var src = 1;
  var got = routine( src, 0 );
  test.identical( got, [ 1, 0 ] );
  test.true( got !== src );

  /* - */

  test.open( 'array' );

  test.case = 'single argument';

  var src = [ 1 ];
  var got = routine( src );
  test.identical( got, [ [ 1 ] ] );
  test.true( got !== src );

  var src = [ 1, 2, 3 ];
  var got = routine( src );
  test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = [ 1, 2, 3 ];
  var got = routine( src, 2 );
  test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = 2;
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( got, [ 2, [ 1, 2, 3 ] ] );
  test.true( got !== src );

  var src = [ 1, 2 ];
  var got = routine( src, [ 3, 4 ] )
  test.identical( got, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'array' );

  /* - */

  test.open( 'Set' );

  test.case = 'single argument';

  var src = new Set( [ 1 ] );
  var got = routine( src );
  test.identical( [ ... got ], [ [ 1 ] ] );
  test.true( got !== src );

  var src = new Set( [ 1, 2, 3 ] );
  var got = routine( src );
  test.identical( [ ... got ], [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = new Set( [ 1, 2, 3 ] );
  var got = routine( src, 2 );
  test.identical( [ ... got ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = new Set( [ 2 ] );
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( [ ... got ], [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = new Set( [ 1, 2 ] );
  var got = routine( new Set( [ 1, 2 ] ), [ 3, 4 ] )
  test.identical( [ ... got ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'Set' );

  /* - */

  var src = _.containerAdapter.make( [ 1, 2 ] );
  var got = routine( src, [ 3, 4 ] )
  test.identical( [ ... got[ 0 ].original ], [ 1, 2 ] );
  test.identical( [ got[ 1 ] ], [ [ 3, 4 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
  var got = routine( src, 2 );
  test.identical( [ ... got[ 0 ].original ], [ 1, 2, 3 ] );
  test.identical( [ got[ 1 ] ], [ 2 ] );
  test.true( got !== src );

  /* - */

  test.open( 'containerAdapter, no unwraping' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1,
    vectorizingContainerAdapter : 1,
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'single argument';
  var src = _.containerAdapter.make( [ 1 ] );
  var got = routine( src );
  test.identical( got.original, [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( [ 1, 2, 3 ] );
  var got = routine( src );
  test.identical( got.original, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( [ 1, 2, 3 ] );
  var got = routine( src, 2 );
  test.identical( got.original, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( [ 2 ] );
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( got.original, [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( [ 1, 2 ] );
  var got = routine( src, [ 3, 4 ] )
  test.identical( got.original, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  /* */

  var src = _.containerAdapter.make( new Set( [ 1 ] ) );
  var got = routine( src );
  test.identical( [ ... got.original ], [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
  var got = routine( src );
  test.identical( [ ... got.original ], [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
  var got = routine( src, 2 );
  test.identical( [ ... got.original ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( [ 2 ] );
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( [ ... got.original ], [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var got = routine( src, [ 3, 4 ] )
  test.identical( [ ... got.original ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'containerAdapter, no unwraping' );

  /* - */

  test.open( 'containerAdapter, no unwraping' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1,
    vectorizingContainerAdapter : 1,
    unwrapingContainerAdapter : 1,
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'single argument';

  var src = _.containerAdapter.make( [ 1 ] );
  var got = routine( src );
  test.identical( got, [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( [ 1, 2, 3 ] );
  var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ) );
  test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( [ 1, 2, 3 ] );
  var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ), 2 );
  test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( [ 2 ] );
  var got = routine( _.containerAdapter.make( [ 2 ] ), [ 1, 2, 3 ] );
  test.identical( got, [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( [ 1, 2 ] );
  var got = routine( _.containerAdapter.make( [ 1, 2 ] ), [ 3, 4 ] )
  test.identical( got, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  /* */

  var src = _.containerAdapter.make( new Set( [ 1 ] ) );
  var got = routine( src );
  test.identical( [ ... got ], [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ) );
  test.identical( [ ... got ], [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ), 2 );
  test.identical( [ ... got ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 2 ] ) );
  var got = routine( _.containerAdapter.make( new Set( [ 2 ] ) ), [ 1, 2, 3 ] );
  test.identical( [ ... got ], [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2 ] ) ), [ 3, 4 ] )
  test.identical( [ ... got ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'containerAdapter, no unwraping' );

  /* - */

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1,
    bypassingEmpty : 1
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'without arguments';
  var got = routine();
  test.identical( got, [] );
}

//

function vectorizeOriginalRoutine( test )
{
  function routine()
  {
    return _.longSlice( arguments );
  }
  var srcRoutine = routine;

  /* */

  var o =
  {
    vectorizingArray : 0,
    vectorizingMapVals : 0,
    select : 1
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );
  test.identical( routine, srcRoutine );

  test.case = 'empty';
  var got = routine();
  test.identical( got, [] );

  test.case = 'arguments';
  var got = routine( [ 1, 2 ], [ 3, 4 ] );
  test.identical( got, [ [ 1, 2 ], [ 3, 4 ] ] );
}

//

function vectorizeVectorizeMapOrArray( test )
{
  function routine()
  {
    if( arguments.length === 0 )
    return null;
    return _.longSlice( arguments );
  }
  var srcRoutine = routine;

  /* - */

  test.open( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 1' );

  var o =
  {
    vectorizingArray : 0,
    vectorizingMapVals : 1,
    select : 1
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  /* */

  test.case = 'without arguments';
  var got = routine();
  test.identical( got, null );

  test.case = 'single argument';

  var src = 1;
  var got = routine( src );
  test.identical( got, [ 1 ] );
  test.true( got !== src );

  var src = [ 1 ];
  var got = routine( src );
  test.identical( got, [ [ 1 ] ] );
  test.true( got !== src );

  var src = [ 1, 2, 3 ];
  var got = routine( src );
  test.identical( got, [ [ 1, 2, 3 ] ] );
  test.true( got !== src );

  var src = { 1 : 1, 2 : 2, 3 : 3 };
  var got = routine( src );
  test.identical( got, { 1 : [ 1 ], 2 : [ 2 ], 3 : [ 3 ] } );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = 1;
  var got = routine( src, 0 );
  test.identical( got, [ 1, 0 ] );
  test.true( got !== src );

  var src = [ 1, 2, 3 ];
  var got = routine( src, 2 );
  test.identical( got, [ [ 1, 2, 3 ], 2 ] );
  test.true( got !== src );

  var src = 2;
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( got, [ 2, [ 1, 2, 3 ] ] );
  test.true( got !== src );

  var src = [ 1, 2 ];
  var got = routine( src, [ 1, 2 ] );
  test.identical( got, [ [ 1, 2 ], [ 1, 2 ] ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, 0 );
  test.identical( got, { a : [ 1, 0 ] } );
  test.true( got !== src );

  var src = 0;
  var got = routine( src, { a : 1 } );
  test.identical( routine( 0, { a : 1 } ), [ 0, { a : 1 } ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, { b : 2 } );
  test.identical( got, { a : [ 1, { b : 2 } ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, 2, 3 );
  test.identical( got, { a : [ 1, 2, 3 ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, { b : 2 }, { c : 3 } );
  test.identical( got, { a : [ 1, { b : 2 }, { c : 3 } ] } );
  test.true( got !== src );

  /* */

  test.case = 'not an array, not a map';
  var src = _.containerAdapter.make( [ 1 ] );
  var got = routine( src );
  test.identical( got[ 0 ].original, [ 1 ] );
  test.identical( got.length, 1 );
  test.true( got !== src );

  test.close( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 1' );

  /* - */

  test.open( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 2' );

  var o =
  {
    vectorizingArray : 0,
    vectorizingMapVals : 1,
    select : 2
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'multiple argument';

  var src = 1;
  var got = routine( src, 0 );
  test.identical( got, [ 1, 0 ] );
  test.true( got !== src );

  var src = [ 1, 2, 3 ];
  var got = routine( src, 2 );
  test.identical( got, [ [ 1, 2, 3 ], 2 ] );
  test.true( got !== src );

  var src = 2;
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( got, [ 2, [ 1, 2, 3 ] ] );
  test.true( got !== src );

  var src = [ 1, 2 ];
  var got = routine( src, [ 1, 2 ] );
  test.identical( got, [ [ 1, 2 ], [ 1, 2 ] ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, 0 );
  test.identical( got, { a : [ 1, 0 ] } );
  test.true( got !== src );

  var src = 0;
  var got = routine( src, { a : 1 } );
  test.identical( routine( 0, { a : 1 } ), { a : [ 0, 1 ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, { a : 2 } );
  test.identical( got, { a : [ 1, 2 ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, 2 );
  test.identical( got, { a : [ 1, 2 ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, { a : [ 2 ] } );
  test.identical( got, { a : [ 1, [ 2 ] ] } );
  test.true( got !== src );

  /* */

  test.case = 'not an array, not a map';
  var src = _.containerAdapter.make( [ 1 ] );
  var got = routine( src, 1 );
  test.identical( got[ 0 ].original, [ 1 ] );
  test.identical( got.length, 2 );
  test.true( got !== src );

  /* */

  if( Config.debug )
  {
    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => routine() );

    test.case = 'one argument';
    test.shouldThrowErrorSync( () => routine( 1 ) );
    test.shouldThrowErrorSync( () => routine( [ 1, 2, 3 ] ) );
    test.shouldThrowErrorSync( () => routine( { a : 1, b : 2 } ) );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => routine( [ 1 ], 2, 3 ) );

    test.case = 'different keys';
    test.shouldThrowErrorSync( () => routine( { a : 1 }, { b : 2 } ) );
  }

  test.close( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 2' );

  /* - */

  test.open( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    select : 1
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'single argument';

  var src = 1;
  var got = routine( src );
  test.identical( got, [ 1 ] );
  test.true( got !== src );

  var src = [ 1 ];
  var got = routine( src );
  test.identical( got, [ [ 1 ] ] );
  test.true( got !== src );

  var src = [ 1, 2, 3 ];
  var got = routine( src );
  test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  var src = { 1 : 1, 2 : 2, 3 : 3 };
  var got = routine( src );
  test.identical( got, { 1 : [ 1 ], 2 : [ 2 ], 3 : [ 3 ] } );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = 1;
  var got = routine( src, 0 );
  test.identical( got, [ 1, 0 ] );
  test.true( got !== src );

  var src = [ 1, 2, 3 ];
  var got = routine( src, 2 );
  test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = 2;
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( got, [ 2, [ 1, 2, 3 ] ] );
  test.true( got !== src );

  var src = [ 1, 2 ];
  var got = routine( src, [ 1, 2 ] );
  test.identical( got, [ [ 1, [ 1, 2 ] ], [ 2, [ 1, 2 ] ] ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, 0 );
  test.identical( got, { a : [ 1, 0 ] } );
  test.true( got !== src );

  var src = 0;
  var got = routine( src, { a : 1 } );
  test.identical( got, [ 0, { a : 1 } ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, { b : 2 } );
  test.identical( got, { a : [ 1, { b : 2 } ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, 2, 3 );
  test.identical( got, { a : [ 1, 2, 3 ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, { b : 2 }, { c : 3 } );
  test.identical( got, { a : [ 1, { b : 2 }, { c : 3 } ] } );
  test.true( got !== src );

  var src = [ 1 ];
  var got = routine( src, { a : 2 } );
  test.identical( got, [ [ 1, { a : 2 } ] ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, [ 2 ] );
  test.identical( got, { a : [ 1, [ 2 ] ] } );
  test.true( got !== src );

  var src = [ 1 ];
  var got = routine( src, { a : 2 }, 3 );
  test.identical( got, [ [ 1, { a : 2 }, 3 ] ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, [ 2 ], 3 );
  test.identical( got, { a : [ 1, [ 2 ], 3 ] } );
  test.true( got !== src );

  test.close( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );

  /* */

  test.open( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    select : 2
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  var src = [ 1, 2 ];
  var got = routine( src, 3 );
  test.identical( got, [ [ 1, 3 ], [ 2, 3 ] ] );
  test.true( got !== src );

  var src = 1;
  var got = routine( src, [ 1, 2 ] );
  test.identical( got, [ [ 1, 1 ], [ 1, 2 ] ] );
  test.true( got !== src );

  var src = [ 1, 2 ];
  var got = routine( src, [ 1, 2 ] );
  test.identical( got, [ [ 1, 1 ], [ 2, 2 ] ] );
  test.true( got !== src );

  var src = 1;
  var got = routine( src, 2 );
  test.identical( got, [ 1, 2 ] );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, 1 );
  test.identical( got, { a : [ 1, 1 ] } );
  test.true( got !== src );

  var src = 1;
  var got = routine( src, { a : 1 } );
  test.identical( got, { a : [ 1, 1 ] } );
  test.true( got !== src );

  var src = { a : 1 };
  var got = routine( src, { a : 2 } );
  test.identical( got, { a : [ 1, 2 ] } );
  test.true( got !== src );

  var src = { a : 1, b : 1 };
  var got = routine( src, { b : 2, a : 2 } );
  test.identical( got, { a : [ 1, 2 ], b : [ 1, 2 ] } );
  test.true( got !== src );

  test.close( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );

  var o =
  {
    vectorizingArray : 0,
    vectorizingMapVals : 1,
    select : 1,
    bypassingEmpty : 1,
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  /* */

  test.case = 'without arguments';
  var got = routine();
  test.identical( got, [] );
}

//

function vectorizeVectorizeForOptionsMap( test )
{
  function routine()
  {
    return _.longSlice( arguments );
  }
  var srcRoutine = routine;

  /* - */

  test.open( 'without head' );

  test.open( 'array' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 'b'
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'not map, not set, not array';
  var src = '1';
  var got = routine( src );
  test.identical( got, [ '1' ] );
  test.true( got !== src );

  test.case = 'single argument';

  var src = [ 1 ];
  var got = routine( src );
  test.identical( got, [ [ 1 ] ] );
  test.true( got !== src );

  var src = { a : 0 };
  var got = routine( src );
  test.identical( got, [ { a : 0 } ] );
  test.true( got !== src );

  var src = { a : 0, b : 1 };
  var got = routine( src );
  test.identical( got, [ { a : 0, b : 1 } ] );
  test.true( got !== src );

  var src = { a : 0, b : [ 1 ] };
  var got = routine( src );
  test.identical( got, [ [ { a : 0, b : 1 } ] ] );
  test.true( got !== src );

  var src = { a : 0, b : [ 1, 2 ] };
  var got = routine( src );
  test.identical( got, [ [ { a : 0, b : 1 } ], [ { a : 0, b : 2 } ] ] );
  test.true( got !== src );

  /* */

  if( Config.debug )
  {
    test.case = 'without arguments';
    test.shouldThrowErrorSync( () => routine() );

    test.case = 'extra arguments';
    test.shouldThrowErrorSync( () => routine( { a : 0, b : [ 1 ] }, 2 ) );
  }

  test.close( 'array' );

  /* - */

  test.open( 'Set' );

  test.case = 'single argument';

  var src = new Set( [ 1 ] );
  var got = routine( src );
  test.identical( [ ... got[ 0 ] ], [ 1 ] );
  test.identical( got.length, 1 );
  test.true( got !== src );

  var src = { b : new Set( [ 0 ] ) };
  var got = routine( src );
  test.identical( [ ... got ], [ [ { b : 0 } ] ] );
  test.true( got !== src );

  var src = { b : new Set( [ 0 ] ), a : 1 };
  var got = routine( src );
  test.identical( [ ... got ], [ [ { b : 0, a : 1 } ] ] );
  test.true( got !== src );

  var src = { b : new Set( [ [ 0 ] ] ), a : 1 };
  var got = routine( src );
  test.identical( [ ... got ], [ [ { b : [ 0 ], a : 1 } ] ] );
  test.true( got !== src );

  var src = { b : new Set( [ 1, 2 ] ),  a : 0 };
  var got = routine( src );
  test.identical( [ ... got ], [ [ { a : 0, b : 1 } ], [ { a : 0, b : 2 } ] ] );
  test.true( got !== src );

  test.close( 'Set' );

  test.close( 'without head' );

  /* - */

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 'b',
    bypassingEmpty : 1
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'without arguments';
  var got = routine();
  test.identical( got, [] );
}

//

function vectorizeVectorizeForOptionsMapForKeys( test )
{
  function routine()
  {
    if( arguments.length === 0 )
    return null;
    return _.longSlice( arguments );
  }
  var srcRoutine = routine;

  /* */

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : [ 'a', 'b' ]
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.case = 'single argument';

  var src = 'a';
  var got = routine( src );
  var expected = [ [ src ], [ src ] ];
  test.identical( got, expected );

  var src = [ 1 ]
  var got = routine( src );
  var expected = [ [ src ], [ src ] ];
  test.identical( got, expected );

  var src = { c : 1 }
  var got = routine( src );
  var expected = [ [ src ], [ src ] ];
  test.identical( got, expected );

  var got = routine({ a : 0, b : [ 1 ] });
  var expected =
  [
    [
      {
        a : 0,
        b : [ 1 ]
      }
    ],
    [ [ { a : 0, b : 1 } ] ]
  ]
  test.identical( got, expected );

  /**/

  var got = routine({ a : 0, b : [ 1, 2 ] });
  var expected =
  [
    [
      {
        a : 0,
        b : [ 1, 2 ]
      }
    ],
    [
      [ { a : 0, b : 1 } ],
      [ { a : 0, b : 2 } ]
    ],

  ]
  test.identical( got, expected );

  test.case = 'multiple argument';

  if( Config.debug )
  test.shouldThrowErrorSync( () => routine({ a : 0, b : [ 1 ] }, 2 ) );
}

//

function vectorize( test )
{
  function srcRoutine( a, b )
  {
    return _.longSlice( arguments );
  }

  /* */

  test.open( 'vectorizingArray : 1, select : 2' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 2
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.identical( routine( [ 1, 2 ], 1 ), [ [ 1, 1 ], [ 2, 1 ] ] );
  test.identical( routine( 1, [ 1, 2 ] ), [ [ 1, 1 ], [ 1, 2 ] ] );
  test.identical( routine( [ 1, 2 ], [ 1, 2 ] ), [ [ 1, 1 ], [ 2, 2 ] ] );
  test.identical( routine( 1, 2 ), [ 1, 2 ] );

  test.identical( routine( { a : 1 }, 1 ), [ { a : 1 }, 1 ] );
  test.identical( routine( 1, { a : 1 } ), [ 1, { a : 1 } ] );
  test.identical( routine( { a : 1 }, { b : 2 } ), [ { a : 1 }, { b : 2 } ] );

  test.identical( routine( [ 1 ], { a : 2 } ), [ [ 1, { a : 2 } ] ] );
  test.identical( routine( [ 1, 2 ], { a : 3 } ), [ [ 1, { a : 3 } ], [ 2, { a : 3 } ] ] );
  test.identical( routine( { a : 3 }, [ 1, 2 ] ), [ [ { a : 3 }, 1  ], [ { a : 3 }, 2 ] ] );

  if( Config.debug )
  {
    test.shouldThrowErrorSync( () => routine( 1 ) );
    test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );
    test.shouldThrowErrorSync( () => routine( [ 1, 2 ], [ 1, 2, 3 ] ) );
    test.shouldThrowErrorSync( () => routine( [ 1 ], [ 2 ], [ 3 ] ) );
  }

  test.close( 'vectorizingArray : 1, select : 2' );

  /* */

  test.open( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    select : 2
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.identical( routine( [ 1, 2 ], 3 ), [ [ 1, 3 ], [ 2, 3 ] ] );
  test.identical( routine( 1, [ 1, 2 ] ), [ [ 1, 1 ], [ 1, 2 ] ] );
  test.identical( routine( [ 1, 2 ], [ 1, 2 ] ), [ [ 1, 1 ], [ 2, 2 ] ] );
  test.identical( routine( 1, 2 ), [ 1, 2 ] );

  test.identical( routine( { a : 1 }, 1 ), { a : [ 1, 1 ] } );
  test.identical( routine( 1, { a : 1 } ), { a : [ 1, 1 ] } );
  test.identical( routine( { a : 1 }, { a : 2 } ), { a : [ 1, 2 ] } );
  test.identical( routine( { a : 1, b : 1 }, { b : 2, a : 2 } ), { a : [ 1, 2 ], b : [ 1, 2 ] } );

  if( Config.debug )
  {
    test.shouldThrowErrorSync( () => routine( [ 1, 2 ], [ 1, 2, 3 ] ) )
    test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );
    test.shouldThrowErrorSync( () => routine( { a : 1 }, { b : 1 } ) );
    test.shouldThrowErrorSync( () => routine( [ 1 ], { b : 1 } ) );
    test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ] ) );
    test.shouldThrowErrorSync( () => routine( 1, [ 1 ], { b : 1 } ) );
    test.shouldThrowErrorSync( () => routine( [ 1 ], 1, { b : 1 } ) );
    test.shouldThrowErrorSync( () => routine( { b : 1 }, 1, [ 1 ] ) );
    test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ], 1 ) );
  }

  test.close( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );

  test.open( ' vectorizingMapKeys : 1' );

  var o =
  {
    vectorizingArray : 0,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 1
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.identical( routine( 1  ), [ 1 ] );
  test.identical( routine( [ 1 ] ), [ [ 1 ] ] );
  test.identical( routine( { a : 1 } ), { a : 1 } );

  if( Config.debug )
  test.shouldThrowErrorSync( () => routine( 1, 2 ) )

  test.close( ' vectorizingMapKeys : 1' );

  test.open( 'vectorizingMapKeys : 1, select : 2' );

  var o =
  {
    vectorizingArray : 0,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 2
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.identical( routine(  1, 1  ), [ 1, 1 ] );
  test.identical( routine( [ 1 ], 1 ), [ [ 1 ], 1 ] );
  test.identical( routine( { a : 1 }, 'b' ), { 'a,b' : 1 } );
  test.identical( routine( 'a', { b : 1, c : 2 } ), { 'a,b' : 1, 'a,c' : 2 } );
  test.identical( routine( [ 'a' ], { b : 1, c : 2 } ), { 'a,b' : 1, 'a,c' : 2 } );
  test.identical( routine( { b : 1, c : 2 }, [ 'a' ] ), { 'b,a' : 1, 'c,a' : 2 } );

  if( Config.debug )
  test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );

  test.close( 'vectorizingMapKeys : 1, select : 2' );

  test.open( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 2' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 2
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.identical( routine( [ 1, 2 ], 3 ), [ [ 1, 3 ], [ 2, 3 ] ] );
  test.identical( routine( 1, [ 1, 2 ] ), [ [ 1, 1 ], [ 1, 2 ] ] );
  test.identical( routine( [ 1, 2 ], [ 1, 2 ] ), [ [ 1, 1 ], [ 2, 2 ] ] );
  test.identical( routine( 1, 2 ), [ 1, 2 ] );

  test.identical( routine( { a : 1 }, 'b' ), { 'a,b' : 1 } );
  test.identical( routine( 'a', { b : 1, c : 2 } ), { 'a,b' : 1, 'a,c' : 2 } );

  test.identical( routine( { a : 1 }, 1 ), { 'a,1' : 1 } );
  test.identical( routine( 1, { b : 1, c : 2 } ), { '1,b' : 1, '1,c' : 2 } );

  test.identical( routine( [ 1 ], { b : true } ), { '1,b' : true } );
  test.identical( routine( [ 1, 2 ], { b : true } ), { '1,b' : true, '2,b' : true } );

  if( Config.debug )
  {
    test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );
    test.shouldThrowErrorSync( () => routine( { a : 1 }, { b : 1 } ) );
    // test.shouldThrowErrorSync( () => routine( [ 1 ], { b : 1 } ) );
    // test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ] ) );
    // test.shouldThrowErrorSync( () => routine( 1, [ 1 ], { b : 1 } ) );
    test.shouldThrowErrorSync( () => routine( [ 1 ], 1, { b : 1 } ) );
    test.shouldThrowErrorSync( () => routine( { b : 1 }, 1, [ 1 ] ) );
    test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ], 1 ) );
  }

  test.close( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 2' );

  test.open( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 3' );

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 3
  }
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  test.identical( routine( [ 1 ], { b : true }, 'c' ), { '1,b,c' : true } );
  test.identical( routine( [ 1 ], { b : true }, [ 'c' ] ), { '1,b,c' : true } );
  test.identical( routine( [ 1 ], { b : true, c : false }, 'd' ), { '1,b,d' : true, '1,c,d' : false } );
  test.identical( routine( [ 1, 2 ], { b : true }, 'c' ), { '1,b,c' : true, '2,b,c' : true } );

  /* */

  var got =  routine( [ 1, 2 ], { b : true, c : false }, [ 'd', 'e' ] );
  var expected =
  {
    '1,b,d' : true,
    '1,c,d' : false,
    '2,b,e' : true,
    '2,c,e' : false
  }
  test.identical( got, expected );

  /* */

  var got =  routine( [ 1, 2 ], [ 'd', 'e' ], { b : true, c : false } );
  var expected =
  {
    '1,d,b' : true,
    '1,d,c' : false,
    '2,e,b' : true,
    '2,e,c' : false
  }
  test.identical( got, expected );

  /* */

  var got =  routine( { b : true, c : false }, [ 1, 2 ], [ 'd', 'e' ]  );
  var expected =
  {
    'b,1,d' : true,
    'c,1,d' : false,
    'b,2,e' : true,
    'c,2,e' : false
  }
  test.identical( got, expected );

  /* */

  var got =  routine( [ 1, 2 ], { b : true, c : false, d : true }, [ 'e', 'f' ] );
  var expected =
  {
    '1,b,e' : true,
    '1,c,e' : false,
    '1,d,e' : true,
    '2,b,f' : true,
    '2,c,f' : false,
    '2,d,f' : true
  }
  test.identical( got, expected );

  /* */

  var got =  routine( [ 1, 2 ], [ 'e', 'f' ], { b : true, c : false, d : true } );
  var expected =
  {
    '1,e,b' : true,
    '1,e,c' : false,
    '1,e,d' : true,
    '2,f,b' : true,
    '2,f,c' : false,
    '2,f,d' : true
  }
  test.identical( got, expected );

  /* */

  var got =  routine( { b : true, c : false, d : true }, [ 1, 2 ], [ 'e', 'f' ] );
  var expected =
  {
    'b,1,e' : true,
    'c,1,e' : false,
    'd,1,e' : true,
    'b,2,f' : true,
    'c,2,f' : false,
    'd,2,f' : true
  }
  test.identical( got, expected );

  /* */

  var got =  routine( 1, { b : true, c : false, d : true }, 2 );
  var expected =
  {
    '1,b,2' : true,
    '1,c,2' : false,
    '1,d,2' : true
  }
  test.identical( got, expected );

  /* */

  var got =  routine( { b : true, c : false, d : true }, 1, 2 );
  var expected =
  {
    'b,1,2' : true,
    'c,1,2' : false,
    'd,1,2' : true
  }
  test.identical( got, expected );

  /* */

  var got =  routine( 1, 2, { b : true, c : false, d : true } );
  var expected =
  {
    '1,2,b' : true,
    '1,2,c' : false,
    '1,2,d' : true
  }
  test.identical( got, expected );

  /* */

  var got =  routine( [ 1, 2 ], { b : true }, 'c' );
  var expected =
  {
    '1,b,c' : true,
    '2,b,c' : true,
  }
  test.identical( got, expected );

  /* */

  var got =  routine( { b : true }, [ 1, 2 ], 'c' );
  var expected =
  {
    'b,1,c' : true,
    'b,2,c' : true,
  }
  test.identical( got, expected );

  /* */

  var got =  routine( [ 1, 2 ], 'c', { b : true } );
  var expected =
  {
    '1,c,b' : true,
    '2,c,b' : true,
  }
  test.identical( got, expected );

  /* */

  var got =  routine( [ 1, 2 ], { b : true, c : false }, 'd' );
  var expected =
  {
    '1,b,d' : true,
    '1,c,d' : false,
    '2,b,d' : true,
    '2,c,d' : false
  }
  test.identical( got, expected );

  /* */

  var got =  routine( { b : true, c : false }, [ 1, 2 ], 'd' );
  var expected =
  {
    'b,1,d' : true,
    'b,2,d' : true,
    'c,1,d' : false,
    'c,2,d' : false
  }
  test.identical( got, expected );

  /* */

  var got =  routine( [ 1, 2 ], 'd', { b : true, c : false } );
  var expected =
  {
    '1,d,b' : true,
    '1,d,c' : false,
    '2,d,b' : true,
    '2,d,c' : false
  }
  test.identical( got, expected );

  /* */

  if( Config.debug )
  {
    test.shouldThrowErrorSync( () => routine( { a : 1 }, 'c', { b : 1 } ) );
    test.shouldThrowErrorSync( () => routine( [ 1 ], { b : true }, [ 'c', 'd' ] ) );
  }

  test.close( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 3' );

  test.open( 'vectorizingMapKeys : 1, vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );
  function srcRoutine2( src )
  {
    return src + 1;
  }
  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    vectorizingMapKeys : 1,
    select : 1
  }
  o.routine = srcRoutine2;
  var routine = _.vectorize( o );

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), [ 2 ] );
  test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 2, 21 : 3, 31 : 4 } );

  test.close( 'vectorizingMapKeys : 1, vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );
}

//

function vectorizeBypassingEmpty( test )
{
  function srcRoutine()
  {
    _.sure( arguments.length );
    return _.longSlice( arguments );
  }

  function srcRoutine2()
  {
    _.sure( arguments.length );
    return arguments[ 0 ] + 1;
  }

  /* */

  test.open( 'vectorizing off, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine,
    bypassingEmpty : 0,
    vectorizingArray : 0,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.case = 'with arg';
  var got = routine( 1 );
  var expected = [ 1 ];
  test.identical( got, expected )

  test.close( 'vectorizing off, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizing off, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine,
    bypassingEmpty : 1,
    vectorizingArray : 0,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.case = 'with arg';
  var got = routine( 1 );
  var expected = [ 1 ];
  test.identical( got, expected )

  test.close( 'vectorizing off, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizingArray:1, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine,
    bypassingEmpty : 0,
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.case = 'with arg';
  var got = routine( 1 );
  var expected = [ 1 ];
  test.identical( got, expected )

  test.close( 'vectorizingArray:1, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizingArray:1, bypassingEmpty:1' );

  var routine = _.vectorize
  ({
    routine : srcRoutine,
    bypassingEmpty : 1,
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  var got = routine();
  var expected = [];
  test.identical( got, expected )

  test.case = 'with arg';
  var got = routine( 1 );
  var expected = [ 1 ];
  test.identical( got, expected )

  test.close( 'vectorizingArray:1, bypassingEmpty:1' );

  /* */

  test.open( 'vectorizingMapVals:1, bypassingEmpty:1' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 1,
    vectorizingArray : 0,
    vectorizingMapVals : 1,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  var got = routine();
  var expected = [];
  test.identical( got, expected )

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), '11' );
  test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );

  test.close( 'vectorizingMapVals:1, bypassingEmpty:1' );

  /* */

  test.open( 'vectorizingMapVals:1, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 0,
    vectorizingArray : 0,
    vectorizingMapVals : 1,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), '11' );
  test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );

  test.close( 'vectorizingMapVals:1, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:1' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 1,
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  var got = routine();
  var expected = [];
  test.identical( got, expected )

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), [ 2 ] );
  test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );

  test.close( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:1' );

  /* */

  test.open( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 0,
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    vectorizingMapKeys : 0,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), [ 2 ] );
  test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );

  test.close( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizingMapKeys:1, bypassingEmpty:1' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 1,
    vectorizingArray : 0,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 1
  });

  test.case = 'no arg';
  var got = routine();
  var expected = [];
  test.identical( got, expected )

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), '11' );
  test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );

  test.close( 'vectorizingMapKeys:1, bypassingEmpty:1' );

  /* */

  test.open( 'vectorizingMapKeys:1, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 0,
    vectorizingArray : 0,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), '11' );
  test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );

  test.close( 'vectorizingMapKeys:1, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:1' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 1,
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 1
  });

  test.case = 'no arg';
  var got = routine();
  var expected = [];
  test.identical( got, expected )

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), [ 2 ] );
  test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );

  test.close( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:1' );

  /* */

  test.open( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 0,
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 1,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), [ 2 ] );
  test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );

  test.close( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:1' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 1,
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    vectorizingMapKeys : 1,
    select : 1
  });

  test.case = 'no arg';
  var got = routine();
  var expected = [];
  test.identical( got, expected )

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), [ 2 ] );
  test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 2, 21 : 3, 31 : 4 } );

  test.close( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:1' );

  /* */

  test.open( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:0' );

  var routine = _.vectorize
  ({
    routine : srcRoutine2,
    bypassingEmpty : 0,
    vectorizingArray : 1,
    vectorizingMapVals : 1,
    vectorizingMapKeys : 1,
    select : 1
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.identical( routine( 1 ), 2 );
  test.identical( routine( [ 1 ] ), [ 2 ] );
  test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
  test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 2, 21 : 3, 31 : 4 } );

  test.close( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:0' );

  // vectorizeForOptionsMapForKeys

  test.open( 'vectorizingArray:1, select : array, bypassingEmpty:0' );

  function srcRoutine3( src )
  {
    return src;
  }

  var routine = _.vectorize
  ({
    routine : srcRoutine3,
    bypassingEmpty : 0,
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 0,
    select : [ '0' ]
  });

  test.case = 'no arg';
  test.shouldThrowErrorSync( () => routine() );

  test.identical( routine( 1 ), [ 1 ] );
  test.identical( routine( [ 1 ] ), [ [ 1 ] ] );
  test.identical( routine( [ [ 1 ] ] ), [ [ { 0 : 1 } ] ] );
  test.identical( routine( { 0 : [ 1 ] } ), [ [ { 0 : 1 } ] ] );

  test.close( 'vectorizingArray:1, select : array, bypassingEmpty:0' );

  /* */

  test.open( 'vectorizingArray:1, select : array, bypassingEmpty:1' );

  function srcRoutine3( src )
  {
    return src;
  }

  var routine = _.vectorize
  ({
    routine : srcRoutine3,
    bypassingEmpty : 1,
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    vectorizingMapKeys : 0,
    select : [ '0' ]
  });

  test.identical( routine(), [] );
  test.identical( routine( 1 ), [ 1 ] );
  test.identical( routine( [ 1 ] ), [ [ 1 ] ] );
  test.identical( routine( [ [ 1 ] ] ), [ [ { 0 : 1 } ] ] );
  test.identical( routine( { 0 : [ 1 ] } ), [ [ { 0 : 1 } ] ] );

  test.close( 'vectorizingArray:1, select : array, bypassingEmpty:1' );
}

//

function vectorizeAll( test )
{

  test.case = 'trivial';
  function isOdd( a )
  {
    return a % 2;
  }
  isOdd.map1 = {};
  isOdd.map1.a = 1;
  isOdd.map2 = Object.create( {} );
  isOdd.map2.a = 2;
  isOdd.str = 'str';
  isOdd.number = 13;
  isOdd.routine = function r(){};
  var got = _.vectorizeAll( isOdd );
  test.identical( got.map1, isOdd.map1 );
  test.identical( _.props.keys( got.map2 ), [ 'a' ] );
  test.identical( got.map2.a, isOdd.map2.a );
  test.identical( got.str, isOdd.str );
  test.identical( got.number, isOdd.number );
  test.identical( got.routine, isOdd.routine );
  test.true( _.routine.is( got ) );
  test.identical( got([ 0, 1, 2, 3 ]), 0 );
  test.identical( got([ 0, 2 ]), 0 );
  test.identical( got([ 1, 3 ]), true );
}

//

function vectorizeAny( test )
{
  test.case = 'trivial';
  function isOdd( a )
  {
    return a % 2;
  }
  isOdd.map1 = {};
  isOdd.map1.a = 1;
  isOdd.map2 = Object.create( {} );
  isOdd.map2.a = 2;
  isOdd.str = 'str';
  isOdd.number = 13;
  isOdd.routine = function r(){};
  var got = _.vectorizeAny( isOdd );
  test.identical( got.map1, isOdd.map1 );
  test.identical( _.props.keys( got.map2 ), [ 'a' ] );
  test.identical( got.map2.a, isOdd.map2.a );
  test.identical( got.str, isOdd.str );
  test.identical( got.number, isOdd.number );
  test.identical( got.routine, isOdd.routine );
  test.true( _.routine.is( got ) );
  test.identical( got([ 0, 1, 2, 3 ]), true );
  test.identical( got([ 0, 2 ]), false );
  test.identical( got([ 1, 3 ]), true );
}

//

function vectorizeNone( test )
{
  test.case = 'trivial';
  function isOdd( a )
  {
    return a % 2;
  }
  isOdd.map1 = {};
  isOdd.map1.a = 1;
  isOdd.map2 = Object.create( {} );
  isOdd.map2.a = 2;
  isOdd.str = 'str';
  isOdd.number = 13;
  isOdd.routine = function r(){};
  var got = _.vectorizeNone( isOdd );
  test.identical( got.map1, isOdd.map1 );
  test.identical( _.props.keys( got.map2 ), [ 'a' ] );
  test.identical( got.map2.a, isOdd.map2.a );
  test.identical( got.str, isOdd.str );
  test.identical( got.number, isOdd.number );
  test.identical( got.routine, isOdd.routine );
  test.true( _.routine.is( got ) );
  test.identical( got([ 0, 1, 2, 3 ]), false );
  test.identical( got([ 0, 2 ]), true );
  test.identical( got([ 1, 3 ]), false );
}

//

function vectorizeAccessBasic( test )
{
  test.open( 'get' );

  test.case = 'get property, not a routine';
  var vector = [ { a : 1, b : 2 }, { a : 3, b : 4, c : 5 } ];
  var src = _.vectorizeAccess( vector );
  var got = src.a;
  test.identical( got.$, [ 1, 3 ] );

  test.case = 'execute method on number';
  var routine = ( e ) => e;
  var vector = [ { a : routine, b : 2 }, { a : routine, b : 4, c : 5 } ];
  var src = _.vectorizeAccess( vector );
  var got = src.a( 1 );
  test.identical( got.$, [ 1, 1 ] );

  test.case = 'execute method on element of vector';
  var routine = ( e ) => e;
  var vector = [ { a : routine, b : 2 }, { a : routine, b : 4, c : 5 } ];
  var src = _.vectorizeAccess( vector );
  var got = src.a( vector[ 0 ] );
  test.identical( got.$, [ { a : routine, b : 2 }, { a : routine, b : 2 } ] );
  test.true( got !== src );

  test.case = 'execute method on element of vector, execute new vector';
  var routine = ( e ) => e;
  var vector = [ { a : routine, b : 2 }, { a : routine, b : 4, c : 5 } ];
  var src = _.vectorizeAccess( vector );
  var got = src.a( vector[ 0 ] ).a( 1 );
  test.identical( got.$, [ 1, 1 ] );

  test.case = 'passed element of vector, return original proxy';
  var routine = ( e ) => e;
  var vector = [ { a : routine, b : 2 } ];
  var src = _.vectorizeAccess( vector );
  var got = src.a( vector[ 0 ] );
  test.identical( got.$, [ { a : routine, b : 2 } ] );
  test.true( got === src );

  /* - */

  test.case = 'vector has not nested vectors or objects, key is $';
  var vector = [ 1, 2, 3, 4 ];
  var src = _.vectorizeAccess( vector );
  var got = src.$;
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.true( got === vector );

  test.case = 'get first element of vectors, not a routine';
  var vector = [ [ 1, 2 ], [ 1, 2 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ];
  test.identical( got.$, [ 1, 1 ] );

  test.case = 'execute routine in vectors on number';
  var routine = ( e ) => e;
  var vector = [ [ routine, 2 ], [ routine, 3 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ]( 1 );
  test.identical( got.$, [ 1, 1 ] );

  test.case = 'execute routine in vectors on element of original vector';
  var routine = ( e ) => e;
  var vector = [ [ routine, 2 ], [ routine, 3 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ]( vector[ 0 ] );
  test.identical( got.$, [ [ routine, 2 ], [ routine, 2 ] ] );
  test.true( got !== src );

  test.case = 'execute routine in vectors on element of original vector, execute resulted vector on number';
  var routine = ( e ) => e;
  var vector = [ [ routine, 2 ], [ routine, 3 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ]( vector[ 0 ] )[ 0 ]( 1 );
  test.identical( got.$, [ 1, 1 ] );

  test.case = 'passed element of vector ';
  var routine = ( e ) => e;
  var vector = [ [ routine, 2 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ]( vector[ 0 ] );
  test.identical( got.$, [ [ routine, 2 ] ] );
  test.true( got === src );

  /* - */

  test.case = 'get first element of vectors, not a routine';
  var vector = [ { 0 : 1, 1 : 2 }, [ 1, 2 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ];
  test.identical( got.$, [ 1, 1 ] );

  test.case = 'execute routine in vectors on number';
  var routine = ( e ) => e;
  var vector = [ { 0 : routine, 1 : 2 }, [ routine, 3 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ]( 1 );
  test.identical( got.$, [ 1, 1 ] );

  test.case = 'execute routine in vectors on element of original vector';
  var routine = ( e ) => e;
  var vector = [ { 0 : routine, 1 : 2 }, [ routine, 3 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ]( vector[ 0 ] );
  test.identical( got.$, [ { 0 : routine, 1 : 2 }, { 0 : routine, 1 : 2 } ] );
  test.true( got !== src );

  test.case = 'execute routine on element of original vector, execute resulted vector on number';
  var routine = ( e ) => e;
  var vector = [ { 0 : routine, 1 : 2 }, [ routine, 3 ] ];
  var src = _.vectorizeAccess( vector );
  var got = src[ 0 ]( vector[ 0 ] )[ 0 ]( 1 );
  test.identical( got.$, [ 1, 1 ] );

  test.close( 'get' );

  /* - */

  test.open( 'set' );

  test.case = 'set property of objects';
  var vector = [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ];
  var src = _.vectorizeAccess( vector );
  test.identical( src.$, [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ] );
  src.a = 0;
  test.identical( src.$, [ { a : 0, b : 2 }, { a : 0, b : 4, c : 1 }, { a : 0, b : 6 } ] );

  test.case = 'set method in property of objects';
  var routine = ( e ) => e;
  var vector = [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ];
  var src = _.vectorizeAccess( vector );
  test.identical( src.$, [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ] );
  src.b = routine;
  test.identical( src.$, [ { a : 1, b : routine }, { a : 3, b : routine, c : 1 }, { a : 5, b : routine } ] );

  /* */

  test.case = 'set property of vectors';
  var vector = [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ];
  var src = _.vectorizeAccess( vector );
  test.identical( src.$, [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ] );
  src[ 0 ] = 0;
  test.identical( src.$, [ [ 0, 2 ], [ 0, 4, 1 ], [ 0, 6 ] ] );

  test.case = 'set method in property of objects';
  var routine = ( e ) => e;
  var vector = [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ];
  var src = _.vectorizeAccess( vector );
  test.identical( src.$, [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ] );
  src[ 1 ] = routine;
  test.identical( src.$, [ [ 1, routine ], [ 3, routine, 1 ], [ 5, routine ] ] );

  /* */

  test.case = 'set property of vectors';
  var vector = [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ];
  var src = _.vectorizeAccess( vector );
  test.identical( src.$, [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ] );
  src[ 0 ] = 0;
  test.identical( src.$, [ { 0 : 0, 1 : 2 }, [ 0, 4, 1 ], [ 0, 6 ] ] );

  test.case = 'set method in property of objects';
  var routine = ( e ) => e;
  var vector = [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ];
  var src = _.vectorizeAccess( vector );
  test.identical( src.$, [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ] );
  src[ 1 ] = routine;
  test.identical( src.$, [ { 0 : 1, 1 : routine }, [ 3, routine, 1 ], [ 5, routine ] ] );

  test.close( 'set' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.vectorizeAccess() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.vectorizeAccess( [ { name : 'a', id : '20' } ], [ { date : '01.01.2020' } ] ) );

  test.case = 'object has no property, get property';
  test.shouldThrowErrorSync( () =>
  {
    var src = _.vectorizeAccess( [ { a : 1 }, { b : 1 } ] );
    var got = src.a;
  } );

  test.case = 'object has no property, set property';
  test.shouldThrowErrorSync( () =>
  {
    var src = _.vectorizeAccess( [ { a : 1 }, { b : 1 } ] );
    src.a = 2;
  } );
}

//

function vectorizeAccessSpecial( test )
{

  var cb1 = ( e ) => e;
  var cb2 = ( e ) => e ** 2;
  var cb3 = ( e ) => Math.sqrt( e );
  var elements = [ { routine : cb1, name : 'first' }, { routine : cb2, name : 'second' }, { routine : cb3, name : 'third' } ];
  var vectorized = _.vectorizeAccess( elements );

  test.description = 'get';
  test.identical( vectorized.$, elements );
  test.true( _.routine.is( vectorized.routine ) );

  test.description = 'does not exist';
  test.identical( vectorized.haveNo, undefined );

  var exp = [ 'first', 'second', 'third' ];
  var name = vectorized.name;
  console.log( name.$ );
  console.log( _.longIs( name.$ ) );
  test.identical( name.$, exp );

  test.description = 'set';
  vectorized.name = 'new value';
  console.log( vectorized.$ );
  test.identical( vectorized.$, elements );
  test.true( _.routine.is( vectorized.routine ) );
  var exp = [ 'new value', 'new value', 'new value' ];
  test.identical( vectorized.name.$, exp );

  test.description = 'call';
  var exp = [ 2, 4, Math.sqrt( 2 ) ];
  var got = vectorized.routine( 2 ).$;
  test.identical( got, exp );

}

// --
//
// --

const Proto =
{

  name : 'Tools.Functor.l0.l9',
  silencing : 1,

  tests :
  {

    vectorizeVectorizeArray,
    vectorizeOriginalRoutine,
    vectorizeVectorizeMapOrArray,
    vectorizeVectorizeForOptionsMap,
    vectorize,
    /* qqq : split test routine vectorize */
    /* qqq : add tests for vectorize* routines */
    vectorizeBypassingEmpty,

    vectorizeAll, /* qqq : extend please */
    vectorizeAny, /* qqq : extend please */
    vectorizeNone, /* qqq : extend please */

    vectorizeAccessBasic,
    vectorizeAccessSpecial,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
