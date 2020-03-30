( function _Buffer_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

var _ = _global_.wTools;

// --
// buffer
// --

function bufferRawIs( test )
{
  test.case = 'array buffer';
  var src = new BufferRaw( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, true );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  test.case = 'shared array buffer';
  var src = new SharedArrayBuffer( [ 1, 2 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, true );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

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
  var src = BufferNode.alloc( 10 );
  var got = _.bufferRawIs( src );
  test.identical( got, false );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferRawIs( src );
  test.identical( got, false );
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
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  var src = new U8ClampedX( 10*10*4 );
  var got = _.bufferTypedIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

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
  var src = BufferNode.alloc( 10 );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferTypedIs( src );
  test.identical( got, false );
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
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );

  test.case = 'view buffer, SharedArrayBuffer';
  var src = new BufferView( new SharedArrayBuffer( [ 10 ] ) );
  var got = _.bufferViewIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferNodeIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );

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
    var src = BufferNode.alloc( 10 );
    var got = _.bufferViewIs( src );
    test.identical( got, false );

    var src = BufferNode.from( [ 2, 4 ] );
    var got = _.bufferViewIs( src );
    test.identical( got, false );
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
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

  var src = BufferNode.from( [ 2, 4 ] );
  var got = _.bufferNodeIs( src );
  test.identical( got, true );
  test.isNot( _.bufferRawIs( src ) );
  test.isNot( _.bufferTypedIs( src ) );
  test.isNot( _.bufferViewIs( src ) );

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
  var got = _.bufferAnyIs( Symbol() );
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
    var src = new BufferNode.alloc( 5 );
    var got = _.bufferAnyIs( src );
    var expected = true;
    test.identical( got, expected );

    test.case = 'check BufferNode instance';
    var src = new BufferNode.allocUnsafe( 5 );
    var got = _.bufferAnyIs( src );
    var expected = true;
    test.identical( got, expected );

    test.case = 'check BufferNode from string';
    var src = new BufferNode.from( 'str' );
    var got = _.bufferAnyIs( src );
    var expected = true;
    test.identical( got, expected );
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
  var got = _.bufferBytesIs( Symbol() );
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
    var src = new BufferNode.alloc( 5 );
    var got = _.bufferBytesIs( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'check BufferNode instance';
    var src = new BufferNode.allocUnsafe( 5 );
    var got = _.bufferBytesIs( src );
    var expected = false;
    test.identical( got, expected );

    test.case = 'check BufferNode from string';
    var src = new BufferNode.from( 'str' );
    var got = _.bufferBytesIs( src );
    var expected = false;
    test.identical( got, expected );
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
  var got = _.constructorIsBuffer( Symbol() );
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

  if (Config.interpreter === 'njs')
  {
    test.case = 'check BufferNode constructor';
    var got = _.constructorIsBuffer( BufferNode );
    var expected = false;
    test.identical( got, expected );

    test.case = 'check empty BufferNode instance';
    var got = _.constructorIsBuffer( BufferNode.alloc( 3 ) );
    var expected = false;
    test.identical( got, expected );
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
  var array = ( src ) => _.arrayMake( src );
  var unroll = ( src ) => _.unrollMake( src );

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
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, null );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, undefined );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src );
    var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );
  }

  test.case = 'src - null';
  var got = _.bufferMake( null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, new U8x( 5 ) );
  var expected = _.longDescriptor.make( [ 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _.longDescriptor.make( 5 );
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
  test.is( got !== ins );

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
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMake( src );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - null';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMake( src, null );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - undefined';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMake( src, undefined );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - number';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMake( src, 2 );
  var expected = _.longDescriptor.make( 2 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - empty array';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMake( src, [] );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - array';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMake( src, [ 1, 2, 3 ] );
  var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, not ins';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.bufferMake( src );
  var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, ins - number, ins < src.length';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.bufferMake( src, 2 );
  var expected = _.longDescriptor.make( [ 1, 2 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, ins - number, ins > src.length';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.bufferMake( src, 4 );
  var expected = _.longDescriptor.make( [ 1, 2, 3, undefined ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, ins - array, ins.length > src.length';
  var src = _.argumentsArrayMake( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMake( src, ins );
  var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got !== ins );
  test.is( got !== src );

  /* */

  test.case = 'src - null';
  var got = _.bufferMake( null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, _.argumentsArrayMake( 5 ) );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMake( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = _.argumentsArrayMake( [ 1, 2, 3 ] )
  var got = _.bufferMake( F32x, ins );
  var expected = new F32x( [ 1, 2, 3 ] );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMake( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = _.argumentsArrayMake( [ 1, 1, 1, 1, 1 ] );
  var got = _.bufferMake( Array, ins );
  var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
  test.identical( got, expected );
  test.is( got !== ins );
}

//

function bufferMakeWithBuffers( test )
{
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.numberIs( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
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
    debugger;
    var got = _.bufferMake( src );
    debugger;
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor );
    debugger;

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, null );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, undefined );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src );
    var expected = _.longDescriptor.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );
    test.is( got instanceof makeBuffer.constructor )
  }

  test.case = 'src - null';
  var got = _.bufferMake( null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMake( null, undefined );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMake( null, 5 );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMake( null, new U8x( 5 ) );
  var expected = _.longDescriptor.make( [ 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMake( 5, null );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMake( 5, undefined );
  var expected = _.longDescriptor.make( 5 );
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
  test.is( got !== ins );
}

//

function bufferMakeWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.arrayMake( src );
  var unroll = ( src ) => _.unrollMake( src );

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
    let descriptor = _.withDefaultLong[ name ];

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
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, null );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, undefined );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src );
    var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMake( null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, undefined );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMake( null, 5 );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMake( null, new U8x( 5 ) );
    var expected = descriptor.longDescriptor.make( [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMake( 5, null );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMake( 5, undefined );
    var expected = descriptor.longDescriptor.make( 5 );
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
    test.is( got !== ins );

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
    let descriptor = _.withDefaultLong[ name ];

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
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMake( src );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMake( src, null );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMake( src, undefined );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = descriptor.longDescriptor.make( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMake( src, [] );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMake( src, [ 1, 2, 3 ] );
    var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, not ins';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src );
    var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = descriptor.longDescriptor.make( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 4 );
    var expected = descriptor.longDescriptor.make( [ 1, 2, 3, undefined ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = _.argumentsArrayMake( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( src, ins );
    var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMake( null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, undefined );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMake( null, 5 );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMake( null, _.argumentsArrayMake( 5 ) );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMake( 5, null );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMake( 5, undefined );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMake( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = _.argumentsArrayMake( [ 1, 2, 3 ] )
      var got = descriptor.bufferMake( F32x, ins );
    var expected = new F32x( [ 1, 2, 3 ] );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMake( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = _.argumentsArrayMake( [ 1, 1, 1, 1, 1 ] );
    var got = descriptor.bufferMake( Array, ins );
    var expected = Array.from( [ 1, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== ins );
  }
}

bufferMakeWithArgumentsArrayLongDescriptor.timeOut = 10000;

//

function bufferMakeWithBuffersLongDescriptor( test )
{
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.numberIs( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
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
    let descriptor = _.withDefaultLong[ name ];

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
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, null );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, undefined );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMake( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src );
    var expected = descriptor.longDescriptor.make( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 2 );
    var expected = makeBuffer( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMake( src, 4 );
    var expected = makeBuffer( [ 1, 2, 3, 0 ] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMake( src, ins );
    var expected = makeBuffer( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMake( null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMake( null, undefined );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMake( null, 5 );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMake( null, new U8x( 5 ) );
    var expected = descriptor.longDescriptor.make( [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMake( 5, null );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMake( 5, undefined );
    var expected = descriptor.longDescriptor.make( 5 );
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
    test.is( got !== ins );
  }
}

bufferMakeWithBuffersLongDescriptor.timeOut = 15000;

//

function bufferMakeUndefinedWithArrayAndUnroll( test )
{
  var array = ( src ) => _.arrayMake( src );
  var unroll = ( src ) => _.unrollMake( src );

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
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, null );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, undefined );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src );
    var expected = _.longDescriptor.make( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );
  }

  test.case = 'src - null';
  var got = _.bufferMakeUndefined( null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, new U8x( 5 ) );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _.longDescriptor.make( 5 );
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
  test.is( got !== ins );

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
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMakeUndefined( src );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - null';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMakeUndefined( src, null );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - undefined';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMakeUndefined( src, undefined );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - number';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMakeUndefined( src, 2 );
  var expected = _.longDescriptor.make( 2 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - empty array';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMakeUndefined( src, [] );
  var expected = _.longDescriptor.make( [] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - empty long, ins - array';
  var src = _.argumentsArrayMake( [] );
  var got = _.bufferMakeUndefined( src, [ 1, 2, 3 ] );
  var expected = _.longDescriptor.make( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, not ins';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src );
  var expected = _.longDescriptor.make( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, ins - number, ins < src.length';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src, 2 );
  var expected = _.longDescriptor.make( 2 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, ins - number, ins > src.length';
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.bufferMakeUndefined( src, 4 );
  var expected = _.longDescriptor.make( 4 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'src - filled long, ins - array, ins.length > src.length';
  var src = _.argumentsArrayMake( [ 0, 1 ] );
  var ins = [ 1, 2, 3 ];
  var got = _.bufferMakeUndefined( src, ins );
  var expected = _.longDescriptor.make( 3 );
  test.identical( got, expected );
  test.is( got !== ins );
  test.is( got !== src );

  /* */

  test.case = 'src - null';
  var got = _.bufferMakeUndefined( null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, _.argumentsArrayMake( 5 ) );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - U8x constructor, ins - number';
  var got = _.bufferMakeUndefined( U8x, 5 );
  var expected = new U8x( 5 );
  test.identical( got, expected );

  test.case = 'src - F32x constructor, ins - long';
  var ins = _.argumentsArrayMake( [ 1, 2, 3 ] )
  var got = _.bufferMakeUndefined( F32x, ins );
  var expected = new F32x( 3 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var got = _.bufferMakeUndefined( Array, 5 );
  var expected = new Array( 5 );
  test.identical( got, expected );

  test.case = 'src - Array constructor, ins - number';
  var ins = _.argumentsArrayMake( [ 1, 1, 1, 1, 1 ] );
  var got = _.bufferMakeUndefined( Array, ins );
  var expected = new Array( 5 );
  test.identical( got, expected );
  test.is( got !== ins );
}

//

function bufferMakeUndefinedWithBuffers( test )
{
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.numberIs( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
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
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, null );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, undefined );
    var expected = _.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = _.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src );
    var expected = _.longDescriptor.make( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = _.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = _.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );
  }

  test.case = 'src - null';
  var got = _.bufferMakeUndefined( null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, null );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - null';
  var got = _.bufferMakeUndefined( null, undefined );
  var expected = _.longDescriptor.make( 0 );
  test.identical( got, expected );

  test.case = 'src - null, ins - number';
  var got = _.bufferMakeUndefined( null, 5 );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - null, ins - long';
  var got = _.bufferMakeUndefined( null, new U8x( 5 ) );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  /* */

  test.case = 'src - number, ins - null';
  var got = _.bufferMakeUndefined( 5, null );
  var expected = _.longDescriptor.make( 5 );
  test.identical( got, expected );

  test.case = 'src - number, ins - undefined';
  var got = _.bufferMakeUndefined( 5, undefined );
  var expected = _.longDescriptor.make( 5 );
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
  test.is( got !== ins );
}

//

function bufferMakeUndefinedWithArrayAndUnrollLongDescriptor( test )
{
  var array = ( src ) => _.arrayMake( src );
  var unroll = ( src ) => _.unrollMake( src );

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
    let descriptor = _.withDefaultLong[ name ];

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
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, null );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, undefined );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = descriptor.longDescriptor.make( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMakeUndefined( null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, undefined );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMakeUndefined( null, 5 );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMakeUndefined( null, new U8x( 5 ) );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMakeUndefined( 5, null );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMakeUndefined( 5, undefined );
    var expected = descriptor.longDescriptor.make( 5 );
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
    test.is( got !== ins );

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
    let descriptor = _.withDefaultLong[ name ];

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
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - null';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMakeUndefined( src, null );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - undefined';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMakeUndefined( src, undefined );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - number';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = descriptor.longDescriptor.make( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - empty array';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMakeUndefined( src, [] );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty long, ins - array';
    var src = _.argumentsArrayMake( [] );
    var got = descriptor.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = descriptor.longDescriptor.make( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, not ins';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = descriptor.longDescriptor.make( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins < src.length';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = descriptor.longDescriptor.make( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - number, ins > src.length';
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 4 );
    var expected = descriptor.longDescriptor.make( 4 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled long, ins - array, ins.length > src.length';
    var src = _.argumentsArrayMake( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( src, ins );
    var expected = descriptor.longDescriptor.make( 3 );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMakeUndefined( null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, undefined );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMakeUndefined( null, 5 );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMakeUndefined( null, _.argumentsArrayMake( 5 ) );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMakeUndefined( 5, null );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMakeUndefined( 5, undefined );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - U8x constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( U8x, 5 );
    var expected = new U8x( 5 );
    test.identical( got, expected );

    test.case = 'src - F32x constructor, ins - long';
    var ins = _.argumentsArrayMake( [ 1, 2, 3 ] )
      var got = descriptor.bufferMakeUndefined( F32x, ins );
    var expected = new F32x( 3 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var got = descriptor.bufferMakeUndefined( Array, 5 );
    var expected = new Array( 5 );
    test.identical( got, expected );

    test.case = 'src - Array constructor, ins - number';
    var ins = _.argumentsArrayMake( [ 1, 1, 1, 1, 1 ] );
    var got = descriptor.bufferMakeUndefined( Array, ins );
    var expected = new Array( 5 );
    test.identical( got, expected );
    test.is( got !== ins );
  }
}

bufferMakeUndefinedWithArgumentsArrayLongDescriptor.timeOut = 10000;

//

function bufferMakeUndefinedWithBuffersLongDescriptor( test )
{
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } }[ name ];
  };
  var bufferNode = ( src ) => _.numberIs( src ) ? BufferNode.alloc( src ) : BufferNode.from( src );
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
    let descriptor = _.withDefaultLong[ name ];

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
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - null';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, null );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - undefined';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, undefined );
    var expected = descriptor.longDescriptor.make( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - number';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - empty array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [] );
    var expected = makeBuffer( [] );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - empty buffer, ins - array';
    var src = makeBuffer( [] );
    var got = descriptor.bufferMakeUndefined( src, [ 1, 2, 3 ] );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, not ins';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src );
    var expected = descriptor.longDescriptor.make( 3 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - number, ins < src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 2 );
    var expected = makeBuffer( 2 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - number, ins > src.length';
    var src = makeBuffer( [ 1, 2, 3 ] );
    var got = descriptor.bufferMakeUndefined( src, 4 );
    var expected = makeBuffer( 4 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'src - filled buffer, ins - array, ins.length > src.length';
    var src = makeBuffer( [ 0, 1 ] );
    var ins = [ 1, 2, 3 ];
    var got = descriptor.bufferMakeUndefined( src, ins );
    var expected = makeBuffer( 3 );
    test.identical( got, expected );
    test.is( got !== ins );
    test.is( got !== src );

    /* */

    test.case = 'src - null';
    var got = descriptor.bufferMakeUndefined( null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, null );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - null';
    var got = descriptor.bufferMakeUndefined( null, undefined );
    var expected = descriptor.longDescriptor.make( 0 );
    test.identical( got, expected );

    test.case = 'src - null, ins - number';
    var got = descriptor.bufferMakeUndefined( null, 5 );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - null, ins - long';
    var got = descriptor.bufferMakeUndefined( null, new U8x( 5 ) );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    /* */

    test.case = 'src - number, ins - null';
    var got = descriptor.bufferMakeUndefined( 5, null );
    var expected = descriptor.longDescriptor.make( 5 );
    test.identical( got, expected );

    test.case = 'src - number, ins - undefined';
    var got = descriptor.bufferMakeUndefined( 5, undefined );
    var expected = descriptor.longDescriptor.make( 5 );
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
    test.is( got !== ins );
  }
}

bufferMakeUndefinedWithBuffersLongDescriptor.timeOut = 15000;

//

function bufferFrom( test )
{
  /*src: number, str, array, raw, typed, node */
  /*bufferConstructor: typed, raw, node */

  /* typed buffer */

  test.case = 'src:number, bufferConstructor:typed buffer';
  var src = 1;
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ src ] );
  test.identical( got, expected );

  test.case = 'src:str, bufferConstructor:typed buffer';
  var src = 'abc';
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  test.case = 'src:array, bufferConstructor:typed buffer';
  var src = [ 97, 98, 99 ];
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  test.case = 'src:raw buffer, bufferConstructor:typed buffer';
  var src = new BufferRaw( 3 );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 0, 0, 0 ] );
  test.identical( got, expected );

  test.case = 'src:typed, bufferConstructor:typed buffer';
  var src = new I32x( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
  var expected = new U8x( [ 97, 98, 99 ] );
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'src:node buffer, bufferConstructor:typed buffer';
    var src = BufferNode.from( [ 97, 98, 99 ] );
    var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : U8x });
    var expected = new U8x( [ 97, 98, 99 ] );
    test.identical( got, expected );
  }

  /* raw buffer */

  test.case = 'src:number, bufferConstructor:raw buffer';
  var src = 1;
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x( 1 ).buffer;
  test.identical( got, expected );

  test.case = 'src:str, bufferConstructor:raw buffer';
  var src = 'abc';
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x().buffer;
  test.identical( got, expected );

  test.case = 'src:array, bufferConstructor:raw buffer';
  var src = [ 97, 98, 99 ];
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x().buffer;
  test.identical( got, expected );

  test.case = 'src:raw buffer, bufferConstructor:raw buffer';
  var src = new BufferRaw( 3 );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new U8x( 3 ).buffer;
  test.identical( got, expected );

  test.case = 'src:typed, bufferConstructor:raw buffer';
  var src = new I32x( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
  var expected = new I32x().buffer;
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'src:node buffer, bufferConstructor:raw buffer';
    var src = BufferNode.from( [ 97, 98, 99 ] );
    var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferRaw });
    var expected = new U8x().buffer;
    test.identical( got, expected );
  }

  if( !Config.interpreter === 'njs' )
  return;

  /* node buffer */

  test.case = 'src:number, bufferConstructor:node buffer';
  var src = 1;
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( [ src ] );
  test.identical( got, expected );

  test.case = 'src:str, bufferConstructor:node buffer';
  var src = 'abc';
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:array, bufferConstructor:node buffer';
  var src = [ 97, 98, 99 ];
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:raw buffer, bufferConstructor:node buffer';
  var src = new BufferRaw( 3 );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:typed, bufferConstructor:node buffer';
  var src = new I32x( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = BufferNode.from( src );
  test.identical( got, expected );

  test.case = 'src:node buffer, bufferConstructor:node buffer';
  var src = BufferNode.from( [ 97, 98, 99 ] );
  var got = _.bufferFrom({ /*ttt*/src, bufferConstructor : BufferNode });
  var expected = src;
  test.identical( got, expected );

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
  test.is( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferRawFrom( src );
  var expected = new U8x( src ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 3 );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 12 );
  test.identical( got, expected );
  test.is( got === src );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'empty BufferNode';
    var src = BufferNode.alloc( 10 );
    var got = _.bufferRawFrom( src );
    var expected = new BufferRaw( 10 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'BufferNode from string';
    var src = BufferNode.from( 'str' );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 115, 116, 114 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 0, 3 );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 1, 2, 3 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 3 );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 4, 5 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 2, 2 );
    var got = _.bufferRawFrom( src );
    var expected = new U8x( [ 3, 4 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== expected );
  }

  /* */

  test.case = 'from BufferTyped, not offset';
  var src = new U8x( 3 );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 3 );
  test.identical( got, expected );
  test.is( got === src.buffer );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferRawFrom( src );
  var expected = new F32x( [ 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 1, 0, 2, 0, 3, 0, 4, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferRawFrom( src );
  var expected = new BufferRaw( 10 );
  test.identical( got, expected );
  test.is( got === src.buffer );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new F32x( [ 1 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferRawFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src.buffer );

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
  test.is( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( src );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 12 );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'empty BufferNode';
    var src = BufferNode.alloc( 10 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( 10 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'BufferNode from string';
    var src = BufferNode.from( 'str' );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 115, 116, 114 ] );
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 0, 3 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 3 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 4, 5 ] );
    test.identical( got, expected );
    test.is( got !== expected );

    test.case = 'BufferNode, offset from src, buffer.length < result.length';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
    var src = BufferNode.from( buffer, 2, 2 );
    var got = _.bufferBytesFrom( src );
    var expected = new U8x( [ 3, 4 ] );
    test.identical( got, expected );
    test.is( got !== expected );
  }

  /* */

  test.case = 'from BufferBytes';
  var src = new U8x( 3 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 3 );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'from BufferBytes, not offset';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 0, 0, 64, 64, 0, 0, 128, 64, 0, 0, 160, 64 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 1, 0, 2, 0, 3, 0, 4, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got === src );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( 10 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 0, 0, 128, 63 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferBytesFrom( src );
  var expected = new U8x( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

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
  var expected = new BufferNode( src );
  test.identical( got, expected );
  test.is( got !== src );

  var src = [ 1, 2, 3, 4, '5' ];
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( src );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferRaw, buffer.byteLength = 0';
  var src = new BufferRaw();
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 0 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferRaw';
  var src = new BufferRaw( 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped.buffer';
  var src = new F32x( 3 ).buffer;
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 12 );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'empty BufferNode';
  var src = BufferNode.alloc( 10 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 10 );
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'BufferNode from string';
  var src = BufferNode.from( 'str' );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 115, 116, 114 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  test.case = 'BufferNode, buffer.length < result.length';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 0, 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  test.case = 'BufferNode, offset from src';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 4, 5 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  test.case = 'BufferNode, offset from src, buffer.length < result.length';
  var buffer = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = BufferNode.from( buffer, 2, 2 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 3, 4 ] );
  test.identical( got, expected );
  test.is( got !== expected );

  /* */

  test.case = 'from empty BufferBytes';
  var src = new U8x();
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 0 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferBytes';
  var src = new U8x( 3 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 3 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferBytes, not offset';
  var src = new U8x( [ 1, 2, 3, 4, 5 ] );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 1, 2, 3, 4, 5 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, offset';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new I16x( buffer, 8 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 0, 0, 64, 64, 0, 0, 128, 64, 0, 0, 160, 64 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, not offset, buffer.length < result.length';
  var buffer = new U16x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new F32x( buffer, 0, 2 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 1, 0, 2, 0, 3, 0, 4, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferTyped, offset, buffer.length < result.length';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new U8x( buffer, 4, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from BufferView, not offset';
  var src = new BufferView( new BufferRaw( 10 ) );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( 10 );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, not offset, buffer.length < result.length';
  var buffer = new F32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 0, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 0, 0, 128, 63 ] );
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'from BufferView, offset';
  var buffer = new U32x( [ 1, 2, 3, 4, 5 ] ).buffer;
  var src = new BufferView( buffer, 4, 4 );
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 2, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'from string';
  var src = 'abc';
  var got = _.bufferNodeFrom( src );
  var expected = new BufferNode( [ 97, 98, 99 ] );
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

//

function bufferBut( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut( dst, -5, [ 0 ] );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ -1, -5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferBut( dst, [ 1, 2 ], src );
      var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, 2, [ 5 ] );
    var expected = buf( [ 0, 1, 5, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, -2, [ 5 ] );
    var expected = buf( [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 5, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferBut( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ -1, -5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferBut( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferBut( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 5, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferBut( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferBut( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferBut() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 2 ], [ 1 ], [ 4 ] ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [], [ 2 ] ) );

  test.case = 'wrong value in dst';
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferBut( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferBut( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferButInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferButInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got === dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferButInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ -1, -5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferButInplace( dst, [ 1, 2 ], src );
      var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, 2, [ 5 ] );
    var expected = buf( [ 0, 1, 5, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 5, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ -1, -5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferButInplace( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferButInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 5, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferButInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferButInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferButInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 2 ], [ 1 ], [ 4 ] ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong value in dst';
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferButInplace( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferButInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferBut_( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, val = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut_( dst, -5, [ 0 ] );
  test.identical( got, [ 0, 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, val = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got === dst );

  test.case = 'dst = array, val = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferBut_( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, val = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got === dst );

  test.case = 'dst = unroll, val = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, val = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( dst, -5, [ 2 ] );
  test.identical( got, [ 2, 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [ 2 ] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, val = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferBut_( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 1, 2, 4 ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
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
    var got = _.bufferBut_( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ -1, -5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferBut_( dst, [ 1, 2 ], val );
      var expected = buf( [ 0, 1, 2, 3, 2, 3 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new I32x( 2 );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 0, 0, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, 2, [ 5 ] );
    var expected = buf( [ 0, 1, 5, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, -2, [ 5 ] );
    var expected = buf( [ 5, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 5, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 1, 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    /* */

    test.case = 'dst1, range[ 0 ] > range[ 1 ], val';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 1, 2, 3, 1 ];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst1 = [ { a : 2 }, { b : 3 } ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst1, dst, [ 1, 8 ], [ 1 ] );
    var expected = [ 0, 1 ];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, dst = empty BufferTyped, val';
    var dst1 = new F32x( [ 5 ] );
    var dst = buf( [] );
    var got = _.bufferBut_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = new F32x( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    var dst1 = new BufferRaw( 1 );
    var dst = buf( [] );
    var got = _.bufferBut_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = new U8x( [ 2 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst, [ 1, 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferBut_( dst, dst, [ -1, -5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.close( 'inplace' );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    var got = _.bufferBut_( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, [ -1, -5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( 4 );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = unroll';
    var dst = buf( 4 );
    var val = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( 4 );
    var val = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( 4 );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferBut_( dst, [ 1, 2 ], val );
      var expected = bufferExpected( dst, [ 0, 1, 2, 3, 0, 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( 4 );
    var val = new I32x( 2 );
    var got = _.bufferBut_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 5, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 5, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 1, 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferBut_( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    /* */

    test.case = 'dst1, range[ 0 ] > range[ 1 ], val';
    var dst1 = [ 1, 2 ];
    var dst = buf( 4 );
    var got = _.bufferBut_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 0, 0, 0, 1 ];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst1 = new BufferRaw( 4 );
    var dst = buf( 4 );
    var got = _.bufferBut_( dst1, dst, [ 1, 8 ], [ 1, 2, 3 ] );
    var expected = new U8x( [ 0, 1, 2, 3 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, dst = empty BufferTyped, val';
    var dst1 = new U8x( [ 5 ] );
    var dst = buf( [] );
    var got = _.bufferBut_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = new U8x( [ 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] === range[ 1 ]';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, dst, [ 1, 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range[ 0 ] < 0, range[ 1 ] < 0';
    var dst = buf( 4 );
    var got = _.bufferBut_( dst, dst, [ -1, -5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.close( 'inplace' );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferBut_() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, [ 1, 2 ], [ 1 ], [ 4 ] ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, [], [ 2 ] ) );

  test.case = 'wrong value in dst';
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferBut_( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferBut_( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferSelect( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelect( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelect( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* - */

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 2 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelect( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelect( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferSelect( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, 2, [ 5 ] );
    var expected = buf( [ 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelect( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelect( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferSelect( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelect( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelect( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferSelect() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [], [ 2 ] ) );

  test.case = 'wrong value in src';
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferSelect( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferSelect( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferSelectInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelectInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelectInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelectInplace( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* - */

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, 2, [ 5 ] );
    var expected = buf( [ 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelectInplace( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, [ 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferSelectInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferSelectInplace( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferSelectInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferSelectInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong value in src';
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferSelectInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferSelect_( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, val = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelect_( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, val = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferSelect_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, val = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferSelect_( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, val = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect_( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferSelect_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, val = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect_( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, val = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect_( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferSelect_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, val = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferSelect_( dst, [ 1, 3 ], [ 2 ] );
  test.identical( got, [ 2, 3 ] );
  test.is( got !== dst );

  /* - */

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
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
    var got = _.bufferSelect_( dst, [ 1, 2 ] );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferSelect_( dst, [ 1, 2 ], val );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 1, 3 ], val );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 1, 3 ], val );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelect_( dst, [ 1, 3 ], val );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new I32x( 2 );
    var got = _.bufferSelect_( dst, [ 1, 2 ], val );
    var expected = buf( [ 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, 2, [ 5 ] );
    var expected = buf( [ 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 1, 8 ], [ 1 ] );
    var expected = buf( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferSelect_( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferSelect_( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    /* */

    test.case = 'dst1, range[ 0 ] > range[ 1 ], val';
    var dst1 = [ 1, 2, 'str' ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst1 = new I16x( 3 );
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst1, dst, [ 1, 8 ], [ 1 ] );
    var expected = new I16x( [ 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, dst = empty BufferTyped, val';
    var dst1 = new BufferRaw( 0 );
    var dst = buf( [] );
    var got = _.bufferSelect_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = new BufferRaw( 0 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferSelect_( dst, dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferSelect_( dst, dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    test.close( 'inplace' );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    var got = _.bufferSelect_( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( 4 );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferSelect_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, [ 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = unroll';
    var dst = buf( 4 );
    var val = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 1, 3 ], val );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( 4 );
    var val = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferSelect_( dst, [ 1, 3 ], val );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( 4 );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferSelect_( dst, [ 1, 2 ], val );
      var expected = bufferExpected( dst, [ 0 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( 4 );
    var val = new I32x( 2 );
    var got = _.bufferSelect_( dst, [ 1, 3 ], val );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, 2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, [ 1, 8 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferSelect_( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );

    /* */

    test.case = 'dst1, range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst1, dst, [ -5, -2 ], [ 1 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > range[ 1 ], val';
    var dst1 = _.argumentsArrayMake( [] );
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst1 = new BufferView( new BufferRaw( 3 ) );
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst1, dst, [ 1, 8 ], [ 1 ] );
    var expected = new BufferView( new BufferRaw( 3 ) );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, dst = empty BufferTyped, val';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [] );
    var got = _.bufferSelect_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferSelect_( dst, dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.close( 'inplace' );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferSelect_() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, [], [ 2 ] ) );

  test.case = 'wrong value in val';
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, [ 1, 3 ], 'str' ) );
  test.shouldThrowErrorSync( () => _.bufferSelect_( dst, [ 1, 3 ], { a : 1 } ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferSelect_( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferGrow( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 1, 2, 3 ] )
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrow( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 6 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow( dst, [ 1, 3 ], src );
      var expected = buf( [ 0, 1, 2, 3 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferGrow( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, 6, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3, 5, 5 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrow( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 6 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, 4 );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferGrow( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, 6, 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrow( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrow( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferGrow() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrow( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferGrow( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferGrowInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrowInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayFrom( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrowInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ] );
    var expected = buf( [ 0, 1, 2, 3 ] )
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 6 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrowInplace( dst, [ 1, 3 ], src );
      var expected = buf( [ 0, 1, 2, 3 ] );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, 6, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3, 5, 5 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrowInplace( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 6 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrowInplace( dst, [ 1, 2 ], src );
      var expected = bufferExpected( dst, 4 );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferGrowInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, 6, 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferGrowInplace( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferGrowInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferGrowInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferGrowInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferGrow_( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, val = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow_( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, val = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferGrow_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, val = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferGrow_( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, val = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferGrow_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, val = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, val = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, val = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferGrow_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, val = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferGrow_( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
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
    test.is( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferGrow_( dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 5 ], val );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 6 ], val );
    var expected = buf( [ 0, 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow_( dst, [ 1, 3 ], val );
      var expected = buf( [ 0, 1, 2, 3 ] );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new I32x( 2 );
    var got = _.bufferGrow_( dst, [ 1, 5 ], val );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, 6, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3, 5, 5 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 0, 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    /* */

    test.case = 'dst1, range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst1 = new BufferRaw( 4 );
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst1, dst, [ 0, dst.length ], [ 1 ] );
    var expected = new U8x( [ 0, 1, 2, 3 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst1 = new BufferRaw( 3 );
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst1, dst, [ -5, -2 ], [ 1 ] );
    var expected = new U8x( [ 0, 1, 2, 3 ] ).buffer;
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got !== dst1 );

    test.case = 'dst1, range[ 0 ] > range[ 1 ], val';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = [ 0, 1, 2, 3 ];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, val = number';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst1, dst, [ 1, 8 ], 1 );
    var expected = [ 0, 1, 2, 3, 1, 1, 1, 1 ];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ] );
    var expected = buf( [ 0, 1, 2, 3 ] )
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ], val );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow_( dst, dst, [ 1, 3 ], val );
      var expected = buf( [ 0, 1, 2, 3 ] );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.close( 'inplace' );
  }

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.is( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( 4 );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferGrow_( dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = unroll';
    var dst = buf( 4 );
    var val = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 5 ], val );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'val = argumentsArray';
    var dst = buf( 4 );
    var val = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferGrow_( dst, [ 1, 6 ], val );
    var expected = bufferExpected( dst, 6 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( 4 );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow_( dst, [ 1, 2 ], val );
      var expected = bufferExpected( dst, 4 );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( 4 );
    var val = new I32x( 2 );
    var got = _.bufferGrow_( dst, [ 1, 3 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = number, val = number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, 6, 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferGrow_( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );

    /* */

    test.case = 'dst1, range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst1, dst, [ -5, -2 ], [ 1 ] );
    var expected = [ 0, 0, 0, 0 ];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > range[ 1 ], val';
    var dst1 = new BufferView( new U8x( [ 1, 2, 3, 4 ] ).buffer );
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = new BufferView( new BufferRaw( 4 ) );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, val';
    var dst1 = new BufferView( new BufferRaw( 2 ) );
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst1, dst, [ 1, 8 ], 1 );
    var expected = new BufferView( new U8x( [ 0, 0, 0, 0, 1, 1, 1, 1 ] ).buffer );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got !== dst1 );

    test.case = 'dst1, dst = empty BufferTyped, val';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [] );
    var got = _.bufferGrow_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'val = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, val = undefined';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'val = array';
    var dst = buf( 4 );
    var val = new Array( 1, 2, 3 );
    var got = _.bufferGrow_( dst, dst, [ 1, 2 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'val = bufferNode';
      var dst = buf( 4 );
      var val = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferGrow_( dst, dst, [ 1, 2 ], val );
      var expected = bufferExpected( dst, 4 );
      test.identical( got, expected );
      test.is( got === dst );
    }

    test.case = 'val = bufferTyped';
    var dst = buf( 4 );
    var val = new I32x( 2 );
    var got = _.bufferGrow_( dst, dst, [ 1, 3 ], val );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], val = array';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] > range[ 1 ], val';
    var dst = buf( 4 );
    var got = _.bufferGrow_( dst, dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'dst = empty BufferTyped, val';
    var dst = buf( [] );
    var got = _.bufferGrow_( dst, dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );

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

function bufferRelength( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got !== dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got !== dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 3 ] );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelength( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ -1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 6 ], src );
    var expected = buf( [ 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelength( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferRelength( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, number > dst.length';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, 6, [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    var dst = buf( [] );
    var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 1, 3 ] );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelength( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelength( dst, [ 1, 6 ], src );
      var expected = bufferExpected( dst, 5 );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferRelength( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, 6, 1 );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelength( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelength( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRelength() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelength( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferRelength( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferRelengthInplace( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelengthInplace( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelengthInplace( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
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
    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ] );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ -1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
    var expected = buf( [ 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, number > dst.length';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, 6, [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    var dst = buf( [] );
    var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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
    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ] );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelengthInplace( dst, [ 1, 6 ], src );
      var expected = bufferExpected( dst, 5 );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferRelengthInplace( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, 6, 1 );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelengthInplace( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelengthInplace( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace() );

  test.case = 'extra arguments';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [ 1, 2 ], [ 1, 2 ], [ 4 ], 'extra' ) );

  test.case = 'wrong value in range';
  var dst = new I16x( 10 );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, true, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, null, [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, 'str', [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [ 'str', 1 ], [ 2 ] ) );
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( dst, [], [ 2 ] ) );

  test.case = 'wrong type of dst';
  test.shouldThrowErrorSync( () => _.bufferRelengthInplace( 'str', [ 1, 3 ], [ 1 ] ) );

}

//

function bufferRelength_( test )
{
  /* not a buffer, trivial */

  test.case = 'dst = array, src = array, range = negative number';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength_( dst, -5, [ 0 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty array, src = array, range[ 0 ] === range[ 1 ]';
  var dst = [];
  var got = _.bufferRelength_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = array, range[ 1 ] > dst.length, src = array';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.bufferRelength_( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = unroll, src = array, range = negative number';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, -5, [ 2 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.is( got === dst );

  test.case = 'dst = empty unroll, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.unrollFrom( [] );
  var got = _.bufferRelength_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, [] );
  test.is( got === dst );

  test.case = 'dst = unroll, src = array';
  var dst = _.unrollFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got === dst );

  /* */

  test.case = 'dst = argumentsArray, src = array, range = negative number';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, -5, [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [ 1, 2, 3, 4 ] ) );
  test.is( got === dst );

  test.case = 'dst = empty argumentsArray, src = array, range[ 0 ] === range[ 1 ]';
  var dst = _.argumentsArrayFrom( [] );
  var got = _.bufferRelength_( dst, [ 0, 0 ], [ 2 ] );
  test.identical( got, _.argumentsArrayMake( [] ) );
  test.is( got === dst );

  test.case = 'dst = argumentsArray, src = array';
  var dst = _.argumentsArrayFrom( [ 1, 2, 3, 4 ] );
  var got = _.bufferRelength_( dst, [ 1, 5 ], [ 2 ] );
  test.identical( got, [ 2, 3, 4, [ 2 ] ] );
  test.is( got !== dst );

  /* BufferTyped and BufferNode */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src ){ return new buf( src ) } } [ name ];
  };

  var bufferNode = function( src )
  {
    if( _.numberIs( src ) )
    return BufferNode.alloc( src );
    else
    return BufferNode.from( src );
  };

  /* - */

  var list =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
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

    test.case = 'src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 1, 3 ] );
    var expected = buf( [ 1, 2 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelength_( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ -1, 5 ], src );
    var expected = buf( [ 0, 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 1, 6 ], src );
    var expected = buf( [ 1, 2, 3, NaN, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( [ 0, 1, 2, 3 ] );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelength_( dst, [ 1, 3 ], src );
      var expected = buf( [ 1, 2 ] );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var src = new I32x( 2 );
    var got = _.bufferRelength_( dst, [ 1, 5 ], src );
    var expected = buf( [ 1, 2, 3, NaN ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, number > dst.length';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, 6, [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 2, 2 ], [ 5 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ -5, -2 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 4, 1 ], [ 1 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 1, 8 ], 1 );
    var expected = buf( [ 1, 2, 3, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelength_( dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    /* */

    test.case = 'dst1, range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst1, dst, [ -5, -2 ], [ 1 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > range[ 1 ], src';
    var dst1 = new BufferRaw( 10 );
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = new BufferRaw( 0 );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got !== dst1 );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, src = number';
    var dst1 = new BufferView( new U8x( [ 1, 1, 1, 1, 1, 1, 1 ] ). buffer );
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst1, dst, [ 1, 8 ], 1 );
    var expected = new BufferView( new U8x( [ 1, 2, 3, 1, 1, 1, 1 ] ).buffer );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, dst = empty BufferTyped, src';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [] );
    var got = _.bufferRelength_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, dst );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, dst, 0 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, dst, -5 );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = negative number';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, dst, -2, [ 5 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( [ 0, 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, dst, [ 0, dst.length ], [ 1 ] );
    var expected = buf( [ 0, 1, 2, 3 ] );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelength_( dst, dst, [ 0, 0 ], [ 2 ] );
    var expected = buf( [] );
    test.identical( got, expected );
    test.is( got === dst );

    test.close( 'inplace' );
  }

  /* - */

  /* BufferRaw and BufferView */

  var bufferRaw = ( src ) => new BufferRaw( src );
  var bufferView = ( src ) => new BufferView( new BufferRaw( src ) );

  var bufferExpected = function( dst, src )
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

    test.case = 'src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, [ 1, 3 ] );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range = undefined, src = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = array';
    var dst = buf( 4 );
    var src = new Array( 1, 2, 3 );
    var got = _.bufferRelength_( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = unroll';
    var dst = buf( 4 );
    var src = _.unrollMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 1, 5 ], src );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'src = argumentsArray';
    var dst = buf( 4 );
    var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
    var got = _.bufferRelength_( dst, [ 1, 6 ], src );
    var expected = bufferExpected( dst, 5 );
    test.identical( got, expected );
    test.is( got !== dst );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'src = bufferNode';
      var dst = buf( 4 );
      var src = BufferNode.from( [ 1, 2, 3 ] );
      var got = _.bufferRelength_( dst, [ 1, 6 ], src );
      var expected = bufferExpected( dst, 5 );
      test.identical( got, expected );
      test.is( got !== dst );
    }

    test.case = 'src = bufferTyped';
    var dst = buf( 4 );
    var src = new I32x( 2 );
    var got = _.bufferRelength_( dst, [ 1, 3 ], src );
    var expected = bufferExpected( dst, 2 );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = number, src = number';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, 6, 1 );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, -2, [ 5 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] === range[ 1 ], src = array';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, [ 2, 2 ], [ 5 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, [ -5, -2 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > range[ 1 ], src';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, [ 4, 1 ], [ 1 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, [ 1, 8 ], 1 );
    var expected = bufferExpected( dst, [ 0, 0, 0, 1, 1, 1, 1 ] );
    test.identical( got, expected );
    test.is( got !== dst );

    test.case = 'dst = empty BufferTyped, src';
    var dst = buf( [] );
    var got = _.bufferRelength_( dst, [ 0, 0 ], [ 2 ] );
    var expected = bufferExpected( dst, [] );
    test.identical( got, expected );
    test.is( got === dst );

    /* - */

    test.case = 'dst1, range[ 0 ] < 0, range[ 1 ] < 0, src';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst1, dst, [ -5, -2 ], [ 1 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > range[ 1 ], src';
    var dst1 = new U8x();
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst1, dst, [ 4, 1 ], [ 1 ] );
    var expected = new U8x();
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, range[ 0 ] > 0, range[ 1 ] > dst.length, src';
    var dst1 = new BufferView( new U8x( [ 2, 2, 2, 2, 2, 2, 2 ] ).buffer );
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst1, dst, [ 1, 8 ], 1 );
    var expected =new BufferView( new U8x( [ 0, 0, 0, 1, 1, 1, 1 ] ).buffer );
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.case = 'dst1, dst = empty BufferTyped, src';
    var dst1 = [ 1, 2, 3 ];
    var dst = buf( [] );
    var got = _.bufferRelength_( dst1, dst, [ 0, 0 ], [ 2 ] );
    var expected = [];
    test.identical( got, expected );
    test.is( got !== dst );
    test.is( got === dst1 );

    test.close( 'not inplace' );

    /* - */

    test.open( 'inplace' );

    test.case = 'src = undefined, range = undefined';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, dst );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, range = 0';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, dst, 0 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'src = undefined, rang = negative number';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, dst, -5 );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.case = 'range[ 0 ] = 0, range[ 1 ] = dst.length, src';
    var dst = buf( 4 );
    var got = _.bufferRelength_( dst, dst, [ 0, 4 ], [ 1 ] );
    var expected = bufferExpected( dst, 4 );
    test.identical( got, expected );
    test.is( got === dst );

    test.close( 'inplace' );
  }

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

//

function bufferResize( test )
{
  /* raw buffer */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ -3, 11 ] );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize( src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* buffer constructors */

  var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
  var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } } [ name ];
  };

  /* expected result */

  var expect = function( buf, offset, length )
  {
    let buffer = _.bufferRelength( buf.buffer, [ offset, offset + length ] );
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

    // I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    // U16x,
    // I32x,
    // U32x,
    // F32x,
    // F64x,
  ];

  var list =
  [
    bufferView,
  ];
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
    var got = _.bufferResize( src, src.byteLength );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResize( src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize( src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    /* */

    test.case = 'size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize( src, [ 0, src.byteLength ] );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize( src, [ -8, 8 ] );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize( src, [ -8, 24 ] );
    var expected = expect( src, 8, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var got = _.bufferResize( src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
    var expected = buf( expectedBuf );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferResize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferResize( new BufferRaw( 5 ), 1 , 2 ) );

  test.case = 'not a buffer';
  test.shouldThrowErrorSync( () => _.bufferResize( [ 1, 2 ], 1 ) );

  test.case = 'not a range';
  test.shouldThrowErrorSync( () => _.bufferResize( new Fx(), 'not a range' ) );
  test.shouldThrowErrorSync( () => _.bufferResize( new U8x( 1 ), [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.bufferResize( new I16x( 2 ), undefined ) );
}

//

function bufferResizeInplace( test )
{
  /* raw buffer */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got === src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got === src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ -3, 11 ] );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResizeInplace( src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( _.bufferRawIs( got ) );

  /* buffer constructors */

  var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
  var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } } [ name ];
  };

  /* expected result */

  var expect = function( buf, offset, length )
  {
    let buffer = _.bufferRelength( buf.buffer, [ offset, offset + length ] );
    if( _.bufferViewIs( buf ) )
    return bufferView( buffer );
    else
    return new buf.constructor( buffer );
  }

  /* tests */

  var typedList =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
    F32x,
    F64x,
  ];

  var list =
  [
    bufferView,
  ];
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
    var got = _.bufferResizeInplace( src, src.byteLength );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got === src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResizeInplace( src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResizeInplace( src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    /* */

    test.case = 'size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResizeInplace( src, [ 0, src.byteLength ] );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got === src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResizeInplace( src, [ -8, 8 ] );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResizeInplace( src, [ -8, 24 ] );
    var expected = expect( src, 8, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );

    test.case = 'size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var got = _.bufferResizeInplace( src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
    var expected = buf( expectedBuf );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( src.constructor.name === got.constructor.name );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferResizeInplace() );

  test.case = 'extra arguments';
  var buffer = new BufferRaw( 5 );
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( buffer, 1 , 2 ) );

  test.case = 'not a buffer';
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( [ 1, 2 ], 1 ) );

  test.case = 'not a range';
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( new Fx(), 'not a range' ) );
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( new U8x( 1 ), [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.bufferResizeInplace( new I16x( 2 ), undefined ) );
}

//

function bufferResize_( test )
{
  /* raw buffer, two arguments */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got === src );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ -3, 11 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  /* raw buffer, dst - null */

  test.case = 'size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, 5 );
  var expected = new U8x( [ 1, 2, 3, 4, 5 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, 15 );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  /* */

  test.case = 'size = range, new offset = buffer offset, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ 0, src.byteLength ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ -3, 11 ] );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  test.case = 'size = range, new offset > buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( null, src, [ 5, 12 ] );
  var expected = new U8x( [ 6, 7, 8, 9, 10, 0, 0 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );

  /* raw buffer, dst - buffer */

  test.case = 'dst, size = number, new size = buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new BufferRaw( 10 );
  var got = _.bufferResize_( dst, src, src.byteLength );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got !== src );
  test.is( got === dst );

  test.case = 'dst, size = number, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new BufferView( new BufferRaw( 9 ) );
  var got = _.bufferResize_( dst, src, 5 );
  var expected = new BufferView( new U8x( [ 1, 2, 3, 4, 5, 0, 0, 0, 0 ] ).buffer );
  test.identical( got, expected );
  test.is( got !== src );
  test.is( got === dst );

  test.case = 'dst, size = number, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new F32x( [ 1, 2, 3, 4 ] );
  var got = _.bufferResize_( dst, src, 15 );
  var expected = new F32x( new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0 ] ).buffer );
  test.identical( got, expected );
  test.is( got !== src );
  test.is( got === dst );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'dst, size = range, new offset = buffer offset, new size = buffer size';
    var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
    var dst = BufferNode.alloc( 10 );
    var got = _.bufferResize_( dst, src, [ 0, src.byteLength ] );
    var expected = BufferNode.from( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got === dst );
  }

  test.case = 'dst, size = range, new offset = 0, new size < buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new U8x( 0 );
  var got = _.bufferResize_( dst, src, [ 0, 8 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8 ] );
  test.identical( got, expected );
  test.is( got !== src );
  test.is( got !== dst );

  test.case = 'dst, size = range, new offset < buffer offset, new size > buffer size';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var dst = new I16x( 7 );
  var got = _.bufferResize_( dst, src, [ -3, 11 ] );
  var expected = new I16x( new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 0, 0, 0 ] ).buffer );
  test.identical( got, expected );
  test.is( got !== src );
  test.is( got === dst );

  /* */

  test.case = 'dst === src, size = src.byteLength';
  var src = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  var got = _.bufferResize_( src, src, [ 0, 10 ] );
  var expected = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ).buffer;
  test.identical( got, expected );
  test.is( got === src );

  /* buffer constructors */

  var bufferNode = ( buf, offset, length ) => BufferNode.from( buf, offset, length );
  var bufferView = ( buf, offset, length ) => new BufferView( buf, offset, length );
  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } } [ name ];
  };

  /* expected result */

  var expect = function( buf, offset, length )
  {
    let buffer = _.bufferRelength( buf.buffer, [ offset, offset + length ] );
    if( _.bufferViewIs( buf ) )
    return bufferView( buffer );
    else
    return new buf.constructor( buffer );
  }

  /* tests */

  var typedList =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
    F32x,
    F64x,
  ];

  var list =
  [
    bufferView,
  ];
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
    test.is( got === src );

    test.case = 'size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResize_( src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.is( got !== src );

    /* */

    test.case = 'size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize_( src, [ 0, src.byteLength ] );
    var expected = expect( src, 8, src.byteLength );
    test.identical( got, expected );
    test.is( got === src );

    test.case = 'size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize_( src, [ -8, 8 ] );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'size = range, new offset < buffer offset, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( src, [ -8, 24 ] );
    var expected = expect( src, 8, 32 );
    test.identical( got, expected );
    test.is( got !== src );

    test.case = 'size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var got = _.bufferResize_( src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0 ] ).buffer;
    var expected = buf( expectedBuf );
    test.identical( got, expected );
    test.is( got !== src );

    /* dst - null */

    test.case = 'dst, size = number, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var got = _.bufferResize_( null, src, src.byteLength );
    var expected = buf( filledBuf, 8, 2 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got !== dst );

    test.case = 'dst, size = number, new size < buffer size';
    var src = buf( filledBuf, 0, 3 );
    var got = _.bufferResize_( null, src, 16 );
    var expected = expect( src, 0, 16 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got !== dst );

    test.case = 'dst, size = number, new size > buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( null, src, 32 );
    var expected = expect( src, 16, 32 );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got !== dst );

    /* */

    test.case = 'dst, size = range, new offset = buffer offset, new size = buffer size';
    var src = buf( filledBuf, 8, 2 );
    var dst = new U8x( 16 );
    var got = _.bufferResize_( dst, src, [ 0, src.byteLength ] );
    test.identical( got[ 0 ], 9 );
    test.is( got !== src );
    test.is( got === dst );

    test.case = 'dst, size = range, new offset = 0, new size < buffer size';
    var src = buf( filledBuf, 8, 2 );
    var dst = new I8x( 16 );
    var got = _.bufferResize_( dst, src, [ -8, 8 ] );
    test.identical( got[ 0 ], 1 );
    test.is( got !== src );
    test.is( got === dst );

    test.case = 'dst, size = range, new offset < buffer offset, new size > buffer size';
    var src1 = buf( filledBuf, 16, 1 );
    var dst1 = new BufferRaw( 0 );
    var got1 = _.bufferResize_( dst1, src1, [ -8, 24 ] );
    var expected1 = new U8x( [ 9, 10, 1, 2, 3, 4, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
    test.identical( got1, expected1.buffer );
    test.is( got1 !== src1 );
    test.is( got1 !== dst1 );

    test.case = 'dst, size = range, new offset > buffer offset, new size > buffer size';
    var src = buf( filledBuf, 8, 1 );
    var dst = new BufferView( new BufferRaw( 0 ) );
    var got = _.bufferResize_( dst, src, [ -16, 0 ] );
    var expectedBuf = new U8x( [ 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0 ] ).buffer;
    var expected = new BufferView( expectedBuf );
    test.identical( got, expected );
    test.is( got !== src );
    test.is( got !== dst );

    /* */

    test.case = 'size = range, new offset = 0, new size = buffer size';
    var src = buf( filledBuf, 16, 1 );
    var got = _.bufferResize_( src, src, [ 0, src.byteLength ] );
    test.identical( got, src );
    test.is( got === src );
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

function bufferRetype( test )
{

  test.case = 'converts and returns the new type of I16x';
  var view1 = new I8x( [ 1, 2, 3, 4, 5, 6 ] );
  var got = _.bufferRetype(view1, I16x);
  var expected = got; // [ 513, 1027, 1541 ];
  test.identical( got, expected );

  test.case = 'converts and returns the new type of I8x';
  var view1 = new I16x( [ 513, 1027, 1541 ] );
  var got = _.bufferRetype(view1, I8x);
  var expected = got; // [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRetype();
  });

  test.case = 'arguments are wrong';
  test.shouldThrowErrorSync( function()
  {
    _.bufferRetype( 'wrong argument', 'wrong argument' );
  });

};

//

function bufferJoin( test )
{
  /* constructors */

  var bufferTyped = function( buf )
  {
    let name = buf.name;
    return { [ name ] : function( src, offset, length ){ return new buf( src, offset, length ) } } [ name ];
  };
  var typedList =
  [
    I8x,
    // U8x,
    // U8ClampedX,
    // I16x,
    U16x,
    // I32x,
    // U32x,
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
      var got = _.bufferJoin( bufferTyped, bufferView, bufferNode, bufferRaw );
      var expected = expectTypedBuffer2;
      test.identical( got, expected );

      test.case = 'first - BufferView, BufferNode';
      var got = _.bufferJoin( bufferView, bufferTyped, bufferNode, bufferRaw );
      var expected = new BufferView( expectTypedBuffer2.buffer );
      test.identical( got, expected );

      test.case = 'first - BufferRaw, BufferNode';
      var got = _.bufferJoin( bufferRaw, bufferTyped, bufferNode, bufferView );
      var expected = expectTypedBuffer2.buffer;
      test.identical( got, expected );

      test.case = 'first - BufferNode';
      var got = _.bufferJoin( bufferNode, bufferTyped, bufferView, bufferRaw );
      var expected = BufferNode.from( expectTypedBuffer2.buffer );
      test.identical( got, expected );

      test.case = 'first - BufferNode, u8x, nulls';
      var got = _.bufferJoin( bufferNode, null, bufferTyped, u8x, bufferView, bufferRaw, null );
      var expected = BufferNode.from( _.bufferJoin( bufferNode, bufferTyped, u8x, bufferView, bufferRaw ).buffer );
      test.identical( got, expected );
    }
  }

  /* - */

  test.case = 'without arguments';
  var got = _.bufferJoin();
  test.identical( got, null );

  test.case = 'one arguments, BufferRaw';
  var src = new BufferRaw( 5 );
  var got = _.bufferJoin( src );
  test.is( got === src );
  test.identical( got, src );

  test.case = 'one arguments, BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.bufferJoin( src );
  test.is( got === src );
  test.identical( got, src );

  test.case = 'one arguments, BufferView';
  var src = new BufferView( new U8x( [ 1, 2 ] ).buffer );
  var got = _.bufferJoin( src );
  test.is( got === src );
  test.identical( got, src );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'one arguments, BufferTyped';
    var src = BufferNode.from( [ 1, 2 ] );
    var got = _.bufferJoin( src );
    test.is( got === src );
    test.identical( got, src );
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
  test.is( got === dst );

  test.case = 'from src - array';
  var dst = [ 1, 2, 3 ];
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = [ 4, 5, 6 ];
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - unroll';
  var dst = [ 1, 2, 3 ];
  var src = _.unrollMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  test.is( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = [ 1 ];
  var src = _.argumentsArrayMake( [ 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = [ 3 ];
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - U8x';
  var dst = [ 0, 2, 3 ];
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - F32x';
  var dst = [ 0, 2, 3 ];
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - I64x';
  var dst = [ 0, 2, 3 ];
  var src = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( dst, src );
  var expected = [ 1, 2, 3 ];
  test.identical( got, expected );
  test.is( got === dst );

  test.close( 'to dst - array' );

  /**/

  test.open( 'to dst - unroll' );

  test.case = 'from src - array';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = _.unrollMake( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - empty unroll';
  var dst = _.unrollMake( [ ] );
  var src = _.unrollMake( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unrollMake( [ ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unrollMake( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - U8x';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unrollMake( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - F32x';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.unrollMake( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - I64x';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( dst, src );
  var expected = _.unrollMake( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.close( 'to dst - unroll' );

  /**/

  test.open( 'to dst - argumentsArray' );

  test.case = 'from src - array';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = [ 1, 2, 3 ];
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArrayMake( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'to dst argumentsArray from src - unroll';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = _.unrollMake( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArrayMake( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - empty argumentsArray';
  var dst = _.argumentsArrayMake( [ ] );
  var src = _.argumentsArrayMake( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArrayMake( [ ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - empty U8x';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArrayMake( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - U8x';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArrayMake( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - F32x';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArrayMake( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - I64x';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( dst, src );
  var expected = _.argumentsArrayMake( [ 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.close( 'to dst - argumentsArray' );

  /**/

  test.open( 'to dst - U8x' );

  test.case = 'from src - array';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - unroll';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.unrollMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - empty U8x';
  var dst = new U8x( [ ] );
  var src = new U8x( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - F32x';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new U8x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - I64x';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigIntsFrom( [ 4, 5, 6 ] ) );
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
  test.is( got === dst );

  test.case = 'from src - unroll';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.unrollMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - U8x';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - empty F32x';
  var dst = new F32x( [ ] );
  var src = new F32x( [ ] );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - I64x';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigIntsFrom( [ 4, 5, 6 ] ) );
  var got = _.bufferMove( dst, src );
  var expected = new F32x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.close( 'to dst - F32x' );

  /**/

  test.open( 'to dst - I64x' );

  test.case = 'from src - array';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigIntsFrom( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - unroll';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = _.unrollMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigIntsFrom( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - argumentsArray';
  var dst = new I64x( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( [ 4, 5, 6 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - U8x';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigIntsFrom( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - F32x';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigIntsFrom( [ 4, 5, 6 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - empty I64x';
  var dst = new I64x( _.bigIntsFrom( [ ] ) );
  var src = new I64x( _.bigIntsFrom( [ ] ) );
  var got = _.bufferMove( dst, src );
  var expected = new I64x( _.bigIntsFrom( [ ] ) );
  test.identical( got, expected );
  test.is( got === dst );

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
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - unroll, offset - 3';
  var dst = [ 1, 2, 3 ];
  var src = _.unrollMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - argumentsArray, offset - 1';
  var dst = [ 1 ];
  var src = _.argumentsArrayMake( [ 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = [ 1, 3 ];
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - U8x, offset - 3';
  var dst = [ 0, 2, 3 ];
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = [ 0, 2, 3, 1, 2, 3 ];
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - F32x, offset - 3';
  var dst = [ 0, 2, 3 ];
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = [ 0, 2, 3, 1, 2, 3 ];
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = [ 0, 2, 3 ];
  var src = new I64x( _.bigIntsFrom( [ 1, 2 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = [ 0, 1, 2 ];
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.close( 'to dst - array' );

  /**/

  test.open( 'to dst - unroll' );

  test.case = 'from src - array, offset - 3';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = [ 4, 5, 6 ];
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = _.unrollMake( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - argumentsArray, offset - 3';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = _.unrollMake( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - U8x, offset - 3';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = new U8x( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = _.unrollMake( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - F32x, offset - 3';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5, 6 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = _.unrollMake( [ 1, 2, 3, 4, 5, 6 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = _.unrollMake( [ 1, 2, 3 ] );
  var src = new I64x( _.bigIntsFrom( [ 1, 2 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = _.unrollMake( [ 1, 1, 2 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.close( 'to dst - unroll' );

  /**/

  test.open( 'to dst - argumentsArray' );

  test.case = 'from src - array, offset - 1';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = [ 1, 2, 3 ];
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = _.argumentsArrayMake( [ 4, 1, 2 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - unroll, offset - 1';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = _.unrollMake( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = _.argumentsArrayMake( [ 4, 1, 2 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - U8x, offset - 1';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = _.argumentsArrayMake( [ 4, 1, 2 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - F32x, offset - 1';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = new F32x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = _.argumentsArrayMake( [ 4, 1, 2 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = _.argumentsArrayMake( [ 4, 5, 6 ] );
  var src = new I64x( _.bigIntsFrom( [ 1, 2 ] ) ); //1n, 2n, 3n
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = _.argumentsArrayMake( [ 4, 1, 2 ] );
  test.identical( got.dst, expected );
  test.is( got !== dst );

  test.close( 'to dst - argumentsArray' );

  /**/

  test.open( 'to dst - U8x' );

  test.case = 'from src - array, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = [ 4, 5 ];
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1 } );
  var expected = new U8x( [ 1, 4, 5 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - unroll, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.unrollMake( [ 4, 5 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new U8x( [ 1, 4, 5 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - argumentsArray, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4, 5 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new U8x( [ 1, 4, 5 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - F32x, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new F32x( [ 4, 5 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new U8x( [ 1, 4, 5 ] );;
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - I64x, offset - 1';
  var dst = new U8x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigIntsFrom( [ 4, 5 ] ) );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  test.identical( got.dst, dst );
  test.is( got === dst );

  test.close( 'to dst - U8x' );

  /**/

  test.open( 'to dst - F32x' );

  test.case = 'from src - array, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = [ 4 ];
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2} );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - unroll, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.unrollMake( [ 4 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2} );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - argumentsArray, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2} );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - U8x, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new U8x( [ 4 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2} );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - I64x, offset - 2';
  var dst = new F32x( [ 1, 2, 3 ] );
  var src = new I64x( _.bigIntsFrom( [ 4 ] ) );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2} );
  var expected = new F32x( [ 1, 2, 4 ] );
  test.identical( got, expected );
  test.is( got === dst );

  test.close( 'to dst - F32x' );

  /**/

  test.open( 'to dst - I64x' );

  test.case = 'from src - array, offset - 1';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = [ 4, 5 ];
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new I64x( _.bigIntsFrom( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - unroll, offset - 1';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = _.unrollMake( [ 4, 5 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new I64x( _.bigIntsFrom( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - argumentsArray, offset - 1';
  var dst = new I64x( [ 1, 2, 3 ] );
  var src = _.argumentsArrayMake( [ 4, 5 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new I64x( _.bigIntsFrom( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - U8x, offset - 1';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = new U8x( [ 4, 5 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new I64x( _.bigIntsFrom( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.case = 'from src - F32x, offset - 1';
  var dst = new I64x( _.bigIntsFrom( [ 1, 2, 3 ] ) );
  var src = new F32x( [ 4, 5 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 1} );
  var expected = new I64x( _.bigIntsFrom( [ 1, 4, 5 ] ) );
  test.identical( got, expected );
  test.is( got === dst );

  test.close( 'to dst - I64x' );

  /**/

  test.open('to dst - BufferRaw');

  test.case = 'from src - array, offset - 2';
  var dst = new BufferRaw( 6 );
  var src = [ 1, 2, 3, 4 ];
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 1, 2, 3, 4 ] );
  test.identical( got, expected );
  test.is( got.buffer === dst );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'from src - unroll, offset - 2';
  var dst = new BufferRaw( 6 );
  var src = _.unrollMake( [ 1, 2, 3, 4 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 1, 2, 3, 4 ] );
  test.identical( got, expected );
  test.is( got.buffer === dst );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'from src - argumentsArray, offset - 3';
  var dst = new BufferRaw( 6 );
  var src = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got.buffer === dst );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'from src - U8x, offset - 2';
  var dst = new BufferRaw( 6 );
  var src = new U8x( [ 1, 2, 3 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 3 } );
  var expected = new U8x( [ 0, 0, 0, 1, 2, 3 ] );
  test.identical( got, expected );
  test.is( got.buffer === dst );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'from src - F32x, offset - 2';
  var dst = new BufferRaw( 16 );
  var src = new F32x( [ 1, 2 ] );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 0, 0, 128, 63, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got.buffer === dst );
  test.is( got !== dst );
  test.is( got !== src );

  test.case = 'from src - I64x, offset - 2';
  var dst = new BufferRaw( 16 );
  var src = new I64x( _.bigIntsFrom( [ 1 ] ) );
  var got = _.bufferMove( { dst : dst, src : src, dstOffset : 2 } );
  var expected = new U8x( [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
  test.identical( got, expected );
  test.is( got.buffer === dst );
  test.is( got !== dst );
  test.is( got !== src );

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



// --
// declaration
// --

var Self =
{

  name : 'Tools.base.Buffer',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // buffer, l0/l6

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

    bufferBut,
    bufferButInplace,
    bufferBut_,
    bufferSelect,
    bufferSelectInplace,
    bufferSelect_,
    bufferGrow,
    bufferGrowInplace,
    bufferGrow_,
    bufferRelength,
    bufferRelengthInplace,
    bufferRelength_,
    bufferRelen,
    bufferResize,
    bufferResizeInplace,
    bufferResize_,
    bufferRetype,

    bufferJoin,
    bufferMove,
    bufferMoveWithSingleArgument,
    bufferLeft,
    bufferRight,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
