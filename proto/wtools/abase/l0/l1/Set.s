( function _l1_Set_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.set = _.set || Object.create( null );
_.set.s = _.set.s || Object.create( null );

// --
// implementation
// --

function is( src )
{
  if( !src )
  return false;
  return src instanceof Set || src instanceof WeakSet;
}

//

function like( src )
{
  return _.set.is( src );
}

//

function isEmpty()
{
  return !src.size;
}

//

function isPopulated()
{
  return !!src.size;
}


// --
// maker
// --

function _makeEmpty( src )
{
  return new Set();
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
  return new Set();
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

  return new Set();
}

//

function _make( src, length )
{
  if( length === 0 )
  return new Set();
  else if( _.number.is( src ) )
  return new Set();
  else
  return new Set([ ... src ]);
}

//

function make( src, length )
{
  _.assert( arguments.length === 0 || src === null || _.countable.is( src ) || src === 0 );
  _.assert( arguments.length < 2 || length === 0 );
  _.assert( arguments.length <= 2 );
  return this._make( ... arguments );
}

//

function _cloneShallow( src )
{
  return new Set([ ... src ]);
}

//

function cloneShallow( src )
{
  _.assert( _.countable.is( src ) );
  _.assert( arguments.length === 1 );
  return this._cloneShallow( src );
}

//

function from( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( this.is( src ) )
  return src;
  return this.make( src );
}

// //
//
// function from( src )
// {
//   _.assert( arguments.length === 1 );
//   if( _.set.adapterLike( src ) )
//   return src;
//   if( src === null )
//   return new Set();
//   if( _.containerAdapter.is( src ) )
//   src = src.toArray().original;
//   _.assert( _.longIs( src ) );
//   return new Set([ ... src ]);
// }
//
// //
//
// function setsFrom( srcs )
// {
//   _.assert( arguments.length === 1 );
//   _.assert( _.longIs( srcs ) );
//   let result = [];
//   for( let s = 0, l = srcs.length ; s < l ; s++ )
//   result[ s ] = _.set.from( srcs[ s ] );
//   return result;
// }

// --
// extension
// --

let ToolsExtension =
{

  // dichotomy

  setIs : is.bind( _.set ),
  setIsEmpty : isEmpty.bind( _.set ),
  setIsPopulated : isPopulated.bind( _.set ),
  setLike : like.bind( _.set ),

  // maker

  setMakeEmpty : makeEmpty.bind( _.set ),
  setMakeUndefined : makeUndefined.bind( _.set ),
  setMake : make.bind( _.set ),
  setCloneShallow : cloneShallow.bind( _.set ),
  setFrom : from.bind( _.set ),

}

Object.assign( _, ToolsExtension );

//

let SetExtension =
{

  //

  NamespaceName : 'set',
  TypeName : 'Set',
  SecondTypeName : 'Set',
  InstanceConstructor : Set,
  tools : _,

  // dichotomy

  is,
  like,
  // adapterLike,
  isEmpty,
  isPopulated,

  // maker

  _makeEmpty,
  makeEmpty, /* qqq : for Yevhen : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for Yevhen : cover */
  _make,
  make, /* qqq : for Yevhen : cover */
  _cloneShallow,
  cloneShallow, /* qqq : for Yevhen : cover */
  from,

}

Object.assign( _.set, SetExtension );

//

let SetsExtension =
{
}

//

Object.assign( _.set.s, SetsExtension );

})();
