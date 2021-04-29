( function _l1_Buffer_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.buffer = _.buffer || Object.create( null );

// --
// implementation
// --

// function rawIs( src )
// {
//   let type = Object.prototype.toString.call( src );
//   // let result = type === '[object ArrayBuffer]';
//   // return result;
//   if( type === '[object ArrayBuffer]' || type === '[object SharedArrayBuffer]' )
//   return true;
//   return false;
// }
//
// //
//
// function typedIs( src )
// {
//   let type = Object.prototype.toString.call( src );
//   if( !/\wArray/.test( type ) )
//   return false;
//   if( type === '[object SharedArrayBuffer]' )
//   return false;
//   if( _.buffer.nodeIs( src ) )
//   return false;
//   return true;
// }
//
// //
//
// function viewIs( src )
// {
//   let type = Object.prototype.toString.call( src );
//   let result = type === '[object DataView]';
//   return result;
// }
//
// //
//
// function nodeIs( src )
// {
//   if( typeof BufferNode !== 'undefined' )
//   return src instanceof BufferNode;
//   return false;
// }
//
// //

function anyIs( src )
{
  if( !src )
  return false;
  if( typeof src !== 'object' )
  return false;
  if( !Reflect.has( src, 'byteLength' ) )
  return false;
  // return src.byteLength >= 0;
  // return typedIs( src ) || viewIs( src )  || rawIs( src ) || nodeIs( src );
  return true;
}

// //
//
// function bytesIs( src )
// {
//   if( _.buffer.nodeIs( src ) )
//   return false;
//   return src instanceof U8x;
// }

// --
// maker
// --

function _make_functor( onMake )
{

  return function _bufferMake( src, ins )
  {
    let result;

    /* */

    let length = ins;

    if( _.longIs( length ) || _.bufferNodeIs( length ) )
    {
      length = length.length
    }
    else if( _.bufferRawIs( length ) || _.bufferViewIs( length ) )
    {
      length = length.byteLength;
      ins = _.bufferViewIs( ins ) ? new U8x( ins.buffer ) : new U8x( ins );
    }
    else if( length === undefined || length === null )
    {
      if( src === null ) /* Dmytro : Does module has default buffer type? */
      {
        length = 0;
      }
      else if( _.longIs( src ) || _.bufferNodeIs( src ) )
      {
        length = src.length;
        ins = src;
        // src = null;
      }
      else if( _.bufferRawIs( src ) )
      {
        length = src.byteLength;
        ins = new U8x( src );
        // src = null;
      }
      else if( _.bufferViewIs( src ) )
      {
        length = src.byteLength;
        ins = new U8x( src.buffer );
        // src = null;
      }
      else if( _.number.is( src ) )
      {
        length = src;
        src = null;
      }
      else if( _.routine.is( src ) )
      {
        _.assert( 0, 'Unknown length of buffer' );
      }
      else _.assert( 0 );
    }
    else if( !_.number.is( length ) )
    {
      _.assert( 0, 'Unknown length of buffer' );
    }

    if( !length )
    length = 0;

    /* */

    if( _.number.is( ins ) )
    {
      if( _.bufferRawIs( src ) )
      ins = new U8x( src );
      else if( _.bufferViewIs( src ) )
      ins = new U8x( src.buffer )
      else if( _.longIs( src ) || _.bufferNodeIs( src ) )
      ins = src;
      else
      ins = null;
    }

    /* */

    let minLength;
    if( ins )
    minLength = Math.min( ins.length, length );
    else
    minLength = 0;

    /* */

    if( _.argumentsArray.is( src ) )
    src = _.routine.join( this.tools.defaultLong, this.tools.defaultLong.make );

    if( src === null )
    src = _.routine.join( this.tools.defaultLong, this.tools.defaultLong.make );

    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.number.isFinite( length ) );
    _.assert( _.routine.is( src ) || _.longIs( src ) || _.bufferAnyIs( src ), 'unknown type of array', _.entity.strType( src ) );

    result = onMake.call( this, src, ins, length, minLength );

    _.assert( _.bufferAnyIs( result ) || _.longLike( result ) );

    return result;
  }
}

//

/**
 * The routine make() returns a new buffer with the same type as source buffer {-src-}. New buffer fills by content of insertion buffer {-ins-}. If {-ins-} is
 * a number, the buffer fills by {-src-} content. The length of resulted buffer is equal to {-ins-}. If {-ins-} is not defined, then routine makes default Long type,
 * length of returned container defines from {-src-}.
 *
 * @param { BufferAny|Long|Function|Number|Null } src - Instance of any buffer, Long or constructor, defines type of returned buffer. If {-src-} is null,
 * then routine returns instance of default Long.
 * @param { Number|Long|Buffer|Null|Undefined } ins - Defines length and content of new buffer. If {-ins-} is null or undefined, then routine makes new container
 * with default Long type and fills it by {-src-} content.
 *
 * Note. Default Long type defines by descriptor {-longDescriptor-}. If descriptor not provided directly, then it is Array descriptor.
 *
 * @example
 * let got = _.make();
 * // returns []
 *
 * @example
 * let got = _.make( null );
 * // returns []
 *
 * @example
 * let got = _.make( null, null );
 * // returns []
 *
 * @example
 * let got = _.make( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.make( 3, null );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.make( new U8x( [ 1, 2, 3 ] ) );
 * // returns [ 1, 2, 3 ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * let got = _.make( new I16x( [ 1, 2, 3 ] ), null );
 * // returns [ 1, 2, 3 ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * _.make( new BufferRaw( 4 ), 6 );
 * // returns ArrayBuffer { [Uint8Contents]: <00 00 00 00 00 00>, byteLength: 6 }
 *
 * @example
 * _.make( new BufferRaw( 4 ), [ 1, 2, 3 ] );
 * // returns ArrayBuffer { [Uint8Contents]: <01 02 03>, byteLength: 3 }
 *
 * @example
 * _.make( F64x, [ 1, 2, 3 ] );
 * // returns Float64Array [ 1, 2, 3 ]
 *
 * @returns { BufferAny|Long }  Returns a buffer with source buffer {-src-} type filled by insertion container {-ins-} content.
 * If {-ins-} is not defined, then routine makes default Long type container and fills it by {-src-} content.
 * @function make
 * @throws { Error } If arguments.length is more than two.
 * @throws { Error } If {-src-} is not a Long, not a buffer, not a Number, not a constructor, not null.
 * @throws { Error } If {-src-} is constructor and second argument {-src-} is not provided.
 * @throws { Error } If {-src-} is constructor that returns not a Long, not a buffer value.
 * @throws { Error } If {-ins-} is not a number, not a Long, not a buffer, not null, not undefined.
 * @throws { Error } If {-ins-} or src.length has a not finite value.
 * @namespace Tools
 */

let make = _make_functor( function( /* src, ins, length, minLength */ )
{
  let src = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let length = arguments[ 2 ];
  let minLength = arguments[ 3 ];

  /* */

  let resultTyped;
  /* qqq : for Dmytro : bad solution! */
  if( _.routine.is( src ) )
  {
    if( src.name === 'make' || src.name === 'bound make' )
    resultTyped = src( length );
    else
    resultTyped = new src( length );
  }
  else if( _.bufferNodeIs( src ) )
  resultTyped = BufferNode.alloc( length );
  else if( _.bufferViewIs( src ) )
  resultTyped = new BufferView( new BufferRaw( length ) );
  else if( _.unrollIs( src ) )
  resultTyped = _.unroll.make( length );
  else
  resultTyped = new src.constructor( length );

  let result = resultTyped;
  if( _.bufferRawIs( result ) )
  resultTyped = new U8x( result );
  if( _.bufferViewIs( result ) )
  resultTyped = new U8x( result.buffer );

  for( let i = 0 ; i < minLength ; i++ )
  resultTyped[ i ] = ins[ i ];

  return result;
});

//

// function make( src, ins )
// {
//   let result, length;
//
//   if( _.argumentsArray.is( src ) )
//   src = _.array.make( src );
//
//   if( _.routine.is( src ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( ins === undefined )
//   {
//     length = _.definedIs( src.length ) ? src.length : src.byteLength;
//   }
//   else
//   {
//     if( _.longIs( ins ) || _.bufferNodeIs( ins ) )
//     length = ins.length;
//     else if( _.bufferRawIs( ins ) || _.bufferViewIs( ins ) )
//     {
//       length = ins.byteLength;
//       ins = _.bufferViewIs( ins ) ? new U8x( ins.buffer ) : new U8x( ins );
//     }
//     else if( _.number.is( ins ) )
//     length = ins;
//     else _.assert( 0 );
//   }
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.number.isFinite( length ) );
//   _.assert( _.routine.is( src ) || _.longIs( src ) || _.bufferAnyIs( src ), 'unknown type of array', _.entity.strType( src ) );
//
//   if( _.longIs( ins ) || _.bufferAnyIs( ins ) )
//   {
//     if( _.routine.is( src ) )
//     {
//       result = new src( length );
//       for( let i = 0 ; i < length ; i++ )
//       result[ i ] = ins[ i ];
//     }
//     else if( src.constructor === Array )
//     {
//       result = _.unrollIs( src ) ? _.unroll.make( ins ) : new( _.constructorJoin( src.constructor, ins ) );
//     }
//     else if( _.bufferRawIs( src ) )
//     result = new U8x( ins ).buffer;
//     else if( _.bufferViewIs( src ) )
//     result = new BufferView( new U8x( ins ).buffer );
//     else if ( _.bufferNodeIs( src ) )
//     result = BufferNode.from( ins );
//     else
//     result = new src.constructor( ins );
//
//   }
//   else
//   {
//     let insert;
//     if( _.bufferRawIs( src ) )
//     insert = new U8x( src );
//     else if( _.bufferViewIs( src ) )
//     insert = new U8x( src.buffer );
//     else
//     insert = src;
//
//     let resultTyped;
//     if( _.routine.is( src ) )
//     resultTyped = new src( length );
//     else if( _.bufferNodeIs( src ) )
//     resultTyped = BufferNode.alloc( length );
//     else if ( _.bufferViewIs( src ) )
//     resultTyped = new BufferView( new BufferRaw( length ) );
//     else if( _.unrollIs( src ) )
//     resultTyped = _.unroll.make( length );
//     else
//     resultTyped = new src.constructor( length );
//
//     result = resultTyped;
//     if( _.bufferRawIs( result ) )
//     resultTyped = new U8x( result );
//     if( _.bufferViewIs( result ) )
//     resultTyped = new U8x( result.buffer );
//
//     let minLen = Math.min( length, insert.length );
//     for( let i = 0 ; i < minLen ; i++ )
//     resultTyped[ i ] = insert[ i ];
//   }
//
//   return result;
// }
//
// function make( ins, src )
// {
//   let result, length;
//
//   if( _.routine.is( ins ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( _.argumentsArray.is( ins ) )
//   ins = [];
//
//   if( src === undefined )
//   {
//     length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
//   }
//   else
//   {
//     if( _.longIs( src ) || _.bufferNodeIs( src ) )
//     length = src.length;
//     else if( _.bufferRawIs( src ) || _.bufferViewIs( src ) )
//     length = src.byteLength;
//     else if( _.number.is( src ) )
//     length = src;
//     else _.assert( 0 );
//   }
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.number.isFinite( length ) );
//   _.assert( _.routine.is( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.entity.strType( ins ) );
//
//   if( _.longIs( src ) || _.bufferAnyIs( src ) )
//   {
//
//     if( ins.constructor === Array )
//     {
//       result = new( _.constructorJoin( ins.constructor, src ) );
//     }
//     else if( _.routine.is( ins ) )
//     {
//       if( ins.prototype.constructor.name === 'Array' )
//       result = _ArraySlice.call( src );
//       else
//       result = new ins( src );
//     }
//     else
//     result = new ins.constructor( src );
//
//   }
//   else
//   {
//     if( _.routine.is( ins ) )
//     result = new ins( length );
//     else
//     result = new ins.constructor( length );
//   }
//
//   return result;
// }

//

function _makeEmpty( src )
{
  if( arguments.length === 1 )
  {
    if( _.routineIs( src ) )
    {
      let result = new src( 0 );
      _.assert( _.long.is( result ) );
      return result;
    }
    return new src.constructor();
  }
  else
  {
    return this.tools.defaultBufferTyped.make();
  }
}

//

/* qqq2 : for junior : cover please */
function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  {
    _.assert( this.like( src ) || _.routineIs( src ) );
    return this._makeEmpty( src );
  }
  else
  {
    return this._makeEmpty();
  }
}

//

/**
 * The routine makeUndefined() returns a new buffer with the same type as source buffer {-src-}. The length of resulted buffer is equal to {-ins-}.
 * If {-ins-} is not defined, then routine makes default Long type, length of returned container defines from {-src-}.
 *
 * @param { BufferAny|Long|Function|Number|Null } src - Instance of any buffer, Long or constructor, defines type of returned buffer. If {-src-} is null,
 * then routine returns instance of default Long.
 * @param { Number|Long|Buffer|Null|Undefined } ins - Defines length of new buffer. If {-ins-} is null or undefined, then routine makes new container
 * with default Long type and length defined by {-src-}.
 *
 * Note. Default Long type defines by descriptor {-longDescriptor-}. If descriptor not provided directly, then it is Array descriptor.
 *
 * @example
 * let got = _.makeUndefined();
 * // returns []
 *
 * @example
 * let got = _.makeUndefined( null );
 * // returns []
 *
 * @example
 * let got = _.makeUndefined( null, null );
 * // returns []
 *
 * @example
 * let got = _.makeUndefined( 3 );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.makeUndefined( 3, null );
 * // returns [ undefined, undefined, undefined ]
 *
 * @example
 * let got = _.makeUndefined( new U8x( [ 1, 2, 3 ] ) );
 * // returns [ undefined, undefined, undefined ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * let got = _.makeUndefined( new I16x( [ 1, 2, 3 ] ), null );
 * // returns [ undefined, undefined, undefined ];
 * _.bufferTypedIs( got );
 * // log false
 *
 * @example
 * _.makeUndefined( new BufferRaw( 4 ), 6 );
 * // returns ArrayBuffer { [Uint8Contents]: <00 00 00 00 00 00>, byteLength: 6 }
 *
 * @example
 * _.makeUndefined( new BufferRaw( 4 ), [ 1, 2, 3 ] );
 * // returns ArrayBuffer { [Uint8Contents]: <00 00 00>, byteLength: 3 }
 *
 * @example
 * _.makeUndefined( F64x, [ 1, 2, 3 ] );
 * // returns Float64Array [ 0, 0, 0 ]
 *
 * @returns { BufferAny|Long }  Returns a buffer with source buffer {-src-} type filled by insertion container {-ins-} content.
 * If {-ins-} is not defined, then routine makes default Long type container and fills it by {-src-} content.
 * @function makeUndefined
 * @throws { Error } If arguments.length is more than two.
 * @throws { Error } If {-src-} is not a Long, not a buffer, not a Number, not a constructor, not null.
 * @throws { Error } If {-src-} is constructor and second argument {-src-} is not provided.
 * @throws { Error } If {-src-} is constructor that returns not a Long, not a buffer value.
 * @throws { Error } If {-ins-} is not a number, not a Long, not a buffer, not null, not undefined.
 * @throws { Error } If {-ins-} or src.length has a not finite value.
 * @namespace Tools
 */

let makeUndefined = _make_functor( function( /* src, ins, length, minLength */ )
{
  let src = arguments[ 0 ];
  let ins = arguments[ 1 ];
  let length = arguments[ 2 ];
  let minLength = arguments[ 3 ];

  /* */

  let result;
  /* qqq : for Dmytro : bad solution! */
  if( _.routine.is( src ) )
  {
    if( src.name === 'make' || src.name === 'bound make' )
    result = src( length );
    else
    result = new src( length );
  }
  else if( _.bufferNodeIs( src ) )
  result = BufferNode.alloc( length );
  else if( _.bufferViewIs( src ) )
  result = new BufferView( new BufferRaw( length ) );
  else if( _.unrollIs( src ) )
  result = _.unroll.make( length );
  else
  result = new src.constructor( length );

  return result;
});

// function makeUndefined( ins, src )
// {
//   let result, length;
//
//   if( _.routine.is( ins ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( src === undefined )
//   {
//     length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
//   }
//   else
//   {
//     if( _.longIs( src ) || _.bufferNodeIs( src ) )
//     length = src.length;
//     else if( _.bufferRawIs( src ) || _.bufferViewIs( src ) )
//     length = src.byteLength;
//     else if( _.number.is( src ) )
//     length = src;
//     else _.assert( 0 );
//   }
//
//   if( _.argumentsArray.is( ins ) )
//   ins = [];
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.number.isFinite( length ) );
//   _.assert( _.routine.is( ins ) || _.longIs( ins ) || _.bufferAnyIs( ins ), 'unknown type of array', _.entity.strType( ins ) );
//
//   if( _.routine.is( ins ) )
//   result = new ins( length );
//   else if( _.bufferNodeIs( ins ) )
//   result = BufferNode.alloc( length );
//   else if( _.bufferViewIs( ins ) )
//   result = new BufferView( new BufferRaw( length ) );
//   else if( _.unrollIs( ins ) )
//   result = _.unroll.make( length );
//   else
//   result = new ins.constructor( length );
//
//   return result;
// }
//
// //
//
// function makeUndefined( ins, src )
// {
//   let result, length;
//
//   throw _.err( 'not tested' );
//
//   if( _.routine.is( ins ) )
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( src === undefined )
//   {
//     length = _.definedIs( ins.length ) ? ins.length : ins.byteLength;
//   }
//   else
//   {
//     if( _.longIs( src ) )
//     length = src.length;
//     else if( _.bufferRawIs( src ) )
//     length = src.byteLength;
//     else if( _.number.is( src ) )
//     length = src;
//     else _.assert( 0 );
//   }
//
//   if( _.argumentsArray.is( ins ) )
//   ins = [];
//
//   _.assert( arguments.length === 1 || arguments.length === 2 );
//   _.assert( _.number.isFinite( length ) );
//   _.assert( _.routine.is( ins ) || _.longIs( ins ) || _.bufferRawIs( ins ), 'unknown type of array', _.entity.strType( ins ) );
//
//   if( _.longIs( src ) || _.bufferAnyIs( src ) )
//   {
//
//     if( ins.constructor === Array )
//     {
//       result = new( _.constructorJoin( ins.constructor, src ) );
//     }
//     else if( _.routine.is( ins ) )
//     {
//       if( ins.prototype.constructor.name === 'Array' )
//       result = _ArraySlice.call( src );
//       else
//       result = new ins( src );
//     }
//     else
//     result = new ins.constructor( src );
//
//   }
//   else
//   {
//     if( _.routine.is( ins ) )
//     result = new ins( length );
//     else
//     result = new ins.constructor( length );
//   }
//
//   return result;
// }

//

function bufferFromArrayOfArray( array, options )
{

  if( _.object.isBasic( array ) )
  {
    options = array;
    array = options.buffer;
  }

  options = options || Object.create( null );
  array = options.buffer = array || options.buffer;

  //

  if( options.BufferType === undefined ) options.BufferType = F32x;
  if( options.sameLength === undefined ) options.sameLength = 1;
  if( !options.sameLength )
  throw _.err( '_.bufferFromArrayOfArray :', 'different length of arrays is not implemented' );

  if( !array.length )
  return new options.BufferType();

  let scalarsPerElement = _.number.is( array[ 0 ].length ) ? array[ 0 ].length : array[ 0 ].len;

  if( !_.number.is( scalarsPerElement ) )
  throw _.err( '_.bufferFromArrayOfArray :', 'cant find out element length' );

  let length = array.length * scalarsPerElement;
  let result = new options.BufferType( length );
  let i = 0;

  for( let a = 0 ; a < array.length ; a++ )
  {
    let element = array[ a ];

    for( let e = 0 ; e < scalarsPerElement ; e++ )
    {
      result[ i ] = element[ e ];
      i += 1;
    }
  }

  return result;
}

//

/**
 * The bufferRawFromTyped() routine returns a new BufferRaw from (buffer.byteOffset) to the end of an BufferRaw of a typed array (buffer)
 * or returns the same BufferRaw of the (buffer), if (buffer.byteOffset) is not provided.
 *
 * @param { typedArray } buffer - Entity to check.
 *
 * @example
 * let buffer1 = new BufferRaw( 10 );
 * let view1 = new I8x( buffer1 );
 * _.bufferRawFromTyped( view1 );
 * // returns [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
 *
 * @example
 * let buffer2 = new BufferRaw( 10 );
 * let view2 = new I8x( buffer2, 2 );
 * _.bufferRawFromTyped( view2 );
 * // returns [ 0, 0, 0, 0, 0, 0 ]
 *
 * @returns { BufferRaw } Returns a new or the same BufferRaw.
 * If (buffer) is instance of '[object ArrayBuffer]', it returns buffer.
 * @function bufferRawFromTyped
 * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 1.
 * @throws { Error } Will throw an Error if (buffer) is not a typed array.
 * @namespace Tools
 */

function bufferRawFromTyped( buffer )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferTypedIs( buffer ) || _.bufferRawIs( buffer ) );

  if( _.bufferRawIs( buffer ) )
  return buffer;

  let result = buffer.buffer;

  if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
  result = result.slice( buffer.byteOffset || 0, buffer.byteLength );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function bufferRawFrom( buffer )
{
  let result;

  /*
  aaa : should do not copying when possible! |
  aaa Dmytro : not copying if it possible
  zzz
  */

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( buffer instanceof BufferRaw )
  return buffer;

  if( _.bufferNodeIs( buffer ) || _.arrayIs( buffer ) )
  {

    // result = buffer.buffer;
    result = new U8x( buffer ).buffer;

  }
  else if( _.bufferTypedIs( buffer ) || _.bufferViewIs( buffer ) )
  {

    result = buffer.buffer;
    if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
    // Dmytro : works not correctly, offset + length = right bound of new bufferRaw
    // result = result.slice( buffer.byteOffset || 0, buffer.byteLength );
    result = result.slice( buffer.byteOffset, buffer.byteOffset + buffer.byteLength );

  }
  else if( _.strIs( buffer ) )
  {

    if( _global_.BufferNode )
    {
      result = _.bufferRawFrom( BufferNode.from( buffer, 'utf8' ) );
    }
    else
    {
      result = _.encode.utf8ToBuffer( buffer ).buffer;
    }

  }
  else if( _global.File && buffer instanceof File )
  {
    let fileReader = new FileReaderSync();
    result = fileReader.readAsArrayBuffer( buffer );
    _.assert( 0, 'not tested' );
  }
  else _.assert( 0, () => 'Unknown type of source ' + _.entity.strType( buffer ) );

  _.assert( _.bufferRawIs( result ) );

  return result;
}

//

function bufferBytesFrom( buffer )
{
  let result;

  // Dmytro : missed
  if( _.bufferBytesIs( buffer ) )
  return buffer;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.bufferNodeIs( buffer ) )
  {

    _.assert( _.bufferRawIs( buffer.buffer ) )
    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else if( _.bufferRawIs( buffer ) )
  {

    result = new U8x( buffer, 0, buffer.byteLength );

  }
  else if( _.bufferTypedIs( buffer ) )
  {

    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else if( _.bufferViewIs( buffer ) )
  {

    result = new U8x( buffer.buffer, buffer.byteOffset, buffer.byteLength );

  }
  else
  {

    return _.bufferBytesFrom( _.bufferRawFrom( buffer ) );

  }

  _.assert( _.bufferBytesIs( result ) );

  return result;
}

//

function bufferBytesFromNode( src ) /* Dmytro : what does this code do? */
{
  _.assert( _.bufferNodeIs( src ) );
  let result = new U8x( buffer );
  return result;
}

//

function bufferNodeFrom( buffer )
{
  if( _.bufferNodeIs( buffer ) )
  return buffer;

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.bufferAnyIs( buffer ) || _.strIs( buffer ) || _.arrayIs( buffer ), 'Expects buffer, string of array, but got', _.entity.strType( buffer ) );

  /* */

  let result;

  if( buffer.length === 0 || buffer.byteLength === 0 )
  {
    result = BufferNode.from([]);
  }
  else if( _.strIs( buffer ) )
  {
    result = _.bufferNodeFrom( _.bufferRawFrom( buffer ) );
  }
  else if( buffer.buffer )
  {
    result = BufferNode.from( buffer.buffer, buffer.byteOffset, buffer.byteLength );
  }
  else
  {
    result = BufferNode.from( buffer );
  }

  _.assert( _.bufferNodeIs( result ) );

  return result;
}

// --
// declaration
// --

let BufferExtension =
{

  //

  NamespaceName : 'buffer',
  NamespaceQname : 'wTools/buffer',
  TypeName : 'Buffer',
  SecondTypeName : 'BufferAny',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  // rawIs,
  // typedIs,
  // viewIs,
  // nodeIs,
  anyIs,
  // bytesIs,

  is : anyIs,
  like : anyIs,

  // maker

  _make_functor, /* qqq : remove maybe */
  // _make, /* qqq : implement */
  make,
  _makeEmpty,
  makeEmpty,
  // _makeUndefined, /* qqq : implement */
  makeUndefined,

  // qqq : implement
  // _makeZeroed,
  // makeZeroed, /* qqq : for junior : cover */
  // _cloneShallow,
  // cloneShallow, /* qqq : for junior : cover */
  // from, /* qqq : for junior : cover */

}

Object.assign( _.buffer, BufferExtension );

//

let ToolsExtension =
{

  // dichotomy

  // bufferRawIs : rawIs.bind( _.buffer ),
  // bufferTypedIs : typedIs.bind( _.buffer ),
  // bufferViewIs : viewIs.bind( _.buffer ),
  // bufferNodeIs : nodeIs.bind( _.buffer ),
  bufferAnyIs : anyIs.bind( _.buffer ),
  bufferIs : anyIs.bind( _.buffer ),
  // bufferBytesIs : bytesIs.bind( _.buffer ),

  // maker

  /* qqq : attention is needed. ask */
  // _make_functor,
  bufferMake : make.bind( _.buffer ),
  bufferMakeEmpty : makeEmpty.bind( _.buffer ),
  bufferMakeUndefined : makeUndefined.bind( _.buffer ),

  bufferFromArrayOfArray,
  bufferRawFromTyped,
  bufferRawFrom,
  bufferBytesFrom,
  bufferBytesFromNode,
  bufferNodeFrom,

}

//

Object.assign( _, ToolsExtension );

})();
