(function _wTools_s_(){

'use strict';

/**
 * @file wTools.s - Generic purpose tools of base level for solving problems in Java Script.
 */

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

/**
 * wTools - Generic purpose tools of base level for solving problems in Java Script..
 * @class wTools
 */

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
  throw _.err( 'wTools.entityClone :','need options' );

  var options = options || {};

  if( options.forWorker === undefined ) options.forWorker = 0;

  if( options.depth === undefined ) options.depth = 16;

  if( options.useClone === undefined ) options.useClone = 1;

  if( options.depth < 0 )
  {
    if( options.silent ) console.log( 'wTools.entityClone : overflow' );
    else throw _.err( 'wTools.entityClone :','overflow' );
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
        depth : options.depth-1,
        silent :options.silent,
        forWorker : options.forWorker,
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
 * @memberof wTools
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
    _assert( options === undefined || _.objectIs( options ), '_.toStrFine :','options must be object' );
    var options = options || {};

    _.assertMapOnly( options,def );
    _.mapSupplement( options,def );

    return _entitySame( src1,src2,options,'' );
  }

}();

//

  /**
   * Compare two values. For objects, arrays, array like objects, comparison will be recursive. Comparison criteria set
      in the `options`. If in some moment method finds different values in two entities, then it returns false.
   * @param {*} src1 entity for comparison
   * @param {*} src2 entity for comparison
   * @param {Object} options Comparison criteria
   * @param {Function} options.onSameNumbers Function that uses for comparison two numbers. If function returned true,
      the passed numbers is considered equal.
   * @param {boolean} options.contain If this parameter sets to true, two entities will be considered the same,
      if all keys/indexes of `src2`, are in `src1` with same values. Has no effect on comparison entities with primitive
      types. If `options.contain` set to false, `src1` and `src2` will be considered the same, if and only if they has
      the same lengths, same keys/indexes and same appropriates values.
   * @param {boolean} options.strict Specify equality comparison. When it set to true, then the Strict equality
      using (===), else the Loose equality using (==).
   * @param {String} options.lastPath This parameters is modified during the execution of method. Specified on path to
      value, that composite from keys/indexes separated by '.'
   * @param {String} path For non primitive entities indicates the current path for elements that is compared now.
   * @returns {boolean}
   * @private
   * @method entitySame
   * @memberof wTools
   */

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
 * @example
   var obj1 = { a: 0, b: 1, e: { c: 2, d: 3 } },
    obj2 = { a: 0, b: 1, e: { c: 2, d: 3 } };

   wTools.entityIdentical( obj1, obj2 );

   // true
 * @param {object} src1 - entity to compare.
 * @param {object} src2 - entity to compare.
 * @param {object} options - options.
 * @throws {Error} Missed arguments.
 * @throws {Error} Extra arguments.
 * @method entityIdentical
 * @memberof wTools
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
 * @example
   var eps = 1e-5,
   x = 1,
   y = 1 + eps / 2

   wTools.entityEquivalent( x, y );
   // true
 * @param {object} src1 - entity to compare.
 * @param {object} src2 - entity to compare.
 * @param {object} options - options.
 * @throws {Error} Missed arguments.
 * @throws {Error} Extra arguments.
 * @method entityEquivalent
 * @memberof wTools
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
 * @example
   var arr1 = [ 0, 1, 2, 3, 9 ],
   arr2 = [ 0, 1, 2 ];
   wTools.entityContain( arr1, arr2 );
   // true
 * @param {object} src1 - entity to compare.
 * @param {object} src2 - entity to compare.
 * @param {object} options - options.
 * @throws {Error} Missed arguments.
 * @throws {Error} Extra arguments.
 * @method entityContain
 * @memberof wTools
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
  /**
   * On depend form `src` type, returns length if `src` is array ar array like object, count of own enumerable
      properties if `src` is object, 0 if `src` is undefined, 1 in all other cases.
   * @example
   *
     var obj =
     {
       a: 1,
       b: { e: 2, c: 3 }
     };
     wTools.entityLength(obj); // 2
   * @param {*} src Input entity
   * @returns {number} Length of entity.
   */

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
      return { value : src[ key ], key : key, index : i, container : src };
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

// +++ REMINDER : improve code formatting, please

  /**
   * Function that produces an elements for entityMap result
   * @callback onEach
   * @param {*} val The current element being processed in the entity.
   * @param {string|number} key The index (if entity is array) or key of processed element.
   * @param {Array|Object} src The src passed to entityMap
   */

  /**
   * Creates new instance with same as `src` type. Elements of new instance results of calling a provided `onEach`
   * function on every element of src. If entity is array, the new array has the same length as source.
   *
   * @example
    var numbers = [ 3, 4, 6 ];

    function sqr( v )
    {
      return v * v
    };

    var res = wTools.entityMap(numbers, sqr);
    // [ 9, 16, 36 ]
    // numbers is still [ 3, 4, 6 ]

    function checkSidesOfTriangle( v, i, src )
    {
      var sumOthers = 0,
        l = src.length,
        j;

      for ( j = 0; j < l; j++ )
      {
        if ( i === j ) continue;
        sumOthers += src[ j ];
      }
      return v < sumOthers;
    }

    var res = wTools.entityMap( numbers, checkSidesOfTriangle );
   // [ true, true, true ]
   *
   * @param {ArrayLike|ObjectLike} src Entity, on each elements of which will be called `onEach` function.
   * @param {onEach} onEach Function that produces an element of the new entity;
   * @returns {ArrayLike|ObjectLike} New entity.
   * @thorws {Error} If number of arguments less or more than 2;
   * @thorws {Error} If `src` is not Array or ObjectLike;
   * @thorws {Error} If `onEach` is not function;
   * @method entityMap
   * @memberof wTools
   */

var entityMap = function( src,onEach )
{

  _.assert( arguments.length === 2 );
  _.assert( _.objectLike( src ) || _.arrayLike( src ) );
  _.assert( _.routineIs( onEach ) );

  var result;

  if( _.arrayLike( src ) )
  {
    result = _.arrayNewOfSameLength( src );
    for( var s = 0 ; s < src.length ; s++ )
    result[ s ] = onEach( src[ s ],s,src );
  }
  else
  {
    result = new src.constructor()
    for( var s in src )
    result[ s ] = onEach( src[ s ],s,src );
  }

  return result;
}

//

// +++ improve description,
// +++ improve code formatting
// +++ use @see

  /**
   * Creates new instance with same as `src` type. Elements of new instance results of calling a provided `onEach`
   * function on every element of src. If `onEach` returns undefined, then this result is not included into the new
   * entity.
   * @see {@link wTools#entityMap}
   *
   * @example
     var numbers = [ 36, -25, 49, 64, -16 ];

     function sqrt( v )
     {
        return ( v > 0 ) ? Math.sqrt( v ) : undefined;
     };

     var res = wTools.entityMap( numbers, sqr );
   // [ 6, 7, 8 ]
   // numbers is still [ 36, -25, 49, 64, -16 ];
   *
   * @param {ArrayLike|ObjectLike} src Entity, on each elements of which will be called `onEach` function.
   * @param {onEach} onEach Function that produces an element of the new entity;
   * @returns {ArrayLike|ObjectLike} New entity.
   * @thorws {Error} If number of arguments less or more than 2;
   * @thorws {Error} If `src` is not Array or ObjectLike;
   * @thorws {Error} If `onEach` is not function;
   * @method entityMap
   * @memberof wTools
   */

var entityFilter = function( src,onEach )
{

  _.assert( arguments.length === 2 );
  _.assert( _.objectLike( src ) || _.arrayLike( src ) );
  _.assert( _.routineIs( onEach ) );

  var result;

  if( _.arrayLike( src ) )
  {
    result = _.arrayNew( src,0 );
    for( var s = 0, d = 0 ; s < src.length ; s++, d++ )
    {
      var r = onEach( src[ s ],s,src );
      if( r === undefined )
      d--;
      else
      result[ d ] = r;
    }
  }
  else
  {
    result = new src.constructor()
    for( var s in src )
    {
      r = onEach( src[ s ],s,src );
      if( r !== undefined )
      result[ s ] = r;
    }
  }

  return result;
}

//

var _entityMostComparing = function( src,onCompare )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( onCompare === undefined )
  onCompare = function( a,b ){ return a-b; }

  var result = { key : undefined, value : undefined };

  if( _.arrayLike( src ) )
  {
    result.key = 0;
    result.value = src[ 0 ];
    for( var s = 0 ; s < src.length ; s++ )
    if( onCompare( src[ s ],result.value ) < 0 )
    {
      result.key = s;
      result.value = src[ s ];
    }
  }
  else
  {
    throw _.err( 'not tested' );
    for( var s in src )
    {
      result.key = s;
      result.value = src[ s ];
      break;
    }
    for( var s in src )
    if( onCompare( src[ s ],result.value ) < 0 )
    {
      result.key = s;
      result.value = src[ s ];
    }
  }

  return result;
}

//

var entityMinComparing = function( src,onCompare )
{

  var _onCompare = null;
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( onCompare === undefined )
  _onCompare = function( a,b ){ return a-b; };
  else
  {
    throw _.err( 'not tested' );
    _onCompare = function( a,b ){ - onCompare( a,b ) };
  }

  return _entityMost( src,_onCompare );
}

//

var entityMaxComparing = function( src,onCompare )
{

  var _onCompare = null;
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( onCompare === undefined )
  _onCompare = function( a,b ){ return b-a; };
  else
  {
    throw _.err( 'not tested' );
    _onCompare = onCompare;
  }

  return _entityMost( src,_onCompare );
}

//

  /**
   * The result of _entityMost method object.
   * @typedef {Object} entityMostResult
   * @property {number} index - Index of found element;
   * @property {string|number} key - If the search was on map, the value of this property sets to key of found element;
   * Else if search was on array - to index of found element.
   * @property {number} value - The found result of onElement, if onElement don't set, this value will be same as element.
   * @property {number} element - The appropriate element for found value.
   */

// +++ not clear what onElement for?

  /**
   * On depend from passed `returnMax` argument, method returns maximum or minimum of results `onEach` function.
   * `onEach` function calls for every element of passed `src` entity. If `onElement` is undefined, method return
   maximum or minimum of passed `src` elements.
   * @param {ArrayLike|Object} src Input entity with elements.
   * @param {onEach} onElement `onEach` function calls for every element of `src`.
   * @param {boolean} returnMax If true - method returns maximum, else method returns minimum of values.
   * @returns {entityMostResult} Object with results of search.
   * @private
   * @method _entityMost
   * @memberof wTools
   */

var _entityMost = function( src,onElement,returnMax )
{

  _.assert( arguments.length === 3 );

  if( onElement === undefined )
  onElement = function( element ){ return element; }

  var onCompare = null;ghb

  if( returnMax )
  onCompare = function( a,b )
  {
    return a-b;
  }
  else
  onCompare = function( a,b )
  {
    return b-a;
  }

  var result = { index : -1, key : undefined, value : undefined, element : undefined };

  if( _.arrayLike( src ) )
  {

    if( src.length === 0 )
    return result;
    result.key = 0;
    result.value = onElement( src[ 0 ] );
    result.element = src[ 0 ];

    for( var s = 0 ; s < src.length ; s++ )
    {
      var value = onElement( src[ s ] );
      if( onCompare( value,result.value ) > 0 )
      {
        result.key = s;
        result.value = value;
        result.element = src[ s ];
      }
    }
    result.index = result.key;

  }
  else
  {

    throw _.err( 'not tested' );
    for( var s in src )
    {
      result.index = 0;
      result.key = s;
      result.value = onElement( src[ s ] );
      result.element = src[ s ]
      break;
    }

    var index = 0;
    for( var s in src )
    {
      var value = onElement( src[ s ] );
      if( onCompare( value,result.value ) > 0 )
      {
        result.index = index;
        result.key = s;
        result.value = value;
        result.element = src[ s ];
      }
      index += 1;
    }

  }

  return result;
}

//

  /**
   * Method returns minimum of results `onEach` function.
   * Function `onEach` calls for every element of passed `src` entity. If `onElement` is undefined, method returns
      minimum of passed `src` elements.
   * @example
   *
     var obj = { a: 25, b: 16, c: 9 };

     var min = wTools.entityMin( obj, Math.sqrt );
     // expected4 = { index : 2, key : 'c', value 3: , element : 9  };

   * @param {ArrayLike|Object} src
   * @param {onEach} onElement onElement `onEach` function calls for every element of `src`.
   * @returns {entityMostResult}
   * @throws {Error} If missed arguments.
   * @throws {Error} If passed extra arguments.
   * @see {@link onEach}
   * @see {@link entityMostResult}
   * @method entityMin
   * @memberof wTools
   */

var entityMin = function( src,onElement )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return _entityMost( src,onElement,0 );
}

//

  /**
   * Method returns maximum of results `onEach` function.
   * Function `onEach` calls for every element of passed `src` entity. If `onElement` is undefined, method returns
      maximum of passed `src` elements.
   * @example
   *
     var args = [3, -4, 9, -16, 5, -2];

     var sqr = function( v )
     {
       return v * v;
     };
     var max = wTools.entityMax( args, sqr );
     // { index : 3, key : 3, value : 256, element : -16 }

   * @param {ArrayLike|Object} src
   * @param {onEach} onElement `onEach` function calls for every element of `src`.
   * @returns {entityMostResult}
   * @throws {Error} If missed arguments.
   * @throws {Error} If passed extra arguments.
   * @see {@link onEach}
   * @see {@link entityMostResult}
   * @method entityMax
   * @memberof wTools
   */

var entityMax = function( src,onElement )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return _entityMost( src,onElement,1 );
}

//

var entityCoerceTo = function( src,ins )
{

  _.assert( arguments.length === 2 );

  if( _.numberIs( ins ) )
  {

    return _.numberFrom( src );

  }
  else if( _.strIs( ins ) )
  {

    return _.strFrom( src );

  }
  else if( _.boolIs( ins ) )
  {

    return _.boolFrom( src );

  }
  else throw _.err( 'unknown type to coerce to : ' + _.strTypeOf( ins ) );

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
  if( !_.routineIs( onEach ) ) throw '_.each : onEach is not routine';

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
  if( !_.routineIs( onEach ) ) throw '_.each : onEach is not routine';

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
  throw _.err( 'eachSample :','array only supported' );

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
  if( !_.routineIs( onEach ) ) throw '_.each : onEach is not routine';

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
   * @method _err
   * @memberof wTools
   */

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
      if( result.respected )
      result.respected = 0;
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
    var e = new Error(); result = new Error( originalMessage + '\n' + ( e.stack || '' ) + '\n' );
    result.originalStack = e.stack;
  }
  else try
  {
    result.message = '';
    result.message = originalMessage + '\n' + ( result.originalStack || result.stack || '' ) + '\n';
  }
  catch( e )
  {
    debugger;
    throw 'error in err';
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

  /**
   * Creates error object, with message created from passed `msg` parameters and contains error trace.
   * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
   concatenating them.
   *
   * @example
    function divide( x, y )
    {
      if( y == 0 )
        throw wTools.err( 'divide by zero' )
      return x / y;
    }
    divide( 3, 0 );

   // Error:
   // caught     at divide (<anonymous>:2:29)
   // divide by zero
   // Error
   //   at _err (file:///.../wTools/staging/wTools.s:1418:13)
   //   at wTools.err (file:///.../wTools/staging/wTools.s:1449:10)
   //   at divide (<anonymous>:2:29)
   //   at <anonymous>:1:1
   *
   * @param {...String|Error} msg Accepts list of messeges/errors.
   * @returns {Error} Created Error. If passed existing error as one of parameters, method modified it and return
   * reference.
   * @method err
   * @memberof wTools
   */

var err = function err()
{
  return _err
  ({
    args : arguments,
    level : 2,
  });
}

//

  /**
   * Creates error object, with message created from passed `msg` parameters and contains error trace.
   * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
   concatenating them. Prints the created error.
   * If _global_.logger defined, method will use it to print error, else uses console
   * @see {@link wTools#err}
   *
   *@example
     function divide( x, y )
     {
        if( y == 0 )
          throw wTools.errLog('divide by zero')
        return x / y;
     }
     divide (3, 0);

     // Error:
     // caught     at divide (<anonymous>:2:29)
     // divide by zero
     // Error
     //   at _err (file:///.../wTools/staging/wTools.s:1418:13)
     //   at wTools.errLog (file:///.../wTools/staging/wTools.s:1462:13)
     //   at divide (<anonymous>:2:29)
     //   at <anonymous>:1:1
   *
   * @param {...String|Error} msg Accepts list of messeges/errors.
   * @returns {Error} Created Error. If passed existing error as one of parameters, method modified it and return
   * @method errLog
   * @memberof wTools
   */

var errLog = function errLog()
{

  var c = _global_.logger || console;
  var err = _err
  ({
    args : arguments,
    level : 2,
  });

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

  debugger;
  return err;
}

//

  /**
   * Checks condition. If condition converts to true method returns without exceptions.
   * Else If condition is false, method generates and throws exception. By default generates error with
   * message 'Assertion failed'. But method can accept messages for generate error, or even existing error objects.
   *
   * @example
     function divide ( x, y )
     {
        wTools.assert( y != 0, 'divide by zero' );
        return x / y;
     }
     divide (3, 0);

   // caught     at divide (<anonymous>:2:29)
   // divide by zero
   // Error
   //   at _err (file:///.../wTools/staging/wTools.s:1418:13)
   //   at wTools.errLog (file://.../wTools/staging/wTools.s:1462:13)
   //   at divide (<anonymous>:2:29)
   //   at <anonymous>:1:1
   * @param {*} condition
   * @param {...String|Error} msgs error messages for generated exception.
   * @throws {Error} If passed condition failed, Method throws an error.
   * @method assert
   * @memberof wTools
   */

var assert = function assert( condition )
{

  /*return;*/
  if( DEBUG === false )
  return;

  if( !condition )
  {
    debugger;
    if( arguments.length === 1 )
    throw _err
    ({
      args : [ 'Assertion failed' ],
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
      args : _arraySlice( arguments,1 ),
      level : 2,
    });
  }

  return;
}

//

var assertMapNoUndefine = function assertMapNoUndefine( src )
{

  if( DEBUG === false )
  return;

  _.assert( arguments.length === 1 || arguments.length === 2 )

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );

  for( var s in src )
  if( src[ s ] === undefined )
  {
    debugger;
    throw _err
    ({
      args : [ ( 'Object ' + ( hasMsg ? _.arraySlice( arguments,1,arguments.length ) : '' ) + ' should have no undefines, but has' ) + ' : ' + s ],
      level : 2,
    });
  }

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
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no fields :',but.join( ',' ) ],
      level : 2,
    });
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
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no own fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

var assertMapAll = function( src,all,msg )
{

  if( DEBUG === false )
  return;

  _assert( arguments.length === 2 || arguments.length === 3 );
  _assert( arguments.length === 2 || _.strIs( msg ) );

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var but = Object.keys( _.mapBut( all,src ) );

  if( but.length )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

var assertMapOwnAll = function( src,all,msg )
{

  if( DEBUG === false )
  return;

  _assert( arguments.length === 2 || arguments.length === 3 );
  _assert( arguments.length === 2 || _.strIs( msg ) );

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  var but = Object.keys( _.mapOwnBut( all,src ) );

  if( but.length )
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have own fields :',but.join( ',' ) ],
      level : 2,
    });
  }

}

//

var assertMapNone = function( src )
{

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
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no fields :',none.join( ',' ) ],
      level : 2,
    });
  }

}

//

var assertMapOwnNone = function( src,none )
{

  if( DEBUG === false )
  return;

  var l = arguments.length;
  var hasMsg = _.strIs( arguments[ l-1 ] );
  if( hasMsg ) l -= 1;

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
  {
    debugger;
    throw _err
    ({
      args : [ hasMsg ? arguments[ l-1 ] : '','Object should have no own fields :',has.join( ',' ) ],
      level : 2,
    });
  }

}

//

  /**
   * If condition failed, method prints warning messages passed after condition argument
   * @example
    function checkAngles( a, b, c )
    {
       wTools.warn( (a + b + c) === 180, 'triangle with that angles does not exists' );
    };
    checkAngles( 120, 23, 130 );

   // triangle with that angles does not exists
   * @param condition Condition to check.
   * @param messages messages to print.
   * @method warn
   * @memberof wTools
   */

var warn = function( condition )
{

  if( !condition )
  {
    console.warn.apply( console,[].slice.call( arguments,1 ) );
  }

}

//

// +++ formatting

  /**
   * Return stack trace as string.
   * @example
    var stack;
    function function1()
    {
      function2();
    }

    function function2()
    {
      function3();
    }

    function function3()
    {
      stack = wTools.stack();
    }

    function1();
    stack
   //"    at function3 (<anonymous>:10:17)
   // at function2 (<anonymous>:6:2)
   // at function1 (<anonymous>:2:2)
   // at <anonymous>:1:1"
   *
   * @returns {String} Return stack trace from call point.
   * @method stack
   * @memberof wTools
   */

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
      enumerable : true,
      configurable : true,
      get : read,
      set : write,
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
 * @memberof wTools
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
  else throw _.err( 'nameFielded :','unknown arguments' );

}

//

/**
 * Returns name splitted in coded/raw fields.
 * @param {object} nameObject - fielded name or name as string.
 * @return {object} name splitted in coded/raw fields.
 * @method nameUnfielded
 * @memberof wTools
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
  else throw _.err( 'nameUnfielded :','Unknown arguments' );

  _assert( arguments.length === 1 );
  _assert( _.strIs( name.raw ) || _.symbolIs( name.raw ),'nameUnfielded :','not a string, something wrong :',nameObject );
  _assert( _.strIs( name.coded ) || _.symbolIs( name.coded ),'nameUnfielded :','not a string, something wrong :',nameObject );

  return name;
}

//

/**
 * Returns name splitted in coded/coded fields. Drops raw part replacing it by coded.
 * @param {object} namesMap - fielded names.
 * @return {object} expected map.
 * @method namesCoded
 * @memberof wTools
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

/**
 * Function objectIs checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * // returns true
 * var obj = {x : 100};
 * objectIs(obj);
 * @example
 * // returns false
 * objectIs(10);
 *
 * @param {*} src.
 * @return {Boolean}.
 * @method objectIs.
 * @memberof wTools#.
 */

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

  /**
   * The mapIs() method determines whether the passed value is an Object.
   *
   * If the (src) is an Object, true is returned,
   * otherwise false is.
   *
   * @param { objectLike } src - The object to be checked.
   *
   * @example
   * // returns true
   * mapIs( { a : 7, b : 13 } );
   *
   * @example
   * // returns false
   * mapIs( 13 );
   *
   * @example
   * // returns false
   * mapIs( [ 3, 7, 13 ] );
   *
   * @returns { boolean } Returns true if (src) is an Object.
   * @method mapIs
   * @memberof wTools
   */

var mapIs = function( src )
{
  return _.objectIs( src ) && src.__proto__.__proto__ === null;
  /*return _.objectIs( src ) && src.__proto__ === Object.prototype;*/
}

  //
  // !!! Not bad.
  // +++ Please change the proposal 'is object' to the 'is an Array'.
  // +++ Please change '@return' to the '@returns'.
  // +++ Please add description for @param and @returns.
  // +++ Please improve code formatting: add more spaces.
/**
 * Function arrayIs checks incoming param whether it is array.
 * Returns "true" if incoming param is an Array. Otherwise "false" returned.
 *
 * @example
 * // returns true
 * var arr = [ 1,2 ];
 * arrayIs( arr );
 *
 * @example
 * // returns false
 * arrayIs( 10 );
 *
 * @param { * } src - The value to be checked.
 * @returns { Boolean } - Returns true if (src) is an Array.
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
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * //returns true
 * strIsIs('song');
 * @example
 * // returns false
 * strIs(5);
 *
 * @param {*} src.
 * @return {Boolean}.
 * @method strIs.
 * @memberof wTools#.
 */

var strIs = function( src )
{
  var result = _ObjectToString.call( src ) === '[object String]';
  return result;
}

//

var strIsNotEmpty = function( src )
{
  if( !src )
  return false;
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
 * Function numberIs checks incoming param whether it is number.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * //returns true
 * numberIs(5);
 * @example
 * // returns false
 * numberIs('song');
 *
 * @param {*} src.
 * @return {Boolean}.
 * @method numberIs.
 * @memberof wTools#.
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

var bufferRawIs = function( src )
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

// --
// bool
// --

var boolFrom = function( src )
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

  console.warn( 'numberRandomIntNot :','NaN' );
  throw _.err( 'numberRandomIntNot :','NaN' );

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

/**
  * Return type of src.
  * @example
      var str = _.strTypeOf('testing');
  * @param {*} src
  * @return {string}
  * string name of type src
  * @method strTypeOf
  * @memberof wTools#
  */

var strTypeOf = function( src )
{

  if( !_.atomicIs( src ) )
  if( src.constructor && src.constructor.name )
  return src.constructor.name;

  return _.strPrimitiveTypeOf( src );
}

//

/**
  * Return primitive type of src.
  * @example
      var str = _.strPrimitiveTypeOf('testing');
  * @param {*} src
  * @return {string}
  * string name of type src
  * @method strPrimitiveTypeOf
  * @memberof wTools#
  */

var strPrimitiveTypeOf = function( src )
{

  var name = _ObjectToString.call( src );
  var result = /\[(\w+) (\w+)\]/.exec( name );

  if( !result )
  throw _.err( 'strTypeOf :','unknown type',name );
  return result[ 2 ];
}

//
/**
*Return in one string value of all arguments.
  *@example
   var args = _.str('test2');
*@return {string}
*If no arguments return empty string
*@method str
*@memberof wTools#

*/
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

  /**
    * Compares two strings.
    * @param {string} src - source string
    * @param {string} begin
    * @example
        var scr = ._strBegins("abc","a");
    * @return {Boolean}
    * If param begin is match with param src first chars than return true
    * @method strBegins
    * @memberof wTools#
    */

var strBegins = function( src,begin )
{

  _.assert( _.strIs( src ),'expects string' );
  _.assert( _.strIs( begin ),'expects string' );
  _.assert( arguments.length === 2 );

  return src.lastIndexOf( begin,0 ) === 0;
}

//

  /**
    * Compares two strings.
    * @param {string} src - source string
    * @param {string} end
    * @example
        var scr = ._strEnds("abc","c");
    * @return {Boolean}
    * If param end is match with param src last chars than return true
    * @method strEnds
    * @memberof wTools#
    */

var strEnds = function( src,end )
{

  _.assert( _.strIs( src ),'expects string' );
  _.assert( _.strIs( end ),'expects string' );
  _.assert( arguments.length === 2 );

  return src.indexOf( end,src.length - end.length ) !== -1;
}

//
/**
*Cut begin of the string.
*@param {string} src
*@param {string} begin
  *example
   var scr = ._strBeginRemove("abc","a");
*@return {string}
*If result of method strBegins - false, than return src
*else cut begin of param src
*@method strBeginRemove
*@memberof wTools#
*/
var strBeginRemove = function( src,begin )
{
  if( !strBegins( src,begin ) )
  return src;
  return src.substr( begin.length,src.length );
}

//
/**
*Cut end of the string.
*@param {string} src
*@param {string} end
  *example
   var scr = ._strEndRemove("abc","c");
*@return {string}
*If result of method strEnds - false, than return src
*Else cut end of param src
*@method strEndRemove
*@memberof wTools#
*/
var strEndRemove = function( src,end )
{
  if( !strEnds( src,end ) )
  return src;
  debugger;
  return src.substr( src.length-end.length,src.length );
}

//

  /**
    * Prepend string to begin of other string.
    * @param {string} src
    * @param {string} begin
    * @example
      var scr = ._strPrependOnce("test","test");
    * @return {string}
    * if begin match with first chars of param src, return src
    * else add param src to param begin
    * @method strPrependOnce
    * @memberof wTools
    */

var strPrependOnce = function( src,begin )
{
  if( src.lastIndexOf( begin,0 ) === 0 )
  return src;
  else
  return begin + src;
}

//

  /**
    * Append string to end of other string.
    * @param {string} src
    * @param {string} end
    * example
      var src = ._strAppendOnce("test","test");
    * @return {string}
    * if end match with last chars of param src, return src
    * else add param end to param src
    * @method strPrependOnce
    * @memberof wTools
  */

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

  /**
   * The complete RegexpObject object.
   * @typedef {Object} RegexpObject
   * @property {RegExp[]} includeAny - Array of RegExps, to check matching any of them;
   * @property {REgExp[]} includeAll - Array of RegExps, to check matching all of them;
   * @property {REgExp[]} excludeAny - Array of RegExps, to check mismatch any of them;
   * @property {REgExp[]} excludeAll - Array of RegExps, to check mismatch all of them;
   * @memberof wTools
   */

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

/**
 * Escapes special characters with a slash (\). Supports next set of characters : .*+?^=! :${}()|[]/\
 *
 * @example
 * wTools.regexpEscape('Hello. How are you?'); // "Hello\. How are you\?"
 * @param {String} src Regexp string
 * @returns {String} Escaped string
 * @method regexpEscape
 * @memberof wTools
 */
var regexpEscape = function( src )
{
  return src.replace( /([.*+?^=! :${}()|\[\]\/\\])/g, "\\$1" );
}

//

/**
 * Turn a *-wildcard style glob into a regular expression
 * @example
 * var glob = '* /www/*.js';
 * wTools.regexpForGlob(glob);
 * // /^.\/[^\/]*\/www\/[^\/]*\.js$/m
 * @param {String} glob *-wildcard style glob
 * @returns {RegExp} RegExp that represent passed glob
 * @throw {Error} If missed argument, or got more than one argumet
 * @throw {Error} If glob is not string
 * @method regexpForGlob
 * @memberof wTools
 */
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


/**
 * Make regexp from string.
 *
 * @example
 * wTools.regexpMakeExpression('Hello. How are you?'); // /Hello\. How are you\?/
 * @param {String} src - string or regexp
 * @returns {String} Regexp
 * @throws {Error} Throw error with message 'unknown type of expression, expects regexp or string, but got' error
 if src not string or regexp
 * @method regexpMakeExpression
 * @memberof wTools
 */
var regexpMakeExpression = function( src )
{

  if( _.regexpIs( src ) )
  return src;

  if( _.strIs( src ) )
  return new RegExp( _.regexpEscape( src ) );

  debugger;
  throw _.err( 'regexpMakeExpression :','unknown type of expression, expects regexp or string, but got',src );
}

//

  /**
   *  Generates "but" regular expression pattern. Accepts a list of words, which will be used in regexp.
   *  The result regexp matches the strings that do not contain any of those words.
   *
   * @example
   * wTools.regexpBut_('yellow', 'red', 'green'); //   /^(? :(?!yellow|red|green).)+$/
   *
   * var options = {
   *    but : ['yellow', 'red', 'green'],
   *    atLeastOnce : false
   * };
   * wTools.regexpBut_(options); // /^(? :(?!yellow|red|green).)*$/
   *
   * @param {Object} [options] options for generate regexp. If this argument omitted then default options will be used
   * @param {String[]} [options.but=null] a list of words,from each will consist regexp
   * @param {boolean} [options.atLeastOne=true] indicates whether search matches at least once
   * @param {...String} [words] a list of words, from each will consist regexp. This arguments can be used instead
   * options object.
   * @returns {RegExp} Result regexp
   * @throws {Error} If passed arguments are not strings or options object.
   * @throws {Error} If options contains any different from 'but' or 'atLeastOnce' properties.
   * @method regexpBut_
   * @memberof wTools
   */

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

  // !!! test me in builder
  // var result = '^(? :(?!';

  for( var w = 0 ; w < words.length ; w++ )
  _.assert( _.strIs( words[ w ] ) );

  result += words.join( '|' );

  if( atLeastOnce )
  result += ').)+$';
  else
  result += ').)*$';

  console.log( 'regexpBut_.result : ' + result )

  return new RegExp( result );
}

regexpBut_.defaults =
{
  but : null,
  atLeastOnce : true,
}

//

/**
 * Wraps regexp(s) into array and returns it. If in `src` passed string - turn it into regexp
 *
 * @example
 * wTools.regexpArrayMake( ['red', 'white', /[a-z]/] ); // [ /red/, /white/, /[a-z]/ ]
 * @param {String[]|String} src - array of strings/regexps or single string/regexp
 * @returns {RegExp[]} Array of regexps
 * @throw {Error} if `src` in not string, regexp, or array
 * @method regexpArrayMake
 * @memberof wTools
 */

var regexpArrayMake = function( src )
{
  _.assert( _.arrayIs( src ) || _.regexpIs( src ) || _.strIs( src ),'expects array/regexp/string, got ' + _.strTypeOf( src ) );

  src = _.arrayIron( src );

  _.each( src,function( e,k,i )
  {

    src[ k ] = _.regexpMakeExpression( e );

  });

  return src;
}

//

  /**
   * regexpArrayIndex() returns the index of the first regular expression that matches substring
    Otherwise, it returns -1.
   * @example
   *
     var str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
     var regArr1 = [/white/, /green/, /blue/];
     wTools.regexpArrayIndex(regArr1, str); // 1

   * @param {RegExp[]} arr Array for regular expressions.
   * @param {String} ins String, inside which will be execute search
   * @returns {number} Index of first matching or -1.
   * @throws {Error} If first argument is not array.
   * @throws {Error} If second argument is not string.
   * @throws {Error} If element of array is not RegExp.
   * @method regexpArrayIndex
   * @memberof wTools
   */

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

/**
 * Checks if any regexp passed in `arr` is found in string `ins`
 * If match was found - returns match index
 * If no matches found and regexp array is not empty - returns false
 * If regexp array is empty - returns some default value passed in the `none` input param
 *
 * @example
 * var str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * var regArr2 = [/yellow/, /blue/, /red/];
 * wTools._regexpArrayAny(regArr2, str, false); // 1
 *
 * var regArr3 = [/yellow/, /white/, /greey/]
 * wTools._regexpArrayAny(regArr3, str, false); // false
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @method _regexpArrayAny
 * @memberof wTools
 */

var _regexpArrayAny = function( arr,ins,none )
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

/**
 * Checks if all regexps passed in `arr` are found in string `ins`
 * If any of regex was not found - returns match index
 * If regexp array is not empty and all regexps passed test - returns true
 * If regexp array is empty - returns some default value passed in the `none` input param
 *
 * @example
 * var str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * var regArr1 = [/red/, /green/, /blue/];
 * wTools._regexpArrayAll(regArr1, str, false); // true
 *
 * var regArr2 = [/yellow/, /blue/, /red/];
 * wTools._regexpArrayAll(regArr2, str, false); // 0
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @method _regexpArrayAll
 * @memberof wTools
 */

var _regexpArrayAll = function( arr,ins,none )
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

  /**
   * Make RegexpObject from different type sources.
      If passed RegexpObject or map with properties similar to RegexpObject but with string in values, then the second
   parameter is not required;
      All strings in sources will be turned into RegExps.
      If passed single RegExp/String or array of RegExps/Strings, then method will return RegexpObject with
   `defaultMode` as key, and array of RegExps created from first parameter as value.
      If passed array of RegexpObject, mixed with ordinary RegExps/Strings, the result object will be created by merging
   with shrinking (see [regexpObjectShrink]{@link wTools#regexpObjectShrink}) RegexpObjects and RegExps that associates
   with `defaultMode` key.
   *
   * @example
     var src = [
         /hello/,
         'world',
         {
            includeAny : ['yellow', 'blue', 'red'],
            includeAll : [/red/, /green/, /brown/],
            excludeAny : [/yellow/, /white/, /grey/],
            excludeAll : [/red/, /green/, /blue/]
         }
     ];
     wTools.regexpObjectMake(src, 'excludeAll');

     // {
     //    includeAny: [/yellow/, /blue/, /red/],
     //    includeAll: [/red/, /green/, /brown/],
     //    excludeAny: [/yellow/, /white/, /grey/],
     //    excludeAll: [/hello/, /world/]
     // }
   * @param {RegexpObject|String|RegExp|RegexpObject[]|String[]|RegExp[]} src Source for making RegexpObject
   * @param {String} [defaultMode] key for result RegexpObject map. Can be one of next strings: 'includeAny',
   'includeAll','excludeAny' or 'excludeAll'.
   * @returns {RegexpObject} Result RegexpObject
   * @throws {Error} Missing arguments if call without argument
   * @throws {Error} Missing arguments if passed array without `defaultMode`
   * @throws {Error} Unknown mode `defaultMode`
   * @throws {Error} Unknown src if first argument is not array, map, string or regexp.
   * @throws {Error} Unexpected if type of array element is not string regexp or RegexpObject.
   * @throws {Error} Unknown regexp filters if passed map has unexpected properties (see RegexpObject).
   * @method regexpObjectMake
   * @memberof wTools
   */

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
    _.assert( regexpObjectMake.names[ defaultMode ],'unknown mode :',defaultMode );

    if( !defaultMode )
    throw _.err( 'regexpObjectMake :','defaultMode is needed for array' );

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

    /* result[ defaultMode ] = _.regexpArrayMake( ar ); */

  }
  else if( _.mapIs( src ) )
  {

    _.each( src,function _onEach( e,k,i )
    {
      result[ k ] = _.regexpArrayMake( e );
    });

  }
  else throw _.err( 'regexpObjectMake :','unknown src',src );

  _.assertMapOnly( result,regexpObjectMake.names,'Unknown regexp filters.' );

  return result;
}

regexpObjectMake.names = regexpModeNames;

//

  /**
   * Create RegexpObject, that represents the subtraction for match`s/mismatched with the input RegexpObject object
   e.g. if { includeAll: [ /red/, /green/, /blue/ ] } represents subset of all strings that contains each 'red', 'green'
   and 'blue' words, then result of regexpObjectBut() - { excludeAll: [ /red/, /green/, /blue/ ]} will represent the
   subset of all strings that does not contains at least one of those worlds.
   *
   * @example
     var options = {
           includeAny : [/yellow/, /blue/, /red/],
           includeAll : [/red/, /green/, /blue/],
           excludeAny : [/yellow/, /white/, /grey/],
           excludeAll : [/black/, /brown/, /pink/]
       };

     wTools.regexpObjectBut(options);

      // {
      //   "includeAny":[/yellow/, /white/, /grey/],
      //   "excludeAny":[/yellow/, /blue/, /red/],
      //   "excludeAll":[/red/, /green/, /blue/],
      //   "includeAll":[/black/, /brown/, /pink/]
      // }
   * @param {...RegexpObject|...String|...RegExp} [src] Input RegexpObject map/maps. If passed primitive values, they will
   be interpreted as value for `includeAny` property of RegexpObject. If objects more than one, their includeAny and
   excludeAny properties will be merged. Notice: if objects more than one and every has includeAll/excludeAll arrays
   with more than one elements, method will throw error.
   * @returns {RegexpObject} Result RegexpObject map.
   * @throws {Error} If objects more than one and every has includeAll/excludeAll arrays with more than one elements
   * throws 'cant combine such regexp objects with "but" combiner'
   * @method regexpObjectBut
   * @memberof wTools
   */

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
      else throw _.err( 'regexpObjectBut :','cant combine such regexp objects with "but" combiner' );
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
      else throw _.err( 'regexpObjectBut :','cant combine such regexp objects with "but" combiner' );
    }

    /*
    var result = _.regexpObjectMake
    ({

      includeAny : src.excludeAny,
      includeAll : src.excludeAll,
      excludeAny : src.includeAny,
      excludeAll : src.includeAll,

    });
    */

  }

  return result;
}

//

  /**
   * Test the `ins` string by condition specified in `src`. If all condition are met, return true
   * _regexpObjectTestReason(options, str); // true
   * @param {Object} src Object with options for test
   * @param {Regexp[]} [src.excludeAll] Array with regexps for testing. If all of the regexps match at `ins` method
   * return the "excludeAll" string, otherwise checks next property in the `src` object
   * @param {Regexp[]} [src.excludeAny] Array with regexps for testing. If any of them match `ins` string` method return
   * it source string, otherwise checks next property in the `src` object
   * @param {Regexp[]} [src.includeAll] Array with regexps for testing. If all of them match `ins` string method check
   * next property in `src` object, otherwise return source of regexp that don't match.
   * @param {Regexp[]} [src.includeAny] Array with regexps for testing. If no one regexp don't match method return
   * "inlcude none from includeAny" string. Else method return true;
   * @param {String} ins String for testing
   * @returns {String|boolean} If all reason match, return true, otherwise return string with fail reason
   * @throws {Error} Throw an 'expects string' error if `ins` is not string
   * @throws {Error} Throw an 'expects object' error if `src` is not object
   * @method _regexpObjectTestReason
   * @memberof wTools
  */

var _regexpObjectTestReason = function( src,ins )
{

  if( !_.strIs( ins ) )
  throw _.err( 'regexpObjectTest :','expects string as second argument',ins );

  if( !_.mapIs( src ) )
  throw _.err( 'regexpObjectTest :','expects object',src );

  if( src.excludeAll )
  {
    var r = _._regexpArrayAll( src.excludeAll,ins,false );
    if( r === true )
    return 'excludeAll';
  }

  if( src.excludeAny )
  {
    var r = _._regexpArrayAny( src.excludeAny,ins,false );
    if( r !== false )
    return src.excludeAny[ r ].source;
  }

  if( src.includeAll )
  {
    var r = _._regexpArrayAll( src.includeAll,ins,true );
    if( r !== true )
    return src.includeAll[ r ].source;
  }

  if( src.includeAny )
  {
    var r = _._regexpArrayAny( src.includeAny,ins,true );
    if( r === false )
    return 'include none from includeAny';
  }

  return true;
}

//

  /**
   * Function for testing `ins` string for different regexps combination. If all condition passed in `src` object are
   * met method return true
   *
   * @example
   * var str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
   *     regArr1 = [/red/, /green/, /blue/],
   *     regArr2 = [/yellow/, /blue/, /red/],
   *     regArr3 = [/yellow/, /white/, /greey/],
   *     options = {
   *        includeAny : regArr2,
   *        includeAll : regArr1,
   *        excludeAny : regArr3,
   *        excludeAll : regArr2
   *     };
   *
   * wTools.regexpObjectTest( options, str ); // true
   * @param {Object} src Map object in wich keys are strings each of them mean different condition for test, and values
   * are the arrays of regexps;
   * @param {Regexp[]} [src.excludeAll] Array with regexps for testing. If all of the regexps match at `ins` method
   * return false
   * @param {Regexp[]} [src.excludeAny] Array with regexps for testing. If any of them match `ins` string` method return
   * false
   * @param {Regexp[]} [src.includeAll] Array with regexps for testing. If any of them don't match `ins` string method
   * return false
   * @param {Regexp[]} [src.includeAny] Array with regexps for testing. If no one of regexps don't match `ins` string
   * method return false
   * @param ins String for testing
   * @returns {boolean} If all test passed return true;
   * @throws {Error} Throw an 'expects string' error if `ins` is not string
   * @throws {Error} Throw an 'expects object' error if `src` is not object
   * @method regexpObjectTest
   * @memberof wTools
     */

var regexpObjectTest = function( src,ins )
{
  var result = _regexpObjectTestReason( src,ins );

  if( _.strIs( result ) )
  return false;

  if( result === true )
  return true;

  debugger;
  throw _.err( 'unexpected' );
}

//

  /**
   * Extends `result` of RegexpObjects by merging other RegexpObjects.
   * The properties such as includeAll, excludeAny are complemented from appropriate properties in source  objects
     by merging all of them;
   * Properties includeAny and excludeAll are always replaced by appropriate properties from sources without merging,
   *
   * @example
   * var dest = {
   *     includeAny : [/yellow/, /blue/],
   *     includeAll : [/red/],
   *     excludeAny : [/yellow/],
   *     excludeAll : [/red/]
   * },
   *
   * src1 = {
   *     includeAll : [/green/],
   *     excludeAny : [/white/],
   *     excludeAll : [/green/, /blue/]
   * },
   * src2 = {
   *     includeAny : [/red/],
   *     includeAll : [/brown/],
   *     excludeAny : [/greey/],
   * }
   *
   * wTools.regexpObjectShrink(dest, src1, src2);
   *
   * //{
   * //    includeAny : [/red/],
   * //    includeAll : [/red/, /green/, /brown/],
   * //    excludeAny : [/yellow/, /white/, /greey/],
   * //    excludeAll : [/green/, /blue/]
   * //};
   * @param {RegexpObject} result RegexpObject to merge in.
   * @param {...RegexpObject} [src] RegexpObjects to merge from.
   * @returns {RegexpObject} Reference to `result` parameter;
   * @throws {Error} If missed arguments
   * @throws {Error} If arguments are not RegexpObject
   * @method regexpObjectShrink
   * @memberof wTools
   */

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

  /**
   * Extends `result` of RegexpObjects by merging other RegexpObjects.
   * Appropriate properties such as includeAny, includeAll, excludeAny and excludeAll are complemented from appropriate
   * properties in source objects by merging;
   *
   * @example
   * var dest = {
   *     includeAny : [/yellow/, /blue/],
   *     includeAll : [/red/],
   *     excludeAny : [/yellow/],
   *     excludeAll : [/red/]
   * },
   *
   * src1 = {
   *     includeAll : [/green/],
   *     excludeAny : [/white/],
   *     excludeAll : [/green/, /blue/]
   * },
   * src2 = {
   *     includeAny : [/red/],
   *     includeAll : [/brown/],
   *     excludeAny : [/greey/],
   * }
   *
   * wTools.regexpObjectBroaden(dest, src1, src2);
   *
   * //{
   * //    includeAny : [/yellow/, /blue/, /red/],
   * //    includeAll : [/red/, /green/, /brown/],
   * //    excludeAny : [/yellow/, /white/, /greey/],
   * //    excludeAll : [/red/, /green/, /blue/]
   * //};
   * @param {RegexpObject} result RegexpObject to merge in.
   * @param {...RegexpObject} [src] RegexpObjects to merge from.
   * @returns {RegexpObject} Reference to `result` parameter;
   * @throws {Error} If missed arguments
   * @throws {Error} If arguments are not RegexpObject
   * @method regexpObjectBroaden
   * @memberof wTools
   */

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

  /**
   * Merge several RegexpObjects extending one by others.
      Order of extending make difference because joining of some parameters without lose is not possible.
      options.shrinking gives a hint in what direction the lost should be made.

   * @param {object} options - options of merging.
   * @param {RegexpObject} options.dst
      RegexpObject to merge in.
   * @param {RegexpObject} options.srcs -
      RegexpObjects to merge from.
   * @param {Boolean} options.shrinking -
      Shrinking or broadening mode.
      Joining of some parameters without lose is not possible.
      This parameter gives a hint in what direction the lost should be made.
   * @returns {RegexpObject}
      merged RegexpObject.
   * @throws {Error} If in options missed any of 'dst', 'srcs' or 'shrinking' properties
   * @throws {Error} If options.dst is not object
   * @throws {Error} If options.srcs is not arrayLike object
   * @throws {Error} If options.srcs element is not RegexpObject object
   * @method _regexpObjectExtend
   * @memberof wTools
   */

var _regexpObjectExtend = function( options )
{

  _.assertMapOnly( _regexpObjectExtend.defaults,options );
  _.mapComplement( options,_regexpObjectExtend.defaults );

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
      throw _.err( 'regexpObjectExtend :','argument must be regexp object',src );
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

  /**
   * Creates array of RegexpObjects, that will be associated with some ordered set of subsets of strings.
   Accepts array of strings. They will be used as base for RegexpObjects. The empty string in array will be
   converted into RegexpObject that associates with subset what is the subtraction of all possible subsets of strings
   and union of subsets which match other words in array.
   If several arrays are passed in the method, the result will be cartesian product of appropriates arrays described
   above.
   * @example
   *
   var arr1 = ['red', 'blue'],
   arr2 = ['', 'green'];

   wTools.regexpObjectOrering(arr1, arr2);
   // [
   //     {
   //         includeAny:[],
   //         includeAll:[/red/],
   //         excludeAny:[/green/],
   //         excludeAll:[]},
   //
   //     {
   //         includeAny:[],
   //         includeAll:[/red/,/green/],
   //         excludeAny:[],
   //         excludeAll:[]},
   //
   //     {
   //         includeAny:[],
   //         includeAll:[/blue/],
   //         excludeAny:[/green/],
   //         excludeAll:[]},
   //
   //     {
   //         includeAny:[],
   //         includeAll:[/blue/, /green/],
   //         excludeAny:[],
   //         excludeAll:[]
   //     }
   // ]
   * @param {...String[]} ordering аrray/аrrays of strings
   * @returns {RegexpObject[]} аrray of RegexpObject that represent resulting ordering
   * @throws {Error} Unexpected type, if passed arguments is not arrays.
   * @method regexpObjectOrering
   * @memberof wTools
   */

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

  /**
   * Wrap strings passed in `ordering` array into RegexpObjects.
      Any non empty string in input array turns into RegExp which is wraped into array and assign to includeAll,
   property of appropriate object. An empty string in array are replaced by merged subtractions for all created
   RegexpObjects objects.

   * @param {String[]} ordering - array of strings.
   * @returns {RegexpObject[]} Returns array of RegexpObject
   * @private
   * @throws {Error} If no arguments, or arguments more than 1.
   * @method _regexpObjectOrderingExclusion
   * @memberof wTools
   */

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
 * Internal implementation.
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @method _routineBind
 * @memberof wTools
 */

var _routineBind = function _routineBind( options )
{

  _assert( arguments.length === 1 );
  _assert( _.boolIs( options.seal ) );
  _assert( _.routineIs( options.routine ),'_routineBind :','expects routine' );
  _assert( _.arrayIs( options.args ) || _.argumentsIs( options.args ) || options.args === undefined );

  var routine = options.routine;
  var args = options.args;
  var context = options.context;

  if( _FunctionBind )
  {

    if( context !== undefined && args === undefined )
    {
      if( options.seal === true )
      throw _.err( 'not tested, not clear what convetion was meant. use [] as third argument or rotineJoin' );
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

  /**
   * The routineBind() method creates a new function with its 'this' (context) set to the provided `context`
   value. Argumetns `args` of target function which are passed before arguments of binded function during
   calling of target function
   * @example
    var o = {
        z: 5
    };

    var y = 4;

    function sum(x, y) {
       return x + y + this.z;
    }
    var newSum = wTools.routineBind(sum, o, [3]);
    newSum(y); // 12
   * @param {Function} routine Function which will be used as base for result function.
   * @param {Object} context The value that will be set as 'this' keyword in new function
   * @param {Array<*>} args Arguments to prepend to arguments provided to the bound function when invoking the target
   function. Must be wraped into array.
   * @returns {Function} New created function with preceding this, and args.
   * @throws {Error} When first argument is not callable throws error with text 'first argument must be a routine'
   * @thorws {Error} If passed arguments more than 3 throws error with text 'expects 3 or less arguments'
   * @method routineBind
   * @memberof wTools
   */

var routineBind = function routineBind( routine, context, args )
{

  _assert( _.routineIs( routine ),'routineBind :','first argument must be a routine' );
  _assert( arguments.length <= 3,'routineBind :','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : false,
  });

}

//

  /**
   * The routineJoin() method creates a new function with its 'this' (context) set to the provided `context`
   value. Argumetns `args` of target function which are passed before arguments of binded function during
   calling of target function
   * @example
   var o = {
        z: 5
    };

   var y = 4;

   function sum(x, y) {
       return x + y + this.z;
    }
   var newSum = wTools.routineJoin(o, sum, [3]);
   newSum(y); // 12

   * @param {Object} context The value that will be set as 'this' keyword in new function
   * @param {Function} routine Function which will be used as base for result function.
   * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
   calling of target function. Must be wraped into array.
   * @returns {Function} New created function with preceding this, and args.
   * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
   * @thorws {Error} If passed arguments more than 3 throws error with text 'expects 3 or less arguments'
   * @method routineJoin
   * @memberof wTools
   */

var routineJoin = function routineJoin( context, routine, args )
{

  _assert( _.routineIs( routine ),'routineJoin :','second argument must be a routine' );
  _assert( arguments.length <= 3,'routineJoin :','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : false,
  });

}

//

  /**
   * Return new function with sealed context and arguments.
   *
   * @example
   var o = {
        z: 5
    };

   function sum(x, y) {
       return x + y + this.z;
    }
   var newSum = wTools.routineSeal(o, sum, [3, 4]);
   newSum(y); // 12
   * @param {Object} context The value that will be set as 'this' keyword in new function
   * @param {Function} routine Function which will be used as base for result function.
   * @param {Array<*>} args Arguments wrapped into array. Will be used as argument to `routine` function
   * @returns {Function} Result function with sealed context and arguments.
   * @method routineJoin
   * @memberof wTools
   */

var routineSeal = function routineSeal( context, routine, args )
{

  _assert( _.routineIs( routine ),'routineSeal :','second argument must be a routine' );
  _assert( arguments.length <= 3,'routineSeal :','expects 3 or less arguments' );

  return _routineBind
  ({
    routine : routine,
    context : context,
    args : args,
    seal : true,
  });

}

//

  /**
   * Return function that will call passed routine function with delay.
   * @param {number} delay delay in milliseconds
   * @param {Function} routine function that will be called with delay.
   * @returns {Function} result function
   * @throws {Error} If arguments less then 2
   * @throws {Error} If `delay` is not a number
   * @throws {Error} If `routine` is not a function
   * @method routineDelayed
   * @memberof wTools
   */

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

  /**
   * Call each routines in array with passed context and arguments.
      The context and arguments are same for each called functions.
      Can accept only routines without context and args.
      Can accept single routine instead array.
   * @example
      var x = 2, y = 3,
          o { z: 6 };

      var sum = function(x, y) {
          return x + y + this.z;
      },
      prod = function (x, y) {
          return x * y * this.z;
      },
      routines = [ sum, prod ];
      var res = wTools.routinesCall(o, routines, [x, y]);
   // [ 11, 36 ]
   * @param {Object} [context] Context in which calls each function.
   * @param {Function[]} routines Array of called function
   * @param {Array<*>} [args] Arguments that will be passed to each functions.
   * @returns {Array<*>} Array with results of functions invocation.
   * @method routinesCall
   * @memberof wTools
   */

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
      /*console.log( 'timeOnce :','was taken' );*/
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
  var con = new wConsequence();
  var id;

  if( arguments.length > 2 )
  {
    throw _.err( 'Not tested' );
    _assert( arguments.length <= 4 );
    onReady = _.routineJoin( arguments[ 2 ],onReady[ 3 ],arguments[ 4 ] );
  }

  _assert( _.numberIs( delay ) );

  var handlePeriodicCon = function( err )
  {
    if( err ) clearInterval( id );
  }

  var _onReady = null;

  if( _.routineIs( onReady ) )
  _onReady = function()
  {
    var result = onReady.call();
    if( result === false )
    clearInterval( id );
    wConsequence.give( con );
    con.then_( handlePeriodicCon );
  }
  else if( onReady instanceof wConsquence )
  _onReady = function()
  {
    var result = onReady.ping();
    if( result === false )
    clearInterval( id );
    wConsequence.give( con );
    con.then_( handlePeriodicCon );
  }
  else if( onReady === undefined )
  _onReady = function()
  {
    wConsequence.give( con );
    con.then_( handlePeriodicCon );
  }
  else throw _.err( 'unexpected type of onReady' );

  id = setInterval( _onReady,delay );

  return con;
}

//

var _timeNow_gen = function()
{
  var now;

  _assert( arguments.length === 0 );

  if( typeof performance !== 'undefined' && performance.now !== undefined )
  now = _.routineJoin( performance,performance.now );
  else if( Date.now )
  now = _.routineJoin( Date,Date.now );
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
  // !!! Not bad
  // +++ Please improve code formatting: add more spaces,
  //     add dots at the end of sentences.
  // +++ Please change the proposal 'creates a new array' to the
  //     'returns a shallow copy of a portion of an array'.

/**
 * The arraySub() method returns a shallow copy of a portion of an array or a new TypedArray that contains
 * the elements from (begin) index to the (end) index, but not including (end).
 *
 * @example
 * // returns [ 3,4 ]
 * var arr = _.arraySub( [ 1,2,3,4,5 ],2,4 );
 *
 * @param { Array } src - Source array.
 * @param { Number } begin - Index at which to begin extraction.
 * @param { Number } end - Index at which to end extraction.
 * @returns { Array } - The new array.
 * @method arraySub
 * @throws { Error } If passed arguments is less than three.
 * @throws { Error } If the first argument is not array.
 * @memberof wTools#
 */

var arraySub = function( src,begin,end )
{

  _.assert( arguments.length <= 3 );

  if( _.atomicIs( src ) )
  throw _.err( 'arraySub','Unknown argument type' );

  if( _.routineIs( src.subarray ) )
  return src.subarray( begin,end );

  if( !_.routineIs( src.slice ) )
  throw _.err( 'arraySub','Unknown argument type' );

  return src.slice( begin,end );
}

//

// not really copy in case of TypedArray !!!
// does it throw something? !!!
// second arguments is optional !!!

  // !!! Not bad.
  // +++ Please improve code formatting: add more spaces,
  //     add dots at the end of sentences.
/**
 * The arrayNew() method returns a new array or a new TypedArray with length equal (length)
 * or the same length of the initial array if second argument is not provided.
 *
 * @example
 * // returns [ , ,  ]
 * var arr = _.arrayNew( [ 1,2,3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * var arr = _.arrayNew( [ 1,2,3 ],4 );
 *
 * @param { arrayLike } ins - Instance of an array.
 * @param { Number } [length] - The length of the new array.
 * @returns { arrayLike } - An empty array.
 * @method arrayNew
 * @throws { Error } If passed arguments is less than two.
 * @throws { Error } If the first argument in not array like object.
 * @memberof wTools#
 */

var arrayNew = function( ins,length )
{
  var result;

  _.assert( arguments.length <= 2 );

  if( length === undefined )
  {
    _assert( _.numberIs( ins.length ) );
    length = ins.length;
  }

  if( _.arrayIs( ins ) || _.bufferIs( ins ) || ins instanceof ArrayBuffer )
  result = new ins.constructor( length );
  else throw _.err( 'arrayNew :','unknown type of instance' );

  return result;
}

//
  // !!! Not bad.
  // +++ Please improve code formatting: add more spaces,
  //     add dots at the end of sentences.

/**
 * The arrayNewOfSameLength() method returns a new empty array or a new TypedArray with the same length as in (ins).
 *
 * * @example
 * // returns [ , , , ,  ]
 * var arr = _.arrayNewOfSameLength( [ 1,2,3,4,5 ] );
 *
 * @param { arrayLike } ins - Instance of an array.
 * @returns { arrayLike } - The new empty array.
 * @method arrayNewOfSameLength
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If the first argument in not array like object.
 * @memberof wTools#
 */

var arrayNewOfSameLength = function( ins )
{

  _.assert( arguments.length === 1 );

  if( _.atomicIs( ins ) ) return;
  if( !_.arrayIs( ins ) && !_.bufferIs( ins ) ) return;
  var result = arrayNew( ins,ins.length );
  return result;
}

//
  // !!! Not bad.
  // +++ Please improve code formatting: add more spaces.
  // +++ @param (dst) has to be @param { ( number | arrayLike ) }.
  // +++ Please add description: What will happen if the first argument is an array?
  // +++ Please add at least two different example.

/**
 * The arrayOrNumber() method returns a new array which containing the elements only type of Number.
 * 
 * If the first argument is an array and its length is equal the value of the second argument
 * than returns this array.
 *
 * @example
 * // returns [ 2,2,2,2 ]
 * var arr = _.arrayOrNumber(2, 4);
 *
 * @example
 * // returns [ 1,'str',{ a : 1 },null ]
 * var arr = _.arrayOrNumber( [ 1,'str',{ a : 1 },null ],4 );
 *
 * @param { ( Number | arrayLike ) } dst - Value to fill the array.
 * @param { Number } length - The length of the new array.
 * @returns { Number[] } - The new array of numbers.
 * @method arrayOrNumber
 * @throws { Error } If missed argument, or got less or more than two argument.
 * @throws { Error } If type of the first argument is not a number or array.
 * @throws { Error } If the second argument is less then 0.
 * @throws { Error } If length of the first argument is less then value of second argument.
 * @memberof wTools#
 */

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
  // !!! Not bad.
  // +++ Please improve code formatting: add more spaces,
  //     add dots at the end of sentences.

/**
 * The arraySelect() method selects elements from (srcArray) by indexes of (indicesArray).
 *
 * @example
 * // returns [ 3,4,5 ]
 * var arr = _.arraySelect( [ 1,2,3,4,5 ],[ 2,3,4 ] );
 *
 * @example
 * // returns [ undefined,undefined ]
 * var arr = _.arraySelect( [ 1,2,3 ],[ 4,5 ] );
 *
 * @param { arrayLike } srcArray - Values for the new array.
 * @param { ( arrayLike | object ) } [indicesArray] - Index of elements from the (srcArray) or options object.
 * @returns { arrayLike } - Return a new array with the length equal indicesArray.length and elements from (srcArray).
   If there is no element with necessary index than the value will be undefined.
 * @method arraySelect
 * @throws { Error } If passed arguments is not array like object.
 * @throws { Error } If the atomsPerElement property is not equal to 1.
 * @memberof wTools#
 */

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
  // !!! Not bad.
  // +++ Please improve code formatting: add more spaces,
  //     add dots at the end of sentences.
  // +++ Please add @param { ... } - 'description'.
  // !!! Please add description: What will happen if within (arguments) will be an array or an object?

// !!! not clear what for?

/**
 * The arrayIron() method copy the values of all arguments to a new array.
 *
 * If passed an array than all its values are copied into the result array.
 *
 * @example
 * // returns [ 'str',{},1,2,5,true ]
 * var arr = _.arrayIron( 'str',{},[ 1,2 ],5,true );
 *
 * @param { ...* } arguments[] - The source objects.
 * @returns { Array } - The new array.
 * @method arrayIron
 * @throws { Error } If type of the passed arguments is equal undefined.
 * @memberof wTools#
 */

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
    throw _.err( 'arrayCopy :','argument must be array-like' );

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
    else if( _.bufferRawIs( argument ) ) length += argument.byteLength;
    else length += 1;
  }

  // make result

  if( _.arrayIs( arguments[ 0 ] ) || _.bufferIs( arguments[ 0 ] ) )
  result = arrayNew( arguments[ 0 ],length );
  else if( _.bufferRawIs( arguments[ 0 ] ) )
  result = new ArrayBuffer( length );

  var bufferDst;
  var offset = 0;
  if( _.bufferRawIs( arguments[ 0 ] ) )
  {
    bufferDst = new Uint8Array( result );
  }

  // copy

  for( var a = 0, c = 0 ; a < arguments.length ; a++ )
  {
    var argument = arguments[ a ];
    if( _.bufferRawIs( argument ) )
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

  // !!! not optimal

  return result;
}

//

/**
 * The arrayAppendMerging() method returns an array of elements from (dst)
 * and appending all of the following arguments to the end.
 *
 * @example
 * // returns [ 1,2,'str',false,{ a : 1 },42 ]
 * var arr = _.arrayAppendMerging( [ 1,2 ],'str',false,{ a : 1 },42 );
 *
 * @param { Array } dst - Initial array.
 * @returns { arrayLike } - The new array.
 * @method arrayAppendMerging
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools#
 */

var arrayAppendMerging = function arrayAppendMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayAppendMerging :','expects array' );

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

/**
 * The arrayPrependMerging() method returns an array of elements from (dst)
 * and prepending all of the following arguments(from end) to the beginning.
 *
 * @example
 * // returns [ 'str',false,{ a : 1 },42,1,2 ]
 * var arr = _.arrayPrependMerging( [ 1,2 ],'str',false,{ a : 1 },42 );
 *
 * @param { Array } dst - Initial array.
 * @returns { arrayLike } - The new array.
 * @method arrayPrependMerging
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools#
 */

var arrayPrependMerging = function arrayPrependMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayPrependMerging :','expects array' );

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

/**
 * The arrayAppendOnceMerging() method returns an array of elements from (dst)
 * and appending only unique following arguments to the end.
 *
 * @example
 * // returns [ 1,2,'str',{},5 ]
 * var arr = _.arrayAppendOnceMerging( [ 1,2 ],'str',2,{},[ 'str',5 ] );
 *
 * @param { Array } dst - Initial array.
 * @returns { Array } - The new array.
 * @method arrayAppendOnceMerging
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools#
 */

var arrayAppendOnceMerging = function arrayAppendOnceMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayAppendOnceMerging :','expects array' );

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

/**
 * The arrayAppendOnceMerging() method returns an array of elements from (dst)
 * and prepending only unique following arguments to the beginning.
 *
 * @example
 * // returns [ {},'str',5,2,4 ]
 * var arr = _.arrayPrependOnceMerging( [ 2,4 ],5,4,'str',{} );
 *
 * @param { Array } dst - Initial array.
 * @returns { Array } - The new array.
 * @method arrayPrependOnceMerging
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools#
 */

var arrayPrependOnceMerging = function arrayPrependOnceMerging( dst )
{
  var result = dst;

  _assert( _.arrayIs( dst ),'arrayPrependOnceMerging :','expects array' );

  for( var a = arguments.length-1 ; a > 0 ; a-- )
  {
    var argument = arguments[ a ];

    if( argument === undefined )
    throw _.err( 'arrayPrependOnceMerging','argument is not defined' );

    if( _.arrayLike( argument ) )
    {
      for( var i = argument.length-1 ; i >= 0 ; i-- )
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

/**
 * The arrayElementsSwap() method reverses the elements by indices (index1) and (index2) in the (dst) array.
 *
 * @example
 * // returns [ 5,2,3,4,1 ]
 * var arr = _.arrayElementsSwap( [ 1,2,3,4,5 ],0,4 );
 *
 * @param { Array } dst - Initial array.
 * @param { Number } index1 - The first index.
 * @param { Number } index2 - The second index.
 * @returns { Array } - Modified array of.
 * @method arrayElementsSwap
 * @throws { Error } If the first argument in not an array.
 * @throws { Error } If the second argument is less than 0 and more than a length initial array.
 * @throws { Error } If the third argument is less than 0 and more than a length initial array.
 * @memberof wTools#
 */

var arrayElementsSwap = function( dst,index1,index2 )
{
  _assert( _.arrayLike( dst ),'arrayElementsSwap :','argument must be array' );
  _assert( 0 <= index1 && index1 < dst.length,'arrayElementsSwap :','index1 is out of bound' );
  _assert( 0 <= index2 && index2 < dst.length,'arrayElementsSwap :','index2 is out of bound' );

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
    var sep = ( src.indexOf( ',' ) !== -1 )?( ',' ) :' ';
    return src.split(/[, ]+/).map( function( s ){ if( s.length ) return parseFloat(s); } );
  }

  if( _.argumentsIs( src ) )
  return _ArraySlice.call( src );

  throw _.err( 'arrayFrom : unknown source : ' + _.strTypeOf( src ) );
}

//

var arrayToMap = function( array )
{
  var result = {};

  _.assert( array.length === 1 );
  _.assert( _.arrayLike( array ) );

  for( var a = 0 ; a < array.length ; a++ )
  result[ a ] = array[ a ];
  return result;
}

//

var arrayRemoveArrayOnce = function( dstArray,insArray,onEqual )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( _.arrayLike( insArray ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  var result = 0;
  var index = -1;

  if( arguments.length === 2 )
  {

    for( var i = 0 ; i < insArray.length ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      if( !( index >= 0 ) )
      continue;
      dstArray.splice( index,1 );
      result += 1;
    }

  }
  else if( arguments.length === 3 )
  {

    _.assert( _.routineIs( onEqual ) );
    for( var i = 0 ; i < insArray.length ; i++ )
    {
      index = arrayLeftIndexOf( dstArray,insArray[ i ],onEqual );
      if( !( index >= 0 ) )
      continue;
      dstArray.splice( index,1 );
      result += 1;
    }

  }
  else throw _.err( 'unexpected' );

  return result;
}

//

/**
 * Callback for compare two value.
 *
 * @callback compareCallback
 * @param { Number } el - Element of the array.
 * @param { Number } ins - Value to compare.
 */

/**
 * The arrayRemovedOnce() method returns the index of the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and remove this element.
 *
 * @example
 * // returns 1
 * var arr = _.arrayRemovedOnce( [ 2,4,6 ],2,function( el,ins ) {
 *   return el > ins;
 * });
 *
 * @param { Array } dstArray - Source array.
 * @param { Number } ins - Value to remove.
 * @param { compareCallback } [onEqual] - The callback that compares (ins) with elements of the array.
   By default, it checks the equality of two arguments.
 * @method arrayRemovedOnce
 * @returns { Number } - The index of element.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools#
 */

var arrayRemovedOnce = function( dstArray,ins,onEqual )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 2 || arguments.length === 3 );

  var index = -1;

  if( arguments.length === 2 )
  {

    index = dstArray.indexOf( ins );

  }
  else if( arguments.length === 3 )
  {

    _.assert( _.routineIs( onEqual ) );
    index = arrayLeftIndexOf( dstArray,ins,onEqual );

  }
  else throw _.err( 'unexpected' );

  if( index >= 0 )
  dstArray.splice( index,1 );

  return index;
}

//

/**
 * The arrayRemoveOnce() method removes the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and returns a modified array.
 *
 * @example
 * // returns [ 1,2,3,'str' ]
 * var arr = _.arrayRemoveOnce( [ 1,'str',2,3,'str' ],'str' );
 *
 * @param { Array } dstArray - Source array.
 * @param { Number } ins - Value to remove.
 * @param { compareCallback } [onEqual] - The callback that compares (ins) with elements of the array.
   By default, it checks the equality of two arguments.
 * @method arrayRemoveOnce
 * @returns { Array } - Modified array.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools#
 */

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

/**
 * The arrayRemovedAll() method removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the amount them.
 *
 * @example
 * // returns 4
 * var arr = _.arrayRemovedAll( [ 1,2,3,4,5,5,5 ],5,function( el,ins ) {
 *   return el < ins;
 * });
 *
 * @param { Array } dstArray - Source array.
 * @param { Number } ins - Value to remove.
 * @param { compareCallback } [onEqual] - The callback that compares (ins) with elements of the array.
   By default, it checks the equality of two arguments.
 * @method arrayRemovedAll
 * @returns { Number } - The amount removed elements.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools#
 */

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

/**
 * The arrayRemoveAll() method removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the modified array.
 *
 * @example
 * // returns [ 1,3,5 ]
 * var arr = _.arrayRemoveAll( [ 1,2,2,3,5 ],2 );
 *
 * @param { Array } dstArray - Source array.
 * @param { Number } ins - Value to remove.
 * @param { compareCallback } [onEqual] - The callback that compares (ins) with elements of the array.
   By default, it checks the equality of two arguments.
 * @method arrayRemoveAll
 * @returns { Array } - Modified array.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools#
 */

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

var arrayReplaceOnce = function( dstArray,ins,sub )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 3 );

  var index = -1;

  index = dstArray.indexOf( ins );

  if( index >= 0 )
  dstArray.splice( index,1,sub );

  return index;
}

//

var arrayUpdate = function( dstArray,ins,sub )
{
  _.assert( _.arrayLike( dstArray ) );
  _.assert( arguments.length === 3 );

  var index = arrayReplaceOnce( dstArray,ins,sub );

  if( index === -1 )
  {
    dstArray.push( sub );
    index = dstArray.length - 1;
  }

  return index;
}

//

var arrayAppendOnce = function( dst,src )
{

  _.assert( _.arrayIs( dst ) || dst === undefined );
  _.assert( arguments.length === 2 );

  if( !dst )
  return [ src ];

  var i = dst.indexOf( src );

  if( i === -1 )
  dst.push( src );

  return dst;
}

//

var arrayPrependOnce = function( dst,src )
{

  _.assert( _.arrayIs( dst ) || dst === undefined );
  _.assert( arguments.length === 2 );

  if( !dst )
  return [ src ];

  var i = dst.indexOf( src );

  if( i === -1 )
  dst.unshift( src );

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

/**
 * The arraySlice() returns a shallow copy of a portion of an array
 * into a new array.
 *
 * It takes array and two variables
 * checks if array is an Array creates variables (result, a, b)
 * and assign them values.
 * arraySlice() creates a new array from (a) to but not including (b).
 * If (b) is omitted, arraySlice extracts
 * through the end of the sequence (array.length).
 * If not arguments, it assigns a default variables
 * and return an empty array.
 *
 * @param { Array } [ array = [] ] - Array
 * @param { a } [ a = 0 ] - begin zero-based index at which to begin extraction.
 * @param { b } [ b = array.length ] - end zero-based index at which to end extraction.
 * Array to return a new array from begin to but not including end.
 *
 * @example
 * // returns [ 3, 4, 5, 6, 7, 8, 9 ]
 * arraySlice( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ], 2, 9 );
 *
 * @returns { Array } returns a shallow copy of elements from the original array.
 * @method arraySlice
 * @memberof wTools
*/

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

/**
 * The arrayAs() method copies passed argument to the array.
 *
 * @example
 * // returns [ false ]
 * var arr = _.arrayAs( false );
 *
 * @example
 * // returns [ { a : 1, b : 2 } ]
 * var arr = _.arrayAs( { a : 1, b : 2 } );
 *
 * @param { * } src - Source value.
 * @method arrayAs
 * @returns { Array } - If passed null or undefined than return the empty array. If passed an array then return it.
   Otherwise return an array which contains the element from argument.
 * @memberof wTools#
 */

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
    throw '_.arrayToStr : not tested';
    for( var s = 0 ; s < src.length-1 ; s++ )
    {
      result += String( src[ s ] ) + ' ';
    }
    result += String( src[ s ] ) + ' ';
  }

  return result;
}

//

/**
 * The arrayPut() method puts all value of arguments after second argument to (dstArray)
 * in the position (dstOffset) and changes values of following index.
 *
 * @example
 * // returns [ 1,2,'str',true,7,8,9 ]
 * var arr = _.arrayPut( [ 1,2,3,4,5,6,9 ],2,'str',true,[ 7,8 ] );
 *
 * @param { arrayLike } dstArray - Source array.
 * @param { Number } dstOffset - The index of element where need to put the new values.
 * @method arrayPut
 * @returns { arrayLike } - Modified array.
 * @memberof wTools#
 */

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
  throw _.err( 'arrayMask :','expects array-like as srcArray' )
  if( !_.arrayLike( mask )  )
  throw _.err( 'arrayMask :','expects array-like as mask' )

  var atomsPerElement = mask.length;
  var length = srcArray.length / atomsPerElement;
  if( Math.floor( length ) !== length )
  throw _.err( 'arrayMask :','expects mask has component for each atom of srcArray',_.toStr({ 'atomsPerElement' : atomsPerElement, 'srcArray.length' : srcArray.length  }) );

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

/**
 * The arrayFill() method creates a new array and fills it a values.
 *
 * @example
 * // returns [ 3,3,3,3,3 ]
 * var arr = _.arrayFill( { times : 5, value : 3 } );
 *
 * @example
 * // returns [ 0,0,0,0 ]
 * var arr = _.arrayFill( 4 );
 *
 * @example
 * // returns [ 0,0,0 ]
 * var arr = _.arrayFill( [ 1,2,3 ] );
 *
 * @param { Object } options - Options to fill the array.
 * @param { Number } options.times - The count of repeats.
   If in the function passed Array, the times will be equal the length of array. If Number than this value.
 * @param { Number } [options.value = 0] - Value for the filling.
 * @method arrayFill
 * @returns { Array } - The new array.
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If passed argument is not object.
 * @memberof wTools#
 */

var arrayFill = function arrayFill( options )
{

  _assert( arguments.length === 1 );
  _assert( _.objectIs( options ) || _.numberIs( options ) || _.arrayIs( options ),'arrayFill :','"options" must be object' );

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

/**
 * The arrayCompare() method returns the first difference between the values of the first array from the second.
 *
 * @example
 * // returns 3
 * var arr = _.arrayCompare( [ 1,5 ],[ 1,2 ] );
 *
 * @param { Array } src1 - The first array.
 * @param { Array } src2 - The second array.
 * @method arrayCompare
 * @returns { Number } - Difference the values.
 * @memberof wTools#
 */

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

/**
 * The arraySame() method check the equality of two arrays.
 *
 * @example
 * // returns true
 * var arr = _.arraySame( [ 1,2,3 ],[ 1,2,3 ] );
 *
 * @param { Array } src1 - The first array.
 * @param { Array } src2 - The second array.
 * @method arraySame
 * @returns { Boolean } - Returns true if all values of the two array are equal. Otherwise returns false.
 * @memberof wTools#
 */

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

/**
 * The arrayHasAny() method checks in the array has at least one value of the following arguments.
 *
 * @example
 * // returns true
 * var arr = _.arrayHasAny( [ 5,'str',42,false ],false,7 );
 *
 * @param { arrayLike } src - Source array.
 * @method arrayHasAny
 * @returns { Boolean } - Returns true if there are and false if not.
 * @throws { Error } If the first argument in not an array.
 * @memberof wTools#
 */

var arrayHasAny = function( src )
{
  _assert( _.arrayIs( src ) || _.bufferIs( src ),'arrayHasAny :','array expected' );

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

/**
 * The arrayCount() method returns the count of matching elements in the array.
 *
 * @example
 * // returns 2
 * var arr = _.arrayCount( [ 1,2,'str',10,10,true ],10 );
 *
 * @param { arrayLike } src - Source array.
 * @param { * } instance - Value to search.
 * @method arrayCount
 * @returns { Number } - Count of elements.
 * @throws { Error } If passed arguments is less than two or more than three.
 * @throws { Error } If the first argument is not an array like object.
 * @memberof wTools#
 */

var arrayCount = function( src,instance )
{
  var result = 0;

  _assert( arguments.length === 2 );
  _assert( _.arrayLike( src ),'arrayCount :','expects ArrayLike' );

  var index = src.indexOf( instance );
  while( index !== -1 )
  {
    result += 1;
    index = src.indexOf( instance,index+1 );
  }

  return result;
}

//

var arraySum = function( src,onElement )
{
  var result = 0;

  _assert( arguments.length === 1 || arguments.length === 2 );
  _assert( _.arrayLike( src ),'arraySum :','expects ArrayLike' );

  if( onElement === undefined )
  onElement = function( e ){ return e; }

  for( var i = 0 ; i < src.length ; i++ )
  {
    result += onElement( src[ i ],i,src );
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
    _assert( _.arrayLike( arguments[ a ] ),'argument is not defined :',a );
    length = Math.max( length,arguments[ a ].length );
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
  _assert( arguments[ a ],'argument is not defined :',a );

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

/**
 * The arrayRandom() method returns an array which contains the random numbers.
 *
 * @example
 * // returns [ 6,2,4,7,8 ]
 * var arr = _.arrayRandom( {
 *   length : 5,
 *   range : [1, 9],
 *   int : true
 * } );
 *
 * @param { Object } options - Options for getting random numbers.
 * @param { Number } options.length - The length of array.
 * @param { Array } [options.range = [0, 1]] - The range of numbers.
 * @param { Boolean } [options.int = false] - Floating point numbers or not.
 * @method arrayRandom
 * @returns { Array } - The array of numbers.
 * @memberof wTools#
 */

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
 * Generate array of arithmetic progression series. From range[ 0 ] to range[ 1 ] with increment 1.
 *
 * @example
    var range = _.arrayRange([ 1,10 ]);
 *
 * @param {arrayLike} range
    The first and the last+1 elements of the progression.
 * @return {array}
    An array of numbers for the requested range. May be an empty
    array if adding the step would not converge toward the end value.
 * @method arrayRange
 * @memberof wTools
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

  return { value : arr[ index ], index : index };
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
  if( c  === 0 ) return { value : arr[ index ], index : index };
  if( c < 0 )
  {
    throw _.err( 'redundant branch?' );
    if( ( arr.length-1 ) === index )
    return { value : arr[ index ], index : index };
    else if( Math.abs( comparator( arr[ index + 1 ],ins ) ) < Math.abs( c ) )
    return { value : arr[ index + 1 ], index : index + 1 };
    else
    return { value : arr[ index ], index : index };
  }
  if( c > 0 )
  {
    if( 0 === index )
    return { value : arr[ index ], index : index };
    else if( Math.abs( comparator( arr[ index - 1 ],ins ) ) < Math.abs( c ) )
    return { value : arr[ index - 1 ], index : index - 1 };
    else
    return { value : arr[ index ], index : index };
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
  throw _.err( '_.bufferResize :','"src" is not instance of "ArrayBuffer"' );

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
  else throw _.err( '_.bufferBytesGet :','wrong argument' );

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
    throw _.err( '_.bufferMove :','"dst" and "src" must have same length' );

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

    if( _.bufferRawIs( dst ) )
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
  if( !options.sameLength ) throw _.err( '_.bufferFromArrayOfArray :','differemt length of arrays is not implemented' );

  if( !array.length ) return new options.BufferType();

  var atomsPerElement = _.numberIs( array[ 0 ].length ) ? array[ 0 ].length : array[ 0 ].len;

  if( !_.numberIs( atomsPerElement ) ) throw _.err( '_.bufferFromArrayOfArray :','cant find out element length' );

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

var bufferRawFromBuffer = function( buffer )
{

  _.assert( arguments.length === 1 );
  _.assert( _.bufferIs( buffer ) || _.bufferRawIs( buffer ) );

  if( _.bufferRawIs( buffer ) )
  return buffer;

  var result = buffer.buffer;

  if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
  result = result.slice( buffer.byteOffset || 0,buffer.byteLength );

  return result;
}

//

var bufferRawFrom = function( buffer )
{
  var result;

  _.assert( arguments.length === 1 );

  if( buffer instanceof ArrayBuffer )
  return buffer;

  if( _.bufferNodeIs( buffer ) )
  {

    result = new Uint8Array( buffer ).buffer;
/*
    if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
    result = result.slice( buffer.byteOffset || 0,buffer.byteLength );
*/

  }
  else if( _.bufferIs( buffer ) )
  {

    buffer = buffer.buffer;
    if( buffer.byteOffset || buffer.byteLength !== result.byteLength )
    result = result.slice( buffer.byteOffset || 0,buffer.byteLength );

  }
  else if( _.strIs( buffer ) )
  {

    result = _.utf8ToBuffer( buffer );

  }
  else if( _global_.File && buffer instanceof File )
  {
    var fileReader = new FileReaderSync();
    result = fileReader.readAsArrayBuffer( buffer );
    throw 'Not tested';
  }
  else throw _.err( 'bufferRawFrom : unknown source' );

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
  throw _.err( 'buffersSerialize :','buffer does not have enough space' );

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
  _.assert( _.bufferRawIs( commonBuffer ) || _.bufferIs( commonBuffer ) );

  commonBuffer = _.bufferRawFromBuffer( commonBuffer );

  for( var a in store[ 'attributes' ] )
  {
    var attribute = store[ 'attributes' ][ a ];

    var bufferConstructor = _global_[ attribute[ 'bufferConstructorName' ] ];
    var offset = attribute[ 'offsetInCommonBuffer' ];
    var size = attribute[ 'size' ];
    var sizeOfAtom = attribute[ 'sizeOfAtom' ];
    var fields = attribute[ 'fields' ];

    _.assert( _.routineIs( bufferConstructor ),'unknown attribute\' constructor :',attribute[ 'bufferConstructorName' ] )
    _.assert( _.numberIs( offset ),'unknown attribute\' offset in common buffer :',offset )
    _.assert( _.numberIs( size ),'unknown attribute\' size of buffer :',size )
    _.assert( _.numberIs( sizeOfAtom ),'unknown attribute\' sizeOfAtom of buffer :',sizeOfAtom )

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

  /**
   * The mapClone() method is used to clone the values of all
   * enumerable own properties from (srcObject) object to an (options.dst) object.
   *
   * It creates two variables:
   * var options = options || {}, result = options.dst || {}.
   * Iterate over (srcObject) object, checks if (srcObject) object has own properties.
   * If true, it creates [ key, value ] for each (key) to the result,
   * and returns clone result.__proto__ = srcObject.__proto__;
   *
   * @param { objectLike } srcObject - The source object.
   * @param { objectLike } [ options.dst = {} ] - The target object.
   *
   * @example
   * var Example = function() {
   *   this.name = 'Peter';
   *   this.age = 27;
   * }
   * // returns Example { sex : 'Male', name : 'Peter', age : 27 }
   * mapClone( new Example(), { dst : { sex : 'Male' } } );
   *
   * @returns { objectLike }  The (result) object gets returned.
   * @method mapClone
   * @throws { Error } Will throw an Error if ( options ) is not an Object,
   * if ( arguments.length > 2 ), if (key) is not a String or
   * if (srcObject) has not own properties.
   * @memberof wTools
   */

var mapClone = function( srcObject,options )
{
  var options = options || {};
  var result = options.dst || {};

  _assert( _.mapIs( options ) );
  _assert( arguments.length <= 2,'mapClone :','expects srcObject as argument' );
  _assert( objectLike( srcObject ),'mapClone :','expects srcObject as argument' );

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

  /**
   * The mapExtendFiltering() creates a new [ key, value ]
   * from the next objects if callback function (filter) returns true.
   *
   * It calls a provided callback function (filter) once for each key in an (argument),
   * and adds to the (srcObject) all the [ key, value ] for which callback
   * function (filter) returns true.
   *
   * @callback requestCallback
   * @param { objectLike } dstObject - The target object.
   * @param { objectLike } argument - The next object.
   * @param { string } key - The key of the (argument) object.
   *
   * @param { requestCallback } filter - Callback function to test each [ key, value ]
   * of the (dstObject) object.
   * @param { objectLike } dstObject - The target object.
   * @param { ...objectLike } - The next object.
   *
   * @example
   * // returns { a : 1, b : 2, c : 3 }
   * mapExtendFiltering( _.filter.supplementary(), { a : 1, b : 2 }, { a : 1 , c : 3 } );
   *
   * @returns { objectLike } Returns the unique [ key, value ].
   * @method mapExtendFiltering
   * @throws { Error } Will throw an Error if ( arguments.length < 3 ), (filter)
   * is not a Function, (result) and (argument) are not the objects.
   * @memberof wTools
   */

var mapExtendFiltering = function( filter,dstObject )
{
  var result = dstObject;
  var filter = _.filter.makeMapper( filter );

  if( result === null ) result = {};

  _assert( arguments.length >= 3 );
  _assert( _.routineIs( filter ) );
  _assert( _.objectLike( result ),'mapExtendFiltering :','expects object as argument' );

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

/**
 * The mapExtend() is used to copy the values of all properties
 * from one or more source objects to a target object.
 *
 * It takes first object (dstObject)
 * creates variable (result) and assign first object.
 * Checks if arguments equal two or more and if (result) is an object.
 * If true,
 * it extends (result) from the next objects.
 *
 * @param{ objectLike } [ dstObject = {} ] - The target object.
 * @param{ ...objectLike } - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the target object.
 * @method mapExtend
 * @throws { Error } Will throw an error if ( arguments.length < 2 ),
 * if the (dstObject) is not an Object.
 * @memberof wTools
 */

var mapExtend = function mapExtend( dstObject )
{
  var result = dstObject;

  if( result === null ) result = {};

  assert( arguments.length >= 2 );
  assert( objectLike( result ),'mapExtend :','expects object as argument' );

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

  /**
   * The mapSupplement() method returns an object with unique [ key, value ].
   *
   * It creates the variable (args), assign to a copy of pseudo array (arguments),
   * adds a callback function filter to the beginning of the (args)
   * and returns an object with unique [ key, value ].
   *
   * @param { ...objectLike } - The source object(s).
   *
   * @example
   * // returns { a : 1, b : 2, c : 3 }
   * mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
   *
   * @returns { objectLike } Returns an object with unique [ key, value ].
   * @method mapSupplement
   * @memberof wTools
   */

var mapSupplement = function( dst )
{

  var args = _.arraySlice( arguments );
  args.unshift( _.filter.supplementary() );
  return mapExtendFiltering.apply( this,args );

/*
  var result = dst;

  if( result === null ) result = {};

  _assert( arguments.length >= 2 );
  _assert( _.objectLike( result ),'mapSupplement :','expects object as argument' );

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
  /**
   * The mapComplement() method returns an object
   * filled by all unique, clone [ key, value ].
   *
   * It creates the variable (args), assign to a copy of pseudo array (arguments),
   * adds a specific callback function (_.filter.supplementaryCloning())
   * to the beginning of the (args)
   * and returns an object filled by all unique clone [key, value].
   *
   * @param { ...objectLike } - The source object(s).
   *
   * @example
   * // returns { a : 1, b : 'yyy', c : 3 };
   * mapComplement( { a : 1, b : 'yyy' }, { a : 12 , c : 3 } );
   *
   * @returns { objectLike } Returns an object filled by all unique, clone [ key, value ].
   * @method mapComplement
   * @memberof wTools
   */

var mapComplement = function( dst )
{

  var args = _.arraySlice( arguments );
  args.unshift( _.filter.supplementaryCloning() ); // ??? own
  return mapExtendFiltering.apply( this,args );

}

  /**
   * The mapCopy() method is used to copy the values of all properties
   * from one or more source objects to the new object.
   *
   * @param { ...objectLike } - The source object(s).
   *
   * @example
   * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
   * mapCopy( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
   *
   * @returns { objectLike } It will return the new object filled by [ key, value ].
   * @method mapCopy
   * @memberof wTools
   */

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
   * @memberof wTools
   */

var mapFirstPair = function mapFirstPair( srcObject )
{

  for( var s in srcObject )
  {
    return [ s,srcObject[ s ] ];
  }

}

//

  /**
   * The mapToArray() converts an object (src) into array [ [ key, value ] ... ].
   *
   * It takes an object (src) creates an empty array,
   * checks if ( arguments.length === 1 ) and (src) is an object.
   * If true, it returns a list of [ [ key, value ] ... ] pairs.
   * Otherwise it throws an Error.
   *
   * @param { objectLike } src - object to get a list of [ key, value ] pairs.
   *
   * @example
   * // returns [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ]
   * mapToArray( { a : 3, b : 13, c : 7 } );
   *
   * @returns { array } returns a list of [ [ key, value ] ... ] pairs.
   * @method mapToArray
   * @throws { Error } Will throw an Error if( arguments.length !== 1 ) or (src) is not an object.
   * @memberof wTools
   */

var mapToArray = function( src )
{
  var result = [];

  _.assert( arguments.length === 1 );
  _.assert( _.objectIs( src ) );

  for( var s in src )
  {
    result.push( [ s,src[s] ] );
  }

  return result;
}

//

  /**
   * The mapValWithIndex() returns value of (src) by corresponding (index).
   *
   * It takes (src) and (index), creates a variable ( i = 0 ),
   * checks if ( index > 0 ), iterate over array (src) and match
   * if ( i == index ).
   * If true, it returns value of (src).
   * Otherwise it increment ( i++ ) and iterate over (src) until it doesn't match index.
   *
   * @param { array } src - The Array.
   * @param { number } index - To find the position an element.
   *
   * @example
   * // returns 7
   * mapValWithIndex( [ 3, 13, 'c', 7 ], 3 );
   *
   * @returns { * } Returns value of (src) by corresponding (index).
   * @method mapValWithIndex
   * @throws { Error } Will throw an Error if( arguments.length > 2 ) or (src) is not an Object.
   * @memberof wTools
   */

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

  /**
   * The mapKeyWithIndex() returns key of (src) by corresponding (index).
   *
   * It takes (src) and (index), creates a variable ( i = 0 ),
   * checks if ( index > 0 ), iterate over array (src) and match
   * if ( i == index ).
   * If true, it returns value of (src).
   * Otherwise it increment ( i++ ) and iterate over (src) until it doesn't match index.
   *
   * @param { array } src - The Array.
   * @param { number } index - To find the position an element.
   *
   * @example
   * // returns 'b'
   * mapKeyWithIndex( [ 'a', 'b', 'c', 'd' ], 1 );
   *
   * @returns { string } Returns key of (src) by corresponding (index).
   * @method mapKeyWithIndex
   * @throws { Error } Will throw an Error if( arguments.length > 2 ) or (src) is not an Object.
   * @memberof wTools
   */

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

  /**
   * The mapToString() method returns a string representing object.
   *
   * It takes an object and two strings (keyValSep) and (tupleSep),
   * checks if (keyValSep and tupleSep) are strings.
   * If false, it assigns them defaults (' : ') to the (keyValSep) and
   * ('; ') to the tupleSep.
   * Otherwise, it returns a string representing object.
   *
   * @param { objectLike } src - The object.
   * @param { string } keyValSep - colon.
   * @param { string } tupleSep - semicolon.
   *
   * @example
   * // returns 'a : 1; b : 2; c : 3; d : 4'
   * mapToString( { a : 1, b : 2, c : 3, d : 4 }, ' : ', '; ' );
   *
   * @returns { string } Returns string (result) representing object.
   * @method mapToString
   * @memberof wTools
   */

var mapToString = function( src,keyValSep,tupleSep )
{

  if( !_.strIs( keyValSep ) ) keyValSep = ' : ';
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

/**
 * The mapKeys() returns
 * an array of a given object's own enumerable properties,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object (src) creates an empty array,
 * checks if (src) is an object and has any keys.
 * If true,
 * it returns an array of keys,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } src - The object whose properties are to be returned.
 *
 * @example
 * // returns [ "a", "b" ]
 * mapKeys( { a : 7, b : 13 } );
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the enumerable properties found directly upon object.
 * @method mapKeys
 * @throws { Error } Will throw an Error if (src) is not an Object.
 * @memberof wTools
*/

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

/**
 * The mapValues() method returns an array of a given object's
 * own enumerable property values,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object (src) creates an empty array,
 * checks if (src) is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } src - The object whose property values are to be returned.
 *
 * @example
 * // returns [ "7", "13" ]
 * mapValues( { a : 7, b : 13 } );
 *
 * @returns { array } returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @method mapValues
 * @throws { Error } Will throw an Error if (src) is not an Object.
 * @memberof wTools
*/

var mapValues = function( src )
{
  var result = [];

  _.assert( _.objectLike( src ) );

  for( var s in src )
  result.push( src[ s ] );

  return result;
}

//

/**
 * The mapPairs() converts an object into a list of [ key, value ] pairs.
 *
 * It takes an object (src) creates an empty array,
 * checks if (src) is an object.
 * If true, it returns a list of [ key, value ] pairs,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } src - Object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * mapPairs( { a : 7, b : 13 } );
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @method mapPairs
 * @throws { Error } Will throw an Error if (src) is not an Object.
 * @memberof wTools
*/

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

  /**
   * The mapGroup() method returns an object with certain group of key.
   *
   * It creates an empty (result) object, iterate over array (src),
   * checks if (result) object has certain value.
   * If undefined, it creates (value) with an empty array.
   * Otherwise, it adds to certain (value) the object with target key.
   *
   * @param { array } src - The target array.
   * @param { objectLike | string } options - The object with key or string of the key.
   *
   * @example
   * // returns { 33 : [ { key1 : 33 } ], 44 : [ { key1 : 44 }, { key2 : 77 } ] }
   * mapGroup( [ { key1 : 44, key2 : 77 }, { key1 : 33 } ], 'key1');
   *
   * @returns { objectLike } Returns an object with certain group of key.
   * @method mapGroup
   * @throws { Error } Will throw an Error if (options.key) is not a string,
   * if (src) is not an object, if (options) is not an object.
   * @memberof wTools
   */

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

/**
 * The mapSame() returns true, if the second object (src2)
 * has the same values as the first object(src1).
 *
 * It takes two objects (scr1, src2), checks
 * if both object have the same length and [key, value] return true
 * otherwise it returns undefined.
 *
 * @param { objectLike } src1 - First object.
 * @param { objectLike } src2 - Target object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapSame( { a : 7, b : 13 }, { a : 7, b : 13 } );
 *
 * @example
 * returns undefined
 * mapSame( { a : 7, b : 13 }, { a : 33, b : 13 } );
 *
 * @example
 * returns undefined
 * mapSame( { a : 7, b : 13, c : 33 }, { a : 7, b : 13 } );
 *
 * @returns { boolean }
 * @method mapSame
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */

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

/**
 * The mapContain() returns true, if the first object (src)
 * has the same values as the second object(ins).
 *
 * It takes two objects (scr, ins),
 * checks if the first object (src) has the same [key, value] as
 * the second object (ins).
 * If true, it returns true,
 * otherwise it returns false.
 *
 * @param { objectLike } src - Target object.
 * @param { objectLike } ins - Second object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * mapContain( { a : 7, b : 13 }, { a : 7, b : 13, c : 15 } );
 *
 * @returns { boolean }
 * @method mapContain
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */

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
 * The mapOwn() returns true if object has own property.
 *
 * It takes (name) checks if (name) is a String,
 * if (object) has own property with the (name).
 * If true, it returns true.
 *
 * @param { objectLike } object - Object that will be check.
 * @param { name } name - Target property.
 *
 * @example
 * // returns true
 * mapOwn({a : 7, b : 13}, 'a');
 *
 * mapOwn( { a : 7, b : 13 }, 'c' );
 * output : false
 *
 * @returns { boolean }
 * @method mapOwn
 * @throws { mapOwn } Will throw an error if the (name) is unknown.
 * @memberof wTools
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

var mapHas = function( object,name )
{
  var name = _.nameUnfielded( name ).coded;

  var descriptor = Object.getOwnPropertyDescriptor( object,name );

  if( !descriptor )
  return false;

  if( descriptor.set && descriptor.set.forbid )
  return false;

  return true;
}

//

  /**
   * Returns new object with unique keys.
   *
   * Takes any number of objects.
   * Returns new object filled by unique keys
   * from the first (srcMap) original object.
   * Values for result object come from original object (srcMap)
   * not from second or other one.
   * If the first object has same key any other object has
   * then this pair( key/value ) will not be included into result object.
   * Otherwise pair( key/value ) from the first object goes into result object.
   *
   * @param{ objectLike } srcMap - original object.
   * @param{ ...objectLike } srcMap - one or more objects.
   * Objects to return an object without repeating keys.
   *
   * @example
   * // returns { c : 3 }
   * mapBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
   *
   * @throws { Error }
   *  In debug mode it throws an error if any argument is not object like.

   * @returns { object } Returns new object made by unique keys.
   * @method mapBut
   * @memberof wTools
   */

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

      _assert( _.objectLike( argument ),'argument','#'+a,'is not object' );

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

  /**
   * The mapButFiltering() method returns a new object (result)
   * whose (values) are not equal to the arrays or objects.
   *
   * Takes any number of objects.
   * If the first object has same key any other object has
   * then this pair [ key, value ] will not be included into (result) object.
   * Otherwise,
   * it calls a provided callback function (_.filter.atomic())
   * once for each key in the (srcMap), and adds to the (result) object
   * all the [ key, value ],
   * if values are not equal to the array or object.
   *
   * @callback requestCallback
   * @param { objectLike } result - The new object.
   * @param { objectLike } srcMap - The target object.
   * @param { string } k - The key of the (srcMap) object.
   *
   * @param { requestCallback } filter - Callback function to test each [ key, value ] of the (srcMap) object.
   * @param { objectLike } srcMap - The target object.
   * @param { ...objectLike } - The next objects.
   *
   * @example
   * // returns {a: 1, b: "xxx"}
   * mapButFiltering( _.filter.atomic(), { a : 1, b : 'xxx', c : [ 1, 2, 3 ] } );
   *
   * @returns { objectLike } Returns an object whose (values) are not equal to the arrays or objects.
   * @method mapButFiltering
   * @throws { Error } Will throw an Error if (srcMap) is not an object.
   * @memberof wTools
   */
  var mapButFiltering = function( filter,srcMap )
{
  var result = {};
  var filter = _.filter.makeMapper( filter );
  var a,k;

  assert( objectLike( srcMap ),'mapButFiltering :','expects object as argument' );

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
  /**
   * The mapOwnBut() returns new object with unique own keys.
   *
   * Takes any number of objects.
   * Returns new object filled by unique own keys
   * from the first (srcMap) original object.
   * Values for (result) object come from original object (srcMap)
   * not from second or other one.
   * If (srcMap) does not have own properties it skips rest of code and checks another properties.
   * If the first object has same key any other object has
   * then this pair( key/value ) will not be included into result object.
   * Otherwise pair( key/value ) from the first object goes into result object.
   *
   * @param { objectLike } srcMap - original object.
   * @param { ...objectLike } argument(s) - one or more objects.
   *
   * @example
   * // returns { a : 7 }
   * mapBut( { a : 7, 'toString' : 5 }, { b : 33, c : 77 } );
   *
   * @returns { objectLike } Returns new (result) object with unique own keys.
   * @method mapOwnBut
   * @throws { Error } Will throw an Error if (srcMap) is not an object.
   * @memberof wTools
   */

var mapOwnBut = function mapOwnBut( srcMap )
{
  var result = {};
  var a,k;

  /*console.warn( 'fuzzy!' ); debugger;*/

  assert( objectLike( srcMap ),'mapOwnBut :','expects object as argument' );

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

  _assert( arguments.length >= 2,'mapScreens :','expects at least 2 arguments' );

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
  /**
   * The mapScreen() returns an object filled by unique [ key, value ]
   * from others objects.
   *
   * It takes number of objects, configure a new object by three properties.
   *
   * @property { objectLike } screenObjects.screenObject - first object.
   * @property { ...objectLike } srcObject.arguments[1,...] -
   * is pseudo array (arguments[]) from the first [1] index to the end.
   * @property { objectLike } dstObject - is an empty object.
   *
   * and calls the _mapScreen( {} ) with new object.
   *
   * @param { objectLike } screenObject - first object.
   * @param { ...objectLike } arguments[] - one or more objects.
   *
   * @example
   * // returns { a : "abc", c : 33, d : "name" };
   * _.mapScreen( { a : 13, b : 77, c : 3, d : 'name' }, { d : 'name', c : 33, a : 'abc' } );
   *
   * @returns { objectLike } returns the object filled by unique [ key, value ]
   * from others objects.
   * @method mapScreen
   * @throws { Error } Will throw an Error if (arguments.length < 2) or (arguments.length !== 2).
   * @memberof wTools
   */

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
  /**
   * The _mapScreen() returns an object filled by unique [ key, value]
   * from others objects.
   *
   * The _mapScreen() checks whether there are the keys of
   * the (screenObject) in the list of (srcObjects).
   * If true, it calls a provided callback function (filter)
   * and adds to the (dstObject) all the [ key, value ]
   * for which callback function returns true.
   *
   * @callback requestCallback - filter
   * @param { objectLike } (dstObject) - an empty object.
   * @param { objectLike }  (srcObjects) - the source object.
   * @param { string } - the key of the (screenObject).
   *
   * @param { objectLike } options - set of objects, (options.dstObject = {}),
   * (options.screenObjects), (options.srcObjects).
   *
   * @example
   * // returns { a : 33, c : 33, name : "Mikle" };
   * var options = {};
   * options.dstObject = {};
   * options.screenObjects = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
   * options.srcObjects = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
   * _mapScreen( options );
   *
   * @example
   * // returns { a : "abc", c : 33, d : "name" };
   * var options = {};
   * options.dstObject = {};
   * options.screenObjects = { a : 13, b : 77, c : 3, d : 'name' };
   * options.srcObjects = { d : 'name', c : 33, a : 'abc' };
   * _mapScreen( options );
   *
   * @returns { objectLike }
   * @method _mapScreen
   * @throws { Error } Will throw an Error if (options.dstObject or screenObject) are not objects,
   * or if (srcObjects) is not an array
   * @memberof wTools
   */

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
  _assert( _.objectLike( dstObject ),'_mapScreen :','expects object as argument' );
  _assert( _.objectLike( screenObject ),'_mapScreen :','expects object as screenObject' );
  _assert( _.arrayIs( srcObjects ),'_mapScreen :','expects array of object as screenObject' );
  _.assertMapOnly( options,_mapScreen.defaults );

  for( a = srcObjects.length-1 ; a >= 0 ; a-- )
  _assert( _.objectLike( srcObjects[ a ] ),'_mapScreen :','expects object as argument' );

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

  bypass : bypass,

  own : own,
  ownRoutines : ownRoutines,
  supplementaryOwnRoutines : supplementaryOwnRoutines,

  supplementary : supplementary,
  supplementaryCloning : supplementaryCloning,
  supplementaryOwn : supplementaryOwn,
  supplementaryCloningOwn : supplementaryCloningOwn,

  cloning : cloning,
  cloningOwn : cloningOwn,

  atomic : atomic,
  atomicOwn : atomicOwn,

  notAtomicCloning : notAtomicCloning,
  notAtomicCloningOwn : notAtomicCloningOwn,
  notAtomicCloningRecursiveOwn : notAtomicCloningRecursiveOwn,

  recursiveClonning : recursiveClonning,

  drop : drop,

  and : and,
  makeMapper : makeMapper,

}

// --
// prototype
// --

var Proto =
{

  // entity

  enityExtend : enityExtend,
  entityClone : entityClone,

  entityCopy : entityCopy,
  entityCopyField : entityCopyField,
  entityAssignField : entityAssignField,
  /*entitySetField : entitySetField,*/

  entityHasNan : entityHasNan,
  entityHasUndef : entityHasUndef,

  entitySame : entitySame,
  _entitySame : _entitySame,

  entityIdentical : entityIdentical,
  entityEquivalent : entityEquivalent,
  entityContain : entityContain,

  entityLength : entityLength,

  entityWithKeyRecursive : entityWithKeyRecursive,
  entityValueWithIndex : entityValueWithIndex,
  entityKeyWithValue : entityKeyWithValue,

  entitySelect : entitySelect,
  entitySelectSet : entitySelectSet,
  _entitySelect : _entitySelect,

  /*strFormat : strFormat,*/

  entityMap : entityMap,
  entityFilter : entityFilter,

  _entityMost : _entityMost,
  entityMin : entityMin,
  entityMax : entityMax,

  entityCoerceTo : entityCoerceTo,


  // iterator

  until : until,
  each : each,
  eachSample : eachSample,
  eachRecursive : eachRecursive,


  // diagnostics

  _err : _err,
  err : err,
  errLog : errLog,

  assert : assert,
  assertMapNoUndefine : assertMapNoUndefine,
  assertMapOnly : assertMapOnly,
  assertMapOwnOnly : assertMapOwnOnly,
  assertMapNone : assertMapNone,
  assertMapOwnNone : assertMapOwnNone,
  assertMapAll : assertMapAll,
  assertMapOwnAll : assertMapOwnAll,
  warn : warn,
  stack : stack,

  diagnosticWatchObject : diagnosticWatchObject,
  diagnosticWatchFields : diagnosticWatchFields,


  // name and symbol

  nameUnfielded : nameUnfielded,
  nameFielded : nameFielded,
  namesCoded : namesCoded,


  // type test

  arrayIs : arrayIs,
  arrayLike : arrayLike,
  hasLength : hasLength,

  objectIs : objectIs,
  objectLike : objectLike,
  mapIs : mapIs,

  strIs : strIs,
  strIsNotEmpty : strIsNotEmpty,
  symbolIs : symbolIs,

  bufferIs : bufferIs,
  bufferRawIs : bufferRawIs,
  bufferNodeIs : bufferNodeIs,

  argumentsIs : argumentsIs,

  rowIs : rowIs,

  numberIs : numberIs,
  numberIsRegular : numberIsRegular,

  dateIs : dateIs,
  boolIs : boolIs,
  routineIs : routineIs,
  routineWithNameIs : routineWithNameIs,
  regexpIs : regexpIs,
  definedIs : definedIs,

  eventIs : eventIs,
  htmlIs : htmlIs,
  jqueryIs : jqueryIs,
  domIs : domIs,
  domableIs : domableIs,

  errorIs : errorIs,

  atomicIs : atomicIs,

  typeOf : typeOf,
  typeIsBuffer : typeIsBuffer,


  // bool

  boolFrom : boolFrom,


  // number

  numberRandomInt : numberRandomInt,
  numberRandomIntNot : numberRandomIntNot,
  numberFrom : numberFrom,


  // str

  strTypeOf : strTypeOf,
  strPrimitiveTypeOf : strPrimitiveTypeOf,

  str : str,

  strBegins : strBegins,
  strEnds : strEnds,
  strBeginRemove : strBeginRemove,
  strEndRemove : strEndRemove,

  strPrependOnce : strPrependOnce,
  strAppendOnce : strAppendOnce,


  // regexp

  regexpEscape : regexpEscape,
  regexpForGlob : regexpForGlob,

  regexpMakeObject : regexpObjectMake,
  regexpMakeArray : regexpArrayMake,
  regexpMakeExpression : regexpMakeExpression,

  regexpBut_ : regexpBut_,

  regexpArrayMake : regexpArrayMake,
  regexpArrayIndex : regexpArrayIndex,
  _regexpArrayAny : _regexpArrayAny,
  _regexpArrayAll : _regexpArrayAll,

  /**/

  regexpObjectMake : regexpObjectMake,
  regexpObjectBut : regexpObjectBut,

  _regexpObjectTestReason : _regexpObjectTestReason,
  regexpObjectTest : regexpObjectTest,

  regexpObjectShrink : regexpObjectShrink,
  regexpObjectBroaden : regexpObjectBroaden,
  _regexpObjectExtend : _regexpObjectExtend,

  regexpObjectOrering : regexpObjectOrering,
  _regexpObjectOrderingExclusion : _regexpObjectOrderingExclusion,


  // routine

  _routineBind : _routineBind,
  routineBind : routineBind, /* depreacation */
  routineJoin : routineJoin,
  _routineJoin : routineJoin, /* temp */
  routineSeal : routineSeal,
  routineDelayed : routineDelayed,

  routinesCall : routinesCall,

  bind : null,


  // time

  timeReady : timeReady,
  timeOnce : timeOnce,
  timeOut : timeOut,

  timePeriodic : timePeriodic,
/*
  timePeriodicStart : timePeriodic,
  timePeriodicStop : timePeriodicStop,
*/

  _timeNow_gen : _timeNow_gen,
  timeSpent : timeSpent,
  dateToStr : dateToStr,


  // array

  arraySub : arraySub,
  arrayNew : arrayNew,
  arrayNewOfSameLength : arrayNewOfSameLength,
  arrayOrNumber : arrayOrNumber,

  arraySelect : arraySelect,
  arrayIndicesOfGreatest : arrayIndicesOfGreatest, /*?*/

  arrayIron : arrayIron,
  arrayIronToMapUnique : arrayIronToMapUnique,

  arrayCopy : arrayCopy,
  arrayAppendMerging : arrayAppendMerging,
  arrayPrependMerging : arrayPrependMerging,

  arrayAppendOnceMerging : arrayAppendOnceMerging,
  arrayPrependOnceMerging : arrayPrependOnceMerging,

  arrayAppendOnce : arrayAppendOnce,
  arrayPrependOnce : arrayPrependOnce,

  arrayElementsSwap : arrayElementsSwap,

  arrayRemoveArrayOnce : arrayRemoveArrayOnce,

  arrayRemovedOnce : arrayRemovedOnce,
  arrayRemoveOnce : arrayRemoveOnce,

  arrayRemovedAll : arrayRemovedAll,
  arrayRemoveAll : arrayRemoveAll,

  arrayReplaceOnce : arrayReplaceOnce,
  arrayUpdate : arrayUpdate,

  arrayFrom : arrayFrom,
  arrayToMap : arrayToMap,

  arraySpliceArray : arraySpliceArray,

  arraySlice : arraySlice,
  arraySplice : arraySplice,
  arrayAs : arrayAs,

  arrayToStr : arrayToStr,

  arrayPut : arrayPut,

  arrayMask : arrayMask,
  arrayDuplicate : arrayDuplicate,
  arrayFill : arrayFill,

  arrayCompare : arrayCompare,
  arraySame : arraySame,
  arraySameSet : arraySameSet,

  arrayLeftIndexOf : arrayLeftIndexOf,
  arrayRightIndexOf : arrayRightIndexOf,

  arrayLeftGet : arrayLeftGet,

  arrayHasAny : arrayHasAny,
  arrayCount : arrayCount,
  arraySum : arraySum,

  arraySupplement : arraySupplement,
  arrayExtendScreening : arrayExtendScreening,

  arrayRandom : arrayRandom,
  arrayRange : arrayRange,


  // array set

  arraySetIntersection : arraySetIntersection,
  arraySetContainAll : arraySetContainAll,
  arraySetContainSomething : arraySetContainSomething,


  // array sorted

  _arraySortedLookUpAct : _arraySortedLookUpAct,
  arraySortedLookUp : arraySortedLookUp,
  arraySortedClosest : arraySortedClosest,
  arraySortedRemove : arraySortedRemove,
  arraySortedAdd : arraySortedAdd,
  arraySortedAddOnce : arraySortedAddOnce,
  arraySortedAddArray : arraySortedAddArray,


  // buffer

  bufferRelen : bufferRelen,
  bufferResize : bufferResize,
  bufferBytesGet : bufferBytesGet,
  bufferRetype : bufferRetype,

  bufferMove : bufferMove,
  bufferToStr : bufferToStr,
  bufferToDom : bufferToDom,

  bufferLeftBuffer : bufferLeftBuffer,

  bufferFromArrayOfArray : bufferFromArrayOfArray,
  bufferFromObject : bufferFromObject,
  bufferRawFromBuffer : bufferRawFromBuffer,
  bufferRawFrom : bufferRawFrom,

  buffersSerialize : buffersSerialize,
  buffersDeserialize : buffersDeserialize,


  // map

  mapClone : mapClone,

  mapExtendFiltering : mapExtendFiltering,
  mapExtend : mapExtend,
  mapSupplement : mapSupplement,
  mapComplement : mapComplement,
  mapCopy : mapCopy,


  // map converter

  mapFirstPair : mapFirstPair,

  mapToArray : mapToArray,
  mapValWithIndex : mapValWithIndex,
  mapKeyWithIndex : mapKeyWithIndex,
  mapToString : mapToString,

  mapKeys : mapKeys,
  mapValues : mapValues,
  mapPairs : mapPairs,

  /* mapsPluck : mapsPluck, */
  mapGroup : mapGroup,


  // map logic

  mapOwn : mapOwn,
  mapHas : mapHas,

  mapSame : mapSame,
  mapContain : mapContain,

  mapBut : mapBut,
  mapButFiltering : mapButFiltering,
  mapOwnBut : mapOwnBut,

  mapScreens : mapScreens,
  mapScreen : mapScreen,
  _mapScreen : _mapScreen,


  // map filter

  filter : filter,

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
