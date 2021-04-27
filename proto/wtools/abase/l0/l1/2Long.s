( function _l1_Long_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.assert( _.long === undefined );
_.long = _.long || Object.create( null );
_.long.namespaces = _.long.namespaces || Object.create( null );
_.long.toolsNamespaces = _.long.toolsNamespaces || Object.create( null );
_.withLong = _.withLong || Object.create( null );

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
/* qqq : for Yevhen : optimize. ask how to */
/* qqq : check coverage */
function is( src )
{

  if( _.primitive.is( src ) )
  return false;
  if( _.argumentsArray.like( src ) )
  return true;
  if( _.bufferTypedIs( src ) )
  return true;

  return false;
}

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
    return this.tools./*longDescriptor*/defaultLong.make();
    // return [];
  }
}

//

/* qqq2 : for Yevhen : cover please */
function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  {
    _.assert( this.like( src ) || _.routineIs( src ) );
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
    length = length.length;
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
      return this.tools./*longDescriptor*/defaultLong.make( src );
    }
    return new constructor( length );
  }
  else
  {
    return this.tools./*longDescriptor*/defaultLong.make();
  }
}

//

/* qqq2 : for Yevhen : cover please */
function makeUndefined( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || this.like( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || this.like( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === undefined || src === null || _.numberIs( src ) || this.like( src ) || _.routineIs( src ) );
  }
  return this._makeUndefined( ... arguments );
}

//

/* qqq2 : for Yevhen : full implementation and coverage are required */
function _make( src, length )
{

  if( arguments.length === 2 )
  {
    let data = length;
    if( _.numberIs( length ) )
    data = src;
    else
    length = length.length;
    if( _.argumentsArray.is( src ) )
    return fill( _.argumentsArray.make( length ), data );
    if( _.unroll.is( src ) )
    return fill( _.unroll.make( length ), data );
    if( src === null )
    return fill( this.tools./*longDescriptor*/defaultLong.make( length ), data );

    let result;
    if( _.routineIs( src ) )
    result = fill( new src( length ), data )
    else if( src.constructor )
    result = fill( new src.constructor( length ), data );
    _.assert( _.long.is( result ), 'Not clear how to make such long' );
    return result;
    // if( src.constructor === Array )
    // return fill( new src.constructor( length ), data );
    // _.assert( 0, 'Not clear how to make such long' );
  }
  else if( src !== undefined && src !== null )
  {
    if( _.argumentsArray.is( src ) )
    return _.argumentsArray.make( src );
    if( _.unroll.is( src ) )
    return _.unroll.make( src );
    if( _.numberIs( src ) )
    return this.tools./*longDescriptor*/defaultLong.make( src );
    if( _.routineIs( src ) )
    return new src();
    if( src.constructor === Array )
    return [ ... src ];
    return new src.constructor( src );
  }

  return this.tools./*longDescriptor*/defaultLong.make();

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

function make( src, length )
{
  _.assert( arguments.length <= 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || this.like( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || this.like( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === undefined || src === null || _.numberIs( src ) || this.like( src ) || _.routineIs( src ) );
  }
  return this._make( ... arguments );
}

//

/* qqq2 : for Yevhen : full implementation and coverage are required */
function _cloneShallow( src )
{
  if( _.argumentsArray.is( src ) )
  return _.argumentsArray.make( src );
  if( _.unroll.is( src ) )
  return _.unroll.make( src );
  if( _.numberIs( src ) )
  return this.tools./*longDescriptor*/defaultLong.make( src );
  if( src.constructor === Array )
  return [ ... src ];
  else
  return new src.constructor( src );
}

//

function cloneShallow( srcArray )
{
  _.assert( this.like( srcArray ) );
  _.assert( arguments.length === 1 );
  return this._cloneShallow( srcArray );
}

//

function from( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( this.is( src ) )
  return src;
  return this.make( src );
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

function _namespaceRegister( namespace )
{

  _.assert( !!namespace.NamespaceName );
  _.assert( _[ namespace.NamespaceName ] === namespace );
  _.assert( _.long.namespaces[ namespace.NamespaceName ] === undefined );
  _.long.namespaces[ namespace.NamespaceName ] = namespace;

  _.assert( namespace.IsLong === undefined || namespace.IsLong === true );
  namespace.IsLong = true;

  namespace.AsDefault = _.long._asDefaultGenerate( namespace );

}

//

function _asDefaultGenerate( namespace )
{

  _.assert( !!namespace );
  _.assert( !!namespace.TypeName );

  let result = _.long.toolsNamespaces[ namespace.TypeName ];

  if( result )
  return result;

  result = _.long.toolsNamespaces[ namespace.TypeName ] = Object.create( _ );
  result.defaultLong = namespace;

  for( let name in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ name ];
    result[ name ] = Object.create( namespace );
    result[ name ].tools = result;
  }

  result.long = Object.create( _.long );
  result.long.tools = result;
  _.withLong[ namespace.TypeName ] = result;

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
  TypeName : 'Long',
  SecondTypeName : 'Long',
  InstanceConstructor : null,
  tools : _,
  IsLong : true,

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
  from, /* qqq : for Yevhen : cover */

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
