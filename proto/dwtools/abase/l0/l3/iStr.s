( function _iString_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// str
// --

/**
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * _.strIsIs( 'song' );
 * // returns true
 *
 * @example
 * _.strIs( 5 );
 * // returns false
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function strIs.
 * @namespace Tools
 */

function strIs( src )
{
  let result = Object.prototype.toString.call( src ) === '[object String]';
  return result;
}

//

function strsAreAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strIs( src[ s ] ) )
    return false;
    return true;
  }

  return _.strIs( src );
}

//

function strLike( src )
{
  if( _.strIs( src ) )
  return true;
  if( _.regexpIs( src ) )
  return true;
  return false
}

//

function strsLikeAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strLike( src[ s ] ) )
    return false;
    return true;
  }

  return strLike( src );
}

//

function strDefined( src )
{
  if( !src )
  return false;
  let result = Object.prototype.toString.call( src ) === '[object String]';
  return result;
}

//

function strsDefined( src )
{
  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.strDefined( src[ s ] ) )
    return false;
    return true;
  }
  return false;
}

//

function strHas( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), () => `Expects string, got ${_.strType( src )}` );
  _.assert( _.strLike( ins ), () => `Expects string-like, got ${_.strType( ins )}` );

  if( _.strIs( ins ) )
  return src.indexOf( ins ) !== -1;
  else
  return ins.test( src );

}

//

function strEquivalent( src1, src2 )
{
  let strIs1 = _.strIs( src1 );
  let strIs2 = _.strIs( src2 );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !strIs1 && strIs2 )
  return _.strEquivalent( src2, src1 );

  _.assert( _.strLike( src1 ), 'Expects string-like ( string or regexp )' );
  _.assert( _.strLike( src1 ), 'Expects string-like ( string or regexp )' );

  if( strIs1 && strIs2 )
  {
    return src1 === src2;
  }
  else if( strIs1 )
  {
    let matched = src2.exec( src1 );
    if( !matched )
    return false;
    if( matched[ 0 ].length !== src1.length )
    return false;
    return true;
  }
  else
  {
    return _.regexpIdentical( src1, src2 );
  }

  return false;
}

//

function strsEquivalent( src1, src2 )
{

  _.assert( _.strIs( src1 ) || _.regexpIs( src1 ) || _.longIs( src1 ), 'Expects string/regexp or array of strings/regexps {-src1-}' );
  _.assert( _.strIs( src2 ) || _.regexpIs( src2 ) || _.longIs( src2 ), 'Expects string/regexp or array of strings/regexps {-src2-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let isLong1 = _.longIs( src1 );
  let isLong2 = _.longIs( src2 );

  if( isLong1 && isLong2 )
  {
    let result = [];
    _.assert( src1.length === src2.length );
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      result[ i ] = _.strEquivalent( src1[ i ], src2[ i ] );
    }
    return result;
  }
  else if( !isLong1 && isLong2 )
  {
    let result = [];
    for( let i = 0, len = src2.length ; i < len; i++ )
    {
      result[ i ] = _.strEquivalent( src1, src2[ i ] );
    }
    return result;
  }
  else if( isLong1 && !isLong2 )
  {
    let result = [];
    for( let i = 0, len = src1.length ; i < len; i++ )
    {
      result[ i ] = _.strEquivalent( src1[ i ], src2 );
    }
    return result;
  }
  else
  {
    return _.strEquivalent( src1, src2 );
  }

}

// --
// converter
// --

function toStr( src, opts )
{
  let result = '';

  _.assert( arguments.length === 1 || arguments.length === 2 );

  result = _.toStrSimple( src );

  return result;
}

toStr.fields = toStr;
toStr.routines = toStr;

//

/**
 * Return in one string value of all arguments.
 *
 * @example
 * let args = _.toStrSimple( 'test2' );
 *
 * @return {string}
 * If no arguments return empty string
 * @function toStrSimple
 * @namespace Tools
 */

function toStrSimple()
{
  let result = '';
  let line;

  if( !arguments.length )
  return result;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];

    if( src && src.toStr && !Object.hasOwnProperty.call( src, 'constructor' ) )
    line = src.toStr();
    else try
    {
      line = String( src );
    }
    catch( err )
    {
      line = _.strType( src );
    }

    result += line;
    if( a < arguments.length-1 )
    result += ' ';

  }

  return result;
}

//

function strShort( src )
{
  let result = '';

  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  try
  {

    if( _.symbolIs( src ) )
    {
      let text = src.toString().slice( 7, -1 );
      let result = `{- Symbol${text ? ' ' + text + ' ' : ' '}-}`;
      return result;
    }
    else if( _.primitiveIs( src ) )
    {
      return String( src );
    }
    else if( _.vectorAdapterIs( src ) )
    {
      result += '{- VectorAdapter with ' + src.length + ' elements' + ' -}';
    }
    else if( _.setLike( src ) || _.hashMapLike( src ) )
    {

      result += '{- ' + strType( src ) + ' with ' + _.entityLength( src ) + ' elements -}';

    }
    else if( _.longLike( src ) )
    {
      result += '{- ' + _.strType( src ) + ' with ' + src.length + ' elements -}';
    }
    else if( _.objectLike( src ) )
    {

      if( _.routineIs( src.exportString ) )
      result += src.exportString({ verbosity : 1 });
      else
      result += '{- ' + strType( src ) + ' with ' + _.entityLength( src ) + ' elements' + ' -}';

    }
    else if( _.dateIs( src ) )
    {
      result += src.toISOString();
    }
    else
    {
      result += String( src );
    }

  }
  catch( err )
  {
    debugger;
    throw err;
  }

  return result;
}

// function _toStrShort( src,o )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.objectIs( o ),'Expects map {-o-}' );
//
//   var result = '';
//
//   try
//   {
//
//     if( _.vectorAdapterIs( src ) )
//     {
//       result += '{- VectorAdapter with ' + src.length + ' elements' + ' -}';
//     }
//     else if( _.errIs( src ) )
//     {
//       result += _ObjectToString.call( src );
//     }
//     else if( _.routineIs( src ) )
//     {
//       result += _toStrFromRoutine( src,o );
//     }
//     else if( _.numberIs( src ) )
//     {
//       result += _toStrFromNumber( src,o );
//     }
//     else if( _.strIs( src ) )
//     {
//
//       var optionsStr =
//       {
//         limitStringLength : o.limitStringLength ? Math.min( o.limitStringLength, 40 ) : 40,
//         stringWrapper : o.stringWrapper,
//         escaping : 1,
//       }
//
//       result = _toStrFromStr( src,optionsStr );
//
//     }
//     else if( _.setLike( src ) || _.hashMapLike( src ) )
//     {
//
//       result += '{- ' + strType( src ) + ' with ' + _.entityLength( src ) + ' elements -}';
//
//     }
//     else if( src && !_.objectIs( src ) && _.numberIs( src.length ) )
//     {
//
//       result += '{- ' + strType( src ) + ' with ' + src.length + ' elements -}';
//
//     }
//     else if( src instanceof Date )
//     {
//       result += src.toISOString();
//     }
//     else if( _.objectLike( src ) )
//     {
//
//       if( _.routineIs( src.exportString ) )
//       result += src.exportString({ verbosity : 1 });
//       else
//       result += '{- ' + strType( src ) + ' with ' + _.entityLength( src ) + ' elements' + ' -}';
//
//     }
//     else
//     {
//       result += String( src );
//     }
//
//   }
//   catch( err )
//   {
//     result = String( err );
//   }
//
//   return result;
// }

//

function strPrimitive( src )
{
  let result = '';

  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( src === null || src === undefined )
  return;

  if( _.primitiveIs( src ) )
  return String( src );

  return;
}

//

/**
 * Return type of src.
 *
 * @example
 * let str = _.strType( 'testing' );
 *
 * @param {*} src
 *
 * @return {string}
 * string name of type src
 * @function strType
 * @namespace Tools
 */

function strType( src ) /* qqq : cover please */
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.primitiveIs( src ) )
  if( src.constructor && src.constructor.name )
  return end( src.constructor.name );

  let result = _.strPrimitiveType( src );

  if( result === 'Object' )
  {
    if( Object.getPrototypeOf( src ) === null )
    result = 'Map.pure';
    else if( Object.getPrototypeOf( src ) !== Object.getPrototypeOf( Object ) )
    result = 'Map.prototyped';
  }

  return end( result );

  function end( result )
  {
    let translated = _.TranslatedType[ result ];
    if( translated )
    result = translated;
    return result;
  }

}

//

/**
 * Return primitive type of src.
 *
 * @example
 * let str = _.strPrimitiveType( 'testing' );
 *
 * @param {*} src
 *
 * @return {string}
 * string name of type src
 * @function strPrimitiveType
 * @namespace Tools
 */

function strPrimitiveType( src )
{

  let name = Object.prototype.toString.call( src );
  let result = /\[(\w+) (\w+)\]/.exec( name );

  if( !result )
  throw _.err( 'strType :', 'unknown type', name );
  return result[ 2 ];
}

//

function _strBeginOf( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( begin ) )
  {
    if( src.lastIndexOf( begin, 0 ) === 0 )
    return begin;
  }
  else if( _.regexpIs( begin ) )
  {
    let matched = begin.exec( src );
    if( matched && matched.index === 0 )
    return matched[ 0 ];
  }
  else _.assert( 0, 'Expects string-like ( string or regexp )' );

  return false;
}

//

function _strEndOf( src, end )
{

  _.assert( _.strIs( src ), 'Expects string' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( end ) )
  {
    if( src.indexOf( end, src.length - end.length ) !== -1 )
    return end;
  }
  else if( _.regexpIs( end ) )
  {
    // let matched = end.exec( src );
    let newEnd = RegExp( end.toString().slice(1, -1) + '$' );
    let matched = newEnd.exec( src );
    debugger;
    //if( matched && matched.index === 0 )
    if( matched && matched.index + matched[ 0 ].length === src.length )
    return matched[ 0 ];
  }
  else _.assert( 0, 'Expects string-like ( string or regexp )' );

  return false;
}

//

/**
 * Compares two strings.
 *
 * @param { String } src - Source string.
 * @param { String } begin - String to find at begin of source.
 *
 * @example
 * let scr = _.strBegins( "abc", "a" );
 * // returns true
 *
 * @example
 * let scr = _.strBegins( "abc", "b" );
 * // returns false
 *
 * @returns { Boolean } Returns true if param( begin ) is match with first chars of param( src ), otherwise returns false.
 * @function strBegins
 * @throws { Exception } If one of arguments is not a String.
 * @throws { Exception } If( arguments.length ) is not equal 2.
 * @namespace Tools
 */

function strBegins( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    return result === false ? result : true;
  }

  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== false )
    return true;
  }

  return false;
}

//

/**
 * Compares two strings.
 *
 * @param { String } src - Source string.
 * @param { String } end - String to find at end of source.
 *
 * @example
 * let scr = _.strEnds( "abc", "c" );
 * // returns true
 *
 * @example
 * let scr = _.strEnds( "abc", "b" );
 * // returns false
 *
 * @return { Boolean } Returns true if param( end ) is match with last chars of param( src ), otherwise returns false.
 * @function strEnds
 * @throws { Exception } If one of arguments is not a String.
 * @throws { Exception } If( arguments.length ) is not equal 2.
 * @namespace Tools
 */

function strEnds( src, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return result === false ? result : true;
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== false )
    return true;
  }

  return false;
}

//

/**
 * Finds occurrence of( end ) at the end of source( src ) and removes it if exists.
 * Returns begin part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
 *
 * @param { String } src - The source string.
 * @param { String } end - String to find.
 *
 * @example
 * _.strBeginOf( 'abc', 'c' );
 * // returns 'ab'
 *
 * @example
 * _.strBeginOf( 'abc', 'x' );
 * // returns undefined
 *
 * @returns { String } Returns part of source string without tail( end ) or undefined.
 * @throws { Exception } If all arguments are not strings;
 * @throws { Exception } If ( argumets.length ) is not equal 2.
 * @function strBeginOf
 * @namespace Tools
 */

function strBeginOf( src, begin )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ) || _.longIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( begin ) )
  {
    let result = _._strBeginOf( src, begin );
    return result;
  }

  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== false )
    return result;
  }

  return false;
}

//

/**
 * Finds occurrence of( begin ) at the begining of source( src ) and removes it if exists.
 * Returns end part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
 * otherwise returns undefined.
 *
 * @param { String } src - The source string.
 * @param { String } begin - String to find.
 *
 * @example
 * _.strEndOf( 'abc', 'a' );
 * // returns 'bc'
 *
 * @example
 * _.strEndOf( 'abc', 'c' );
 * // returns undefined
 *
 * @returns { String } Returns part of source string without head( begin ) or undefined.
 * @throws { Exception } If all arguments are not strings;
 * @throws { Exception } If ( argumets.length ) is not equal 2.
 * @function strEndOf
 * @namespace Tools
 */

function strEndOf( src, end )
{

  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return result;
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== false )
    return result;
  }

  return false;
}

//

/**
 * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param { String } src - Source string to parse.
 * @param { String } prefix - String that is to be dropped.
 * @returns { String } Returns string with result of prefix removement.
 *
 * @example
 * _.strRemoveBegin( 'example', 'exa' );
 * // returns mple
 *
 * @example
 * _.strRemoveBegin( 'example', 'abc' );
 * // returns example
 *
 * @function strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @namespace Tools
 *
 */

function strRemoveBegin( src, begin )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp {-begin-}'  );

  let result = src;
  let beginOf = _._strBeginOf( result, begin );
  if( beginOf !== false )
  result = result.substr( beginOf.length, result.length );
  return result;
}

//

/**
 * Removes occurrence of postfix ( end ) from the very end of string( src ).
 * Returns original string if no occurrence finded.
 * @param { String } src - Source string to parse.
 * @param { String } postfix - String that is to be dropped.
 * @returns { String } Returns string with result of postfix removement.
 *
 * @example
 * _.strRemoveEnd( 'example', 'le' );
 * // returns examp
 *
 * @example
 * _.strRemoveEnd( 'example', 'abc' );
 * // returns example
 *
 * @function strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @namespace Tools
 *
 */

function strRemoveEnd( src, end )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ), 'Expects string {-src-}' );
  _.assert( _.strIs( end ) || _.regexpIs( end ), 'Expects string/regexp {-end-}' );

  let result = src;
  let endOf = _._strEndOf( result, end );
  if( endOf !== false )
  result = result.substr( 0, result.length - endOf.length );

  return result;
}

//

/**
 * Finds substring or regexp ( insStr ) first occurrence from the source string ( srcStr ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( insStr ).
 *
 * @param { String } srcStr - Source string to parse.
 * @param { String } insStr - String/RegExp that is to be dropped.
 * @returns { String } Returns string with result of substring removement.
 *
 * @example
 * _.strRemove( 'source string', 's' );
 * // returns ource tring
 *
 * @example
 * _.strRemove( 'example', 's' );
 * // returns example
 *
 * @function strRemove
 * @throws { Exception } Throws a exception if( srcStr ) is not a String.
 * @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @namespace Tools
 *
 */

function strRemove( srcStr, insStr )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( srcStr ), 'Expects string {-src-}' );
  _.assert( _.strIs( insStr ) || _.regexpIs( insStr ), 'Expects string/regexp {-begin-}' );

  let result = srcStr;
  debugger;

  result = result.replace( insStr, '' );

  return result;
}

// --
// routines
// --

let TranslatedType =
{

  'BigUint64Array' : 'U64x',
  'Uint32Array' : 'U32x',
  'Uint16Array' : 'U16x',
  'Uint8Array' : 'U8x',
  'Uint8ClampedArray' : 'U8ClampedX',

  'BigInt64Array' : 'I64x',
  'Int32Array' : 'I32x',
  'Int16Array' : 'I16x',
  'Int8Array' : 'I8x',

  'Float64Array' : 'F64x',
  'Float32Array' : 'F32x',

  'Buffer' : 'BufferNode',
  'ArrayBuffer' : 'BufferRaw',
  'SharedArrayBuffer' : 'BufferRawShared',
  'Map' : 'HashMap',
  'WeakMap' : 'HashMapWeak',

}

let Extension =
{

  // checker

  strIs,
  strsAreAll,
  strLike,
  strsLikeAll,
  strDefined,
  strsDefined,

  strHas,

  strEquivalent,
  strsEquivalent,

  // converter

  toStr,
  toStrShort : toStr,
  strFrom : toStr,

  toStrSimple,
  strShort,
  strPrimitive,
  strType,
  strPrimitiveType,

  //

  _strBeginOf,
  _strEndOf,

  strBegins,
  strEnds,

  strBeginOf,
  strEndOf,

  strRemoveBegin,
  strRemoveEnd,
  strRemove,

  // fields

  TranslatedType,

}

//

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
