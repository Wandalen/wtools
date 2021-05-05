( function _l0_l9_Permutation_test_s_( ) {

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
// permutation
// --

function eachSample_( test )
{

  /* */

  test.case = 'sets - array with single element';
  var src = [ 1 ];
  var got = _.permutation.eachSample( src );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.identical( src, [ 1 ] );

  test.case = 'sets - map with single element';
  var src = { a : 1 };
  var got = _.permutation.eachSample( src, null );
  var expected = [ { a : 1 } ];
  test.identical( got, expected );
  test.identical( src, { a : 1 } );

  test.case = 'sets - array with several element';
  var src = [ 1, 2, null ];
  var got = _.permutation.eachSample( src );
  var expected = [ [ 1, 2, null ] ];
  test.identical( got, expected );
  test.identical( src, [ 1, 2, null ] );

  test.case = 'sets - map with several element';
  var src = { a : 1, b : 2, c : null };
  var got = _.permutation.eachSample( src, null );
  var expected = [ { a : 1, b : 2, c : null } ];
  test.identical( got, expected );
  test.identical( src, { a : 1, b : 2, c : null } );

  test.case = 'sets - unroll with single element';
  var src = _.unroll.make( [ 1 ] );
  var got = _.permutation.eachSample( src );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.false( _.unrollIs( got ) );
  test.identical( src, _.unroll.make( [ 1 ] ) );

  test.case = 'sets - argumentsArray with single element';
  var src = _.argumentsArray.make( [ 1 ] );
  var got = _.permutation.eachSample( src, null );
  var expected = [ [ 1 ] ];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.identical( src, _.argumentsArray.make( [ 1 ] ) );

  /* */

  test.case = 'sets - array, result - 0';
  var src = [ 1, 2, 3 ];
  var got = _.permutation.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.identical( src, [ 1, 2, 3 ] );

  test.case = 'sets - map, result - 0';
  var src = { a : 1, b : 2, c : null };
  var got = _.permutation.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.identical( src, { a : 1, b : 2, c : null } );

  test.case = 'sets - unroll, result - 0';
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.permutation.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.true( _.primitive.is( got ) );
  test.identical( src, _.unroll.make( [ 1, 2, 3 ] ) );

  test.case = 'sets - argumentsArray, result - 0';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.permutation.eachSample( { sets : src, result : 0 } );
  var expected = 0;
  test.identical( got, expected );
  test.true( _.primitive.is( got ) );
  test.identical( src, _.argumentsArray.make( [ 1, 2, 3 ] ) );

  /* */

  test.case = 'sets - array contains array';
  var src = [ [ 1, 2, null, 'str' ] ] ;
  var got = _.permutation.eachSample( src );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.identical( src, [ [ 1, 2, null, 'str' ] ]  );

  test.case = 'sets - map, contains array';
  var src = { a : [ 1, 2, null, 'str' ] };
  var got = _.permutation.eachSample( src, null );
  var expected =
  [
    { a : 1 },
    { a : 2 },
    { a : null },
    { a : 'str' }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 1, 2, null, 'str' ] } );

  test.case = 'sets - unroll, contains array';
  var src = _.unroll.make( [ [ 1, 2, null, 'str' ] ] );
  var got = _.permutation.eachSample( src );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.false( _.unrollIs( got ) );
  test.identical( src, _.unroll.make( [ [ 1, 2, null, 'str' ] ] ) );

  test.case = 'sets - argumentsArray, contains array';
  var src = _.argumentsArray.make( [ [ 1, 2, null, 'str' ] ] );
  var got = _.permutation.eachSample( src );
  var expected = [ [ 1 ], [ 2 ], [ null ], [ 'str' ] ];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.identical( src, _.argumentsArray.make( [ [ 1, 2, null, 'str' ] ] ) );

  /* */

  test.case = 'sets - two dimentional array, inner arrays has two elements';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two elements map, elements have arrays with two elements';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ] };
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    { a : 0, b : 2 }, { a : 1, b : 2 },
    { a : 0, b : 3 }, { a : 1, b : 3 }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ] } );

  test.case = 'sets - two dimentional array, with scalar element at the end of container';
  var src = [ [ 0, 1 ], [ 2, 3 ], 6 ];
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2, 6 ], [ 1, 2, 6 ],
    [ 0, 3, 6 ], [ 1, 3, 6 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], 6 ] );

  test.case = 'sets - three elements map, two element have arrays, one has scalar';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 };
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    { a : 0, b : 2, c : 6 },
    { a : 1, b : 2, c : 6 },
    { a : 0, b : 3, c : 6 },
    { a : 1, b : 3, c : 6 }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 } );

  test.case = 'sets - three elements, two dimentional array';
  var src = [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2, 6 ], [ 1, 2, 6 ],
    [ 0, 3, 6 ], [ 1, 3, 6 ],
    [ 0, 2, null ], [ 1, 2, null ],
    [ 0, 3, null ], [ 1, 3, null ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ] );

  test.case = 'sets - three elements map, elements have arrays';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ], c : [ 6, null ] };
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    { a : 0, b : 2, c : 6 }, { a : 1, b : 2, c : 6 },
    { a : 0, b : 3, c : 6 }, { a : 1, b : 3, c : 6 },
    { a : 0, b : 2, c : null }, { a : 1, b : 2, c : null },
    { a : 0, b : 3, c : null }, { a : 1, b : 3, c : null },
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ], c : [ 6, null ] } );

  test.case = 'sets - two dimentional array, contains argumentsArray';
  var src = [ _.argumentsArray.make( [ 0, 1 ] ), _.argumentsArray.make( [ 2, 3 ] ) ];
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.identical( src, [ _.argumentsArray.make( [ 0, 1 ] ), _.argumentsArray.make( [ 2, 3 ] ) ] );

  /* */

  test.case = 'sets - two dimentional array, leftToRight - 0';
  var src = [ [ 0, 1 ], [ 5, 6 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    leftToRight : 0,
  });
  var expected =
  [
    [ 0, 5 ], [ 0, 6 ],
    [ 1, 5 ], [ 1, 6 ]
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 5, 6 ] ] );

  test.case = 'sets - two elements map, leftToRight - 0';
  var src = { a : [ 0, 1 ], b : [ 5, 6 ] };
  var got = _.permutation.eachSample
  ({
    sets : src,
    leftToRight : 0,
  });
  var expected =
  [
    { a : 0, b : 5 }, { a : 0, b : 6 },
    { a : 1, b : 5 }, { a : 1, b : 6 }
  ];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 5, 6 ] } );

  test.case = 'sets - three elements two dimentional array, leftToRight - 0';
  var src = [ [ 0, 1 ], [ 'str', null ], [ true, 2 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    leftToRight : 0,
  });
  var expected =
  [
    [ 0, 'str', true ], [ 0, 'str', 2 ],
    [ 0, null, true ], [ 0, null, 2 ],
    [ 1, 'str', true ], [ 1, 'str', 2 ],
    [ 1, null, true ], [ 1, null, 2 ]
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 'str', null ], [ true, 2 ] ] );

  /* */

  test.case = 'sets - two dimentional array, leftToRight - 1, result - 0';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two elements map, leftToRight - 1, result - 0';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ] };
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ] } );

  test.case = 'sets - two dimentional array with scalar, leftToRight - 1, result - 0';
  var src = [ [ 0, 1 ], [ 2, 3 ], 6 ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], 6 ] );

  test.case = 'sets - three elements map with scalar, leftToRight - 1, result - 0';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 };
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ],  c : 6 } );

  test.case = 'sets - two dimentional three elements array, leftToRight - 1, result - 0';
  var src = [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 7;
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ] );

  test.case = 'sets - three elements map, elements have arrays, leftToRight - 1, result - 0';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ], c : [ 6, null ] };
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 7;
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ], c : [ 6, null ] } );

  test.case = 'sets - array with unrolls, leftToRight - 1, result - 0';
  var src = [ _.unroll.make( [ 0, 1 ] ), _.unroll.make( [ 2, 3 ] ) ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ _.unroll.make( [ 0, 1 ] ), _.unroll.make( [ 2, 3 ] ) ] );

  test.case = 'sets - array with argumentsArray, leftToRight - 1, result - 0';
  var src = [ _.argumentsArray.make( [ 0, 1 ] ), _.argumentsArray.make( [ 2, 3 ] ) ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    result : 0,
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ _.argumentsArray.make( [ 0, 1 ] ), _.argumentsArray.make( [ 2, 3 ] ) ] );

  test.case = 'sets - two dimentional array, sample - not default, equal length of vectors';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    sample : [ 1, 2 ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two dimentional array, sample - not default, sample.length > vector.length';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    sample : [ 1, 2, 3 ]
  });
  var expected =
  [
    [ 0, 2, 3 ], [ 1, 2, 3 ],
    [ 0, 3, 3 ], [ 1, 3, 3 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two elements map, sample - not default';
  var src = { a : [ 0, 1 ], b : [ 2, 3 ] };
  var got = _.permutation.eachSample
  ({
    sets : src,
    sample : { ak : 'a', bk : 'b', ck : 'c' }
  });
  var expected =
  [
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 0,
      'b' : 2
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 1,
      'b' : 2
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 0,
      'b' : 3
    },
    {
      'ak' : 'a',
      'bk' : 'b',
      'ck' : 'c',
      'a' : 1,
      'b' : 3
    }
  ]
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [ 2, 3 ] } );

  test.case = 'sets - two dimentional array, sample - not default, onEach - routine';
  var onEach = ( sample, i ) => sample[ i ] = sample[ i ] + 12;
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    onEach,
    sample : [ 1, 2, 3 ]
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two dimentional array, sample - not default, onEach - null';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    onEach : null,
    sample : [ 1, 2, 3 ]
  });
  var expected =
  [
    [ 0, 2, 3 ], [ 1, 2, 3 ],
    [ 0, 3, 3 ], [ 1, 3, 3 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two dimentional array, sample - not default, onEach - routine';
  var result = [];
  var onEach = ( sample, i ) =>
  {
    _.arrayAppend( result, sample[ i ] );
  };
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    onEach,
    sample : [ 1, 2, 3, 4 ]
  });
  var expected = 3;
  test.identical( got, expected );
  test.identical( result, [ 0, 2, 3, 4 ] );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'sets - two dimentional array, sample - not default, onEach - routine';
  var src = [ [ 0, 1 ], [ 2, 3 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
    onEach : null,
    sample : [ 1, 2, 3, 4 ]
  });
  var expected =
  [
    [ 0, 2, 3, 4 ], [ 1, 2, 3, 4 ],
    [ 0, 3, 3, 4 ], [ 1, 3, 3, 4 ],
  ];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [ 2, 3 ] ] );

  test.case = 'string and number';
  var src = { str : 'abc', n : 3 };
  var options =
  {
    sets : src,
  }
  var got = _.permutation.eachSample( options );
  var expected =
  [
    { str : 'abc', n : 3 }
  ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'not argument, extra arguments';
  test.shouldThrowErrorSync( () => _.permutation.eachSample() );
  test.shouldThrowErrorSync( () => _.permutation.eachSample( [ [ 1 ], [ 2 ] ], null, [ 1 ] ) );

  test.case = 'o.sets is not arraylike, not aixiliary';
  test.shouldThrowErrorSync( () => _.permutation.eachSample( {} ) );
  test.shouldThrowErrorSync( () => _.permutation.eachSample( 1 ) );
  test.shouldThrowErrorSync( () => _.permutation.eachSample( 'str', null ) );

  test.case = 'onEach is not a routine or null';
  test.shouldThrowErrorSync( () => _.permutation.eachSample( [ [ 1 ], [ 2 ] ], 'str' ) );

  test.case = 'o.base has a value';
  var o = { sets : [ [ 1, 0 ], [ 2, 3 ] ], base : [ 5 ] };
  test.shouldThrowErrorSync( () => _.permutation.eachSample( o ) );

  test.case = 'o.add has a value';
  var o = { sets : [ [ 1, 0 ], [ 2, 3 ] ], add : [ 5 ] };
  test.shouldThrowErrorSync( () => _.permutation.eachSample( o ) );

}

//

function eachSampleEmptyContainers( test )
{
  test.case = 'sets - empty array';
  var src = [];
  var got = _.permutation.eachSample( src );
  var expected = [];
  test.identical( got, expected );
  test.identical( src, [] );

  test.case = 'sets - empty map';
  var src = {};
  var got = _.permutation.eachSample( { sets : src } );
  var expected = [];
  test.identical( got, expected );
  test.identical( src, {} );

  test.case = 'sets - empty map, onEach - null';
  var src = {};
  var got = _.permutation.eachSample( src, null );
  var expected = [];
  test.identical( got, expected );
  test.identical( src, {} );

  test.case = 'sets - empty unroll';
  var src = _.unroll.make( [] );
  var got = _.permutation.eachSample( src );
  var expected = [];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.false( _.unrollIs( got ) );
  test.identical( src, _.unroll.make( [] ) );

  test.case = 'sets - empty argumentsArray';
  var src = _.argumentsArray.make( 0 );
  var got = _.permutation.eachSample( src, null );
  var expected = [];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.identical( src, _.argumentsArray.make( 0 ) );

  /* */

  test.case = 'sets - array with nested empty array';
  var src = [ [] ];
  var got = _.permutation.eachSample( src );
  var expected = [];
  test.identical( got, expected );
  test.identical( src, [ [] ] );

  test.case = 'sets - map with empty array';
  var src = { a : [] };
  var got = _.permutation.eachSample( src, null );
  var expected = [];
  test.identical( got, expected );
  test.identical( src, { a : [] } );

  test.case = 'sets - array with several empty arrays';
  var src = [ [], [], [] ];
  var got = _.permutation.eachSample( src );
  var expected = [];
  test.identical( got, expected );
  test.identical( src, [ [], [], [] ] );

  test.case = 'sets - map with several empty arrays';
  var src = { a : [], b : [], c : [] };
  var got = _.permutation.eachSample( src, null );
  var expected = [];
  test.identical( got, expected );
  test.identical( src, { a : [], b : [], c : [] } );

  test.case = 'sets - unroll with several empty arrays';
  var src = _.unroll.make( [ [], [] ] );
  var got = _.permutation.eachSample( src );
  var expected = [];
  test.identical( got, expected );
  test.false( _.unrollIs( got ) );
  test.identical( src, _.unroll.make( [ [], [] ] ) );

  test.case = 'sets - argumentsArray with several empty arrays';
  var src = _.argumentsArray.make( [ [], [] ] );
  var got = _.permutation.eachSample( src );
  var expected = [];
  test.identical( got, expected );
  test.true( _.arrayIs( got ) );
  test.identical( src, _.argumentsArray.make( [ [], [] ] ) );

  /* */

  test.case = 'second set is empty, array';
  var src = [ [ 0, 1 ], [] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected = [];
  test.identical( got, expected );
  test.identical( src, [ [ 0, 1 ], [] ] );

  test.case = 'second set is empty, map';
  var src = { a : [ 0, 1 ], b : [] };
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected = [];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [] } );

  test.case = 'first set is empty, array';
  var src = [ [], [ 0, 1 ] ];
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected = [];
  test.identical( got, expected );
  test.identical( src, [ [], [ 0, 1 ] ] );

  test.case = 'first set is empty, map';
  var src = { a : [ 0, 1 ], b : [] };
  var got = _.permutation.eachSample
  ({
    sets : src,
  });
  var expected = [];
  test.identical( got, expected );
  test.identical( src, { a : [ 0, 1 ], b : [] } );
}

//

function eachSampleExperiment( test )
{
  var got = _.permutation.eachSample
  ({
    sets : [ [ 0, 1 ], [ 2, 3 ] ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.false( _.unrollIs( got ) );
  test.true( _.arrayIs( got ) );

  var got = _.permutation.eachSample
  ({
    sets : [ _.unroll.make( [ 0, 1 ] ), _.unroll.make( [ 2, 3 ] ) ]
  });
  var expected =
  [
    [ 0, 2 ], [ 1, 2 ],
    [ 0, 3 ], [ 1, 3 ],
  ];
  test.identical( got, expected );
  test.false( _.unrollIs( got ) );
  test.true( _.arrayIs( got ) );

}
eachSampleExperiment.experimental = 1;

//

function eachPermutation_Basic( test )
{
  let context = this;
  let permutation = [];
  let index = [];
  let left = [];
  let right = [];
  let swaps = [];
  let all = [];

  /* */

  test.case = '0 element';
  reset();
  var length = 0;
  _.permutation.eachPermutation({ onEach, sets : length });
  var exp = [];
  test.identical( all, exp );
  test.identical( analyse({ sets : length, permutation }), {} );
  test.identical( permutation.length, 0 );

  /* */

  test.case = '1 element';
  reset();
  var length = 1;
  _.permutation.eachPermutation({ onEach, sets : length });
  var exp = [ [ 0, 'i', 0, 'l', 0, 'r', 0, 's', 0 ] ]
  test.identical( all, exp );
  test.identical( analyse({ sets : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '2 elements';
  reset();
  var length = 2;
  _.permutation.eachPermutation({ onEach, sets : length });
  var exp =
  [
    [ 0, 1, 'i', 0, 'l', 1, 'r', 1, 's', 0 ],
    [ 1, 0, 'i', 1, 'l', 0, 'r', 1, 's', 1 ]
  ]
  test.identical( all, exp );
  test.identical( analyse({ sets : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '3 elements';
  reset();
  var length = 3;
  _.permutation.eachPermutation({ onEach, sets : length });
  var exp =
  [
    [ 0, 1, 2, 'i', 0, 'l', 2, 'r', 2, 's', 0 ],
    [ 0, 2, 1, 'i', 1, 'l', 1, 'r', 2, 's', 1 ],
    [ 1, 2, 0, 'i', 2, 'l', 0, 'r', 2, 's', 1 ],
    [ 1, 0, 2, 'i', 3, 'l', 1, 'r', 2, 's', 1 ],
    [ 2, 0, 1, 'i', 4, 'l', 0, 'r', 2, 's', 1 ],
    [ 2, 1, 0, 'i', 5, 'l', 1, 'r', 2, 's', 1 ]
  ]
  test.identical( all, exp );
  test.identical( analyse({ sets : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '4 elements';
  reset();
  var length = 4;
  _.permutation.eachPermutation({ onEach, sets : length });
  var exp =
  [
    [ 0, 1, 2, 3, 'i', 0, 'l', 3, 'r', 3, 's', 0 ],
    [ 0, 1, 3, 2, 'i', 1, 'l', 2, 'r', 3, 's', 1 ],
    [ 0, 2, 3, 1, 'i', 2, 'l', 1, 'r', 3, 's', 1 ],
    [ 0, 2, 1, 3, 'i', 3, 'l', 2, 'r', 3, 's', 1 ],
    [ 0, 3, 1, 2, 'i', 4, 'l', 1, 'r', 3, 's', 1 ],
    [ 0, 3, 2, 1, 'i', 5, 'l', 2, 'r', 3, 's', 1 ],
    [ 1, 2, 3, 0, 'i', 6, 'l', 0, 'r', 3, 's', 2 ],
    [ 1, 2, 0, 3, 'i', 7, 'l', 2, 'r', 3, 's', 1 ],
    [ 1, 3, 0, 2, 'i', 8, 'l', 1, 'r', 3, 's', 1 ],
    [ 1, 3, 2, 0, 'i', 9, 'l', 2, 'r', 3, 's', 1 ],
    [ 1, 0, 2, 3, 'i', 10, 'l', 1, 'r', 3, 's', 1 ],
    [ 1, 0, 3, 2, 'i', 11, 'l', 2, 'r', 3, 's', 1 ],
    [ 2, 3, 0, 1, 'i', 12, 'l', 0, 'r', 3, 's', 2 ],
    [ 2, 3, 1, 0, 'i', 13, 'l', 2, 'r', 3, 's', 1 ],
    [ 2, 0, 1, 3, 'i', 14, 'l', 1, 'r', 3, 's', 1 ],
    [ 2, 0, 3, 1, 'i', 15, 'l', 2, 'r', 3, 's', 1 ],
    [ 2, 1, 3, 0, 'i', 16, 'l', 1, 'r', 3, 's', 1 ],
    [ 2, 1, 0, 3, 'i', 17, 'l', 2, 'r', 3, 's', 1 ],
    [ 3, 0, 1, 2, 'i', 18, 'l', 0, 'r', 3, 's', 2 ],
    [ 3, 0, 2, 1, 'i', 19, 'l', 2, 'r', 3, 's', 1 ],
    [ 3, 1, 2, 0, 'i', 20, 'l', 1, 'r', 3, 's', 1 ],
    [ 3, 1, 0, 2, 'i', 21, 'l', 2, 'r', 3, 's', 1 ],
    [ 3, 2, 0, 1, 'i', 22, 'l', 1, 'r', 3, 's', 1 ],
    [ 3, 2, 1, 0, 'i', 23, 'l', 2, 'r', 3, 's', 1 ]
  ]
  test.identical( all, exp );
  var exp = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 ];
  test.identical( analyse({ sets : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = '5 elements';
  reset();
  var length = 5;
  _.permutation.eachPermutation({ onEach, sets : length });
  var exp =
  [
    [ 0, 1, 2, 3, 4 ],
    [ 0, 1, 2, 4, 3 ],
    [ 0, 1, 3, 4, 2 ],
    [ 0, 1, 3, 2, 4 ],
    [ 0, 1, 4, 2, 3 ],
    [ 0, 1, 4, 3, 2 ],
    [ 0, 2, 3, 4, 1 ],
    [ 0, 2, 3, 1, 4 ],
    [ 0, 2, 4, 1, 3 ],
    [ 0, 2, 4, 3, 1 ],
    [ 0, 2, 1, 3, 4 ],
    [ 0, 2, 1, 4, 3 ],
    [ 0, 3, 4, 1, 2 ],
    [ 0, 3, 4, 2, 1 ],
    [ 0, 3, 1, 2, 4 ],
    [ 0, 3, 1, 4, 2 ],
    [ 0, 3, 2, 4, 1 ],
    [ 0, 3, 2, 1, 4 ],
    [ 0, 4, 1, 2, 3 ],
    [ 0, 4, 1, 3, 2 ],
    [ 0, 4, 2, 3, 1 ],
    [ 0, 4, 2, 1, 3 ],
    [ 0, 4, 3, 1, 2 ],
    [ 0, 4, 3, 2, 1 ],
    [ 1, 2, 3, 4, 0 ],
    [ 1, 2, 3, 0, 4 ],
    [ 1, 2, 4, 0, 3 ],
    [ 1, 2, 4, 3, 0 ],
    [ 1, 2, 0, 3, 4 ],
    [ 1, 2, 0, 4, 3 ],
    [ 1, 3, 4, 0, 2 ],
    [ 1, 3, 4, 2, 0 ],
    [ 1, 3, 0, 2, 4 ],
    [ 1, 3, 0, 4, 2 ],
    [ 1, 3, 2, 4, 0 ],
    [ 1, 3, 2, 0, 4 ],
    [ 1, 4, 0, 2, 3 ],
    [ 1, 4, 0, 3, 2 ],
    [ 1, 4, 2, 3, 0 ],
    [ 1, 4, 2, 0, 3 ],
    [ 1, 4, 3, 0, 2 ],
    [ 1, 4, 3, 2, 0 ],
    [ 1, 0, 2, 3, 4 ],
    [ 1, 0, 2, 4, 3 ],
    [ 1, 0, 3, 4, 2 ],
    [ 1, 0, 3, 2, 4 ],
    [ 1, 0, 4, 2, 3 ],
    [ 1, 0, 4, 3, 2 ],
    [ 2, 3, 4, 0, 1 ],
    [ 2, 3, 4, 1, 0 ],
    [ 2, 3, 0, 1, 4 ],
    [ 2, 3, 0, 4, 1 ],
    [ 2, 3, 1, 4, 0 ],
    [ 2, 3, 1, 0, 4 ],
    [ 2, 4, 0, 1, 3 ],
    [ 2, 4, 0, 3, 1 ],
    [ 2, 4, 1, 3, 0 ],
    [ 2, 4, 1, 0, 3 ],
    [ 2, 4, 3, 0, 1 ],
    [ 2, 4, 3, 1, 0 ],
    [ 2, 0, 1, 3, 4 ],
    [ 2, 0, 1, 4, 3 ],
    [ 2, 0, 3, 4, 1 ],
    [ 2, 0, 3, 1, 4 ],
    [ 2, 0, 4, 1, 3 ],
    [ 2, 0, 4, 3, 1 ],
    [ 2, 1, 3, 4, 0 ],
    [ 2, 1, 3, 0, 4 ],
    [ 2, 1, 4, 0, 3 ],
    [ 2, 1, 4, 3, 0 ],
    [ 2, 1, 0, 3, 4 ],
    [ 2, 1, 0, 4, 3 ],
    [ 3, 4, 0, 1, 2 ],
    [ 3, 4, 0, 2, 1 ],
    [ 3, 4, 1, 2, 0 ],
    [ 3, 4, 1, 0, 2 ],
    [ 3, 4, 2, 0, 1 ],
    [ 3, 4, 2, 1, 0 ],
    [ 3, 0, 1, 2, 4 ],
    [ 3, 0, 1, 4, 2 ],
    [ 3, 0, 2, 4, 1 ],
    [ 3, 0, 2, 1, 4 ],
    [ 3, 0, 4, 1, 2 ],
    [ 3, 0, 4, 2, 1 ],
    [ 3, 1, 2, 4, 0 ],
    [ 3, 1, 2, 0, 4 ],
    [ 3, 1, 4, 0, 2 ],
    [ 3, 1, 4, 2, 0 ],
    [ 3, 1, 0, 2, 4 ],
    [ 3, 1, 0, 4, 2 ],
    [ 3, 2, 4, 0, 1 ],
    [ 3, 2, 4, 1, 0 ],
    [ 3, 2, 0, 1, 4 ],
    [ 3, 2, 0, 4, 1 ],
    [ 3, 2, 1, 4, 0 ],
    [ 3, 2, 1, 0, 4 ],
    [ 4, 0, 1, 2, 3 ],
    [ 4, 0, 1, 3, 2 ],
    [ 4, 0, 2, 3, 1 ],
    [ 4, 0, 2, 1, 3 ],
    [ 4, 0, 3, 1, 2 ],
    [ 4, 0, 3, 2, 1 ],
    [ 4, 1, 2, 3, 0 ],
    [ 4, 1, 2, 0, 3 ],
    [ 4, 1, 3, 0, 2 ],
    [ 4, 1, 3, 2, 0 ],
    [ 4, 1, 0, 2, 3 ],
    [ 4, 1, 0, 3, 2 ],
    [ 4, 2, 3, 0, 1 ],
    [ 4, 2, 3, 1, 0 ],
    [ 4, 2, 0, 1, 3 ],
    [ 4, 2, 0, 3, 1 ],
    [ 4, 2, 1, 3, 0 ],
    [ 4, 2, 1, 0, 3 ],
    [ 4, 3, 0, 1, 2 ],
    [ 4, 3, 0, 2, 1 ],
    [ 4, 3, 1, 2, 0 ],
    [ 4, 3, 1, 0, 2 ],
    [ 4, 3, 2, 0, 1 ],
    [ 4, 3, 2, 1, 0 ]
  ]
  test.identical( permutation, exp );
  test.identical( analyse({ sets : length, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  function analyse( o )
  {
    let encountered = Object.create( null );
    if( _.number.is( o.sets ) )
    {
      if( o.sets < 0 )
      o.sets = 0;
      let sets = Array( o.sets );
      for( let i = o.sets-1 ; i >= 0 ; i-- )
      sets[ i ] = i;
      o.sets = sets;
    }
    for( let p = 0 ; p < o.permutation.length ; p++ )
    {
      let permutation = o.permutation[ p ];
      let key = permutation.join( '-' );
      encountered[ key ] = encountered[ key ] || 0;
      encountered[ key ] += 1;
    }
    for( let key in encountered )
    {
      if( encountered[ key ] === 1 )
      delete encountered[ key ]
    }
    return encountered;
  }

  /* */

  function reset()
  {
    permutation = [];
    index = [];
    left = [];
    right = [];
    swaps = [];
    all = [];
  }

  /* */

  function onEach( /* _permutation, _index, _left, _right, _swaps */ )
  {
    let _permutation = arguments[ 0 ];
    let _index = arguments[ 1 ];
    let _left = arguments[ 2 ];
    let _right = arguments[ 3 ];
    let _swaps = arguments[ 4 ];

    console.log( _index, '.', `${_left}..${_right}`, '.', _permutation.join( ' ' ) );
    permutation.push( _permutation.slice() );
    index.push( _index );
    left.push( _left );
    right.push( _right );
    swaps.push( _swaps );
    all.push([ ... _permutation, 'i', _index, 'l', _left, 'r', _right, 's', _swaps ]);
  }

}

//

function eachPermutation_Options( test )
{
  let context = this;
  let all = [];
  let permutation = [];
  let index = [];
  let left = [];
  let right = [];
  let swaps = [];

  /* */

  test.case = 'empty sets';
  reset();
  var sets = [];
  var length = sets.length;
  var got = _.permutation.eachPermutation({ onEach, sets });
  var exp = [];
  test.identical( permutation, exp );
  test.identical( analyse({ sets, permutation }), {} );
  test.identical( permutation.length, 0 );
  test.true( got === undefined );

  /* */

  test.case = 'sets';
  reset();
  var sets = [ 'a', 'b', 'c' ];
  var length = sets.length;
  var got = _.permutation.eachPermutation({ onEach, sets, result : 0 });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ]
  test.identical( permutation, exp );
  test.identical( analyse({ sets, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );
  test.true( got === undefined );

  /* */

  test.case = 'result : 1';
  reset();
  var sets = [ 'a', 'b', 'c' ];
  var length = sets.length;
  var got = _.permutation.eachPermutation({ onEach, sets, result : 1 });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ]
  test.identical( permutation, exp );
  test.identical( got, exp );
  test.true( got !== permutation );
  test.identical( analyse({ sets, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = 'result : []';
  reset();
  var sets = [ 'a', 'b', 'c' ];
  var length = sets.length;
  var dst = [];
  var got = _.permutation.eachPermutation({ onEach, sets, result : dst });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ]
  test.identical( permutation, exp );
  test.identical( got, exp );
  test.true( got !== permutation );
  test.true( got === dst );
  test.identical( analyse({ sets, permutation }), {} );
  test.identical( permutation.length, _.factorial( length ) );

  /* */

  test.case = 'onEach : null, result : []';
  reset();
  var sets = [ 'a', 'b', 'c' ];
  var dst = [];
  var got = _.permutation.eachPermutation({ onEach : null, sets, result : dst });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ];
  test.identical( permutation, [] );
  test.identical( got, exp );
  test.true( got !== permutation );
  test.true( got === dst );
  test.identical( analyse({ sets, permutation }), {} );
  test.identical( permutation.length, 0 );

  /* */

  test.case = 'onEach : null, result : null';
  reset();
  var sets = [ 'a', 'b', 'c' ];
  var got = _.permutation.eachPermutation({ onEach : null, sets, result : null });
  var exp =
  [
    [ 'a', 'b', 'c' ],
    [ 'a', 'c', 'b' ],
    [ 'b', 'c', 'a' ],
    [ 'b', 'a', 'c' ],
    [ 'c', 'a', 'b' ],
    [ 'c', 'b', 'a' ],
  ];
  test.identical( permutation, [] );
  test.identical( got, exp );
  test.true( got !== permutation );
  test.identical( analyse({ sets, permutation }), {} );
  test.identical( permutation.length, 0 );

  /* */

  function analyse( o )
  {
    let encountered = Object.create( null );
    if( _.number.is( o.sets ) )
    {
      if( o.sets < 0 )
      o.sets = 0;
      let sets = Array( o.sets );
      for( let i = o.sets-1 ; i >= 0 ; i-- )
      sets[ i ] = i;
      o.sets = sets;
    }
    for( let p = 0 ; p < o.permutation.length ; p++ )
    {
      let permutation = o.permutation[ p ];
      let key = permutation.join( '-' );
      encountered[ key ] = encountered[ key ] || 0;
      encountered[ key ] += 1;
    }
    for( let key in encountered )
    {
      if( encountered[ key ] === 1 )
      delete encountered[ key ]
    }
    return encountered;
  }

  /* */

  function reset()
  {
    permutation = [];
    index = [];
    left = [];
    right = [];
    swaps = [];
    all = [];
  }

  /* */

  function onEach( /* _permutation, _index, _left, _right, _swaps */ )
  {
    let _permutation = arguments[ 0 ];
    let _index = arguments[ 1 ];
    let _left = arguments[ 2 ];
    let _right = arguments[ 3 ];
    let _swaps = arguments[ 4 ];

    console.log( _index, '.', `${_left}..${_right}`, '.', _permutation.join( ' ' ) );
    permutation.push( _permutation.slice() );
    index.push( _index );
    left.push( _left );
    right.push( _right );
    swaps.push( _swaps );
    all.push([ ... _permutation, 'i', _index, 'l', _left, 'r', _right, 's', _swaps ]);
  }

}

//

function swapsCount( test )
{

  var src = [];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 1, 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 0, 1, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0, 2, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 1, 0, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 2, 0, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 0, 1, 2, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 0;
  test.identical( got, exp );

  var src = [ 0, 1, 3, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 0, 2, 3, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 0, 2, 1, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 0, 3, 1, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 0, 3, 2, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 1, 2, 3, 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 3;
  test.identical( got, exp );

  var src = [ 1, 2, 0, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 1, 3, 0, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 3;
  test.identical( got, exp );

  var src = [ 1, 3, 2, 0 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 1, 0, 2, 3 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 1;
  test.identical( got, exp );

  var src = [ 1, 0, 3, 2 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

  var src = [ 2, 3, 0, 1 ];
  test.case = `( ${src.join( ' ' )} )`;
  var got = _.permutation.swapsCount( src );
  var exp = 2;
  test.identical( got, exp );

}

// --
//
// --

const Proto =
{

  name : 'Tools.Permutation.l0.l9',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // permutation

    eachSample_,
    eachSampleEmptyContainers,
    eachSampleExperiment,

    eachPermutation_Basic,
    eachPermutation_Options,

    swapsCount,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
