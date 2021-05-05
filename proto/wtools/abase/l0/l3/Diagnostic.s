( function _l3_Diagnostic_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

// --
// implementation
// --
//

function objectMake( o )
{
  let result;

  _.assert( arguments.length === 1 );
  _.aux.supplement( o, objectMake.defaults );

  if( o.countable === null )
  o.countable = true;
  if( o.vector === null )
  o.vector = _.number.is( o.length ) ? true : false;

  countableConstructorPure.prototype = Object.create( null );

  let constructor = o.pure ? countableConstructorPure : countableConstructorPolluted;

  if( o.withConstructor )
  {
    countableConstructorPure.prototype.constructor = countableConstructorPure;
    _.assert( countableConstructorPolluted.prototype.constructor = countableConstructorPolluted );
  }
  else
  {
    delete countableConstructorPolluted.prototype.constructor;
  }

  _.assert( countableConstructorPolluted.prototype !== Object.prototype );
  _.assert( countableConstructorPolluted.prototype !== Function.prototype );

  if( o.vector && o.length === undefined )
  {
    _.long.is( o.elements )
    o.length = o.elements.length;
  }

  _.assert( !o.vector || !!o.countable );
  _.assert( !!o.vector === !!_.number.is( o.length ) );

  /* xxx : replace countableMake */

  if( o.new )
  {
    if( o.pure )
    result = new countableConstructorPure( o );
    else
    result = new countableConstructorPolluted( o );
  }
  else
  {
    result = _objectMake( null, o );
  }

  if( o.withOwnConstructor )
  result.constructor = function ownConstructor(){}

  if( !o.basic )
  {
    Object.defineProperty( constructor.prototype, Symbol.toStringTag,
    {
      enumerable : false,
      configurable : false,
      get : TypeNameGet,
    });
  }

  return result;

  /* - */

  function TypeNameGet()
  {
    return 'Custom1';
  }

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructorPure( o )
  {
    return _objectMake( this, o );
  }

  /* */

  function countableConstructorPolluted( o )
  {
    let result = _objectMake( this, o );
    if( !o.withConstructor )
    {
      _.assert( Object.getPrototypeOf( result ) !== Object.prototype );
      // delete Object.getPrototypeOf( result ).constructor;
      _.assert( Object.getPrototypeOf( result ).constructor === Object.prototype.constructor );
    }
    return result
  }

  /* */

  function _objectMake( dst, o )
  {
    if( dst === null )
    if( o.pure )
    dst = Object.create( null );
    else
    dst = {};
    _.props.extend( dst, o );
    if( o.countable )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  /* */

}

objectMake.defaults =
{
  new : 1,
  pure : 0,
  basic : 1,
  countable : null,
  vector : null,
  withOwnConstructor : 0,
  withConstructor : 1,
  elements : null,
}

// --
// declare
// --

let ToolsExtension =
{

}

Object.assign( _, ToolsExtension );

//

let DiagnosticExtension =
{

  objectMake,
  /* qqq : for junior : use _.diagnostic.objectMake() in all tests */

}

Object.assign( _.diagnostic, DiagnosticExtension );

})();
