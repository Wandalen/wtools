( function _l1_BuffersTyped_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

function _functor( fo )
{

  _.assert( !!_.bufferTyped );
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
    return new this.InstanceConstructor( 0 );
  }

  //

  function makeEmpty( src )
  {
    if( arguments.length === 1 )
    _.assert( this.like( src ) );
    else
    _.assert( arguments.length === 0 );

    return this._makeEmpty( ... arguments );

    // _.assert( arguments.length === 0 || arguments.length === 1 );
    // if( arguments.length === 1 )
    // {
    //   _.assert( this.like( src ) );
    //   return [];
    // }
    // else
    // {
    //   return [];
    // }
  }

  //

  function _makeUndefined( src, length )
  {
    // if( arguments.length === 2 )
    // {
    //   if( _.long.is( length ) )
    //   length = length.length;
    //   return new this.InstanceConstructor( length );
    // }
    // else if( arguments.length === 1 )
    // {
    //   length = src;
    //   if( _.long.is( length ) )
    //   length = length.length;
    //   if( length === null )
    //   return new this.InstanceConstructor();
    //   else
    //   return new this.InstanceConstructor( length );
    // }

    if( length === undefined )
    length = src;
    if( this.like( length ) )
    length = length.length;
    return new this.InstanceConstructor( length );
  }

  //

  // function makeUndefined( src, length )
  // {
  //   _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  //   if( arguments.length === 2 )
  //   {
  //     _.assert( src === null || _.long.is( src ) );
  //     _.assert( _.number.is( length ) || _.long.is( length ) );
  //   }
  //   else if( arguments.length === 1 )
  //   {
  //     _.assert( _.number.is( src ) || _.long.is( src ) || src === null );
  //   }
  //
  //   return this._makeUndefined( ... arguments );
  //
  //   // _.assert( arguments.length === 0 || arguments.length === 1 || arguments.length === 2 );
  //   // if( arguments.length === 2 )
  //   // {
  //   //   _.assert( src === null || _.long.is( src ) );
  //   //   _.assert( _.number.is( length ) || _.long.is( length ) );
  //   //   return this._makeUndefined( src, length );
  //   // }
  //   // else if( arguments.length === 1 )
  //   // {
  //   //   _.assert( _.number.is( src ) || _.long.is( src ) || src === null );
  //   //   return this._makeUndefined( src );
  //   // }
  //   // else
  //   // {
  //   //   return [];
  //   // }
  // }

  //

  function _makeZeroed( src, length )
  {
    if( length === undefined )
    length = src;
    if( this.like( length ) )
    length = length.length;
    return new this.InstanceConstructor( length );
  }

  //

  function _makeFilling( type, value, length )
  {
    if( arguments.length === 2 )
    {
      value = arguments[ 0 ];
      length = arguments[ 1 ];
      if( _.longIs( length ) )
      {
        if( _.argumentsArray.is( length ) )
        type = length;
        else if( _.number.is( length ) )
        type = null;
        else
        type = length;
      }
      else
      {
        type = null;
      }
    }

    if( _.longIs( length ) )
    length = length.length;

    let result = this._make( type, length );
    for( let i = 0 ; i < length ; i++ )
    result[ i ] = value;

    return result;
  }

  //

  function makeFilling( type, value, length )
  {
    _.assert( arguments.length === 2 || arguments.length === 3 );

    if( arguments.length === 2 )
    {
      _.assert( _.number.is( value ) || _.countable.is( value ) );
      _.assert( type !== undefined );
    }
    else
    {
      _.assert( value !== undefined );
      _.assert( _.number.is( length ) || _.countable.is( length ) );
      _.assert( type === null || _.routine.is( type ) || _.longIs( type ) );
    }

    return this._makeFilling( ... arguments );
  }

  //

  function _make( src, length )
  {
    if( arguments.length === 2 )
    {
      let data = length;
      if( _.number.is( length ) )
      data = src;
      if( _.countable.is( length ) )
      length = length.length;
      return fill( new this.InstanceConstructor( length ), data );
    }
    else if( arguments.length === 1 )
    {
      return new this.InstanceConstructor( src );
    }
    return new this.InstanceConstructor( 0 );

  /* */

  function fill( dst, data )
  {
    if( data === null || data === undefined )
    return dst;
    let l = Math.min( length, data.length );
    for( let i = 0 ; i < l ; i++ )
    dst[ i ] = data[ i ];
    return dst;
  }

    // if( _.numberIs( length ) )
    // return new this.InstanceConstructor( length );
    // if( _.numberIs( src ) )
    // return new this.InstanceConstructor( src );
    // if( src )
    // return new this.InstanceConstructor( src );
    // return new this.InstanceConstructor( 0 );
  }

  //

  // function make( src, length )
  // {
  //   _.assert( arguments.length === 0 || src === null || _.countable.is( src ) || _.numberIs( src ) );
  //   _.assert( length === undefined || !_.number.is( src ) || !_.number.is( length ) );
  //   // _.assert( arguments.length < 2 || _.number.is( length ) );
  //   _.assert( arguments.length < 2 || _.number.is( length ) || _.countable.is( length ) );
  //   _.assert( arguments.length <= 2 );
  //   return this._make( ... arguments );
  // }

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
    [ fo.name + 'MakeUndefined' ] : _.argumentsArray.makeUndefined.bind( _[ fo.name ] ),
    // [ fo.name + 'MakeUndefined' ] : makeUndefined.bind( _[ fo.name ] ),
    [ fo.name + 'Make' ] : _.argumentsArray.make.bind( _[ fo.name ] ),
    // [ fo.name + 'Make' ] : make.bind( _[ fo.name ] ),
    [ fo.name + 'CloneShallow' ] : cloneShallow.bind( _[ fo.name ] ),
    [ fo.name + 'From' ] : from.bind( _[ fo.name ] ),

  }

  Object.assign( _, ToolsExtension );

  //

  let BufferTypedExtension =
  {

    //

    NamespaceName : fo.name,
    NamespaceQname : `wTools/${fo.name}`,
    MoreGeneralNamespaceName : 'bufferTyped',
    MostGeneralNamespaceName : 'countable',
    TypeName : fo.typeName,
    SecondTypeName : fo.secondTypeName,
    InstanceConstructor : fo.instanceConstructor,
    IsFixedLength : true,
    IsTyped : true,
    tools : _,

    // dichotomy

    is,
    like,

    // maker

    _makeEmpty,
    makeEmpty, /* qqq : for junior : cover */
    _makeUndefined,
    makeUndefined : _.argumentsArray.makeUndefined, /* qqq : for junior : cover */
    _makeZeroed,
    makeZeroed : _.argumentsArray.makeUndefined,
    // makeZeroed : makeUndefined,
    _makeFilling,
    makeFilling,
    _make,
    make : _.argumentsArray.make, /* qqq : for junior : cover */
    // make, /* qqq : for junior : cover */
    _cloneShallow,
    cloneShallow, /* qqq : for junior : cover */
    from, /* qqq : for junior : cover */

  }

  //

  Object.assign( _[ fo.name ], BufferTypedExtension );
  _.bufferTyped._namespaceRegister( _[ fo.name ] );

}

_functor({ name : 'u32x', typeName : 'U32x', secondTypeName : 'Uint32Array', instanceConstructor : U32x });
_functor({ name : 'u16x', typeName : 'U16x', secondTypeName : 'Uint16Array', instanceConstructor : U16x });
_functor({ name : 'u8x', typeName : 'U8x', secondTypeName : 'Uint8Array', instanceConstructor : U8x });
_functor({ name : 'u8xClamped', typeName : 'U8xClamped', secondTypeName : 'Uint8ClampedArray', instanceConstructor : U8xClamped });
_functor({ name : 'ux', typeName : 'Ux', secondTypeName : 'Uint32Array', instanceConstructor : Ux });

_functor({ name : 'i32x', typeName : 'I32x', secondTypeName : 'Int32Array', instanceConstructor : I32x });
_functor({ name : 'i16x', typeName : 'I16x', secondTypeName : 'Int16Array', instanceConstructor : I16x });
_functor({ name : 'i8x', typeName : 'I8x', secondTypeName : 'Int8Array', instanceConstructor : I8x });
_functor({ name : 'ix', typeName : 'Ix', secondTypeName : 'Int32Array', instanceConstructor : Ix });

_functor({ name : 'f64x', typeName : 'F64x', secondTypeName : 'Float64Array', instanceConstructor : F64x });
_functor({ name : 'f32x', typeName : 'F32x', secondTypeName : 'Float32Array', instanceConstructor : F32x });
_functor({ name : 'fx', typeName : 'Fx', secondTypeName : 'Float32Array', instanceConstructor : Fx });

_.assert( !_.defaultBufferTyped );
_.assert( !!_.fx );
_.defaultBufferTyped = _.fx;

})();
