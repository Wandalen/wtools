( function _l0_l9_Routine_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// test
// --

function composeBasic( test )
{

  /* - */

  test.case = 'empty';

  var counter = 0;
  var routines = [];
  var composition = _.routine.s.compose( routines );
  var got = composition( 1, 2, 3 );
  var expected = [];
  test.identical( got, expected );
  test.identical( counter, 0 );

  /* - */

  test.open( 'unrolling:1' )

  /* */

  test.case = 'without chainer';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 128 ];
  test.identical( got, expected );
  test.identical( counter, 128 );

  /* */

  test.case = 'with chainer';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  /* */

  test.case = 'with chainer and break';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _break, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, _.dont ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  /* */

  test.close( 'unrolling:1' )

  /* - */

  test.open( 'unrolling:0' )

  /* */

  test.case = 'without chainer';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ], 128 ];
  test.identical( got, expected );
  test.identical( counter, 128 );

  /* */

  test.case = 'with chainer';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ], 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  /* */

  test.case = 'with chainer and break';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, _break, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ], _.dont ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  /* */

  test.close( 'unrolling:0' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAll() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){}, function(){} ) );

  /* - */

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function routineNotUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    // return _.arrayAppend_( result, counter );
    let result = _.arrayAppendArrays( null, arguments );
    return _.arrayAppend( result, counter );
  }

  function r2()
  {
    counter += 100;
    debugger;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _break()
  {
    return _.dont;
  }

  function chainer1( /* args, result, o, k */ )
  {
    let args = arguments[ 0 ];
    let result = arguments[ 1 ];
    let o = arguments[ 2 ];
    let k = arguments[ 3 ];
    debugger;
    if( result !== _.dont )
    return _.unroll.as( result );
    return result;
  }

}

//

function composeAll( test )
{

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function routineNotUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    // return _.arrayAppend_( null, arguments, counter );
    let result = _.arrayAppendArrays( null, arguments );
    return _.arrayAppend( result, counter );
  }

  function r2()
  {
    counter += 100;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _nothing()
  {
    return undefined;
  }

  function _dont()
  {
    return _.dont;
  }

  test.case = 'with nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, r2, null ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 128 ];
  test.identical( got, expected );
  test.identical( counter, 128 );

  test.case = 'last nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16 ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'not unrolling and last nothing';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ] ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'with nothing and dont';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, _dont, null, r2, null ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = false;
  test.identical( got, expected );
  test.identical( counter, 16 );

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAll() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){} ) );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){}, function(){} ) );

}

//

function composeAllReturningLast( test )
{

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function routineNotUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    // return _.arrayAppend_( null, arguments, counter );
    let result = _.arrayAppendArrays( null, arguments );
    return _.arrayAppend( result, counter );
  }

  function r2()
  {
    counter += 100;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _nothing()
  {
    return undefined;
  }

  function _dont()
  {
    return _.dont;
  }

  test.case = 'with nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, r2, null ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = 128;
  test.identical( got, expected );
  test.identical( counter, 128 );

  test.case = 'last nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = 16;
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'not unrolling and last nothing';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16 ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'with nothing and dont';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, _dont, null, r2, null ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = _.dont;
  test.identical( got, expected );
  test.identical( counter, 16 );

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAllReturningLast() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAllReturningLast( routines, function(){} ) );
  test.shouldThrowErrorSync( () => _.routine.s.composeAllReturningLast( routines, function(){}, function(){} ) );

}

//

function routinesChain( test )
{

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function r2()
  {
    counter += 100;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _break()
  {
    return _.dont;
  }

  function dontInclude()
  {
    return undefined;
  }

  /* */

  test.case = 'without break';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, r2, null ];
  var composition = _.routine.s.chain( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  /* */

  test.case = 'with break';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _break, null, r2, null ];
  var composition = _.routine.s.chain( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16 ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  /* */

  test.case = 'with dont include';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, dontInclude, null, r2, null ];
  var composition = _.routine.s.chain( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAll() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){} ) );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){}, function(){} ) );

}

//

function er( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }
    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null };

  /* - */

  test.open( 'check work of erhead' );

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null } );

  var got = gotRoutine();
  test.identical( got, { arg : null } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  test.close( 'check work of erhead' );

  /* - */

  test.case = 'routine - with field erhead, erhead - routine, routine should rewrite field';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  var erhead2 = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg2' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine, erhead2 );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg2' } );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, head return not a Map, not an Unroll';
  var head = () => 'head';
  var routine = _.routine.unite( head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, undefined );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, body expects Unroll';
  var head = ( r, a ) => { return _.unroll.make( a ) };
  var body = ( o ) => o;
  body.defaults = { arg : null };
  var routine = _.routine.unite( head, body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine({ arg2 : 'arg2' });
  test.identical( got, { arg2 : 'arg2' } );

  test.case = 'erhead returns map with undefined';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : undefined } };
  var got = _.routine.er( routine, erhead );
  var gotRoutine = got.er();
  test.identical( gotRoutine.defaults, { arg : undefined } );
  var got = gotRoutine();
  test.identical( got, { arg : undefined } );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.routine.er() );

  test.case = 'extra arguments';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.er( routine, ( r, a ) => a[ 0 ], 'extra' ) );

  test.case = 'wrong type of routine';
  test.shouldThrowErrorSync( () => _.routine.er( 'wrong', ( r, a ) => a[ 0 ] ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.er( routine, 'wrong' ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  routine.erhead = 'wrong';
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine without defaults, head and body';
  var routine = () => 'routine';
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine, has fields, head has wrong type';
  var routine = () => 'routine';
  routine.head = 'wrong';
  routine.body = () => 'body';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine, has fields, body has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine, has fields, defaults has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = null;
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'functor should fail because erhead returns no map';
  var routine = _.routine.unite( test_head, test_body );
  var got = _.routine.er( routine, ( r, a ) => a );
  test.shouldThrowErrorSync( () => got.er() );

}

//

function erShouldSupplementNotDefinedFields( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }

    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null, arg2 : 'arg2' };

  /* - */

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null, arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : null, arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );
}

//

function erMake( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }

    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null };

  /* - */

  test.open( 'check work of erhead' );

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null } );

  var got = gotRoutine();
  test.identical( got, { arg : null } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  test.close( 'check work of erhead' );

  /* - */

  test.case = 'routine - with field erhead, erhead - routine, routine should rewrite field';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  var erhead2 = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg2' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine, erhead2 );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg2' } );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, head return not a Map, not an Unroll';
  var head = () => 'head';
  var routine = _.routine.unite( head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, undefined );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, body expects Unroll';
  var head = ( r, a ) => { return _.unroll.make( a ) };
  var body = ( o ) => o;
  body.defaults = { arg : null };
  var routine = _.routine.unite( head, body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine({ arg2 : 'arg2' });
  test.identical( got, { arg2 : 'arg2' } );

  /* */

  test.case = 'erhead returns map with undefined';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : undefined } };
  var got = _.routine.er( routine, erhead );
  var gotRoutine = got.er();
  test.identical( gotRoutine.defaults, { arg : undefined } );
  var got = gotRoutine();
  test.identical( got, { arg : undefined } );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.routine.erMake() );

  test.case = 'extra arguments';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.erMake( routine, ( r, a ) => a[ 0 ], 'extra' ) );

  test.case = 'wrong type of routine';
  test.shouldThrowErrorSync( () => _.routine.erMake( 'wrong', ( r, a ) => a[ 0 ] ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.erMake( routine, 'wrong' ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  routine.erhead = 'wrong';
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine without defaults, head and body';
  var routine = () => 'routine';
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine, has fields, head has wrong type';
  var routine = () => 'routine';
  routine.head = 'wrong';
  routine.body = () => 'body';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine, has fields, body has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine, has fields, defaults has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = null;
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'functor should fail because erhead returns no map';
  var routine = _.routine.unite( test_head, test_body );
  var gotFunctor = _.routine.erMake( routine, ( r, a ) => a );
  test.shouldThrowErrorSync( () => gotFunctor() );

}

//

function erMakeShouldSupplementNotDefinedFields( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }

    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null, arg2 : 'arg2' };

  /* - */

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null, arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : null, arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );
}

// --
//
// --

const Proto =
{

  name : 'Tools.Routine.l0.l9',
  silencing : 1,

  tests :
  {

    /* xxx : deprecate */
    composeBasic,
    composeAll,
    composeAllReturningLast,
    routinesChain,

    er,
    erShouldSupplementNotDefinedFields,
    erMake,
    erMakeShouldSupplementNotDefinedFields,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
