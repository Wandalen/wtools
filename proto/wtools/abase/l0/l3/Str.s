( function _l3_Str_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// str
// --

function strParseType( src )
{
  /*
    - 'string'
    - '5'
    - '5n'
    - 'null'
    - 'undefined'
    - 'Escape( 1 )'
    - '{- Symbol undefined -}'
    - '{- routine name -}'
    - '{- routine.anonymous -}'
    - '{- Map -}'
    - '{- Map name -}'
    - '{- Map with 9 elements -}'
    - '{- Map.polluted with 9 elements -}'
    - '{- Map name with 9 elements -}'
  */

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ), 'Expects string' );

  if( !( /^{- .+ -}$/g.test( src ) ) )
  return Object.create( null );

  src = src.slice( 3, -3 );

  return _.entity._strParseType( src );

}

//

function _strParseType( src )
{
  /*

  {- with with 2 elements -} 4
  {- with name with 2 elements -} 5
  {- with.with with with 2 elements -} 5

  */
  _.assert( _.strIs( src ), 'Expects string' );

  let o =
  {
    type : '',
    traits : [],
  }

  let splitted = src.split( ' ' );
  let type = splitted[ 0 ];
  let length;

  if( splitted.length === 2 ) /* with name & no length */
  {
    o.name = splitted[ 1 ];
  }
  else if( splitted.length === 4 ) /* without name & with length */
  {
    length = +splitted[ 2 ];
  }
  else if( splitted.length === 5 ) /* with name & with length */
  {
    o.name = splitted[ 1 ];
    length = +splitted[ 3 ];
  }

  length = isNaN( length ) ? null : length;

  if( type.indexOf( '.' ) === -1 )
  {
    o.type = type;
  }
  else
  {
    let [ t, ... traits ] = type.split( '.' );
    o.type = t;
    o.traits = traits;
  }

  if( length !== null )
  o.length = length;

  return o;

}


//

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

function _equivalentShallow( src1, src2 )
{
  let strIs1 = _.strIs( src1 );
  let strIs2 = _.strIs( src2 );

  // _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  //
  // if( !strIs1 && strIs2 )
  // return this._equivalentShallow( src2, src1 );

  // _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );
  // _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );

  if( strIs1 && strIs2 )
  {
    /* qqq : for Yevhen : bad | aaa : Fixed. */
    if( src1 === src2 )
    return true;
    return _.strLinesStrip( src1 ) === _.strLinesStrip( src2 );
  }
  else
  {
    return false;
    // return _.regexpIdentical( src1, src2 );
  }

  return false;
}

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
//     /* qqq : for Yevhen : bad | aaa : Fixed. */
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

function equivalentShallow( src1, src2, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  if( !_.str.is( src1 ) )
  return false;
  if( !_.str.is( src2 ) )
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

let ExtensionEntity =
{

  strParseType, /* xxx : move */
  _strParseType,

}

Object.assign( _.entity, ExtensionEntity );

//

let StrExtension =
{

  // equaler

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,
  _equivalentShallow,
  equivalentShallow,
  equivalent : equivalentShallow,

  // xxx : qqq : implement
  // exporter

  // exportString : exportStringShallowDiagnostic,
  // exportStringShallow : exportStringShallowDiagnostic,
  // exportStringShallowDiagnostic,
  // exportStringShallowCode : exportStringShallowDiagnostic,
  // exportStringDiagnostic : exportStringShallowDiagnostic,
  // exportStringCode : exportStringShallowDiagnostic,

}

Object.assign( _.str, StrExtension );

//

})();
