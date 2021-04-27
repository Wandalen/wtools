( function _l3_HashMap_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// equaler
// --

function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );


  if( !_.hashMap.like( src1 ) )
  return false;
  if( !_.hashMap.like( src2 ) )
  return false;

  return _.hashMap._identicalShallow( src1, src2 );
}

//

function _identicalShallow( src1, src2 )
{

  if( src1.size !== src2.size )
  return false;

  for( let [ key, val ] of src1 )
  {
    if( src2.has( key ) === false )
    return false;

    let val2 = src2.get( key );

    // /*
    //   in cases of an undefined value, make sure the key
    //   exists on the object so there are no false positives
    // */
    // // if( testVal !== val || ( testVal === undefined && !src2.has( key ) ) )
    // // return false;

    if( !Object.is( val2, val ) )
    return false;

  }

  return true;
}

// --
// exporter
// --

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.hashMap.is( src ) );

  return `{- ${_.entity.strType( src )} with ${_.entity.lengthOf( src )} elements -}`;
}

// --
// container interface
// --

function _lengthOf( src )
{
  return src.size;
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
  return src.has( key );
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
  return cardinal < src.size;
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
  if( cardinal < 0 || src.size <= cardinal )
  return [ undefined, false ];
  return [ this.keys[ cardinal ], true ];
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
  if( src.has( key ) )
  return [ src.get( key ), key, true ];
  else
  return [ undefined, key, false ];
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
  if( cardinal < 0 || src.size <= cardinal || !_.numberIs( cardinal ) )
  return [ undefined, cardinal, false ];
  let entry = [ ... src ][ cardinal ];
  return [ entry[ 1 ], entry[ 0 ], true ];
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
  src.set( key, val );
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
  let was = this._elementWithCardinal( src, cardinal );
  if( was[ 2 ] === true )
  {
    src.set( was[ 1 ], val );
    return [ val, was[ 1 ], true ];
  }
  else
  {
    return [ undefined, cardinal, false ];
  }
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
  if( !this._hasKey( src, key ) )
  return false;
  src.delete( key );
  return true;
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
  let has = this._keyWithCardinal( src, cardinal );
  if( !has[ 1 ] )
  return false;
  src.delete( has[ 0 ] );
  return true;
}

//

function elementWithCardinalDel( src, cardinal )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithCardinalDel( src, cardinal, val );
}

//

function _empty( dst )
{
  dst.clear();
  return dst;
}

//

function empty( dst )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( this.like( dst ) );
  return this._empty( dst );
}

//

function _eachLeft( src, onEach )
{
  let c = 0;
  for( let [ k, val ] of src )
  {
    onEach( val, k, c, src );
    c += 1;
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
  let keys = [ ... src.keys() ];
  for( let c = keys.length-1 ; c >= 0 ; c-- )
  {
    let k = keys[ c ];
    let val = src.get( k );
    onEach( val, k, c, src );
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
  if( src.size === 0 )
  return [ undefined, undefined, -1, true ];
  let c = 0;
  let lastk;
  for( let [ k, val ] of src )
  {
    let r = onEach( val, k, c, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ val, k, c, false ];
    lastk = k;
    c += 1;
  }
  return [ src.get( lastk ), lastk, c-1, true ];
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
  if( src.size === 0 )
  return [ undefined, undefined, -1, true ];

  let keys = [ ... src.keys() ];
  for( let c = keys.length-1 ; c >= 0 ; c-- )
  {
    let k = keys[ c ];
    let val = src.get( k );
    let r = onEach( val, k, c, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ val, k, c, false ];
  }

  var k = keys[ 0 ];
  return [ src.get( k ), k, 0, true ];
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

let ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

//

let Extension =
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

  // container interface

  _lengthOf,
  lengthOf, /* qqq : cover */

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

Object.assign( _.hashMap, Extension );

})();
