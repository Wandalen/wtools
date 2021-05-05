( function _l1_Vector_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.vector = _.vector || Object.create( null );

_.assert( !!_.long.make, 'Expects routine _.long.make' );

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
  NamespaceQname : 'wTools/vector',
  MoreGeneralNamespaceName : 'countable',
  MostGeneralNamespaceName : 'countable',
  TypeName : 'Vector',
  SecondTypeName : 'Vector',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is, /* qqq : cover here and in the module::MathVector */
  like, /* qqq : cover here and in the module::MathVector */

  // maker

  _makeEmpty : _.long._makeEmpty,
  makeEmpty : _.long.makeEmpty, /* qqq : for junior : cover */
  _makeUndefined : _.long._makeUndefined,
  makeUndefined : _.long.makeUndefined, /* qqq : for junior : cover */
  _make : _.long._make,
  make : _.long.make, /* qqq : for junior : cover */
  _cloneShallow : _.long._cloneShallow,
  cloneShallow : _.long.cloneShallow, /* qqq : for junior : cover */
  from : _.long.from, /* qqq : for junior : cover */

}

Object.assign( _.vector, VectorExtension );

//

})();
