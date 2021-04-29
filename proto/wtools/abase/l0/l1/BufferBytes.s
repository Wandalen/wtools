( function _l1_BufferBytes_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.bufferBytes = _.bufferBytes || Object.create( null );

// --
// implementation
// --

function bytesIs( src )
{
  if( _.buffer.nodeIs( src ) )
  return false;
  return src instanceof U8x;
}

// --
// declaration
// --

let BufferBytesExtension =
{

  //

  NamespaceName : 'bufferBytes',
  NamespaceQname : 'wTools/bufferBytes',
  TypeName : 'BufferBytes',
  SecondTypeName : 'ArrayTyped',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  bytesIs,
  is : bytesIs,
  like : bytesIs,

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

Object.assign( _.bufferBytes, BufferBytesExtension );

//

let BufferExtension =
{

  // dichotomy

  bytesIs : bytesIs.bind( _.buffer ),

}

Object.assign( _.buffer, BufferExtension );

//

let ToolsExtension =
{

  // dichotomy

  bufferBytesIs : bytesIs.bind( _.buffer ),

}

Object.assign( _, ToolsExtension );

})();
