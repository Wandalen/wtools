( function _l3_Buffer_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// dichotomy
// --

function constructorIsBuffer( src )
{
  if( !src )
  return false;
  if( !_.number.is( src.BYTES_PER_ELEMENT ) )
  return false;
  if( !_.strIs( src.name ) )
  return false;
  return src.name.indexOf( 'Array' ) !== -1;
}

// --
// maker
// --

function bufferCoerceFrom( o )
{
  let result;

  _.assert( arguments.length === 1 );
  _.assert( _.routine.is( o.bufferConstructor ), 'Expects bufferConstructor' );
  // _.map.assertHasOnly( o, bufferCoerceFrom.defaults );

  if( Config.debug )
  {
    for( let k in bufferCoerceFrom.defaults )
    {
      if( o[ k ] === undefined )
      throw Error( `Expects defined option::${k}` );
    }
    for( let k in o )
    {
      if( bufferCoerceFrom.defaults[ k ] === undefined )
      throw Error( `Unknown option::${k}` );
    }
  }

  if( o.src === null || _.number.is( o.src ) )
  {
    if( o.bufferConstructor.name === 'Buffer' )
    return o.bufferConstructor.alloc( o.src ? o.src : 0 );
    else if( o.bufferConstructor.name === 'DataView' )
    return new o.bufferConstructor( new U8x( o.src ).buffer )
    return new o.bufferConstructor( o.src );
  }

  _.assert( _.bufferAnyIs( o.src ) || _.long.is( o.src ) || _.strIs( o.src ) );

  if( _.strIs( o.src ) )
  o.src = _.bufferBytesFrom( o.src );

  /* */

  if( o.src.constructor === o.bufferConstructor )
  return o.src;

  /* */

  if( _.bufferViewIs( o.src ) )
  o.src = o.src.buffer.slice( o.src.byteOffset, o.src.byteLength );

  if( _.constructorIsBuffer( o.bufferConstructor ) )
  return new o.bufferConstructor( o.src );

  if( o.bufferConstructor.name === 'Buffer' )
  return o.bufferConstructor.from( o.src );

  if( o.bufferConstructor.name === 'DataView' )
  return new o.bufferConstructor( new U8x( o.src ).buffer );

  if( o.bufferConstructor.name === 'ArrayBuffer' )
  return new U8x( o.src ).buffer;

  if( o.bufferConstructor.name === 'SharedArrayBuffer' )
  {
    let srcTyped = _.bufferRawIs( o.src ) ? new U8x( o.src ) : o.src;
    let result = new BufferRawShared( srcTyped.length );
    let resultTyped = new U8x( result );
    for( let i = 0; i < srcTyped.length; i++ )
    resultTyped[ i ] = srcTyped[ i ];
    return result;
  }
}

bufferCoerceFrom.defaults =
{
  src : null,
  bufferConstructor : null,
}

// --
// equaler
// --

// /* qqq : extend test */
// function identicalShallow( src1, src2, o )
// {
//   _.assert( arguments.length === 2 || arguments.length === 3 );
//
//   if( !this.like( src1 ) )
//   return false;
//   if( !this.like( src2 ) )
//   return false;
//
//   return this._identicalShallow( src1, src2 );
// }
//
// //
//
// function _identicalShallow( src1, src2 )
// {
//   let result = true;
//
//   if( src1.length !== src2.length )
//   return false;
//
//   for( let s = 0 ; s < src1.length ; s++ )
//   {
//     result = src1[ s ] === src2[ s ];
//     if( result === false )
//     return false;
//   }
//
//   return result;
// }

function buffersTypedAreEquivalent( src1, src2, accuracy )
{

  if( !_.long.is( src1 ) )
  return false;
  if( !_.long.is( src2 ) )
  return false;

  if( src1.length !== src2.length )
  return false;

  if( accuracy === null || accuracy === undefined )
  accuracy = _.accuracy;

  for( let i = 0 ; i < src1.length ; i++ )
  if( Math.abs( src1[ i ] - src2[ i ] ) > accuracy )
  return false;

  return true;
}

//

function buffersTypedAreIdentical( src1, src2 )
{

  if( !_.bufferTypedIs( src1 ) )
  return false;
  if( !_.bufferTypedIs( src2 ) )
  return false;

  let t1 = Object.prototype.toString.call( src1 );
  let t2 = Object.prototype.toString.call( src2 );
  if( t1 !== t2 )
  return false;

  if( src1.length !== src2.length )
  return false;

  for( let i = 0 ; i < src1.length ; i++ )
  if( !Object.is( src1[ i ], src2[ i ] ) )
  return false;

  return true;
}

//

function buffersRawAreIdentical( src1, src2 )
{

  if( !_.bufferRawIs( src1 ) )
  return false;
  if( !_.bufferRawIs( src2 ) )
  return false;

  if( src1.byteLength !== src2.byteLength )
  return false;

  src1 = new U8x( src1 );
  src2 = new U8x( src2 );

  for( let i = 0 ; i < src1.length ; i++ )
  if( src1[ i ] !== src2[ i ] )
  return false;

  return true;
}

//

function buffersViewAreIdentical( src1, src2 )
{

  if( !_.bufferViewIs( src1 ) )
  return false;
  if( !_.bufferViewIs( src2 ) )
  return false;

  if( src1.byteLength !== src2.byteLength )
  return false;

  for( let i = 0 ; i < src1.byteLength ; i++ )
  if( src1.getUint8( i ) !== src2.getUint8( i ) )
  return false;

  return true;
}

//

function buffersNodeAreIdentical( src1, src2 )
{

  if( !_.bufferNodeIs( src1 ) )
  return false;
  if( !_.bufferNodeIs( src2 ) )
  return false;

  return src1.equals( src2 );
}

//

function _equivalentShallow( src1, src2, accuracy )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  if( _.bufferTypedIs( src1 ) )
  return _.buffersTypedAreEquivalent( src1, src2, accuracy );
  else if( _.bufferRawIs( src1 ) )
  return _.buffersRawAreIdentical( src1, src2 );
  else if( _.bufferViewIs( src1 ) )
  return _.buffersViewAreIdentical( src1, src2 );
  else if( _.bufferNodeIs( src1 ) )
  return _.buffersNodeAreIdentical( src1, src2 );
  else return false;

}

//

function equivalentShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( !_.buffer.like( src1 ) )
  return false;
  if( !_.buffer.like( src2 ) )
  return false;

  return _.buffer._equivalentShallow( src1, src2 );
}

//

function _identicalShallow( src1, src2 )
{

  let t1 = Object.prototype.toString.call( src1 );
  let t2 = Object.prototype.toString.call( src2 );
  if( t1 !== t2 )
  return false;

  if( _.bufferTypedIs( src1 ) )
  return _.buffersTypedAreIdentical( src1, src2 );
  else if( _.bufferRawIs( src1 ) )
  return _.buffersRawAreIdentical( src1, src2 );
  else if( _.bufferViewIs( src1 ) )
  return _.buffersViewAreIdentical( src1, src2 );
  else if( _.bufferNodeIs( src1 ) )
  return _.buffersNodeAreIdentical( src1, src2 );
  else return false;

}

//

function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( !_.buffer.like( src1 ) )
  return false;
  if( !_.buffer.like( src2 ) )
  return false;

  return _.buffer._identicalShallow( src1, src2 );
}

// --
// exporter
// --

function exportStringShallowCode( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( this.like( src ) );
  if( _.long.is( src ) )
  return _.long.exportStringShallowCode( src );
  return _.object._exportStringShallowCode( src );
}

//

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( this.like( src ) );
  if( _.long.is( src ) )
  return _.long.exportStringShallowDiagnostic( src );
  return _.object._exportStringShallowDiagnostic( src );
}

// --
// inspector
// --

function _lengthOf( src )
{
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return src.length;
  // if( _.bufferNode.is( src ) )
  // return src.length;
  return _.itself._lengthOf( ... arguments );
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
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return _.long._hasKey( ... arguments );
  return _.itself._hasKey( ... arguments );
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
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return _.long._hasCardinal( ... arguments );
  return _.itself._hasCardinal( ... arguments );
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
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return _.long._keyWithCardinal( ... arguments );
  return _.itself._keyWithCardinal( ... arguments );
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
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return _.long._elementWithKey( ... arguments );
  return _.itself._elementWithKey( ... arguments );
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
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return _.long._elementWithCardinal( ... arguments );
  return _.itself._elementWithCardinal( ... arguments );
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
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return _.long._elementWithKeySet( ... arguments );
  return _.itself._elementWithKeySet( ... arguments );
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
  if( _.long.is( src ) || _.bufferNode.is( src ) )
  return _.long._elementWithCardinalSet( ... arguments );
  return _.itself._elementWithCardinalSet( ... arguments );
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
// declaration
// --

let BufferExtension =
{

  /* qqq : implement routines _.long has. discuss first */

  // equaler

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,
  _equivalentShallow,
  equivalentShallow,
  equivalent : equivalentShallow,

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

}

Object.assign( _.buffer, BufferExtension );

//

let ToolsExtension =
{

  // dichotomy

  constructorIsBuffer,

  // maker

  bufferCoerceFrom, /* qqq : cover. seems broken */

  // equaler

  buffersTypedAreEquivalent, /* qqq : cover pelase */
  buffersTypedAreIdentical, /* qqq : cover pelase */
  buffersRawAreIdentical,
  buffersViewAreIdentical,
  buffersNodeAreIdentical,
  buffersAreIdentical : identicalShallow,
  buffersIdenticalShallow : identicalShallow,
  buffersAreEquivalent : equivalentShallow,
  buffersEquivalentShallow : equivalentShallow,

}

/* qqq : split namespace of buffers. ask */
Object.assign( _, ToolsExtension );

})();
