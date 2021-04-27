( function _l3_Countable_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
//
// --

/* qqq2 : for Yevhen : bad! | aaa : Fixed. */
function _identicalShallow( src1, src2 )
{

  if( Object.prototype.toString.call( src1 ) !== Object.prototype.toString.call( src2 ) )
  return false;

  if( !_.countable.is( src1 ) )
  return false;
  if( !_.countable.is( src2 ) )
  return false;

  if( _.longIs( src1 ) )
  {
    return _.long.identicalShallow( src1, src2 );
  }
  else
  {
    /*
      entity with method iterator,
      entity with method iterator and length
    */

    let array1 = [];
    for( let val of src1 )
    array1.push( val );

    for( let val of src2 )
    if( array1.indexOf( val ) === -1 )
    return false

    return true;
  }
}

//

function identicalShallow( src1, src2, o )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );


  if( !this.like( src1 ) )
  return false;
  if( !this.like( src2 ) )
  return false;
  return this._identicalShallow( src1, src2 );
}

//

function _equivalentShallow( src1, src2 )
{

  let result = true;

  if( _.longIs( src1 ) && _.longIs( src2 ) )
  {
    return _.longEquivalentShallow( src1, src2 );
  }
  else
  {
    /*
      entity with method iterator,
      entity with method iterator and length
    */

    /* don't create new array if one of arguments is array */
    if( _.argumentsArray.like( src1 ) )
    {
      result = isContain( src2, src1 );
    }
    else if( _.argumentsArray.like( src2 ) )
    {
      result = isContain( src1, src2 );
    }
    else
    {
      let array1 = [];
      for( let val of src1 )
      array1.push( val );

      result = isContain( src2, array1 );
    }

    return result;
  }

  /* - */

  function isContain( arrayLoop, arrayCheck )
  {
    for( let val of arrayLoop )
    if( Array.prototype.indexOf.call( arrayCheck, val ) === -1 )
    return false

    return true;
  }
}

//

function equivalentShallow( src1, src2 )
{
  _.assert( arguments.length === 2 );
  if( !this.like( src1 ) )
  return false;
  if( !this.like( src2 ) )
  return false;
  return this._equivalentShallow( src1, src2 );
}

// --
// exporter
// --

function exportStringShallowDiagnostic( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.countable.like( src ) );

  if( _.vector.is( src ) )
  return _.vector.exportStringShallowDiagnostic( src );
  return `{- ${_.entity.strType( src )} with ${_.countable.lengthOf( src )} elements -}`;
}

// --
// container interface
// --

function _lengthOf( src )
{
  return [ ... src ].length;
}

//

function lengthOf( src )
{
  _.assert( arguments.length === 1 );
  _.assert( this.like( src ) );
  return this._lengthOf( src );
}

//

function _hasKey( src, key )
{
  if( key < 0 )
  return false;
  return key < this._lengthOf( src );
}

//

function hasKey( src, key )
{
  _.assert( this.like( src ) );
  return this._hasKey( src, key );
}

//

function _hasCardinal( src, cardinal )
{
  if( cardinal < 0 )
  return false;
  return cardinal < this._lengthOf( src );
}

//

function hasCardinal( src, cardinal )
{
  _.assert( this.like( src ) );
  return this._hasCardinal( src, cardinal );
}

//

function _keyWithCardinal( src, cardinal )
{
  if( cardinal < 0 || this._lengthOf( src ) <= cardinal )
  return [ undefined, false ];
  return [ cardinal, true ];
}

//

function keyWithCardinal( src, cardinal )
{
  _.assert( this.like( src ) );
  return this._keyWithCardinal( src, cardinal );
}

//

function _elementWithKey( src, key )
{
  if( _.numberIs( key ) )
  {
    if( key < 0 )
    return [ undefined, key, false ];
    const src2 = [ ... src ];
    if( src2.length <= key )
    return [ undefined, key, false ];
    else
    return [ src2[ key ], key, true ];
  }
  else
  {
    if( _.props.has( src, key ) )
    return [ src[ key ], key, true ];
    else
    return [ undefined, key, false ];
  }
}

//

function elementWithKey( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithKey( src, key );
}

//

function _elementWithImplicit( src, key )
{
  if( _.props.keyIsImplicit( key ) )
  return _.props._onlyImplicitWithKeyTuple( src, key );
  return this._elementWithKey( src, key );
}

//

function elementWithImplicit( src, key )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithImplicit( src, key );
}

//

function _elementWithCardinal( src, cardinal )
{
  if( !_.numberIs( cardinal ) || cardinal < 0 )
  return [ undefined, cardinal, false ];
  const src2 = [ ... src ];
  if( src2.length <= cardinal )
  return [ undefined, cardinal, false ];
  else
  return [ src2[ cardinal ], cardinal, true ];
}

//

function elementWithCardinal( src, cardinal )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  return this._elementWithCardinal( src, cardinal );
}

//

function _elementWithKeySet( src, key, val )
{
  if( !_.numberIs( cardinal ) || cardinal < 0 )
  return [ undefined, cardinal, false ];
  const src2 = [ ... src ];
  if( src2.length <= cardinal )
  return [ undefined, cardinal, false ];

  let elementWithKeySet = _.class.methodElementWithKeySetOf( src );
  if( elementWithKeySet )
  return elementWithKeySet.call( src, key, val );

  let elementSet = _.class.methodElementSetOf( src );
  if( elementSet )
  return [ elementSet.call( src, key, val ), key, true ];

  _.assert( 0, 'Countable does not have implemented neither method "elementWithKeySet" nor method "eSet"' );
}

//

function elementWithKeySet( src, key, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._elementWithKeySet( src, key, val );
}

//

function _elementWithCardinalSet( src, cardinal, val )
{
  if( !_.numberIs( cardinal ) || cardinal < 0 )
  return [ undefined, cardinal, false ];
  const src2 = [ ... src ];
  if( src2.length <= cardinal )
  return [ undefined, cardinal, false ];

  let was = this._elementWithCardinal( src, cardinal );
  if( was[ 2 ] )
  this._elementWithKeySet( src, was[ 1 ], val );
  return [ undefined, cardinal, false ];
}

//

function elementWithCardinalSet( src, cardinal, val )
{
  _.assert( arguments.length === 3 );
  _.assert( this.is( src ) );
  return this._elementWithCardinalSet( src, cardinal, val );
}

//

function _eachLeft( src, onEach )
{
  let k = 0;
  for( let val of src )
  {
    onEach( src[ s ], k, k, src );
    k += 1;
  }
}

//

function eachLeft( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._eachLeft( src, onEach );
}

//

function _eachRight( src, onEach )
{
  let src2 = [ ... src ];
  for( let k = src2.length-1 ; k >= 0 ; k-- )
  {
    let val = src2[ k ];
    onEach( val, k, k, src );
  }
}

//

function eachRight( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._eachRight( src, onEach );
}

//

function _whileLeft( src, onEach )
{
  let k = 0;
  let laste;
  for( let val of src )
  {
    let r = onEach( val, k, k, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ val, k, false ];
    laste = val;
    k += 1;
  }
  if( k > 0 )
  return [ laste, k-1, k-1, true ];
  else
  return [ undefined, k-1, k-1, true ];
}

//

function whileLeft( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._whileLeft( src, onEach );
}

//

function _whileRight( src, onEach )
{
  let src2 = [ ... src ];
  for( let k = src2.length-1 ; k >= 0 ; k-- )
  {
    let val = src2[ k ];
    let r = onEach( val, k, k, src );
    _.assert( r === true || r === false );
    if( r === false )
    return [ val, k, k, false ];
  }
  if( src2.length > 0 )
  return [ src2[ 0 ], 0, 0, true ];
  else
  return [ undefined, -1, -1, true ];
}

//

function whileRight( src, onEach )
{
  _.assert( arguments.length === 2 );
  _.assert( this.is( src ) );
  this._whileRight( src, onEach );
}

// --
// extension
// --

var ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

//

var CountableExtension =
{

  // equaler

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,
  _equivalentShallow : _identicalShallow,
  equivalentShallow : identicalShallow,
  equivalent : identicalShallow,

  // exporter

  exportString : exportStringShallowDiagnostic,
  exportStringShallow : exportStringShallowDiagnostic,
  exportStringShallowDiagnostic,
  exportStringShallowCode : exportStringShallowDiagnostic,
  exportStringDiagnostic : exportStringShallowDiagnostic,
  exportStringCode : exportStringShallowDiagnostic,

  // container interface

  _lengthOf,
  lengthOf, /* qqq : cover */

  _hasKey,
  hasKey, /* qqq : cover */
  _hasCardinal,
  hasCardinal, /* qqq : cover */
  _keyWithCardinal,
  keyWithCardinal, /* qqq : cover */

  _elementGet : _elementWithKey,
  elementGet : elementWithKey, /* qqq : cover */
  _elementWithKey,
  elementWithKey, /* qqq : cover */
  _elementWithImplicit,
  elementWithImplicit,  /* qqq : cover */
  _elementWithCardinal,
  elementWithCardinal,  /* qqq : cover */

  _elementSet : _elementWithKeySet,
  elementSet : elementWithKeySet, /* qqq : cover */
  _elementWithKeySet,
  elementWithKeySet, /* qqq : cover */
  _elementWithCardinalSet,
  elementWithCardinalSet,  /* qqq : cover */

  /* xxx : implement own routines */
  _elementDel : _.blank._elementDel,
  elementDel : _.blank.elementDel, /* qqq : cover */
  _elementWithKeyDel : _.blank._elementWithKeyDel,
  elementWithKeyDel : _.blank.elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel : _.blank._elementWithCardinalDel,
  elementWithCardinalDel : _.blank.elementWithCardinalDel,  /* qqq : cover */
  _empty : _.blank._empty,
  empty : _.blank.empty,  /* qqq : cover */

  _each : _eachLeft,
  each : eachLeft, /* qqq : cover */
  _eachLeft,
  eachLeft, /* qqq : cover */
  _eachRight,
  eachRight, /* qqq : cover */

  _while : _whileLeft,
  while : whileLeft, /* qqq : cover */
  _whileLeft,
  whileLeft, /* qqq : cover */
  _whileRight,
  whileRight, /* qqq : cover */

  _aptLeft : _.props._aptLeft,
  aptLeft : _.props.aptLeft, /* qqq : cover */
  first : _.props.first,
  _aptRight : _.props._aptRight, /* qqq : cover */
  aptRight : _.props.aptRight,
  last : _.props.last, /* qqq : cover */

}

Object.assign( _.countable, CountableExtension );

})();
