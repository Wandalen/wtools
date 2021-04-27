( function _l1_ArgumentsArray_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.argumentsArray = _.argumentsArray || Object.create( null );

// --
// dichotomy
// --

function is( src )
{
  return Object.prototype.toString.call( src ) === '[object Arguments]';
}

//

function like( src ) /* qqq : cover */
{
  if( _.argumentsArray.is( src ) )
  return true;
  if( _.array.is( src ) )
  return true;
  return false;
}

// --
// maker
// --

function _makeAct()
{
  return arguments;
}

//

function _make( src )
{
  if( src === undefined || src === null )
  src = 0;
  if( _.number.is( src ) )
  return _.argumentsArray._makeAct.apply( _, Array( src ) );
  else
  return _.argumentsArray._makeAct.apply( _, src );
}

//

function make( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( src === undefined || src === null || _.number.is( src ) || _.longLike( src ) );
  return this._make( src );
}

//

function _makeEmpty()
{
  return this._make([]);
}

//

function makeEmpty()
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  _.assert( src === undefined || src === null || this.like( src ) );
  return this._makeEmpty();
}

//

function _makeUndefined( src, length )
{
  if( length === undefined )
  length = src;
  if( this.like( length ) )
  length = length.length;
  return this._make( length );
}

//

function makeUndefined( src, length )
{
  if( length === undefined )
  {
    length = src;
  }
  else
  {
    _.assert( this.like( src ) );
  }
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.number.is( length ) || this.like( length ) );
  return this.make( length );
}

//

function _cloneShallow( src )
{
  return this._makeAct( ... src );
}

//

function cloneShallow( src )
{
  _.assert( arguments.length === 1 );
  _.assert( this.like( src ) );
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

// --
// extension
// --

var ToolsExtension =
{

  // dichotomy

  argumentsArrayIs : is.bind( _.argumentsArray ),
  argumentsArrayLike : like.bind( _.argumentsArray ),

  // maker

  argumentsArrayMakeEmpty : makeEmpty.bind( _.argumentsArray ),
  argumentsArrayMakeUndefined : makeUndefined.bind( _.argumentsArray ),
  argumentsArrayMake : make.bind( _.argumentsArray ),
  argumentsArrayCloneShallow : cloneShallow.bind( _.argumentsArray ),
  argumentsArrayFrom : from.bind( _.argumentsArray ),

}

//

Object.assign( _, ToolsExtension );

//

var ArgumentsArrayExtension =
{

  //

  NamespaceName : 'argumentsArray',
  TypeName : 'ArgumentsArray',
  SecondTypeName : 'Arguments',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is,
  like,

  // maker

  _makeAct,
  _make,
  make, /* qqq : for Yevhen : cover */
  _makeEmpty,
  makeEmpty, /* qqq : for Yevhen : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for Yevhen : cover */
  _cloneShallow,
  cloneShallow, /* qqq : for Yevhen : cover */
  from, /* qqq : for Yevhen : cover */

}

Object.assign( _.argumentsArray, ArgumentsArrayExtension );
_.long._namespaceRegister( _.argumentsArray );

})();
