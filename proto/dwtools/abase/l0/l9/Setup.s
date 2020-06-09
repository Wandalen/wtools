(function _Setup_s_() {

'use strict';

let _global = _global_;
let _ = _global.wTools;
let Self = _global.wTools.setup = _global.wTools.setup || Object.create( null );

// --
// setup
// --

function _errUncaughtHandler2( err, kind )
{
  if( !kind )
  kind = 'uncaught error';
  let prefix = `--------------- ${kind} --------------->\n`;
  let postfix = `--------------- ${kind} ---------------<\n`;
  let logger = _global.logger || _global.console;

  /* xxx qqq : resolve issue in browser
    if file has syntax error then unachught error should not ( probably ) be throwen
    because browser thows uncontrolled information about syntax error after that
    avoid duplication of errors in log
  */

  if( _.errIsAttended( err ) )
  return;

  // debugger;

  /* */

  consoleUnbar();
  attend( err );

  console.error( prefix );

  errLogFields();
  errLog();

  console.error( postfix );

  processExit();

  /* */

  function consoleUnbar()
  {
    try
    {
      if( _.Logger && _.Logger.ConsoleBar && _.Logger.ConsoleIsBarred( console ) )
      _.Logger.ConsoleBar({ on : 0 });
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }
  }

  /* */

  function errLog()
  {
    try
    {
      err = _.errProcess( err );
      if( _.errLog )
      _.errLog( err );
      else
      console.error( err );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
      console.error( err );
    }
  }

  /* */

  function errLogFields()
  {
    if( !err.originalMessage && _.objectLike && _.objectLike( err ) )
    try
    {
      let serr = _.toStr && _.field ? _.toStr.fields( err, { errorAsMap : 1 } ) : err;
      console.error( serr );
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }
  }

  /* */

  function attend( err )
  {
    try
    {
      _.errProcess( err );
      if( _.errIsAttended( err ) )
      return
    }
    catch( err2 )
    {
      debugger;
      console.error( err2 );
    }
  }

  /* */

  function processExit()
  {
    if( _.process && _.process.exit )
    try
    {
      _.process.exitCode( -1 );
      _.process.exitReason( err );
      _.process.exit();
    }
    catch( err2 )
    {
      debugger;
      console.log( err2 );
    }
    else
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

function _setupUncaughtErrorHandler9()
{

  if( !_global._setupUncaughtErrorHandlerDone )
  {
    debugger;
    throw Error( 'setup0 should be called first' );
  }

  if( _global._setupUncaughtErrorHandlerDone > 1 )
  return;

  _global._setupUncaughtErrorHandlerDone = 2;

  /* */

  if( _global.process && _.routineIs( _global.process.on ) )
  {
    _.setup._errUncaughtPre = _errPreNode;
  }
  else if( Object.hasOwnProperty.call( _global, 'onerror' ) )
  {
    _.setup._errUncaughtPre = _errPreBrowser;
  }

  /* */

  function _errPreBrowser( args )
  {
    let [ message, sourcePath, lineno, colno, error ] = args;
    let err = error || message;

    if( _._err )
    err = _._err
    ({
      args : [ error || message ],
      level : 1,
      fallBackStack : 'at handleError @ ' + sourcePath + ':' + lineno,
      throwLocation :
      {
        filePath : sourcePath,
        line : lineno,
        col : colno,
      },
    });

    return [ err ];
  }

  /* */

  function _errPreNode( args )
  {
    return [ args[ 0 ] ];
  }

  /* */

}

//

function _setupConfig()
{

  if( _global.__GLOBAL_WHICH__ !== 'real' )
  return;

  if( !_global.Config )
  _global.Config = Object.create( null );

  if( _global.Config.debug === undefined )
  _global.Config.debug = true;

  _global.Config.debug = !!_global.Config.debug;

}

//

function _setupLoggerPlaceholder()
{

  if( !_global.console.debug )
  _global.console.debug = function debug()
  {
    this.log.apply( this,arguments );
  }

  if( !_global.logger )
  _global.logger =
  {
    log : function log() { console.log.apply( console,arguments ); },
    logUp : function logUp() { console.log.apply( console,arguments ); },
    logDown : function logDown() { console.log.apply( console,arguments ); },
    error : function error() { console.error.apply( console,arguments ); },
    errorUp : function errorUp() { console.error.apply( console,arguments ); },
    errorDown : function errorDown() { console.error.apply( console,arguments ); },
  }

}

//

function _setupTesterPlaceholder()
{

  if( !_global.wTestSuite )
  _global.wTestSuite = function wTestSuite( testSuit )
  {

    if( !_realGlobal_.wTests )
    _realGlobal_.wTests = Object.create( null );

    if( !testSuit.suiteFilePath )
    testSuit.suiteFilePath = _.introspector.location( 1 ).filePath;

    if( !testSuit.suiteFileLocation )
    testSuit.suiteFileLocation = _.introspector.location( 1 ).fileNameLineCol;

    _.assert( _.strDefined( testSuit.suiteFileLocation ),'Test suit expects a mandatory option ( suiteFileLocation )' );
    _.assert( _.objectIs( testSuit ) );

    if( !testSuit.abstract )
    _.assert( !_realGlobal_.wTests[ testSuit.name ],'Test suit with name "' + testSuit.name + '" already registered!' );
    _realGlobal_.wTests[ testSuit.name ] = testSuit;

    testSuit.inherit = function inherit()
    {
      this.inherit = _.longSlice( arguments );
    }

    return testSuit;
  }

  /* */

  if( !_realGlobal_.wTester )
  {
    _realGlobal_.wTester = Object.create( null );
    _realGlobal_.wTester.test = function test( testSuitName )
    {
      if( _.workerIs() ) /* xxx : temp */
      return;
      if( Config.interpreter !== 'njs' ) /* xxx : temp. remove aster fixing starter */
      return;
      _.assert( arguments.length === 0 || arguments.length === 1 );
      _.assert( _.strIs( testSuitName ) || testSuitName === undefined, 'test : expects string {-testSuitName-}' );
      debugger;
      _.time.ready( function()
      {
        debugger;
        if( _realGlobal_.wTester.test === test )
        throw _.err( 'Cant wTesting.test, missing wTesting package' );
        _realGlobal_.wTester.test.call( _realGlobal_.wTester, testSuitName );
      });
    }
  }

}

//

function _setupProcedure()
{

  if( _realGlobal_ !== _global && _realGlobal_.wTools && _realGlobal_.wTools.setup && _realGlobal_.wTools.setup._entryProcedureStack )
  Self._entryProcedureStack =  _realGlobal_.wTools.setup._entryProcedureStack;

  if( Self._entryProcedureStack )
  return;

  let stack = _.introspector.stack().split( '\n' );
  for( let s = stack.length-1 ; s >= 0 ; s-- )
  {
    let call = stack[ s ];
    let location = _.introspector.locationFromStackFrame( call );
    if( !location.internal )
    {
      stack.splice( s+1, stack.length );
      stack.splice( 0, s );
      break;
    }
  }

  Self._entryProcedureStack = stack.join( '\n' );
}

//

function _Setup9()
{

  _.assert( _global._WTOOLS_SETUP_EXPECTED_ !== false );

  if( _global._WTOOLS_SETUP_EXPECTED_ !== false )
  {
    _.setup._setupConfig();
    _.setup._setupUncaughtErrorHandler9();
    _.setup._setupLoggerPlaceholder();
    _.setup._setupTesterPlaceholder();
    _.setup._setupProcedure();
  }

  _.assert( !!_.time && !!_.time.now );

  _.setup.startTime = _.time.now();

}

// --
// routines
// --

let Extension =
{

  _errUncaughtHandler2,
  _setupUncaughtErrorHandler9,

  _setupConfig,
  _setupLoggerPlaceholder,
  _setupTesterPlaceholder,
  _setupProcedure,

  _Setup9,

  //

  startTime : null,
  _entryProcedureStack : null,

}

Object.assign( Self, Extension );
Self._Setup9();

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
