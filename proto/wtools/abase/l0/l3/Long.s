( function _l3_Long_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.long = _.long || Object.create( null );

_.assert( !!_.array._elementWithKey, 'Expects routine array._elementWithKey' );

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

  /* xxx : evolve? */
  appender, /* qqq : cover. take into account all types. don't forget about set, arguments array, ContainerAdapterSet, ContainerAdapterLong */
  prepender, /* qqq : cover. take into account all types. don't forget about set, arguments array, ContainerAdapterSet, ContainerAdapterLong */
  eacher, /* qqq : cover. take into account all types. don't forget about set, arguments array, ContainerAdapterSet, ContainerAdapterLong */

  // equaler

  _identicalShallow : _.array._identicalShallow,
  identicalShallow : _.array.identicalShallow,
  identical : _.array.identical,
  _equivalentShallow : _.array._equivalentShallow,
  equivalentShallow : _.array.equivalentShallow,
  equivalent : _.array.equivalent,

  // exporter

  exportString : _.array.exportString,
  exportStringShallow : _.array.exportStringShallow,
  exportStringShallowDiagnostic : _.array.exportStringShallowDiagnostic,
  exportStringShallowCode : _.array.exportStringShallowCode,
  exportStringDiagnostic : _.array.exportStringDiagnostic,
  exportStringCode : _.array.exportStringCode,

  // container interface

  _lengthOf : _.array._lengthOf,
  lengthOf : _.array.lengthOf, /* qqq : cover */

  _hasKey : _.array._hasKey,
  hasKey : _.array._hasKey, /* qqq : cover */
  _hasCardinal : _.array._hasKey,
  hasCardinal : _.array._hasKey, /* qqq : cover */
  _keyWithCardinal : _.array._hasKey,
  keyWithCardinal : _.array._hasKey, /* qqq : cover */

  _elementGet : _.array._elementWithKey,
  elementGet : _.array.elementWithKey, /* qqq : cover */
  _elementWithKey : _.array._elementWithKey,
  elementWithKey : _.array.elementWithKey, /* qqq : cover */
  _elementWithImplicit : _.array._elementWithImplicit,
  elementWithImplicit : _.array.elementWithImplicit,  /* qqq : cover */
  _elementWithCardinal : _.array._elementWithCardinal,
  elementWithCardinal : _.array.elementWithCardinal,  /* qqq : cover */

  _elementSet : _.array._elementSet,
  elementSet : _.array.elementSet, /* qqq : cover */
  _elementWithKeySet : _.array._elementWithKeySet,
  elementWithKeySet : _.array.elementWithKeySet, /* qqq : cover */
  _elementWithCardinalSet : _.array._elementWithCardinalSet,
  elementWithCardinalSet : _.array.elementWithCardinalSet,  /* qqq : cover */

  _elementDel : _.itself._elementDel,
  elementDel : _.itself.elementDel, /* qqq : cover */
  _elementWithKeyDel : _.itself._elementWithKeyDel,
  elementWithKeyDel : _.itself.elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel : _.itself._elementWithCardinalDel,
  elementWithCardinalDel : _.itself.elementWithCardinalDel,  /* qqq : cover */
  _empty : _.itself._empty,
  empty : _.itself.empty,  /* qqq : cover */

  _each : _.array._each,
  each : _.array.each, /* qqq : cover */
  _eachLeft : _.array._eachLeft,
  eachLeft : _.array.eachLeft, /* qqq : cover */
  _eachRight : _.array._eachRight,
  eachRight : _.array.eachRight, /* qqq : cover */

  _while : _.array._while,
  while : _.array.while, /* qqq : cover */
  _whileLeft : _.array._whileLeft,
  whileLeft : _.array.whileLeft, /* qqq : cover */
  _whileRight : _.array._whileRight,
  whileRight : _.array.whileRight, /* qqq : cover */

  _aptLeft : _.array._aptLeft,
  aptLeft : _.array.aptLeft, /* qqq : cover */
  first : _.array.first,
  _aptRight : _.array._aptRight, /* qqq : cover */
  aptRight : _.array.aptRight,
  last : _.array.last, /* qqq : cover */

}

//

Object.assign( _.long, LongExtension );

})();
