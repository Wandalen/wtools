( function _fTime_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.time = _global_.wTools.time || Object.create( null );

// --
// implementation
// --

let _TimeInfinity = Math.pow( 2, 31 )-1;
function _begin( delay, onTime, onCancel )
{
  let original;

  if( delay === undefined )
  delay = Infinity;
  if( delay >= _TimeInfinity )
  delay = _TimeInfinity;

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( _.numberIs( delay ) );
  _.assert( _.routineIs( onTime ) || onTime === undefined || onTime === null );

  if( delay > 0 )
  original = setTimeout( time, delay );
  else
  original = soon( timeNonCancelable ) || null;

  let timer = Object.create( null );
  timer.onTime = onTime;
  timer.onCancel = onCancel;
  timer._time = _time;
  timer._cancel = _cancel;
  timer.time = original === null ? timeNonCancelable : time;
  timer.cancel = cancel;
  timer.state = 0;
  timer.kind = _begin;
  timer.type = 'timer';
  timer.original = original;
  return timer;

  /* */

  function _time()
  {
    timer.state = 1;
    try
    {
      if( onTime )
      timer.result = onTime( timer );
    }
    finally
    {
      _.assert( timer.state === 1 );
      timer.state = 2;
    }
  }

  /* */

  function _cancel()
  {
    if( timer.state !== 0 )
    return;
    timer.state = -1;
    clearTimeout( timer.original );
    try
    {
      if( onCancel )
      timer.result = onCancel( timer );
    }
    finally
    {
      _.assert( timer.state === -1 );
      timer.state = -2;
    }
  }

  /* */

  function timeNonCancelable()
  {
    if( timer.state !== 0 )
    return;
    return time.call( this, arguments );
  }

  /* */

  function time()
  {
    return timer._time();
  }

  /* */

  function cancel()
  {
    return timer._cancel();
  }

}

//

function _finally( delay, onTime )
{
  _.assert( arguments.length === 2 );
  let timer = _.time._begin( delay, onTime, onTime );
  return timer;
}

//

function _periodic( delay, onTime, onCancel )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects exactly two arguments' );
  _.assert( _.numberIs( delay ) );
  _.assert( _.routineIs( onTime ) );

  let original = setInterval( time, delay );

  let timer = Object.create( null );
  timer.onTime = onTime;
  timer.onCancel = onCancel;
  timer._time = _time;
  timer._cancel = _cancel;
  timer.time = time;
  timer.cancel = cancel;
  timer.state = 0;
  // timer.kind = 'periodic';
  timer.type = 'timer';
  timer.kind = _periodic;
  timer.original = original;
  return timer;

  /* */

  function _time()
  {
    timer.state = 1;
  //   if( r === _.dont )
  //   _.time.cancel( timer );
    try
    {
      if( onTime )
      timer.result = onTime( timer );
    }
    finally
    {
      timer.state = 2;
    }
  }

  /* */

  function _cancel()
  {
    timer.state = -1;
    clearInterval( timer.original );
    try
    {
      if( onCancel )
      timer.result = onCancel( timer );
    }
    finally
    {
      timer.state = -2;
    }
  }

  /* */

  function time()
  {
    return timer._time();
  }

  /* */

  function cancel()
  {
    return timer._cancel();
  }

  /* */

  // function time()
  // {
  //   let r = onTime( r );
  //   if( r === _.dont )
  //   _.time.cancel( timer );
  // }
  //
  // function cancel()
  // {
  //   timer.state = -1;
  //   clearInterval( timer.original );
  //   if( onCancel )
  //   onCancel( r );
  // }

}

//

function _cancel( timer )
{
  _.assert( _.timerIs( timer ) );

  // if( timer.kind === 'finallable' || timer.kind === 'cancelable' )
  // clearTimeout( timer.original );
  // else
  // clearInterval( timer.original );

  timer.cancel();

  // if( timer && timer.state === 0 )
  // {
  //   if( timer.kind === 'finallable' )
  //   {
  //     timer.state = 2;
  //     timer.result = timer.onTime();
  //   }
  //   else
  //   {
  //     timer.state = -1;
  //   }
  // }

  return timer;
}

//

function timerIsBegun( timer )
{
  debugger;
  _.assert( _.timerIs( timer ) );
  return timer.state === 0;
}

//

function timerIsCancelBegun( timer )
{
  if( timer.state === -1 )
  debugger;
  _.assert( _.timerIs( timer ) );
  return timer.state === -1;
}

//

function timerIsCancelEnded( timer )
{
  debugger;
  _.assert( _.timerIs( timer ) );
  return timer.state === -2;
}

//

function timerIsUpBegun( timer )
{
  debugger;
  _.assert( _.timerIs( timer ) );
  return timer.state === 1;
}

//

function timerIsUpEnded( timer )
{
  debugger;
  _.assert( _.timerIs( timer ) );
  return timer.state === 2;
}

//

let soon = typeof process === 'undefined' ? function( h ){ return setTimeout( h, 0 ) } : process.nextTick;

//

function begin( delay, procedure, onTime, onCancel )
{
  if( !_.procedureIs( procedure ) )
  {
    onTime = arguments[ 1 ];
    onCancel = arguments[ 2 ]
  }
  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
  return this._begin( delay, onTime, onCancel );
}

//

function finally_( delay, procedure, onTime )
{
  if( arguments.length === 2 )
  if( !_.procedureIs( procedure ) )
  onTime = arguments[ 1 ];
  _.assert( arguments.length === 2 || arguments.length === 3 );
  return this._finally( delay, onTime );
}

//

function periodic( delay, procedure, onTime, onCancel )
{
  if( !_.procedureIs( procedure ) )
  {
    onTime = arguments[ 1 ];
    onCancel = arguments[ 2 ]
  }
  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4 );
  return this._periodic( delay, onTime, onCancel );
}

//

function cancel( timer )
{
  return _.time._cancel( ... arguments );
}

//

function now_functor()
{
  let now;

  if( typeof performance !== 'undefined' && performance.now !== undefined )
  now = _.routineJoin( performance, performance.now );
  else if( Date.now )
  now = _.routineJoin( Date, Date.now );
  else
  now = function(){ return Date().getTime() };

  return now;
}

//

function from( time )
{

  _.assert( arguments.length === 1 );

  if( _.numberIs( time ) )
  {
    return time;
  }
  if( _.dateIs( time ) )
  {
    return time.getTime();
  }
  if( _.strIs( time ) )
  {
    let time = Date.parse( time );
    if( !isNaN( time ) )
    return time;
    else
    _.assert( 0, 'Wrong time format' );
  }
  _.assert( 0, 'Not clear how to coerce to time', _.strType( time ) );
}

//

function spent( description, time )
{
  let now = _.time.now();

  if( arguments.length === 1 )
  {
    time = arguments[ 0 ];
    description = '';
  }

  _.assert( 1 <= arguments.length && arguments.length <= 2 );
  _.assert( _.numberIs( time ) );
  _.assert( _.strIs( description ) );

  // if( description && description !== ' ' )
  // description = description;

  let result = description + _.time.spentFormat( now-time );

  return result;
}

//

function spentFormat( spent )
{
  let now = _.time.now();

  _.assert( 1 === arguments.length );
  _.assert( _.numberIs( spent ) );

  let result = ( 0.001*( spent ) ).toFixed( 3 ) + 's';

  return result;
}

//

function dateToStr( date )
{
  let y = date.getFullYear();
  let m = date.getMonth() + 1;
  let d = date.getDate();
  if( m < 10 ) m = '0' + m;
  if( d < 10 ) d = '0' + d;
  let result = [ y, m, d ].join( '.' );
  return result;
}

// --
// extension
// --

let Extension =
{

  _begin,
  _finally,
  _periodic,
  _cancel,

  timerIsBegun,
  timerIsCancelBegun,
  timerIsCancelEnded,
  timerIsUpBegun,
  timerIsUpEnded,

  soon,
  begin,
  finally : finally_,
  periodic,
  cancel,

  now_functor,
  now : now_functor(),

  from,
  spent,
  spentFormat,

  dateToStr,

}

//

_.mapSupplement( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = _;

})();
