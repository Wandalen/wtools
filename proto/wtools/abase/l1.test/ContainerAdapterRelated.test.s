( function _ContainerAdapterRelated_test_s_() {

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
  // _.include( 'wSelector' );
}

const _ = _global_.wTools;

// --
// tests
// --

function longMakeEmpty( test )
{
  test.case = 'src - containerAdapter, empty array';
  var got = _.long.makeEmpty( _.containerAdapter.make( [] ) );
  test.true( _.containerAdapter.is( got ) );
  test.identical( got.original, [] );

  test.case = 'src - containerAdapter, filled array';
  var got = _.long.makeEmpty( _.containerAdapter.make([ 1, 2, 3 ]) );
  test.true( _.containerAdapter.is( got ) );
  test.identical( got.original, [] );

  test.case = 'src - containerAdapter, empty array';
  var got = _.long.makeEmpty( _.containerAdapter.make( new Set( [] ) ) );
  test.true( _.containerAdapter.is( got ) );
  test.identical( got.original, new Set( [] ) );

  test.case = 'src - containerAdapter, filled array';
  var got = _.long.makeEmpty( _.containerAdapter.make( new Set([ 1, 2, 3 ]) ) );
  test.true( _.containerAdapter.is( got ) );
  test.identical( got.original, new Set( [] ) );
}

//

function vectorizeVectorizeArray( test )
{
  var srcRoutine = function()
  {
    if( arguments.length === 0 )
    return null;
    return _.longSlice( arguments );
  };

  var o =
  {
    vectorizingArray : 1,
    vectorizingMapVals : 0,
    select : 1,
  };
  o.routine = srcRoutine;
  var routine = _.vectorize( o );

  /* - */

  var src = _.containerAdapter.make( [ 1, 2 ] );
  var got = routine( src, [ 3, 4 ] )
  test.identical( [ ... got[ 0 ].original ], [ 1, 2 ] );
  test.identical( got[ 1 ], [ 3, 4 ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
  var got = routine( src, 2 );
  test.identical( [ ... got[ 0 ].original ], [ 1, 2, 3 ] );
  test.identical( got[ 1 ], 2 );
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

  var src = _.containerAdapter.make([ 1 ]);
  var got = routine( src );
  test.identical( got.original, [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( src );
  test.identical( got.original, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( src, 2 );
  test.identical( got.original, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 2 ]);
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( got.original, [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2 ]);
  var got = routine( src, [ 3, 4 ] )
  test.identical( got.original, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  /* */

  test.case = 'single argument';

  var src = _.containerAdapter.make( new Set([ 1 ]) );
  var got = routine( src );
  test.identical( [ ... got.original ], [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( src );
  test.identical( [ ... got.original ], [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( src, 2 );
  test.identical( [ ... got.original ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 2 ]) );
  var got = routine( src, [ 1, 2, 3 ] );
  test.identical( [ ... got.original ], [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2 ]) );
  var got = routine( src, [ 3, 4 ] )
  test.identical( [ ... got.original ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'containerAdapter, no unwraping' );

  /* - */

  test.open( 'containerAdapter, unwraping' );

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

  var src = _.containerAdapter.make([ 1 ]);
  var got = routine( src );
  test.identical( got, [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ) );
  test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make([ 1, 2, 3 ]);
  var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ), 2 );
  test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 2 ]);
  var got = routine( _.containerAdapter.make( [ 2 ] ), [ 1, 2, 3 ] );
  test.identical( got, [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make([ 1, 2 ]);
  var got = routine( _.containerAdapter.make( [ 1, 2 ] ), [ 3, 4 ] )
  test.identical( got, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  /* */

  test.case = 'single argument';

  var src = _.containerAdapter.make( new Set([ 1 ]) );
  var got = routine( src );
  test.identical( [ ... got ], [ [ 1 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ) );
  test.identical( [ ... got ], [ [ 1 ], [ 2 ], [ 3 ] ] );
  test.true( got !== src );

  test.case = 'multiple argument';

  var src = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ), 2 );
  test.identical( [ ... got ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 2 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 2 ] ) ), [ 1, 2, 3 ] );
  test.identical( [ ... got ], [ [ 2, [ 1, 2, 3 ] ] ] );
  test.true( got !== src );

  var src = _.containerAdapter.make( new Set([ 1, 2 ]) );
  var got = routine( _.containerAdapter.make( new Set( [ 1, 2 ] ) ), [ 3, 4 ] )
  test.identical( [ ... got ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
  test.true( got !== src );

  test.close( 'containerAdapter, unwraping' );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.ContainerAdapterRelated.l1',
  silencing : 1,
  enabled : 0, /* qqq : for Dmytro : ?? */

  tests :
  {

    longMakeEmpty,
    vectorizeVectorizeArray,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
