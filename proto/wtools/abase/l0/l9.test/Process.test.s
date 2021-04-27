( function _l0_l9_Process_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

//

function onSuiteBegin( test )
{
  let context = this;
  _.process._ehandler.events.event1 = [];
  _.process._ehandler.events.event2 = [];
}

//

function onSuiteEnd( test )
{
  delete _.process._ehandler.events.event1;
  delete _.process._ehandler.events.event2;
}

// --
// events
// --

function onWithArguments( test )
{
  var self = this;

  /* */

  test.case = 'no callback for events';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'single callback for single event, single event is given';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  debugger;
  var got = _.process.on( 'event1', onEvent );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  got.event1.off();

  /* */

  test.case = 'single callback for single event, a few events are given';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.process.on( 'event1', onEvent );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0, 1 ] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  got.event1.off();

  /* */

  test.case = 'single callback for each events in event handler, a few events are given';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.process.on( 'event1', onEvent );
  var got2 = _.process.on( 'event2', onEvent2 );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0, 1 ] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0, 1, -2, -3 ] );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  got.event1.off();
  got2.event2.off();
}

//

function onWithOptionsMap( test )
{
  var self = this;

  /* - */

  test.open( 'option first - 0' );

  test.case = 'no callback for events';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'single callback for single event, single event is given';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.process.on({ 'callbackMap' : { 'event1' : onEvent } });
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  got.event1.off();

  /* */

  test.case = 'single callback for single event, a few events are given';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.process.on({ 'callbackMap' : { 'event1' : onEvent } } );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0, 1 ] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  got.event1.off();

  /* */

  test.case = 'single callback for each events in event handler, a few events are given';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.process.on({ 'callbackMap' : { 'event1' : onEvent, 'event2' : onEvent2 } });
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ 0, 1 ] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0, 1, -2, -3 ] );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  got.event1.off();
  got.event2.off();

  test.close( 'option first - 0' );

  /* - */

  test.open( 'option first - 1' );

  test.case = 'callback added before other callback';
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.process.on({ 'callbackMap' : { 'event1' : onEvent } });
  var got2 = _.process.on({ 'callbackMap' : { 'event1' : onEvent2 }, 'first' : 1 });
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ -0, 1 ] );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ -0, 1, -2, 3 ] );
  got.event1.off();
  got2.event1.off();

  /* */

  test.case = 'callback added after other callback';

  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.process.on({ 'callbackMap' : { 'event1' : onEvent2 }, 'first' : 1 });
  var got2 = _.process.on({ 'callbackMap' : { 'event1' : onEvent } });
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ -0, 1 ] );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [ -0, 1, -2, 3 ] );

  test.close( 'option first - 1' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.process.on() );

  test.case = 'wrong type of callback';
  test.shouldThrowErrorSync( () => _.process.on( 'event1', {} ) );

  test.case = 'wrong type of event name';
  test.shouldThrowErrorSync( () => _.process.on( [], () => 'str' ) );

  test.case = 'wrong type of options map o';
  test.shouldThrowErrorSync( () => _.process.on( 'wrong' ) );

  test.case = 'extra options in options map o';
  test.shouldThrowErrorSync( () => _.process.on({ callbackMap : {}, wrong : {} }) );

  test.case = 'not known event in callbackMap';
  test.shouldThrowErrorSync( () => _.process.on({ callbackMap : { unknown : () => 'unknown' } }) );
}

//

function onWithChain( test )
{
  var self = this;

  /* */

  test.case = 'call with arguments';
  var result = [];
  var onEvent = () => result.push( result.length );
  var got = _.process.on( _.event.Chain( 'event1', 'event2' ), onEvent );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent } ) );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent } ) );
  _.event.off( _.process._ehandler, { callbackMap : { event2 : null } } );

  /* */

  test.case = 'call with options map';
  var result = [];
  var onEvent = () => result.push( result.length );
  var got = _.process.on({ callbackMap : { event1 : [ _.event.Name( 'event2' ), onEvent ] } });
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent } ) );
  _.event.eventGive( _.process._ehandler, 'event1' );
  test.identical( result, [] );
  _.event.eventGive( _.process._ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.false( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event2', eventHandler : onEvent } ) );
  _.event.off( _.process._ehandler, { callbackMap : { event2 : null } } );
}

//

function onCheckDescriptor( test )
{
  var self = this;

  /* */

  test.case = 'call with arguments';
  var result = [];
  var onEvent = () => result.push( result.length );
  var descriptor = _.process.on( 'event1', onEvent );
  test.identical( _.props.keys( descriptor ), [ 'event1' ] );
  test.identical( _.props.keys( descriptor.event1 ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event1.enabled, true );
  test.identical( descriptor.event1.first, 0 );
  test.equivalent( descriptor.event1.callbackMap, { event1 : onEvent } );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  descriptor.event1.off();

  /* */

  test.case = 'call with arguments';
  var result = [];
  var onEvent = () => result.push( result.length );
  var descriptor = _.process.on({ callbackMap : { 'event1' : onEvent } });
  test.identical( _.props.keys( descriptor ), [ 'event1' ] );
  test.identical( _.props.keys( descriptor.event1 ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event1.enabled, true );
  test.identical( descriptor.event1.first, 0 );
  test.equivalent( descriptor.event1.callbackMap, { event1 : onEvent } );
  test.true( _.event.eventHasHandler( _.process._ehandler, { eventName : 'event1', eventHandler : onEvent } ) );
  descriptor.event1.off();
}

//

function ready( test )
{
  let t1 = 100;
  let ready =  new __.Consequence().take( null );

  /* */

  ready.then( () =>
  {
    test.case = 'without arguments, must not throw error, no side effects only minimal delay';
    _.process.ready();
    return null;
  });

  /* */

  ready.then( () =>
  {
    test.case = 'only onReady, no timeOut';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready( onReady );

    return __.time.out( t1, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'timeOut and onReady, onReady - null';
    var arr = [];
    _.process.ready( t1, null );
    test.identical( arr, [] );

    return __.time.out( t1 * 2, () =>
    {
      test.identical( arr, [] );
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'timeOut and onReady';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready( t1, onReady );
    test.identical( arr, [] );

    return __.time.out( t1 * 2, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  /* */

  ready.then( () =>
  {
    test.case = 'only onReady, no timeOut';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready({ onReady });

    return __.time.out( t1, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  ready.then( () =>
  {
    test.case = 'timeOut and onReady';
    var arr = [];
    var onReady = () => arr.push( 1 );
    _.process.ready({ timeOut : t1, onReady });
    test.identical( arr, [] );

    return __.time.out( t1 * 2, () =>
    {
      test.identical( arr, [ 1 ] );
      return null;
    });
  });

  /* - */

  if( !Config.debug )
  return;

  test.case = 'single arg is not a routine';
  test.shouldThrowErrorSync( () => _.process.ready( 1 ) );

  test.case = 'wrong type of timeOut';
  test.shouldThrowErrorSync( () => _.process.ready( 'wrong', () => 'ready' ) );
  test.shouldThrowErrorSync( () => _.process.ready( 10.5, () => 'ready' ) );
  test.shouldThrowErrorSync( () => _.process.ready( Infinity, () => 'ready' ) );

  test.case = 'wrong type of onReady';
  test.shouldThrowErrorSync( () => _.process.ready( 10, 'wrong' ) );

  test.case = 'not allowed options procedure';
  test.shouldThrowErrorSync( () => _.process.ready({ timeOut : 10, procedure : 'procedure', onReady : () => 'ready' }) );

  return ready;
}

// --
// declare
// --

const Proto =
{

  name : 'Tools.Process',
  silencing : 1,
  enabled : 1,

  onSuiteBegin,
  onSuiteEnd,

  tests :
  {

    // events

    onWithArguments,
    onWithOptionsMap,
    onWithChain,
    onCheckDescriptor,

    //

    ready,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();

