( function _l7_Functional_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;

// --
// scalar
// --

/**
 * Produce a single array from all arguments if cant return single argument as a scalar.
 * If {-scalarAppend-} gets a single argument it returns the argument as is.
 * If {-scalarAppend-} gets an argument and one or more undefined it returns the argument as is.
 * If {-scalarAppend-} gets more than one or less than one defined arguments then it returns array having all defined arguments.
 * If some argument is a Long ( for example array ) then each element of the Long is treated as an argument, not recursively.
 *
 * @function scalarAppend.
 * @namespace Tools
 */

function scalarAppend( dst, src )
{

  _.assert( arguments.length === 2 );

  if( dst === undefined )
  {
    if( _.longIs( src ) )
    {
      dst = [];
    }
    else
    {
      if( src === undefined )
      return [];
      else
      return src;
    }
  }

  if( _.longIs( dst ) )
  {

    if( !_.arrayIs( dst ) )
    dst = _.array.from( dst );

    if( src === undefined )
    {}
    else if( _.longIs( src ) )
    _.arrayAppendArray( dst, src );
    else
    dst.push( src );

  }
  else
  {

    if( src === undefined )
    {}
    else if( _.longIs( src ) )
    dst = _.arrayAppendArray( [ dst ], src );
    else
    dst = [ dst, src ];

  }

  return dst;
}

//

function scalarAppendOnce( dst, src )
{

  _.assert( arguments.length === 2 );

  if( dst === undefined )
  {
    if( _.longIs( src ) )
    {
      dst = [];
    }
    else
    {
      if( src === undefined )
      return [];
      else
      return src;
    }
  }

  if( _.longIs( dst ) )
  {

    if( !_.arrayIs( dst ) )
    dst = _.array.from( dst );

    if( src === undefined )
    {}
    else if( _.longIs( src ) )
    _.arrayAppendArrayOnce( dst, src );
    else
    _.arrayAppendElementOnce( dst, src );

  }
  else
  {

    if( src === undefined )
    {}
    else if( _.longIs( src ) )
    dst = _.arrayAppendArrayOnce( [ dst ], src );
    else
    dst = _.arrayAppendElementOnce( [ dst ], src );

  }

  return dst;
}

//

/**
 * The scalarToVector() routine returns a new array
 * which containing the static elements only type of Number.
 *
 * It takes two arguments (dst) and (length)
 * checks if the (dst) is a Number, If the (length) is greater than or equal to zero.
 * If true, it returns the new array of static (dst) numbers.
 * Otherwise, if the first argument (dst) is an Array,
 * and its (dst.length) is equal to the (length),
 * it returns the original (dst) Array.
 * Otherwise, it throws an Error.
 *
 * @param { ( Number | Array ) } dst - A number or an Array.
 * @param { Number } length - The length of the new array.
 *
 * @example
 * _.scalarToVector( 3, 7 );
 * // returns [ 3, 3, 3, 3, 3, 3, 3 ]
 *
 * @example
 * _.scalarToVector( [ 3, 7, 13 ], 3 );
 * // returns [ 3, 7, 13 ]
 *
 * @returns { Number[] | Array } - Returns the new array of static numbers or the original array.
 * @function scalarToVector
 * @throws { Error } If missed argument, or got less or more than two arguments.
 * @throws { Error } If type of the first argument is not a number or array.
 * @throws { Error } If the second argument is less than 0.
 * @throws { Error } If (dst.length) is not equal to the (length).
 * @namespace Tools
 */

// function arrayFromNumber( dst, length )
function scalarToVector( dst, length )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  // _.assert( _.number.is( dst ) || _.arrayIs( dst ), 'Expects array of number as argument' );
  _.assert( dst !== undefined, 'Expects array or scalar' );
  _.assert( length >= 0 );

  if( _.arrayIs( dst ) )
  {
    _.assert( dst.length === length, () => 'Expects array of length ' + length + ' but got ' + dst.length );
  }
  else
  {
    dst = _.longFill( [], dst, [ 0, length ] );
  }

  return dst;
}

//

function scalarFrom( src )
{
  if( _.longIs( src ) && src.length === 1 )
  return src[ 0 ];
  return src;
}

//

function scalarFromOrNull( src )
{
  if( _.longIs( src ) )
  {
    if( src.length === 1 )
    return src[ 0 ];
    else if( src.length === 0 )
    return null;
  }
  return src;
}

// --
// multiplier
// --

function dup( ins, times, result )
{
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.number.is( times ) || _.longIs( times ), 'dup expects times as number or array' );

  if( _.number.is( times ) )
  {
    if( !result )
    result = new Array( times );
    for( let t = 0 ; t < times ; t++ )
    result[ t ] = ins;
    return result;
  }
  else if( _.longIs( times ) )
  {
    _.assert( times.length === 2 );
    let l = times[ 1 ] - times[ 0 ];
    if( !result )
    result = new Array( times[ 1 ] );
    for( let t = 0 ; t < l ; t++ )
    result[ times[ 0 ] + t ] = ins;
    return result;
  }
  else _.assert( 0, 'unexpected' );

}

//

function multiple( src, times )
{
  _.assert( arguments.length === 2 );
  if( _.argumentsArray.like( src ) )
  _.assert( src.length === times, () => 'Vector should have ' + times + ' elements, but have ' + src.length );
  else
  src = _.dup( src, times );
  return src;
}

//

function multipleAll( dsts )
{
  let length = undefined;

  _.assert( arguments.length === 1 );

  for( let d = 0 ; d < dsts.length ; d++ )
  if( _.arrayIs( dsts[ d ] ) )
  {
    length = dsts[ d ].length;
    break;
  }

  if( length === undefined )
  return dsts;

  for( let d = 0 ; d < dsts.length ; d++ )
  dsts[ d ] = _.multiple( dsts[ d ], length );

  return dsts;
}

// --
// entity iterator
// --

/**
 * Routine eachSample_() accepts the container {-sets-} with scalar or vector elements.
 * Routine returns an array of vectors. Each vector is a unique combination of elements of vectors
 * that is passed in option {-sets-}.
 *
 * Routine eachSample_() accepts the options map {-o-} or two arguments. If options map
 * is used, all parameters can be set. If passed two arguments, first of them is ( sets )
 * and second is ( onEach ).
 *
 * Routine eachSample_() accepts the callback {-onEach-}. Callback accepts two arguments. The first is
 * template {-sample-} and second is index of vector in returned array. Callback can change template {-sample-}
 * and corrupt the building of vectors.
 *
 * @param {Array|Map} sets - Container with vector and scalar elements to combine new vectors.
 * @param {Routine|Null} onEach - Callback that accepts template {-sample-} and index of new vector.
 * @param {Array|Map} sample - Template for new vectors. If not passed, routine create empty container.
 * If sample.length > vector.length, then vector elements replace template elements with the same indexes.
 * @param {boolean} leftToRight - Sets the direction of reading {-sets-}. 1 - left to rigth, 0 - rigth to left. By default is 1.
 * @param {boolean} result - Sets retuned value. 1 - routine returns array with verctors, 0 - routine returns index of last element. By default is 1.
 *
 * @example
 * var got = _.eachSample_( { sets : [ [ 0, 1 ], 2 ] });
 * console.log( got );
 * // log [ [ 0, 2 ], [ 1, 2 ] ]
 *
 * @example
 * var got = _.eachSample_( { sets : [ [ 0, 1 ], [ 2, 3 ] ], result : 0 });
 * console.log( got );
 * // log 3
 *
 * @example
 * var got = _.eachSample_( { sets : [ [ 0, 1 ], [ 2, 3 ] ] });
 * console.log( got );
 * // log [ [ 0, 2 ], [ 1, 2 ],
 *          [ 0, 3 ], [ 1, 3 ] ]
 *
 * @example
 * var got = _.eachSample_( { sets : { a : [ 0, 1 ], b : [ 2, 3 ] } });
 * console.log( got );
 * // log [ { a : 0, b : 2}, { a : 1, b : 2},
 *          { a : 0, b : 3}, { a : 1, b : 3} ]
 *
 * @example
 * var got = _.eachSample_( { sets : [ [ 0, 1 ], [ 2, 3 ] ], leftToRight : 0 } );
 * console.log( got );
 * // log [ [ 3, 0 ], [ 2, 0 ],
 *          [ 3, 1 ], [ 2, 1 ] ]
 *
 * @example
 * var got = _.eachSample_
 * ({
 *   sets : [ [ 0, 1 ], [ 2, 3 ] ],
 *   sample : [ 2, 3, 4, 5 ]
 * });
 * console.log( got );
 * // log [ [ 3, 0, 4, 5 ], [ 2, 0, 4, 5 ],
 *          [ 3, 1, 4, 5 ], [ 2, 1, 4, 5 ] ]
 *
 * @example
 * function onEach( sample, i )
 * {
 *   _.arrayAppend( got, sample[ i ] );
 * }
 * var got = [];
 * _.eachSample_
 * ({
 *   sets : [ [ 0, 1 ], [ 2, 3 ] ],
 *   onEach : onEach,
 *   sample : [ 'a', 'b', 'c', 'd' ]
 * });
 * console.log( got );
 * // log [ 0, 2, 'c', 'd' ]
 *
 * @function eachSample_
 * @returns {Array} Returns array contained  check function.
 * @throws {exception} If ( arguments.length ) is less then one or more then two.
 * @throws {exception} If( onEach ) is not a Routine or null.
 * @throws {exception} If( o.sets ) is not array or objectLike.
 * @throws {exception} If ( sets ) is aixiliary and ( onEach ) not passed.
 * @throws {exception} If( o.base ) or ( o.add) is undefined.
 * @namespace Tools
 */

function eachSample_( o )
{

  if( arguments.length === 2 )
  o =
  {
    sets : arguments[ 0 ],
    onEach : arguments[ 1 ],
  }
  else if( _.argumentsArray.like( arguments[ 0 ] ) )
  o =
  {
    sets : arguments[ 0 ],
  }

  _.routine.options( eachSample_, o );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.routine.is( o.onEach ) || o.onEach === null );
  _.assert( _.longLike( o.sets ) || _.aux.is( o.sets ) );
  _.assert( o.base === undefined && o.add === undefined );

  if( o.result === null )
  o.result = o.onEach === null;

  /* sample */

  if( !o.sample )
  o.sample = _.entity.makeUndefined( o.sets );

  /* */

  let keys = _.longLike( o.sets ) ? _.longFromRange([ 0, o.sets.length ]) : _.props.keys( o.sets );
  if( _.bool.likeTrue( o.result ) && !_.arrayIs( o.result ) )
  o.result = [];
  if( keys.length === 0 )
  return o.result ? o.result : 0;
  let len = [];
  let indexnd = [];
  let index = 0;
  let l = _.entityLengthOf( o.sets );

  /* sets */

  let sindex = 0;
  let breaking = 0;

  o.sets = _.filter_( null, o.sets, function( set, k )
  {
    _.assert( _.longIs( set ) || _.primitive.is( set ) );

    if( breaking === 0 )
    {
      if( _.primitive.is( set ) )
      set = [ set ];

      if( set.length === 0 )
      breaking = 1;

      len[ sindex ] = _.entityLengthOf( o.sets[ k ] );
      indexnd[ sindex ] = 0;
      sindex += 1;
    }
    return set;

  });

  if( breaking === 1 )
  return o.result ? o.result : 0;

  /* */

  if( !firstSample() )
  return o.result;

  let iterate = o.leftToRight ? iterateLeftToRight : iterateRightToLeft;
  do
  {
    if( o.onEach )
    o.onEach.call( o.sample, o.sample, index );
  }
  while( iterate() );

  if( o.result )
  return o.result;
  else
  return index;

  /* */

  function firstSample()
  {
    let sindex = 0;

    _.each( o.sets, function( e, k )
    {
      o.sample[ k ] = o.sets[ k ][ indexnd[ sindex ] ];
      sindex += 1;
      if( !len[ k ] )
      return 0;
    });

    if( o.result )
    if( _.aux.is( o.sample ) )
    o.result.push( _.props.extend( null, o.sample ) );
    else
    o.result.push( o.sample.slice() );

    return 1;
  }

  /* */

  function nextSample( i )
  {

    let k = keys[ i ];
    indexnd[ i ]++;

    if( indexnd[ i ] >= len[ i ] )
    {
      indexnd[ i ] = 0;
      o.sample[ k ] = o.sets[ k ][ indexnd[ i ] ];
    }
    else
    {
      o.sample[ k ] = o.sets[ k ][ indexnd[ i ] ];
      index += 1;

      if( o.result )
      if( _.aux.is( o.sample ) )
      o.result.push( _.props.extend( null, o.sample ) );
      else
      o.result.push( o.sample.slice() );

      return 1;
    }

    return 0;
  }

  /* */

  function iterateLeftToRight()
  {
    for( let i = 0 ; i < l ; i++ )
    if( nextSample( i ) )
    return 1;

    return 0;
  }

  /* */

  function iterateRightToLeft()
  {
    for( let i = l - 1 ; i >= 0 ; i-- )
    if( nextSample( i ) )
    return 1;

    return 0;
  }

}

eachSample_.defaults =
{

  leftToRight : 1,
  onEach : null,

  sets : null,
  sample : null,

  result : null, /* was 1 */

}

//

function eachPermutation_( o )
{

  _.routine.options( eachPermutation_, arguments );

  if( o.result === null )
  o.result = o.onEach === null;

  if( _.number.is( o.sets ) )
  {
    if( o.sets < 0 )
    o.sets = 0;
    let sets = Array( o.sets );
    for( let i = o.sets-1 ; i >= 0 ; i-- )
    sets[ i ] = i;
    o.sets = sets;
  }

  if( _.bool.likeTrue( o.result ) && !_.arrayIs( o.result ) )
  o.result = [];

  const add = ( _.argumentsArray.like( o.result ) || _.routineIs( o.result.push ) ) ? append1 : append0;
  const dst = o.result ? o.result : undefined;
  const sets = o.sets;
  const length = o.sets.length;
  const last = length - 1;
  const plast = length - 2;
  const slast = length - 3;
  const iterateAll = o.onEach === null ? iterateWithoutCallback : iterateWithCallback;
  let left = last;
  let swaps = 0;
  let iteration = 0;

  if( length <= 1 )
  {
    if( length === 1 )
    {
      if( o.onEach )
      o.onEach( sets, iteration, left, last, swaps );
      add();
    }
    return;
  }

  let iterations = 1;
  for( let i = plast-1 ; i >= 0 ; i-- )
  {
    iterations *= ( last - i );
  }
  iterations *= length;

  let counter = [];
  for( let i = plast ; i >= 0 ; i-- )
  counter[ i ] = last-i;

  _.assert( _.longIs( sets ) );
  _.assert( length >= 0 );
  _.assert( length <= 30 );

  iterateAll();

  return dst;

  /* */

  function append0()
  {
  }

  function append1()
  {
    dst.push( sets.slice() );
  }

  function swap( left, right )
  {
    _.assert( sets[ right ] !== undefined );
    _.assert( sets[ left ] !== undefined );
    let ex = sets[ right ];
    sets[ right ] = sets[ left ];
    sets[ left ] = ex;
  }

  function reverse()
  {
    if( left >= slast )
    {
      swaps = 1;
      swap( left, last );
      counter[ left ] -= 1;
    }
    else
    {
      swaps = last - left;
      if( swaps % 2 === 1 )
      swaps -= 1;
      swaps /= 2;
      for( let i = swaps ; i >= 0 ; i-- )
      swap( left + i, last - i );
      counter[ left ] -= 1;
      swaps += 1;
    }
  }

  function nextCounter()
  {
    while( counter[ left ] === 0 && left !== 0 )
    left -= 1;
    for( let i = left + 1 ; i < counter.length ; i++ )
    counter[ i ] = last - i;
  }

  function onEachDefault()
  {
  }

  function iterateWithoutCallback()
  {

    while( iteration < iterations )
    {
      add();
      left = plast;
      nextCounter();
      reverse();
      iteration += 1;
    }
  }

  function iterateWithCallback()
  {
    _.assert( _.routineIs( o.onEach ), 'Expects routine {-o.onEach-}' );

    while( iteration < iterations )
    {
      o.onEach( sets, iteration, left, last, swaps );
      add();
      left = plast;
      nextCounter();
      reverse();
      iteration += 1;
    }
  }

}

eachPermutation_.defaults =
{
  onEach : null,
  sets : null, /* was container */
  result : null, /* was dst */
}

/*

== number:3

= log

0 . 2..2 . 0 1 2
1 . 1..2 . 0 2 1
2 . 0..2 . 1 2 0
3 . 1..2 . 1 0 2
4 . 0..2 . 2 0 1
5 . 1..2 . 2 1 0

== number:4

= log

0 . 3..3 . 0 1 2 3
1 . 2..3 . 0 1 3 2
2 . 1..3 . 0 2 3 1
3 . 2..3 . 0 2 1 3
4 . 1..3 . 0 3 1 2
5 . 2..3 . 0 3 2 1

6 . 0..3 . 1 2 3 0
7 . 2..3 . 1 2 0 3
8 . 1..3 . 1 3 0 2
9 . 2..3 . 1 3 2 0
10 . 1..3 . 1 0 2 3
11 . 2..3 . 1 0 3 2

12 . 0..3 . 2 3 0 1
13 . 2..3 . 2 3 1 0
14 . 1..3 . 2 0 1 3
15 . 2..3 . 2 0 3 1
16 . 1..3 . 2 1 3 0
17 . 2..3 . 2 1 0 3

18 . 0..3 . 3 0 1 2
19 . 2..3 . 3 0 2 1
20 . 1..3 . 3 1 2 0
21 . 2..3 . 3 1 0 2
22 . 1..3 . 3 2 0 1
23 . 2..3 . 3 2 1 0

== number:5

= count

120
24
6
2
1

4
3
2

= log

0 . 4..4 . 0 1 2 3 4
1 . 3..4 . 0 1 2 4 3
2 . 2..4 . 0 1 3 4 2
3 . 3..4 . 0 1 3 2 4
4 . 2..4 . 0 1 4 2 3
5 . 3..4 . 0 1 4 3 2
6 . 1..4 . 0 2 3 4 1
7 . 3..4 . 0 2 3 1 4
8 . 2..4 . 0 2 4 1 3
9 . 3..4 . 0 2 4 3 1
10 . 2..4 . 0 2 1 3 4
11 . 3..4 . 0 2 1 4 3
12 . 1..4 . 0 3 4 1 2
13 . 3..4 . 0 3 4 2 1
14 . 2..4 . 0 3 1 2 4
15 . 3..4 . 0 3 1 4 2
16 . 2..4 . 0 3 2 4 1
17 . 3..4 . 0 3 2 1 4
18 . 1..4 . 0 4 1 2 3
19 . 3..4 . 0 4 1 3 2
20 . 2..4 . 0 4 2 3 1
21 . 3..4 . 0 4 2 1 3
22 . 2..4 . 0 4 3 1 2
23 . 3..4 . 0 4 3 2 1

24 . 0..4 . 1 2 3 4 0
25 . 3..4 . 1 2 3 0 4
26 . 2..4 . 1 2 4 0 3
27 . 3..4 . 1 2 4 3 0
28 . 2..4 . 1 2 0 3 4
29 . 3..4 . 1 2 0 4 3
30 . 1..4 . 1 3 4 0 2
31 . 3..4 . 1 3 4 2 0
32 . 2..4 . 1 3 0 2 4
33 . 3..4 . 1 3 0 4 2
34 . 2..4 . 1 3 2 4 0
35 . 3..4 . 1 3 2 0 4
36 . 1..4 . 1 4 0 2 3
37 . 3..4 . 1 4 0 3 2
38 . 2..4 . 1 4 2 3 0
39 . 3..4 . 1 4 2 0 3
40 . 2..4 . 1 4 3 0 2
41 . 3..4 . 1 4 3 2 0
42 . 1..4 . 1 0 2 3 4
43 . 3..4 . 1 0 2 4 3
44 . 2..4 . 1 0 3 4 2
45 . 3..4 . 1 0 3 2 4
46 . 2..4 . 1 0 4 2 3
47 . 3..4 . 1 0 4 3 2

48 . 0..4 . 2 3 4 0 1
49 . 3..4 . 2 3 4 1 0
50 . 2..4 . 2 3 0 1 4
51 . 3..4 . 2 3 0 4 1
52 . 2..4 . 2 3 1 4 0
53 . 3..4 . 2 3 1 0 4
54 . 1..4 . 2 4 0 1 3
55 . 3..4 . 2 4 0 3 1
56 . 2..4 . 2 4 1 3 0
57 . 3..4 . 2 4 1 0 3
58 . 2..4 . 2 4 3 0 1
59 . 3..4 . 2 4 3 1 0
60 . 1..4 . 2 0 1 3 4
61 . 3..4 . 2 0 1 4 3
62 . 2..4 . 2 0 3 4 1
63 . 3..4 . 2 0 3 1 4
64 . 2..4 . 2 0 4 1 3
65 . 3..4 . 2 0 4 3 1
66 . 1..4 . 2 1 3 4 0
67 . 3..4 . 2 1 3 0 4
68 . 2..4 . 2 1 4 0 3
69 . 3..4 . 2 1 4 3 0
70 . 2..4 . 2 1 0 3 4
71 . 3..4 . 2 1 0 4 3
72 . 0..4 . 3 4 0 1 2
73 . 3..4 . 3 4 0 2 1
74 . 2..4 . 3 4 1 2 0
75 . 3..4 . 3 4 1 0 2
76 . 2..4 . 3 4 2 0 1
77 . 3..4 . 3 4 2 1 0
78 . 1..4 . 3 0 1 2 4
79 . 3..4 . 3 0 1 4 2
80 . 2..4 . 3 0 2 4 1
81 . 3..4 . 3 0 2 1 4
82 . 2..4 . 3 0 4 1 2
83 . 3..4 . 3 0 4 2 1
84 . 1..4 . 3 1 2 4 0
85 . 3..4 . 3 1 2 0 4
86 . 2..4 . 3 1 4 0 2
87 . 3..4 . 3 1 4 2 0
88 . 2..4 . 3 1 0 2 4
89 . 3..4 . 3 1 0 4 2
90 . 1..4 . 3 2 4 0 1
91 . 3..4 . 3 2 4 1 0
92 . 2..4 . 3 2 0 1 4
93 . 3..4 . 3 2 0 4 1
94 . 2..4 . 3 2 1 4 0
95 . 3..4 . 3 2 1 0 4
96 . 0..4 . 4 0 1 2 3
97 . 3..4 . 4 0 1 3 2
98 . 2..4 . 4 0 2 3 1
99 . 3..4 . 4 0 2 1 3
100 . 2..4 . 4 0 3 1 2
101 . 3..4 . 4 0 3 2 1
102 . 1..4 . 4 1 2 3 0
103 . 3..4 . 4 1 2 0 3
104 . 2..4 . 4 1 3 0 2
105 . 3..4 . 4 1 3 2 0
106 . 2..4 . 4 1 0 2 3
107 . 3..4 . 4 1 0 3 2
108 . 1..4 . 4 2 3 0 1
109 . 3..4 . 4 2 3 1 0
110 . 2..4 . 4 2 0 1 3
111 . 3..4 . 4 2 0 3 1
112 . 2..4 . 4 2 1 3 0
113 . 3..4 . 4 2 1 0 3
114 . 1..4 . 4 3 0 1 2
115 . 3..4 . 4 3 0 2 1
116 . 2..4 . 4 3 1 2 0
117 . 3..4 . 4 3 1 0 2
118 . 2..4 . 4 3 2 0 1
119 . 3..4 . 4 3 2 1 0

*/

//

function swapsCount( permutation )
{
  let counter = 0;
  let forward = permutation.slice();
  let backward = [];
  for( let i = forward.length-1 ; i >= 0 ; i-- )
  {
    backward[ forward[ i ] ] = i;
  }
  for( let i = backward.length-1 ; i >= 0 ; i-- )
  {
    if( backward[ i ] !== i )
    {
      let forward1 = forward[ i ];
      let backward1 = backward[ i ];
      forward[ backward1 ] = forward1;
      backward[ forward1 ] = backward1;
      counter += 1;
    }
  }
  return counter;
}

//

/* Calculates the factorial of an integer number ( >= 0 ) */

function _factorial( src )
{
  let result = 1;
  while( src > 1 )
  {
    result = result * src;
    src -= 1;
  }
  return result;
}

//

/**
 * @summary Returns factorial for number `src`.
 * @description Number `src`
 * @param {Number} src Source number. Should be less than 10000.
 * @function factorial
 * @namespace Tools
 * @module wTools
 */

function factorial( src )
{
  _.assert( src < 10000 );
  _.assert( _.intIs( src ) );
  _.assert( src >= 0 );
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( src === 0 )
  return 1;
  return _._factorial( src )
}

// --
//
// --

function _entityFilterDeep( o )
{

  let result;
  let onEach = _._filter_functor( o.onEach, o.conditionLevels );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.object.like( o.src ) || _.longIs( o.src ), 'entityFilter : expects objectLike or longIs src, but got', _.entity.strType( o.src ) );
  _.assert( _.routine.is( onEach ) );

  /* */

  if( _.longIs( o.src ) )
  {
    result = _.long.make( o.src, 0 );
    let s, d;
    for( s = 0, d = 0 ; s < o.src.length ; s++ )
    // for( let s = 0, d = 0 ; s < o.src.length ; s++, d++ )
    {
      let r = onEach.call( o.src, o.src[ s ], s, o.src );

      if( _.unrollIs( r ) )
      {
        _.arrayAppendArray( result, r );
        d += r.length;
      }
      else if( r !== undefined )
      {
        result[ d ] = r;
        d += 1;
      }

      // if( r === undefined )
      // d--;
      // else
      // result[ d ] = r;

    }
    if( d < o.src.length )
    result = _.array.slice( result, 0, d );
  }
  else
  {
    result = _.entity.makeUndefined( o.src );
    for( let s in o.src )
    {
      let r = onEach.call( o.src, o.src[ s ], s, o.src );
      // r = onEach.call( o.src, o.src[ s ], s, o.src );
      if( r !== undefined )
      result[ s ] = r;
    }
  }

  /* */

  return result;
}

_entityFilterDeep.defaults =
{
  src : null,
  onEach : null,
  conditionLevels : 1,
}

//

function entityFilterDeep( src, onEach )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _entityFilterDeep
  ({
    src,
    onEach,
    conditionLevels : 1024,
  });
}

//

/*
qqq2 : poor coverage and implementation was wrong!
*/

function _entityIndex_functor( fop )
{

  fop = _.routine.options( _entityIndex_functor, fop );

  let extendRoutine = fop.extendRoutine;

  return function entityIndex( src, onEach )
  {
    let result = Object.create( null );

    if( onEach === undefined )
    onEach = function( e, k )
    {
      if( k === undefined && extendRoutine )
      return { [ e ] : undefined };
      return k;
    }
    else if( _.strIs( onEach ) )
    {
      let selector = onEach;
      _.assert( _.routine.is( _.select ) );
      _.assert( _.strBegins( selector, '*/' ), () => `Selector should begins with "*/", but "${selector}" does not` );
      selector = _.strRemoveBegin( selector, '*/' );
      onEach = function( e, k )
      {
        return _.select( e, selector );
      }
      /* Dmytro : Note. Selector selects properties of entities. For example:
      var got = ( 'str', '\*\/length' );
      var exp = { 3 : 'str' };
      test.identical( got, exp );
      */
    }

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.routine.is( onEach ) );
    _.assert( src !== undefined, 'Expects {-src-}' );

    /* */

    if( _.aux.is( src ) )
    {

      for( let k in src )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, val );
      }

    }
    else if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, val );
      }

    }
    else
    {

      let val = src;
      let r = onEach( val, undefined, undefined );
      extend( r, val );

    }

    return result;

    /* */

    function extend( ext, val )
    {
      if( ext === undefined )
      return;

      if( _.unrollIs( ext ) )
      return ext.forEach( ( ext ) => extend( ext, val ) );

      if( extendRoutine === null )
      {
        // if( ext !== undefined ) // Dmytro : it's unnecessary condition, see 10 lines above
        result[ ext ] = val;
      }
      else
      {
        if( !_.aux.is( ext ) )
        {
          _.assert( _.primitive.is( ext ) );
          ext = { [ ext ] : val }
        }
        extendRoutine( result, ext );
        // // else if( ext !== undefined ) // Dmytro : it's unnecessary condition, see 16 lines above
        // else
        // result[ ext ] = val;
      }

    }

  }

}

_entityIndex_functor.defaults =
{
  extendRoutine : null,
}

//

/**
 * The routine entityIndex() returns a new pure map. The values of the map defined by elements of provided
 * entity {-src-} and keys defined by result of callback execution on the correspond elements.
 * If callback returns undefined, then element will not exist in resulted map.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns index of element.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityIndex( null );
 * // returns {}
 *
 * @example
 * _.entityIndex( null, ( el ) => el );
 * // returns { 'null' : null }
 *
 * @example
 * _.entityIndex( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndex( [ 1, 2, 3, 4 ], ( el, key ) => el + key );
 * // returns { '1' : 1, '3' : 2, '5' : 3, '7' : 4 }
 *
 * @example
 * _.entityIndex( { a : 1, b : 2, c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityIndex( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { '1' : 1, '2' : 2, '3' : 3 }
 *
 * @example
 * _.entityIndex( { a : { f1 : 1, f2 : 3 }, b : { f1 : 2, f2 : 4 } }, '*\/f1' );
 * // returns { '1' : { f1 : 1, f2 : 3 }, '2' : { f1 : 2, f2 : 4 } }
 *
 * @returns { PureMap } - Returns the pure map. Values of the map defined by elements of provided entity {-src-}
 * and keys defined by results of callback execution on corresponding elements.
 * @function entityIndex
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityIndex = _entityIndex_functor({ extendRoutine : null });

//

/**
 * The routine entityIndexSupplementing() returns a new pure map. The pairs key-value of the map formed by results
 * of callback execution on the entity elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine does not change existed value.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns index of element.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityIndexSupplementing( null );
 * // returns { 'null' : undefined }
 *
 * @example
 * _.entityIndexSupplementing( null, ( el ) => el );
 * // returns { 'null' : null }
 *
 * @example
 * _.entityIndexSupplementing( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexSupplementing( [ 1, 2, 3, 4 ], ( el, key ) => key > 2 ? key : 1 );
 * // returns { '1' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexSupplementing( { a : 1, b : 1, c : 1 } );
 * // returns { a : 1, b : 1, c : 1 }
 *
 * @example
 * _.entityIndexSupplementing( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityIndexSupplementing( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : key, 'x' : el } } );
 * // returns { a : 'a', x : 1, b : 'b', c : 'c' }
 *
 * @example
 * _.entityIndexSupplementing( { a : { f1 : 1, f2 : 3 }, b : { f1 : 1, f2 : 4 } }, '*\/f1' );
 * // returns { '1' : { f1 : 1, f2 : 4 } }
 *
 * @returns { PureMap } - Returns the pure map. Values of the map defined by elements of provided entity {-src-}
 * and keys of defines by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine does not replaces the previous value with the new one.
 * @function entityIndexSupplementing
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityIndexSupplementing = _entityIndex_functor({ extendRoutine : _.props.supplement });

//

/**
 * The routine entityIndexExtending() returns a new pure map. The pairs key-value of the map formed by results
 * of callback execution on the entity elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine replaces existed value to the new.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns index of element.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityIndexExtending( null );
 * // returns { 'null' : undefined }
 *
 * @example
 * _.entityIndexExtending( null, ( el ) => el );
 * // returns { 'null' : null }
 *
 * @example
 * _.entityIndexExtending( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexExtending( [ 1, 2, 3, 4 ], ( el, key ) => key > 2 ? key : 1 );
 * // returns { '1' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexExtending( { a : 1, b : 1, c : 1 } );
 * // returns { a : 1, b : 1, c : 1 }
 *
 * @example
 * _.entityIndexExtending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityIndexExtending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : key, 'x' : el } } );
 * // returns { a : 'a', x : 3, b : 'b', c : 'c' }
 *
 * @example
 * _.entityIndexExtending( { a : { f1 : 1, f2 : 3 }, b : { f1 : 1, f2 : 4 } }, '*\/f1' );
 * // returns { '1' : { f1 : 1, f2 : 4 } }
 *
 * @returns { PureMap } - Returns the pure map. Values of the map defined by elements of provided entity {-src-}
 * and keys of defines by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine replaces the previous value with the new one.
 * @function entityIndexExtending
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityIndexExtending = _entityIndex_functor({ extendRoutine : _.props.extend });

//

/**
 * The routine entityIndexPrepending() returns a new pure map. The pairs key-value of the map formed by results
 * of callback execution on the entity elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine prepends new values to the existed value.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns index of element.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityIndexPrepending( null );
 * // returns { 'null' : undefined }
 *
 * @example
 * _.entityIndexPrepending( null, ( el ) => el );
 * // returns { 'null' : null }
 *
 * @example
 * _.entityIndexPrepending( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexPrepending( [ 1, 2, 3, 4 ], ( el, key ) => key > 2 ? key : 1 );
 * // returns { '1' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexPrepending( { a : 1, b : 1, c : 1 } );
 * // returns { a : 1, b : 1, c : 1 }
 *
 * @example
 * _.entityIndexPrepending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityIndexPrepending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : key, 'x' : el } } );
 * // returns { a : 'a', x : [ 3, 2, 1 ], b : 'b', c : 'c' }
 *
 * @example
 * _.entityIndexPrepending( { a : { f1 : 1, f2 : 3 }, b : { f1 : 1, f2 : 4 } }, '*\/f1' );
 * // returns { '1' : { f1 : 1, f2 : 4 } }
 *
 * @returns { PureMap } - Returns the pure map. Values of the map defined by elements of provided entity {-src-}
 * and keys of defines by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine prepends new value to the previous.
 * @function entityIndexPrepending
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityIndexPrepending = _entityIndex_functor({ extendRoutine : _.mapExtendPrepending });

//

/**
 * The routine entityIndexAppending() returns a new pure map. The pairs key-value of the map formed by results
 * of callback execution on the entity elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine appends new values to the existed value.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns index of element.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityIndexAppending( null );
 * // returns { 'null' : undefined }
 *
 * @example
 * _.entityIndexAppending( null, ( el ) => el );
 * // returns { 'null' : null }
 *
 * @example
 * _.entityIndexAppending( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexAppending( [ 1, 2, 3, 4 ], ( el, key ) => key > 2 ? key : 1 );
 * // returns { '1' : 3, '3' : 4 }
 *
 * @example
 * _.entityIndexAppending( { a : 1, b : 1, c : 1 } );
 * // returns { a : 1, b : 1, c : 1 }
 *
 * @example
 * _.entityIndexAppending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityIndexAppending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : key, 'x' : el } } );
 * // returns { a : 'a', x : [ 1, 2, 3 ], b : 'b', c : 'c' }
 *
 * @example
 * _.entityIndexAppending( { a : { f1 : 1, f2 : 3 }, b : { f1 : 1, f2 : 4 } }, '*\/f1' );
 * // returns { '1' : { f1 : 1, f2 : 4 } }
 *
 * @returns { PureMap } - Returns the pure map. Values of the map defined by elements of provided entity {-src-}
 * and keys of defines by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine appends new value to the previous.
 * @function entityIndexAppending
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityIndexAppending = _entityIndex_functor({ extendRoutine : _.mapExtendAppending });

//

function _entityRemap_functor( fop )
{

  fop = _.routine.options( _entityRemap_functor, fop );

  let extendRoutine = fop.extendRoutine;

  return function entityRemap( src, onEach )
  {
    let result = Object.create( null );

    if( onEach === undefined )
    onEach = function( e, k )
    {
      if( e === undefined && extendRoutine )
      return { [ k ] : e };
      return e;
    }
    else if( _.strIs( onEach ) )
    {
      let selector = onEach;
      _.assert( _.routine.is( _.select ) );
      _.assert( _.strBegins( selector, '*/' ), () => `Selector should begins with "*/", but "${selector}" does not` );
      selector = _.strRemoveBegin( selector, '*/' );
      onEach = function( e, k )
      {
        return _.select( e, selector );
      }
    }

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.routine.is( onEach ) );
    _.assert( src !== undefined, 'Expects src' );

    /* */

    if( _.aux.is( src ) )
    {

      for( let k in src )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, k );
      }

    }
    else if( _.longIs( src ) )
    {

      for( let k = 0 ; k < src.length ; k++ )
      {
        let val = src[ k ];
        let r = onEach( val, k, src );
        extend( r, k );
      }

    }
    else
    {

      let val = src;
      let r = onEach( val, undefined, undefined );
      extend( r, undefined );

    }

    return result;

    /* */

    function extend( res, key )
    {
      if( res === undefined )
      return;

      if( _.unrollIs( res ) )
      return res.forEach( ( res ) => extend( res, key ) );

      if( extendRoutine === null )
      {
        if( key !== undefined )
        result[ key ] = res;
      }
      else
      {
        if( _.aux.is( res ) )
        extendRoutine( result, res );
        else if( key !== undefined )
        result[ key ] = res;
      }

    }

  }

}

_entityRemap_functor.defaults =
{
  extendRoutine : null,
}

//

/**
 * The routine entityRemap() returns a new pure map. The keys of the map defined by keys of provided
 * entity {-src-} and values defined by result of callback execution on the correspond elements.
 * If callback returns undefined, then element will not exist in resulted map.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns map with pair key-value for Longs
 * and maps or element for other types.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityRemap( null );
 * // returns {}
 *
 * @example
 * _.entityRemap( null, ( el ) => el );
 * // returns {}
 *
 * @example
 * _.entityRemap( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityRemap( [ 1, 2, 3, 4 ], ( el, key ) => el + key );
 * // returns { '0' : 1, '1' : 3, '2' : 5, '3' : 7 }
 *
 * @example
 * _.entityRemap( { a : 1, b : 2, c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityRemap( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 'a', b : 'b', c : 'c' }
 *
 * @example
 * _.entityRemap( { a : { f1 : 1, f2 : 3 }, b : { f1 : 2, f2 : 4 } }, '*\/f1' );
 * // returns { a : 1, b : 2 }
 *
 * @returns { PureMap } - Returns the pure map. Keys of the map defined by keys of provided entity {-src-}
 * and values defined by results of callback execution on corresponding elements.
 * @function entityRemap
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityRemap = _entityRemap_functor({ extendRoutine : null });

//

/**
 * The routine entityRemapSupplementing() returns a new pure map. The keys of the map defined by keys of provided
 * entity {-src-} and values defined by result of callback execution on the correspond elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine does not change existed value.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns map with pair key-value for Longs
 * and maps or element for other types.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityRemapSupplementing( null );
 * // returns {}
 *
 * @example
 * _.entityRemapSupplementing( null, ( el ) => el );
 * // returns {}
 *
 * @example
 * _.entityRemapSupplementing( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityRemapSupplementing( [ 1, 2, 3, 4 ], ( el, key ) => el + key );
 * // returns { '0' : 1, '1' : 3, '2' : 5, '3' : 7 }
 *
 * @example
 * _.entityRemapSupplementing( { a : 1, b : 2, c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityRemapSupplementing( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 'a', b : 'b', c : 'c' }
 *
 * @example
 * _.entityRemapSupplementing( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : el, x : el } } );
 * // returns { a : 1, x : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityRemapSupplementing( { a : { f1 : 1, f2 : 3 }, b : { f1 : 2, f2 : 4 } }, '*\/f1' );
 * // returns { a : 1, b : 2 }
 *
 * @returns { PureMap } - Returns the pure map. Keys of the map defined by keys of provided entity {-src-}
 * and values defined by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine does not replaces the previous value with the new one.
 * @function entityRemapSupplementing
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */


let entityRemapSupplementing = _entityRemap_functor({ extendRoutine : _.props.supplement });

//

/**
 * The routine entityRemapExtending() returns a new pure map. The keys of the map defined by keys of provided
 * entity {-src-} and values defined by result of callback execution on the correspond elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine does change existed value to the new one.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns map with pair key-value for Longs
 * and maps or element for other types.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityRemapExtending( null );
 * // returns {}
 *
 * @example
 * _.entityRemapExtending( null, ( el ) => el );
 * // returns {}
 *
 * @example
 * _.entityRemapExtending( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityRemapExtending( [ 1, 2, 3, 4 ], ( el, key ) => el + key );
 * // returns { '0' : 1, '1' : 3, '2' : 5, '3' : 7 }
 *
 * @example
 * _.entityRemapExtending( { a : 1, b : 2, c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityRemapExtending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 'a', b : 'b', c : 'c' }
 *
 * @example
 * _.entityRemapExtending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : el, x : el } } );
 * // returns { a : 1, x : 3, b : 2, c : 3 }
 *
 * @example
 * _.entityRemapExtending( { a : { f1 : 1, f2 : 3 }, b : { f1 : 2, f2 : 4 } }, '*\/f1' );
 * // returns { a : 1, b : 2 }
 *
 * @returns { PureMap } - Returns the pure map. Keys of the map defined by keys of provided entity {-src-}
 * and values defined by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine replaces the previous value with the new one.
 * @function entityRemapExtending
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityRemapExtending = _entityRemap_functor({ extendRoutine : _.props.extend });

//

/**
 * The routine entityRemapPrepending() returns a new pure map. The keys of the map defined by keys of provided
 * entity {-src-} and values defined by result of callback execution on the correspond elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine prepends new values to the existed value.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns map with pair key-value for Longs
 * and maps or element for other types.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityRemapPrepending( null );
 * // returns {}
 *
 * @example
 * _.entityRemapPrepending( null, ( el ) => el );
 * // returns {}
 *
 * @example
 * _.entityRemapPrepending( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityRemapPrepending( [ 1, 2, 3, 4 ], ( el, key ) => el + key );
 * // returns { '0' : 1, '1' : 3, '2' : 5, '3' : 7 }
 *
 * @example
 * _.entityRemapPrepending( { a : 1, b : 2, c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityRemapPrepending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 'a', b : 'b', c : 'c' }
 *
 * @example
 * _.entityRemapPrepending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : el, x : el } } );
 * // returns { a : 1, x : [ 3, 2, 1 ], b : 2, c : 3 }
 *
 * @example
 * _.entityRemapPrepending( { a : { f1 : 1, f2 : 3 }, b : { f1 : 2, f2 : 4 } }, '*\/f1' );
 * // returns { a : 1, b : 2 }
 *
 * @returns { PureMap } - Returns the pure map. Keys of the map defined by keys of provided entity {-src-}
 * and values defined by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine prepends new values to the existed value.
 * @function entityRemapPrepending
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityRemapPrepending = _entityRemap_functor({ extendRoutine : _.mapExtendPrepending });

//

/**
 * The routine entityRemapAppending() returns a new pure map. The keys of the map defined by keys of provided
 * entity {-src-} and values defined by result of callback execution on the correspond elements.
 * If callback returns undefined, then element will not exist in resulted map.
 * If callback returns map with key existed in resulted map, then routine appends new values to the existed value.
 *
 * @param { * } src - Any entity to make map of indexes.
 * @param { String|Function } onEach - The callback executed on elements of entity.
 * If {-onEach-} is not defined, then routine uses callback that returns map with pair key-value for Longs
 * and maps or element for other types.
 * If {-onEach-} is a string, then routine searches elements with equal key. String value should has
 * prefix "*\/" ( asterisk + slash ).
 * By default, {-onEach-} applies three parameters: element, key, container. If entity is primitive, then
 * routine applies only element value, other parameters is undefined.
 *
 * @example
 * _.entityRemapAppending( null );
 * // returns {}
 *
 * @example
 * _.entityRemapAppending( null, ( el ) => el );
 * // returns {}
 *
 * @example
 * _.entityRemapAppending( [ 1, 2, 3, 4 ] );
 * // returns { '0' : 1, '1' : 2, '2' : 3, '3' : 4 }
 *
 * @example
 * _.entityRemapAppending( [ 1, 2, 3, 4 ], ( el, key ) => el + key );
 * // returns { '0' : 1, '1' : 3, '2' : 5, '3' : 7 }
 *
 * @example
 * _.entityRemapAppending( { a : 1, b : 2, c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @example
 * _.entityRemapAppending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => container.a > 0 ? key : el );
 * // returns { a : 'a', b : 'b', c : 'c' }
 *
 * @example
 * _.entityRemapAppending( { a : 1, b : 2, c : 3 }, ( el, key, container ) => { return { [ key ] : el, x : el } } );
 * // returns { a : 1, x : [ 3, 2, 1 ], b : 2, c : 3 }
 *
 * @example
 * _.entityRemapAppending( { a : { f1 : 1, f2 : 3 }, b : { f1 : 2, f2 : 4 } }, '*\/f1' );
 * // returns { a : 1, b : 2 }
 *
 * @returns { PureMap } - Returns the pure map. Keys of the map defined by keys of provided entity {-src-}
 * and values defined by results of callback execution on corresponding elements. If the callback returns map
 * with existed key, then routine appends new values to the existed value.
 * @function entityRemapAppending
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If {-src-} has value undefined.
 * @throws { Error } If {-onEach-} is not undefined, not a function, not a String.
 * @throws { Error } If {-onEach-} is a String, but has not prefix '*\/' ( asterisk + slash ).
 * @namespace Tools
 */

let entityRemapAppending = _entityRemap_functor({ extendRoutine : _.mapExtendAppending });

// --
// implementation
// --

let ToolsExtension =
{

  eachSample_, /* xxx : review */
  eachPermutation_, /* xxx : move out */
  swapsCount, /* xxx : move out */
  _factorial, /* xxx : move out */
  factorial, /* xxx : move out */

  _entityFilterDeep,
  entityFilterDeep,
  filterDeep : entityFilterDeep,

  _entityIndex_functor,
  entityIndex,
  index : entityIndex,
  entityIndexSupplementing,
  indexSupplementing : entityIndexSupplementing,
  entityIndexExtending,
  indexExtending : entityIndexExtending,
  entityIndexPrepending,
  indexPrepending : entityIndexPrepending,
  entityIndexAppending,
  indexAppending : entityIndexAppending,

  _entityRemap_functor,
  entityRemap,
  remap : entityRemap,
  entityRemapSupplementing,
  remapSupplementing : entityRemapSupplementing,
  entityRemapExtending,
  remapExtending : entityRemapExtending,
  entityRemapPrepending,
  remapPrepending : entityRemapPrepending,
  entityRemapAppending,
  remapAppending : entityRemapAppending,

}

//

Object.assign( _, ToolsExtension );

})();
