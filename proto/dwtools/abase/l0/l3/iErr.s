( function _iErr_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// _.err = _.err || Object.create( null );

// --
// error
// --

function errIs( src )
{
  return src instanceof Error || Object.prototype.toString.call( src ) === '[object Error]';
}

//

function errIsStandard( src )
{
  if( !_.errIs( src ) )
  return false;
  return src.originalMessage !== undefined;
}

//

function errIsAttended( src )
{
  if( !_.errIs( src ) )
  return false;
  return !!src.attended;
}

//

function errIsLogged( src )
{
  if( _.errIs( src ) === false )
  return false;
  return !!src.logged;
}

//

function errIsSuspended( src )
{
  if( _.errIs( src ) === false )
  return false;
  return !!src.suspended;
}

//

function errIsBrief( src )
{
  if( !_.errIs( src ) )
  return false;
  return !!src.brief;
}

//

function errIsProcess( src )
{
  if( !_.errIs( src ) )
  return false;
  return !!src.isProcess;
}

//

function errReason( err, reason )
{

  if( arguments.length === 1 )
  {
    return err.reason;
  }
  else if( arguments.length === 2 )
  {
    nonenumerable( 'reason', reason );
    return err.reason;
  }

  throw Error( 'Expects one or two argument' );

  /* */

  function nonenumerable( fieldName, value )
  {
    try
    {
      Object.defineProperty( err, fieldName,
      {
        enumerable : false,
        configurable : true,
        writable : true,
        value : value,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
      debugger;
    }
  }

}

//

function errOriginalMessage( err )
{

  if( arguments.length !== 1 )
  throw Error( 'errOriginalMessage : Expects single argument' );

  if( _.strIs( err ) )
  return err;

  if( !err )
  return;

  if( err.originalMessage )
  return err.originalMessage;

  let message = err.message;

  if( !message && message !== '' )
  message = err.msg;
  if( !message && message !== '' )
  message = err.name;

  if( _.mapFields )
  {
    let fields = _.mapFields( err );
    if( Object.keys( fields ).length )
    message += '\n' + _.toStr( fields, { wrap : 0, multiline : 1, levels : 2 } );
  }

  return message;
}

//

function errOriginalStack( err )
{

  if( arguments.length !== 1 )
  throw Error( 'errOriginalStack : Expects single argument' );

  if( !_.errIs( err ) )
  throw Error( 'errOriginalStack : Expects error' );

  if( err.throwenCallsStack )
  return err.throwenCallsStack;

  if( err.callsStack )
  return err.callsStack;

  if( err[ stackSymbol ] )
  return err[ stackSymbol ];

  if( err.stack )
  return _.introspector.stack( err.stack );

  /* should return null if nothing found */
  return null;
}

//

/**
 * Creates Error object based on passed options.
 * Result error contains in message detailed stack trace and error description.
 * @param {Object} o Options for creating error.
 * @param {String[]|Error[]} o.args array with messages or errors objects, from which will be created Error obj.
 * @param {number} [o.level] using for specifying in error message on which level of stack trace was caught error.
 * @returns {Error} Result Error. If in `o.args` passed Error object, result will be reference to it.
 * @private
 * @throws {Error} Expects single argument if pass les or more than one argument
 * @throws {Error} o.args should be array like, if o.args is not array.
 * @function _err
 * @memberof wTools
 */

let _errorCounter = 0;
let _errorMaking = false;
function _err( o )
{
  let resultError;

  if( arguments.length !== 1 )
  throw Error( '_err : Expects single argument' );

  if( !_.longIs( o.args ) )
  throw Error( '_err : o.args should be array like' );

  for( let e in o )
  {
    if( _err.defaults[ e ] === undefined )
    {
      debugger;
      throw Error( 'Unknown option ' + e );
    }
  }

  for( let e in _err.defaults )
  {
    if( o[ e ] === undefined )
    o[ e ] = _err.defaults[ e ];
  }

  if( _errorMaking )
  {
    debugger;
    throw Error( '_err : recursive dead lock because of error inside of routine _err!' );
  }
  _errorMaking = true;

  if( o.level === undefined || o.level === null )
  o.level = null;

  /* let */

  let sections;
  let id = null;
  let originalMessage = '';
  let fallBackMessage = '';
  let throwsStack = '';
  let sourceCode = null;
  let errors = [];
  let attended = false;
  let logged = false;
  let beautifiedStack = '';
  let message = null;

  /* debugger */

  if( o.args[ 0 ] === 'not implemented' || o.args[ 0 ] === 'not tested' || o.args[ 0 ] === 'unexpected' )
  if( _.debuggerEnabled )
  debugger;
  if( _global_.debugger )
  debugger;

  /* algorithm */

  try
  {

    argumentsPreprocess();
    locationForm();
    stackAndErrorForm();
    attributesForm();
    catchesForm();
    sourceCodeForm();
    originalMessageForm();

    sectionsForm();
    messageForm();
    fieldsForm();

  }
  catch( err2 )
  {
    debugger;
    _errorMaking = false;
    logger.log( err2.message );
    logger.log( err2.stack );
  }
  _errorMaking = false;

  return resultError;

  /* */

  function strLinesIndentation( str, indentation )
  {
    if( _.strLinesIndentation )
    return indentation + _.strLinesIndentation( str, indentation );
    else
    return str;
  }

  /* */

  function argumentsPreprocess()
  {

    for( let a = 0 ; a < o.args.length ; a++ )
    {
      let arg = o.args[ a ];

      if( !_.errIs( arg ) && _.routineIs( arg ) )
      {
        if( arg.length === 0 )
        {
          try
          {
            arg = o.args[ a ] = arg();
          }
          catch( err )
          {
            arg = o.args[ a ] = '!ERROR!'
          }
        }
        if( _.unrollIs( arg ) )
        {
          o.args = _.longBut( o.args, [ a, a+1 ], arg );
          a -= 1;
          continue;
        }
      }

      if( _.errIs( arg ) )
      {

        if( !resultError )
        {
          resultError = arg;
          throwsStack = arg.throwsStack || '';
          sourceCode = arg.sourceCode || null;
          attended = arg.attended || false;
          logged = arg.logged || false;
        }

        if( arg.constructor )
        fallBackMessage = fallBackMessage || arg.constructor.name;
        errors.push( arg );

        o.args[ a ] = _.errOriginalMessage( arg )

      }

    }

  }

  /* */

  function locationForm()
  {

    if( !resultError )
    for( let a = 0 ; a < o.args.length ; a++ )
    {
      let arg = o.args[ a ];
      if( !_.primitiveIs( arg ) && _.objectLike( arg ) )
      try
      {
        debugger;
        o.throwenLocation = _.introspector.location
        ({
          error : arg,
          location : o.throwenLocation,
        });
        debugger;
      }
      catch( err2 )
      {
        console.error( err2 );
        debugger;
      }
    }

    o.throwenLocation = o.throwenLocation || Object.create( null );
    o.caughtLocation = o.caughtLocation || Object.create( null );

  }

  /* */

  function stackAndErrorForm()
  {

    if( resultError )
    {

      /* qqq : cover each if-branch. ask how to. *difficult problem* */

      if( !o.throwenCallsStack )
      if( o.throwenLocation )
      o.throwenCallsStack = _.introspector.locationToStack( o.throwenLocation );
      if( !o.throwenCallsStack )
      o.throwenCallsStack = _.errOriginalStack( resultError );
      if( !o.throwenCallsStack )
      o.throwenCallsStack = _.introspector.stack([ ( o.level || 0 ) + 1, Infinity ]);

      if( !o.caughtCallsStack && o.caughtLocation )
      o.caughtCallsStack = _.introspector.locationToStack( o.caughtLocation );
      if( !o.caughtCallsStack )
      o.caughtCallsStack = _.introspector.stack( o.caughtCallsStack, [ ( o.level || 0 ) + 1, Infinity ] );

      if( !o.throwenCallsStack && o.caughtCallsStack )
      o.throwenCallsStack = o.caughtCallsStack;
      if( !o.throwenCallsStack )
      o.throwenCallsStack = _.introspector.stack( resultError, [ ( o.level || 0 ) + 1, Infinity ] );

      o.level = 0;

    }
    else
    {

      resultError = new Error( originalMessage + '\n' );
      if( o.throwenCallsStack )
      {
        resultError.stack = o.throwenCallsStack;
        o.caughtCallsStack = _.introspector.stack( o.caughtCallsStack, [ o.level + 1, Infinity ] );
        o.level = 0;
      }
      else
      {
        if( o.caughtCallsStack )
        {
          o.throwenCallsStack = resultError.stack = o.caughtCallsStack;
        }
        else
        {
          if( o.level === undefined || o.level === null )
          o.level = 1;
          o.level += 1;
          o.throwenCallsStack = resultError.stack = _.introspector.stack( resultError.stack, [ o.level, Infinity ] );
        }
        o.level = 0;
        if( !o.caughtCallsStack )
        o.caughtCallsStack = o.throwenCallsStack;
      }

    }

    _.assert( o.level === 0 );

    if( ( o.stackRemovingBeginIncluding || o.stackRemovingBeginExcluding ) && o.throwenCallsStack )
    o.throwenCallsStack = _.introspector.stackRemoveLeft( o.throwenCallsStack, o.stackRemovingBeginIncluding || null, o.stackRemovingBeginExcluding || null );

    if( !o.throwenCallsStack )
    o.throwenCallsStack = resultError.stack = o.fallBackStack;

    beautifiedStack = o.throwenCallsStack;

    _.assert( resultError.asyncCallsStack === undefined || resultError.asyncCallsStack === null || _.arrayIs( resultError.asyncCallsStack ) );
    if( resultError.asyncCallsStack && resultError.asyncCallsStack.length )
    {
      o.asyncCallsStack = o.asyncCallsStack || [];
      _.arrayAppendArray( o.asyncCallsStack, resultError.asyncCallsStack );
    }

    if( o.asyncCallsStack === null || o.asyncCallsStack === undefined )
    if( _.Procedure && _.Procedure.ActiveProcedure )
    o.asyncCallsStack = [ _.Procedure.ActiveProcedure.stack() ];

    _.assert( o.asyncCallsStack === null || _.arrayIs( o.asyncCallsStack ) );
    if( o.asyncCallsStack && o.asyncCallsStack.length )
    {
      beautifiedStack += '\n\n' + o.asyncCallsStack.join( '\n\n' );
    }

    _.assert( _.strIs( beautifiedStack ) );
    if( o.stackCondensing )
    beautifiedStack = _.introspector.stackCondense( beautifiedStack );

  }

  /* */

  function attributesForm()
  {

    try
    {
      o.caughtLocation = _.introspector.location
      ({
        stack : o.caughtCallsStack,
        location : o.caughtLocation,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
      debugger;
    }

    try
    {
      o.throwenLocation = _.introspector.location
      ({
        error : resultError,
        stack : o.throwenCallsStack,
        location : o.throwenLocation,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
      debugger;
    }

    if( o.brief === null || o.brief === undefined )
    o.brief = resultError.brief;
    o.brief = !!o.brief;

    if( o.isProcess === null || o.isProcess === undefined )
    o.isProcess = resultError.isProcess;
    o.isProcess = !!o.isProcess;

    if( o.debugging === null || o.debugging === undefined )
    o.debugging = resultError.debugging;
    o.debugging = !!o.debugging;

    if( o.reason === null || o.reason === undefined )
    o.reason = resultError.reason;

    sections = resultError.section || Object.create( null );
    if( o.sections )
    _.mapExtend( sections, o.sections );

    id = resultError.id;
    if( !id )
    {
      _errorCounter += 1;
      id = _errorCounter;
    }

  }

  /* */

  function catchesForm()
  {

    if( o.throws )
    {
      _.assert( _.arrayIs( o.throws ) );
      o.throws.forEach( ( c ) =>
      {
        c = _.introspector.locationFromStackFrame( c ).routineFilePathLineCol;
        if( throwsStack )
        throwsStack += `\nthrown at ${c}`;
        else
        throwsStack = `thrown at ${c}`;
      });
    }

    _.assert( _.numberIs( o.caughtLocation.internal ) );
    if( !o.caughtLocation.internal || o.caughtLocation.internal === 1 )
    {
      if( throwsStack )
      throwsStack += `\nthrown at ${o.caughtLocation.routineFilePathLineCol}`;
      else
      throwsStack = `thrown at ${o.caughtLocation.routineFilePathLineCol}`;
    }

  }

  /* */

  function sourceCodeForm()
  {

    if( o.usingSourceCode )
    if( resultError.sourceCode === undefined )
    {
      let c = _.introspector.code
      ({
        location : o.throwenLocation,
        sourceCode : o.sourceCode,
        asMap : 1,
      });
      if( c && c.code && c.code.length < 400 )
      {
        sourceCode = c;
      }
    }

  }

  /* */

  function originalMessageForm()
  {
    let multiline = false; // Dmytro : this option is not used in code
    let result = [];

    for( let a = 0 ; a < o.args.length ; a++ )
    {
      let arg = o.args[ a ];
      let str;

      if( arg && !_.primitiveIs( arg ) )
      {

        if( _.primitiveIs( arg ) ) // Dmytro : unnecessary condition, see above
        {
          str = String( arg );
        }
        else if( _.routineIs( arg.toStr ) )
        {
          str = arg.toStr();
        }
        else if( _.errIs( arg ) && _.strIs( arg.originalMessage ) )
        {
          str = arg.originalMessage;
        }
        else if( _.errIs( arg ) )
        {
          if( _.strIs( arg.originalMessage ) ) // Dmytro : duplicates condition above
          str = arg.originalMessage;
          else if( _.strIs( arg.message ) )
          str = arg.message;
          else
          str = _.toStr( arg );
        }
        else
        {
          str = _.toStr( arg, { levels : 2 } );
        }
      }
      else if( arg === undefined )
      {
        str = '\n' + String( arg ) + '\n';
      }
      else
      {
        str = String( arg );
      }

      let currentIsMultiline = _.strHas( str, '\n' );
      if( currentIsMultiline )
      multiline = true;

      result[ a ] = str;

    }

    for( let a = 0 ; a < result.length ; a++ )
    {
      let str = result[ a ];

      if( !originalMessage.replace( /\s*/m, '' ) )
      {
        originalMessage = str;
      }
      else if( _.strEnds( originalMessage, '\n' ) || _.strBegins( str, '\n' ) )
      {
        originalMessage = originalMessage.replace( /\s+$/m, '' ) + '\n' + str;
      }
      else
      {
        originalMessage = originalMessage.replace( /\s+$/m, '' ) + ' ' + str.replace( /^\s+/m, '' );
      }

    }

    /*
      remove redundant eol from begin and end of message
    */

    originalMessage = originalMessage || fallBackMessage || 'UnknownError';
    originalMessage = originalMessage.replace( /^\x20*\n/m, '' );
    originalMessage = originalMessage.replace( /\x20*\n$/m, '' );

  }

  /* */

  function sectionsForm()
  {
    let result = '';

    sectionWrite( 'message', `Message of error#${id}`, originalMessage );
    sectionWrite( 'callsStack', o.stackCondensing ? 'Beautified calls stack' : 'Calls stack', beautifiedStack );
    sectionWrite( 'throwsStack', `Throws stack`, throwsStack );

    if( o.isProcess && _.process && _.process.entryPointInfo )
    sectionWrite( 'process', `Process`, _.process.entryPointInfo() );

    if( sourceCode )
    sectionWrite( 'sourceCode', `Source code from ${sourceCode.path}`, sourceCode.code );

    for( let s in sections )
    {
      let section = sections[ s ];
      if( !_.strIs( section.head ) )
      {
        debugger;
        logger.error( `Each section of an error should have head, but head of section::${s} is ${_.strType(section.head)}` );
        delete sections[ s ];
      }
      if( !_.strIs( section.body ) )
      {
        debugger;
        logger.error( `Each section of an error should have body, but body of section::${s} is ${_.strType(section.body)}` );
        delete sections[ s ];
      }
    }

    return result;
  }

  /* */

  function sectionWrite( name, head, body )
  {
    let section = { head, body };
    sections[ name ] = section;
    return section;
  }

  /* */

  function messageForm()
  {
    let result = '';

    if( o.brief )
    {
      result += originalMessage;
    }
    else
    {

      for( let s in sections )
      {
        let section = sections[ s ];
        let head = section.head || '';
        let body = strLinesIndentation( section.body, '    ' );
        if( !body.trim().length )
        continue;
        result += ` = ${head}\n${body}\n\n`;
      }

    }

    message = result;
    return result;
  }

  /* */

  function fieldsForm()
  {

    nonenumerable( 'message', message );
    nonenumerable( 'originalMessage', originalMessage );
    logging( 'stack', message );
    nonenumerable( 'reason', o.reason );

    nonenumerable( 'callsStack', beautifiedStack );
    nonenumerable( 'throwenCallsStack', o.throwenCallsStack );
    nonenumerable( 'throwsStack', throwsStack );
    nonenumerable( 'asyncCallsStack', o.asyncCallsStack );
    nonenumerable( 'catchCounter', resultError.catchCounter ? resultError.catchCounter+1 : 1 );
    nonenumerable( 'attended', attended );
    nonenumerable( 'logged', logged );
    nonenumerable( 'brief', o.brief );
    nonenumerable( 'isProcess', o.isProcess );

    if( o.throwenLocation.line !== undefined )
    nonenumerable( 'lineNumber', o.throwenLocation.line );
    if( resultError.throwenLocation === undefined )
    nonenumerable( 'location', o.throwenLocation );
    nonenumerable( 'sourceCode', sourceCode || null );
    nonenumerable( 'debugging', o.debugging );
    nonenumerable( 'id', id );

    nonenumerable( 'toString', function() { return this.stack } );
    nonenumerable( 'sections', sections );

    if( o.debugging )
    debugger;

  }

  /* */

  function nonenumerable( fieldName, value )
  {
    try
    {
      Object.defineProperty( resultError, fieldName,
      {
        enumerable : false,
        configurable : true,
        writable : true,
        value : value,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
      debugger;
    }
  }

  /* */

  function rw( fieldName, value ) // Dmytro : this routine is not used anywhere, similar routine logging() below
  {
    let symbol = Symbol.for( fieldName );
    try
    {
      resultError[ symbol ] = value;
      Object.defineProperty( resultError, fieldName,
      {
        enumerable : false,
        configurable : true,
        get : get,
        set : set,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
      debugger;
    }
    function get()
    {
      logger.log( `${fieldName} get ${this[ symbol ]}` );
      return this[ symbol ];
    }
    function set( src )
    {
      logger.log( `${fieldName} set` );
      this[ symbol ] = src;
      return src;
    }
  }

  /* */

  function logging( fieldName, value )
  {
    let symbol = Symbol.for( fieldName );
    try
    {
      nonenumerable( symbol, value );
      Object.defineProperty( resultError, fieldName,
      {
        enumerable : false,
        configurable : true,
        get : get,
        set : set,
      });
    }
    catch( err2 )
    {
      console.error( err2 );
      debugger;
    }
    function get()
    {
      _.errLogEnd( this );
      _.errAttend( this );
      return this[ symbol ];
    }
    function set( src )
    {
      debugger;
      this[ symbol ] = src;
      return src;
    }
  }

}

_err.defaults =
{
  args : null,
  reason : null,
  level : 1,
  /* to make catch stack work properly level should be 1 by default */
  stackRemovingBeginIncluding : null,
  stackRemovingBeginExcluding : null,
  usingSourceCode : 1,
  stackCondensing : 1,
  debugging : null,
  throwenLocation : null,
  caughtLocation : null,
  sourceCode : null,
  brief : null,
  isProcess : null,
  asyncCallsStack : null,
  throwenCallsStack : null,
  caughtCallsStack : null,
  fallBackStack : null,
  throws : null,
  sections : null,
}

//

/**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them.
 *
 * @example
 * function divide( x, y )
 * {
 *   if( y == 0 )
 *     throw _.err( 'divide by zero' )
 *   return x / y;
 * }
 * divide( 3, 0 );
 *
 * // log
 * // Error:
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.err (file:///.../wTools/staging/Base.s:1449:10)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * reference.
 * @function err
 * @memberof wTools
 */

function err()
{
  return _._err
  ({
    args : arguments,
    level : 2,
  });
}

//

function errBrief()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    brief : 1,
  });
}

//

function errUnbrief()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    brief : 0,
  });
}

//

function errProcess()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    isProcess : 1,
  });
}

//

function errUnprocess()
{
  return _._err
  ({
    args : arguments,
    level : 2,
    isProcess : 0,
  });
}

//

function _errFields( args, fields )
{

  _.assert( arguments.length === 2 );
  _.assert( _.mapIs( fields ) )

  if( !_.longIs( args ) )
  args = [ args ];

  let err = args[ 0 ];
  if( args.length !== 1 || !_.errIsStandard( err ) )
  err = _._err
  ({
    args : args,
    level : 2,
  });

  /* */

  try
  {

    for( let f in fields )
    {
      Object.defineProperty( err, f,
      {
        enumerable : false,
        configurable : true,
        writable : true,
        value : fields[ f ],
      });
    }

  }
  catch( err )
  {
    logger.warn( `Cant assign "${f}" property to error\n` + err.toString() );
  }

  /* */

  return err;
}

// //
//
// function _errAttend( args, value )
// {
//   _.assert( arguments.length === 2 );
//   return _._errFields( args, { attended : value } );
// }

//

function errAttend( err, value )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = Config.debug ? _.introspector.stack([ 0, Infinity ]) : true;
  let result = _._errFields( err, { attended : value } );
  return result;
}

//

function errLogEnd( err, value )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = Config.debug ? _.introspector.stack([ 0, Infinity ]) : true;
  return _._errFields( err, { logged : value } );
}

//

function errSuspend( err, value )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  if( value === undefined )
  value = true;
  return _._errFields( err, { suspended : value } );
}

// {
//
//   _.assert( arguments.length === 1 );
//
//   if( !_.errIsStandard( err ) )
//   err = _._err
//   ({
//     args : arguments,
//     level : 2,
//   });
//
//   /* */
//
//   try
//   {
//
//     let value = Config.debug ? _.introspector.stack([ 0, Infinity ]) : true;
//     Object.defineProperty( err, 'logged',
//     {
//       enumerable : false,
//       configurable : true,
//       writable : true,
//       value : value,
//     });
//
//   }
//   catch( err )
//   {
//     logger.warn( 'Cant assign logged property to error\n' + err.toString() );
//   }
//
//   _.errAttend( err );
//
//   /* */
//
//   return err;
// }

//

function errRestack( err, level )
{

  if( err && err.debugging )
  debugger;

  if( !( arguments.length === 1 || arguments.length === 2 ) )
  throw Error( 'Expects single argument or none' );

  if( level === undefined )
  level = 1;

  if( !_.numberDefined( level ) )
  throw Error( 'Expects defined number' );

  let err2 = _._err
  ({
    args : [],
    level : level + 1,
  });

  return _.err( err2, err );
}

//

function errOnce( err )
{

  err = _._err
  ({
    args : arguments,
    level : 2,
  });

  if( err.logged )
  return undefined;

  _.errAttend( err );

  return err;
}

//

function _errLog( err )
{
  let c = _global.logger || _global.console;

  /* */

  if( err && err.debugging )
  debugger;

  if( _.routineIs( err.toString ) )
  {
    let str = err.toString();
    if( _.color && _.color.strFormat )
    str = _.color.strFormat( str, 'negative' );
    if( _.loggerIs( c ) )
    c.error( str )
    else
    c.error( str );
  }
  else
  {
    debugger;
    c.error( 'Error does not have toString' );
    c.error( err );
  }

  /* */

  _.errLogEnd( err );
  _.errAttend( err );

  /* */

  return err;
}

//

/**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them. Prints the created error.
 * If _global_.logger defined, routine will use it to print error, else uses console
 *
 * @see {@link wTools.err See err}
 *
 * @example
 * function divide( x, y )
 * {
 *   if( y == 0 )
 *    throw _.errLog( 'divide by zero' )
 *    return x / y;
 * }
 * divide( 3, 0 );
 *
 * // log
 * // Error:
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.errLog (file:///.../wTools/staging/Base.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * @function errLog
 * @memberof wTools
 */

function errLog()
{

  let err = _._err
  ({
    args : arguments,
    level : 2,
  });

  return _._errLog( err );
}

//

function errLogOnce( err )
{

  err = _._err
  ({
    args : arguments,
    level : 2,
  });

  if( err.logged )
  return err;

  return _._errLog( err );
}

// --
// try
// --

function tryCatch( routine )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ) )
  debugger;
  try
  {
    return routine();
  }
  catch( err )
  {
    debugger;
    throw _._err({ args : [ err ] });
  }
}

//

function tryCatchBrief( routine )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ) )
  debugger;
  try
  {
    return routine();
  }
  catch( err )
  {
    debugger;
    throw _._err({ args : [ err ], brief : 1 });
  }
}

//

function tryCatchDebug( routine )
{
  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ) )
  try
  {
    return routine();
  }
  catch( err )
  {
    throw _._err({ args : [ err ], debugging : 1 });
  }
}

// --
// surer
// --

function _sureDebugger( condition )
{
  if( _.debuggerEnabled )
  debugger;
}

//

function sure( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    _sureDebugger( condition );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureBriefly( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    _sureDebugger( condition );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
      brief : 1,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
      brief : 1,
    });
    else
    throw _err
    ({
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
      brief : 1,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureWithoutDebugger( condition )
{

  if( !condition || !boolLike( condition ) )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function sureInstanceOrClass( _constructor, _this )
{
  _.sure( arguments.length === 2, 'Expects exactly two arguments' );
  _.sure( _.isInstanceOrClass( _constructor, _this ) );
}

//

function sureOwnNoConstructor( ins )
{
  _.sure( _.objectLikeOrRoutine( ins ) );
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _.ownNoConstructor( ins );
  _.sure.apply( _, args );
}

// --
// assert
// --

function breakpoint( condition )
{

  if( Config.debug === false )
  return true;

  if( !condition )
  {
    let err = _err
    ({
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
    logger.log( err );
    debugger;
    return false;
  }

  return true;
}

//

/**
 * Checks condition passed by argument( condition ). Works only in debug mode. Uses StackTrace level 2.
 *
 * @see {@link wTools.err err}
 *
 * If condition is true routine returns without exceptions, otherwise routine generates and throws exception. By default generates error with message 'Assertion fails'.
 * Also generates error using message(s) or existing error object(s) passed after first argument.
 *
 * @param {*} condition - condition to check.
 * @param {String|Error} [ msgs ] - error messages for generated exception.
 *
 * @example
 * let x = 1;
 * _.assert( _.strIs( x ), 'incorrect variable type->', typeof x, 'Expects string' );
 *
 * // log
 * // caught eval (<anonymous>:2:8)
 * // incorrect variable type-> number expects string
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4041)
 * //   at add (<anonymous>:2)
 * //   at <anonymous>:1
 *
 * @example
 * function add( x, y )
 * {
 *   _.assert( arguments.length === 2, 'incorrect arguments count' );
 *   return x + y;
 * }
 * add();
 *
 * // log
 * // caught add (<anonymous>:3:14)
 * // incorrect arguments count
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4035)
 * //   at add (<anonymous>:3:14)
 * //   at <anonymous>:6
 *
 * @example
 *   function divide ( x, y )
 *   {
 *      _.assert( y != 0, 'divide by zero' );
 *      return x / y;
 *   }
 *   divide( 3, 0 );
 *
 * // log
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.errLog (file://.../wTools/staging/Base.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 * @throws {Error} If passed condition( condition ) fails.
 * @function assert
 * @memberof wTools
 */

function _assertDebugger( condition, args )
{
  if( !_.debuggerEnabled )
  return;
  let err = _._err
  ({
    args : Array.prototype.slice.call( args, 1 ),
    level : 3,
  });
  debugger;
}

//

function assert( condition )
{

  if( Config.debug === false )
  return true;

  if( !condition )
  {
    _assertDebugger( condition, arguments );
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return true;

  function boolLike( src )
  {
    let type = Object.prototype.toString.call( src );
    return type === '[object Boolean]' || type === '[object Number]';
  }

}

//

function assertWithoutBreakpoint( condition )
{

  /*return;*/

  if( Config.debug === false )
  return true;

  if( !condition || !_.boolLike( condition ) )
  {
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion fails' ],
      level : 2,
    });
    else if( arguments.length === 2 )
    throw _err
    ({
      args : [ arguments[ 1 ] ],
      level : 2,
    });
    else
    throw _err
    ({
      args : Array.prototype.slice.call( arguments, 1 ),
      level : 2,
    });
  }

  return;
}

//

function assertNotTested( src )
{

  if( _.debuggerEnabled )
  debugger;
  _.assert( false,'not tested : ' + stack( 1 ) );

}

//

/**
 * If condition failed, routine prints warning messages passed after condition argument
 * @example
 * function checkAngles( a, b, c )
 * {
 *    _.assertWarn( (a + b + c) === 180, 'triangle with that angles does not exists' );
 * };
 * checkAngles( 120, 23, 130 );
 *
 * // log 'triangle with that angles does not exists'
 *
 * @param condition Condition to check.
 * @param messages messages to print.
 * @function assertWarn
 * @memberof wTools
 */

function assertWarn( condition )
{

  if( Config.debug )
  return;

  if( !condition || !_.boolLike( condition ) )
  {
    console.warn.apply( console,[].slice.call( arguments,1 ) );
  }

}

//

function assertInstanceOrClass( _constructor, _this )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.isInstanceOrClass( _constructor, _this ) );
}

//

function assertOwnNoConstructor( ins )
{
  _.assert( _.objectLikeOrRoutine( ins ) );
  let args = Array.prototype.slice.call( arguments );
  args[ 0 ] = _.ownNoConstructor( ins );

  if( args.length === 1 )
  args.push( () => 'Entity should not own constructor, but own ' + _.toStrShort( ins ) );

  _.assert.apply( _, args );
}

// --
// namespace
// --

let stackSymbol = Symbol.for( 'stack' );

/* Error.stackTraceLimit = 99; */

/**
 * @property {Object} error={}
 * @property {Boolean} debuggerEnabled=!!Config.debug
 * @name ErrFields
 * @memberof wTools
 */

let Extension =
{

  // error

  errIs,
  errIsStandard,
  errIsAttended,
  errIsBrief,
  errIsProcess,
  errIsLogged,
  errIsSuspended,
  errReason,
  errOriginalMessage,
  errOriginalStack,

  _err,
  err,
  errBrief,
  errUnbrief,
  errProcess,
  errUnprocess,
  _errFields,
  // _errAttend,
  errAttend,
  errLogEnd,
  errSuspend,
  errRestack,
  errOnce,

  _errLog,
  errLog,
  errLogOnce,

  // try

  tryCatch,
  tryCatchBrief,
  tryCatchDebug,

  // sure

  sure,
  sureBriefly,
  sureWithoutDebugger,

  // assert

  breakpoint,
  assert,
  assertWithoutBreakpoint,
  assertNotTested,
  assertWarn,

  // fields

  error : Object.create( null ),
  debuggerEnabled : !!Config.debug,

}

//

Object.assign( _, Extension );

/* zzz : improve formatting of stack with table */

Error.stackTraceLimit = Infinity;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
