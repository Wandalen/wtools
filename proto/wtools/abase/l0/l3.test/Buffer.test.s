( function _l0_l3_Buffer_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// buffer
// --

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

  test.case = 'check U8xClamped constructor';
  var got = _.constructorIsBuffer( U8xClamped );
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

function bufferCoerceFrom( test )
{
  test.open( 'src - null' );

  test.case = 'bufferConstructor - BufferRaw';
  var got = _.bufferCoerceFrom({ src : null, bufferConstructor : BufferRaw });
  test.identical( got, new BufferRaw( 0 ) );

  test.case = 'bufferConstructor - BufferView';
  var got = _.bufferCoerceFrom({ src : null, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new BufferRaw( 0 ) ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var got = _.bufferCoerceFrom({ src : null, bufferConstructor : U8x });
  test.identical( got, new U8x( 0 ) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var got = _.bufferCoerceFrom({ src : null, bufferConstructor : Fx });
  test.identical( got, new F32x( 0 ) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var got0 = _.bufferCoerceFrom({ src : null, bufferConstructor : BufferNode });
    test.identical( got0, BufferNode.alloc( 0 ) );
  }

  test.close( 'src - null' );

  /* - */

  test.open( 'src - number' );

  test.case = 'bufferConstructor - BufferRaw';
  var got = _.bufferCoerceFrom({ src : 2, bufferConstructor : BufferRaw });
  test.identical( got, new BufferRaw( 2 ) );

  test.case = 'bufferConstructor - BufferView';
  var got = _.bufferCoerceFrom({ src : 2, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new BufferRaw( 2 ) ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var got = _.bufferCoerceFrom({ src : 2, bufferConstructor : U8x });
  test.identical( got, new U8x( 2 ) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var got = _.bufferCoerceFrom({ src : 2, bufferConstructor : Fx });
  test.identical( got, new F32x( 2 ) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var got1 = _.bufferCoerceFrom({ src : 2, bufferConstructor : BufferNode });
    test.identical( got1, BufferNode.alloc( 2 ) );
  }

  test.close( 'src - number' );

  /* - */

  test.open( 'src - string' );

  test.case = 'bufferConstructor - BufferRaw';
  var got = _.bufferCoerceFrom({ src : 'abc', bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 97, 98, 99 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var got = _.bufferCoerceFrom({ src : 'abc', bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 97, 98, 99 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var got = _.bufferCoerceFrom({ src : 'abc', bufferConstructor : U8x });
  test.identical( got, new U8x([ 97, 98, 99 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var got = _.bufferCoerceFrom({ src : 'abc', bufferConstructor : Fx });
  test.identical( got, new F32x([ 97, 98, 99 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var got2 = _.bufferCoerceFrom({ src : 'abc', bufferConstructor : BufferNode });
    test.identical( got2, BufferNode.from([ 97, 98, 99 ]) );
  }

  test.close( 'src - string' );

  /* - */

  test.open( 'src - BufferRaw' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );
  test.true( got === src );

  test.case = 'bufferConstructor - BufferView';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferCoerceFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new F32x([ 1, 2, 3 ]).buffer;
  var got = _.bufferCoerceFrom({ src, bufferConstructor : Fx });
  test.identical( got, new F32x([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src3 = new U8x([ 1, 2, 3 ]).buffer;
    var got3 = _.bufferCoerceFrom({ src : src3, bufferConstructor : BufferNode });
    test.identical( got3, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - BufferRaw' );

  /* - */

  test.open( 'src - BufferView' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );
  test.true( got === src );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferCoerceFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new BufferView( new F32x([ 1, 2, 3 ]).buffer );
  var got = _.bufferCoerceFrom({ src, bufferConstructor : Fx });
  test.identical( got, new Fx([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src4 = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
    var got4 = _.bufferCoerceFrom({ src : src4, bufferConstructor : BufferNode });
    test.identical( got4, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - BufferView' );

  /* - */

  test.open( 'src - Long' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = [ 1, 2, 3 ];
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var src = _.unroll.make([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = [ 1, 2, 3 ];
  var got = _.bufferCoerceFrom({ src, bufferConstructor : Fx });
  test.identical( got, new F32x([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src5 = _.unroll.make([ 1, 2, 3 ]);
    var got5 = _.bufferCoerceFrom({ src : src5, bufferConstructor : BufferNode });
    test.identical( got5, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - Long' );

  /* - */

  test.open( 'src - bufferTyped' );

  test.case = 'bufferConstructor - BufferRaw';
  var src = new I16x([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRaw });
  test.identical( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - BufferView';
  var src = new F32x([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferView });
  test.identical( got, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new U8x([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : U8x });
  test.identical( got, new U8x([ 1, 2, 3 ]) );
  test.true( got === src );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new U16x([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : Fx });
  test.identical( got, new F32x([ 1, 2, 3 ]) );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src6 = new I32x([ 1, 2, 3 ]);
    var got6 = _.bufferCoerceFrom({ src : src6, bufferConstructor : BufferNode });
    test.identical( got6, BufferNode.from([ 1, 2, 3 ]) );
  }

  test.close( 'src - bufferTyped' );

  /* - */

  test.open( 'bufferConstructor - BufferRawShared' );

  test.case = 'src - BufferRaw';
  var src = new U8x([ 1, 2, 3 ]).buffer;
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'src - BufferView';
  var src = new BufferView( new U8x([ 1, 2, 3 ]).buffer );
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - bufferTyped, U8x';
  var src = new U8x([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  test.case = 'bufferConstructor - bufferTyped, Fx';
  var src = new F32x([ 1, 2, 3 ]);
  var got = _.bufferCoerceFrom({ src, bufferConstructor : BufferRawShared });
  test.equivalent( got, new U8x([ 1, 2, 3 ]).buffer );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'bufferConstructor - BufferNode';
    var src7 = BufferNode.from([ 1, 2, 3 ]);
    var got7 = _.bufferCoerceFrom({ src : src7, bufferConstructor : BufferRawShared });
    test.equivalent( got7, new U8x([ 1, 2, 3 ]).buffer );
  }

  test.close( 'bufferConstructor - BufferRawShared' );

  /* - */

  if( Config.interpreter === 'njs' )
  {
    test.open( 'src - BufferNode' );

    test.case = 'bufferConstructor - BufferRaw';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferCoerceFrom({ src : src8, bufferConstructor : BufferRaw });
    test.identical( got8, new U8x([ 1, 2, 3 ]).buffer );

    test.case = 'bufferConstructor - BufferView';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferCoerceFrom({ src : src8, bufferConstructor : BufferView });
    test.identical( got8, new BufferView( new U8x([ 1, 2, 3 ]).buffer ) );

    test.case = 'bufferConstructor - bufferTyped, U8x';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferCoerceFrom({ src : src8, bufferConstructor : U8x });
    test.identical( got8, new U8x([ 1, 2, 3 ]) );

    test.case = 'bufferConstructor - bufferTyped, Fx';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferCoerceFrom({ src : src8, bufferConstructor : Fx });
    test.identical( got8, new F32x([ 1, 2, 3 ]) );

    test.case = 'bufferConstructor - BufferNode';
    var src8 = BufferNode.from([ 1, 2, 3 ]);
    var got8 = _.bufferCoerceFrom({ src : src8, bufferConstructor : BufferNode });
    test.identical( got8, BufferNode.from([ 1, 2, 3 ]) );
    test.true( got8 === src8 );

    test.close( 'src - BufferNode' );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom( { src : 2, bufferConstructor : U8x }, 'extra' ) );

  test.case = 'wrong type of options map o';
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom( [] ) );
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom( null ) );

  test.case = 'wrong type of o.src';
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom({ src : {}, bufferConstructor : U8x }) );

  test.case = 'wrong type of o.bufferConstructor';
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom({ src : new U8x( 3 ), bufferConstructor : 'wrong' }) );

  test.case = 'options map has not all options';
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom({ src : new U8x( 3 ) }) );
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom({ bufferConstructor : U8x }) );

  test.case = 'unknown field in options map';
  test.shouldThrowErrorSync( () => _.bufferCoerceFrom({ src : new U8x( 3 ), bufferConstructor : U8x, unknown : 1 }) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Buffer.l0.l3',
  silencing : 1,
  enabled : 1,

  tests :
  {

    constructorIsBuffer,
    bufferCoerceFrom,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
