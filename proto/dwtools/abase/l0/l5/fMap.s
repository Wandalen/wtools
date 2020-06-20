( function _fMap_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// let Object.hasOwnProperty = Object.hasOwnProperty;

// --
// map checker
// --

/**
 * The mapsAreIdentical() returns true, if the second object (src2)
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
 * _.mapsAreIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
 * // returns true
 *
 * @example
 * _.mapsAreIdentical( { a : 7, b : 13 }, { a : 33, b : 13 } );
 * // returns false
 *
 * @example
 * _.mapsAreIdentical( { a : 7, b : 13, c : 33 }, { a : 7, b : 13 } );
 * // returns false
 *
 * @returns { boolean } Returns true, if the second object (src2)
 * has the same values as the first object(src1).
 * @function mapsAreIdentical
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @namespace Tools
 */

function mapsAreIdentical( src1, src2 )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src1 ) );
  _.assert( _.objectLike( src2 ) );

  if( Object.keys( src1 ).length !== Object.keys( src2 ).length )
  return false;

  for( let s in src1 )
  {
    if( src1[ s ] !== src2[ s ] )
    return false;
  }

  return true;
}

//

/**
 * The mapContain() returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 *
 * It takes two objects (scr, ins),
 * checks if the first object {-srcMap-} has the same [key, value] as
 * the second object (ins).
 * If true, it returns true,
 * otherwise it returns false.
 *
 * @param { objectLike } src - Target object.
 * @param { objectLike } ins - Second object.
 * Objects to compare values.
 *
 * @example
 * _.mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
 * // returns true
 *
 * @example
 * _.mapContain( { a : 7, b : 13 }, { a : 7, b : 13, c : 15 } );
 * // returns false
 *
 * @returns { boolean } Returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 * @function mapContain
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @namespace Tools
 */

function mapContain( src, ins )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

/*
  if( Object.keys( src ).length < Object.keys( ins ).length )
  return false;
*/

  for( let s in ins )
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
 * Checks if object( o.src ) has at least one key/value pair that is represented in( o.template ).
 * Also works with ( o.template ) as routine that check( o.src ) with own rules.
 * @param {wTools.objectSatisfyOptions} o - Default options {@link wTools.objectSatisfyOptions}.
 * @returns { boolean } Returns true if( o.src ) has same key/value pair(s) with( o.template )
 * or result if ( o.template ) routine call is true.
 *
 * @example
 * _.objectSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 * // returns true
 *
 * @example
 * _.objectSatisfy( { template : {a : 1, b : 1, c : 1 }, src : { a : 1, b : 2 } } );
 * // returns true
 *
 * @example
 * function routine( src ){ return src.a === 12 }
 * _.objectSatisfy( { template : routine, src : { a : 1, b : 2 } } );
 * // returns false
 *
 * @function objectSatisfy
 * @throws {exception} If( arguments.length ) is not equal to 1 or 2.
 * @throws {exception} If( o.template ) is not a Object.
 * @throws {exception} If( o.template ) is not a Routine.
 * @throws {exception} If( o.src ) is undefined.
 * @namespace Tools
*/

function objectSatisfy( o )
{

  if( arguments.length === 2 )
  o = { template : arguments[ 0 ], src : arguments[ 1 ] };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectIs( o.template ) || _.routineIs( o.template ) );
  _.assert( o.src !== undefined );
  _.routineOptions( objectSatisfy, o );

  return _objectSatisfy( o.template, o.src, o.src, o.levels, o.strict );

  /**/

  function _objectSatisfy( template, src, root, levels, strict )
  {

    if( !strict && src === undefined )
    return true;

    if( template === src )
    return true;

    if( levels === 0 )
    {
      if( _.objectIs( template ) && _.objectIs( src ) && _.routineIs( template.identicalWith ) && src.identicalWith === template.identicalWith )
      return template.identicalWith( src );
      else
      return template === src;
    }
    else if( levels < 0 )
    {
      return false;
    }

    if( _.routineIs( template ) )
    return template( src );

    if( !_.objectIs( src ) )
    return false;

    if( _.objectIs( template ) )
    {
      for( let t in template )
      {
        let satisfy = false;
        satisfy = _objectSatisfy( template[ t ], src[ t ], root, levels-1, strict );
        if( !satisfy )
        return false;
      }
      return true;
    }

    debugger;

    return false;
  }

}

objectSatisfy.defaults =
{
  template : null,
  src : null,
  levels : 1,
  strict : 1,
}

//

function mapHasKey( srcMap, key )
{

  if( !srcMap )
  return false;

  if( typeof srcMap !== 'object' )
  return false;

  if( !Reflect.has( srcMap, key ) )
  return false;

  return true;
}

// //
//
// function mapHasKey( object, key )
// {
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//
//   if( _.strIs( key ) )
//   return ( key in object );
//   else if( _.mapIs( key ) )
//   return ( _.nameUnfielded( key ).coded in object );
//   else if( _.symbolIs( key ) )
//   return ( key in object );
//
//   _.assert( 0, 'mapHasKey :', 'unknown type of key :', _.strType( key ) );
// }

//

/**
 * The mapOwnKey() returns true if (object) has own property.
 *
 * It takes (name) checks if (name) is a String,
 * if (object) has own property with the (name).
 * If true, it returns true.
 *
 * @param { Object } object - Object that will be check.
 * @param { name } name - Target property.
 *
 * @example
 * _.mapOwnKey( { a : 7, b : 13 }, 'a' );
 * // returns true
 *
 * @example
 * _.mapOwnKey( { a : 7, b : 13 }, 'c' );
 * // returns false
 *
 * @returns { boolean } Returns true if (object) has own property.
 * @function mapOwnKey
 * @throws { mapOwnKey } Will throw an error if the (name) is unknown.
 * @namespace Tools
 */

//

function mapOwnKey( object, key )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.strIs( key ) )
  return Object.hasOwnProperty.call( object, key );
  else if( _.mapIs( key ) )
  return Object.hasOwnProperty.call( object, _.nameUnfielded( key ).coded );
  else if( _.symbolIs( key ) )
  return Object.hasOwnProperty.call( object, key );

  _.assert( 0, 'mapOwnKey :', 'unknown type of key :', _.strType( key ) );
}

//

function mapHasVal( object, val )
{
  let vals = _.mapVals( object );
  return vals.indexOf( val ) !== -1;
}

//

function mapOwnVal( object, val )
{
  let vals = _.mapOwnVals( object );
  return vals.indexOf( val ) !== -1;
}

//

/**
 * The mapHasAll() returns true if object( src ) has all enumerable keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has property with same name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * _.mapHasAll( {}, {} );
 * // returns true
 *
 * @example
 * _.mapHasAll( {}, { a : 1 } );
 * // returns false
 *
 * @returns { boolean } Returns true if object( src ) has all enumerable keys from( screen ).
 * @function mapHasAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @namespace Tools
 */

function mapHasAll( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src ) );
  _.assert( _.objectLike( screen ) );

  for( let k in screen )
  {
    if( !( k in src ) )
    return false;
  }

  return true;
}

//

/**
 * The mapHasAny() returns true if object( src ) has at least one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has at least one property with same name.
 * Returns true if any key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * _.mapHasAny( {}, {} );
 * // returns false
 *
 * @example
 * _.mapHasAny( { a : 1, b : 2 }, { a : 1 } );
 * // returns true
 *
 * @example
 * _.mapHasAny( { a : 1, b : 2 }, { c : 1 } );
 * // returns false
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasAny
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @namespace Tools
 */

function mapHasAny( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src ) );
  _.assert( _.objectLike( screen ) );

  for( let k in screen )
  {
    if( k in src )
    debugger;
    if( k in src )
    return true;
  }

  debugger;
  return false;
}

//

/**
 * The mapHasAny() returns true if object( src ) has no one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has no one property with same name.
 * Returns true if all keys from( screen ) not exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * _.mapHasNone( {}, {} );
 * // returns true
 *
 * @example
 * _.mapHasNone( { a : 1, b : 2 }, { a : 1 } );
 * // returns false
 *
 * @example
 * _.mapHasNone( { a : 1, b : 2 }, { c : 1 } );
 * // returns true
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasNone
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @namespace Tools
 */

function mapHasNone( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.objectLike( src ) );
  _.assert( _.objectLike( screen ) );

  for( let k in screen )
  {
    if( k in src )
    return false;
  }

  return true;
}

//

/**
 * The mapOwnAll() returns true if object( src ) has all own keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * _.mapOwnAll( {}, {} );
 * // returns true
 *
 * @example
 * _.mapOwnAll( { a : 1, b : 2 }, { a : 1 } );
 * // returns true
 *
 * @example
 * _.mapOwnAll( { a : 1, b : 2 }, { c : 1 } );
 * // returns false
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @namespace Tools
 */

function mapOwnAll( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.mapIs( src ) );
  _.assert( _.mapIs( screen ) );

  for( let k in screen )
  {
    if( !Object.hasOwnProperty.call( src, k ) )
    debugger;
    if( !Object.hasOwnProperty.call( src, k ) )
    return false;
  }

  debugger;
  return true;
}

//

/**
 * The mapOwnAny() returns true if map( src ) has at least one own property from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from map( screen ) and checks if source( src ) has at least one property with that key name.
 * Returns true if one of keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * _.mapOwnAny( {}, {} );
 * // returns false
 *
 * @example
 * _.mapOwnAny( { a : 1, b : 2 }, { a : 1 } );
 * // returns true
 *
 * @example
 * _.mapOwnAny( { a : 1, b : 2 }, { c : 1 } );
 * // returns false
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAny
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @namespace Tools
 */

function mapOwnAny( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.mapIs( src ) );
  _.assert( _.mapIs( screen ) );

  for( let k in screen )
  {
    if( Object.hasOwnProperty.call( src, k ) )
    debugger;
    if( Object.hasOwnProperty.call( src, k ) )
    return true;
  }

  debugger;
  return false;
}

//

/**
 * The mapOwnNone() returns true if map( src ) not owns properties from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if no one key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * _.mapOwnNone( {}, {} );
 * // returns true
 *
 * @example
 * _.mapOwnNone( { a : 1, b : 2 }, { a : 1 } );
 * // returns false
 *
 * @example
 * _.mapOwnNone( { a : 1, b : 2 }, { c : 1 } );
 * // returns true
 *
 * @returns { boolean } Returns true if map( src ) not owns properties from( screen ).
 * @function mapOwnNone
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @namespace Tools
 */

function mapOwnNone( src, screen )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.mapIs( src ) );
  _.assert( _.mapIs( screen ) );

  for( let k in screen )
  {
    if( Object.hasOwnProperty.call( src, k ) )
    debugger;
    if( Object.hasOwnProperty.call( src, k ) )
    return false;
  }

  debugger;
  return true;
}

//

function mapHasExactly( srcMap, screenMaps )
{
  let result = true;

  _.assert( arguments.length === 2 );

  result = result && _.mapHasOnly( srcMap, screenMaps );
  result = result && _.mapHasAll( srcMap, screenMaps );

  return true;
}

//

function mapOwnExactly( srcMap, screenMaps )
{
  let result = true;

  _.assert( arguments.length === 2 );

  result = result && _.mapOwnOnly( srcMap, screenMaps );
  result = result && _.mapOwnAll( srcMap, screenMaps );

  return true;
}

//

function mapHasOnly( srcMap, screenMaps )
{

  _.assert( arguments.length === 2 );

  let l = arguments.length;
  let but = Object.keys( _.mapBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  return false;

  return true;
}

//

function mapOwnOnly( srcMap, screenMaps )
{

  _.assert( arguments.length === 2 );

  let l = arguments.length;
  let but = Object.keys( _.mapOwnBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  return false;

  return true;
}

// //
//
// function mapHasAll( srcMap, all )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = Object.keys( _.mapBut( all, srcMap ) );
//
//   if( but.length > 0 )
//   return false;
//
//   return true;
// }
//
//
//
// function mapOwnAll( srcMap, all )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = Object.keys( _.mapOwnBut( all, srcMap ) );
//
//   if( but.length > 0 )
//   return false;
//
//   return true;
// }
//
// //
//
// function mapHasNone( srcMap, screenMaps )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = _.mapOnly( srcMap, screenMaps );
//   let keys = Object.keys( but );
//   if( keys.length )
//   return false;
//
//   return true;
// }
//
// //
//
// function mapOwnNone( srcMap, screenMaps )
// {
//
//   _.assert( arguments.length === 2 );
//
//   let but = Object.keys( _.mapOnlyOwn( srcMap, screenMaps ) );
//
//   if( but.length )
//   return false;
//
//   return true;
// }

//

function mapHasNoUndefine( srcMap )
{

  _.assert( arguments.length === 1 );

  let but = [];
  let l = arguments.length;

  for( let s in srcMap )
  if( srcMap[ s ] === undefined )
  return false;

  return true;
}

// --
// map move
// --

/**
 * The mapMake() routine is used to copy the values of all properties
 * from one or more source objects to the new object.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * _.mapMake( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 *
 * @returns { objectLike } It will return the new object filled by [ key, value ]
 * from one or more source objects.
 * @function mapMake
 * @namespace Tools
 */

function mapMake( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( arguments.length <= 1 )
  if( arguments[ 0 ] === undefined || arguments[ 0 ] === null )
  return Object.create( null );
  return _.mapExtend( null, src );
  // let args = _.longSlice( arguments );
  // args.unshift( Object.create( null ) );
  // _.assert( !_.primitiveIs( arguments[ 0 ] ) || arguments[ 0 ] === null );
  // return _.mapExtend.apply( _, args );
}

//

function mapShallowClone( src )
{
  return _.mapMake( src );
}

//

/**
 * @callback mapCloneAssigning.onField
 * @param { objectLike } dstContainer - destination object.
 * @param { objectLike } srcContainer - source object.
 * @param { string } key - key to coping from one object to another.
 * @param { function } onField - handler of fields.
 */

/**
 * The mapCloneAssigning() routine is used to clone the values of all
 * enumerable own properties from {-srcMap-} object to an (options.dst) object.
 *
 * It creates two variables:
 * let options = options || {}, result = options.dst || {}.
 * Iterate over {-srcMap-} object, checks if {-srcMap-} object has own properties.
 * If true, it calls the provided callback function( options.onField( result, srcMap, k ) ) for each key (k),
 * and copies each [ key, value ] of the {-srcMap-} to the (result),
 * and after cycle, returns clone with prototype of srcMap.
 *
 * @param { objectLike } srcMap - The source object.
 * @param { Object } o - The options.
 * @param { objectLike } [options.dst = Object.create( null )] - The target object.
 * @param { mapCloneAssigning.onField } [options.onField()] - The callback function to copy each [ key, value ]
 * of the {-srcMap-} to the (result).
 *
 * @example
 * function Example() {
 *   this.name = 'Peter';
 *   this.age = 27;
 * }
 * _.mapCloneAssigning( new Example(), { dst : { sex : 'Male' } } );
 * // returns Example { sex : 'Male', name : 'Peter', age : 27 }
 *
 * @returns { objectLike }  The (result) object gets returned.
 * @function mapCloneAssigning
 * @throws { Error } Will throw an Error if ( o ) is not an Object,
 * if ( arguments.length > 2 ), if (key) is not a String or
 * if {-srcMap-} has not own properties.
 * @namespace Tools
 */

function mapCloneAssigning( o )
{
  o.dstMap = o.dstMap || Object.create( null );

  _.assert( _.mapIs( o ) );
  _.assert( arguments.length === 1, 'mapCloneAssigning :', 'Expects {-srcMap-} as argument' );
  _.assert( _.objectLike( o.srcMap ), 'mapCloneAssigning :', 'Expects {-srcMap-} as argument' );
  _.routineOptions( mapCloneAssigning, o );

  if( !o.onField )
  o.onField = function onField( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  }

  for( let k in o.srcMap )
  {
    if( Object.hasOwnProperty.call( o.srcMap, k ) )
    o.onField( o.dstMap, o.srcMap, k, o.onField );
  }

  Object.setPrototypeOf( o.dstMap, Object.getPrototypeOf( o.srcMap ) );

  return o.dstMap;
}

mapCloneAssigning.defaults =
{
  srcMap : null,
  dstMap : null,
  onField : null,
}

//

function mapsExtend( dstMap, srcMaps )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  if( srcMaps.length === 1 && Object.getPrototypeOf( srcMaps[ 0 ] ) === null )
  return Object.assign( dstMap, srcMaps[ 0 ] );

  if( !_.arrayLike( srcMaps ) )
  srcMaps = [ srcMaps ];

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayLike( srcMaps ) );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as the first argument' );

  for( let a = 0 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];

    _.assert( !_.primitiveIs( srcMap ), 'Expects non primitive' );

    if( Object.getPrototypeOf( srcMap ) === null )
    Object.assign( dstMap, srcMap );
    else for( let k in srcMap )
    {
      dstMap[ k ] = srcMap[ k ];
    }

  }

  return dstMap;
}

//

/**
 * The mapExtendConditional() creates a new [ key, value ]
 * from the next objects if callback function(filter) returns true.
 *
 * It calls a provided callback function(filter) once for each key in an (argument),
 * and adds to the {-srcMap-} all the [ key, value ] for which callback
 * function(filter) returns true.
 *
 * @param { function } filter - The callback function to test each [ key, value ]
 * of the (dstMap) object.
 * @param { objectLike } dstMap - The target object.
 * @param { ...objectLike } arguments[] - The next object.
 *
 * @example
 * _.mapExtendConditional( _.field.mapper.dstNotHas, { a : 1, b : 2 }, { a : 1 , c : 3 } );
 * // returns { a : 1, b : 2, c : 3 }
 *
 * @returns { objectLike } Returns the unique [ key, value ].
 * @function mapExtendConditional
 * @throws { Error } Will throw an Error if ( arguments.length < 3 ), (filter)
 * is not a Function, (result) and (argument) are not the objects.
 * @namespace Tools
 */

function mapExtendConditional( filter, dstMap )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( !!filter );
  _.assert( filter.functionFamily === 'field-mapper' );
  _.assert( arguments.length >= 3, 'Expects more arguments' );
  _.assert( _.routineIs( filter ), 'Expects filter' );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as argument' );

  for( let a = 2 ; a < arguments.length ; a++ )
  {
    let srcMap = arguments[ a ];

    _.assert( !_.primitiveIs( srcMap ), () => 'Expects object-like entity to extend, but got : ' + _.strType( srcMap ) );

    for( let k in srcMap )
    {

      filter.call( this, dstMap, srcMap, k );

    }

  }

  return dstMap;
}

//

function mapsExtendConditional( filter, dstMap, srcMaps )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( !!filter );
  _.assert( filter.functionFamily === 'field-mapper' );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.routineIs( filter ), 'Expects filter' );
  _.assert( !_.primitiveIs( dstMap ), 'Expects non primitive as argument' );

  for( let a = 0 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];

    _.assert( !_.primitiveIs( srcMap ), () => 'Expects object-like entity to extend, but got : ' + _.strType( srcMap ) );

    for( let k in srcMap )
    {

      filter.call( this, dstMap, srcMap, k );

    }

  }

  return dstMap;
}

//

function mapExtendHiding( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.hiding );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendHiding( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.hiding, dstMap, srcMaps );
}

//

function mapExtendAppending( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.appendingAnything );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendAppending( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.appendingAnything, dstMap, srcMaps );
}

//

function mapExtendPrepending( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.prependingAnything );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendPrepending( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.prependingAnything, dstMap, srcMaps );
}

//

function mapExtendAppendingOnlyArrays( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.appendingOnlyArrays );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendAppendingOnlyArrays( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.appendingOnlyArrays, dstMap, srcMaps );
}

//

function mapExtendByDefined( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.srcDefined );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendByDefined( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.srcDefined, dstMap, srcMaps );
}

//

function mapExtendNulls( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.srcNull );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsExtendNulls( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.srcNull, dstMap, srcMaps );
}

//

function mapSupplementByMaps( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.dstNotHas, dstMap, srcMaps );
}

//

function mapSupplementNulls( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotHasOrHasNull );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementNils( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotHasOrHasNil );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementAssigning( dstMap )
{
  let args = _.longSlice( arguments );
  // args.unshift( _.field.mapper.dstNotOwnAssigning );
  args.unshift( _.field.mapper.dstNotHasAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementAppending( dstMap )
{
  if( dstMap === null && arguments.length === 2 )
  return Object.assign( Object.create( null ), srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotHasAppending );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsSupplementAppending( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotHasAppending, dstMap, srcMaps );
}

//

// function mapStretch( dstMap )
function mapSupplementOwn( dstMap, srcMap )
{
  if( dstMap === null && arguments.length === 2 )
  return _.mapExtend( dstMap, srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwn );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsSupplementOwn( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  if( dstMap === null )
  return _.mapExtend( null, srcMaps[ 0 ] );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwn, dstMap, srcMaps );
}

//

function mapSupplementOwnAssigning( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementOwnFromDefinition( dstMap, srcMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnFromDefinition );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapSupplementOwnFromDefinitionStrictlyPrimitives( dstMap, srcMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnFromDefinitionStrictlyPrimitive );
  return _.mapExtendConditional.apply( this, args );
}

//

/**
 * The routine mapComplement() complements {-dstMap-} by one or several {-srcMap-}. Routine does not change
 * defined pairs key-value in {-dstMap-}.
 * If {-dstMap-} and {-srcMap-} has equal keys, and value of {-dstMap-} is undefined, then routine
 * mapComplement() changes it to {-srcMap-} value.
 * If pair key-value does not exists in {-dstMap-}, then routine appends this pair to {-dstMap-}.
 *
 * @param { objectLike } dstMap - ObjectLike entity to be complemented.
 * @param { ...objectLike } srcMap - The source object(s).
 *
 * @example
 * _.mapComplement( { a : 1, b : 2, c : 3 }, { a : 4, b : 5, c : 6, d : 7 } );
 * // returns { a : 1, b : 3, c : 3, d : 7 };
 *
 * @example
 * _.mapComplement( { a : 1, b : 2, c : 3 }, { a : 4, b : 5 }, { c : 6, d : 7 } );
 * // returns { a : 1, b : 3, c : 3, d : 7 };
 *
 * @example
 * _.mapComplement( { a : 1, b : 2, c : undefined }, { a : 4, b : 5, c : 6, d : 7 } );
 * // returns { a : 1, b : 3, c : 6, d : 7 };
 *
 * @example
 * _.mapComplement( { a : 1, b : 2, c : undefined }, { a : 4, b : 5 }, { c : 6, d : 7 } );
 * // returns { a : 1, b : 3, c : 6, d : 7 };
 *
 * @returns { objectLike } - Returns the destination object filled by unique values from source object(s), and if it is possible, replaced undefined
 * values in destination object.
 * @function mapComplement
 * @namespace Tools
 */

function mapComplement( dstMap, srcMap )
{

  function dstNotOwnOrUndefinedAssigning( dstContainer, srcContainer, key )
  {
    if( Object.hasOwnProperty.call( dstContainer, key ) )
    {
      if( dstContainer[ key ] !== undefined )
      return;
    }
    _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
  }

  dstNotOwnOrUndefinedAssigning.functionFamily = 'field-mapper';

  if( arguments.length === 2 )
  return _.mapExtendConditional( dstNotOwnOrUndefinedAssigning, dstMap, srcMap );

  let args = _.longSlice( arguments );
  args.unshift( dstNotOwnOrUndefinedAssigning );
  return _.mapExtendConditional.apply( this, args );

  /* zzz
    filter should be defined explicitly instead of using _.field.mapper.dstNotOwnOrUndefinedAssigning
    to have mapComplement available as soon as possible
  */

}

//

function mapsComplement( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwnOrUndefinedAssigning, dstMap, srcMaps );
}

//

function mapComplementReplacingUndefines( dstMap, srcMap )
{
  _.assert( !!_.field.mapper );
  if( arguments.length === 2 )
  return _.mapExtendConditional( _.field.mapper.dstNotOwnOrUndefinedAssigning, dstMap, srcMap );
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnOrUndefinedAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsComplementReplacingUndefines( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwnOrUndefinedAssigning, dstMap, srcMaps );
}

//

function mapComplementPreservingUndefines( dstMap )
{
  let args = _.longSlice( arguments );
  args.unshift( _.field.mapper.dstNotOwnAssigning );
  return _.mapExtendConditional.apply( this, args );
}

//

function mapsComplementPreservingUndefines( dstMap, srcMaps )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  return _.mapsExtendConditional( _.field.mapper.dstNotOwnAssigning, dstMap, srcMaps );
}

//

function mapDelete( dstMap, ins )
{

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( dstMap ) );

  if( ins !== undefined )
  {
    _.assert( _.objectLike( ins ) );
    for( let i in ins )
    {
      delete dstMap[ i ];
    }
  }
  else
  {
    for( let i in dstMap )
    {
      delete dstMap[ i ];
    }
  }

  return dstMap;
}

//

function mapEmpty( dstMap )
{

  _.assert( arguments.length === 1 );
  _.assert( _.objectLike( dstMap ) );

  for( let i in dstMap )
  {
    delete dstMap[ i ];
  }

  return dstMap;
}

// --
// map recursive
// --

function mapExtendRecursiveConditional( filters, dstMap, srcMap )
{
  _.assert( arguments.length >= 3, 'Expects at least three arguments' );
  _.assert( this === Self );
  let srcMaps = _.longSlice( arguments, 2 );
  return _.mapsExtendRecursiveConditional( filters, dstMap, srcMaps );
}

//

function _filterTrue(){ return true };
_filterTrue.functionFamily = 'field-filter';
function _filterFalse(){ return true };
_filterFalse.functionFamily = 'field-filter';

function mapsExtendRecursiveConditional( filters, dstMap, srcMaps )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( this === Self );

  if( _.routineIs( filters ) )
  filters = { onUpFilter : filters, onField : filters }

  if( filters.onUpFilter === undefined )
  filters.onUpFilter = filters.onField;
  else if( filters.onUpFilter === true )
  filters.onUpFilter = _filterTrue;
  else if( filters.onUpFilter === false )
  filters.onUpFilter = _filterFalse;

  if( filters.onField === true )
  filters.onField = _filterTrue;
  else if( filters.onField === false )
  filters.onField = _filterFalse;

  _.assert( _.routineIs( filters.onUpFilter ) );
  _.assert( _.routineIs( filters.onField ) );
  _.assert( filters.onUpFilter.functionFamily === 'field-filter' );
  _.assert( filters.onField.functionFamily === 'field-filter' || filters.onField.functionFamily === 'field-mapper' );

  for( let a = 0 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];
    _mapExtendRecursiveConditional( filters, dstMap, srcMap );
  }

  return dstMap;
}

//

function _mapExtendRecursiveConditional( filters, dstMap, srcMap )
{

  _.assert( _.mapIs( srcMap ) );

  for( let s in srcMap )
  {

    if( _.mapIs( srcMap[ s ] ) )
    {

      if( filters.onUpFilter( dstMap, srcMap, s ) === true )
      {
        if( !_.objectIs( dstMap[ s ] ) )
        dstMap[ s ] = Object.create( null );
        _._mapExtendRecursiveConditional( filters, dstMap[ s ], srcMap[ s ] );
      }

    }
    else
    {

      if( filters.onField( dstMap, srcMap, s ) === true )
      dstMap[ s ] = srcMap[ s ];

    }

  }

  return dstMap;
}

//

function mapExtendRecursive( dstMap, srcMap )
{

  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  _.assert( this === Self );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    srcMap = arguments[ a ];
    _._mapExtendRecursive( dstMap, srcMap );
  }

  return dstMap;
}

//

function mapsExtendRecursive( dstMap, srcMaps )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( this === Self );

  for( let a = 1 ; a < srcMaps.length ; a++ )
  {
    let srcMap = srcMaps[ a ];
    _._mapExtendRecursive( dstMap, srcMap );
  }

  return dstMap;
}

//

function _mapExtendRecursive( dstMap, srcMap )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( _.mapIs( srcMap ) );

  for( let s in srcMap )
  {

    if( _.mapIs( srcMap[ s ] ) )
    {

      if( !_.mapIs( dstMap[ s ] ) )
      dstMap[ s ] = Object.create( null );
      _._mapExtendRecursive( dstMap[ s ], srcMap[ s ] );

    }
    else
    {

      dstMap[ s ] = srcMap[ s ];

    }

  }

}

//

function mapExtendAppendingAnythingRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.appendingAnything, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsExtendAppendingAnythingRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.appendingAnything, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapExtendAppendingArraysRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.appendingOnlyArrays, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsExtendAppendingArraysRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.appendingOnlyArrays, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapExtendAppendingOnceRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.appendingOnce, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsExtendAppendingOnceRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.appendingOnce, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapSupplementRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.dstNotHas, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapSupplementByMapsRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.dstNotHas, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapSupplementOwnRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.dstNotOwn, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapsSupplementOwnRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.dstNotOwn, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

//

function mapSupplementRemovingRecursive( dstMap, srcMap )
{
  _.assert( this === Self );
  _.assert( arguments.length >= 2, 'Expects at least two arguments' );
  let filters = { onField : _.field.mapper.removing, onUpFilter : true };
  let args = _.longSlice( arguments );
  args.unshift( filters );
  return _.mapExtendRecursiveConditional.apply( _, args );
}

//

function mapSupplementByMapsRemovingRecursive( dstMap, srcMaps )
{
  _.assert( this === Self );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let filters = { onField : _.field.mapper.removing, onUpFilter : true };
  return _.mapsExtendRecursiveConditional.call( _, filters, dstMap, srcMaps );
}

// --
// hash map
// --

function hashMapExtend( dst, src )
{
  _.assert( arguments.length === 2 );
  _.assert( dst === null || _.hashMapLike( dst ) || _.mapLike( dst ) );
  _.assert( _.hashMapLike( src ) || _.mapLike( src ) );

  if( dst === null )
  dst = new HashMap;

  if( dst === src  )
  return dst;

  if( _.hashMapLike( dst ) )
  {
    if( _.hashMapLike( src ) )
    {
      for( let [ k, e ] of src )
      dst.set( k, e );
    }
    else
    {
      for( let k in src )
      {
        dst.set( k, src[ k ] );
      }
    }
  }
  else
  {
    if( _.hashMapLike( src ) )
    {
      for( let [ k, e ] of src )
      {
        _.assert( _.strIs( k ) );
        dst[ k ] = e;
      }
    }
    else
    {
      for( let k in src )
      {
        dst[ k ] = src[ k ];
      }
    }
  }

  return dst;
}

// --
// map selector
// --

/**
 * The mapOnlyPrimitives() gets all object`s {-srcMap-} enumerable atomic fields( null, undef, number, string, symbol ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} enumerable atomic properties to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of atomic properties.
 *
 * @example
 * let a = {};
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 3 } )
 * _.mapOnlyPrimitives( a );
 * // returns {}
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOnlyPrimitives( a );
 * // returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with all atomic fields from source {-srcMap-}.
 * @function mapOnlyPrimitives
 * @throws { Error } Will throw an Error if {-srcMap-} is not an Object.
 * @namespace Tools
 */

function mapOnlyPrimitives( srcMap )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !_.primitiveIs( srcMap ) );

  let result = _.mapExtendConditional( _.field.mapper.primitive, Object.create( null ), srcMap );
  return result;
}

// --
// map manipulator
// --

function objectSetWithKeys( dstMap, key, val )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( _.objectIs( dstMap ) );
  _.assert( _.arrayIs( key ) || _.strIs( key ) );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  if( _.arrayIs( key ) )
  {
    for( let s = 0 ; s < key.length ; s++ )
    set( dstMap, key[ s ], val );
  }
  else
  {
    set( dstMap, key, val );
  }

  return dstMap;

  function set( dstMap, key, val )
  {

    if( val === undefined )
    delete dstMap[ key ];
    else
    dstMap[ key ] = val;

  }

}

//

function objectSetWithKeyStrictly( dstMap, key, val )
{

  if( dstMap === null )
  dstMap = Object.create( null );

  _.assert( _.objectIs( dstMap ) );
  _.assert( _.arrayIs( key ) || _.strIs( key ) );
  _.assert( arguments.length === 3, 'Expects exactly three arguments' );

  if( _.arrayIs( key ) )
  {
    for( let s = 0 ; s < key.length ; s++ )
    set( dstMap, key[ s ], val );
  }
  else
  {
    set( dstMap, key, val );
  }

  return dstMap;

  function set( dstMap, key, val )
  {

    if( val === undefined )
    {
      delete dstMap[ key ];
    }
    else
    {
      _.assert( dstMap[ key ] === undefined || dstMap[ key ] === val );
      dstMap[ key ] = val;
    }

  }

}

// --
// map getter
// --

function mapInvert( src, dst )
{
  let o = this === Self ? Object.create( null ) : this;

  if( src )
  o.src = src;

  if( dst )
  o.dst = dst;

  _.routineOptions( mapInvert, o );

  o.dst = o.dst || Object.create( null );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( o.src ) );

  let del
  if( o.duplicate === 'delete' )
  del = Object.create( null );

  /* */

  for( let k in o.src )
  {
    let e = o.src[ k ];
    if( o.duplicate === 'delete' )
    if( o.dst[ e ] !== undefined )
    {
      del[ e ] = k;
      continue;
    }
    if( o.duplicate === 'array' || o.duplicate === 'array-with-value' )
    {
      if( o.dst[ e ] === undefined )
      o.dst[ e ] = o.duplicate === 'array-with-value' ? [ e ] : [];
      o.dst[ e ].push( k );
    }
    else
    {
      _.assert( o.dst[ e ] === undefined, 'Cant invert the map, it has several keys with value', o.src[ k ] );
      o.dst[ e ] = k;
    }
  }

  /* */

  if( o.duplicate === 'delete' )
  _.mapDelete( o.dst, del );

  return o.dst;
}

mapInvert.defaults =
{
  src : null,
  dst : null,
  duplicate : 'error',
}

//

function mapInvertDroppingDuplicates( src, dst )
{
  dst = dst || Object.create( null );

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectLike( src ) );

  let drop;

  for( let s in src )
  {
    if( dst[ src[ s ] ] !== undefined )
    {
      drop = drop || Object.create( null );
      drop[ src[ s ] ] = true;
    }
    dst[ src[ s ] ] = s;
  }

  if( drop )
  for( let d in drop )
  {
    delete dst[ d ];
  }

  return dst;
}

//

function mapsFlatten( o )
{

  if( _.arrayIs( o ) )
  o = { src : o }

  _.routineOptions( mapsFlatten, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.delimeter === false || o.delimeter === 0 || _.strIs( o.delimeter ) );
  _.assert( _.arrayLike( o.src ) || _.mapLike( o.src ) )

  o.dst = o.dst || Object.create( null );
  extend( o.src, '' );

  return o.dst;

  /* */

  function extend( src, prefix )
  {

    if( _.arrayLike( src ) )
    {
      for( let s = 0 ; s < src.length ; s++ )
      extend( src[ s ], prefix );

    }
    else if( _.mapLike( src ) )
    {

      for( let k in src )
      {
        let key = k;
        if( _.strIs( o.delimeter ) )
        key = ( prefix ? prefix + o.delimeter : '' ) + k;
        if( _.mapIs( src[ k ] ) )
        {
          extend( src[ k ], key );
        }
        else
        {
          _.assert( !!o.allowingCollision || o.dst[ key ] === undefined );
          o.dst[ key ] = src[ k ];
        }
      }

    }
    else _.assert( 0, 'Expects map or array of maps, but got ' + _.strType( src ) );

  }

}

mapsFlatten.defaults =
{
  src : null,
  dst : null,
  allowingCollision : 0,
  delimeter : '/',
}

//

/**
 * The mapToArray() converts an object {-srcMap-} into array [ [ key, value ] ... ].
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if ( arguments.length === 1 ) and {-srcMap-} is an object.
 * If true, it returns a list of [ [ key, value ] ... ] pairs.
 * Otherwise it throws an Error.
 *
 * @param { objectLike } src - object to get a list of [ key, value ] pairs.
 *
 * @example
 * _.mapToArray( { a : 3, b : 13, c : 7 } );
 * // returns [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ]
 *
 * @returns { array } Returns a list of [ [ key, value ] ... ] pairs.
 * @function mapToArray
 * @throws { Error } Will throw an Error if( arguments.length !== 1 ) or {-srcMap-} is not an object.
 * @namespace Tools
 */

function mapToArray( src )
{
  return _.mapPairs( src );
}

//

/**
 * The mapToStr() routine converts and returns the passed object {-srcMap-} to the string.
 *
 * It takes an object and two strings (keyValSep) and (tupleSep),
 * checks if (keyValSep and tupleSep) are strings.
 * If false, it assigns them defaults ( ' : ' ) to the (keyValSep) and
 * ( '; ' ) to the tupleSep.
 * Otherwise, it returns a string representing the passed object {-srcMap-}.
 *
 * @param { objectLike } src - The object to convert to the string.
 * @param { string } [ keyValSep = ' : ' ] keyValSep - colon.
 * @param { string } [ tupleSep = '; ' ] tupleSep - semicolon.
 *
 * @example
 * _.mapToStr( { a : 1, b : 2, c : 3, d : 4 }, ' : ', '; ' );
 * // returns 'a : 1; b : 2; c : 3; d : 4'
 *
 * @example
 * _.mapToStr( [ 1, 2, 3 ], ' : ', '; ' );
 * // returns '0 : 1; 1 : 2; 2 : 3';
 *
 * @example
 * _.mapToStr( 'abc', ' : ', '; ' );
 * // returns '0 : a; 1 : b; 2 : c';
 *
 * @returns { string } Returns a string (result) representing the passed object {-srcMap-}.
 * @function mapToStr
 * @namespace Tools
 */

function mapToStr( o )
{

  if( _.strIs( o ) )
  o = { src : o }

  _.routineOptions( mapToStr, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let result = '';
  for( let s in o.src )
  {
    result += s + o.keyValDelimeter + o.src[ s ] + o.entryDelimeter;
  }

  result = result.substr( 0, result.length-o.entryDelimeter.length );

  return result
}

mapToStr.defaults =
{
  src : null,
  keyValDelimeter : ':',
  entryDelimeter : ';',
}

// --
// map logical operator
// --

/**
 * The mapButConditional() routine returns a new object (result)
 * whose (values) are not equal to the arrays or objects.
 *
 * Takes any number of objects.
 * If the first object has same key any other object has
 * then this pair [ key, value ] will not be included into (result) object.
 * Otherwise,
 * it calls a provided callback function( _.field.mapper.primitive )
 * once for each key in the {-srcMap-}, and adds to the (result) object
 * all the [ key, value ],
 * if values are not equal to the array or object.
 *
 * @param { function } filter.primitive() - Callback function to test each [ key, value ] of the {-srcMap-} object.
 * @param { objectLike } srcMap - The target object.
 * @param { ...objectLike } arguments[] - The next objects.
 *
 * @example
 * _.mapButConditional( _.field.mapper.primitive, { a : 1, b : 'b', c : [ 1, 2, 3 ] } );
 * // returns { a : 1, b : "b" }
 *
 * @returns { object } Returns an object whose (values) are not equal to the arrays or objects.
 * @function mapButConditional
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @namespace Tools
 */

function mapButConditional( fieldFilter, srcMap, butMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
  _.assert( !_.primitiveIs( srcMap ) /* && !_.longIs( srcMap ) */, 'Expects map {-srcMap-}' );
  _.assert( fieldFilter && fieldFilter.length === 3 && fieldFilter.functionFamily === 'field-filter', 'Expects field-filter {-fieldFilter-}' );

  if( _.arrayLike( butMap ) )
  {

    for( let s in srcMap )
    {

      let m;
      for( m = 0 ; m < butMap.length ; m++ )
      {
        if( !fieldFilter( butMap[ m ], srcMap, s ) )
        break;
      }

      if( m === butMap.length )
      result[ s ] = srcMap[ s ];

    }

  }
  else
  {

    for( let s in srcMap )
    {

      if( fieldFilter( butMap, srcMap, s ) )
      {
        result[ s ] = srcMap[ s ];
      }

    }

  }

  return result;
}

function mapButConditional_( fieldFilter, dstMap, srcMap, butMap )
{
  if( dstMap === null )
  {
    dstMap = Object.create( null );
  }
  if( arguments.length === 3 )
  {
    if( _.longIs( dstMap ) )
    dstMap = _.mapExtend( null, dstMap );

    butMap = srcMap;
    srcMap = dstMap;
  }

  _.assert( arguments.length === 3 || arguments.length === 4, 'Expects three or four arguments' );
  _.assert( _.routineIs( fieldFilter ) && fieldFilter.length === 3 && fieldFilter.functionFamily === 'field-filter', 'Expects field-filter {-fieldFilter-}' );
  _.assert( _.mapLike( dstMap ), 'Expects map like {-srcMap-}' );
  _.assert( _.mapLike( srcMap ) || _.longIs( srcMap ), 'Expects map {-srcMap-}' );
  _.assert( _.objectLike( butMap ) || _.longIs( butMap ) || _.routineIs( butMap ), 'Expects object like {-butMap-}' );

  if( dstMap === srcMap )
  {

    if( _.arrayLike( butMap ) )
    {
      for( let s in srcMap )
      {
        for( let m = 0 ; m < butMap.length ; m++ )
        {
          if( !fieldFilter( butMap[ m ], srcMap, s ) )
          delete dstMap[ s ];
        }
      }
    }
    else
    {
      for( let s in srcMap )
      {
        if( !fieldFilter( butMap, srcMap, s ) )
        delete dstMap[ s ];
      }
    }

  }
  else
  {

    if( _.arrayLike( butMap ) )
    {
      for( let s in srcMap )
      {
        let m;
        for( m = 0 ; m < butMap.length ; m++ )
        if( !fieldFilter( butMap[ m ], srcMap, s ) )
        break;

        if( m === butMap.length )
        dstMap[ s ] = srcMap[ s ];
      }
    }
    else
    {
      for( let s in srcMap )
      {
        if( fieldFilter( butMap, srcMap, s ) )
        dstMap[ s ] = srcMap[ s ];
      }
    }

  }

  return dstMap;
}

//

/**
 * Returns new object with unique pairs key-value from {-srcMap-} screened by screen map {-butMap-}.
 *
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * _.mapBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 * // returns { c : 3 }
 *
 * Returns new object filled by unique keys
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapBut
 * @namespace Tools
 */

function mapBut( srcMap, butMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( !_.primitiveIs( srcMap ), 'Expects map {-srcMap-}' );

  if( _.longLike( butMap ) )
  {
    for( let s in srcMap )
    {
      let m;
      for( m = 0 ; m < butMap.length ; m++ )
      {
        if( s === butMap[ m ] )
        break;
        if( _.mapIs( butMap[ m ] ) )
        if( s in butMap[ m ] )
        break;
      }

      if( m === butMap.length )
      result[ s ] = srcMap[ s ];
    }
  }
  else if( _.objectLike( butMap ) || _.routineIs( butMap ) )
  {
    for( let s in srcMap )
    {
      if( !( s in butMap ) )
      result[ s ] = srcMap[ s ];
    }
  }
  else
  {
    _.assert( 0, 'Expects object-like or long-like {-butMap-}' );
  }

  return result;
}

//

function mapBut_( dstMap, srcMap, butMap )
{
  if( dstMap === null )
  {
    dstMap = Object.create( null );
  }
  if( arguments.length === 2 )
  {
    if( _.longIs( dstMap ) )
    dstMap = _.mapExtend( null, dstMap );

    butMap = srcMap;
    srcMap = dstMap;
  }

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  _.assert( _.mapLike( dstMap ), 'Expects map like destination map {-dstMap-}' );
  _.assert( _.mapLike( srcMap ) || _.longIs( srcMap ), 'Expects long or map {-srcMap-}' );
  _.assert( _.objectLike( butMap ) || _.longIs( butMap ) || _.routineIs( butMap ), 'Expects object like {-butMap-}' );

  if( dstMap === srcMap )
  {

    if( _.arrayLike( butMap ) )
    {
      for( let s in srcMap )
      {
        for( let m = 0 ; m < butMap.length ; m++ )
        {
          if( s === butMap[ m ] )
          delete dstMap[ s ];
          else if( _.mapIs( butMap[ m ] ) )
          if( s in butMap[ m ] )
          delete dstMap[ s ];
        }
      }
    }
    else
    {
      for( let s in srcMap )
      {
        if( s in butMap )
        delete dstMap[ s ];
      }
    }

  }
  else
  {

    if( _.arrayLike( butMap ) )
    {
      for( let s in srcMap )
      {
        let m;
        for( m = 0 ; m < butMap.length ; m++ )
        {
          if( s === butMap[ m ] )
          break;
          if( _.mapIs( butMap[ m ] ) )
          if( s in butMap[ m ] )
          break;
        }

        if( m === butMap.length )
        dstMap[ s ] = srcMap[ s ];
      }
    }
    else
    {
      for( let s in srcMap )
      {
        if( !( s in butMap ) )
        dstMap[ s ] = srcMap[ s ];
      }
    }

  }

  return dstMap;
}

// function mapBut( srcMap, butMap )
// {
//   let result = Object.create( null );
//
//   if( _.arrayLike( srcMap ) )
//   srcMap = _.mapExtend( null, srcMap );
//   // srcMap = _.mapMake.apply( this, srcMap );
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
//   _.assert( !_.primitiveIs( srcMap ) && !_.arrayLike( srcMap ), 'Expects map {-srcMap-}' );
//
//   if( _.arrayLike( butMap ) )
//   {
//
//     for( let s in srcMap )
//     {
//       let m;
//       for( m = 0 ; m < butMap.length ; m++ )
//       {
//         if( ( s in butMap[ m ] ) )
//         break;
//       }
//
//       if( m === butMap.length )
//       result[ s ] = srcMap[ s ];
//
//     }
//
//   }
//   else
//   {
//
//     for( let s in srcMap )
//     {
//
//       if( !( s in butMap ) )
//       {
//         result[ s ] = srcMap[ s ];
//       }
//
//     }
//
//   }
//
//   return result;
// }

//

/**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * _.mapButIgnoringUndefines( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 * // returns { c : 3 }
 *
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapButIgnoringUndefines
 * @namespace Tools
 */

function mapButIgnoringUndefines( srcMap, butMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  return _.mapButConditional( _.field.filter.dstUndefinedSrcNotUndefined, srcMap, butMap );
  // return _.mapButConditional( _.field.filter.dstHasButUndefined, butMap, srcMap );
}

//

function mapButIgnoringUndefines_( dstMap, srcMap, butMap )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  return _.mapButConditional_( _.field.filter.dstUndefinedSrcNotUndefined, ... arguments );

}

// function mapButIgnoringUndefines( srcMap, butMap )
// {
//   let result = Object.create( null );
//
//   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
//   _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
//   _.assert( !_.primitiveIs( srcMap ) && !_.longIs( srcMap ), 'Expects map {-srcMap-}' );
//
//   if( _.arrayLike( butMap ) )
//   {
//
//     for( let s in srcMap )
//     {
//
//       if( srcMap[ k ] === undefined )
//       continue;
//
//       for( let m = 0 ; m < butMap.length ; m++ )
//       {
//         if( butMap[ m ][ s ] === undefined )
//         break;
//       }
//
//       if( m === butMap.length )
//       result[ s ] = srcMap[ s ];
//
//     }
//
//   }
//   else
//   {
//
//     for( let s in srcMap )
//     {
//
//       if( srcMap[ k ] === undefined )
//       continue;
//
//       if( butMap[ s ] === undefined )
//       {
//         result[ s ] = srcMap[ s ];
//       }
//
//     }
//
//   }
//
//   return result;
// }
//
//
//
// function mapButIgnoringUndefines( srcMap )
// {
//   let result = Object.create( null );
//   let a, k;
//
//   _.assert( arguments.length >= 2 );
//   _.assert( !_.primitiveIs( srcMap ), 'Expects object as argument' );
//
//   for( k in srcMap )
//   {
//
//     for( a = 1 ; a < arguments.length ; a++ )
//     {
//       let argument = arguments[ a ];
//
//       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
//
//       if( k in argument )
//       if( argument[ k ] !== undefined )
//       break;
//
//     }
//     if( a === arguments.length )
//     {
//       result[ k ] = srcMap[ k ];
//     }
//   }
//
//   return result;
// }
//
// //
//
// function mapBut( srcMap )
// {
//   let result = Object.create( null );
//   let a, k;
//
//   _.assert( arguments.length >= 2 );
//   _.assert( !_.primitiveIs( srcMap ), 'mapBut :', 'Expects object as argument' );
//
//   for( k in srcMap )
//   {
//     for( a = 1 ; a < arguments.length ; a++ )
//     {
//       let argument = arguments[ a ];
//
//       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
//
//       if( k in argument )
//       break;
//
//     }
//     if( a === arguments.length )
//     {
//       result[ k ] = srcMap[ k ];
//     }
//   }
//
//   return result;
// }
//
//

/**
 * The mapOwnBut() returns new object with unique own keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique own keys
 * from the first {-srcMap-} original object.
 * Values for (result) object come from original object {-srcMap-}
 * not from second or other one.
 * If {-srcMap-} does not have own properties it skips rest of code and checks another properties.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param { objectLike } srcMap - The original object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * _.mapBut( { a : 7, 'toString' : 5 }, { b : 33, c : 77 } );
 * // returns { a : 7 }
 *
 * @returns { object } Returns new (result) object with unique own keys.
 * @function mapOwnBut
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @namespace Tools
 */

function mapOwnBut( srcMap, butMap )
{
  let result = Object.create( null );

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  return _.mapButConditional( _.field.filter.dstNotHasSrcOwn, srcMap, butMap );
}

//

function mapOwnBut_( dstMap, srcMap, butMap )
{

  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );

  return _.mapButConditional_( _.field.filter.dstNotHasSrcOwn, ... arguments );
}

//

/**
 * @typedef screenMaps
 * @property { objectLike } screenMaps.screenMap - The first object.
 * @property { ...objectLike } srcMap.arguments[1, ...] -
 * The pseudo array (arguments[]) from the first [1] index to the end.
 * @property { object } dstMap - The empty object.
 * @namespace Tools
 */

/**
 * The mapOnly() returns an object filled by unique [ key, value ]
 * from others objects.
 *
 * It takes number of objects, creates a new object by three properties
 * and calls the _mapOnly( {} ) with created object.
 *
 * @see  {@link wTools._mapOnly} - See for more information.
 *
 * @param { objectLike } screenMap - The first object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * _.mapOnly( { a : 13, b : 77, c : 3, d : 'name' }, { d : 'name', c : 33, a : 'abc' } );
 * // returns { a : "abc", c : 33, d : "name" };
 *
 * @returns { Object } Returns the object filled by unique [ key, value ]
 * from others objects.
 * @function mapOnly
 * @throws { Error } Will throw an Error if (arguments.length < 2) or (arguments.length !== 2).
 * @namespace Tools
 */

function mapOnly( srcMaps, screenMaps )
{

  if( arguments.length === 1 )
  return _.mapsExtend( null, srcMaps );

  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects single or two arguments' );

  return _mapOnly
  ({
    srcMaps,
    screenMaps,
    dstMap : Object.create( null ),
  });

}

//

function mapOnly_( dstMap, srcMaps, screenMaps )
{

  if( arguments.length === 1 )
  {
    return _.mapsExtend( null, dstMap );
  }
  else if( arguments.length === 2 )
  {
    if( dstMap === null )
    return Object.create( null );

    screenMaps = srcMaps;
    srcMaps = dstMap;
    if( _.longIs( dstMap ) )
    dstMap = Object.create( null );
  }
  else if( arguments.length !== 3 )
  {
    _.assert( 0, 'Expects at least one argument and no more then three arguments' );
  }

  return _mapOnly_
  ({
    srcMaps,
    screenMaps,
    dstMap,
  });

}

//

function mapOnlyOwn( srcMaps, screenMaps )
{

  if( arguments.length === 1 )
  return _.mapsExtendConditional( _.field.mapper.srcOwn, null, srcMaps );

  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects single or two arguments' );

  return _mapOnly
  ({
    filter : _.field.mapper.srcOwn,
    srcMaps,
    screenMaps,
    dstMap : Object.create( null ),
  });

}

//

function mapOnlyOwn_( dstMap, srcMaps, screenMaps )
{

  if( arguments.length === 1 )
  {
    return _.mapsExtendConditional( _.field.mapper.srcOwn, null, _.arrayAs( dstMap ) );
  }
  else if( arguments.length === 2 )
  {
    if( dstMap === null )
    return Object.create( null );

    screenMaps = srcMaps;
    srcMaps = dstMap;
    if( _.longIs( dstMap ) )
    dstMap = Object.create( null );
  }
  else if( arguments.length !== 3 )
  {
    _.assert( 0, 'Expects at least one argument and no more then three arguments' );
  }

  return _mapOnly_
  ({
    filter : _.field.mapper.srcOwn,
    srcMaps,
    screenMaps,
    dstMap,
  });

}

//

function mapOnlyComplementing( srcMaps, screenMaps )
{

  _.assert( arguments.length === 1 || arguments.length === 2, 'Expects single or two arguments' );

  return _mapOnly
  ({
    filter : _.field.mapper.dstNotOwnOrUndefinedAssigning,
    srcMaps,
    screenMaps,
    dstMap : Object.create( null ),
  });

}

//

function mapOnlyComplementing_( dstMap, srcMaps, screenMaps )
{

  if( arguments.length === 2 )
  {
    if( dstMap === null )
    return Object.create( null );

    screenMaps = srcMaps;
    srcMaps = dstMap;
    if( _.longIs( dstMap ) )
    dstMap = Object.create( null );
  }
  else if( arguments.length !== 3 )
  {
    _.assert( 0, 'Expects two or three arguments' );
  }

  return _mapOnly_
  ({
    filter : _.field.mapper.dstNotOwnOrUndefinedAssigning,
    srcMaps,
    screenMaps,
    dstMap,
  });

}

//

/**
 * @callback  options.filter
 * @param { objectLike } dstMap - An empty object.
 * @param { objectLike } srcMaps - The target object.
 * @param { string } - The key of the (screenMap).
 */

/**
 * The _mapOnly() returns an object filled by unique [ key, value]
 * from others objects.
 *
 * The _mapOnly() checks whether there are the keys of
 * the (screenMap) in the list of (srcMaps).
 * If true, it calls a provided callback function(filter)
 * and adds to the (dstMap) all the [ key, value ]
 * for which callback function returns true.
 *
 * @param { function } [options.filter = filter.bypass()] options.filter - The callback function.
 * @param { objectLike } options.srcMaps - The target object.
 * @param { objectLike } options.screenMaps - The source object.
 * @param { Object } [options.dstMap = Object.create( null )] options.dstMap - The empty object.
 *
 * @example
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
 * options.srcMaps = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
 * _mapOnly( options );
 * // returns { a : 33, c : 33, name : "Mikle" };
 *
 * @example
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { a : 13, b : 77, c : 3, d : 'name' };
 * options.srcMaps = { d : 'name', c : 33, a : 'abc' };
 * _mapOnly( options );
 * // returns { a : "abc", c : 33, d : "name" };
 *
 * @returns { Object } Returns an object filled by unique [ key, value ]
 * from others objects.
 * @function _mapOnly
 * @throws { Error } Will throw an Error if (options.dstMap or screenMap) are not objects,
 * or if (srcMaps) is not an array
 * @namespace Tools
 */

// function _mapOnly( o )
// {
//
//   let dstMap = o.dstMap || Object.create( null );
//   let screenMap = o.screenMaps;
//   let srcMaps = o.srcMaps;
//
//   if( _.arrayIs( screenMap ) )
//   screenMap = _.mapExtend( null, screenMap );
//   // screenMap = _.mapMake.apply( this, screenMap );
//
//   if( !_.arrayIs( srcMaps ) )
//   srcMaps = [ srcMaps ];
//
//   if( !o.filter )
//   o.filter = _.field.mapper.bypass;
//
//   if( Config.debug )
//   {
//
//     _.assert( o.filter.functionFamily === 'field-mapper' );
//     _.assert( arguments.length === 1, 'Expects single argument' );
//     _.assert( _.objectLike( dstMap ), 'Expects object-like {-dstMap-}' );
//     _.assert( !_.primitiveIs( screenMap ), 'Expects not primitive {-screenMap-}' );
//     _.assert( _.arrayIs( srcMaps ), 'Expects array {-srcMaps-}' );
//     _.assertMapHasOnly( o, _mapOnly.defaults );
//
//     for( let s = srcMaps.length-1 ; s >= 0 ; s-- )
//     _.assert( !_.primitiveIs( srcMaps[ s ] ), 'Expects {-srcMaps-}' );
//
//   }
//
//   for( let k in screenMap )
//   {
//
//     if( screenMap[ k ] === undefined )
//     continue;
//
//     let s;
//     for( s = srcMaps.length-1 ; s >= 0 ; s-- )
//     if( k in srcMaps[ s ] )
//     break;
//
//     if( s === -1 )
//     continue;
//
//     o.filter.call( this, dstMap, srcMaps[ s ], k );
//
//   }
//
//   return dstMap;
// }

function _mapOnly( o )
{

  let dstMap = o.dstMap || Object.create( null );
  let screenMap = o.screenMaps;
  let srcMaps = o.srcMaps;

  if( !_.arrayIs( srcMaps ) )
  srcMaps = [ srcMaps ];

  if( !o.filter )
  o.filter = _.field.mapper.bypass;

  if( Config.debug )
  {

    _.assert( o.filter.functionFamily === 'field-mapper' );
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assert( _.objectLike( dstMap ), 'Expects object-like {-dstMap-}' );
    _.assert( !_.primitiveIs( screenMap ), 'Expects not primitive {-screenMap-}' );
    _.assert( _.arrayIs( srcMaps ), 'Expects array {-srcMaps-}' );
    _.assertMapHasOnly( o, _mapOnly.defaults );

    for( let s = srcMaps.length - 1 ; s >= 0 ; s-- )
    _.assert( !_.primitiveIs( srcMaps[ s ] ), 'Expects {-srcMaps-}' );

  }

  if( _.longIs( screenMap ) )
  {
    for( let k in screenMap )
    {

      if( screenMap[ k ] === undefined )
      continue;

      let s;
      for( s = srcMaps.length-1 ; s >= 0 ; s-- )
      {
        if( !_.mapIs( screenMap[ k ] ) && screenMap[ k ] in srcMaps[ s ] )
        {
          k = screenMap[ k ];
          break;
        }
        if( k in srcMaps[ s ] )
        {
          break;
        }
      }

      if( s === -1 )
      continue;

      o.filter.call( this, dstMap, srcMaps[ s ], k );

    }
  }
  else
  {
    for( let k in screenMap )
    {
      if( screenMap[ k ] === undefined )
      continue;

      for( let s in srcMaps )
      if( k in srcMaps[ s ] )
      o.filter.call( this, dstMap, srcMaps[ s ], k );
    }
  }

  return dstMap;
}

_mapOnly.defaults =
{
  dstMap : null,
  srcMaps : null,
  screenMaps : null,
  filter : null,
}

//

function _mapOnly_( o )
{

  let dstMap = o.dstMap || Object.create( null );
  let screenMap = o.screenMaps;
  let srcMaps = o.srcMaps;

  if( !_.arrayIs( srcMaps ) )
  srcMaps = [ srcMaps ];

  if( !o.filter )
  o.filter = _.field.mapper.bypass;

  if( Config.debug )
  {

    _.assert( o.filter.functionFamily === 'field-mapper' );
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assert( _.objectLike( dstMap ), 'Expects object-like {-dstMap-}' );
    _.assert( !_.primitiveIs( screenMap ), 'Expects not primitive {-screenMap-}' );
    _.assert( _.arrayIs( srcMaps ), 'Expects array {-srcMaps-}' );
    _.assertMapHasOnly( o, _mapOnly_.defaults );

    for( let s = srcMaps.length - 1 ; s >= 0 ; s-- )
    _.assert( !_.primitiveIs( srcMaps[ s ] ), 'Expects {-srcMaps-}' );

  }

  if( o.dstMap === o.srcMaps || o.dstMap === o.srcMaps[ 0 ] )
  {

    if( _.longIs( screenMap ) )
    {
      for( let s in srcMaps )
      {
        let srcMap = srcMaps[ s ];

        for( let k in srcMap )
        {
          let m;
          for( m = 0 ; m < screenMap.length ; m++ )
          {
            if( k === String( m ) )
            break;
            if( k === screenMap[ m ] )
            break;
            if( _.mapLike( screenMap[ m ] ) && k in screenMap[ m ] )
            break;
          }

          if( m === screenMap.length )
          delete srcMap[ k ];
          else
          o.filter.call( this, dstMap, srcMap, k );
        }
      }
    }
    else
    {
      for( let s in srcMaps )
      {
        let srcMap = srcMaps[ s ];

        for( let k in srcMap )
        if( !( k in screenMap ) )
        delete srcMap[ k ];
        else
        o.filter.call( this, dstMap, srcMaps[ s ], k );
      }
    }

  }
  else
  {

    if( _.longIs( screenMap ) )
    {
      for( let s in srcMaps )
      {
        let srcMap = srcMaps[ s ];

        for( let k in srcMap )
        {
          let m;
          for( m = 0 ; m < screenMap.length ; m++ )
          {
            if( k === String( m ) )
            break;
            if( k === screenMap[ m ] )
            break;
            if( _.mapLike( screenMap[ m ] ) && k in screenMap[ m ] )
            break;
          }

          if( m !== screenMap.length )
          o.filter.call( this, dstMap, srcMaps[ s ], k );
        }
      }
    }
    else
    {
      for( let k in screenMap )
      {
        if( screenMap[ k ] === undefined )
        continue;

        for( let s in srcMaps )
        if( k in srcMaps[ s ] )
        o.filter.call( this, dstMap, srcMaps[ s ], k );
      }
    }

  }

  return dstMap;
}

_mapOnly_.defaults =
{
  dstMap : null,
  srcMaps : null,
  screenMaps : null,
  filter : null,
}

// --
// map sure
// --

function sureMapHasExactly( srcMap, screenMaps, msg )
{
  let result = true;

  result = result && _.sureMapHasOnly.apply( this, arguments );
  result = result && _.sureMapHasAll.apply( this, arguments );

  return true;
}

//

function sureMapOwnExactly( srcMap, screenMaps, msg )
{
  let result = true;

  result = result && _.sureMapOwnOnly.apply( this, arguments );
  result = result && _.sureMapOwnAll.apply( this, arguments );

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * _.sureMapHasOnly( a, b );
 * // no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * _.sureMapHasOnly( a, b );
 *
 * // log
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * _.sureMapHasOnly( a, b, 'message' )
 *
 * // log
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * _.sureMapHasOnly( a, b, () => 'message, ' + 'map`, ' should have no fields :'  )
 *
 * // log
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function sureMapHasOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @namespace Tools
 *
 */

function sureMapHasOnly( srcMap, screenMaps, msg )
{
  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ `${ _.strType( srcMap ) } should have no fields :`, _.strQuote( but ).join( ', ' ) ],
      // args : [ _.strType( srcMap ) + ' should have no fields :', _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr.push( arguments[ i ] );
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * _.sureMapOwnOnly( a, b );
 * //no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * _.sureMapOwnOnly( a, b );
 *
 * // log
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * _.sureMapOwnOnly( a, b, 'error msg' );
 *
 * // log
 * // caught <anonymous>:4:8
 * // error msg Object should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * _.sureMapOwnOnly( a, b, () => 'error, ' + 'map should', ' no own fields :' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @function sureMapOwnOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @namespace Tools
 *
 */

function sureMapOwnOnly( srcMap, screenMaps, msg )
{
  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOwnBut( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ `${ _.strType( srcMap ) } should own no fields :`, _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr.push( arguments[ i ] );
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 3,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * _.sureMapHasAll( a, b );
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * _.sureMapHasAll( a, b );
 *
 * // log
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * _.sureMapHasAll( a, b, 'error msg' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * _.sureMapHasAll( a, b, () => 'error, ' + 'map should', ' have fields :' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // error, map should have fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function sureMapHasAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @namespace Tools
 *
 */

function sureMapHasAll( srcMap, all, msg )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapBut( all, srcMap ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ `${ _.strType( srcMap ) } should have fields :`, _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr.push( arguments[ i ] );
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * wTools.sureMapOwnAll( a, b );
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * _.sureMapOwnAll( a, b );
 *
 * // log
 * // caught <anonymous>:3:8
 * // Object should have own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * _.sureMapOwnAll( a, b, 'error, should own fields' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // error, should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * _.sureMapOwnAll( a, b, () => 'error, ' + 'map should', ' own fields :' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // error, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function sureMapOwnAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @namespace Tools
 *
 */

function sureMapOwnAll( srcMap, all, msg )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOwnBut( all, srcMap ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ `${ _.strType( srcMap ) } should own fields :`, _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr.push( arguments[ i ] );
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param {...Object} screenMaps - object(s) to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * _.sureMapHasNone( a, b );
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * _.sureMapHasNone( a, b );
 *
 * // log
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * _.sureMapHasNone( a, b, 'error, map should have no fields' );
 *
 * // log
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * _.sureMapHasNone( a, b, () => 'error, ' + 'map should have', 'no fields :' );
 *
 * // log
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function sureMapHasNone
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @namespace Tools
 *
 */

function sureMapHasNone( srcMap, screenMaps, msg )
{

 _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOnly( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ `${ _.strType( srcMap ) } should have no fields :`, _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr.push( arguments[ i ] );
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

function sureMapOwnNone( srcMap, screenMaps, msg )
{

  _.assert( arguments.length === 2 || arguments.length === 3 || arguments.length === 4, 'Expects two, three or four arguments' );

  let but = Object.keys( _.mapOnlyOwn( srcMap, screenMaps ) );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 2 )
    throw _._err
    ({
      args : [ `${ _.strType( srcMap ) } should own no fields :`, _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 2; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr.push( arguments[ i ] );
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

//

/**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * _.sureMapHasNoUndefine( map );
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * _.sureMapHasNoUndefine( map );
 *
 * // log
 * // caught <anonymous>:2:8
 * // Object  should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * _.sureMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // log
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * _.sureMapHasNoUndefine( map, '"map"', () => 'should have ' + 'no undefines, but has :' );
 *
 * // log
 * // caught <anonymous>:2:8
 * // "map" should have no undefines, but has : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function sureMapHasNoUndefine
 * @throws {Exception} If no arguments passed or than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @namespace Tools
 *
 */

function sureMapHasNoUndefine( srcMap, msg )
{

  _.assert( arguments.length === 1 || arguments.length === 2 || arguments.length === 3, 'Expects one, two or three arguments' )

  let but = [];

  for( let s in srcMap )
  if( srcMap[ s ] === undefined )
  but.push( s );

  if( but.length > 0 )
  {
    debugger;
    if( arguments.length === 1 )
    throw _._err
    ({
      args : [ `${ _.strType( srcMap ) } should have no undefines, but has :`, _.strQuote( but ).join( ', ' ) ],
      level : 2,
    });
    else
    {
      let arr = [];
      for ( let i = 1; i < arguments.length; i++ )
      {
        if( _.routineIs( arguments[ i ] ) )
        arguments[ i ] = ( arguments[ i ] )();
        arr.push( arguments[ i ] );
      }
      throw _._err
      ({
        args : [ arr.join( ' ' ), _.strQuote( but ).join( ', ' ) ],
        level : 2,
      });
    }

    return false;
  }

  return true;
}

// --
// map assert
// --

function assertMapHasFields( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasExactly.apply( this, arguments );
}

//

function assertMapOwnFields( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnExactly.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * _.assertMapHasOnly( a, b );
 * //no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * _.assertMapHasOnly( a, b );
 *
 * // log
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * _.assertMapHasOnly( a, b, 'map should have no fields :' )
 *
 * // log
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * _.assertMapHasOnly( a, b, 'map', () => ' should' + ' have no fields :' )
 *
 * // log
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function assertMapHasOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @namespace Tools
 *
 */

function assertMapHasOnly( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasOnly.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * _.assertMapOwnOnly( a, b );
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * _.assertMapOwnOnly( a, b );
 *
 * // log
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * _.assertMapOwnOnly( a, b, 'error, map should have no own fields :' );
 *
 * // log
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * _.assertMapOwnOnly( a, b, () => 'error, ' + 'map', ' should have no own fields :' );
 *
 * // log
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @function assertMapOwnOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @namespace Tools
 *
 */

function assertMapOwnOnly( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnOnly.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * _.assertMapHasNone( a, b );
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * _.assertMapHasNone( a, b );
 *
 * // log
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * _.assertMapHasNone( a, b, 'map should have no fields :' );
 *
 * // log
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * _.assertMapHasNone( a, b, () => 'map ' + 'should ', 'have no fields :' );
 *
 * // log
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function assertMapHasNone
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @namespace Tools
 *
 */

function assertMapHasNone( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasNone.apply( this, arguments );
}

//

function assertMapOwnNone( srcMap, screenMaps, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnNone.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * _.assertMapHasAll( a, b );
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * _.assertMapHasAll( a, b );
 *
 * // log
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * _.assertMapHasAll( a, b, 'map should have fields :' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * _.assertMapHasAll( a, b, () => 'map' + ' should', ' have fields :' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function assertMapHasAll
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @namespace Tools
 *
 */

function assertMapHasAll( srcMap, all, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasAll.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * _.assertMapOwnAll( a, b );
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * _.assertMapOwnAll( a, b );
 *
 * // log
 * // caught <anonymous>:3:8
 * // Object should own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * _.assertMapOwnAll( a, b, 'error msg, map should own fields :' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * _.assertMapOwnAll( a, b, 'error msg, ', () => 'map' + ' should own fields :' );
 *
 * // log
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function assertMapOwnAll
 * @throws {Exception} If no arguments passed or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @namespace Tools
 *
 */

function assertMapOwnAll( srcMap, all, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapOwnAll.apply( this, arguments );
}

//

/**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in second argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * _.assertMapHasNoUndefine( map );
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * _.assertMapHasNoUndefine( map );
 *
 * // log
 * // caught <anonymous>:2:8
 * // Object should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * _.assertMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // log
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * _.assertMapHasNoUndefine( map, 'map', () => ' has ' + 'undefines :');
 *
 * // log
 * // caught <anonymous>:2:8
 * // map has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function assertMapHasNoUndefine
 * @throws {Exception} If no arguments provided or more than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @namespace Tools
 *
 */

function assertMapHasNoUndefine( srcMap, msg )
{
  if( Config.debug === false )
  return true;
  return _.sureMapHasNoUndefine.apply( this, arguments );
}

// --
// extension
// --

let Extension =
{

  // map checker

  mapsAreIdentical,
  mapContain,

  objectSatisfy,

  mapHas : mapHasKey,
  mapHasKey,
  mapOwnKey,
  mapHasVal,
  mapOwnVal,

  mapHasAll,
  mapHasAny,
  mapHasNone,

  mapOwnAll,
  mapOwnAny,
  mapOwnNone,

  mapHasExactly,
  mapOwnExactly,

  mapHasOnly,
  mapOwnOnly,

  mapHasNoUndefine,

  // map extend

  mapMake,
  mapShallowClone,
  mapCloneAssigning, /* dubious */

  // mapExtend,
  mapsExtend,
  mapExtendConditional,
  mapsExtendConditional,

  mapExtendHiding,
  mapsExtendHiding,
  mapExtendAppending,
  mapsExtendAppending,
  mapExtendPrepending,
  mapsExtendPrepending,
  mapExtendAppendingOnlyArrays,
  mapsExtendAppendingOnlyArrays,
  mapExtendByDefined,
  mapsExtendByDefined,
  mapExtendNulls,
  mapsExtendNulls,

  // mapSupplement,
  mapSupplementNulls,
  mapSupplementNils,
  mapSupplementAssigning,
  mapSupplementAppending,
  mapsSupplementAppending,

  mapSupplementOwn,
  mapsSupplementOwn,
  mapSupplementOwnAssigning,
  mapSupplementOwnFromDefinition,
  mapSupplementOwnFromDefinitionStrictlyPrimitives,

  mapComplement,
  mapsComplement,
  mapComplementReplacingUndefines,
  mapsComplementReplacingUndefines,
  mapComplementPreservingUndefines,
  mapsComplementPreservingUndefines,

  // map extend recursive

  mapExtendRecursiveConditional,
  mapsExtendRecursiveConditional,
  _mapExtendRecursiveConditional,

  mapExtendRecursive,
  mapsExtendRecursive,
  _mapExtendRecursive,

  mapExtendAppendingAnythingRecursive,
  mapsExtendAppendingAnythingRecursive,
  mapExtendAppendingArraysRecursive,
  mapsExtendAppendingArraysRecursive,
  mapExtendAppendingOnceRecursive,
  mapsExtendAppendingOnceRecursive,

  mapSupplementRecursive,
  mapSupplementByMapsRecursive,
  mapSupplementOwnRecursive,
  mapsSupplementOwnRecursive,
  mapSupplementRemovingRecursive,
  mapSupplementByMapsRemovingRecursive,

  // hash map

  hashMapExtend,

  // map selector

  mapOnlyPrimitives,

  // map manipulator

  objectSetWithKeys,
  mapSet : objectSetWithKeys,
  objectSetWithKeyStrictly,
  mapDelete, /* qqq2 : cover please */
  mapEmpty,

  // map transformer

  mapInvert,
  mapInvertDroppingDuplicates,
  mapsFlatten,

  mapToArray,
  mapToStr, /* experimental */

  // map logical operator

  mapButConditional,
  mapButConditional_, /* !!! : use instead of mapButConditional */
  mapBut,
  mapBut_, /* !!! : use instead of mapBut */
  mapButIgnoringUndefines,
  mapButIgnoringUndefines_, /* !!! : use instead of mapButIgnoringUndefines */
  mapOwnBut,
  mapOwnBut_, /* !!! : use instead of mapOwnBut */

  mapOnly,
  mapOnly_, /* !!! : use instead of mapOnly */
  mapOnlyOwn,
  mapOnlyOwn_, /* !!! : use instead of mapOnlyOwn */
  mapOnlyComplementing,
  mapOnlyComplementing_, /* !!! : use instead of mapOnlyComplementing */
  _mapOnly,
  _mapOnly_,

  // map surer

  sureMapHasExactly,
  sureMapOwnExactly,

  sureMapHasOnly,
  sureMapOwnOnly,

  sureMapHasAll,
  sureMapOwnAll,

  sureMapHasNone,
  sureMapOwnNone,

  sureMapHasNoUndefine,

  // map assert

  assertMapHasFields,
  assertMapOwnFields,

  assertMapHasOnly,
  assertMapOwnOnly,

  assertMapHasNone,
  assertMapOwnNone,

  assertMapHasAll,
  assertMapOwnAll,

  assertMapHasNoUndefine,

}

//

_.mapSupplement( _, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
