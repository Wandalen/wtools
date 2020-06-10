( function _iRoutine_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// routine
// --

function routineIs( src )
{
  let result = Object.prototype.toString.call( src );
  return result === '[object Function]' || result === '[object AsyncFunction]';
}

//

function routineLike( src )
{
  return _.routineIs( src );
}

//

function routineIsSync( src )
{
  return Object.prototype.toString.call( src ) === '[object Function]'
}

//

function routineIsAsync( src )
{
  return Object.prototype.toString.call( src ) === '[object AsyncFunction]'
}

//

function routinesAre( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( !_.routineIs( src[ s ] ) )
    return false;
    return true;
  }

  return _.routineIs( src );
}

//

function routineIsTrivial( src )
{
  if( !src )
  return false;
  let proto = Object.getPrototypeOf( src );
  if( proto === Object.getPrototypeOf( Function ) )
  return true;
  if( !proto )
  return false;
  if( !proto.constructor )
  return false;
  if( proto.constructor.name !== 'AsyncFunction' )
  return false;
  return true;
}

//

function routineWithName( src )
{
  if( !routineIs( src ) )
  return false;
  if( !src.name )
  return false;
  return true;
}

//

/**
 * Internal implementation.
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @function _routineJoin
 * @namespace Tools
 */

function _routineJoin( o )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.boolIs( o.sealing ) );
  _.assert( _.boolIs( o.extending ) );
  _.assert( _.routineIs( o.routine ), 'Expects routine' );
  _.assert( _.longIs( o.args ) || o.args === undefined );

  let routine = o.routine;
  let args = o.args;
  let context = o.context;
  let result = act();

  if( o.extending )
  {
    _.mapExtend( result, routine );

    Object.defineProperty( result, 'originalRoutine',
    {
      value : routine,
      enumerable : false,
    });

    if( context !== undefined )
    Object.defineProperty( result, 'boundContext',
    {
      value : context,
      enumerable : false,
    });

    if( args !== undefined )
    Object.defineProperty( result, 'boundArguments',
    {
      value : args,
      enumerable : false,
    });

  }

  return result;

  function act()
  {

    if( context !== undefined && args !== undefined )
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedContextAndArguments';
        _.assert( _.strIs( name ) );
        let __sealedContextAndArguments =
        {
          [ name ] : function()
          {
            return routine.apply( context, args );
          }
        }
        return __sealedContextAndArguments[ name ];
      }
      else
      {
        let a = _.arrayAppendArray( [ context ], args );
        return Function.prototype.bind.apply( routine, a );
      }
    }
    else if( context !== undefined && args === undefined )
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedContext';
        let __sealedContext =
        {
          [ name ] : function()
          {
            return routine.call( context );
          }
        }
        return __sealedContext[ name ];
      }
      else
      {
        return Function.prototype.bind.call( routine, context );
      }
    }
    else if( context === undefined && args !== undefined ) // zzz
    {
      if( o.sealing === true )
      {
        let name = routine.name || '__sealedArguments';
        _.assert( _.strIs( name ) );
        let __sealedContextAndArguments =
        {
          [ name ] : function()
          {
            return routine.apply( this, args );
          }
        }
        return __sealedContextAndArguments[ name ];
      }
      else
      {
        let name = routine.name || '__joinedArguments';
        let __joinedArguments =
        {
          [ name ] : function()
          {
            let args2 = _.arrayAppendArrays( null, [ args, arguments ] );
            return routine.apply( this, args2 );
          }
        }
        return __joinedArguments[ name ];
      }
    }
    else if( context === undefined && args === undefined ) // zzz
    {
      return routine;
    }
    else _.assert( 0 );
  }

}

//

function constructorJoin( routine, args )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  return _routineJoin
  ({
    routine,
    context : routine,
    args : args || [],
    sealing : false,
    extending : false,
  });

}

//

/**
 * The routineJoin() routine creates a new function with its 'this' ( context ) set to the provided `context`
 * value. Argumetns `args` of target function which are passed before arguments of binded function during
 * calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 *
 * @example
 * let o = { z: 5 };
 * let y = 4;
 * function sum( x, y )
 * {
 *   return x + y + this.z;
 * }
 * let newSum = _.routineJoin( o, sum, [ 3 ] );
 * newSum( y );
 * // returns 12
 *
 * @example
 * function f1()
 * {
 *   console.log( this )
 * };
 * let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
 * f2.call( o ); // try to call new function with context set to { z: 5 }
 * let f3 = _.routineJoin( undefined, f1 ); // new function.
 * f3.call( o )
 * // log { z: 5 }
 *
 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function routineJoin
 * @namespace Tools
 */

function routineJoin( context, routine, args )
{

  _.assert( arguments.length <= 3, 'Expects 3 or less arguments' );

  return _routineJoin
  ({
    routine,
    context,
    args,
    sealing : false,
    extending : true,
  });

}

//

/**
 * The routineJoin() routine creates a new function with its 'this' ( context ) set to the provided `context`
 * value. Argumetns `args` of target function which are passed before arguments of binded function during
 * calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 *
 * @example
 * let o = { z: 5 };
 * let y = 4;
 * function sum( x, y )
 * {
 *   return x + y + this.z;
 * }
 * let newSum = _.routineJoin( o, sum, [ 3 ] );
 * newSum( y );
 * // returns 12
 *
 * @example
 * function f1()
 * {
 *   console.log( this )
 * };
 * let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
 * f2.call( o ); // try to call new function with context set to { z: 5 }
 * let f3 = _.routineJoin( undefined, f1 ); // new function.
 * f3.call( o )
 * // log { z: 5 }
 *
 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function routineJoin
 * @namespace Tools
 */

function routineJoin( context, routine, args )
{

  _.assert( arguments.length <= 3, 'Expects 3 or less arguments' );

  return _routineJoin
  ({
    routine,
    context,
    args,
    sealing : false,
    extending : true,
  });

}

//

/**
 * Return new function with sealed context and arguments.
 *
 * @example
 * let o = { z: 5 };
 * function sum(x, y)
 * {
 *   return x + y + this.z;
 * }
 * let newSum = _.routineSeal( o, sum, [ 3, 4 ] );
 * newSum( y );
 * // returns 12
 *
 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Arguments wrapped into array. Will be used as argument to `routine` function
 * @returns {Function} Result function with sealed context and arguments.
 * @function routineJoin
 * @namespace Tools
 */

function routineSeal( context, routine, args )
{

  _.assert( arguments.length <= 3, 'Expects 3 or less arguments' );

  return _routineJoin
  ({
    routine,
    context,
    args,
    sealing : true,
    extending : true,
  });

}

//

function routineOptions( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];
  let options = args[ 0 ];
  let name = routine ? routine.name : '';
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || ( routine ? routine.defaults : null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ) || routine === null, 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults, `Routine ${name} does not expect options:` );
  _.mapSupplementStructureless( options, defaults );
  _.assertMapHasNoUndefine( options, `Options map for routine ${name} should have no undefined fileds, but it does have` );

  return options;
}

//

function assertRoutineOptions( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];
  let options = args[ 0 ];
  defaults = defaults || ( routine ? routine.defaults : null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ) || routine === null, 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.assertMapHasAll( options, defaults );
  _.assertMapHasNoUndefine( options );

  return options;
}

//

function routineOptionsPreservingUndefines( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'Expects routine' );
  _.assert( _.objectIs( routine.defaults ), 'Expects routine with defined defaults' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'routineOptions : expects single options map, but got', args.length, 'arguments' );

  defaults = defaults || routine.defaults;

  _.assertMapHasOnly( options, defaults );
  _.mapComplementPreservingUndefines( options, defaults );

  return options;
}

//

function routineOptionsReplacingUndefines( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];
  let options = args[ 0 ];
  if( options === undefined )
  options = Object.create( null );
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.mapComplementReplacingUndefines( options, defaults );

  return options;
}

//

function assertRoutineOptionsPreservingUndefines( routine, args, defaults )
{

  if( !_.arrayLike( args ) )
  args = [ args ];
  let options = args[ 0 ];
  defaults = defaults || routine.defaults;

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects 2 or 3 arguments' );
  _.assert( _.routineIs( routine ), 'Expects routine' );
  _.assert( _.objectIs( defaults ), 'Expects routine with defined defaults or defaults in third argument' );
  _.assert( _.objectIs( options ), 'Expects object' );
  _.assert( args.length === 0 || args.length === 1, 'Expects single options map, but got', args.length, 'arguments' );

  _.assertMapHasOnly( options, defaults );
  _.assertMapHasAll( options, defaults );

  return options;
}

//

function routineOptionsFromThis( routine, _this, constructor )
{

  _.assert( arguments.length === 3, 'routineOptionsFromThis : expects 3 arguments' );

  let options = _this || Object.create( null );
  if( Object.isPrototypeOf.call( constructor, _this ) || constructor === _this )
  options = Object.create( null );

  return _.routineOptions( routine, options );
}

//

function _routinesCompose_pre( routine, args )
{
  let o = args[ 0 ];

  if( !_.mapIs( o ) )
  o = { elements : args[ 0 ] }
  if( args[ 1 ] !== undefined )
  o.chainer = args[ 1 ];

  o.elements = _.arrayAppendArrays( [], [ o.elements ] );
  o.elements = o.elements.filter( ( e ) => e === null ? false : e );

  _.routineOptions( routine, o );
  _.assert( _.routinesAre( o.elements ) );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( args.length === 1 || !_.objectIs( args[ 0 ] ) );
  _.assert( _.arrayIs( o.elements ) || _.routineIs( o.elements ) );
  _.assert( _.routineIs( args[ 1 ] ) || args[ 1 ] === undefined || args[ 1 ] === null );
  _.assert( o.chainer === null || _.routineIs( o.chainer ) );
  _.assert( o.supervisor === null || _.routineIs( o.supervisor ) );

  return o;
}

//

function _routinesCompose_body( o )
{

  if( o.chainer === null )
  o.chainer = _.compose.chainer.original;

  o.elements = _.arrayFlatten( o.elements );

  let elements = [];
  for( let s = 0 ; s < o.elements.length ; s++ )
  {
    let src = o.elements[ s ];
    _.assert( _.routineIs( src ) );
    if( src.composed )
    {
      if( src.composed.chainer === o.chainer && src.composed.supervisor === o.supervisor )
      {
        _.arrayAppendArray( elements, src.composed.elements );
      }
      else
      {
        debugger;
        _.arrayAppendElement( elements, src );
      }
    }
    else
    _.arrayAppendElement( elements, src );
  }

  o.elements = elements;

  let supervisor = o.supervisor;
  let chainer = o.chainer;
  let act;

  _.assert( _.routineIs( chainer ) );
  _.assert( supervisor === null || _.routineIs( supervisor ) );

  /* */

  if( elements.length === 0 )
  act = function empty()
  {
    return [];
  }
  // else if( elements.length === 1 ) /* zzz : optimize the case */
  // {
  //   act = elements[ 0 ];
  // }
  else act = function composition()
  {
    let result = [];
    // let args = _.unrollAppend( _.unrollFrom( null ), arguments );
    // debugger;
    let args = _.unrollFrom( arguments );
    for( let k = 0 ; k < elements.length ; k++ )
    {
      _.assert( _.unrollIs( args ), () => 'Expects unroll, but got', _.strType( args ) );
      let routine = elements[ k ];
      let r = routine.apply( this, args );
      _.assert( r !== false /* && r !== undefined */, 'Temporally forbidden type of result', r );
      _.assert( !_.argumentsArrayIs( r ) );
      if( r !== undefined )
      _.unrollAppend( result, r );
      // args = chainer( r, k, args, o );
      args = chainer( args, r, o, k );
      _.assert( args !== undefined && args !== false );
      // if( args === undefined )
      if( args === _.dont )
      break;
      args = _.unrollFrom( args );
    }
    return result;
  }

  o.act = act;
  act.composed = o;

  if( supervisor )
  {
    _.routineExtend( compositionSupervise, act );
    return compositionSupervise;
  }

  return act;

  function compositionSupervise()
  {
    let result = supervisor( this, arguments, act, o );
    return result;
  }
}

_routinesCompose_body.defaults =
{
  elements : null,
  chainer : null,
  supervisor : null,
}

//

function routinesCompose()
{
  let o = _.routinesCompose.pre( routinesCompose, arguments );
  let result = _.routinesCompose.body( o );
  return result;
}

routinesCompose.pre = _routinesCompose_pre;
routinesCompose.body = _routinesCompose_body;
routinesCompose.defaults = Object.assign( Object.create( null ), routinesCompose.body.defaults );

//

/**
 * The routineExtend() is used to copy the values of all properties
 * from source routine to a target routine.
 *
 * It takes first routine (dst), and shallow clone each destination property of type map.
 * Then it checks properties of source routine (src) and extends dst by source properties.
 * The dst properties can be owerwriten by values of source routine
 * if descriptor (writable) of dst property is set.
 *
 * If the first routine (dst) is null then
 * routine routineExtend() makes a routine from routines pre and body
 * @see {@link wTools.routineFromPreAndBody} - Automatic routine generating
 * from preparation routine and main routine (body).
 *
 * @param{ routine } dst - The target routine or null.
 * @param{ * } src - The source routine or object to copy.
 *
 * @example
 * var src =
 * {
 *   pre : _.routinesCompose.pre,
 *   body : _.routinesCompose.body,
 *   someOption : 1,
 * }
 * var got = _.routineExtend( null, src );
 * // returns [ routine routinesCompose ], got.option === 1
 *
 * @example
 * _.routineExtend( null, _.routinesCompose );
 * // returns [ routine routinesCompose ]
 *
 * @example
 * _.routineExtend( _.routinesCompose, { someOption : 1 } );
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 *
 * @example
 * _.routinesComposes.someOption = 22;
 * _.routineExtend( _.routinesCompose, { someOption : 1 } );
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 *
 * @returns { routine } It will return the target routine with extended properties.
 * @function routineExtend
 * @throws { Error } Throw an error if arguments.length < 1 or arguments.length > 2.
 * @throws { Error } Throw an error if dst is not routine or not null.
 * @throws { Error } Throw an error if dst is null and src has not pre and body properties.
 * @throws { Error } Throw an error if src is primitive value.
 * @namespace Tools
 */

function routineExtend( dst, src )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( _.routineIs( dst ) || dst === null );
  _.assert( src === null || src === undefined || _.mapLike( src ) || _.routineIs( src ) );

  /* generate dst routine */

  if( dst === null )
  {

    let dstMap = Object.create( null );
    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let src = arguments[ a ];
      if( src === null )
      continue;
      _.mapExtend( dstMap, src )
    }

    if( dstMap.pre && dstMap.body )
    {
      dst = _.routineFromPreAndBody( dstMap.pre, dstMap.body );
    }
    else
    {
      _.assert( _.routineIs( src ) );
      dst = function(){ return src.apply( this, arguments ); }
    }
    // _.assert( 0, 'Not clear how to construct the routine' );
    // dst = dstMap;

  }

  /* shallow clone properties of dst routine */

  for( let s in dst )
  {
    let property = dst[ s ];
    if( _.mapIs( property ) )
    {
      property = _.mapExtend( null, property );
      dst[ s ] = property;
    }
  }

  /* extend dst routine */

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src === null )
    continue;
    _.assert( _.mapLike( src ) || _.routineIs( src ) );
    for( let s in src )
    {
      let property = src[ s ];
      let d = Object.getOwnPropertyDescriptor( dst, s );
      if( d && !d.writable )
      continue;
      if( _.objectIs( property ) )
      {
        _.assert( !_.mapHas( dst, s ) || _.mapIs( dst[ s ] ) );
        property = Object.create( property );
        // property = _.mapExtend( null, property ); /* zzz : it breaks files. investigate */
        if( dst[ s ] )
        _.mapSupplement( property, dst[ s ] );
      }
      dst[ s ] = property;
    }
  }

  return dst;
}

//

function routineExtend_( dst, src )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3 );
  _.assert( _.routineIs( dst ) || dst === null );
  _.assert( src === null || src === undefined || _.mapLike( src ) || _.routineIs( src ) );

  /* generate dst routine */

  if( dst === null )
  {

    let dstMap = Object.create( null );
    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let src = arguments[ a ];
      if( src === null )
      continue;
      _.mapExtend( dstMap, src )
    }

    if( dstMap.pre && dstMap.body )
    {
      dst = _.routineFromPreAndBody( dstMap.pre, dstMap.body );
    }
    else
    {
      _.assert( _.routineIs( src ) );
      dst = function(){ return src.apply( this, arguments ); }
    }
  }

  /* shallow clone properties of dst routine */

  for( let s in dst )
  {
    let property = dst[ s ];
    if( _.mapIs( property ) )
    {
      property = _.mapExtend( null, property );
      dst[ s ] = property;
    }
  }

  /* extend dst routine */

  for( let a = 0 ; a < arguments.length ; a++ )
  {
    let src = arguments[ a ];
    if( src === null )
    continue;
    _.assert( _.mapLike( src ) || _.routineIs( src ) );
    for( let s in src )
    {
      let property = src[ s ];
      let d = Object.getOwnPropertyDescriptor( dst, s );
      if( d && !d.writable )
      continue;
      if( _.objectIs( property ) )
      {
        _.assert( !_.mapHas( dst, s ) || _.mapIs( dst[ s ] ) );
        // property = Object.create( property );
        property = _.mapExtend( null, property ); /* zzz : it breaks files. investigate */
        if( dst[ s ] )
        _.mapSupplement( property, dst[ s ] );
      }
      dst[ s ] = property;
    }
  }

  return dst;
}

//

function routineDefaults( dst, src, defaults )
{

  if( arguments.length === 2 )
  {
    defaults = arguments[ 1 ];
    src = null;
  }

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( dst === null || src === null );
  _.assert( _.mapLike( defaults ) );

  return _.routineExtend( dst, src, { defaults } );
}

//

function routineFromPreAndBody_pre( routine, args )
{
  let o = args[ 0 ];

  if( args[ 1 ] !== undefined )
  {
    o = { pre : args[ 0 ], body : args[ 1 ], name : args[ 2 ] };
  }

  _.routineOptions( routine, o );
  _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
  _.assert( arguments.length === 2 );
  _.assert( _.routineIs( o.pre ) || _.routinesAre( o.pre ), 'Expects routine or routines {-o.pre-}' );
  _.assert( _.routineIs( o.body ), 'Expects routine {-o.body-}' );
  _.assert( o.body.defaults !== undefined, 'Body should have defaults' );

  return o;
}

//

function routineFromPreAndBody_body( o )
{

  _.assert( arguments.length === 1 );

  if( !_.routineIs( o.pre ) )
  {
    let _pre = _.routinesCompose( o.pre, function( args, result, op, k )
    {
      _.assert( arguments.length === 4 );
      _.assert( !_.unrollIs( result ) );
      _.assert( _.objectIs( result ) );
      return _.unrollAppend([ callPreAndBody, [ result ] ]);
    });
    _.assert( _.routineIs( _pre ) );
    o.pre = function pre()
    {

      let result = _pre.apply( this, arguments );
      return result[ result.length-1 ];
    }
  }

  let pre = o.pre;
  let body = o.body;

  if( !o.name )
  {
    _.assert( _.strDefined( o.body.name ), 'Body routine should have name' );
    o.name = o.body.name;
    if( o.name.indexOf( '_body' ) === o.name.length-5 && o.name.length > 5 )
    o.name = o.name.substring( 0, o.name.length-5 );
  }

  let r =
  {
    [ o.name ] : function()
    {
      let result;
      let o = pre.call( this, callPreAndBody, arguments );
      _.assert( !_.argumentsArrayIs( o ), 'does not expect arguments array' );
      if( _.unrollIs( o ) )
      result = body.apply( this, o );
      else
      result = body.call( this, o );
      return result;
    }
  }

  let callPreAndBody = r[ o.name ];

  _.assert( _.strDefined( callPreAndBody.name ), 'Looks like your interpreter does not support dynamic naming of functions. Please use ES2015 or later interpreter.' );

  _.routineExtend_( callPreAndBody, o.body );

  callPreAndBody.pre = o.pre;
  callPreAndBody.body = o.body;

  return callPreAndBody;
}

routineFromPreAndBody_body.defaults =
{
  pre : null,
  body : null,
  name : null,
}

//

function routineFromPreAndBody()
{
  let o = routineFromPreAndBody.pre.call( this, routineFromPreAndBody, arguments );
  let result = routineFromPreAndBody.body.call( this, o );
  return result;
}

routineFromPreAndBody.pre = routineFromPreAndBody_pre;
routineFromPreAndBody.body = routineFromPreAndBody_body;
routineFromPreAndBody.defaults = Object.create( routineFromPreAndBody_body.defaults );

//

function vectorize_pre( routine, args )
{
  let o = args[ 0 ];

  if( args.length === 2 )
  o = { routine : args[ 0 ], select : args[ 1 ] }
  else if( _.routineIs( o ) || _.strIs( o ) )
  o = { routine : args[ 0 ] }

  _.routineOptions( routine, o );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.routineIs( o.routine ) || _.strIs( o.routine ) || _.strsAreAll( o.routine ), () => 'Expects routine {-o.routine-}, but got ' + o.routine );
  _.assert( args.length === 1 || args.length === 2 );
  _.assert( o.select >= 1 || _.strIs( o.select ) || _.arrayLike( o.select ), () => 'Expects {-o.select-} as number >= 1, string or array, but got ' + o.select );

  return o;
}

//

/*
qqq : add support and coverage of Set and HashMap
*/

function vectorize_body( o )
{

  _.assertRoutineOptions( vectorize_body, arguments );

  if( _.arrayLike( o.routine ) && o.routine.length === 1 )
  o.routine = o.routine[ 0 ];

  let routine = o.routine;
  let fieldFilter = o.fieldFilter;
  let bypassingFilteredOut = o.bypassingFilteredOut;
  let bypassingEmpty = o.bypassingEmpty;
  let vectorizingArray = o.vectorizingArray;
  let vectorizingMapVals = o.vectorizingMapVals;
  let vectorizingMapKeys = o.vectorizingMapKeys;
  let vectorizingContainerAdapter = o.vectorizingContainerAdapter;
  let unwrapingContainerAdapter = o.unwrapingContainerAdapter;
  let pre = null;
  let select = o.select === null ? 1 : o.select;
  let selectAll = o.select === Infinity;
  let multiply = select > 1 ? multiplyReally : multiplyNo;

  routine = routineNormalize( routine );

  _.assert( _.routineIs( routine ), () => 'Expects routine {-o.routine-}, but got ' + routine );

  /* */

  let resultRoutine = vectorizeArray;

  if( _.numberIs( select ) )
  {

    if( !vectorizingArray && !vectorizingMapVals && !vectorizingMapKeys )
    resultRoutine = routine;
    else if( fieldFilter )
    resultRoutine = vectorizeWithFilters;
    else if( vectorizingMapKeys )
    {
      // _.assert( !vectorizingMapVals, '{-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} should not be enabled at the same time' );

      if( vectorizingMapVals )
      {
        _.assert( select === 1, 'Only single argument is allowed if {-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} are enabled.' );
        resultRoutine = vectorizeMapWithKeysOrArray;
      }
      else
      {
        resultRoutine = vectorizeKeysOrArray;
      }

    }
    else if( !vectorizingArray || vectorizingMapVals )
    resultRoutine = vectorizeMapOrArray;
    else if( multiply === multiplyNo )
    resultRoutine = vectorizeArray;
    else
    resultRoutine = vectorizeArrayMultiplying;

  }
  else
  {
    _.assert( multiply === multiplyNo );
    if( routine.pre )
    {
      pre = routine.pre;
      routine = routine.body;
    }
    if( fieldFilter )
    {
      _.assert( 0, 'not implemented' );
    }
    else if( vectorizingArray || !vectorizingMapVals )
    {
      if( _.strIs( select ) )
      resultRoutine = vectorizeForOptionsMap;
      else
      resultRoutine = vectorizeForOptionsMapForKeys;
    }
    else _.assert( 0, 'not implemented' );
  }

  /* */

  // if( vectorizingContainerAdapter )
  // {
  //   let vectorizeRoutine = resultRoutine;
  //   resultRoutine = function vectorizeContainerAdapters()
  //   {
  //     let args = originalsFromAdaptersInplace( arguments );
  //   }
  // }

  /* */

  resultRoutine.vectorized = o;

  /* */

  _.routineExtend( resultRoutine, routine );
  return resultRoutine;

/*
  vectorizeWithFilters : multiply + array/map vectorizing + filter
  vectorizeArray : array vectorizing
  vectorizeArrayMultiplying :  multiply + array vectorizing
  vectorizeMapOrArray :  multiply +  array/map vectorizing
*/

  /* - */

  function routineNormalize( routine )
  {

    if( _.strIs( routine ) )
    {
      return function methodCall()
      {
        _.assert( _.routineIs( this[ routine ] ), () => 'Context ' + _.toStrShort( this ) + ' does not have routine ' + routine );
        return this[ routine ].apply( this, arguments );
      }
    }
    else if( _.arrayLike( routine ) )
    {
      _.assert( routine.length === 2 );
      return function methodCall()
      {
        let c = this[ routine[ 0 ] ];
        _.assert( _.routineIs( c[ routine[ 1 ] ] ), () => 'Context ' + _.toStrShort( c ) + ' does not have routine ' + routine );
        return c[ routine[ 1 ] ].apply( c, arguments );
      }
    }

    return routine;
  }

  /* - */

  function multiplyNo( args )
  {
    return args;
  }

  /* - */

  function multiplyReally( args )
  {
    let length;
    let keys;

    args = [ ... args ];

    if( selectAll )
    select = args.length;

    _.assert( args.length === select, () => 'Expects ' + select + ' arguments, but got ' + args.length );

    for( let d = 0 ; d < select ; d++ )
    {
      if( vectorizingArray && _.arrayLike( args[ d ] ) )
      {
        length = args[ d ].length;
        break;
      }
      else if( vectorizingArray && _.setLike( args[ d ] ) )
      {
        length = args[ d ].size;
        break;
      }
      else if( vectorizingContainerAdapter && _.containerAdapter.is( args[ d ] ) )
      {
        length = args[ d ].length;
        break;
      }
      else if( vectorizingMapVals && _.mapLike( args[ d ] ) )
      {
        keys = _.mapOwnKeys( args[ d ] );
        break;
      }
    }

    if( length !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      {
        if( vectorizingMapVals )
        _.assert( !_.mapIs( args[ d ] ), () => 'Arguments should have only arrays or only maps, but not both. Incorrect argument : ' + args[ d ] );
        else if( vectorizingMapKeys && _.mapIs( args[ d ] ) )
        continue;
        args[ d ] = _.multiple( args[ d ], length );
      }

    }
    else if( keys !== undefined )
    {
      for( let d = 0 ; d < select ; d++ )
      if( _.mapIs( args[ d ] ) )
      {
        _.assert( _.arraySetIdentical( _.mapOwnKeys( args[ d ] ), keys ), () => 'Maps should have same keys : ' + keys );
      }
      else
      {
        if( vectorizingArray )
        _.assert( !_.arrayLike( args[ d ] ), () => 'Arguments should have only arrays or only maps, but not both. Incorrect argument : ' + args[ d ] );
        let arg = Object.create( null );
        _.objectSetWithKeys( arg, keys, args[ d ] );
        args[ d ] = arg;
      }
    }

    return args;
  }

  /* - */

  function vectorizeArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    let args = arguments;
    // args = _.originalsFromAdaptersInplace( args );
    let src = args[ 0 ];

    if( _.arrayLike( src ) )
    {
      let args2 = [ ... args ]; // Dmytro : if args[ 1 ] and next elements is not primitive, then vectorized routine can affects on this elements and array args
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        args2[ 0 ] = src[ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }
    else if( _.setLike( src ) ) /* qqq : cover please */
    {
      let args2 = [ ... args ];
      let result = new Set;
      for( let e of src )
      {
        args2[ 0 ] = e;
        result.add( routine.apply( this, args2 ) );
      }
      return result;
    }
    else if( vectorizingContainerAdapter && _.containerAdapter.is( src ) )
    {
      let args2 = [ ... args ];
      let result = src.filter( ( e ) =>
      {
        args2[ 0 ] = e;
        return routine.apply( this, args2 );
      });
      if( unwrapingContainerAdapter )
      return result.original;
      else
      return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeArrayMultiplying()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let src = args[ 0 ];
    // src = _.originalOfAdapter( src );

    if( _.arrayLike( src ) )
    {
      let args2 = [ ... args ];
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, args );
  }

  /* - */

  function vectorizeForOptionsMap( srcMap )
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    let src = srcMap[ select ];
    // let args = _.originalsFromAdaptersInplace( [ ... arguments ] );
    let args = [ ... arguments ];
    _.assert( arguments.length === 1, 'Expects single argument' );

    if( _.arrayLike( src ) )
    {
      if( pre )
      {
        args = pre( routine, args );
        _.assert( _.arrayLikeResizable( args ) );
      }
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = src[ r ];
        result[ r ] = routine.apply( this, args );
      }
      return result;
    }
    else if( _.setLike( src ) ) /* qqq : cover */
    {
      debugger;
      if( pre )
      {
        args = pre( routine, args );
        _.assert( _.arrayLikeResizable( args ) );
      }
      let result = new Set;
      for( let e of src )
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = e;
        result.add( routine.apply( this, args ) );
      }
      return result;
    }
    else if( vectorizingContainerAdapter && _.containerAdapter.is( src ) ) /* qqq : cover */
    {
      debugger;
      if( pre )
      {
        args = pre( routine, args );
        _.assert( _.arrayLikeResizable( args ) );
      }
      result = src.filter( ( e ) =>
      {
        args[ 0 ] = _.mapExtend( null, srcMap );
        args[ 0 ][ select ] = e;
        return routine.apply( this, args );
      });
      if( unwrapingContainerAdapter )
      return result.original;
      else
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeForOptionsMapForKeys()
  {
    let result = [];

    if( bypassingEmpty && !arguments.length )
    return result;

    for( let i = 0; i < o.select.length; i++ )
    {
      select = o.select[ i ];
      result[ i ] = vectorizeForOptionsMap.apply( this, arguments );
    }
    return result;
  }

  /* - */

  function vectorizeMapOrArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let src = args[ 0 ];

    if( vectorizingArray && _.arrayLike( src ) )
    {
      let args2 = [ ... args ];
      let result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }
    else if( vectorizingMapVals && _.mapIs( src ) )
    {
      let args2 = [ ... args ];
      let result = Object.create( null );
      for( let r in src )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];

        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeMapWithKeysOrArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let srcs = args[ 0 ];

    _.assert( args.length === select, () => 'Expects ' + select + ' arguments but got : ' + args.length );

    if( vectorizingMapKeys && vectorizingMapVals &&_.mapIs( srcs ) )
    {
      let result = Object.create( null );
      for( let s in srcs )
      {
        let val = routine.call( this, srcs[ s ] );
        let key = routine.call( this, s );
        result[ key ] = val;
      }
      return result;
    }
    else if( vectorizingArray && _.arrayLike( srcs ) )
    {
      let result = [];
      for( let s = 0 ; s < srcs.length ; s++ )
      result[ s ] = routine.call( this, srcs[ s ] );
      return result;
    }

    return routine.apply( this, arguments );
  }

  /* - */

  function vectorizeWithFilters( src )
  {

    _.assert( 0, 'not tested' ); /* qqq : cover please */
    _.assert( arguments.length === 1, 'Expects single argument' );

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );

    if( vectorizingArray && _.arrayLike( src ) )
    {
      args = [ ... args ];
      let result = [];
      throw _.err( 'not tested' ); /* cover please */
      for( let r = 0 ; r < src.length ; r++ )
      {
        if( fieldFilter( src[ r ], r, src ) )
        {
          args[ 0 ] = src[ r ];
          result.push( routine.apply( this, args ) );
        }
        else if( bypassingFilteredOut )
        {
          result.push( src[ r ] );
        }
      }
      return result;
    }
    else if( vectorizingMapVals && _.mapIs( src ) )
    {
      args = [ ... args ];
      let result = Object.create( null );
      throw _.err( 'not tested' ); /* qqq : cover please */
      for( let r in src )
      {
        if( fieldFilter( src[ r ], r, src ) )
        {
          args[ 0 ] = src[ r ];
          result[ r ] = routine.apply( this, args );
        }
        else if( bypassingFilteredOut )
        {
          result[ r ] = src[ r ];
        }
      }
      return result;
    }

    return routine.call( this, src );
  }

  /* - */

  function vectorizeKeysOrArray()
  {
    if( bypassingEmpty && !arguments.length )
    return [];

    // let args = multiply( _.originalsFromAdaptersInplace( arguments ) );
    let args = multiply( arguments );
    let src = args[ 0 ];
    let args2;
    let result;
    let map;
    let mapIndex;
    let arr;

    _.assert( args.length === select, () => 'Expects ' + select + ' arguments but got : ' + args.length );

    if( vectorizingMapKeys )
    {
      for( let d = 0; d < select; d++ )
      {
        if( vectorizingArray && _.arrayLike( args[ d ] ) )
        arr = args[ d ];
        else if( _.mapIs( args[ d ] ) )
        {
          _.assert( map === undefined, () => 'Arguments should have only single map. Incorrect argument : ' + args[ d ] );
          map = args[ d ];
          mapIndex = d;
        }
      }
    }

    if( map )
    {
      result = Object.create( null );
      args2 = [ ... args ];

      if( vectorizingArray && _.arrayLike( arr ) )
      {
        for( let i = 0; i < arr.length; i++ )
        {
          for( let m = 0 ; m < select ; m++ )
          args2[ m ] = args[ m ][ i ];

          for( let k in map )
          {
            args2[ mapIndex ] = k;
            let key = routine.apply( this, args2 );
            result[ key ] = map[ k ];
          }
        }
      }
      else
      {
        for( let k in map )
        {
          args2[ mapIndex ] = k;
          let key = routine.apply( this, args2 );
          result[ key ] = map[ k ];
        }
      }

      return result;
    }
    else if( vectorizingArray && _.arrayLike( src ) )
    {
      args2 = [ ... args ];
      result = [];
      for( let r = 0 ; r < src.length ; r++ )
      {
        for( let m = 0 ; m < select ; m++ )
        args2[ m ] = args[ m ][ r ];
        result[ r ] = routine.apply( this, args2 );
      }
      return result;
    }

    return routine.apply( this, arguments );
  }

}

/* qqq : implement options combination vectorizingMapVals : 1, vectorizingMapKeys : 1, vectorizingArray : [ 0, 1 ] */
/* qqq : cover it */

/* qqq : implement bypassingEmpty for all combinations of options */
/* qqq : options bypassingEmpty of routine _.vectorize requires good coverage */

vectorize_body.defaults =
{
  routine : null,
  fieldFilter : null,
  bypassingFilteredOut : 1,
  bypassingEmpty : 0,
  vectorizingArray : 1,
  vectorizingMapVals : 0,
  vectorizingMapKeys : 0,
  vectorizingContainerAdapter : 0,
  unwrapingContainerAdapter : 0,
  select : 1,
}

//

function vectorize()
{
  let o = vectorize.pre.call( this, vectorize, arguments );
  let result = vectorize.body.call( this, o );
  return result;
}

vectorize.pre = vectorize_pre;
vectorize.body = vectorize_body;
vectorize.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeAll_body( o )
{
  _.assertRoutineOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );

  _.routineExtend( all, o.routine );

  return all;

  function all()
  {
    let result = routine1.apply( this, arguments );
    return _.all( result );
  }

}

vectorizeAll_body.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeAll()
{
  let o = vectorizeAll.pre.call( this, vectorizeAll, arguments );
  let result = vectorizeAll.body.call( this, o );
  return result;
}

vectorizeAll.pre = vectorize_pre;
vectorizeAll.body = vectorizeAll_body;
vectorizeAll.defaults = Object.create( vectorizeAll_body.defaults );

//

function vectorizeAny_body( o )
{
  _.assertRoutineOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );
  _.routineExtend( any, o.routine );

  return any;

  function any()
  {
    let result = routine1.apply( this, arguments );
    return _.any( result );
  }

}

vectorizeAny_body.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeAny()
{
  let o = vectorizeAny.pre.call( this, vectorizeAny, arguments );
  let result = vectorizeAny.body.call( this, o );
  return result;
}

vectorizeAny.pre = vectorize_pre;
vectorizeAny.body = vectorizeAny_body;
vectorizeAny.defaults = Object.create( vectorizeAny_body.defaults );

//

function vectorizeNone_body( o )
{
  _.assertRoutineOptions( vectorize, arguments );

  let routine1 = _.vectorize.body.call( this, o );
  _.routineExtend( none, o.routine );

  return none;

  function none()
  {
    let result = routine1.apply( this, arguments );
    return _.none( result );
  }

}

vectorizeNone_body.defaults = Object.create( vectorize_body.defaults );

//

function vectorizeNone()
{
  let o = vectorizeNone.pre.call( this, vectorizeNone, arguments );
  let result = vectorizeNone.body.call( this, o );
  return result;
}

vectorizeNone.pre = vectorize_pre;
vectorizeNone.body = vectorizeNone_body;
vectorizeNone.defaults = Object.create( vectorizeNone_body.defaults );

//

/**
 * The routine vectorizeAccess() creates proxy object for each element of passed vector {-vector-}.
 * Proxy object provides access to existed properties of {-vector-} elements uses only get()
 * and set() handlers.
 * If get() handler is used, then routine returns new proxy object with vector of property values.
 * If a property is a routine, then its routines can be applied to a set of arguments. The result is
 * a new proxy with vector of returned values.
 * To get original vector uses property `$`.
 * If set() handler is used, then property of each proxy element is assigned to one value.
 *
 * @param { Long } vector - The vector of objects and vectors to get proxy access to properties.
 *
 * @example
 * let obj1 = { a : 1, b : 2, c : 3 };
 * let obj2 = { a : 5, b : 6 };
 * let vector = _.vectorizeAccess( [ obj1, obj2 ] );
 * console.log( vector );
 * // log Proxy [
 *          [ { a : 1, b : 2, c : 3 }, { a : 5, b : 6 } ],
 *          { get: [Function: get], set: [Function: set] }
 *        ]
 * console.log( vector[ '$' ] );
 * // log [ { a : 1, b : 2, c : 3 }, { a : 5, b : 6 } ]
 * let vectorA = vector.a; // or vector[ 'a' ]
 * console.log( vectorA );
 * // log Proxy [ [ 1, 5 ], { get: [Function: get], set: [Function: set] } ]
 *
 * @example
 * let cb1 = ( e ) => Math.pow( e, 2 );
 * let cb2 = ( e ) => Math.sqrt( e, 2 );
 * let obj1 = { callback : cb1, name : 'obj1' };
 * let obj2 = { callback : cb2, name : 'obj2' };
 * let vector = _.vectorizeAccess( [ obj1, obj2 ] );
 * let result = vector.callback( 4 );
 * console.log( result );
 * // log Proxy [ [ 16, 2 ], { get: [Function: get], set: [Function: set] } ]
 *
 * @example
 * let v1 = [ 1, 2, 3 ];
 * let v2 = [ 5, 6 ];
 * let vector = _.vectorizeAccess( [ v1, v2 ] );
 * vector[ 1 ] = 10;
 * console.log( vector[ '$' ] );
 * // log [ [ 1, 10, 3 ], [ 5, 10 ] ]
 *
 * @returns { Proxy } - Proxy object, which provides access to existed properties in elements of vector.
 * @function vectorizeAccess
 * @throws { Error } If arguments.length is less or more then one.
 * @throws { Error } If {-vector-} is not a Long.
 * @namespace Tools
 */

function vectorizeAccess( vector )
{

  _.assert( _.longIs( vector ) );
  _.assert( arguments.length === 1 );

  let handler =
  {
    get : function( back, key, context )
    {
      if( key === '$' )
      {
        debugger;
        return vector;
      }

      let routineIs = vector.some( ( scalar ) => _.routineIs( scalar[ key ] ) );

      vector.map( ( scalar ) =>
      {
        _.assert( scalar[ key ] !== undefined, `One or several element(s) of vector does not have ${key}` );
      });

      if( routineIs )
      return function()
      {
        let self = this;
        let args = arguments;
        let revectorizing = false;
        let result = vector.map( ( scalar ) =>
        {
          let r = scalar[ key ].apply( scalar, args );
          if( r !== scalar )
          revectorizing = true;
          return r; // Dmytro : it returns result in vector, if it not exists, then result has only undefined => [ undefined, undefined, undefined ]
        });
        if( revectorizing )
        {
          debugger;
          return vectorizeAccess( result );
        }
        else
        {
          return proxy;
        }
      }

      debugger;
      let result = vector.map( ( scalar ) =>
      {
        return scalar[ key ];
      });
      return vectorizeAccess( result );

    },
    set : function( back, key, val, context )
    {

      vector.map( ( scalar ) =>
      {
        _.assert( scalar[ key ] !== undefined, `One or several element(s) of vector does not have ${key}` );
      });

      vector.map( ( scalar ) =>
      {
        scalar[ key ] = val;
      });

      return true;
    },
  };

  let proxy = new Proxy( vector, handler );

  return proxy;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  routineIs,
  routineLike,
  routineIsSync,
  routineIsAsync,
  routinesAre,
  routineIsTrivial,
  routineWithName,

  _routineJoin,
  constructorJoin,
  routineJoin,
  routineSeal,

  routineOptions,
  assertRoutineOptions,
  routineOptionsPreservingUndefines,
  assertRoutineOptionsPreservingUndefines,
  routineOptionsFromThis,

  routinesCompose,
  routineExtend, /* xxx : deprecate */
  routineExtend_,
  routineDefaults,
  routineFromPreAndBody,

  routineVectorize_functor : vectorize,
  vectorize,
  vectorizeAll,
  vectorizeAny,
  vectorizeNone,

  vectorizeAccess, /* qqq : cover | Dmytro : covered */

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
