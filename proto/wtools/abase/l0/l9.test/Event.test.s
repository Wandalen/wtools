( function _l0_l9_Event_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

// --
// chain
// --

function chainIs( test )
{
  test.case = 'without arguments';
  var got = _.event.chainIs();
  test.identical( got, false );

  test.case = 'src - null';
  var got = _.event.chainIs( null );
  test.identical( got, false );

  test.case = 'src - string';
  var got = _.event.chainIs( 'begin' );
  test.identical( got, false );

  test.case = 'src - array of strings';
  var got = _.event.chainIs([ 'begin', 'end' ]);
  test.identical( got, false );

  test.case = 'src - object with field `chain`';
  var src = Object.create( null );
  src.chain = [ 'begin', 'end' ];
  var got = _.event.chainIs( src );
  test.identical( got, false );

  test.case = 'src - instance of class with field `chain`';
  function Chain()
  {
    this.chain = arguments;
    return this;
  }
  var src = new Chain( 'begin', 'end' );
  var got = _.event.chainIs( src );
  test.identical( got, false );

  test.case = 'src - instance of _.event.Name';
  var got = _.event.chainIs( _.event.Name( 'begin' ) );
  test.identical( got, false );

  test.case = 'src - instance of _.event.Chain';
  var got = _.event.chainIs( _.event.Chain( 'begin' ) );
  test.identical( got, true );
}

//

function Chain( test )
{
  test.case = 'single string';
  var got = _.event.Chain( 'begin' );
  test.true( _.event.chainIs( got ) );
  test.true( _.longIs( got.chain ) );
  test.identical( got.chain.length, 1 );
  test.true( _.event.nameIs( got.chain[ 0 ] ) );
  test.identical( got.chain[ 0 ].value, 'begin' );

  test.case = 'single Name';
  var name = _.event.Name( 'begin' );
  var got = _.event.Chain( name );
  test.true( _.event.chainIs( got ) );
  test.true( _.longIs( got.chain ) );
  test.identical( got.chain.length, 1 );
  test.identical( got.chain[ 0 ], name );

  test.case = 'single Chain';
  var name = _.event.Name( 'begin' );
  var chain = _.event.Chain( name, 'end' );
  var got = _.event.Chain( chain );
  test.true( _.event.chainIs( got ) );
  test.true( got === chain );
  test.true( _.longIs( got.chain ) );
  test.identical( got.chain.length, 2 );
  test.identical( got.chain[ 0 ], name );
  test.true( _.event.nameIs( got.chain[ 1 ] ) );
  test.identical( got.chain[ 1 ].value, 'end' );

  /* */

  test.case = 'a few strings';
  var got = _.event.Chain( 'begin', 'end', 'error' );
  test.true( _.event.chainIs( got ) );
  test.true( _.longIs( got.chain ) );
  test.identical( got.chain.length, 3 );
  test.true( _.event.nameIs( got.chain[ 0 ] ) );
  test.identical( got.chain[ 0 ].value, 'begin' );
  test.true( _.event.nameIs( got.chain[ 1 ] ) );
  test.identical( got.chain[ 1 ].value, 'end' );
  test.true( _.event.nameIs( got.chain[ 2 ] ) );
  test.identical( got.chain[ 2 ].value, 'error' );

  test.case = 'a few Names';
  var name1 = _.event.Name( 'begin' );
  var name2 = _.event.Name( 'end' );
  var name3 = _.event.Name( 'error' );
  var got = _.event.Chain( name1, name2, name3 );
  test.true( _.event.chainIs( got ) );
  test.true( _.longIs( got.chain ) );
  test.identical( got.chain.length, 3 );
  test.equivalent( got.chain, [ name1, name2, name3 ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.event.Chain() );

  test.case = 'wrong type of element';
  test.shouldThrowErrorSync( () => _.event.Chain( null ) );
  test.shouldThrowErrorSync( () => _.event.Chain( 'begin', _.event.Name( 'err' ), undefined ) );

  test.case = 'first argument is a Chain, arguments.length > 1';
  test.shouldThrowErrorSync( () => _.event.Chain( _.event.Chain( 'begin' ), 'end' ) );
}

// --
// event
// --

function on( test )
{
  var self = this;

  /* - */

  test.open( 'option first - 0' );

  test.case = 'no callback for events';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'single callback for single event, single event is given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  /* */

  test.case = 'single callback for single event, a few events are given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, 1 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  /* */

  test.case = 'single callback for each events in event handler, a few events are given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var got = _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, 1 ] );
  _.event.eventGive( ehandler, 'event2' );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1, -2, -3 ] );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  /* */

  test.case = 'several events handler with similar events, events are given in second handler';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var ehandler2 =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } } );
  _.event.eventGive( ehandler2, 'event' );
  _.event.eventGive( ehandler2, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler2, 'event2' );
  _.event.eventGive( ehandler2, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'event handler has a few handlers for different events - once and regular';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event2' : onEvent2 } } );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, 1 ] );
  _.event.eventGive( ehandler, 'event2' );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1, -2 ] );

  test.case = 'event handler has a few handlers for single event - once and regular';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, 2 ] );

  test.close( 'option first - 0' );

  /* - */

  test.open( 'option first - 1' );

  test.case = 'callback for once added before other callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent2 }, 'first' : 1 } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ -0, 1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ -0, 1, 2 ] );

  /* */

  test.case = 'callback for once added after other callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 }, 'first' : 1 } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ -0, 1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ -0, 1, -2 ] );

  test.close( 'option first - 1' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.event.on() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.event.on( { events : { begin : [] } } ) );

  test.case = 'wrong type of ehandler';
  test.shouldThrowErrorSync( () => _.event.on( 'wrong', { callbackMap : { begin : () => true } } ) );

  test.case = 'wrong type of ehandler.events';
  test.shouldThrowErrorSync( () => _.event.on( { events : null }, { callbackMap : { begin : () => true } } ) );

  test.case = 'wrong type of options map o';
  test.shouldThrowErrorSync( () => _.event.on( { events : { begin : [] } }, 'wrong' ) );

  test.case = 'extra options in options map o';
  test.shouldThrowErrorSync( () => _.event.on( { events : { begin : [] } }, { wrong : {} } ) );

  test.case = 'not known event in callbackMap';
  test.shouldThrowErrorSync( () =>
  {
    _.event.on( { events : { begin : [] } }, { callbackMap : { unknown : () => 'unknown' } } );
  });
}

//

function onCheckDescriptor( test )
{
  test.case = 'descriptor, check fields, not used method off and properties';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.on( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1 ] );

  /* */

  test.case = 'descriptor, use method off without arguments';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.on( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );

  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event2.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'descriptor, set property enabled to false and call off';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.on( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );

  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event.enabled = false;
  descriptor.event.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event2.enabled = false;
  descriptor.event2.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'descriptor, set property enabled to false';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.on( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );

  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event.enabled = false;
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event2.enabled = false;
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
}

//

function onWithChain( test )
{
  test.open( 'with string names' );

  test.case = 'chain with single step';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ onEvent ] } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, 1 ] );
  test.identical( ehandler.events.event[ 0 ].native, onEvent );

  /* */

  test.case = 'chain with two steps';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );

  /* */

  test.case = 'chain with three steps';
  var ehandler = { events : { 'event' : [], 'event2' : [], 'event3' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ 'event3', 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );

  test.close( 'with string names' );

  /* - */

  test.open( 'with instances of Name' );

  test.case = 'chain with two steps';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ _.event.Name( 'event2' ), onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );

  /* */

  test.case = 'chain with three steps';
  var ehandler = { events : { 'event' : [], 'event2' : [], 'event3' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : [ _.event.Name( 'event3' ), _.event.Name( 'event2' ), onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, 1 ] );
  test.identical( ehandler.events.event2[ 0 ].native, onEvent );

  test.close( 'with instances of Name' );
}

//

function onCallWithHeadRoutine( test )
{
  test.case = 'head calls with options map';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  var o = _.event.on.head( _.event.on, [ { 'callbackMap' : { 'event' : onEvent } } ] );
  _.event.on( ehandler, o );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, 1 ] );

  test.case = 'head calls with chain and callback';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  var chain = _.event.Chain( 'event2', 'event' );
  var o = _.event.on.head( _.event.on, [ chain, onEvent ] )
  _.event.on( ehandler, o );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );

  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
}

//

function once( test )
{
  var self = this;

  /* - */

  test.open( 'option first - 0' );

  test.case = 'no callback for events';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'single callback for single event, single event is given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'single callback for single event, a few events are given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'single callback for each events in event handler, a few events are given';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1 ] );

  /* */

  test.case = 'several events handler with similar events, events are given in second handler';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var ehandler2 =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } } );
  _.event.eventGive( ehandler2, 'event' );
  _.event.eventGive( ehandler2, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler2, 'event2' );
  _.event.eventGive( ehandler2, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'event handler has a few handlers for different events - once and regular';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event2' : onEvent2 } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1, -2 ] );

  test.case = 'event handler has a few handlers for single event - once and regular';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, -2 ] );

  test.close( 'option first - 0' );

  /* - */

  test.open( 'option first - 1' );

  test.case = 'callback for once added before other callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent }, 'first' : 1 } );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, -2 ] );

  /* */

  test.case = 'callback for once added after other callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent }, 'first' : 1 } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, -2 ] );

  test.close( 'option first - 1' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.event.once() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.event.once( { events : { begin : [] } } ) );

  test.case = 'wrong type of ehandler';
  test.shouldThrowErrorSync( () => _.event.once( 'wrong', { callbackMap : { begin : () => true } } ) );

  test.case = 'wrong type of ehandler.events';
  test.shouldThrowErrorSync( () => _.event.once( { events : null }, { callbackMap : { begin : () => true } } ) );

  test.case = 'wrong type of options map o';
  test.shouldThrowErrorSync( () => _.event.once( { events : { begin : [] } }, 'wrong' ) );

  test.case = 'extra options in options map o';
  test.shouldThrowErrorSync( () => _.event.once( { events : { begin : [] } }, { wrong : {} } ) );

  test.case = 'not known event in callbackMap';
  test.shouldThrowErrorSync( () =>
  {
    _.event.once( { events : { begin : [] } }, { callbackMap : { unknown : () => 'unknown' } } );
  });
}

//

function onceCheckDescriptor( test )
{
  test.case = 'descriptor, check fields, not used method off and properties';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.once( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1 ] );

  /* */

  test.case = 'descriptor, use method off without arguments';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.once( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );

  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event2.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'descriptor, set property enabled to false and call off';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.once( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );

  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event.enabled = false;
  descriptor.event.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event2.enabled = false;
  descriptor.event2.off();
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.false( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'descriptor, set property enabled to false';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  var callbackMap = { 'callbackMap' : { 'event' : onEvent, 'event2' : onEvent2 } };
  var descriptor = _.event.once( ehandler, callbackMap );

  test.identical( _.props.keys( descriptor ), [ 'event', 'event2' ] );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event.enabled, true );
  test.identical( descriptor.event.first, 0 );
  test.equivalent( descriptor.event.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event.off ) );
  test.identical( _.props.keys( descriptor.event ), [ 'off', 'enabled', 'first', 'callbackMap' ] );
  test.identical( descriptor.event2.enabled, true );
  test.identical( descriptor.event2.first, 0 );
  test.equivalent( descriptor.event2.callbackMap, callbackMap.callbackMap );
  test.true( _.routine.is( descriptor.event2.off ) );

  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event.enabled = false;
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );

  descriptor.event2.enabled = false;
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } ) );
  test.true( _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } ) );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
}

//

function onceWithChain( test )
{
  test.open( 'with string names' );

  test.case = 'chain with single step';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ onEvent ] } } );
  test.identical( ehandler.events.event[ 0 ].native, onEvent );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event, [] );

  /* */

  test.case = 'chain with few steps';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.true( _.routine.is( ehandler.events.event2[ 0 ] ) );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );

  /* */

  test.case = 'chain with three steps';
  var ehandler = { events : { 'event' : [], 'event2' : [], 'event3' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ 'event3', 'event2', onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.true( _.routine.is( ehandler.events.event2[ 0 ] ) );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );

  test.close( 'with string names' );

  /* - */

  test.open( 'with instances of Name' );

  test.case = 'chain with few steps';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ _.event.Name( 'event2' ), onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.true( _.routine.is( ehandler.events.event2[ 0 ] ) );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );

  /* */

  test.case = 'chain with three steps';
  var ehandler = { events : { 'event' : [], 'event2' : [], 'event3' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : [ _.event.Name( 'event3' ), _.event.Name( 'event2' ), onEvent ] } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );

  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event3' );
  test.identical( result, [] );
  test.true( _.routine.is( ehandler.events.event2[ 0 ] ) );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0 ] );
  test.identical( ehandler.events.event2, [] );

  test.close( 'with instances of Name' );
}

//

function onceCallWithHeadRoutine( test )
{
  test.case = 'head calls with options map';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  var o = _.event.on.head( _.event.on, [ { 'callbackMap' : { 'event' : onEvent } } ] );
  _.event.once( ehandler, o );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );

  test.case = 'head calls with chain and callback';
  var ehandler = { events : { 'event' : [], 'event2' : [] } };
  var result = [];
  var onEvent = () => result.push( result.length );
  var chain = _.event.Chain( 'event2', 'event' );
  var o = _.event.on.head( _.event.on, [ chain, onEvent ] )
  _.event.once( ehandler, o );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [] );

  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
}

//

function off( test )
{
  test.case = 'off all callbacks in event, events not exist';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [] },
  };
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );

  _.event.off( ehandler, { 'callbackMap' : { 'event' : null } } );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );

  /* */

  test.case = 'off all callbacks in event, events exist';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [ onEvent, onEvent2 ] },
  };
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  _.event.off( ehandler, { 'callbackMap' : { 'event' : null } } );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );

  /* */

  test.case = 'off individual callback from event';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [ onEvent, onEvent2 ] },
  };
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  _.event.off( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  /* */

  test.case = 'off individual callback added by routine on';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [] },
  };
  _.event.on( ehandler, { callbackMap : { 'event' : onEvent } } )
  _.event.on( ehandler, { callbackMap : { 'event' : onEvent2 } } )
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  _.event.off( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  /* */

  test.case = 'off individual callback added by routine once';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [] },
  };
  _.event.once( ehandler, { callbackMap : { 'event' : onEvent } } )
  _.event.once( ehandler, { callbackMap : { 'event' : onEvent2 } } )
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  _.event.off( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.event.off() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.event.off({ events : { event : [] } }) );

  test.case = 'extra arguments';
  var onEvent = () => true;
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( { events : { event : [ onEvent ] } }, { callbackMap : { event : onEvent } }, { extra : true } );
  });

  test.case = 'wrong type of ehandler';
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( [ { events : { event : [ onEvent ] } } ], { callbackMap : { event : onEvent } } );
  });

  test.case = 'wrong type of ehandler.events';
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( { events : [ { event : [ onEvent ] } ] }, { callbackMap : { event : onEvent } } );
  });

  test.case = 'unknown event';
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( { events : { event : [ onEvent ] } }, { callbackMap : { e1 : onEvent } } );
  });

  test.case = 'event added twice and try to remove once strictly';
  var onEvent = () => true;
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( { events : { event : [ onEvent, onEvent ] } }, { callbackMap : { event : onEvent } } );
  });

  test.case = 'try to remove not existed callback';
  var onEvent = () => true;
  var onEvent2 = () => false;
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( { events : { event : [ onEvent, onEvent ] } }, { callbackMap : { event : onEvent2 } } );
  });

  test.case = 'event added twice by routine on, try to remove once strictly';
  var onEvent = () => true;
  var handler = { events : { event : [] } };
  test.shouldThrowErrorSync( () =>
  {
    _.event.on( handler, { callbackMap : { event : onEvent } } );
    _.event.on( handler, { callbackMap : { event : onEvent } } );
    _.event.off( handler, { callbackMap : { event : onEvent } } );
  });

  test.case = 'event added twice by routine on, try to remove once strictly';
  var onEvent = () => true;
  var handler = { events : { event : [] } };
  test.shouldThrowErrorSync( () =>
  {
    _.event.once( handler, { callbackMap : { event : onEvent } } );
    _.event.once( handler, { callbackMap : { event : onEvent } } );
    _.event.off( handler, { callbackMap : { event : onEvent } } );
  });

  test.case = 'event added twice by routine on and once, try to remove once strictly';
  var onEvent = () => true;
  var handler = { events : { event : [] } };
  test.shouldThrowErrorSync( () =>
  {
    _.event.on( handler, { callbackMap : { event : onEvent } } );
    _.event.once( handler, { callbackMap : { event : onEvent } } );
    _.event.off( handler, { callbackMap : { event : onEvent } } );
  });

  test.case = 'wrong type of options map';
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( { events : { event : [ onEvent ] } }, [ { callbackMap : { event : onEvent } } ] );
  });

  test.case = 'wrong type of o.callbackMap';
  test.shouldThrowErrorSync( () =>
  {
    _.event.off( { events : { event : [ onEvent ] } }, { callbackMap : [ { event : onEvent } ] } );
  });
}

//

function eventHasHandler( test )
{
  test.case = 'handler has no callbacks';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [] },
  };
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );

  /* */

  test.case = 'handler has single callback for event';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [ onEvent ] },
  };
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );

  /* */

  test.case = 'handler has several callbacks for event';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [ onEvent, onEvent2 ] },
  };
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, true );

  /* */

  test.case = 'several events in event handler, different callbacks for each event';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [ onEvent ], 'event2' : [ onEvent2 ] },
  };
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent } );
  test.identical( got, false );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event2', eventHandler : onEvent2 } );
  test.identical( got, true );

  /* */

  test.case = 'event added by routine on';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [] },
  };
  _.event.on( ehandler, { callbackMap : { event : onEvent } } )
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );

  /* */

  test.case = 'event added by routine once';
  var onEvent = () => 'true';
  var onEvent2 = () => 'false';
  var ehandler =
  {
    events : { 'event' : [] },
  };
  _.event.once( ehandler, { callbackMap : { event : onEvent } } )
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent } );
  test.identical( got, true );
  var got = _.event.eventHasHandler( ehandler, { eventName : 'event', eventHandler : onEvent2 } );
  test.identical( got, false );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.eventHasHandler() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.eventHasHandler({ events : { event : [] } }) );

  test.case = 'extra arguments';
  var onEvent = () => true;
  test.shouldThrowErrorSync( () =>
  {
    _.eventHasHandler( { events : { event : [] } }, { eventName : 'event', eventHandler : onEvent }, { extra : {} } );
  });

  test.case = 'wrong type of ehandler';
  var onEvent = () => true;
  var handler = { events : { event : [] } };
  test.shouldThrowErrorSync( () =>
  {
    _.eventHasHandler( [ handler ], { eventName : 'event', eventHandler : onEvent } );
  });

  test.case = 'wrong type of ehandler.events';
  var onEvent = () => true;
  test.shouldThrowErrorSync( () =>
  {
    _.eventHasHandler( { events : [ { event : [] } ] }, { eventName : 'event', eventHandler : onEvent } );
  });

  test.case = 'unknown event';
  var onEvent = () => true;
  test.shouldThrowErrorSync( () =>
  {
    _.eventHasHandler( { events : { event : [] } }, { eventName : 'e1', eventHandler : onEvent } );
  });

  test.case = 'unknown property in options map';
  var onEvent = () => true;
  test.shouldThrowErrorSync( () =>
  {
    _.eventHasHandler( { events : { event : [] } }, { eventName : 'event', eventHandler : onEvent, unknown : true } );
  });

  test.case = 'wrong type of o.eventName';
  var onEvent = () => true;
  test.shouldThrowErrorSync( () =>
  {
    _.eventHasHandler( { events : { event : [] } }, { eventName : [ 'event' ], eventHandler : onEvent } );
  });

  test.case = 'wrong type of o.eventHandler';
  test.shouldThrowErrorSync( () =>
  {
    _.eventHasHandler( { events : { event : [] } }, { eventName : 'event', eventHandler : 'onEvent' } );
  });
}

//

function eventGive( test )
{
  test.open( 'event type - on' );

  test.case = 'give event for event without callbacks';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'give event for event with single callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, 1 ] );

  /* */

  test.case = 'give event for event with several callbacks for event';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1, 2, -3 ] );

  /* */

  test.case = 'give event for event without callbacks';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, { event : 'event2' } );
  test.identical( result, [] );
  _.event.eventGive( ehandler, { event : 'event2' } );
  test.identical( result, [] );

  /* */

  test.case = 'give event for event with single callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0, 1 ] );

  /* */

  test.case = 'give event for event with several callbacks for event';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, { event : 'event2' } );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0, -1, 2, -3 ] );

  /* */

  test.case = 'give event, use default args in callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = ( o ) => result.push( o.event );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 'event' ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 'event', 'event' ] );

  /* */

  test.case = 'give event, use not default args in callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = ( e1, e2 ) => result.push( e1, e2 );
  _.event.on( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, { event : 'event', args : [ 1, 2 ] } );
  test.identical( result, [ 1, 2 ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 1, 2, { event : 'event' }, undefined ] );

  test.close( 'event type - on' );

  /* - */

  test.open( 'event type - once' );

  test.case = 'give event for event without callbacks';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [] );

  /* */

  test.case = 'give event for event with single callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'give event for event with several callbacks for event';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event2' );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 0, -1 ] );

  /* */

  test.case = 'give event for event without callbacks';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, { event : 'event2' } );
  test.identical( result, [] );
  _.event.eventGive( ehandler, { event : 'event2' } );
  test.identical( result, [] );

  /* */

  test.case = 'give event for event with single callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0 ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0 ] );

  /* */

  test.case = 'give event for event with several callbacks for event';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = () => result.push( result.length );
  var onEvent2 = () => result.push( -1 * result.length );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent2 } } );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, { event : 'event2' } );
  test.identical( result, [ 0, -1 ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 0, -1 ] );

  /* */

  test.case = 'give event, use default args in callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = ( o ) => result.push( o.event );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, 'event' );
  test.identical( result, [ 'event' ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 'event' ] );

  /* */

  test.case = 'give event, use not default args in callback';
  var ehandler =
  {
    events : { 'event' : [], 'event2' : [] },
  };
  var result = [];
  var onEvent = ( e1, e2 ) => result.push( e1, e2 );
  _.event.once( ehandler, { 'callbackMap' : { 'event' : onEvent } } );
  _.event.eventGive( ehandler, { event : 'event', args : [ 1, 2 ] } );
  test.identical( result, [ 1, 2 ] );
  _.event.eventGive( ehandler, { event : 'event' } );
  test.identical( result, [ 1, 2 ] );

  test.close( 'event type - once' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.event.eventGive() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.event.eventGive({ events : { 'event' : [] } }) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.event.eventGive( { events : { 'event' : [] } }, 'event', 'extra' ) );

  test.case = 'unknown event in event handler';
  test.shouldThrowErrorSync( () => _.event.eventGive( { events : { 'event' : [] } }, 'event2' ) );

  test.case = 'wrong type of o.args';
  test.shouldThrowErrorSync( () => _.event.eventGive( { events : { 'event' : [] } }, { event : 'event', args : 'wrong' } ) );

  test.case = 'callback throws error';
  test.shouldThrowErrorSync( () =>
  {
    var handler = { events : { event : [ () => { throw _.err( 'err' ) } ] } };
    _.event.eventGive( handler, 'event' );
  },
  ( err, arg ) =>
  {
    test.true( _.error.is( err ) );
    test.identical( _.strCount( err.message, 'Error on handing event event\n' ), 1 );
  });
}

// --
// declare
// --

const Proto =
{

  name : 'Tools.Event.l0.l9',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // chain

    chainIs,
    Chain,

    // event

    on,
    onCheckDescriptor,
    onWithChain,
    onCallWithHeadRoutine,

    once,
    onceCheckDescriptor,
    onceWithChain,
    onceCallWithHeadRoutine,

    off,

    eventHasHandler,
    eventGive,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
