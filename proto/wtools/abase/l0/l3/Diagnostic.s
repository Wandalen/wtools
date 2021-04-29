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

  countableConstructorPure.prototype = Object.create( null );
  if( o.withConstructor )
  countableConstructorPure.prototype.constructor = countableConstructorPure;

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

  return result;

  /* - */

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
    delete Object.getPrototypeOf( result ).constructor;
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
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  /* */

}

objectMake.defaults =
{
  new : 1,
  pure : 0,
  withIterator : 1,
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
