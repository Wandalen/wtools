( function _l1_BufferTyped_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.bufferTyped = _.bufferTyped || Object.create( null );

// --
// implementation
// --

function typedIs( src )
{
  let type = Object.prototype.toString.call( src );
  if( !/\wArray/.test( type ) )
  return false;
  if( type === '[object SharedArrayBuffer]' )
  return false;
  if( _.buffer.nodeIs( src ) )
  return false;
  return true;
}

// --
// declaration
// --

let BufferTypedExtension =
{

  //

  NamespaceName : 'bufferTyped',
  NamespaceQname : 'wTools/bufferTyped',
  TypeName : 'BufferTyped',
  SecondTypeName : 'ArrayTyped',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  typedIs,
  is : typedIs,
  like : typedIs,

  // maker

  _make : _.buffer._make, /* qqq : cover */
  make : _.buffer.make,
  _makeEmpty : _.buffer._makeEmpty,
  makeEmpty : _.buffer.makeEmpty,
  _makeUndefined : _.buffer._makeUndefined, /* qqq : implement */
  makeUndefined : _.buffer.makeUndefined,
  // _makeZeroed : _.buffer._makeZeroed,
  // makeZeroed : _.buffer.makeZeroed, /* qqq : for junior : cover */
  // _cloneShallow : _.buffer._cloneShallow,
  // cloneShallow : _.buffer.cloneShallow, /* qqq : for junior : cover */
  // from : _.buffer.from, /* qqq : for junior : cover */
  // qqq : implement

}

Object.assign( _.bufferTyped, BufferTypedExtension );

//

let BufferExtension =
{

  // dichotomy

  typedIs : typedIs.bind( _.buffer ),

}

Object.assign( _.buffer, BufferExtension );

//

let ToolsExtension =
{

  // dichotomy

  bufferTypedIs : typedIs.bind( _.buffer ),

}

//

Object.assign( _, ToolsExtension );

})();
