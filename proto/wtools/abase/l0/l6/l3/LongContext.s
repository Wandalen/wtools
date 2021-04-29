// ( function _LongContext_s_()
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
// function applyTo( dst, def )
// {
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( !!_.LongDescriptors[ def ] );
//
//   dst.withLong = Object.create( null ); /* xxx */
//
//   for( let d in _.LongDescriptors )
//   {
//     let context = dst.withLong[ d ] = Object.create( dst );
//     context.longDescriptor = _.LongDescriptors[ d ];
//     context.argumentsArray = Object.create( context.argumentsArray );
//     context.argumentsArray.tools = context;
//     context.array = Object.create( context.array );
//     context.array.tools = context;
//     context.long = Object.create( context.long );
//     context.long.tools = context;
//     context.unroll = Object.create( context.unroll );
//     context.unroll.tools = context;
//   }
//
//   dst.longDescriptor = _.LongDescriptors[ def ];
//   dst.argumentsArray.tools = dst;
//   dst.array.tools = dst;
//   dst.long.tools = dst;
//   dst.unroll.tools = dst;
//
//   _.assert( _.mapIs( dst.longDescriptor ) );
//
// }
//
// // --
// // delcare
// // --
//
// let longDescriptorProducer =
// {
//   applyTo,
// }
//
// _.longDescriptorProducer = _.longDescriptorProducer || Object.create( null );
// _.props.extend( _.longDescriptorProducer, longDescriptorProducer );
//
// let LongContext = Object.create( null ); /* xxx : ? */
// let ToolsExtension =
// {
//   LongContext,
// }
//
// _.props.extend( _, ToolsExtension );
//
// // --
// //
// // --
//
// /**
//  * @summary Array namespace
//  * @namespace wTools.defaultLong
//  * @extends Tools
//  * @namespace Tools
//  */
//
// _.assert( !_.Array );
// _.assert( !_.defaultLong );
// _.assert( !_.withLong );
//
// _.longDescriptorProducer.applyTo( _, 'Array' );
//
// _.assert( !_.Array );
// _.assert( _.object.isBasic( _.withLong ) );
// _.assert( !_.defaultLong );
//
// _.assert( _.longDescriptorProducer );
// _.assert( _.LongDescriptors );
// _.assert( _.longDescriptor );
//
// _.assert( _.defaultLong.name === 'Array' );
// _.assert( _.long.tools === _ );
//
// })();
