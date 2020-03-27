(function _Setup_s_() {

'use strict';

let _global = _global_;
let _realGlobal = _global._realGlobal_
let _ = _global.wTools;
let Self = _global.wTools.setup = _global.wTools.setup || Object.create( null );

// --
// setup
// --

function _errUncaughtHandler1()
{

  // debugger;
  // if( typeof _starter_ === 'undefined' )
  // debugger;
  // starter._includingSource

  let args = _.setup._errUncaughtPre( arguments );
  let result = _.setup._errUncaughtHandler2.apply( this, args );

  if( _.setup._errUncaughtHandler0 )
  _.setup._errUncaughtHandler0.apply( this, arguments );

  return result;
}

//

function _errUncaughtHandler2( err, kind )
{
  if( !kind )
  kind = 'uncaught error';
  let prefix = `--------------- ${kind} --------------->\n`;
  let postfix = `--------------- ${kind} ---------------<\n`;
  let errStr = err.toString();

  try
  {
    errStr = err.toString();
  }
  catch( err2 )
  {
    debugger;
    console.error( err2 );
  }

  console.error( prefix );
  console.error( errStr );
  console.error( err ? err.stack : '' );
  console.error( postfix );

  processExit();

  /* */

  function processExit()
  {
    try
    {
      if( _global.process )
      {
        if( !process.exitCode )
        process.exitCode = -1;
      }
    }
    catch( err )
    {
    }
  }

}

//

function _setupUncaughtErrorHandler2()
{

  if( _global._setupUncaughtErrorHandlerDone )
  return;

  _global._setupUncaughtErrorHandlerDone = 1;

  _.setup._errUncaughtHandler1 = _errUncaughtHandler1;
  if( _global.process && typeof _global.process.on === 'function' )
  {
    _global.process.on( 'uncaughtException', _.setup._errUncaughtHandler1 );
    _.setup._errUncaughtPre = _errPreNode;
  }
  else if( Object.hasOwnProperty.call( _global, 'onerror' ) )
  {
    _.setup._errUncaughtHandler0 = _global.onerror;
    _global.onerror = _.setup._errUncaughtHandler1;
    _.setup._errUncaughtPre = _errPreBrowser;
  }

  /* */

  function _errPreBrowser( args )
  {
    return [ new Error( args[ 0 ] ) ];
  }

  /* */

  function _errPreNode( args )
  {
    return args;
  }

  /* */

}

//

function _Setup2()
{

  _.process = _.process || Object.create( null );

  _.setup._setupUncaughtErrorHandler2();

}

// --
// extend
// --

let Fields =
{

  _setupUncaughtErrorHandlerDone : 0,

}

let Routines =
{

  _errUncaughtPre : null,
  _errUncaughtHandler0 : null,
  _errUncaughtHandler1,
  _errUncaughtHandler2,
  _setupUncaughtErrorHandler2,
  _Setup2,

}

Object.assign( Self, Fields );
Object.assign( Self, Routines );

Self._Setup2();

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
