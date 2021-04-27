( function _l1_3Blank_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.blank = _.blank || Object.create( null );

// --
// equaler
// --

function _identicalShallow( src1, src2 )
{
  return src1 === src2;
}

//

function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  if( !this.like( src1 ) )
  return false;
  if( !this.like( src2 ) )
  return false;
  return this._identicalShallow( src1, src2 );
}

// --
// exporter
// --

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( this.like( src ) );
  return `{- ${_.entity.strType( src )} -}`;
}

// --
// container interface
// --

function _lengthOf( src )
{
  return 0;
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
  return false;
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
  return false;
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
  return [ undefined, false ];
}

//

function keyWithCardinal( src, cardinal )
{
  _.assert( this.like( src ) );
  return this._keyWithCardinal( src, cardinal );
}

//

function _elementWithKey( src, key )
{
  return [ undefined, key, false ];
}

//

function elementWithKey( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
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
  _.assert( this.like( src ) );
  return this._elementWithImplicit( src, key );
}

//

function _elementWithCardinal( src, cardinal )
{
  return [ undefined, cardinal, false ];
}

//

function elementWithCardinal( src, cardinal )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
  return this._elementWithCardinal( src, cardinal );
}

//

function _elementWithKeySet( src, key, val )
{
  return [ undefined, key, false ];
}

//

function elementWithKeySet( src, key, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.like( src ) );
  return this._elementWithKeySet( src, key, val );
}

//

function _elementWithCardinalSet( src, cardinal, val )
{
  return [ undefined, cardinal, false ];
}

//

function elementWithCardinalSet( src, cardinal, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.like( src ) );
  return this._elementWithCardinalSet( src, cardinal, val );
}

//

function _elementWithKeyDel( src, key )
{
  return false;
}

//

function elementWithKeyDel( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
  return this._elementWithKeyDel( src, key );
}

//

function _elementWithCardinalDel( src, cardinal )
{
  return false;
}

//

function elementWithCardinalDel( src, cardinal )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
  return this._elementWithCardinalDel( src, cardinal, val );
}

//

function _empty( dst )
{
  return dst;
}

//

function empty( dst )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( this.like( dst ) );
  _.assert( 0, `${this.NamespaceName} does not have method empty` );
  return this._empty( dst );
}

//

function _eachLeft( src, onEach )
{
}

//

function eachLeft( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
  this._eachLeft( src, onEach );
}

//

function _eachRight( src, onEach )
{
}

//

function eachRight( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
  this._eachRight( src, onEach );
}

//

function _whileLeft( src, onEach )
{
  return [ undefined, undefined, -1, true ];
}

//

function whileLeft( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
  this._whileLeft( src, onEach );
}

//

function _whileRight( src, onEach )
{
  return [ undefined, undefined, -1, true ];
}

//

function whileRight( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.like( src ) );
  this._whileRight( src, onEach );
}

// --
// extension
// --

let ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

//

let BlankExtension =
{

  //

  NamespaceName : 'blank',

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

  // container interface

  _lengthOf,
  lengthOf, /* qqq : cover */

  _hasKey,
  hasKey, /* qqq : cover */
  _hasCardinal,
  hasCardinal, /* qqq : cover */
  _keyWithCardinal,
  keyWithCardinal, /* qqq : cover */

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
  _empty,
  empty, /* qqq : for Yevhen : cover */

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

Object.assign( _.blank, BlankExtension );

})();
