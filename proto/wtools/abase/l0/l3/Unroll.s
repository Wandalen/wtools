( function _l3_Unroll_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.assert( !!_.array._elementWithKey, 'Expects routine array._elementWithKey' );

// --
// declaration
// --

let unrollSymbol = Symbol.for( 'unroll' );

// --
// declaration
// --

let ToolsExtension =
{
}

//

Object.assign( _, ToolsExtension );

//

/* qqq : for Yevhen : make replacements */

let UnrollExtension =
{

  //

  NamespaceName : 'unroll',

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

  _elementDel : _.array._elementDel,
  elementDel : _.array.elementDel, /* qqq : cover */
  _elementWithKeyDel : _.array._elementWithKeyDel,
  elementWithKeyDel : _.array.elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel : _.array._elementWithCardinalDel,
  elementWithCardinalDel : _.array.elementWithCardinalDel,  /* qqq : cover */
  _empty : _.array._empty,
  empty : _.array.empty, /* qqq : for Yevhen : cover */

  _each : _.argumentsArray._each,
  each : _.argumentsArray.each, /* qqq : cover */
  _eachLeft : _.argumentsArray._eachLeft,
  eachLeft : _.argumentsArray.eachLeft, /* qqq : cover */
  _eachRight : _.argumentsArray._eachRight,
  eachRight : _.argumentsArray.eachRight, /* qqq : cover */

  _while : _.argumentsArray._while,
  while : _.argumentsArray.while, /* qqq : cover */
  _whileLeft : _.argumentsArray._whileLeft,
  whileLeft : _.argumentsArray.whileLeft, /* qqq : cover */
  _whileRight : _.argumentsArray._whileRight,
  whileRight : _.argumentsArray.whileRight, /* qqq : cover */

  _aptLeft : _.argumentsArray._aptLeft,
  aptLeft : _.argumentsArray.aptLeft, /* qqq : cover */
  first : _.argumentsArray.first,
  _aptRight : _.argumentsArray._aptRight, /* qqq : cover */
  aptRight : _.argumentsArray.aptRight,
  last : _.argumentsArray.last, /* qqq : cover */

}

//

Object.assign( _.unroll, UnrollExtension );

})();
