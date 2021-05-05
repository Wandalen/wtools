( function _l3_Long_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.long = _.long || Object.create( null );

// --
//
// --

function appender( src )
{
  _.assert( _.longLike( src ) );

  if( 'append' in src && _.routine.is( src.append ) )
  return appendWithAppend;
  else if( 'push' in src && _.routine.is( src.push ) )
  return appendWithPush;
  else if( 'add' in src && _.routine.is( src.add ) )
  return appendWithAdd;

  function appendWithAppend( val )
  {
    src.append( val );
  }

  function appendWithPush( val )
  {
    src.push( val );
  }

  function appendWithAdd( val )
  {
    src.add( val );
  }

}

//

function prepender( src )
{
  _.assert( _.longLike( src ) );

  if( 'prepend' in src && _.routine.is( src.prepend ) )
  return prependWithAppend;
  else if( 'push' in src && _.routine.is( src.push ) )
  return prependWithPush;
  else if( 'add' in src && _.routine.is( src.add ) )
  return prependWithAdd;

  function prependWithAppend( val )
  {
    src.prepend( val );
  }

  function prependWithPush( val )
  {
    src.unshift( val );
  }

  function prependWithAdd( val )
  {
    src.add( val );
  }

}

//

function eacher( src )
{

  _.assert( _.longLike( src ) );

  if( _.class.methodIteratorOf( src ) )
  return eachOf;
  else
  return eachLength;

  /* */

  function eachOf( onEach )
  {
    let k = 0;
    for( let val of src )
    {
      onEach( val, k, src );
      k += 1;
    }
    return k;
  }

  /* */

  function eachLength( onEach )
  {
    let k = 0;
    while( k < src.length )
    {
      let val = src[ k ];
      args2[ 0 ] = val;
      onEach( val, k, src );
      k += 1;
    }
    return k;
  }

  /* */

}

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
// exporter
// --

function _exportStringDiagnosticShallow( src )
{
  if( _.unroll.is( src ) )
  return `{- ${_.entity.strType( src )}.unroll with ${this._lengthOf( src )} elements -}`;
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

//

function _cardinalWithKey( src, key )
{
  if( key < 0 || src.length <= key )
  return -1;
  return key;
}

//

function cardinalWithKey( src, key )
{
  _.assert( this.like( src ) );
  return this._cardinalWithKey( src, key );
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

function _elementWithKeySet( dst, key, val )
{
  if( _.long.isFixedLength( dst ) )
  {
    if( key < 0 || dst.length <= key || !_.numberIs( key ) )
    return [ undefined, key, false ];
  }
  else
  {
    if( key < 0 || !_.numberIs( key ) )
    return [ undefined, key, false ];
  }
  dst[ key ] = val
  return [ val, key, true ];
}

//

function elementWithKeySet( dst, key, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( dst ) );
  return this._elementWithKeySet( dst, key, val );
}

//

function _elementWithCardinalSet( dst, cardinal, val )
{
  if( cardinal < 0 || dst.length <= cardinal || !_.numberIs( cardinal ) )
  return [ undefined, cardinal, false ];
  dst[ cardinal ] = val;
  return [ val, cardinal, true ];
}

//

function elementWithCardinalSet( dst, cardinal, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( dst ) );
  return this._elementWithCardinalSet( dst, cardinal, val );
}

// --
// container interface
// --

function _elementAppend( dst, val )
{
  dst.push( val );
  return dst.length-1;
}

//

function elementAppend( dst, val )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( dst ) );
  _.assert( !this.isFixedLength( dst ) );
  return this._elementAppend( dst, val );
}

//

function _elementPrepend( dst, val )
{
  dst.unshift( val );
  return 0;
}

//

function elementPrepend( dst, val )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( dst ) );
  _.assert( !this.isFixedLength( dst ) );
  return this._elementAppend( dst, val );
}

//

function _elementWithKeyDel( dst, key )
{
  if( !this._hasKey( dst, key ) )
  return false;
  dst.splice( key, 1 );
  return true;
}

//

function elementWithKeyDel( dst, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( dst ) );
  _.assert( !this.isFixedLength( dst ) );
  return this._elementWithKeyDel( dst, key );
}

//

function _elementWithCardinalDel( dst, cardinal )
{
  if( !this._hasKey( dst, cardinal ) )
  return false;
  dst.splice( cardinal, 1 );
  return true;
}

//

function elementWithCardinalDel( dst, cardinal )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( dst ) );
  _.assert( !this.isFixedLength( dst ) );
  return this._elementWithCardinalDel( dst, cardinal, val );
}

//

function _empty( dst )
{
  dst.splice( 0, dst.length );
  return dst;
}

//

function empty( dst )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( this.like( dst ) );
  _.assert( !this.isFixedLength( dst ) );
  return this._empty( dst );
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

//

function _filterAct0()
{
  const self = this;
  const dst = arguments[ 0 ];
  const src = arguments[ 1 ];
  const onEach = arguments[ 2 ];
  const each = arguments[ 3 ];
  const escape = arguments[ 4 ];
  const append = arguments[ 5 ];
  const isLeft = arguments[ 6 ];
  const isFixedLength = arguments[ 7 ];

  if( dst === src )
  each( src, function( val, k, c, src2 )
  {
    let val2 = onEach( val, k, c, src2, dst );
    let val3 = escape( val2 );
    if( val2 === undefined )
    self._elementDel( dst, k );
    else if( val3 === val )
    return
    else
    self._elementSet( dst, k, val3 );
  });
  else
  each( src, function( val, k, c, src2 )
  {
    let val2 = onEach( val, k, c, src2, dst );
    let val3 = escape( val2 );
    if( val2 === undefined )
    return;
    self._elementSet( dst, k, val3 );
  });

  // if( isFixedLength )
  // {
  //   _.assert( 0, 'not implemented' )
  // }
  // else
  // {
  //
  //   if( dst === src )
  //   each( src, function( val, k, c, src2 )
  //   {
  //     let val2 = onEach( val, k, c, src2, dst );
  //     let val3 = escape( val2 );
  //     if( val2 === undefined )
  //     self._elementDel( dst, k );
  //     else if( val3 === val )
  //     return;
  //     else
  //     self._elementSet( dst, k, val3 );
  //   });
  //   else
  //   each( src, function( val, k, c, src2 )
  //   {
  //     let val2 = onEach( val, k, c, src2, dst );
  //     let val3 = escape( val2 );
  //     if( val2 === undefined )
  //     return;
  //     append.call( self, dst, val3 );
  //   });
  //
  // }

  return dst;
}

//

function _filterAct1()
{
  let self = this;
  let dst = arguments[ 0 ];
  let src = arguments[ 1 ];
  let onEach = arguments[ 2 ];
  let isLeft = arguments[ 3 ];
  let eachRoutineName = arguments[ 4 ];
  let escape = arguments[ 5 ];
  let general = this.tools[ this.MostGeneralNamespaceName ];
  let append = isLeft ? this._elementAppend : this._elementPrepend;
  let isFixedLength = _.countable.isFixedLength( src );

  if( dst === null )
  {
    // if( isFixedLength )
    dst = this.makeUndefined( src );
    // else
    // dst = this.makeEmpty( src );
  }
  else if( dst === _.self )
  {
    dst = src;
  }

  if( Config.debug )
  {
    _.assert( arguments.length === 6, `Expects 3 arguments` );
    _.assert( this.is( dst ), () => `dst is not ${this.TypeName}` );
    _.assert( general.is( src ), () => `src is not ${general.TypeName}` );
    _.assert
    (
      !_.countable.isFixedLength( dst ) || this._lengthOf( dst ) === general._lengthOf( src )
      , () => `dst is ${this.TypeName} and lengthOf( dst ) is ${this._lengthOf( dst )}, but lengthOf( src ) is ${this._lengthOf( src )}`
    );
  }

  this._filterAct0( dst, src, onEach, general[ eachRoutineName ].bind( general ), escape, append, isLeft, isFixedLength );

  return dst;
}

//

function _mapAct0()
{
  const self = this;
  const dst = arguments[ 0 ];
  const src = arguments[ 1 ];
  const onEach = arguments[ 2 ];
  const each = arguments[ 3 ];
  const escape = arguments[ 4 ];

  if( dst === src )
  each( src, function( val, k, c, src2 )
  {
    let val2 = onEach( val, k, c, src2, dst );
    let val3 = escape( val2 );
    if( val3 === val || val2 === undefined )
    return;
    self._elementSet( dst, k, val3 );
  });
  else
  each( src, function( val, k, c, src2 )
  {
    let val2 = onEach( val, k, c, src2, dst );
    let val3 = escape( val2 );
    if( val2 === undefined )
    self._elementSet( dst, k, val );
    else
    self._elementSet( dst, k, val3 );
  });

  return dst;
}

//

function _mapAct1()
{
  let self = this;
  let dst = arguments[ 0 ];
  let src = arguments[ 1 ];
  let onEach = arguments[ 2 ];
  let isLeft = arguments[ 3 ];
  let eachRoutineName = arguments[ 4 ];
  let escape = arguments[ 5 ];
  let general = this.tools[ this.MostGeneralNamespaceName ];
  let append = isLeft ? this._elementAppend : this._elementPrepend;

  if( dst === null )
  dst = this.makeUndefined( src );
  else if( dst === _.self )
  dst = src;

  if( Config.debug )
  {
    _.assert( arguments.length === 6, `Expects 3 arguments` );
    _.assert( this.is( dst ), () => `dst is not ${this.TypeName}` );
    _.assert( general.is( src ), () => `src is not ${general.TypeName}` );
    _.assert
    (
      !_.countable.isFixedLength( dst ) || this._lengthOf( dst ) === general._lengthOf( src )
      , () => `lengthOf( dst ) is ${this._lengthOf( dst )}, but lengthOf( src ) is ${this._lengthOf( src )}`
    );
  }

  this._mapAct0( dst, src, onEach, general[ eachRoutineName ].bind( general ), escape, append );

  return dst;
}

// --
// declare
// --

let ToolsExtension =
{

}

Object.assign( _, ToolsExtension );

//

let LongExtension =
{

  // er

  /* qqq : ask */
  /* xxx : evolve */
  appender,
  prepender,
  eacher,

  // equaler

  _identicalShallow,
  identicalShallow : _.props.identicalShallow,
  identical : _.props.identical,
  _equivalentShallow : _identicalShallow,
  equivalentShallow : _.props.equivalentShallow,
  equivalent : _.props.equivalent,

  // exporter

  _exportStringDiagnosticShallow,
  exportStringDiagnosticShallow : _.props.exportStringDiagnosticShallow,
  _exportStringCodeShallow : _exportStringDiagnosticShallow,
  exportStringCodeShallow : _.props.exportStringCodeShallow,
  exportString : _.props.exportString,

  // inspector

  _lengthOf,
  lengthOf, /* qqq : cover */
  _hasKey,
  hasKey, /* qqq : cover */
  _hasCardinal,
  hasCardinal, /* qqq : cover */
  _keyWithCardinal,
  keyWithCardinal, /* qqq : cover */
  _cardinalWithKey,
  cardinalWithKey, /* qqq : cover */

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

  _elementAppend,
  elementAppend, /* qqq : cover */
  _elementPrepend,
  elementPrepend, /* qqq : cover */

  _elementWithKeyDel,
  elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel,
  elementWithCardinalDel,  /* qqq : cover */
  _elementDel : _elementWithKeyDel,
  elementDel : _elementWithKeyDel, /* qqq : cover */
  _empty,
  empty,  /* qqq : cover */

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

  _filterAct0,
  _filterAct1,
  filterWithoutEscapeLeft : _.props.filterWithoutEscapeLeft,
  filterWithoutEscapeRight : _.props.filterWithoutEscapeRight,
  filterWithoutEscape : _.props.filterWithoutEscape,
  filterWithEscapeLeft : _.props.filterWithEscapeLeft,
  filterWithEscapeRight : _.props.filterWithEscapeRight,
  filterWithEscape : _.props.filterWithEscape,
  filter : _.props.filter,

  _mapAct0,
  _mapAct1,
  mapWithoutEscapeLeft : _.props.mapWithoutEscapeLeft,
  mapWithoutEscapeRight : _.props.mapWithoutEscapeRight,
  mapWithoutEscape : _.props.mapWithoutEscape,
  mapWithEscapeLeft : _.props.mapWithEscapeLeft,
  mapWithEscapeRight : _.props.mapWithEscapeRight,
  mapWithEscape : _.props.mapWithEscape,
  map : _.props.map,

}

//

Object.assign( _.long, LongExtension );

})();
