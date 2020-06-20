(function _StrBasic_s_() {

'use strict';

/*

= articles

- strIsolate* difference

*/

//

let Self = _global_.wTools;
let _global = _global_;
let _ = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

let _arraySlice = _.longSlice;
let strType = _.strType;


// --
// checker
// --

function strIsHex( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1 );
  let parsed = parseInt( src, 16 )
  if( isNaN( parsed ) )
  return false;
  return parsed.toString( 16 ).length === src.length;
}

//

function strIsMultilined( src )
{
  if( !_.strIs( src ) )
  return false;
  if( src.indexOf( '\n' ) !== -1 )
  return true;
  return false;
}

//

function strHasAny( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( _.strHas( src, ins[ i ] ) )
    return true;
    return false;
  }

  return _.strHas( src, ins );
}

//

function strHasAll( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( !_.strHas( src, ins[ i ] ) )
    return false;
    return true;
  }

  return _.strHas( src, ins );
}

//

function strHasNone( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( _.strHas( src, ins[ i ] ) )
    return false;
    return true;
  }

  return !_.strHas( src, ins );
}

//

function strHasSeveral( src, ins )
{
  let result = 0;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayIs( ins ) )
  {
    for( let i = 0 ; i < ins.length ; i++ )
    if( _.strHas( src, ins[ i ] ) )
    result += 1;
    return result;
  }

  return _.strHas( src, ins ) ? 1 : 0;
}

//

function strsAnyHas( srcs, ins )
{
  _.assert( _.strIs( srcs ) || _.strsAreAll( srcs ) );
  _.assert( _.strIs( ins ) );

  if( _.strIs( srcs ) )
  return _.strHas( srcs, ins );

  return srcs.some( ( src ) => _.strHas( src, ins ) );
}

//

function strsAllHas( srcs, ins )
{
  _.assert( _.strIs( srcs ) || _.strsAreAll( srcs ) );
  _.assert( _.strIs( ins ) );

  if( _.strIs( srcs ) )
  return _.strHas( srcs, ins );

  return srcs.every( ( src ) => _.strHas( src, ins ) );
}

//

function strsNoneHas( srcs, ins )
{
  _.assert( _.strIs( srcs ) || _.strsAreAll( srcs ) );
  _.assert( _.strIs( ins ) );

  if( _.strIs( srcs ) )
  return !_.strHas( srcs, ins );

  return srcs.every( ( src ) => !_.strHas( src, ins ) );
}

// --
// evaluator
// --

/**
 * Returns number of occurrences of a substring( ins ) in a string( src ),
 * Expects two objects in order: source string, substring.
 * Returns zero if one of arguments is empty string.
 *
 * @param {string} src - Source string.
 * @param {string} ins - Substring.
 * @returns {Number} Returns number of occurrences of a substring in a string.
 *
 * @example
 * _.strCount( 'aabab', 'ab' );
 * // returns 2
 *
 * @example
 * _.strCount( 'aabab', '' );
 * // returns 0
 *
 * @method strCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( ins ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @namespace Tools
 *
 */

function strCount( src, ins )
{
  let result = 0;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( src ) );
  _.assert( _.strLike( ins ) );

  let i = 0;
  do
  {
    let found = _.strLeft( src, ins, [ i, src.length ] );
    if( found.entry === undefined )
    break;
    i = found.index + found.entry.length;
    if( !found.entry.length )
    i += 1;
    result += 1;
    _.assert( i !== -1, 'not tested' );
  }
  while( i !== -1 && i < src.length );

  return result;
}

//

function strStripCount( src, ins )
{
  return _.strCount( _.strLinesStrip( src ) , _.strLinesStrip( ins ) );
}

// //
//
// function strCountLeft( src, ins )
// {
//   let result = 0;
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( src ) );
//   _.assert( _.strIs( ins ) );
//
//   if( !ins.length )
//   return 0;
//
//   let i = 0;
//   do
//   {
//     if( src.substring( i, i+ins.length ) !== ins )
//     break;
//     result += 1;
//     i += ins.length;
//   }
//   while( i < src.length );
//
//   return result;
// }
//
// //
//
// function strCountRight( src, ins )
// {
//   let result = 0;
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( src ) );
//   _.assert( _.strIs( ins ) );
//
//   throw _.err( 'not tested' );
//
//   if( !ins.length )
//   return 0;
//
//   let i = src.length;
//   do
//   {
//     if( src.substring( i-ins.length, i ) !== ins )
//     break;
//     result += 1;
//     i -= ins.length;
//   }
//   while( i > 0 );
//
//   return result;
// }

//

function strsShortest( src )
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) || _.arrayLike( src ) );
  if( _.strIs( src ) )
  return src;
  return src.sort( ( a, b ) => a.length - b.length )[ 0 ];
}

//

function strsLongest()
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( src ) || _.arrayLike( src ) );
  if( _.strIs( src ) )
  return src;
  return src.sort( ( a, b ) => b.length - a.length )[ 0 ];
}

// --
// replacer
// --

// function _strRemovedBegin( src, begin )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( src ), 'Expects string {-src-}' );
//
//   let result = src;
//   let beginOf = _._strBeginOf( result, begin );
//   if( beginOf !== false )
//   result = result.substr( beginOf.length, result.length );
//
//   return result;
// }
//
// //
//
// /**
//  * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
//  * Returns original string if source( src ) does not have occurrence of ( prefix ).
//  *
//  * @param { String } src - Source string to parse.
//  * @param { String } prefix - String that is to be dropped.
//  * @returns { String } Returns string with result of prefix removement.
//  *
//  * @example
//  * _.strRemoveBegin( 'example', 'exa' );
//  * // returns mple
//  *
//  * @example
//  * _.strRemoveBegin( 'example', 'abc' );
//  * // returns example
//  *
//  * @function strRemoveBegin
//  * @throws { Exception } Throws a exception if( src ) is not a String.
//  * @throws { Exception } Throws a exception if( prefix ) is not a String.
//  * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
//  * @namespace Tools
//  *
//  */
//
// function strRemoveBegin( src, begin )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
//   _.assert( _.longIs( begin ) || _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
//
//   let result = [];
//   let srcIsArray = _.longIs( src );
//
//   if( _.strIs( src ) && !_.longIs( begin ) )
//   return _._strRemovedBegin( src, begin );
//
//   src = _.arrayAs( src );
//   begin = _.arrayAs( begin );
//   for( let s = 0, slen = src.length ; s < slen ; s++ )
//   {
//     let beginOf = false;
//     let src1 = src[ s ]
//     for( let b = 0, blen = begin.length ; b < blen ; b++ )
//     {
//       beginOf = _._strBeginOf( src1, begin[ b ] );
//       if( beginOf !== false )
//       break;
//     }
//     if( beginOf !== false )
//     src1 = src1.substr( beginOf.length, src1.length );
//     result[ s ] = src1;
//   }
//
//   if( !srcIsArray )
//   return result[ 0 ];
//
//   return result;
// }
//
// //
//
// function _strRemovedEnd( src, end )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.strIs( src ), 'Expects string {-src-}' );
//
//   let result = src;
//   let endOf = _._strEndOf( result, end );
//   if( endOf !== false )
//   result = result.substr( 0, result.length - endOf.length );
//
//   return result;
// }
//
// //
//
// /**
//  * Removes occurrence of postfix ( end ) from the very end of string( src ).
//  * Returns original string if no occurrence finded.
//  * @param { String } src - Source string to parse.
//  * @param { String } postfix - String that is to be dropped.
//  * @returns { String } Returns string with result of postfix removement.
//  *
//  * @example
//  * _.strRemoveEnd( 'example', 'le' );
//  * // returns examp
//  *
//  * @example
//  * _.strRemoveEnd( 'example', 'abc' );
//  * // returns example
//  *
//  * @function strRemoveEnd
//  * @throws { Exception } Throws a exception if( src ) is not a String.
//  * @throws { Exception } Throws a exception if( postfix ) is not a String.
//  * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
//  * @namespace Tools
//  *
//  */
//
// function strRemoveEnd( src, end )
// {
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( _.longIs( src ) || _.strIs( src ), 'Expects string or array of strings {-src-}' );
//   _.assert( _.longIs( end ) || _.strIs( end ) || _.regexpIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
//
//   let result = [];
//   let srcIsArray = _.longIs( src );
//
//   if( _.strIs( src ) && !_.longIs( end ) )
//   return _._strRemovedEnd( src, end );
//
//   src = _.arrayAs( src );
//   end = _.arrayAs( end );
//
//   for( let s = 0, slen = src.length ; s < slen ; s++ )
//   {
//     let endOf = false;
//     let src1 = src[ s ]
//     for( let b = 0, blen = end.length ; b < blen ; b++ )
//     {
//       endOf = _._strEndOf( src1, end[ b ] );
//       if( endOf !== false )
//       break;
//     }
//     if( endOf !== false )
//     src1 = src1.substr( 0, src1.length - endOf.length );
//     result[ s ] = src1;
//   }
//
//   if( !srcIsArray )
//   return result[ 0 ];
//
//   return result;
// }

//

function _strRemoved( srcStr, insStr )
{
  let result = srcStr;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( srcStr ), 'Expects string {-src-}' );

  if( !_.longIs( insStr ) )
  {
    result = result.replace( insStr, '' );
  }
  else
  {
    for( let i = 0; i < insStr.length; i++ )
    {
      result = result.replace( insStr[ i ], '' );
    }
  }

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

/*
aaa : extend coverage of routines strRemove, strReplace, make sure tests cover regexp cases
Dmytro : coverage is extended
*/

function strRemove( srcStr, insStr )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( srcStr ) || _.strLike( srcStr ), () => 'Expects string or array of strings {-srcStr-}, but got ' + _.strType( srcStr ) );

  if( _.longIs( insStr ) )
  for( let i = 0 ; i < insStr.length ; i++ )
  _.assert( _.strIs( insStr[ i ] ) || _.regexpIs( insStr[ i ] ), () => 'Expects string/regexp or array of strings/regexps' );
  else
  _.assert( _.strIs( insStr ) || _.regexpIs( insStr ), () => 'Expects string/regexp or array of strings/regexps' );
  //_.assert( _.longIs( insStr ) || _.strLike( insStr ), () => 'Expects string/regexp or array of strings/regexps {-begin-}' );

  let result = [];

  if( _.strIs( srcStr ) && !_.longIs( srcStr ) )
  return _._strRemoved( srcStr, insStr );

  srcStr = _.arrayAs( srcStr );

  for( let s = 0; s < srcStr.length; s++ )
  {
    let src = srcStr[ s ];
    result[ s ] = _._strRemoved( src, insStr );
  }

  if( !_.longIs( srcStr ) )
  return result[ 0 ];

  return result;
}

//

// function strReplaceBegin( src, begin, ins )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( ins ) || _.longIs( ins ), 'Expects {-ins-} as string/array of strings' );
//   if( _.longIs( begin ) && _.longIs( ins ) )
//   _.assert( begin.length === ins.length );
//
//   begin = _.arrayAs( begin );
//   let result = _.arrayAs( src ).slice();
//
//   for( let k = 0, srcLength = result.length; k < srcLength; k++ )
//   for( let j = 0, beginLength = begin.length; j < beginLength; j++ )
//   if( _.strBegins( result[ k ], begin[ j ] ) )
//   {
//     let prefix = _.longIs( ins ) ? ins[ j ] : ins;
//     _.assert( _.strIs( prefix ) );
//     result[ k ] = prefix + _.strRemoveBegin( result[ k ] , begin[ j ] );
//     break;
//   }
//
//   if( result.length === 1 && _.strIs( src ) )
//   return result[ 0 ];
//
//   return result;
// }
//
// //
//
// function strReplaceEnd( src, end, ins )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( ins ) || _.longIs( ins ), 'Expects {-ins-} as string/array of strings' );
//   if( _.longIs( end ) && _.longIs( ins ) )
//   _.assert( end.length === ins.length );
//
//   end = _.arrayAs( end );
//   let result = _.arrayAs( src ).slice();
//
//   for( let k = 0, srcLength = result.length; k < srcLength; k++ )
//   for( let j = 0, endLength = end.length; j < endLength; j++ )
//   if( _.strEnds( result[ k ], end[ j ] ) )
//   {
//     let postfix = _.longIs( ins ) ? ins[ j ] : ins;
//     _.assert( _.strIs( postfix ) );
//     result[ k ] = _.strRemoveEnd( result[ k ] , end[ j ] ) + postfix;
//   }
//
//   if( result.length === 1 && _.strIs( src ) )
//   return result[ 0 ];
//
//   return result;
// }
//
// //
//
// function _strReplaced( srcStr, insStr, subStr )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( srcStr ), 'Expects string {-src-}' );
//
//   let result = srcStr;
//
//   if( !_.longIs( insStr ) )
//   {
//     _.assert( _.strIs( subStr ), 'Expects string {-sub-}' );
//
//     result = result.replace( insStr, subStr );
//   }
//   else
//   {
//     _.assert( insStr.length === subStr.length, 'Search and replace strings must have same length' );
//     for( let i = 0; i < insStr.length; i++ )
//     {
//       _.assert( _.strIs( subStr[ i ] ), 'Expects string {-sub-}' );
//
//       result = result.replace( insStr[ i ], subStr[ i ] );
//     }
//   }
//
//   return result;
// }
//
// //
//
// /**
// * Finds substring or regexp ( insStr ) occurrence from the source string ( srcStr ) and replaces them
// * with the subStr values.
// * Returns original string if source( src ) does not have occurrence of ( insStr ).
// *
// * @param { String } srcStr - Source string to parse.
// * @param { String } insStr - String/RegExp that is to be replaced.
// * @param { String } subStr - Replacement String/RegExp.
// * @returns { String } Returns string with result of substring replacement.
// *
// * @example
// * _.strReplace( 'source string', 's', 'S' );
// * // returns Source string
// *
// * @example
// * _.strReplace( 'example', 's' );
// * // returns example
// *
// * @function strReplace
// * @throws { Exception } Throws a exception if( srcStr ) is not a String.
// * @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
// * @throws { Exception } Throws a exception if( subStr ) is not a String.
// * @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
// * @namespace Tools
// *
// */
//
// function strReplace( srcStr, insStr, subStr )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.longIs( srcStr ) || _.strIs( srcStr ), 'Expects string or array of strings {-src-}' );
//   _.assert( _.longIs( insStr ) || _.strIs( insStr ) || _.regexpIs( insStr ), 'Expects string/regexp or array of strings/regexps {-begin-}' );
//   _.assert( _.longIs( subStr ) || _.strIs( subStr ), 'Expects string or array of strings {-src-}' );
//
//   let result = [];
//   let srcIsArray = _.longIs( srcStr );
//
//   if( _.strIs( srcStr ) && !_.longIs( srcStr ) )
//   return _._strReplaced( srcStr, insStr, subStr );
//
//   srcStr = _.arrayAs( srcStr );
//
//   for( let s = 0; s < srcStr.length; s++ )
//   {
//     let src = srcStr[ s ];
//     result[ s ] = _._strReplaced( src, insStr, subStr );
//   }
//
//   if( !srcIsArray )
//   return result[ 0 ];
//
//   return result;
// }

//

/**
  * Prepends string( begin ) to the source( src ) if prefix( begin ) is not match with first chars of string( src ),
  * otherwise returns original string.
  * @param { String } src - Source string to parse.
  * @param { String } begin - String to prepend.
  *
  * @example
  * _.strPrependOnce( 'test', 'test' );
  * // returns 'test'
  *
  * @example
  * _.strPrependOnce( 'abc', 'x' );
  * // returns 'xabc'
  *
  * @returns { String } Returns result of prepending string( begin ) to source( src ) or original string.
  * @function strPrependOnce
  * @namespace Tools
  */

function strPrependOnce( src, begin )
{
  _.assert( _.strIs( src ) && _.strIs( begin ), 'Expects {-src-} and {-begin-} as strings' );
  if( src.lastIndexOf( begin, 0 ) === 0 )
  return src;
  else
  return begin + src;
}

//

/**
  * Appends string( end ) to the source( src ) if postfix( end ) is not match with last chars of string( src ),
  * otherwise returns original string.
  * @param {string} src - Source string to parse.
  * @param {string} end - String to append.
  *
  * @example
  * _.strAppendOnce( 'test', 'test' );
  * // returns 'test'
  *
  * @example
  * _.strAppendOnce( 'abc', 'x' );
  * // returns 'abcx'
  *
  * @returns {string} Returns result of appending string( end ) to source( src ) or original string.
  * @function strAppendOnce
  * @namespace Tools
  */

function strAppendOnce( src, end )
{
  _.assert( _.strIs( src ) && _.strIs( end ), 'Expects {-src-} and {-end-} as strings' );
  if( src.indexOf( end, src.length - end.length ) !== -1 )
  return src;
  else
  return src + end;
}

// --
// etc
// --

/**
 * Replaces occurrence of each word from array( ins ) in string( src ) with word
 * from array( sub ) considering it position.
 * @param {string} src - Source string to parse.
 * @param {array} ins - Array with strings to replace.
 * @param {string} sub - Array with new strings.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * _.strReplaceWords( ' my name is', [ 'my', 'name', 'is' ], [ 'your', 'cars', 'are' ] )
 * // returns ' your cars are'
 *
 * @method strReplaceWords
 * @throws { Exception } Throws a exception if( ins ) is not a Array.
 * @throws { Exception } Throws a exception if( sub ) is not a Array.
 * @throws { TypeError } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
 * @namespace Tools
 *
 */

function strReplaceWords( src, ins, sub )
{
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.strIs( src ) );
  _.assert( _.arrayIs( ins ) );
  _.assert( _.arrayIs( sub ) );
  _.assert( ins.length === sub.length );

  let result = src;
  for( let i = 0 ; i < ins.length ; i++ )
  {
    _.assert( _.strIs( ins[ i ] ) );
    let r = new RegExp( '(\\W|^)' + ins[ i ] + '(?=\\W|$)', 'gm' );
    result = result.replace( r, function( original )
    {

      if( original[ 0 ] !== sub[ i ][ 0 ] )
      return original[ 0 ] + sub[ i ];
      else
      return sub[ i ];

    });
  }

  return result;
}

// --
// etc
// --

/**
 * Routine strCommonLeft() finds common symbols from the begining of all strings passed to arguments list.
 * Routine uses first argument {-ins-} as a pattern. If some string doesn`t have the same first symbols
 * as the pattern {-ins-}, the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the start of each string.
 *
 * @param { String } ins - Sequence of possible symbols.
 * @param { String } ... - Another strings to search common sequence of symbols.
 *
 * @example
 * _.strCommonLeft( 'abcd', 'ab', 'abc', 'abd' );
 * // returns 'ab'
 *
 * @example
 * _.strCommonLeft( 'abcd', 'abc', 'abcd' );
 * // returns 'abc'
 *
 * @example
 * _.strCommonLeft( 'abcd', 'abc', 'd' )
 * // returns ''
 *
 * @returns { String } - Returns found common symbols.
 * @function strCommonLeft
 * @throws { Error } If {-ins-} is not a String.
 * @namespace Tools
 *
 */

function strCommonLeft( ins )
{

  if( arguments.length === 0 )
  return '';
  if( arguments.length === 1 )
  return ins;

  _.assert( _.strIs( ins ) );

  let length = +Infinity;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    length = Math.min( length, src.length );
  }

  let i = 0;
  for( ; i < length ; i++ )
  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src[ i ] !== ins[ i ] )
    return ins.substring( 0, i );
  }

  return ins.substring( 0, i );
}

//

/**
 * Routine strCommonRight() finds common symbols from the end of all strings passed to arguments list.
 * Routine uses first argument {-ins-} as a pattern. If some string doesn`t have the same end symbols
 * as the pattern {-ins-}, the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the end of each string.
 *
 * @param { String } ins - Sequence of possible symbols.
 * @param { String } ... - Another strings to search common sequence of symbols.
 *
 * @example
 * _.strCommonRight( 'same', 'came', 'me', 'code' );
 * // returns 'e'
 *
 * @example
 * _.strCommonRight( 'add', 'ddd', 'hdd' );
 * // returns 'dd'
 *
 * @example
 * _.strCommonRight( 'abcd', 'abc', 'd' )
 * // returns ''
 *
 * @returns { String } - Returns found common symbols.
 * @function strCommonRight
 * @throws { Error } If {-ins-} is not a String.
 * @namespace Tools
 *
 */

function strCommonRight( ins )
{

  if( arguments.length === 0 )
  return '';
  if( arguments.length === 1 )
  return ins;

  _.assert( _.strIs( ins ) );

  let length = +Infinity;

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    length = Math.min( length, src.length );
  }

  let i = 0;
  for( ; i < length ; i++ )
  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src[ src.length - i - 1 ] !== ins[ ins.length - i - 1 ] )
    return ins.substring( ins.length-i );
  }

  return ins.substring( ins.length-i );
}

//

/**
 * Routine strRandom() makes string with random length with random symbols defined
 * by option {-o.alphabet-}.
 * Routine accepts two types of parameter. First of them is options map {-o-}, the second
 * is Number (Range) {-length-}.
 *
 * First set of parameters
 * @param { Map } o - Options map.
 * @param { Number|Range } o.length - The length of random string.
 * The generated string may has fixed length if {-o.length-} defined by a number. If {-o.length-}
 * defined by a Range, then length of generated string is variable.
 * @param { String } o.alphabet - String with symbols for generated string.
 * Default range of symbols is 'a' - 'z'.
 *
 * Second set of parameters
 * @param { Number|Range } length - The length of random string.
 * The generated string may has fixed length if {-o.length-} defined by a number. If {-o.length-}
 * defined by a Range, then length of generated string is variable.
 * @param { String } o.alphabet - String with symbols for generated string.
 *
 * @example
 * _.strRandom( 0 );
 * // returns ''
 *
 * @example
 * _.strRandom( 2 );
 * // returns 'vb'
 * // string with 2 random symbols from 'a' to 'z'
 *
 * @example
 * _.strRandom( [ 1, 5 ] )
 * // returns 'soyx'
 * // string with length from 1 to 5 and random symbols from 'a' to 'z'
 *
 * @example
 * _.strRandom( { length : 3, alphabet : 'a' } )
 * // returns 'aaa'
 * // string with length 3 and symbol 'a'
 *
 * @example
 * _.strRandom( { length : [ 1, 5 ], alphabet : 'ab' } )
 * // returns 'aabab'
 * // string with length from 1 to 5 and random symbols 'a' and 'b'
 *
 * @returns { String } - Returns string with random length and symbols.
 * @function strRandom
 * @throws { Error } If arguments.length is less or more then one.
 * @throws { Error } If options map {-o-} has unnacessary fields.
 * @throws { Error } If parameter {-length-} or option {-o.length-} is not a Number and not a Range.
 * @namespace Tools
 *
 */

function strRandom( o )
{
  if( !_.mapIs( o ) )
  o = { length : o }

  o = _.routineOptions( strRandom, o );

  if( _.numberIs( o.length ) )
  o.length = [ o.length, o.length+1 ];
  if( o.alphabet === null )
  o.alphabet = _.strAlphabetFromRange([ 'a', 'z' ]);

  _.assert( _.rangeIs( o.length ) );
  _.assert( arguments.length === 1 );

  let length = o.length[ 0 ];
  if( o.length[ 0 ]+1 !== o.length[ 1 ] )
  {
    length = _.intRandom( o.length );
  }

  let result = '';
  for( let i = 0 ; i < length ; i++ )
  {
    result += o.alphabet[ _.intRandom( o.alphabet.length ) ];
  }
  return result;
}

strRandom.defaults =
{
  length : null,
  alphabet : null,
}

//

/**
 * Routine strAlphabetFromRange() generates a string with a sequence of symbols started from
 * first element of {-range-} and ended on previous element before last.
 *
 * @param { Range } range - Range of symbols. It is two elements array. Elements of {-range-}
 * should have a String or a Number type.
 *
 * @example
 * _.strAlphabetFromRange( [ 97, 98 ] );
 * // returns 'a'
 *
 * @example
 * _.strAlphabetFromRange( 97, 100 );
 * // returns 'abc'
 *
 * @example
 * _.strAlphabetFromRange( [ 'a', 'b' ] );
 * // returns 'a'
 *
 * @example
 * _.strAlphabetFromRange( 'a', 'd' );
 * // returns 'abc'
 *
 * @example
 * _.strAlphabetFromRange( [ 'a', 98 ] );
 * // returns 'a'
 *
 * @example
 * _.strAlphabetFromRange( 97, 'd' );
 * // returns 'abc'
 *
 * @returns { String } - Returns string with sequence of symbols.
 * @function strAlphabetFromRange
 * @throws { Error } If arguments.length is less then one.
 * @throws { Error } If range.length is less or more then two.
 * @throws { Error } If range[ 0 ] or range[ 1 ] is not a Number and not a String.
 * @namespace Tools
 *
 */

function strAlphabetFromRange( range )
{
  _.assert( _.arrayIs( range ) && range.length === 2 )
  _.assert( _.strIs( range[ 0 ] ) || _.numberIs( range[ 0 ] ) );
  _.assert( _.strIs( range[ 1 ] ) || _.numberIs( range[ 1 ] ) );
  if( _.strIs( range[ 0 ] ) )
  range[ 0 ] = range[ 0 ].charCodeAt( 0 );
  if( _.strIs( range[ 1 ] ) )
  range[ 1 ] = range[ 1 ].charCodeAt( 0 );
  let result = String.fromCharCode( ... _.longFromRange([ range[ 0 ], range[ 1 ] ]) );
  return result;
}

// --
// formatter
// --

function strForRange( range )
{
  let result;

  _.assert( arguments.length === 1 );
  _.assert( _.arrayIs( range ) );

  result = '[ ' + range[ 0 ] + '..' + range[ 1 ] + ' ]';

  return result;
}

//

function strForCall( nameOfRoutine, args, ret, o )
{
  let result = nameOfRoutine + '( ';
  let first = true;

  _.assert( _.arrayIs( args ) || _.objectIs( args ) );
  _.assert( arguments.length <= 4 );

  _.each( args, function( e, k )
  {

    if( first === false )
    result += ', ';

    if( _.objectIs( e ) )
    result += k + ' :' + _.toStr( e, o );
    else
    result += _.toStr( e, o );

    first = false;

  });

  result += ' )';

  if( arguments.length >= 3 )
  result += ' -> ' + _.toStr( ret, o );

  return result;
}

//

/**
 * Returns source string( src ) with limited number( limit ) of characters.
 * For example: src : 'string', limit : 4, result -> ''st'...'ng''.
 * Function can be called in two ways:
 * - First to pass only source string and limit;
 * - Second to pass all options map. Example: ( { src : 'string', limit : 4, wrap : 0, escaping : 0 } ).
 *
 * @param {string|object} o - String to parse or object with options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {number} [ o.limit=40 ] - Limit of characters in output.
 * @param {string} [ o.wrap='\'' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 * @returns {string} Returns simplified source string.
 *
 * @example
 * _.strStrShort( 'string', 4 );
 * // returns ''st' ... 'ng''
 *
 * @example
 * _.strStrShort( 's\ntring', 4 );
 * // returns ''s' ... 'ng''
 *
 * @example
 * _.strStrShort( 'string', 0 );
 * // returns 'string'
 *
 * @example
 * _.strStrShort( { src : 'string', limit : 4, wrap : '\'' } );
 * // returns ''st' ... 'ng''
 *
 * @example
 *  _.strStrShort( { src : 'simple', limit : 4, wrap : 0 } );
 * // returns 'si ... le'
 *
 * @example
 *  _.strStrShort( { src : 'si\x01mple', limit : 5, wrap : '\'' } );
 * // returns ''si' ... 'le''
 *
 * @example
 *  _.strStrShort( 's\x01t\x01ing string string', 14 );
 * // returns ''s\u0001' ... ' string''
 *
 * @method strStrShort
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } If( o ) is extended with unknown property.
 * @throws { Exception } If( o.src ) is not a String.
 * @throws { Exception } If( o.limit ) is not a Number.
 * @throws { Exception } If( o.wrap ) is not a String.
 *
 * @namespace Tools
 *
 */

function strStrShort( o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], limit : arguments[ 1 ] };
  else if( arguments.length === 1 )
  if( _.strIs( o ) )
  o = { src : arguments[ 0 ] };

  _.routineOptions( strStrShort, o );
  _.assert( _.strIs( o.src ) );
  _.assert( _.numberIs( o.limit ) );

  let str = o.src;

  if( str.length > o.limit && o.limit > 0  )
  {
    let b = Math.ceil( o.limit / 2 );
    let e = o.limit - b;

    let begin = str.substr( 0, b );
    let end = str.slice( -e );

    if( o.escaping )
    {

      begin = check( begin, b );
      end = check( end, e );

    }

    if( o.wrap )
    {
      _.assert( _.strIs( o.wrap ) );

      begin = o.wrap + begin + o.wrap;
      end = o.wrap + end + o.wrap;
    }

    if( o.limit === 1 )
    str = begin;
    else
    str = begin + ' ... ' +  end ;

  }
  else
  {
    if( o.escaping )
    str = _.strEscape( str );
  }

  return str;

  function check( s, l )
  {
    let temp = _.strEscape( s );

    if( temp.length > l )
    for( let i = s.length - 1; i >= 0 ; --i )
    {
      if( temp.length <= l )
      break;
      temp = temp.slice( 0, - ( _.strEscape( s[ i ] ).length ) );
    }

    return temp;
  }

}

strStrShort.defaults =
{
  src : null,
  limit : 40,
  wrap : '\'',
  escaping : 1
}

//

function strDifference( src1, src2 )
{
  _.assert( _.strIs( src1 ) );
  _.assert( _.strIs( src2 ) );

  if( src1 === src2 )
  return false;

  let l = Math.min( src1.length, src2.length );
  for( let i = 0 ; i < l ; i++ )
  if( src1[ i ] !== src2[ i ] )
  return src1.substr( 0, i ) + '*';

  return src1.substr( 0, l ) + '*';
}

// --
// transformer
// --

/**
 * Returns string with first letter converted to upper case.
 * Expects one object: the string to be formatted.
 *
 * @param {string} src - Source string.
 * @returns {String} Returns a string with the first letter capitalized.
 *
 * @example
 * _.strCapitalize( 'test string' );
 * // returns Test string
 *
 * @example
 * _.strCapitalize( 'another_test_string' );
 * // returns Another_test_string
 *
 * @method strCapitalize
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @namespace Tools
 *
 */

function strCapitalize( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  /*_.assert( src.length > 0 );*/
  /*_.assert( src.match(/(^\W)/) === null );*/

  if( src.length === 0 )
  return src;

  return src[ 0 ].toUpperCase() + src.substring( 1 );
}

//

function strDecapitalize( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( src.length === 0 )
  return src;

  return src[ 0 ].toLowerCase() + src.substring( 1 );
}

//

/**
 * Disables escaped characters in source string( src ).
 * Example: '\n' -> '\\n', '\u001b' -> '\\u001b' etc.
 * Returns string with disabled escaped characters, source string if nothing changed or  empty string if source is zero length.
 * @param {string} src - Source string.
 * @returns {string} Returns string with disabled escaped characters.
 *
 * @example
 * _.strEscape( '\nhello\u001bworld\n' );
 * // returns '\nhello\u001bworld\n'
 *
 * @example
 * _.strEscape( 'string' );
 * // returns 'string'
 *
 * @example
 * _.strEscape( 'str\'' );
 * // returns 'str\''
 *
 * @example
 * _.strEscape( '' );
 * // returns ''
 *
 * @method strEscape
 * @throw { Exception } If( src ) is not a String.
 * @namespace Tools
 *
 */

function strEscape( o )
{

  // 007f : ''
  // . . .
  // 009f : ''

  // 00ad : '­'

  // \'   single quote   byte 0x27 in ASCII encoding
  // \'   double quote   byte 0x22 in ASCII encoding
  // \\   backslash   byte 0x5c in ASCII encoding
  // \b   backspace   byte 0x08 in ASCII encoding
  // \f   form feed - new page   byte 0x0c in ASCII encoding
  // \n   line feed - new line   byte 0x0a in ASCII encoding
  // \r   carriage return   byte 0x0d in ASCII encoding
  // \t   horizontal tab   byte 0x09 in ASCII encoding
  // \v   vertical tab   byte 0x0b in ASCII encoding
  // source : http://en.cppreference.com/w/cpp/language/escape

  // console.log( _.process.memoryUsageInfo(), o.src.length );
  // if( o.src.length === 111691 )
  // debugger;

  if( _.strIs( o ) )
  o = { src : o }

  _.assert( _.strIs( o.src ), 'Expects string {-o.src-}, but got', _.strType( o.src ) );
  _.routineOptions( strEscape, o );

  let result = '';
  // let src = o.src.split( '' );
  // debugger;
  let stringWrapperCode = o.stringWrapper.charCodeAt( 0 );
  for( let s = 0 ; s < o.src.length ; s++ )
  {
    // let c = o.src[ s ];
    // let c = src[ s ];
    // let code = c.charCodeAt( 0 );
    let code = o.src.charCodeAt( s );

    // if( o.stringWrapper === '`' && c === '$' )
    if( o.stringWrapper === '`' && code === 0x24 /* $ */ )
    {
      result += '\\$';
    }
    else if( o.stringWrapper && code === stringWrapperCode )
    {
      result += '\\' + o.stringWrapper;
    }
    else if( 0x007f <= code && code <= 0x009f || code === 0x00ad /*|| code >= 65533*/ )
    {
      // result += _.strUnicodeEscape( c );
      result += _.strCodeUnicodeEscape( code );
    }
    else switch( code )
    {

      case 0x5c /* '\\' */ :
        result += '\\\\';
        break;

      case 0x08 /* '\b' */ :
        result += '\\b';
        break;

      case 0x0c /* '\f' */ :
        result += '\\f';
        break;

      case 0x0a /* '\n' */ :
        result += '\\n';
        break;

      case 0x0d /* '\r' */ :
        result += '\\r';
        break;

      case 0x09 /* '\t' */ :
        result += '\\t';
        break;

      default :

        if( code < 32 )
        {
          result += _.strCodeUnicodeEscape( code );
        }
        else
        {
          result += String.fromCharCode( code );
        }

    }

  }

  return result;
}

strEscape.defaults =
{
  src : null,
  stringWrapper : '\'',
}

//

/**
 * Converts number {-code-} into unicode representation.
 * Returns result of conversion as new string.
 *
 * @param { Number } code - The code to convert into unicode representation.
 *
 * @example
 * _.strCodeUnicodeEscape( 70 );
 * // returns '\\u0046'
 *
 * @example
 * _.strCodeUnicodeEscape( 77 );
 * // returns '\\u004d'
 *
 * @returns { String } - Returns string with result of conversion.
 * @function strCodeUnicodeEscape
 * @throws { Exception } If arguments.length is less or more then one.
 * @throws { Exception } If {-src-} is not a Number.
 * @namespace Tools
 *
 */

function strCodeUnicodeEscape( code )
{
  let result = '';

  _.assert( _.numberIs( code ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let h = code.toString( 16 );
  let d = _.strDup( '0', 4-h.length ) + h;

  result += '\\u' + d;

  return result;
}

//

/**
 * Converts source string {-str-} into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Returns result of conversion as new string or empty string if source has zero length.
 *
 * @param { String } str - Source string to parse.
 *
 * @example
 * _.strUnicodeEscape( 'abc' );
 * // returns \u0061\u0062\u0063;
 *
 * @example
 * _.strUnicodeEscape( 'world' );
 * // returns \u0077\u006f\u0072\u006c\u0064
 *
 * @example
 * _.strUnicodeEscape( '//test//' );
 * // returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 *
 * @returns { String } - Returns string with result of conversion.
 * @function strUnicodeEscape
 * @throws { Exception } If arguments.length is less or more then one.
 * @throws { Exception } If {-src-} is not a String.
 * @namespace Tools
 *
 */

function strUnicodeEscape( src )
{
  let result = '';

  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  for( let i = 0 ; i < src.length ; i++ )
  {
    let code = src.charCodeAt( i );
    result += _.strCodeUnicodeEscape( code );
  }

  return result;
}

//

function strReverse( srcStr )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  let result = '';
  for( let i = 0 ; i < srcStr.length ; i++ )
  result = srcStr[ i ] + result;
  return result;
}

// --
// stripper
// --

/**
 * Removes leading and trailing characters occurrences from source string( o.src ) finded by mask( o.stripper ).
 * If( o.stripper ) is not defined function removes leading and trailing whitespaces and escaped characters from( o.src ).
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ({ src : ' acb ', stripper : ' ' }).
 *
 * @param {string|object} o - Source string to parse or map with source( o.src ) and options.
 * @param {string} [ o.src=null ]- Source string to strip.
 * @param {string|array} [ o.stripper=' ' ]- Contains characters to remove.
 * @returns {string} Returns result of removement in a string.
 *
 * @example
 * _.strStrip( { src : 'aabaa', stripper : 'a' } );
 * // returns 'b'
 *
 * @example
 * _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } )
 * // returns 'b'
 *
 * @example
 * _.strStrip( { src : '   b  \n' } )
 * // returns 'b'
 *
 * @method strStrip
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o ) is not Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.stripper ) is not a String or Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @namespace Tools
 *
 */

function strStrip( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStrip, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayIs( o.src ) )
  {
    let result = [];
    for( let s = 0 ; s < o.src.length ; s++ )
    {
      let optionsForStrip = _.mapExtend( null, o );
      optionsForStrip.src = optionsForStrip.src[ s ];
      result[ s ] = strStrip( optionsForStrip );
    }
    return result;
  }

  _.assert( _.strIs( o.src ), 'Expects string or array o.src, got', _.strType( o.src ) );
  _.assert( _.strIs( o.stripper ) || _.arrayIs( o.stripper ) || _.regexpIs( o.stripper ), 'Expects string or array or regexp ( o.stripper )' );

  if( _.strIs( o.stripper ) || _.regexpIs( o.stripper ) )
  {
    let exp = o.stripper;
    if( _.strIs( exp ) )
    {
      exp = _.regexpEscape( exp );
      exp = new RegExp( exp, 'g' );
    }

    return o.src.replace( exp, '' );
  }
  else
  {

    _.assert( _.arrayIs( o.stripper ) );

    if( Config.debug )
    for( let s of o.stripper )
    _.assert( _.strIs( s, 'Expects string {-stripper[ * ]-}' ) );

    let b = 0;
    for( ; b < o.src.length ; b++ )
    if( o.stripper.indexOf( o.src[ b ] ) === -1 )
    break;

    let e = o.src.length-1;
    for( ; e >= 0 ; e-- )
    if( o.stripper.indexOf( o.src[ e ] ) === -1 )
    break;

    if( b >= e )
    return '';

    return o.src.substring( b, e+1 );
  }

}

strStrip.defaults =
{
  src : null,
  stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/gm,
}

//

/**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only leading whitespaces and escaped characters from( o.src ).
 *
 * @example
 * _.strStripLeft( ' a ' )
 * // returns 'a '
 *
 * @method strStripLeft
 * @namespace Tools
 *
 */

function strStripLeft( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStripLeft, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.strStrip( o );
}

strStripLeft.defaults =
{
  ... strStrip.defaults,
  stripper : /^(\s|\n|\0)+/gm,
}

// strStripLeft.defaults.__proto__ = strStrip.defaults;

//

/**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only trailing whitespaces and escaped characters from( o.src ).
 *
 * @example
 * _.strStripRight( ' a ' )
 * // returns ' a'
 *
 * @method strStripRight
 * @namespace Tools
 *
 */

function strStripRight( o )
{

  if( _.strIs( o ) || _.arrayIs( o ) )
  o = { src : o };

  _.routineOptions( strStripRight, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.strStrip( o );
}

strStripRight.defaults =
{
  ... strStrip.defaults,
  stripper : /(\s|\n|\0)+$/gm,
}

// strStripRight.defaults.__proto__ = strStrip.defaults;

//

/**
 * Removes whitespaces from source( src ).
 * If argument( sub ) is defined, function replaces whitespaces with it.
 *
 * @param {string} src - Source string to parse.
 * @param {string} sub - Substring that replaces whitespaces.
 * @returns {string} Returns a string with removed whitespaces.
 *
 * @example
 * _.strRemoveAllSpaces( 'a b c d e' );
 * // returns abcde
 *
 * @example
 * _.strRemoveAllSpaces( 'a b c d e', '*' );
 * // returns a*b*c*d*e
 *
 * @method strRemoveAllSpaces
 * @namespace Tools
 *
*/

function _strRemoveAllSpaces( src, sub )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( src ) );

  if( sub === undefined )
  sub = '';

  return src.replace( /\s/g, sub );
}

//

/**
 * Removes empty lines from the string passed by argument( srcStr ).
 *
 * @param {string} srcStr - Source string to parse.
 * @returns {string} Returns a string with empty lines removed.
 *
 * @example
 * _.strStripEmptyLines( 'first\n\nsecond' );
 * // returns
 * // first
 * // second
 *
 * @example
 * _.strStripEmptyLines( 'zero\n\nfirst\n\nsecond' );
 * // returns
 * // zero
 * // first
 * // second
 *
 * @method strStripEmptyLines
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @namespace Tools
 *
 */

function _strStripEmptyLines( srcStr )
{
  let result = '';
  let lines = srcStr.split( '\n' );

  _.assert( _.strIs( srcStr ) );
  _.assert( arguments.length === 1, 'Expects single argument' );

  for( let l = 0; l < lines.length; l += 1 )
  {
    let line = lines[ l ];

    if( !_.strStrip( line ) )
    continue;

    result += line + '\n';
  }

  result = result.substring( 0, result.length - 1 );
  return result;
}

// --
// splitter
// --

/**
 * Parses a source string( src ) and separates numbers and string values
 * in to object with two properties: 'str' and 'number', example of result: ( { str: 'bd', number: 1 } ).
 *
 * @param {string} src - Source string.
 * @returns {object} Returns the object with two properties:( str ) and ( number ),
 * with values parsed from source string. If a string( src ) doesn't contain number( s ),
 * function returns the object with value of string( src ).
 *
 * @example
 * _.strSplitStrNumber( 'bd1' );
 * // returns { str: 'bd', number: 1 }
 *
 * @example
 * _.strSplitStrNumber( 'bdxf' );
 * // returns { str: 'bdxf' }
 *
 * @method strSplitStrNumber
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @namespace Tools
 *
 */

function strSplitStrNumber( src )
{
  let result = Object.create( null );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ) );

  let mnumber = src.match(/\d+/);
  if( mnumber && mnumber.length )
  {
    let mstr = src.match(/[^\d]*/);
    result.str = mstr[ 0 ];
    result.number = _.numberFrom( mnumber[ 0 ] );
  }
  else
  {
    result.str = src;
  }

  return result;
}

//

function strSplitChunks( o )
{
  let result = Object.create( null );
  result.chunks = [];

  if( arguments.length === 2 )
  {
    o = arguments[ 1 ] || Object.create( null );
    o.src = arguments[ 0 ];
  }
  else
  {
    _.assert( arguments.length === 1, 'Expects single argument' );
    if( _.strIs( arguments[ 0 ] ) )
    o = { src : arguments[ 0 ] };
  }

  _.routineOptions( strSplitChunks, o );
  _.assert( _.strIs( o.src ), 'Expects string (-o.src-), but got', _.strType( o.src ) );

  if( !_.regexpIs( o.prefix ) )
  o.prefix = RegExp( _.regexpEscape( o.prefix ), 'm' );

  if( !_.regexpIs( o.postfix ) )
  o.postfix = RegExp( _.regexpEscape( o.postfix ), 'm' );

  let src = o.src;

  /* */

  let line = 0;
  let column = 0;
  let chunkIndex = 0;
  let begin = -1;
  let end = -1;
  do
  {

    /* begin */

    begin = src.search( o.prefix );
    if( begin === -1 ) begin = src.length;

    /* text chunk */

    if( begin > 0 )
    makeChunkStatic( begin );

    /* break */

    if( !src )
    {
      if( !result.chunks.length )
      makeChunkStatic( 0 );
      break;
    }

    /* end */

    end = src.search( o.postfix );
    if( end === -1 )
    {
      result.lines = src.split( '\n' ).length;
      result.error = _.err( 'Openning prefix', o.prefix, 'of chunk #' + result.chunks.length, 'at'+line, 'line does not have closing tag :', o.postfix );
      return result;
    }

    /* code chunk */

    let chunk = makeChunkDynamic();

    /* wind */

    chunkIndex += 1;
    line += _.strLinesCount( chunk.prefix + chunk.code + chunk.postfix ) - 1;

  }
  while( src );

  return result;

  /* - */

  function colAccount( text )
  {
    let i = text.lastIndexOf( '\n' );

    if( i === -1 )
    {
      column += text.length;
    }
    else
    {
      column = text.length - i;
    }

    _.assert( column >= 0 );
  }

  /* - */

  function makeChunkStatic( begin )
  {
    let chunk = Object.create( null );
    chunk.line = line;
    chunk.text = src.substring( 0, begin );
    chunk.index = chunkIndex;
    chunk.kind = 'static';
    result.chunks.push( chunk );

    src = src.substring( begin );
    line += _.strLinesCount( chunk.text ) - 1;
    chunkIndex += 1;

    colAccount( chunk.text );
  }

  /* - */

  function makeChunkDynamic()
  {
    let chunk = Object.create( null );
    chunk.line = line;
    chunk.column = column;
    chunk.index = chunkIndex;
    chunk.kind = 'dynamic';
    chunk.prefix = src.match( o.prefix )[ 0 ];
    chunk.code = src.substring( chunk.prefix.length, end );
    if( o.investigate )
    {
      chunk.lines = chunk.code.split( '\n' );
      chunk.tab = /^\s*/.exec( chunk.lines[ chunk.lines.length-1 ] )[ 0 ];
    }

    /* postfix */

    src = src.substring( chunk.prefix.length + chunk.code.length );
    chunk.postfix = src.match( o.postfix )[ 0 ];
    src = src.substring( chunk.postfix.length );

    result.chunks.push( chunk );
    return chunk;
  }

}

strSplitChunks.defaults =
{
  src : null,
  investigate : 1,
  prefix : '//>-' + '->//',
  postfix : '//<-' + '-<//',
}
//
// //
//
// function strSplitsCoupledGroup( o )
// {
//
//   if( _.arrayIs( o ) )
//   o = { splits : o }
//
//   o = _.routineOptions( strSplitsCoupledGroup, o );
//
//   o.prefix = _.arrayAs( o.prefix );
//   o.postfix = _.arrayAs( o.postfix );
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.regexpsLike( o.prefix ) );
//   _.assert( _.regexpsLike( o.postfix ) );
//
//   let level = 0;
//   let begins = [];
//   for( let i = 0 ; i < o.splits.length ; i++ )
//   {
//     let element = o.splits[ i ];
//
//     if( _.regexpsTestAny( o.prefix, element ) )
//     {
//       begins.push( i );
//     }
//     else if( _.regexpsTestAny( o.postfix, element ) )
//     {
//       if( begins.length === 0 && !o.allowingUncoupledPostfix )
//       throw _.err( `"${ element }" does not have complementing openning\n` );
//
//       if( begins.length === 0 )
//       continue;
//
//       let begin = begins.pop();
//       let end = i;
//       let l = end-begin;
//
//       _.assert( l >= 0 )
//       let newElement = o.splits.splice( begin, l+1, null );
//       o.splits[ begin ] = newElement;
//
//       i -= l;
//     }
//
//   }
//
//   if( begins.length && !o.allowingUncoupledPrefix )
//   {
//     debugger;
//     throw _.err( `"${ begins[ begins.length-1 ] }" does not have complementing closing\n` );
//   }
//
//   return o.splits;
// }
//
// strSplitsCoupledGroup.defaults =
// {
//   splits : null,
//   prefix : '"',
//   postfix : '"',
//   allowingUncoupledPrefix : 0,
//   allowingUncoupledPostfix : 0,
// }
//
// //
//
// function strSplitsUngroupedJoin( o )
// {
//
//   if( _.arrayIs( o ) )
//   o = { splits : o }
//   o = _.routineOptions( strSplitsUngroupedJoin, o );
//
//   let s = o.splits.length-1;
//   let l = null;
//
//   while( s >= 0 )
//   {
//     let split = o.splits[ s ];
//
//     if( _.strIs( split ) )
//     {
//       if( l === null )
//       l = s;
//     }
//     else if( l !== null )
//     {
//       join();
//     }
//
//     s -= 1;
//   }
//
//   if( l !== null )
//   join();
//
//   return o.splits;
//
//   /* */
//
//   function join()
//   {
//     if( s+1 < l )
//     {
//       let element = o.splits.slice( s+1, l+1 ).join( '' );
//       o.splits.splice( s+1, l+1, element );
//     }
//     l = null;
//   }
//
// }
//
// strSplitsUngroupedJoin.defaults =
// {
//   splits : null,
// }
//
// //
//
// function strSplitsQuotedRejoin_pre( routine, args )
// {
//   let o = args[ 0 ];
//
//   _.routineOptions( routine, o );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( args.length === 1, 'Expects one or two arguments' );
//   _.assert( _.objectIs( o ) );
//
//   if( o.quoting )
//   {
//
//     if( _.boolLike( o.quoting ) )
//     {
//       if( !o.quotingPrefixes )
//       o.quotingPrefixes = [ '"' ];
//       if( !o.quotingPostfixes )
//       o.quotingPostfixes = [ '"' ];
//     }
//     else if( _.strIs( o.quoting ) || _.regexpIs( o.quoting ) || _.arrayIs( o.quoting ) )
//     {
//       _.assert( !o.quotingPrefixes );
//       _.assert( !o.quotingPostfixes );
//       o.quoting = _.arrayAs( o.quoting );
//       o.quotingPrefixes = o.quoting.map( ( q ) => _.arrayIs( q ) ? q[ 0 ] : q );
//       o.quotingPostfixes = o.quoting.map( ( q ) => _.arrayIs( q ) ? q[ 0 ] : q );
//       o.quoting = true;
//     }
//     else _.assert( 0, 'unexpected type of {-o.quoting-}' );
//
//     if( Config.debug )
//     {
//       _.assert( o.quotingPrefixes.length === o.quotingPostfixes.length );
//       _.assert( _.boolLike( o.quoting ) );
//       o.quotingPrefixes.forEach( ( q ) => _.assert( _.strIs( q ) ) );
//       o.quotingPostfixes.forEach( ( q ) => _.assert( _.strIs( q ) ) );
//     }
//
//   }
//
//   return o;
// }
//
// //
//
// function strSplitsQuotedRejoin_body( o )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.arrayIs( o.splits ) );
//
//   /* quoting */
//
//   if( o.quoting )
//   for( let s = 1 ; s < o.splits.length ; s += 1 )
//   {
//     let split = o.splits[ s ];
//     let s2;
//
//     let q = o.quotingPrefixes.indexOf( split );
//     if( q >= 0 )
//     {
//       let postfix = o.quotingPostfixes[ q ];
//       for( s2 = s+2 ; s2 < o.splits.length ; s2 += 1 )
//       {
//         let split2 = o.splits[ s2 ];
//         if( split2 === postfix )
//         {
//           let bextra = 0;
//           let eextra = 0;
//           if( o.inliningQuoting )
//           {
//             s -= 1;
//             bextra += 1;
//             s2 += 1;
//             eextra += 1;
//           }
//           let splitNew = o.splits.splice( s, s2-s+1, null );
//           if( !o.preservingQuoting )
//           {
//             splitNew.splice( bextra, 1 );
//             splitNew.splice( splitNew.length-1-eextra, 1 );
//           }
//           splitNew = splitNew.join( '' );
//           o.splits[ s ] = splitNew;
//           s2 = s;
//           break;
//         }
//       }
//     }
//
//     /* if complementing postfix not found */
//
//     if( s2 >= o.splits.length )
//     {
//       if( !_.longHas( o.delimeter, split ) )
//       {
//         let splitNew = o.splits.splice( s, 2 ).join( '' );
//         o.splits[ s-1 ] = o.splits[ s-1 ] + splitNew;
//       }
//       else
//       {
//       }
//     }
//
//   }
//
//   return o.splits;
// }
//
// strSplitsQuotedRejoin_body.defaults =
// {
//   quoting : 1,
//   quotingPrefixes : null,
//   quotingPostfixes : null,
//   preservingQuoting : 1,
//   inliningQuoting : 1,
//   splits : null,
//   delimeter : null,
// }
//
// //
//
// let strSplitsQuotedRejoin = _.routineFromPreAndBody( strSplitsQuotedRejoin_pre, strSplitsQuotedRejoin_body );
//
// // --
// //
// // --
//
// function strSplitsDropDelimeters_pre( routine, args )
// {
//   let o = args[ 0 ];
//
//   _.routineOptions( routine, o );
//
//   if( _.strIs( o.delimeter ) )
//   o.delimeter = [ o.delimeter ];
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( args.length === 1 );
//   _.assert( _.objectIs( o ) );
//
//   return o;
// }
//
// //
//
// function strSplitsDropDelimeters_body( o )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.arrayIs( o.splits ) );
//
//   /* stripping */
//
//   // if( o.delimeter.some( ( d ) => _.regexpIs( d ) ) )
//   // debugger;
//
//   for( let s = o.splits.length-1 ; s >= 0 ; s-- )
//   {
//     let split = o.splits[ s ];
//
//     if( _.regexpsTestAny( o.delimeter, split ) )
//     o.splits.splice( s, 1 );
//
//     // if( _.longHas( o.delimeter, split ) )
//     // o.splits.splice( s, 1 );
//     //
//     // if( s % 2 === 1 )
//     // o.splits.splice( s, 1 );
//
//   }
//
//   return o.splits;
// }
//
// strSplitsDropDelimeters_body.defaults =
// {
//   splits : null,
//   delimeter : null,
// }
//
// //
//
// let strSplitsDropDelimeters = _.routineFromPreAndBody( strSplitsDropDelimeters_pre, strSplitsDropDelimeters_body );
//
// // --
// //
// // --
//
// function strSplitsStrip_pre( routine, args )
// {
//   let o = args[ 0 ];
//
//   _.routineOptions( routine, o );
//
//   if( o.stripping && _.boolLike( o.stripping ) )
//   o.stripping = _.strStrip.defaults.stripper;
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( args.length === 1 );
//   _.assert( _.objectIs( o ) );
//   _.assert( !o.stripping || _.strIs( o.stripping ) || _.regexpIs( o.stripping ) );
//
//   return o;
// }
//
// //
//
// function strSplitsStrip_body( o )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.arrayIs( o.splits ) );
//
//   /* stripping */
//
//   for( let s = 0 ; s < o.splits.length ; s++ )
//   {
//     let split = o.splits[ s ];
//
//     if( o.stripping )
//     split = _.strStrip({ src : split, stripper : o.stripping });
//
//     o.splits[ s ] = split;
//
//   }
//
//   return o.splits;
// }
//
// strSplitsStrip_body.defaults =
// {
//   stripping : 1,
//   splits : null,
// }
//
// //
//
// let strSplitsStrip = _.routineFromPreAndBody( strSplitsStrip_pre, strSplitsStrip_body );
//
// // --
// //
// // --
//
// function strSplitsDropEmpty_pre( routine, args )
// {
//   let o = args[ 0 ];
//
//   _.routineOptions( routine, o );
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( args.length === 1 );
//   _.assert( _.objectIs( o ) );
//
//   return o;
// }
//
// //
//
// function strSplitsDropEmpty_body( o )
// {
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.arrayIs( o.splits ) );
//
//   /* stripping */
//
//   for( let s = 0 ; s < o.splits.length ; s++ )
//   {
//     let split = o.splits[ s ];
//
//     if( !split )
//     {
//       o.splits.splice( s, 1 );
//       s -= 1;
//     }
//
//   }
//
//   return o.splits;
// }
//
// strSplitsDropEmpty_body.defaults =
// {
//   splits : null,
// }
//
// //
//
// let strSplitsDropEmpty = _.routineFromPreAndBody( strSplitsDropEmpty_pre, strSplitsDropEmpty_body );
//
// // --
// //
// // --
//
// function strSplitFast_pre( routine, args )
// {
//   let o = args[ 0 ];
//
//   if( args.length === 2 )
//   o = { src : args[ 0 ], delimeter : args[ 1 ] }
//   else if( _.strIs( args[ 0 ] ) )
//   o = { src : args[ 0 ] }
//
//   _.routineOptions( routine, o );
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( args.length === 1 || args.length === 2, 'Expects one or two arguments' );
//   _.assert( _.strIs( o.src ) );
//   _.assert( _.objectIs( o ) );
//
//   return o;
// }
//
// //
//
// function strSplitFast_body( o )
// {
//   let result;
//   let closests;
//   let position;
//   let closestPosition;
//   let closestIndex;
//   let hasEmptyDelimeter;
//   let delimeter
//
//   o.delimeter = _.arrayAs( o.delimeter );
//
//   let foundDelimeters = o.delimeter.slice();
//
//   _.assert( arguments.length === 1 );
//   _.assert( _.arrayIs( o.delimeter ) );
//   _.assert( _.boolLike( o.preservingDelimeters ) );
//
//   /* */
//
//   if( !o.preservingDelimeters && o.delimeter.length === 1 )
//   {
//
//     result = o.src.split( o.delimeter[ 0 ] );
//
//     if( !o.preservingEmpty )
//     result = result.filter( ( e ) => e ? e : false );
//
//   }
//   else
//   {
//
//     if( !o.delimeter.length )
//     {
//       result = [ o.src ];
//       return result;
//     }
//
//     result = [];
//     closests = [];
//     position = 0;
//     closestPosition = 0;
//     closestIndex = -1;
//     hasEmptyDelimeter = false;
//
//     for( let d = 0 ; d < o.delimeter.length ; d++ )
//     {
//       let delimeter = o.delimeter[ d ];
//       if( _.regexpIs( delimeter ) )
//       {
//         _.assert( !delimeter.sticky );
//         if( delimeter.source === '' || delimeter.source === '()' || delimeter.source === '(?:)' )
//         hasEmptyDelimeter = true;
//         // debugger;
//       }
//       else
//       {
//         if( delimeter.length === 0 )
//         hasEmptyDelimeter = true;
//       }
//       closests[ d ] = delimeterNext( d, position );
//     }
//
//     // let delimeter;
//
//     do
//     {
//       closestWhich();
//
//       if( closestPosition === o.src.length )
//       break;
//
//       if( !delimeter.length )
//       position += 1;
//
//       ordinaryAdd( o.src.substring( position, closestPosition ) );
//
//       if( delimeter.length > 0 || position < o.src.length )
//       delimeterAdd( delimeter );
//
//       position = closests[ closestIndex ] + ( delimeter.length ? delimeter.length : 1 );
//
//       // debugger;
//       for( let d = 0 ; d < o.delimeter.length ; d++ )
//       if( closests[ d ] < position )
//       closests[ d ] = delimeterNext( d, position );
//       // debugger;
//
//     }
//     while( position < o.src.length );
//
//     if( delimeter || !hasEmptyDelimeter )
//     ordinaryAdd( o.src.substring( position, o.src.length ) );
//
//   }
//
//   return result;
//
//   /* */
//
//   function delimeterAdd( delimeter )
//   {
//
//     if( o.preservingDelimeters )
//     if( o.preservingEmpty || delimeter )
//     {
//       result.push( delimeter );
//       // if( _.regexpIs( delimeter ) )
//       // result.push( delimeter );
//       // o.src.substring( position, closestPosition )
//       // else
//       // result.push( delimeter );
//     }
//
//   }
//
//   /*  */
//
//   function ordinaryAdd( ordinary )
//   {
//     if( o.preservingEmpty || ordinary )
//     result.push( ordinary );
//   }
//
//   /* */
//
//   function closestWhich()
//   {
//
//     closestPosition = o.src.length;
//     closestIndex = -1;
//     for( let d = 0 ; d < o.delimeter.length ; d++ )
//     {
//       if( closests[ d ] < o.src.length && closests[ d ] < closestPosition )
//       {
//         closestPosition = closests[ d ];
//         closestIndex = d;
//       }
//     }
//
//     delimeter = foundDelimeters[ closestIndex ];
//
//   }
//
//   /* */
//
//   function delimeterNext( d, position )
//   {
//     _.assert( position <= o.src.length );
//     let delimeter = o.delimeter[ d ];
//     let result;
//
//     if( _.strIs( delimeter ) )
//     {
//       result = o.src.indexOf( delimeter, position );
//     }
//     else
//     {
//       let execed = delimeter.exec( o.src.substring( position ) );
//       if( execed )
//       {
//         result = execed.index + position;
//         foundDelimeters[ d ] = execed[ 0 ];
//       }
//     }
//
//     if( result === -1 )
//     return o.src.length;
//     return result;
//   }
//
// }
//
// strSplitFast_body.defaults =
// {
//   src : null,
//   delimeter : ' ',
//   preservingEmpty : 1,
//   preservingDelimeters : 1,
// }
//
// //
//
// /**
//  * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
//  * If( o.stripping ) is true - removes leading and trailing whitespace characters.
//  * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
//  * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
//  * Function can be called in two ways:
//  * - First to pass only source string and use default options;
//  * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
//  * Returns result as array of strings.
//  *
//  * @param {string|object} o - Source string to split or map with source( o.src ) and options.
//  * @param {string} [ o.src=null ] - Source string.
//  * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
//  * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
//  * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
//  * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
//  * @returns {object} Returns an array of strings separated by( o.delimeter ).
//  *
//  * @example
//  * _.strSplitFast( ' first second third ' );
//  * // returns [ 'first', 'second', 'third' ]
//  *
//  * @example
//  * _.strSplitFast( { src : 'a, b, c, d', delimeter : ', '  } );
//  * // returns [ 'a', 'b', 'c', 'd' ]
//  *
//  * @example
//  * _.strSplitFast( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
//  * // returns [ 'a', 'b', 'c', 'd' ]
//  *
//  * @example
//    * _.strSplitFast( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
//    * // returns [ '    a', 'b', 'c', 'd   ' ]
//  *
//  * @example
//  * _.strSplitFast( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
//  * // returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
//  *
//  * @example
//  * _.strSplitFast( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
//  * // returns [ 'a', '', 'b', '', 'c', '', 'd' ]
//  *
//  * @method strSplitFast
//  * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
//  * @throws { Exception } Throw an exception if( o.src ) is not a String.
//  * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
//  * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
//  * @namespace Tools
//  *
//  */
//
// let strSplitFast = _.routineFromPreAndBody( strSplitFast_pre, strSplitFast_body );
//
// _.assert( strSplitFast.pre === strSplitFast_pre );
// _.assert( strSplitFast.body === strSplitFast_body );
// _.assert( _.objectIs( strSplitFast.defaults ) );
//
// //
//
// function strSplit_body( o )
// {
//
//   o.delimeter = _.arrayAs( o.delimeter );
//
//   if( !o.stripping && !o.quoting && !o.onDelimeter )
//   {
//     return _.strSplitFast.body( _.mapOnly( o, _.strSplitFast.defaults ) );
//   }
//
//   /* */
//
//   _.assert( arguments.length === 1 );
//
//   /* */
//
//   let result = [];
//   let fastOptions = _.mapOnly( o, _.strSplitFast.defaults );
//   fastOptions.preservingEmpty = 1;
//   fastOptions.preservingDelimeters = 1;
//
//   if( o.quoting )
//   fastOptions.delimeter = _.arrayAppendArraysOnce( [], [ o.quotingPrefixes, o.quotingPostfixes, fastOptions.delimeter ] );
//
//   o.splits = _.strSplitFast.body( fastOptions );
//
//   if( o.quoting )
//   _.strSplitsQuotedRejoin.body( o );
//
//   if( !o.preservingDelimeters )
//   _.strSplitsDropDelimeters.body( o );
//
//   if( o.stripping )
//   _.strSplitsStrip.body( o );
//
//   if( !o.preservingEmpty )
//   _.strSplitsDropEmpty.body( o );
//
//   /* */
//
//   return o.splits;
// }
//
// var defaults = strSplit_body.defaults = Object.create( strSplitFast_body.defaults );
//
// defaults.preservingEmpty = 1;
// defaults.preservingDelimeters = 1;
// defaults.preservingQuoting = 1;
// defaults.inliningQuoting = 1;
//
// defaults.stripping = 1;
// defaults.quoting = 1;
// defaults.quotingPrefixes = null;
// defaults.quotingPostfixes = null;
//
// defaults.onDelimeter = null;
// defaults.onQuote = null;
//
// //
//
// /**
//  * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
//  * If( o.stripping ) is true - removes leading and trailing whitespace characters.
//  * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
//  * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
//  * Function can be called in two ways:
//  * - First to pass only source string and use default options;
//  * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
//  * Returns result as array of strings.
//  *
//  * @param {string|object} o - Source string to split or map with source( o.src ) and options.
//  * @param {string} [ o.src=null ] - Source string.
//  * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
//  * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
//  * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
//  * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
//  * @returns {object} Returns an array of strings separated by( o.delimeter ).
//  *
//  * @example
//  * _.strSplit( ' first second third ' );
//  * // returns [ 'first', 'second', 'third' ]
//  *
//  * @example
//  * _.strSplit( { src : 'a, b, c, d', delimeter : ', '  } );
//  * // returns [ 'a', 'b', 'c', 'd' ]
//  *
//  * @example
//  * _.strSplit( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
//  * // returns [ 'a', 'b', 'c', 'd' ]
//  *
//  * @example
//  * _.strSplit( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
//  * // returns [ '    a', 'b', 'c', 'd   ' ]
//  *
//  * @example
//  * _.strSplit( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
//  * // returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
//  *
//  * @example
//  * _.strSplit( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
//  * // returns [ 'a', '', 'b', '', 'c', '', 'd' ]
//  *
//  * @method strSplit
//  * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
//  * @throws { Exception } Throw an exception if( o.src ) is not a String.
//  * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
//  * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
//  * @namespace Tools
//  *
//  */
//
// let pre = [ strSplitFast.pre, strSplitsQuotedRejoin.pre, strSplitsDropDelimeters.pre, strSplitsStrip.pre, strSplitsDropEmpty.pre ];
// let strSplit = _.routineFromPreAndBody( pre, strSplit_body );
//
// _.assert( strSplit.pre !== strSplitFast.pre );
// _.assert( _.routineIs( strSplit.pre ) );
// _.assert( strSplit.body === strSplit_body );
// _.assert( _.objectIs( strSplit.defaults ) );
//
// //
//
// let strSplitNonPreserving = _.routineFromPreAndBody( strSplit.pre, strSplit.body );
//
// var defaults = strSplitNonPreserving.defaults;
//
// defaults.preservingEmpty = 0
// defaults.preservingDelimeters = 0;
//
// //
//
// function _strSplitInlined_body( o )
// {
//
//   _.assert( arguments.length === 1, 'Expects single options map' );
//
//   if( o.delimeter === null )
//   o.delimeter = '#';
//
//   let splitArray = _.strSplit
//   ({
//     src : o.src,
//     delimeter : o.delimeter,
//     stripping : o.stripping,
//     quoting : o.quoting,
//     preservingEmpty : 1,
//     preservingDelimeters : 1,
//   });
//
//   if( splitArray.length <= 1 )
//   {
//     if( !o.preservingEmpty )
//     if( splitArray[ 0 ] === '' )
//     splitArray.splice( 0, 1 );
//     return splitArray;
//   }
//
//   /*
//   first - for tracking index to insert ordinary text
//   onInlined should be called first and
//   if undefined returned escaped text shoud be treated as ordinary
//   so tracking index to insert ordinary text ( in case non undefined returned ) required
//   */
//
//   let first = 0;
//   let result = [];
//   let i = 0;
//   for( ; i < splitArray.length ; i += 4 )
//   {
//
//     if( splitArray.length-i >= 4 )
//     {
//       if( handleTriplet() )
//       handleOrdinary();
//     }
//     else
//     {
//       if( splitArray.length > i+1 )
//       {
//         splitArray[ i ] = splitArray.slice( i, splitArray.length ).join( '' );
//         splitArray.splice( i+1, splitArray.length-i-1 );
//       }
//       handleOrdinary();
//       _.assert( i+1 === splitArray.length, 'Openning delimeter', o.delimeter, 'does not have closing' );
//     }
//
//   }
//
//   return result;
//
//   /* */
//
//   function handleTriplet()
//   {
//
//     let delimeter1 = splitArray[ i+1 ];
//     let escaped = splitArray[ i+2 ];
//     let delimeter2 = splitArray[ i+3 ];
//
//     if( o.onInlined )
//     escaped = o.onInlined( escaped, o, [ delimeter1, delimeter2 ] );
//
//     if( escaped === undefined )
//     {
//       _.assert( _.strIs( splitArray[ i+4 ] ) );
//       splitArray[ i+2 ] = splitArray[ i+0 ] + splitArray[ i+1 ] + splitArray[ i+2 ];
//       splitArray.splice( i, 2 );
//       i -= 4;
//       return false;
//     }
//
//     first = result.length;
//
//     if( o.preservingDelimeters && delimeter1 !== undefined )
//     if( o.preservingEmpty || delimeter1 )
//     result.push( delimeter1 );
//
//     if( o.preservingInlined && escaped !== undefined )
//     if( o.preservingEmpty || escaped )
//     result.push( escaped );
//
//     if( o.preservingDelimeters && delimeter2 !== undefined )
//     if( o.preservingEmpty || delimeter2 )
//     result.push( delimeter2 );
//
//     return true;
//   }
//
//   /* */
//
//   function handleOrdinary()
//   {
//     let ordinary = splitArray[ i+0 ];
//
//     if( o.onOrdinary )
//     ordinary = o.onOrdinary( ordinary, o );
//
//     if( o.preservingOrdinary && ordinary !== undefined )
//     if( o.preservingEmpty || ordinary )
//     result.splice( first, 0, ordinary );
//
//     first = result.length;
//   }
//
// }
//
// _strSplitInlined_body.defaults =
// {
//
//   src : null,
//   delimeter : null,
//   // delimeterLeft : null,
//   // delimeterRight : null,
//   stripping : 0,
//   quoting : 0,
//
//   onOrdinary : null,
//   onInlined : ( e ) => [ e ],
//
//   preservingEmpty : 1,
//   preservingDelimeters : 0,
//   preservingOrdinary : 1,
//   preservingInlined : 1,
//
// }
//
// //
//
// let strSplitInlined = _.routineFromPreAndBody( strSplitFast_pre, _strSplitInlined_body );
//
// //
//
// function _strSplitInlinedStereo_body( o )
// {
//
//   _.assert( arguments.length === 1, 'Expects single options map argument' );
//
//   let splitArray = _.strSplit
//   ({
//     src : o.src,
//     delimeter : o.prefix,
//     stripping : o.stripping,
//     quoting : o.quoting,
//     preservingEmpty : 1,
//     preservingDelimeters : 0,
//   });
//
//   if( splitArray.length <= 1 )
//   {
//     if( !o.preservingEmpty )
//     if( splitArray[ 0 ] === '' )
//     splitArray.splice( 0, 1 );
//     return splitArray;
//   }
//
//   let result = [];
//
//   /* */
//
//   if( splitArray[ 0 ] )
//   result.push( splitArray[ 0 ] );
//
//   /* */
//
//   for( let i = 1; i < splitArray.length; i++ )
//   {
//     let halfs = _.strIsolateLeftOrNone( splitArray[ i ], o.postfix );
//
//     _.assert( halfs.length === 3 );
//
//     let inlined = halfs[ 2 ];
//
//     inlined = o.onInlined ? o.onInlined( inlined ) : inlined;
//
//     if( inlined !== undefined )
//     {
//       result.push( halfs[ 0 ] );
//       result.push( inlined );
//       // if( inlined[ 2 ] )
//       // result.push( inlined[ 2 ] );
//     }
//     else
//     {
//       if( result.length )
//       debugger;
//       else
//       debugger;
//       if( result.length )
//       result[ result.length-1 ] += o.prefix + splitArray[ i ];
//       else
//       result.push( o.prefix + splitArray[ i ] );
//     }
//
//   }
//
//   return result;
// }
//
// _strSplitInlinedStereo_body.defaults =
// {
//   src : null,
//
//   prefix : '#',
//   postfix : '#',
//   stripping : 0,
//   quoting : 0,
//
//   onInlined : null,
//
//   preservingEmpty : 1,
//   preservingDelimeters : 0,
//   preservingOrdinary : 1,
//   preservingInlined : 1,
//
// }
//
// let strSplitInlinedStereo = _.routineFromPreAndBody( strSplitFast_pre, _strSplitInlinedStereo_body );
//
// // //
// //
// // /**
// //  * Extracts words enclosed by prefix( o.prefix ) and postfix( o.postfix ) delimeters
// //  * Function can be called in two ways:
// //  * - First to pass only source string and use default options;
// //  * - Second to pass source string and options map like ( { prefix : '#', postfix : '#' } ) as function context.
// //  *
// //  * Returns result as array of strings.
// //  *
// //  * Function extracts words in two attempts:
// //  * First by splitting source string by ( o.prefix ).
// //  * Second by splitting each element of the result of first attempt by( o.postfix ).
// //  * If splitting by ( o.prefix ) gives only single element then second attempt is skipped, otherwise function
// //  * splits all elements except first by ( o.postfix ) into two halfs and calls provided ( o.onInlined ) function on first half.
// //  * If result of second splitting( by o.postfix ) is undefined function appends value of element from first splitting attempt
// //  * with ( o.prefix ) prepended to the last element of result array.
// //  *
// //  * @param {string} src - Source string.
// //  * @param {object} o - Options map.
// //  * @param {string} [ o.prefix = '#' ] - delimeter that marks begining of enclosed string
// //  * @param {string} [ o.postfix = '#' ] - delimeter that marks ending of enclosed string
// //  * @param {string} [ o.onInlined = null ] - function called on each splitted part of a source string
// //  * @returns {object} Returns an array of strings separated by( o.delimeter ).
// //  *
// //  * @example
// //  * _.strSplitInlinedStereo( '#abc#' );
// //  * // returns [ '', 'abc', '' ]
// //  *
// //  * @example
// //  * _.strSplitInlinedStereo.call( { prefix : '#', postfix : '$' }, '#abc$' );
// //  * // returns [ 'abc' ]
// //  *
// //  * @example
// //  * function onInlined( strip )
// //  * {
// //  *   if( strip.length )
// //  *   return strip.toUpperCase();
// //  * }
// //  * _.strSplitInlinedStereo.call( { postfix : '$', onInlined }, '#abc$' );
// //  * // returns [ 'ABC' ]
// //  *
// //  * @method strSplitInlinedStereo
// //  * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
// //  * @throws { Exception } Throw an exception if( o.src ) is not a String.
// //  * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
// //  * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
// //  * @namespace Tools
// //  *
// //  */
// //
// // // let strSplitInlinedStereo = _.routineFromPreAndBody( strSplitFast_pre, _strSplitInlinedStereo_body );
// //
// // function strSplitInlinedStereo( o )
// // {
// //
// //   if( _.strIs( o ) )
// //   o = { src : o }
// //
// //   _.assert( this === _ );
// //   _.assert( _.strIs( o.src ) );
// //   _.assert( _.objectIs( o ) );
// //   _.assert( arguments.length === 1, 'Expects single argument' );
// //   _.routineOptions( strSplitInlinedStereo, o );
// //
// //   let result = [];
// //   let splitted = o.src.split( o.prefix );
// //
// //   if( splitted.length === 1 )
// //   return splitted;
// //
// //   /* */
// //
// //   if( splitted[ 0 ] )
// //   result.push( splitted[ 0 ] );
// //
// //   /* */
// //
// //   for( let i = 1; i < splitted.length; i++ )
// //   {
// //     let halfs = _.strIsolateLeftOrNone( splitted[ i ], o.postfix );
// //     let strip = o.onInlined ? o.onInlined( halfs[ 0 ] ) : halfs[ 0 ];
// //
// //     _.assert( halfs.length === 3 );
// //
// //     if( strip !== undefined )
// //     {
// //       result.push( strip );
// //       if( halfs[ 2 ] )
// //       result.push( halfs[ 2 ] );
// //     }
// //     else
// //     {
// //       if( result.length )
// //       debugger;
// //       else
// //       debugger;
// //       if( result.length )
// //       result[ result.length-1 ] += o.prefix + splitted[ i ];
// //       else
// //       result.push( o.prefix + splitted[ i ] );
// //     }
// //
// //   }
// //
// //   return result;
// // }
// //
// // strSplitInlinedStereo.defaults =
// // {
// //   src : null,
// //   prefix : '#',
// //   postfix : '#',
// //   onInlined : null,
// // }

//

/*
aaa : cover it by test
Dmytro : covered,

maybe, routine needs assertion
_.assert( arguments.length === 1, 'Expects one argument' );
if assertion will be accepted, then test.case = 'a few arguments' will throw error
*/

function strSplitCamel( src )
{

  let splits = _.strSplitFast( src, /[A-Z]/ );

  for( let s = splits.length-2 ; s >= 0 ; s-- )
  {
    if( s % 2 === 1 )
    splits.splice( s, 2, splits[ s ].toLowerCase() + splits[ s + 1 ] );
  }

  return splits;
}

// --
// extractor
// --

/**
 * Routine strOnlySingle() gets substring out of source string {-srcStr-} according to a given range {-range-}.
 * The end value of the range is not included in the substring.
 *
 * @param { String } srcStr - Source string.
 * @param { Range } range - Range to get substring.
 * If range[ 0 ] or range[ 1 ] is less then 0, then reference point is length of source string {-srcStr-}.
 *
 * @example
 * _.strOnlySingle( '', [ 0, 2 ] );
 * // returns ''
 *
 * @example
 * _.strOnlySingle( 'first', [ 0, 7 ] );
 * // returns 'first'
 *
 * @example
 * _.strOnlySingle( 'first', [ 0, 2 ] );
 * // returns 'fi'
 *
 * @example
 * _.strOnlySingle( 'first', [ -2, 5 ] );
 * // returns 'st'
 *
 * @example
 * _.strOnlySingle( 'first', [ 2, 2 ] );
 * // returns ''
 *
 * @function strOnlySingle
 * @returns { String } - Returns substring from source string.
 * @throws { Error } If arguments.length is less or more then two.
 * @throws { Error } If {-srcStr-} is not a String.
 * @throws { Error } If {-range-} is not a Range.
 * @namespace Tools
 */

function strOnlySingle( srcStr, range )
{

/*
aaa : reference point of negative is length. implement and cover please
Dmytro : implemented a time ago
*/

// xxx
// _.strOnly( 'abc', [ -2, -1 ] ) => 'b'
// _.strOnly( 'abc', [ 1, 2 ] ) => 'b'
//
// 3-2 = 1
// 3-1 = 2

  if( _.numberIs( range ) )
  {
    if( range < 0 )
    range = srcStr.length + range;
    range = [ range, range + 1 ];
  }
  else
  {
    if( range[ 1 ] < 0 )
    range[ 1 ] = srcStr.length + range[ 1 ];
    if( range[ 0 ] < 0 )
    range[ 0 ] = srcStr.length + range[ 0 ];
  }

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( srcStr ) );
  _.assert( _.rangeDefined( range ) );

  return srcStr.substring( range[ 0 ], range[ 1 ] );
}

//

/**
 * Routine strOnly() gets substring out of each string in vector of strings {-srcStr-} according to a given range {-range-}.
 * The end value of the range is not included in the substring.
 *
 * @param { String|Long } srcStr - Source string or array of strings.
 * @param { Range } range - Range to get substring.
 * If range[ 0 ] or range[ 1 ] is less then 0, then reference point is length of source string {-srcStr-}.
 *
 * @example
 * _.strOnly( '', [ 0, 2 ] );
 * // returns ''
 *
 * @example
 * _.strOnly( 'first', [ 0, 7 ] );
 * // returns 'first'
 *
 * @example
 * _.strOnly( 'first', [ 0, 2 ] );
 * // returns 'fi'
 *
 * @example
 * _.strOnly( 'first', [ -2, 5 ] );
 * // returns 'st'
 *
 * @example
 * _.strOnly( 'first', [ 2, 2 ] );
 * // returns ''
 *
 * @example
 * _.strOnly( [ '', 'a', 'ab', 'abcde' ], [ 0, 2 ] );
 * // returns [ '', 'a', 'ab', 'ab' ]
 *
 * @example
 * _.strOnly( [ '', 'a', 'ab', 'abcde' ], [ 0, 7 ] );
 * // returns [ '', 'a', 'ab', 'abcde' ]
 *
 * @example
 * _.strOnly( [ '', 'a', 'ab', 'abcde' ], [ -2, 5 ] );
 * // returns [ '', 'a', 'ab', 'de' ]
 *
 * @example
 * _.strOnly( [ '', 'a', 'ab', 'abcde' ], [ 2, 2 ] );
 * // returns[ '', '', '', '' ]
 *
 * @function strOnly
 * @returns { String|Long } - Returns substrings from source string or array of strings.
 * @throws { Error } If arguments.length is less or more then two.
 * @throws { Error } If {-srcStr-} is not a String, not a Long.
 * @throws { Error } If {-srcStr-} is a Long and includes not a String value.
 * @throws { Error } If {-range-} is not a Range.
 * @namespace Tools
 */

let strOnly = _.vectorize( strOnlySingle );

//

// srcStr:str ins:str -> str
// srcStr:str ins:[ * str ] -> [ * str ]
// srcStr:[ * str ] ins:[ * str ] -> [ * str ]

/**
 * Routine strButSingle() gets substring out of source string {-srcStr-} according to a given range {-range-}
 * and replaces it to new string {-ins-}.
 * The end value of the range is not included in the substring.
 *
 * @param { String } srcStr - Source string.
 * @param { Range } range - Range to get substring.
 * If range[ 0 ] or range[ 1 ] is less then 0, then reference point is length of source string {-srcStr-}.
 * @param { String|Long } ins - Inserted string or array with inserted elements.
 * If {-ins-} is a Long, then routine concatenates string from elements of Long. The delimeter is single space.
 * If {-ins-} is not provided or if it is undefined, then routine removes substring from source string to a given range.
 *
 * @example
 * _.strButSingle( '', [ 0, 2 ] );
 * // returns ''
 *
 * @example
 * _.strButSingle( 'first', [ 0, 7 ] );
 * // returns ''
 *
 * @example
 * _.strButSingle( 'first', [ 0, 2 ] );
 * // returns 'rst'
 *
 * @example
 * _.strButSingle( 'first', [ -2, 5 ] );
 * // returns 'fir'
 *
 * @example
 * _.strButSingle( 'first', [ 2, 2 ] );
 * // returns 'first'
 *
 * @example
 * _.strButSingle( '', [ 0, 2 ], 'abc' );
 * // returns 'abc'
 *
 * @example
 * _.strButSingle( 'first', [ 0, 7 ], [ 'a', 'b', 'c' ] );
 * // returns 'a b c'
 *
 * @example
 * _.strButSingle( 'first', [ 0, 2 ], 'abc' );
 * // returns 'abcrst'
 *
 * @example
 * _.strButSingle( 'first', [ -2, 5 ], [ 'a', 'b', 'c' ] );
 * // returns 'fira b c'
 *
 * @example
 * _.strButSingle( 'first', [ 2, 2 ], 'abc' );
 * // returns 'fiabcrst'
 *
 * @function strButSingle
 * @returns { String } - Returns source string, part of which replaced to the new value.
 * @throws { Error } If arguments.length is less then two or more then three.
 * @throws { Error } If {-srcStr-} is not a String.
 * @throws { Error } If {-range-} is not a Range.
 * @throws { Error } If {-ins-} is not a String, not a Long, not undefined.
 * @namespace Tools
 */

function strButSingle( srcStr, range, ins )
{

/*
aaa : reference point of negative is length. implement and cover please
Dmytro : implemented a time ago
*/

  if( _.numberIs( range ) )
  {
    if( range < 0 )
    range = srcStr.length + range;
    range = [ range, range + 1 ];
  }
  else
  {
    if( range[ 1 ] < 0 )
    range[ 1 ] = srcStr.length + range[ 1 ];
    if( range[ 0 ] < 0 )
    range[ 0 ] = srcStr.length + range[ 0 ];
  }

  // if( _.numberIs( range ) )
  // range = [ range, range + 1 ];
  if( range[ 0 ] > range[ 1 ] )
  range[ 1 ] = range[ 0 ];

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( _.strIs( srcStr ) );
  _.assert( _.rangeDefined( range ) );
  _.assert( ins === undefined || _.strIs( ins ) || _.longIs( ins ) );
  // _.assert( !_.longIs( ins ), 'not implemented' );

  /*
     aaa : implement for case ins is long
     Dmytro : implemented, elements of long joins by spaces
  */

  if( _.longIs( ins ) )
  return srcStr.substring( 0, range[ 0 ] ) + ins.join( ' ' ) + srcStr.substring( range[ 1 ], srcStr.length );
  else if( ins )
  return srcStr.substring( 0, range[ 0 ] ) + ins + srcStr.substring( range[ 1 ], srcStr.length );
  else
  return srcStr.substring( 0, range[ 0 ] ) + srcStr.substring( range[ 1 ], srcStr.length );
}

//

/**
 * Routine strBut() gets substring out of each string in vector of strings {-srcStr-} according to a given range {-range-}
 * and replaces it to new string {-ins-}.
 * The end value of the range is not included in the substring.
 *
 * @param { String|Long } srcStr - Source string or array of strings.
 * @param { Range } range - Range to get substring.
 * If range[ 0 ] or range[ 1 ] is less then 0, then reference point is length of source string {-srcStr-}.
 * @param { String|Long } ins - Inserted string or array with inserted elements.
 * If {-ins-} is a Long, then routine concatenates string from elements of Long. The delimeter is single space.
 * If {-ins-} is not provided or if it is undefined, then routine removes substring from source string to a given range.
 *
 * @example
 * _.strBut( '', [ 0, 2 ] );
 * // returns ''
 *
 * @example
 * _.strBut( 'first', [ 0, 7 ] );
 * // returns ''
 *
 * @example
 * _.strBut( 'first', [ 0, 2 ], 'abc' );
 * // returns 'abcrst'
 *
 * @example
 * _.strBut( 'first', [ -2, 5 ], [ 'a', 'b', 'c' ] );
 * // returns 'fira b c'
 *
 * @example
 * _.strBut( [ '', 'a', 'ab', 'abcde' ], [ 0, 2 ], 'fg' );
 * // returns [ 'fg', 'fg', 'fg', 'fgcde' ]
 *
 * @example
 * _.strBut( [ '', 'a', 'ab', 'abcde' ], [ 0, 7 ], [ 'f', 'g' ] );
 * // returns [ 'f g', 'f g', 'f g', 'f g' ]
 *
 * @example
 * _.strBut( [ '', 'a', 'ab', 'abcde' ], [ -2, 5 ], 'fg' );
 * // returns [ 'fg', 'fg', 'fg', 'abcfg' ]
 *
 * @example
 * _.strBut( [ '', 'a', 'ab', 'abcde' ], [ 2, 2 ], [ 'f', 'g' ] );
 * // returns [ 'f g', 'af g', 'abf g', 'abf gcde' ]
 *
 * @function strBut
 * @returns { String|Long } - Returns source string or vector of strings, part of which replaced to the new value.
 * @throws { Error } If arguments.length is less then two or more then three.
 * @throws { Error } If {-srcStr-} is not a String or not a Long.
 * @throws { Error } If {-srcStr-} is a Long and includes not a String value.
 * @throws { Error } If {-range-} is not a Range.
 * @throws { Error } If {-ins-} is not a String, not a Long, not undefined.
 * @namespace Tools
 */

let strBut = _.vectorize( strButSingle );

//

/**
 * Routine strUnjoin() splits string {-srcStr-} into parts using array {-maskArray-} as mask and returns an array with splitted parts.
 * Mask {-maskArray-} contains string(s) separated by marker ( strUnjoin.any ). Mask must starts/ends with first/last letter from source
 * or can be replaced with marker ( strUnjoin.any ). Position of ( strUnjoin.any ) determines which part of source string will be splited:
 * - If ( strUnjoin.any ) is provided before string, it marks everything before that string. Example: ( [ _.strUnjoin.any, 'postfix' ] ).
 * - If ( strUnjoin.any ) is provided after string, it marks everything after that string. Example: ( [ 'prefix', _.strUnjoin.any ] ).
 * - If ( strUnjoin.any ) is provided between two strings, it marks everything between them. Example: ( [ 'prefix', _.strUnjoin.any, 'postfix' ] ).
 * - If ( strUnjoin.any ) is provided before and after string, it marks all except that string. Example: ( [ '_.strUnjoin.any', something, '_.strUnjoin.any' ] ).
 *
 * @param {string} srcStr - Source string.
 * @param {array} maskArray - Contains mask for source string.
 *
 * @example
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any, 'postfix' ] );
 * // returns [ 'prefix', '_something_', 'postfix' ]
 *
 * @example
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'something', _.strUnjoin.any, 'postfix' ] );
 * // returns [ 'prefix_', 'something', '_', 'postfix' ]
 *
 * @example
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'postfix' ] );
 * // returns [ 'prefix_something_', 'postfix' ]
 *
 * @example
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any ] );
 * // returns [ 'prefix', '_something_postfix' ]
 *
 * @example
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'x', _.strUnjoin.any, 'p', _.strUnjoin.any ] );
 * // returns [ 'prefi', 'x', '_something_', 'p', 'ostfix' ]
 *
 * @returns {array} Returns array with unjoined string part.
 * @function strUnjoin
 * @throws { Exception } If arguments.length is less or more then two.
 * @throws { Exception } If {-srcStr-} is not a String.
 * @throws { Exception } If {-maskArray-} is not an Array.
 * @throws { Exception } If {-maskArray-} value is not String or strUnjoin.any.
 * @namespace Tools
 *
 */

function strUnjoin( srcStr, maskArray )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( srcStr ) );
  _.assert( _.arrayIs( maskArray ) );

  let result = [];
  let index = 0;
  let rindex = -1;

  /**/

  for( let m = 0 ; m < maskArray.length ; m++ )
  {

    let mask = maskArray[ m ];

    if( !checkMask( mask ) )
    return;

  }

  if( rindex !== -1 )
  {
    index = srcStr.length;
    if( !checkToken() )
    return;
  }

  if( index !== srcStr.length )
  return;

  /**/

  return result;

  /**/

  function checkToken()
  {

    if( rindex !== -1 )
    {
      _.assert( rindex <= index );
      result.push( srcStr.substring( rindex, index ) );
      rindex = -1;
      return true;
    }

    return false;
  }

  /**/

  function checkMask( mask )
  {

    _.assert( _.strIs( mask ) || mask === strUnjoin.any , 'Expects string or strUnjoin.any, got' , _.strType( mask ) );

    if( _.strIs( mask ) )
    {
      index = srcStr.indexOf( mask, index );

      if( index === -1 )
      return false;

      if( rindex === -1 && index !== 0 )
      return false;

      checkToken();

      result.push( mask );
      index += mask.length;

    }
    else if( mask === strUnjoin.any )
    {
      rindex = index;
    }
    else _.assert( 0, 'unexpected mask' );

    return true;
  }

}

strUnjoin.any = _.any;
_.assert( _.routineIs( strUnjoin.any ) );

// --
// joiner
// --

/**
 * Routine _strDup() returns a string with the source string appended to itself n-times.
 * Expects two parameter: source string {-s-} ( or array of strings ) and number of concatenations {-times-}.
 * The string {-s-}  and the number {-times-} remain unchanged.
 *
 * @param { Array/String } s - Source array of strings or source string.
 * @param { Number } times - Number of concatenation cycles.
 *
 * @example
 * _.strDup( 'Word', 5 );
 * // returns WordWordWordWordWord
 *
 * @example
 * _.strDup( '1 '+'2', 2 );
 * // returns 1 21 2
 *
 * @example
 * _.strDup( [ 'ab', 'd', '3 4'], 2 );
 * // returns [ 'abab', 'dd', '3 43 4']
 *
 * @returns { String|Array } - Returns a string or an array of string containing the src string concatenated n-times.
 * @function strDup
 * @throws { Exception } If arguments.length is less or more then two.
 * @throws { Exception } If {-s-} is not a String or an array of strings.
 * @throws { Exception } If {-times-} is not a Number.
 * @namespace Tools
 */

function _strDup( s, times )
{
  let result = '';

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.strIs( s ) );
  _.assert( _.numberIs( times ) );

  for( let t = 0 ; t < times ; t++ )
  result += s;

  return result;
}

//

/**
 * Joins objects inside the source array, by concatenating their values in order that they are specified.
 * The source array can contain strings, numbers and arrays. If arrays are provided, they must have same length.
 * Joins arrays by concatenating all elements with same index into one string and puts it into new array at same position.
 * Joins array with other object by concatenating each array element with that object value. Examples: ( [ [ 1, 2 ], 3 ] ) -> ( [ '13', '23' ] ),
 * ( [ [ 1, 2 ], [ 1, 2] ] ) -> ( [ '11', '22' ] ).
 * An optional second string argument can be passed to the function. This argument ( joiner ) defines the string that joins the
 * srcArray objects.  Examples: ( [ [ 1, 2 ], 3 ], '*' ) -> ( [ '1*3', '2*3' ] ),
 * ( [ [ 1, 2 ], [ 1, 2 ] ], ' to ' ) -> ( [ '1 to 1', '2 to 2' ] ).
 *
 * @param { Array-like } srcs - Source array with the provided objects.
 * @param { String } joiner - Optional joiner parameter.
 * @returns { Object } Returns concatenated objects as string or array. Return type depends from arguments type.
 *
 * @example
 * _.strJoin([ 1, 2, 3 ]);
 * // returns '123'
 *
 * @example
 * _.strJoin([ [ 1, 2, 3 ], 2 ]);
 * // returns [ '12', '22', '32' ]
 *
 * @example
 * _.strJoin([ [ 1, 2 ], [ 1, 3 ] ]);
 * // returns [ '11', '23' ]
 *
 * @example
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ]);
 * // returns [ '1236', '1247', '1258' ]
 *
 * @example
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ], ' ');
 * // returns [ '1 2 3 6', '1 2 4 7', '1 2 5 8' ]
 *
 * @method strJoin
 * @throws { Exception } If ( arguments.length ) is not one or two.
 * @throws { Exception } If some object from( srcs ) is not a Array, String or Number.
 * @throws { Exception } If length of arrays in srcs is different.
 * @throws { Exception } If ( joiner ) is not undefined or a string .
 * @namespace Tools
 *
 */

function strJoin_pre( routine, args )
{

  let o = args[ 0 ];
  if( args[ 1 ] !== undefined || _.arrayLike( args[ 0 ] ) )
  o = { srcs : args[ 0 ], join : args[ 1 ] };

  _.routineOptions( routine, o );
  _.assert( arguments.length === 2 );
  _.assert( args.length === 1 || args.length === 2, () => 'Expects an array of string and optional join, but got ' + args.length + ' arguments' );
  _.assert( _.arrayLike( o.srcs ), () => 'Expects an array of strings, but got ' + _.strType( o.srcs ) );
  _.assert( o.join === null || _.strIs( o.join ), () => 'Expects optional join, but got ' + _.strType( o.join ) );

  return o;
}

//

// function strJoin_body( srcs, delimeter )
function strJoin_body( o )
{
  // let result = [ '' ];
  // let arrayEncountered = 0;
  let arrayLength;

  _.assertRoutineOptions( strJoin_body, arguments );

  let delimeter = o.join || '';
  if( o.join === null || _.strIs( o.join ) )
  o.join = join;

  // debugger;

  if( !o.srcs.length )
  return [];

  /* */

  for( let a = 0 ; a < o.srcs.length ; a++ )
  {
    let src = o.srcs[ a ];

    if( _.arrayIs( src ) )
    {
      _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
      arrayLength = src.length;
    }

  }

  if( arrayLength === 0 )
  return [];

  /* */

  if( arrayLength === undefined )
  {
    let result = '';

    for( let a = 0 ; a < o.srcs.length ; a++ )
    {
      let src = o.srcs[ a ];
      let srcStr = o.str( src );
      _.assert( _.strIs( srcStr ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
      result = o.join( result, srcStr, a );
    }

    return result;
  }
  else
  {

    let result = [];
    for( let i = 0 ; i < arrayLength ; i++ )
    result[ i ] = '';

    for( let a = 0 ; a < o.srcs.length ; a++ )
    {
      let src = o.srcs[ a ];

      // _.assert( _.strIs( srcStr ) || _.arrayIs( src ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
      // _.assert( _.strIs( src ) || _.numberIs( src ) || _.arrayIs( src ) );

      if( _.arrayIs( src ) )
      {

        // if( arrayEncountered === 0 )
        // for( let s = 1 ; s < src.length ; s++ )
        // result[ s ] = result[ 0 ];

        // _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
        // arrayLength = src.length;

        // arrayEncountered = 1;
        for( let s = 0 ; s < result.length ; s++ )
        result[ s ] = o.join( result[ s ], src[ s ], a );

      }
      else
      {

        let srcStr = o.str( src );
        _.assert( _.strIs( srcStr ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
        for( let s = 0 ; s < result.length ; s++ )
        result[ s ] = o.join( result[ s ], srcStr, a );

      }

    }

    return result;
  }

  /* */

  /* qqq : investigate */

  if( arrayEncountered )
  return result;
  else
  return result[ 0 ];

  /* */

  function join( result, src, a )
  {
    if( delimeter && a > 0 )
    return result + delimeter + src;
    else
    return result + src;
  }

}

strJoin_body.defaults =
{
  srcs : null,
  join : null,
  str : _.strPrimitive,
}

let strJoin = _.routineFromPreAndBody( strJoin_pre, strJoin_body );

//

/**
 * Routine strJoinPath() joins objects inside the source array, by concatenating their values in order that they are specified.
 * The source array can contain strings, numbers and arrays. If arrays are provided, they must have same length.
 * Joins arrays by concatenating all elements with same index into one string and puts it into new array at same position.
 * Joins array with other object by concatenating each array element with that object value.
 * Examples: ( [ [ 1, 2 ], 3 ], '' ) -> ( [ '13', '23' ] ), ( [ [ 1, 2 ], [ 1, 2] ] ) -> ( [ '11', '22' ], '' ).
 * Second argument should be string type. This argument ( joiner ) defines the string that joins the
 * srcArray objects.  Examples: ( [ [ 1, 2 ], 3 ], '*' ) -> ( [ '1*3', '2*3' ] ),
 * ( [ [ 1, 2 ], [ 1, 2 ] ], ' to ' ) -> ( [ '1 to 1', '2 to 2' ] ).
 * If the ( srcs ) objects has ( joiner ) at begin or end, ( joiner ) will be replaced. ( joiner ) replaced only between joined objects.
 * Example: ( [ '/11/', '//22//', '/3//' ], '/' ) --> '/11//22//3//'
 *
 * @param { Array-like } srcs - Source array with the provided objects.
 * @param { String } joiner - Joiner parameter.
 *
 * @example
 * _.strJoinPath( [ 1, 2, 3 ], '' );
 * // returns '123'
 *
 * @example
 * _.strJoinPath( [ [ '/a//', 'b', '//c//' ], 2 ], '/' );
 * // returns '/a//b//c//'
 *
 * @example
 * _.strJoinPath( [ [ 1, 2 ], [ 1, 3 ] ], '.');
 * // returns [ '1.1', '2.3' ]
 *
 * @example
 * _.strJoinPath( [ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ], ',');
 * // returns [ '1,2,3,6', '1,2,4,7', '1,2,5,8' ]
 *
 * @method strJoinPath
 * @returns { String|Array-like } Returns concatenated objects as string or array. Return type depends from arguments type.
 * @throws { Exception } If ( arguments.length ) is less or more than two.
 * @throws { Exception } If some object from ( srcs ) is not a Array, String or Number.
 * @throws { Exception } If length of arrays in ( srcs ) is different.
 * @throws { Exception } If ( joiner ) is not a string.
 * @namespace Tools
 *
 */

function strJoinPath( srcs, joiner )
{
  let result = [ '' ];
  let arrayEncountered = 0;
  let arrayLength;

  _.assert( arguments.length === 2, () => 'Expects an array of string and joiner, but got ' + arguments.length + ' arguments' );
  _.assert( _.arrayLike( srcs ), () => 'Expects an array of strings, but got ' + _.strType( srcs ) );
  _.assert( _.strIs( joiner ), () => 'Expects joiner, but got ' + _.strType( joiner ) );

  /* xxx */

  for( let a = 0 ; a < srcs.length ; a++ )
  {
    let src = srcs[ a ];

    _.assert( _.strIs( src ) || _.numberIs( src ) || _.arrayIs( src ) );

    if( _.arrayIs( src ) )
    {

      if( arrayEncountered === 0 )
      for( let s = 1 ; s < src.length ; s++ )
      result[ s ] = result[ 0 ];

      _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
      arrayLength = src.length;

      arrayEncountered = 1;
      for( let s = 0 ; s < src.length ; s++ )
      join( src[ s ], s, a );

    }
    else
    {

      for( let s = 0 ; s < result.length ; s++ )
      join( src, s, a );

    }

  }

  if( arrayEncountered )
  return result;
  else
  return result[ 0 ];

  /* */

  function join( src, s, a )
  {
    if( _.numberIs( src ) )
    src = src.toString();

    if( a > 0 && joiner )
    {
      let ends = _.strEnds( result[ s ], joiner );
      let begins = _.strBegins( src, joiner );
      if( begins && ends )
      result[ s ] = _.strRemoveEnd( result[ s ], joiner ) + src;
      else if( begins || ends )
      result[ s ] += src;
      else
      result[ s ] += joiner + src;
    }
    else
    {
      result[ s ] += src;
    }
  }
}


//

/**
 * The routine strConcat() provides the concatenation of array elements
 * into a string. Returned string can be formatted by using options in options map.
 *
 * @param { ArrayLike|* } srcs - ArrayLike container with elements or single element to make string.
 * If {-srcs-} is not ArrayLike, routine converts to string provided value.
 * @param { Object } o - Options map.
 * @param { String } o.lineDelimter - The line delimeter. Default value is new line symbol '\n'.
 * If string element of array has not delimeter in the end or next element has not delimeter in the begin, routine insert one space between this elements.
 * @param { String } o.linePrefix - The prefix that adds to every line. Default value is empty string.
 * @param { String } o.linePostfix - The postfix that adds to every line. Default value is empty string.
 * @param { Object } o.optionsForToStr - The options for routine _.toStr that uses for convertion to string. Default value is null.
 * @param { Routine } o.onToStr - The callback, which uses for convertion to string. Default value is null.
 *
 * @example
 * _.strConcat( 'str' );
 * // returns 'str '
 *
 * @example
 * _.strConcat( 11 );
 * // returns '11 '
 *
 * @example
 * _.strConcat( { a : 'a' } );
 * // returns '[object Object] '
 *
 * @example
 * _.strConcat( [ 1, 2, 'str', [ 3, 4 ] ] );
 * // returns '1 2 str 3,4 '
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 1, 2, 'str', [ 3, 4 ] ], options );
 * // returns '** 1 2 str 3,4 **'
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 'a\n', 'b\n', 'c\n', 'd\n' ], options );
 * // returns '** a **
 *             ** b **
 *             ** c **
 *             ** d **'
 *
 * @example
 * let onToStr = ( src ) => String( src ) + '*';
 * let options = { onToStr };
 * _.strConcat( [ 'a', 'b', 'c', 'd' ], options );
 * // returns 'a* b* c* d* '
 *
 * @returns { String } - Returns string, which is concatenated from {-srcs-}.
 * @function strConcat
 * @throws { Error } If arguments.length is less then one or more than two arguments.
 * @throws { Error } If routine strConcat does not belong module Tools.
 * @namespace Tools
 */

/*
aaa : cover routine strConcat and extend it. ask how to
Dmytro : routine covered and documented, not extended
*/

/*
  aaa : does not work properly, remove indentation, but should not
  srcs :
[
  'b',
  `variant:: : #83
  path::local
  module::module-a
`
]


  Dmytro : fixed, all comments below
*/

function strConcat( srcs, o )
{

  o = _.routineOptions( strConcat, o || Object.create( null ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.strConcat === strConcat );

  if( o.onToStr === null )
  o.onToStr = function onToStr( src, op )
  {
    return _.toStr( src, op.optionsForToStr );
  }

  let defaultOptionsForToStr =
  {
    stringWrapper : '',
  }

  o.optionsForToStr = _.mapSupplement( o.optionsForToStr, defaultOptionsForToStr, strConcat.defaults.optionsForToStr );

  if( _.routineIs( srcs ) )
  srcs = srcs();

  if( !_.arrayLike( srcs ) )
  srcs = [ srcs ];

  let result = '';
  if( !srcs.length )
  return result;

  /* */

  for( let a = 0 ; a < srcs.length ; a++ )
  {
    let src = srcs[ a ];

    src = o.onToStr( src, o );

    result = result.replace( /[^\S\n]\s*$/, '' ); /* Dmytro : this regExp remove not \n symbol in the end of string, only spaces */
    // result = result.replace( /\s*$/m, '' );

    if( !result )
    {
      result = src;
    }
    // else if( _.strEnds( result, o.lineDelimter ) || _.strBegins( src, o.lineDelimter ) )
    // {
    //   result = result + o.lineDelimter + src; /* Dmytro : if delimeter exists, it's not need  */
    // }
    else if( _.strEnds( result, o.lineDelimter ) || _.strBegins( src, o.lineDelimter ) )
    {
      result = result + src;
    }
    else
    {
      result = result + ' ' + src.replace( /^\s+/, '' );
      // result = result + ' ' + src.replace( /^\s+/m, '' ); /* Dmytro : flag 'm' - multiline, but no global, so routine replace first inclusion */
    }

  }

  // let nl = 1;
  // for( let a = 0 ; a < srcs.length ; a++ )
  // {
  //   let src = srcs[ a ];
  //   src = _.toStr( src, o.optionsForToStr );
  //   if( !nl )
  //   {
  //     let i = src.trim().lastIndexOf( o.lineDelimter );
  //     if( i === -1 )
  //     {
  //       if( result[ result.length-1 ] !== ' ' && src[ 0 ] !== ' ' )
  //       result += o.delimeter;
  //     }
  //     else
  //     {
  //       if( i !== 0 )
  //       result += o.lineDelimter;
  //     }
  //   }
  //   if( src.length )
  //   nl = src[ src.length-1 ] === o.lineDelimter;
  //   // if( _.errIs( src ) )
  //   // debugger;
  //   result += src;
  // }

  /* */

  if( o.linePrefix || o.linePostfix )
  {
    result = result.split( o.lineDelimter );
    result = o.linePrefix + result.join( o.linePostfix + o.lineDelimter + o.linePrefix ) + o.linePostfix;
  }

  /* */

  return result;
}

strConcat.defaults =
{
  linePrefix : '',
  linePostfix : '',
  lineDelimter : '\n',
  // delimeter : ' ',
  optionsForToStr : null,
  onToStr : null,
}

// --
// liner
// --

/**
 * Adds indentation character(s) to passed string.
 * If( src ) is a multiline string, function puts indentation character( tab ) before first
 * and every next new line in a source string( src ).
 * If( src ) represents single line, function puts indentation at the begining of the string.
 * If( src ) is a Array, function prepends indentation character( tab ) to each line( element ) of passed array.
 *
 * @param { String/Array } src - Source string to parse or array of lines( not array of texts ).
 * With line we mean it does not have eol. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strLinesIndentation( array.join( '\n' ), '_' ).
 * @param { String } tab - Indentation character.
 * @returns { String } Returns indented string.
 *
 * @example
 *  _.strLinesIndentation( 'abc', '_' )
 * // returns '_abc'
 *
 * @example
 * _.strLinesIndentation( 'a\nb\nc', '_' )
 * // returns
 * // _a
 * // _b
 * // _c
 *
 * @example
 * _.strLinesIndentation( [ 'a', 'b', 'c' ], '_' )
 * // returns
 * // _a
 * // _b
 * // _c
 *
 * @example
 * let array = [ 'a\nb', 'c\nd' ];
 * _.strLinesIndentation( array.join( '\n' ), '_' )
 * // returns
 * // _a
 * // _b
 * // _c
 * // _d
 *
 * @method strLinesIndentation
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @throws { Exception } Throw an exception if( tab ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not a equal 2.
 * @namespace Tools
 *
 */

function strLinesIndentation( src, tab )
{

  _.assert( arguments.length === 2, 'Expects two arguments' );
  _.assert( _.strIs( src ) || _.arrayIs( src ), 'Expects src as string or array' );
  _.assert( _.strIs( tab ) || _.numberIs( tab ), 'Expects tab as string or number' ); /* aaa2 : cover please */ /*Dmytro : covered */

  if( _.numberIs( tab ) )
  tab = _.strDup( ' ', tab );

  if( _.strIs( src ) )
  {

    if( src.indexOf( '\n' ) === -1 )
    return src;

    // if( src.indexOf( '\n' ) === -1 )
    // return tab + src;

    src = src.split( '\n' );

  }

/*
  should be no tab in prolog
*/

  let result = src.join( '\n' + tab );
  // let result = tab + src.join( '\n' + tab );

  return result;
}

// //
//
// function strLinesIndentationButFirst( src, tab )
// {
//
//   _.assert( _.strIs( src ) || _.arrayIs( src ), 'Expects src as string or array' );
//   _.assert( _.strIs( tab ), 'Expects string tab' );
//   _.assert( arguments.length === 2, 'Expects two arguments' );
//
//   if( _.strIs( src ) )
//   {
//
//     if( src.indexOf( '\n' ) === -1 )
//     return tab + src;
//
//     src = src.split( '\n' );
//
//   }
//
// /*
//   should be no tab in prolog
// */
//
//   let result = src.join( '\n' + tab );
//
//   return result;
// }

//

/**
 * Routine strLinesBut() replaces a range {-range-} of lines in source string {-src-} to new
 * values in {-ins-} parameter.
 *
 * @param { String|Long } src - Source string or array of strings.
 * If {-src-} is a String, then it split to parts using delimeter '\n'.
 * @param { Range|Number } range - Range of lines to be replaced.
 * If {-range-} is a Number, then routine replace only one line defined by value of {-range-}.
 * @param { String|Long } ins - String or array of strings to be inserted in source string.
 * If {-ins-} is a Long, then elements of Long concatenates using delimeter '\n'.
 * If range[ 0 ] or range[ 1 ] is less than zero, then routine count lines from the end of {-src-}.
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', 1 );
 * // returns 'ab \n cd \n de'
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', -1 );
 * // returns 'ab \n bc \n cd '
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', [ 1, 4 ], '' );
 * // returns 'ab '
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', [ 1, -1 ], '' );
 * // returns 'ab \n de'
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', 1, ' some \n string ' );
 * // returns 'ab \n some \n string \n cd \n de'
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', -1, ' some \n string ' );
 * // returns 'ab \n bc \n cd \n some \n string '
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', [ 1, 4 ], [ ' some ', ' string' ] );
 * // returns 'ab \n some \n string'
 *
 * @example
 * _.strLinesBut( 'ab \n bc \n cd \n de', [ 1, -1 ], [ ' some ', ' string' ] );
 * // returns 'ab \n some \n string\n de'
 *
 * @example
 * _.strLinesBut( [ 'ab ', ' bc ', ' cd ', ' de' ], 1, ' some \n string ' );
 * // returns 'ab \n some \n string \n cd \n de'
 *
 * @example
 * _.strLinesBut( [ 'ab ', ' bc ', ' cd ', ' de' ], -1, ' some \n string ' );
 * // returns 'ab \n bc \n cd \n some \n string '
 *
 * @example
 * _.strLinesBut( [ 'ab ', ' bc ', ' cd ', ' de' ], [ 1, 4 ], [ ' some ', ' string' ] );
 * // returns 'ab \n some \n string'
 *
 * @example
 * _.strLinesBut( [ 'ab ', ' bc ', ' cd ', ' de' ], [ 1, -1 ], [ ' some ', ' string' ] );
 * // returns 'ab \n some \n string\n de'
 *
 * @returns { String } - Returns string concatenated from original source string and inserted values.
 * @function strLinesBut
 * @throws { Exception } If arguments.length is less then two or more then three.
 * @throws { Exception } If {-src-} is not a String or a Long.
 * @throws { Exception } If {-ins-} is not a String, not a Long, not undefined.
 * @namespace Tools
 */

function strLinesBut( src, range, ins )
{

  if( _.strIs( src ) )
  src = src.split( '\n' );

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( _.longIs( src ) );
  _.assert( ins === undefined || _.strIs( ins ) || _.longIs( ins ) );
  // _.assert( !_.longIs( ins ), 'not implemented' );

  if( _.numberIs( range ) )
  {
    if( range < 0 )
    range = src.length + range;
    range = [ range, range + 1 ];
  }

  if( range[ 1 ] < 0 )
  range[ 1 ] = src.length + range[ 1 ];

  _.assert( _.rangeIs( range ) );

  /*
    aaa : should work
    _.strLinesBut( _.strLinesBut( got1, 0 ), -1 )

    Dmytro : works
  */

  /*
    aaa : implement not implemented
    Dmytro : implemented
  */

  if( _.longIs( ins ) )
  return _.longBut( src, range, ins ).join( '\n' );
  else if( _.strIs( ins ) )
  return _.longBut( src, range, [ ins ] ).join( '\n' );
  else
  return _.longBut( src, range ).join( '\n' );

  // if( ins )
  // {
  //   _.assert( _.strIs( ins ) );
  //   return _.longBut( src, range, [ ins ] ).join( '\n' );
  // }
  // else
  // {
  //   return _.longBut( src, range ).join( '\n' );
  // }

}

//

/**
 * Routine strLinesOnly() selects a range {-range-} of lines in source string {-src-} and returns
 * new string joined from it.
 *
 * @param { String|Long } src - Source string or array of strings.
 * If {-src-} is a String, then it split to parts using delimeter '\n'.
 * @param { Range|Number } range - Range of lines to be selected.
 * If {-range-} is a Number, then routine selects only one line defined by value of {-range-}.
 * If range[ 0 ] or range[ 1 ] is less than zero, then routine count lines from the end of {-src-}.
 *
 * @example
 * _.strLinesOnly( 'ab \n bc \n cd \n de', 1 );
 * // returns ' bc '
 *
 * @example
 * _.strLinesOnly( 'ab \n bc \n cd \n de', -1 );
 * // returns ' de'
 *
 * @example
 * _.strLinesOnly( 'ab \n bc \n cd \n de', [ 1, 4 ] );
 * // returns ' bc \n cd \n de'
 *
 * @example
 * _.strLinesOnly( 'ab \n bc \n cd \n de', [ 1, -1 ] );
 * // returns ' bc \n cd '
 *
 * @example
 * _.strLinesOnly( [ 'ab ', ' bc ', ' cd ', ' de' ], 1 );
 * // returns ' bc '
 *
 * @example
 * _.strLinesOnly( [ 'ab ', ' bc ', ' cd ', ' de' ], -1 );
 * // returns ' de'
 *
 * @example
 * _.strLinesOnly( [ 'ab ', ' bc ', ' cd ', ' de' ], [ 1, 4 ] );
 * // returns ' bc \n cd \n de'
 *
 * @example
 * _.strLinesOnly( [ 'ab ', ' bc ', ' cd ', ' de' ], [ 1, -1 ] );
 * // returns ' bc \n cd '
 *
 * @returns { String } - Returns a range of lines from source string concatenated by new line symbol.
 * @function strLinesOnly
 * @throws { Exception } If arguments.length is less then two or more then three.
 * @throws { Exception } If {-src-} is not a String or a Long.
 * @namespace Tools
 */

function strLinesOnly( src, range )
{

  if( _.strIs( src ) )
  src = src.split( '\n' );

  _.assert( arguments.length === 2 );
  _.assert( _.longIs( src ) );

  if( _.numberIs( range ) )
  range = [ range, range + 1 ];
  if( range[ 0 ] < 0 )
  range[ 0 ] = src.length >= -range[ 0 ] ? src.length + range[ 0 ] : 0
  if( range[ 1 ] < 0 )
  range[ 1 ] = src.length + range[ 1 ];

  _.assert( _.rangeIs( range ) );

  let result = [];
  for( let i = range[ 0 ]; i < range[ 1 ] && i < src.length; i++ )
  result[ i - range[ 0 ] ] = src[ i ];

  return result.join( '\n' );

}

//

function strLinesSplit( src )
{
  _.assert( _.strIs( src ) || _.arrayIs( src ) );
  _.assert( arguments.length === 1 );
  if( _.arrayIs( src ) )
  return src;
  return src.split( '\n' );
}

//

function strLinesJoin( src )
{
  _.assert( _.strIs( src ) || _.arrayIs( src ) );
  _.assert( arguments.length === 1 );
  let result = src;
  if( _.arrayIs( src ) )
  result = src.join( '\n' );
  return result;
}

//

/**
 * Remove espace characters and white spaces at the begin or at the end of each line.
 * Input arguments can be strings or arrays of strings. If input is a string, it splits it in lines and
 * removes the white/escape characters from the beggining and the end of each line. If input is an array,
 * it treats it as a single string split into lines, where each entry corresponds to a line. Therefore,
 * it removes the white/escape characters only from the beggining and the end of the strings in the array.
 *
 * @param { String/Array } [ src ] - Source string or array of strings.
 * @returns { String/Array } Returns string/array with empty lines and spaces removed.
 *
 * @example input string
 * _.strLinesStrip( '  Hello \r\n\t World \n\n ' );
 * // returns 'Hello\nWorld'
 *
 * @example input array
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ] );
 * // returns  [ 'Hello \r\n\t world', '!' ]
 *
 * @example input strings
 * _.strLinesStrip( '  Hello \r\n\t', ' World \n\n  ! \n\n', '\n\n' );
 * // returns [ 'Hello', 'World\n!', '' ]
 *
 * @example input arrays
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ], [ '\n\nHow\n\nAre  ', '  \r\nyou ? \n'], [ '\t\r\n  ' ] );
 * // returns [ [ 'Hello \r\n\t world', '!' ], [ 'How\n\nAre', 'you ?' ], [] ]
 *
 * @method strLinesStrip
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @namespace Tools
 */

function strLinesStrip( src )
{

  if( arguments.length > 1 )
  {
    let result = _.unrollMake( null );
    for( let a = 0 ; a < arguments.length ; a++ )
    result[ a ] = strLinesStrip( arguments[ a ] );
    return result;
  }

  _.assert( _.strIs( src ) || _.arrayIs( src ) );
  _.assert( arguments.length === 1 );

  let lines = _.strLinesSplit( src );
  lines = lines.map( ( line ) => line.trim() ).filter( ( line ) => line );

  if( _.strIs( src ) )
  lines = _.strLinesJoin( lines );
  return lines;
}

//

/**
 * Puts line counter before each line/element of provided source( o.src ).
 * If( o.src ) is a string, function splits it into array using new line as splitter, then puts line counter at the beginning of each line( element ).
 * If( o.src ) is a array, function puts line counter at the beginning of each line( element ).
 * Initial value of a counter can be changed by defining( o.first ) options( o ) property.
 * Can be called in two ways:
 * - First by passing all options in one object;
 * - Second by passing source only and using default value of( first ).
 *
 * @param { Object } o - options.
 * @param { String/Array } [ o.src=null ] - Source string or array of lines( not array of texts ).
 * With line we mean it does not have EOF. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strLinesNumber( array.join( '\n' ) ).
 * @param { Number} [ o.first=1 ] - Sets initial value of a counter.
 * @returns { String } Returns string with line enumeration.
 *
 * @example
 * _.strLinesNumber( 'line' );
 * // returns '1 : line'
 *
 * @example
 * _.strLinesNumber( 'line1\nline2\nline3' );
 * // returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( [ 'line', 'line', 'line' ] );
 * // returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( { src:'line1\nline2\nline3', zeroLine : 2 } );
 * // returns
 * // 2: line1
 * // 3: line2
 * // 4: line3
 *
 * @method strLinesNumber
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String or Array.
 * @namespace Tools
 */

function strLinesNumber( o )
{

  if( !_.objectIs( o ) )
  o = { src : arguments[ 0 ], zeroLine : arguments[ 1 ] };

  _.routineOptions( strLinesNumber, o );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.strIs( o.src ) || _.strsAreAll( o.src ), 'Expects string or strings {-o.src-}' );

  /* */

  if( o.zeroLine === null  )
  {
    if( o.zeroChar === null )
    {
      o.zeroLine = 1;
    }
    else if( _.numberIs( o.zeroChar ) )
    {
      let src = _.arrayIs( o.src ) ? o.src.join( '\n' ) : o.src;
      o.zeroLine = _.strLinesCount( src.substring( 0, o.zeroChar+1 ) );
    }
  }

  /* */

  let lines = _.strIs( o.src ) ? o.src.split( '\n' ) : o.src;

  /* */

  let maxNumberLength = String( lines.length - 1 + o.zeroLine ).length;
  let zeroLineLength = String( o.zeroLine ).length;
  let maxNumLength = maxNumberLength > zeroLineLength ? maxNumberLength : zeroLineLength;

  if( o.onLine )
  for( let l = 0; l < lines.length; l += 1 )
  {
    let numLength = String( l + o.zeroLine ).length;

    lines[ l ] = o.onLine( [ ' '.repeat( maxNumLength - numLength ), ( l + o.zeroLine ), ' : ', lines[ l ] ], o.zeroLine + l, o );
    if( lines[ l ] === undefined )
    {
      lines.splice( l, 1 );
      l -= 1;
    }
    _.assert( _.strIs( lines[ l ] ) );
  }
  else
  for( let l = 0; l < lines.length; l += 1 )
  {
    let numLength = String( l + o.zeroLine ).length;
    lines[ l ] = ' '.repeat( maxNumLength - numLength ) + ( l + o.zeroLine ) + ' : ' + lines[ l ];
  }

  /* */

  return lines.join( '\n' );
}

strLinesNumber.defaults =
{
  src : null,
  zeroLine : null,
  zeroChar : null,
  onLine : null,
  highlighting : '*', /* qqq2 : implement and cover option o.highlighting */
}

/*
aaa : cover zeroLine
Dmytro : covered
aaa : cover zeroChar
Dmytro : covered
aaa : cover onLine
Dmytro : covered
*/

//

// function strLinesAt( code, line, radius )
// {
//   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
//   _.assert( _.strIs( code ) || _.arrayIs( code ) );
//   _.assert( _.numberIs( line ) );
//
//   if( radius === undefined )
//   radius = 2;
//
//   debugger;
//
//   let lines = code.split( '\n' );
//   let result = lines.slice( line-radius, line+radius-1 );
//   result = _.strLinesNumber( result, line-radius+1 );
//
//   return result;
// }

//

/**
 * Selects range( o.range ) of lines from source string( o.src ).
 * If( o.range ) is not specified and ( o.line ) is provided function uses it with ( o.selectMode ) option to generate new range.
 * If( o.range ) and ( o.line ) are both not provided function generates range by formula: [ 0, n + 1 ], where n: number of ( o.delimteter ) in source( o.src ).
 * Returns selected lines range as string or empty string if nothing selected.
 * Can be called in three ways:
 * - First by passing all parameters in one options map( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 * - Third by passing source string( o.src ), range start and end position.
 *
 * @param {Object} o - Options.
 * @param {String} [ o.src=null ] - Source string.
 * @param {Array|Number} [ o.range=null ] - Sets range of lines to select from( o.src ) or single line number.
 * @param {Number} [ o.zero=1 ] - Sets base value for a line counter.
 * @param {Number} [ o.number=0 ] - If true, puts line counter before each line by using o.range[ 0 ] as initial value of a counter.
 * @param {String} [ o.delimteter='\n' ] - Sets new line character.
 * @param {String} [ o.line=null ] - Sets line number from which to start selecting, is used only if ( o.range ) is null.
 * @param {Number} [ o.nearestLines=3 ] - Sets maximal number of lines to select, is used only if ( o.range ) is null and ( o.line ) option is specified.
 * @param {String} [ o.selectMode='center' ] - Determines in what way funtion must select lines, works only if ( o.range ) is null and ( o.line ) option is specified.
 * Possible values:
 * - 'center' - uses ( o.line ) index as center point and selects ( o.nearestLines ) lines in both directions.
 * - 'begin' - selects ( o.nearestLines ) lines from start point ( o.line ) in forward direction;
 * - 'end' - selects ( o.nearestLines ) lines from start point ( o.line ) in backward direction.
 * @returns {string} Returns selected lines as new string or empty if nothing selected.
 *
 * @example
 * // selecting single line
 * _.strLinesSelect( 'a\nb\nc', 1 );
 * // returns 'a'
 *
 * @example
 * // selecting first two lines
 * _.strLinesSelect( 'a\nb\nc', [ 1, 3 ] );
 * // returns
 * // 'a
 * // b'
 *
 * @example
 * // selecting first two lines, second way
 * _.strLinesSelect( 'a\nb\nc', 1, 3 );
 * // returns
 * // 'a
 * // b'
 *
 * @example
 * // custom new line character
 * _.strLinesSelect({ src : 'a b c', range : [ 1, 3 ], delimteter : ' ' });
 * // returns 'a b'
 *
 * @example
 * // setting preferred number of lines to select, line option must be specified
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, nearestLines : 1 });
 * // returns 'b'
 *
 * @example
 * // selecting 2 two next lines starting from second
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, nearestLines : 2, selectMode : 'begin' });
 * // returns
 * // 'b
 * // c'
 *
 * @example
 * // selecting 2 two lines starting from second in backward direction
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, nearestLines : 2, selectMode : 'end' });
 * // returns
 * // 'a
 * // b'
 *
 * @method strLinesSelect
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.range ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @namespace Tools
 */

function strLinesSelect( o )
{

  if( arguments.length === 2 )
  {

    if( _.arrayIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : arguments[ 1 ] };
    else if( _.numberIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 1 ]+1 ] };
    else _.assert( 0, 'unexpected argument', _.strType( range ) );

  }
  else if( arguments.length === 3 )
  {
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 2 ] ] };
  }

  _.routineOptions( strLinesSelect, o );
  _.assert( arguments.length <= 3 );
  _.assert( _.strIs( o.src ) );
  _.assert( _.boolLike( o.highlighting ) || _.longHas( [ '*' ], o.highlighting ) );

  if( _.boolLike( o.highlighting ) && o.highlighting )
  o.highlighting = '*';

  /* range */

  if( !o.range )
  {
    if( o.line !== null )
    {
      if( o.selectMode === 'center' )
      o.range = [ o.line - Math.ceil( ( o.nearestLines + 1 ) / 2 ) + 1, o.line + Math.floor( ( o.nearestLines - 1 ) / 2 ) + 1 ];
      else if( o.selectMode === 'begin' )
      o.range = [ o.line, o.line + o.nearestLines ];
      else if( o.selectMode === 'end' )
      o.range = [ o.line - o.nearestLines+1, o.line+1 ];
    }
    else
    {
      o.range = [ 0, _.strCount( o.src, o.delimteter )+1 ];
    }
  }

  if( o.line === null )
  {
    if( o.selectMode === 'center' )
    o.line = Math.floor( ( o.range[ 0 ] + o.range[ 1 ] ) / 2 );
    else if( o.selectMode === 'begin' )
    o.line = o.range[ 0 ];
    else if( o.selectMode === 'end' )
    o.line = o.range[ 1 ] - 1;
  }

  _.assert( _.longIs( o.range ) );
  _.assert( _.intIs( o.line ) );

  /* */

  let f = 0;
  let counter = o.zeroLine;
  while( counter < o.range[ 0 ] )
  {
    f = o.src.indexOf( o.delimteter, f );
    if( f === -1 )
    return '';
    f += o.delimteter.length;
    counter += 1;
  }

  /* */

  let l = f-1;
  while( counter < o.range[ 1 ] )
  {
    l += 1;
    l = o.src.indexOf( o.delimteter, l );
    if( l === -1 )
    {
      l = o.src.length;
      break;
    }
    counter += 1;
  }

  /* */

  let result = f < l ? o.src.substring( f, l ) : '';

  /* numbering */

  if( o.numbering )
  result = _.strLinesNumber
  ({
    src : result,
    zeroLine : o.range[ 0 ],
    onLine : lineHighlight,
  });

  return result;

  /* */

  function lineHighlight( line, l )
  {
    if( !o.highlighting )
    return line.join( '' );
    if( l === o.line )
    line[ 0 ] = '* ' + line[ 0 ];
    else
    line[ 0 ] = '  ' + line[ 0 ];
    // line[ 1 ] = _.strBut( line[ 1 ], 0, '*' );
    return line.join( '' );
  }

  /* */

}

strLinesSelect.defaults =
{

  src : null,
  range : null,

  line : null,
  nearestLines : 3,
  selectMode : 'center',
  highlighting : '*',

  numbering : 0,
  zeroLine : 1,
  delimteter : '\n',

}

/* aaa :
- cover option highlighting
Dmytro : covered
- cover option zeroLine
Dmytro : covered
*/

//

/**
 *
 * Get the nearest ( o.nearestLines ) lines to the range ( o.charsRangeLeft ) from source string( o.src ).
 * Returns object with two elements: .
 * Can be called in two ways:
 * - First by passing all parameters in one options map( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;

 * The routine strLinesNearest returns the nearest {-o.numberOfLines-} lines to the range {-o.charsRangeLeft-} from source string {-o.src-}.
 * Returns object with two elements: splits - array with a substring & the nearest lines and spans - array of indexes of the nearest lines.
 * Can be called in two ways:
 * - First by passing all parameters in one options map {-o-} ;
 * - Second by passing source string {-o.src-} and range {-o.range-} as array or number;

 *
 * @example
 * // selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRangeLeft : [ 2, 4 ],
 *   nearestLines : 1,
 * });
 * // returns o.splits = [ 'a', '\nb', 'c' ];
 * // returns o.spans = [ 1, 2, 4, 5 ];
 *
 * @example
 * // selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRangeLeft : 3,
 *   nearestLines : 2,
 * });
 * // returns o.splits = [ 'a\n', 'b', 'c' ];
 * // returns o.spans = [ 1, 3, 4, 5 ];
 *
 * @returns { MapLike } - Returns object with next fields:
 * splits - Array with three entries:
 * splits[ 0 ] and splits[ 2 ] contains a string with the nearest lines,
 * and splits[ 1 ] contains the substring corresponding to the range.
 * spans - Array with indexes of begin and end of nearest lines.
 * @param { MapLike } o - Options.
 * @param { String } o.src - Source string.
 * @param { Array|Number } o.range - Sets range of lines to select from {-o.src-} or single line number.
 * @param { Number } o.numberOfLines - Sets number of lines to select.
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if {-o.src-} is not a String.
 * @throws { Exception } Throw an exception if {-o.charsRangeLeft-} is not a Array or Number.
 * @throws { Exception } Throw an exception if {-o-} is extended by unknown property.
 * @function strLinesNearest
 * @namespace Tools
 */

function strLinesNearest_pre( routine, args )
{

  let o = args[ 0 ];
  if( args[ 1 ] !== undefined )
  o = { src : args[ 0 ], charsRangeLeft : args[ 1 ] };

  _.routineOptions( routine, o );

  if( _.numberIs( o.charsRangeLeft ) )
  o.charsRangeLeft = [ o.charsRangeLeft, o.charsRangeLeft+1 ];

  _.assert( _.rangeIs( o.charsRangeLeft ) );

  return o;
}

//

function strLinesNearest_body( o )
{
  let result = Object.create( null );
  // let resultCharRange = [];
  let i, nearestLines;

  result.splits = [];
  result.spans = [ o.charsRangeLeft[ 0 ], o.charsRangeLeft[ 0 ], o.charsRangeLeft[ 1 ], o.charsRangeLeft[ 1 ] ];

  // logger.log( 'Result', result )
  // logger.log( )
  // /* */

  if( o.nearestLines === 0 )
  {
    // result = [];
    result.splits = [];
    result.splits[ 0 ] = '';
    result.splits[ 1 ] = o.src.substring( o.charsRangeLeft[ 0 ], o.charsRangeLeft[ 1 ] );
    result.splits[ 2 ] = '';
    return result;
  }

  /* */

  let nearestLinesLeft = Math.ceil( ( o.nearestLines+1 ) / 2 );
  nearestLines = nearestLinesLeft;
  if( nearestLines > 0 )
  {
    for( i = o.charsRangeLeft[ 0 ]-1 ; i >= 0 ; i-- )
    {
      if( o.src[ i ] === '\n' )
      nearestLines -= 1;
      if( nearestLines <= 0 )
      break;
    }
    i = i+1;
  }
  result.spans[ 0 ] = i;

/*
  // 0 -> 0 + 0 = 0
  // 1 -> 1 + 1 = 2
  // 2 -> 2 + 1 = 3
  // 3 -> 2 + 2 = 4
*/

  /* */

  let nearestLinesRight = o.nearestLines + 1 - nearestLinesLeft;
  nearestLines = nearestLinesRight;
  if( nearestLines > 0 )
  {
    for( i = o.charsRangeLeft[ 1 ] ; i < o.src.length ; i++ )
    {
      if( o.src[ i ] === '\n' )
      nearestLines -= 1;
      if( nearestLines <= 0 )
      break;
    }
  }
  result.spans[ 3 ] = i;

  /* */

  result.splits[ 0 ] = o.src.substring( result.spans[ 0 ], result.spans[ 1 ] );
  result.splits[ 1 ] = o.src.substring( result.spans[ 1 ], result.spans[ 2 ] );
  result.splits[ 2 ] = o.src.substring( result.spans[ 2 ], result.spans[ 3 ] );

  // result.splits[ 0 ] = o.src.substring( resultCharRange[ 0 ], o.charsRangeLeft[ 0 ] );
  // result.splits[ 1 ] = o.src.substring( o.charsRangeLeft[ 0 ], o.charsRangeLeft[ 1 ] );
  // result.splits[ 2 ] = o.src.substring( o.charsRangeLeft[ 1 ], resultCharRange[ 1 ] );

  return result;
}

strLinesNearest_body.defaults =
{
  src : null,
  charsRangeLeft : null,
  nearestLines : 3,
  // outputFormat : 'map',
}

let strLinesNearest = _.routineFromPreAndBody( strLinesNearest_pre, strLinesNearest_body );

//

/**
 * The routine strLinesNearestLog returns a report about found string from the source string {-o.src-}.
 * Returns object with 2 elements: nearest - array with a substring & the nearest lines around, report - string with the found substring & surrounding lines.
 *
 * @example
 * // selecting first 5 letters, next 3 letters and rest letters
 * _.strLinesNearestLog
 * ({
 *   src : 'function add( x,y ) { return x + y }',
 *   charsRangeLeft : [ 5, 8 ],
 *   gray : 1,
 *   numberOfLines : 1
 * });
 * // returns {
 * //           nearest : [ 'funct', 'ion', ' add( x,y ) { return x + y }' ],
 * //           report : '1 : function add( x,y ) { return x + y }'
 * //         }
 *
 * @returns { MapLike } - Returns object with next fileds:
 *    nearest { Array } - 3 elements: 1 - lines to the left of charsRangeLeft if {-numberOfLines-} allows, 2 - chars in range {-o.charsRangeLeft-}, 3 - lines to the right of {-o.charsRangeLeft-} if {-numberOfLines-} allows.
 *    report { String } - report about found string along with surrounding lines {-numberOfLines-}
 * @param { MapLike } o - Options.
 * @param { String } o.src - Source string.
 * @param { Array|Number } o.charsRangeLeft - Sets range of lines to select from {-o.src-} or single line number.
 * @param { Number } o.numberOfLines - Sets number of lines to select.
 * @param { Number } o.gray - 0: Paints searched text in yellow, everything else in gray, 1: No highlighting
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if {-o.src-} is not a String.
 * @throws { Exception } Throw an exception if {-o.charsRangeLeft-} is not a Array or Number.
 * @throws { Exception } Throw an exception if {-o-} is extended by unknown property.
 * @function strLinesNearestLog
 * @namespace Tools
*/

function strLinesNearestLog_body( o )
{
  let result = o;

  _.assert( o.sub === null || _.strIs( o.sub ) );

  // debugger;
  if( !result.nearest )
  result.nearest = _.strLinesNearest.body( o ).splits;

  result.log = result.nearest.slice();
  if( o.gray )
  {
    if( o.sub !== null )
    result.log[ 1 ] = `{- ${result.log[ 1 ]} -} -> {- ${o.sub} -}`;
  }
  else
  {
    let str;
    if( o.sub === null )
    str = _.color.strFormat( result.log[ 1 ], { fg : 'yellow' } );
    else
    str = _.color.strFormat( result.log[ 1 ], { fg : 'red' } ) + _.color.strFormat( o.sub, { fg : 'green' } );
    result.log[ 1 ] = _.color.strUnescape( str );
  }
  result.log = result.log.join( '' );

  result.log = _.strLinesSplit( result.log );
  if( !o.gray )
  result.log = _.color.strEscape( result.log );

  let zeroLine = _.strLinesCount( o.src.substring( 0, o.charsRangeLeft[ 0 ] ) ) - 1;
  result.log = _.strLinesNumber
  ({
    src : result.log,
    zeroLine,
    onLine : ( line ) =>
    {
      if( !o.gray )
      {
        line[ 0 ] = _.color.strFormat( line[ 0 ], { fg : 'bright black' } );
        line[ 1 ] = _.color.strFormat( line[ 1 ], { fg : 'bright black' } );
      }
      return line.join( '' );
    }
  });

  return result;
}

strLinesNearestLog_body.defaults =
{
  src : null,
  sub : null,
  nearest : null, /* qqq2 : cover the option */
  charsRangeLeft : null,
  nearestLines : 3,
  gray : 0,
}

let strLinesNearestLog = _.routineFromPreAndBody( strLinesNearest_pre, strLinesNearestLog_body );

//

/**
 * Returns a count of lines in a string.
 * Expects one object: the string( src ) to be processed.
 *
 * @param {string} src - Source string.
 * @returns {number} Returns a number of lines in string.
 *
 * @example
 * _.strLinesCount( 'first\nsecond' );
 * // returns 2
 *
 * @example
 * _.strLinesCount( 'first\nsecond\nthird\n' );
 * // returns 4
 *
 * @method strLinesCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @namespace Tools
 *
*/

function strLinesCount( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ) );
  let result = src.indexOf( '\n' ) !== -1 ? src.split( '\n' ).length : 1;
  return result;
}

//

function strLinesRangeWithCharRange_pre( routine, args )
{

  let o = args[ 0 ];
  if( args[ 1 ] !== undefined )
  o = { src : args[ 0 ], charsRangeLeft : args[ 1 ] }

  _.assert( arguments.length === 2 );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( _.rangeIs( o.charsRangeLeft ) );
  _.assert( _.strIs( o.src ) );
  _.routineOptions( routine, o );

  return o;
}

//

function strLinesRangeWithCharRange_body( o )
{

  let pre = o.src.substring( 0, o.charsRangeLeft[ 0 ] );
  let mid = o.src.substring( o.charsRangeLeft[ 0 ], o.charsRangeLeft[ 1 ] );
  let result = []

  result[ 0 ] = _.strLinesCount( pre )-1;
  result[ 1 ] = result[ 0 ] + _.strLinesCount( mid );

  return result;
}

strLinesRangeWithCharRange_body.defaults =
{
  src : null,
  charsRangeLeft : null,
}

let strLinesRangeWithCharRange = _.routineFromPreAndBody( strLinesRangeWithCharRange_pre, strLinesRangeWithCharRange_body );

// --
// declare
// --

let Proto =
{

  // checker

  strIsHex,
  strIsMultilined,

  strHasAny,
  strHasAll,
  strHasNone,
  strHasSeveral,

  strsAnyHas,
  strsAllHas,
  strsNoneHas,

  // evaluator

  strCount,
  strStripCount,
  strsShortest,
  strsLongest,

  // replacer

  // _strRemovedBegin,
  // strRemoveBegin,
  // _strRemovedEnd,
  // strRemoveEnd,
  _strRemoved,
  strRemove,

  // strReplaceBegin,
  // strReplaceEnd,
  // _strReplaced,
  // strReplace,

  strPrependOnce,
  strAppendOnce,

  strReplaceWords,

  // etc

  strCommonLeft, /* aaa : document me */ /* Dmytro : documented */
  strCommonRight, /* aaa : document me */ /* Dmytro : documented */
  strRandom, /* aaa : document and extend test coverage */ /* Dmytro : coverage is extended, routine is documented */
  strAlphabetFromRange, /* aaa : cover and document please */ /* Dmytro : covered and documented */

  // formatter

  strForRange, /* xxx : investigate */
  strForCall, /* xxx : investigate */
  strStrShort, /* xxx : investigate */
  strDifference,

  // transformer

  strCapitalize,
  strDecapitalize,
  strEscape,
  strCodeUnicodeEscape, /* Dmytro : extended documentation */
  strUnicodeEscape, /* aaa : document me */ /* Dmytro : documented */
  strReverse,

  // stripper

  strStrip,
  strsStrip : _.vectorize( strStrip ),
  strStripLeft,
  strsStripLeft : _.vectorize( strStripLeft ),
  strStripRight,
  strsStripRight : _.vectorize( strStripRight ),
  strRemoveAllSpaces : _.vectorize( _strRemoveAllSpaces ),
  strStripEmptyLines : _.vectorize( _strStripEmptyLines ),

  // splitter

  strSplitStrNumber, /* experimental */
  strSplitChunks, /* experimental */

  // strSplitsCoupledGroup,
  // strSplitsUngroupedJoin,
  // strSplitsQuotedRejoin,
  // strSplitsDropDelimeters,
  // strSplitsStrip,
  // strSplitsDropEmpty,
  //
  // strSplitFast,
  // strSplit,
  // strSplitNonPreserving,
  //
  // strSplitInlined,
  // strSplitInlinedStereo,

  strSplitCamel,

  // extractor

  strOnlySingle,
  strOnly, //: _.vectorize( strOnlySingle ), /* aaa : cover and document */ /* Dmytro : covered and documented */
  strButSingle,
  strBut, // : _.vectorize( strButSingle ), /* aaa : cover and document */ /* Dmytro : covered and documented */
  strUnjoin, /* aaa : document me */ /* Dmytro : documented */

  // joiner

  strDup : _.vectorize( _strDup ), /* aaa : document me */ /* Dmytro : documented */
  strJoin,
  strJoinPath, /* aaa : cover and document me */ /* Dmytro : covered and documented */
  strConcat,

  // liner

  strLinesIndentation,
  strLinesBut, /* aaa : implement, document and cover */ /* Dmytro : extended, documented, covered */
  strLinesOnly, /* aaa : implement, document and cover */ /* Dmytro : implemented, documented, covered */
  strLinesSplit,
  strLinesJoin,
  strLinesStrip, /* aaa : test coverage */ /* Dmytro : covered a time ago */
  strLinesNumber,
  strLinesSelect,
  strLinesNearest, /* aaa : check coverage */ /* Dmytro : checked, improved formatting */
  strLinesNearestLog, /* qqq2 : cover please */
  strLinesCount,
  strLinesRangeWithCharRange,

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
