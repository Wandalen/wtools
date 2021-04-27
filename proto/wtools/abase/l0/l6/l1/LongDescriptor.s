// ( function _LongDescriptor_s_()
// {
//
// 'use strict';
//
// const _global = _global_;
// const _ = _global.wTools;
// const Self = _global.wTools;
//
// _.assert( !_.Array );
// _.assert( !_.defaultLong );
// _.assert( !_.withLong );
//
// // --
// //
// // --
//
// function is_functor( name, cls )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.routine.is( cls ) );
//   _.assert( _.strDefined( cls.name ) );
//   let r =
//   {
//     [ name ] : function( src )
//     {
//       _.assert( arguments.length === 1 );
//       return src instanceof cls;
//     }
//   }
//   return r[ name ];
// }
//
// //
//
// function make_functor( name, cls )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.routine.is( cls ) );
//   _.assert( _.strDefined( cls.name ) );
//   let r =
//   {
//     [ name ] : function()
//     {
//       return new cls( ... arguments );
//     }
//   }
//   return r[ name ];
// }
//
// //
//
// function from_functor( name, cls )
// {
//   _.assert( arguments.length === 2 );
//   _.assert( _.routine.is( cls ) );
//   _.assert( _.strDefined( cls.name ) );
//   let r =
//   {
//     [ name ] : function( src )
//     {
//       _.assert( arguments.length === 0 || arguments.length === 1 );
//       if( src === undefined )
//       return new cls()
//       if( src instanceof cls )
//       return src;
//       return new cls( src );
//     }
//   }
//   return r[ name ];
// }
//
// //
//
// function _longDeclare( o )
// {
//
//   o = Object.assign( Object.create( null ), o );
//   for( let k in _longDeclare.defaults )
//   if( !( k in o ) )
//   o[ k ] = _longDeclare.defaults[ k ];
//
//   _.assert( _.strDefined( o.name ) );
//   _.assert( _.strDefined( o.secondName ) || o.secondName === null );
//   _.assert( _.strDefined( o.aliasName ) || o.aliasName === null );
//   _.assert( _.routine.is( o.type ) );
//   _.assert( _.routine.is( o.make ) || o.make === null );
//   _.assert( _.routine.is( o.from ) || o.from === null );
//   _.assert( _.routine.is( o.is ) || o.make === null );
//   _.assert( _.bool.is( o.isTyped ) );
//   _.assert( LongDescriptors[ o.name ] === undefined );
//
//   if( !o.is )
//   o.is = is_functor( o.name, o.type );
//
//   if( !o.make )
//   o.make = make_functor( o.name, o.type );
//
//   if( !o.from )
//   o.from = from_functor( o.name, o.type );
//
//   Object.freeze( o );
//   LongDescriptors[ o.name ] = o;
//   if( !LongTypeToDescriptorsHash.get( o.type ) )
//   LongTypeToDescriptorsHash.set( o.type, o );
//
//   return o;
// }
//
// _longDeclare.defaults =
// {
//   name : null,
//   secondName : null,
//   aliasName : null,
//   type : null,
//   make : null,
//   from : null,
//   is : null,
//   isTyped : null,
// }
//
// //
//
// let LongTypeToDescriptorsHash = new HashMap();
// let LongDescriptors = Object.create( null );
//
// _.assert( _.routine.is( _.array.make ) );
// _.assert( _.routine.is( _.unroll.make ) );
// _.assert( _.routine.is( _.argumentsArray.make ) );
//
// _longDeclare
// ({
//   name : 'Array',
//   type : Array,
//   namespace : _.array,
//   make : _.routine.join( _.array, _.array.make ),
//   from : _.routine.join( _.array, _.array.from ),
//   is : _.routine.join( _.array, _.array.is ),
//   isTyped : false,
// });
//
// _longDeclare
// ({
//   name : 'Unroll',
//   type : null,
//   namespace : _.unroll,
//   make : _.routine.join( _.unroll, _.unroll.make ),
//   from : _.routine.join( _.unroll, _.unroll.from ),
//   is : _.routine.join( _.unroll, _.unroll.is ),
//   isTyped : false,
// });
//
// _longDeclare
// ({
//   name : 'ArgumentsArray',
//   secondName : 'Arguments',
//   namespace : _.argumentsArray,
//   // type : _.argumentsArray.make().constructor,
//   type : null,
//   make : _.routine.join( _.argumentsArray, _.argumentsArray.make ),
//   from : _.routine.join( _.argumentsArray, _.argumentsArray.from ),
//   is : _.routine.join( _.argumentsArray, _.argumentsArray.is ),
//   isTyped : false,
// });
//
// /* xxx : review */
// _longDeclare({ name : 'U32x', secondName : 'Uint32', type : _global.U32x, isTyped : true });
// _longDeclare({ name : 'U16x', secondName : 'Uint16', type : _global.U16x, isTyped : true });
// _longDeclare({ name : 'U8x', secondName : 'Uint8', type : _global.U8x, isTyped : true });
// _longDeclare({ name : 'Ux', secondName : 'Uint32', aliasName : 'U32x', type : _global.Ux, isTyped : true });
//
// _longDeclare({ name : 'I32x', secondName : 'Int32', type : _global.I32x, isTyped : true });
// _longDeclare({ name : 'I16x', secondName : 'Int16', type : _global.I16x, isTyped : true });
// _longDeclare({ name : 'I8x', secondName : 'Int8', type : _global.I8x, isTyped : true });
// _longDeclare({ name : 'Ix', secondName : 'Int32', aliasName : 'I32x', type : _global.Ix, isTyped : true });
//
// _longDeclare({ name : 'F32x', secondName : 'Float32', type : _global.F32x, isTyped : true });
// _longDeclare({ name : 'F64x', secondName : 'Float64', type : _global.F64x, isTyped : true });
// _longDeclare({ name : 'Fx', secondName : 'Float32', aliasName : 'F32x', type : _global.Fx, isTyped : true });
//
// //
//
// let longDescriptorProducer =
// {
//   _longDeclare,
//   LongDescriptors,
//   LongTypeToDescriptorsHash,
// }
//
// _.longDescriptorProducer = _.longDescriptorProducer || Object.create( null );
// _.props.extend( _.longDescriptorProducer, longDescriptorProducer );
//
// let ToolsExtension =
// {
//   LongDescriptors,
//   LongTypeToDescriptorsHash,
// }
//
// _.props.extend( _, ToolsExtension );
//
// // --
// //
// // --
//
// _.assert( !_.Array );
// _.assert( !_.defaultLong );
// _.assert( !_.withLong );
// _.assert( !_.Array );
// _.assert( !_.defaultLong );
//
// })();
