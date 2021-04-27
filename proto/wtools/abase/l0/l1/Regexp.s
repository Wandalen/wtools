( function _l1_Regexp_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;

// --
// regexp
// --

function is( src )
{
  return Object.prototype.toString.call( src ) === '[object RegExp]';
}

//

function objectIs( src )
{
  if( !_.RegexpObject )
  return false;
  return src instanceof _.RegexpObject;
}

//

function like( src )
{
  if( _.regexp.is( src ) || _.strIs( src ) )
  return true;
  return false;
}

// //
//
// function regexpsLike( srcs )
// {
//   if( !_.arrayIs( srcs ) )
//   return false;
//   for( let s = 0 ; s < srcs.length ; s++ )
//   if( !_.regexpLike( srcs[ s ] ) )
//   return false;
//   return true;
// }

//

function likeAll( src )
{
  _.assert( arguments.length === 1 );

  if( _.argumentsArray.like( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.regexp.like( src[ s ] ) )
    return false;
    return true;
  }

  return _.regexp.like( src );
}

//

function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  

  if( !_.regexp.is( src1 ) || !_.regexp.is( src2 ) )
  return false;

  return _.regexp._identicalShallow( src1, src2 );
}

//

function _identicalShallow( src1, src2 )
{
  return src1.source === src2.source && src1.flags === src2.flags;
}

//

function equivalentShallow( src1, src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
  return false;
  return src1.source === src2.source;
}

//

/**
 * Escapes special characters with a slash ( \ ). Supports next set of characters : .*+?^=! :${}()|[]/\
 *
 * @example
 * _.regexp.escape( 'Hello. How are you?' );
 * // returns "Hello\. How are you\?"
 *
 * @param {String} src Regexp string
 * @returns {String} Escaped string
 * @function escape
 * @namespace Tools
 */

function escape( src )
{
  _.assert( _.strIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  return src.replace( /([.*+?^=!:${}()|\[\]\/\\])/g, '\\$1' );
}

//

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.regexp.is( src ) );

  return `/${src.source}/${src.flags}`;
}

// --
// extension
// --

let ToolsExtension =
{

  regexpIs : is,
  regexpObjectIs : objectIs,
  regexpLike : like,
  regexpsLikeAll : likeAll,
  regexpIdentical : identicalShallow, /* qqq : cover please */
  regexpEquivalent : equivalentShallow, /* qqq : cover please | Done. Yevhen S. */

  regexpEscape : escape,

}

//

let Extension =
{

  // regexp

  is,
  objectIs,
  like,
  identical : identicalShallow,
  equivalent : equivalentShallow,
  equivalentShallow,
  identicalShallow,
  _identicalShallow,

  escape,

  // exporter

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,
}

//

let ExtensionS =
{

  // regexps

  likeAll,

}

_.assert( _.regexp === undefined );
_.regexp = Object.create( null );
_.assert( _.regexp.s === undefined );
_.regexp.s = Object.create( null );

Object.assign( _.regexp, Extension )
Object.assign( _.regexp.s, ExtensionS )
Object.assign( Self, ToolsExtension )

})();
