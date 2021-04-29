( function _l0_l9_Vector_test_s_()
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

function checks( test ) /* qqq for Yevhen : extend */
{

  /* */

  test.case = 'array';
  test.true( _.vector.is( [] ) );
  test.true( _.vector.like( [] ) );
  // test.true( _.vector.is( [] ) ); /* qqq : enable */
  // test.true( _.vector.like( [] ) );

  /* */

}

//

function hasLength( test )
{

  test.case = 'an empty array';
  var got = _.vector.hasLength( [] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.vector.hasLength( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.case = 'a pseudo array';
  var got = ( function()
  {
    return _.vector.hasLength( arguments );
  } )('Hello there!');
  var expected = true;
  test.identical( got, expected );

  test.case = 'an array-like';
  var got = _.vector.hasLength( { '0' : 1, '1' : 2, '2' : 3, 'length' : 3 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'a Function.length';
  function fn( a, b, c ) { };
  var got = _.vector.hasLength( fn );
  var expected = true;
  test.identical( got, expected );

  test.case = 'a "string".length';
  var got = _.vector.hasLength( 'Hello there!' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'no arguments';
  var got = _.vector.hasLength();
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.vector.hasLength();
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

};

//

function exportStringShallowDiagnostic( test )
{
  test.case = 'array empty';
  var src = [];
  var expected = '{- Array with 0 elements -}';
  var got = _.vector.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'array non-empty';
  var src = [ 1, 2, 3 ];
  var expected = '{- Array with 3 elements -}';
  var got = _.vector.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'unroll empty';
  var src = _.unroll.make([]);
  var expected = '{- Array.unroll with 0 elements -}';
  var got = _.vector.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'unroll non-empty';
  var src = _.unroll.make([ 1, 2, 3 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  var got = _.vector.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.vector.exportStringShallowDiagnostic() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.vector.exportStringShallowDiagnostic( [], [] ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.vector.exportStringShallowDiagnostic( {} ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Vector.l0.l9',
  silencing : 1,

  tests :
  {
    checks,
    hasLength,
    exportStringShallowDiagnostic
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
