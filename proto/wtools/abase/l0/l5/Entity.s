( function _l5_Entity_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.entity = _.entity || Object.create( null );

_.assert( !!_.container.cloneShallow, 'Expects routine _.container.cloneShallow' );

// --
//
// --

function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( Object.prototype.toString.call( src1 ) !== Object.prototype.toString.call( src2 ) )
  return false;

  if( src1 === src2 )
  return true;

  if( _.hashMap.like( src1 ) )
  {
    /*
      - hashMap
    */
    return _.hashMap.identicalShallow( src1, src2 )
  }
  else if( _.set.like( src1 ) )
  {
    /*
      - set
    */
    return _.set.identicalShallow( src1, src2 );
  }
  else if( _.bufferAnyIs( src1 ) )
  {
    /*
      - BufferNode
      - BufferRaw
      - BufferRawShared
      - BufferTyped
      - BufferView
      - BufferBytes
    */
    return _.buffersIdenticalShallow( src1, src2 );
  }
  else if( _.countable.is( src1 ) )
  {
    /*
      - countable
      - vector
      - long
      - array
    */
    return _.countable.identicalShallow( src1, src2 );
  }
  else if( _.object.like( src1 ) )
  {
    /*
      - objectLike
      - object

      - Map
      - Auxiliary
      - MapPure
      - MapPolluted
      - AuxiliaryPolluted
      - MapPrototyped
      - AuxiliaryPrototyped
    */
    if( _.date.is( src1 ) )
    {
      return _.date.identicalShallow( src1, src2 );
    }
    else if( _.regexp.is( src1 ) )
    {
      return _.regexp.identicalShallow( src1, src2 );
    }
    else if( _.aux.is( src1 ) )
    {
      return _.aux.identicalShallow( src1, src2 );
    }

    /* non-identical objects */
    return false;
  }
  else if( _.primitiveIs( src1 ) )
  {
    /*
      - Symbol
      - Number
      - BigInt
      - Boolean
      - String
    */

    return _.primitive.identicalShallow( src1, src2 );
  }
  else
  {
    return false;
  }
}

//

function equivalentShallow( src1, src2, options )
{
  /*
    - boolLikeTrue and boolLikeTrue - ( true, 1 )
    - boolLikeFalse and boolLikeFalse - ( false, 0 )
    - | number1 - number2 | <= accuracy
    - strings that differ only in whitespaces at the start and/or at the end
    - regexp with same source and different flags
    - countable with the same length and content
  */
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( options === undefined || _.objectLike( options ), 'Expects map of options as third argument' );

  let accuracy;

  if( options )
  accuracy = options.accuracy || undefined;

  if( _.primitiveIs( src1 ) && _.primitiveIs( src2 ) ) /* check before type comparison ( 10n & 10 and 1 & true are equivalent ) */
  {
    /*
      - Symbol
      - Number
      - BigInt
      - Boolean
      - String
    */
    return _.primitive.equivalentShallow( src1, src2, accuracy );
  }

  if( src1 === src2 )
  return true;

  if( _.bufferAnyIs( src1 ) && _.bufferAnyIs( src2 ) )
  {
    /*
      - BufferNode
      - BufferRaw
      - BufferRawShared
      - BufferTyped
      - BufferView
      - BufferBytes
    */
    return _.buffersEquivalentShallow( src1, src2 );
  }
  else if( _.hashMap.like( src1 ) && _.hashMap.like( src1 ) )
  {
    /*
      - hashMap
    */
    return _.hashMap.equivalentShallow( src1, src2 )
  }
  else if( _.set.like( src1 ) && _.set.like( src2 ) )
  {
    /*
      - set
    */
    return _.set.equivalentShallow( src1, src2 );
  }
  else if( _.countable.is( src1 ) && _.countable.is( src2 ) )
  {
    /*
      - countable
      - vector
      - long
      - array
    */
    return _.countable.equivalentShallow( src1, src2 );
  }

  if( Object.prototype.toString.call( src1 ) !== Object.prototype.toString.call( src2 ) )
  return false;

  if( _.object.like( src1 ) )
  {
    /*
      - objectLike
      - object

      - Map
      - Auxiliary
      - MapPure
      - MapPolluted
      - AuxiliaryPolluted
      - MapPrototyped
      - AuxiliaryPrototyped
    */
    if( _.date.is( src1 ) )
    {
      return _.date.equivalentShallow( src1, src2 );
    }
    else if( _.regexp.is( src1 ) )
    {
      return _.regexp.equivalentShallow( src1, src2 );
    }
    else if( _.aux.is( src1 ) )
    {
      return _.aux.equivalentShallow( src1, src2 );
    }

    /* non-identical objects */
    return false;
  }
  else
  {
    return false;
  }
}

// //
//
// function makeEmpty( src )
// {
//   _.assert( arguments.length === 1 );
//
//   if( !src || _.primitive.is( src ) )
//   {
//     return src;
//   }
//   else if( _.arrayIs( src ) )
//   {
//     return new Array();
//   }
//   else if( _.longIs( src ) )
//   {
//     // return this.tools.long.makeEmpty( src );
//     let toolsNamespace = this.Tools ? this.Tools : this;
//     return toolsNamespace.long.makeEmpty( src );
//   }
//   else if( _.set.is( src ) )
//   {
//     return new src.constructor();
//   }
//   else if( _.hashMap.is( src ) )
//   {
//     return new src.constructor();
//   }
//   else if( _.aux.is( src ) )
//   {
//     return Object.create( null );
//   }
//   // else if( src === _.null )
//   // {
//   //   return null;
//   // }
//   // else if( src === _.undefined )
//   // {
//   //   return undefined;
//   // }
//   // else if( !src || _.primitive.is( src ) )
//   // {
//   //   return src;
//   // }
//   else if( _.routine.is( src.constructor ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for entities with constructor */
//   {
//     return new src.constructor();
//   }
//   else _.assert( 0, `Not clear how to make a new element of \`${_.entity.strType( src )}\` with \`_.entity.makeEmpty()\`` );
//
// }
//
// //
//
// function makeUndefined( src, length )
// {
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//
//   if( !src || _.primitive.is( src ) )
//   {
//     return src;
//   }
//   else if( _.arrayIs( src ) )
//   {
//     return new Array( length !== undefined ? length : src.length );
//   }
//   else if( _.longIs( src ) )
//   {
//     // return this.tools.long.makeUndefined( src, length );
//     let toolsNamespace = this.Tools ? this.Tools : this;
//     return toolsNamespace.long.makeUndefined( src, length );
//   }
//   else if( _.set.is( src ) )
//   {
//     return new src.constructor();
//   }
//   else if( _.hashMap.is( src ) )
//   {
//     return new src.constructor();
//   }
//   else if( _.aux.is( src ) )
//   {
//     return Object.create( null );
//   }
//   // else if( src === _.null )
//   // {
//   //   return null;
//   // }
//   // else if( src === _.undefined )
//   // {
//   //   return undefined;
//   // }
//   // else if( !src || _.primitive.is( src ) )
//   // {
//   //   return src;
//   // }
//   else if( _.routine.is( src.constructor ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for entities with constructor */
//   {
//     return new src.constructor();
//   }
//   else _.assert( 0, `Not clear how to make a new element of \`${_.entity.strType( src )}\` with \`_.entity.makeUndefined()\`` );
// }
//
// // //
// //
// // function makeNonConstructing( src )
// // {
// //   _.assert( arguments.length === 1, 'Expects single argument' );
// //
// //   if( _.arrayIs( src ) )
// //   {
// //     return Array.from( src );
// //   }
// //   else if( _.longLike( src ) )
// //   {
// //     return this.tools.long.make( src );
// //   }
// //   else if( _.hashMap.like( src ) || _.set.like( src ) )
// //   {
// //     return new src.constructor( src );
// //   }
// //   else if( _.aux.is( src ) )
// //   {
// //     return _.mapCloneShallow( src )
// //   }
// //   else if( src === _.null )
// //   {
// //     return null;
// //   }
// //   else if( src === _.undefined )
// //   {
// //     return undefined;
// //   }
// //   else if( !src || _.primitive.is( src ) )
// //   {
// //     return src;
// //   }
// //   else _.assert( 0, `Not clear how to make a new element of \`${_.entity.strType( src )}\` with \`_.entity.make()\`` );
// //
// // }
//
// //
//
// function cloneShallow( src )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//
//   if( !src || _.primitive.is( src ) )
//   {
//     return src;
//   }
//   else if( _.arrayIs( src ) )
//   {
//     return Array.from( src );
//   }
//   else if( _.longLike( src ) )
//   {
//     let toolsNamespace = this.Tools ? this.Tools : this;
//     return toolsNamespace.long.make( src );
//   }
//   else if( _.hashMap.like( src ) || _.set.like( src ) )
//   {
//     return new src.constructor( src );
//   }
//   else if( _.aux.is( src ) )
//   {
//     return _.mapCloneShallow( src )
//   }
//   // else if( src === _.null )
//   // {
//   //   return null;
//   // }
//   // else if( src === _.undefined )
//   // {
//   //   return undefined;
//   // }
//   // else if( !src || _.primitive.is( src ) )
//   // {
//   //   return src;
//   // }
//   else if( _.routine.is( src[ _.class.cloneShallowSymbol ] ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for objects with method under symbol cloneShallowSymbol */
//   {
//     return src[ _.class.cloneShallowSymbol ]();
//   }
//   else if( _.routine.is( src.cloneShallow ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for objects with method cloneShallow */
//   {
//     return src.cloneShallow();
//   }
//   else if( _.routine.is( src.constructor ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for entities with constructor */
//   {
//     return new src.constructor( src );
//   }
//   else _.assert( 0, `Not clear how to make a new element of \`${_.entity.strType( src )}\` with \`_.entity.cloneShallow()\`` );
//
// }

//

function cloneDeep( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !src || _.primitive.is( src ) )
  {
    return src;
  }
  else if( _.replicate )
  {
    return _.replicate( src );
  }
  else if( _.routine.is( src[ _.class.cloneDeepSymbol ] ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for objects with method under symbol cloneShallowSymbol */
  {
    return src[ _.class.cloneDeepSymbol ]();
  }
  else if( _.routine.is( src.cloneDeep ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for objects with method cloneShallow */
  {
    return src.cloneDeep();
  }
  else if( _.arrayIs( src ) )
  {
    return Array.from( src );
  }
  else if( _.longLike( src ) )
  {
    let toolsNamespace = this.Tools ? this.Tools : this;
    return toolsNamespace.long.make( src );
  }
  else if( _.hashMap.like( src ) || _.set.like( src ) )
  {
    return new src.constructor( src );
  }
  else if( _.aux.is( src ) )
  {
    return _.aux.cloneShallow( src );
  }
  // else if( src === _.null )
  // {
  //   return null;
  // }
  // else if( src === _.undefined )
  // {
  //   return undefined;
  // }
  // else if( !src || _.primitive.is( src ) )
  // {
  //   return src;
  // }
  else if( _.routine.is( src.constructor ) ) /* aaa2 : cover */ /* Dmytro : coverage extended for entities with constructor */
  {
    return new src.constructor( src );
  }
  else _.assert( 0, `Not clear how to make a new element of \`${_.entity.strType( src )}\` with \`_.entity.cloneDeep()\`` );

}

//

/**
 * The routine equalize() checks equality of two entities {-src1-} and {-src2-}.
 * Routine accepts callbacks {-onEvaluate1-} and {-onEvaluate2-}, which apply to
 * entities {-src1-} and {-src2-}. The values returned by callbacks are compared with each other.
 * If callbacks is not passed, then routine compares {-src1-} and {-src2-} directly.
 *
 * @param { * } src1 - First entity to compare.
 * @param { * } src2 - Second entity to compare.
 * @param { Function } onEvaluate - It's a callback. If the routine has two parameters,
 * it is used as an equalizer, and if it has only one, then routine is used as the evaluator.
 * @param { Function } onEvaluate2 - The second part of evaluator. Accepts the {-src2-} to search.
 *
 * @example
 * _.entity.equalize( 1, 1 );
 * // returns true
 *
 * @example
 * _.entity.equalize( 1, 'str' );
 * // returns false
 *
 * @example
 * _.entity.equalize( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 * // returns false
 *
 * @example
 * _.entity.equalize( [ 1, 2, 3 ], [ 1, 2, 3 ], ( e ) => e[ 0 ] );
 * // returns true
 *
 * @example
 * _.entity.equalize( [ 1, 2, 3 ], [ 1, 2, 3 ], ( e1, e2 ) => e1[ 0 ] > e2[ 2 ] );
 * // returns false
 *
 * @example
 * _.entity.equalize( [ 1, 2, 3 ], [ 1, 2, 3 ], ( e1 ) => e1[ 2 ], ( e2 ) => e2[ 2 ] );
 * // returns true
 *
 * @returns { Boolean } - Returns boolean value of equality of two entities.
 * @function equalize
 * @throws { Error } If arguments.length is less then two or more then four.
 * @throws { Error } If {-onEvaluate1-} is not a routine.
 * @throws { Error } If {-onEvaluate1-} is undefines and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate1-} is evaluator and accepts less or more then one parameter.
 * @throws { Error } If {-onEvaluate1-} is equalizer and onEvaluate2 provided.
 * @throws { Error } If {-onEvaluate2-} is not a routine.
 * @throws { Error } If {-onEvaluate2-} accepts less or more then one parameter.
 * @namespace Tools.entity
 */

function equalize( /* src1, src2, onEvaluate1, onEvaluate2 */ )
{
  let src1 = arguments[ 0 ];
  let src2 = arguments[ 1 ];
  let onEvaluate1 = arguments[ 2 ];
  let onEvaluate2 = arguments[ 3 ];

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( !onEvaluate1 )
  {
    _.assert( !onEvaluate2 );
    return Object.is( src1, src2 );
  }
  else if( onEvaluate1.length === 2 ) /* equalizer */
  {
    _.assert( !onEvaluate2 );
    return onEvaluate1( src1, src2 );
  }
  else /* evaluator */
  {
    if( !onEvaluate2 )
    onEvaluate2 = onEvaluate1;
    _.assert( onEvaluate1.length === 1 );
    _.assert( onEvaluate2.length === 1 );
    return onEvaluate1( src1 ) === onEvaluate2( src2 );
  }

}

//

/**
 * Copies entity( src ) into( dst ) or returns own copy of( src ).Result depends on several moments:
 * -If( src ) is a Object - returns clone of( src ) using ( onRecursive ) callback function if its provided;
 * -If( dst ) has own 'copy' routine - copies( src ) into( dst ) using this routine;
 * -If( dst ) has own 'set' routine - sets the fields of( dst ) using( src ) passed to( dst.set );
 * -If( src ) has own 'clone' routine - returns clone of( src ) using ( src.clone ) routine;
 * -If( src ) has own 'slice' routine - returns result of( src.slice ) call;
 * -Else returns a copy of entity( src ).
 *
 * @param {object} dst - Destination object.
 * @param {object} src - Source object.
 * @param {routine} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = { set : function( src ) { this.str = src.src } };
 * let src = { src : 'string' };
 *  _.entity.assign2( dst, src );
 * console.log( dst.str )
 * // log "string"
 *
 * @example
 * let dst = { copy : function( src ) { for( let i in src ) this[ i ] = src[ i ] } }
 * let src = { src : 'string', num : 123 }
 *  _._.entity.assign2( dst, src );
 * console.log( dst )
 * // log Object { src: "string", num: 123 }
 *
 * @example
 *  _._.entity.assign2( null, new String( 'string' ) );
 * // returns 'string'
 *
 * @function assign
 * @throws {exception} If( arguments.length ) is not equal to 3 or 2.
 * @throws {exception} If( onRecursive ) is not a Routine.
 * @namespace Tools.entity
 *
 */

function assign2( dst, src, onRecursive )
{
  let result;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( arguments.length < 3 || _.routine.is( onRecursive ) );

  if( src === null )
  {

    result = src;

  }
  else if( dst && _.routine.is( dst.copy ) )
  {

    dst.copy( src );

  }
  else if( src && _.routine.is( src.clone ) )
  {

    if( dst instanceof src.constructor )
    {
      throw _.err( 'not tested' );
      result = src.clone( dst );
    }
    else if( _.primitive.is( dst ) || _.longIs( dst ) )
    {
      result = src.clone();
    }
    else _.assert( 0, 'unknown' );

  }
  else if( src && _.routine.is( src.slice ) )
  {

    result = src.slice();

  }
  else if( dst && _.routine.is( dst.set ) )
  {

    dst.set( src );

  }
  else if( _.object.is( src ) )
  {

    if( onRecursive )
    {
      result = _.mapCloneAssigning
      ({
        srcMap : src,
        dstMap : _.primitive.is( dst ) ? Object.create( null ) : dst,
        onField : onRecursive
      });
    }
    else
    {
      result = _.mapCloneAssigning({ srcMap : src });
    }

  }
  else
  {

    result = src;

  }

  return result;
}

//

/**
 * Short-cut for _.entity.assign2 function. Copies specified( name ) field from
 * source container( srcContainer ) into( dstContainer ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcContainer - Source object.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * _.entity.assign2FieldFromContainer( dst, src, name );
 * console.log( dst.a === src.a );
 * // log true
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * function onRecursive( dstContainer, srcContainer, key )
 * {
 *   _.assert( _.strIs( key ) );
 *   dstContainer[ key ] = srcContainer[ key ];
 * };
 * _.entity.assign2FieldFromContainer( dst, src, name, onRecursive );
 * console.log( dst.a === src.a );
 * // log true
 *
 * @function assignFieldFromContainer
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @namespace Tools.entity
 *
 */

function assign2FieldFromContainer( /* dstContainer, srcContainer, name, onRecursive */ )
{
  let dstContainer = arguments[ 0 ];
  let srcContainer = arguments[ 1 ];
  let name = arguments[ 2 ];
  let onRecursive = arguments[ 3 ];
  let result;

  _.assert( _.strIs( name ) || _.symbol.is( name ) );
  _.assert( arguments.length === 3 || arguments.length === 4 );

  let dstValue = Object.hasOwnProperty.call( dstContainer, name ) ? dstContainer[ name ] : undefined;
  let srcValue = srcContainer[ name ];

  if( onRecursive )
  result = _.entity.assign2( dstValue, srcValue, onRecursive );
  else
  result = _.entity.assign2( dstValue, srcValue );

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

/**
 * Short-cut for _.entity.assign2 function. Assigns value of( srcValue ) to container( dstContainer ) field specified by( name ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcValue - Source value.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entity field assignment operation.
 *
 * @example
 * let dstContainer = { a : 1 };
 * let srcValue = 15;
 * let name = 'a';
 * _.entity.assign2Field( dstContainer, srcValue, name );
 * console.log( dstContainer.a );
 * // log 15
 *
 * @function assignField
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @namespace Tools
 *
 */

function assign2Field( /* dstContainer, srcValue, name, onRecursive */ )
{
  let dstContainer = arguments[ 0 ];
  let srcValue = arguments[ 1 ];
  let name = arguments[ 2 ];
  let onRecursive = arguments[ 3 ];

  let result;

  _.assert( _.strIs( name ) || _.symbol.is( name ) );
  _.assert( arguments.length === 3 || arguments.length === 4 );

  let dstValue = dstContainer[ name ];

  if( onRecursive )
  {
    throw _.err( 'not tested' );
    result = _.entity.assign2( dstValue, srcValue, onRecursive );
  }
  else
  {
    result = _.entity.assign2( dstValue, srcValue );
  }

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

// --
// meta
// --

function namespaceFor( container ) /* qqq for Yevhen : cover please */
{
  _.assert( arguments.length === 1 );
  if( _.primitive.is( container ) )
  return _.itself;
  else if( _.hashMap.like( container ) )
  return _.hashMap;
  else if( _.set.like( container ) )
  return _.set;
  else if( _.longIs( container ) )
  return _.long;
  else if( _.countableIs( container ) )
  return _.countable;
  else if( _.mapIs( container ) )
  return _.map;
  else if( _.auxIs( container ) )
  return _.aux;
  else
  return _.props;
}

// --
// tools extension
// --

let ToolsExtension =
{

  // entityIdenticalShallow : identicalShallow,
  //
  // makeEmpty,
  // entityMakeEmpty : makeEmpty,
  // makeUndefined,
  // entityMakeUndefined : makeUndefined,
  //
  // make : cloneShallow,
  // entityMake : cloneShallow, /* xxx : remove the alias */
  // cloneShallow, /* xxx */
  //
  // cloneDeep,

}

//

_.props.supplement( _, ToolsExtension );

// --
// entity extension
// --

let EntityExtension =
{

  identicalShallow,
  equivalentShallow,

  // makeEmpty,
  // makeUndefined,
  // make : cloneShallow, /* xxx */
  // cloneShallow,

  cloneDeep,

  equalize,

  assign2, /* xxx : refactor */
  assign2FieldFromContainer, /* dubious */
  assign2Field, /* dubious */

  // meta

  namespaceFor,

  // container interface

  cloneShallow : _.container.cloneShallow, /* qqq : cover */
  make : _.container.make, /* qqq : cover */
  makeEmpty : _.container.makeEmpty, /* qqq : cover */
  makeUndefined : _.container.makeUndefined, /* qqq : cover */
  empty : _.container.empty, /* qqq : cover */

  elementWithCardinal : _.container.elementWithCardinal, /* qqq : cover */
  elementWithKey : _.container.elementWithKey, /* qqq : cover */
  elementWithImplicit : _.container.elementWithImplicit, /* qqq : cover */
  elementWithCardinalSet : _.container.elementWithCardinalSet, /* qqq : cover */
  elementSet : _.container.elementSet, /* qqq : cover */

  each : _.container.each, /* qqq : cover */
  eachLeft : _.container.eachLeft, /* qqq : cover */
  eachRight : _.container.eachRight, /* qqq : cover */

  while : _.container.while, /* qqq : cover */
  whileLeft : _.container.whileLeft, /* qqq : cover */
  whileRight : _.container.whileRight, /* qqq : cover */

  aptLeft : _.container.aptLeft, /* qqq : cover */
  first : _.container.first, /* qqq : cover */
  aptRight : _.container.aptRight, /* qqq : cover */
  last : _.container.last, /* qqq : cover */

}

//

_.props.supplement( _.entity, EntityExtension );

})();
