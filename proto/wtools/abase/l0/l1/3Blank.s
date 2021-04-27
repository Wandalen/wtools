( function _l1_3Blank_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.blank = _.blank || Object.create( null );

// --
// blank
// --

function is( src )
{
  return true;
}

//

function like( src )
{
  return this.is( src );
}

// --
// maker
// --

function _makeEmpty( src )
{
  return src;
}

//

function makeEmpty( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  return src;
}

//

function _makeUndefined( src )
{
  return src;
}

//

function makeUndefined( src, length )
{
  _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  return src;
}

//

function _make( src )
{
  return src;
}

//

function make( src )
{
  _.assert( this.like( src ) );
  _.assert( arguments.length === 1 );
  return this._make( src );
}

//

function _cloneShallow( src )
{
  return src;
}

// --
// extension
// --

let ToolsExtension =
{

  // dichotomy

  blankIs : is.bind( _.blank ),
  blankLike : like.bind( _.blank ),

}

Object.assign( _, ToolsExtension );

//

let BlankExtension =
{

  //

  NamespaceName : 'blank',
  TypeName : 'Blank',
  SecondTypeName : 'Blank',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is,
  like,

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

}

Object.assign( _.blank, BlankExtension );

})();
