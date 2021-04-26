( function _l1_Auxiliary_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools.aux = _global_.wTools.aux || Object.create( null );

_.assert( !!_.props.keys, 'Expects routine _.props.keys' );
_.assert( !!_.props._extendWithHashmap, 'Expects routine _.props._extendWithHashmap' );

// --
// dichotomy
// --

function is( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto === Object.prototype )
  return true;

  if( !_.primitive.is( proto ) )
  if( !Reflect.has( proto, 'constructor' ) || proto.constructor === Object.prototype.constructor )
  return true;

  return false;
}

//

function like( src )
{
  return _.aux.is( src );
}

//

function isPrototyped( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return false;

  if( proto === Object.prototype )
  return false;

  if( !_.primitive.is( proto ) )
  if( !Reflect.has( proto, 'constructor' ) || proto.constructor === Object.prototype.constructor )
  return true;

  return false;
}

//

function isPure( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return true;

  if( proto.constructor === Object )
  return false;

  if( !_.primitive.is( proto ) )
  if( !Reflect.has( proto, 'constructor' ) )
  return true;

  return false;
}

//

function isPolluted( src )
{

  if( !src )
  return false;

  if( src[ Symbol.iterator ] )
  return false;

  let proto = Object.getPrototypeOf( src );

  if( proto === null )
  return false;

  if( proto.constructor === Object )
  return true;

  return false;
}

//

function isEmpty( src )
{
  if( !this.like( src ) )
  return false;
  return this.keys( src ).length === 0;
}

//

function isPopulated( src )
{
  if( !this.like( src ) )
  return false;
  return this.keys( src ).length > 0;
}

// --
// maker
// --

function _makeEmpty( src )
{
  let result = Object.create( null );
  let src2 = _.prototype.of( src );
  while( src2 )
  result = Object.create( result );
  _.assert( 0, 'not tested' );
  return result;
}

//

function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  _.assert( this.like( src ) );
  return this._makeEmpty( src );
}

//

function _makeUndefined( src, length )
{
  let result = Object.create( null );
  _.assert( 0, 'not tested' );
  return result;
}

//

function makeUndefined( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  {
    _.assert( this.like( src ) );
    _.assert( _.number.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( _.number.is( src ) || this.like( src ) );
  }

  return this._makeUndefined( src );
}

//

function _make( src )
{
  if( src )
  {
    if( this.like( src ) )
    return this._cloneShallow( src );
    else
    return this.extendVersatile( Object.create( null ), src );
  }
  return Object.create( null );
}

//

function make( src, length )
{
  _.assert( arguments.length === 0 || src === null || !_.primitive.is( src ) );
  _.assert( length === undefined || length === 0 );
  _.assert( arguments.length <= 2 );
  return this._make( ... arguments );
}

//

function _cloneShallow( src )
{
  let dst = Object.create( null );
  let prototypes = _.prototype.each( src );
  let c = 1;

  for( let i = 1, l = prototypes.length ; i < l ; i++ )
  {
    let prototype = prototypes[ i ];
    if( prototype && prototype !== Object.prototype )
    {
      dst = Object.create( dst );
      c += 1;
    }
  }

  let result = dst;

  while( c > 0 )
  {
    copy( dst, src );
    dst = _.prototype.of( dst );
    src = _.prototype.of( src );
    c -= 1;
  }

  return result;

  function copy( dst, src )
  {
    let keys = _.props.onlyOwnKeys( src );
    for( let k = 0 ; k < keys.length ; k++ )
    dst[ keys[ k ] ] = src[ keys[ k ] ];
  }

}

// --
// extension
// --

let ToolsExtension =
{

  // dichotomy

  auxIs : is.bind( _.aux ),
  auxIsPure : isPure.bind( _.aux ),
  auxIsPolluted : isPolluted.bind( _.aux ),
  auxIsEmpty : isEmpty.bind( _.aux ),
  auxIsPopulated : isPopulated.bind( _.aux ),
  auxLike : like.bind( _.aux ),

  // maker

  auxMakeEmpty : makeEmpty.bind( _.aux ),
  auxMakeUndefined : makeUndefined.bind( _.aux ),
  auxMake : make.bind( _.aux ),
  auxCloneShallow : _.props.cloneShallow.bind( _.aux ),
  auxFrom : _.props.from.bind( _.aux ),

  // amender

  auxExtend : _.props.extend.bind( _.aux ),
  auxSupplement : _.props.supplement.bind( _.aux ),

}

Object.assign( _, ToolsExtension );

//

var AuxiliaryExtension =
{

  //

  NamespaceName : 'aux',
  TypeName : 'Aux',
  SecondTypeName : 'Auxiliary',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is, /* qqq : cover */
  like, /* qqq : cover */
  isPrototyped, /* qqq : cover */
  isPure, /* qqq : cover */
  isPolluted, /* qqq : cover */

  isEmpty, /* qqq : cover */
  isPopulated, /* qqq : cover */

  // maker

  _makeEmpty,
  makeEmpty, /* qqq : for Yevhen : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for Yevhen : cover */
  _make,
  make, /* qqq : for Yevhen : cover */
  _cloneShallow,
  cloneShallow : _.props.cloneShallow, /* qqq : for Yevhen : cover */
  from : _.props.from, /* qqq : for Yevhen : cover */

  // properties

  _keys : _.props._keys, /* qqq : for Yevhen : cover */
  keys : _.props.keys, /* qqq : for Yevhen : cover */
  onlyOwnKeys : _.props.onlyOwnKeys, /* qqq : for Yevhen : cover */
  // onlyEnumerableKeys : _.props.onlyEnumerableKeys, /* qqq : for Yevhen : implement and cover properly */
  allKeys : _.props.allKeys, /* qqq : for Yevhen : cover */

  _vals : _.props._vals, /* qqq : for Yevhen : cover */
  vals : _.props.vals, /* qqq : for Yevhen : cover */
  onlyOwnVals : _.props.onlyOwnVals, /* qqq : for Yevhen : cover */
  // onlyEnumerableVals : _.props.onlyEnumerableVals, /* qqq : for Yevhen : implement and cover properly */
  allVals : _.props.allVals, /* qqq : for Yevhen : cover */

  _pairs : _.props._pairs, /* qqq : for Yevhen : cover */
  pairs : _.props.pairs, /* qqq : for Yevhen : cover */
  onlyOwnPairs : _.props.onlyOwnPairs, /* qqq : for Yevhen : cover */
  // onlyEnumerablePairs : _.props.onlyEnumerablePairs, /* qqq : for Yevhen : implement and cover properly */
  allPairs : _.props.allPairs, /* qqq : for Yevhen : cover */

  // amender

  _extendWithHashmap : _.props._extendWithHashmap,
  _extendWithSet : _.props._extendWithSet,
  _extendWithCountable : _.props._extendWithCountable,
  _extendWithProps : _.props._extendWithProps,
  _extendVersatile : _.props._extendVersatile,
  extendVersatile : _.props.extendVersatile,
  extend : _.props.extend,

  _supplementWithHashmap : _.props._supplementWithHashmap,
  _supplementWithSet : _.props._supplementWithSet,
  _supplementWithCountable : _.props._supplementWithCountable,
  _supplementWithProps : _.props._supplementWithProps,
  _supplementVersatile : _.props._supplementVersatile,
  supplementVersatile : _.props.supplementVersatile,
  supplement : _.props.supplement,

}

Object.assign( _.aux, AuxiliaryExtension );

})();