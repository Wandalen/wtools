( function _l1_Numbers_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.number = _.number || Object.create( null );
_.number.s = _.number.s || Object.create( null );

// --
// number
// --

function _identicalShallow( a, b )
{

  if( _.number.s.areAll( [ a, b ] ) )
  return Object.is( a, b ) || a === b;

  return false;
}

//

function identicalShallow( src1, src2, o )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( !this.is( src1 ) )
  return false;
  if( !this.is( src2 ) )
  return false;

  return this._identicalShallow( ... arguments );
}

//

function _identicalShallowStrictly( a, b )
{
  /*
  it takes into account -0 === +0 case
  */

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.number.s.areAll( [ a, b ] ) )
  return Object.is( a, b );

  return false;
}

//

function identicalShallowStrictly( src1, src2, o )
{

  _.assert( arguments.length === 2 || arguments.length === 3 );

  if( !this.is( src1 ) )
  return false;
  if( !this.is( src2 ) )
  return false;

  return this._identicalShallowStrictly( ... arguments );
}

//

function _equivalentShallow( a, b, accuracy )
{

  if( accuracy !== undefined )
  _.assert( _.number.is( accuracy ) && accuracy >= 0, 'Accuracy has to be a number >= 0' );

  /* qqq for Yevhen : bad! */

  if( _.number.is( a ) && _.number.is( b ) )
  {
    if( Object.is( a, b ) )
    return true;
  }

  if( !_.number.is( a ) && !_.bigInt.is( a ) )
  return false;

  if( !_.number.is( b ) && !_.bigInt.is( b ) )
  return false;

  /* qqq for Yevhen : cache results of *Is calls at the beginning of the routine */

  // else
  // {
  //   return false;
  // }

  if( accuracy === undefined )
  accuracy = _.accuracy;

  if( _.bigInt.is( a ) )
  {
    if( _.intIs( b ) )
    {
      b = BigInt( b );
    }
    // else
    // {
    //   a = Number( a );
    //   if( a === +Infinity || a === -Infinity )
    //   return false;
    // }
  }

  if( _.bigInt.is( b ) )
  {
    if( _.intIs( a ) )
    {
      a = BigInt( a );
    }
    // else
    // {
    //   b = Number( b );
    //   if( b === +Infinity || b === -Infinity )
    //   return false;
    // }
  }

  if( Object.is( a, b ) )
  return true;

  if( _.bigInt.is( a ) && _.bigInt.is( b ) )
  {
    if( _.intIs( accuracy ) )
    {
      return BigIntMath.abs( a - b ) <= BigInt( accuracy );
    }
    else
    {
      let diff = BigIntMath.abs( a - b );
      if( diff <= BigInt( Math.floor( accuracy ) ) )
      return true;
      if( diff > BigInt( Math.ceil( accuracy ) ) )
      return false;
      diff = Number( diff );
      if( diff === Infinity || diff === -Infinity )
      return false;
      return Math.abs( diff ) <= accuracy;
    }
  }

  // if( !_.number.is( a ) )
  // return false;
  //
  // if( !_.number.is( b ) )
  // return false;

  return Math.abs( a - b ) <= accuracy;
  // return +( Math.abs( a - b ) ).toFixed( 10 ) <= +( accuracy ).toFixed( 10 );
}

//

function equivalentShallow( src1, src2, accuracy )
{
  _.assert( arguments.length === 2 || arguments.length === 3 );
  if( !this.like( src1 ) )
  return false;
  if( !this.like( src2 ) )
  return false;
  return this._equivalentShallow( ... arguments );
}

// --
// extension
// --

let ToolsExtension =
{
}

Object.assign( _, ToolsExtension );

//

let NumberExtension =
{

  // equaler

  _identicalShallow,
  identicalShallow,
  identical : identicalShallow,

  _identicalShallowStrictly,
  identicalShallowStrictly,
  identicalStrictly : identicalShallowStrictly,

  // identicalNotStrictly,

  _equivalentShallow,
  equivalentShallow,
  equivalent : equivalentShallow,

  // areEquivalentShallow : areEquivalent,
  // areIdentical,
  // areIdenticalNotStrictly,
  // areEquivalent,

}

Object.assign( _.number, NumberExtension );

//

let NumbersExtension =
{
}

Object.assign( _.number.s, NumbersExtension );

})();

