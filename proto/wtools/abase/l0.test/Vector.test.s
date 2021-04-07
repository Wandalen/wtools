( function _Vector_test_s_()
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
  var src = _.unrollMake([]);
  var expected = '{- Array.unroll with 0 elements -}';
  var got = _.vector.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'unroll non-empty';
  var src = _.unrollMake([ 1, 2, 3 ]);
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

  name : 'Tools.Vector',
  silencing : 1,

  tests :
  {
    checks,
    exportStringShallowDiagnostic
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
