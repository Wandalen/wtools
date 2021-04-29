( function _l3_Object_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.assert( !!_.props._elementWithKey, 'Expects routine _.props._elementWithKey' );
_.assert( !!_.props.keys, 'Expects routine _.props.keys' );

// --
// equaler
// --

function _identicalShallow( src1, src2 )
{

  if( _.aux.is( src1 ) && _.aux.is( src2 ) )
  return _.aux._identicalShallow( src1, src2 );

  let equal = _.class.methodEqualOf( src1 ) || _.class.methodEqualOf( src2 );

  if( equal )
  return equal( src1, src2, {} );

  return src1 === src2;
}

//

function identicalShallow( src1, src2, o )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );


  if( !this.is( src1 ) )
  return false;
  if( !this.is( src2 ) )
  return false;

  return this._identicalShallow( src1, src2 );
}

//

function _equivalentShallow( src1, src2 )
{
  let equal = _.class.methodEqualOf( src1 ) || _.class.methodEqualOf( src2 );

  if( equal )
  return equal( src1, src2, {} );

  return src1 === src2;
}

//

function equivalentShallow( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( !this.is( src1 ) )
  return false;
  if( !this.is( src2 ) )
  return false;

  return this._equivalentShallow( src1, src2 );
}

// --
// exporter
// --

function _exportStringShallowDiagnostic( src )
{
  let result = '';
  let method = _.class.methodExportStringOf( src );

  if( method )
  {
    result = method.call( src, { verbosity : 1 } );
    result = _.strShort_( result ).result;
  }
  else
  {
    if( _.countable.is( src ) )
    result = _.countable.exportStringShallowDiagnostic( src );
    else
    result = `{- ${_.entity.strType( src )} -}`;
  }

  return result;
}

//

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.like( src ) );
  return this._exportStringShallowDiagnostic( ... arguments );
}

// --
// extension
// --

let ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

//

let ObjectExtension =
{

  // equaler

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,
  _equivalentShallow,
  equivalentShallow,
  equivalent : equivalentShallow,

  // exporter

  _exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  _exportStringShallowCode : _exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,

  // container interface

  /* xxx : qqq : implement routines. should be if countable else blank */

  _lengthOf : _.blank._lengthOf,
  lengthOf : _.blank.lengthOf, /* qqq : cover */

  _hasKey : _.blank._hasKey,
  hasKey : _.blank._hasKey, /* qqq : cover */
  _hasCardinal : _.blank._hasKey,
  hasCardinal : _.blank._hasKey, /* qqq : cover */
  _keyWithCardinal : _.blank._hasKey,
  keyWithCardinal : _.blank._hasKey, /* qqq : cover */

  _elementGet : _.blank._elementWithKey,
  elementGet : _.blank.elementWithKey, /* qqq : cover */
  _elementWithKey : _.blank._elementWithKey,
  elementWithKey : _.blank.elementWithKey, /* qqq : cover */
  _elementWithImplicit : _.blank._elementWithImplicit,
  elementWithImplicit : _.blank.elementWithImplicit,  /* qqq : cover */
  _elementWithCardinal : _.blank._elementWithCardinal,
  elementWithCardinal : _.blank.elementWithCardinal,  /* qqq : cover */

  _elementSet : _.blank._elementSet,
  elementSet : _.blank.elementSet, /* qqq : cover */
  _elementWithKeySet : _.blank._elementWithKeySet,
  elementWithKeySet : _.blank.elementWithKeySet, /* qqq : cover */
  _elementWithCardinalSet : _.blank._elementWithCardinalSet,
  elementWithCardinalSet : _.blank.elementWithCardinalSet,  /* qqq : cover */

  _elementDel : _.blank._elementDel,
  elementDel : _.blank.elementDel, /* qqq : cover */
  _elementWithKeyDel : _.blank._elementWithKeyDel,
  elementWithKeyDel : _.blank.elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel : _.blank._elementWithCardinalDel,
  elementWithCardinalDel : _.blank.elementWithCardinalDel,  /* qqq : cover */
  _empty : _.props._empty,
  empty : _.props.empty, /* qqq : for Yevhen : cover */

  _each : _.blank._each,
  each : _.blank.each, /* qqq : cover */
  _eachLeft : _.blank._eachLeft,
  eachLeft : _.blank.eachLeft, /* qqq : cover */
  _eachRight : _.blank._eachRight,
  eachRight : _.blank.eachRight, /* qqq : cover */

  _while : _.blank._while,
  while : _.blank.while, /* qqq : cover */
  _whileLeft : _.blank._whileLeft,
  whileLeft : _.blank.whileLeft, /* qqq : cover */
  _whileRight : _.blank._whileRight,
  whileRight : _.blank.whileRight, /* qqq : cover */

  _aptLeft : _.blank._aptLeft,
  aptLeft : _.blank.aptLeft, /* qqq : cover */
  first : _.blank.first,
  _aptRight : _.blank._aptRight, /* qqq : cover */
  aptRight : _.blank.aptRight,
  last : _.blank.last, /* qqq : cover */

  _filter : _.blank._filter,
  filterWithoutEscapeLeft : _.blank.filterWithoutEscapeLeft,
  filterWithoutEscapeRight : _.blank.filterWithoutEscapeRight,
  filterWithoutEscape : _.blank.filterWithoutEscape,
  filterWithEscapeLeft : _.blank.filterWithEscapeLeft,
  filterWithEscapeRight : _.blank.filterWithEscapeRight,
  filterWithEscape : _.blank.filterWithEscape,
  filter : _.blank.filter,

  _map : _.blank._map,
  mapWithoutEscapeLeft : _.blank.mapWithoutEscapeLeft,
  mapWithoutEscapeRight : _.blank.mapWithoutEscapeRight,
  mapWithoutEscape : _.blank.mapWithoutEscape,
  mapWithEscapeLeft : _.blank.mapWithEscapeLeft,
  mapWithEscapeRight : _.blank.mapWithEscapeRight,
  mapWithEscape : _.blank.mapWithEscape,
  map : _.blank.map,

}

//

Object.assign( _.object, ObjectExtension );

})();
