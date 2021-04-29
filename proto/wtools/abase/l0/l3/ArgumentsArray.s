( function _l3_ArgumentsArray_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.assert( !!_.props._aptLeft, 'Expects routine props._aptLeft' );

// --
// equaler
// --

/**
 * The long.identicalShallow() routine checks the equality of two arrays.
 *
 * @param { longLike } src1 - The first array.
 * @param { longLike } src2 - The second array.
 *
 * @example
 * _.long.identicalShallow( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 * // returns true
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @function long.identicalShallow
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @namespace Tools
 */

/* qqq : extend test */
function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( !this.like( src1 ) )
  return false;
  if( !this.like( src2 ) )
  return false;

  return this._identicalShallow( src1, src2 );
}

//

function _identicalShallow( src1, src2 )
{
  let result = true;

  if( src1.length !== src2.length )
  return false;

  for( let s = 0 ; s < src1.length ; s++ )
  {
    result = src1[ s ] === src2[ s ];
    if( result === false )
    return false;
  }

  return result;
}

// --
//
// --

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( this.like( src ) );
  return `{- ${_.entity.strType( src )} with ${this._lengthOf( src )} elements -}`;
}

// --
// inspector
// --

function _lengthOf( src )
{
  return src.length;
}

//

function lengthOf( src )
{
  _.assert( arguments.length === 1 );
  _.assert( this.like( src ) );
  return this._lengthOf( src );
}

//

function _hasKey( src, key )
{
  if( key < 0 )
  return false;
  return key < src.length;
}

//

function hasKey( src, key )
{
  _.assert( this.like( src ) );
  return this._hasKey( src, key );
}

//

function _hasCardinal( src, cardinal )
{
  if( cardinal < 0 )
  return false;
  return cardinal < src.length;
}

//

function hasCardinal( src, cardinal )
{
  _.assert( this.like( src ) );
  return this._hasCardinal( src, cardinal );
}

//

function _keyWithCardinal( src, cardinal )
{
  if( cardinal < 0 || src.length <= cardinal )
  return [ undefined, false ];
  return [ cardinal, true ]
}

//

function keyWithCardinal( src, cardinal )
{
  _.assert( this.like( src ) );
  return this._keyWithCardinal( src, cardinal );
}

// --
// editor
// --

function _empty( dst )
{
  throw _.err( `${this.TypeName} has fixed length` );
  return false;
}

//

function empty( dst )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( this.like( dst ) );
  return this._empty( dst );
}

// --
// elementor
// --

function _elementWithKey( src, key )
{
  if( key < 0 || src.length <= key || !_.numberIs( key ) )
  return [ undefined, key, false ];
  else
  return [ src[ key ], key, true ];
}

//

function elementWithKey( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithKey( src, key );
}

//

function _elementWithImplicit( src, key )
{
  if( _.props.keyIsImplicit( key ) )
  return _.props._onlyImplicitWithKeyTuple( src, key );
  return this._elementWithKey( src, key );
}

//

function elementWithImplicit( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithImplicit( src, key );
}

//

function _elementWithCardinal( src, cardinal )
{
  if( cardinal < 0 || src.length <= cardinal || !_.numberIs( cardinal ) )
  return [ undefined, cardinal, false ];
  else
  return [ src[ cardinal ], cardinal, true ];
}

//

function elementWithCardinal( src, cardinal )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithCardinal( src, cardinal );
}

//

function _elementWithKeySet( src, key, val )
{
  if( key < 0 || src.length <= key || !_.numberIs( key ) )
  return [ undefined, key, false ];
  src[ key ] = val
  return [ val, key, true ];
}

//

function elementWithKeySet( src, key, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._elementWithKeySet( src, key, val );
}

//

function _elementWithCardinalSet( src, cardinal, val )
{
  if( cardinal < 0 || src.length <= cardinal || !_.numberIs( cardinal ) )
  return [ undefined, cardinal, false ];
  src[ cardinal ] = val;
  return [ val, cardinal, true ];
}

//

function elementWithCardinalSet( src, cardinal, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._elementWithCardinalSet( src, cardinal, val );
}

//

function _elementWithKeyDel( src, key )
{
  throw _.err( `${this.TypeName} has fixed length` );
  return false;
}

//

function elementWithKeyDel( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithKeyDel( src, key );
}

//

function _elementWithCardinalDel( src, cardinal )
{
  throw _.err( `${this.TypeName} has fixed length` );
  return false;
}

//

function elementWithCardinalDel( src, cardinal )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithCardinalDel( src, cardinal, val );
}

// --
// iterator
// --

function _eachLeft( src, onEach )
{
  for( let k = 0 ; k < src.length ; k++ )
  {
    onEach( src[ k ], k, k, src );
  }
}

//

function eachLeft( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._eachLeft( src, onEach );
}

//

function _eachRight( src, onEach )
{
  for( let k = src.length-1 ; k >= 0 ; k-- )
  {
    onEach( src[ k ], k, k, src );
  }
}

//

function eachRight( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._eachRight( src, onEach );
}

//

function _whileLeft( src, onEach )
{
  for( let k = 0 ; k < src.length ; k++ )
  {
    let r = onEach( src[ k ], k, k, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ src[ k ], k, k, false ];
  }
  let k = src.length-1;
  if( src.length > 0 )
  return [ src[ k ], k, k, true ];
  else
  return [ undefined, k, k, true ];
}

//

function whileLeft( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._whileLeft( src, onEach );
}

//

function _whileRight( src, onEach )
{
  for( let k = src.length-1 ; k >= 0 ; k-- )
  {
    let r = onEach( src[ k ], k, k, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ src[ k ], k, k, false ];
  }
  if( src.length > 0 )
  return [ src[ 0 ], 0, 0, true ];
  else
  return [ undefined, -1, -1, true ];
}

//

function whileRight( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._whileRight( src, onEach );
}

// --
// extension
// --

var ArgumentsArrayExtension =
{

  // equaler

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,
  _equivalentShallow : _identicalShallow,
  equivalentShallow : identicalShallow,
  equivalent : identicalShallow,

  // exporter

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,

  // inspector

  _lengthOf,
  lengthOf, /* qqq : cover */
  _hasKey,
  hasKey, /* qqq : cover */
  _hasCardinal,
  hasCardinal, /* qqq : cover */
  _keyWithCardinal,
  keyWithCardinal, /* qqq : cover */

  // editor

  _empty,
  empty, /* qqq : for Yevhen : cover */

  // elementor

  _elementGet : _elementWithKey,
  elementGet : elementWithKey, /* qqq : cover */
  _elementWithKey,
  elementWithKey, /* qqq : cover */
  _elementWithImplicit,
  elementWithImplicit,  /* qqq : cover */
  _elementWithCardinal,
  elementWithCardinal,  /* qqq : cover */

  _elementSet : _elementWithKeySet,
  elementSet : elementWithKeySet, /* qqq : cover */
  _elementWithKeySet,
  elementWithKeySet, /* qqq : cover */
  _elementWithCardinalSet,
  elementWithCardinalSet,  /* qqq : cover */

  _elementDel : _elementWithKeyDel,
  elementDel : elementWithKeyDel, /* qqq : cover */
  _elementWithKeyDel,
  elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel,
  elementWithCardinalDel,  /* qqq : cover */

  // iterator

  _each : _eachLeft,
  each : eachLeft, /* qqq : cover */
  _eachLeft,
  eachLeft, /* qqq : cover */
  _eachRight,
  eachRight, /* qqq : cover */

  _while : _whileLeft,
  while : whileLeft, /* qqq : cover */
  _whileLeft,
  whileLeft, /* qqq : cover */
  _whileRight,
  whileRight, /* qqq : cover */

  _aptLeft : _.props._aptLeft,
  aptLeft : _.props.aptLeft, /* qqq : cover */
  first : _.props.first,
  _aptRight : _.props._aptRight, /* qqq : cover */
  aptRight : _.props.aptRight,
  last : _.props.last, /* qqq : cover */

}

Object.assign( _.argumentsArray, ArgumentsArrayExtension );

//

var ToolsExtension =
{
}

//

Object.assign( _, ToolsExtension );

})();
