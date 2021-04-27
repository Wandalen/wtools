( function _l1_Container_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// implementation
// --

/* xxx : adjust */
function is( src )
{
  if( _.longLike( src ) )
  return true;
  if( _.aux.is( src ) )
  return true;
  if( _.hashMap.like( src ) )
  return true;
  if( _.set.like( src ) )
  return true;
  return false;
}

//

function lengthOf( container )
{
  _.assert( arguments.length === 1 );
  /* qqq : find optimal solution. write performance test */
  return _.entity.lengthOf( container );
}

// --
// declare type
// --

class Container
{
  static[ Symbol.hasInstance ]( instance )
  {
    return is( instance );
  }
}

let Handler =
{
  construct( original, args )
  {
    return Container.make( ... args );
  }
};

const Self = new Proxy( Container, Handler );
Self.original = Container;

// --
// extend container
// --

let ContainerExtension =
{

  is, /* qqq : cover please */
  lengthOf,

}

//

_.container = Self;

Object.assign( Self, ContainerExtension );

// --
// extend tools
// --

let ToolsExtension =
{

  containerIs : is,
  containerLengthOf : lengthOf,

}

//

Object.assign( _, ToolsExtension );

})();
