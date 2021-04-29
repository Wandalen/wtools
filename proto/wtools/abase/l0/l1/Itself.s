( function _l1_Itself_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.itself = _.itself || Object.create( null );

_.assert( !!_.blank.make, 'Expects routine _.blank.make' );

// --
// implementation
// --

function is( src )
{
  return true;
}

//

function like( src )
{
  return true;
}

// --
// extension
// --

let ToolsExtension =
{

  // dichotomy

  itselfIs : is.bind( _.itself ),
  itselfLike : like.bind( _.itself ),

}

Object.assign( _, ToolsExtension );

//

let ItselfExtension =
{

  // fields

  NamespaceName : 'itself',
  NamespaceQname : 'wTools/itself',
  TypeName : 'Itself',
  SecondTypeName : 'Itself',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is,
  like,

  // maker

  _makeEmpty : _.blank._makeEmpty,
  makeEmpty : _.blank.makeEmpty, /* qqq : for Yevhen : cover */
  _makeUndefined : _.blank._makeUndefined,
  makeUndefined : _.blank.makeUndefined, /* qqq : for Yevhen : cover */
  _make : _.blank._make,
  make : _.blank.make, /* qqq : for Yevhen : cover */
  _cloneShallow : _.blank._cloneShallow,
  cloneShallow : _.blank.cloneShallow, /* qqq : for Yevhen : cover */
  from : _.blank.from, /* qqq : for Yevhen : cover */

}

Object.assign( _.itself, ItselfExtension );

})();
