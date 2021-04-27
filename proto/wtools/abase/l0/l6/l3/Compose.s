( function _Compose_s_()
{

'use strict'; /* xxx : deprecate? */

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools.compose = _global_.wTools.compose || Object.create( null );

// --
// chainer
// --

function originaChainer( /* args, result, op, k */ )
{
  let args = arguments[ 0 ];
  let result = arguments[ 1 ];
  let op = arguments[ 2 ];
  let k = arguments[ 3 ];

  _.assert( result !== false );
  return args;
}

//

function originalWithDontChainer( /* args, result, op, k */ )
{
  let args = arguments[ 0 ];
  let result = arguments[ 1 ];
  let op = arguments[ 2 ];
  let k = arguments[ 3 ];

  _.assert( result !== false );
  if( result === _.dont )
  return _.dont;
  return args;
}

//

function composeAllChainer( /* args, result, op, k */ )
{
  let args = arguments[ 0 ];
  let result = arguments[ 1 ];
  let op = arguments[ 2 ];
  let k = arguments[ 3 ];

  _.assert( result !== false );
  if( result === _.dont )
  return _.dont;
  return args;
}

//

function chainingChainer( /* args, result, op, k */ )
{
  let args = arguments[ 0 ];
  let result = arguments[ 1 ];
  let op = arguments[ 2 ];
  let k = arguments[ 3 ];

  _.assert( result !== false );
  if( result === undefined )
  return args;
  if( result === _.dont )
  return _.dont;
  return _.unroll.from( result );
}

// --
// supervisor
// --

function returningLastSupervisor( /* self, args, act, op */ )
{
  let self = arguments[ 0 ];
  let args = arguments[ 1 ];
  let act = arguments[ 2 ];
  let op = arguments[ 3 ];

  let result = act.apply( self, args );
  return result[ result.length-1 ];
}

//

function composeAllSupervisor( /* self, args, act, op */ )
{
  let self = arguments[ 0 ];
  let args = arguments[ 1 ];
  let act = arguments[ 2 ];
  let op = arguments[ 3 ];

  let result = act.apply( self, args );
  _.assert( !!result );
  if( !result.length )
  return result;
  if( result[ result.length-1 ] === _.dont )
  return false;
  if( !_.all( result ) )
  return false;
  return result;
}

//

function chainingSupervisor( /* self, args, act, op */ )
{
  let self = arguments[ 0 ];
  let args = arguments[ 1 ];
  let act = arguments[ 2 ];
  let op = arguments[ 3 ];

  let result = act.apply( self, args );
  if( result[ result.length-1 ] === _.dont )
  result.pop();
  return result;
}

// --
// declare
// --

let chainer =
{
  original : originaChainer,
  originalWithDont : originalWithDontChainer,
  composeAll : composeAllChainer,
  chaining : chainingChainer,
}

let supervisor =
{
  returningLast : returningLastSupervisor,
  composeAll : composeAllSupervisor,
  chaining : chainingSupervisor,
}

// --
// extend
// --

let Extension =
{

  chainer,
  supervisor

}

Object.assign( Self, Extension );
/* xxx : qqq : remove */

})();
