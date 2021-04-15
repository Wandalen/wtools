( function _l3_Str_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;

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

// function regexpLike( src )
// {
//   if( _.strIs( src ) )
//   return true;
//   if( _.regexpIs( src ) )
//   return true;
//   return false
// }
//
// //
//
// function strsLikeAll( src )
// {
//   _.assert( arguments.length === 1 );
//
//   if( _.arrayLike( src ) )
//   {
//     for( let s = 0 ; s < src.length ; s++ )
//     if( !_.regexpLike( src[ s ] ) )
//     return false;
//     return true;
//   }
//
//   return regexpLike( src );
// }

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
  _.assert( _.strIs( src ), () => `Expects string, got ${_.entity.strType( src )}` );
  _.assert( _.regexpLike( ins ), () => `Expects string-like, got ${_.entity.strType( ins )}` );

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

  _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );
  _.assert( _.regexpLike( src1 ), 'Expects string-like ( string or regexp )' );

  if( strIs1 && strIs2 )
  {
    /* qqq : for Yevhen : bad | aaa : Fixed. */
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

function exportStringShallowDiagnostic( src, o )
{
  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects 1 or 2 arguments' );

  let result = '';

  if( _.primitive.is( src ) )
  {
    result = _.primitive.exportStringShallowDiagnostic( src );
  }
  else if( _.date.is( src ) )
  {
    result = _.date.exportStringShallowDiagnostic( src );
  }
  else if( _.regexpIs( src ) )
  {
    result = _.regexp.exportStringShallowDiagnostic( src );
  }
  else if( _.set.like( src ) )
  {
    result = _.set.exportStringShallowDiagnostic( src );
  }
  else if( _.hashMap.like( src ) )
  {
    result = _.hashMap.exportStringShallowDiagnostic( src );
  }
  else if( _.vector.like( src ) )
  {
    result = _.vector.exportStringShallowDiagnostic( src );
  }
  else if( _.routine.is( src ) )
  {
    result = _.routine.exportStringShallowDiagnostic( src );
  }
  else if( _.aux.like( src ) )
  {
    result = _.aux.exportStringShallowDiagnostic( src );
  }
  else if( _.object.like( src ) )
  {
    result = _.object.exportStringShallowDiagnostic( src );
  }
  else
  {
    result = String( src );
    result = _.strShort( result );
  }

  return result;
}

//

/**
 * Returns source string( src ) with limited number( limit ) of characters.
 * For example: src : 'string', limit : 4, result -> 'stng'.
 * Function can be called in two ways:
 * - First to pass only source string and limit;
 * - Second to pass all options map. Example: ({ src : 'string', limit : 5, prefix : '<', infix : '.', postfix : '>' }).
 *
 * @param {string|object} o - String to parse or object with options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {number} [ o.limit=40 ] - Limit of characters in output.
 * @param {string} [ o.prefix=null ] - The leftmost part to be added to the returned string.
 * @param {string} [ o.postfix=null ] - The rightmost part to be added to the returned string.
 * @param {string} [ o.infix=null ] - The middle part to fill the reduced characters, if boolLikeTrue - the default ( '...' ) is used.
 * @param {function} [ o.onLength=null ] - callback function that calculates a length based on .
 * @returns {string} Returns simplified source string.
 *
 * @example
 * _.strShort( 'string', 4 );
 * // returns 'stng'
 *
 * @example
 * _.strShort( 'a\nb', 3 );
 * // returns 'a\nb'
 *
 * @example
 * _.strShort( 'string', 0 );
 * // returns ''
 *
 * @example
 * _.strShort({ src : 'string', limit : 4 });g
 * // returns 'stng'
 *
 * @example
 *  _.strShort({ src : 'simple', limit : 4, prefix : '<' });
 * // returns '<ile'
 *
 * @example
 *  _.strShort({ src : 'string', limit : 5, infix : '.' });
 * // returns 'st.ng'
 *
 * @example
 *  _.strShort({ src : 'string', limit : 5, prefix : '<', postfix : '>', infix : '.' });
 * // returns '<s.g>'
 *
 * @example
 *  _.strShort({ src : 'string', limit : 3, cutting : 'right' });
 * // returns 'str'
 *
 * @method strShort
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } If( o ) is extended with unknown property.
 * @throws { Exception } If( o.src ) is not a String.
 * @throws { Exception } If( o.limit ) is not a Number.
 * @throws { Exception } If( o.prefix ) is not a String or null.
 * @throws { Exception } If( o.infix ) is not a String or null or boolLikeTrue.
 * @throws { Exception } If( o.postfix ) is not a String or null.
 *
 * @namespace Tools
 *
 */

function strShort( o )  /* version with binary search cutting */
{

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], widthLimit : arguments[ 1 ] };
  else if( arguments.length === 1 )
  if( _.strIs( o ) )
  o = { src : arguments[ 0 ] };

  _.routine.options( strShort, o );

  _.assert( _.strIs( o.src ) );
  _.assert( _.number.is( o.widthLimit ) );
  _.assert( o.widthLimit >= 0, 'Option::o.widthLimit must be greater or equal to zero' );
  _.assert( o.prefix === null || _.strIs( o.prefix ) );
  _.assert( o.postfix === null || _.strIs( o.postfix ) );
  _.assert( o.infix === null || _.strIs( o.infix ) || _.bool.likeTrue( o.infix ));
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( !o.infix )
  o.infix = '';
  if( !o.prefix )
  o.prefix = '';
  if( !o.postfix )
  o.postfix = '';
  if( o.widthLimit === 0 )
  o.widthLimit = Infinity;
  if( o.src.length < 1 )
  {
    if( o.prefix.length + o.postfix.length <= o.widthLimit )
    return o.prefix + o.postfix
    o.src = o.prefix + o.postfix;
    o.prefix = '';
    o.postfix = '';
  }
  if( _.bool.likeTrue( o.infix ) )
  o.infix = '...';

  if( !o.onLength )
  o.onLength = ( src ) => src.length;

  if( o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix ) === o.widthLimit )
  return o.prefix + o.infix + o.postfix;

  if( o.prefix.length + o.postfix.length + o.infix.length > o.widthLimit )
  {
    o.src = o.prefix + o.infix + o.postfix;
    o.prefix = '';
    o.postfix = '';
    o.infix = '';
  }

  let src = o.src;
  let fixLength = 0;
  fixLength += o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix );

  if( o.onLength( src ) + fixLength <= o.widthLimit ) /* nothing to cut */
  return o.prefix + src + o.postfix;

  let begin = '';
  let end = '';
  let startIndex = 0;
  let endIndex = src.length - 1;
  let beginLength = o.onLength( src );
  let endLength = beginLength;
  let middleIndex = Math.floor( ( startIndex + endIndex ) / 2 );

  if( o.cutting === 'left' )
  {
    let end = cutLeft();
    return o.prefix + o.infix + end + o.postfix;
  }
  else if( o.cutting === 'right' )
  {
    let begin = cutRight();
    return o.prefix + begin + o.infix + o.postfix;
  }
  else
  {
    let [ begin, end ] = cutMiddle();
    return o.prefix + begin + o.infix + end + o.postfix;
  }

  /* - */

  function cutLeft()
  {
    while( endLength + fixLength > o.widthLimit ) /* binary */
    {
      [ begin, end ] = splitInTwo();
      endLength = o.onLength( end );

      startIndex = middleIndex; /* all needed elements are in end */
      middleIndex = Math.floor( ( startIndex + endIndex ) / 2 );
    }

    while( o.onLength( end ) + fixLength <= o.widthLimit ) /* add elements till o.widthLimit is satisfied */
    {
      /*
        add elements and parts of element that might have been sliced,
        example : onLength considers as 1 element substring of the same characters
                  'aabbccdd' with o.widthLimit = 2 might return 'cdd', but need 'ccdd'
      */
      end = begin[ begin.length - 1 ] + end;
      begin = begin.slice( 0, -1 );
    }

    return end.slice( 1 );
  }

  function cutRight()
  {
    while( beginLength + fixLength > o.widthLimit ) /* binary */
    {
      [ begin, end ] = splitInTwo();
      beginLength = o.onLength( begin );

      endIndex = middleIndex; /* all needed elements are in begin */
      middleIndex = Math.floor( ( startIndex + endIndex ) / 2 );
    }

    while( o.onLength( begin ) + fixLength <= o.widthLimit ) /* add elements till o.widthLimit is satisfied */
    {
      /*
        add elements and parts of element that might have been sliced,
        example : onLength considers as 1 element substring of the same characters
                  'aabbccdd' with o.widthLimit = 2 might return 'aab', but need 'aabb'
      */
      begin += end[ 0 ];
      end = end.slice( 1 );
    }

    return begin.slice( 0, -1 );
  }

  function cutMiddle()
  {
    let originalStr = src;

    while( o.onLength( src ) + fixLength > o.widthLimit ) /* binary */
    {
      let chunkSize = Math.floor( src.length / 3 ); /* split str into 3 'equal' parts, middle is to be removed */

      let middleIndexLeft = chunkSize;
      let middleIndexRight = chunkSize * 2;

      if( middleIndexLeft <= 1 ) /* src.length <= 5, indexes overlap, cut 1 element from bigger part or right if equal */
      {
        if( o.onLength( begin ) > o.onLength( end ) )
        begin = begin.slice( 0, -1 );
        else
        end = end.slice( 1 );
      }
      else /* begin : first 1/3, end : last 1/3 */
      {
        begin = src.slice( 0, middleIndexLeft + 1 );
        end = src.slice( middleIndexRight );
      }

      /* delete middle, might delete part of the element, check later when desired length is obtained */
      src = begin + end;
    }

    while( o.onLength( begin + end ) + fixLength < o.widthLimit ) /* overcut */
    {
      if( o.onLength( begin ) > o.onLength( end ) ) /* shrink middle from the right */
      {
        end = originalStr.slice( -end.length - 1 );
      }
      else                                          /* shrink middle from the left */
      {
        begin = originalStr.slice( 0, begin.length + 1 );
      }
    }

    /*
      add parts of elements that might have been sliced,
      example : onLength considers as 1 element substring of the same characters
                'aabbccdd' with o.widthLimit = 2 might return 'ad', but need 'aadd'
    */

    let beginInitial = o.onLength( begin );
    let endInitial = o.onLength( end );

    while( o.onLength( begin ) === beginInitial ) /* try to increase begin */
    {
      begin = originalStr.slice( 0, begin.length + 1 );;
    }

    while( o.onLength( end ) === endInitial ) /* try to increase end */
    {
      end = originalStr.slice( -end.length - 1 );
    }

    return [ begin.slice( 0, -1 ), end.slice( 1 ) ];
  }

  function splitInTwo()
  {
    let begin = src.slice( 0, middleIndex );
    let end = src.slice( middleIndex );
    return [ begin, end ];
  }

}

strShort.defaults =
{
  src : null,
  widthLimit : 40,
  heightLimit : 0,
  prefix : null,
  postfix : null,
  infix : null,
  onLength : null,
  cutting : 'center',
}

// function strShort( o )
// {

//   if( arguments.length === 2 )
//   o = { src : arguments[ 0 ], widthLimit : arguments[ 1 ] };
//   else if( arguments.length === 1 )
//   if( _.strIs( o ) )
//   o = { src : arguments[ 0 ] };

//   _.routine.options( strShort, o );

//   _.assert( _.strIs( o.src ) );
//   _.assert( _.number.is( o.widthLimit ) );
//   _.assert( o.widthLimit >= 0, 'Option::o.widthLimit must be greater or equal to zero' );
//   _.assert( o.prefix === null || _.strIs( o.prefix ) );
//   _.assert( o.postfix === null || _.strIs( o.postfix ) );
//   _.assert( o.infix === null || _.strIs( o.infix ) || _.bool.likeTrue( o.infix ));
//   _.assert( arguments.length === 1 || arguments.length === 2 );

//   if( !o.infix )
//   o.infix = '';
//   if( !o.prefix )
//   o.prefix = '';
//   if( !o.postfix )
//   o.postfix = '';
//   if( o.src.length < 1 )
//   {
//     if( o.prefix.length + o.postfix.length <= o.widthLimit )
//     return o.prefix + o.postfix
//     o.src = o.prefix + o.postfix;
//     o.prefix = '';
//     o.postfix = '';
//   }
//   if( _.bool.likeTrue( o.infix ) )
//   o.infix = '...';

//   if( !o.onLength )
//   o.onLength = ( src ) => src.length;

//   if( o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix ) === o.widthLimit )
//   return o.prefix + o.infix + o.postfix;

//   if( o.prefix.length + o.postfix.length + o.infix.length > o.widthLimit )
//   {
//     o.src = o.prefix + o.infix + o.postfix;
//     o.prefix = '';
//     o.postfix = '';
//     o.infix = '';
//   }

//   let src = o.src;
//   let fixLength = 0;
//   fixLength += o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix );

//   if( o.cutting === 'left' )
//   {
//     while( o.onLength( src ) + fixLength > o.widthLimit ) /* qqq : find better solution, but first write/find the test expaining why it is needed */
//     {
//       src = src.slice( 1 );
//     }
//     return o.prefix + o.infix + src + o.postfix;
//   }
//   else if( o.cutting === 'right' )
//   {
//     while( o.onLength( src ) + fixLength > o.widthLimit )
//     {
//       src = src.slice( 0, src.length - 1 );
//     }
//     return o.prefix + src + o.infix + o.postfix;
//   }
//   else
//   {
//     if( o.onLength( src ) + fixLength <= o.widthLimit )
//     return o.prefix + src + o.postfix;
//     let begin = '';
//     let end = '';
//     while( o.onLength( src ) + fixLength > o.widthLimit )
//     {
//       begin = src.slice( 0, Math.floor( src.length / 2 ) );
//       end = src.slice( Math.floor( src.length / 2 ) + 1 );
//       src = begin + end;
//     }
//     return o.prefix + begin + o.infix + end + o.postfix;
//   }

// }

// strShort.defaults =
// {
//   src : null,
//   widthLimit : 40,
//   heightLimit : 0,
//   prefix : null,
//   postfix : null,
//   infix : null,
//   onLength : null, /* xxx : investigate */
//   cutting : 'center',
// }

//

// function strShort2( o ) /* version with fixed cutting : center, 1 element cannot be splitted. */
// {

//   if( arguments.length === 2 )
//   o = { src : arguments[ 0 ], widthLimit : arguments[ 1 ] };
//   else if( arguments.length === 1 )
//   if( _.strIs( o ) )
//   o = { src : arguments[ 0 ] };

//   _.routine.options( strShort2, o );

//   _.assert( _.strIs( o.src ) );
//   _.assert( _.number.is( o.widthLimit ) );
//   _.assert( o.widthLimit >= 0, 'Option::o.widthLimit must be greater or equal to zero' );
//   _.assert( o.prefix === null || _.strIs( o.prefix ) );
//   _.assert( o.postfix === null || _.strIs( o.postfix ) );
//   _.assert( o.infix === null || _.strIs( o.infix ) || _.bool.likeTrue( o.infix ));
//   _.assert( arguments.length === 1 || arguments.length === 2 );

//   if( !o.infix )
//   o.infix = '';
//   if( !o.prefix )
//   o.prefix = '';
//   if( !o.postfix )
//   o.postfix = '';
//   if( o.widthLimit === 0 )
//   o.widthLimit = Infinity;
//   if( o.src.length < 1 )
//   {
//     if( o.prefix.length + o.postfix.length <= o.widthLimit )
//     return o.prefix + o.postfix
//     o.src = o.prefix + o.postfix;
//     o.prefix = '';
//     o.postfix = '';
//   }
//   if( _.bool.likeTrue( o.infix ) )
//   o.infix = '...';

//   if( !o.onLength )
//   o.onLength = ( src ) => src.length;

//   if( o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix ) === o.widthLimit )
//   return o.prefix + o.infix + o.postfix;

//   if( o.prefix.length + o.postfix.length + o.infix.length > o.widthLimit )
//   {
//     o.src = o.prefix + o.infix + o.postfix;
//     o.prefix = '';
//     o.postfix = '';
//     o.infix = '';
//   }

//   let src = o.src;
//   let fixLength = 0;
//   fixLength += o.onLength( o.prefix ) + o.onLength( o.postfix ) + o.onLength( o.infix );

//   if( o.cutting === 'left' )
//   {
//     while( o.onLength( src ) + fixLength > o.widthLimit ) /* qqq : find better solution, but first write/find the test expaining why it is needed */
//     {
//       src = src.slice( 1 );
//     }
//     return o.prefix + o.infix + src + o.postfix;
//   }
//   else if( o.cutting === 'right' )
//   {
//     while( o.onLength( src ) + fixLength > o.widthLimit )
//     {
//       src = src.slice( 0, src.length - 1 );
//     }
//     return o.prefix + src + o.infix + o.postfix;
//   }
//   else
//   {
//     if( o.onLength( src ) + fixLength <= o.widthLimit )
//     return o.prefix + src + o.postfix;

//     let begin = '';
//     let end = '';

//     while( o.onLength( src ) + fixLength > o.widthLimit )
//     {

//       /* find a place between elements, not within element */
//       let center = Math.floor( src.length / 2 );
//       begin = src.slice( 0, center );
//       end = src.slice( center );

//       while( o.onLength( begin ) + o.onLength( end ) > o.onLength( src ) ) /* place is not between two elements, but within one element */
//       {
//         center = o.onLength( begin ) > o.onLength( end ) ? center - 1 : center + 1; /* move towards longer substring */
//         begin = src.slice( 0, center );
//         end = src.slice( center );
//       }

//       let beginLength = o.onLength( begin );
//       let endLength = o.onLength( end );
//       /* center is between elements, slice from bigger part until 1 complete element is removed */
//       if( o.onLength( begin ) > o.onLength( end ) )
//       while( o.onLength( begin ) >= beginLength )
//         begin = begin.slice( 0, -1 );
//       else
//       while( o.onLength( end ) >= endLength )
//         end = end.slice( 1 );

//       src = begin + end;
//     }
//     return o.prefix + begin + o.infix + end + o.postfix;
//   }
// }

// strShort2.defaults =
// {
//   src : null,
//   widthLimit : 40,
//   heightLimit : 0,
//   prefix : null,
//   postfix : null,
//   infix : null,
//   onLength : null, /* xxx : investigate */
//   cutting : 'center',
// }

//

function strPrimitive( src )
{
  let result = '';

  _.assert( arguments.length === 1, 'Expects exactly one argument' );

  if( src === null || src === undefined )
  return;

  if( _.primitive.is( src ) )
  return String( src );

  return;
}

//

/**
 * Return primitive type of src.
 *
 * @example
 * let str = _.entity.strTypeSecondary( 'testing' );
 *
 * @param {*} src
 *
 * @return {string}
 * string name of type src
 * @function strTypeSecondary
 * @namespace Tools
 */

function strTypeSecondary( src )
{

  let name = Object.prototype.toString.call( src );
  let result = /\[(\w+) (\w+)\]/.exec( name );
  _.assert( !!result, 'unknown type', name );
  return result[ 2 ];
}

//

/**
 * Return type of src.
 *
 * @example
 * let str = _.entity.strType( 'testing' );
 *
 * @param {*} src
 *
 * @return {string}
 * string name of type src
 * @function strType
 * @namespace Tools
 */

/* qqq for Yevhen : jsdoc */
/* xxx : optimize later */
/* xxx : move to namesapce type? */
function strTypeWithTraits( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.aux.is( src ) )
  {

    if( _.mapIsPure( src ) )
    return 'Map.pure';
    else if( _.mapIsPolluted( src ) )
    return 'Map.polluted';
    else if( _.aux.isPure( src ) && _.aux.isPrototyped( src ) )
    return 'Aux.pure.prototyped';
    else if( _.aux.isPolluted( src ) && _.aux.isPrototyped( src ) )
    return 'Aux.polluted.prototyped';
    else _.assert( 0, 'undexpected' );

  }

  if( _.primitive.is( src ) )
  return end( _.entity.strTypeSecondary( src ) );

  let proto = Object.getPrototypeOf( src );
  if( proto && proto.constructor && proto.constructor !== Object && proto.constructor.name )
  return end( proto.constructor.name );

  return end( _.entity.strTypeSecondary( src ) );

  function end( result )
  {
    let translated = _.entity.TranslatedTypeMap[ result ];
    if( translated )
    result = translated;

    if( !_.entity.StandardTypeSet.has( result ) )
    {
      if( _.countableIs( src ) )
      result += '.countable';
      if( _.constructibleIs( src ) )
      result += '.constructible';
    }

    return result;
  }

}

//

/* qqq for Yevhen : jsdoc */
function strTypeWithoutTraits( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.aux.is( src ) )
  {

    if( _.mapIs( src ) )
    return 'Map';
    else
    return 'Aux';

  }

  if( _.primitive.is( src ) )
  return end( _.entity.strTypeSecondary( src ) );

  let proto = Object.getPrototypeOf( src );
  if( proto && proto.constructor && proto.constructor !== Object && proto.constructor.name )
  return end( proto.constructor.name );

  return end( _.entity.strTypeSecondary( src ) );

  function end( result )
  {
    let translated = _.entity.TranslatedTypeMap[ result ];
    if( translated )
    result = translated;
    return result;
  }

}

//

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

/**
 * The routine strConcat() provides the concatenation of array of elements ( or single element )
 * into a String. Returned string can be formatted by using options in options map {-o-}.
 *
 * @example
 * _.strConcat( 'str' );
 * // returns : 'str'
 *
 * @example
 * _.strConcat( 11 );
 * // returns : '11'
 *
 * @example
 * _.strConcat([ 1, 2, 'str', [ 3, 4 ] ]);
 * // returns : '1 2 str 3,4 '
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 1, 2, 'str', [ 3, 4 ] ], options );
 * // returns : '** 1 2 str 3,4 **'
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 'a\n', 'b\n', 'c' ], options );
 * // returns :
 * // `** a **
 * // ** b **
 * // ** c **
 *
 * @example
 * let onToStr = ( src ) => String( src ) + '*';
 * let options = { onToStr };
 * _.strConcat( [ 'a', 'b', 'c' ], options );
 * // returns : 'a* b* c*'
 *
 * @example
 * let onPairWithDelimeter = ( src1, src2 ) => src1 + ' ..' + src2;
 * let options = { onPairWithDelimeter };
 * _.strConcat( [ 'a\n', 'b\n', 'c' ], options );
 * // returns :
 * // `a ..
 * // b ..
 * // c`
 *
 * @param { ArrayLike|* } srcs - ArrayLike container with elements or single element to make string.
 * If {-srcs-} is not ArrayLike, routine converts to string provided instance.
 * @param { Map } o - Options map.
 * @param { String } o.lineDelimter - The line delimeter. Default value is new line symbol '\n'.
 * If an element of array has not delimeter at the end or next element has not delimeter at the begin,
 * then routine inserts one space between this elements.
 * @param { String } o.linePrefix - The prefix, which is added to each line. Default value is empty string.
 * @param { String } o.linePostfix - The postfix, which is added to each line. Default value is empty string.
 * @param { Map } o.optionsForToStr - The options for routine _.entity.exportString that uses as default callback {-o.onToStr-}. Default value is null.
 * @param { Function } o.onToStr - The callback, which uses for conversion of each element of {-srcs-}. Accepts element {-src-} and options map {-o-}.
 * @param { Function } o.onPairWithDelimeter - The callback, which uses for concatenation of two strings.
 * The callback calls if first string {-src1-} end with line delimeter {-o.lineDelimter-} or second string {-src2-}
 * begins with line delimeter. Additionally accepts options map {-o-}.
 * @returns { String } - Returns concatenated string.
 * @function strConcat
 * @throws { Error } If arguments.length is less then one or greater than two.
 * @throws { Error } If options map {-o-} has unknown property.
 * @throws { Error } If property {-o.optionsForToStr-} is not a Aux.
 * @throws { Error } If routine strConcat does not belong module Tools.
 * @namespace Tools
 */

function strConcat( srcs, o )
{

  o = _.routine.options( strConcat, o || Object.create( null ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.strConcat === strConcat );

  if( o.onToStr === null )
  o.onToStr = onToStr;

  let defaultOptionsForToStr =
  {
    stringWrapper : '',
  };

  o.optionsForToStr = _.mapSupplement( o.optionsForToStr, defaultOptionsForToStr, strConcat.defaults.optionsForToStr );

  if( _.routine.is( srcs ) )
  srcs = srcs();

  if( !_.arrayLike( srcs ) )
  srcs = [ srcs ];

  let result = '';
  if( !srcs.length )
  return result;

  let concatenatePairWithLineDelimeter = o.onPairWithDelimeter ? o.onPairWithDelimeter : concatenateSimple;

  /* */

  let a = 0;

  while( !result && a < srcs.length )
  {
    result = o.onToStr( srcs[ a ], o );
    ++a;
  }

  for( ; a < srcs.length ; a++ )
  {
    let src = srcs[ a ];
    src = o.onToStr( src, o );

    result = result.replace( /[^\S\n]\s*$/, '' );

    if( _.strEnds( result, o.lineDelimter ) || _.strBegins( src, o.lineDelimter ) )
    result = concatenatePairWithLineDelimeter( result, src, o );
    else
    result = `${result} ${src.replace( /^\s+/, '' )}`;
  }

  /* */

  if( o.linePrefix || o.linePostfix )
  {
    result = result.split( o.lineDelimter );
    result = o.linePrefix + result.join( o.linePostfix + o.lineDelimter + o.linePrefix ) + o.linePostfix;
  }

  /* */

  return result;

  /* */

  function onToStr( src, op )
  {
    return _.entity.exportString( src, op.optionsForToStr );
  }

  /* */

  function concatenateSimple( src1, src2 )
  {
    return src1 + src2;
  }
}

strConcat.defaults =
{
  linePrefix : '',
  linePostfix : '',
  lineDelimter : '\n',
  optionsForToStr : null,
  onToStr : null,
  onPairWithDelimeter : null,
}

//

function _strBeginOf( src, begin )
{

  // _.assert( _.strIs( src ), 'Expects string' );
  // _.assert( arguments.length === 2, 'Expects exactly two arguments' );

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

  return undefined; /* qqq : should return undefined */
}

//

function _strEndOf( src, end )
{

  // _.assert( _.strIs( src ), 'Expects string' );
  // _.assert( arguments.length === 2, 'Expects exactly two arguments' );

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

    //if( matched && matched.index === 0 )
    if( matched && matched.index + matched[ 0 ].length === src.length )
    return matched[ 0 ];
  }
  else _.assert( 0, 'Expects string-like ( string or regexp )' );

  return undefined; /* qqq : should return undefined */
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
    return !( result === undefined );
    // return result === undefined ? false : true;
  }

  for( let b = 0, blen = begin.length ; b < blen; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== undefined )
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

  _.assert( _.strIs( src ), () => `Expects argument::src of type::string, but got ${_.entity.strType( src )}` );
  _.assert( _.strIs( end ) || _.regexpIs( end ) || _.longIs( end ), 'Expects string/regexp or array of strings/regexps {-end-}' );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !_.longIs( end ) )
  {
    let result = _._strEndOf( src, end );
    return !( result === undefined );
  }

  for( let b = 0, blen = end.length ; b < blen; b++ )
  {
    let result = _._strEndOf( src, end[ b ] );
    if( result !== undefined )
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

  for( let b = 0, blen = begin.length ; b < blen ; b++ )
  {
    let result = _._strBeginOf( src, begin[ b ] );
    if( result !== undefined )
    return result;
  }

  return undefined;
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
    if( result !== undefined )
    return result;
  }

  return undefined;
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
  _.assert( _.strIs( begin ) || _.regexpIs( begin ), 'Expects string/regexp {-begin-}' );

  let result = src;
  let beginOf = _._strBeginOf( result, begin );
  if( beginOf !== undefined )
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
  if( endOf !== undefined )
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

  result = result.replace( insStr, '' );

  return result;
}

//

function strLine( src, index )
{
  _.assert( _.strIs( src ), 'Expects string as first argument' );
  _.assert( _.numberIs( index ), 'Expects number as second argument' );

  let srcArray = src.split( '\n' );

  if( index >= srcArray.length )
  return '';

  return srcArray[ index ];
}

// --
// routines
// --

let TranslatedTypeMap =
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
  'Function' : 'Routine',
  'Arguments' : 'ArgumentsArray',

}

let StandardTypeSet = new Set
([

  'U64x',
  'U32x',
  'U16x',
  'U8x',
  'U8ClampedX',
  'I64x',
  'I32x',
  'I16x',
  'I8x',
  'F64x',
  'F32x',

  'BufferNode',
  'BufferRaw',
  'BufferRawShared',
  'HashMap',
  'HashMapWeak',

  'ArgumentsArray',
  'Array',
  'Set',
  'Routine',
  'Global',

]);

let ExtensionEntity =
{

  // export string

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,

  strPrimitive,
  strTypeSecondary,
  strType : strTypeWithTraits,
  strTypeWithTraits,
  strTypeWithoutTraits,
  strParseType,
  _strParseType,

  // fields

  TranslatedTypeMap,
  StandardTypeSet,

}

let ExtensionTools =
{

  // checker

  strIs,
  strsAreAll,
  // regexpLike,
  // strsLikeAll,
  strDefined,
  strsDefined,

  strType : strTypeWithTraits,
  strHas,

  strEquivalent, /* qqq : for Yevhen : bad */
  areEquivalentShallow : strEquivalent,
  strsEquivalent,

  // converter

  strStrShort : strShort, /* xxx : remove */
  strShort, /* qqq for Yevhen : cover | aaa : Done. */
  // strShort2, /* non-binary search implementation */
  strConcat,

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

  strLine,

  // fields

  // TranslatedTypeMap,
  // StandardTypeSet,

}

//

Object.assign( _.entity, ExtensionEntity );
Object.assign( _, ExtensionTools );

})();
