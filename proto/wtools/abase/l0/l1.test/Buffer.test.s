( function _l0_l1_Buffer_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// buffer
// --

function bufferRawIs( test )
{
  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, true );
  test.false( _.bufferTypedIs( src ) );
  test.false( _.bufferNodeIs( src ) );
  test.false( _.bufferViewIs( src ) );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, true );
  test.false( _.bufferTypedIs( src ) );
  test.false( _.bufferNodeIs( src ) );
  test.false( _.bufferViewIs( src ) );

  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  var src = new U8xClamped( 10*10*4 );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'node buffer';
    var src1 = BufferNode.alloc( 10 );
    var got1 = _.bufferRawIs( src1 );
    test.identical( got1, false );

    var src1 = BufferNode.from( [ 2, 4 ] );
    var got1 = _.bufferRawIs( src1 );
    test.identical( got1, false );
  }

  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferRawIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferRawIs( src, new U8x( 1 ) );
  test.identical( got, true );
}

//

function bufferTypedIs( test )
{
  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, true );
  test.false( _.bufferRawIs( src ) );
  test.false( _.bufferNodeIs( src ) );
  test.false( _.bufferViewIs( src ) );

  var src = new U8xClamped( 10*10*4 );
  var got = _.bufferTypedIs( src );
  test.identical( got, true );
  test.false( _.bufferRawIs( src ) );
  test.false( _.bufferNodeIs( src ) );
  test.false( _.bufferViewIs( src ) );

  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'node buffer';
    var src1 = BufferNode.alloc( 10 );
    var got1 = _.bufferTypedIs( src1 );
    test.identical( got1, false );

    var src1 = BufferNode.from( [ 2, 4 ] );
    var got1 = _.bufferTypedIs( src1 );
    test.identical( got1, false );
  }

  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferTypedIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = new I16x( [ 1, 2 ] );
  var got = _.bufferTypedIs( src, new SharedArrayBuffer( 1 ) );
  test.identical( got, true );
}

//

function bufferViewIs( test )
{
  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferViewIs( src );
  test.identical( got, true );
  test.false( _.bufferRawIs( src ) );
  test.false( _.bufferNodeIs( src ) );
  test.false( _.bufferTypedIs( src ) );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferViewIs( src );
  test.identical( got, true );
  test.false( _.bufferRawIs( src ) );
  test.false( _.bufferNodeIs( src ) );
  test.false( _.bufferTypedIs( src ) );

  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  var src = new U8xClamped( 10*10*4 );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferViewIs( src );
  test.identical( got, false );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'node buffer';
    var src1 = BufferNode.alloc( 10 );
    var got1 = _.bufferViewIs( src1 );
    test.identical( got1, false );

    var src1 = BufferNode.from( [ 2, 4 ] );
    var got1 = _.bufferViewIs( src1 );
    test.identical( got1, false );
  }

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferViewIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = new BufferView( new BufferRaw( [ 1, 2 ] ) );
  var got = _.bufferViewIs( src, new U8x( 1 ) );
  test.identical( got, true );
}

//

function bufferNodeIs( test )
{
  if( !Config.interpreter === 'njs' )
  return;

  test.case = 'node buffer';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferNodeIs( src );
  test.identical( got, true );
  test.false( _.bufferRawIs( src ) );
  test.false( _.bufferTypedIs( src ) );
  test.false( _.bufferViewIs( src ) );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, true );
  test.false( _.bufferRawIs( src ) );
  test.false( _.bufferTypedIs( src ) );
  test.false( _.bufferViewIs( src ) );

  test.case = 'typed array';
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  var src = new U8xClamped( 10*10*4 );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'view buffer, BufferRaw';
  var src = new BufferView( new BufferRaw( [ 10 ] ) );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferNodeIs( src );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  var got = _.bufferNodeIs();
  test.identical( got, false );

  test.case = 'extra arguments';
  var src = BufferNode.from( [ 1, 2 ] );
  var got = _.bufferNodeIs( src, new SharedArrayBuffer( 1 ) );
  test.identical( got, true );
}

//

function bufferAnyIs( test )
{
  test.case = 'check null';
  var got = _.bufferAnyIs( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check undefined';
  var got = _.bufferAnyIs( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check zero';
  var got = _.bufferAnyIs( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check false';
  var got = _.bufferAnyIs( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check NaN';
  var got = _.bufferAnyIs( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check Symbol';
  var got = _.bufferAnyIs( Symbol( 'a' ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty map';
  var got = _.bufferAnyIs( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty array';
  var got = _.bufferAnyIs( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check string';
  var got = _.bufferAnyIs( 'string' );
  var expected = false;
  test.identical( got, expected );

  /* BufferTyped */

  test.case = 'check U8x constructor';
  var got = _.bufferAnyIs( U8x );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty U8x instance';
  var src = new U8x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check empty U16x instance';
  var src = new U16x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check empty U32x instance';
  var src = new U32x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check empty U64x instance';
  var src = new U64x( 2 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  /**/

  test.case = 'check empty I8x instance';
  var src = new I8x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check empty I16x instance';
  var src = new I16x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check empty I32x instance';
  var src = new I32x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check empty I64x instance';
  var src = new I64x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  /**/

  test.case = 'check empty F32x instance';
  var src = new F32x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check empty F64x instance';
  var src = new F32x( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  /* BufferNode */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'check empty BufferNode instance';
    var src1 = BufferNode.alloc( 5 );
    var got1 = _.bufferAnyIs( src1 );
    var expected1 = true;
    test.identical( got1, expected1 );

    test.case = 'check BufferNode instance';
    var src1 = BufferNode.allocUnsafe( 5 );
    var got1 = _.bufferAnyIs( src1 );
    var expected1 = true;
    test.identical( got1, expected1 );

    test.case = 'check BufferNode from string';
    var src1 = BufferNode.from( 'str' );
    var got1 = _.bufferAnyIs( src1 );
    var expected1 = true;
    test.identical( got1, expected1 );
  }

  /* BufferRaw */

  test.case = 'check BufferRaw constructor';
  var got = _.bufferAnyIs( BufferRaw );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty BufferRaw instance';
  var src = new BufferRaw( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check BufferRawShared instance';
  var src = new BufferRawShared( 5 );
  var got = _.bufferAnyIs( src );
  var expected = true;
  test.identical( got, expected );

  /* BufferView */

  test.case = 'check BufferView constructor';
  var got = _.bufferAnyIs( BufferView );
  var expected = false;
  test.identical( got, expected );

  /**/

  test.case = 'check without argument';
  var got = _.bufferAnyIs();
  var expected = false;
  test.identical( got, expected );

  test.case = 'check extra arguments';
  var got = _.bufferAnyIs( new U8x( [ 1, 2, 3 ] ), new BufferRaw( 5 ) );
  var expected = true;
  test.identical( got, expected );
}

//

function bufferBytesIs( test )
{
  test.case = 'check null';
  var got = _.bufferBytesIs( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check undefined';
  var got = _.bufferBytesIs( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check zero';
  var got = _.bufferBytesIs( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check false';
  var got = _.bufferBytesIs( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check NaN';
  var got = _.bufferBytesIs( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check Symbol';
  var got = _.bufferBytesIs( Symbol( 'a' ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty map';
  var got = _.bufferBytesIs( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty array';
  var got = _.bufferBytesIs( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check string';
  var got = _.bufferBytesIs( 'string' );
  var expected = false;
  test.identical( got, expected );

  /* BufferTyped */

  test.case = 'check U8x constructor';
  var got = _.bufferBytesIs( U8x );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check U8x instance';
  var src = new U8x( [ 1, 2 ] );
  var got = _.bufferBytesIs( src );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check U16x instance';
  var src = new U16x( [ 2, 3 ] );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check U32x instance';
  var src = new U32x( [ 1, 2 ] );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty U64x instance';
  var src = new U64x( 2 );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  /**/

  test.case = 'check I8x constructor';
  var got = _.bufferBytesIs( I8x );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty I8x instance';
  var src = new I8x( 5 );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check I16x instance';
  var src = new I16x( [ 1, 2 ] );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check I32x instance';
  var src = new I32x( [ 1, 2 ] );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty I64x instance';
  var src = new I64x( 5 );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  /**/

  test.case = 'check F32x instance';
  var src = new F32x( [ 2, 1 ] );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty F64x instance';
  var src = new F32x( 5 );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  /* BufferNode */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'check empty BufferNode instance';
    var src1 = BufferNode.alloc( 5 );
    var got1 = _.bufferBytesIs( src1 );
    var expected1 = false;
    test.identical( got1, expected1 );

    test.case = 'check BufferNode instance';
    var src1 = BufferNode.allocUnsafe( 5 );
    var got1 = _.bufferBytesIs( src1 );
    var expected1 = false;
    test.identical( got1, expected1 );

    test.case = 'check BufferNode from string';
    var src1 = BufferNode.from( 'str' );
    var got1 = _.bufferBytesIs( src1 );
    var expected1 = false;
    test.identical( got1, expected1 );
  }

  /* BufferRaw */

  test.case = 'check empty BufferRaw instance';
  var src = new BufferRaw( 5 );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check BufferRawShared instance';
  var src = new BufferRawShared( 5 );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  /* BufferView */

  test.case = 'check BufferView instance';
  var src = new BufferView( new U8x( [ 1, 2, 3 ] ).buffer );
  var got = _.bufferBytesIs( src );
  var expected = false;
  test.identical( got, expected );

  /**/

  test.case = 'check without argument';
  var got = _.bufferBytesIs();
  var expected = false;
  test.identical( got, expected );

  test.case = 'check extra arguments';
  var got = _.bufferBytesIs( new U8x( [ 1, 2, 3 ] ), new BufferRaw( 5 ) );
  var expected = true;
  test.identical( got, expected );
}

//

function bufferMakeWithArrayAndUnroll( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );

  var list =
  [
    array,
    unroll,
  ];

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeBuffer )
  {
    test.case = 'src - empty long, not ins';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, null );
    var expected = _.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, undefined );
    var expected = _.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
  }

  test.case = 'src - null';
  var got = _.bufferMake( null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, new U8x( 5 ) );
  var expected = _.tools.defaultBufferTyped.make( [ 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMake( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMake( F32x, ins );
  var expected = new F32x( [ 1, 2, 3 ] );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMake( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = [ 1, 1, 1, 1, 1 ];
  var got = _.bufferMake( Array, ins );
  var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
  test.identical( got, expected );
  test.true( got !== ins );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.bufferMake( [ 1, 2, 3 ], 4, 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferMake( undefined ) );
  test.shouldThrowErrorSync( () => _.bufferMake( 'wrong', 1 ) );
  test.shouldThrowErrorSync( () => _.bufferMake( 1, 1 ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.bufferMake( [ 1, 2, 3 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.bufferMake( [ 1, 2, 3 ], Infinity  ) );
}

//

function bufferMakeWithArgumentsArray( test )
{
  test.case = 'src - empty long, not ins';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - null';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, null );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - undefined';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, undefined );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - number';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, 2 );
  var expected = _.tools.defaultBufferTyped.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - empty array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, [] );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, [ 1, 2, 3 ] );
  var expected = _.tools.defaultBufferTyped.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, not ins';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMake( src );
  var expected = _.tools.defaultBufferTyped.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMake( src, 2 );
  var expected = _.tools.defaultBufferTyped.make( [ 1, 2 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins > src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMake( src, 4 );
  var expected = _.tools.defaultBufferTyped.make( [ 1, 2, 3, 0 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - array, ins.length > src.length';
  var src = _.argumentsArray.make( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMake( src, ins );
  var expected = _.tools.defaultBufferTyped.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== ins );
  test.true( got !== src );

  /* */

  test.case = 'src - null';
  var got = _.bufferMake( null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, _.argumentsArray.make( 5 ) );
  var expected = _.tools.defaultBufferTyped.make( new Array( 5 ) );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMake( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = _.argumentsArray.make( [ 1, 2, 3 ] )
  var got = _.bufferMake( F32x, ins );
  var expected = new F32x( [ 1, 2, 3 ] );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMake( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
  var got = _.bufferMake( Array, ins );
  var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
  test.identical( got, expected );
  test.true( got !== ins );
}

//

function bufferMakeWithBuffers( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.number.is( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( bufferRaw( src ) );

  /* lists */

  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];
  var list = [ bufferRaw, bufferView ];
  // var list = []; // xxx

  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeBuffer )
  {
    test.case = 'src - empty buffer, not ins';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got instanceof src.constructor )

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
    test.true( got instanceof src.constructor )
  }

  test.case = 'src - null';
  var got = _.bufferMake( null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, new U8x( 5 ) );
  var expected = _.tools.defaultBufferTyped.make( [ 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMake( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMake( F32x, ins );
  var expected = new F32x( [ 1, 2, 3 ] );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMake( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = [ 1, 1, 1, 1, 1 ];
  var got = _.bufferMake( Array, ins );
  var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
  test.identical( got, expected );
  test.true( got !== ins );
}

//

function bufferMakeWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );

  var list =
  [
    array,
    unroll,
  ];

  /* tests */

  let times = 4;
  // for( let e in _.LongDescriptors )
  // {
  //   let name = _.LongDescriptors[ e ].name;
  //   let long = _.withLong[ name ];
  for( let k in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ k ];
    let name = namespace.TypeName;
    let long = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `long - ${ name }, buffer - ${ list[ i ].name }` );
      testRun( long, list[ i ] );
      test.close( `long - ${ name }, buffer - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( long, makeBuffer )
  {
    test.case = 'src - empty long, not ins';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMake( src );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = long.bufferMake( null ); /* qqq2 : for Dmytro : should create typed buffer! */
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMake( null, null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMake( null, undefined );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = long.bufferMake( null, 5 );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = long.bufferMake( null, new U8x( 5 ) );
    var expected = long.defaultLong.make( [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = long.bufferMake( 5, null );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = long.bufferMake( 5, undefined );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = long.bufferMake( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMake( F32x, ins );
    var expected = new F32x( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = long.bufferMake( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = long.bufferMake( Array, ins );
    var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== ins );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => long.bufferMake() );

      test.case = 'extra argument';
      test.shouldThrowErrorSync( () => long.bufferMake( [ 1, 2, 3 ], 4, 'extra' ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => long.bufferMake( 'wrong', 1 ) );
      test.shouldThrowErrorSync( () => long.bufferMake( 1, 1 ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => long.bufferMake( [ 1, 2, 3 ], 'wrong' ) );
      test.shouldThrowErrorSync( () => long.bufferMake( [ 1, 2, 3 ], Infinity  ) );
    }
  }
}

bufferMakeWithArrayAndUnrollLongDescriptor.timeOut = 15000;

//

function bufferMakeWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  // for( let e in _.LongDescriptors )
  // {
  //   let name = _.LongDescriptors[ e ].name;
  //   let long = _.withLong[ name ];
  for( let k in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ k ];
    let name = namespace.TypeName;
    let long = _.withLong[ name ];

    test.open( `long - ${ name }` );
    testRun( long );
    test.close( `long - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( long )
  {
    test.case = 'src - empty long, not ins';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMake( src );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMake( src, null );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMake( src, undefined );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMake( src, 2 );
    var expected = long.defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMake( src, [] );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMake( src, [ 1, 2, 3 ] );
    var expected = long.defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = long.bufferMake( src );
    var expected = long.defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = long.bufferMake( src, 2 );
    var expected = long.defaultLong.make( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = long.bufferMake( src, 4 );
    var expected = long.defaultLong.make( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = _.argumentsArray.make( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMake( src, ins );
    var expected = long.defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = long.bufferMake( null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMake( null, null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMake( null, undefined );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = long.bufferMake( null, 5 );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = long.bufferMake( null, _.argumentsArray.make( 5 ) );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = long.bufferMake( 5, null );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = long.bufferMake( 5, undefined );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = long.bufferMake( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = _.argumentsArray.make( [ 1, 2, 3 ] )
    var got = long.bufferMake( F32x, ins );
    var expected = new F32x( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = long.bufferMake( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
    var got = long.bufferMake( Array, ins );
    var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== ins );
  }
}

bufferMakeWithArgumentsArrayLongDescriptor.timeOut = 10000;

//

function bufferMakeWithBuffersLongDescriptor( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.number.is( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( bufferRaw( src ) );

  /* lists */

  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];
  var list = [ bufferRaw, bufferView ];

  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );

  /* tests */

  let times = 4;
  // for( let e in _.LongDescriptors )
  // {
  //   let name = _.LongDescriptors[ e ].name;
  //   let long = _.withLong[ name ];
  for( let k in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ k ];
    let name = namespace.TypeName;
    let long = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `long - ${ name }, long - ${ list[ i ].name }` );
      testRun( long, list[ i ] );
      test.close( `long - ${ name }, long - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( long, makeBuffer )
  {
    test.case = 'src - empty buffer, not ins';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = long.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMake( src );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = long.bufferMake( null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMake( null, null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMake( null, undefined );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = long.bufferMake( null, 5 );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = long.bufferMake( null, new U8x( 5 ) );
    var expected = long.defaultLong.make( [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = long.bufferMake( 5, null );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = long.bufferMake( 5, undefined );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = long.bufferMake( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMake( F32x, ins );
    var expected = new F32x( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = long.bufferMake( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = long.bufferMake( Array, ins );
    var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== ins );
  }
}

bufferMakeWithBuffersLongDescriptor.timeOut = 15000;

//

function bufferMakeUndefinedWithArrayAndUnroll( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );

  var list =
  [
    array,
    unroll,
  ];

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeBuffer )
  {
    test.case = 'src - empty long, not ins';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
  }

  test.case = 'src - null';
  var got = _.bufferMakeUndefined( null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, new U8x( 5 ) );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMakeUndefined( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMakeUndefined( F32x, ins );
  var expected = new F32x( 3 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMakeUndefined( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = [ 1, 1, 1, 1, 1 ];
  var got = _.bufferMakeUndefined( Array, ins );
  var expected = new Array( 5 );
  test.identical( got, expected );
  test.true( got !== ins );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( [ 1, 2, 3 ], 4, 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( undefined ) );
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( 'wrong', 1 ) );
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( 1, 1 ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( [ 1, 2, 3 ], 'wrong' ) );
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( [ 1, 2, 3 ], Infinity  ) );
}

//

function bufferMakeUndefinedWithArgumentsArray( test )
{
  test.case = 'src - empty long, not ins';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - null';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, null );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - undefined';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, undefined );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - number';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, 2 );
  var expected = _.tools.defaultBufferTyped.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - empty array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, [] );
  var expected = _.tools.defaultBufferTyped.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, [ 1, 2, 3 ] );
  var expected = _.tools.defaultBufferTyped.make( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, not ins';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src );
  var expected = _.tools.defaultBufferTyped.make( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src, 2 );
  var expected = _.tools.defaultBufferTyped.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins > src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src, 4 );
  var expected = _.tools.defaultBufferTyped.make( 4 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - array, ins.length > src.length';
  var src = _.argumentsArray.make( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMakeUndefined( src, ins );
  var expected = _.tools.defaultBufferTyped.make( 3 );
  test.identical( got, expected );
  test.true( got !== ins );
  test.true( got !== src );

  /* */

  test.case = 'src - null';
  var got = _.bufferMakeUndefined( null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, _.argumentsArray.make( 5 ) );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMakeUndefined( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = _.argumentsArray.make( [ 1, 2, 3 ] )
  var got = _.bufferMakeUndefined( F32x, ins );
  var expected = new F32x( 3 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMakeUndefined( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
  var got = _.bufferMakeUndefined( Array, ins );
  var expected = new Array( 5 );
  test.identical( got, expected );
  test.true( got !== ins );
}

//

function bufferMakeUndefinedWithBuffers( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.number.is( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( bufferRaw( src ) );

  /* lists */

  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];
  var list = [ bufferRaw, bufferView ];

  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );

  /* tests */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( list[ i ] );
    test.close( list[ i ].name );
  }

  /* test subroutine */

  function testRun( makeBuffer )
  {
    test.case = 'src - empty buffer, not ins';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );
  }

  test.case = 'src - null';
  var got = _.bufferMakeUndefined( null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _.tools.defaultBufferTyped.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, new U8x( 5 ) );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _.tools.defaultBufferTyped.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMakeUndefined( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMakeUndefined( F32x, ins );
  var expected = new F32x( 3 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMakeUndefined( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = [ 1, 1, 1, 1, 1 ];
  var got = _.bufferMakeUndefined( Array, ins );
  var expected = new Array( 5 );
  test.identical( got, expected );
  test.true( got !== ins );
}

//

function bufferMakeUndefinedWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.array.make( src );
  var unroll = ( src ) => _.unroll.make( src );

  var list =
  [
    array,
    unroll,
  ];

  /* tests */

  let times = 4;
  // for( let e in _.LongDescriptors )
  // {
  //   let name = _.LongDescriptors[ e ].name;
  //   let long = _.withLong[ name ];
  for( let k in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ k ];
    let name = namespace.TypeName;
    let long = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `long - ${ name }, buffer - ${ list[ i ].name }` );
      testRun( long, list[ i ] );
      test.close( `long - ${ name }, buffer - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( long, makeBuffer )
  {
    test.case = 'src - empty long, not ins';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = long.bufferMakeUndefined( null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMakeUndefined( null, null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMakeUndefined( null, undefined );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = long.bufferMakeUndefined( null, 5 );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = long.bufferMakeUndefined( null, new U8x( 5 ) );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = long.bufferMakeUndefined( 5, null );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = long.bufferMakeUndefined( 5, undefined );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = long.bufferMakeUndefined( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMakeUndefined( F32x, ins );
    var expected = new F32x( 3 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = long.bufferMakeUndefined( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = long.bufferMakeUndefined( Array, ins );
    var expected = new Array( 5 );
    test.identical( got, expected );
    test.true( got !== ins );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => long.bufferMakeUndefined() );

      test.case = 'extra argument';
      test.shouldThrowErrorSync( () => long.bufferMakeUndefined( [ 1, 2, 3 ], 4, 'extra' ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => long.bufferMakeUndefined( 'wrong', 1 ) );
      test.shouldThrowErrorSync( () => long.bufferMakeUndefined( 1, 1 ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => long.bufferMakeUndefined( [ 1, 2, 3 ], 'wrong' ) );
      test.shouldThrowErrorSync( () => long.bufferMakeUndefined( [ 1, 2, 3 ], Infinity  ) );
    }
  }
}

bufferMakeUndefinedWithArrayAndUnrollLongDescriptor.timeOut = 15000;

//

function bufferMakeUndefinedWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  // for( let e in _.LongDescriptors )
  // {
  //   let name = _.LongDescriptors[ e ].name;
  //   let long = _.withLong[ name ];
  for( let k in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ k ];
    let name = namespace.TypeName;
    let long = _.withLong[ name ];

    test.open( `long - ${ name }` );
    testRun( long );
    test.close( `long - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( long )
  {
    test.case = 'src - empty long, not ins';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMakeUndefined( src );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMakeUndefined( src, null );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMakeUndefined( src, undefined );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMakeUndefined( src, 2 );
    var expected = long.defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMakeUndefined( src, [] );
    var expected = long.defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = _.argumentsArray.make( [] );
    var got = long.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = long.defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src );
    var expected = long.defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src, 2 );
    var expected = long.defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src, 4 );
    var expected = long.defaultLong.make( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = _.argumentsArray.make( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMakeUndefined( src, ins );
    var expected = long.defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = long.bufferMakeUndefined( null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMakeUndefined( null, null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMakeUndefined( null, undefined );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = long.bufferMakeUndefined( null, 5 );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = long.bufferMakeUndefined( null, _.argumentsArray.make( 5 ) );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = long.bufferMakeUndefined( 5, null );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = long.bufferMakeUndefined( 5, undefined );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = long.bufferMakeUndefined( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = _.argumentsArray.make( [ 1, 2, 3 ] )
    var got = long.bufferMakeUndefined( F32x, ins );
    var expected = new F32x( 3 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = long.bufferMakeUndefined( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
    var got = long.bufferMakeUndefined( Array, ins );
    var expected = new Array( 5 );
    test.identical( got, expected );
    test.true( got !== ins );
  }
}

bufferMakeUndefinedWithArgumentsArrayLongDescriptor.timeOut = 10000;

//

function bufferMakeUndefinedWithBuffersLongDescriptor( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.number.is( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( bufferRaw( src ) );

  /* lists */

  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];
  var list = [ bufferRaw, bufferView ];

  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );

  /* tests */

  let times = 4;
  // for( let e in _.LongDescriptors )
  // {
  //   let name = _.LongDescriptors[ e ].name;
  //   let long = _.withLong[ name ];
  for( let k in _.long.namespaces )
  {
    let namespace = _.long.namespaces[ k ];
    let name = namespace.TypeName;
    let long = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `long - ${ name }, long - ${ list[ i ].name }` );
      testRun( long, list[ i ] );
      test.close( `long - ${ name }, long - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( long, makeBuffer )
  {
    test.case = 'src - empty buffer, not ins';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = long.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = long.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = long.bufferMakeUndefined( null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMakeUndefined( null, null );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = long.bufferMakeUndefined( null, undefined );
    var expected = long.defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = long.bufferMakeUndefined( null, 5 );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = long.bufferMakeUndefined( null, new U8x( 5 ) );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = long.bufferMakeUndefined( 5, null );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = long.bufferMakeUndefined( 5, undefined );
    var expected = long.defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = long.bufferMakeUndefined( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = long.bufferMakeUndefined( F32x, ins );
    var expected = new F32x( 3 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = long.bufferMakeUndefined( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = long.bufferMakeUndefined( Array, ins );
    var expected = new Array( 5 );
    test.identical( got, expected );
    test.true( got !== ins );
  }
}

bufferMakeUndefinedWithBuffersLongDescriptor.timeOut = 15000;

//

function bufferRawFromTyped( test )
{

  var buffer1 = new BufferRaw(10);
  var view1 = new I8x( buffer1 );
  test.case = 'returns the same length of typed array';
  var got = _.bufferRawFromTyped( view1 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  var buffer2 = new BufferRaw(10);
  var view2 = new I8x( buffer2, 2 );
  test.case = 'returns the new sub typed array';
  var got = _.bufferRawFromTyped( view2 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRawFromTyped();
  });

  test.case = 'arguments are wrong';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRawFromTyped( 'wrong argument' );
  });

}

//

function bufferRawFrom( test )
{
  test.case = 'from array';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.bufferRawFrom( src );
  var expected = new U8x( src ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferRawFrom( src );
  var expected = new U8x( src ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 3 );
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 12 );
  test.identical( got, expected );
  test.true( got === src );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'empty BufferNode';
    var src1 = BufferNode.alloc( 10 );
    var got1 = _.bufferRawFrom( src1 );
    var expected1 = new BufferRaw( 10 );
    test.identical( got1, expected1 );
    test.true( got1 !== src1 );

    test.case = 'BufferNode from string';
    var src1 = BufferNode.from( 'str' );
    var got1 = _.bufferRawFrom( src1 );
    var expected1 = new U8x( [ 115, 116, 114 ] ).buffer;
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );

    test.case = 'BufferNode, buffer.length < result.length';
    var buffer1 = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src1 = BufferNode.from( buffer1, 0, 3 );
    var got1 = _.bufferRawFrom( src1 );
    var expected1 = new U8x( [ 1, 2, 3 ] ).buffer;
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );

    test.case = 'BufferNode, offset from src1';
    var buffer1 = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src1 = BufferNode.from( buffer1, 3 );
    var got1 = _.bufferRawFrom( src1 );
    var expected1 = new U8x( [ 4, 5 ] ).buffer;
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );

    test.case = 'BufferNode, offset from src1, buffer.length < result.length';
    var buffer1 = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src1 = BufferNode.from( buffer1, 2, 2 );
    var got1 = _.bufferRawFrom( src1 );
    var expected1 = new U8x( [ 3, 4 ] ).buffer;
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );
  }

  /* */

  test.case = 'from BufferTyped, not offset';
  var src = new U8x( 3 );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 3 );
  test.identical( got, expected );
  test.true( got === src.buffer );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferRawFrom( src );
  var expected = new F32x( [ 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src.buffer );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 1, 0, 2, 0, 3, 0, 4, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src.buffer );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src.buffer );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 10 );
  test.identical( got, expected );
  test.true( got === src.buffer );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new F32x( [ 1 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src.buffer );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src.buffer );

  /* */

  test.case = 'from string';
  var src = 'abc';
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 97, 98, 99 ] ).buffer;
  test.identical( got, expected );

  /*
  zzz aaa Dmytro: making buffer from file need tests, now condition has _.assert( 0, 'not tested' )
  */

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRawFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferRawFrom( [ 1, 2 ], 2 ) );

  test.case = 'wrong buffer type';
  test.shouldThrowErrorSync( () => _.bufferRawFrom( 5 ) );
  test.shouldThrowErrorSync( () => _.bufferRawFrom( {} ) );
}

//

function bufferBytesFrom( test )
{
  test.case = 'from array';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( src );
  test.identical( got, expected );
  test.true( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( src );
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 12 );
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'empty BufferNode';
    var src1 = BufferNode.alloc( 10 );
    var got1 = _.bufferBytesFrom( src1 );
    var expected1 = new U8x( 10 );
    test.identical( got1, expected1 );
    test.true( got1 !== src1 );

    test.case = 'BufferNode from string';
    var src1 = BufferNode.from( 'str' );
    var got1 = _.bufferBytesFrom( src1 );
    var expected1 = new U8x( [ 115, 116, 114 ] );
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );

    test.case = 'BufferNode, buffer.length < result.length';
    var buffer1 = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src1 = BufferNode.from( buffer1, 0, 3 );
    var got1 = _.bufferBytesFrom( src1 );
    var expected1 = new U8x( [ 1, 2, 3 ] );
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );

    test.case = 'BufferNode, offset from src1';
    var buffer1 = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src1 = BufferNode.from( buffer1, 3 );
    var got1 = _.bufferBytesFrom( src1 );
    var expected1 = new U8x( [ 4, 5 ] );
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );

    test.case = 'BufferNode, offset from src1, buffer.length < result.length';
    var buffer1 = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src1 = BufferNode.from( buffer1, 2, 2 );
    var got1 = _.bufferBytesFrom( src1 );
    var expected1 = new U8x( [ 3, 4 ] );
    test.identical( got1, expected1 );
    test.true( got1 !== expected1 );
  }

  /* */

  test.case = 'from BufferBytes';
  var src = new U8x( 3 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 3 );
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'from BufferBytes, not offset';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 0, 0, 64, 64, 0, 0, 128, 64, 0, 0, 160, 64 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 1, 0, 2, 0, 3, 0, 4, 0 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.true( got === src );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 10 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 0, 0, 128, 63 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'from string';
  var src = 'abc';
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  /*
  zzz aaa Dmytro: making buffer from file need tests, now condition has _.assert( 0, 'not tested' )
  */

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferBytesFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferBytesFrom( [ 1, 2 ], 2 ) );

  test.case = 'wrong buffer type';
  test.shouldThrowErrorSync( () => _.bufferBytesFrom( 5 ) );
  test.shouldThrowErrorSync( () => _.bufferBytesFrom( {} ) );
}

//

function bufferNodeFrom( test )
{
  if( Config.interpreter !== 'njs' )
  return;

  test.case = 'from array';
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( src );
  test.identical( got, expected );
  test.true( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( src );
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'from BufferRaw, buffer.byteLength = 0';
  var src = new BufferRaw();
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.alloc( 0 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.alloc( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.alloc( 12 );
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'empty BufferNode';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.alloc( 10 );
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'BufferNode from string';
  var src = BufferNode.from( 'str' );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 115, 116, 114 ] );
  test.identical( got, expected );
  test.true( got !== expected );

  test.case = 'BufferNode, buffer.length < result.length';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 0, 3 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== expected );

  test.case = 'BufferNode, offset from src';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 3 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 4, 5 ] );
  test.identical( got, expected );
  test.true( got !== expected );

  test.case = 'BufferNode, offset from src, buffer.length < result.length';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 2, 2 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 3, 4 ] );
  test.identical( got, expected );
  test.true( got !== expected );

  /* */

  test.case = 'from empty BufferBytes';
  var src = new U8x();
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.alloc( 0 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferBytes';
  var src = new U8x( 3 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.alloc( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferBytes, not offset';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 0, 0, 64, 64, 0, 0, 128, 64, 0, 0, 160, 64 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 1, 0, 2, 0, 3, 0, 4, 0 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.alloc( 10 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 0, 0, 128, 63 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'from string';
  var src = 'abc';
  var got = _.bufferNodeFrom( src );
  var expected = BufferNode.from( [ 97, 98, 99 ] );
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferNodeFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferNodeFrom( [ 1, 2 ], 2 ) );

  test.case = 'wrong buffer type';
  test.shouldThrowErrorSync( () => _.bufferNodeFrom( 5 ) );
  test.shouldThrowErrorSync( () => _.bufferNodeFrom( {} ) );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Buffer.l0.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // buffer, l0/l5

    bufferRawIs,
    bufferTypedIs,
    bufferViewIs,
    bufferNodeIs,
    bufferAnyIs,
    bufferBytesIs,
    // constructorIsBuffer,

    // buffer, l0/l8

    bufferMakeWithArrayAndUnroll,
    bufferMakeWithArgumentsArray,
    bufferMakeWithBuffers,
    // bufferMakeWithArrayAndUnrollLongDescriptor, /* qqq2 : for Dmytro : fix pelase */
    // bufferMakeWithArgumentsArrayLongDescriptor, /* qqq2 : for Dmytro : fix pelase */
    // bufferMakeWithBuffersLongDescriptor, /* qqq2 : for Dmytro : fix pelase */

    bufferMakeUndefinedWithArrayAndUnroll,
    bufferMakeUndefinedWithArgumentsArray,
    bufferMakeUndefinedWithBuffers,
    // bufferMakeUndefinedWithArrayAndUnrollLongDescriptor, /* qqq2 : for Dmytro : fix pelase */
    // bufferMakeUndefinedWithArgumentsArrayLongDescriptor, /* qqq2 : for Dmytro : fix pelase */
    // bufferMakeUndefinedWithBuffersLongDescriptor, /* qqq2 : for Dmytro : fix pelase */

    // bufferCoerceFrom,
    bufferRawFromTyped,
    bufferRawFrom,
    bufferBytesFrom,
    bufferNodeFrom,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
