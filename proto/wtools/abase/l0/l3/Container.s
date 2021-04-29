( function _l3_Container_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const _functor_functor = _.container._functor_functor;

// --
// exporter
// --

function _exportStringShallowDiagnostic( src, o )
{
  let result;
  let namespace = this.namespaceForEntity( src );

  if( namespace )
  result = namespace.exportStringShallowDiagnostic( src );
  else
  result = _.strShort_( String( src ) ).result;

  return result;
}

//

function exportStringShallowDiagnostic( src, o )
{
  let result;
  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects 1 or 2 arguments' );
  _.assert( this.like( src ) );
  return this._exportStringShallowDiagnostic( ... arguments );
}

// --
// editor
// --

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

function empty( container ) /* qqq for junior : cover please */
{
  _.assert( arguments.length === 1 );
  return empty.functor.call( this, container )();
}

empty.functor = _functor_functor( 'empty' );

// --
//
// --

function lengthOf( container ) /* qqq for junior : cover please */
{
  _.assert( arguments.length === 1 );
  return lengthOf.functor.call( this, container )();
}

lengthOf.functor = _functor_functor( 'lengthOf' );

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

function elementWithCardinal( container, key ) /* qqq for junior : cover please | aaa : Done. */
{
  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( key ) );
  if( !_.numberIs( key ) || key < 0 )
  return [ undefined, key, false ];
  return elementWithCardinal.functor.call( this, container )( key );
}

elementWithCardinal.functor = _functor_functor( 'elementWithCardinal' );

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

function elementWithKey( container, key )
{
  _.assert( arguments.length === 2 );
  return elementWithKey.functor.call( this, container )( key );
}

elementWithKey.functor = _functor_functor( 'elementWithKey' );

//

function elementWithImplicit( container, key )
{
  _.assert( arguments.length === 2 );
  return elementWithImplicit.functor.call( this, container )( key );
}

elementWithImplicit.functor = _functor_functor( 'elementWithImplicit' );

//

function elementWithCardinalSet( container, key, val ) /* qqq for junior : cover please | aaa : Done. */
{
  _.assert( arguments.length === 3 );
  _.assert( _.numberIs( key ) );
  return elementWithCardinalSet.functor.call( this, container )( key, val );
}

elementWithCardinalSet.functor = _functor_functor( 'elementWithCardinalSet' );

//

function elementSet( container, key, val )
{
  _.assert( arguments.length === 3 );
  _.assert( _.numberIs( key ) );
  return elementSet.functor.call( this, container )( key, val );
}

elementSet.functor = _functor_functor( 'elementSet' );

//

function eachLeft( container, onEach )
{
  _.assert( arguments.length === 2 );
  return eachLeft.functor.call( this, container )( onEach );
}

eachLeft.functor = _functor_functor( 'eachLeft' );

//

function eachRight( container, onEach )
{
  _.assert( arguments.length === 2 );
  return eachRight.functor.call( this, container )( onEach );
}

eachRight.functor = _functor_functor( 'eachRight' );

//

function whileLeft( container, onEach )
{
  _.assert( arguments.length === 2 );
  return whileLeft.functor.call( this, container )( onEach );
}

whileLeft.functor = _functor_functor( 'whileLeft' );

//

function whileRight( container, onEach )
{
  _.assert( arguments.length === 2 );
  return whileRight.functor.call( this, container )( onEach );
}

whileRight.functor = _functor_functor( 'whileRight' );

//

function aptLeft( container, onEach )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return aptLeft.functor.call( this, container )( onEach );
}

aptLeft.functor = _functor_functor( 'aptLeft' );

//

function first( container )
{
  _.assert( arguments.length === 1 );
  return _.container.aptLeft( container );
}

//

function aptRight( container, onEach )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return aptRight.functor.call( this, container )( onEach );
}

aptRight.functor = _functor_functor( 'aptRight' );

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

  // exporter

  _exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  _exportStringShallowCode : _exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportString : exportStringShallowDiagnostic,

  // editor

  empty, /* qqq : cover */

  // inspector

  lengthOf, /* qqq : cover */

  // elementor

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

//

})();
