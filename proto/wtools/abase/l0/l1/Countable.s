( function _l1_Countable_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_global_.wTools.countable = _global_.wTools.countable || Object.create( null );

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
  TypeName : 'Countable',
  SecondTypeName : 'Countable',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is, /* qqq : cover here and in the module::MathVector */
  like, /* qqq : cover here and in the module::MathVector */

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
