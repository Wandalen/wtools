( function _l1_BufferTyped_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

function _functor( fo )
{

  _.assert( _[ fo.name ] === undefined );
  _[ fo.name ] = _[ fo.name ] || Object.create( null );

  // --
  // dichotomy
  // --

  function is( src )
  {
    return src instanceof this.InstanceConstructor;
  }

  //

  function like( src ) /* qqq : cover */
  {
    let type = Object.prototype.toString.call( src );
    if( !/\wArray/.test( type ) )
    return false;
    if( type === '[object SharedArrayBuffer]' )
    return false;
    if( _.bufferNodeIs( src ) )
    return false;
    return true;
  }

  // --
  // maker
  // --

  function _makeEmpty( src )
  {
    return [];
  }

  //

  function makeEmpty( src )
  {
    _.assert( arguments.length === 0 || arguments.length === 1 );
    if( arguments.length === 1 )
    {
      _.assert( this.like( src ) );
      return [];
    }
    else
    {
      return [];
    }
  }

  //

  function _makeUndefined( src, length )
  {
    if( arguments.length === 2 )
    {
      if( _.long.is( length ) )
      length = length.length;
      return new this.InstanceConstructor( length );
    }
    else if( arguments.length === 1 )
    {
      length = src;
      if( _.long.is( length ) )
      length = length.length;
      if( length === null )
      return new this.InstanceConstructor();
      else
      return new this.InstanceConstructor( length );
    }
    else
    {
      return [];
    }
  }

  //

  function makeUndefined( src, length )
  {
    _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
    if( arguments.length === 2 )
    {
      _.assert( src === null || _.long.is( src ) );
      _.assert( _.number.is( length ) || _.long.is( length ) );
      return this._makeUndefined( src, length );
    }
    else if( arguments.length === 1 )
    {
      _.assert( _.number.is( src ) || _.long.is( src ) || src === null );
      return this._makeUndefined( src );
    }
    else
    {
      return [];
    }
  }

  //

  function _make( src, length )
  {
    if( _.numberIs( length ) )
    return new this.InstanceConstructor( length );
    if( _.numberIs( src ) )
    return new this.InstanceConstructor( src );
    if( src )
    return new this.InstanceConstructor( src );
    return new this.InstanceConstructor( 0 );
  }

  //

  function make( src, length )
  {
    _.assert( arguments.length === 0 || src === null || _.countable.is( src ) || _.numberIs( src ) );
    _.assert( length === undefined || !_.number.is( src ) || !_.number.is( length ) );
    _.assert( arguments.length < 2 || _.number.is( length ) );
    _.assert( arguments.length <= 2 );
    return this._make( ... arguments );
  }

  //

  function _cloneShallow( srcArray )
  {
    return srcArray.slice();
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
    return this.make( src );
  }

  // --
  // declare
  // --

  let ToolsExtension =
  {

    /* xxx : binding will cause problem with changing default long type */

    // dichotomy

    [ fo.name + 'Is' ] : is.bind( _[ fo.name ] ),
    [ fo.name + 'Like' ] : like.bind( _[ fo.name ] ),

    // maker

    [ fo.name + 'MakeEmpty' ] : makeEmpty.bind( _[ fo.name ] ),
    [ fo.name + 'MakeUndefined' ] : makeUndefined.bind( _[ fo.name ] ),
    [ fo.name + 'Make' ] : make.bind( _[ fo.name ] ),
    [ fo.name + 'CloneShallow' ] : cloneShallow.bind( _[ fo.name ] ),
    [ fo.name + 'From' ] : from.bind( _[ fo.name ] ),

  }

  Object.assign( _, ToolsExtension );

  //

  let BufferTypedExtension =
  {

    //

    NamespaceName : fo.name,
    TypeName : fo.typeName,
    SecondTypeName : fo.secondTypeName,
    InstanceConstructor : fo.instanceConstructor,
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
    cloneShallow, /* qqq : for Yevhen : cover */
    from, /* qqq : for Yevhen : cover */

  }

  //

  Object.assign( _[ fo.name ], BufferTypedExtension );
  _.long._namespaceRegister( _[ fo.name ] );

}

_functor({ name : 'u32x', typeName : 'U32x', secondTypeName : 'Uint32', instanceConstructor : U32x });
_functor({ name : 'u16x', typeName : 'U16x', secondTypeName : 'Uint16', instanceConstructor : U16x });
_functor({ name : 'u8x', typeName : 'U8x', secondTypeName : 'Uint8', instanceConstructor : U8x });
_functor({ name : 'ux', typeName : 'Ux', secondTypeName : 'Uint32', instanceConstructor : Ux });

_functor({ name : 'i32x', typeName : 'I32x', secondTypeName : 'Int32', instanceConstructor : I32x });
_functor({ name : 'i16x', typeName : 'I16x', secondTypeName : 'Int16', instanceConstructor : I16x });
_functor({ name : 'i8x', typeName : 'I8x', secondTypeName : 'Int8', instanceConstructor : I8x });
_functor({ name : 'ix', typeName : 'Ix', secondTypeName : 'Int32', instanceConstructor : Ix });

_functor({ name : 'f64x', typeName : 'F64x', secondTypeName : 'Float64', instanceConstructor : F64x });
_functor({ name : 'f32x', typeName : 'F32x', secondTypeName : 'Float32', instanceConstructor : F32x });
_functor({ name : 'fx', typeName : 'Fx', secondTypeName : 'Float32', instanceConstructor : Fx });

})();
