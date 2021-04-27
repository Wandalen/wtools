( function _l1_Unroll_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.unroll = _.unroll || Object.create( null );

// --
// unroll
// --

/**
 * The routine is() determines whether the passed value is an instance of type Unroll ( unroll-array ).
 *
 * If {-src-} is an Unroll, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.unroll.is( _.unroll.make( [ 1, 'str' ] ) );
 * // returns true
 *
 * @example
 * _.unroll.is( [] );
 * // returns false
 *
 * @example
 * _.unroll.is( 1 );
 * // returns false
 *
 * @returns { boolean } Returns true if {-src-} is an Unroll.
 * @function is
 * @namespace Tools/unroll
 */

function is( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return !!src[ unrollSymbol ];
}

//

function isEmpty( src )
{
  if( !_.unroll.is( src ) )
  return false;
  return src.length === 0;
}

//

/**
 * The routine isPopulated() determines whether the unroll-array has elements (length).
 *
 * If {-src-} is an unroll-array and has one or more elements, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * let src = _.unroll.from( [ 1, 'str' ] );
 * _.isPopulated( src );
 * // returns true
 *
 * @example
 * let src = _.unroll.make( [] )
 * _.isPopulated( src );
 * // returns false
 *
 * @returns { boolean } Returns true if argument ( src ) is an Unroll and has one or more elements ( length ).
 * @function isPopulated
 * @namespace Tools/unroll
 */

function isPopulated( src )
{
  if( !_.unroll.is( src ) )
  return false;
  return src.length > 0;
}

//

function like( src )
{
  return _.unroll.is( src );
}

// --
// maker
// --

function _makeEmpty( src )
{
  return _.unroll._make();
}

//

function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  return _.unroll._makeEmpty( ... arguments );
}

//

/**
 * The routine makeUndefined() returns a new Unroll with length equal to {-length-}.
 * If the argument {-length-} is not provided, routine returns new Unroll with the length defined from {-src-}.
 *
 * @param { Long|Number|Null } src - Any Long, Number or null. If {-length-} is not provided, then routine defines length from {-src-}.
 * @param { Number|Long|Null } length - Defines length of new Unroll. If null is provided, then length defines by {-src-}.
 *
 * @example
 * _.unroll.makeUndefined();
 * // returns []
 *
 * @example
 * _.unroll.makeUndefined( null );
 * // returns []
 *
 * @example
 * _.unroll.makeUndefined( null, null );
 * // returns []
 *
 * @example
 * _.unroll.makeUndefined( 3 );
 * // returns [ undefined, undefined, undefined]
 *
 * @example
 * _.unroll.makeUndefined( 3, null );
 * // returns [ undefined, undefined, undefined]
 *
 * @example
 * _.unroll.makeUndefined( [ 1, 2, 3 ] );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * _.unroll.makeUndefined( [ 1, 2, 3 ], null );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * _.unroll.makeUndefined( [ 1, 2, 3 ], 4 );
 * // returns [ undefined, undefined, undefined, undefined ]
 *
 * @example
 * _.unroll.makeUndefined( [ 1, 2, 3, 4 ], [ 1, 2 ] );
 * // returns [ undefined, undefined ]
 *
 * @example
 * let src = new F32x( [ 1, 2, 3, 4, 5 ] );
 * let got = _.unroll.makeUndefined( src, 3 );
 * console.log( got );
 * // log [ undefined, undefined, undefined ]
 *
 * @returns { Unroll } Returns a new Unroll with length equal to {-length-} or defined from {-src-}.
 * If null passed, routine returns the empty Unroll.
 * @function makeUndefined
 * @throws { Error } If arguments.length is less then one or more then two.
 * @throws { Error } If argument {-src-} is not a Long, not null.
 * @throws { Error } If argument {-length-} is not a number, not a Long.
 * @namespace Tools/unroll
 */

function _makeUndefined( src, length )
{
  if( arguments.length === 0 )
  return _.unroll._make();

  if( _.longIs( length ) )
  {
    length = length.length;
  }
  if( length === undefined || length === null )
  {
    if( src === null )
    {
      length = 0;
    }
    else if( _.longLike( src ) )
    {
      length = src.length;
    }
    else if( _.number.is( src ) )
    {
      length = src;
      src = null;
    }
    else _.assert( 0 );
  }

  _.assert( _.number.isFinite( length ) );
  _.assert( _.longIs( src ) || src === null );

  return _.unroll._make( length );
}

//

function makeUndefined( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  // _.assert( _.number.isFinite( length ) );
  // _.assert( _.longIs( src ) || src === null );
  return _.unroll._makeUndefined( ... arguments );
}

/**
 * The routine make() returns a new unroll-array maiden from {-src-}.
 *
 * Unroll constructed by attaching symbol _.unroll Symbol to ordinary array. Making an unroll normalizes its content.
 *
 * @param { Number|Long|Set|Null|Undefined } src - The number or other instance to make unroll-array. If null is provided,
 * then routine returns an empty Unroll.
 *
 * @example
 * let src = _.unroll.make();
 * // returns []
 * _.unrollIs( src );
 * // returns true
 *
 * @example
 * let src = _.unroll.make( null );
 * // returns []
 * _.unrollIs( src );
 * // returns true
 *
 * @example
 * let src = _.unroll.make( null, null );
 * // returns []
 * _.unrollIs( src );
 * // returns true
 *
 * @example
 * let src = _.unroll.make( 3 );
 * // returns [ undefined, undefined, undefined ]
 * _.unrollIs( src );
 * // returns true
 *
 * @example
 * let src = _.unroll.make( [ 1, 2, 'str' ] );
 * // returns [ 1, 2, 'str' ]
 * _.unrollIs( src );
 * // returns true
 *
 * @returns { Unroll } - Returns a new Unroll maiden from {-src-}.
 * Otherwise, it returns the empty Unroll.
 * @function make
 * @throws { Error } If arguments.length is more then one.
 * @throws { Error } If {-src-} is not a number, not a Long, not Set, not null, not undefined.
 * @namespace Tools/unroll
 */

function _make( src )
{
  let result;
  result = _.array._make( ... arguments );
  result[ unrollSymbol ] = true;
  if( src !== null && src !== undefined && !_.unroll.is( src ) )
  result = _.unroll.normalize( result );
  return result;
}

//

function make( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  return _.unroll._make( src );
}

//

function _cloneShallow( src )
{
  let result = _.array._cloneShallow( ... arguments );
  result[ unrollSymbol ] = true;
  if( !_.unroll.is( src ) )
  result = _.unroll.normalize( result );
  return result;
}

//

function cloneShallow( src )
{
  _.assert( arguments.length === 1 );
  return _.unroll._cloneShallow( src );
}

//

/**
 * The routine from() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine from() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 *
 * @param { Long|Set|Number|Null|Undefined } src - The number, array-like object or Unroll. If null is provided,
 * then routine returns an empty Unroll.
 *
 * @example
 * let got = _.unroll.from( null );
 * // returns []
 * _.unrollIs( got );
 * // returns true
 *
 * @example
 * let got = _.unroll.from( 3 );
 * // returns [ undefined, undefined, undefined ]
 * _.unrollIs( got );
 * // returns true
 *
 * @example
 * let got = _.unroll.from( [ 1, 2, 'str' ] );
 * // returns [ 1, 2, 'str' ]
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let got = _.unroll.from( new F32x( [ 1, 2, 0 ] ) );
 * // returns [ 1, 2, 0 ]
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let got = _.unroll.from( new Set( [ 1, 2, 'str' ] ) );
 * // returns [ 1, 2, 'str' ]
 * console.log( _.unrollIs( got ) );
 * // log true
 *
 * @example
 * let src = _.unroll.make( [ 1, 2, 'str' ] );
 * let got = _.unroll.from( src );
 * // returns [ 1, 2, 'str' ]
 * console.log ( src === got );
 * // log true
 *
 * @returns { Unroll } Returns Unroll converted from {-src-}. If {-src-} is Unroll, then routine returns {-src-}.
 * @function from
 * @throws { Error } If arguments.length is less or more then one.
 * @throws { Error } If argument {-src-} is not Long, not number, not Set, not null, not undefined.
 * @namespace Tools/unroll
 */

function _from( src )
{
  if( _.unrollIs( src ) )
  return src;
  return _.unroll._make( src );
}

//

function from( src )
{
  _.assert( arguments.length === 1 );
  return _.unroll._from( src );
}

//

/**
 * The routine normalize() performs normalization of {-dstArray-}.
 * Normalization is unrolling of Unrolls, which is elements of {-dstArray-}.
 *
 * If {-dstArray-} is unroll-array, routine normalize() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine normalize() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The Unroll to be unrolled (normalized).
 *
 * @example
 * let unroll = _.unroll.from( [ 1, 2, _.unroll.make( [ 3, 'str' ] ) ] );
 * let result = _.unroll.normalize( unroll )
 * console.log( result );
 * // log [ 1, 2, 3, 'str' ]
 * console.log( _.unrollIs( result ) );
 * // log true
 *
 * @example
 * let unroll = _.unroll.from( [ 1,'str' ] );
 * let result = _.unroll.normalize( [ 1, unroll, [ unroll ] ] );
 * console.log( result );
 * // log [ 1, 1, 'str', [ 1, 'str' ] ]
 * console.log( _.unrollIs( result ) );
 * // log false
 *
 * @returns { Array } If {-dstArray-} is array, routine returns an array with normalized elements.
 * @returns { Unroll } If {-dstArray-} is Unroll, routine returns an Unroll with normalized elements.
 * @function normalize
 * @throws { Error } If ( arguments.length ) is not equal to one.
 * @throws { Error } If argument ( dstArray ) is not arrayLike.
 * @namespace Tools/unroll
 */

function normalize( dstArray )
{

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( dstArray ), () => `Expects array as the first argument {-dstArray-} but got "${ dstArray }"` );

  for( let a = 0 ; a < dstArray.length ; a++ )
  {
    if( _.unrollIs( dstArray[ a ] ) )
    {
      let args = [ a, 1 ];
      args.push.apply( args, dstArray[ a ] );
      dstArray.splice.apply( dstArray, args );
      a += args.length - 3;
      /* no normalization of ready unrolls, them should be normal */
    }
    else if( _.arrayIs( dstArray[ a ] ) )
    {
      _.unroll.normalize( dstArray[ a ] );
    }
  }

  return dstArray;
}

// --
// declaration
// --

let unrollSymbol = Symbol.for( 'unroll' );

// --
// declaration
// --

let ToolsExtension =
{

  // dichotomy

  unrollIs : is.bind( _.unroll ),
  unrollIsEmpty : isEmpty.bind( _.unroll ),
  unrollIsPopulated : isPopulated.bind( _.unroll ),
  unrollLike : like.bind( _.unroll ),

  // maker

  unrollMakeEmpty : makeEmpty.bind( _.unroll ),
  unrollMakeUndefined : makeUndefined.bind( _.unroll ),
  unrollMake : make.bind( _.unroll ),
  unrollCloneShallow : cloneShallow.bind( _.unroll ),
  unrollFrom : from.bind( _.unroll ),

}

//

Object.assign( _, ToolsExtension );

//

/* qqq : for Yevhen : make replacements */

let UnrollExtension =
{

  //

  NamespaceName : 'unroll',
  TypeName : 'Unroll',
  SecondTypeName : 'Unroll',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is,
  isEmpty,
  isPopulated,
  like,

  // maker

  _makeEmpty,
  makeEmpty, /* qqq : for Yevhen : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for Yevhen : cover */
  _make,
  make, /* qqq : for Yevhen : cover */
  _cloneShallow,
  cloneShallow, /* qqq : for Yevhen : cover */
  _from,
  from,
  normalize,

  // field

  symbol : unrollSymbol,

}

//

Object.assign( _.unroll, UnrollExtension );
_.long._namespaceRegister( _.unroll );

})();
