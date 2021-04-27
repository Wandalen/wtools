( function _l5_BigInt_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _.bigInt = _.bigInt || Object.create( null );
_.bigInt.s = _.bigInt.s || Object.create( null );

// --
// implementation
// --


function from( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  if( _.strIs( src ) )
  return BigInt( src );
  if( _.number.is( src ) )
  return BigInt( src );
  _.assert( _.bigInt.is( src ), 'Cant convert' )
  return src;
}

//

function bigIntsFrom( src )
{
  if( _.number.is( src ) )
  {
    return BigInt( src );
  }
  else if( _.bigInt.is( src ) )
  {
    return src;
  }
  else if( _.longIs( src ) )
  {
    let result = [];
    for( let i = 0 ; i < src.length ; i++ )
    result[ i ] = _.bigInt.from( src[ i ] );
    return result
  }
  else _.assert( 0, 'Cant convert' );
}

// --
// extension
// --

let ToolsExtension =
{
  bigIntFrom : from,
  bigIntsFrom,
}

//

let Extension =
{
  from,
}

//

let ExtensionS =
{
  from : bigIntsFrom
}

Object.assign( Self, Extension );
Object.assign( _.bigInt.s, ExtensionS );
Object.assign( _, ToolsExtension );

})();
