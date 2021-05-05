( function _l1_Long_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.assert( _.long === undefined );
_.assert( _.withLong === undefined );
_.long = _.long || Object.create( null );
_.long.namespaces = _.long.namespaces || Object.create( null );
_.long.toolsNamespacesByType = _.long.toolsNamespacesByType || Object.create( null );
_.long.toolsNamespacesByName = _.long.toolsNamespacesByName || Object.create( null );
_.long.toolsNamespaces = _.long.toolsNamespacesByName;
_.withLong = _.long.toolsNamespacesByType;

// --
// dichotomy
// --

/**
 * The routine longIs() determines whether the passed value is an array-like or an Array.
 * Imortant : longIs returns false for Object, even if the object has length field.
 *
 * If {-srcMap-} is an array-like or an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * _.longIs( [ 1, 2 ] );
 * // returns true
 *
 * @example
 * _.longIs( 10 );
 * // returns false
 *
 * @example
 * let isArr = ( function() {
 *   return _.longIs( arguments );
 * } )( 'Hello there!' );
 * // returns true
 *
 * @returns { boolean } Returns true if {-srcMap-} is an array-like or an Array.
 * @function longIs.
 * @namespace Tools
 */

/* xxx : optimize! */
/* qqq : for junior : optimize. ask how to */
/* qqq : check coverage */

function is( src )
{

  if( _.primitive.is( src ) )
  return false;
  if( !_.class.methodIteratorOf( src ) )
  return false;

  if( _.argumentsArray.like( src ) )
  return true;
  if( _.bufferTyped.is( src ) )
  return true;

  return false;
}

// function is( src )
// {
//
//   if( _.primitive.is( src ) )
//   return false;
//   if( _.argumentsArray.like( src ) )
//   return true;
//   if( _.bufferTypedIs( src ) )
//   return true;
//
//   return false;
// }

//

function isEmpty( src )
{
  if( !_.long.is( src ) )
  return false;
  return src.length === 0;
}

//

function isPopulated( src )
{
  if( !_.long.is( src ) )
  return false;
  return src.length > 0;
}

//

function like( src ) /* qqq : cover */
{
  if( _.primitive.is( src ) )
  return false;
  return _.long.is( src );
}

//

function isFixedLength( src )
{
  if( _.array.is( src ) )
  return false;
  return this.is( src );
}

// --
// maker
// --

function _makeEmpty( src )
{
  if( arguments.length === 1 )
  {
    if( _.argumentsArray.is( src ) )
    return _.argumentsArray.make( 0 );
    else if( _.unroll.is( src ) )
    return _.unroll.make();
    if( _.routineIs( src ) )
    {
      let result = new src( 0 );
      _.assert( _.long.is( result ) );
      return result;
    }
    return new src.constructor();
  }
  else
  {
    return this.tools.defaultLong.make();
  }
}

//

/* qqq2 : for junior : cover please */
function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  {
    _.assert( _.vector.is( src ) || _.routineIs( src ) );
    // _.assert( this.like( src ) || _.routineIs( src ) ); /* Dmytro : for compatibility with ContainerAdapters source instance should be a Vector, not simple Long */
    return this._makeEmpty( src );
  }
  else
  {
    return this._makeEmpty();
  }
}

//

function _makeUndefined( src, length )
{
  if( arguments.length === 2 )
  {
    if( !_.numberIs( length ) )
    {
      if( _.numberIs( length.length ) )
      length = length.length;
      else
      length = [ ... length ].length;
    }
    if( _.argumentsArray.is( src ) )
    return _.argumentsArray._makeUndefined( src, length );
    if( _.unroll.is( src ) )
    return _.unroll._makeUndefined( src, length );
    if( _.routineIs( src ) )
    {
      let result = new src( length );
      _.assert( _.long.is( result ) );
      return result;
    }
    if( src === null )
    return this.tools.defaultLong.make( length );
    return new src.constructor( length );
  }
  else if( arguments.length === 1 )
  {
    let constructor;
    if( this.like( src ) )
    {
      if( _.argumentsArray.is( src ) )
      return _.argumentsArray._makeUndefined( src );
      if( _.unroll.is( src ) )
      return _.unroll._makeUndefined( src );
      constructor = src.constructor;
      length = src.length;
    }
    else
    {
      return this.tools.defaultLong.make( src );
    }
    return new constructor( length );
  }
  else
  {
    return this.tools.defaultLong.make();
  }
}

//

/* qqq2 : for junior : cover please */
function makeUndefined( src, length )
{
  // _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  _.assert( 0 <= arguments.length && arguments.length <= 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || _.countable.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === null || _.numberIs( src ) || this.like( src ) || _.routineIs( src ) );
  }
  return this._makeUndefined( ... arguments );
}

//

function _makeZeroed( src, length )
{
  if( arguments.length === 2 )
  {
    if( !_.numberIs( length ) )
    {
      if( _.numberIs( length.length ) )
      length = length.length;
      else
      length = [ ... length ].length;
    }
    if( _.argumentsArray.is( src ) )
    return _.argumentsArray._makeZeroed( src, length );
    if( _.unroll.is( src ) )
    return _.unroll._makeZeroed( src, length );
    if( _.routineIs( src ) )
    {
      let result = fill( new src( length ) );
      _.assert( _.long.is( result ) );
      return result;
    }
    if( src === null )
    return this.tools.defaultLong.makeZeroed( length );
    return fill( new src.constructor( length ) );
  }
  else if( arguments.length === 1 )
  {
    let constructor;
    if( this.like( src ) )
    {
      if( _.argumentsArray.is( src ) )
      return _.argumentsArray._makeZeroed( src );
      if( _.unroll.is( src ) )
      return _.unroll._makeZeroed( src );
      constructor = src.constructor;
      length = src.length;
    }
    else
    {
      return this.tools.defaultLong.makeZeroed( src );
    }
    return fill( new constructor( length ) );
  }

  return this.tools.defaultLong.make();

  /* */

  function fill( dst )
  {
    let l = dst.length;
    for( let i = 0 ; i < l ; i++ )
    dst[ i ] = 0;
    return dst;
  }
}

//

/* qqq2 : for junior : cover please */
/* qqq : for junior : extend with test cases with countable in 2nd arg */
function makeZeroed( src, length )
{
  // _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  _.assert( 0 <= arguments.length && arguments.length <= 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || _.countable.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === null || _.numberIs( src ) || this.like( src ) || _.routineIs( src ) );
  }
  return this._makeZeroed( ... arguments );
}

//

function _makeFilling( type, value, length )
{
  if( arguments.length === 2 )
  {
    value = arguments[ 0 ];
    length = arguments[ 1 ];

    if( this.like( length ) )
    type = length;
    else
    type = null;
  }

  if( !_.number.is( length ) )
  if( _.long.is( length ) )
  length = length.length;
  else if( _.countable.is( length ) )
  length = [ ... length ].length;

  let result = this.make( type, length );
  for( let i = 0 ; i < length ; i++ )
  result[ i ] = value;

  return result;
}

//

function makeFilling( type, value, length )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 2 )
  {
    _.assert( _.number.is( value ) || _.countable.is( value ) );
    _.assert( type !== undefined );
  }
  else
  {
    _.assert( value !== undefined );
    _.assert( _.number.is( length ) || _.countable.is( length ) );
    _.assert( type === null || _.routine.is( type ) || this.like( type ) );
  }

  return this._makeFilling( ... arguments );
}

//

function _make( src, length )
{

  if( arguments.length === 2 )
  {
    let data = length;
    if( _.numberIs( length ) )
    {
      data = src;
    }
    else
    {
      if( _.numberIs( length.length ) )
      {
        length = length.length;
      }
      else
      {
        data = [ ... length ];
        length = data.length;
      }
    }
    if( _.argumentsArray.is( src ) )
    return fill( _.argumentsArray.make( length ), data );
    if( _.unroll.is( src ) )
    return fill( _.unroll.make( length ), data );
    if( src === null )
    return fill( this.tools.defaultLong.make( length ), data );
    let result;
    if( _.routineIs( src ) )
    result = fill( new src( length ), data )
    else if( src.constructor )
    result = fill( new src.constructor( length ), data );
    _.assert( _.long.is( result ), 'Not clear how to make such long' );
    return result;
  }
  else if( src !== undefined && src !== null )
  {
    if( _.argumentsArray.is( src ) )
    return _.argumentsArray.make( src );
    if( _.unroll.is( src ) )
    return _.unroll.make( src );
    if( _.numberIs( src ) )
    return this.tools.defaultLong.make( src );
    if( _.routineIs( src ) )
    return new src();
    if( src.constructor === Array )
    return [ ... src ];
    return new src.constructor( src );
  }

  return this.tools.defaultLong.make();

  /* */

  function fill( dst, data )
  {
    if( data === null || data === undefined )
    return dst;
    let l = Math.min( length, data.length );
    for( let i = 0 ; i < l ; i++ )
    dst[ i ] = data[ i ];
    return dst;
  }

}

//

/* qqq2 : for junior : full implementation and coverage are required */
/* qqq : for junior : extend with test cases with countable in 2nd arg */
function make( src, length )
{
  _.assert( arguments.length <= 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || _.countable.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === null || _.numberIs( src ) || _.long.is( src ) || _.routineIs( src ) );
  }
  return this._make( ... arguments );
}

//

/* qqq2 : for junior : full implementation and coverage are required */
function _cloneShallow( src )
{
  if( _.argumentsArray.is( src ) )
  return _.argumentsArray.make( src );
  if( _.unroll.is( src ) )
  return _.unroll.make( src );
  // if( _.numberIs( src ) ) /* Dmytro : wrong branch, public interface forbids numbers as argument */
  // return this.tools.defaultLong.make( src );
  if( src.constructor === Array )
  return [ ... src ];
  else
  return new src.constructor( src );
}

//

function cloneShallow( src )
{
  _.assert( this.like( src ) );
  _.assert( arguments.length === 1 );
  return this._cloneShallow( src );
}

//

function from( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( this.is( src ) )
  return src;
  if( src === null )
  return this.make( null );
  return this.make( null, src );
}

// --
// long sequential search
// --

function leftIndex( /* arr, ins, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let fromIndex = 0;

  if( _.number.is( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5, 'Expects 2-5 arguments: source array, element, and optional evaluator / equalizer' );
  _.assert( _.longLike( arr ), 'Expect a Long' );
  _.assert( _.number.is( fromIndex ) );
  _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 || evaluator1.length === 3 );
  _.assert( !evaluator1 || _.routine.is( evaluator1 ) );
  _.assert( !evaluator2 || evaluator2.length === 1 );
  _.assert( !evaluator2 || _.routine.is( evaluator2 ) );

  if( !evaluator1 )
  {
    _.assert( !evaluator2 );
    return Array.prototype.indexOf.call( arr, ins, fromIndex );
  }
  else if( evaluator1.length === 1 ) /* equalizer */
  {

    if( evaluator2 )
    ins = evaluator2( ins );
    else
    ins = evaluator1( ins );

    if( arr.findIndex && fromIndex === 0 )
    {
      return arr.findIndex( ( val ) => evaluator1( val ) === ins );
    }
    else
    {
      for( let a = fromIndex; a < arr.length ; a++ )
      {
        if( evaluator1( arr[ a ] ) === ins )
        return a;
      }
    }

  }
  else /* evaluator */
  {
    _.assert( !evaluator2 );
    for( let a = fromIndex ; a < arr.length ; a++ )
    {
      if( evaluator1( arr[ a ], ins ) )
      return a;
    }
  }

  return -1;
}

//

function rightIndex( /* arr, ins, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let evaluator1 = arguments[ 2 ];
  let evaluator2 = arguments[ 3 ];

  let fromIndex = arr.length-1;

  if( _.number.is( arguments[ 2 ] ) )
  {
    fromIndex = arguments[ 2 ];
    evaluator1 = arguments[ 3 ];
    evaluator2 = arguments[ 4 ];
  }

  _.assert( 2 <= arguments.length && arguments.length <= 5, 'Expects 2-5 arguments: source array, element, and optional evaluator / equalizer' );
  _.assert( _.number.is( fromIndex ) );
  _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 || evaluator1.length === 3 );
  _.assert( !evaluator1 || _.routine.is( evaluator1 ) );
  _.assert( !evaluator2 || evaluator2.length === 1 );
  _.assert( !evaluator2 || _.routine.is( evaluator2 ) );

  if( !evaluator1 )
  {
    _.assert( !evaluator2 );
    return Array.prototype.lastIndexOf.call( arr, ins, fromIndex );
  }
  else if( evaluator1.length === 1 ) /* equalizer */
  {

    if( evaluator2 )
    ins = evaluator2( ins );
    else
    ins = evaluator1( ins );

    for( let a = fromIndex ; a >= 0 ; a-- )
    {
      if( evaluator1( arr[ a ] ) === ins )
      return a;
    }

  }
  else /* evaluator */
  {
    _.assert( !evaluator2 );
    for( let a = fromIndex ; a >= 0 ; a-- )
    {
      if( evaluator1( arr[ a ], ins ) )
      return a;
    }
  }

  return -1;
}

//

/**
 * The routine longLeft() returns a new object containing the properties, (index, element),
 * corresponding to a found value {-ins-} from a Long {-arr-}.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 * @param { * } ins - An element to locate in the {-arr-}.
 * @param { Number } fromIndex - An index from which routine starts search left to right.
 * If {-fromIndex-} not defined, then routine starts search from the first index.
 * @param { Function } evaluator1 - It's a callback. If the routine has two parameters,
 * it is used as an equalizer, and if it has only one, then routine is used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the {-ins-} to search.
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], 2 );
 * // returns { index : 1, element : 2 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], [ 2 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], 2, 3 );
 * // returns { index : 4, element : 2 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], [ 2 ], ( val ) => val[ 0 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longLeft( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( val ) => val[ 0 ] );
 * // returns { index : 1, element : [ 2 ] }
 *
 * @example
 * _.longLeft( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( val ) => val - 3, ( ins ) => ins[ 0 ] );
 * // returns { index : 5, element : 5 }
 *
 * @example
 * _.longLeft( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], 3, ( val ) => val + 1, ( ins ) => ins[ 0 ] );
 * // returns { index : 5, element : 5 }
 *
 * @example
 * _.longLeft( [ 1, 2, false, 'str', 2, 5 ], 2, ( val, ins ) => val === ins );
 * // returns { index : 1, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value {-ins-} from the array {-arr-}.
 * Otherwise, it returns the object with property (index), which value is -1.
 * @function longLeft
 * @throws { Error } If arguments.length is less then two or more then five.
 * @throws { Error } If {-fromIndex-} is not a number.
 * @throws { Error } If {-onEvaluate1-} is not a routine.
 * @throws { Error } If {-onEvaluate1-} is undefines and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate1-} is evaluator and accepts less or more then one parameter.
 * @throws { Error } If {-onEvaluate1-} is equalizer and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate2-} is not a routine.
 * @throws { Error } If {-onEvaluate2-} accepts less or more then one parameter.
 * @namespace Tools
 */

function left( /* arr, ins, fromIndex, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let fromIndex = arguments[ 2 ];
  let evaluator1 = arguments[ 3 ];
  let evaluator2 = arguments[ 4 ];

  let result = Object.create( null );
  let i = _.longLeftIndex( arr, ins, fromIndex, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 5 );

  result.index = i;

  if( i >= 0 )
  result.element = arr[ i ];

  return result;
}

//

/**
 * The routine longRight() returns a new object containing the properties, (index, element),
 * corresponding to a found value {-ins-} from a Long {-arr-}.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 * @param { * } ins - An element to locate in the {-arr-}.
 * @param { Number } fromIndex - An index from which routine starts search right to left.
 * If {-fromIndex-} not defined, then routine starts search from the last index.
 * @param { Function } evaluator1 - It's a callback. If the routine has two parameters,
 * it is used as an equalizer, and if it has only one, then routine is used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the {-ins-} to search.
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], 2 );
 * // returns { index : 4, element : 2 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], [ 2 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], 2, 3 );
 * // returns { index : 1, element : 2 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], [ 2 ], ( val ) => val[ 0 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRight( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( val ) => val[ 0 ] );
 * // returns { index : 1, element : [ 2 ] }
 *
 * @example
 * _.longRight( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], ( val ) => val - 3, ( ins ) => ins[ 0 ] );
 * // returns { index : 5, element : 5 }
 *
 * @example
 * _.longRight( [ 1, [ 2 ], false, 'str', 2, 5 ], [ 2 ], 4, ( val ) => val - 3, ( ins ) => ins[ 0 ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRight( [ 1, 2, false, 'str', 2, 5 ], 2, ( val, ins ) => val === ins );
 * // returns { index : 4, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value {-ins-} from the array {-arr-}.
 * Otherwise, it returns the object with property (index), which value is -1.
 * @function longRight
 * @throws { Error } If arguments.length is less then two or more then five.
 * @throws { Error } If {-fromIndex-} is not a number.
 * @throws { Error } If {-onEvaluate1-} is not a routine.
 * @throws { Error } If {-onEvaluate1-} is undefines and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate1-} is evaluator and accepts less or more then one parameter.
 * @throws { Error } If {-onEvaluate1-} is equalizer and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate2-} is not a routine.
 * @throws { Error } If {-onEvaluate2-} accepts less or more then one parameter.
 * @namespace Tools
 */

function right( /* arr, ins, fromIndex, evaluator1, evaluator2 */ )
{
  let arr = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let fromIndex = arguments[ 2 ];
  let evaluator1 = arguments[ 3 ];
  let evaluator2 = arguments[ 4 ];

  let result = Object.create( null );
  let i = _.longRightIndex( arr, ins, fromIndex, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 5 );

  result.index = i;

  if( i >= 0 )
  result.element = arr[ i ];

  return result;
}

//

/**
 * The routine longLeftDefined() returns a new object containing the properties, (index, element),
 * of first left element in a Long {-arr-}, which value is not equal to undefined.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 *
 * @example
 * _.longLeftDefined( [ undefined, undefined, undefined, undefined, undefined ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longLeftDefined( [ 1, undefined, 2, false, 'str', 2, undefined, 5 ] );
 * // returns { index : 0, element : 1 }
 *
 * @example
 * _.longLeftDefined( [ undefined, undefined, 2, false, 'str', 2 ] );
 * // returns { index : 2, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * of first left element in a Long {-arr-}, which value is not equal to undefined.
 * Otherwise, it returns the object with property (index), which value is -1.
 * @function longRight
 * @throws { Error } If arguments.length is less then or more then one.
 * @namespace Tools
 */

function leftDefined( arr )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.longLeft( arr, true, function( val ){ return val !== undefined; } );
}

//

/**
 * The routine longRightDefined() returns a new object containing the properties, (index, element),
 * of first right element in a Long {-arr-}, which value is not equal to undefined.
 * If element is not founded, then routine return new object with property (index), which value is -1.
 *
 * @param { Long } arr - A Long to check.
 *
 * @example
 * _.longRightDefined( [ undefined, undefined, undefined, undefined, undefined ] );
 * // returns { index : -1 }
 *
 * @example
 * _.longRightDefined( [ 1, 2, false, 'str', 2, undefined, 5 ] );
 * // returns { index : 6, element : 5 }
 *
 * @example
 * _.longRightDefined( [ 1, 2, false, 'str', 2, undefined, undefined ] );
 * // returns { index : 4, element : 2 }
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * of first right element in a Long {-arr-}, which value is not equal to undefined.
 * Otherwise, it returns the object with property (index) which, value is -1.
 * @function longRight
 * @throws { Error } If arguments.length is less then or more then one.
 * @namespace Tools
 */

function rightDefined( arr )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  return _.longRight( arr, true, function( val ){ return val !== undefined; } );
}

// --
// meta
// --

function _namespaceRegister( namespace, defaultNamespaceName )
{

  if( Config.debug )
  verify();

  _.long.namespaces[ namespace.NamespaceName ] = namespace;

  _.assert( namespace.IsFixedLength === null || namespace.IsFixedLength === false || namespace.IsFixedLength === true );
  _.assert( namespace.IsLong === undefined || namespace.IsLong === true );
  namespace.IsLong = true;

  namespace.AsDefault = _.long._asDefaultGenerate( namespace, defaultNamespaceName );

  function verify()
  {
    _.assert( !!namespace.NamespaceName );
    _.assert( _.long.namespaces[ namespace.Name ] === undefined );
    _.assert( _[ namespace.NamespaceName ] === namespace );
    _.assert( _select( _global_, namespace.NamespaceQname ) === namespace );
  }

  function _select( src, selector )
  {
    selector = selector.split( '/' );
    while( selector.length && !!src )
    {
      src = src[ selector[ 0 ] ];
      selector.splice( 0, 1 )
    }
    return src;
  }

}

//

function _asDefaultGenerate( namespace, defaultNamespaceName )
{

  _.assert( !!namespace );
  _.assert( !!namespace.TypeName );

  if( defaultNamespaceName === undefined )
  defaultNamespaceName = 'defaultLong';

  let result = _.long.toolsNamespacesByType[ namespace.TypeName ];
  if( result )
  return result;

  result = _.long.toolsNamespacesByType[ namespace.TypeName ] = Object.create( _ );
  result[ defaultNamespaceName ] = namespace;

  _.long.toolsNamespacesByName[ namespace.NamespaceName ] = result;

  /* xxx : introduce map _.namespaces */
  for( let name in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ name ];
    result[ namespace.TypeName ] = Object.create( namespace );
    result[ namespace.TypeName ].tools = result;
  }

  result.long = Object.create( _.long );
  result.long.tools = result;
  // _.withLong[ namespace.TypeName ] = result;

  return result;
}

// --
// declare
// --

let ToolsExtension =
{

  // dichotomy

  longIs : is.bind( _.long ),
  longIsEmpty : isEmpty.bind( _.long ),
  longIsPopulated : isPopulated.bind( _.long ),
  longLike : like.bind( _.long ),

  // maker

  longMakeEmpty : makeEmpty.bind( _.long ),
  longMakeUndefined : makeUndefined.bind( _.long ),
  longMakeZeroed : makeZeroed.bind( _.long ),
  longMakeFilling : makeFilling.bind( _.long ),
  longMake : make.bind( _.long ),
  longCloneShallow : cloneShallow.bind( _.long ),
  longFrom : from.bind( _.long ),

  // long sequential search

  longLeftIndex : leftIndex,
  longRightIndex : rightIndex,

  longLeft : left,
  longRight : right,

  longLeftDefined : leftDefined,
  longRightDefined : rightDefined,

}

Object.assign( _, ToolsExtension );

//

let LongExtension =
{

  //

  NamespaceName : 'long',
  NamespaceQname : 'wTools/long',
  MoreGeneralNamespaceName : 'long',
  MostGeneralNamespaceName : 'countable',
  TypeName : 'Long',
  SecondTypeName : 'Long',
  InstanceConstructor : null,
  IsFixedLength : null,
  IsLong : true,
  tools : _,

  // dichotomy

  is,
  isEmpty,
  isPopulated,
  like,
  isFixedLength,

  // maker

  _makeEmpty,
  makeEmpty, /* qqq : for junior : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for junior : cover */
  _makeZeroed,
  makeZeroed, /* qqq : for junior : cover */
  _makeFilling,
  makeFilling,
  _make,
  make, /* qqq : for junior : cover */
  _cloneShallow,
  cloneShallow, /* qqq : for junior : cover */
  from, /* qqq : for junior : cover */

  // long sequential search

  leftIndex,
  rightIndex,

  left,
  right,

  leftDefined,
  rightDefined,

  // meta

  _namespaceRegister,
  _asDefaultGenerate,

}

//

Object.assign( _.long, LongExtension );

})();
