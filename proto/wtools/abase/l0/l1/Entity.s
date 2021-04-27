( function _l1_Entity_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.entity = _.entity || Object.create( null );

// --
// container
// --

/**
 * Returns "length" of entity( src ). Representation of "length" depends on type of( src ):
 *  - For object returns number of it own enumerable properties;
 *  - For array or array-like object returns value of length property;
 *  - For undefined returns 0;
 *  - In other cases returns 1.
 *
 * @param { * } src - Source entity.
 *
 * @example
 * _.entity.lengthOf( [ 1, 2, 3 ] );
 * // returns 3
 *
 * @example
 * _.entity.lengthOf( 'string' );
 * // returns 1
 *
 * @example
 * _.entity.lengthOf( { a : 1, b : 2 } );
 * // returns 2
 *
 * @example
 * let src = undefined;
 * _.entity.lengthOf( src );
 * // returns 0
 *
 * @returns {number} Returns "length" of entity.
 * @function lengthOf
 * @namespace Tools
*/

function lengthOf( src )
{
  if( src === undefined )
  return 0;
  if( src === null )
  return 1;

  // if( _.routine.is( src[ Symbol.iterator ] ) )
  // return [ ... src ].length;

  if( _.vectorLike( src ) )
  return src.length;
  if( _.set.like( src ) )
  return src.size;
  if( _.hashMap.like( src ) )
  return src.size;
  if( _.countableIs( src ) )
  return [ ... src ].length;
  if( _.aux.is( src ) )
  return _.props.keys( src ).length;

  return 1;
}

// --
// tools extension
// --

let ToolsExtension =
{

  // lengthOf,
  entityLengthOf : lengthOf,

}

//

Object.assign( _, ToolsExtension );

// --
// entity extension
// --

let EntityExtension =
{

  tools : _,

  lengthOf,

}

//

Object.assign( _.entity, EntityExtension );

})();
