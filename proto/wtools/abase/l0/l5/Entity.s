( function _l5_Entity_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.entity = _.entity || Object.create( null );

// --
//
// --

function makeEmpty( src )
{

  _.assert( arguments.length === 1 );

  if( _.arrayIs( src ) )
  {
    return new Array();
  }
  else if( _.longIs( src ) )
  {
    return this.tools.longMakeEmpty( src );
  }
  else if( _.setIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.hashMapIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.mapLike( src ) )
  {
    return Object.create( null );
  }
  else if( src === _.null )
  {
    return null;
  }
  else if( src === _.undefined )
  {
    return undefined;
  }
  else if( !src || _.primitiveIs( src ) )
  {
    return src;
  }
  else if( _.routineIs( src.constructor ) ) /* qqq2 : cover */
  {
    return new src.constructor();
  }
  else _.assert( 0, `Not clear how to make a new element of \`${_.strType( src )}\` with \`_.entity.makeEmpty()\`` );

}

//

function makeUndefined( src, length )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( _.arrayIs( src ) )
  {
    return new Array( length !== undefined ? length : src.length );
  }
  else if( _.longIs( src ) )
  {
    return this.tools.longMakeUndefined( src, length );
  }
  else if( _.setIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.hashMapIs( src ) )
  {
    return new src.constructor();
  }
  else if( _.mapLike( src ) )
  {
    return Object.create( null );
  }
  else if( src === _.null )
  {
    return null;
  }
  else if( src === _.undefined )
  {
    return undefined;
  }
  else if( !src || _.primitiveIs( src ) )
  {
    return src;
  }
  else if( _.routineIs( src.constructor ) ) /* qqq2 : cover */
  {
    return new src.constructor();
  }
  else _.assert( 0, `Not clear how to make a new element of \`${_.strType( src )}\` with \`_.entity.makeUndefined()\`` );

}

// //
//
// function makeNonConstructing( src )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//
//   if( _.arrayIs( src ) )
//   {
//     return Array.from( src );
//   }
//   else if( _.longLike( src ) )
//   {
//     return this.tools.longMake( src );
//   }
//   else if( _.hashMapLike( src ) || _.setLike( src ) )
//   {
//     return new src.constructor( src );
//   }
//   else if( _.mapLike( src ) )
//   {
//     return _.mapShallowClone( src )
//   }
//   else if( src === _.null )
//   {
//     return null;
//   }
//   else if( src === _.undefined )
//   {
//     return undefined;
//   }
//   else if( !src || _.primitiveIs( src ) )
//   {
//     return src;
//   }
//   else _.assert( 0, `Not clear how to make a new element of \`${_.strType( src )}\` with \`_.entity.make()\`` );
//
// }

//

function make( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( src ) )
  {
    return Array.from( src );
  }
  else if( _.longLike( src ) )
  {
    return this.tools.longMake( src );
  }
  else if( _.hashMapLike( src ) || _.setLike( src ) )
  {
    return new src.constructor( src );
  }
  else if( _.mapLike( src ) )
  {
    return _.mapShallowClone( src )
  }
  else if( src === _.null )
  {
    return null;
  }
  else if( src === _.undefined )
  {
    return undefined;
  }
  else if( !src || _.primitiveIs( src ) )
  {
    return src;
  }
  else if( _.routineIs( src[ shallowCloneSymbol ] ) ) /* qqq2 : cover */
  {
    return src[ shallowCloneSymbol ]();
  }
  else if( _.routineIs( src.shallowClone ) ) /* qqq2 : cover */
  {
    return src.shallowClone();
  }
  else if( _.routineIs( src.constructor ) ) /* qqq2 : cover */
  {
    return new src.constructor( src );
  }
  else _.assert( 0, `Not clear how to make a new element of \`${_.strType( src )}\` with \`_.entity.makeConstructing()\`` );

}

// //
//
// function makeConstructing( src, length )
// {
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//
//   if( _.arrayIs( src ) )
//   {
//     return new Array( length !== undefined ? length : src.length );
//   }
//   else if( _.longIs( src ) )
//   {
//     return this.tools.longMake( src, length );
//   }
//   else if( _.mapLike( src ) )
//   {
//     return Object.create( null );
//   }
//   else if( src === _.null )
//   {
//     return null;
//   }
//   else if( src === _.undefined )
//   {
//     return undefined;
//   }
//   else if( !src || _.primitiveIs( src ) )
//   {
//     return src;
//   }
//   else if( _.routineIs( src.constructor ) )
//   {
//     return new src.constructor();
//   }
//   else _.assert( 0, `Not clear how to make a new element of \`${_.strType( src )}\` with \`_.entity.makeConstructing()\`` );
//
// }

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
  _.assert( arguments.length < 3 || _.routineIs( onRecursive ) );

  if( src === null )
  {

    result = src;

  }
  else if( dst && _.routineIs( dst.copy ) )
  {

    dst.copy( src );

  }
  else if( src && _.routineIs( src.clone ) )
  {

    if( dst instanceof src.constructor )
    {
      throw _.err( 'not tested' );
      result = src.clone( dst );
    }
    else if( _.primitiveIs( dst ) || _.longIs( dst ) )
    {
      result = src.clone();
    }
    else _.assert( 0, 'unknown' );

  }
  else if( src && _.routineIs( src.slice ) )
  {

    result = src.slice();

  }
  else if( dst && _.routineIs( dst.set ) )
  {

    dst.set( src );

  }
  else if( _.objectIs( src ) )
  {

    if( onRecursive )
    {
      result = _.mapCloneAssigning
      ({
        srcMap : src,
        dstMap : _.primitiveIs( dst ) ? Object.create( null ) : dst,
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

  _.assert( _.strIs( name ) || _.symbolIs( name ) );
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

  _.assert( _.strIs( name ) || _.symbolIs( name ) );
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
// tools extension
// --

let ToolsExtension =
{

  makeEmpty,
  entityMakeEmpty : makeEmpty,
  makeUndefined,
  entityMakeUndefined : makeUndefined,
  make,
  entityMake : make,

  makeConstructing : make, /* xxx : remove later */

  // makeNonConstructing,
  // entityMakeNonConstructing : makeNonConstructing,

  // makeConstructing,
  // entityMakeConstructing : makeConstructing,
  // make : makeConstructing,
  // entityMake : makeConstructing,

  // entityEntityEqualize : equalize,
  // entityAssign2 : assign2, /* xxx : refactor */
  // entityAssign2FieldFromContainer : assign2FieldFromContainer, /* dubious */
  // entityAssign2Field : assign2Field, /* dubious */

}

//

_.mapSupplement( _, ToolsExtension );

// --
// entity extension
// --

const iteratorSymbol = _.entity.iteratorSymbol;
const typeNameGetterSymbol = _.entity.typeNameGetterSymbol;
const toPrimitiveSymbol = _.entity.toPrimitiveSymbol;
const toStrNjsSymbol = _.entity.toStrNjsSymbol;
const equalAreSymbol = _.entity.equalAreSymbol;
const shallowCloneSymbol = _.entity.shallowCloneSymbol;
const deepCloneSymbol = _.entity.deepCloneSymbol;

let EntityExtension =
{

  makeEmpty,
  makeUndefined,
  make,
  // makeNonConstructing,
  // makeConstructing,
  // make : makeConstructing,
  makeConstructing : make, /* xxx : remove later */

  equalize,

  assign2, /* xxx : refactor */
  assign2FieldFromContainer, /* dubious */
  assign2Field, /* dubious */

}

//

_.mapSupplement( _.entity, EntityExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
