( function _l1_Object_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_global_.wTools.object = _global_.wTools.object || Object.create( null );

// --
// dichotomy
// --

/**
 * Function is checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * let obj = { x : 100 };
 * _.object.is(obj);
 * // returns true
 *
 * @example
 * _.object.is( 10 );
 * // returns false
 *
 * @param { * } src.
 * @return { Boolean }.
 * @function is
 * @namespace Tools
 */

function is( src )
{
  return Object.prototype.toString.call( src ) === '[object Object]';
}

//

function like( src ) /* xxx : qqq : for Yevhen : optimize */
{

  if( _.object.is( src ) )
  return true;

  if( _.primitive.is( src ) )
  return false;

  if( _.vector.is( src ) )
  return false;

  if( _.routine.isTrivial( src ) )
  return false;

  if( _.set.is( src ) )
  return false;

  if( _.hashMap.is( src ) )
  return false;

  return true;
}

//

function likeStandard( src ) /* xxx : qqq : for Yevhen : optimize */
{

  if( _.primitive.is( src ) )
  return false;
  if( _.vector.is( src ) )
  return false;
  if( _.routine.isTrivial( src ) )
  return false;
  if( _.set.is( src ) )
  return false;
  if( _.hashMap.is( src ) )
  return false;

  if( _.date.is( src ) )
  return true
  if( _.regexpIs( src ) )
  return true
  if( _.bufferAnyIs( src ) )
  return true

  return false;
}

//

function isEmpty( src )
{
  if( !this.like( src ) )
  return false;
  return this.keys( src ).length === 0;
}

//

function isPopulated( src )
{
  if( !this.like( src ) )
  return false;
  return this.keys( src ).length > 0;
}

// --
// maker
// --

function _makeEmpty( src )
{
  return new src.constructor();
}

//

function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  _.assert( this.like( src ) );
  return this._makeEmpty( src );
}

//

function _makeUndefined( src )
{
  return new src.constructor();
}

//

function makeUndefined( src, length )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  {
    _.assert( this.like( src ) );
    _.assert( _.number.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( this.like( src ) );
  }

  return this._makeUndefined( src );
}

//

function _make( src, length )
{
  if( arguments.length === 1 || ( arguments.length === 2 && length === 1 ) )
  return this._cloneShallow( src );
  if( _.aux.is( src ) )
  return _.aux._cloneShallow( src );
  return new src.constructor( ... arguments );
}

//

function make( src, length )
{
  _.assert( this.like( src ) );
  _.assert( arguments.length >= 1 );
  _.assert( !_.aux.is( src ) || arguments.length === 1 || ( arguments.length === 2 && length === 1) );
  return this._make( ... arguments );
}

//

function _cloneShallow( src )
{
  let method = _.class.methodCloneShallowOf( src );
  if( method )
  return method.call( src );
  if( _.aux.is( src ) )
  return _.aux._cloneShallow( src );
  return new src.constructor( src );
}

// --
// extension
// --

let ToolsExtension =
{

  // dichotomy

  objectIs : is.bind( _.object ),
  objectIsEmpty : isEmpty.bind( _.object ),
  objectIsPopulated : isPopulated.bind( _.object ),
  objectLike : like.bind( _.object ),
  objectLikeStandard : likeStandard.bind( _.object ),

  // maker

  objectMakeEmpty : makeEmpty.bind( _.object ),
  objectMakeUndefined : makeUndefined.bind( _.object ),
  objectMake : make.bind( _.object ),
  objectCloneShallow : _.props.cloneShallow.bind( _.object ),
  objectFrom : _.props.from.bind( _.object ),

}

Object.assign( _, ToolsExtension );

//

let ObjectExtension =
{

  //

  NamespaceName : 'object',
  TypeName : 'Object',
  SecondTypeName : 'Object',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is,
  like,
  likeStandard,

  isEmpty, /* qqq : cover */
  isPopulated, /* qqq : cover */

  // maker

  _makeEmpty,
  makeEmpty, /* qqq : for Yevhen : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for Yevhen : cover */
  _make,
  make, /* qqq : for Yevhen : cover */
  _cloneShallow,
  cloneShallow : _.props.cloneShallow, /* qqq : for Yevhen : cover */
  from : _.props.from, /* qqq : for Yevhen : cover */

  // properties

  _keys : _.props._keys, /* qqq : for Yevhen : cover */
  keys : _.props.keys, /* qqq : for Yevhen : cover */
  onlyOwnKeys : _.props.onlyOwnKeys, /* qqq : for Yevhen : cover */
  // onlyEnumerableKeys : _.props.onlyEnumerableKeys, /* qqq : for Yevhen : implement and cover properly */
  allKeys : _.props.allKeys, /* qqq : for Yevhen : cover */

  _vals : _.props._vals, /* qqq : for Yevhen : cover */
  vals : _.props.vals, /* qqq : for Yevhen : cover */
  onlyOwnVals : _.props.onlyOwnVals, /* qqq : for Yevhen : cover */
  // onlyEnumerableVals : _.props.onlyEnumerableVals, /* qqq : for Yevhen : implement and cover properly */
  allVals : _.props.allVals, /* qqq : for Yevhen : cover */

  _pairs : _.props._pairs, /* qqq : for Yevhen : cover */
  pairs : _.props.pairs, /* qqq : for Yevhen : cover */
  onlyOwnPairs : _.props.onlyOwnPairs, /* qqq : for Yevhen : cover */
  // onlyEnumerablePairs : _.props.onlyEnumerablePairs, /* qqq : for Yevhen : implement and cover properly */
  allPairs : _.props.allPairs, /* qqq : for Yevhen : cover */

  // amender

  _extendWithHashmap : _.props._extendWithHashmap,
  _extendWithSet : _.props._extendWithSet,
  _extendWithCountable : _.props._extendWithCountable,
  _extendWithProps : _.props._extendWithProps,
  _extendVersatile : _.props._extendVersatile,
  extendVersatile : _.props.extendVersatile,
  extend : _.props.extend,

  _supplementWithHashmap : _.props._supplementWithHashmap,
  _supplementWithSet : _.props._supplementWithSet,
  _supplementWithCountable : _.props._supplementWithCountable,
  _supplementWithProps : _.props._supplementWithProps,
  _supplementVersatile : _.props._supplementVersatile,
  supplementVersatile : _.props.supplementVersatile,
  supplement : _.props.supplement,

}

//

Object.assign( _.object, ObjectExtension );

})();
