( function _l5_Container_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// meta
// --

function namespaceFor( container ) /* qqq for Yevhen : cover please */
{
  _.assert( arguments.length === 1 );
  if( _.primitive.is( container ) )
  return _.blank;
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
  // else if( _.object.like( container ) )
  // return _.object;
  else
  return _.blank;
}

//

function _functor_functor( methodName )
{
  _.assert( _.strDefined( methodName ) );
  return function _functor( container )
  {
    _.assert( arguments.length === 1 );
    _.assert( _.routine.is( this.namespaceFor ), `No routine::namespaceFor in the namesapce` );
    let namespace = this.namespaceFor( container );
    _.assert( _.routine.is( namespace[ methodName ] ), `No routine::${methodName} in the namesapce::${namespace.NamespaceName}` );
    return namespace[ methodName ].bind( namespace, container );
  }
}

// --
// container interface
// --

function cloneShallow( container ) /* qqq for Yevhen : cover please */
{
  _.assert( arguments.length === 1 );
  return cloneShallow.functor.call( this, container )();
}

cloneShallow.functor = _functor_functor( 'cloneShallow' );
// cloneShallow.functor = _functor_functor( 'cloneShallow' );

//

function make( container, ... args ) /* qqq for Yevhen : cover please */
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return make.functor.call( this, container )( ... args );
}

make.functor = _functor_functor( 'make' );
// make.functor = _functor_functor( 'make' );

//

function makeEmpty( container ) /* qqq for Yevhen : cover please */
{
  _.assert( arguments.length === 1 );
  return makeEmpty.functor.call( this, container )();
}

makeEmpty.functor = _functor_functor( 'makeEmpty' );
// makeEmpty.functor = _functor_functor( 'makeEmpty' );

//

function makeUndefined( container, ... args ) /* qqq for Yevhen : cover please */
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return makeUndefined.functor.call( this, container )( ... args );
}

makeUndefined.functor = _functor_functor( 'makeUndefined' );
// makeUndefined.functor = _functor_functor( 'makeUndefined' );

//

/**
 * The routine empty() clears provided container {-dstContainer-}.
 *
 * @param { Long|Set|HashMap|Aux } dstContainer - Container to be cleared. {-dstContainer-} should be resizable.
 *
 * @example
 * let dst = [];
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log []
 * console.log( got === dst );
 * log true
 *
 * @example
 * let dst = [ 1, 'str', { a : 2 } ];
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log []
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let dst = _.unroll.make( [ 1, 'str', { a : 2 } ] );
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log []
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let dst = new Set( [ 1, 'str', { a : 2 } ] );
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log Set {}
 * console.log( got === dst );
 * // log true
 *
 * @example
 * let dst = new Map( [ [ 1, 'str' ], [ 'a', null ] ] );
 * let got = _.container.empty( dst );
 * console.log( got );
 * // log Map {}
 * console.log( got === dst );
 * // log true
 *
 * @returns { Long|Set|HashMap|Aux } - Returns a empty {-dstContainer-}.
 * @function empty
 * @throws { Error } If arguments.length is less than one.
 * @throws { Error } If {-dstContainer-} is not a Long, not a Set, not a HashMap, not a Aux.
 * @throws { Error } If {-dstContainer-} is not a resizable Long, or if it is a WeakSet or WeakMap.
 * @namespace Tools
 */

function empty( container ) /* qqq for Yevhen : cover please */
{
  _.assert( arguments.length === 1 );
  return empty.functor.call( this, container )();
}

empty.functor = _functor_functor( 'empty' );
// empty.functor = _functor_functor( 'empty' );

// //
//
// function make()
// {
//   _.assert( arguments.length === 1 );
//   return _.entity.cloneShallow( ... arguments );
// }

// function empty( dstContainer )
// {
//   if( _.longLike( dstContainer ) )
//   _.longEmpty( dstContainer );
//   else if( _.set.like( dstContainer ) )
//   dstContainer.clear();
//   else if( _.hashMap.like( dstContainer ) )
//   dstContainer.clear();
//   else if( _.aux.is( dstContainer ) )
//   _.mapEmpty( dstContainer );
//   else
//   _.assert( 0, `Not clear how to empty non-container ${_.entity.strType( dstContainer )}` );
//   return dstContainer;
// }

//

/**
 * The routine elementWithCardinal() searches for value under a certain index {-key-} in a container {-container-}
 * and returns array with value, key, booLike.
 *
 * @param { Long|Set|HashMap|Aux } container - input container.
 * @param { Number } key - index to be looked in a container.
 *
 * @example
 * var src = { a : 1, b : 2 };
 * var got = _.container.elementWithCardinal( src, 0 );
 * console.log( got );
 * // log : [ 1, 'a', true ]
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementWithCardinal( src, 2 );
 * console.log( got );
 * // log : [ 3, 2, true ]
 *
 * @example
 * var src = new HashMap([ [ 'a', 1 ], [ true, false ], [ objRef, { a : 2 } ] ]);
 * var got = _.container.elementWithCardinal( src, 1 );
 * console.log( got )
 * // log : [ false, true, true ] );
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementWithCardinal( src, 5 );
 * console.log( got );
 * // log : [ undefined, 5, false ]
 *
 * @returns { Long } - with 3 elements : value ( undefined if index {-key-} is more or less than container's length ), key, boolLike ( true if index {-key-} is within container's length, false otherwise ).
 * @function elementWithCardinal
 * @throws { Error } If arguments.length is not equal to 2.
 * @throws { Error } If {-key-} is not Number.
 * @namespace Tools
 */

// function elementWithCardinal_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementWithCardinal ) );
//   return namespace._elementWithCardinal.bind( namespace, container );
// }

//

function elementWithCardinal( container, key ) /* qqq for Yevhen : cover please | aaa : Done. */
{
  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( key ) );
  if( !_.numberIs( key ) || key < 0 )
  return [ undefined, key, false ];
  return elementWithCardinal.functor.call( this, container )( key );
}

elementWithCardinal.functor = _functor_functor( 'elementWithCardinal' );
// elementWithCardinal.functor = elementWithCardinal_functor;

//

/**
 * The routine elementWithKey() searches for value under a certain {-key-} in a container {-container-}
 * and returns array with value, key, booLike.
 *
 * @param { Long|Set|HashMap|Aux } container - input container.
 * @param { * } key - key to be looked in a container.
 *
 * @example
 * var src = { a : 1, b : 2 };
 * var got = _.container.elementWithKey( src, 'a' );
 * console.log( got );
 * // log : [ 1, 'a', true ]
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementWithKey( src, 2 );
 * console.log( got );
 * // log : [ 3, 2, true ]
 *
 * @example
 * var src = new HashMap([ [ 'a', 1 ], [ true, false ], [ objRef, { a : 2 } ] ]);
 * var got = _.container.elementWithKey( src, true );
 * console.log( got )
 * // log : [ false, true, true ] );
 *
 * @example
 * var src = [ 1, 2, 3 ];
 * var got = _.container.elementWithKey( src, 5 );
 * console.log( got );
 * // log : [ undefined, 5, false ]
 *
 * @returns { Long } - with 3 elements : value ( undefined if key is absent ), key, boolLike ( true if key exists, false otherwise ).
 * @function elementWithKey
 * @throws { Error } If arguments.length is not equal to 2.
 * @namespace Tools
 */

// function elementWithKey_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementWithKey ) );
//   return namespace._elementWithKey.bind( namespace, container );
// }

//

function elementWithKey( container, key )
{
  _.assert( arguments.length === 2 );
  return elementWithKey.functor.call( this, container )( key );
}

elementWithKey.functor = _functor_functor( 'elementWithKey' );
// elementWithKey.functor = elementWithKey_functor;

//

// function elementWithImplicit_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementWithImplicit ) );
//   return namespace._elementWithImplicit.bind( namespace, container );
// }

//

function elementWithImplicit( container, key )
{
  _.assert( arguments.length === 2 );
  return elementWithImplicit.functor.call( this, container )( key );
}

elementWithImplicit.functor = _functor_functor( 'elementWithImplicit' );
// elementWithImplicit.functor = elementWithImplicit_functor;

//

// function elementWithCardinalSet_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementWithCardinalSet ) );
//   return namespace._elementWithCardinalSet.bind( namespace, container );
// }

//

function elementWithCardinalSet( container, key, val ) /* qqq for Yevhen : cover please | aaa : Done. */
{
  _.assert( arguments.length === 3 );
  _.assert( _.numberIs( key ) );
  return elementWithCardinalSet.functor.call( this, container )( key, val );
}

elementWithCardinalSet.functor = _functor_functor( 'elementWithCardinalSet' );
// elementWithCardinalSet.functor = elementWithCardinalSet_functor;

//

// function elementSet_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementSet ) );
//   return namespace._elementSet.bind( namespace, container );
// }

//

function elementSet( container, key, val )
{
  _.assert( arguments.length === 3 );
  _.assert( _.numberIs( key ) );
  return elementSet.functor.call( this, container )( key, val );
}

elementSet.functor = _functor_functor( 'elementSet' );
// elementSet.functor = elementSet_functor;

// --
// iterator
// --

// function eachLeft_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementSet ) );
//   return namespace.eachLeft.bind( namespace, container );
// }

//

function eachLeft( container, onEach )
{
  _.assert( arguments.length === 2 );
  return eachLeft.functor.call( this, container )( onEach );
}

eachLeft.functor = _functor_functor( 'eachLeft' );
// eachLeft.functor = eachLeft_functor;

//

// function eachRight_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementSet ) );
//   return namespace.eachRight.bind( namespace, container );
// }

//

function eachRight( container, onEach )
{
  _.assert( arguments.length === 2 );
  return eachRight.functor.call( this, container )( onEach );
}

eachRight.functor = _functor_functor( 'eachRight' );
// eachRight.functor = eachRight_functor;

//

// function whileLeft_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementSet ) );
//   return namespace.whileLeft.bind( namespace, container );
// }

//

function whileLeft( container, onEach )
{
  _.assert( arguments.length === 2 );
  return whileLeft.functor.call( this, container )( onEach );
}

whileLeft.functor = _functor_functor( 'whileLeft' );
// whileLeft.functor = whileLeft_functor;

//

// function whileRight_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementSet ) );
//   return namespace.whileRight.bind( namespace, container );
// }

//

function whileRight( container, onEach )
{
  _.assert( arguments.length === 2 );
  return whileRight.functor.call( this, container )( onEach );
}

whileRight.functor = _functor_functor( 'whileRight' );
// whileRight.functor = whileRight_functor;

//

// function aptLeft_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementSet ) );
//   return namespace.aptLeft.bind( namespace, container );
// }

//

function aptLeft( container, onEach )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return aptLeft.functor.call( this, container )( onEach );
}

aptLeft.functor = _functor_functor( 'aptLeft' );
// aptLeft.functor = aptLeft_functor;

//

function first( container )
{
  _.assert( arguments.length === 1 );
  return _.container.aptLeft( container );
}

//

// function aptRight_functor( container )
// {
//   _.assert( arguments.length === 1 );
//   let namespace = this.namespaceFor( container );
//   _.assert( _.routine.is( namespace._elementSet ) );
//   return namespace.aptRight.bind( namespace, container );
// }

//

function aptRight( container, onEach )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return aptRight.functor.call( this, container )( onEach );
}

aptRight.functor = _functor_functor( 'aptRight' );
// aptRight.functor = aptRight_functor;

//

function last( container )
{
  _.assert( arguments.length === 1 );
  return _.container.aptRight( container );
}

// --
// extension
// --

let ContainerExtension =
{

  // meta

  namespaceFor,
  _functor_functor,

  // container interface

  cloneShallow, /* qqq : cover */
  make, /* qqq : cover */
  makeEmpty, /* qqq : cover */
  makeUndefined, /* qqq : cover */
  empty, /* qqq : cover */

  elementWithCardinal, /* qqq : cover */
  elementWithKey, /* qqq : cover */
  elementWithImplicit, /* qqq : cover */
  elementWithCardinalSet, /* qqq : cover */
  elementSet, /* qqq : cover */

  each : eachLeft, /* qqq : cover */
  eachLeft, /* qqq : cover */
  eachRight, /* qqq : cover */

  while : whileLeft, /* qqq : cover */
  whileLeft, /* qqq : cover */
  whileRight, /* qqq : cover */

  aptLeft, /* qqq : cover */
  first, /* qqq : cover */
  aptRight, /* qqq : cover */
  last, /* qqq : cover */

}

_.props.supplement( _.container, ContainerExtension );

//

let ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

})();
