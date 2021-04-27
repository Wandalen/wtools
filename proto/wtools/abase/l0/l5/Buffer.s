( function _l5_Buffer_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;

// --
// buffer checker
// --

function constructorIsBuffer( src )
{
  if( !src )
  return false;
  if( !_.number.is( src.BYTES_PER_ELEMENT ) )
  return false;
  if( !_.strIs( src.name ) )
  return false;
  return src.name.indexOf( 'Array' ) !== -1;
}


// --
// extension
// --

let Extension =
{
  constructorIsBuffer
}

_.props.supplement( Self, Extension );

})();
