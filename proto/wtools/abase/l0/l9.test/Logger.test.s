( function _l0_l9_Logger_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
  // _.include( 'wLogger' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

function dichotomy( test )
{

  test.true( !_.logger.is( console ) );
  test.true( _.logger.like( console ) );

  test.true( !_.logger.is( _globals_.testing.logger ) );
  test.true( _.logger.like( _globals_.testing.logger ) );

  test.true( __.logger.is( _globals_.testing.logger ) );
  test.true( __.logger.like( _globals_.testing.logger ) );

}

//

function fromStrictly( test )
{

  /* */

  test.true( _.routineIs( _.logger.fromStrictly ) );

  /* */

  // test.case = 'null'
  // var got = _.logger.fromStrictly( null );
  // test.true( _.logger.is( got ) );
  //
  // /* */
  //
  // test.case = 'false'
  // var got = _.logger.fromStrictly( false );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'true'
  // var got = _.logger.fromStrictly( true );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = '0'
  // var got = _.logger.fromStrictly( 0 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = '1'
  // var got = _.logger.fromStrictly( 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = '2'
  // var got = _.logger.fromStrictly( 2 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 2 );
  //
  // /* */
  //
  // test.case = 'logger'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.fromStrictly( src );
  // test.identical( got, src );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.logger.fromStrictly( [] ) )
  test.shouldThrowErrorSync( () => _.logger.fromStrictly( 'abc' ) )
  test.shouldThrowErrorSync( () => _.logger.fromStrictly( Object.create( null ) ) )
}

//

function maybe( test )
{

  // /* */
  //
  // test.case = 'null'
  // var got = _.logger.maybe( null );
  // test.true( _.logger.is( got ) );

  /* */

  test.case = 'false'
  var got = _.logger.maybe( false );
  test.identical( got, 0 );

  /* */

  // test.case = 'true'
  // var got = _.logger.maybe( true );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );

  /* */

  test.case = '0'
  var got = _.logger.maybe( 0 );
  test.identical( got, 0 );

  // /* */
  //
  // test.case = '1'
  // var got = _.logger.maybe( 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = '2'
  // var got = _.logger.maybe( 2 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 2 );
  //
  // /* */
  //
  // test.case = 'logger'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.maybe( src );
  // test.identical( got, src );

  /* */

  test.case = 'console'
  var src = console;
  var got = _.logger.maybe( console );
  test.identical( got, src );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.logger.maybe( [] ) )
  test.shouldThrowErrorSync( () => _.logger.maybe( 'abc' ) )
  test.shouldThrowErrorSync( () => _.logger.maybe( Object.create( null ) ) )
}

//

function relativeMaybe( test )
{
  /* */

  // test.case = 'src: null, delta:undefined'
  // var got = _.logger.relativeMaybe( null );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: null, delta:0'
  // var got = _.logger.relativeMaybe( null, 0 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: null, delta:1'
  // var got = _.logger.relativeMaybe( null, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 2 );
  //
  // /* */
  //
  // test.case = 'src: null, delta:-1'
  // var got = _.logger.relativeMaybe( null, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: null, delta:logger'
  // var delta = _.logger.fromStrictly( 1 );
  // var got = _.logger.relativeMaybe( null, delta );
  // test.identical( got, delta )
  // test.identical( got.verbosity, 1 )

  /* */

  test.case = 'src: false, delta:undefined'
  var got = _.logger.relativeMaybe( false );
  test.identical( got, 0 );

  /* */

  test.case = 'src: false, delta:0'
  var got = _.logger.relativeMaybe( false, 0 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: false, delta:1'
  // var got = _.logger.relativeMaybe( false, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );

  /* */

  test.case = 'src: false, delta:-1'
  var got = _.logger.relativeMaybe( false, -1 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: false, delta:logger'
  // var delta = _.logger.fromStrictly( 1 );
  // var got = _.logger.relativeMaybe( false, delta );
  // test.identical( got, delta )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: true, delta:undefined'
  // var got = _.logger.relativeMaybe( true );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: true, delta:0'
  // var got = _.logger.relativeMaybe( true, 0 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: true, delta:1'
  // var got = _.logger.relativeMaybe( true, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 2 );
  //
  // /* */
  //
  // test.case = 'src: true, delta:-1'
  // var got = _.logger.relativeMaybe( true, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: true, delta:logger'
  // var delta = _.logger.fromStrictly( 1 );
  // var got = _.logger.relativeMaybe( true, delta );
  // test.identical( got, delta )
  // test.identical( got.verbosity, 1 )

  /* */

  test.case = 'src: zero, delta:undefined'
  var got = _.logger.relativeMaybe( 0 );
  test.identical( got, 0 );

  /* */

  test.case = 'src: zero, delta:0'
  var got = _.logger.relativeMaybe( 0, 0 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: zero, delta:1'
  // var got = _.logger.relativeMaybe( 0, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );

  /* */

  test.case = 'src: zero, delta:-1'
  var got = _.logger.relativeMaybe( 0, -1 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: zero, delta:logger'
  // var delta = _.logger.fromStrictly( 1 );
  // var got = _.logger.relativeMaybe( 0, delta );
  // test.identical( got, delta )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: one, delta:undefined'
  // var got = _.logger.relativeMaybe( 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: one, delta:0'
  // var got = _.logger.relativeMaybe( 1, 0 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: one, delta:1'
  // var got = _.logger.relativeMaybe( 1, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 2 );

  /* */

  test.case = 'src: one, delta:-1'
  var got = _.logger.relativeMaybe( 1, -1 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: two, delta:-1'
  // var got = _.logger.relativeMaybe( 2, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: one, delta:logger'
  // var delta = _.logger.fromStrictly( 1 );
  // var got = _.logger.relativeMaybe( 1, delta );
  // test.identical( got, delta )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: logger, delta:undefined'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.relativeMaybe( src );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  //
  // /* */
  //
  // test.case = 'src: logger, delta:0'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.relativeMaybe( src, 0 );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  //
  // /* */
  //
  // test.case = 'src: logger, delta:1'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.relativeMaybe( src, 1 );
  // test.true( _.logger.is( got ) );
  // test.notIdentical( got, src );
  // test.notIdentical( src.verbosity, 1 );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: logger, delta:-1'
  // var src = _.logger.fromStrictly( 2 );
  // var got = _.logger.relativeMaybe( src, -1 );
  // test.true( _.logger.is( got ) );
  // test.notIdentical( got, src );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: logger, delta:logger'
  // var src = _.logger.fromStrictly( 0 );
  // var delta = _.logger.fromStrictly( 1 );
  // var got = _.logger.relativeMaybe( src, delta );
  // test.identical( got, delta )
  // test.identical( got.verbosity, 1 )

  /* */

  test.case = 'console second argument'
  var src = console;
  var got = _.logger.relativeMaybe( null, console );
  test.identical( got, src );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.logger.relativeMaybe( [] ) )
  test.shouldThrowErrorSync( () => _.logger.relativeMaybe( null, [] ) )
  test.shouldThrowErrorSync( () => _.logger.relativeMaybe( null, false ) )
  test.shouldThrowErrorSync( () => _.logger.relativeMaybe( null, 'abc' ) )
  test.shouldThrowErrorSync( () => _.logger.relativeMaybe( 'abc' ) )
  test.shouldThrowErrorSync( () => _.logger.relativeMaybe( Object.create( null ) ) )
  test.shouldThrowErrorSync( () => _.logger.relativeMaybe( console ) )

}

//

function absoluteMaybe( test )
{

  /* */

  // test.case = 'src: null, verbosity:undefined'
  // var got = _.logger.absoluteMaybe( null );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );

  /* */

  test.case = 'src: null, verbosity:0'
  var got = _.logger.absoluteMaybe( null, 0 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: null, verbosity:1'
  // var got = _.logger.absoluteMaybe( null, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: null, verbosity:-1'
  // var got = _.logger.absoluteMaybe( null, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );

  /* */

  test.case = 'src: null, verbosity:false'
  var got = _.logger.absoluteMaybe( null, false );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: null, verbosity:true'
  // var got = _.logger.absoluteMaybe( null, true );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: null, verbosity:null'
  // var got = _.logger.absoluteMaybe( null, null );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: null, verbosity:logger'
  // var verbosity = _.logger.fromStrictly( 1 );
  // var got = _.logger.absoluteMaybe( null, verbosity );
  // test.identical( got, verbosity )
  // test.identical( got.verbosity, 1 )
  //
  //
  // /* */
  //
  // test.case = 'src: false, verbosity:undefined'
  // var got = _.logger.absoluteMaybe( false );
  // test.true( _.logger.is( got ) )
  // test.identical( got.verbosity, 1 )

  /* */

  test.case = 'src: false, verbosity:0'
  var got = _.logger.absoluteMaybe( false, 0 );
  test.identical( got, 0 )

  /* */

  // test.case = 'src: false, verbosity:1'
  // var got = _.logger.absoluteMaybe( false, 1 );
  // test.true( _.logger.is( got ) )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: false, verbosity:-1'
  // var got = _.logger.absoluteMaybe( false, -1 );
  // test.true( _.logger.is( got ) )
  // test.identical( got.verbosity, 0 )

  /* */

  test.case = 'src: false, verbosity:false'
  var got = _.logger.absoluteMaybe( false, false );
  test.identical( got, 0 )

  /* */

  // test.case = 'src: false, verbosity:true'
  // var got = _.logger.absoluteMaybe( false, true );
  // test.true( _.logger.is( got ) )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: false, verbosity:null'
  // var got = _.logger.absoluteMaybe( false, null );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: false, verbosity:logger'
  // var verbosity = _.logger.fromStrictly( 1 );
  // var got = _.logger.absoluteMaybe( false, verbosity );
  // test.identical( got, verbosity )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: true, verbosity:undefined'
  // var got = _.logger.absoluteMaybe( true );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );

  /* */

  test.case = 'src: true, verbosity:0'
  var got = _.logger.absoluteMaybe( true, 0 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: true, verbosity:1'
  // var got = _.logger.absoluteMaybe( true, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: true, verbosity:-1'
  // var got = _.logger.absoluteMaybe( true, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );

  /* */

  test.case = 'src: true, verbosity:false'
  var got = _.logger.absoluteMaybe( true, false );
  test.identical( got, 0 )

  /* */

  // test.case = 'src: true, verbosity:true'
  // var got = _.logger.absoluteMaybe( true, true );
  // test.true( _.logger.is( got ) )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: true, verbosity:null'
  // var got = _.logger.absoluteMaybe( true, null );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: true, verbosity:logger'
  // var verbosity = _.logger.fromStrictly( 1 );
  // var got = _.logger.absoluteMaybe( true, verbosity );
  // test.identical( got, verbosity )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: zero, verbosity:undefined'
  // var got = _.logger.absoluteMaybe( 0 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 )

  /* */

  test.case = 'src: zero, verbosity:0'
  var got = _.logger.absoluteMaybe( 0, 0 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: zero, verbosity:1'
  // var got = _.logger.absoluteMaybe( 0, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: zero, verbosity:-1'
  // var got = _.logger.absoluteMaybe( 0, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: zero, verbosity:logger'
  // var verbosity = _.logger.fromStrictly( 1 );
  // var got = _.logger.absoluteMaybe( 0, verbosity );
  // test.identical( got, verbosity )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: one, verbosity:undefined'
  // var got = _.logger.absoluteMaybe( 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );

  /* */

  test.case = 'src: one, verbosity:0'
  var got = _.logger.absoluteMaybe( 1, 0 );
  test.identical( got, 0 );

  /* */

  // test.case = 'src: one, verbosity:1'
  // var got = _.logger.absoluteMaybe( 1, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: one, verbosity:-1'
  // var got = _.logger.absoluteMaybe( 1, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: two, verbosity:-1'
  // var got = _.logger.absoluteMaybe( 2, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: one, verbosity:logger'
  // var verbosity = _.logger.fromStrictly( 1 );
  // var got = _.logger.absoluteMaybe( 1, verbosity );
  // test.identical( got, verbosity )
  // test.identical( got.verbosity, 1 )

  /* */

  test.case = 'src: number, verbosity:false'
  var got = _.logger.absoluteMaybe( 1, false );
  test.identical( got, 0 )

  /* */

  // test.case = 'src: number, verbosity:true'
  // var got = _.logger.absoluteMaybe( 1, true );
  // test.true( _.logger.is( got ) )
  // test.identical( got.verbosity, 1 )
  //
  // /* */
  //
  // test.case = 'src: number, verbosity:null'
  // var got = _.logger.absoluteMaybe( 1, null );
  // test.true( _.logger.is( got ) );
  // test.identical( got.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: logger, verbosity:undefined'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.absoluteMaybe( src );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  //
  // /* */
  //
  // test.case = 'src: logger, verbosity:null'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.absoluteMaybe( src, null );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  //
  // /* */
  //
  // test.case = 'src: logger, verbosity:0'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.absoluteMaybe( src, 0 );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: logger, verbosity:1'
  // var src = _.logger.fromStrictly( 0 );
  // var got = _.logger.absoluteMaybe( src, 1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  // test.identical( src.verbosity, 1 );
  //
  // /* */
  //
  // test.case = 'src: logger, verbosity:-1'
  // var src = _.logger.fromStrictly( 2 );
  // var got = _.logger.absoluteMaybe( src, -1 );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: logger, verbosity:false'
  // var src = _.logger.fromStrictly( 2 );
  // var got = _.logger.absoluteMaybe( src, false );
  // test.true( _.logger.is( got ) );
  // test.identical( got, src );
  // test.identical( got.verbosity, 0 );
  //
  // /* */
  //
  // test.case = 'src: logger, verbosity:logger'
  // var src = _.logger.fromStrictly( 0 );
  // var verbosity = _.logger.fromStrictly( 1 );
  // var got = _.logger.absoluteMaybe( src, verbosity );
  // test.identical( got, verbosity )
  // test.identical( got.verbosity, 1 )

  /* */

  test.case = 'console second argument'
  var src = console;
  var got = _.logger.absoluteMaybe( null, console );
  test.identical( got, src );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.logger.absoluteMaybe( [] ) )
  test.shouldThrowErrorSync( () => _.logger.absoluteMaybe( null, [] ) )
  test.shouldThrowErrorSync( () => _.logger.absoluteMaybe( null, 'abc' ) )
  test.shouldThrowErrorSync( () => _.logger.absoluteMaybe( 'abc' ) )
  test.shouldThrowErrorSync( () => _.logger.absoluteMaybe( Object.create( null ) ) )
  test.shouldThrowErrorSync( () => _.logger.absoluteMaybe( console ) )

}

//

function verbosityFrom( test )
{
  /* */

  test.case = 'bool'
  var got = _.logger.verbosityFrom( true );
  test.identical( got, 1 );

  /* */

  test.case = 'bool'
  var got = _.logger.verbosityFrom( false );
  test.identical( got, 0 );

  /* */

  test.case = 'number'
  var got = _.logger.verbosityFrom( 0 );
  test.identical( got, 0 );

  /* */

  test.case = 'number'
  var got = _.logger.verbosityFrom( 1 );
  test.identical( got, 1 );

  /* */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.logger.verbosityFrom() );
  test.shouldThrowErrorSync( () => _.logger.verbosityFrom( Object.create( null ) ) )

}

//

function verbosityRelative( test )
{
  /* */

  test.case = 'bool'

  var got = _.logger.verbosityRelative( true, undefined );
  test.identical( got, 1 );

  var got = _.logger.verbosityRelative( true, 0 );
  test.identical( got, 1 );

  var got = _.logger.verbosityRelative( false, 0 );
  test.identical( got, 0 );

  var got = _.logger.verbosityRelative( true, -1 );
  test.identical( got, 0 );

  var got = _.logger.verbosityRelative( false, -1 );
  test.identical( got, -1 );

  var got = _.logger.verbosityRelative( false, 0 );
  test.identical( got, 0 );

  /* */

  test.case = 'number'

  var got = _.logger.verbosityRelative( 0, 0 );
  test.identical( got, 0 );

  var got = _.logger.verbosityRelative( 1, 0 );
  test.identical( got, 1 );

  var got = _.logger.verbosityRelative( 1, -1 );
  test.identical( got, 0 );

  var got = _.logger.verbosityRelative( 1, 1 );
  test.identical( got, 2 );
}

// --
//
// --

const Proto =
{

  name : 'Tools.Logger.l0.l9',
  silencing : 1,

  tests :
  {

    dichotomy,
    fromStrictly,
    maybe,
    relativeMaybe,
    absoluteMaybe,
    verbosityFrom,
    verbosityRelative,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
