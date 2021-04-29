( function _l1_Countable_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.countable = _.countable || Object.create( null );

// --
// dichotomy
// --

function is( src )
{

  if( _.arrayIs( src ) )
  return true;

  if( _.primitive.is( src ) )
  return false;

  if( _.class.methodIteratorOf( src ) )
  if( !_.mapIs( src ) )
  return true;

  return false;
}

//

function like( src )
{
  return _.countable.is( src );
}

// --
// maker
// --

function _makeEmpty( src )
{
  if( _.long.is( src ) )
  return _.long._makeEmpty( src );
  return _.object.makeEmpty( src );
}

//

/* qqq2 : for junior : cover please */
function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length === 1 )
  {
    _.assert( this.like( src ) || _.routineIs( src ) );
    return this._makeEmpty( src );
  }
  else
  {
    return this._makeEmpty();
  }
}

//

function _makeUndefined( src, length )
{
  if( _.long.is( src ) )
  return _.long._makeUndefined( src );
  return _.object.makeUndefined( src );
}

//

/* qqq2 : for junior : cover please */
function makeUndefined( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || _.countable.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === null || _.numberIs( src ) || this.like( src ) || _.routineIs( src ) );
  }
  return this._makeUndefined( ... arguments );
}

//

function _makeZeroed( src, length )
{
  if( _.long.is( src ) )
  return _.long._makeZeroed( src );
  return _.object.make( src );
}

//

/* qqq2 : for junior : cover please */
/* qqq : for junior : extend with test cases with countable in 2nd arg */
function makeZeroed( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || _.countable.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === null || _.numberIs( src ) || this.like( src ) || _.routineIs( src ) );
  }
  return this._makeZeroed( ... arguments );
}

//

function _make( src, length )
{
  if( _.long.is( src ) )
  return _.long._make( src );
  return _.object.make( src );
}

//

/* qqq2 : for junior : full implementation and coverage are required */
/* qqq : for junior : extend with test cases with countable in 2nd arg */
function make( src, length )
{
  _.assert( arguments.length <= 2 );
  if( arguments.length === 2 )
  {
    _.assert( src === null || _.long.is( src ) || _.routineIs( src ) );
    _.assert( _.numberIs( length ) || _.countable.is( length ) );
  }
  else if( arguments.length === 1 )
  {
    _.assert( src === null || _.numberIs( src ) || this.like( src ) || _.routineIs( src ) );
  }
  return this._make( ... arguments );
}

//

/* qqq2 : for junior : full implementation and coverage are required */
function _cloneShallow( src )
{
  if( _.long.is( src ) )
  return _.long._cloneShallow( src );
  return _.object.cloneShallow( src );
}

//

function cloneShallow( srcArray )
{
  _.assert( this.like( srcArray ) );
  _.assert( arguments.length === 1 );
  return this._cloneShallow( srcArray );
}

//

function from( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( this.is( src ) )
  return src;
  if( src === null )
  return this.make( null );
  return this.make( null, src );
}

// --
// extension
// --

var ToolsExtension =
{

  // dichotomy

  countableIs : is.bind( _.countable ),
  countableLike : like.bind( _.countable ),

}

Object.assign( _, ToolsExtension );

//

var CountableExtension =
{

  //

  NamespaceName : 'countable',
  NamespaceQname : 'wTools/countable',
  TypeName : 'Countable',
  SecondTypeName : 'Countable',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is, /* qqq : cover here and in the module::MathVector */
  like, /* qqq : cover here and in the module::MathVector */

  // maker

  _makeEmpty,
  makeEmpty, /* qqq : for junior : cover */
  _makeUndefined,
  makeUndefined, /* qqq : for junior : cover */
  _makeZeroed,
  makeZeroed, /* qqq : for junior : cover */
  _make,
  make, /* qqq : for junior : cover */
  _cloneShallow,
  cloneShallow, /* qqq : for junior : cover */
  from, /* qqq : for junior : cover */

  /* xxx : implement */
  // maker
  //
  // _makeEmpty,
  // makeEmpty, /* qqq : for Yevhen : cover */
  // _makeUndefined,
  // makeUndefined, /* qqq : for Yevhen : cover */
  // _make,
  // make, /* qqq : for Yevhen : cover */
  // _cloneShallow,
  // cloneShallow, /* qqq : for Yevhen : cover */
  // from, /* qqq : for Yevhen : cover */

}

Object.assign( _.countable, CountableExtension );

})();
