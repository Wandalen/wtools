( function _l3_2Property_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const prototypeSymbol = Symbol.for( 'prototype' );
const constructorSymbol = Symbol.for( 'constructor' );

// --
// equaler
// --

function _identicalShallow( src1, src2 )
{
  if( Object.keys( src1 ).length !== Object.keys( src2 ).length )
  return false;

  for( let s in src1 )
  {
    if( src1[ s ] !== src2[ s ] )
    return false;
  }

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
// exporter
// --

function exportStringShallowDiagnostic( src, o )
{
  _.assert( this.like( src ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( o === undefined || _.object.is( o ) );
  return `{- ${_.entity.strType( src )} with ${this._lengthOf( src )} elements -}`;
}

// --
// properties
// --

function keyIsImplicit( key )
{
  if( !_.props.implicit.is( key ) )
  return false;
  if( key.val === prototypeSymbol )
  return true;
  if( key.val === constructorSymbol ) /* xxx : try */
  return true;
  return false;
}

//

function _onlyImplicitWithKey( src, key )
{
  if( !_.props.implicit.is( key ) )
  return;
  if( key.val === prototypeSymbol )
  {
    if( src === undefined || src === null )
    return undefined;
    return Object.getPrototypeOf( src );
  }
  if( key.val === constructorSymbol ) /* xxx : try */
  {
    if( src === undefined || src === null )
    return undefined;
    let prototype = Object.getPrototypeOf( src );
    if( !prototype )
    return prototype;
    return prototype.constructor;
  }
}

//

function onlyImplicitWithKey( src, key )
{
  _.assert( this === _.props );
  _.assert( arguments.length === 2 );
  return this._onlyImplicitWithKey( src, key );
}

//

function _onlyImplicitWithKeyTuple( container, key )
{
  let r = _.props._onlyImplicitWithKey( container, key );
  return [ r, key.val, r !== undefined ];
}

//

function onlyImplicit( src )
{
  let result = new HashMap();

  _.assert( this === _.props );
  _.assert( arguments.length === 1 );

  if( src === undefined || src === null )
  return result;
  var prototype = Object.getPrototypeOf( src );
  if( prototype )
  result.set( _.props.implicit.prototype, prototype );
  debugger;

  return result;
}

// --
// container interface
// --

function _lengthOf( src )
{
  return this.keys( src ).length;
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
  if( _.primitive.is( src ) )
  return false;
  if( !Reflect.has( src, key ) )
  return false;
  return true;
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
  let length = this._lengthOf( src );
  return cardinal < length;
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
  if( cardinal < 0 )
  return [ undefined, false ];
  let keys = this.keys( src );
  if( cardinal < keys.length )
  return [ keys[ cardinal ], true ];
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
  if( _.strIs( key ) )
  {
    if( _.props.has( src, key ) )
    return [ src[ key ], key, true ];
    else
    return [ undefined, key, false ];
  }
  else
  {
    return [ undefined, key, false ];
  }
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
  if( !_.numberIs( cardinal ) || cardinal < 0 )
  return [ undefined, cardinal, false ];
  // let keys = Object.keys( src );
  let keys = _.aux.keys( src );
  let key2 = keys[ cardinal ];
  if( keys.length <= cardinal )
  return [ undefined, cardinal, false ];
  return [ src[ key2 ], key2, true ];
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
  src[ key ] = val;
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
    src[ was[ 1 ] ] = val;
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
  if( !this._hasKey( src, key ) ) /* xxx : implemenet */
  return false;
  delete src[ key ];
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
  let has = this._keyWithCardinal( src, cardinal );  /* xxx : implemenet */
  if( !has[ 1 ] )
  return false;
  delete src[ has[ 0 ] ];
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
  for( let k in dst )
  delete dst[ k ];
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
  for( let k in src )
  {
    let val = src[ k ];
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
  let keys = this.keys( src );
  for( let c = keys.length-1 ; c >= 0 ; c-- )
  {
    let k = keys[ c ];
    let val = src[ k ];
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
  let c = 0;
  let lastk;
  for( let k in src )
  {
    let val = src[ k ];
    let r = onEach( val, k, c, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ val, k, c, false ];
    lastk = k;
    c += 1;
  }
  if( c === 0 )
  return [ undefined, undefined, -1, true ];
  return [ src[ lastk ], lastk, c-1, true ];
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
  let keys = this.keys( src );
  if( keys.length === 0 )
  return [ undefined, undefined, -1, true ];
  for( let c = keys.length-1 ; c >= 0 ; c-- )
  {
    let k = keys[ c ];
    let val = src[ k ];
    let r = onEach( val, k, c, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ val, k, c, false ];
  }

  var k = keys[ 0 ];
  return [ src[ k ], k, 0, true ];
}

//

function whileRight( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._whileRight( src, onEach );
}

//

function _aptLeft( src, onEach )
{
  let result, result2;

  if( onEach )
  result2 = this._whileLeft( src, function( val, k, c, src2 )
  {
    let r = onEach( ... arguments );
    if( r !== undefined )
    {
      result = [ r, k, c, true ];
      return false;
    }
    return true;
  });
  else
  result2 = this._whileLeft( src, function( val, k, c, src2 )
  {
    result = [ val, k, c, true ];
    return false;
  });

  if( result === undefined )
  {
    result2[ 3 ] = false;
    return result2;
  }

  return result;
}

//

function aptLeft( src, onEach )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._aptLeft( src, onEach );
}

//

function first( src )
{
  _.assert( arguments.length === 1 );
  _.assert( this.is( src ) );
  return this._aptLeft( src );
}

//

function _aptRight( src, onEach )
{
  let result, result2;

  if( onEach )
  result2 = this._whileRight( src, function( val, k, c, src2 )
  {
    let r = onEach( ... arguments );
    if( r !== undefined )
    {
      result = [ r, k, c, true ];
      return false;
    }
    return true;
  });
  else
  result2 = this._whileRight( src, function( val, k, c, src2 )
  {
    result = [ val, k, c, true ];
    return false;
  });

  if( result === undefined )
  {
    result2[ 3 ] = false;
    return result2;
  }

  return result;
}

//

function aptRight( src, onEach )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._aptRight( src, onEach );
}

//

function last( src )
{
  _.assert( arguments.length === 1 );
  _.assert( this.is( src ) );
  return this._aptRight( src );
}

//

function _filter( dst, src, onEach, each, escape )
{
  let self = this;

  if( dst === null )
  dst = this.makeUndefined( src );
  else if( dst === _.self )
  dst = src;

  if( dst === src )
  each.call( this, src, function( val, k, c, src2 )
  {
    let val2 = onEach( ... arguments );
    let val3 = escape( val2 );
    if( val2 === undefined )
    self._elementDel( dst, k );
    else if( val3 === val )
    return
    else
    self._elementSet( dst, k, val3 );
  });
  else
  each.call( this, src, function( val, k, c, src2 )
  {
    let val2 = onEach( ... arguments );
    let val3 = escape( val2 );
    if( val2 === undefined )
    return;
    self._elementSet( dst, k, val3 );
  });

  return dst;
}

//

function filterWithoutEscapeLeft( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._filter( dst, src, onEach, this.eachLeft, ( val ) => val );
}

//

function filterWithoutEscapeRight( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._filter( dst, src, onEach, this.eachRight, ( val ) => val );
}

//

function filterWithEscapeLeft( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._filter( dst, src, onEach, this.eachLeft, ( val ) => _.escape.right( val ) );
}

//

function filterWithEscapeRight( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._filter( dst, src, onEach, this.eachRight, ( val ) => _.escape.right( val ) );
}

//

function _map( dst, src, onEach, each, escape )
{
  let self = this;

  if( dst === null )
  dst = this.makeUndefined( src );
  else if( dst === _.self )
  dst = src;

  if( dst === src )
  each.call( this, src, function( val, k, c, src2 )
  {
    let val2 = onEach( ... arguments );
    let val3 = escape( val2 );
    if( val3 === val || val2 === undefined )
    return;
    self._elementSet( dst, k, val3 );
  });
  else
  each.call( this, src, function( val, k, c, src2 )
  {
    let val2 = onEach( ... arguments );
    let val3 = escape( val2 );
    if( val2 === undefined )
    self._elementSet( dst, k, val );
    else
    self._elementSet( dst, k, val3 );
  });

  return dst;
}

//

function mapWithoutEscapeLeft( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._map( dst, src, onEach, this.eachLeft, ( val ) => val );
}

//

function mapWithoutEscapeRight( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._map( dst, src, onEach, this.eachRight, ( val ) => val );
}

//

function mapWithEscapeLeft( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._map( dst, src, onEach, this.eachLeft, ( val ) => _.escape.right( val ) );
}

//

function mapWithEscapeRight( dst, src, onEach )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._map( src, onEach, this.eachRight, ( val ) => _.escape.right( val ) );
}

// --
// property implicit
// --

_.assert( _.props.implicit === undefined );
_.assert( _.props.Implicit === undefined );
_.props.implicit = _.wrap.declare({ name : 'Implicit' }).namespace;
_.props.Implicit = _.props.implicit.class;
_.assert( _.mapIs( _.props.implicit ) );
_.assert( _.routineIs( _.props.Implicit ) );

_.props.implicit.prototype = new _.props.Implicit( prototypeSymbol );
_.props.implicit.constructor = new _.props.Implicit( constructorSymbol );

// --
// extension
// --

let Extension =
{

  //

  NamespaceName : 'props',

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

  // properties

  keyIsImplicit, /* qqq : cover */
  _onlyImplicitWithKey,
  onlyImplicitWithKey, /* qqq : cover */
  _onlyImplicitWithKeyTuple,
  onlyImplicit,

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

  _aptLeft,
  aptLeft, /* qqq : cover */
  first,
  _aptRight, /* qqq : cover */
  aptRight,
  last, /* qqq : cover */

  _filter,
  filterWithoutEscapeLeft,
  filterWithoutEscapeRight,
  filterWithoutEscape : filterWithoutEscapeLeft,
  filterWithEscapeLeft,
  filterWithEscapeRight,
  filterWithEscape : filterWithEscapeLeft,
  filter : filterWithoutEscapeLeft,

  _map,
  mapWithoutEscapeLeft,
  mapWithoutEscapeRight,
  mapWithoutEscape : mapWithoutEscapeLeft,
  mapWithEscapeLeft,
  mapWithEscapeRight,
  mapWithEscape : mapWithEscapeLeft,
  map : mapWithoutEscapeLeft,

}

//

Object.assign( _.props, Extension );

})();
