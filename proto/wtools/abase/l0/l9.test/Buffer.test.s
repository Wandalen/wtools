( function _l0_l9_Buffer_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

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

  var src = new U8ClampedX( 10*10*4 );
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

  var src = new U8ClampedX( 10*10*4 );
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

  var src = new U8ClampedX( 10*10*4 );
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

  var src = new U8ClampedX( 10*10*4 );
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

function constructorIsBuffer( test )
{
  test.case = 'check null';
  var got = _.constructorIsBuffer( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check undefined';
  var got = _.constructorIsBuffer( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check zero';
  var got = _.constructorIsBuffer( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check false';
  var got = _.constructorIsBuffer( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check NaN';
  var got = _.constructorIsBuffer( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check Symbol';
  var got = _.constructorIsBuffer( Symbol( 'a' ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty map';
  var got = _.constructorIsBuffer( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty array';
  var got = _.constructorIsBuffer( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check string';
  var got = _.constructorIsBuffer( 'string' );
  var expected = false;
  test.identical( got, expected );

  /**/

  test.case = 'check empty U8x instance';
  var got = _.constructorIsBuffer( new U8x( 3 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check U8x constructor';
  var got = _.constructorIsBuffer( U8x );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check U8ClampedX constructor';
  var got = _.constructorIsBuffer( U8ClampedX );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check U16x constructor';
  var got = _.constructorIsBuffer( U16x );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check U32x constructor';
  var got = _.constructorIsBuffer( U32x );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check Ux constructor';
  var got = _.constructorIsBuffer( Ux );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check U64x constructor';
  var got = _.constructorIsBuffer( U64x );
  var expected = true;
  test.identical( got, expected );

  /**/

  test.case = 'check I8x constructor';
  var got = _.constructorIsBuffer( I8x );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check I16x constructor';
  var got = _.constructorIsBuffer( I16x );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check I32x constructor';
  var got = _.constructorIsBuffer( I32x );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check Ix constructor';
  var got = _.constructorIsBuffer( Ix );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check I64x constructor';
  var got = _.constructorIsBuffer( I64x );
  var expected = true;
  test.identical( got, expected );

  /**/

  test.case = 'check F32x constructor';
  var got = _.constructorIsBuffer( F32x );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check Fx constructor';
  var got = _.constructorIsBuffer( Fx );
  var expected = true;
  test.identical( got, expected );

  test.case = 'check F64x constructor';
  var got = _.constructorIsBuffer( F64x );
  var expected = true;
  test.identical( got, expected );

  /* BufferNode */

  if(Config.interpreter === 'njs')
  {
    test.case = 'check BufferNode constructor';
    var got1 = _.constructorIsBuffer( BufferNode );
    var expected1 = false;
    test.identical( got1, expected1 );

    test.case = 'check empty BufferNode instance';
    var got1 = _.constructorIsBuffer( BufferNode.alloc( 3 ) );
    var expected1 = false;
    test.identical( got1, expected1 );
  }

  /* BufferRaw */

  test.case = 'check BufferRaw constructor';
  var got = _.constructorIsBuffer( BufferRaw );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check empty BufferRaw instance';
  var got = _.constructorIsBuffer( new BufferRaw( 3 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check BufferRawShared constructor';
  var got = _.constructorIsBuffer( BufferRawShared );
  var expected = false;
  test.identical( got, expected );

  /* BufferView */

  test.case = 'check BufferView constructor';
  var got = _.constructorIsBuffer( BufferView );
  var expected = false;
  test.identical( got, expected );

  test.case = 'check BufferView from raw';
  var got = _.constructorIsBuffer( new BufferView( new BufferRaw( 3 ) ) );
  var expected = false;
  test.identical( got, expected );

  /**/

  test.case = 'check without argument';
  var got = _.constructorIsBuffer();
  var expected = false;
  test.identical( got, expected );

  test.case = 'check extra arguments';
  var got = _.constructorIsBuffer( U8x, U16x );
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
    var expected = _./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, undefined );
    var expected = _./*longDescriptor*/defaultLong.make( [] );
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
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, new U8x( 5 ) );
  var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
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

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferMake() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.bufferMake( [ 1, 2, 3 ], 4, 'extra' ) );

  test.case = 'wrong type of ins';
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
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - null';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, null );
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - undefined';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - number';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, 2 );
  var expected = _./*longDescriptor*/defaultLong.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - empty array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, [] );
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMake( src, [ 1, 2, 3 ] );
  var expected = _./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, not ins';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMake( src );
  var expected = _./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMake( src, 2 );
  var expected = _./*longDescriptor*/defaultLong.make( [ 1, 2 ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins > src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMake( src, 4 );
  var expected = _./*longDescriptor*/defaultLong.make( [ 1, 2, 3, undefined ] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - array, ins.length > src.length';
  var src = _.argumentsArray.make( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMake( src, ins );
  var expected = _./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got !== ins );
  test.true( got !== src );

  /* */

  test.case = 'src - null';
  var got = _.bufferMake( null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, _.argumentsArray.make( 5 ) );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
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
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, new U8x( 5 ) );
  var expected = _./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
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
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, buffer - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, buffer - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeBuffer )
  {
    test.case = 'src - empty long, not ins';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMake( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMake( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMake( null, new U8x( 5 ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMake( 5, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMake( 5, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMake( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( F32x, ins );
    var expected = new F32x( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMake( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = descriptor.bufferMake( Array, ins );
    var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== ins );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.bufferMake() );

      test.case = 'extra argument';
      test.shouldThrowErrorSync( () => descriptor.bufferMake( [ 1, 2, 3 ], 4, 'extra' ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => descriptor.bufferMake( 'wrong', 1 ) );
      test.shouldThrowErrorSync( () => descriptor.bufferMake( 1, 1 ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => descriptor.bufferMake( [ 1, 2, 3 ], 'wrong' ) );
      test.shouldThrowErrorSync( () => descriptor.bufferMake( [ 1, 2, 3 ], Infinity  ) );
    }
  }
}

bufferMakeWithArrayAndUnrollLongDescriptor.timeOut = 15000;

//

function bufferMakeWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'src - empty long, not ins';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMake( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMake( src, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMake( src, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMake( src, [] );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMake( src, [ 1, 2, 3 ] );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 4 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = _.argumentsArray.make( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMake( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMake( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMake( null, _.argumentsArray.make( 5 ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMake( 5, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMake( 5, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMake( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = _.argumentsArray.make( [ 1, 2, 3 ] )
    var got = descriptor.bufferMake( F32x, ins );
    var expected = new F32x( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMake( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
    var got = descriptor.bufferMake( Array, ins );
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
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, long - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, long - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeBuffer )
  {
    test.case = 'src - empty buffer, not ins';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMake( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMake( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMake( null, new U8x( 5 ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMake( 5, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMake( 5, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMake( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( F32x, ins );
    var expected = new F32x( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMake( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = descriptor.bufferMake( Array, ins );
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
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, new U8x( 5 ) );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
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

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined() );

  test.case = 'extra argument';
  test.shouldThrowErrorSync( () => _.bufferMakeUndefined( [ 1, 2, 3 ], 4, 'extra' ) );

  test.case = 'wrong type of ins';
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
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - null';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, null );
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - undefined';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - number';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, 2 );
  var expected = _./*longDescriptor*/defaultLong.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - empty array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, [] );
  var expected = _./*longDescriptor*/defaultLong.make( [] );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - empty long, ins - array';
  var src = _.argumentsArray.make( [] );
  var got = _.bufferMakeUndefined( src, [ 1, 2, 3 ] );
  var expected = _./*longDescriptor*/defaultLong.make( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, not ins';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src );
  var expected = _./*longDescriptor*/defaultLong.make( 3 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins < src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src, 2 );
  var expected = _./*longDescriptor*/defaultLong.make( 2 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - number, ins > src.length';
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src, 4 );
  var expected = _./*longDescriptor*/defaultLong.make( 4 );
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'src - filled long, ins - array, ins.length > src.length';
  var src = _.argumentsArray.make( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMakeUndefined( src, ins );
  var expected = _./*longDescriptor*/defaultLong.make( 3 );
  test.identical( got, expected );
  test.true( got !== ins );
  test.true( got !== src );

  /* */

  test.case = 'src - null';
  var got = _.bufferMakeUndefined( null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, _.argumentsArray.make( 5 ) );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
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
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, new U8x( 5 ) );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _./*longDescriptor*/defaultLong.make( 5 );
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
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, buffer - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, buffer - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeBuffer )
  {
    test.case = 'src - empty long, not ins';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMakeUndefined( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMakeUndefined( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMakeUndefined( null, new U8x( 5 ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMakeUndefined( 5, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMakeUndefined( 5, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( F32x, ins );
    var expected = new F32x( 3 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = descriptor.bufferMakeUndefined( Array, ins );
    var expected = new Array( 5 );
    test.identical( got, expected );
    test.true( got !== ins );

    /* - */

    if( Config.debug )
    {
      test.case = 'without arguments';
      test.shouldThrowErrorSync( () => descriptor.bufferMakeUndefined() );

      test.case = 'extra argument';
      test.shouldThrowErrorSync( () => descriptor.bufferMakeUndefined( [ 1, 2, 3 ], 4, 'extra' ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => descriptor.bufferMakeUndefined( 'wrong', 1 ) );
      test.shouldThrowErrorSync( () => descriptor.bufferMakeUndefined( 1, 1 ) );

      test.case = 'wrong type of ins';
      test.shouldThrowErrorSync( () => descriptor.bufferMakeUndefined( [ 1, 2, 3 ], 'wrong' ) );
      test.shouldThrowErrorSync( () => descriptor.bufferMakeUndefined( [ 1, 2, 3 ], Infinity  ) );
    }
  }
}

bufferMakeUndefinedWithArrayAndUnrollLongDescriptor.timeOut = 15000;

//

function bufferMakeUndefinedWithArgumentsArrayLongDescriptor( test )
{
  let times = 4;
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    test.open( `descriptor - ${ name }` );
    testRun( descriptor );
    test.close( `descriptor - ${ name }` );

    if( times < 1 )
    break;
    times--;
  }

  /* - */

  function testRun( descriptor )
  {
    test.case = 'src - empty long, not ins';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMakeUndefined( src, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMakeUndefined( src, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMakeUndefined( src, [] );
    var expected = descriptor./*longDescriptor*/defaultLong.make( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = _.argumentsArray.make( [] );
    var got = descriptor.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, not ins';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 4 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = _.argumentsArray.make( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( src, ins );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMakeUndefined( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMakeUndefined( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMakeUndefined( null, _.argumentsArray.make( 5 ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMakeUndefined( 5, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMakeUndefined( 5, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = _.argumentsArray.make( [ 1, 2, 3 ] )
    var got = descriptor.bufferMakeUndefined( F32x, ins );
    var expected = new F32x( 3 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = _.argumentsArray.make( [ 1, 1, 1, 1, 1 ] );
    var got = descriptor.bufferMakeUndefined( Array, ins );
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
  for( let e in _.LongDescriptors )
  {
    let name = _.LongDescriptors[ e ].name;
    let descriptor = _.withLong[ name ];

    for( let i = 0; i < list.length; i++ )
    {
      test.open( `descriptor - ${ name }, long - ${ list[ i ].name }` );
      testRun( descriptor, list[ i ] );
      test.close( `descriptor - ${ name }, long - ${ list[ i ].name }` );
    }

    if( times < 1 )
    break;
    times--;
  }

  /* test subroutine */

  function testRun( descriptor, makeBuffer )
  {
    test.case = 'src - empty buffer, not ins';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, null );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, undefined );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.true( got !== ins );
    test.true( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMakeUndefined( null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMakeUndefined( null, 5 );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMakeUndefined( null, new U8x( 5 ) );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMakeUndefined( 5, null );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMakeUndefined( 5, undefined );
    var expected = descriptor./*longDescriptor*/defaultLong.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( F32x, ins );
    var expected = new F32x( 3 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = [ 1, 1, 1, 1, 1 ];
    var got = descriptor.bufferMakeUndefined( Array, ins );
    var expected = new Array( 5 );
    test.identical( got, expected );
    test.true( got !== ins );
  }
}

bufferMakeUndefinedWithBuffersLongDescriptor.timeOut = 15000;

//

function bufferFrom( test )
{
  test.open( 'src - null' );

  test.case = 'bufferConstructor - BufferRaw';
  var got = _.bufferFrom({ src : null, bufferConstructor : BufferRaw });
  test.identical( got, new BufferRaw( 0 ) );

  test.case = 'bufferConstructor - BufferView';
  var got = _.bufferFrom({ src : null, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new BufferRaw( 0 ) ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var got = _.bufferFrom({ src : null, bufferConstructor : U8x });
  test.identical( got, new U8x( 0 ) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var got = _.bufferFrom({ src : null, bufferConstructor : Fx });
  test.identical( got, new F32x( 0 ) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var got0 = _.bufferFrom({ src : null, bufferConstructor : BufferNode });
    test.identical( got0, BufferNode.alloc( 0 ) );
  }

  test.close( 'src - null' );

  /* - */

  test.open( 'src - number' );

  test.case = 'bufferConstructor - BufferRaw';
  var got = _.bufferFrom({ src : 2, bufferConstructor : BufferRaw });
  test.identical( got, new BufferRaw( 2 ) );

  test.case = 'bufferConstructor - BufferView';
  var got = _.bufferFrom({ src : 2, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new BufferRaw( 2 ) ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var got = _.bufferFrom({ src : 2, bufferConstructor : U8x });
  test.identical( got, new U8x( 2 ) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var got = _.bufferFrom({ src : 2, bufferConstructor : Fx });
  test.identical( got, new F32x( 2 ) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var got1 = _.bufferFrom({ src : 2, bufferConstructor : BufferNode });
    test.identical( got1, BufferNode.alloc( 2 ) );
  }

  test.close( 'src - number' );

  /* - */

  test.open( 'src - string' );

  test.case = 'bufferConstructor - BufferRaw';
  var got = _.bufferFrom({ src : 'abc', bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 97, 98, 99 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var got = _.bufferFrom({ src : 'abc', bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 97, 98, 99 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var got = _.bufferFrom({ src : 'abc', bufferConstructor : U8x });
  test.identical( got, new U8x([ 97, 98, 99 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var got = _.bufferFrom({ src : 'abc', bufferConstructor : Fx });
  test.identical( got, new F32x([ 97, 98, 99 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var got2 = _.bufferFrom({ src : 'abc', bufferConstructor : BufferNode });
    test.identical( got2, BufferNode.from([ 97, 98, 99 ]) );
  }

  test.close( 'src - string' );

  /* - */

  test.open( 'src - BufferRaw' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );
  test.true( got === src );

  test.case = 'bufferConstructor - BufferView';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new F32x([ 1, 2, 3 ]).buffer;
  var got = _.bufferFrom({ src, bufferConstructor : Fx });
  test.identical( got, new F32x([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src3 = new U8x([ 1, 2, 3 ]).buffer;
    var got3 = _.bufferFrom({ src : src3, bufferConstructor : BufferNode });
    test.identical( got3, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - BufferRaw' );

  /* - */

  test.open( 'src - BufferView' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );
  test.true( got === src );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new BufferView( new F32x([ 1, 2, 3 ]).buffer );
  var got = _.bufferFrom({ src, bufferConstructor : Fx });
  test.identical( got, new Fx([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src4 = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
    var got4 = _.bufferFrom({ src : src4, bufferConstructor : BufferNode });
    test.identical( got4, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - BufferView' );

  /* - */

  test.open( 'src - Long' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = [ 1, 2, 3 ];
  var got = _.bufferFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var src = _.unroll.make([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = [ 1, 2, 3 ];
  var got = _.bufferFrom({ src, bufferConstructor : Fx });
  test.identical( got, new F32x([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src5 = _.unroll.make([ 1, 2, 3 ]);
    var got5 = _.bufferFrom({ src : src5, bufferConstructor : BufferNode });
    test.identical( got5, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - Long' );

  /* - */

  test.open( 'src - bufferTyped' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = new I16x([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var src = new F32x([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new U8x([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );
  test.true( got === src );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new U16x([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : Fx });
  test.identical( got, new F32x([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src6 = new I32x([ 1, 2, 3 ]);
    var got6 = _.bufferFrom({ src : src6, bufferConstructor : BufferNode });
    test.identical( got6, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - bufferTyped' );

  /* - */

  test.open( 'bufferConstructor - BufferRawShared' );

  test.case = 'src - BufferRaw';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'src - BufferView';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new U8x([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new F32x([ 1, 2, 3 ]);
  var got = _.bufferFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src7 = BufferNode.from([ 1, 2, 3 ]);
    var got7 = _.bufferFrom({ src : src7, bufferConstructor : BufferRawShared });
    test.equivalent( got7, new U8x([ 1, 2, 3 ]).buffer );
  }

  test.close( 'bufferConstructor - BufferRawShared' );

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'src - BufferNode' );

    test.case = 'bufferConstructor - BufferRaw';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferFrom({ src : src8, bufferConstructor : BufferRaw });
    test.identical( got8, new U8x([ 1, 2, 3 ]).buffer );

    test.case = 'bufferConstructor - BufferView';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferFrom({ src : src8, bufferConstructor : BufferView });
    test.identical( got8, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

    test.case = 'bufferConstructor - bufferTyped, U8x';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferFrom({ src : src8, bufferConstructor : U8x });
    test.identical( got8, new U8x([ 1, 2, 3 ]) );

    test.case = 'bufferConstructor - bufferTyped, Fx';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferFrom({ src : src8, bufferConstructor : Fx });
    test.identical( got8, new F32x([ 1, 2, 3 ]) );

    test.case = 'bufferConstructor - BufferNode';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferFrom({ src : src8, bufferConstructor : BufferNode });
    test.identical( got8, BufferNode.from([ 1, 2, 3 ]) );
    test.true( got8 === src8 );

    test.close( 'src - BufferNode' );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferFrom( { src : 2, bufferConstructor : U8x }, 'extra' ) );

  test.case = 'wrong type of options map o';
  test.shouldThrowErrorSync( () => _.bufferFrom( [] ) );
  test.shouldThrowErrorSync( () => _.bufferFrom( null ) );

  test.case = 'wrong type of o.src';
  test.shouldThrowErrorSync( () => _.bufferFrom({ src : {}, bufferConstructor : U8x }) );

  test.case = 'wrong type of o.bufferConstructor';
  test.shouldThrowErrorSync( () => _.bufferFrom({ src : new U8x( 3 ), bufferConstructor : 'wrong' }) );

  test.case = 'options map has not all options';
  test.shouldThrowErrorSync( () => _.bufferFrom({ src : new U8x( 3 ) }) );
  test.shouldThrowErrorSync( () => _.bufferFrom({ bufferConstructor : U8x }) );

  test.case = 'unknown field in options map';
  test.shouldThrowErrorSync( () => _.bufferFrom({ src : new U8x( 3 ), bufferConstructor : U8x, unknown : 1 }) );
}

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

// //
//
// function bufferBut( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferBut( dst, -5, [ 0 ] );
//   test.identical( got, [ 0, 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [ 2 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = array, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 4 ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferBut( dst, -5, [ 2 ] );
//   test.identical( got, [ 2, 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [ 2 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 4 ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferBut( dst, -5, [ 2 ] );
//   test.identical( got, [ 2, 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [ 2 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 4 ] );
//   test.true( got !== dst );
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 1, 2 ] );
//     var expected = buf( [ 0, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 1, 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ -1, -5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferBut( dst1, [ 1, 2 ], src1 );
//       var expected1 = buf( [ 0, 1, 2, 3, 2, 3 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 0, 0, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, 2, [ 5 ] );
//     var expected = buf( [ 0, 1, 5, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, -2, [ 5 ] );
//     var expected = buf( [ 5, 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [ 0, 1, 5, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [ 1, 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 1, 8 ], [ 1 ] );
//     var expected = buf( [ 0, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [ 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     var dst = buf( [] );
//     var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [ 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ 1, 2 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ 1, 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ -1, -5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferBut( dst1, [ 1, 2 ], src1 );
//       var expected1 = bufferExpected( dst1, [ 0, 1, 2, 3, 0, 0 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferBut( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, 2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 5, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 5, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 5, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 1, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferBut( dst, [ 1, 8 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [ 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferBut() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 2 ], [ 1 ], [ 4 ] ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong value in dst';
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 3 ], 'str' ) );
//   test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 3 ], { a : 1 } ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferBut( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }
//
// //
//
// function bufferButInplace( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferButInplace( dst, -5, [ 0 ] );
//   test.identical( got, [ 0, 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [ 2 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = array, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 4 ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferButInplace( dst, -5, [ 2 ] );
//   test.identical( got, [ 2, 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [ 2 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 4 ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferButInplace( dst, -5, [ 2 ] );
//   test.identical( got, [ 2, 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [ 2 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 4 ] );
//   test.true( got !== dst );
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 1, 2 ] );
//     var expected = buf( [ 0, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 1, 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ -1, -5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferButInplace( dst1, [ 1, 2 ], src1 );
//       var expected1 = buf( [ 0, 1, 2, 3, 2, 3 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 0, 0, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, 2, [ 5 ] );
//     var expected = buf( [ 0, 1, 5, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, -2, [ 5 ] );
//     var expected = buf( [ 5, 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [ 0, 1, 5, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [ 1, 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 1, 8 ], [ 1 ] );
//     var expected = buf( [ 0, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [ 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     var dst = buf( [] );
//     var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [ 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ 1, 2 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ 1, 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ -1, -5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferButInplace( dst1, [ 1, 2 ], src1 );
//       var expected1 = bufferExpected( dst1, [ 0, 1, 2, 3, 0, 0 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferButInplace( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, 2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 5, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 5, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 5, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 1, 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferButInplace( dst, [ 1, 8 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [ 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferButInplace() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 2 ], [ 1 ], [ 4 ] ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong value in dst';
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 3 ], 'str' ) );
//   test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 3 ], { a : 1 } ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferButInplace( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }

//

function bufferBut_DstIsArrayUnroll( test )
{
  test.case = 'dst = array, range - number < 0, without ins';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut_( dst, -5 );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.true( got === dst );

  test.case = 'dst = empty array, range - number === 0, ins';
  var dst = [];
  var got = _.bufferBut_( dst, dst, 0, [ 1, 2 ] );
  test.identical( got, [ 1, 2 ] );
  test.true( got === dst );

  test.case = 'dst = array, range - number > 0, without ins';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut_( dst, dst, 1 );
  test.identical( got, [ 1, 3, 4 ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, range = number > src.length, ins';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( null, dst, 5, [ 0, 2 ] );
  test.identical( got, [ 1, 2, 3, 4, 0, 2 ] );
  test.true( got !== dst );

  test.case = 'dst = empty unroll, range[ 0 ] > 0, range[ 1 ] > range[ 0 ], without ins';
  var dst = _.unroll.from( [] );
  var got = _.bufferBut_( null, dst, [ 1, 2 ] );
  test.identical( got, [] );
  test.true( got !== dst );

  test.case = 'dst = unroll, range[ 0 ] > 0, range[ 1 ] < range[ 0 ], ins';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( null, dst, [ 1, 0 ], [ 0, 0 ] );
  test.identical( got, [ 1, 0, 0, 2, 3, 4 ] );
  test.true( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, range[ 0 ] === 0, range[ 1 ] === 0, without ins';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( dst, [ 0, 0 ] );
  test.identical( got, [ 2, 3, 4 ] );
  test.true( got !== dst );

  test.case = 'dst = empty argumentsArray, range[ 0 ] > range[ 1 ], ins';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferBut_( dst, [ 0, -1 ], [ 1, 2 ] );
  test.identical( got, [ 1, 2 ] );
  test.true( got !== dst );

  test.case = 'dst = argumentsArray, range - undefined, ins';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( dst, undefined, [ 1, 2 ] );
  test.identical( got, _.argumentsArray.make([ 1, 2, 3, 4 ]) );
  test.true( got === dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferBut_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferBut_( new I16x( 10 ), [ 1, 2 ], 1, [ 4 ], 'extra' ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferBut_( undefined, [ 1, 3 ], [ 0, 0 ], [ 1 ] ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferBut_( new I16x( 10 ), 'wrong', 1, [ 4 ] ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.bufferBut_( new I16x( 10 ), [ 1, 2, 3 ], null, [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut_( new I16x( 10 ), [ 1, 2, 3 ], {}, [ 1 ] ) );
}

//

function bufferBut_DstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( bufferMake )
  {
    test.open( 'not inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 0 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ] );
    var expected = bufferMake( [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ -1, -5 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], [ 1, 2, 3 ] );
    var expected = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = unroll';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.unroll.make( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], val );
    var expected = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], val );
    var expected = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst1 = bufferMake( [ 0, 1, 2, 3 ] );
      var val1 = BufferNode.from( [ 1, 2, 3 ] );
      var got1 = _.bufferBut_( dst1, [ 1, 1 ], val1 );
      var expected1 = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got1, expected1 );
      test.true( got1 !== dst1 );
    }

    test.case = 'val = bufferTyped';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = new I32x( 2 );
    var got = _.bufferBut_( dst, [ 1, 1 ], val );
    var expected = bufferMake( [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, 1, [ 5 ] );
    var expected = bufferMake( [ 0, 5, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, -2, [ 5 ] );
    var expected = bufferMake( [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], [ 5 ] );
    var expected = bufferMake( [ 0, 5, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 0, 3 ], [ 1 ] );
    var expected = bufferMake( [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferMake( [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferMake( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferMake( [ 0, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = bufferMake( [] );
    var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferMake( [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = [ 1, 2, 3 ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst0, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 1, 2, 3, 1 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst0 = [ { a : 2 }, { b : 3 } ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst0, dst, [ 1, 8 ], [ 1 ] );
    var expected = [ 0, 1 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, dst = empty BufferTyped, val';
    var dst0 = new F32x( [ 5 ] );
    var dst = bufferMake( [] );
    var got = _.bufferBut_( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new F32x( [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    var dst0 = new BufferRaw( 1 );
    var dst = bufferMake( [] );
    var got = _.bufferBut_( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new U8x( [ 2 ] ).buffer;
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst, [ 1, 0 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst, [ -1, -5 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.close( 'inplace' );
  }
}

//

function bufferBut_DstIsBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  var bufferExpected = ( dst, src ) =>
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  testRun( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  testRun( bufferView );
  test.close( 'bufferView' );

  /* - */

  function testRun( bufferMake )
  {
    test.open( 'not inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 0 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ] );
    var expected = bufferMake( [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ -1, -5 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], [ 1, 2, 3 ] );
    var expected = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = unroll';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.unroll.make( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], val );
    var expected = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], val );
    var expected = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst1 = bufferMake( [ 0, 1, 2, 3 ] );
      var val1 = BufferNode.from( [ 1, 2, 3 ] );
      var got1 = _.bufferBut_( dst1, [ 1, 1 ], val1 );
      var expected1 = bufferMake( [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got1, expected1 );
      test.true( got1 !== dst1 );
    }

    test.case = 'val = bufferTyped';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = new I32x( 2 );
    var got = _.bufferBut_( dst, [ 1, 1 ], val );
    var expected = bufferMake( [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, 1, [ 5 ] );
    var expected = bufferMake( [ 0, 5, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, -2, [ 5 ] );
    var expected = bufferMake( [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ], [ 5 ] );
    var expected = bufferMake( [ 0, 5, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 0, 3 ], [ 1 ] );
    var expected = bufferMake( [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferMake( [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferMake( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferMake( [ 0, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = bufferMake( [] );
    var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferMake( [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = [ 1, 2, 3 ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst0, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 1, 2, 3, 1 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst0 = [ { a : 2 }, { b : 3 } ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst0, dst, [ 1, 8 ], [ 1 ] );
    var expected = [ 0, 1 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, dst = empty BufferTyped, val';
    var dst0 = new F32x( [ 5 ] );
    var dst = bufferMake( [] );
    var got = _.bufferBut_( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new F32x( [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    var dst0 = new BufferRaw( 1 );
    var dst = bufferMake( [] );
    var got = _.bufferBut_( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new U8x( [ 2 ] ).buffer;
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst, [ 1, 0 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst, [ -1, -5 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.close( 'inplace' );
  }
}

//

function bufferBut_CheckReturnedContainer( test )
{
  test.case = 'dst - undefined, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferBut_( src, 1, [ 0 ] );
  var expected = new U8x([ 1, 0, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - null, new container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferBut_( null, src, 1, [ 0 ] );
  var expected = new U8x([ 1, 0, 3 ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'dst - src, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferBut_( src, src, 1, [ 0 ] );
  var expected = new U8x([ 1, 0, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - another container, dst container';
  var src = new U8x([ 1, 2, 3 ] );
  var dst = [];
  var got = _.bufferBut_( dst, src, 1, [ 0 ] );
  var expected = [ 1, 0, 3 ];
  test.identical( got, expected );
  test.true( got === dst );
}

// //
//
// function bufferOnly( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferOnly( dst, -5, [ 0 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferOnly( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = array, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferOnly( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 2, 3 ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnly( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferOnly( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnly( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 2, 3 ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnly( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferOnly( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnly( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 2, 3 ] );
//   test.true( got !== dst );
//
//   /* - */
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 1, 2 ] );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, 0 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, -5 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferOnly( dst, [ 1, 2 ], src );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 1, 3 ], src );
//     var expected = buf( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 1, 3 ], src );
//     var expected = buf( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferOnly( dst1, [ 1, 3 ], src1 );
//       var expected1 = buf( [ 1, 2 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferOnly( dst, [ 1, 2 ], src );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, 2, [ 5 ] );
//     var expected = buf( [ 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, -2, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 1, 8 ], [ 1 ] );
//     var expected = buf( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferOnly( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     var dst = buf( [] );
//     var got = _.bufferOnly( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, [ 1, 2 ] );
//     var expected = bufferExpected( dst, [ 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, 0 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, -5 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferOnly( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnly( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferOnly( dst1, [ 1, 2 ], src1 );
//       var expected1 = bufferExpected( dst1, [ 0 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferOnly( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, 2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferOnly( dst, [ 1, 8 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferOnly( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferOnly() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong value in src';
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, [ 1, 3 ], 'str' ) );
//   test.shouldThrowErrorSync( () => _.bufferOnly( dst, [ 1, 3 ], { a : 1 } ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferOnly( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }
//
// //
//
// function bufferOnlyInplace( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferOnlyInplace( dst, -5, [ 0 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferOnlyInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got === dst );
//
//   test.case = 'dst = array, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferOnlyInplace( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 2, 3 ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnlyInplace( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferOnlyInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got === dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnlyInplace( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 2, 3 ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnlyInplace( dst, -5, [ 2 ] );
//   test.identical( got, _.argumentsArray.from( [ 1, 2, 3, 4 ] ) );
//   test.true( got === dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferOnlyInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, _.argumentsArray.from( [] ) );
//   test.true( got === dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferOnlyInplace( dst, [ 1, 3 ], [ 2 ] );
//   test.identical( got, [ 2, 3 ] );
//   test.true( got !== dst );
//
//   /* - */
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 1, 2 ] );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, 0 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, -5 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferOnlyInplace( dst, [ 1, 2 ], src );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 1, 3 ], src );
//     var expected = buf( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 1, 3 ], src );
//     var expected = buf( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferOnlyInplace( dst1, [ 1, 3 ], src1 );
//       var expected1 = buf( [ 1, 2 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferOnlyInplace( dst, [ 1, 2 ], src );
//     var expected = buf( [ 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, 2, [ 5 ] );
//     var expected = buf( [ 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, -2, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 1, 8 ], [ 1 ] );
//     var expected = buf( [ 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferOnlyInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     var dst = buf( [] );
//     var got = _.bufferOnlyInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//   }
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, [ 1, 2 ] );
//     var expected = bufferExpected( dst, [ 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, 0 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, -5 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferOnlyInplace( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, [ 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferOnlyInplace( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferOnlyInplace( dst1, [ 1, 2 ], src1 );
//       var expected1 = bufferExpected( dst1, [ 0 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferOnlyInplace( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, 2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferOnlyInplace( dst, [ 1, 8 ], [ 1 ] );
//     var expected = bufferExpected( dst, [ 0, 0, 0 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferOnlyInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong value in src';
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, [ 1, 3 ], 'str' ) );
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( dst, [ 1, 3 ], { a : 1 } ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferOnlyInplace( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }

//

function bufferOnly_DstIsArrayUnroll( test )
{
  test.case = 'dst = array, range - number < 0';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferOnly_( dst, -5 );
  test.identical( got, [] );
  test.true( got === dst );

  test.case = 'dst = empty array, range - number === 0';
  var dst = [];
  var got = _.bufferOnly_( dst, dst, 0 );
  test.identical( got, [] );
  test.true( got === dst );

  test.case = 'dst = array, range - number > 0';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferOnly_( dst, dst, 1 );
  test.identical( got, [ 1, 2 ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, range = number > src.length';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferOnly_( null, dst, 5 );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.true( got !== dst );

  test.case = 'dst = empty unroll, range[ 0 ] > 0, range[ 1 ] > range[ 0 ]';
  var dst = _.unroll.from( [] );
  var got = _.bufferOnly_( null, dst, [ 1, 2 ] );
  test.identical( got, [] );
  test.true( got !== dst );

  test.case = 'dst = unroll, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferOnly_( null, dst, [ 1, 0 ] );
  test.identical( got, [] );
  test.true( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, range[ 0 ] === 0, range[ 1 ] === 0';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferOnly_( dst, [ 0, 0 ] );
  test.identical( got, [ 1 ] );
  test.true( got !== dst );

  test.case = 'dst = empty argumentsArray, range[ 0 ] > range[ 1 ]';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferOnly_( dst, [ 0, -1 ] );
  test.identical( got, _.argumentsArray.make( [] ) );
  test.true( got === dst );

  test.case = 'dst = argumentsArray';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferOnly_( dst );
  test.identical( got, _.argumentsArray.make([ 1, 2, 3, 4 ]) );
  test.true( got === dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferOnly_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferOnly_( new I16x( 10 ), [ 1 ], [ 0, 0 ], 'extra' ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferOnly_( 'str', [ 1, 3 ], [ 0, 1 ] ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferOnly_( new I16x( 10 ), null, [ 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.bufferOnly_( new I16x( 10 ), {}, [ 2, 2 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.bufferOnly_( new I16x( 10 ), [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferOnly_( new I16x( 10 ), [ 1, 3 ], { a : 1 } ) );
}

//

function bufferOnly_DstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    testRun( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function testRun( makeBuffer )
  {
    test.open( 'not inplace' );

    test.case = 'only dst';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst );
    var expected = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, -1 );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, 0 );
    var expected = makeBuffer( [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, 2 );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, 2 );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, -3 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, -1 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, 0 ] );
    var expected = makeBuffer( [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, 2 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, 5 ] );
    var expected = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 0 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 1 ] );
    var expected = makeBuffer( [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 2 ] );
    var expected = makeBuffer( [ 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 5 ] );
    var expected = makeBuffer( [ 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 5, 4 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 5, 5 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 5, 7 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'only dst';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst );
    var expected = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'dst, range - number < 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, -1 );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, 0 );
    var expected = makeBuffer( [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, 2 );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, 2 );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, -3 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, -1 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, 0 ] );
    var expected = makeBuffer( [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, 2 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, 5 ] );
    var expected = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got === dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 0 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 1 ] );
    var expected = makeBuffer( [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 2 ] );
    var expected = makeBuffer( [ 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 5 ] );
    var expected = makeBuffer( [ 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 5, 4 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 5, 5 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 5, 7 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.close( 'inplace' );
  }
}

//

function bufferOnly_DstIsBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  var bufferExpected = ( dst, src ) =>
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  testRun( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  testRun( bufferView );
  test.close( 'bufferView' );

  /* - */

  function testRun( makeBuffer )
  {
    test.open( 'not inplace' );

    test.case = 'only dst';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst );
    var expected = bufferExpected( dst, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, -1 );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, 0 );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, 2 );
    var expected = bufferExpected( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, 2 );
    var expected = bufferExpected( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, -3 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, -1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, 0 ] );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, 2 ] );
    var expected = bufferExpected( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ -1, 5 ] );
    var expected = bufferExpected( dst, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 0 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 1, 5 ] );
    var expected = bufferExpected( dst, [ 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 5, 4 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 5, 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( null, dst, [ 5, 7 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'only dst';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst );
    var expected = bufferExpected( dst, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'dst, range - number < 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, -1 );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, 0 );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, 2 );
    var expected = bufferExpected( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, 2 );
    var expected = bufferExpected( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, -3 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, -1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, 0 ] );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, 2 ] );
    var expected = bufferExpected( dst, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ -1, 5 ] );
    var expected = bufferExpected( dst, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got === dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 0 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 1, 5 ] );
    var expected = bufferExpected( dst, [ 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 5, 4 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 5, 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferOnly_( dst, [ 5, 7 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.close( 'inplace' );
  }
}

//

function bufferOnly_CheckReturnedContainer( test )
{
  test.case = 'dst - undefined, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferOnly_( src, [ 0, 2 ] );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - null, new container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferOnly_( null, src, [ 0, 2 ] );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'dst - src, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferOnly_( src, src, [ 0, 2 ] );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - another container, dst container';
  var src = new U8x([ 1, 2, 3 ] );
  var dst = [];
  var got = _.bufferOnly_( dst, src, [ 0, 2 ] );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.true( got === dst );
}

// //
//
// function bufferGrow( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferGrow( dst, -5, [ 0 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrow( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrow( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 1, 2 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] )
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, 0 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, -5 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferGrow( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 1, 5 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 1, 6 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferGrow( dst1, [ 1, 3 ], src1 );
//       var expected1 = buf( [ 0, 1, 2, 3 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferGrow( dst, [ 1, 5 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, 6, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3, 5, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, -2, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 1, 8 ], 1 );
//     var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     var dst = buf( [] );
//     var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, [ 1, 2 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, 0 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, -5 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferGrow( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 1, 5 ], src );
//     var expected = bufferExpected( dst, 5 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrow( dst, [ 1, 6 ], src );
//     var expected = bufferExpected( dst, 6 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferGrow( dst1, [ 1, 2 ], src1 );
//       var expected1 = bufferExpected( dst1, 4 );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferGrow( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number, src = number';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, 6, 1 );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferGrow( dst, [ 1, 8 ], 1 );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferGrow() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferGrow( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferGrow( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrow( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrow( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrow( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrow( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferGrow( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }
//
// //
//
// function bufferGrowInplace( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferGrowInplace( dst, -5, [ 0 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got === dst );
//
//   test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrowInplace( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got === dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrowInplace( dst, -5, [ 2 ] );
//   test.identical( got, _.argumentsArray.from( [ 1, 2, 3, 4 ] ) );
//   test.true( got === dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, _.argumentsArray.from( [] ) );
//   test.true( got === dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 1, 2 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] )
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, 0 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, -5 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 1, 6 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferGrowInplace( dst1, [ 1, 3 ], src1 );
//       var expected1 = buf( [ 0, 1, 2, 3 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 === dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, 6, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3, 5, 5 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, -2, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 1, 8 ], 1 );
//     var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     var dst = buf( [] );
//     var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//   }
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, [ 1, 2 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, 0 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, -5 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
//     var expected = bufferExpected( dst, 5 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferGrowInplace( dst, [ 1, 6 ], src );
//     var expected = bufferExpected( dst, 6 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferGrowInplace( dst1, [ 1, 2 ], src1 );
//       var expected1 = bufferExpected( dst1, 4 );
//       test.identical( got1, expected1 );
//       test.true( got1 === dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferGrowInplace( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range = number, src = number';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, 6, 1 );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferGrowInplace( dst, [ 1, 8 ], 1 );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferGrowInplace( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }

//

function bufferGrow_( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, val = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow_( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.true( got === dst );

  test.case = 'dst = empty array, val = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferGrow_( dst, [ 0, -1 ], [ 2 ] );
  test.identical( got, [] );
  test.true( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, val = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow_( dst, [ 1, 4 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, val = array, range = negative number';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.true( got === dst );

  test.case = 'dst = empty unroll, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unroll.from( [] );
  var got = _.bufferGrow_( dst, [ 0, -1 ], [ 2 ] );
  test.identical( got, [] );
  test.true( got === dst );

  test.case = 'dst = unroll, val = array';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, [ 1, 4 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = argumentsArray, val = array, range = negative number';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArray.make( [ 1, 2, 3, 4 ] ) );
  test.true( got === dst );

  test.case = 'dst = empty argumentsArray, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferGrow_( dst, [ 0, -1 ], [ 2 ] );
  test.identical( got, _.argumentsArray.make( [] ) );
  test.true( got === dst );

  test.case = 'dst = argumentsArray, val = array';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, [ 1, 4 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.true( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    test.open( 'not inplace' );

    test.case = 'val = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 1, 2, 3 ] )
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferGrow_( dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 4 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 5 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst1 = buf( [ 0, 1, 2, 3 ] );
      var val1 = BufferNode.from( [ 1, 2, 3 ] );
      var got1 = _.bufferGrow_( dst1, [ 1, 3 ], val1 );
      var expected1 = buf( [ 0, 1, 2, 3 ] );
      test.identical( got1, expected1 );
      test.true( got1 === dst1 );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new I32x( 1 );
    var got = _.bufferGrow_( dst, [ 1, 4 ], val );
    var expected = buf( [ 0, 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, 5, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 0, 3 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ -2, -2 ], [ 1 ] );
    var expected = buf( [ 1, 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 7 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst0, range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst0 = new BufferRaw( 4 );
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst0, dst, [ 0, 3 ], [ 1 ] );
    var expected = new U8x( [ 0, 1, 2, 3 ] ).buffer;
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst0 = new BufferRaw( 3 );
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst0, dst, [ -2, -2 ], [ 1 ] );
    var expected = new U8x( [ 1, 1, 0, 1, 2, 3 ] ).buffer;
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ] );
    var expected = buf( [ 0, 1, 2, 3 ] )
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst2 = buf( [ 0, 1, 2, 3 ] );
      var val2 = BufferNode.from( [ 1, 2, 3 ] );
      var got2 = _.bufferGrow_( dst2, dst2, [ 1, 3 ], val2 );
      var expected2 = buf( [ 0, 1, 2, 3 ] );
      test.identical( got2, expected2 );
      test.true( got2 === dst2 );
    }

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 0, 3 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ -2, -2 ], [ 1 ] );
    var expected = buf( [ 1, 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = [ 1, 2, 3 ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst0, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 1, 2, 3 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val = number';
    var dst0 = [ 1, 2, 3 ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst0, dst, [ 1, 7 ], 1 );
    var expected = [ 0, 1, 2, 3, 1, 1, 1, 1 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.close( 'inplace' );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = ( dst, src ) =>
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.open( 'not inplace' );

    test.case = 'val = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = array';
    var dst = buf( 4 );
    var val = [ 3 ];
    var got = _.bufferGrow_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = unroll';
    var dst = buf( 4 );
    var val = _.unroll.make( [ 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 4 ], val );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( 4 );
    var val = _.argumentsArray.make( [ 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 5 ], val );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst1 = buf( 4 );
      var val1 = BufferNode.from( [ 3 ] );
      var got1 = _.bufferGrow_( dst1, [ 1, 2 ], val1 );
      var expected1 = bufferExpected( dst1, 4 );
      test.identical( got1, expected1 );
      test.true( got1 === dst1 );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( 4 );
    var val = new I32x( 2 );
    var got = _.bufferGrow_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range = number, val = number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, 5, 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 0, 3 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ -2, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1, 1, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 1, 7 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferGrow_( dst, [ 0, -1 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got === dst );

    /* */

    test.case = 'dst0, range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst0 = new U8x([ 1, 2, 3 ]);
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst0, dst, [ -2, -2 ], 1 );
    var expected = new U8x([ 1, 1, 0, 0, 0, 0 ]);
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = new BufferView( new U8x( [ 1, 2, 3, 4 ] ).buffer );
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst0, dst, [ 4, 1 ], [ 1 ] );
    var expected = new BufferView( new BufferRaw( 4 ) );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst0 = new BufferView( new BufferRaw( 2 ) );
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst0, dst, [ 1, 7 ], 1 );
    var expected = new BufferView( new U8x( [ 0, 0, 0, 0, 1, 1, 1, 1 ] ).buffer );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'val = array';
    var dst = buf( 4 );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst2 = buf( 4 );
      var val2 = BufferNode.from( [ 1, 2, 3 ] );
      var got2 = _.bufferGrow_( dst2, dst2, [ 1, 2 ], val2 );
      var expected2 = bufferExpected( dst2, 4 );
      test.identical( got2, expected2 );
      test.true( got2 === dst2 );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( 4 );
    var val = new I32x( 2 );
    var got = _.bufferGrow_( dst, dst, [ 1, 3 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 0, 3 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ -2, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1, 1, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferGrow_( dst, dst, [ 0, -1 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.true( got === dst );

    test.case = 'dst0, dst = empty BufferTyped, val';
    var dst0 = [ 1, 2, 3 ];
    var dst = buf( [] );
    var got = _.bufferGrow_( dst0, dst, [ 0, -1 ], [ 2 ] );
    var expected = [];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.close( 'inplace' );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferGrow_() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrow_( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrow_( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow_( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow_( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow_( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow_( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferGrow_( 'str', [ 1, 3 ], [ 1 ] ) );
}

//

function bufferGrow_CheckReturnedContainer( test )
{
  test.case = 'dst - undefined, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferGrow_( src, [ 0, 2 ], 0 );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - null, new container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferGrow_( null, src, [ 0, 2 ], 0 );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'dst - src, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferGrow_( src, src, [ 0, 2 ], 0 );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - another container, dst container';
  var src = new U8x([ 1, 2, 3 ] );
  var dst = [];
  var got = _.bufferGrow_( dst, src, [ 0, 2 ], 0 );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.true( got === dst );
}

// //
//
// function bufferRelength( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferRelength( dst, -5, [ 0 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelength( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelength( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got !== dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got !== dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 1, 3 ] );
//     var expected = buf( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, 0 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, -5 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferRelength( dst, [ 1, 5 ], src );
//     var expected = buf( [ 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ -1, 5 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 1, 6 ], src );
//     var expected = buf( [ 1, 2, 3, NaN, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferRelength( dst1, [ 1, 3 ], src1 );
//       var expected1 = buf( [ 1, 2 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferRelength( dst, [ 1, 5 ], src );
//     var expected = buf( [ 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number, number > dst.length';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, 6, [ 5 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, -2, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 1, 8 ], 1 );
//     var expected = buf( [ 1, 2, 3, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     var dst = buf( [] );
//     var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* - */
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, [ 1, 3 ] );
//     var expected = bufferExpected( dst, 2 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, 0 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, -5 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferRelength( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, 2 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 1, 5 ], src );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelength( dst, [ 1, 6 ], src );
//     var expected = bufferExpected( dst, 5 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferRelength( dst1, [ 1, 6 ], src1 );
//       var expected1 = bufferExpected( dst1, 5 );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferRelength( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, 2 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number, src = number';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, 6, 1 );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferRelength( dst, [ 1, 8 ], 1 );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferRelength() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferRelength( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferRelength( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelength( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelength( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelength( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelength( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferRelength( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }
//
// //
//
// function bufferRelengthInplace( test )
// {
//   /* not a buffer, trivial */
//
//   test.case = 'dst = array, src = array, range = negative number';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferRelengthInplace( dst, -5, [ 0 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = [];
//   var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got === dst );
//
//   test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
//   var dst = [ 1, 2, 3, 4 ];
//   var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 2, 3, 4, [ 2 ] ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = unroll, src = array, range = negative number';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelengthInplace( dst, -5, [ 2 ] );
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got === dst );
//
//   test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.unroll.from( [] );
//   var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, [] );
//   test.true( got === dst );
//
//   test.case = 'dst = unroll, src = array';
//   var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 2, 3, 4, [ 2 ] ] );
//   test.true( got === dst );
//
//   /* */
//
//   test.case = 'dst = argumentsArray, src = array, range = negative number';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelengthInplace( dst, -5, [ 2 ] );
//   test.identical( got, _.argumentsArray.make( [ 1, 2, 3, 4 ] ) );
//   test.true( got === dst );
//
//   test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
//   var dst = _.argumentsArray.from( [] );
//   var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
//   test.identical( got, _.argumentsArray.make( [] ) );
//   test.true( got === dst );
//
//   test.case = 'dst = argumentsArray, src = array';
//   var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
//   var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
//   test.identical( got, [ 2, 3, 4, [ 2 ] ] );
//   test.true( got !== dst );
//
//   /* BufferTyped and BufferNode */
//
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
//   };
//
//   var bufferNode = ( src ) =>
//   {
//     if( _.number.is( src ) )
//     return BufferNode.alloc( src );
//     else
//     return BufferNode.from( src );
//   };
//
//   /* - */
//
//   var list =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   for( let i = 0; i < list.length; i++ )
//   {
//     test.open( list[ i ].name );
//     run( bufferTyped( list[ i ] ) );
//     test.close( list[ i ].name );
//   }
//
//   /* - */
//
//   if( Config.interpreter === 'njs' )
//   {
//     test.open( 'bufferNode' );
//     run( bufferNode );
//     test.close( 'bufferNode' );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 1, 3 ] );
//     var expected = buf( [ 1, 2 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, 0 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, -5 );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
//     var expected = buf( [ 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ -1, 5 ], src );
//     var expected = buf( [ 0, 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
//     var expected = buf( [ 1, 2, 3, NaN, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( [ 0, 1, 2, 3 ] );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferRelengthInplace( dst1, [ 1, 3 ], src1 );
//       var expected1 = buf( [ 1, 2 ] );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var src = new I32x( 2 );
//     var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
//     var expected = buf( [ 1, 2, 3, NaN ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number, number > dst.length';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, 6, [ 5 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, -2, [ 5 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 0, dst.length ], [ 1 ] );
//     var expected = buf( [ 0, 1, 2, 3 ] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
//     var dst = buf( [ 0, 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 1, 8 ], 1 );
//     var expected = buf( [ 1, 2, 3, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     var dst = buf( [] );
//     var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = buf( [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//   }
//
//   /* - */
//
//   /* BufferRaw and BufferView */
//
//   var bufferRaw = ( src ) => new BufferRaw( src );
//   var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );
//
//   var bufferExpected = ( dst, src ) =>
//   {
//     if( _.bufferRawIs( dst ) )
//     return new U8x( src ).buffer;
//     else if( _.bufferViewIs( dst ) )
//     return new BufferView( new U8x( src ).buffer );
//   };
//
//   /* - */
//
//   test.open( 'bufferRaw' );
//   run2( bufferRaw );
//   test.close( 'bufferRaw' );
//
//   /* - */
//
//   test.open( 'bufferView' );
//   run2( bufferView );
//   test.close( 'bufferView' );
//
//   /* - */
//
//   function run2( buf )
//   {
//     test.case = 'src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, [ 1, 3 ] );
//     var expected = bufferExpected( dst, 2 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = undefined, range = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, range = 0';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, 0 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = undefined, rang = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, -5 );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range = undefined, src = undefined';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'src = array';
//     var dst = buf( 4 );
//     var src = new Array( 1, 2, 3 );
//     var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, 2 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = unroll';
//     var dst = buf( 4 );
//     var src = _.unroll.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'src = argumentsArray';
//     var dst = buf( 4 );
//     var src = _.argumentsArray.make( [ 1, 2, 3 ] );
//     var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
//     var expected = bufferExpected( dst, 5 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     if( Config.interpreter === 'njs' )
//     {
//       test.case = 'src = bufferNode';
//       var dst1 = buf( 4 );
//       var src1 = BufferNode.from( [ 1, 2, 3 ] );
//       var got1 = _.bufferRelengthInplace( dst1, [ 1, 6 ], src1 );
//       var expected1 = bufferExpected( dst1, 5 );
//       test.identical( got1, expected1 );
//       test.true( got1 !== dst1 );
//     }
//
//     test.case = 'src = bufferTyped';
//     var dst = buf( 4 );
//     var src = new I32x( 2 );
//     var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
//     var expected = bufferExpected( dst, 2 );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = number, src = number';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, 6, 1 );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range = negative number';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, -2, [ 5 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] === range[ 1 ], src = array';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, [ 2, 2 ], [ 5 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, [ 0, 4 ], [ 1 ] );
//     var expected = bufferExpected( dst, 4 );
//     test.identical( got, expected );
//     test.true( got === dst );
//
//     test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, [ -5, -2 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > range[ 1 ], src';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, [ 4, 1 ], [ 1 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
//     var dst = buf( 4 );
//     var got = _.bufferRelengthInplace( dst, [ 1, 8 ], 1 );
//     var expected = bufferExpected( dst, [ 0, 0, 0, 1, 1, 1, 1 ] );
//     test.identical( got, expected );
//     test.true( got !== dst );
//
//     test.case = 'dst = empty BufferTyped, src';
//     var dst = buf( [] );
//     var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
//     var expected = bufferExpected( dst, [] );
//     test.identical( got, expected );
//     test.true( got === dst );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace() );
//
//   test.case = 'extra arguments';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );
//
//   test.case = 'wrong value in range';
//   var dst = new I16x( 10 );
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, true, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, null, [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, 'str', [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [ 'str', 1 ], [ 2 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [], [ 2 ] ) );
//
//   test.case = 'wrong type of dst';
//   test.shouldThrowErrorSync( () => _.bufferRelengthInplace( 'str', [ 1, 3 ], [ 1 ] ) );
//
// }

//

function bufferRelength_DstIsArrayUnroll( test )
{
  test.case = 'dst - array, src - array, range - number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength_( dst, 2, [ 0 ] );
  test.identical( got, [ 1, 2 ] );
  test.true( got === dst );

  test.case = 'dst - empty array, src - array, range[ 0 ] > range[ 1 ]';
  var dst = [];
  var got = _.bufferRelength_( dst, [ 0, -1 ], [ 2 ] );
  test.identical( got, [] );
  test.true( got === dst );

  test.case = 'dst - array, range[ 1 ] > dst.length, src - array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength_( dst, [ 1, 4 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, -5, [ 2 ] );
  test.identical( got, [] );
  test.true( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unroll.from( [] );
  var got = _.bufferRelength_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ [ 2 ] ] );
  test.true( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, [ 1, 4 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, -5, [ 2 ] );
  test.identical( got, [] );
  test.true( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferRelength_( dst, [ 0, -1 ], [ 2 ] );
  test.identical( got, _.argumentsArray.make( [] ) );
  test.true( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, [ 1, 4 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.true( got !== dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRelength_() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelength_( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelength_( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength_( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength_( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength_( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength_( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferRelength_( 'str', [ 1, 3 ], [ 1 ] ) );
}

//

function bufferRelength_DstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( makeBuffer )
  {
    test.open( 'not inplace' );

    test.case = 'dst = undefined, range = undefined';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src );
    var expected = makeBuffer( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'dst = undefined';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ 1, 2 ] );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst = undefined, range = 0';
    var src = makeBuffer( [ 1, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, 0 );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst = undefined, range = negative number';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, -5 );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > src.length';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ 1, 4 ], 0 );
    var expected = makeBuffer( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'range[ 0 ] < 0, range[ 1 ] > src.length';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ -1, 4 ], 0 );
    var expected = makeBuffer( [ 0, 0, 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] < src.length';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ 1, 2 ], 0 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var src1 = makeBuffer( [ 0, 1, 2, 3 ] );
      var got1 = _.bufferRelength_( src1, [ 1, 3 ], 0 );
      var expected1 = makeBuffer( [ 1, 2, 3 ] );
      test.identical( got1, expected1 );
      test.true( got1 !== src1 );
    }

    test.case = 'range = number, number > src.length';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, 5, [ 5 ] );
    var expected = makeBuffer( [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range = negative number';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, -2, [ 5 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ 2, 2 ], [ 5 ] );
    var expected = makeBuffer( [ 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ 0, 3 ], [ 1 ] );
    var expected = makeBuffer( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ -5, -2 ], [ 1 ] );
    var expected = makeBuffer( [ 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ 4, 1 ], [ 1 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > src.length, src = number';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, [ 1, 7 ], 1 );
    var expected = makeBuffer( [ 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty BufferTyped, src';
    var src = makeBuffer( [] );
    var got = _.bufferRelength_( src, [ 0, -1 ], [ 2 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got === src );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = new U8x([ 1, 2, 3 ]);
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, src, [ -5, -2 ], 1 );
    var expected = new U8x([ 1, 1, 1, 1 ]);
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > range[ 1 ], src';
    var dst = new BufferRaw( 10 );
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, src, [ 4, 1 ], [ 1 ] );
    var expected = new BufferRaw( 0 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length, src = number';
    var dst = new BufferView( new U8x( [ 1, 1, 1, 1, 1, 1, 1 ] ).buffer );
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, src, [ 1, 7 ], 1 );
    var expected = new BufferView( new U8x( [ 1, 2, 3, 1, 1, 1, 1 ] ).buffer );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got === dst );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'src = undefined, range = undefined';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, src );
    var expected = makeBuffer( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'src = undefined, range = 0';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, src, 0 );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = undefined, rang = negative number';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, src, -5 );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range = negative number';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, src, -2, [ 5 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = makeBuffer( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( src, src, [ 0, 3 ], [ 1 ] );
    var expected = makeBuffer( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'src = empty BufferTyped, src';
    var src = makeBuffer( [] );
    var got = _.bufferRelength_( src, src, [ 0, -1 ], [ 2 ] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'dst, src = empty BufferTyped, src';
    var dst = [ 1, 2, 3 ];
    var src = makeBuffer( [] );
    var got = _.bufferRelength_( dst, src, [ 0, -1 ], [ 2 ] );
    var expected = [];
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got === dst );

    test.close( 'inplace' );
  }
}

//

function bufferRelength_DstIsBufferRaw( test )
{
  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = ( dst, src ) =>
  {
    if( _.bufferRawIs( dst ) )
    return new U8x( src ).buffer;
    else if( _.bufferViewIs( dst ) )
    return new BufferView( new U8x( src ).buffer );
  };

  /* - */

  test.open( 'bufferRaw' );
  run( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run( makeBuffer )
  {
    test.open( 'not inplace' );

    test.case = 'src = undefined';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, [ 1, 2 ] );
    var expected = bufferExpected( src, 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = undefined, range = undefined';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src );
    var expected = bufferExpected( src, 4 );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'src = undefined, range = 0';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, 0 );
    var expected = makeBuffer( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = undefined, rang = negative number';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, -5 );
    var expected = bufferExpected( src, 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range = undefined, src = undefined';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src );
    var expected = bufferExpected( src, 4 );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'src = array';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, [ 1, 2 ], 1 );
    var expected = bufferExpected( src, 2 );
    test.identical( got, expected );
    test.true( got !== src );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var src1 = makeBuffer( 4 );
      var got1 = _.bufferRelength_( src1, [ 1, 6 ], 1 );
      var expected1 = bufferExpected( src1, [ 0, 0, 0, 1, 1, 1 ] );
      test.identical( got1, expected1 );
      test.true( got1 !== src1 );
    }

    test.case = 'range = number, src = number';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, 5, 1 );
    var expected = bufferExpected( src, [ 0, 0, 0, 0, 1 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range = negative number';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, -2, [ 5 ] );
    var expected = bufferExpected( src, 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( src, [ 0 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, [ 0, 3 ], [ 1 ] );
    var expected = bufferExpected( src, 4 );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, [ -5, -2 ], 1 );
    var expected = bufferExpected( src, [ 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( src, [] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > src.length, src';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, [ 1, 7 ], 1 );
    var expected = bufferExpected( src, [ 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty BufferTyped, src';
    var src = makeBuffer( [] );
    var got = _.bufferRelength_( src, [ 0, -1 ], [ 2 ] );
    var expected = bufferExpected( src, [] );
    test.identical( got, expected );
    test.true( got === src );

    /* - */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = new U8x([ 1, 2, 3 ]);
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( dst, src, [ -5, -2 ], 1 );
    var expected = new U8x([ 1, 1, 1, 1 ]);
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > range[ 1 ], src';
    var dst = new U8x();
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( dst, src, [ 4, 1 ], [ 1 ] );
    var expected = new U8x();
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got === dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length, src';
    var dst = new BufferView( new U8x( [ 2, 2, 2, 2, 2, 2, 2 ] ).buffer );
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( dst, src, [ 1, 7 ], 1 );
    var expected =new BufferView( new U8x( [ 0, 0, 0, 1, 1, 1, 1 ] ).buffer );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got === dst );

    test.case = 'src = undefined, range = 0';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, src, 0 );
    var expected = makeBuffer( 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = undefined, range = negative number';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, src, -5 );
    var expected = bufferExpected( src, 0 );
    test.identical( got, expected );
    test.true( got !== src );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'src = undefined, range = undefined';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, src );
    var expected = bufferExpected( src, 4 );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = makeBuffer( 4 );
    var got = _.bufferRelength_( src, src, [ 0, 3 ], 1 );
    var expected = bufferExpected( src, 4 );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'dst, src = empty BufferTyped, src';
    var dst = [ 1, 2, 3 ];
    var src = makeBuffer( [] );
    var got = _.bufferRelength_( dst, src, [ 0, -1 ], [ 2 ] );
    var expected = [];
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got === dst );

    test.close( 'inplace' );
  }
}

//

function bufferRelength_CheckReturnedContainer( test )
{
  test.case = 'dst - undefined, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferRelength_( src, [ 0, 2 ], 0 );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - null, new container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferRelength_( null, src, [ 0, 2 ], 0 );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'dst - src, same container';
  var src = new U8x([ 1, 2, 3 ] );
  var got = _.bufferRelength_( src, src, [ 0, 2 ], 0 );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'dst - another container, dst container';
  var src = new U8x([ 1, 2, 3 ] );
  var dst = [];
  var got = _.bufferRelength_( dst, src, [ 0, 2 ], 0 );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.true( got === dst );
}

//

function bufferRelen( test )
{

  test.case = 'second argument is more than ints.length';
  var ints = new I8x( [ 3, 7, 13 ] );
  var got = _.bufferRelen( ints, 4 );
  var expected = got; // [ 3, 7, 13, 0 ];
  test.identical( got, expected );

  test.case = 'second argument is less than ints2.length';
  var ints2 = new I16x( [ 3, 7, 13, 33, 77 ] );
  var got = _.bufferRelen( ints2, 3 );
  var expected = got; // [ 3, 7, 13 ];
  test.identical( got, expected );

  test.case = 'invalid values are replaced by zero';
  var ints3 = new I32x( [ 3, 'a', 13, 'b', 77 ] );
  var got = _.bufferRelen( ints3, 6 );
  var expected = got; // [ 3, 0, 13, 0, 77, 0 ];
  test.identical( got, expected );

  test.case = 'returns the initial typed array';
  var floats = new F32x( [ 3.35, 7.5, 13.35, 33.75, 77.25 ] );
  var got = _.bufferRelen( floats, 5 );
  var expected = got; // [ 3.3499999046325684, 7.5, 13.350000381469727, 33.75, 77.25 ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRelen();
  });
};

// //
//
// function bufferResize( test )
// {
//   /* raw buffer */
//
//   test.case = 'size = number, new size = buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResize( src, src.byteLength );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = number, new size < buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResize( src, 5 );
//   var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = number, new size > buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResize( src, 15 );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   /* */
//
//   test.case = 'size = range, new offset = buffer offset, new size = buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResize( src, [ 0, src.byteLength ] );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = range, new offset = 0, new size < buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResize( src, [ 0, 8 ] );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = range, new offset < buffer offset, new size > buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResize( src, [ -3, 11 ] );
//   var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = range, new offset > buffer offset, new size > buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResize( src, [ 5, 12 ] );
//   var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   /* buffer constructors */
//
//   var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
//   var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } }[ name ];
//   };
//
//   /* expected result */
//
//   var expect = ( buf, offset, length ) =>
//   {
//     let buffer = _.bufferRelength( buf.buffer, [ offset, offset + length ] );
//     if( _.bufferViewIs( buf ) )
//     return bufferView( buffer );
//     else
//     return new buf.constructor( buffer );
//   }
//
//   /* tests */
//
//   var typedList =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   var list = [ bufferView ];
//   if( Config.interpreter === 'njs' )
//   list.push( bufferNode );
//   for( let i = 0; i < typedList.length; i++ )
//   list.push( bufferTyped( typedList[ i ] ) );
//
//
//   for( let r = 0; r < list.length; r++ )
//   {
//     test.open( list[ r ].name );
//     run( list[ r ] );
//     test.close( list[ r ].name );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     var filledBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5 ] ).buffer;
//
//     /* */
//
//     test.case = 'size = number, new size = buffer size';
//     var src = buf( filledBuf, 8, 2 );
//     var got = _.bufferResize( src, src.byteLength );
//     var expected = expect( src, 8, src.byteLength );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = number, new size < buffer size';
//     var src = buf( filledBuf, 0, 3 );
//     var got = _.bufferResize( src, 16 );
//     var expected = expect( src, 0, 16 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = number, new size > buffer size';
//     var src = buf( filledBuf, 16, 1 );
//     var got = _.bufferResize( src, 32 );
//     var expected = expect( src, 16, 32 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     /* */
//
//     test.case = 'size = range, new offset = buffer offset, new size = buffer size';
//     var src = buf( filledBuf, 8, 2 );
//     var got = _.bufferResize( src, [ 0, src.byteLength ] );
//     var expected = expect( src, 8, src.byteLength );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = range, new offset = 0, new size < buffer size';
//     var src = buf( filledBuf, 8, 2 );
//     var got = _.bufferResize( src, [ -8, 8 ] );
//     var expected = expect( src, 0, 16 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = range, new offset < buffer offset, new size > buffer size';
//     var src = buf( filledBuf, 16, 1 );
//     var got = _.bufferResize( src, [ -8, 24 ] );
//     var expected = expect( src, 8, 32 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = range, new offset > buffer offset, new size > buffer size';
//     var src = buf( filledBuf, 8, 1 );
//     var got = _.bufferResize( src, [ -16, 0 ] );
//     var expectedBuf = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
//     var expected = buf( expectedBuf );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferResize() );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.bufferResize( new BufferRaw( 5 ), 1, 2 ) );
//
//   test.case = 'not a buffer';
//   test.shouldThrowErrorSync( () => _.bufferResize( [ 1, 2 ], 1 ) );
//
//   test.case = 'not a range';
//   test.shouldThrowErrorSync( () => _.bufferResize( new Fx(), 'not a range' ) );
//   test.shouldThrowErrorSync( () => _.bufferResize( new U8x( 1 ), [ 1 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferResize( new I16x( 2 ), undefined ) );
// }

// //
//
// function bufferResizeInplace( test )
// {
//   /* raw buffer */
//
//   test.case = 'size = number, new size = buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResizeInplace( src, src.byteLength );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got === src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = number, new size < buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResizeInplace( src, 5 );
//   var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = number, new size > buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResizeInplace( src, 15 );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   /* */
//
//   test.case = 'size = range, new offset = buffer offset, new size = buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResizeInplace( src, [ 0, src.byteLength ] );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got === src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = range, new offset = 0, new size < buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResizeInplace( src, [ 0, 8 ] );
//   var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = range, new offset < buffer offset, new size > buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResizeInplace( src, [ -3, 11 ] );
//   var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   test.case = 'size = range, new offset > buffer offset, new size > buffer size';
//   var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
//   var got = _.bufferResizeInplace( src, [ 5, 12 ] );
//   var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
//   test.identical( got, expected );
//   test.true( got !== src );
//   test.true( _.bufferRawIs( got ) );
//
//   /* buffer constructors */
//
//   var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
//   var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
//   var bufferTyped = ( buf ) =>
//   {
//     let name = buf.name;
//     return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } }[ name ];
//   };
//
//   /* expected result */
//
//   var expect = ( buf, offset, length ) =>
//   {
//     let buffer = _.bufferRelength( buf.buffer, [ offset, offset + length ] );
//     if( _.bufferViewIs( buf ) )
//     return bufferView( buffer );
//     else
//     return new buf.constructor( buffer );
//   }
//
//   /* tests */
//
//   var typedList =
//   [
//     I8x,
//     U16x,
//     F32x,
//     F64x,
//   ];
//
//   var list = [ bufferView ];
//   if( Config.interpreter === 'njs' )
//   list.push( bufferNode );
//   for( let i = 0; i < typedList.length; i++ )
//   list.push( bufferTyped( typedList[ i ] ) );
//
//
//   for( let r = 0; r < list.length; r++ )
//   {
//     test.open( list[ r ].name );
//     run( list[ r ] );
//     test.close( list[ r ].name );
//   }
//
//   /* - */
//
//   function run( buf )
//   {
//     var filledBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5 ] ).buffer;
//
//     /* */
//
//     test.case = 'size = number, new size = buffer size';
//     var src = buf( filledBuf, 8, 2 );
//     var got = _.bufferResizeInplace( src, src.byteLength );
//     var expected = expect( src, 8, src.byteLength );
//     test.identical( got, expected );
//     test.true( got === src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = number, new size < buffer size';
//     var src = buf( filledBuf, 0, 3 );
//     var got = _.bufferResizeInplace( src, 16 );
//     var expected = expect( src, 0, 16 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = number, new size > buffer size';
//     var src = buf( filledBuf, 16, 1 );
//     var got = _.bufferResizeInplace( src, 32 );
//     var expected = expect( src, 16, 32 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     /* */
//
//     test.case = 'size = range, new offset = buffer offset, new size = buffer size';
//     var src = buf( filledBuf, 8, 2 );
//     var got = _.bufferResizeInplace( src, [ 0, src.byteLength ] );
//     var expected = expect( src, 8, src.byteLength );
//     test.identical( got, expected );
//     test.true( got === src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = range, new offset = 0, new size < buffer size';
//     var src = buf( filledBuf, 8, 2 );
//     var got = _.bufferResizeInplace( src, [ -8, 8 ] );
//     var expected = expect( src, 0, 16 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = range, new offset < buffer offset, new size > buffer size';
//     var src = buf( filledBuf, 16, 1 );
//     var got = _.bufferResizeInplace( src, [ -8, 24 ] );
//     var expected = expect( src, 8, 32 );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//
//     test.case = 'size = range, new offset > buffer offset, new size > buffer size';
//     var src = buf( filledBuf, 8, 1 );
//     var got = _.bufferResizeInplace( src, [ -16, 0 ] );
//     var expectedBuf = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
//     var expected = buf( expectedBuf );
//     test.identical( got, expected );
//     test.true( got !== src );
//     test.true( src.constructor.name === got.constructor.name );
//   }
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.bufferResizeInplace() );
//
//   test.case = 'extra arguments';
//   var buffer = new BufferRaw( 5 );
//   test.shouldThrowErrorSync( () => _.bufferResizeInplace( buffer, 1, 2 ) );
//
//   test.case = 'not a buffer';
//   test.shouldThrowErrorSync( () => _.bufferResizeInplace( [ 1, 2 ], 1 ) );
//
//   test.case = 'not a range';
//   test.shouldThrowErrorSync( () => _.bufferResizeInplace( new Fx(), 'not a range' ) );
//   test.shouldThrowErrorSync( () => _.bufferResizeInplace( new U8x( 1 ), [ 1 ] ) );
//   test.shouldThrowErrorSync( () => _.bufferResizeInplace( new I16x( 2 ), undefined ) );
// }

//

function bufferResize_( test )
{
  /* raw buffer, two arguments */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.true( got === src );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ -3, 11 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  /* raw buffer, dst - null */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ -3, 11 ] );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );

  /* raw buffer, dst - buffer */

  test.case = 'dst, size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new BufferRaw( 10 );
  var got = _.bufferResize_( dst, src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got === dst );

  test.case = 'dst, size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new BufferView( new BufferRaw( 9 ) );
  var got = _.bufferResize_( dst, src, 5 );
  var expected = new BufferView( new U8x( [ 1, 2, 3, 4, 5, 0, 0, 0, 0 ] ).buffer );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got === dst );

  test.case = 'dst, size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.bufferResize_( dst, src, 15 );
  var expected = new F32x( new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0 ] ).buffer );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got === dst );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'dst1, size = range, new offset = buffer offset, new size = buffer size';
    var src1 = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
    var dst1 = BufferNode.alloc( 10 );
    var got1 = _.bufferResize_( dst1, src1, [ 0, src1.byteLength ] );
    var expected1 = BufferNode.from( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
    test.identical( got1, expected1 );
    test.true( got1 !== src1 );
    test.true( got1 === dst1 );
  }

  test.case = 'dst, size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new U8x( 0 );
  var got = _.bufferResize_( dst, src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got !== dst );

  test.case = 'dst, size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new I16x( 7 );
  var got = _.bufferResize_( dst, src, [ -3, 11 ] );
  var expected = new I16x( new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0 ] ).buffer );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got === dst );

  /* */

  test.case = 'dst === src, size = src.byteLength';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, src, [ 0, 10 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.true( got === src );

  /* buffer constructors */

  var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
  var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } }[ name ];
  };

  /* expected result */

  var expect = ( buf, offset, length ) =>
  {
    let buffer = _.bufferRelength_( null, buf.buffer, [ offset, offset + length - 1 ] );
    if( _.bufferViewIs( buf ) )
    return bufferView( buffer );
    else
    return new buf.constructor( buffer );
  }

  /* tests */

  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  var list = [ bufferView ];
  if( Config.interpreter === 'njs' )
  list.push( bufferNode );
  for( let i = 0; i < typedList.length; i++ )
  list.push( bufferTyped( typedList[ i ] ) );


  for( let r = 0; r < list.length; r++ )
  {
    test.open( list[ r ].name );
    run( list[ r ] );
    test.close( list[ r ].name );
  }

  /* - */

  function run( buf )
  {
    var filledBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5 ] ).buffer;

    /* */

    test.case = 'size = number, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize_( src, src.byteLength );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResize_( src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.true( got !== src );

    /* */

    test.case = 'size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize_( src, [ 0, src.byteLength ] );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.true( got === src );

    test.case = 'size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize_( src, [ -8, 8 ] );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( src, [ -8, 24 ] );
    var expected = expect( src, 8, 32 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var got = _.bufferResize_( src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0 ] ).buffer;
    var expected = buf( expectedBuf );
    test.identical( got, expected );
    test.true( got !== src );

    /* dst - null */

    test.case = 'dst, size = number, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize_( null, src, src.byteLength );
    var expected = buf( filledBuf, 8, 2 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResize_( null, src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( null, src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    /* */

    test.case = 'dst, size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var dst = new U8x( 16 );
    var got = _.bufferResize_( dst, src, [ 0, src.byteLength ] );
    test.identical( got[ 0 ], 9 );
    test.true( got !== src );
    test.true( got === dst );

    test.case = 'dst, size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var dst = new I8x( 16 );
    var got = _.bufferResize_( dst, src, [ -8, 8 ] );
    test.identical( got[ 0 ], 1 );
    test.true( got !== src );
    test.true( got === dst );

    test.case = 'dst, size = range, new offset < buffer offset, new size > buffer size';
    var src1 = buf( filledBuf, 16, 1 );
    var dst1 = new BufferRaw( 0 );
    var got1 = _.bufferResize_( dst1, src1, [ -8, 24 ] );
    var expected1 = new U8x([ 9, 10, 1, 2, 3, 4, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]);
    test.identical( got1, expected1.buffer );
    test.true( got1 !== src1 );
    test.true( got1 !== dst1 );

    test.case = 'dst, size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var dst = new BufferView( new BufferRaw( 0 ) );
    var got = _.bufferResize_( dst, src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0 ] ).buffer;
    var expected = new BufferView( expectedBuf );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    /* */

    test.case = 'size = range, new offset = 0, new size = buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( src, src, [ 0, src.byteLength ] );
    test.identical( got, src );
    test.true( got === src );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferResize_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.bufferResize_( new BufferRaw( 2 ) ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferResize_( new BufferRaw( 5 ), new U8x( 3 ), 2, 'extra' ) );

  test.case = 'srcBuffer is not a buffer';
  test.shouldThrowErrorSync( () => _.bufferResize_( [ 1, 2 ], 1 ) );
  test.shouldThrowErrorSync( () => _.bufferResize_( null, [ 1, 2 ], 1 ) );

  test.case = 'dst is not a buffer';
  test.shouldThrowErrorSync( () => _.bufferResize_( [], [ 1, 2 ], 1 ) );

  test.case = 'not a range';
  test.shouldThrowErrorSync( () => _.bufferResize_( new Fx(), 'not a range' ) );
  test.shouldThrowErrorSync( () => _.bufferResize_( new U8x( 1 ), [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.bufferResize_( new I16x( 2 ), undefined ) );
}

//

function bufferReusingButDstIsArrayUnroll( test )
{
  test.case = 'dst = array, range - number < 0, without ins';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingBut( dst, -5 );
  test.identical( got, [ 1, 2, 3, 4, undefined, undefined, undefined, undefined ] );
  test.true( got !== dst );

  test.case = 'dst = array, range - number < 0, without ins';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingBut( dst, dst, -5, undefined );
  test.identical( got, [ 1, 2, 3, 4, undefined, undefined, undefined, undefined ] );
  test.true( got === dst );

  test.case = 'dst = empty array, range - number === 0, ins';
  var dst = [];
  var got = _.bufferReusingBut( dst, dst, 0, [ 1, 2 ] );
  test.identical( got, [ 1, 2, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.true( got === dst );

  test.case = 'dst = array, range - number > 0, without ins';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingBut( dst, dst, 1, undefined );
  test.identical( got, [ 1, 3, 4, undefined, undefined, undefined, undefined, undefined ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, range = number > src.length, ins';
  var dst = _.unroll.from([ 1, 2, 3, 4 ]);
  var got = _.bufferReusingBut( null, dst, 4, [ 0, 2 ] );
  test.identical( got, [ 1, 2, 3, 4, 0, 2, undefined, undefined ] );
  test.true( got !== dst );

  test.case = 'dst = empty unroll, range[ 0 ] > 0, range[ 1 ] > range[ 0 ], without ins';
  var dst = _.unroll.from( [] );
  var got = _.bufferReusingBut( null, dst, [ 1, 2 ], undefined );
  test.identical( got, [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.true( got !== dst );

  test.case = 'dst = unroll, range[ 0 ] > 0, range[ 1 ] < range[ 0 ], ins';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingBut( null, dst, [ 1, 0 ], [ 0, 0 ] );
  test.identical( got, [ 1, 0, 0, 2, 3, 4, undefined, undefined ] );
  test.true( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, range[ 0 ] === 0, range[ 1 ] === 0, without ins';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingBut( dst, [ 0, 0 ] );
  test.identical( got, [ 2, 3, 4, undefined, undefined, undefined, undefined, undefined ] );
  test.true( got !== dst );

  test.case = 'dst = empty argumentsArray, range[ 0 ] > range[ 1 ], ins';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferReusingBut( dst, [ 0, -1 ], [ 1, 2 ] );
  test.identical( got, [ 1, 2, undefined, undefined, undefined, undefined, undefined, undefined ] );
  test.true( got !== dst );

  test.case = 'dst = argumentsArray, range - undefined, ins';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingBut( dst, undefined, [ 1, 2 ] );
  test.identical( got, [ 1, 2, 1, 2, 3, 4, undefined, undefined ] );
  test.true( got !== dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingBut() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingBut( new I16x( 10 ), [ 1, 2 ], 1, [ 4 ], 'extra' ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferReusingBut( {}, [ 1, 3 ], [ 0, 0 ], [ 1 ] ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferReusingBut( new I16x( 10 ), 'wrong', 1, [ 4 ] ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.bufferReusingBut( new I16x( 10 ), [ 1, 2, 3 ], 'wrong', [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingBut( new I16x( 10 ), [ 1, 2, 3 ], {}, [ 1 ] ) );
}

//

function bufferReusingButDstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( bufferMake )
  {
    test.open( 'not inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 0 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ -1, -5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], [ 1, 2, 3 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = unroll';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.unroll.make( [ 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], val );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], val );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst1 = bufferMake( [ 0, 1, 2, 3 ] );
      var val1 = BufferNode.from( [ 1, 2, 3 ] );
      var got1 = _.bufferReusingBut( dst1, [ 1, 1 ], val1 );
      var expected1 = bufferMake( 64 / got.BYTES_PER_ELEMENT );
      expected1 = resultCopyData( expected, [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got1, expected1 );
      test.true( got1 !== dst1 );
    }

    test.case = 'val = bufferTyped';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = new I32x( 2 );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], val );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, 1, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 5, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, -2, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 5, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 0, 3 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = bufferMake( [] );
    var got = _.bufferReusingBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = [ 1, 2, 3 ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst0, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 1, 2, 3, 1, undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst0 = [ { a : 2 }, { b : 3 } ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst0, dst, [ 1, 8 ], [ 1 ] );
    var expected = [ 0, 1, undefined, undefined, undefined, undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, dst = empty BufferTyped, val';
    var dst0 = new F32x( [ 5 ] );
    var dst = bufferMake( [] );
    var got = _.bufferReusingBut( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new F32x( 16 );
    expected = resultCopyData( expected, [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    var dst0 = new BufferRaw( 1 );
    var dst = bufferMake( [] );
    var got = _.bufferReusingBut( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new BufferRaw( 64 );
    resultCopyData( new U8x( expected ), [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'dst === src, small length' );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, dst, undefined, undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, dst, [ 1, 0 ], undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, dst, [ -1, -5 ], undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.close( 'dst === src, small length' );
  }
}

//

function bufferReusingButDstIsBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  /* - */

  test.open( 'bufferRaw' );
  testRun( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  testRun( bufferView );
  test.close( 'bufferView' );

  /* - */

  function testRun( bufferMake )
  {
    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 0 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ -1, -5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], [ 1, 2, 3 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = unroll';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.unroll.make( [ 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], val );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], val );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst1 = bufferMake( [ 0, 1, 2, 3 ] );
      var val1 = BufferNode.from( [ 1, 2, 3 ] );
      var got1 = _.bufferReusingBut( dst1, [ 1, 1 ], val1 );
      var expected1 = new U8x( 64 );
      expected1 = resultCopyData( expected1, [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got1, bufferMake( expected1.buffer ) );
      test.true( got1 !== dst1 );
    }

    test.case = 'val = bufferTyped';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = new I32x( 2 );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], val );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 0, 0, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range = number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, 1, [ 5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 5, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, -2, [ 5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 5, 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 1 ], [ 5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 5, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 0, 3 ], [ 1 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ -5, -2 ], [ 1 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 4, 1 ], [ 1 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, [ 1, 8 ], [ 1 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = bufferMake( [] );
    var got = _.bufferReusingBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = [ 1, 2, 3 ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst0, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 1, 2, 3, 1, undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst0 = [ { a : 2 }, { b : 3 } ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst0, dst, [ 1, 8 ], [ 1 ] );
    var expected = [ 0, 1, undefined, undefined, undefined, undefined, undefined, undefined ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, dst = empty BufferTyped, val';
    var dst0 = new F32x( [ 5 ] );
    var dst = bufferMake( [] );
    var got = _.bufferReusingBut( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new F32x( 16 );
    expected[ 0 ] = 2;
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    var dst0 = new BufferRaw( 1 );
    var dst = bufferMake( [] );
    var got = _.bufferReusingBut( dst0, dst, [ 0, 0 ], [ 2 ] );
    var expected = new U8x( 64 );
    expected[ 0 ] = 2;
    test.identical( got, expected.buffer );
    test.true( got !== dst );
    test.true( got !== dst0 );

    /* */

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, dst, undefined, undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] > range[ 1 ]';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, dst, [ 1, 0 ], undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingBut( dst, dst, [ -1, -5 ], undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, bufferMake( expected.buffer ) );
    test.true( got !== dst );
  }
}

//

function bufferReusingButWithOptionOffsetting( test )
{
  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0 ],
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 0, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0 ],
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 2, 0, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval inside buffer, decrease length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [],
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, decrease length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [],
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 2, 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval inside buffer, grow length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0, 0 ],
    offsetting : 1,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 0, 0, 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, grow length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0, 0 ],
    offsetting : 0,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 0, 0, 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingButWithOptionShrinkFactor( test )
{
  test.case = 'resulted ratio is less than shrinkFactor - 10 / 2 < 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 2, 4 ],
    ins : [],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 2, 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted ratio is equal to shrinkFactor - 10 / 1 === 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 4 ],
    ins : [],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 2 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted ratio is greater than shrinkFactor - 10 / 1 > 9';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 4 ],
    ins : [],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 9,
  });
  var expected = new U8x([ 2 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'empty resulted container, shrinkFactor - 1000, should be new buffer';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 0, 4 ],
    ins : [],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 1000,
  });
  var expected = new U8x( [] );
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingButWithOptionGrowFactor( test )
{
  test.case = 'resulted buffer is out of range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0, 0 ],
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 0, 0, 4, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 2 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0, 1 ],
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 0, 1, 5, 6, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is out of range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0, 0 ],
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 0, 0, 4, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 2 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : [ 0, 1 ],
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 0, 1, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingButWithOptionMinSize( test )
{
  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    ins : [],
    minSize : 1,
    offsetting : 1,
  });
  var expected = new U8x([ 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    ins : [],
    minSize : 1,
    offsetting : 0,
  });
  var expected = new U8x([ 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    ins : [],
    minSize : 6,
    offsetting : 1,
  });
  var expected = new U8x([ 4, 5, 4, 5, 6, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    ins : [],
    minSize : 6,
    offsetting : 0,
  });
  var expected = new U8x([ 4, 5, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size, reusing - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingBut
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    ins : [],
    reusing : 0,
    minSize : 6,
    offsetting : 0,
  });
  var expected = new U8x([ 4, 5, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingOnlyDstIsArrayUnroll( test )
{
  test.case = 'dst = array, range - number < 0';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingOnly( dst, dst, -5 );
  var exp = [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst = empty array, range - number === 0';
  var dst = [];
  var got = _.bufferReusingOnly( dst, dst, 0 );
  var exp = [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got === dst );

  test.case = 'dst = array, range - number > 0';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingOnly( dst, dst, 1 );
  var exp = [ 1, 2, undefined, undefined, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, range = number > src.length';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingOnly( null, dst, 5 );
  var exp = [ 1, 2, 3, 4, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got !== dst );

  test.case = 'dst = empty unroll, range[ 0 ] > 0, range[ 1 ] > range[ 0 ]';
  var dst = _.unroll.from( [] );
  var got = _.bufferReusingOnly( null, dst, [ 1, 2 ] );
  var exp = [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got !== dst );

  test.case = 'dst = unroll, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingOnly( null, dst, [ 1, 0 ] );
  var exp = [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, range[ 0 ] === 0, range[ 1 ] === 0';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingOnly( dst, [ 0, 0 ] );
  var exp = [ 1, undefined, undefined, undefined, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got !== dst );

  test.case = 'dst = empty argumentsArray, range[ 0 ] > range[ 1 ]';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferReusingOnly( dst, [ 0, -1 ] );
  var exp = [ undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got !== dst );

  test.case = 'dst = argumentsArray';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingOnly( dst );
  var exp = [ 1, 2, 3, 4, undefined, undefined, undefined, undefined ]
  test.identical( got, exp );
  test.true( got !== dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingOnly() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingOnly( new I16x( 10 ), [ 1 ], [ 0, 0 ], 'extra' ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferReusingOnly( 'str', [ 1, 3 ], [ 0, 1 ] ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferReusingOnly( new I16x( 10 ), null, [ 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingOnly( new I16x( 10 ), {}, [ 2, 2 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.bufferReusingOnly( new I16x( 10 ), [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferReusingOnly( new I16x( 10 ), [ 1, 3 ], { a : 1 } ) );
}

//

function bufferReusingOnlyDstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    testRun( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    testRun( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function testRun( bufferMake )
  {
    test.open( 'not inplace' );

    test.case = 'only dst';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < 0';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, -1 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 2 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 2 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, -3 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, -1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 0 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 0 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 4 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 7 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'only dst';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < 0';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, -1 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 2 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 2 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, -3 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, -1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 0 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 0 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 2 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 2, 3, 4, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 4 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = bufferMake( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 7 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== dst );

    test.close( 'inplace' );
  }
}

//

function bufferReusingOnlyDstIsBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  /* - */

  test.open( 'bufferRaw' );
  testRun( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  testRun( bufferView );
  test.close( 'bufferView' );

  /* - */

  function testRun( makeBuffer )
  {
    test.case = 'only dst';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number < 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, -1 );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, 0 );
    var expected = new U8x( 64 );
    expected[ 0 ] = 1;
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, 2 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, 2 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ -1, -3 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ -1, -1 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ -1, 0 ] );
    var expected = new U8x( 64 );
    expected[ 0 ] = 1;
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ -1, 2 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ -1, 5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ 1, 0 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ 1, 1 ] );
    var expected = new U8x( 64 );
    expected[ 0 ] = 2;
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ 1, 2 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ 1, 5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3, 4, 5 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ 5, 4 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ 5, 5 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( null, dst, [ 5, 7 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    /* */

    test.case = 'only dst';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number < 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, -1 );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 0 );
    var expected = new U8x( 64 );
    expected[ 0 ] = 1;
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 2 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range - number > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, 2 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, -3 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, -1 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] === 0';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 0 ] );
    var expected = new U8x( 64 );
    expected[ 0 ] = 1;
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 2 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ -1, 5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 0 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 1 ] );
    var expected = new U8x( 64 );
    expected[ 0 ] = 2;
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] < src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 2 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 1, 5 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3, 4, 5 ] );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] < range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 4 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] === range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 5 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > src.length, range[ 1 ] > range[ 0 ]';
    var dst = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var got = _.bufferReusingOnly( dst, [ 5, 7 ] );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected ) );
    test.true( got !== dst );
  }
}

//

function bufferReusingOnlyWithOptionOffsetting( test )
{
  test.case = 'cinterval gets all buffer, not changed length - not new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval gets all buffer, not changed length - not new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval gets part of buffer, decrease length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 2 ],
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval gets part of buffer, decrease length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 2 ],
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );
}

//

function bufferReusingOnlyWithOptionShrinkFactor( test )
{
  test.case = 'resulted ratio is less than shrinkFactor - 10 / 2 < 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 2, 3 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted ratio is equal to shrinkFactor - 10 / 1 === 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted ratio is greater than shrinkFactor - 10 / 1 > 9';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 9,
  });
  var expected = new U8x([ 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'empty resulted container, shrinkFactor - 1000, should be new buffer';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 0, -1 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 1000,
  });
  var expected = new U8x( [] );
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingOnlyWithOptionMinSize( test )
{
  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    minSize : 1,
    offsetting : 1,
  });
  var expected = new U8x([ 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    minSize : 1,
    offsetting : 0,
  });
  var expected = new U8x([ 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    minSize : 2,
    offsetting : 1,
  });
  var expected = new U8x([ 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    minSize : 2,
    offsetting : 0,
  });
  var expected = new U8x([ 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size, reusing - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingOnly
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    reusing : 0,
    minSize : 2,
    offsetting : 0,
  });
  var expected = new U8x([ 3, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingGrowDstIsArrayUnroll( test )
{
  test.case = 'dst = array, val = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingGrow( dst, dst, -5, 0 );
  test.identical( got, [ 1, 2, 3, 4, 0, 0, 0, 0 ] );
  test.true( got === dst );

  test.case = 'dst = empty array, val = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferReusingGrow( dst, dst, [ 0, -1 ], 0 );
  test.identical( got, [ 0, 0, 0, 0, 0, 0, 0, 0 ] );
  test.true( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, val = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingGrow( dst, dst, [ 1, 4 ], 0 );
  test.identical( got, [ 1, 2, 3, 4, 0, 0, 0, 0 ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, val = array, range = negative number';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingGrow( dst, dst, -5, 0 );
  test.identical( got, [ 1, 2, 3, 4, 0, 0, 0, 0 ] );
  test.true( got === dst );

  test.case = 'dst = empty unroll, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unroll.from( [] );
  var got = _.bufferReusingGrow( dst, dst, [ 0, -1 ], 0 );
  test.identical( got, [ 0, 0, 0, 0, 0, 0, 0, 0 ] );
  test.true( got === dst );

  test.case = 'dst = unroll, val = array';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingGrow( dst, dst, [ 1, 4 ], 0 );
  test.identical( got, [ 1, 2, 3, 4, 0, 0, 0, 0 ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = argumentsArray, val = array, range = negative number';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingGrow( dst, dst, -5, 0 );
  test.identical( got, [ 1, 2, 3, 4, 0, 0, 0, 0 ] );
  test.true( got !== dst );

  test.case = 'dst = empty argumentsArray, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferReusingGrow( dst, dst, [ 0, -1 ], 0 );
  test.identical( got, [ 0, 0, 0, 0, 0, 0, 0, 0 ] );
  test.true( got !== dst );

  test.case = 'dst = argumentsArray, val = array';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingGrow( dst, dst, [ 1, 4 ], 0 );
  test.identical( got, [ 1, 2, 3, 4, 0, 0, 0, 0 ] );
  test.true( got !== dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingGrow() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferReusingGrow( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferReusingGrow( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingGrow( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingGrow( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingGrow( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferReusingGrow( 'str', [ 1, 3 ], [ 1 ] ) );
}

//

function bufferReusingGrowDstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( bufferMake )
  {
    test.case = 'val = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 1, 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range = 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, -5 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 1, 2 ], 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = unroll';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 1, 4 ], 1 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArray.make( [ 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 1, 5 ], 1 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst1 = bufferMake( [ 0, 1, 2, 3 ] );
      var got1 = _.bufferReusingGrow( dst1, [ 1, 3 ], 1 );
      var expected1 = bufferMake( 64 / got.BYTES_PER_ELEMENT );
      expected1.fill( 1 );
      expected1 = resultCopyData( expected, [ 0, 1, 2, 3 ] );
      test.identical( got1, expected1 );
      test.true( got1 !== dst1 );
    }

    test.case = 'val = bufferTyped';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var val = new I32x( 1 );
    var got = _.bufferReusingGrow( dst, [ 1, 4 ], val );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, 5, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, -2, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 0, 3 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ -2, -2 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 1, 1, 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val = number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, [ 1, 7 ], 1 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    /* */

    test.case = 'dst0, range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst0 = new BufferRaw( 4 );
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst0, dst, [ 0, 3 ], [ 1 ] );
    var expected = new BufferRaw( 64 );
    var expectedTyped = new U8x( expected ).fill( 1 );
    resultCopyData( expectedTyped, [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    test.case = 'dst0, range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst0 = new BufferRaw( 3 );
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst0, dst, [ -2, -2 ], [ 1 ] );
    var expected = new BufferRaw( 64 );
    var expectedTyped = new U8x( expected ).fill( 1 );
    resultCopyData( expectedTyped, [ 1, 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    /* */

    test.case = 'val = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, [ 1, 2 ], undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range = undefined';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, range = 0';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, 0, undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, -5, undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, [ 1, 2 ], 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst2 = bufferMake( [ 0, 1, 2, 3 ] );
      var got2 = _.bufferReusingGrow( dst2, dst2, [ 1, 3 ], 1 );
      var expected2 = bufferMake( 64 / got.BYTES_PER_ELEMENT );
      expected2.fill( 1 );
      expected2 = resultCopyData( expected2, [ 0, 1, 2, 3, 1 ] );
      test.identical( got2, expected2 );
      test.true( got2 !== dst2 );
    }

    test.case = 'range = negative number';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, -2, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, [ 0, 3 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, [ -2, -2 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 1, 1, 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst, dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== dst );

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = [ 1, 2, 3 ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst0, dst, [ 4, 1 ], 1 );
    var expected = [ 0, 1, 2, 3, 1, 1, 1, 1 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val = number';
    var dst0 = [ 1, 2, 3 ];
    var dst = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingGrow( dst0, dst, [ 1, 7 ], 1 );
    var expected = [ 0, 1, 2, 3, 1, 1, 1, 1 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );
  }
}

//

function bufferReusingGrowDstIsBufferRaw( test )
{
  var bufferRaw = ( src ) => src;
  var bufferView = ( src ) => new BufferView( src );

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  function resultCopyIns( dst, start, ins )
  {
    for( let i = start ; i < dst.length ; i++ )
    dst[ i ] = ins;
    return dst;
  }

  /* - */

  test.open( 'bufferRaw' );
  run2( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run2( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run2( buf )
  {
    test.case = 'val = undefined';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, [ 1, 2 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, 0 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range = negative number';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, -5 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = number';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var val = [ 3 ];
    var got = _.bufferReusingGrow( dst, [ 1, 2 ], 7 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 7 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range = number, val = number';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, 5, 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 1 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, -2, 5 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 5 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, [ 2, 2 ], 5 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 5 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, [ 0, 3 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 1 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, [ -2, -2 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 1, 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 6, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, [ 4, 1 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, [ 1, 7 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 1, 1, 1 ] );
    expected = resultCopyIns( expected, 7, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( new U8x( [] ).buffer );
    var got = _.bufferReusingGrow( dst, [ 0, -1 ], 2 );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 2 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    /* */

    test.case = 'dst0, range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst0 = new U8x([ 0, 0, 0 ]);
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst0, dst, [ -2, -2 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 1, 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 6, 1 );
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got !== dst0 );

    test.case = 'dst0, range[ 0 ] > range[ 1 ], val';
    var dst0 = new BufferView( new U8x( 64 ).buffer );
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst0, dst, [ 4, 1 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, new BufferView( expected.buffer ) );
    test.true( got !== dst );
    test.true( got === dst0 );

    test.case = 'dst0, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst0 = new BufferView( new BufferRaw( 2 ) );
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst0, dst, [ 1, 7 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 1, 1, 1 ] );
    expected = resultCopyIns( expected, 7, 1 );
    test.identical( got, new BufferView( expected.buffer ) );
    test.true( got !== dst );
    test.true( got !== dst0 );

    /* - */

    test.case = 'val = undefined';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, [ 1, 2 ], undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, undefined, 0 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, 0, undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'val = undefined, range = negative number';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, -5, undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, -2, 5 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 5 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, [ 2, 2 ], 5 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 5 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, [ 0, 3 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4, 1 ] );
    expected = resultCopyIns( expected, 5, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, [ -2, -2 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 1, 1, 2, 3, 4, 1 ] );
    expected = resultCopyIns( expected, 7, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingGrow( dst, dst, [ 4, 1 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( new U8x( [] ).buffer );
    var got = _.bufferReusingGrow( dst, dst, [ 0, -1 ], 2 );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 2 );
    test.identical( got, buf( expected.buffer ) );
    test.true( got !== dst );

    test.case = 'dst0, dst = empty BufferTyped, val';
    var dst0 = [ 1, 2, 3 ];
    var dst = buf( new U8x( [] ).buffer );
    var got = _.bufferReusingGrow( dst0, dst, [ 0, -1 ], 2 );
    var expected = [ 2, 2, 2, 2, 2, 2, 2, 2 ];
    test.identical( got, expected );
    test.true( got !== dst );
    test.true( got === dst0 );
  }
}

//

function bufferReusingGrowWithOptionOffsetting( test )
{
  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : 9,
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    ins : 9,
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval outside buffer, grow length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ -1, 4 ],
    ins : 9,
    offsetting : 1,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 9, 2, 3, 4, 5, 9 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval outside buffer, grow length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ -1, 4 ],
    ins : 9,
    offsetting : 0,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 9, 2, 3, 4, 5, 9 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingGrowWithOptionGrowFactor( test )
{
  test.case = 'resulted buffer is out of range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 9,
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 9, 9, 9, 9, 9, 9 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    ins : 9,
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is out of range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 9,
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 9, 9, 9, 9, 9, 9 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    ins : 9,
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );
}

//

function bufferReusingGrowWithOptionMinSize( test )
{
  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 9,
    minSize : 1,
    offsetting : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 9,
    minSize : 1,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 9,
    minSize : 8,
    offsetting : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5, 9, 9, 9, 9 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 9,
    minSize : 8,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 4, 5, 9, 9, 9, 9 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  /* */

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size, reusing - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingGrow
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 9,
    reusing : 0,
    minSize : 8,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 4, 5, 9, 9, 9, 9 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingRelengthDstIsArrayUnroll( test )
{
  test.case = 'dst - array, src - array, range - number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferReusingRelength( dst, dst, 2, 0 );
  test.identical( got, [ 1, 2, 0, 0, 0, 0, 0, 0 ] );
  test.true( got === dst );

  test.case = 'dst - empty array, src - array, range[ 0 ] > range[ 1 ]';
  var dst = [];
  var got = _.bufferReusingRelength( dst, dst, [ 0, -1 ], 2 );
  test.identical( got, [ 2, 2, 2, 2, 2, 2, 2, 2 ] );
  test.true( got === dst );

  test.case = 'dst - array, range[ 1 ] > dst.length, src - array';
  var dst = [ 1, 2, 3, 4, 5, 6 ];
  var got = _.bufferReusingRelength( dst, dst, [ 1, 6 ], 2 );
  test.identical( got, [ 2, 3, 4, 5, 6, 2, 2, 2 ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingRelength( dst, dst, -5, 2 );
  test.identical( got, [ 2, 2, 2, 2, 2, 2, 2, 2 ] );
  test.true( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unroll.from( [] );
  var got = _.bufferReusingRelength( dst, dst, [ 0, 0 ], 2 );
  test.identical( got, [ 2, 2, 2, 2, 2, 2, 2, 2 ] );
  test.true( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unroll.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingRelength( dst, dst, [ 1, 4 ], 2 );
  test.identical( got, [ 2, 3, 4, 2, 2, 2, 2, 2 ] );
  test.true( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingRelength( dst, dst, -5, 2 );
  test.identical( got, [ 2, 2, 2, 2, 2, 2, 2, 2 ] );
  test.true( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArray.from( [] );
  var got = _.bufferReusingRelength( dst, dst, [ 0, -1 ], 2 );
  test.identical( got, [ 2, 2, 2, 2, 2, 2, 2, 2 ] );
  test.true( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArray.from( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingRelength( dst, dst, [ 1, 4 ], 2 );
  test.identical( got, [ 2, 3, 4, 2, 2, 2, 2, 2 ] );
  test.true( got !== dst );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingRelength() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferReusingRelength( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferReusingRelength( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingRelength( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingRelength( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferReusingRelength( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferReusingRelength( 'str', [ 1, 3 ], [ 1 ] ) );
}

//

function bufferReusingRelengthDstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };

  var bufferNode = ( src ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( bufferMake )
  {
    test.open( 'not inplace' );

    test.case = 'dst = undefined, range = undefined';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst = undefined';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ 1, 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst = undefined, range = 0';
    var src = bufferMake( [ 1, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst = undefined, range = negative number';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, -5 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > src.length';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ 1, 4 ], 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] < 0, range[ 1 ] > src.length';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ -1, 4 ], 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 0, 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] < src.length';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ 1, 2 ], 0 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 1, 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var src1 = bufferMake( [ 0, 1, 2, 3 ] );
      var got1 = _.bufferReusingRelength( src1, [ 1, 3 ], 0 );
      var expected1 = bufferMake( 64 / got.BYTES_PER_ELEMENT );
      expected1 = resultCopyData( expected1, [ 1, 2, 3 ] );
      test.identical( got1, expected1 );
      test.true( got1 !== src1 );
    }

    test.case = 'range = number, number > src.length';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, 5, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3, 5 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range = negative number';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, -2, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ 2, 2 ], [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    expected = resultCopyData( expected, [ 2 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ 0, 3 ], [ 1 ] );
    var expected = bufferMake( [ 0, 1, 2, 3 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ -5, -2 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ 4, 1 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > src.length, src = number';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, [ 1, 7 ], 1 );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty BufferTyped, src';
    var src = bufferMake( [] );
    var got = _.bufferReusingRelength( src, [ 0, -1 ], [ 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = new U8x([ 1, 2, 3 ]);
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( dst, src, [ -5, -2 ], 1 );
    var expected = new U8x( 64 );
    expected.fill( 1 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > range[ 1 ], src';
    var dst = new BufferRaw( 10 );
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( dst, src, [ 4, 1 ], [ 1 ] );
    var expected = new U8x( 64 ).fill( 1 ).buffer;
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length, src = number';
    var dst = new BufferView( new U8x( [ 1, 1, 1, 1, 1, 1, 1 ] ).buffer );
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( dst, src, [ 1, 7 ], 1 );
    var buffer = new U8x( 64 ).fill( 1 );
    resultCopyData( buffer, [ 1, 2, 3, 1, 1, 1, 1 ] );
    var expected = new BufferView( buffer.buffer );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'src = undefined, range = undefined';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = undefined, range = 0';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, src, 0, undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = undefined, rang = negative number';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, src, -5, undefined );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range = negative number';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, src, -2, [ 5 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 5 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = bufferMake( [ 0, 1, 2, 3 ] );
    var got = _.bufferReusingRelength( src, src, [ 0, 3 ], [ 1 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 1 );
    expected = resultCopyData( expected, [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'src = empty BufferTyped, src';
    var src = bufferMake( [] );
    var got = _.bufferReusingRelength( src, src, [ 0, -1 ], [ 2 ] );
    var expected = bufferMake( 64 / got.BYTES_PER_ELEMENT );
    expected.fill( 2 );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst, src = empty BufferTyped, src';
    var dst = [ 1, 2, 3 ];
    var src = bufferMake( [] );
    var got = _.bufferReusingRelength( dst, src, [ 0, -1 ], 2 );
    var expected = [ 2, 2, 2, 2, 2, 2, 2, 2 ];
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got === dst );

    test.close( 'inplace' );
  }
}

//

function bufferReusingRelengthDstIsBufferRaw( test )
{
  var bufferRaw = ( src ) => src;
  var bufferView = ( src ) => new BufferView( src );

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  function resultCopyIns( dst, start, ins )
  {
    for( let i = start ; i < dst.length ; i++ )
    dst[ i ] = ins;
    return dst;
  }

  /* - */

  test.open( 'bufferRaw' );
  run( bufferRaw );
  test.close( 'bufferRaw' );

  /* - */

  test.open( 'bufferView' );
  run( bufferView );
  test.close( 'bufferView' );

  /* - */

  function run( makeBuffer )
  {
    test.case = 'src = undefined';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, [ 1, 2 ] );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3 ] );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'src = undefined, range = undefined';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, undefined, undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'src = undefined, range = 0';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, 0 );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'src = undefined, rang = negative number';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, -5 );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'src = array';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, [ 1, 2 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3 ] );
    expected = resultCopyIns( expected, 2, 1 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range = number, src = number';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, 5, 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range = negative number';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, -2, 5 );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 5 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, [ 2, 2 ], 5 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 3 ] );
    expected = resultCopyIns( expected, 1, 5 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, [ 0, 3 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, [ -5, -2 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 1 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, [ 4, 1 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 1 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > src.length, src';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, [ 1, 7 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3, 4, 1, 1, 1, 1 ] );
    expected = resultCopyIns( expected, 7, 1 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'src = empty BufferTyped, src';
    var src = makeBuffer( new U8x( [] ).buffer );
    var got = _.bufferReusingRelength( src, [ 0, -1 ], 2 );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 2 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    /* */

    test.case = 'dst, range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = new U8x([ 1, 2, 3 ]);
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( dst, src, [ -5, -2 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 1 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > range[ 1 ], src';
    var dst = new U8x();
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( dst, src, [ 4, 1 ], [ 1 ] );
    var expected = new U8x( 64 );
    expected = resultCopyIns( expected, 0, 1 );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, range[ 0 ] > 0, range[ 1 ] > src.length, src';
    var dst = new BufferView( new U8x( [ 2, 2, 2, 2, 2, 2, 2 ] ).buffer );
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( dst, src, [ 1, 7 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 2, 3, 4, 1, 1, 1, 1 ] );
    expected = resultCopyIns( expected, 7, 1 );
    test.identical( got, new BufferView( expected.buffer ) );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'src = undefined, range = 0';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, src, 0, undefined );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'src = undefined, range = negative number';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, src, -5, undefined );
    var expected = new U8x( 64 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    /* */

    test.case = 'src = undefined, range = undefined';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, src, undefined, undefined );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = src.length, src';
    var src = makeBuffer( new U8x([ 1, 2, 3, 4 ]).buffer );
    var got = _.bufferReusingRelength( src, src, [ 0, 3 ], 1 );
    var expected = new U8x( 64 );
    expected = resultCopyData( expected, [ 1, 2, 3, 4 ] );
    expected = resultCopyIns( expected, 4, 1 );
    test.identical( got, makeBuffer( expected.buffer ) );
    test.true( got !== src );

    test.case = 'dst, src = empty BufferTyped, src';
    var dst = [ 1, 2, 3 ];
    var src = makeBuffer( new U8x( [] ).buffer );
    var got = _.bufferReusingRelength( dst, src, [ 0, -1 ], 2 );
    var expected = [ 2, 2, 2, 2, 2, 2, 2, 2 ];
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got === dst );
  }
}

//

function bufferReusingRelengthWithOptionOffsetting( test )
{
  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 7,
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 7,
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval inside buffer, decrease length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    ins : 7,
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, decrease length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    ins : 7,
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval outside buffer, grow length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 4 ],
    ins : 7,
    offsetting : 1,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval outside buffer, grow length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 4 ],
    ins : 7,
    offsetting : 0,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingRelengthWithOptionShrinkFactor( test )
{
  test.case = 'resulted ratio is less than shrinkFactor - 10 / 2 < 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    ins : 7,
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 2, 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted ratio is equal to shrinkFactor - 10 / 1 === 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 0 ],
    ins : 7,
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 2 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted ratio is greater than shrinkFactor - 10 / 1 > 9';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 0 ],
    ins : 7,
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 9,
  });
  var expected = new U8x([ 2 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'empty resulted container, shrinkFactor - 1000, should be new buffer';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, -1 ],
    ins : [],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 1000,
  });
  var expected = new U8x( [] );
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingRelengthWithOptionGrowFactor( test )
{
  test.case = 'resulted buffer is out of range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 7,
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 7, 7, 7, 7, 7, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 2 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    ins : 7,
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 7, 7, 7, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is out of range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 7,
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 7, 7, 7, 7, 7, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 2 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    ins : 7,
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 7, 7, 7, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingRelengthWithOptionMinSize( test )
{
  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 2, 3 ],
    ins : 7,
    minSize : 1,
    offsetting : 1,
  });
  var expected = new U8x([ 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 2, 3 ],
    ins : 7,
    minSize : 1,
    offsetting : 0,
  });
  var expected = new U8x([ 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 7,
    minSize : 6,
    offsetting : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5, 7, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 7,
    minSize : 6,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 4, 5, 7, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size, reusing - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingRelength
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    ins : 7,
    reusing : 0,
    minSize : 6,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 4, 5, 7, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingResize( test )
{
  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  /* raw buffer, two arguments */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, src.byteLength );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, 5 );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, 15 );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, [ 0, src.byteLength ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, [ 0, 8 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, [ -3, 11 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, [ 5, 12 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 6, 7, 8, 9, 10, 0, 0 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  /* raw buffer, dst - null */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( null, src, src.byteLength );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( null, src, 5 );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( null, src, 15 );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( null, src, [ 0, src.byteLength ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( null, src, [ 0, 8 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( null, src, [ -3, 11 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( null, src, [ 5, 12 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 6, 7, 8, 9, 10, 0, 0 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );

  /* raw buffer, dst - buffer */

  test.case = 'dst, size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new BufferRaw( 10 );
  var got = _.bufferReusingResize( dst, src, src.byteLength );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );
  test.true( got !== dst );

  test.case = 'dst, size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new BufferView( new BufferRaw( 9 ) );
  var got = _.bufferReusingResize( dst, src, 5 );
  var bufferTyped = new U8x( 64 );
  var expected = new BufferView( bufferTyped.buffer );
  bufferTyped = resultCopyData( bufferTyped, [ 1, 2, 3, 4, 5, 0, 0, 0, 0 ] );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got !== dst );

  test.case = 'dst, size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.bufferReusingResize( dst, src, 15 );
  var bufferTyped = new U8x( 64 );
  bufferTyped = resultCopyData( bufferTyped, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0 ] );
  var expected = new F32x( bufferTyped.buffer );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got !== dst );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'dst1, size = range, new offset = buffer offset, new size = buffer size';
    var src1 = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
    var dst1 = BufferNode.alloc( 10 );
    var got1 = _.bufferReusingResize( dst1, src1, [ 0, src1.byteLength ] );
    var bufferTyped1 = new U8x( 64 );
    bufferTyped1 = resultCopyData( bufferTyped1, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0 ] );
    var expected1 = BufferNode.from( bufferTyped1 );
    test.identical( got1, expected1 );
    test.true( got1 !== src1 );
    test.true( got1 !== dst1 );
  }

  test.case = 'dst, size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new U8x( 0 );
  var got = _.bufferReusingResize( dst, src, [ 0, 8 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got !== dst );

  test.case = 'dst, size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new I16x( 7 );
  var got = _.bufferReusingResize( dst, src, [ -3, 11 ] );
  var bufferTyped = new U8x( 64 );
  bufferTyped = resultCopyData( bufferTyped, [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] );
  var expected = new I16x( bufferTyped.buffer );
  test.identical( got, expected );
  test.true( got !== src );
  test.true( got !== dst );

  /* */

  test.case = 'dst === src, size = src.byteLength';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferReusingResize( src, src, [ 0, 10 ] );
  var expected = new U8x( 64 );
  expected = resultCopyData( expected, [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
  test.identical( got, expected.buffer );
  test.true( got !== src );


  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingResize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferReusingResize( new BufferRaw( 5 ), new U8x( 3 ), 2, 'extra' ) );

  test.case = 'srcBuffer is not a buffer';
  test.shouldThrowErrorSync( () => _.bufferReusingResize( [ 1, 2 ], 1 ) );
  test.shouldThrowErrorSync( () => _.bufferReusingResize( null, [ 1, 2 ], 1 ) );

  test.case = 'dst is not a buffer';
  test.shouldThrowErrorSync( () => _.bufferReusingResize( [], [ 1, 2 ], 1 ) );

  test.case = 'not a range';
  test.shouldThrowErrorSync( () => _.bufferReusingResize( new Fx(), 'not a range' ) );
  test.shouldThrowErrorSync( () => _.bufferReusingResize( new U8x( 1 ), [ 1 ] ) );
}

//

function bufferReusingResizeDstIsBufferTyped( test )
{
  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } }[ name ];
  };

  var bufferNode = ( src, offset, length ) =>
  {
    if( _.number.is( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src, offset, length );
  };

  function resultCopyData( dst, src )
  {
    for( let i = 0 ; i < src.length ; i++ )
    dst[ i ] = src[ i ];
    return dst;
  }

  var expect = ( buf, offset, length ) =>
  {
    let buffer = _.bufferRelength_( null, buf.buffer, [ offset, offset + length - 1 ] );
    return new buf.constructor( buffer );
  }

  /* - */

  var list =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];

  for( let i = 0; i < list.length; i++ )
  {
    test.open( list[ i ].name );
    run( bufferTyped( list[ i ] ) );
    test.close( list[ i ].name );
  }

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'bufferNode' );
    run( bufferNode );
    test.close( 'bufferNode' );
  }

  /* - */

  function run( buf )
  {
    var filledBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5 ] ).buffer;

    /* */

    test.case = 'size = number, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferReusingResize( src, src.byteLength );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 8, src.byteLength );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferReusingResize( src, 16 );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 0, 16 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferReusingResize( src, 32 );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 16, 32 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    /* */

    test.case = 'size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferReusingResize( src, [ 0, src.byteLength - 1 ] );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 8, src.byteLength );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferReusingResize( src, [ -8, 7 ] );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 0, 16 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferReusingResize( src, [ -8, 23 ] );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 8, 32 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var got = _.bufferReusingResize( src, [ -16, -1 ] );
    var expected = new U8x( 64 );
    var buffer = new U8x([ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ]);
    expected = resultCopyData( expected, buffer );
    expected = buf( expected.buffer );
    test.identical( got, expected );
    test.true( got !== src );

    /* dst - null */

    test.case = 'dst, size = number, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferReusingResize( null, src, src.byteLength );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 8, src.byteLength );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst, size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferReusingResize( null, src, 16 );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 0, 16 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    test.case = 'dst, size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferReusingResize( null, src, 32 );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 16, 32 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );

    /* */

    test.case = 'dst, size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var dst = new U8x( 16 );
    var got = _.bufferReusingResize( dst, src, [ 0, src.byteLength - 1 ] );
    var expected = new U8x( 64 );
    var buffer = new U8x( filledBuf, 8, 2 * src.BYTES_PER_ELEMENT );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var dst = new I8x( 16 );
    var got = _.bufferReusingResize( dst, src, [ -8, 7 ] );
    var expected = new I8x( 64 );
    var buffer = new U8x( filledBuf, 0, 16 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var dst = new BufferRaw( 0 );
    var got = _.bufferReusingResize( dst, src, [ -8, 23 ] );
    var expected = new U8x( 64 );
    var buffer = new U8x( filledBuf, 8, 17 );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected.buffer );
    test.true( got !== src );
    test.true( got !== dst );

    test.case = 'dst, size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var dst = new BufferView( new BufferRaw( 0 ) );
    var got = _.bufferReusingResize( dst, src, [ -16, -1 ] );
    var expected = new U8x( 64 );
    var buffer = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ] );
    expected = resultCopyData( expected, buffer );
    expected = new BufferView( expected.buffer );
    test.identical( got, expected );
    test.true( got !== src );
    test.true( got !== dst );

    /* */

    test.case = 'size = range, new offset = 0, new size = buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferReusingResize( src, src, [ 0, src.byteLength - 1 ] );
    var expected = buf( 64 / src.BYTES_PER_ELEMENT );
    var buffer = expect( src, 16, src.byteLength );
    expected = resultCopyData( expected, buffer );
    test.identical( got, expected );
    test.true( got !== src );
  }
}

//

function bufferReusingResizeWithOptionOffsetting( test )
{
  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, not changed length - not new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got === dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval inside buffer, decrease length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 1, 3 ],
    offsetting : 1,
    minSize : 1,
  });
  var expected = new U8x([ 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, decrease length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 1, 3 ],
    offsetting : 0,
    minSize : 1,
  });
  var expected = new U8x([ 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'cinterval inside buffer, grow length - new buffer, dst === src, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 4 ],
    offsetting : 1,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5, 6 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'cinterval inside buffer, grow length - new buffer, dst === src, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 4 ],
    offsetting : 0,
    growFactor : 1,
    minSize : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5, 6 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingResizeWithOptionShrinkFactor( test )
{
  test.case = 'resulted ratio is less than shrinkFactor - 10 / 2 < 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 2, 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted ratio is equal to shrinkFactor - 10 / 1 === 10';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 10,
  });
  var expected = new U8x([ 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted ratio is greater than shrinkFactor - 10 / 1 > 9';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 1, 1 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 9,
  });
  var expected = new U8x([ 3 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'empty resulted container, shrinkFactor - 1000, should be new buffer';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 5 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, -1 ],
    offsetting : 1,
    minSize : 0,
    shrinkFactor : 1000,
  });
  var expected = new U8x( [] );
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingResizeWithOptionGrowFactor( test )
{
  test.case = 'resulted buffer is out of range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 5, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 2 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    minSize : 1,
    offsetting : 1,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 5, 6, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is out of range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 3 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 3 ],
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 5, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 2 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    minSize : 1,
    offsetting : 0,
    growFactor : 3,
  });
  var expected = new U8x([ 2, 3, 4, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferReusingResizeWithOptionMinSize( test )
{
  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    minSize : 1,
    offsetting : 1,
  });
  var expected = new U8x([ 2, 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize < resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 2 ],
    minSize : 1,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 4 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  /* */

  test.case = 'resulted buffer is in range of original buffer, offsetting - 1, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    minSize : 6,
    offsetting : 1,
  });
  var expected = new U8x([ 2, 3, 4, 5, 6, 7 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer === dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    minSize : 6,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );

  test.case = 'resulted buffer is in range of original buffer, offsetting - 0, minSize > resulted size, reusing - 0';
  var buffer = new U8x([ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]).buffer;
  var dst = new U8x( buffer, 2, 4 );
  var got = _.bufferReusingResize
  ({
    dst,
    src : dst,
    cinterval : [ 0, 1 ],
    reusing : 0,
    minSize : 6,
    offsetting : 0,
  });
  var expected = new U8x([ 2, 3, 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== dst );
  test.true( got.buffer !== dst.buffer );
}

//

function bufferBytesGet( test )
{
  /* */

  test.case = 'from empty string';
  var src = '';
  var got = _.bufferBytesGet( src );
  var expected = new U8x( [] );
  test.identical( got, expected );

  test.case = 'from string';
  var src = 'string';
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 115, 116, 114, 105, 110, 103 ]);
  test.identical( got, expected );

  /* */

  test.case = 'from empty BufferRaw';
  var src = new BufferRaw( 0 );
  var got = _.bufferBytesGet( src );
  var expected = new U8x( [] );
  test.identical( got, expected );

  test.case = 'from BufferRaw';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );

  test.case = 'from empty BufferRawShared';
  var src = new BufferRawShared( 0 );
  var got = _.bufferBytesGet( src );
  var expected = new U8x( [] );
  test.identical( got, expected );

  test.case = 'from changed BufferRawShared';
  var src = new BufferRawShared( 5 );
  var view = new U8x( src );
  view[ 1 ] = 2;
  view[ 2 ] = 4;
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 0, 2, 4, 0, 0 ]);
  test.identical( got, expected );

  /* */

  test.case = 'from U8x'
  var src = new U8x([ 1, 2, 10 ]);
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 1, 2, 10 ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'from I16x';
  var src = new I16x([ 1, 2, 10 ]);
  var got = _.bufferBytesGet( src );
  var expected = new U8x( [ 1, 0, 2, 0, 10, 0 ] );
  test.identical( got, expected );

  test.case = 'from F32x';
  var src = new F32x([ 1, 2 ]);
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 0, 0, 128, 63, 0, 0, 0, 64 ]);
  test.identical( got, expected );

  test.case = 'from F32x';
  var src = new F32x([ 1, 2 ]);
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 0, 0, 128, 63, 0, 0, 0, 64 ]);
  test.identical( got, expected );

  test.case = 'from U8x with offset';
  var buffer = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
  var src = new U8x( buffer, 2, 2 );
  var got = _.bufferBytesGet( src );
  var expected = new U8x( 3, 4 );
  test.identical( got, src );
  test.true( got !== src );

  /* */

  test.case = 'from empty BufferView';
  var src = new BufferView( new BufferRaw( 0 ) );
  var got = _.bufferBytesGet( src );
  var expected = new U8x( [] );
  test.identical( got, expected );

  test.case = 'from BufferView';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 1, 2, 3 ]);
  test.identical( got, expected );

  test.case = 'from BufferView with offset';
  var buffer = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
  var src = new BufferView( buffer, 2, 2 );
  var got = _.bufferBytesGet( src );
  var expected = new U8x([ 3, 4 ]);
  test.identical( got, expected );

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'from empty BufferNode';
    var src1 = BufferNode.alloc( 0 );
    var got1 = _.bufferBytesGet( src1 );
    var expected1 = new U8x( [] );
    test.identical( got1, expected1 );

    test.case = 'from BufferNode (array)';
    var src1 = BufferNode.from([ 2, 4 ]);
    var got1 = _.bufferBytesGet( src1 );
    var expected1 = new U8x([ 2, 4 ]);
    test.identical( got1, expected1 );

    test.case = 'from BufferNode (identical symbols)';
    var src1 = BufferNode.alloc( 5, 'a' );
    var got1 = _.bufferBytesGet( src1 );
    var expected1 = new U8x([ 97, 97, 97, 97, 97 ]);
    test.identical( got1, expected1 );

    test.case = 'from BufferNode (string)';
    var src1 = BufferNode.from( 'string' );
    var got1 = _.bufferBytesGet( src1 );
    var expected1 = new U8x([ 115, 116, 114, 105, 110, 103 ]);
    test.identical( got1, expected1 );

    test.case = 'from BufferNode (string with base64)';
    var src1 = BufferNode.from( 'string', 'base64' );
    var got1 = _.bufferBytesGet( src1 );
    var expected1 = new U8x([ 178, 218, 226, 158 ]);
    test.identical( got1, expected1 );

    test.case = 'from BufferNode with offset';
    var buffer1 = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
    var src1 = BufferNode.from( buffer1, 2, 2 );
    var got1 = _.bufferBytesGet( src1 );
    var expected1 = new U8x([ 3, 4 ]);
    test.identical( got1, expected1 );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.bufferBytesGet() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferBytesGet( new BufferRaw( 5 ), 'extra' ) );

  test.case = 'wrong buffer type';
  test.shouldThrowErrorSync( () => _.bufferBytesGet([ 1, 2 ]) );
  test.shouldThrowErrorSync( () => _.bufferBytesGet( 1 ) );
}

//

function bufferRetype( test )
{
  test.open( 'src - I8x' );

  test.case = 'to I8x';
  var raw = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
  var src = new I8x( raw );
  var got = _.bufferRetype( src, I8x );
  var expected = new I8x([ 1, 2, 3, 4, 5 ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'to U8x';
  var raw = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
  var src = new I8x( raw );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 1, 2, 3, 4, 5 ]);
  test.identical( got, expected );

  test.case = 'to I16x';
  var raw = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
  var src = new I8x( raw );
  var got = _.bufferRetype( src, I16x );
  var expected = new I16x([ 513, 1027 ]);
  test.identical( got, expected );

  test.case = 'to F32x';
  var raw = new U8x( 8 ).buffer;
  var src = new I8x( raw );
  var got = _.bufferRetype( src, F32x );
  var expected = new F32x([ 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x';
  var raw = new U8x( 16 ).buffer;
  var src = new I8x ( raw );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n, 0n ]);
  test.identical( got, expected );

  test.close( 'src - I8x' );

  /* - */

  test.open( 'src - U16x' );

  test.case = 'to U16x';
  var raw = new U8x( 8 ).buffer;
  var src = new U16x( raw );
  var got = _.bufferRetype( src, U16x );
  var expected = new U16x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'to U8x';
  var raw = new U8x( 4 ).buffer;
  var src = new U16x( raw );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to I16x';
  var raw = new U8x( 4 ).buffer;
  var src = new U16x( raw );
  var got = _.bufferRetype( src, I16x );
  var expected = new I16x([ 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to F32x';
  var raw = new U8x( 8 ).buffer;
  var src = new U16x( raw );
  var got = _.bufferRetype( src, F32x );
  var expected = new F32x([ 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x';
  var raw = new U8x( 16 ).buffer;
  var src = new U16x ( raw );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n, 0n ]);
  test.identical( got, expected );

  test.close( 'src - U16x' );

  /* - */

  test.open( 'src - F32x' );

  test.case = 'to F32x';
  var raw = new U8x( 8 ).buffer;
  var src = new F32x( raw );
  var got = _.bufferRetype( src, F32x );
  var expected = new F32x([ 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U8x';
  var raw = new U8x( 4 ).buffer;
  var src = new F32x( raw );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U16x';
  var raw = new U8x( 8 ).buffer;
  var src = new F32x( raw );
  var got = _.bufferRetype( src, U16x );
  var expected = new U16x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to I32x';
  var raw = new U8x( 16 ).buffer;
  var src = new F32x( raw );
  var got = _.bufferRetype( src, I32x );
  var expected = new I32x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x';
  var raw = new U8x( 16 ).buffer;
  var src = new F32x( raw );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n, 0n ]);
  test.identical( got, expected );

  test.close( 'src - F32x' );

  /* - */

  test.open( 'src - I64x' );

  test.case = 'to I64x';
  var raw = new U8x( 8 ).buffer;
  var src = new I64x( raw );
  var got = _.bufferRetype( src, I64x );
  var expected = new I64x([ 0n ]);
  test.identical( got, expected );
  test.true( got !== src );

  test.case = 'to U8x';
  var raw = new U8x( 8 ).buffer;
  var src = new I64x( raw );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 0, 0, 0, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U16x';
  var raw = new U8x( 8 ).buffer;
  var src = new I64x( raw );
  var got = _.bufferRetype( src, U16x );
  var expected = new U16x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to F32x';
  var raw = new U8x( 16 ).buffer;
  var src = new I64x( raw );
  var got = _.bufferRetype( src, F32x );
  var expected = new F32x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x';
  var raw = new U8x( 16 ).buffer;
  var src = new I64x( raw );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n, 0n ]);
  test.identical( got, expected );

  test.close( 'src - I64x' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRetype() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferRetype( new U8x( 4 ), F32x, 'some' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferRetype( new BufferRaw( 8 ), U8x ) );
  test.shouldThrowErrorSync( () => _.bufferRetype( 'wrong argument', U8x ) );

  test.case = 'wrong type of bufferType';
  test.shouldThrowErrorSync( () => _.bufferRetype( new U8x( 8 ), 'wrong' ) );
  test.shouldThrowErrorSync( () => _.bufferRetype( new U8x( 8 ), new F64x( 1 ) ) );
}

//

function bufferRetypeWithOffset( test )
{
  test.open( 'src - I8x' );

  test.case = 'to U8x with offset - 1';
  var raw = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
  var src = new I8x( raw, 1 );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 2, 3, 4, 5 ]);
  test.identical( got, expected );

  test.case = 'to I16x with offset - 2, length - 3';
  var raw = new U8x([ 1, 2, 3, 4, 5 ]).buffer;
  var src = new I8x( raw, 2, 3 );
  var got = _.bufferRetype( src, I16x );
  var expected = new I16x([ 1027 ]);
  test.identical( got, expected );

  test.case = 'to F32x with offset - 4, length - 4';
  var raw = new U8x([ 1, 1, 1, 1, 0, 0, 0, 0 ]).buffer;
  var src = new I8x( raw, 4, 4 );
  var got = _.bufferRetype( src, F32x );
  var expected = new F32x([ 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x with offset - 0, length - 8';
  var raw = new U8x( 16 ).buffer;
  var src = new I8x ( raw, 0, 8 );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n ]);
  test.identical( got, expected );

  test.close( 'src - I8x' );

  /* - */

  test.open( 'src - U16x' );

  test.case = 'to U8x with offset - 2';
  var raw = new U8x( 8 ).buffer;
  var src = new U16x( raw, 2 );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 0, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to I16x with offset - 2, length - 3';
  var raw = new U8x( 8 ).buffer;
  var src = new U16x( raw, 2, 3 );
  var got = _.bufferRetype( src, I16x );
  var expected = new I16x([ 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to F32x with offset - 4, length - 2';
  var raw = new U8x( 8 ).buffer;
  var src = new U16x( raw, 4, 2 );
  var got = _.bufferRetype( src, F32x );
  var expected = new F32x([ 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x with offset - 0, length - 8';
  var raw = new U8x( 16 ).buffer;
  var src = new U16x ( raw, 0, 8 );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n, 0n ]);
  test.identical( got, expected );

  test.close( 'src - U16x' );

  /* - */

  test.open( 'src - F32x' );

  test.case = 'to U8x with offset - 4';
  var raw = new U8x( 8 ).buffer;
  var src = new F32x( raw, 4 );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U16x with offset - 4, length - 2';
  var raw = new U8x( 16 ).buffer;
  var src = new F32x( raw, 4, 2 );
  var got = _.bufferRetype( src, U16x );
  var expected = new U16x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to I32x with offset - 4, length - 7';
  var raw = new U8x( 32 ).buffer;
  var src = new F32x( raw, 4, 7 );
  var got = _.bufferRetype( src, I32x );
  var expected = new I32x([ 0, 0, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x with offset - 0, length - 4';
  var raw = new U8x( 32 ).buffer;
  var src = new F32x( raw, 0, 4 );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n, 0n ]);
  test.identical( got, expected );

  test.close( 'src - F32x' );

  /* - */

  test.open( 'src - I64x' );

  test.case = 'to U8x with offset - 0';
  var raw = new U8x( 8 ).buffer;
  var src = new I64x( raw, 0 );
  var got = _.bufferRetype( src, U8x );
  var expected = new U8x([ 0, 0, 0, 0, 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U16x with offset - 8, length - 1';
  var raw = new U8x( 16 ).buffer;
  var src = new I64x( raw, 8, 1 );
  var got = _.bufferRetype( src, U16x );
  var expected = new U16x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to F32x with offset - 8, length - 2';
  var raw = new U8x( 24 ).buffer;
  var src = new I64x( raw, 8, 2 );
  var got = _.bufferRetype( src, F32x );
  var expected = new F32x([ 0, 0, 0, 0 ]);
  test.identical( got, expected );

  test.case = 'to U64x - with offset - 0, length - 2';
  var raw = new U8x( 24 ).buffer;
  var src = new I64x( raw, 0, 2 );
  var got = _.bufferRetype( src, U64x );
  var expected = new U64x([ 0n, 0n ]);
  test.identical( got, expected );

  test.close( 'src - I64x' );
}

//

function bufferJoin( test )
{
  /* constructors */

  var bufferTyped = ( buf ) =>
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } }[ name ];
  };
  var typedList =
  [
    I8x,
    U16x,
    F32x,
    F64x,
  ];
  for( let i = 0; i < typedList.length; i++ )
  typedList[ i ] = bufferTyped( typedList[ i ] );

  /* tests */

  for( let r = 0; r < typedList.length; r++ )
  {
    test.open( typedList[ r ].name );
    run( typedList[ r ] );
    test.close( typedList[ r ].name );
  }

  /* - */

  function run( makeBuffer )
  {
    var bufferTyped = makeBuffer( [ 1, 2, 3, 4, 5 ] );
    var bufferRaw = bufferTyped.buffer;
    var bufferView = new BufferView( bufferRaw );
    var u8x = new U8x( 8 );

    var expectTypedBuffer1 = makeBuffer( [ 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5 ] );
    var expectTypedBuffer2 = makeBuffer( [ 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5 ] );

    /* */

    test.case = 'first - F32x';
    var got = _.bufferJoin( bufferTyped, bufferView, bufferRaw );
    var expected = expectTypedBuffer1;
    test.identical( got, expected );

    test.case = 'first - F32x, u8x, nulls';
    var got = _.bufferJoin( bufferTyped, null, null, bufferView, null, null, bufferRaw, u8x );
    var expected = _.bufferJoin( expectTypedBuffer1, u8x );
    test.identical( got, expected );

    test.case = 'first - BufferView';
    var got = _.bufferJoin( bufferView, bufferTyped, bufferRaw );
    var expected = new BufferView( expectTypedBuffer1.buffer );
    test.identical( got, expected );

    test.case = 'first - BufferView, u8x, nulls';
    var got = _.bufferJoin( null, bufferView, null, bufferTyped, null, bufferRaw, u8x );
    var expected = new BufferView( _.bufferJoin( expectTypedBuffer1.buffer, u8x) );
    test.identical( got, expected );

    test.case = 'first - BufferRaw';
    var got = _.bufferJoin( bufferRaw, bufferTyped, bufferView );
    var expected = expectTypedBuffer1.buffer;
    test.identical( got, expected );

    test.case = 'first - BufferRaw, u8x, nulls';
    var got = _.bufferJoin( bufferRaw, null, bufferTyped, null, bufferView, u8x, null );
    var expected = _.bufferJoin( expectTypedBuffer1.buffer, u8x );
    test.identical( got, expected );

    if( Config.interpreter === 'njs' )
    {
      var bufferNode = BufferNode.from( bufferRaw );

      test.case = 'first - F32x, BufferNode';
      var got1 = _.bufferJoin( bufferTyped, bufferView, bufferNode, bufferRaw );
      var expected1 = expectTypedBuffer2;
      test.identical( got1, expected1 );

      test.case = 'first - BufferView, BufferNode';
      var got1 = _.bufferJoin( bufferView, bufferTyped, bufferNode, bufferRaw );
      var expected1 = new BufferView( expectTypedBuffer2.buffer );
      test.identical( got1, expected1 );

      test.case = 'first - BufferRaw, BufferNode';
      var got1 = _.bufferJoin( bufferRaw, bufferTyped, bufferNode, bufferView );
      var expected1 = expectTypedBuffer2.buffer;
      test.identical( got1, expected1 );

      test.case = 'first - BufferNode';
      var got1 = _.bufferJoin( bufferNode, bufferTyped, bufferView, bufferRaw );
      var expected1 = BufferNode.from( expectTypedBuffer2.buffer );
      test.identical( got1, expected1 );

      test.case = 'first - BufferNode, u8x, nulls';
      var got1 = _.bufferJoin( bufferNode, null, bufferTyped, u8x, bufferView, bufferRaw, null );
      var expected1 = BufferNode.from( _.bufferJoin( bufferNode, bufferTyped, u8x, bufferView, bufferRaw ).buffer );
      test.identical( got1, expected1 );
    }
  }

  /* - */

  test.case = 'without arguments';
  var got = _.bufferJoin();
  test.identical( got, null );

  test.case = 'one arguments, BufferRaw';
  var src = new BufferRaw( 5 );
  var got = _.bufferJoin( src );
  test.true( got === src );
  test.identical( got, src );

  test.case = 'one arguments, BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.bufferJoin( src );
  test.true( got === src );
  test.identical( got, src );

  test.case = 'one arguments, BufferView';
  var src = new BufferView( new U8x( [ 1, 2 ] ).buffer );
  var got = _.bufferJoin( src );
  test.true( got === src );
  test.identical( got, src );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'one arguments, BufferTyped';
    var src1 = BufferNode.from( [ 1, 2 ] );
    var got1 = _.bufferJoin( src1 );
    test.true( got1 === src1 );
    test.identical( got1, src1 );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong type of buffer';
  test.shouldThrowErrorSync( () => _.bufferJoin( 'wrong' ) );
  test.shouldThrowErrorSync( () => _.bufferJoin( new BufferRaw(), 'wrong' ) );
}

//

function bufferMove( test )
{
  /**/

  test.open( 'to dst - array' );

  test.case = 'from src - empty array';
  var dst = [ ];
  var src = [ ];
  var got = _.bufferMove( dst, src );
  test.identical( got, src );
  test.true( got === dst );

  test.case = 'from src - array';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = [ 4, 5, 6 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll';
  var dst = [ 1, 2, 3 ];
  var src = _.unroll.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  test.true( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = [ 1 ];
  var src = _.argumentsArray.make( [ 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = [ 3 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x';
  var dst = [ 0, 2, 3 ];
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x';
  var dst = [ 0, 2, 3 ];
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x';
  var dst = [ 0, 2, 3 ];
  var src = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( dst, src );
  var expected = [ 1n, 2n, 3n ];
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - array' );

  /**/

  test.open( 'to dst - unroll' );

  test.case = 'from src - array';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = _.unroll.make( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - empty unroll';
  var dst = _.unroll.make( [ ] );
  var src = _.unroll.make( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unroll.make( [ ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = _.argumentsArray.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unroll.make( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unroll.make( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unroll.make( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x';
  var dst = _.unroll.make( [ 4, 5, 6 ] );
  var src = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( dst, src );
  var expected = _.unroll.make( [ 1n, 2n, 3n ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - unroll' );

  /**/

  test.open( 'to dst - argumentsArray' );

  test.case = 'from src - array';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = [ 1, 2, 3 ];
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArray.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'to dst argumentsArray from src - unroll';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArray.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - empty argumentsArray';
  var dst = _.argumentsArray.make( [ ] );
  var src = _.argumentsArray.make( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArray.make( [ ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - empty U8x';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArray.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArray.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArray.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArray.make( [ 1n, 2n, 3n ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - argumentsArray' );

  /**/

  test.open( 'to dst - U8x' );

  test.case = 'from src - array';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.unroll.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.argumentsArray.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - empty U8x';
  var dst = new U8x( [ ] );
  var src = new U8x( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigInt.s.from( [ 4, 5, 6 ] ) );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );

  test.close( 'to dst - U8x' );

  /**/

  test.open( 'to dst - F32x' );

  test.case = 'from src - array';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.unroll.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.argumentsArray.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - empty F32x';
  var dst = new F32x( [ ] );
  var src = new F32x( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigInt.s.from( [ 4, 5, 6 ] ) );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - F32x' );

  /**/

  test.open( 'to dst - I64x' );

  test.case = 'from src - array';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigInt.s.from( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = _.unroll.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigInt.s.from( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = new I64x( _.bigInt.s.from([ 1, 2, 3 ]) );
  var src = _.argumentsArray.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigInt.s.from([ 4, 5, 6 ]) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigInt.s.from( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigInt.s.from( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - empty I64x';
  var dst = new I64x( _.bigInt.s.from( [ ] ) );
  var src = new I64x( _.bigInt.s.from( [ ] ) );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigInt.s.from( [ ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - I64x' );
  /**/

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferMove() );

  test.case = 'extra arguments ';
  test.shouldThrowErrorSync( () => _.bufferMove( dst, src, 'extra' ) );

  test.case = '"dst" and "src" must have same length';
  var dst = [ 1, 2, 3, 4 ] ;
  var src = [ 1, 2, 3 ];
  test.shouldThrowErrorSync( () => _.bufferMove( dst, src ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.bufferMove( 'wrong' ) );

}

//

function bufferMoveWithSingleArgument( test )
{
  test.open( 'to dst - array' );

  test.case =  'from src - array, offset - 3';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll, offset - 3';
  var dst = [ 1, 2, 3 ];
  var src = _.unroll.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray, offset - 1';
  var dst = [ 1 ];
  var src = _.argumentsArray.make( [ 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = [ 1, 3 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x, offset - 3';
  var dst = [ 0, 2, 3 ];
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = [ 0, 2, 3, 1, 2, 3 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x, offset - 3';
  var dst = [ 0, 2, 3 ];
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = [ 0, 2, 3, 1, 2, 3 ];
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = [ 0, 2, 3 ];
  var src = new I64x( _.bigInt.s.from( [ 1, 2 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = [ 0, 1n, 2n ];
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - array' );

  /**/

  test.open( 'to dst - unroll' );

  test.case = 'from src - array, offset - 3';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = _.unroll.make( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray, offset - 3';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = _.argumentsArray.make( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = _.unroll.make( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x, offset - 3';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = _.unroll.make( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x, offset - 3';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = _.unroll.make( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = _.unroll.make( [ 1, 2, 3 ] );
  var src = new I64x( _.bigInt.s.from( [ 1, 2 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = _.unroll.make( [ 1, 1n, 2n ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - unroll' );

  /**/

  test.open( 'to dst - argumentsArray' );

  test.case = 'from src - array, offset - 1';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = [ 1, 2, 3 ];
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = _.argumentsArray.make( [ 4, 1, 2 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll, offset - 1';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = _.unroll.make( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = _.argumentsArray.make( [ 4, 1, 2 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x, offset - 1';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = _.argumentsArray.make( [ 4, 1, 2 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x, offset - 1';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = _.argumentsArray.make( [ 4, 1, 2 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = _.argumentsArray.make( [ 4, 5, 6 ] );
  var src = new I64x( _.bigInt.s.from( [ 1, 2 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = _.argumentsArray.make( [ 4, 1n, 2n ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - argumentsArray' );

  /**/

  test.open( 'to dst - U8x' );

  test.case = 'from src - array, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = [ 4, 5 ];
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new U8x( [ 1, 4, 5 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.unroll.make( [ 4, 5 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new U8x( [ 1, 4, 5 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.argumentsArray.make( [ 4, 5 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new U8x( [ 1, 4, 5 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new U8x( [ 1, 4, 5 ] );;
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigInt.s.from( [ 4, 5 ] ) );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  test.identical( got, dst );
  test.true( got === dst );

  test.close( 'to dst - U8x' );

  /**/

  test.open( 'to dst - F32x' );

  test.case = 'from src - array, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = [ 4 ];
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.unroll.make( [ 4 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.argumentsArray.make( [ 4 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new U8x( [ 4 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - I64x, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigInt.s.from( [ 4 ] ) );
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - F32x' );

  /**/

  test.open( 'to dst - I64x' );

  test.case = 'from src - array, offset - 1';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = [ 4, 5 ];
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new I64x( _.bigInt.s.from( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - unroll, offset - 1';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = _.unroll.make( [ 4, 5 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new I64x( _.bigInt.s.from( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - argumentsArray, offset - 1';
  var dst = new I64x( _.bigInt.s.from([ 1, 2, 3 ]) );
  var src = _.argumentsArray.make( [ 4, 5 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new I64x( _.bigInt.s.from( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - U8x, offset - 1';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = new U8x( [ 4, 5 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new I64x( _.bigInt.s.from( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.case = 'from src - F32x, offset - 1';
  var dst = new I64x( _.bigInt.s.from( [ 1, 2, 3 ] ) );
  var src = new F32x( [ 4, 5 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 1 } );
  var expected = new I64x( _.bigInt.s.from( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.true( got === dst );

  test.close( 'to dst - I64x' );

  /**/

  test.open('to dst - BufferRaw');

  test.case = 'from src - array, offset - 2';
  var dst = new BufferRaw( 6 );
  var src = [ 1, 2, 3, 4 ];
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 1, 2, 3, 4 ] );
  test.identical( got, expected );
  test.true( got.buffer === dst );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'from src - unroll, offset - 2';
  var dst = new BufferRaw( 6 );
  var src = _.unroll.make( [ 1, 2, 3, 4 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 1, 2, 3, 4 ] );
  test.identical( got, expected );
  test.true( got.buffer === dst );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'from src - argumentsArray, offset - 3';
  var dst = new BufferRaw( 6 );
  var src = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got.buffer === dst );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'from src - U8x, offset - 2';
  var dst = new BufferRaw( 6 );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 3 } );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3 ] );
  test.identical( got, expected );
  test.true( got.buffer === dst );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'from src - F32x, offset - 2';
  var dst = new BufferRaw( 16 );
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 0, 0, 128, 63, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );
  test.true( got.buffer === dst );
  test.true( got !== dst );
  test.true( got !== src );

  test.case = 'from src - I64x, offset - 2';
  var dst = new BufferRaw( 16 );
  var src = new I64x( _.bigInt.s.from( [ 1 ] ) );
  var got = _.bufferMove( { dst, src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );
  test.true( got.buffer === dst );
  test.true( got !== dst );
  test.true( got !== src );

  test.close( 'to dst - BufferRaw' )
}

//

function bufferLeft( test )
{
  /* constructors */

  var list =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
    // F32x,
    F64x
  ];
  if( Config.interpreter === 'njs' )
  list.push( BufferNode );

  /* - */

  for( let i = 0; i < list.length; i++ )
  {
    for( let j = 0; j < list.length; j++ )
    {
      test.open( 'src - ' + list[ i ].name + ', ins - ' + list[ j ].name );
      run( list[ i ], list[ j ] );
      test.close( 'src - ' + list[ i ].name + ', ins - ' + list[ j ].name );
    }
  }

  /* - */

  function run( makeSrc, makeIns )
  {
    var srcBuffer1 = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1 ] ).buffer;
    var srcBuffer2 = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 1, 2, 3, 4, 4, 3, 2, 1 ] ).buffer;
    var srcBuffer3 = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1 ] ).buffer;
    var insBuffer = new U8x( [ 1, 2, 3, 4, 4, 3, 2, 1 ] ).buffer

    test.case = 'one entry';
    var src = new makeSrc( srcBuffer1 );
    var ins = new makeIns( insBuffer );
    var got = _.bufferLeft( src, ins );
    test.identical( got, 8 );

    test.case = 'few entries';
    var src = new makeSrc( srcBuffer2 );
    var ins = new makeIns( insBuffer );
    var got = _.bufferLeft( src, ins );
    test.identical( got, 8 );

    test.case = 'no entry';
    var src = new makeSrc( srcBuffer3 );
    var ins = new makeIns( insBuffer );
    var got = _.bufferLeft( src, ins );
    test.identical( got, -1 );
  }

  if( !Config.debug )
  return;

  test.case = 'src is BufferRaw';
  test.shouldThrowErrorSync( () => _.bufferLeft( new U8x( [ 1 ] ).buffer, new U8x( [ 2, 1 ] ) ) );

  test.case = 'ins is BufferRaw';
  test.shouldThrowErrorSync( () => _.bufferLeft( new U8x( [ 1 ] ), new U8x( [ 2, 1 ] ).buffer ) );
}

//

function bufferRight( test )
{
  /* constructors */

  var list =
  [
    I8x,
    U16x,
    F64x,
  ];
  if( Config.interpreter === 'njs' )
  list.push( BufferNode );

  /* - */

  for( let i = 0; i < list.length; i++ )
  {
    for( let j = 0; j < list.length; j++ )
    {
      test.open( 'src - ' + list[ i ].name + ', ins - ' + list[ j ].name );
      run( list[ i ], list[ j ] );
      test.close( 'src - ' + list[ i ].name + ', ins - ' + list[ j ].name );
    }
  }

  /* - */

  function run( makeSrc, makeIns )
  {
    var srcBuffer1 = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1 ] ).buffer;
    var srcBuffer2 = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 1, 2, 3, 4, 4, 3, 2, 1 ] ).buffer;
    var srcBuffer3 = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1 ] ).buffer;
    var insBuffer = new U8x( [ 1, 2, 3, 4, 4, 3, 2, 1 ] ).buffer

    test.case = 'one entry';
    var src = new makeSrc( srcBuffer1 );
    var ins = new makeIns( insBuffer );
    var got = _.bufferRight( src, ins );
    test.identical( got, 8 );

    test.case = 'few entries';
    var src = new makeSrc( srcBuffer2 );
    var ins = new makeIns( insBuffer );
    debugger;
    var got = _.bufferRight( src, ins );
    test.identical( got, 16 );

    test.case = 'no entry';
    var src = new makeSrc( srcBuffer3 );
    var ins = new makeIns( insBuffer );
    var got = _.bufferRight( src, ins );
    test.identical( got, -1 );
  }

  if( !Config.debug )
  return;

  test.case = 'src is BufferRaw';
  test.shouldThrowErrorSync( () => _.bufferRight( new U8x( [ 1 ] ).buffer, new U8x( [ 2, 1 ] ) ) );

  test.case = 'ins is BufferRaw';
  test.shouldThrowErrorSync( () => _.bufferRight( new U8x( [ 1 ] ), new U8x( [ 2, 1 ] ).buffer ) );
}

//

function bufferIsolateWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    F64x,
  ];
  if( Config.interpreter === 'njs' )
  list.push( BufferNode );

  /* - */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
    testRun( list[ i ] );
    test.close( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
  }

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), new makeBuffer([ 2 ]), new makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del, 3 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3, 2, 4 ]), undefined, new makeBuffer( [] ) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty U8x, delimeter - empty line';
  var src = new U8x( [] );
  var del = '';
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty I16x, delimeter - empty U8x, times > 1';
  var src = new I16x( [] );
  var del = new U8x( [] );
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new I16x( [] ), undefined, new I16x( [] ) ] );

  test.case = 'src - F32x, delimeter - empty I8x';
  var src = new F32x([ 1, 2, 3 ]);
  var del = new I8x( [] );
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new F32x( [] ), undefined, new F32x([ 1, 2, 3 ]) ] );

  test.case = 'src - F64x, delimeter - empty U32x, times > 1';
  var src = new F64x([ 1, 2, 3 ]);
  var del = new F32x( [] );
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new F64x( [] ), undefined, new F64x([ 1, 2, 3 ]) ] );

  test.case = 'src - I16x, delimeter - I8x, not entry';
  var src = new I16x([ 1, 2, 3 ]);
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new I16x( [] ), undefined, new I16x([ 1, 2, 3 ]) ] );

  test.case = 'src - U8x, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]);
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 0, 1, 2, 3 ]) ] );

  test.case = 'src - U8x, delimeter - string-space, entry';
  var src = new U8x([ 1, 0, 32, 0, 3 ]);
  var del = ' ';
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new U8x([ 1, 0 ]), new U8x([ 32 ]), new U8x([ 0, 3 ]) ] );

  test.case = 'src - U16x, delimeter - U8x, entry, times > 1, times > entry';
  var src = new U16x([ 1, 2, 3 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new U16x([ 1, 2, 3 ]), undefined, new U16x( [] ) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new I16x([ 1 ]), new I16x([ 2 ]), new I16x([ 3, 2, 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new I16x([ 1, 2, 3 ]), new I16x([ 2 ]), new I16x([ 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolate( src, del, 3 );
  test.identical( got, [ new I16x([ 1, 2, 3, 2, 4 ]), undefined, new I16x( [] ) ] );

  test.close( 'different types of src and delimeter' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolate() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolate( new U8x( 3 ), new U16x( 1 ), 1, 2 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferIsolate( [ 'wrong' ], new U8x([ 32 ]) ) );

  test.case = 'wrong type of delimeter';
  test.shouldThrowErrorSync( () => _.bufferIsolate( new U8x([ 32 ]), [ 'wrong' ] ) );

  test.case = 'wrong type of map o';
  test.shouldThrowErrorSync( () => _.bufferIsolate( new U8x() ) );

  test.case = 'unknown options in map o';
  test.shouldThrowErrorSync( () => _.bufferIsolate({ src : new U8x(), unknown : 1, times : 1 }) );
}

//

function bufferIsolateWithBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  /* - */

  test.open( 'src - bufferRaw, delimeter - bufferRaw' );
  testRun( bufferRaw );
  test.close( 'src - bufferRaw, delimeter - bufferRaw' );

  /* - */

  test.open( 'src - bufferView, delimeter - bufferView' );
  testRun( bufferView );
  test.close( 'src - bufferView, delimeter - bufferView' );

  /* - */

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), makeBuffer([ 2 ]), makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolate( src, del, 3 );
    test.identical( got, [ makeBuffer([ 1, 2, 3, 2, 4 ]), undefined, makeBuffer( [] ) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty BufferRaw, delimeter - empty line';
  var src = new BufferRaw( 0 );
  var del = '';
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - empty BufferView, delimeter - empty U8x, times > 1';
  var src = new BufferView( new BufferRaw( 0 ) );
  var del = new U8x( [] );
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - empty I8x';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x( [] );
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - empty U32x, times > 1';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new F32x( [] );
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) ] );

  test.case = 'src - BufferRaw, delimeter - I8x, not entry';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]).buffer;
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 0, 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - string-space, entry';
  var src = new BufferView( new U8x([ 1, 0, 32, 0, 3 ]).buffer );
  var del = ' ';
  var got = _.bufferIsolate( src, del );
  var buffer1 = new U8x([ 1, 0 ]).buffer;
  var buffer2 = new U8x([ 32 ]).buffer;
  var buffer3 = new U8x([ 0, 3 ]).buffer;
  test.identical( got, [ new BufferView( buffer1 ), new BufferView( buffer2 ), new BufferView( buffer3 ) ] );

  test.case = 'src - BufferView, delimeter - U8x, entry, times > 1, times > entry';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolate( src, del );
  test.identical( got, [ new U8x([ 1 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 3, 2, 4 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolate( src, del, 2 );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 4 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate( src, del, 3 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.close( 'different types of src and delimeter' );
}

//

function bufferIsolateWithStrings( test )
{
  test.open( 'src - string, delimeter - string' );

  test.case = 'src - empty string, delimeter - empty string';
  var got = _.bufferIsolate( '', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty string, times > 1';
  var got = _.bufferIsolate( '', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty string';
  var got = _.bufferIsolate( 'a b c', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - empty string, times > 1';
  var got = _.bufferIsolate( 'a b c', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, not entry';
  var got = _.bufferIsolate( 'a b c', 'd' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, not entry, times > 1';
  var got = _.bufferIsolate( 'a b c', 'd', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry';
  var got = _.bufferIsolate( 'a b c', 'b' );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry, times > 1';
  var got = _.bufferIsolate( 'a b c', 'b', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, few entries';
  var got = _.bufferIsolate( 'a b c', ' ' );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolate( 'a b c', ' ', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolate( 'a b c', ' ', 3 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.close( 'src - string, delimeter - string' );

  /* - */

  test.open( 'src - string, delimeter - buffer' );

  test.case = 'src - empty string, delimeter - empty I8x';
  var got = _.bufferIsolate( '', new I8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty F32x, times > 1';
  var got = _.bufferIsolate( '', new F32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty U8x';
  var got = _.bufferIsolate( 'a b c', new U8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - empty U32x, times > 1';
  var got = _.bufferIsolate( 'a b c', new U32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, not entry';
  var got = _.bufferIsolate( 'a b c', new I8x([ 106 ]) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U16x, not entry, times > 1';
  var got = _.bufferIsolate( 'a b c', new U16x([ 106 ]), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry';
  var got = _.bufferIsolate( 'a b c', new U8x([ 98 ]) );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry, times > 1';
  var got = _.bufferIsolate( 'a b c', new U8x([ 98 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries';
  var got = _.bufferIsolate( 'a b c', new I8x([ 32 ]) );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolate( 'a b c', new I8x([ 32 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolate( 'a b c', new I8x([ 32 ]), 3 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.close( 'src - string, delimeter - buffer' );
}

//

function bufferIsolateCallWithMap( test )
{
  test.open( 'without entries' );

  test.case = 'src - U8x, delimeter - U8x, few entries, default values';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 8 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 1, none : 1 });
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 1, 2, 3, 2, 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, times > 1';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 8 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 2, left : 1, none : 1 });
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 1, 2, 3, 2, 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, times - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 8 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 0, left : 1, none : 1 });
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 1, 2, 3, 2, 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, times - 0, left - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 8 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 0, left : 0, none : 1 });
  test.identical( got, [ new U8x([ 1, 2, 3, 2, 4 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, left - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 8 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 0, none : 1 });
  test.identical( got, [ new U8x([ 1, 2, 3, 2, 4 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, none - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 8 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 1, none : 0 });
  test.identical( got, [ new U8x([ 1, 2, 3, 2, 4 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, left - 0, none - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 8 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 0, none : 0 });
  test.identical( got, [ new U8x([]), undefined, new U8x([ 1, 2, 3, 2, 4 ]) ] );

  test.close( 'without entries' );

  /* - */

  test.open( 'few entries' );

  test.case = 'src - U8x, delimeter - U8x, few entries, default values';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 1, none : 1 });
  test.identical( got, [ new U8x([ 1 ]), new U8x([ 2 ]), new U8x([ 3, 2, 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, times > 1';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 2, left : 1, none : 1 });
  test.identical( got, [ new U8x([ 1, 2, 3 ]), new U8x([ 2 ]), new U8x([ 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, times - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 0, left : 1, none : 1 });
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 1, 2, 3, 2, 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, times - 0, left - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 0, left : 0, none : 1 });
  test.identical( got, [ new U8x([ 1, 2, 3, 2, 4 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, left - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 0, none : 1 });
  test.identical( got, [ new U8x([ 1, 2, 3 ]), new U8x([ 2 ]), new U8x([ 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, none - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 1, none : 0 });
  test.identical( got, [ new U8x([ 1 ]), new U8x([ 2 ]), new U8x([ 3, 2, 4 ]) ] );

  test.case = 'src - U8x, delimeter - U8x, few entries, left - 0, none - 0';
  var src = new U8x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolate({ src, delimeter : del, times : 1, left : 0, none : 0 });
  test.identical( got, [ new U8x([ 1, 2, 3 ]), new U8x([ 2 ]), new U8x([ 4 ]) ] );

  test.close( 'few entries' );
}

//

function bufferIsolateLeftOrNoneWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    F64x,
  ];
  if( Config.interpreter === 'njs' )
  list.push( BufferNode );

  /* - */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
    testRun( list[ i ] );
    test.close( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
  }

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), new makeBuffer([ 2 ]), new makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 3 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3, 2, 4 ]), undefined, new makeBuffer( [] ) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty U8x, delimeter - empty line';
  var src = new U8x( [] );
  var del = '';
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty I16x, delimeter - empty U8x, times > 1';
  var src = new I16x( [] );
  var del = new U8x( [] );
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new I16x( [] ), undefined, new I16x( [] ) ] );

  test.case = 'src - F32x, delimeter - empty I8x';
  var src = new F32x([ 1, 2, 3 ]);
  var del = new I8x( [] );
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new F32x( [] ), undefined, new F32x([ 1, 2, 3 ]) ] );

  test.case = 'src - F64x, delimeter - empty U32x, times > 1';
  var src = new F64x([ 1, 2, 3 ]);
  var del = new F32x( [] );
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new F64x( [] ), undefined, new F64x([ 1, 2, 3 ]) ] );

  test.case = 'src - I16x, delimeter - I8x, not entry';
  var src = new I16x([ 1, 2, 3 ]);
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new I16x( [] ), undefined, new I16x([ 1, 2, 3 ]) ] );

  test.case = 'src - U8x, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]);
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 0, 1, 2, 3 ]) ] );

  test.case = 'src - U8x, delimeter - string-space, entry';
  var src = new U8x([ 1, 0, 32, 0, 3 ]);
  var del = ' ';
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new U8x([ 1, 0 ]), new U8x([ 32 ]), new U8x([ 0, 3 ]) ] );

  test.case = 'src - U16x, delimeter - U8x, entry, times > 1, times > entry';
  var src = new U16x([ 1, 2, 3 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new U16x([ 1, 2, 3 ]), undefined, new U16x( [] ) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new I16x([ 1 ]), new I16x([ 2 ]), new I16x([ 3, 2, 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new I16x([ 1, 2, 3 ]), new I16x([ 2 ]), new I16x([ 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrNone( src, del, 3 );
  test.identical( got, [ new I16x([ 1, 2, 3, 2, 4 ]), undefined, new I16x( [] ) ] );

  test.close( 'different types of src and delimeter' );

  /* - */

  test.case = 'call with options map';

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 32, 2, 4 ]);
  var got = _.bufferIsolateLeftOrNone({ src });
  test.identical( got, [ new U8x([ 1, 2 ]), new U8x([ 32 ]), new U8x([ 2, 4 ]) ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone( new U8x( 3 ), new U16x( 1 ), 1, 2 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone( [ 'wrong' ], new U8x([ 32 ]) ) );

  test.case = 'wrong type of delimeter';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone( new U8x([ 32 ]), [ 'wrong' ] ) );

  test.case = 'wrong type of map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone( new U8x() ) );

  test.case = 'unknown options in map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone({ src : new U8x(), unknown : 1, times : 1 }) );

  test.case = 'option left in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone({ src : new U8x(), left : 1, times : 1 }) );

  test.case = 'option none in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrNone({ src : new U8x(), none : 1, times : 1 }) );
}

//

function bufferIsolateLeftOrNoneWithBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  /* - */

  test.open( 'src - bufferRaw, delimeter - bufferRaw' );
  testRun( bufferRaw );
  test.close( 'src - bufferRaw, delimeter - bufferRaw' );

  /* - */

  test.open( 'src - bufferView, delimeter - bufferView' );
  testRun( bufferView );
  test.close( 'src - bufferView, delimeter - bufferView' );

  /* - */

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), makeBuffer([ 2 ]), makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrNone( src, del, 3 );
    test.identical( got, [ makeBuffer([ 1, 2, 3, 2, 4 ]), undefined, makeBuffer( [] ) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty BufferRaw, delimeter - empty line';
  var src = new BufferRaw( 0 );
  var del = '';
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - empty BufferView, delimeter - empty U8x, times > 1';
  var src = new BufferView( new BufferRaw( 0 ) );
  var del = new U8x( [] );
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - empty I8x';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x( [] );
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - empty U32x, times > 1';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new F32x( [] );
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) ] );

  test.case = 'src - BufferRaw, delimeter - I8x, not entry';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]).buffer;
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 0, 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - string-space, entry';
  var src = new BufferView( new U8x([ 1, 0, 32, 0, 3 ]).buffer );
  var del = ' ';
  var got = _.bufferIsolateLeftOrNone( src, del );
  var buffer1 = new U8x([ 1, 0 ]).buffer;
  var buffer2 = new U8x([ 32 ]).buffer;
  var buffer3 = new U8x([ 0, 3 ]).buffer;
  test.identical( got, [ new BufferView( buffer1 ), new BufferView( buffer2 ), new BufferView( buffer3 ) ] );

  test.case = 'src - BufferView, delimeter - U8x, entry, times > 1, times > entry';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateLeftOrNone( src, del );
  test.identical( got, [ new U8x([ 1 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 3, 2, 4 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateLeftOrNone( src, del, 2 );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 4 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateLeftOrNone( src, del, 3 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.close( 'different types of src and delimeter' );
}

//

function bufferIsolateLeftOrNoneWithStrings( test )
{
  test.open( 'src - string, delimeter - string' );

  test.case = 'src - empty string, delimeter - empty string';
  var got = _.bufferIsolateLeftOrNone( '', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateLeftOrNone( '', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty string';
  var got = _.bufferIsolateLeftOrNone( 'a b c', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateLeftOrNone( 'a b c', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, not entry';
  var got = _.bufferIsolateLeftOrNone( 'a b c', 'd' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, not entry, times > 1';
  var got = _.bufferIsolateLeftOrNone( 'a b c', 'd', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry';
  var got = _.bufferIsolateLeftOrNone( 'a b c', 'b' );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry, times > 1';
  var got = _.bufferIsolateLeftOrNone( 'a b c', 'b', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, few entries';
  var got = _.bufferIsolateLeftOrNone( 'a b c', ' ' );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrNone( 'a b c', ' ', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrNone( 'a b c', ' ', 3 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.close( 'src - string, delimeter - string' );

  /* - */

  test.open( 'src - string, delimeter - buffer' );

  test.case = 'src - empty string, delimeter - empty I8x';
  var got = _.bufferIsolateLeftOrNone( '', new I8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty F32x, times > 1';
  var got = _.bufferIsolateLeftOrNone( '', new F32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty U8x';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new U8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - empty U32x, times > 1';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new U32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, not entry';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new I8x([ 106 ]) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U16x, not entry, times > 1';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new U16x([ 106 ]), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new U8x([ 98 ]) );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry, times > 1';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new U8x([ 98 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new I8x([ 32 ]) );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new I8x([ 32 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrNone( 'a b c', new I8x([ 32 ]), 3 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.close( 'src - string, delimeter - buffer' );
}

//

function bufferIsolateLeftOrAllWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    F64x,
  ];
  if( Config.interpreter === 'njs' )
  list.push( BufferNode );

  /* - */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
    testRun( list[ i ] );
    test.close( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
  }

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), new makeBuffer([ 2 ]), new makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 3 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3, 2, 4 ]), undefined, new makeBuffer( [] ) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty U8x, delimeter - empty line';
  var src = new U8x( [] );
  var del = '';
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty I16x, delimeter - empty U8x, times > 1';
  var src = new I16x( [] );
  var del = new U8x( [] );
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new I16x( [] ), undefined, new I16x( [] ) ] );

  test.case = 'src - F32x, delimeter - empty I8x';
  var src = new F32x([ 1, 2, 3 ]);
  var del = new I8x( [] );
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new F32x([ 1, 2, 3 ]), undefined, new F32x( [] ) ] );

  test.case = 'src - F64x, delimeter - empty U32x, times > 1';
  var src = new F64x([ 1, 2, 3 ]);
  var del = new F32x( [] );
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new F64x([ 1, 2, 3 ]), undefined, new F64x( [] ) ] );

  test.case = 'src - I16x, delimeter - I8x, not entry';
  var src = new I16x([ 1, 2, 3 ]);
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new I16x([ 1, 2, 3 ]), undefined, new I16x( [] ) ] );

  test.case = 'src - U8x, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]);
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new U8x([ 0, 1, 2, 3 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - U8x, delimeter - string-space, entry';
  var src = new U8x([ 1, 0, 32, 0, 3 ]);
  var del = ' ';
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new U8x([ 1, 0 ]), new U8x([ 32 ]), new U8x([ 0, 3 ]) ] );

  test.case = 'src - U16x, delimeter - U8x, entry, times > 1, times > entry';
  var src = new U16x([ 1, 2, 3 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new U16x([ 1, 2, 3 ]), undefined, new U16x( [] ) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new I16x([ 1 ]), new I16x([ 2 ]), new I16x([ 3, 2, 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new I16x([ 1, 2, 3 ]), new I16x([ 2 ]), new I16x([ 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateLeftOrAll( src, del, 3 );
  test.identical( got, [ new I16x([ 1, 2, 3, 2, 4 ]), undefined, new I16x( [] ) ] );

  test.close( 'different types of src and delimeter' );

  /* - */

  test.case = 'call with options map';

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 32, 2, 4 ]);
  var got = _.bufferIsolateLeftOrAll({ src });
  test.identical( got, [ new U8x([ 1, 2 ]), new U8x([ 32 ]), new U8x([ 2, 4 ]) ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll( new U8x( 3 ), new U16x( 1 ), 1, 2 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll( [ 'wrong' ], new U8x([ 32 ]) ) );

  test.case = 'wrong type of delimeter';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll( new U8x([ 32 ]), [ 'wrong' ] ) );

  test.case = 'wrong type of map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll( new U8x() ) );

  test.case = 'unknown options in map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll({ src : new U8x(), unknown : 1, times : 1 }) );

  test.case = 'option left in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll({ src : new U8x(), left : 1, times : 1 }) );

  test.case = 'option none in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateLeftOrAll({ src : new U8x(), none : 1, times : 1 }) );
}

//

function bufferIsolateLeftOrAllWithBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  /* - */

  test.open( 'src - bufferRaw, delimeter - bufferRaw' );
  testRun( bufferRaw );
  test.close( 'src - bufferRaw, delimeter - bufferRaw' );

  /* - */

  test.open( 'src - bufferView, delimeter - bufferView' );
  testRun( bufferView );
  test.close( 'src - bufferView, delimeter - bufferView' );

  /* - */

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), makeBuffer([ 2 ]), makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateLeftOrAll( src, del, 3 );
    test.identical( got, [ makeBuffer([ 1, 2, 3, 2, 4 ]), undefined, makeBuffer( [] ) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty BufferRaw, delimeter - empty line';
  var src = new BufferRaw( 0 );
  var del = '';
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - empty BufferView, delimeter - empty U8x, times > 1';
  var src = new BufferView( new BufferRaw( 0 ) );
  var del = new U8x( [] );
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - empty I8x';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x( [] );
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - BufferView, delimeter - empty U32x, times > 1';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new F32x( [] );
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - I8x, not entry';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - BufferRaw, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]).buffer;
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new U8x([ 0, 1, 2, 3 ]).buffer, undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - BufferView, delimeter - string-space, entry';
  var src = new BufferView( new U8x([ 1, 0, 32, 0, 3 ]).buffer );
  var del = ' ';
  var got = _.bufferIsolateLeftOrAll( src, del );
  var buffer1 = new U8x([ 1, 0 ]).buffer;
  var buffer2 = new U8x([ 32 ]).buffer;
  var buffer3 = new U8x([ 0, 3 ]).buffer;
  test.identical( got, [ new BufferView( buffer1 ), new BufferView( buffer2 ), new BufferView( buffer3 ) ] );

  test.case = 'src - BufferView, delimeter - U8x, entry, times > 1, times > entry';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateLeftOrAll( src, del );
  test.identical( got, [ new U8x([ 1 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 3, 2, 4 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateLeftOrAll( src, del, 2 );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 4 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateLeftOrAll( src, del, 3 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.close( 'different types of src and delimeter' );
}

//

function bufferIsolateLeftOrAllWithStrings( test )
{
  test.open( 'src - string, delimeter - string' );

  test.case = 'src - empty string, delimeter - empty string';
  var got = _.bufferIsolateLeftOrAll( '', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateLeftOrAll( '', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty string';
  var got = _.bufferIsolateLeftOrAll( 'a b c', '' );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateLeftOrAll( 'a b c', '', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, not entry';
  var got = _.bufferIsolateLeftOrAll( 'a b c', 'd' );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, not entry, times > 1';
  var got = _.bufferIsolateLeftOrAll( 'a b c', 'd', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, entry';
  var got = _.bufferIsolateLeftOrAll( 'a b c', 'b' );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry, times > 1';
  var got = _.bufferIsolateLeftOrAll( 'a b c', 'b', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, few entries';
  var got = _.bufferIsolateLeftOrAll( 'a b c', ' ' );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrAll( 'a b c', ' ', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrAll( 'a b c', ' ', 3 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.close( 'src - string, delimeter - string' );

  /* - */

  test.open( 'src - string, delimeter - buffer' );

  test.case = 'src - empty string, delimeter - empty I8x';
  var got = _.bufferIsolateLeftOrAll( '', new I8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty F32x, times > 1';
  var got = _.bufferIsolateLeftOrAll( '', new F32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty U8x';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new U8x( [] ) );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty U32x, times > 1';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new U32x( [] ), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - I8x, not entry';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new I8x([ 106 ]) );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - U16x, not entry, times > 1';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new U16x([ 106 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - U8x, entry';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new U8x([ 98 ]) );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry, times > 1';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new U8x([ 98 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new I8x([ 32 ]) );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new I8x([ 32 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateLeftOrAll( 'a b c', new I8x([ 32 ]), 3 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.close( 'src - string, delimeter - buffer' );
}

//

function bufferIsolateRightOrNoneWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    F64x,
  ];
  if( Config.interpreter === 'njs' )
  list.push( BufferNode );

  /* - */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
    testRun( list[ i ] );
    test.close( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
  }

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), new makeBuffer([ 2 ]), new makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 3 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3, 2, 4 ]) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty U8x, delimeter - empty line';
  var src = new U8x( [] );
  var del = '';
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty I16x, delimeter - empty U8x, times > 1';
  var src = new I16x( [] );
  var del = new U8x( [] );
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new I16x( [] ), undefined, new I16x( [] ) ] );

  test.case = 'src - F32x, delimeter - empty I8x';
  var src = new F32x([ 1, 2, 3 ]);
  var del = new I8x( [] );
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new F32x([ 1, 2, 3 ]), undefined, new F32x( [] ) ] );

  test.case = 'src - F64x, delimeter - empty U32x, times > 1';
  var src = new F64x([ 1, 2, 3 ]);
  var del = new F32x( [] );
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new F64x([ 1, 2, 3 ]), undefined, new F64x( [] ) ] );

  test.case = 'src - I16x, delimeter - I8x, not entry';
  var src = new I16x([ 1, 2, 3 ]);
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new I16x([ 1, 2, 3 ]), undefined, new I16x( [] ) ] );

  test.case = 'src - U8x, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]);
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new U8x([ 0, 1, 2, 3 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - U8x, delimeter - string-space, entry';
  var src = new U8x([ 1, 0, 32, 0, 3 ]);
  var del = ' ';
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new U8x([ 1, 0 ]), new U8x([ 32 ]), new U8x([ 0, 3 ]) ] );

  test.case = 'src - U16x, delimeter - U8x, entry, times > 1, times > entry';
  var src = new U16x([ 1, 2, 3 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new U16x( [] ), undefined, new U16x([ 1, 2, 3 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new I16x([ 1, 2, 3 ]), new I16x([ 2 ]), new I16x([ 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new I16x([ 1 ]), new I16x([ 2 ]), new I16x([ 3, 2, 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrNone( src, del, 3 );
  test.identical( got, [ new I16x( [] ), undefined, new I16x([ 1, 2, 3, 2, 4 ]) ] );

  test.close( 'different types of src and delimeter' );

  /* - */

  test.case = 'call with options map';

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 32, 2, 4 ]);
  var got = _.bufferIsolateRightOrNone({ src });
  test.identical( got, [ new U8x([ 1, 2 ]), new U8x([ 32 ]), new U8x([ 2, 4 ]) ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone( new U8x( 3 ), new U16x( 1 ), 1, 2 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone( [ 'wrong' ], new U8x([ 32 ]) ) );

  test.case = 'wrong type of delimeter';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone( new U8x([ 32 ]), [ 'wrong' ] ) );

  test.case = 'wrong type of map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone( new U8x() ) );

  test.case = 'unknown options in map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone({ src : new U8x(), unknown : 1, times : 1 }) );

  test.case = 'option left in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone({ src : new U8x(), left : 1, times : 1 }) );

  test.case = 'option none in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrNone({ src : new U8x(), none : 1, times : 1 }) );
}

//

function bufferIsolateRightOrNoneWithBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  /* - */

  test.open( 'src - bufferRaw, delimeter - bufferRaw' );
  testRun( bufferRaw );
  test.close( 'src - bufferRaw, delimeter - bufferRaw' );

  /* - */

  test.open( 'src - bufferView, delimeter - bufferView' );
  testRun( bufferView );
  test.close( 'src - bufferView, delimeter - bufferView' );

  /* - */

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, delimeter, entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), makeBuffer([ 2 ]), makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrNone( src, del, 3 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3, 2, 4 ]) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty BufferRaw, delimeter - empty line';
  var src = new BufferRaw( 0 );
  var del = '';
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - empty BufferView, delimeter - empty U8x, times > 1';
  var src = new BufferView( new BufferRaw( 0 ) );
  var del = new U8x( [] );
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - empty I8x';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x( [] );
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - BufferView, delimeter - empty U32x, times > 1';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new F32x( [] );
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new BufferView( new U8x([ 1, 2, 3 ]).buffer ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - I8x, not entry';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - BufferRaw, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]).buffer;
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new U8x([ 0, 1, 2, 3 ]).buffer, undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - BufferView, delimeter - string-space, entry';
  var src = new BufferView( new U8x([ 1, 0, 32, 0, 3 ]).buffer );
  var del = ' ';
  var got = _.bufferIsolateRightOrNone( src, del );
  var buffer1 = new U8x([ 1, 0 ]).buffer;
  var buffer2 = new U8x([ 32 ]).buffer;
  var buffer3 = new U8x([ 0, 3 ]).buffer;
  test.identical( got, [ new BufferView( buffer1 ), new BufferView( buffer2 ), new BufferView( buffer3 ) ] );

  test.case = 'src - BufferView, delimeter - U8x, entry, times > 1, times > entry';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateRightOrNone( src, del );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 4 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateRightOrNone( src, del, 2 );
  test.identical( got, [ new U8x([ 1 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 3, 2, 4 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateRightOrNone( src, del, 3 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer ) ] );

  test.close( 'different types of src and delimeter' );
}

//

function bufferIsolateRightOrNoneWithStrings( test )
{
  test.open( 'src - string, delimeter - string' );

  test.case = 'src - empty string, delimeter - empty string';
  var got = _.bufferIsolateRightOrNone( '', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateRightOrNone( '', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty string';
  var got = _.bufferIsolateRightOrNone( 'a b c', '' );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateRightOrNone( 'a b c', '', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, not entry';
  var got = _.bufferIsolateRightOrNone( 'a b c', 'd' );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, not entry, times > 1';
  var got = _.bufferIsolateRightOrNone( 'a b c', 'd', 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - string, entry';
  var got = _.bufferIsolateRightOrNone( 'a b c', 'b' );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry, times > 1';
  var got = _.bufferIsolateRightOrNone( 'a b c', 'b', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries';
  var got = _.bufferIsolateRightOrNone( 'a b c', ' ' );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrNone( 'a b c', ' ', 2 );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrNone( 'a b c', ' ', 3 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.close( 'src - string, delimeter - string' );

  /* - */

  test.open( 'src - string, delimeter - buffer' );

  test.case = 'src - empty string, delimeter - empty I8x';
  var got = _.bufferIsolateRightOrNone( '', new I8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty F32x, times > 1';
  var got = _.bufferIsolateRightOrNone( '', new F32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty U8x';
  var got = _.bufferIsolateRightOrNone( 'a b c', new U8x( [] ) );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty U32x, times > 1';
  var got = _.bufferIsolateRightOrNone( 'a b c', new U32x( [] ), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - I8x, not entry';
  var got = _.bufferIsolateRightOrNone( 'a b c', new I8x([ 106 ]) );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - U16x, not entry, times > 1';
  var got = _.bufferIsolateRightOrNone( 'a b c', new U16x([ 106 ]), 2 );
  test.identical( got, [ new U8x([ 97, 32, 98, 32, 99 ]), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - U8x, entry';
  var got = _.bufferIsolateRightOrNone( 'a b c', new U8x([ 98 ]) );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry, times > 1';
  var got = _.bufferIsolateRightOrNone( 'a b c', new U8x([ 98 ]), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries';
  var got = _.bufferIsolateRightOrNone( 'a b c', new I8x([ 32 ]) );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrNone( 'a b c', new I8x([ 32 ]), 2 );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrNone( 'a b c', new I8x([ 32 ]), 3 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.close( 'src - string, delimeter - buffer' );
}

//

function bufferIsolateRightOrAllWithBufferTyped( test )
{
  var list =
  [
    I8x,
    U16x,
    F64x,
  ];
  if( Config.interpreter === 'njs' )
  list.push( BufferNode );

  /* - */

  for( let i = 0; i < list.length; i++ )
  {
    test.open( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
    testRun( list[ i ] );
    test.close( 'src - ' + list[ i ].name + ', delimeter - ' + list[ i ].name );
  }

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = new makeBuffer( [] );
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = new makeBuffer([ 1, 2, 3 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ new makeBuffer([ 1, 2, 3 ]), new makeBuffer([ 2 ]), new makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ new makeBuffer([ 1 ]), new makeBuffer([ 2 ]), new makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = new makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = new makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 3 );
    test.identical( got, [ new makeBuffer( [] ), undefined, new makeBuffer([ 1, 2, 3, 2, 4 ]) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty U8x, delimeter - empty line';
  var src = new U8x( [] );
  var del = '';
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty I16x, delimeter - empty U8x, times > 1';
  var src = new I16x( [] );
  var del = new U8x( [] );
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new I16x( [] ), undefined, new I16x( [] ) ] );

  test.case = 'src - F32x, delimeter - empty I8x';
  var src = new F32x([ 1, 2, 3 ]);
  var del = new I8x( [] );
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new F32x( [] ), undefined, new F32x([ 1, 2, 3 ]) ] );

  test.case = 'src - F64x, delimeter - empty U32x, times > 1';
  var src = new F64x([ 1, 2, 3 ]);
  var del = new F32x( [] );
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new F64x( [] ), undefined, new F64x([ 1, 2, 3 ]) ] );

  test.case = 'src - I16x, delimeter - I8x, not entry';
  var src = new I16x([ 1, 2, 3 ]);
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new I16x( [] ), undefined, new I16x([ 1, 2, 3 ]) ] );

  test.case = 'src - U8x, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]);
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 0, 1, 2, 3 ]) ] );

  test.case = 'src - U8x, delimeter - string-space, entry';
  var src = new U8x([ 1, 0, 32, 0, 3 ]);
  var del = ' ';
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new U8x([ 1, 0 ]), new U8x([ 32 ]), new U8x([ 0, 3 ]) ] );

  test.case = 'src - U16x, delimeter - U8x, entry, times > 1, times > entry';
  var src = new U16x([ 1, 2, 3 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new U16x( [] ), undefined, new U16x([ 1, 2, 3 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new I16x([ 1, 2, 3 ]), new I16x([ 2 ]), new I16x([ 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new I16x([ 1 ]), new I16x([ 2 ]), new I16x([ 3, 2, 4 ]) ] );

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new I16x([ 1, 2, 3, 2, 4 ]);
  var del = new U8x([ 2, 0 ]);
  var got = _.bufferIsolateRightOrAll( src, del, 3 );
  test.identical( got, [ new I16x( [] ), undefined, new I16x([ 1, 2, 3, 2, 4 ]) ] );

  test.close( 'different types of src and delimeter' );

  /* - */

  test.case = 'call with options map';

  test.case = 'src - I16x, delimeter - U8x, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 32, 2, 4 ]);
  var got = _.bufferIsolateRightOrAll({ src });
  test.identical( got, [ new U8x([ 1, 2 ]), new U8x([ 32 ]), new U8x([ 2, 4 ]) ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll( new U8x( 3 ), new U16x( 1 ), 1, 2 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll( [ 'wrong' ], new U8x([ 32 ]) ) );

  test.case = 'wrong type of delimeter';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll( new U8x([ 32 ]), [ 'wrong' ] ) );

  test.case = 'wrong type of map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll( new U8x() ) );

  test.case = 'unknown options in map o';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll({ src : new U8x(), unknown : 1, times : 1 }) );

  test.case = 'option left in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll({ src : new U8x(), left : 1, times : 1 }) );

  test.case = 'option none in options map';
  test.shouldThrowErrorSync( () => _.bufferIsolateRightOrAll({ src : new U8x(), none : 1, times : 1 }) );
}

//

function bufferIsolateRightOrAllWithBufferRaw( test )
{
  var bufferRaw = ( src ) => new U8x( src ).buffer;
  var bufferView = ( src ) => new BufferView( new U8x( src ).buffer );

  /* - */

  test.open( 'src - bufferRaw, delimeter - bufferRaw' );
  testRun( bufferRaw );
  test.close( 'src - bufferRaw, delimeter - bufferRaw' );

  /* - */

  test.open( 'src - bufferView, delimeter - bufferView' );
  testRun( bufferView );
  test.close( 'src - bufferView, delimeter - bufferView' );

  /* - */

  function testRun( makeBuffer)
  {
    test.case = 'empty src, empty delimeter';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'empty src, empty delimeter, times > 1';
    var src = makeBuffer( [] );
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer( [] ) ] );

    test.case = 'filled src, empty delimeter';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, empty delimeter, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer( [] );
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, not entry, times > 1';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 8 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3 ]) ] );

    test.case = 'filled src, delimeter, entry, times > 1, times > entry';
    var src = makeBuffer([ 1, 2, 3 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3 ]) ] );

    test.case = 'filled src, delimeter, few entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del );
    test.identical( got, [ makeBuffer([ 1, 2, 3 ]), makeBuffer([ 2 ]), makeBuffer([ 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times === entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 2 );
    test.identical( got, [ makeBuffer([ 1 ]), makeBuffer([ 2 ]), makeBuffer([ 3, 2, 4 ]) ] );

    test.case = 'filled src, delimeter, few entries, times > 1, times > entries';
    var src = makeBuffer([ 1, 2, 3, 2, 4 ]);
    var del = makeBuffer([ 2 ]);
    var got = _.bufferIsolateRightOrAll( src, del, 3 );
    test.identical( got, [ makeBuffer( [] ), undefined, makeBuffer([ 1, 2, 3, 2, 4 ]) ] );
  }

  /* */

  test.open( 'different types of src and delimeter' );

  test.case = 'src - empty BufferRaw, delimeter - empty line';
  var src = new BufferRaw( 0 );
  var del = '';
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new BufferRaw( 0 ) ] );

  test.case = 'src - empty BufferView, delimeter - empty U8x, times > 1';
  var src = new BufferView( new BufferRaw( 0 ) );
  var del = new U8x( [] );
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new BufferRaw( 0 ) ) ] );

  test.case = 'src - BufferRaw, delimeter - empty I8x';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x( [] );
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - empty U32x, times > 1';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new F32x( [] );
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) ] );

  test.case = 'src - BufferRaw, delimeter - I8x, not entry';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var del = new I8x([ 8, 0 ]);
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - U16x, not entry, times > 1';
  var src = new U8x([ 0, 1, 2, 3 ]).buffer;
  var del = new U16x([ 8 ]);
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new BufferRaw( 0 ), undefined, new U8x([ 0, 1, 2, 3 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - string-space, entry';
  var src = new BufferView( new U8x([ 1, 0, 32, 0, 3 ]).buffer );
  var del = ' ';
  var got = _.bufferIsolateRightOrAll( src, del );
  var buffer1 = new U8x([ 1, 0 ]).buffer;
  var buffer2 = new U8x([ 32 ]).buffer;
  var buffer3 = new U8x([ 0, 3 ]).buffer;
  test.identical( got, [ new BufferView( buffer1 ), new BufferView( buffer2 ), new BufferView( buffer3 ) ] );

  test.case = 'src - BufferView, delimeter - U8x, entry, times > 1, times > entry';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateRightOrAll( src, del );
  test.identical( got, [ new U8x([ 1, 2, 3 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 4 ]).buffer ] );

  test.case = 'src - BufferRaw, delimeter - BufferView, few entries, times > 1, times === entries';
  var src = new U8x([ 1, 2, 3, 2, 4 ]).buffer;
  var del = new BufferView( new U8x([ 2 ]).buffer );
  var got = _.bufferIsolateRightOrAll( src, del, 2 );
  test.identical( got, [ new U8x([ 1 ]).buffer, new U8x([ 2 ]).buffer, new U8x([ 3, 2, 4 ]).buffer ] );

  test.case = 'src - BufferView, delimeter - U8x, few entries, times > 1, times > entries';
  var src = new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer );
  var del = new U8x([ 2 ]);
  var got = _.bufferIsolateRightOrAll( src, del, 3 );
  test.identical( got, [ new BufferView( new BufferRaw( 0 ) ), undefined, new BufferView( new U8x([ 1, 2, 3, 2, 4 ]).buffer ) ] );

  test.close( 'different types of src and delimeter' );
}

//

function bufferIsolateRightOrAllWithStrings( test )
{
  test.open( 'src - string, delimeter - string' );

  test.case = 'src - empty string, delimeter - empty string';
  var got = _.bufferIsolateRightOrAll( '', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateRightOrAll( '', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty string';
  var got = _.bufferIsolateRightOrAll( 'a b c', '' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - empty string, times > 1';
  var got = _.bufferIsolateRightOrAll( 'a b c', '', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, not entry';
  var got = _.bufferIsolateRightOrAll( 'a b c', 'd' );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, not entry, times > 1';
  var got = _.bufferIsolateRightOrAll( 'a b c', 'd', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry';
  var got = _.bufferIsolateRightOrAll( 'a b c', 'b' );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, entry, times > 1';
  var got = _.bufferIsolateRightOrAll( 'a b c', 'b', 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries';
  var got = _.bufferIsolateRightOrAll( 'a b c', ' ' );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrAll( 'a b c', ' ', 2 );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - string, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrAll( 'a b c', ' ', 3 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.close( 'src - string, delimeter - string' );

  /* - */

  test.open( 'src - string, delimeter - buffer' );

  test.case = 'src - empty string, delimeter - empty I8x';
  var got = _.bufferIsolateRightOrAll( '', new I8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - empty string, delimeter - empty F32x, times > 1';
  var got = _.bufferIsolateRightOrAll( '', new F32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x( [] ) ] );

  test.case = 'src - filled string, delimeter - empty U8x';
  var got = _.bufferIsolateRightOrAll( 'a b c', new U8x( [] ) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - empty U32x, times > 1';
  var got = _.bufferIsolateRightOrAll( 'a b c', new U32x( [] ), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, not entry';
  var got = _.bufferIsolateRightOrAll( 'a b c', new I8x([ 106 ]) );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U16x, not entry, times > 1';
  var got = _.bufferIsolateRightOrAll( 'a b c', new U16x([ 106 ]), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry';
  var got = _.bufferIsolateRightOrAll( 'a b c', new U8x([ 98 ]) );
  test.identical( got, [ new U8x([ 97, 32 ]), new U8x([ 98 ]), new U8x([ 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - U8x, entry, times > 1';
  var got = _.bufferIsolateRightOrAll( 'a b c', new U8x([ 98 ]), 2 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries';
  var got = _.bufferIsolateRightOrAll( 'a b c', new I8x([ 32 ]) );
  test.identical( got, [ new U8x([ 97, 32, 98 ]), new U8x([ 32 ]), new U8x([ 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrAll( 'a b c', new I8x([ 32 ]), 2 );
  test.identical( got, [ new U8x([ 97 ]), new U8x([ 32 ]), new U8x([ 98, 32, 99 ]) ] );

  test.case = 'src - filled string, delimeter - I8x, few entries, times > 1, times === entries';
  var got = _.bufferIsolateRightOrAll( 'a b c', new I8x([ 32 ]), 3 );
  test.identical( got, [ new U8x( [] ), undefined, new U8x([ 97, 32, 98, 32, 99 ]) ] );

  test.close( 'src - string, delimeter - buffer' );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Buffer',
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
    constructorIsBuffer,

    // buffer, l0/l8

    bufferMakeWithArrayAndUnroll,
    bufferMakeWithArgumentsArray,
    bufferMakeWithBuffers,
    bufferMakeWithArrayAndUnrollLongDescriptor,
    bufferMakeWithArgumentsArrayLongDescriptor,
    bufferMakeWithBuffersLongDescriptor,

    bufferMakeUndefinedWithArrayAndUnroll,
    bufferMakeUndefinedWithArgumentsArray,
    bufferMakeUndefinedWithBuffers,
    bufferMakeUndefinedWithArrayAndUnrollLongDescriptor,
    bufferMakeUndefinedWithArgumentsArrayLongDescriptor,
    bufferMakeUndefinedWithBuffersLongDescriptor,

    bufferFrom,
    bufferRawFromTyped,
    bufferRawFrom,
    bufferBytesFrom,
    bufferNodeFrom,

    // bufferBut,
    // bufferButInplace,
    bufferBut_DstIsArrayUnroll,
    bufferBut_DstIsBufferTyped,
    bufferBut_DstIsBufferRaw,
    bufferBut_CheckReturnedContainer,
    // bufferOnly,
    // bufferOnlyInplace,
    bufferOnly_DstIsArrayUnroll,
    bufferOnly_DstIsBufferTyped,
    bufferOnly_DstIsBufferRaw,
    bufferOnly_CheckReturnedContainer,
    // bufferGrow,
    // bufferGrowInplace,
    bufferGrow_,
    bufferGrow_CheckReturnedContainer,
    // bufferRelength,
    // bufferRelengthInplace,
    bufferRelength_DstIsArrayUnroll,
    bufferRelength_DstIsBufferTyped,
    bufferRelength_DstIsBufferRaw,
    bufferRelength_CheckReturnedContainer,

    bufferRelen,
    // bufferResize,
    // bufferResizeInplace,
    bufferResize_,

    //

    bufferReusingButDstIsArrayUnroll,
    bufferReusingButDstIsBufferTyped,
    bufferReusingButDstIsBufferRaw,
    bufferReusingButWithOptionOffsetting,
    bufferReusingButWithOptionShrinkFactor,
    bufferReusingButWithOptionGrowFactor,
    bufferReusingButWithOptionMinSize,

    bufferReusingOnlyDstIsArrayUnroll,
    bufferReusingOnlyDstIsBufferTyped,
    bufferReusingOnlyDstIsBufferRaw,
    bufferReusingOnlyWithOptionOffsetting,
    bufferReusingOnlyWithOptionShrinkFactor,
    bufferReusingOnlyWithOptionMinSize,

    bufferReusingGrowDstIsArrayUnroll,
    bufferReusingGrowDstIsBufferTyped,
    bufferReusingGrowDstIsBufferRaw,
    bufferReusingGrowWithOptionOffsetting,
    bufferReusingGrowWithOptionGrowFactor,
    bufferReusingGrowWithOptionMinSize,

    bufferReusingRelengthDstIsArrayUnroll,
    bufferReusingRelengthDstIsBufferTyped,
    bufferReusingRelengthDstIsBufferRaw,
    bufferReusingRelengthWithOptionOffsetting,
    bufferReusingRelengthWithOptionShrinkFactor,
    bufferReusingRelengthWithOptionGrowFactor,
    bufferReusingRelengthWithOptionMinSize,

    bufferReusingResize,
    bufferReusingResizeDstIsBufferTyped,
    bufferReusingResizeWithOptionOffsetting,
    bufferReusingResizeWithOptionShrinkFactor,
    bufferReusingResizeWithOptionGrowFactor,
    bufferReusingResizeWithOptionMinSize,

    //

    bufferBytesGet,
    bufferRetype,
    bufferRetypeWithOffset,

    bufferJoin,
    bufferMove,
    bufferMoveWithSingleArgument,
    bufferLeft,
    bufferRight,

    // buffer isolate

    bufferIsolateWithBufferTyped,
    bufferIsolateWithBufferRaw,
    bufferIsolateWithStrings,
    bufferIsolateCallWithMap,

    bufferIsolateLeftOrNoneWithBufferTyped,
    bufferIsolateLeftOrNoneWithBufferRaw,
    bufferIsolateLeftOrNoneWithStrings,

    bufferIsolateLeftOrAllWithBufferTyped,
    bufferIsolateLeftOrAllWithBufferRaw,
    bufferIsolateLeftOrAllWithStrings,

    bufferIsolateRightOrNoneWithBufferTyped,
    bufferIsolateRightOrNoneWithBufferRaw,
    bufferIsolateRightOrNoneWithStrings,

    bufferIsolateRightOrAllWithBufferTyped,
    bufferIsolateRightOrAllWithBufferRaw,
    bufferIsolateRightOrAllWithStrings,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
