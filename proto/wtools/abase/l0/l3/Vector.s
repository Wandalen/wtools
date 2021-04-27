( function _l3_Vector_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.assert( !!_.countable._elementWithKey, 'Expects routine countable._elementWithKey' );

// --
// dichotomy
// --

function adapterIs( src )
{
  return Object.prototype.toString.call( src ) === '[object VectorAdapter]';
}

//

function constructorIsVectorAdapter( src )
{
  if( !src )
  return false;
  return '_vectorBuffer' in src.prototype;
}

// --
// exporter
// --

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.vector.is( src ) );

  if( _.unrollIs( src ) )
  return `{- ${_.entity.strType( src )}.unroll with ${src.length} elements -}`;
  else
  return `{- ${_.entity.strType( src )} with ${src.length} elements -}`;

}

// --
// extension
// --

var ToolsExtension =
{
  vectorAdapterIs : adapterIs,
  vadIs : adapterIs,
  constructorIsVectorAdapter,
  constructorIsVad : constructorIsVectorAdapter,
}

Object.assign( _, ToolsExtension );

//

var VectorExtension =
{

  // dichotomy

  adapterIs,
  constructorIsVectorAdapter,

  // equaler

  _identicalShallow : _.array._identicalShallow,
  identicalShallow : _.array.identicalShallow,
  identical : _.array.identical,
  _equivalentShallow : _.array._equivalentShallow,
  equivalentShallow : _.array.equivalentShallow,
  equivalent : _.array.equivalent,

  // exporter

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,

    // container interface

  _lengthOf : _.countable._lengthOf,
  lengthOf : _.countable.lengthOf, /* qqq : cover */

  _hasKey : _.countable._hasKey,
  hasKey : _.countable._hasKey, /* qqq : cover */
  _hasCardinal : _.countable._hasKey,
  hasCardinal : _.countable._hasKey, /* qqq : cover */
  _keyWithCardinal : _.countable._hasKey,
  keyWithCardinal : _.countable._hasKey, /* qqq : cover */

  _elementGet : _.countable._elementWithKey,
  elementGet : _.countable.elementWithKey, /* qqq : cover */
  _elementWithKey : _.countable._elementWithKey,
  elementWithKey : _.countable.elementWithKey, /* qqq : cover */
  _elementWithImplicit : _.countable._elementWithImplicit,
  elementWithImplicit : _.countable.elementWithImplicit,  /* qqq : cover */
  _elementWithCardinal : _.countable._elementWithCardinal,
  elementWithCardinal : _.countable.elementWithCardinal,  /* qqq : cover */

  _elementSet : _.countable._elementSet,
  elementSet : _.countable.elementSet, /* qqq : cover */
  _elementWithKeySet : _.countable._elementWithKeySet,
  elementWithKeySet : _.countable.elementWithKeySet, /* qqq : cover */
  _elementWithCardinalSet : _.countable._elementWithCardinalSet,
  elementWithCardinalSet : _.countable.elementWithCardinalSet,  /* qqq : cover */

  _elementDel : _.countable._elementDel,
  elementDel : _.countable.elementDel, /* qqq : cover */
  _elementWithKeyDel : _.countable._elementWithKeyDel,
  elementWithKeyDel : _.countable.elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel : _.countable._elementWithCardinalDel,
  elementWithCardinalDel : _.countable.elementWithCardinalDel,  /* qqq : cover */
  _empty : _.blank._empty,
  empty : _.blank.empty,  /* qqq : cover */

  _each : _.countable._each,
  each : _.countable.each, /* qqq : cover */
  _eachLeft : _.countable._eachLeft,
  eachLeft : _.countable.eachLeft, /* qqq : cover */
  _eachRight : _.countable._eachRight,
  eachRight : _.countable.eachRight, /* qqq : cover */

  _while : _.countable._while,
  while : _.countable.while, /* qqq : cover */
  _whileLeft : _.countable._whileLeft,
  whileLeft : _.countable.whileLeft, /* qqq : cover */
  _whileRight : _.countable._whileRight,
  whileRight : _.countable.whileRight, /* qqq : cover */

  _aptLeft : _.countable._aptLeft,
  aptLeft : _.countable.aptLeft, /* qqq : cover */
  first : _.countable.first,
  _aptRight : _.countable._aptRight, /* qqq : cover */
  aptRight : _.countable.aptRight,
  last : _.countable.last, /* qqq : cover */

}

Object.assign( _.vector, VectorExtension );

//

})();
