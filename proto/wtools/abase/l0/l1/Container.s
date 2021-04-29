( function _l1_Container_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// implementation
// --

/* xxx : adjust */
/* qqq : cover is and like by test routine dichotomy */
function is( src )
{
  if( _.countable.like( src ) )
  return true;
  if( _.aux.is( src ) )
  return true;
  return false;
}

// function is( src )
// {
//   if( _.longLike( src ) )
//   return true;
//   if( _.aux.is( src ) )
//   return true;
//   if( _.hashMap.like( src ) )
//   return true;
//   if( _.set.like( src ) )
//   return true;
//   return false;
// }

//

function like( src )
{
  return _.container.is( src );
}

// --
// maker
// --

function cloneShallow( container ) /* qqq for junior : cover please */
{
  _.assert( arguments.length === 1 );
  return cloneShallow.functor.call( this, container )();
}

cloneShallow.functor = _functor_functor( 'cloneShallow' );

//

function make( container, ... args ) /* qqq for junior : cover please */
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return make.functor.call( this, container )( ... args );
}

make.functor = _functor_functor( 'make' );

//

function makeEmpty( container ) /* qqq for junior : cover please */
{
  _.assert( arguments.length === 1 );
  return makeEmpty.functor.call( this, container )();
}

makeEmpty.functor = _functor_functor( 'makeEmpty' );

//

function makeUndefined( container, ... args ) /* qqq for junior : cover please */
{
  _.assert( arguments.length === 1 || arguments.length === 2 );
  return makeUndefined.functor.call( this, container )( ... args );
}

makeUndefined.functor = _functor_functor( 'makeUndefined' );

// --
// meta
// --

function namespaceForContainer( src ) /* qqq for junior : cover please */
{
  _.assert( arguments.length === 1 );
  if( _.primitive.is( src ) )
  return _.blank;
  if( _.hashMap.like( src ) )
  return _.hashMap;
  if( _.set.like( src ) )
  return _.set;
  if( _.longIs( src ) )
  return _.long;
  if( _.countableIs( src ) )
  return _.countable;
  if( _.mapIs( src ) )
  return _.map;
  if( _.auxIs( src ) )
  return _.aux;

  return _.blank;
}

//

function namespaceForEntity( src )
{
  if( _.primitive.is( src ) )
  return _.primitive;
  if( _.date.is( src ) )
  return _.date;
  if( _.regexp.is( src ) )
  return _.regexp;
  if( _.buffer.like( src ) )
  return _.buffer;
  if( _.set.like( src ) )
  return _.set;
  if( _.hashMap.like( src ) )
  return _.hashMap;
  if( _.vector.like( src ) )
  return _.vector;
  if( _.routine.is( src ) )
  return _.routine;
  if( _.aux.like( src ) )
  return _.aux;
  if( _.object.like( src ) )
  return _.object;

  return null;
}

//

function _functor_functor( methodName, typer )
{
  _.assert( !!( methodName ) );
  if( !typer )
  typer = 'namespaceForContainer';
  return function _functor( container )
  {
    _.assert( arguments.length === 1 );
    _.assert( _.routine.is( this[ typer ] ),() =>  `No routine::${typer} in the namesapce::${this.NamespaceName}` );
    let namespace = this[ typer ]( container );
    _.assert( _.routine.is( namespace[ methodName ] ), `No routine::${methodName} in the namesapce::${namespace.NamespaceName}` );
    return namespace[ methodName ].bind( namespace, container );
  }
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

  NamespaceName : 'wTools.container',
  TypeName : 'Container',
  SecondTypeName : 'Container',
  InstanceConstructor : null,
  tools : _,

  // dichotomy

  is, /* qqq : cover please */
  like,
  // lengthOf,

  // maker

  cloneShallow, /* qqq : cover */
  make, /* qqq : cover */
  makeEmpty, /* qqq : cover */
  makeUndefined, /* qqq : cover */

  // meta

  namespaceForContainer,
  namespaceForEntity,
  _functor_functor,

}

//

_.container = Self;

Object.assign( Self, ContainerExtension );

// --
// extend tools
// --

let ToolsExtension =
{

  containerIs : is.bind( _.container ),
  containerLike : like.bind( _.container ),
  // containerLengthOf : lengthOf,

}

//

Object.assign( _, ToolsExtension );

})();
