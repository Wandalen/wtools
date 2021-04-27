( function _l1_Vector_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_global_.wTools.vector = _global_.wTools.vector || Object.create( null );

// --
// implementation
// --

function is( src )
{

  if( _.arrayIs( src ) )
  return true;
  if( _.primitive.is( src ) )
  return false;

  if( _.class.methodIteratorOf( src ) )
  if( _.number.is( src.length ) ) /* yyy */
  if( !_.mapIs( src ) )
  return true;

  return false;
}

//

function like( src )
{
  return _.vector.is( src );
}

// --
// extension
// --

var ToolsExtension =
{

  vectorIs : is.bind( _.vector ),
  vectorLike : like.bind( _.vector ),

}

Object.assign( _, ToolsExtension );

//

var VectorExtension =
{

  //

  NamespaceName : 'vector',
  TypeName : 'Vector',
  SecondTypeName : 'Vector',
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

Object.assign( _.vector, VectorExtension );

//

})();
