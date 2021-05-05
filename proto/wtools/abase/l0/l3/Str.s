( function _l3_Str_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// exporter
// --

function _exportStringDiagnosticShallow( src, o )
{
  return src;
}

//

function exportStringDiagnosticShallow( src, o )
{
  let result;
  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects 1 or 2 arguments' );
  _.assert( this.like( src ) );
  return this._exportStringDiagnosticShallow( ... arguments );
}

//

function _exportStringCodeShallow( src, o )
{
  return `'${src}'`;
}

//

function exportStringCodeShallow( src, o )
{
  let result;
  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects 1 or 2 arguments' );
  _.assert( this.like( src ) );
  return this._exportStringCodeShallow( ... arguments );
}

// --
// equaler
// --

function _identicalShallow( src1, src2 )
{
  return src1 === src2;
}

//

function identicalShallow( src1, src2, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  if( !this.is( src1 ) )
  return false;
  if( !this.is( src2 ) )
  return false;
  return this._identicalShallow( ... arguments );
}

//

// function _equivalentShallow( src1, src2 )
// {
//   let strIs1 = _.strIs( src1 );
//   let strIs2 = _.strIs( src2 );
//
//   // _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   //
//   // if( !strIs1 && strIs2 )
//   // return this._equivalentShallow( src2, src1 );
//
//   // _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );
//   // _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );
//
//   if( strIs1 && strIs2 )
//   {
//     /* qqq : for junior : bad | aaa : Fixed. */
//     if( src1 === src2 )
//     return true;
//     return _.strLinesStrip( src1 ) === _.strLinesStrip( src2 );
//   }
//   else
//   {
//     return false;
//     // return _.regexpIdentical( src1, src2 );
//   }
//
//   return false;
// }

//
//
// function _equivalentShallow( src1, src2 )
// {
//   let strIs1 = _.strIs( src1 );
//   let strIs2 = _.strIs( src2 );
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( !strIs1 && strIs2 )
//   return this._equivalentShallow( src2, src1 );
//
//   _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );
//   _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );
//
//   if( strIs1 && strIs2 )
//   {
//     /* qqq : for junior : bad | aaa : Fixed. */
//     if( src1 === src2 )
//     return true;
//
//     return _.strLinesStrip( src1 ) === _.strLinesStrip( src2 );
//
//   }
//   else if( strIs1 )
//   {
//     _.assert( !!src2.exec );
//     let matched = src2.exec( src1 );
//     if( !matched )
//     return false;
//     if( matched[ 0 ].length !== src1.length )
//     return false;
//     return true;
//   }
//   else
//   {
//     return _.regexpIdentical( src1, src2 );
//   }
//
//   return false;
// }

//

function _equivalentShallow( src1, src2 )
{
  let strIs1 = _.strIs( src1 );
  let strIs2 = _.strIs( src2 );

  if( !strIs1 && strIs2 )
  return this._equivalentShallow( src2, src1 );

  if( strIs1 && strIs2 )
  {
    if( src1 === src2 )
    return true;
    return _.strLinesStrip( src1 ) === _.strLinesStrip( src2 );
  }
  else if( strIs1 )
  {
    _.assert( !!src2.exec );
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

function equivalentShallow( src1, src2, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  if( !_.regexp.like( src1 ) )
  return false;
  if( !_.regexp.like( src2 ) )
  return false;
  return _.str._equivalentShallow( ... arguments );
}

//
// //
//
// function strsEquivalent( src1, src2 )
// {
//
//   _.assert( _.strIs( src1 ) || _.regexpIs( src1 ) || _.longIs( src1 ), 'Expects string/regexp or array of strings/regexps {-src1-}' );
//   _.assert( _.strIs( src2 ) || _.regexpIs( src2 ) || _.longIs( src2 ), 'Expects string/regexp or array of strings/regexps {-src2-}' );
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   let isLong1 = _.longIs( src1 );
//   let isLong2 = _.longIs( src2 );
//
//   if( isLong1 && isLong2 )
//   {
//     let result = [];
//     _.assert( src1.length === src2.length );
//     for( let i = 0, len = src1.length ; i < len; i++ )
//     {
//       result[ i ] = _.str.equivalent( src1[ i ], src2[ i ] );
//     }
//     return result;
//   }
//   else if( !isLong1 && isLong2 )
//   {
//     let result = [];
//     for( let i = 0, len = src2.length ; i < len; i++ )
//     {
//       result[ i ] = _.str.equivalent( src1, src2[ i ] );
//     }
//     return result;
//   }
//   else if( isLong1 && !isLong2 )
//   {
//     let result = [];
//     for( let i = 0, len = src1.length ; i < len; i++ )
//     {
//       result[ i ] = _.str.equivalent( src1[ i ], src2 );
//     }
//     return result;
//   }
//   else
//   {
//     return _.str.equivalent( src1, src2 );
//   }
//
// }

// --
// implementation
// --

let ToolsExtension =
{

  // strsEquivalent, /* xxx : review */

}

Object.assign( _, ToolsExtension );

//

let EntityExtension =
{

  // strParseType, /* xxx : move */
  // _strParseType,

}

Object.assign( _.entity, EntityExtension );

//

let StrExtension =
{

  // exporter

  _exportStringDiagnosticShallow,
  exportStringDiagnosticShallow,
  _exportStringCodeShallow,
  exportStringCodeShallow,
  exportString : exportStringDiagnosticShallow,

  // equaler

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,
  _equivalentShallow,
  equivalentShallow,
  equivalent : equivalentShallow,

}

Object.assign( _.str, StrExtension );

//

})();
