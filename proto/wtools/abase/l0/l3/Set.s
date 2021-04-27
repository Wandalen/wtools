( function _l3_Set_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.set = _.set || Object.create( null );
_.set.s = _.set.s || Object.create( null );

// --
//
// --

function toArray( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.set.like( src ) );
  return [ ... src ];
}

//

function setsToArrays( srcs )
{
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( srcs ) );
  let result = [];
  for( let s = 0, l = srcs.length ; s < l ; s++ )
  result[ s ] = _.set.toArray( srcs[ s ] );
  return result;
}

// --
// exporter
// --

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.set.is( src ) );

  return `{- ${_.entity.strType( src )} with ${_.entity.lengthOf( src )} elements -}`;
}

// --
// equaler
// --

function _identicalShallow( src1, src2 )
{
  if( src1.size !== src2.size)
  return false;

  for( let el of src1 )
  if( !src2.has( el ) )
  return false;

  return true;
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
  return [ [ ... src ][ cardinal ], true ];
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
  return [ key, key, true ];
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

function _elementWithCardinal( src, key )
{
  if( key < 0 || src.size <= key || !_.numberIs( key ) )
  if( src.size <= key || !_.number.is( key ) )
  return [ undefined, key, false ];
  return [ [ ... src ][ key ], key, true ];
}

//

function elementWithCardinal( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithCardinal( src, key );
}

//

function _elementWithKeySet( src, key, val )
{
  src.set( val );
  return [ val, val, true ];
}

//

function elementWithKeySet( src, key, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  _.assert( key === val );
  return this._elementWithKeySet( src, key, val );
}

//

function _elementWithCardinalSet( src, cardinal, val )
{
  let was = this._elementWithCardinal( src, cardinal );
  if( was[ 2 ] === true )
  {
    src.delete( was[ 0 ] );
    src.set( val );
    return [ val, val, true ];
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
  for( let e of src )
  {
    onEach( e, e, c, src );
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
  let src2 = [ ... src ];
  for( let k = src2.length-1 ; k >= 0 ; k-- )
  {
    let e = src[ k ];
    onEach( e, e, k, src );
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
  let laste;
  for( let e of src )
  {
    let r = onEach( e, e, c, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ e, e, c, false ];
    laste = e;
    c += 1;
  }
  return [ laste, laste, src.size-1, true ];
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
  var src2 = [ ... src ];
  for( let k = src2.length-1 ; k >= 0 ; k-- )
  {
    var e = src2[ k ];
    let r = onEach( e, e, k, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ e, e, k, false ];
  }
  var e = src2[ 0 ];
  return [ e, e, 0, true ];
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

  // reader

  _setsAreIdenticalShallow : _identicalShallow.bind( _.set ),
  setsAreIdenticalShallow : identicalShallow.bind( _.set ),

  //

  // setFrom : from,
  // setsFrom,
  setToArray : toArray,
  setsToArrays,

}

Object.assign( _, ToolsExtension );

//

let SetExtension =
{

  //

  NamespaceName : 'set',

  // from,
  toArray,

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

Object.assign( _.set, SetExtension );

//

let SetsExtension =
{

  // set

  // from : setsFrom,
  toArrays : setsToArrays,

}

//

Object.assign( _.set.s, SetsExtension );

})();
