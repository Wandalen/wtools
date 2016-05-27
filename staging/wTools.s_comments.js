Skip to content
Personal Open source Business Explore
Sign upSign inPricingBlogSupport
This repository
Search
 Watch 1  Star 0  Fork 0 Wandalen/wTools
 Code  Issues 0  Pull requests 0  Pulse  Graphs
Branch: master Find file Copy pathwTools/staging/wTools.s
94b4af0  an hour ago
 Kostiantyn Wandalen arrayRange
0 contributors
RawBlameHistory    6440 lines (4794 sloc)  121 KB
(function _wTools(){

'use strict';

//

var _global_ = undefined;

if( !_global_ && typeof Global !== 'undefined' && Global.Global === Global ) _global_ = Global;
if( !_global_ && typeof global !== 'undefined' && global.global === global ) _global_ = global;
if( !_global_ && typeof window !== 'undefined' && window.window === window ) _global_ = window;
if( !_global_ && typeof self   !== 'undefined' && self.self === self ) _global_ = self;

_global_[ '_global_' ] = _global_;
_global_._global_ = _global_;

if( typeof module !== 'undefined' && module !== null )
{
  if( typeof Underscore === 'undefined' )
  _global_.Underscore = require( 'underscore' );
}

if( typeof wTools === 'undefined' )
{
  if( _global_.Underscore !== undefined ) _global_.wTools = Object.create( _global_.Underscore );
  else if( _global_._ !== undefined ) _global_.wTools = Object.create( _global_._ );
  else _global_.wTools = {};
}

if( typeof Config === 'undefined' )
{
  _global_.Config = Object.freeze({ debug : true });
}

if( typeof DEBUG === 'undefined' )
{
  _global_.DEBUG = !!Config.debug;
}

//

var Self = wTools;
var _ = wTools;

var _ArraySlice = Array.prototype.slice;
var _FunctionBind = Function.prototype.bind;
var _ObjectToString = Object.prototype.toString;
var _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// entity
// --

var enityExtend = function( dst,src )
{

  if( _.strIs( src ) )
  {

    dst = src;

  }
  else if( _.objectIs( src ) || _.hasLength( src ) )
  {

    _.each( src,function( e,k,i ){
      dst[ k ] = e;
    });

  }
  else
  {

    dst = src;

  }

  return dst;
}

//

var entityClone = function( src,options )
{
  var result;

  //throw 'not stable';

  if( options !== undefined && !_.objectIs( options ) )
  throw _.err( 'wTools.entityClone:','need options' );

  var options = options || {};

  if( options.forWorker === undefined ) options.forWorker = 0;

  if( options.depth === undefined ) options.depth = 16;

  if( options.useClone === undefined ) options.useClone = 1;

  if( options.depth < 0 )
  {
    if( options.silent ) console.log( 'wTools.entityClone: overflow' );
    else throw _.err( 'wTools.entityClone:','overflow' );
  }

  _assert( !options.forWorker,'forWorker is deprecated' );

  //

  if( !src ) return src;

  if( options.useClone && _.routineIs( src.clone ) )
  {
    result = src.clone();
  }
  else if( arrayIs( src ) )
  {

    result = [];
    src.forEach(function( child, index, array ) {
      result[index] = entityClone( child,options );
    });

  }
  else if( _.objectIs( src ) )
  {

    result = {};
    var proto = Object.getPrototypeOf( src );
    var result = Object.create( proto );
    for( var s in src )
    {
      if( !_ObjectHasOwnProperty.call( src,s ) )
      continue; // xxx
      var c = entityClone( src[ s ],{
        depth: options.depth-1,
        silent:options.silent,
        forWorker: options.forWorker,
      });
      result[s] = c;
    }

  }
  else if( src.constructor )
  {

    if( options.forWorker )
    {
      var good = _.strIs( src ) || _.numberIs( src ) || _.dateIs( src ) || _.boolIs( src ) || _.regexpIs( src ) || _.bufferIs( src );
      if( good )
      {
        return src;
      }
      else
      {
        return;
      }
    }
    else
    {
      if( _.strIs( src ) || _.numberIs( src ) || _.dateIs( src ) || _.boolIs( src ) || _.regexpIs( src ) )
      result = src.constructor( src );
      else if( _.routineIs( src ) )
      result = src;
      else
      result = new src.constructor( src );
    }

  }
  else
  {

    result = src;

  }

  return result;
}

//

var entityCopy = function( dst,src,onRecursive )
{
  var result;

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( arguments.length < 3 || _.routineIs( onRecursive ) );

  if( src === null )
  {

    result = src;

  }
  else if( dst && _.routineIs( dst.copy ) )
  {

    dst.copy( src );

  }
  else if( src && _.routineIs( src.clone ) )
  {

    if( dst instanceof src.constructor )
    {
      throw _.err( 'not tested' );
      result = src.clone( dst );
    }
    else if( _.atomicIs( dst ) )
    {
      result = src.clone();
    }
    else throw _.err( 'unexpected' );

  }
  else if( src && _.routineIs( src.slice ) )
  {

    result = src.slice( 0 );

  }
  else if( dst && _.routineIs( dst.set ) )
  {

    dst.set( src );

  }
  else if( _.objectIs( src ) )
  {

    if( onRecursive )
    result = _.mapClone( src,{ onCopyField : onRecursive, dst : _.atomicIs( dst ) ? {} : dst } );
    else
    result = _.mapClone( src );

  }
  else
  {

    result = src;

  }

  return result;
}

//

var entityCopyField = function( dstContainer,srcContainer,name,onRecursive )
{
  var result;
  var name = _.nameUnfielded( name ).coded;

  _.assert( arguments.length === 3 || arguments.length === 4 );

  if( onRecursive )
  result = entityCopy( dstContainer[ name ],srcContainer[ name ],onRecursive );
  else
  result = entityCopy( dstContainer[ name ],srcContainer[ name ] );

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

var entityAssignField = function( dstContainer,srcValue,name,onRecursive )
{
  var result;
  var name = _.nameUnfielded( name ).coded;

  _.assert( arguments.length === 3 || arguments.length === 4 );

  if( onRecursive )
  {
    throw _.err( 'not tested' );
    result = entityCopy( dstContainer[ name ],srcValue,onRecursive );
  }
  else
  result = entityCopy( dstContainer[ name ],srcValue );

  if( result !== undefined )
  dstContainer[ name ] = result;

  return result;
}

//

var entityHasNan = function( src )
{

  var result = false;
  if( src === undefined )
  {
    return true;
  }
  else if( _.numberIs( src ) )
  {
    return isNaN( src );
  }
  else if( _.arrayIs( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
    if( _.numberHasNan( src[s] ) )
    {
      return true;
    }
  }
  else if( _.objectIs( src ) )
  {
    for( s in src )
    if( _.numberHasNan( src[s] ) )
    {
      return true;
    }
  }

  return result;
}

//

var entityHasUndef = function( src )
{

  var result = false;
  if( src === undefined )
  {
    return true;
  }
  else if( _.arrayIs( src ) )
  {
    for( var s = 0 ; s < src.length ; s++ )
    if( _.hasUndef( src[s] ) )
    {
      return true;
    }
  }
  else if( _.objectIs( src ) )
  {
    for( s in src )
    if( _.hasUndef( src[s] ) )
    {
      return true;
    }
  }
  return result;

}

//

/**
 * Deep equaliser of 2 entities.
 * @param {object} src1 - entity to compare.
 * @param {object} src2 - entity to compare.
 * @param {object} options - options.
 * @method entitySame
 * @memberof wTools#
 */

var entitySame = function entitySame( src1,src2,options )
{

  var _sameNumbers = function( a,b )
  {
    if( a === b )
    return true;
    if( isNaN( a ) === true && isNaN( b ) === true )
    return true;
    return Math.abs( a-b ) <= EPS;
  }

  var sameNumbers = function( a,b )
  {
    return a === b;
  }

  var def =
  {
    onSameNumbers : sameNumbers,
    contain : 0,
    strict : 1,
    lastPath : '',
  }

  Object.freeze( def );

  return function entitySame( src1,src2,options )
  {

    _assert( arguments.length === 2 || arguments.length === 3 );
    _assert( options === undefined || _.objectIs( options ), '_.toStrFine:','options must be object' );
    var options = options || {};

    _.assertMapOnly( options,def );
    _.mapSupplement( options,def );

    return _entitySame( src1,src2,options,'' );
  }

}();

//

var _entitySame = function _entitySame( src1,src2,options,path )
{

  options.lastPath = path;

  _.assert( arguments.length === 4 );

  if( options.strict )
  {
    if( _ObjectToString.call( src1 ) !== _ObjectToString.call( src2 ) )
    return false;
  }
  else
  {
    if( _ObjectToString.call( src1 ) !== _ObjectToString.call( src2 ) && src1 != src2 )
    return false;
  }

  if( _.arrayLike( src1 ) )
  {
    if( !src2 )
    return false;
    if( src1.constructor !== src2.constructor )
    return false;
    if( !options.contain )
    if( src1.length !== src2.length )
    return false;
    for( var k = 0 ; k < src2.length ; k++ )
    if( !_entitySame( src1[ k ], src2[ k ], options, path + '.' + k ) )
    return false;
  }
  else if( _.objectIs( src1 ) )
  {
    if( !options.contain )
    if( _.entityLength( src1 ) !== _.entityLength( src2 ) )
    return false;
    for( var k in src2 )
    if( !_entitySame( src1[ k ], src2[ k ], options, path + '.' + k ) )
    return false;
  }
  else if( _.numberIs( src1 ) )
  {
    return options.onSameNumbers( src1,src2 );
  }
  else
  {
    if( options.strict )
    {
      if( src1 !== src2 )
      return false;
    }
    else
    {
      if( src1 != src2 )
      return false;
    }
  }

  return true;
}

//

/**
 * Deep strict equaliser of 2 entities.
 * @param {object} src1 - entity to compare.
 * @param {object} src2 - entity to compare.
 * @param {object} options - options.
 * @method entityIdentical
 * @memberof wTools#
 */

var entityIdentical = function entityIdentical( src1,src2,options )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  var options = _.mapSupplement( options || {},
  {
    strict : 1,
  });

  return _.entitySame( src1,src2,options );
}

//

/**
 * Deep soft equaliser of 2 entities.
 * @param {object} src1 - entity to compare.
 * @param {object} src2 - entity to compare.
 * @param {object} options - options.
 * @method entityEquivalent
 * @memberof wTools#
 */

var entityEquivalent = function entityEquivalent( src1,src2,options )
{
  var EPS = options.eps;
  if( EPS === undefined )
  EPS = 1e-5;
  delete options.eps;

  _.assert( arguments.length === 2 || arguments.length === 3 );

  var _sameNumbers = function( a,b )
  {
    if( a === b )
    return true;
    if( isNaN( a ) === true && isNaN( b ) === true )
    return true;
    return Math.abs( a-b ) <= EPS;
  }

  var options = _.mapSupplement( options || {},
  {
    strict : 0,
    onSameNumbers : _sameNumbers,
  });

  return _.entitySame( src1,src2,options );
}

//

/**
 * Deep contain equaliser of 2 entities.
 * @param {object} src1 - entity to compare.
 * @param {object} src2 - entity to compare.
 * @param {object} options - options.
 * @method entityContain
 * @memberof wTools#
 */

var entityContain = function entityContain( src1,src2,options )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  var options = _.mapSupplement( options || {},
  {
    strict : 1,
    contain : 1,
  });

  return _.entitySame( src1,src2,options );
}

//

var entityLength = function( src )
{
  if( src === undefined ) return 0;
  if( _.arrayLike( src ) )
  return src.length;
  else if( _.objectLike( src ) )
  return _.mapKeys( src ).length;
  else return 1;
}

//

var entityWithKeyRecursive = function( src,key,onEach )
{
  var i = 0;

  if( key in src )
  {
    if( onEach ) onEach.call( src,src[ key ],key,i );
    return src[ key ];
  }

  _.eachRecursive( src,function( e,k,i )
  {

    if( k === key )
    {
      if( onEach ) onEach( e,k,i );
      return { value: src[ key ], key: key, index: i, container : src };
    }

  });
}

//

var entityValueWithIndex = function( src,index )
{

  if( _.arrayIs( src ) )
  {
    return src[ index ];
  }
  else if( _.objectIs( src ) )
  {
    var i = 0;
    for( var s in src )
    {
      if( i === index ) return src[ s ];
      i++;
    }
  }
  else if( _.strIs( src ) )
  {
    return src[ index ];
  }

}

//

var entityKeyWithValue = function( src,value )
{

  var result = null;

  if( _.arrayIs( src ) )
  {
    result = src.indexOf( value );
  }
  else if( _.objectIs( src ) )
  {
    var i = 0;
    for( var s in src )
    {
      if( src[s] == value ) return s;
    }
  }
  else if( _.strIs( src ) )
  {
    result = src.indexOf( value );
  }

  if( result === -1 ) result = null;
  return result;
}

//

var entitySelect = function( container,query )
{

  _.assert( arguments.length === 2 || arguments.length === 1 );

  if( arguments.length === 2 )
  var options = _entitySelectAdjust( arguments[ 0 ],arguments[ 1 ] )
  else
  var options = _entitySelectAdjust( arguments[ 0 ] );

  var result = _entitySelect( options );
  return result;
}

//

var entitySelectSet = function( container,query,value )
{
  _.assert( arguments.length === 3 || arguments.length === 1 );

  if( arguments.length === 3 )
  {
    var options = _entitySelectAdjust( arguments[ 0 ],arguments[ 1 ] );
    options.set = value;
  }
  else
  {
    var options = _entitySelectAdjust( arguments[ 0 ] );
    _.assert( _.mapOwn( options,{ set : 'set' } ) );
  }

  var result = _entitySelect( options );
  return result;
}

//

var _entitySelectAdjust = function( container,query )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  var delimeter = '.';

  if( arguments.length === 1 )
  {
    var options = container;
    _.assert( _.strIs( options.query ) );
    delimeter = options.delimeter || delimeter;
    options.qarrey = options.query.split( delimeter );
    delete options.delimeter;
    delete options.query;
  }
  else
  {
    var options = {};
    options.container = container;
    options.qarrey = query.split( delimeter );
  }

  if( options.qarrey[ 0 ] === '' )
  options.qarrey.splice( 0,1 );

  if( options.undefinedForNone === undefined )
  options.undefinedForNone = 1;

  return options;
}

//

var _entitySelect = function( options )
{

  _.assert( arguments.length === 1 );
  _.assertMapOnly( options,_entitySelect.defaults );

  var isSet = _.mapOwn( options,{ set : 'set' } );
  var result;
  var container = options.container;
  var name = options.qarrey[ 0 ];

  if( !options.qarrey.length )
  return container;

  if( _.atomicIs( container ) )
  {
    if( options.undefinedForNone )
    return undefined;
    else
    throw _.err( 'cant select',options.qarrey.join( '  ' ),'from atomic',container );
  }

  var o = _.mapExtend( {},options );
  o.qarrey = options.qarrey.slice( 1 );

  if( isSet )
  o.set = options.set;

  //

  var _select = function( name )
  {

    if( !o.qarrey.length && isSet )
    container[ name ] = options.set;

    var field = container[ name ];

    if( field === undefined && isSet )
    {
      debugger;
      container[ name ] = field = {};
    }

    var selectOptions = _.mapExtend( {},o,{ container : field } );
    return _entitySelect( selectOptions );
  }

  //

  if( name === '*' )
  {

    result = new container.constructor();
    _.each( container,function( e,name,c )
    {
      result[ name ] = _select( name );
    });

  }
  else
  {
    result = _select( name );
  }

  return result;
}

_entitySelect.defaults =
{
  qarrey : null,
  container : null,
  set : null,
  undefinedForNone : 1,
}

//
/*
var strFormat = function( src,context )
{
  if( arguments.length === 1 )
  {
    src = arguments[ 0 ].src;
    context = arguments[ 0 ].context;
  }
  else
  {
    _.assert( arguments.length === 2 );
  }

  _.assert( _.strIs( src ) );
  _.assert( context !== undefined );

  var regexp = /[{]([^{}]+)[}]/g;
  var handleReplace = function( match,p1,offset,s )
  {
    _.assert( _.numberIs( offset ) );

    debugger; xxx;
    //  _.entitySelect( context, );

  }

  var result = this.replace( regexp,handleReplace );

  return result;
}
*/
// --
// iterator
// --

var until = function()
{

  var i = 0;
  var found = 0;

  var onEach = arguments[ arguments.length-1 ];
  if( !_.routineIs( onEach ) ) throw '_.each: onEach is not routine';

  for( var arg = 0, l = arguments.length-1 ; arg < l ; arg++ )
  {

    var src = arguments[ arg ];

    if( _.arrayIs( src ) )
    {

      for( var a = 0 ; a < src.length ; a++ )
      {
        found = onEach.call( src,src[a],a,i );
        i++;
      }

    }
    else if( _.objectIs( src ) )
    {

      for( var a in src )
      {
        found = onEach.call( src,src[a],a,i );
        i++;
      }

    }
    else if( src !== undefined )
    {

      found = onEach.call( src,src );
      i++;

    }

    if( found ) return i;
  }

  return i;
}

//

var each = function()
{

  var i = 0;
  var onEach = arguments[ arguments.length-1 ];
  if( !_.routineIs( onEach ) ) throw '_.each: onEach is not routine';

  for( var arg = 0, l = arguments.length-1 ; arg < l ; arg++ )
  {

    var src = arguments[ arg ];

    if( _.arrayIs( src ) || ( !_.objectIs( src ) && _.arrayLike( src ) ) )
    {

      for( var a = 0 ; a < src.length ; a++ )
      {
        onEach.call( src,src[a],a,i );
        i++;
      }

    }
    else if( _.objectIs( src ) || _.objectLike( src ) )
    {

      for( var a in src )
      {
        onEach.call( src,src[a],a,i );
        i++;
      }

    }
    else if( src !== undefined )
    {

      onEach.call( src,src );
      i++;

    }

  }

  return i;
}

//

var eachSample = function( samples,onEach )
{

  var direct = 1;
  var options = {};
  if( _.objectIs( samples ) )
  {
    options = arguments[ 0 ];
    samples = options.samples;
    onEach = options.onEach;
    direct = options.direct !== undefined ? options.direct : 1;
    _.assert( arguments.length === 1 );
  }
  else
  {
    _.assert( arguments.length === 2 );
  }

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.arrayIs( samples ) );
  _.assert( _.routineIs( onEach ) );

  var sample = [];
  var counter = [];
  var len = [];
  var index = 0;

  //

  var firstSample = function()
  {

    for( var s = 0, l = samples.length; s < l ; s++ )
    {
      len[ s ] = samples[ s ].length;
      counter[ s ] = 0;
      sample[ s ] = samples[ s ][ counter[ s ] ];
      if( !len[ s ] ) return 0;
    }

    return 1;
  }

  //

  var _nextSample = function( s )
  {

    counter[ s ]++;
    if( counter[ s ] >= len[ s ] )
    {
      counter[ s ] = 0;
      sample[ s ] = samples[ s ][ counter[ s ] ];
    }
    else
    {
      sample[ s ] = samples[ s ][ counter[ s ] ];
      index += 1;
      return 1;
    }

  }

  //

  var nextSample = function()
  {

    if( direct ) for( var s = 0, l = samples.length; s < l ; s++ )
    {
      if( _nextSample( s ) )
      return 1;
    }
    else for( var s = samples.length - 1, l = samples.length; s >= 0 ; s-- )
    {
      if( _nextSample( s ) )
      return 1;
    }

    return 0;
  }

  //

  if( !_.arrayIs( samples ) )
  throw _.err( 'eachSample:','array only supported' );

  if( !firstSample() )
  return index;

  do
  {
    onEach.call( sample,sample,index );
  }
  while( nextSample() );

  return index;
}

//

var eachRecursive = function() {

  var i = 0;

  //var handlEach = function( e,k,i ){
  //
  //}

  var onEach = arguments[arguments.length-1];
  if( !_.routineIs( onEach ) ) throw '_.each: onEach is not routine';

  for( var arg = 0, l = arguments.length-1 ; arg < l ; arg++ )
  {

    var src = arguments[arg];

    if( _.arrayIs( src ) )
    {

      for( var a = 0 ; a < src.length ; a++ )
      {
        if( _.arrayIs( src[a] ) || _.objectIs( src[a] ) )
        {
          i += eachRecursive( src[a],onEach );
        }
        else
        {
          onEach.call( src,src[a],a,i );
          i++;
        }
      }

    }
    else if( _.objectIs( src ) )
    {

      for( var a in src )
      {
        if( _.arrayIs( src[a] ) || _.objectIs( src[a] ) )
        {
          i += eachRecursive( src[a],onEach );
        }
        else
        {
          onEach.call( src,src[a],a,i );
          i++;
        }
      }

    }
    else
    {
      onEach.call( null,src,null,i );
    }

  }

  return i;
}

// --
// diagnostics
// --

var _err = function _err( o )
{
  var result;

  if( arguments.length !== 1 )
  throw '_err : expects single argument';

  if( !_.arrayLike( o.args ) )
  throw '_err : o.args should be array like';

  if( !_.numberIs( o.level ) )
  o.level = _err.defaults.level;

  if( o.args[ 0 ] === 'not tested' || o.args[ 0 ] === 'unexpected' )
  debugger;

  /*Error.stackTraceLimit = 99;*/

  for( var a = 0 ; a < o.args.length ; a++ )
  {
    if( o.args[ a ] instanceof Error )
    {
      result = o.args[ a ];
      o.args[ a ] = result.originalMessage || result.message || result.msg || result.constructor.name || 'Unknown error';
      break;
    }
  }

  var originalMessage = '';
  var fileName,lineNumber;

  for( var a = 0 ; a < o.args.length ; a++ )
  {
    var argument = o.args[ a ];
    var str;

    if( argument )
    {
      if( _.routineIs( argument.toStr ) ) str = argument.toStr();
      else if( _.strIs( argument.originalMessage ) ) str = argument.originalMessage;
      else if( _.strIs( argument.message ) ) str = argument.message;
      else if( !_.atomicIs( argument ) && _.routineIs( argument.toString ) ) str = argument.toString();
      else str = String( argument );
    }
    else str = String( argument );

    if( _.objectLike( argument ) && !fileName )
    {

      if( !fileName )
      fileName = argument.fileName || argument.filename;

      if( lineNumber === undefined )
      lineNumber = argument.linenumber;

      if( lineNumber === undefined )
      lineNumber = argument.lineNumber;

      if( lineNumber === undefined )
      lineNumber = argument.lineno;

    }

    if( _.strIs( str ) && str[ str.length-1 ] === '\n' )
    originalMessage += str;
    else originalMessage += str + ' ';
  }

  //

  if( originalMessage[ 0 ] !== '\n' )
  originalMessage = '\n' + originalMessage;
  originalMessage = '\n' + 'caught ' + _.stack().split( '\n' )[ o.level ] + originalMessage;

  //

  if( !result )
  {
    var e = new Error();
    result = new Error( originalMessage + '\n' + ( e.stack || '' ) + '\n' );
    result.originalStack = e.stack;
  }
  else try
  {
    result.message = '';
    result.message = originalMessage + '\n' + ( result.originalStack || result.stack || '' ) + '\n';
    /*result = new result.constructor( originalMessage + '\n' + result.stack + '\n',fileName,lineNumber );*/
  }
  catch( e )
  {
    throw 'err error';
    result = new result.constructor( originalMessage + '\n' + ( result.stack || '' ) + '\n' );
  }

  result.originalMessage = originalMessage;

  return result;
}

_err.defaults =
{
  level : 0,
  args : null,
}

//

var err = function err()
{
  return _err
  ({
    args : arguments,
    level : 2,
  });
}

//

var errLog = function errLog()
{

  _.assert( arguments.length === 1 );

  var c = _global_.logger || console;
  var err = _err
  ({
    args : arguments,
    level : 2,
  });

  debugger;
  if( _.routineIs( err.toString ) )
  {

    var messageWas = err.message;
    //if( err.originalMessage )
    //err.message = err.originalMessage

    c.error( err.toString() );

    //err.message = messageWas;

  }
  else
  {

    c.error( err );

  }

  return err;
}

//

/** @inline */

var assert = function assert( condition )
{

  /*return;*/
  if( DEBUG === false )
  return;

  if( !condition )
  {
    debugger;
    if( arguments.length === 1 )
    throw _.err( 'Assertion failed' );
    else if( arguments.length === 2 )
    throw _.err( arguments[ 1 ] );
    else if( arguments.length === 3 )
    throw _.err( arguments[ 1 ],arguments[ 2 ] );
    else
    throw _.err.apply( _,_arraySlice( arguments,1 ) );
  }

  return;
}

//

var assertMapNoUndefine = function assertMapNoUndefine( src )
{

  if( DEBUG === false )
  return;

  var hasMsg = arguments.length > 1;

  for( var s in src )
  if( src[ s ] === undefined )
  throw _.err( ( 'Object ' + ( hasMsg ? _.arraySlice( arguments,1,arguments.length ) : '' ) + ' should have no undefines, but has' ) + ': ' + s );

}

//

var assertMapOnly = function assertMapOnly( src )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapBut.apply( this,args ) );

  if( but.length )
  {
    debugger;
    throw _.err( hasMsg ? arguments[ l-1 ] : '','Object should have no fields:',but.join( ',' ) );
  }
}

//

var assertMapOwnOnly = function assertMapOwnOnly( src )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var but = Object.keys( _.mapOwnBut.apply( this,args ) );

  if( but.length )
  {
    debugger;
    throw _.err( hasMsg ? arguments[ l-1 ] : '','Object should have no fields:',but.join( ',' ) );
  }

}

//

var assertMapAll = function( src,all,msg )
{

  _assert( arguments.length === 2 || arguments.length === 3 );
  _assert( arguments.length === 2 || _.strIs( msg ) );

  if( DEBUG === false )
  return;

  var but = Object.keys( _.mapBut( all,src ) );

  if( but.length )
  throw _.err( msg ? msg : '','Object should have fields:',but.join( ',' ) );

}

//

var assertMapOwnAll = function( src,all,msg )
{

  _assert( arguments.length === 2 || arguments.length === 3 );
  _assert( arguments.length === 2 || _.strIs( msg ) );

  if( DEBUG === false )
  return;

  var but = Object.keys( _.mapOwnBut( all,src ) );

  if( but.length )
  throw _.err( msg ? msg : '','Object should have fields:',but.join( ',' ) );

}

//

var assertMapNone = function( src )
{

/*
  throw _.err( 'not tested' );
*/

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var args = hasMsg ? _.arraySlice( arguments,0,l-1 ) : arguments;
  var none = _.mapScreens.apply( this,args );

  for( var n in none )
  {
    for( var a = 1 ; a < arguments.length ; a++ )
    if( arguments[ a ][ n ] !== src[ n ] )
    break;
    if( a === arguments.length )
    delete none[ n ];
  }

  if( Object.keys( none ).length )
  throw _.err( hasMsg ? arguments[ l-1 ] : '','Object should not have fields:',none.join( ',' ) );

}

//

var assertMapOwnNone = function( src,none )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  if( hasMsg ) l -= 1;

/*
  if( l > 2 )
  {
    var args =_ArraySlice.call( arguments,1,l ); debugger;
    none = _.mapCopy.apply( this,args );
  }

  var has = Object.keys( _._mapScreens
  ({
    filter : filter.own(),
    iterateObject : none,
    includeObject : src,
    srcObject : src,
    dstObject : {},
  }));
*/

  if( l > 2 )
  {
    var args =_ArraySlice.call( arguments,1,l ); debugger;
    none = _.mapCopy.apply( this,args );
  }

  var has = Object.keys( _._mapScreen
  ({
    filter : filter.own(),
    screenObjects : none,
    srcObjects : src,
  }));

  if( has.length )
  throw _.err( hasMsg ? arguments[ l-1 ] : '','Object should not have fields:',has.join( ',' ) );

}

//

var warn = function( condition )
{

  if( !condition )
  {
    console.warn.apply( console,[].slice.call( arguments,1 ) );
  }

}

//

var stack = function()
{

  var e = new Error();
  var result = e.stack;

  result = result.split( '\n' );

  result.splice( 0,2 );
  result = String( result.join( '\n' ) );
  return result;
}

//

var diagnosticWatchObject = function diagnosticWatchObject( dst,options )
{
  var options = options || {};
  if( options.fieldName )
  options.fieldNames = _.nameFielded( options.fieldNames );

  Object.observe( dst,function( changes )
  {
    for( var c in changes )
    {
      var change = changes[ c ];
      if( options.fieldNames )
      if( !options.fieldNames[ change.name ] ) return;
      console.log( change.type,change.name,change.object[ change.name ] );
      //if( !change.object[ change.name ] )
      //console.log( change.name,change.object[ change.name ] );
    }
    //debugger;
  });
}

//

/*
_.diagnosticWatchFields
({
  dst : _global_,
  names : 'Uniforms',
});
_.diagnosticWatchFields
({
  dst : session.filterVisibility,
  names : 'changed',
});
*/
/*
_.diagnosticWatchFields
({
  dst : _global_,
  names : 'Config',
});
*/

var diagnosticWatchFields = function( options )
{
  var options = options || {};

  if( options.names )
  options.names = _.nameFielded( options.names );
  else
  options.names = options.dst;

  _assert( arguments.length === 1 );
  _.assertMapOnly( options,diagnosticWatchFields.defaults );
  _.mapComplement( options,diagnosticWatchFields.defaults );
  _assert( options.dst );
  _assert( options.names );

  for( var f in options.names ) ( function()
  {

    var fieldName = f;
    var fieldSymbol = Symbol.for( f );
    options.dst[ fieldSymbol ] = options.dst[ f ];

    //

    var read = function read()
    {
      var result = options.dst[ fieldSymbol ];
      if( options.printValue )
      console.log( 'reading ' + fieldName + ' ' + _.toStr( result ) );
      else
      console.log( 'reading ' + fieldName );
      return result;
    }

    //

    var write = function write( src )
    {
      if( options.printValue )
      console.log( 'writing ' + fieldName + ' ' + _.toStr( src ) );
      else
      console.log( 'writing ' + fieldName );
      debugger;
      options.dst[ fieldSymbol ] = src;
    }

    //

    debugger;
    Object.defineProperty( options.dst, fieldName,
    {
      enumerable: true,
      configurable: true,
      get: read,
      set: write,
    });

  })();

}

diagnosticWatchFields.defaults =
{
  printValue : false,
  names : null,
  dst : null,
}

// --
// name and symbol
// --

/**
 * Produce fielded name from string.
 * @param {string} nameString - object coded name or string.
 * @return {object} nameKeyValue - name in key/value format.
 * @method nameFielded
 * @memberof wTools#
 */

var nameFielded = function nameFielded( nameString )
{

  if( _.objectIs( nameString ) )
  {
    return nameString;
  }
  else if( _.strIs( nameString ) )
  {
    var name = {};
    name[ nameString ] = nameString;
    return name;
  }
  else throw _.err( 'nameFielded:','unknown arguments' );

}

//

/**
 * Returns name splitted in coded/raw fields.
 * @param {object} nameObject - fielded name or name as string.
 * @return {object} name splitted in coded/raw fields.
 * @method nameUnfielded
 * @memberof wTools#
 */

var nameUnfielded = function nameUnfielded( nameObject )
{
  var name = {};

  if( _.mapIs( nameObject ) )
  {
    var keys = Object.keys( nameObject );
    _.assert( keys.length === 1 );
    name.coded = keys[ 0 ];
    name.raw = nameObject[ name.coded ];
  }
  else if( _.strIs( nameObject ) )
  {
    name.raw = nameObject;
    name.coded = nameObject;
  }
  else if( _.symbolIs( nameObject ) )
  {
    name.raw = nameObject;
    name.coded = nameObject;
  }
  else throw _.err( 'nameUnfielded:','Unknown arguments' );

  _assert( arguments.length === 1 );
  _assert( _.strIs( name.raw ) || _.symbolIs( name.raw ),'nameUnfielded:','not a string, something wrong:',nameObject );
  _assert( _.strIs( name.coded ) || _.symbolIs( name.coded ),'nameUnfielded:','not a string, something wrong:',nameObject );

  return name;
}

//

/**
 * Returns name splitted in coded/coded fields. Drops raw part replacing it by coded.
 * @param {object} namesMap - fielded names.
 * @return {object} expected map.
 * @method namesCoded
 * @memberof wTools#
 */

var namesCoded = function( namesMap )
{
  var result = {}

  if( _assert )
  _assert( arguments.length === 1 );
  if( _assert )
  _assert( _.objectIs( namesMap ) );

  for( var n in namesMap )
  result[ n ] = n;

  return result;
}

// --
// type test
// --

var objectIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Object]';
}

//

var objectLike = function( src )
{
  if( objectIs( src ) ) return true;
  if( routineIs( src ) ) return true;
  if( atomicIs( src ) ) return false;

  for( var s in src )
  return true;

  return false; /* isObject */
}

//

var mapIs = function( src )
{
  return _.objectIs( src ) && src.__proto__.__proto__ === null;
  /*return _.objectIs( src ) && src.__proto__ === Object.prototype;*/
}

/**
 * Checks incoming param whether it is an array. 
 * Returns "true" if incoming param is array. Othervise "false" returned.
 * @param {object} src - the object to check whether it is an array.
 * @return {boolean} value.
 * @global variable _ObjectToString used.
 * @usage example: var arr = [1, 2]; arrayIs(arr) // output: true; arrayIs(10) //output: false;
 * @method arrayIs.
 * @memberof wTools#.
 */

var arrayIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Array]';
}

//

var arrayLike = function( src )
{
  if( atomicIs( src ) ) return false;

  if( _.routineIs( src ) ) return false;
  if( _.objectIs( src ) ) return false;
  if( _.strIs( src ) ) return false;

  if( !_.numberIs( src.length ) ) return false;

  return true;
}

//

var hasLength = function( src )
{
  if( src === undefined || src === null ) return false;
  if( _.numberIs( src.length ) ) return true;
  return false;
}

/**
 * function strIs checks incoming param whether it is string. 
 * Returns "true" if incoming param is string. Othervise "false" returned.
 * @param {object} src - the object to check whether it is number.
 * @return {boolean} value.
 * @global variable _ObjectToString used.
 * @usage example: strIs('song') // output: true; strIs(10) //output: false;
 * @method strIs.
 * @memberof wTools#.
 */

var strIs = function( src )
{
  var result = _ObjectToString.call( src ) === '[object String]';
  return result;
}

//

var symbolIs = function( src )
{
  var result = _ObjectToString.call( src ) === '[object Symbol]';
  return result;
}

/**
 * function numberIs checks incoming param whether it is number. 
 * Returns "true" if incoming param is number. Othervise "false" returned.
 * @param {object} src - the object to check whether it is number.
 * @return {boolean} value.
 * @global variable _ObjectToString used.
 * @usage example: numberIs(5) // output: true; numberIs('song') //output: false;
 * @method numberIs
 * @memberof wTools#
 */

var numberIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Number]';
}

//

var boolIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Boolean]';
}

//

var numberIsRegular = function( src )
{
  return _.numberIs( src ) && !isNaN( src ) && src !== +Infinity && src !== -Infinity;
}

//

var dateIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Date]';
}

//

var bufferIs = function( src )
{
  var type = _ObjectToString.call( src );

  if( !/\wArray/.test( type ) )
  return false;

  if( typeof Buffer !== 'undefined' )
  if( src instanceof Buffer )
  return false;

  return true;
}

//

var bufferArrayIs = function( src )
{
  var type = _ObjectToString.call( src );
  var result = type === '[object ArrayBuffer]';
  return result;
}

//

var bufferNodeIs = function( src )
{
  if( typeof Buffer !== 'undefined' )
  return src instanceof Buffer;
  return false;
}

//

var argumentsIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Arguments]';
}

//

var rowIs = function( src )
{
  if( src && src._rowArray )
  return true;
  else return false;
}

//

var boolIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Boolean]';
}

//

var routineIs = function( src )
{
  return _ObjectToString.call( src ) === '[object Function]';
}

//

var routineWithNameIs = function( src )
{
  if( _ObjectToString.call( src ) !== '[object Function]' )
  return false;
  if( !src.name )
  return false;
  return true;
}

//

var regexpIs = function( src )
{
  return _ObjectToString.call( src ) === '[object RegExp]';
}

//

var definedIs = function( src )
{
  return src !== undefined && src !== null && src !== NaN;
}

//

var eventIs = function( src )
{
  if( src instanceof Event )
  return true;
  if( typeof jQuery === 'undefined' )
  return false;
  if( src instanceof jQuery.Event )
  return true;
  return false;
}

//

var htmlIs = function( src )
{
  return _ObjectToString.call( src ).indexOf( '[object HTML' ) !== -1;
}

//

var jqueryIs = function( src )
{
  if( typeof jQuery === 'undefined' )
  return;1
  return src instanceof jQuery;
}

//

var domIs = function( src )
{
  return src instanceof Node;
  /*return src instanceof Element;*/
}

//

var domableIs = function( src )
{
  return strIs( src ) || domIs( src ) || jqueryIs( src );
}

//

var errorIs = function( src )
{
  return src instanceof Error;
  //return _ObjectToString.call( src ) === '[object Error]';
}

//

var atomicIs = function atomicIs( src )
{
  return numberIs( src ) || boolIs( src ) || strIs( src ) || src === null || src === undefined;
}

//

var typeOf = function( src )
{
  if( src === null || src === undefined )
  return null
  else if( numberIs( src ) || boolIs( src ) || strIs( src ) )
  return src.constructor;
  else
  {
    _assert( _.routineIs( src.constructor ) && src instanceof src.constructor );
    return src.constructor;
  }
}

//

var typeIsBuffer = function( src )
{
  if( !src ) return false;
  if( !_.numberIs( src.BYTES_PER_ELEMENT ) ) return false;
  if( !_.strIs( src.name ) ) return false;
  return src.name.indexOf( 'Array' ) !== -1;

/*
  var types = [ _global_.Int8Array, _global_.Uint8Array, _global_.Uint8ClampedArray, _global_.Int16Array, _global_.Uint16Array, _global_.Int32Array, _global_.Uint32Array, _global_.Float32Array, _global_.Float64Array ];
  for( var t = 0 ; t < types.length ; t++ )
  {
    var type = types[ t ];
    if( !type ) continue;
    if( src === type ) return true;
  }
  return false;
*/

}

//

var toBool = function( src )
{
  if( strIs( src ) )
  {
    src = src.toLowerCase();
    if( src == '0' ) return false;
    if( src == 'false' ) return false;
    if( src == 'null' ) return false;
    if( src == 'undefined' ) return false;
    if( src == '' ) return false;
    return true;
  }
  return Boolean( src );
}

// --
// str
// --

/*
var toStrFast = function( src ) {

  var result = '';
  if( arrayIs( src ) )
  {
    if( src.length > 0 ) result = toStr( src[0] );
    for( var i = 1 ; i < src.length ; i++ )
    result += ', ' + toStr( src[i] );
  }
  else if( src instanceof THREE.Vector2 )
  {
    result = '( ' + toStr( src.x ) + ', ' + toStr( src.y ) + ' )';
  }
  else if( src instanceof THREE.Vector3 )
  {
    result = '( ' + toStr( src.x ) + ', ' + toStr( src.y ) + ', ' + toStr( src.z ) + ' )';
  }
  else if( src instanceof THREE.Vector4 )
  {
    result = '( ' + toStr( src.x ) + ', ' + toStr( src.y ) + ', ' + toStr( src.z ) + ', ' + toStr( src.w ) + ' )';
  }
  else if( src instanceof THREE.Matrix4 )
  {
    for( var i = 0 ; i < 4*4 ; i+=4 )
    result += '\n( ' + toStr( src.elements[i+0] ) + ', ' + toStr( src.elements[i+1] ) + ', ' + toStr( src.elements[i+2] ) + ', ' + toStr( src.elements[i+3] ) + ' )';
  }
  else
  {
    result = src;
  }
  return result;

}
*/

// --
// number
// --

var numberRandomInt = function( range )
{

  _assert( _.arrayIs( range ) || _.numberIs( range ) );
/*
  if( range === undefined )
  range = 0;
  else
*/
  if( _.numberIs( range ) )
  range = range >= 0 ? [ 0,range ] : [ range,0 ];
  else if( _.arrayIs( range ) )
  range = range;
  else throw _.err( 'numberRandomInt','unexpected argument' );

  var result = Math.floor( range[ 0 ] + Math.random()*( range[ 1 ] - range[ 0 ] ) );

  return result;
}

//

var numberRandomIntNot = function( range )
{
  var result;
  var attempts = 10;

  if( _.numberIs( range ) )
  range = [ 0,range ];
  else if( _.arrayIs( range ) )
  range = range;
  else throw _.err( 'numberRandomInt','unexpected argument' );

  for( var attempt = 0 ; attempt < attempts ; attempt++ )
  {
    /*result = _.numberRandomInt( range ); */
    var result = Math.floor( range[ 0 ] + Math.random()*( range[ 1 ] - range[ 0 ] ) );

    var bad = false;
    for( var a = 1 ; a < arguments.length ; a++ )
    if( _.routineIs( arguments[ a ] ) )
    {
      if( !arguments[ a ]( result ) )
      bad = true;
    }
    else
    {
      if( result === arguments[ a ] )
      bad = true;
    }
    if( bad ) continue;
    return result;
  }

  console.warn( 'numberRandomIntNot:','NaN' );
  throw _.err( 'numberRandomIntNot:','NaN' );

  result = NaN;
  return result;
}

//

var numberFrom = function( src )
{
  if( strIs( src ) )
  {
    return parseFloat( src );
  }
  return Number( src );
}

// --
// str
// --

var strTypeOf = function( src )
{

  var name = _ObjectToString.call( src );
  var result = /\[(\w+) (\w+)\]/.exec( name );

  if( !result )
  throw _.err( 'strTypeOf:','unknown type',name );

  return result[ 2 ];
}

//

var str = function()
{

  var result = '';
  if( !arguments.length )
  return result;

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    if( arguments[ a ] && arguments[ a ].toStr ) result += arguments[ a ].toStr() + ' ';
    else result += String( arguments[ a ] ) + ' ';
  }

  return result;
}

//

var strBegins = function( src,begin )
{
  return src.lastIndexOf( begin,0 ) === 0;
}

//

var strEnds = function( src,end )
{
  return src.indexOf( end,src.length - end.length ) !== -1;
}

//

var strBeginRemove = function( src,begin )
{
  if( !strBegins( src,begin ) )
  return src;
  return src.substr( begin.length,src.length );
}

//

var strEndRemove = function( src,end )
{
  if( !strEnds( src,end ) )
  return src;
  debugger;
  return src.substr( src.length-end.length,src.length );
}

//

var strPrependOnce = function( src,begin )
{
  if( src.lastIndexOf( begin,0 ) === 0 )
  return src;
  else
  return begin + src;
}

//

var strAppendOnce = function( src,end )
{
  if( src.indexOf( end,src.length - end.length ) !== -1 )
  return src;
  else
  return src + end;
}

// --
// regexp
// --

var regexpModeNames = namesCoded
({
  includeAny : 'includeAny',
  includeAll : 'includeAll',
  excludeAny : 'excludeAny',
  excludeAll : 'excludeAll',
});

var regexpModeNamesToExtend = namesCoded
({
  includeAll : 'includeAll',
  excludeAny : 'excludeAny',
});

var regexpModeNamesToReplace = namesCoded
({
  includeAny : 'includeAny',
  excludeAll : 'excludeAll',
});

var regexpEscape = function( src )
{
  return src.replace( /([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1" );
}

//

var regexpForGlob = function( glob )
{
  var result = '';
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( glob ) );

  var w = 0;
  glob.replace( /(\*\*[\/\\]?)|\?|\*/g, function( matched,a,offset,str )
  {

    result += regexpEscape( glob.substr( w,offset-w ) );
    w = offset + matched.length;

    if( matched === '?' )
    result += '.';
    else if( matched === '*' )
    result += '[^\\\/]*';
    else if( matched.substr( 0,2 ) === '**' )
    result += '.*';
    else throw _.err( 'unexpected' );

  });

  result += regexpEscape( glob.substr( w,glob.length-w ) );
  if( result[ 0 ] !== '^' )
  {
    result = _.strPrependOnce( result,'./' );
    result = _.strPrependOnce( result,'^' );
  }
  result = _.strAppendOnce( result,'$' );

  return RegExp( result,'m' );
}

//

var regexpMakeArray = function( src )
{
  _.assert( _.arrayIs( src ) || _.regexpIs( src ) || _.strIs( src ) );

  src = _.arrayIron( src );

  _.each( src,function( e,k,i )
  {

    src[ k ] = _.regexpMakeExpression( e );

  });

  return src;
}

//

var regexpMakeExpression = function( src )
{

  if( _.regexpIs( src ) )
  return src;

  if( _.strIs( src ) )
  return new RegExp( _.regexpEscape( src ) );

  debugger;
  throw _.err( 'regexpMakeExpression:','unknown type of expression, expects regexp or string, but got',src );
}

//

var _regexpAny = function( arr,ins,none )
{
  _.assert( _.arrayIs( arr ) || _.regexpIs( src ) );
  _.assert( arguments.length === 3 );

  var arr = _.arrayAs( arr );
  for( var m = 0 ; m < arr.length ; m++ )
  {
    if( arr[ m ].test( ins ) )
    return m;
  }

  return arr.length ? false : none;
}

//

var _regexpAll = function( arr,ins,none )
{
  _.assert( _.arrayIs( arr ) || _.regexpIs( src ) );
  _.assert( arguments.length === 3 );

  var arr = _.arrayAs( arr );
  for( var m = 0 ; m < arr.length ; m++ )
  {
    if( !arr[ m ].test( ins ) )
    return m;
  }

  return arr.length ? true : none;
}

//

var regexpTest = function( src,ins )
{
  var result = regexpTestReason( src,ins );

  if( _.strIs( result ) )
  return false;

  if( result === true )
  return true;

  debugger;
  throw _.err( 'unexpected' );
}

//

var regexpTestReason = function( src,ins )
{

  if( !_.strIs( ins ) )
  throw _.err( 'regexpTest:','expects string',ins );

  if( !_.mapIs( src ) )
  throw _.err( 'regexpTest:','expects object',src );

  if( src.excludeAll )
  {
    var r = _._regexpAll( src.excludeAll,ins,false );
    if( r === true )
    return 'excludeAll';
  }

  if( src.excludeAny )
  {
    var r = _._regexpAny( src.excludeAny,ins,false );
    if( r !== false )
    return src.excludeAny[ r ].source;
  }

  if( src.includeAll )
  {
    var r = _._regexpAll( src.includeAll,ins,true );
    if( r !== true )
    return src.includeAll[ r ].source;
  }

  if( src.includeAny )
  {
    var r = _._regexpAny( src.includeAny,ins,true );
    if( r === false )
    return 'inlcude none from includeAny';
  }

  return true;
}

//

var regexpBut_ = function( options )
{
  var args = arguments;
  var atLeastOnce = regexpBut_.defaults.atLeastOnce;
  if( arguments.length === 1 && _.objectIs( options ) )
  {
    _.assertMapOnly( options,regexpBut_.defaults );
    _.mapComplement( options,regexpBut_.defaults );
    args = options.but;
    atLeastOnce = options.atLeastOnce;
  }

  var words = _.arrayIron( args );
  var result = '^(?:(?!';

  for( var w = 0 ; w < words.length ; w++ )
  _.assert( _.strIs( words[ w ] ) );

  result += words.join( '|' );

  if( atLeastOnce )
  result += ').)+$';
  else
  result += ').)*$';

  return new RegExp( result );
}

regexpBut_.defaults =
{
  but : null,
  atLeastOnce : true,
}

//

var regexpObjectShrink = function( result )
{

  _regexpObjectExtend
  ({
    dst : result,
    srcs : _.arraySlice( arguments,1 ),
    shrinking : 1,
  });

  return result;
}

//

var regexpObjectBroaden = function( result )
{

  _regexpObjectExtend
  ({
    dst : result,
    srcs : _.arraySlice( arguments,1 ),
    shrinking : 0,
  });

  debugger;
  throw _.err( 'not tested' );

  return result;
}

//

var _regexpObjectExtend = function( options )
{

  _.assertMapOnly( _regexpObjectExtend.defaults,options );
  _.mapComplement( options,buffersSerialize.defaults );

  _.assert( _.mapIs( options.dst ) );
  _.assert( _.arrayLike( options.srcs ) );

  var result = options.dst;
  for( var n in regexpModeNames )
  if( !result[ n ] )
  result[ n ] = [];

  for( var s = 0 ; s < options.srcs.length ; s++ )
  {

    var src = options.srcs[ s ];

    if( !_.mapIs( src ) )
    {
      debugger;
      throw _.err( 'regexpObjectExtend:','argument must be regexp object',src );
    }

    _.assertMapOnly( src,regexpModeNames );

    var toExtend = options.shrinking ? regexpModeNamesToExtend : regexpModeNames;

    for( var n in toExtend )
    if( src[ n ] )
    if( ( _.arrayIs( src[ n ] ) && src[ n ].length ) || !_.arrayIs( src[ n ] ) )
    result[ n ] = _.arrayAppendMerging( result[ n ], src[ n ] );

    if( options.shrinking )
    for( var n in regexpModeNamesToReplace )
    if( src[ n ] )
    if( ( _.arrayIs( src[ n ] ) && src[ n ].length ) || !_.arrayIs( src[ n ] ) )
    {
/*
      if( result[ n ].length )
      debugger;
*/
      result[ n ] = src[ n ];
    }

  }

  return result;
}

_regexpObjectExtend.defaults =
{
  dst : null,
  srcs : null,
  shrinking : true,
}

//

var regexpObjectMake = function( src,defaultMode )
{
  var result = {};

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.mapIs( src ) || _.arrayIs( src ) || _.regexpIs( src ) || _.strIs( src ),_.strTypeOf( src ) );

  //

  if( _.regexpIs( src ) )
  src = [ src ];

  if( _.strIs( src ) )
  src = [ new RegExp( _.regexpEscape( src ) ) ];

  if( !src )
  src = [];

  //

  if( _.arrayIs( src ) )
  {

/*
    if( defaultMode === undefined )
    defaultMode = regexpObjectMake.names.includeAny;
*/

    _.assert( arguments.length === 2 );
    _.assert( regexpObjectMake.names[ defaultMode ],'unknown mode:',defaultMode );

    if( !defaultMode )
    throw _.err( 'regexpObjectMake:','defaultMode is needed for array' );

    src = _.arrayIron( src );

    var ar = [];
    for( var s = 0 ; s < src.length ; s += 1 )
    {
      if( _.regexpIs( src[ s ] ) || _.strIs( src[ s ] ) )
      ar.push( _.regexpMakeExpression( src[ s ] ) );
      else if( _.objectIs( src[ s ] ) )
      _.regexpObjectShrink( result,_.regexpObjectMake( src[ s ] ) );
      else throw _.err( 'unexpected' );
    }

    if( result[ defaultMode ] && result[ defaultMode ].length )
    {
      var r = {};
      r[ defaultMode ] = ar;
      _.regexpObjectShrink( result,r );
    }
    else
    {
      result[ defaultMode ] = ar;
    }

    /* result[ defaultMode ] = _.regexpMakeArray( ar ); */

  }
  else if( _.mapIs( src ) )
  {

    _.each( src,function( e,k,i )
    {
      result[ k ] = _.regexpMakeArray( e );
    });

  }
  else throw _.err( 'regexpObjectMake:','unknown src',src );

  _.assertMapOnly( result,regexpObjectMake.names,'unknown regexp filters' );

  return result;
}

regexpObjectMake.names = regexpModeNames;

//

var regexpObjectBut = function()
{
  var result = _.regexpObjectMake( [],regexpObjectMake.names.includeAny );

  for( var a = 0, al = arguments.length ; a < al ; a++ )
  {
    var argument = arguments[ a ];
    var src = _.regexpObjectMake( argument,regexpObjectMake.names.includeAny );

    if( src.includeAny ) result.excludeAny = _.arrayAppendMerging( result.excludeAny || [], src.includeAny );
    if( src.excludeAny ) result.includeAny = _.arrayAppendMerging( result.includeAny || [], src.excludeAny );

    if( src.includeAll && src.includeAll.length )
    {
      if( src.includeAll.length === 1 )
      {
        result.excludeAny = _.arrayAppendMerging( result.excludeAny || [], src.includeAll );
      }
      else if( !result.excludeAll || result.excludeAll.length === 0 )
      {
        result.excludeAll = _.arrayAppendMerging( result.excludeAll || [], src.includeAll );
      }
      else throw _.err( 'regexpObjectBut:','cant combine such regexp objects with "but" combiner' );
    }

    if( src.excludeAll && src.excludeAll.length )
    {
      if( src.excludeAll.length === 1 )
      {
        result.includeAny = _.arrayAppendMerging( result.includeAny || [], src.excludeAll );
      }
      else if( !result.includeAll || result.includeAll.length === 0 )
      {
        result.includeAll = _.arrayAppendMerging( result.includeAll || [], src.excludeAll );
      }
      else throw _.err( 'regexpObjectBut:','cant combine such regexp objects with "but" combiner' );
    }

    /*
    var result = _.regexpObjectMake
    ({

      includeAny: src.excludeAny,
      includeAll: src.excludeAll,
      excludeAny: src.includeAny,
      excludeAll: src.includeAll,

    });
    */

  }

  return result;
}

//

var regexpObjectOrering = function( ordering )
{
  var res = [];

  if( arguments.length === 1 && arguments[ 0 ].length === 0 )
  return res;

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];
    if( _.arrayIs( argument[ 0 ] ) )
    for( var i = 0 ; i < argument.length ; i++ )
    res.push( _regexpObjectOrderingExclusion( argument[ i ] ) );
    else if( _.strIs( argument[ 0 ] ) )
    res.push( _regexpObjectOrderingExclusion( argument ) );
    else throw _.err( 'unexpected' );
  }

  if( res.length === 1 )
  return res[ 0 ];

  var result = [];
  _.eachSample
  ({
    direct : 0,
    samples : res,
    onEach : function( sample,index )
    {
      var mask = _.regexpObjectShrink( {},sample[ 0 ] );
      for( var s = 1 ; s < sample.length ; s++ )
      _.regexpObjectShrink( mask,sample[ s ] );
      result.push( mask );
    }
  });

  return result;
}

//

var regexpArrayIndex = function regexpArrayIndex( arr,ins )
{
  _.assert( _.arrayIs( arr ) );
  _.assert( _.strIs( ins ) );

  for( var a = 0 ; a < arr.length ; a++ )
  {
    var regexp = arr[ a ];
    _.assert( _.regexpIs( regexp ) );
    if( regexp.test( ins ) )
    return a;
  }

  return -1;
}

//

var _regexpObjectOrderingExclusion = function( ordering )
{

  _.assert( arguments.length === 1 );
  _.assert( !ordering || _.arrayIs( ordering ) );

  if( !ordering )
  return [];

  if( !ordering.length )
  return ordering;

  var result = [];

  for( var o = 0 ; o < ordering.length ; o++ )
  {
    _.assert( _.strIs( ordering[ o ] ) );
    if( ordering[ o ] === '' )
    continue;
    result.push( _.regexpObjectMake( ordering[ o ],regexpObjectMake.names.includeAll ) );
  }

  var nomask = {};
  for( var r = 0 ; r < result.length ; r++ )
  {
    _.regexpObjectShrink( nomask,_.regexpObjectBut( result[ r ] ) );
  }

  for( var o = 0 ; o < ordering.length ; o++ )
  {
    if( ordering[ o ] === '' )
    result.splice( o,0,nomask );
  }

/*
  var before = _.regexpObjectMake( before,regexpObjectMake.names.includeAll );
  var after = _.regexpObjectMake( after,regexpObjectMake.names.includeAll );

  return [
    before,
    _.regexpObjectBut( before,after ),
    after,
  ];
*/

  return result;
}

// --
// routine
// --

/**
 * Internal implementation. xxx
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @method _routineBind
 * @memberof wTools#
 */

var _routineBind = function _routineBind( options )
{

  _assert( arguments.length === 1 );
  _assert( _.boolIs( options.seal ) );
  _assert( _.routineIs( options.routine ),'_routineBind:','expects routine' );
  _assert( _.arrayIs( options.args ) || _.argumentsIs( options.args ) || options.args === undefined );

  var routine = options.routine;
  var args = options.args;
  var context = options.context;

  if( _FunctionBind )
  {

    if( context !== undefined && args === undefined )
    {
      if( options.seal === true )
      throw _.err( 'not tested, not clear what convetion to use' );
      return _FunctionBind.call( routine, context );
    }
    else if( context !== undefined )
    {
      if( options.seal === true )
      {
        return function sealedContextAndArguments()
        {
          return routine.apply( context, args );
        }
      }
      else
      {
        var a = _.arrayAppendMerging( [ context ],args );
        return _FunctionBind.apply( routine, a );
      }
    }
    else
    {
      if( !args )
      args = [];

      if( options.seal === true )
      return function sealedArguments()
      {
        throw _.err( 'not tested' );
        return routine.apply( this, args );
      }
      else
      return function boundArguments()
      {
        var a = args.slice();
        _.arrayAppendMerging( a,arguments );
        return routine.apply( this, a );
      }

    }

  }

  //

  throw _.err( 'not implemented' );

}

//

var routineBind = function routineBind( routine, context, args )
{

  _assert( _.routineIs( routine ),'routineBind:','first argument must be a routine' );
  _assert( arguments.length <= 3,'routineBind:','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : false,
  });

}

//

var routineJoin = function routineJoin( context, routine, args )
{

  _assert( _.routineIs( routine ),'routineJoin:','second argument must be a routine' );
  _assert( arguments.length <= 3,'routineJoin:','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : false,
  });

}

//

var routineSeal = function routineSeal( context, routine, args )
{

  _assert( _.routineIs( routine ),'routineSeal:','second argument must be a routine' );
  _assert( arguments.length <= 3,'routineSeal:','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : true,
  });

}

//

var routineDelayed = function routineDelayed( delay,routine )
{

  _.assert( arguments.length >= 2 );
  _.assert( _.numberIs( delay ) );
  _.assert( _.routineIs( routine ) );

  if( arguments.length > 2 )
  {
    _assert( arguments.length <= 4 );
    routine = _.routineJoin.call( _,arguments[ 1 ],arguments[ 2 ],arguments[ 3 ] );
  }

  return function delayed()
  {
    _.timeOut( delay,this,routine,arguments );
  }

}

//

var routinesCall = function routinesCall()
{
  var result = [];

  _.assert( arguments.length >= 1 && arguments.length <= 3  );

  if( arguments.length === 1 )
  {

    var routines = arguments[ 0 ];
    _.assert( _.arrayIs( routines ) || _.routineIs( routines ) );
    var routines = _.arrayAs( routines );
    for( var r = 0 ; r < routines.length ; r++ )
    {
      result[ r ] = routines[ r ]();
    }

  }
  else if( arguments.length === 2 )
  {
    var context = arguments[ 0 ];
    var routines = arguments[ 1 ];
    _.assert( _.arrayIs( routines ) || _.routineIs( routines ) );
    var routines = _.arrayAs( routines );
    for( var r = 0 ; r < routines.length ; r++ )
    {
      result[ r ] = routines[ r ].call( context );
    }
  }
  else if( arguments.length === 3 )
  {
    var context = arguments[ 0 ];
    var routines = arguments[ 1 ];
    var args = arguments[ 2 ];
    _.assert( _.arrayIs( routines ) || _.routineIs( routines ) );
    _.assert( _.arrayLike( args ) );
    var routines = _.arrayAs( routines );
    for( var r = 0 ; r < routines.length ; r++ )
    {
      result[ r ] = routines[ r ].apply( context,args );
    }
  }

  return result;
}

// --
// time
// --

var timeReady = function( onReady )
{
  _assert( arguments.length === 1 );
  _assert( _.routineIs( onReady ) );

  if( typeof window !== 'undefined' && typeof document !== 'undefined' && document.readyState != 'complete' )
  {
    window.addEventListener( 'load',onReady );
  }
  else
  {
    _.timeOut( 1,onReady );
  }

}

//

var timeOnce = function( delay,onBegin,onEnd )
{

  var con = new wConsequence();
  var taken = false;
  var options;
  var optionsDefault =
  {
    delay : null,
    onBegin : null,
    onEnd : null,
  }

  if( _.objectIs( delay ) )
  {
    options = delay;
    _assert( arguments.length === 1 );
    _.assertMapOnly( options,optionsDefault );
    delay = options.delay;
    onBegin = options.onBegin;
    onEnd = options.onEnd;
  }
  else
  {
    _assert( 2 <= arguments.length && arguments.length <= 3 );
  }

  _assert( delay >= 0 );
  _assert( _.atomicIs( onBegin ) || _.routineIs( onBegin ) || _.objectIs( onBegin ) );
  _assert( _.atomicIs( onEnd ) || _.routineIs( onEnd ) || _.objectIs( onEnd ) );

  return function timeOnce()
  {

    if( taken )
    {
      /*console.log( 'timeOnce:','was taken' );*/
      return;
    }
    taken = true;

    if( onBegin )
    {
      if( _.routineIs( onBegin ) ) onBegin.apply( this,arguments );
      else if( _.objectIs( onBegin ) ) onBegin.give( arguments );
      con.give();
    }

    _.timeOut( delay,function()
    {

      if( onEnd )
      {
        if( _.routineIs( onEnd ) ) onEnd.apply( this,arguments );
        else if( _.objectIs( onEnd ) ) onEnd.give( arguments );
        con.give();
      }
      taken = false;

    });

    return con;
  }

}

//

var timeOut = function( delay,onReady )
{
  var con = new wConsequence();

  if( arguments.length > 2 )
  if( !_.routineIs( arguments[ 2 ] ) )
  debugger;

  _assert( _.numberIs( delay ) );

  if( arguments.length === 2 )
  _assert( _.routineIs( onReady ) || onReady instanceof wConsequence );
  else if( arguments.length > 2 )
  _assert( _.routineIs( arguments[ 2 ] ) );

  var onEnd = function()
  {
    var result;
    if( _.routineIs( onReady ) )
    {
      result = onReady();
      if( result instanceof wConsequence )
      result.then_( con );
      else
      con.give( result );
    }
    else if( onReady instanceof wConsequence )
    {
      onReady.give();
      onReady.then_( con );
    }
  }

  if( arguments.length > 2 )
  {
    _assert( arguments.length <= 4 );
    onReady = _.routineJoin.call( _,arguments[ 1 ],arguments[ 2 ],arguments[ 3 ] );
  }

  setTimeout( onEnd,delay );

  return con;
}

//

var timePeriodic = function( delay,onReady )
{
  var id;

  /*throw _.err( 'not tested' );*/

  _assert( _.routineIs( onReady ) );

  if( arguments.length > 2 )
  {
    throw _.err( 'Not tested' );
    _assert( arguments.length <= 4 );
    onReady = _.routineBind.call( _,onReady,arguments[ 2 ],arguments[ 3 ] );
  }

  var _onReady = function()
  {
    var result = onReady.call();
    if( result === false )
    clearInterval( id );
  }

  id = setInterval( _onReady,delay );

  return id;
}

//

var timePeriodicStop = function( id )
{
  clearInterval( id );
}

//

var _timeNow_gen = function()
{
  var now;

  _assert( arguments.length === 0 );

  if( typeof performance !== 'undefined' && performance.now !== undefined )
  now = _.routineBind( performance.now,performance );
  else if( Date.now )
  now = _.routineBind( Date.now,Date );
  else
  now = function(){ return Date().getTime() };

  return now;
}

//

var timeSpent = function( time,description )
{
  var now = timeNow();

  _assert( 1 <= arguments.length && arguments.length <= 2 );

  var result = 'Spent ' + ( description || '' ) + ' : ' + ( 0.001*( now-time ) ).toFixed( 3 ) + 's';

  return result;
}

//

var dateToStr = function dateToStr( date )
{
  var y = date.getFullYear();
  var m = date.getMonth() + 1;
  var d = date.getDate();
  if( m < 10 ) m = '0' + m;
  if( d < 10 ) d = '0' + d;
  var result = [ y,m,d ].join( '.' );
  return result;
}

// --
// array
// --

var arraySub = function( src,begin,end )
{

  if( _.atomicIs( src ) )
  throw _.err( 'arraySub','Unknown argument type' );

  if( _.routineIs( src.subarray ) )
  return src.subarray( begin,end );

  if( !_.routineIs( src.slice ) )
  throw _.err( 'arraySub','Unknown argument type' );

  return src.slice( begin,end );
}

//

var arrayNew = function( ins,length )
{
  var result;

  if( length === undefined )
  {
    _assert( _.numberIs( ins.length ) );
    length = ins.length;
  }

  if( _.arrayIs( ins ) || _.bufferIs( ins ) || ins instanceof ArrayBuffer )
  result = new ins.constructor( length );
  else throw _.err( 'arrayNew:','unknown type of instance' );

  return result;
}

//

var arrayNewOfSameLength = function( ins )
{
  if( _.atomicIs( ins ) ) return;
  if( !_.arrayIs( ins ) && !_.bufferIs( ins ) ) return;
  var result = arrayNew( ins,ins.length );
  return result;
}

//

var arrayOrNumber = function( dst,length )
{
  _.assert( arguments.length === 2 );
  _.assert( _.numberIs( dst ) || _.arrayIs( dst ),'expects array of number as argument' );
  _.assert( length >= 0 );

  if( _.numberIs( dst ) )
  dst = arrayFill({ times : length , value : dst });
  else if( dst.length !== length )
  throw _.err( 'expects array of length',length,'but got',dst );

  return dst;
}

//

var arraySelect = function( srcArray,indicesArray )
{
  var atomsPerElement = 1;

  if( _.objectIs( indicesArray ) )
  {
    atomsPerElement = indicesArray.atomsPerElement || 1;
    indicesArray = indicesArray.indices;
  }

  _assert( _.bufferIs( srcArray ) || _.arrayIs( srcArray ) );
  _assert( _.bufferIs( indicesArray ) || _.arrayIs( indicesArray ) );

  var result = new srcArray.constructor( indicesArray.length );

  if( atomsPerElement === 1 )
  for( var i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    result[ i ] = srcArray[ indicesArray[ i ] ];
  }
  else
  for( var i = 0, l = indicesArray.length ; i < l ; i += 1 )
  {
    throw _.err( 'Not tested' );
    for( var a = 0 ; a < atomsPerElement ; a += 1 )
    result[ i*atomsPerElement+a ] = srcArray[ indicesArray[ i ]*atomsPerElement+a ];
  }

  return result;
}

//

var arrayIndicesOfGreatest = function( srcArray,numberOfElements,comparator )
{
  var result = [];
  var l = srcArray.length;

  if( comparator === undefined )
  comparator = function( a,b ){
    return b-a;
  };

  var rcomparator = function( a,b ){
    return comparator( srcArray[ a ],srcArray[ b ] );
  };

  for( var i = 0 ; i < l ; i += 1 )
  {

    if( result.length < numberOfElements )
    {
      _.arraySortedAdd( result, i, rcomparator );
      continue;
    }

    /*
    var index = _._arraySortedLookUpAct( result,i,rcomparator,0,result.length-1 );
    var add = index < numberOfElements;xxx
    if( add )
    result[ index ] = i;
    */

    _.arraySortedAdd( result, i, rcomparator );
    result.splice( result.length-1,1 );

  }

  return result;
}

//

var arrayIron = function()
{
  var result = _.arrayIs( this ) ? this : [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {

    var src = arguments[ a ];

    if( !_.arrayLike( src ) )
    {
      if( src !== undefined ) result.push( src );
      continue;
    }

    for( var s = 0 ; s < src.length ; s++ )
    {
      if( _.arrayIs( src[ s ] ) )
      _.arrayIron.call( result,src[ s ] );
      else if( src[ s ] !== undefined )
      result.push( src[ s ] );
      else if( src[ s ] === undefined )
      throw _.err( 'array should have no undefined' );
    }

  }

  return result;
}

//

var arrayIronToMapUnique = function()
{
  var result = _.arrayIs( this ) ? this : {};

  var extend = function( r,s )
  {
    _.assertMapNone( r,s );
    _.mapExtend( r,s );
  }

  for( var a = 0 ; a < arguments.length ; a++ )
  {

    var src = arguments[ a ];

    if( !_.arrayLike( src ) )
    {
      _.assert( _.objectIs( src ) );
      if( src !== undefined )
      extend( result, src );
      continue;
    }

    for( var s = 0 ; s < src.length ; s++ )
    {
      if( _.arrayIs( src[ s ] ) )
      _.arrayIronToMapUnique.call( result,src[ s ] );
      else if( _.objectIs( src[ s ] ) )
      extend( result, src );
      else
      throw _.err( 'array should have only maps' );
    }

  }

  return result;
}

//
/*
var arrayCopy = function()
{

  var result = [];

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    //if( !_.arrayIs( argument ) )
    if( !_.hasLength( argument ) )
    throw _.err( 'arrayCopy:','argument must be array-like' );

    if( _.arrayIs( argument ) || _.argumentsIs( argument ) ) result.push.apply( result,argument );
    else result.push( argument );
  }

  return result;
}
*/
//

var arrayCopy = function arrayCopy()
{
  var result;
  var length = 0;

  // eval length

  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayCopy','argument is not defined' );

    if( _.arrayLike( argument ) ) length += argument.length;
    else if( _.bufferArrayIs( argument ) ) length += argument.byteLength;
    else length += 1;
  }

  // make result

  if( _.arrayIs( arguments[ 0 ] ) || _.bufferIs( arguments[ 0 ] ) )
  result = arrayNew( arguments[ 0 ],length );
  else if( _.bufferArrayIs( arguments[ 0 ] ) )
  result = new ArrayBuffer( length );

  var bufferDst;
  var offset = 0;
  if( _.bufferArrayIs( arguments[ 0 ] ) )
  {
    bufferDst = new Uint8Array( result );
  }

  // copy

  for( var a = 0, c = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];
    if( _.bufferArrayIs( argument ) )
    {
      bufferDst.set( new Uint8Array( argument ), offset );
      offset += argument.byteLength;
    }
    else if( _.bufferIs( arguments[ 0 ] ) )
    {
      result.set( argument, offset );
      offset += argument.length;
    }
    else if( _.arrayLike( argument ) )
    for( var i = 0 ; i < argument.length ; i++ )
    {
      result[ c ] = argument[ i ];
      c += 1;
    }
    else
    {
      result[ c ] = argument;
      c += 1;
    }
  }

  // !!! not optimal !!!

  return result;
}

//

var arrayAppendMerging = function arrayAppendMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayAppendMerging:','expects array' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayAppendMerging','argument is not defined' );

    if( _.arrayLike( argument ) ) result.push.apply( result,argument );
    else result.push( argument );
  }

  return result;
}

//

var arrayPrependMerging = function arrayPrependMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayPrependMerging:','expects array' );

  for( var a = arguments.length - 1 ; a > 0 ; a-- )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayPrependMerging','argument is not defined' );

    if( _.arrayLike( argument ) ) result.unshift.apply( dst,argument );
    else result.unshift( argument );
  }

  return result;
}

//

var arrayAppendOnceMerging = function arrayAppendOnceMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayAppendOnceMerging:','expects array' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayAppendOnceMerging','argument is not defined' );

    if( _.arrayLike( argument ) )
    {
      for( var i = 0 ; i < argument.length ; i++ )
      if( result.indexOf( argument[ i ] ) === -1 )
      result.push( argument[ i ] );
    }
    else
    {
      if( result.indexOf( argument ) === -1 )
      result.push( argument );
    }

  }

  return result;
}

//

var arrayPrependOnceMerging = function arrayPrependOnceMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayPrependOnceMerging:','expects array' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayPrependOnceMerging','argument is not defined' );

    if( _.arrayLike( argument ) )
    {
      for( var i = argument.length-1 ; i >= 0 ; i++ )
      if( result.indexOf( argument[ i ] ) === -1 )
      result.unshift( argument[ i ] );
    }
    else
    {
      if( result.indexOf( argument ) === -1 )
      result.unshift( argument );
    }

  }

  return result;
}

//

var arrayElementsSwap = function( dst,index1,index2 )
{
  _assert( _.arrayIs( dst ),'arrayElementsSwap:','argument must be array' );
  _assert( 0 <= index1 && index1 < dst.length,'arrayElementsSwap:','index1 is out of bound' );
  _assert( 0 <= index2 && index2 < dst.length,'arrayElementsSwap:','index2 is out of bound' );

  var e = dst[ index1 ];
  dst[ index1 ] = dst[ index2 ];
  dst[ index2 ] = e;

  return dst;
}

//

var arrayFrom = function( src )
{

  if( _.arrayIs( src ) )
  return src;

  if( _.objectIs( src ) )
  return _.mapToArray( src );

  if( _.strIs( src ) )
  {
    var sep = ( src.indexOf( ',' ) !== -1 )?( ',' ):' ';
    return src.split(/[, ]+/).map( function( s ){ if( s.length ) return parseFloat(s); } );
  }

  if( _.argumentsIs( src ) )
  return _ArraySlice.call( src );

}

//

var arrayToMap = function( array )
{
  var result = {};
  for( var a = 0 ; a < array.length ; a++ )
  result[ a ] = array[ a ];
  return result;
}

//

var arrayRemovedOnce = function( dstArray,ins,onEqual )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  var index = -1;

  if( arguments.length === 2 )
  {

    var index = dstArray.indexOf( ins );

  }
  else if( arguments.length === 3 )
  {

    _.assert( _.routineIs( onEqual ) );
    var index = arrayLeftIndexOf( dstArray,ins,onEqual );

  }
  else throw _.err( 'unexpected' );

  if( index >= 0 )
  dstArray.splice( index,1 );

  return index;
}

//

var arrayRemoveOnce = function( dstArray,ins,onEqual )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 2 )
  arrayRemovedOnce( dstArray,ins );
  else if( arguments.length === 3 )
  arrayRemovedOnce( dstArray,ins,onEqual );

  return dstArray;
}

//

var arrayRemovedAll = function( dstArray,ins,onEqual )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 3 )
  _.assert( _.routineIs( onEqual ) );

  var result = 0;

  if( onEqual === undefined )
  onEqual = function( a,b ){ return a === b };

  for( var d = dstArray.length-1 ; d >= 0 ; d-- )
  if( onEqual( dstArray[ d ],ins ) )
  {
    dstArray.splice( d,1 );
    result += 1;
  }

  return result;
}

//

var arrayRemoveAll = function( dstArray,ins,onEqual )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( arguments.length === 2 )
  arrayRemovedAll( dstArray,ins );
  else if( arguments.length === 3 )
  arrayRemovedAll( dstArray,ins,onEqual );

  return dstArray;
}

//

var arrayAddOnce = function( dst,src )
{
  if( !dst ) return [ src ];

  var i = dst.indexOf( src );

  if( i === -1 ) dst.push( src );

  return dst;
}

//

var arraySpliceArray = function( dstArray,srcArray,first,replace )
{

  var args = [ first,replace ];
  args.push.apply( args,srcArray )
  dstArray.splice.apply( dstArray,args );

  return dstArray;
}

//

var arraySlice = function arraySlice( array,a,b )
{
  _.assert( _.arrayLike( array ) );

  var result;
  var a = a !== undefined ? a : 0;
  var b = b !== undefined ? b : array.length;
  if( b < a )
  b = a;

  if( _.bufferIs( array ) )
  result = new array.constructor( b-a );
  else
  result = new Array( b-a );

  for( var r = a ; r < b ; r++ )
  result[ r-a ] = array[ r ];

  return result;
  //return _ArraySlice.call( array,a,b );
}

//

var arraySplice = function arraySplice( dstArray,a,b,srcArray )
{
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.arrayIs( srcArray ) );

  var result;
  var a = a !== undefined ? a : 0;
  var b = b !== undefined ? b : dstArray.length;
  if( b < a )
  b = a;

  var srcArray = srcArray.slice();
  srcArray.unshift( b-a );
  srcArray.unshift( a );

  debugger;
  dstArray.splice.apply( dstArray,srcArray );

  return result;
}

//

var arrayAs = function( src ) {

  if( src === null || src === undefined ) return [];
  else if( _.arrayIs( src ) ) return src;
  else return [ src ];
};

//

var arrayToStr = function( src,options )
{

  var result = '';
  var options = options || {};

  if( options.precission === undefined ) options.precission = 5;
  if( options.type === undefined ) options.type = 'mixed';

  if( !src.length ) return result;

  if( options.type === 'float' )
  {
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += src[ s ].toPrecision( options.precission ) + ' ';
    }
    result += src[ s ].toPrecision( options.precission );
  }
  else if( options.type === 'int' )
  {
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }
  else
  {
    throw '_.arrayToStr: not tested';
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }

  return result;
}

//

var arrayPut = function arrayPut( dstArray, dstOffset )
{
  dstOffset = dstOffset || 0;

  for( var a = 2 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];
    var aIs = _.arrayIs( argument ) || _.bufferIs( argument );

    if( aIs && _.bufferIs( dstArray ) )
    {
      dstArray.set( argument,dstOffset );
      dstOffset += argument.length;
    }
    else if( aIs )
    for( var i = 0 ; i < argument.length ; i++ )
    {
      dstArray[ dstOffset ] = argument[ i ];
      dstOffset += 1;
    }
    else
    {
      dstArray[ dstOffset ] = argument;
      dstOffset += 1;
    }

  }

  return dstArray;
}

//

var arrayMask = function arrayMask( srcArray, mask )
{

  if( !_.arrayLike( srcArray ) )
  throw _.err( 'arrayMask:','expects array-like as srcArray' )
  if( !_.arrayLike( mask )  )
  throw _.err( 'arrayMask:','expects array-like as mask' )

  var atomsPerElement = mask.length;
  var length = srcArray.length / atomsPerElement;
  if( Math.floor( length ) !== length )
  throw _.err( 'arrayMask:','expects mask has component for each atom of srcArray',_.toStr({ 'atomsPerElement' : atomsPerElement, 'srcArray.length' : srcArray.length  }) );

  var preserve = 0;
  for( var m = 0 ; m < mask.length ; m++ )
  if( mask[ m ] )
  preserve += 1;

  var dstArray = new srcArray.constructor( length*preserve );

  if( !preserve )
  return dstArray;

  var c = 0;
  for( var i = 0 ; i < length ; i++ )
  for( var m = 0 ; m < mask.length ; m++ )
  if( mask[ m ] )
  {
    dstArray[ c ] = srcArray[ i*atomsPerElement + m ];
    c += 1;
  }

  return dstArray;
}

//

var arrayDuplicate = function arrayDuplicate( srcArray, options )
{

  if( _.objectIs( srcArray ) )
  {
    options = srcArray;
    srcArray = options.src;
  }

  var options = options || {};
  if( options.numberOfAtomsPerElement === undefined ) options.numberOfAtomsPerElement = 1;
  if( options.numberOfDuplicatesPerElement === undefined ) options.numberOfDuplicatesPerElement = 2;

  _.assertMapOnly( options,
  {
    src : 'src',
    result : 'result',
    numberOfAtomsPerElement : 'numberOfAtomsPerElement',
    numberOfDuplicatesPerElement : 'numberOfDuplicatesPerElement',
  });

  //if( options.numberOfAtomsPerElement !== 1 )
  //throw 'Not tested';

  var length = srcArray.length * options.numberOfDuplicatesPerElement;
  var result = options.result || arrayNew( srcArray,length );
  var numberOfElements = srcArray.length / options.numberOfAtomsPerElement;

  for( var c = 0, cl = numberOfElements ; c < cl ; c++ )
  {

    for( var d = 0, dl = options.numberOfDuplicatesPerElement ; d < dl ; d++ )
    {

      for( var e = 0, el = options.numberOfAtomsPerElement ; e < el ; e++ )
      {
        var indexDst = c*options.numberOfAtomsPerElement*options.numberOfDuplicatesPerElement + d*options.numberOfAtomsPerElement + e;
        var indexSrc = c*options.numberOfAtomsPerElement+e;
        result[ indexDst ] = srcArray[ indexSrc ];
      }

    }

  }

  return result;
}

//

var arrayFill = function arrayFill( options )
{

  _assert( arguments.length === 1 );
  _assert( _.objectIs( options ) || _.numberIs( options ) || _.arrayIs( options ),'arrayFill:','"options" must be object' );

  if( _.numberIs( options ) )
  options = { times : options };
  else if( _.arrayIs( options ) )
  options = { result : options };

  var result = options.result || [];
  var times = options.times !== undefined ? options.times : result.length;
  var value = options.value !== undefined ? options.value : 0;

  if( _.routineIs( result.fill ) )
  {
    if( result.length < times )
    result.length = times;
    result.fill( value,0,times );
  }
  else
  {
    for( var t = 0 ; t < times ; t++ )
    result[ t ] = value;
  }

  _assert( result[ times-1 ] === value );
  return result;
}

//

var arrayCompare = function( src1,src2 )
{

  var result = 0;

  for( var s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] - src2[ s ];
    if( result !== 0 ) return result;

  }

  return result;
}

//

var arraySame = function( src1,src2 )
{

  var result = true;

  if( src1.length !== src2.length )
  return false;

  for( var s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] === src2[ s ];
    if( !result ) return result;

  }

  return result;
}

//

var arraySameSet = function( src1,src2 )
{
  if( src1.length !== src2.length ) return false;
  var src = src1.slice();
  var nil = {};

  for( var s = 0 ; s < src2.length ; s++ )
  {
    var i = src.indexOf( src2[ s ] );
    if( i === -1 )
    return false;
    src[ i ] = nil;
  }

  return true;
}

//

var arrayLeftIndexOf = function( arr,ins,equalizer )
{

  if( !equalizer )
  equalizer = function( a,b ){ return a === b };

  for( var a = 0 ; a < arr.length ; a++ )
  {

    if( equalizer( arr[ a ],ins ) )
    return a;

  }

  return -1;
}

//

var arrayRightIndexOf = function( arr,ins,equalizer )
{

  if( !equalizer ) equalizer = _.arraySame;

  for( var a = arr.length-1 ; a >= 0 ; a-- )
  {

    if( equalizer( arr[ a ],ins ) )
    return a;

  }

  return -1;
}

//

var arrayLeftGet = function( arr,ins,equalizer )
{
  var result;
  var i = _.arrayLeftIndexOf( arr,ins,equalizer );

  if( i >= 0 )
  result =
  {
    index : i,
    element : arr[ i ],
  }

  return result;
}

//

var arrayHasAny = function( src )
{
  _assert( _.arrayIs( src ) || _.bufferIs( src ),'arrayHasAny:','array expected' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    var ins = _.arrayAs( arguments[ a ] );

    for( var i = 0 ; i < ins.length ; i++ )
    if( src.indexOf( ins[ i ] ) !== -1 )
    return true;

  }

  return false;
}

//

var arrayCount = function( src,instance )
{
  var result = 0;
  _assert( arguments.length === 2 );
  _assert( _.arrayIs( src ) || _.bufferIs( src ),'arrayCount:','array expected' );

  var index = src.indexOf( instance );
  while( index !== -1 )
  {
    result += 1;
    index = src.indexOf( instance,index+1 );
  }

  return result;
}

//

var arraySupplement = function arraySupplement( dstArray )
{
  var result = dstArray;
  if( result === null )
  result = [];

  var length = result.length;
  _assert( _.arrayLike( result ),'expects object as argument' );
  for( a = arguments.length-1 ; a >= 1 ; a-- )
  {
    length = Math.max( length,arguments[ a ].length )
    _assert( arguments[ a ],'argument is not defined:',a );
  }

  for( var k = 0 ; k < length ; k++ )
  {

    if( k in dstArray && !isNaN( dstArray[ k ] ) )
    continue;

    var a;
    for( a = arguments.length-1 ; a >= 1 ; a-- )
    if( k in arguments[ a ] && !isNaN( arguments[ a ][ k ] ) )
    break;

    if( a === 0 )
    continue;

    result[ k ] = arguments[ a ][ k ];

  }

  return result;
}

//

var arrayExtendScreening = function arrayExtendScreening( screenArray,dstArray )
{
  var result = dstArray;
  if( result === null ) result = [];

  _assert( _.arrayLike( screenArray ),'expects object as screenArray' );
  _assert( _.arrayLike( result ),'expects object as argument' );
  for( a = arguments.length-1 ; a >= 2 ; a-- )
  _assert( arguments[ a ],'argument is not defined:',a );

  for( var k = 0 ; k < screenArray.length ; k++ )
  {

    if( screenArray[ k ] === undefined )
    continue;

    var a;
    for( a = arguments.length-1 ; a >= 2 ; a-- )
    if( k in arguments[ a ] ) break;
    if( a === 1 )
    continue;

    result[ k ] = arguments[ a ][ k ];

  }

  return result;
}

//

var arrayRandom = function( options )
{
  var result = [];

  if( _.numberIs( options ) )
  {
    options = { length : options };
  }

  if( options.int === undefined )
  options.int = false;

  if( options.range === undefined )
  options.range = [ 0,1 ];

  for( var i = 0 ; i < options.length ; i++ )
  {
    result[ i ] = options.range[ 0 ] + Math.random()*( options.range[ 1 ] - options.range[ 0 ] );
    if( options.int )
    result[ i ] = Math.floor(  result[ i ] );
  }

  return result;
}

//

/**
 * Generate array of arithmetic progression series. From range[ 0 ] to range[ 1 ] with increment 1;
 *
 * @param {arrayLike} range
 *  The first and the last+1 elements of the progression.
 * @return {array}
 *  An array of numbers for the requested range. May be an empty
 *    array if adding the step would not converge toward the end value.
 * @method arrayRange
 * @memberof wTools#
 */

var arrayRange = function( range )
{

  if( _.numberIs( range ) )
  range = [ 0,range ];

  _.assert( arguments.length === 1 );
  _.assert( _.arrayLike( range ) );
  _.assert( range.length === 2 );

  var result = [];
  var first = range[ 0 ];
  var len = range[ 1 ] - range[ 0 ];

  for( var i = 0 ; i < len ; i++ )
  result[ i ] = first + i;

  return result;
}

// --
// array set
// --

var arraySetIntersection = function( src )
{
  var result = [];

  _.assert( _.arrayLike( src ) );

  for( var i = 0 ; i < src.length ; i++ )
  {

    for( var a = 1 ; a < arguments.length ; a++ )
    {

      _.assert( _.arrayLike( arguments[ a ] ) );

      throw _.err( 'Not tested' );
      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        throw _.err( 'Not tested' );
        break;
      }
    }

    if( a === arguments.length )
    result.push( src[ i ] );

  }

  return result;
}

//
/*
var arraySetContainAll = function( src )
{
  var result = [];

  _.assert( _.arrayLike( src ) );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.arrayLike( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( var i = 0 ; i < src.length ; i++ )
    {

      throw _.err( 'Not tested' );
      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        throw _.err( 'Not tested' );
        return false;
      }

    }

  }

  return true;
}
*/
//

var arraySetContainAll = function( src )
{
  _.assert( _.arrayLike( src ) );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.arrayLike( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( var i = 0 ; i < src.length ; i++ )
    {

      if( arguments[ a ].indexOf( src[ i ] ) === -1 )
      return false;

    }

  }

  return true;
}

//

var arraySetContainSomething = function( src )
{
  _.assert( _.arrayLike( src ) );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.arrayLike( arguments[ a ] ) );

    for( var i = 0 ; i < src.length ; i++ )
    {

      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        return true;
      }

    }

  }

  return false;
}

// --
// array sorted
// --

var _arraySortedLookUpAct = function( arr,ins,comparator,left,right )
{

  var d = 0;
  var current = Math.floor( ( left + right + 1 ) / 2 );

  while( left < right )
  {

    //var current = Math.floor( ( left + right + 1 ) / 2 );

    var d = comparator( arr[ current ],ins );

    if( d < 0 )
    {
      left = current + 1;
      current = Math.floor( ( left + right ) / 2 );
    }
    else if( d > 0 )
    {
      right = current - 1;
      current = Math.ceil( ( left + right ) / 2 );
    }
    else return current;

  }

  if( current < arr.length )
  {
    var d = comparator( arr[ current ],ins );
    if( d < 0 ) current += 1;
    //else if( d > 0 ) current -= 1;
  }

  return current;
}

//

var arraySortedLookUp = function( arr,ins,comparator )
{

  if( comparator === undefined )
  comparator = function( a,b ){ return a-b };

  var l = arr.length;
  var index = _._arraySortedLookUpAct( arr,ins,comparator,0,l-1 );

  if( index === l )
  return;

  if( comparator( ins,arr[ index ] ) !== 0 )
  return;

  return { value: arr[ index ], index: index };
}

//

var arraySortedClosest = function( arr,ins,comparator )
{

  if( !arr.length ) return { index : 0 };

  if( comparator === undefined )
  comparator = function( a,b ){ return a-b };

  var l = arr.length;
  var index = _._arraySortedLookUpAct( arr,ins,comparator,0,l-1 );

  if( index === l ) return { index : l-1, value : arr[ l-1 ] };

  var c = comparator( arr[ index ],ins );
  if( c  === 0 ) return { value: arr[ index ], index: index };
  if( c < 0 )
  {
    throw _.err( 'redundant branch?' );
    if( ( arr.length-1 ) === index )
    return { value: arr[ index ], index: index };
    else if( Math.abs( comparator( arr[ index + 1 ],ins ) ) < Math.abs( c ) )
    return { value: arr[ index + 1 ], index: index + 1 };
    else
    return { value: arr[ index ], index: index };
  }
  if( c > 0 )
  {
    if( 0 === index )
    return { value: arr[ index ], index: index };
    else if( Math.abs( comparator( arr[ index - 1 ],ins ) ) < Math.abs( c ) )
    return { value: arr[ index - 1 ], index: index - 1 };
    else
    return { value: arr[ index ], index: index };
  }

}

//

var arraySortedRemove = function( arr,ins,comparator )
{

  if( comparator === undefined ) comparator = function( a,b ){ return a-b };
  var l = arr.length;
  var index = _._arraySortedLookUpAct( arr,ins,comparator,0,l-1 );

  var remove = index !== l && comparator( ins,arr[ index ] ) === 0;

  if( remove ) arr.splice( index,1 );

  return remove;
}

//

var arraySortedAddOnce = function( arr,ins,comparator )
{

  if( comparator === undefined ) comparator = function( a,b ){ return a-b };
  var l = arr.length;
  var index = _._arraySortedLookUpAct( arr,ins,comparator,0,l-1 );

  var add = index === l || comparator( ins,arr[ index ] ) !== 0;

  if( add ) arr.splice( index,0,ins );

  return add;
}

//

var arraySortedAdd = function( arr,ins,comparator )
{

  if( comparator === undefined ) comparator = function( a,b ){ return a-b };
  var l = arr.length;
  var index = _._arraySortedLookUpAct( arr,ins,comparator,0,l-1 );

  arr.splice( index,0,ins );

  return index;
}

//

var arraySortedAddArray = function( dst,src,comparator )
{

  var result = 0;

  //throw 'Not tested';

  if( comparator === undefined ) comparator = function( a,b ){ return a-b };

  for( var s = 0 ; s < src.length ; s++ )
  result += arraySortedAdd( dst,src[ s ],comparator );

  return result;
}

// --
// array buffer
// --

var bufferRelen = function( src,len )
{
  var result = src;

  if( len > src.length )
  {
    result = arrayNew( src, len );
    result.set( src );
  }
  else if( len < src.length )
  {
    result = src.subarray( 0,len );
  }

  return result;
}

//

var bufferResize = function bufferResize( src,size )
{
  var result = src;

  if( !( src instanceof ArrayBuffer ) )
  throw _.err( '_.bufferResize:','"src" is not instance of "ArrayBuffer"' );

  if( size > src.byteLength )
  {
    result = arrayNew( src, size );
    var resultTyped = new Uint8Array( result,0,result.byteLength );
    var srcTyped = new Uint8Array( src,0,src.byteLength );
    resultTyped.set( srcTyped );
  }
  else if( size < src.byteLength )
  {
    result = src.slice( 0,size );
  }

  return result;
}

//

var bufferBytesGet = function( src )
{

  if( src instanceof ArrayBuffer )
  {
    return new Uint8Array( src );
  }
  else if( typeof Buffer !== 'undefined' && src instanceof Buffer )
  {
    return new Uint8Array( src.buffer,src.byteOffset,src.byteLength );
  }
  else if( _.bufferIs( src ) )
  {
    return new Uint8Array( src.buffer,src.byteOffset,src.byteLength );
  }
  else if( _.strIs( src ) )
  {
    return new Uint8Array( _.utf8ToBuffer( src ) );
  }
  else throw _.err( '_.bufferBytesGet:','wrong argument' );

}

//

var bufferRetype = function( src,bufferType )
{

  _.assert( _.bufferIs( src ) );
  _.assert( _.typeIsBuffer( bufferType ) );

  var o = src.byteOffset;
  var l = Math.floor( src.byteLength / bufferType.BYTES_PER_ELEMENT );
  var result = new bufferType( src.buffer,o,l );

  return result;
}

//

var bufferMove = function( dst,src )
{

  if( arguments.length === 2 )
  {

    _.assert( _.arrayLike( dst ) );
    _.assert( _.arrayLike( src ) );

    if( dst.length !== src.length )
    throw _.err( '_.bufferMove:','"dst" and "src" must have same length' );

    if( dst.set )
    {
      dst.set( src );
      return dst;
    }

    for( var s = 0 ; s < src.length ; s++ )
    dst[ s ] = src[ s ];

  }
  else if( arguments.length === 1 )
  {

    var options = arguments[ 0 ];
    _.assertMapOnly( options,bufferMove.defaults );

    var src = options.src;
    var dst = options.dst;

    if( _.bufferArrayIs( dst ) )
    {
      dst = new Uint8Array( dst );
      if( _.bufferIs( src ) && !( src instanceof Uint8Array ) )
      src = new Uint8Array( src.buffer,src.byteOffset,src.byteLength );
    }

    _.assert( _.arrayLike( dst ) );
    _.assert( _.arrayLike( src ) );

    options.dstOffset = options.dstOffset || 0;

    if( dst.set )
    {
      dst.set( src,options.dstOffset );
      return dst;
    }

    for( var s = 0, d = options.dstOffset ; s < src.length ; s++, d++ )
    dst[ d ] = src[ s ];

  }
  else throw _.err( 'unexpected' );

  return dst;
}

bufferMove.defaults =
{
  dst : null,
  src : null,
  dstOffset : null,
}

//

var bufferToStr = function( src,options )
{

  var result = '';
  var options = options || {};

  if( src instanceof ArrayBuffer ) src = new Uint8Array( src,0,src.byteLength );

  try
  {
    result = String.fromCharCode.apply( null, src );
  }
  catch( e )
  {
    for( var i = 0 ; i < src.byteLength ; i++ )
    {
      result += String.fromCharCode( src[i] );
    }
  }

  return result;
}

//

var bufferToDom = function( xmlBuffer ) {

  var result;

  if( typeof DOMParser !== 'undefined' && DOMParser.prototype.parseFromBuffer )
  {

    var parser = new DOMParser();
    result = parser.parseFromBuffer( xmlBuffer,xmlBuffer.byteLength,'text/xml' );
    throw _.err( 'not tested' );

  }
  else
  {

    var xmlStr = _.bufferToStr( xmlBuffer );
    result = this.strToDom( xmlStr );

  }

  return result;
}

//

var bufferLeftBuffer = function( src,ins )
{

  if( !_.bufferIs( src ) )
  src = _.bufferBytesGet( src );

  if( !_.bufferIs( ins ) )
  ins = _.bufferBytesGet( ins );

  _.assert( _.bufferIs( src ) );
  _.assert( _.bufferIs( ins ) );

/*
    var srcw = _.bufferRetype( src,Uint32Array );
    var insw = _.bufferRetype( ins,Uint32Array );
    debugger;
*/

  var o = -1
  do
  {

    o += 1;
    var o = src.indexOf( ins[ 0 ],o );

    for( var i = 0 ; i < ins.length ; i++ )
    if( src[ o+i ] !== ins[ i ] )
    break;

    if( i === ins.length )
    return o;

  }
  while( o !== -1 );

  return -1;
}

//

var bufferFromArrayOfArray = function( array,options ){

  if( _.objectIs( array ) )
  {
    options = array;
    array = options.buffer;
  }

  var options = options || {};
  var array = options.buffer = array || options.buffer;

  //

  if( options.BufferType === undefined ) options.BufferType = Float32Array;
  if( options.sameLength === undefined ) options.sameLength = 1;
  if( !options.sameLength ) throw _.err( '_.bufferFromArrayOfArray:','differemt length of arrays is not implemented' );

  if( !array.length ) return new options.BufferType();

  var atomsPerElement = _.numberIs( array[ 0 ].length ) ? array[ 0 ].length : array[ 0 ].len;

  if( !_.numberIs( atomsPerElement ) ) throw _.err( '_.bufferFromArrayOfArray:','cant find out element length' );

  var length = array.length * atomsPerElement;
  var result = new options.BufferType( length );
  var i = 0;

  for( var a = 0 ; a < array.length ; a++ )
  {

    var element = array[ a ];

    for( var e = 0 ; e < atomsPerElement ; e++ )
    {

      result[ i ] = element[ e ];
      i += 1;

    }

  }

  return result;
}

//

var bufferFromObject = function( bufferObject,options )
{

  _assert( arguments.length === 2 );
  _assert( _.objectIs( options ) );

  if( _.bufferIs( bufferObject ) || _.arrayIs( bufferObject ) )
  return bufferObject;

  var length = bufferObject.length;

  if( !_.numberIs( length ) )
  {

    var length = 0;
    while( bufferObject[ length ] !== undefined )
    length += 1;

  }

  var result = new options.bufferConstructor( length );

  for( var i = 0 ; i < length ; i++ )
  result[ i ] = bufferObject[ i ];

  return result;
}

//

var bufferArrayFromBuffer = function( buffer )
{

  _.assert( _.bufferIs( buffer ) || _.bufferArrayIs( buffer ) );

  if( _.bufferArrayIs( buffer ) )
  return buffer;

  var result = buffer.buffer;

  if( buffer.byteOffset !== 0 || buffer.byteLength !== result.byteLength )
  result = result.slice( buffer.byteOffset,result.byteLength );

  return result;
}

//

var buffersSerialize = function buffersSerialize( options )
{
  var self = this;
  var size = 0;
  var options = options || {};

  _.assertMapNoUndefine( options );
  _.assertMapOnly( options,buffersSerialize.defaults );
  _.mapComplement( options,buffersSerialize.defaults );
  _.assert( _.objectIs( options.store ) );

  var store = options.store;
  var storeAttributes = store[ 'attributes' ] = store[ 'attributes' ] || {};
  var attributes = options.onAttributesGet.call( options.context );
  var buffers = [];

  // eval size

  for( var a = 0 ; a < attributes.length ; a++ )
  {

    var name = attributes[ a ][ 0 ];
    var attribute = attributes[ a ][ 1 ];
    var buffer = options.onBufferGet.call( options.context,attribute );
    var bufferSize = buffer.length*buffer.BYTES_PER_ELEMENT;

    if( options.dropAttribute && options.dropAttribute[ name ] )
    continue;

    var descriptor = {};
    descriptor.attribute = attribute;
    descriptor.name = name;
    descriptor.buffer = buffer;
    descriptor.bufferSize = bufferSize;
    descriptor.sizeOfAtom = buffer.BYTES_PER_ELEMENT;
    buffers.push( descriptor );

    size += bufferSize;

  }

  // make buffer

  if( !store[ 'buffer' ] )
  store[ 'buffer' ] = new ArrayBuffer( size );;

  var dstBuffer = _.bufferBytesGet( store[ 'buffer' ] );

  _.assert( store[ 'buffer' ].byteLength === size );
  if( store[ 'buffer' ].byteLength < size )
  throw _.err( 'buffersSerialize:','buffer does not have enough space' );

  // sort by component size

  buffers.sort( function( a,b )
  {
    return b.sizeOfAtom - a.sizeOfAtom;
  });

  // store into single buffer

  var offset = 0;
  for( var b = 0 ; b < buffers.length ; b++ )
  {

    var name = buffers[ b ].name;
    var attribute = buffers[ b ].attribute;
    var buffer = buffers[ b ].buffer;
    var bytes = _.bufferBytesGet( buffer );
    var bufferSize = buffers[ b ].bufferSize;

    if( options.dropAttribute && options.dropAttribute[ name ] )
    continue;

    _.bufferMove( dstBuffer.subarray( offset,offset+bufferSize ),bytes );

    var serialized = store[ 'attributes' ][ name ] =
    {
      'bufferConstructorName' : buffer.constructor.name,
      'sizeOfAtom' : buffer.BYTES_PER_ELEMENT,
      'offsetInCommonBuffer' : offset,
      'size' : bytes.length,
    }

    if( attribute.copyCustom )
    serialized[ 'fields' ] = attribute.copyCustom
    ({

      dst : {},
      src : attribute,
      constitutes : false,
      copyComposes : true,
      copyConstitutes : true,
      copyAggregates : false,

    });

    offset += bufferSize;

  }

  // return

  return store;
}

buffersSerialize.defaults =
{

  context : null,
  store : null,
  dropAttribute : {},
  onAttributesGet : function()
  {
    return _.mapPairs( this.attributes );
  },
  onBufferGet : function( attribute )
  {
    return attribute.buffer;
  },

}

//

var buffersDeserialize = function( options )
{
  var options = options || {};
  var store = options.store;
  var commonBuffer = store[ 'buffer' ];

  _.assertMapNoUndefine( options );
  _.assertMapOnly( options,buffersDeserialize.defaults );
  _.mapComplement( options,buffersDeserialize.defaults );
  _.assert( _.objectIs( options.store ) );
  _.assert( _.bufferArrayIs( commonBuffer ) || _.bufferIs( commonBuffer ) );

  commonBuffer = _.bufferArrayFromBuffer( commonBuffer );

  for( var a in store[ 'attributes' ] )
  {
    var attribute = store[ 'attributes' ][ a ];

    var bufferConstructor = _global_[ attribute[ 'bufferConstructorName' ] ];
    var offset = attribute[ 'offsetInCommonBuffer' ];
    var size = attribute[ 'size' ];
    var sizeOfAtom = attribute[ 'sizeOfAtom' ];
    var fields = attribute[ 'fields' ];

    _.assert( _.routineIs( bufferConstructor ),'unknown attribute\' constructor:',attribute[ 'bufferConstructorName' ] )
    _.assert( _.numberIs( offset ),'unknown attribute\' offset in common buffer:',offset )
    _.assert( _.numberIs( size ),'unknown attribute\' size of buffer:',size )
    _.assert( _.numberIs( sizeOfAtom ),'unknown attribute\' sizeOfAtom of buffer:',sizeOfAtom )

    if( attribute.offset+size > commonBuffer.byteLength )
    throw _.err( 'cant deserialize attribute','"'+a+'"','it is out of common buffer' );

    var buffer = new bufferConstructor( commonBuffer,offset,size / sizeOfAtom );

    options.onAttribute.call( options.context,fields,buffer,a );

  }

}

buffersDeserialize.defaults =
{
  store : null,
  context : null,
  onAttribute : function( attributeOptions,buffer )
  {
    attributeOptions.buffer = buffer;
    new this.AttributeOfGeometry( attributeOptions ).addTo( this );
  },
}

// --
// map
// --

var mapClone = function( srcObject,options )
{
  var options = options || {};
  var result = options.dst || {};

  _assert( _.mapIs( options ) );
  _assert( arguments.length <= 2,'mapClone:','expects srcObject as argument' );
  _assert( objectLike( srcObject ),'mapClone:','expects srcObject as argument' );

  if( !options.onCopyField )
  options.onCopyField = function( dstContainer,srcContainer,key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  }

  for( var k in srcObject )
  {
    if( _ObjectHasOwnProperty.call( srcObject,k ) )
    options.onCopyField( result,srcObject,k,options.onCopyField );
  }

  result.__proto__ = srcObject.__proto__;

  return result;
}

//

var mapExtendFiltering = function( filter,dstObject )
{
  var result = dstObject;
  var filter = _.filter.makeMapper( filter );

  if( result === null ) result = {};

  _assert( arguments.length >= 3 );
  _assert( _.routineIs( filter ) );
  _assert( _.objectLike( result ),'mapExtendFiltering:','expects object as argument' );

  for( var a = 2 ; a < arguments.length ; a++ )
  {

    var argument = arguments[ a ];

    _.assert( !_.atomicIs( argument ) );

    for( var k in argument )
    {

      filter.call( this,dstObject,argument,k );

    }

  }

  return result;
}

//

var mapExtend = function mapExtend( dstObject )
{
  var result = dstObject;

  if( result === null ) result = {};

  assert( arguments.length >= 2 );
  assert( objectLike( result ),'mapExtend:','expects object as argument' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    var argument = arguments[ a ];

    for( var k in argument )
    {
      result[ k ] = argument[ k ];
    }

  }

  return result;
}

//

var mapSupplement = function( dst )
{

  var args = _.arraySlice( arguments );
  args.unshift( _.filter.supplementary() );
  return mapExtendFiltering.apply( this,args );

/*
  var result = dst;

  if( result === null ) result = {};

  _assert( arguments.length >= 2 );
  _assert( _.objectLike( result ),'mapSupplement:','expects object as argument' );

  for( var a = 1 ; a < arguments.length ; a++ )
  {

    var argument = arguments[ a ];

    for( var k in argument )
    {
      if( k in result )
      continue;
      result[ k ] = argument[ k ];
    }

  }

  return result;
*/
}

//

var mapComplement = function( dst )
{

  var args = _.arraySlice( arguments );
  args.unshift( _.filter.supplementaryCloning() ); // ??? own
  return mapExtendFiltering.apply( this,args );

}

//

var mapCopy = function mapCopy()
{
  var args = _.arrayAppendMerging( [],{},arguments );
  return _.mapExtend.apply( _,args );
}

// --
// map converter
// --

/**
 * Returns first pair key / value as array.
 *
 * @param {objectLike} srcObject
 *    Object like entity of get first pair.
 * @return {array}
 *    Pair key / value as array if srcObject has fields otherwise undefiend.
 * @method mapFirstPair
 * @memberof wTools#
 */

var mapFirstPair = function mapFirstPair( srcObject )
{

  for( var s in srcObject )
  {
    return [ s,srcObject[ s ] ];
  }

}

//

var mapToArray = function( src )
{
  var result = [];
  for( var s in src )
  {
    result.push( [ s,src[s] ] );
  }
  return result;
}

//

var mapValWithIndex = function( src,index )
{

  if( index < 0 ) return;

  var i = 0;
  for( var s in src )
  {
    if( i == index ) return src[s];
    i++;
  }
}

//

var mapKeyWithIndex = function( src,index )
{

  if( index < 0 ) return;

  var i = 0;
  for( var s in src )
  {
    if( i == index ) return s;
    i++;
  }

}

//

var mapToString = function( src,keyValSep,tupleSep )
{

  if( !_.strIs( keyValSep ) ) keyValSep = ': ';
  if( !_.strIs( tupleSep ) ) keyValSep = '; ';
  var result = '';
  for( var s in src )
  {
    result += s + keyValSep + src[s] + tupleSep;
  }
  result = result.substr( 0,result.length-tupleSep.length );

  return result
}

//

var mapKeys = function mapKeys( src )
{
  var result = [];

  _.assert( _.objectLike( src ) );

  if( _.objectIs( src ) && Object.keys )
  return Object.keys( src );

  for( var s in src )
  result.push( s );

  return result;
}

//

var mapValues = function( src )
{
  var result = [];

  _.assert( _.objectLike( src ) );

  for( var s in src )
  result.push( src[ s ] );

  return result;
}

//

var mapPairs = function( src )
{
  var result = [];

  _.assert( _.objectLike( src ) );

  for( var s in src )
  result.push([ s, src[ s ] ]);

  return result;
}

//
/*
var mapsPluck = function( srcMaps,filterName )
{
  var result = new srcMaps.constructor();
  var filterName = _.nameUnfielded( filterName ).coded;

  _assert( _.arrayIs( srcMaps ) || _.objectIs( srcMaps ) );

  _.each( srcMaps,function( e,k )
  {

    result[ k ] = e[ filterName ];

  });

  return result;
}
*/
//

var mapGroup = function( src,options )
{
  var result = {};

  if( _.strIs( options ) )
  options = { key : options };

  _assert( _.strIs( options.key ) );

  _assert( _.objectIs( src ) || _.arrayIs( src ) );

  _assert( _.objectIs( options ) );

  var key = options.key;

  _.each( src, function( e,k,c )
  {

    if( result[ src[ k ][ key ] ] === undefined )
    result[ src[ k ][ key ] ] = [];

    result[ src[ k ][ key ] ].push( src[ k ] );

  });

  return result;
}

// --
// map filter
// --

var mapSame = function( src1,src2 ){

  _.assert( arguments.length === 2 );

  if( Object.keys( src1 ).length !== Object.keys( src2 ).length ) return;

  for( var s in src1 )
  {
    if( src1[ s ] !== src2[ s ] ) return;
  }

  return true;
}

//

var mapContain = function( src,ins )
{
  _.assert( arguments.length === 2 );

/*
  if( Object.keys( src ).length < Object.keys( ins ).length )
  return false;
*/

  for( var s in ins )
  {

    if( ins[ s ] === undefined )
    continue;

    if( src[ s ] !== ins[ s ] )
    return false;

  }

  return true;
}

//

/**
 * Check does map has own fields. Accept name in map format.
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @method mapOwn
 * @memberof wTools#
 */

var mapOwn = function( object,name )
{

  if( _.strIs( name ) )
  return _ObjectHasOwnProperty.call( object, name );
  else if( _.mapIs( name ) )
  return _ObjectHasOwnProperty.call( object, _.nameUnfielded( name ).coded );
  else if( _.symbolIs( name ) )
  return _ObjectHasOwnProperty.call( object, name );

  throw _.err( 'mapOwn :','unknown arguments' );
}

//

var mapBut = function( srcMap )
{
  var result = {};
  var a,k;

  _assert( _.objectLike( srcMap ),'mapBut :','expects object as argument' );

  for( k in srcMap )
  {
    for( a = 1 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      _assert( _.objectIs( argument ),'argument','#'+a,'is not object' );

      if( k in argument )
      break;

    }
    if( a === arguments.length )
    {
      result[ k ] = srcMap[ k ];
    }
  }

  return result;
}

//

var mapButFiltering = function( filter,srcMap )
{
  var result = {};
  var filter = _.filter.makeMapper( filter );
  var a,k;

  assert( objectLike( srcMap ),'mapButFiltering:','expects object as argument' );

  for( k in srcMap )
  {
    for( a = 2 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      if( k in argument )
      break;

    }
    if( a === arguments.length )
    {
      filter.call( this,result,srcMap,k );
    }
  }

  return result;
}

//

var mapOwnBut = function mapOwnBut( srcMap )
{
  var result = {};
  var a,k;

  /*console.warn( 'fuzzy!' ); debugger;*/

  assert( objectLike( srcMap ),'mapOwnBut:','expects object as argument' );

  for( k in srcMap )
  {
    if( !_ObjectHasOwnProperty.call( srcMap, k ) )
    continue;

    for( a = 1 ; a < arguments.length ; a++ )
    {
      var argument = arguments[ a ];

      if( k in argument )
      break;

    }
    if( a === arguments.length )
    {
      result[ k ] = srcMap[ k ];
    }
  }

  return result;
}

//

var mapScreens = function( srcObject,screenObject )
{

  _assert( arguments.length >= 2,'mapScreens:','expects at least 2 arguments' );

  if( arguments.length > 2 )
  {
    debugger;
    throw _.err( 'not tested' );
    var args =_ArraySlice.call( arguments,1 );
    screenObject = _.mapCopy.apply( this,args );
  }

  var dstObject = _mapScreen
  ({
    screenObjects : screenObject,
    srcObjects : srcObject,
    dstObject : {},
  });

  return dstObject;
}

//

var mapScreen = function( screenObject )
{

  _.assert( arguments.length >= 2 );
  _.assert( arguments.length === 2 );

  return _mapScreen
  ({
    screenObjects : screenObject,
    srcObjects : _.arraySlice( arguments,1 ),
    dstObject : {},
  });

}

//

var _mapScreen = function( options )
{

  var dstObject = options.dstObject || {};
  var screenObject = options.screenObjects;
  var srcObjects = options.srcObjects;

  if( _.arrayIs( screenObject ) )
  screenObject = _.mapCopy.apply( this,screenObject );

  if( !_.arrayIs( srcObjects ) )
  srcObjects = [ srcObjects ];

  if( !options.filter )
  options.filter = filter.bypass();
  options.filter = _.filter.makeMapper( options.filter );

  _.assert( arguments.length === 1 );
  _assert( _.objectLike( dstObject ),'_mapScreen:','expects object as argument' );
  _assert( _.objectLike( screenObject ),'_mapScreen:','expects object as screenObject' );
  _assert( _.arrayIs( srcObjects ),'_mapScreen:','expects array of object as screenObject' );
  _.assertMapOnly( options,_mapScreen.defaults );

  for( a = srcObjects.length-1 ; a >= 0 ; a-- )
  _assert( _.objectLike( srcObjects[ a ] ),'_mapScreen:','expects object as argument' );

  for( var k in screenObject )
  {

    if( screenObject[ k ] === undefined )
    continue;

    var a;
    for( a = srcObjects.length-1 ; a >= 0 ; a-- )
    if( k in srcObjects[ a ] )
    break;

    if( a === -1 )
    continue;

    options.filter.call( this,dstObject,srcObjects[ a ],k );

  }

  return dstObject;
}

_mapScreen.defaults =
{
  filter : null,
  screenObjects : null,
  srcObjects : null,
  dstObject : null,
}

// --
// map filter
// --

var bypass = function()
{

  var routine = function bypass( dstContainer,srcContainer,key )
  {
    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var own = function()
{

  var routine = function own( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var ownRoutines = function()
{

  var routine = function ownRoutines( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter'; ;
  return routine;
}

//

var supplementaryOwnRoutines = function()
{

  var routine = function supplementaryOwnRoutines( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.routineIs( srcContainer[ key ] ) )
    return false;
    if( !dstContainer[ key ] !== undefined )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var supplementary = function()
{

  var routine = function supplementary( dstContainer,srcContainer,key )
  {
    if( dstContainer[ key ] !== undefined )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var supplementaryCloning = function()
{

  var routine = function supplementaryCloning( dstContainer,srcContainer,key )
  {
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var supplementaryOwn = function()
{

  var routine = function supplementaryOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( dstContainer[ key ] !== undefined )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var supplementaryCloningOwn = function()
{

  var routine = function supplementaryCloningOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( dstContainer[ key ] !== undefined )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var cloning = function()
{

  var routine = function cloning( dstContainer,srcContainer,key )
  {
    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var cloningOwn = function()
{

  var routine = function cloning( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var atomic = function()
{

  var routine = function atomic( dstContainer,srcContainer,key )
  {
    if( !_.atomicIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var atomicOwn = function()
{

  var routine = function atomicOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return false;
    if( !_.atomicIs( srcContainer[ key ] ) )
    return false;

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var notAtomicCloning = function()
{

  var routine = function notAtomicCloning( dstContainer,srcContainer,key )
  {
    if( _.atomicIs( srcContainer[ key ] ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var notAtomicCloningOwn = function()
{

  var routine = function notAtomicCloningOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.atomicIs( srcContainer[ key ] ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var notAtomicCloningRecursiveOwn = function()
{

  var routine = function notAtomicCloningRecursiveOwn( dstContainer,srcContainer,key )
  {
    if( !_ObjectHasOwnProperty.call( srcContainer, key ) )
    return;
    if( _.atomicIs( srcContainer[ key ] ) )
    return;

    _.entityCopyField( dstContainer,srcContainer,key,_.entityCopyField );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var recursiveClonning = function()
{

  var routine = function recursiveClonning( dstContainer,srcContainer,key )
  {
    _.entityCopyField( dstContainer,srcContainer,key,_.entityCopyField );
  }

  routine.functionKind = 'field-mapper';
  return routine;
}

//

var drop = function( dropContainer )
{

  _.assert( _.objectIs( dropContainer ) );

  var routine = function drop( dstContainer,srcContainer,key )
  {
    if( dropContainer[ key ] !== undefined )
    return false

    /*dstContainer[ key ] = srcContainer[ key ];*/
    return true;
  }

  routine.functionKind = 'field-filter';
  return routine;
}

//

var and = function()
{

  var filters = [];
  var mappers = [];
  for( var a = 0 ; a < arguments.length ; a++ )
  {
    var routine = arguments[ a ];
    _.assert( _.routineIs( routine ) );
    _.assert( _.strIs( routine.functionKind ) );
    if( routine.functionKind === 'field-filter' )
    filters.push( routine );
    else if( routine.functionKind === 'field-mapper' )
    mappers.push( routine );
    else throw _.err( 'expects routine.functionKind' );
  }

  if( mappers.length > 1 )
  throw _.err( 'can combine only one mapper with any number of filters' );

  var routine = function and( dstContainer,srcContainer,key )
  {

    for( var f = 0 ; f < filters.length ; f++ )
    {
      var filter = filters[ f ];

      var result = filter( dstContainer,srcContainer,key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return mappers.length ? undefined : false;
    }

    for( var m = 0 ; m < mappers.length ; m++ )
    {
      var mapper = mappers[ m ];

      var result = mapper( dstContainer,srcContainer,key );
      _.assert( result === undefined );
      return;
    }

    return mappers.length ? undefined : true;
  }

  routine.functionKind = mappers.length ? 'field-mapper' : 'field-filter';
  return routine;
}

//

var makeMapper = function( routine )
{

  _.assert( arguments.length === 1 );
  _.assert( _.routineIs( routine ) );
  _.assert( _.strIs( routine.functionKind ) );

  if( routine.functionKind === 'field-filter' )
  {
    var r = function( dstContainer,srcContainer,key )
    {
      var result = routine( dstContainer,srcContainer,key );
      _.assert( _.boolIs( result ) );
      if( result === false )
      return;
      dstContainer[ key ] = srcContainer[ key ];
    }
    r.functionKind = 'field-mapper';
    return r;
  }
  else if( routine.functionKind === 'field-mapper' )
  {
    return routine;
  }
  else throw _.err( 'expects routine.functionKind' );

}

//

var filter =
{

  bypass: bypass,

  own: own,
  ownRoutines: ownRoutines,
  supplementaryOwnRoutines: supplementaryOwnRoutines,

  supplementary: supplementary,
  supplementaryCloning: supplementaryCloning,
  supplementaryOwn: supplementaryOwn,
  supplementaryCloningOwn: supplementaryCloningOwn,

  cloning: cloning,
  cloningOwn: cloningOwn,

  atomic: atomic,
  atomicOwn: atomicOwn,

  notAtomicCloning: notAtomicCloning,
  notAtomicCloningOwn: notAtomicCloningOwn,
  notAtomicCloningRecursiveOwn: notAtomicCloningRecursiveOwn,

  recursiveClonning: recursiveClonning,

  drop: drop,

  and: and,
  makeMapper: makeMapper,

}

// --
// prototype
// --

var Proto =
{

  // entity

  enityExtend: enityExtend,
  entityClone: entityClone,

  entityCopy: entityCopy,
  entityCopyField: entityCopyField,
  entityAssignField: entityAssignField,
  /*entitySetField: entitySetField,*/

  entityHasNan: entityHasNan,
  entityHasUndef: entityHasUndef,

  entitySame: entitySame,
  _entitySame: _entitySame,

  entityIdentical: entityIdentical,
  entityEquivalent: entityEquivalent,
  entityContain: entityContain,

  entityLength: entityLength,

  entityWithKeyRecursive: entityWithKeyRecursive,
  entityValueWithIndex: entityValueWithIndex,
  entityKeyWithValue: entityKeyWithValue,

  entitySelect: entitySelect,
  entitySelectSet: entitySelectSet,
  _entitySelect: _entitySelect,

  /*strFormat: strFormat,*/


  // iterator

  until: until,
  each: each,
  eachSample: eachSample,
  eachRecursive: eachRecursive,


  // diagnostics

  _err: _err,
  err: err,
  errLog: errLog,

  assert: assert,
  assertMapNoUndefine: assertMapNoUndefine,
  assertMapOnly: assertMapOnly,
  assertMapOwnOnly: assertMapOwnOnly,
  assertMapNone: assertMapNone,
  assertMapOwnNone: assertMapOwnNone,
  assertMapAll: assertMapAll,
  assertMapOwnAll: assertMapOwnAll,
  warn: warn,
  stack: stack,

  diagnosticWatchObject: diagnosticWatchObject,
  diagnosticWatchFields: diagnosticWatchFields,


  // name and symbol

  nameUnfielded: nameUnfielded,
  nameFielded: nameFielded,
  namesCoded: namesCoded,


  // type test

  arrayIs: arrayIs,
  arrayLike: arrayLike,
  hasLength: hasLength,

  objectIs: objectIs,
  objectLike: objectLike,
  mapIs: mapIs,

  strIs: strIs,
  symbolIs: symbolIs,

  bufferIs: bufferIs,
  bufferArrayIs: bufferArrayIs,
  bufferNodeIs: bufferNodeIs,

  argumentsIs: argumentsIs,

  rowIs: rowIs,

  numberIs: numberIs,
  numberIsRegular: numberIsRegular,

  dateIs: dateIs,
  boolIs: boolIs,
  routineIs: routineIs,
  routineWithNameIs: routineWithNameIs,
  regexpIs: regexpIs,
  definedIs: definedIs,

  eventIs: eventIs,
  htmlIs: htmlIs,
  jqueryIs: jqueryIs,
  domIs: domIs,
  domableIs: domableIs,

  errorIs: errorIs,

  atomicIs: atomicIs,

  typeOf: typeOf,
  typeIsBuffer: typeIsBuffer,

  toBool: toBool,


  // number

  numberRandomInt: numberRandomInt,
  numberRandomIntNot: numberRandomIntNot,
  numberFrom: numberFrom,


  // str

  strTypeOf: strTypeOf,
  str: str,

  strBegins: strBegins,
  strEnds: strEnds,
  strBeginRemove: strBeginRemove,
  strEndRemove: strEndRemove,

  strPrependOnce: strPrependOnce,
  strAppendOnce: strAppendOnce,


  // regexp

  regexpEscape: regexpEscape,
  regexpForGlob: regexpForGlob,

  regexpMakeObject: regexpObjectMake,
  regexpMakeArray: regexpMakeArray,
  regexpMakeExpression: regexpMakeExpression,

  _regexpAny: _regexpAny,
  _regexpAll: _regexpAll,
  regexpTest: regexpTest,

  regexpBut_: regexpBut_,

  regexpObjectShrink: regexpObjectShrink,
  regexpObjectBroaden: regexpObjectBroaden,
  _regexpObjectExtend: _regexpObjectExtend,

  regexpObjectMake: regexpObjectMake,
  regexpObjectBut: regexpObjectBut,
  regexpObjectOrering: regexpObjectOrering,

  regexpArrayIndex: regexpArrayIndex,
  _regexpObjectOrderingExclusion: _regexpObjectOrderingExclusion,


  // routine

  _routineBind: _routineBind,
  routineBind: routineBind,
  routineJoin: routineJoin,
  routineSeal: routineSeal,
  routineDelayed: routineDelayed,

  routinesCall: routinesCall,

  bind: null,


  // time

  timeReady: timeReady,
  timeOnce: timeOnce,
  timeOut: timeOut,

  timePeriodic: timePeriodic,
  timePeriodicStart: timePeriodic,
  timePeriodicStop: timePeriodicStop,

  _timeNow_gen: _timeNow_gen,
  timeSpent: timeSpent,
  dateToStr: dateToStr,


  // array

  arraySub: arraySub,
  arrayNew: arrayNew,
  arrayNewOfSameLength: arrayNewOfSameLength,
  arrayOrNumber: arrayOrNumber,

  arraySelect: arraySelect,
  arrayIndicesOfGreatest: arrayIndicesOfGreatest,

  arrayIron: arrayIron,
  arrayIronToMapUnique: arrayIronToMapUnique,

  arrayCopy: arrayCopy,
  arrayAppendMerging: arrayAppendMerging,
  arrayPrependMerging: arrayPrependMerging,

  arrayAppendOnceMerging: arrayAppendOnceMerging,
  arrayPrependOnceMerging: arrayPrependOnceMerging,

  arrayElementsSwap: arrayElementsSwap,

  arrayRemovedOnce: arrayRemovedOnce,
  arrayRemoveOnce: arrayRemoveOnce,

  arrayRemovedAll: arrayRemovedAll,
  arrayRemoveAll: arrayRemoveAll,

  arrayFrom: arrayFrom,
  arrayToMap: arrayToMap,
  arrayAddOnce: arrayAddOnce,

  arraySpliceArray: arraySpliceArray,

  arraySlice: arraySlice,
  arraySplice: arraySplice,
  arrayAs: arrayAs,

  arrayToStr: arrayToStr,

  arrayPut: arrayPut,

  arrayMask: arrayMask,
  arrayDuplicate: arrayDuplicate,
  arrayFill: arrayFill,

  arrayCompare: arrayCompare,
  arraySame: arraySame,
  arraySameSet: arraySameSet,

  arrayLeftIndexOf: arrayLeftIndexOf,
  arrayRightIndexOf: arrayRightIndexOf,

  arrayLeftGet: arrayLeftGet,

  arrayHasAny: arrayHasAny,
  arrayCount: arrayCount,

  arraySupplement: arraySupplement,
  arrayExtendScreening: arrayExtendScreening,

  arrayRandom: arrayRandom,
  arrayRange: arrayRange,


  // array set

  arraySetIntersection: arraySetIntersection,
  arraySetContainAll: arraySetContainAll,
  arraySetContainSomething: arraySetContainSomething,


  // array sorted

  _arraySortedLookUpAct: _arraySortedLookUpAct,
  arraySortedLookUp: arraySortedLookUp,
  arraySortedClosest: arraySortedClosest,
  arraySortedRemove: arraySortedRemove,
  arraySortedAdd: arraySortedAdd,
  arraySortedAddOnce: arraySortedAddOnce,
  arraySortedAddArray: arraySortedAddArray,


  // buffer

  bufferRelen: bufferRelen,
  bufferResize: bufferResize,
  bufferBytesGet: bufferBytesGet,
  bufferRetype: bufferRetype,

  bufferMove: bufferMove,
  bufferToStr: bufferToStr,
  bufferToDom: bufferToDom,

  bufferLeftBuffer: bufferLeftBuffer,

  bufferFromArrayOfArray: bufferFromArrayOfArray,
  bufferFromObject: bufferFromObject,
  bufferArrayFromBuffer: bufferArrayFromBuffer,

  buffersSerialize: buffersSerialize,
  buffersDeserialize: buffersDeserialize,


  // map

  mapClone: mapClone,

  mapExtendFiltering: mapExtendFiltering,
  mapExtend: mapExtend,
  mapSupplement: mapSupplement,
  mapComplement: mapComplement,
  mapCopy: mapCopy,


  // map converter

  mapFirstPair: mapFirstPair,

  mapToArray: mapToArray,
  mapValWithIndex: mapValWithIndex,
  mapKeyWithIndex: mapKeyWithIndex,
  mapToString: mapToString,

  mapKeys: mapKeys,
  mapValues: mapValues,
  mapPairs: mapPairs,

  /* mapsPluck: mapsPluck, */
  mapGroup: mapGroup,


  // map logic

  mapOwn: mapOwn,

  mapSame: mapSame,
  mapContain: mapContain,

  mapBut: mapBut,
  mapButFiltering: mapButFiltering,
  mapOwnBut: mapOwnBut,

  mapScreens: mapScreens,
  mapScreen: mapScreen,
  _mapScreen: _mapScreen,


  // map filter

  filter: filter,

}

mapExtend( Self, Proto );
Self.constructor = function wTools(){};

// --
// cache
// --

var _assert = _.assert;
var _arraySlice = _.arraySlice;
var timeNow = Self.timeNow = Self._timeNow_gen();


// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
{
  module[ 'exports' ] = Self;
}

_global_[ 'wTools' ] = Self;
_global_.wTools = Self;

/*_.constant( _global_,{ Config : Config } );*/

})();
Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Contact Help