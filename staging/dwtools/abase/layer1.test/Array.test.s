( function _Array_test_s_( ) {

'use strict';

var isBrowser = true;

if( typeof module !== 'undefined' )
{
  isBrowser = false;

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

}

var _ = wTools;

// --
// buffer
// --

function bufferRelen( test )
{

  // debugger;
  // console.log( 'www' );
  // logger.log( 'xxx' );
  // test.logger.log( 'yyy' );
  // debugger;

  test.description = 'second argument is more than ints.length';
  var ints = new Int8Array( [ 3, 7, 13 ] );
  var got = _.bufferRelen( ints, 4 );
  var expected = got; // [ 3, 7, 13, 0 ];
  test.identical( got, expected );

  test.description = 'second argument is less than ints2.length';
  var ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
  var got = _.bufferRelen( ints2, 3 );
  var expected = got; // [ 3, 7, 13 ];
  test.identical( got, expected );

  test.description = 'invalid values are replaced by zero';
  var ints3 = new Int32Array( [ 3, 'a', 13, 'b', 77 ] );
  var got = _.bufferRelen( ints3, 6 );
  var expected = got; // [ 3, 0, 13, 0, 77, 0 ];
  test.identical( got, expected );

  test.description = 'returns the initial typed array';
  var floats = new Float32Array( [ 3.35, 7.5, 13.35, 33.75, 77.25 ] );
  var got = _.bufferRelen( floats, 5 );
  var expected = got; // [ 3.3499999046325684, 7.5, 13.350000381469727, 33.75, 77.25 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.bufferRelen();
  });

};

//

function bufferRetype( test )
{

  test.description = 'converts and returns the new type of Int16Array';
  var view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
  var got = _.bufferRetype(view1, Int16Array);
  var expected = got; // [ 513, 1027, 1541 ];
  test.identical( got, expected );

  test.description = 'converts and returns the new type of Int8Array';
  var view1 = new Int16Array( [ 513, 1027, 1541 ] );
  var got = _.bufferRetype(view1, Int8Array);
  var expected = got; // [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.bufferRetype();
  });

  test.description = 'arguments are wrong';
  test.shouldThrowError( function()
  {
    _.bufferRetype( 'wrong argument', 'wrong argument' );
  });

};

//

function bufferRawFromBuffer( test )
{

  var buffer1 = new ArrayBuffer(10);
  var view1 = new Int8Array( buffer1 );
  test.description = 'returns the same length of typed array';
  var got = _.bufferRawFromBuffer( view1 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  var buffer2 = new ArrayBuffer(10);
  var view2 = new Int8Array( buffer2, 2 );
  test.description = 'returns the new sub typed array';
  var got = _.bufferRawFromBuffer( view2 );
  var expected = got; // [ 0, 0, 0, 0, 0, 0 ]
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.bufferRawFromBuffer();
  });

  test.description = 'arguments are wrong';
  test.shouldThrowError( function()
  {
    _.bufferRawFromBuffer( 'wrong argument' );
  });

}

//

function arrayIs( test )
{

  test.description = 'an empty array';
  var got = _.arrayIs( [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.arrayIs( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.arrayIs( {  } );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'number';
  var got = _.arrayIs( 6 );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'string';
  var got = _.arrayIs( 'abc' );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'boolean';
  var got = _.arrayIs( true );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'function';
  var got = _.arrayIs( function() {  } );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'a pseudo array';
  var got = ( function() {
    return _.arrayIs( arguments );
  } )('Hello there!');
  var expected = false;
  test.identical( got, expected );

  test.description = 'no argument';
  var got = _.arrayIs();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.arrayIs();
  var expected  = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

}

//

function arrayLike( test )
{

  test.description = 'an empty array';
  var got = _.arrayLike( [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.arrayLike( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.description = 'a pseudo array';
  var got = _.arrayLike( arguments );
  var expected = true;
  test.identical( got, expected );

  test.description = 'raw array buffer';
  var got = _.arrayLike( new ArrayBuffer( 10 ) );
  var expected = false;
  test.identical( got, expected );

  test.description = 'typed array buffer';
  var got = _.arrayLike( new Float32Array( 10 ) );
  var expected = true;
  test.identical( got, expected );

  test.description = 'no argument';
  var got = _.arrayLike();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.arrayLike( null );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'function';
  var got = _.arrayLike( function() {} );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'string';
  var got = _.arrayLike( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'number';
  var got = _.arrayLike( 1 );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'boolean';
  var got = _.arrayLike( true );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.arrayLike( {} );
  var expected  = false;
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

}

//

function clsLikeArray( test )
{

  test.description = 'an array';
  var got = _.clsLikeArray( [  ].constructor );
  var expected = true;
  test.identical( got, expected );

  test.description = 'arguments, not possible to say yes by constructor';
  var got = _.clsLikeArray( arguments.constructor );
  var expected = false;
  test.identical( got, expected );

  test.description = 'raw array buffer'; debugger;
  var got = _.clsLikeArray( new ArrayBuffer( 10 ).constructor );
  var expected = false;
  test.identical( got, expected );

  test.description = 'typed array buffer';
  var got = _.clsLikeArray( new Float32Array( 10 ).constructor );
  var expected = true;
  test.identical( got, expected );

  test.description = 'no argument';
  var got = _.clsLikeArray();
  var expected  = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.clsLikeArray( null );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'number';
  var got = _.clsLikeArray( 1 );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'function';
  var got = _.clsLikeArray( (function() {}).constructor );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'string';
  var got = _.clsLikeArray( 'x'.constructor );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'string';
  var got = _.clsLikeArray( 'x' );
  var expected  = false;
  test.identical( got, expected );

  test.description = 'object';
  var got = _.clsLikeArray( {}.constructor );
  var expected  = false;
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

}

//

function hasLength( test )
{

  test.description = 'an empty array';
  var got = _.hasLength( [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array';
  var got = _.hasLength( [ 1, 2, 3 ] );
  var expected  = true;
  test.identical( got, expected );

  test.description = 'a pseudo array';
  var got = ( function() {
    return _.hasLength( arguments );
  } )('Hello there!');
  var expected = true;
  test.identical( got, expected );

  test.description = 'an array-like';
  var got = _.hasLength( { '0' : 1, '1' : 2, '2' : 3, 'length' : 3 } );
  var expected = true;
  test.identical( got, expected );

  test.description = 'a Function.length';
  function fn( a, b, c ) { };
  var got = _.hasLength( fn );
  var expected = true;
  test.identical( got, expected );

  test.description = 'a "string".length';
  var got = _.hasLength( 'Hello there!' );
  var expected = true;
  test.identical( got, expected );

  test.description = 'no arguments';
  var got = _.hasLength();
  var expected = false;
  test.identical( got, expected );

  test.description = 'null';
  var got = _.hasLength();
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

};

//

function arrayMakeSimilar( test )
{

  test.description = 'an empty array';
  var got = _.arrayMakeSimilar( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'length = 1';
  var got = _.arrayMakeSimilar( [  ], 1 );
  var expected = [ ,  ];
  test.identical( got, expected );

  test.description = 'length = 2';
  var got = _.arrayMakeSimilar( [ 1, 2, 3 ], 2 );
  var expected = [ , , ];
  test.identical( got, expected );

  test.description = 'length = 4';
  var got = _.arrayMakeSimilar( [ 1, 2, 3 ], 4 );
  var expected = [ , , , , ];
  test.identical( got, expected );

  test.description = 'same length';

  var ins = [ 1, 2, 3 ];
  var got = _.arrayMakeSimilar( ins );
  test.identical( got.length, 3 );
  test.shouldBe( got !== ins );

  var ins = [];
  var src = _.arrayFillWhole( new Buffer( 5 ), 1 );
  var got = _.arrayMakeSimilar( ins, src );
  test.identical( got.length, 5 );
  test.shouldBe( _.arrayIs( got ) );
  test.identical( got, [ 1,1,1,1,1 ] );

  var ins = [];
  var src = new ArrayBuffer( 5 )
  var got = _.arrayMakeSimilar( ins, src );
  test.identical( got.length, 5 );
  test.shouldBe( _.arrayIs( got ) );

  var ins = new Uint8Array( 5 );
  ins[ 0 ] = 1;
  var got = _.arrayMakeSimilar( ins );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.identical( got.length, 5 );
  test.shouldBe( got !== ins );

  var ins = new Uint8Array( 5 );
  var src = [ 1, 2, 3, 4, 5 ];
  var got = _.arrayMakeSimilar( ins,src );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got instanceof Uint8Array );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  test.description = 'typedArray';
  var ins = new Uint8Array( 5 );
  ins[ 0 ] = 1;
  var got = _.arrayMakeSimilar( ins, 4 );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.identical( got.length, 4 );
  test.shouldBe( got !== ins );

  test.description = 'ArrayBuffer';
  var ins = new ArrayBuffer( 5 );
  var got = _.arrayMakeSimilar( ins, 4 );
  test.shouldBe( _.bufferRawIs( got ) );
  test.identical( got.byteLength, 4 );

  test.description = 'NodeBuffer'
  var got = _.arrayMakeSimilar( new Buffer( 5 ) );
  test.shouldBe( _.bufferNodeIs( got ) );
  test.identical( got.length, 5 );

  test.description = 'NodeBuffer and src'
  var src = _.arrayFillWhole( new Uint8Array( 5 ), 1 );
  var got = _.arrayMakeSimilar( new Buffer( 5 ), src );
  test.shouldBe( _.bufferNodeIs( got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  test.description = 'NodeBuffer as src'
  var src = new Buffer(10);
  for( var i = 0; i < src.length; i++ )
  src[ i ] = i;
  var got = _.arrayMakeSimilar( [], src );
  test.shouldBe( _.arrayIs( got ) );
  test.identical( got.length, src.length );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  test.description = 'ins as Array';
  var got = _.arrayMakeSimilar( Array, 5 );
  test.shouldBe( _.arrayIs(  got ) );
  test.identical( got.length, 5 );

  test.description = 'ins as Array';
  var src = [ 1,2,3 ];
  var got = _.arrayMakeSimilar( Array, src );
  test.shouldBe( _.arrayIs(  got ) );
  test.identical( got.length, 3 );
  test.identical( got, src );

  test.description = 'ins as Array';
  var src = _.arrayFillWhole( new Float32Array( 5 ), 1 );
  var got = _.arrayMakeSimilar( Array, src );
  test.shouldBe( _.arrayIs(  got ) );
  test.identical( got.length, 5 );
  test.identical( got, [ 1, 1, 1, 1, 1 ] );

  test.description = 'ins as Buffer';
  var src = _.arrayFillWhole( new Float32Array( 5 ), 1 );
  var got = _.arrayMakeSimilar( Buffer, src );
  test.shouldBe( _.bufferNodeIs(  got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  test.description = 'ins as Array';
  var src = _.arrayFillWhole( new Buffer( 5 ), 1 );
  var got = _.arrayMakeSimilar( Array, src );
  test.shouldBe( _.arrayIs(  got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  test.description = 'ins as TypedArray';
  var src = [ 1,2,3 ];
  var got = _.arrayMakeSimilar( Uint8Array, src );
  test.shouldBe( _.bufferTypedIs(  got ) );
  test.identical( got.length, 3 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  test.description = 'ins as TypedArray';
  var src = _.arrayFillWhole( new Buffer( 5 ), 1 );
  var got = _.arrayMakeSimilar( Float32Array, src );
  test.shouldBe( _.bufferTypedIs(  got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < src.length; i++ )
  isEqual = got[ i ] !== src[ i ] ? false : true;
  test.shouldBe( isEqual );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar('wrong argument');
  });

  test.description = 'arguments[1] is wrong';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar( [ 1, 2, 3 ], 'wrong type of argument' );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar( [ 1, 2, 3 ], 4, 'redundant argument' );
  });

  test.description = 'argument is not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilar( 1, 2, 3, 4 );
  });
};

//

function arrayMakeSimilarZeroed( test )
{
  test.description = 'Array';
  var got = _.arrayMakeSimilarZeroed( Array, 1 );
  var expected = [ 0 ];
  test.identical( got, expected );

  //

  test.description = 'Array';
  var got = _.arrayMakeSimilarZeroed( Array, new Float32Array( 2 ) );
  var expected = [ 0, 0 ];
  test.identical( got, expected );

  //

  test.description = 'ArrayBuffer';
  var got = _.arrayMakeSimilarZeroed( ArrayBuffer, 3 );
  test.shouldBe( _.bufferRawIs( got ) );
  test.identical( got.byteLength, 3 );

  //

  test.description = 'Uint8Array';
  var got = _.arrayMakeSimilarZeroed( Uint8Array, [ 1, 2, 3 ] );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.identical( got.length, 3 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'Uint8Array';
  var got = _.arrayMakeSimilarZeroed( Buffer, new ArrayBuffer( 3) );
  test.shouldBe( _.bufferNodeIs( got ) );
  test.identical( got.length, 3 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'an empty array';
  var got = _.arrayMakeSimilarZeroed( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  //

  test.description = 'length = 1';
  var got = _.arrayMakeSimilarZeroed( [  ], 1 );
  var expected = [ 0 ];
  test.identical( got, expected );

  //

  test.description = 'length = 2';
  var got = _.arrayMakeSimilarZeroed( [ 1, 2, 3 ], 2 );
  var expected = [ 0, 0 ];
  test.identical( got, expected );

  //

  test.description = 'length = 4';
  var got = _.arrayMakeSimilarZeroed( [ 1, 2, 3 ], 4 );
  var expected = [ 0, 0, 0, 0 ];
  test.identical( got, expected );

  //

  test.description = 'same length';
  var ins = [ 1, 2, 3 ];
  var got = _.arrayMakeSimilarZeroed( ins );
  test.identical( got.length, 3 );
  test.identical( got, [ 0, 0, 0 ] )

  //

  test.description = 'same length';
  var ins = new ArrayBuffer(5);
  var got = _.arrayMakeSimilarZeroed( ins );
  test.shouldBe( _.bufferRawIs( got ) );
  test.identical( got.byteLength, 5 );

  //

  test.description = 'same length';
  var got = _.arrayMakeSimilarZeroed( ArrayBuffer, 5 );
  test.shouldBe( _.bufferRawIs( got ) );
  test.identical( got.byteLength, 5 );

  //

  test.description = 'same length, ins is a typed array';
  var ins = _.arrayFillWhole( new Uint8Array( 5 ), 1 );
  var got = _.arrayMakeSimilarZeroed( ins );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'same length, ins is a node buffer';
  var ins = _.arrayFillWhole( new Buffer( 5 ), 1 );
  var got = _.arrayMakeSimilarZeroed( ins );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  var ins = [];
  var src = _.arrayFillWhole( new Buffer( 5 ), 1 );
  var got = _.arrayMakeSimilarZeroed( ins, src );
  test.identical( got.length, 5 );
  test.shouldBe( _.arrayIs( got ) );
  test.identical( got, [ 0,0,0,0,0 ] );

  //

  var ins = new Uint8Array( 5 );
  ins[ 0 ] = 1;
  var got = _.arrayMakeSimilarZeroed( ins );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'typedArray';
  var ins = new Uint8Array( 5 );
  ins[ 0 ] = 1;
  var got = _.arrayMakeSimilarZeroed( ins, 4 );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.identical( got.length, 4 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'ArrayBuffer';
  var ins = new ArrayBuffer( 5 );
  var got = _.arrayMakeSimilarZeroed( ins, 4 );
  test.shouldBe( _.bufferRawIs( got ) );
  test.identical( got.byteLength, 4 );
  got = new Uint8Array( got );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'ArrayBuffer';
  var ins = [];
  var src = new ArrayBuffer( 5 );
  var got = _.arrayMakeSimilarZeroed( ins, src );
  test.shouldBe( _.arrayIs( got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'NodeBuffer'
  var got = _.arrayMakeSimilarZeroed( new Buffer( 5 ) );
  test.shouldBe( _.bufferNodeIs( got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  //

  test.description = 'NodeBuffer and src'
  var src = new Int8Array(5);
  for( var i = 0; i < src.length; i++ )
  src[ i ] = i;
  var got = _.arrayMakeSimilarZeroed( new Buffer( 5 ), src );
  test.shouldBe( _.bufferNodeIs( got ) );
  test.identical( got.length, 5 );
  var isEqual = true;
  for( var i = 0; i < got.length; i++ )
  isEqual = got[ i ] === 0 ? true : false;
  test.shouldBe( isEqual );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilarZeroed();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilarZeroed('wrong argument');
  });

  test.description = 'arguments[1] is wrong';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilarZeroed( [ 1, 2, 3 ], 'wrong type of argument' );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilarZeroed( [ 1, 2, 3 ], 4, 'redundant argument' );
  });

  test.description = 'argument is not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arrayMakeSimilarZeroed( 1, 2, 3, 4 );
  });
};

//

function arrayMakeRandom( test )
{

  test.description = 'an empty object';
  var got = _.arrayMakeRandom( {  } );
  test.identical( got.length, 1 );
  test.shouldBe( got[ 0 ] >= 0 && got[ 0 ]<= 1 );

  test.description = 'a number';
  var got = _.arrayMakeRandom( 5 );
  var expected = got;
  test.identical( got.length, 5 );

  var got = _.arrayMakeRandom( -1 );
  var expected = [];
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayMakeRandom( {
    length : 5,
    range : [ 1, 9 ],
    int : true
  } );
  var expected = got;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayMakeRandom();
  });

  test.description = 'wrong argument';
  test.shouldThrowError( function()
  {
    _.arrayMakeRandom( 'wrong argument' );
  });

};

//

function arrayFromNumber( test )
{

  test.description = 'nothing';
  var got = _.arrayFromNumber( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'static array';
  var got = _.arrayFromNumber( 3, 7 );
  var expected = [ 3, 3, 3, 3, 3, 3, 3 ];
  test.identical( got, expected );

  test.description = 'original array';
  var got = _.arrayFromNumber( [ 3, 7, 13 ], 3 );
  var expected = [ 3, 7, 13 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayFromNumber();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayFromNumber( [ 1, 2, 3 ] );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayFromNumber( [ 1, 2, 3 ], 3, 'redundant argument' );
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arrayFromNumber('wrong argument', 'wrong argument');
  });

  test.description = 'second argument too much';
  test.shouldThrowError( function()
  {
    _.arrayFromNumber( [ 1, 2, 3 ], 4 );
  });

  test.description = 'first three arguments are not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arrayFromNumber( 1, 2, 3, 3 );
  });

};

//

function arrayFromRange( test )
{

  test.description = 'single zero';
  var got = _.arrayFromRange( [ 0, 1 ] );
  var expected = [ 0 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _.arrayFromRange( [ 1, 1 ] );
  var expected = [  ];
  test.identical( got,expected );

  test.description = 'single not zero';
  var got = _.arrayFromRange( [ 1, 2 ] );
  var expected = [ 1 ];
  test.identical( got,expected );

  test.description = 'couple of elements';
  var got = _.arrayFromRange( [ 1, 3 ] );
  var expected = [ 1, 2 ];
  test.identical( got,expected );

  test.description = 'single number as argument';
  var got = _.arrayFromRange( 3 );
  var expected = [ 0, 1, 2 ];
  test.identical( got,expected );

  test.description = 'complex case';
  var got = _.arrayFromRange( [ 3, 9 ] );
  var expected = [ 3, 4, 5, 6, 7, 8 ];
  test.identical( got,expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayFromRange( [ 1, 3 ],'wrong arguments' );
  });

  test.description = 'argument not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arrayFromRange( 1, 3 );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayFromRange( 'wrong arguments' );
  });

  test.description = 'no arguments'
  test.shouldThrowError( function()
  {
    _.arrayFromRange();
  });

};

//

function arrayFrom( test )
{

  test.description = 'an array';
  var got = _.arrayFrom( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
  var expected = [ 3, 7, 13, 'abc', false, undefined, null, {} ];
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayFrom( { a : 3, b : 7, c : 13 } );
  var expected = [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ];
  test.identical( got, expected );

  test.description = 'a string';
  var got = _.arrayFrom( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
  var expected = [ 3, 7, 13, 3.5, 5, 7.5, 13 ];
  test.identical( got, expected );

  test.description = 'arguments[...]';
  var args = ( function() {
    return arguments;
  } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
  var got = _.arrayFrom( args );
  var expected = [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no argument';
  test.shouldThrowError( function()
  {
    _.arrayFrom();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayFrom( 6 );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayFrom( true );
  });

};

//

function arrayAs( test )
{

  test.description = 'nothing';
  var got = _.arrayAs();
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'an empty array';
  var got = _.arrayAs( [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'undefined';
  var got = _.arrayAs( undefined );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'null';
  var got = _.arrayAs( null );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'array contains an object';
  var got = _.arrayAs( { a : 1, b : 2 } );
  var expected = [ { a : 1, b : 2 } ];
  test.identical( got, expected );

  test.description = 'array contains boolean';
  var got = _.arrayAs( true );
  var expected = [ true ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

};

//

function arrayToMap( test )
{

  test.description = 'an empty object';
  var got = _.arrayToMap( [  ] );
  var expected = {  };
  test.identical( got, expected );

  test.description = 'an object';
  var got = _.arrayToMap( [ 3, [ 1, 2, 3 ], 'abc', false, undefined, null, {} ] );
  var expected = { '0' : 3, '1' : [ 1, 2, 3 ], '2' : 'abc', '3' : false, '4' : undefined, '5' : null, '6' : {} };
  test.identical( got, expected );

  test.description = 'arguments[...]';
  var args = ( function() {
    return arguments;
  } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
  var got = _.arrayToMap( args );
  var expected = { '0' : 3, '1' : 'abc', '2' : false, '3' : undefined, '4' : null, '5' : { greeting: 'Hello there!' } };
  test.identical( got, expected );

  test.description = 'arrayLike';
  var arr = [];
  arr[ 'a' ] = 1;
  var got = _.arrayToMap( arr );
  var expected = {};
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no argument';
  test.shouldThrowError( function()
  {
    _.arrayToMap();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayToMap( 'wrong argument' );
  });

};

//

function arrayToStr( test )
{

  test.description = 'nothing';
  var got = _.arrayToStr( [  ] );
  var expected = "";
  test.identical( got, expected );

  test.description = 'returns the string';
  var got = _.arrayToStr( 'abcdefghijklmnopqrstuvwxyz', { type : 'int' } );
  var expected = "a b c d e f g h i j k l m n o p q r s t u v w x y z ";
  test.identical( got, expected );

  test.description = 'returns a single string representing the integer values';
  var got = _.arrayToStr( [ 1, 2, 3 ], { type : 'int' } );
  var expected = "1 2 3 ";
  test.identical( got, expected );

  test.description = 'returns a single string representing the float values';
  var got = _.arrayToStr( [ 3.5, 13.77, 7.33 ], { type : 'float', precission : 4 } );
  var expected = "3.500 13.77 7.330";
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayToStr();
  });

  test.description = 'in second argument property (type) is wrong';
  test.shouldThrowError( function()
  {
    _.arrayToStr( [ 1, 2, 3 ], { type : 'wrong type' } );
  });

  test.description = 'in second argument property (type) is not provided';
  test.shouldThrowError( function()
  {
    _.arrayToStr( [ 1, 2, 3 ], { precission : 4 } );
  });

  test.description = 'first argument is string';
  test.shouldThrowError( function()
  {
    _.arrayToStr( 'wrong argument', {  type : 'float' } );
  });

};

//

function arraySub( test )
{

  test.description = 'nothing';
  var got = _.arraySub( [  ], 0, 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'two arguments';
  var got = _.arraySub( [  ], 0 );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'full copy of an array';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ] );
  var expected = [ 1, 2, 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'an array of two elements';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
  var expected = [ 3, 4 ];
  test.identical( got, expected );

  test.description = 'from second index to the (arr.length - 1)';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 2 );
  var expected = [ 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'an offset from the end of the sequence';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], -4 );
  var expected = [ 2, 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'the two negative index';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], -4, -2 );
  var expected = [ 2, 3 ];
  test.identical( got, expected );

  test.description = 'the third index is negative';
  var got = _.arraySub( [ 1, 2, 3, 4, 5 ], 1, -1 );
  var expected = [ 2, 3, 4 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySub();
  });

  test.description = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.arraySub( 'wrong argument', 1, -1 );
  });

  test.description = 'argument is not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arraySub( 1, 2, 3, 4, 5, 2, 4 );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4, 'redundant argument' );
  });

};

//

//function arrayJoin( test )
//{
//  test.description = 'empty call';
//  test.identical( _.arrayJoin(), null );
//
//  test.description = 'empty arrays';
//  test.identical( _.arrayJoin( [], [] ), null );
//
//  test.description = 'simple';
//
//  var src = [ 1 ];
//  var got = _.arrayJoin( src );
//  var expected = src;
//  test.identical( got, expected );
//
//  var src = [ 1 ];
//  var got = _.arrayJoin( src, src );
//  var expected = [ 1,1 ];
//  test.identical( got, expected );
//
//  test.description = 'array + typedArray';
//  var got = _.arrayJoin( [ 1 ], new Uint8Array([ 1,2 ]) );
//  var expected = [ 1,1,2 ];
//  test.identical( got, expected );
//
//  var got = _.arrayJoin( new Uint8Array( [ 1,2 ] ), [ 1 ] );
//  var expected = new Uint8Array( [ 1,2,1 ] );
//  test.identical( got, expected );
//
//  test.description = 'typedArray + typedArray';
//  var got = _.arrayJoin( new Uint8Array( [ 1,2 ] ), new Uint8Array( [ 1,2 ] ) );
//  var expected = new Uint8Array( [ 1,2,1,2 ] );
//  test.identical( got, expected );
//
//  var got = _.arrayJoin( new Uint8Array( [ 1,2 ] ), new Uint16Array( [ 1,2 ] ) );
//  var expected = new Uint8Array( [ 1,2,1,0,2,0 ] );
//  test.identical( got, expected );
//
//  test.description = 'arrayBuffer + arrayBuffer';
//  var src = new Uint8Array( [ 1,2 ] );
//  var got = _.arrayJoin( src.buffer, src.buffer );
//  test.shouldBe( _.bufferRawIs( got ) );
//  var expected = new Uint8Array( [ 1,2,1,2 ] );
//  test.identical( new Uint8Array( got ), expected );
//
//  test.description = 'arrayBuffer + array';
//  var src = new Uint8Array( [ 1,2 ] );
//  var got = _.arrayJoin( src.buffer, [ 1,2 ] );
//  test.shouldBe( _.bufferRawIs( got ) );
//  var expected = new Uint8Array( [ 1,2,1,2 ] );
//  test.identical( new Uint8Array( got ), expected );
//
//  test.description = 'arrayBuffer + typedArray';
//  var src = new Uint8Array( [ 1,2 ] );
//  var got = _.arrayJoin( src.buffer, src );
//  test.shouldBe( _.bufferRawIs( got ) );
//  var expected = new Uint8Array( [ 1,2,1,2 ] );
//  test.identical( new Uint8Array( got ), expected );
//
//  test.description = 'typedArray + arrayBuffer';
//  var src = new Uint8Array( [ 1,2 ] );
//  var got = _.arrayJoin( src, src.buffer );
//  var expected = new Uint8Array( [ 1,2,1,2 ] );
//  test.identical( got, expected );
//
//  test.description = 'typedArray + arrayBuffer + array';
//  var src = new Uint8Array( [ 1 ] );
//  var got = _.arrayJoin( src, src.buffer, [ 1 ] );
//  var expected = new Uint8Array( [ 1,1,1 ] );
//  test.identical( got, expected );
//
//  test.description = 'array + typedArray + arrayBuffer';
//  var src = new Uint8Array( [ 1 ] );
//  var got = _.arrayJoin( [ 1 ], src, src.buffer );
//  var expected = [ 1,1,1 ];
//  test.identical( got, expected );
//
//  test.description = 'arrayBuffer + array + typedArray';
//  var src = new Uint8Array( [ 1 ] );
//  var got = _.arrayJoin( src.buffer, [ 1 ], src  );
//  test.shouldBe( _.bufferRawIs( got ) );
//  var expected = new Uint8Array( [ 1,1,1 ] );
//  test.identical( new Uint8Array( got ), expected );
//
//  if( !isBrowser )
//  {
//    test.description = 'buffer';
//    got = _.arrayJoin( new Buffer( '1' ), [ 1 ] );
//    expected = new Buffer( [ 49,1 ] );
//    test.identical( got, expected );
//
//    test.description = 'buffer + arrayBuffer';
//    var raw = new Uint8Array( [ 1 ] ).buffer;
//    got = _.arrayJoin( new Buffer( '1' ), raw );
//    expected = new Buffer( [ 49,1 ] );
//    test.identical( got, expected );
//
//    test.description = 'buffer + typedArray';
//    var typed = new Uint8Array( [ 1 ] );
//    got = _.arrayJoin( new Buffer( '1' ), typed );
//    expected = new Buffer( [ 49,1 ] );
//    test.identical( got, expected );
//
//    test.description = 'buffer + typedArray + raw + array';
//    var typed = new Uint8Array( [ 1 ] );
//    got = _.arrayJoin( new Buffer( '1' ), typed, typed.buffer, [ 1 ] );
//    expected = new Buffer( [ 49,1,1,1 ] );
//    test.identical( got, expected );
//
//    test.description = 'typedArray + buffer + raw + array';
//    var typed = new Uint8Array( [ 1 ] );
//    got = _.arrayJoin( typed, new Buffer( '1' ), typed.buffer, [ 1 ] );
//    expected = new Uint8Array( [ 1,49,1,1 ] );
//    test.identical( got, expected );
//
//    test.description = 'raw + typedArray + buffer + array';
//    var typed = new Uint8Array( [ 1 ] );
//    got = _.arrayJoin( typed.buffer, typed, new Buffer( '1' ), [ 1 ] );
//    expected = new Uint8Array( [ 1,1,49,1 ] );
//    test.identical( new Uint8Array( got ), expected );
//
//    test.description = 'array + raw + typedArray + buffer ';
//    var typed = new Uint8Array( [ 1 ] );
//    got = _.arrayJoin( [ 1 ], typed.buffer, typed, new Buffer( '1' )  );
//    expected = new Uint8Array( [ 1,1,1,49 ] );
//    test.identical( new Uint8Array( got ), expected );
//  }
//
//  if( !Config.debug )
//  return;
//
//  test.shouldThrowError( () => _.arrayJoin( [ 1 ], '1' ) );
//  test.shouldThrowError( () => _.arrayJoin( [ 1 ], { byteLength : 5 } ) );
//
//}

//

function arrayGrow( test )
{
  var got,expected;
  var array = [ 1,2,3,4,5 ];

  test.description = 'defaults';

  /* default call returns copy */

  got = _.arrayGrow( array );
  expected = array;
  test.identical( got, expected );

  test.description = 'increase size of array';

  /* without setting value */

  got = _.arrayGrow( array, 0, array.length + 2 );
  expected = array.length + 2;
  test.identical( got.length, expected );

  /* by setting value */

  got = _.arrayGrow( array, 0, array.length + 2, 0 );
  expected = [ 1,2,3,4,5,0,0 ];
  test.identical( got, expected );

  /* by taking only last element of source array */

  got = _.arrayGrow( array, array.length - 1, array.length * 2, 0 );
  expected = [ 5,0,0,0,0,0 ];
  test.identical( got, expected );

  test.description = 'decrease size of array';

  /**/

  got = _.arrayGrow( array, 0, 3 );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* setting value not affects on array */

  got = _.arrayGrow( array, 0, 3, 0 );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* begin index is negative */

  got = _.arrayGrow( array, -1, 3 );
  expected = [ undefined,1,2,3 ];
  test.identical( got, expected );

  /* end index is negative */

  got = _.arrayGrow( array, 0, -1 );
  expected = [];
  test.identical( got, expected );

  /* begin index negative, set value */

  got = _.arrayGrow( array, -1, 3, 0 );
  expected = [ 0, 1,2,3 ];
  test.identical( got, expected );

  //

  if( !isBrowser )
  {
    test.description = 'buffer';
    got = _.arrayGrow( new Buffer( '123' ), 0, 5, 0 );
    expected = [ 49, 50, 51, 0, 0 ];
    test.identical( got, expected );
  }

  //

  if( !Config.debug )
  return;

  test.description = 'invalid arguments type';

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayGrow( 1 );
  })

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayGrow( array, '1', array.length )
  })

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayGrow( array, 0, '1' )
  })

}

function arrayResize( test )
{
  var got,expected;

  test.description = 'defaults';
  var array = [ 1, 2, 3, 4, 5, 6, 7 ];
  array.src = true;

  /* just pass array */

  got = _.arrayResize( array );
  test.identical( got.src, undefined );
  test.identical( got, array );

  //

  test.description = 'make copy of source';

  /* third argument is not provided */

  got = _.arrayResize( array, 2 );
  test.identical( got.src, undefined );
  expected = [ 3, 4, 5, 6, 7 ];
  test.identical( got, expected );

  /* second argument is undefined */

  got = _.arrayResize( array, undefined, 4  );
  test.identical( got.src, undefined );
  expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );

  /**/

  got = _.arrayResize( array, 0, 3 );
  test.identical( got.src, undefined );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* from two to six */

  test.description = 'from two to six';
  got = _.arrayResize( array, 2, 6 );
  test.identical( got.src, undefined );
  expected = [ 3, 4, 5, 6 ];
  test.identical( got, expected );

  /* rigth bound is negative */

  got = _.arrayResize( array, 0, -1 );
  test.identical( got.src, undefined );
  expected = [];
  test.identical( got, expected );

  /* both bounds are negative */

  got = _.arrayResize( array, -1, -3 );
  test.identical( got.src, undefined );
  expected = [];
  test.identical( got, expected );

  /* TypedArray */

  var arr = new Uint16Array( array );
  arr.src = true;
  got = _.arrayResize( arr, 0, 3 );
  test.identical( got.src, undefined );
  expected = new Uint16Array([ 1, 2, 3 ]);
  test.identical( got, expected );

  /* Buffer */

  if( !isBrowser )
  {
    test.description = 'buffer';
    got = _.arrayResize( new Buffer( '123' ), 0, 5, 0 );
    expected = [ 49, 50, 51, 0, 0 ];
    test.identical( got, expected );
  }

  /**/

  test.description = 'increase size of array';

  /* rigth bound is out of range */

  got = _.arrayResize( array, 0, array.length + 2 );
  test.identical( got.src, undefined );
  expected = array.slice();
  expected.push( undefined,undefined );
  test.identical( got, expected );

  /* indexes are out of bound */

  got = _.arrayResize( array, array.length + 1, array.length + 3 );
  test.identical( got.src, undefined );
  expected = [ undefined, undefined ];
  test.identical( got, expected );

  /* left bound is negative */

  got = _.arrayResize( array, -1, array.length );
  test.identical( got.src, undefined );
  expected = array.slice();
  expected.unshift( undefined );
  test.identical( got, expected );

  /* without setting value */

  got = _.arrayResize( array, 0, array.length + 2 );
  test.identical( got.src, undefined );
  test.identical( got.length, array.length + 2 );

  /* by setting value */

  got = _.arrayResize( array, 0, array.length + 2, 0 );
  test.identical( got.src, undefined );
  expected = [ 1,2,3,4,5,6,7,0,0 ];
  test.identical( got, expected );

  /* by taking only last element of source array */

  got = _.arrayResize( array, array.length - 1, array.length + 2, 0 );
  test.identical( got.src, undefined );
  expected = [ 7, 0, 0 ];
  test.identical( got, expected );

  test.description = 'decrease size of array';

  /* setting value not affects on array */

  got = _.arrayResize( array, 0, 3, 0 );
  test.identical( got.src, undefined );
  expected = [ 1,2,3 ];
  test.identical( got, expected );

  /* begin index is negative */

  got = _.arrayResize( array, -1, 3, 0 );
  test.identical( got.src, undefined );
  expected = [ 0,1,2,3 ];
  test.identical( got, expected );

  /* end index is negative */

  got = _.arrayResize( array, 0, -1 );
  test.identical( got.src, undefined );
  expected = [];
  test.identical( got, expected );

  /* begin index negative, set value */

  got = _.arrayResize( array, -1, 3, 0 );
  test.identical( got.src, undefined );
  expected = [ 0, 1,2,3 ];
  test.identical( got, expected );

  /* TypedArray */

  var arr = new Uint16Array( array );
  arr.src = true;
  got = _.arrayResize( arr, 0, 4, 4 );
  test.identical( got.src, undefined );
  expected = new Uint16Array([ 1, 2, 3, 4 ]);
  test.identical( got, expected );

  //

  if( !isBrowser )
  {
    test.description = 'buffer';
    got = _.arrayResize( new Buffer( '123' ), 0, 5, 0 );
    expected = [ 49, 50, 51, 0, 0 ];
    test.identical( got, expected );
  }

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayResize();
  });

  /**/

  test.description = 'invalid arguments type';

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayResize( 1 );
  })

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayResize( array, '1', array.length )
  })

  /**/

  test.shouldThrowErrorSync( function()
  {
    _.arrayResize( array, 0, '1' )
  })

  /**/

  test.description = 'buffer';

  /**/

  got = _.arrayResize( new Buffer( '123' ), 0, 1 );
  expected = [ 49 ];
  test.identical( got, expected );

  //

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayResize( 'wrong argument', 'wrong argument', 'wrong argument' );
  });

};

//

function arraySlice( test )
{
  var got,expected;

  debugger

  //

  test.description = 'defaults';
  var array = [ 1, 2, 3, 4, 5, 6, 7 ];

  /*nothing*/

  var src = [  ];
  got = _.arraySlice( src );
  expected = [  ];
  test.identical( got, expected );
  test.shouldBe( src !== got );

  var src = [  ];
  got = _.arraySlice( src, 0 );
  expected = [  ];
  test.identical( got, expected );
  test.shouldBe( src !== got );

  var src = [  ];
  got = _.arraySlice( src, 0, 5 );
  expected = [  ];
  test.identical( got, expected );
  test.shouldBe( src !== got );

  /*just pass array*/

  got = _.arraySlice( array );
  expected = array;
  test.identical( got, expected );
  test.shouldBe( array !== got );

  //

  test.description = 'make copy of source';

  got = _.arraySlice( array, 0 );
  expected = [ 1, 2, 3, 4, 5, 6, 7 ];
  test.identical( got, expected );
  test.shouldBe( array !== got );

  got = _.arraySlice( array, -1 );
  expected = [ 1, 2, 3, 4, 5, 6, 7 ];
  test.identical( got, expected );

  /* third argument is not provided */

  got = _.arraySlice( array, 2 );
  expected = [ 3, 4, 5, 6, 7 ];
  test.identical( got, expected );

  /* second argument is undefined */

  got = _.arraySlice( array, undefined, 4  );
  expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );

  /* from two to six */

  test.description = 'from two to six';
  got = _.arraySlice( array, 2, 6 );
  expected = [ 3, 4, 5, 6 ];
  test.identical( got, expected );

  /* indexes are out of bound */

  got = _.arraySlice( [ 1,2,3 ], 5, 8 );
  expected = [];
  test.identical( got, expected );

  /* left bound is negative */

  got = _.arraySlice( array, -1, array.length );
  expected = array;
  test.identical( got, expected );
  test.shouldBe( array !== got );

  /* rigth bound is negative */

  got = _.arraySlice( array, 0, -1 );
  expected = [];
  test.identical( got, expected );
  test.shouldBe( array !== got );

  /* rigth bound is out of range */

  got = _.arraySlice( array, 0, array.length + 2 );
  expected = array;
  test.identical( got, expected );
  test.shouldBe( array !== got );

  /* typed */

  test.description = 'make copy of typed array';

  var typed = new Uint8Array( array );

  got = _.arraySlice( typed );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got !== typed );
  test.identical( got, typed );

  got = _.arraySlice( typed, 0 );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got !== typed );
  test.identical( got, typed );

  got = _.arraySlice( typed, -1 );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got !== typed );
  test.identical( got, typed );

  got = _.arraySlice( typed, 0, 1 );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got !== typed );
  test.shouldBe( _.arraySetIdentical( got, [ 1 ] ) );

  got = _.arraySlice( typed, typed.length, typed.length );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got !== typed );
  test.shouldBe( _.arraySetIdentical( got, [] ) );

  got = _.arraySlice( typed, -1, typed.length + 1 );
  test.shouldBe( _.bufferTypedIs( got ) );
  test.shouldBe( got !== typed );
  test.identical( got, typed );

  /**/

  if( !Config.debug )
  return;

  test.description = 'buffer';

  /**/

  got = _.arraySlice( new Buffer( '123' ), 0, 1 );
  expected = [ 49 ];
  test.identical( got, expected );

  //

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySlice();
  });

  //

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arraySlice( 'x' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arraySlice( [ 1 ], 'x', 1 );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arraySlice( [ 1 ], 0, 'x' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    var array = new ArrayBuffer();
    _.arraySlice( array );
  });

};

//

function arrayDuplicate( test )
{
  test.description = 'couple of repeats';
  var got = _.arrayDuplicate( [ 'a', 'b', 'c' ] );
  var expected = [ 'a', 'a', 'b', 'b', 'c', 'c' ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 1 numberOfDuplicatesPerElement 1';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 1 numberOfDuplicatesPerElement 2';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 2
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,10,20,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 2 numberOfDuplicatesPerElement 1';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 2,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'numberOfAtomsPerElement 2 numberOfDuplicatesPerElement 2';
  var options =
  {
    src : [ 10,20 ],
    numberOfAtomsPerElement : 2,
    numberOfDuplicatesPerElement : 2
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,20,10,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'result provided';
  var options =
  {
    src : [ 10,20 ],
    result : [ 1,1,1,1 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 2
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 10,10,20,20 ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var options =
  {
    src : [ 'abc', 'def' ],
    result : new Array( 6 ),
    numberOfAtomsPerElement : 2,
    numberOfDuplicatesPerElement : 3
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var options =
  {
    src : [ 'abc', 'def' ],
    result : [],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 'abc', 'def',  ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var options =
  {
    src : [ 'abc', 'def' ],
    result : [ 1, 2 ],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 1, 2, 'abc', 'def',  ];
  test.identical( got, expected );

  /* */

  test.description = 'different options';
  var arr = new Uint8Array( 1 );
  arr[ 0 ] = 5;
  var options =
  {
    src : [ 1, 2 ],
    result : arr,
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 1
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 5, 1, 2 ];
  var equal = true;
  for( var i = 0; i < expected.length; i++ )
  {
    if( expected[ i ] !== got[ i ]  )
    equal = false;
  }
  test.shouldBe( equal );
  test.identical( got.length, expected.length );

  /* */

  test.description = 'second argument is replaced and non-existent elements from options.src is replaced undefined';
  var options = {
    src : [ 'abc', 'def', undefined ],
    numberOfAtomsPerElement : 3,
    numberOfDuplicatesPerElement : 3
  };
  var got = _.arrayDuplicate( options );
  var expected = [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayDuplicate();
  });

  test.description = 'second argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayDuplicate( [ 'a', 'b', 'c' ], 'wrong argument' );
  });

  test.description = 'options.src is not provided or "undefined"';
  var options = {
    src : undefined,
    result : [  ],
    numberOfAtomsPerElement : 3,
    numberOfDuplicatesPerElement : 3
  };
  test.shouldThrowError( function()
  {
    _.arrayDuplicate( options, { a : 13 } );
  });

  test.description = 'result provided, but not enough length';
  var options =
  {
    src : [ 10,20 ],
    result : [],
    numberOfAtomsPerElement : 1,
    numberOfDuplicatesPerElement : 2
  };
  test.shouldThrowError( function ()
  {
    _.arrayDuplicate( options );
  })


};

//

function arrayMask( test )
{

  test.description = 'nothing';
  var got = _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0, '' ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'adds last three values';
  var got = _.arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ] );
  var expected = [ "c", 4, 5 ];
  test.identical( got, expected );

  test.description = 'adds the certain values';
  var got = _.arrayMask( [ 'a', 'b', 'c', 4, 5, 'd' ], [ 3, 7, 0, '', 13, 33 ] );
  var expected = [ "a", 'b', 5, 'd' ];
  test.identical( got, expected );

  /**/


  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayMask();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayMask( [ 1, 2, 3, 4 ] );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ], 'redundant argument' );
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arrayMask( 'wrong argument', 'wrong argument' );
  });

  test.description = 'both arrays are empty';
  test.shouldThrowError( function()
  {
    _.arrayMask( [  ], [  ] );
  });

  test.description = 'length of the first array is not equal to the second array';
  test.shouldThrowError( function()
  {
    _.arrayMask( [ 1, 2, 3 ], [ undefined, null, 0, '' ] );
  });

  test.description = 'length of the second array is not equal to the first array';
  test.shouldThrowError( function()
  {
    _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0 ] );
  });

};

//

function arraySelect( test )
{

  test.description = 'nothing';
  var got = _.arraySelect( [  ], [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'certain elements';
  var got = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
  var expected = [ 3, 4, 5 ];
  test.identical( got, expected );

  test.description = 'array of undefined';
  var got = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
  var expected = [ undefined, undefined ];
  test.identical( got, expected );

  test.description = 'using object';
  var src = [ 1, 1, 2, 2, 3, 3 ];
  var indices = { atomsPerElement : 2, indices : [ 0, 1, 2 ] }
  var got = _.arraySelect( src,indices );
  var expected = [ 1, 1, 2, 2, 3, 3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySelect();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arraySelect( [ 1, 2, 3 ] );
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arraySelect('wrong argument', 'wrong argument');
  });

  test.description = 'arguments are not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arraySelect( 1, 2, 3, 4, 5 );
  });

};

//

function arraySwap( test )
{

  test.description = 'an element';
  var got = _.arraySwap( [ 7 ], 0, 0 );
  var expected = [ 7 ];
  test.identical( got, expected );

  test.description = 'reverses first index and last index';
  var got = _.arraySwap( [ 1, 2, 3, 4, 5 ], 0, 4  );
  var expected = [ 5, 2, 3, 4, 1 ];
  test.identical( got, expected );

  test.description = 'swaps first two';
  var got = _.arraySwap( [ 1, 2, 3 ] );
  var expected = [ 2,1,3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySwap();
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arraySwap('wrong argument', 'wrong argument', 'wrong argument');
  });

  test.description = 'arguments[1] and arguments[2] are out of bound';
  test.shouldThrowError( function()
  {
    _.arraySwap( [ 1, 2, 3, 4, 5 ], -1, -4 );
  });

  test.description = 'first five arguments are not wrapped into array';
  test.shouldThrowError( function()
  {
    _.arraySwap( 1, 2, 3, 4, 5, 0, 4 );
  });

};

//

function arrayCutin( test )
{

  debugger;

  test.description = 'range as single number';

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 2 );
  var expected = [ 3 ];
  test.identical( got, expected );
  test.identical( dst, [ 1, 2, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, -1 );
  var expected = [];
  test.identical( got, expected );
  test.identical( dst, [ 1, 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 0, [ 0 ] );
  var expected = [ 1 ];
  test.identical( got, expected );
  test.identical( dst, [ 0, 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, 0, [] );
  var expected = [ 1 ];
  test.identical( got, expected );
  test.identical( dst, [ 2, 3, 4 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, [ 0 ], [] );
  var expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );
  test.identical( dst, [] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var expected = dst.slice().splice( 1 );
  var got = _.arrayCutin( dst, [ 1 ], [ 5 ] );
  test.identical( got, expected );
  test.identical( dst, [ 1, 5 ] )

  /* */

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayCutin( dst, [ undefined, 1 ], [ 5 ] );
  test.identical( got, [ 1 ] );
  test.identical( dst, [ 5, 2, 3, 4 ] );

  //

  test.description = 'empth';
  var dst = [];
  var cut = _.arrayCutin( [],[],[] );
  test.identical( cut, [] );
  test.identical( dst, [] );

  /* */

  test.description = 'remove two elements';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ], [] );
  var expected = [ 1, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'remove two elements and incut three';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ], [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'pass only begin of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1 ], [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 2, 3, 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'pass empty range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [], [ 11, 22, 33 ] );
  var expected = [ 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 1, 2, 3, 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'pass number instead of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, 1, [ 11, 22, 33 ] );
  var expected = [ 1, 11, 22, 33, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'no source, number istead of range';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, 1 );
  var expected = [ 1, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'no source';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 1, 3 ] );
  var expected = [ 1, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 2, 3 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, begin';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -10,2 ],[ 11, 22, 33 ] );
  var expected = [ 11, 22, 33, 3, 4, 5 ];
  test.identical( dst, expected );
  var expected = [ 1, 2 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, end';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 3,10 ],[ 11, 22, 33 ] );
  var expected = [ 1, 2, 3, 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'out of bound, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -10,10 ],[ 11, 22, 33 ] );
  var expected = [ 11, 22, 33 ];
  test.identical( dst, expected );
  var expected = [ 1, 2, 3, 4, 5 ];
  test.identical( cut, expected );

  /* */

  test.description = 'negative, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ -1, -1 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* */

  test.description = 'zero, both sides';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 0, 0 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* first > last */

  test.description = 'first > last';
  var dst = [ 1, 2, 3, 4, 5 ];
  var cut = _.arrayCutin( dst, [ 9, 0 ],[ 11, 22, 33 ] );
  var expected = dst;
  test.identical( dst, expected );
  var expected = [ ];
  test.identical( cut, expected );

  /* Buffers */

  var list =
  [
    Int8Array,
    Uint8Array,
    Uint8ClampedArray,
    Int16Array,
    Uint16Array,
    Int32Array,
    Uint32Array,
    Float32Array,
    Float64Array,
    ArrayBuffer
  ];

  if( !isBrowser )
  list.push( Buffer );

  for( var i = 0; i < list.length; i++ )
  {
    test.description = 'buffers: ' + list[ i ].name;

    var array = new list[ i ]( 5 );
    for( var j = 0; j < 5; j++ )
    array[ j ] = j + 1;

    //array [ 1,2,3,4,5 ]

    /* simple cut */

    var got = _.arrayCutin( array, 0 );
    var expected = [ 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* simple cut, add one element to begin */

    var got = _.arrayCutin( array, 0, [ 9 ] );
    var expected = [ 9, 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* simple cut */

    var got = _.arrayCutin( array, 4 );
    var expected = [ 1, 2, 3, 4 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range */

    var got = _.arrayCutin( array, [ 0, 1 ] );
    var expected = [ 2, 3, 4, 5 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range */

    var got = _.arrayCutin( array, [ 2, 5 ] );
    var expected = [ 1, 2 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* single, add new elements to end */

    var got = _.arrayCutin( array, 4, [ 6, 7 ] );
    var expected = [ 1, 2, 3, 4, 6, 7 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* range, add new elements to end */

    var got = _.arrayCutin( array, [ 4, 5 ], [ 6, 7 ] );
    var expected = [ 1, 2, 3, 4, 6, 7 ];
    expected = _.arrayCutin( new list[ i ]( 1 ), 0, expected );
    test.identical( got,expected );

    /* out of range, returns original */

    var got = _.arrayCutin( array, 10, [ 6, 7 ] );
    var expected = array;
    test.identical( got,expected );

    /* remove all, last index is out of range */

    var got = _.arrayCutin( array, [ 0, 99 ] );
    var expected = new list[ i ]( 0 );
    test.identical( got.byteLength,expected.byteLength );

    /* remove all and fill with new values */

    var got = _.arrayCutin( array, [ 0, 99 ], [ 1, 2, 3, 4, 5 ] );
    var expected = array;
    test.identical( got,expected );

    /* negative */

    var got = _.arrayCutin( array, [ 0, -1 ] );
    var expected = array;
    test.identical( got,expected );

    /* negative */

    var got = _.arrayCutin( array, [ -1, -1 ] );
    var expected = array;
    test.identical( got,expected );

    /* zero, returns original */

    var got = _.arrayCutin( array, [ 0, 0 ], [ 1 ] );
    var expected = array;
    test.identical( got,expected );

    /* empty */

    var got = _.arrayCutin( array, [], [] );
    got = _.definedIs( got.length ) ? got.length : got.byteLength;
    test.identical( got, 0 );

  }

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayCutin();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayCutin( [ 1, 2, 3, 4, 5 ] );
  });

  test.description = 'redundant argument';
  test.shouldThrowError( function()
  {
    _.arrayCutin( [ 1, 'a', 'b', 'c', 5 ], [ 2, 3, 4 ], 1, 3, 'redundant argument' );
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arrayCutin( 'wrong argument', 'wrong argument', 'wrong argument', 'wrong argument' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.arrayCutin( [],[ 'x' ],3 );
  });
};

//

function arrayPut( test )
{

  test.description = 'adds after second element';
  var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
  var expected = [ 1, 2, 'str', true, 7, 8, 9 ];
  test.identical( got, expected );

  test.description = 'adds at the beginning';
  var got = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
  var expected = [ 'str', true, 7, 8, 5, 6, 9 ];
  test.identical( got, expected );

  test.description = 'add to end';
  var got = _.arrayPut( [ 1,2,3 ], 3, 4, 5, 6 );
  var expected = [ 1, 2, 3, 4, 5, 6 ];
  test.identical( got, expected );

  test.description = 'offset is negative';
  var got = _.arrayPut( [ 1,2,3 ], -1, 4, 5, 6 );
  var expected = [ 5, 6, 3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPut();
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arrayPut( 'wrong argument', 'wrong argument', 'str', true, [ 7, 8 ] );
  });

};

//

function arrayFillTimes( test )
{
  test.description = 'empty array';
  var got = _.arrayFillTimes( [], 1 );
  var expected = [ 0 ];
  test.identical( got, expected );

  test.description = 'times is negative, times = length + times';
  var got = _.arrayFillTimes( [ 0, 0, 0 ], -1, 1 );
  var expected = [ 1, 1, 0 ];
  test.identical( got, expected );

  test.description = 'times is negative';
  var got = _.arrayFillTimes( [ 0, 0 ], -2, 1 );
  var expected = [ 0, 0 ];
  test.identical( got, expected );

  test.description = 'empty array, value passed';
  var got = _.arrayFillTimes( [], 1, 1 );
  var expected = [ 1 ];
  test.identical( got, expected );

  test.description = 'empty array, value is an array';
  var got = _.arrayFillTimes( [], 1, [ 1, 2, 3 ] );
  var expected = [ [ 1, 2, 3 ]];
  test.identical( got, expected );

  test.description = 'times > array.length';
  var got = _.arrayFillTimes( [ 0 ], 3, 1 );
  var expected = [ 1, 1, 1 ];
  test.identical( got, expected );

  test.description = 'times < array.length';
  var got = _.arrayFillTimes( [ 0, 0, 0 ], 1, 1 );
  var expected = [ 1, 0, 0 ];
  test.identical( got, expected );

  test.description = 'TypedArray';
  var arr = new Uint16Array();
  var got = _.arrayFillTimes( arr, 3, 1 );
  var expected = new Uint16Array( [ 1, 1, 1 ] );
  test.identical( got, expected );

  test.description = 'ArrayLike without fill routine';
  var arr = (() => arguments )( 1 );
  var got = _.arrayFillTimes( arr, 3, 1 );
  var expected = [ 1, 1, 1 ];
  test.identical( got, expected );

  test.description = 'no fill routine, times is negative';
  var arr = [ 1, 1, 1 ];
  arr.fill = null;
  var got = _.arrayFillTimes( arr, -1, 3 );
  var expected = [ 3, 3, 1 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayFillTimes();

  });

  test.description = 'zero';
  test.shouldThrowError( function()
  {
    _.arrayFillTimes( 0 );
  });

  test.description = 'only one argument';
  test.shouldThrowError( function()
  {
    _.arrayFillTimes( [  ] );
  });

  test.description = 'wrong argument type';
  test.shouldThrowError( function()
  {
    _.arrayFillTimes( new ArrayBuffer(), 1 );
  });

};

function arrayFillWhole( test )
{
  test.description = 'empty array';
  var got = _.arrayFillWhole( [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'empty array, value passed';
  var got = _.arrayFillWhole( [], 1 );
  var expected = [];
  test.identical( got, expected );

  test.description = 'array with elements';
  var got = _.arrayFillWhole( [ 1, 1, 1 ] );
  var expected = [ 0, 0, 0 ];
  test.identical( got, expected );

  test.description = 'array with elements';
  var got = _.arrayFillWhole( [ 1, 1, 1 ], 5 );
  var expected = [ 5, 5, 5 ];
  test.identical( got, expected );

  test.description = 'array with elements';
  var arr = [];
  arr.length = 3;
  var got = _.arrayFillWhole( arr, 5 );
  var expected = [ 5, 5, 5 ];
  test.identical( got, expected );

  test.description = 'TypedArray';
  var arr = new Uint16Array( 3 );
  var got = _.arrayFillWhole( arr );
  var expected = new Uint16Array( [ 0, 0, 0 ] );
  test.identical( got, expected );

  test.description = 'no fill routine';
  var arr = [ 1, 1, 1 ];
  arr.fill = null;
  var got = _.arrayFillWhole( arr, 2 );
  var expected = [ 2, 2, 2 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayFillWhole();

  });

  test.description = 'wrong argument type';
  test.shouldThrowError( function()
  {
    _.arrayFillTimes( new ArrayBuffer(), 1 );
  });

};

//

function arraySupplement( test )
{

  test.description = 'nothing';
  var got = _.arraySupplement( [  ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'only numbers';
  var got = _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
  var expected = [ 4, 5, 33, 13, 9, 7 ];
  test.identical( got, expected );

  test.description = 'only numbers and undefined';
  var got = _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
  var expected = [ 4, 5, 33, 13, undefined, 7 ];
  test.identical( got, expected );

  test.description = 'only numbers';
  var got = _.arraySupplement( [ 'a', 'b' ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
  var expected = [ 6, 7, 33, 13, 9, 7 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySupplement();
  });

  test.description = 'arguments are wrong';
  test.shouldThrowError( function()
  {
    _.arraySupplement( 'wrong argument', 'wrong arguments' );
  });

};

//

function arrayExtendScreening( test )
{

  test.description = 'returns an empty array';
  var got = _.arrayExtendScreening( [  ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'returns the corresponding values by indexes of the first argument';
  var got = _.arrayExtendScreening( [ 1, 2, 3 ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
  var expected = [ 5, 6, 2 ];
  test.identical( got, expected );

  test.description = 'creates a new array and returns the corresponding values by indexes of the first argument';
  var got = _.arrayExtendScreening( [ 1, 2, 3 ], null, [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
  var expected = [ 5, 6, 2 ];
  test.identical( got, expected );

  test.description = 'returns the corresponding values by indexes of the first argument';
  var got = _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
  var expected = [ 'a', 6, 2, 13 ];
  test.identical( got, expected );

  test.description = 'returns the second argument';
  var got = _.arrayExtendScreening( [  ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
  var expected = [ 3, 'abc', 7, 13 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayExtendScreening();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayExtendScreening( [ 1, 2, 3, 'abc', 13 ] );
  });

  test.description = 'next arguments are wrong';
  test.shouldThrowError( function()
  {
    _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 3, 7 ], 'wrong arguments' );
  });

  test.description = 'arguments are wrong';
  test.shouldThrowError( function()
  {
    _.arrayExtendScreening( 'wrong argument', 'wrong argument', 'wrong arguments' );
  });

};

//

function arrayLeftIndexOf( test )
{

  test.description = 'nothing';
  var got = _.arrayLeftIndexOf( [  ], 3 );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'second index';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3 );
  var expected = 2;
  test.identical( got, expected );

  test.description = 'zero index';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3, function( el, ins ) { return el < ins } );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'nothing';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 4 );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'nothing';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ], 3, function( el, ins ) { return el > ins } );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'array-like arguments';
  function arr()
  {
    return arguments;
  }
  var _arr = arr( 3, 7, 13 );
  var got = _.arrayLeftIndexOf( _arr, 13 );
  var expected = 2;
  test.identical( got, expected );

  test.description = 'fifth index';
  var got = _.arrayLeftIndexOf( 'abcdef', 'e', function( el, ins ) { return el > ins } );
  var expected = 5;
  test.identical( got, expected );

  test.description = 'third index';
  var got = _.arrayLeftIndexOf( 'abcdef', 'd' );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'second index';
  var got = _.arrayLeftIndexOf( 'abcdef', 'c', function( el ) { return el; } );
  var expected = 2;
  test.identical( got, expected );

  test.description = 'one argument';
  var got = _.arrayLeftIndexOf( [ 1, 2, 3 ] );
  test.identical( got, -1 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayLeftIndexOf();
  });

  test.description = 'third argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayLeftIndexOf( [ 1, 2, 3 ], 2, 'wrong argument' );
  });

};

//

function arrayLeft( test )
{

  test.description = 'returns an object';
  var got = _.arrayLeft( [ 1, 2, 3, 4, 5 ], 3 );
  var expected = { index : 2, element : 3 };
  test.identical( got, expected );

  test.description = 'returns an object';
  var got = _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
  var expected = { index : 3, element : 'str' };
  test.identical( got, expected );

  test.description = 'returns an object';
  var got = _.arrayLeft( [ 1, 2, false, 'str', 5 ], 5, function( a ) { return a; } );
  var expected = { index : 4, element : 5 };
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayLeft();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayLeft( [] );
  });

  test.description = 'third argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayLeft( [ 1, 2, 3 ], 2, 'wrong argument' );
  });

};

//

function arrayCount( test )
{

  test.description = 'nothing';
  var got = _.arrayCount( [  ], 3 );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'two matching';
  var got = _.arrayCount( [ 1, 2, 'str', 10, 10, true ], 10 );
  var expected = 2;
  test.identical( got, expected );

  test.description = 'arrayLike';
  var src = [ 1, 2, 3 ];
  src[ 'a' ] = 1;
  var got = _.arrayCount( src, 1 );
  var expected = 1;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayCount();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayCount( [ 1, 2, 3, 'abc', 13 ] );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayCount( [ 1, 2, 3, true ], true, 'redundant argument' );
  });

  test.description = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayCount( 'wrong argument', true );
  });

};

//

function arrayCountUnique( test )
{

  test.description = 'nothing';
  var got = _.arrayCountUnique( [  ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'nothing';
  var got = _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'three pairs';
  var got = _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
  var expected = 3;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique();
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], function( e ) { return e }, 'redundant argument' );
  });

  test.description = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique( 'wrong argument', function( e ) { return e } );
  });

  test.description = 'second argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ], 'wrong argument' );
  });

};

//

function arrayCompare( test )
{

  test.description = 'empty arrays';
  var got = _.arrayCompare( [  ], [  ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'first array is empty';
  var got = _.arrayCompare( [  ], [ 1, 2 ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'length of the first array is less than second';
  var got = _.arrayCompare( [ 4 ], [ 1, 2 ] );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'arrays are equal';
  var got = _.arrayCompare( [ 1, 5 ], [ 1, 5 ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'a difference';
  var got = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'a negative difference';
  var got = _.arrayCompare( [ 1, 5 ], [ 1, 6 ] );
  var expected = -1;
  test.identical( got, expected );

  test.description = 'array-like arguments';
  var src1 = function src1() {
    return arguments;
  }( 1, 5 );
  var src2 = function src2() {
    return arguments;
  }( 1, 2 );
  var got = _.arrayCompare( src1, src2 );
  var expected = 3;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayCompare();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayCompare( [ 1, 5 ] );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayCompare( [ 1, 5 ], [ 1, 2 ], 'redundant argument' );
  });

  test.description = 'wrong type of arguments';
  test.shouldThrowError( function()
  {
    _.arrayCompare( 'wrong argument', 'wrong argument' );
  });

  test.description = 'second array is empty';
  test.shouldThrowError( function()
  {
    _.arrayCompare( [ 1, 5 ], [  ] );
  });

  test.description = 'length of the second array is less than first';
  test.shouldThrowError( function()
  {
    _.arrayCompare( [ 1, 5 ], [ 1 ] );
  });

};

//

function arrayIdentical( test )
{

  test.description = 'empty arrays';
  var got = _.arrayIdentical( [  ], [  ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'arrays are equal';
  var got = _.arrayIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
  var expected = true;
  test.identical( got, expected );

  test.description = 'array-like arguments';
  function src1() {
    return arguments;
  };
  function src2() {
    return arguments;
  };
  var got = _.arrayIdentical( src1( 3, 7, 33 ), src2( 3, 7, 13 ) );
  var expected = false;
  test.identical( got, expected );

  test.description = 'arrays are not equal';
  var got = _.arrayIdentical( [ 1, 2, 3, 'Hi!' ], [ 1, 2, 3, 'Hello there!' ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'arrays length are not equal';
  var got = _.arrayIdentical( [ 1, 2, 3 ], [ 1, 2 ] );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayIdentical();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayIdentical( [ 1, 2, 3 ] );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayIdentical( [ 1, 2, 3 ], [ 1, 2 ], 'redundant argument' );
  });

};

//

function arrayHasAny( test )
{

  test.description = 'false';
  var got = _.arrayHasAny( [  ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'false';
  var got = _.arrayHasAny( [  ], false, 7 );
  var expected = false;
  test.identical( got, expected );

  test.description = 'true';
  var got = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
  var expected = true;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayHasAny();
  });

  test.description = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.arrayHasAny( 'wrong argument', false, 7 );
  });

};

//

function arraySum( test )
{

  test.description = 'nothing';
  var got = _.arraySum( [  ] );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'returns sum';
  var got = _.arraySum( [ 1, 2, 3, 4, 5 ] );
  var expected = 15;
  test.identical( got, expected );

  test.description = 'returns sum';
  var got = _.arraySum( [ true, false, 13, '33' ], function( e ) { return e * 2 } );
  var expected = 94;
  test.identical( got, expected );

  test.description = 'converts and returns sum';
  var got = _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 } );
  var expected = 30;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySum();
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 }, 'redundant argument' );
  });

  test.description = 'first argument is wrong';
  test.shouldThrowError( function()
  {
    _.arraySum( 'wrong argument', function( e ) { return e / 2 } );
  });

  test.description = 'second argument is wrong';
  test.shouldThrowError( function()
  {
    _.arraySum( [ 1, 2, 3, 4, 5 ], 'wrong argument' );
  });

};

// ---
// array transformation
// ---

function arrayPrepend( test )
{
  test.description = 'simple';

  var got = _.arrayPrepend( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayPrepend( [ 1 ], 1 );
  test.identical( got, [ 1, 1 ] );

  var got = _.arrayPrepend( [ 1 ], 2 );
  test.identical( got, [ 2, 1 ] );

  var got = _.arrayPrepend( [ 1,2,3 ], 3 );
  test.identical( got, [ 3,1,2,3 ] );

  var got = _.arrayPrepend( [ 1 ], '1' );
  test.identical( got, [ '1', 1 ] );

  var got = _.arrayPrepend( [ 1 ], -1 );
  test.identical( got, [ -1, 1 ] );

  var got = _.arrayPrepend( [ 1 ], [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayPrepend();
  })

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrepend( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayPrepend( 1, 1 );
  })
}

//

function arrayPrependOnce( test )
{
  test.description = 'simple';

  var got = _.arrayPrependOnce( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayPrependOnce( [ 1 ], 1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayPrependOnce( [ 1 ], 2 );
  test.identical( got, [ 2, 1 ] );

  var got = _.arrayPrependOnce( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.arrayPrependOnce( [ 1 ], '1' );
  test.identical( got, [ '1', 1 ] );

  var got = _.arrayPrependOnce( [ 1 ], -1 );
  test.identical( got, [ -1, 1 ] );

  var got = _.arrayPrependOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayPrependOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayPrependOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayPrependOnce( dst, 4, onEqualize );
  test.identical( got, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayPrependOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayPrependOnce();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayPrependOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.arrayPrependOnce( 1, 1, 1 );
  })

}

//

//
// function _arrayPrependOnce( test )
// {
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [  ], 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
//   var expected = [ 5, 1, 2, 3, 4 ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//   var expected = [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayPrependOnce( 'wrong argument', 5 );
//     });
//
//   }
//
// };

//

function arrayPrependOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependOnceStrictly( dst , 1 );
  test.identical( got, [ 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayPrependOnceStrictly( dst, 2 );
  test.identical( got, [ 2, 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayPrependOnceStrictly( dst, '1' );
  test.identical( got, [ '1', 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayPrependOnceStrictly( dst, -1 );
  test.identical( got, [ -1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayPrependOnceStrictly( dst, [ 1 ] );
  test.identical( got, [ [ 1 ], 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayPrependOnceStrictly( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayPrependOnceStrictly( dst, 4, onEqualize );
  test.identical( got, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayPrependOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayPrependOnceStrictly( 1, 1 );
  })

  test.description = 'ins already exists ion dst';

  test.shouldThrowError( function()
  {
    _.arrayPrependOnceStrictly( [ 1 ], 1 );
  });

  test.shouldThrowError( function()
  {
     _.arrayPrependOnceStrictly( [ 1,2,3 ], 3 );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
     _.arrayPrependOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.arrayPrependOnceStrictly( dst, { num : 1 }, onEqualize );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.arrayPrependOnceStrictly( dst, 1, onEqualize );
  });

}

//

function arrayPrepended( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrepended( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrepended( dst, 1 );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrepended( dst, 2 );
  test.identical( dst, [ 2, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1,2,3 ];
  var got = _.arrayPrepended( dst, 3 );
  test.identical( dst, [ 3,1,2,3 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrepended( dst, '1' );
  test.identical( dst, [ '1', 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrepended( dst, -1 );
  test.identical( dst, [ -1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrepended( dst, [ 1 ] );
  test.identical( dst, [ [ 1 ], 1 ] );
  test.identical( got, 0 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayPrepended();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrepended( [], 1, 1 );
  });

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayPrepended( 1, 1 );
  });
}

//

function arrayPrependedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrependedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayPrependedOnce( dst, 2 );
  test.identical( dst, [ 2, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1,2,3 ];
  var got = _.arrayPrependedOnce( dst, 3 );
  test.identical( dst, [ 1,2,3 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayPrependedOnce( dst, '1' );
  test.identical( dst, [ '1', 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrependedOnce( dst, -1 );
  test.identical( dst, [ -1, 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayPrependedOnce( dst, [ 1 ] );
  test.identical( dst, [ [ 1 ], 1 ] );
  test.identical( got, 0 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayPrependedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 4 },{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayPrependedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayPrependedOnce( dst, 4, onEqualize );
  test.identical( dst, [ 4,{ num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayPrependedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayPrependedOnce();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayPrependedOnce( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayPrependedOnce( 1, 1 );
  })
}

//

function arrayPrependArray( test )
{

  test.description = 'nothing';
  var got = _.arrayPrependArray( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayPrependArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayPrependArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependArray( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayPrependArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  'a', 1, [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayPrependArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrependArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependArray( [ 1, 2 ], 2 );
  });
};

//

function arrayPrependArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.arrayPrependArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayPrependArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayPrependArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayPrependArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });
}

//

/*function _arrayPrependArrayOnce( test )
{

  test.description = 'array';
  var got = _._arrayPrependArrayOnce([ 0,1 ], [ 2,3 ]);
  var expected = [ 2,3,0,1 ];
  test.identical( got,expected );

  test.description = 'nothing';
  var got = _._arrayPrependArrayOnce([ 1,1 ]);
  var expected = [ 1,1 ];
  test.identical( got,expected );

  test.description = 'number';
  var got = _._arrayPrependArrayOnce([ 1,2 ], 3, 5);
  var expected = [ 3,5,1,2 ];
  test.identical( got,expected );

  test.description = 'string';
  var got = _._arrayPrependArrayOnce([ 1,2 ], 'str1', 'str2');
  var expected = [ 'str1','str2',1,2 ];
  test.identical( got,expected );

  test.description = 'object';
  var got = _._arrayPrependArrayOnce( [ 1,2 ], { a: 1 }, { b: 2 } );
  var expected = [ { a: 1 },{ b: 2 },1,2 ];
  test.identical( got,expected );

  test.description = 'null';
  var got = _._arrayPrependArrayOnce([ 3,9 ], null);
  var expected = [ null,3,9 ];
  test.identical( got,expected );


  if( Config.debug )
  {

    test.description = 'first argument is not array';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce( 4,5 );
    });

    test.description = 'type of the argument is equal undefined';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce( [ 1,3 ], undefined );
    });


    test.description = 'no arguments';
    test.shouldThrowError( function()
    {
      _._arrayPrependArrayOnce();
    });

  }

}*/

//

function arrayPrependArrayOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.arrayPrependArrayOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependArrayOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayPrependArrayOnceStrictly( dst, [ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArrayOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayPrependArrayOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnceStrictly();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnceStrictly( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnceStrictly( [ 1, 2 ], 2 );
  });

  test.description = 'one of elements is not unique';

  var dst = [ 1,2,3 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArrayOnceStrictly( dst, [ 4, 5, 2 ] );
  })
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArrayOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrayOnceStrictly( [ 1, 2 ], [ 2 ], 3 );
  });
}

//

function arrayPrependedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayPrependedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayPrependedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 2, 4, 5, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependedArray( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayPrependedArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayPrependedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArray( [ 1, 2 ], 2 );
  });

}

//

function arrayPrependedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayPrependedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayPrependedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayPrependedArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', [ { a : 1 } ], { b : 2 }, 1  ] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependedArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayPrependedArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });
}

//arrayPrepend*Arrays*

function arrayPrependArrays( test )
{

  test.description = 'nothing';
  var got = _.arrayPrependArrays( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayPrependArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayPrependArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  var dst = [];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4 ] ] ];
  var got = _.arrayPrependArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4 ] ] );
  test.identical( got, dst );

  var dst = [];
  var insArray = [ 1, 2, 3 ]
  var got = _.arrayPrependArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.arrayPrependArrays( dst, insArray );
  test.identical( dst, [  'a', 1, { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayPrependArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrays( 1, [ 2 ] );
  });

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrays( [], 2 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrependArrays( [], [ 1 ], [ 2 ] );
  });
};

//

function arrayPrependArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.arrayPrependArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayPrependArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayPrependArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4 ], 5 ] ];
  var got = _.arrayPrependArraysOnce( dst, insArray );
  test.identical( dst, [ [ 4 ], 5, 1, 2, 3, 4 ] );
  test.identical( got, dst );

  var dst = [ 1, 3 ];
  var got = _.arrayPrependArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( got, [ 2, 1, 3 ] );
  test.identical( dst, got );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 1, 3 ];
  var got = _.arrayPrependArraysOnce( dst, [ 1, 2, 3 ], onEqualize );
  test.identical( got, [ 2, 1, 3 ] );
  test.identical( dst, got );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayPrependArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnce( [], [ 1, 2, 3 ], {} );
  });

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnce( [], 2 );
  });

}

//

function arrayPrependArraysOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.arrayPrependArraysOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ [ 'a' ],[ { a : 1 } ], { b : 2 } ];
  var got = _.arrayPrependArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, dst );

  var dst = [ 0 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] ];
  var got = _.arrayPrependArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4, [ 5 ] ], 0 ] );
  test.identical( got, dst );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 4,5 ];
  var got = _.arrayPrependArraysOnceStrictly( dst, [ 1, 2, 3 ], onEqualize )
  test.identical( got, [ 1, 2, 3, 4, 5 ] );
  test.identical( dst, got );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayPrependArraysOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnceStrictly();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnceStrictly( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnceStrictly( [], [ 1,2,3 ], {} );
  });

  var dst = [ 1, 2, 3 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArraysOnceStrictly( dst, [ 4, 2, 5 ] );
  })
  test.identical( dst, [ 4, 5, 1, 2, 3 ] )

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArraysOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependArraysOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependArraysOnceStrictly( [], 2 );
  });
}

//

function arrayPrependedArrays( test )
{
  test.description = 'nothing';
  var dst = [];
  var got = _.arrayPrependedArrays( dst, [] );
  var expected = [ ];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayPrependedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayPrependedArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependedArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, 2 );

  var dst = [];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4 ], 5 ] ];
  var got = _.arrayPrependedArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4 ], 5 ] );
  test.identical( got, 5 );

  var dst = [];
  var got = _.arrayPrependedArrays( dst, [ 1, 2, 3 ]);
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayPrependedArrays( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  'a', 1, { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependedArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayPrependedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );
  test.identical( got, 2 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrays( 1, [ 2 ] );
  });

  test.description = 'second arg is no a ArrayLike';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrays( [], 2 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArrays( [], [ 1 ], [ 2 ] );
  });

}

//

function arrayPrependedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayPrependedArraysOnce( dst, [] );
  var expected = [];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayPrependedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayPrependedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 4, 5, 1, 2, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayPrependedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayPrependedArraysOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 'a', { a : 1 }, { b : 2 }, 1  ] );
  test.identical( got, 3 );

  var dst = [];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] ];
  var got = _.arrayPrependedArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 2, 3, [ 4, [ 5 ] ] ] );
  test.identical( got, 4 );

  var dst = [ 1, 3 ];
  var got = _.arrayPrependedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 2, 1, 3 ] );
  test.identical( got, 1 );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }
  var dst = [ 1, 3 ];
  var insArray = [ 1, 2, 3 ]
  var got = _.arrayPrependedArraysOnce( dst, insArray, onEqualize );
  test.identical( dst, [ 2, 1, 3 ] );
  test.identical( got, 1 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayPrependedArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayPrependedArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ undefined, 2, 1 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArraysOnce( [], [ 1, 2, 3 ], [] )
  });

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.arrayPrependedArraysOnce( [ 1 ], 2 );
  });

}

//

function arrayAppend( test )
{
  test.description = 'simple';

  var got = _.arrayAppend( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayAppend( [ 1 ], 1 );
  test.identical( got, [ 1, 1 ] );

  var got = _.arrayAppend( [ 1 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.arrayAppend( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3,3 ] );

  var got = _.arrayAppend( [ 1 ], '1' );
  test.identical( got, [ 1, '1' ] );

  var got = _.arrayAppend( [ 1 ], -1 );
  test.identical( got, [  1, -1 ] );

  var got = _.arrayAppend( [ 1 ], [ 1 ] );
  test.identical( got, [  1,[ 1 ] ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayAppend();
  })

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppend( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayAppend( 1, 1 );
  })
}

//

function arrayAppendOnce( test )
{
  test.description = 'simple';

  var got = _.arrayAppendOnce( [], 1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayAppendOnce( [ 1 ], 1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayAppendOnce( [ 1 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.arrayAppendOnce( [ 1,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.arrayAppendOnce( [ 1 ], '1' );
  test.identical( got, [ 1, '1' ] );

  var got = _.arrayAppendOnce( [ 1 ], -1 );
  test.identical( got, [ 1, -1 ] );

  var got = _.arrayAppendOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ 1, [ 1 ] ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayAppendOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayAppendOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayAppendOnce( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayAppendOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayAppendOnce();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayAppendOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.arrayAppendOnce( 1, 1, 1 );
  })
}

//

// function _arrayAppendOnce( test )
// {
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [  ], 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'nothing to add';
//   var got = _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
//   var expected = [ 1, 2, 3, 4, 5 ];
//   test.identical( got, expected );
//
//   test.description = 'add a new element';
//   var got = _._arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   test.description = 'nothing add';
//   var got = _._arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
//   var expected = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 6, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayAppendOnce( 'wrong argument', 5 );
//     });
//
//   }
//
// }

//

function arrayAppendOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendOnceStrictly( dst , 1 );
  test.identical( got, [ 1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayAppendOnceStrictly( dst, 2 );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayAppendOnceStrictly( dst, '1' );
  test.identical( got, [ 1,'1' ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayAppendOnceStrictly( dst, -1 );
  test.identical( got, [ 1, -1 ] );
  test.identical( got, dst );

  var dst = [ 1 ];
  var got = _.arrayAppendOnceStrictly( dst, [ 1 ] );
  test.identical( got, [ 1, [ 1 ] ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayAppendOnceStrictly( dst,{ num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayAppendOnceStrictly( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayAppendOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayAppendOnceStrictly( 1, 1 );
  })

  test.description = 'ins already exists ion dst';

  test.shouldThrowError( function()
  {
    _.arrayAppendOnceStrictly( [ 1 ], 1 );
  });

  test.shouldThrowError( function()
  {
     _.arrayAppendOnceStrictly( [ 1,2,3 ], 3 );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
     _.arrayAppendOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.arrayAppendOnceStrictly( dst, { num : 1 }, onEqualize );
  });

  test.shouldThrowError( function()
  {
    var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.arrayAppendOnceStrictly( dst, 1, onEqualize );
  });
}

//

function arrayAppended( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppended( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayAppended( dst, 1 );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.arrayAppended( dst, 2 );
  test.identical( dst, [ 1, 2 ] );
  test.identical( got, 1 );

  var dst = [ 1,2,3 ];
  var got = _.arrayAppended( dst, 3 );
  test.identical( dst, [ 1,2,3,3 ] );
  test.identical( got, 3 );

  var dst = [ 1 ];
  var got = _.arrayAppended( dst, '1' );
  test.identical( dst, [ 1, '1' ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.arrayAppended( dst, -1 );
  test.identical( dst, [ 1, -1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.arrayAppended( dst, [ 1 ] );
  test.identical( dst, [ 1, [ 1 ] ] );
  test.identical( got, 1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayAppended();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppended( [], 1, 1 );
  });

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayAppended( 1, 1 );
  });
}

//

function arrayAppendedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayAppendedOnce( dst, 1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayAppendedOnce( dst, 2 );
  test.identical( dst, [ 1, 2 ] );
  test.identical( got, 1 );

  var dst = [ 1,2,3 ];
  var got = _.arrayAppendedOnce( dst, 3 );
  test.identical( dst, [ 1,2,3 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayAppendedOnce( dst, '1' );
  test.identical( dst, [ 1,'1' ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.arrayAppendedOnce( dst, -1 );
  test.identical( dst, [ 1,-1 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.arrayAppendedOnce( dst, [ 1 ] );
  test.identical( dst, [ 1,[ 1 ] ] );
  test.identical( got, 1 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayAppendedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 },{ num : 4 } ] );
  test.identical( got, 3 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayAppendedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayAppendedOnce( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 }, 4 ] );
  test.identical( got, 3 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayAppendedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayAppendedOnce();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayAppendedOnce( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayAppendedOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.arrayAppendedOnce( 1, 1, 1 );
  })
}

// //
//
// function arrayAppendArray( test )
// {
//
//   test.description = 'nothing';
//   var got = _.arrayAppendArray( [  ] );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'an argument';
//   var got = _.arrayAppendArray( [ 1, 2, undefined ] );
//   var expected = [ 1, 2, undefined ];
//   test.identical( got, expected );
//
//   test.description = 'an array';
//   var got = _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
//   var expected = [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.description = 'no arguments';
//   test.shouldThrowError( function()
//   {
//     _.arrayAppendArray();
//   });
//
//   test.description = 'arguments[0] is wrong, has to be an array';
//   test.shouldThrowError( function()
//   {
//     _.arrayAppendArray( 'wrong argument', 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
//   });
//
//   test.description = 'arguments[1] is undefined';
//   test.shouldThrowError( function()
//   {
//     _.arrayAppendArray( [ 1, 2 ], undefined, false, { a : 1 }, 42, [ 3, 7, 13 ] );
//   });
//
// };

//

function arrayAppendArray( test )
{

  test.description = 'nothing';
  var got = _.arrayAppendArray( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayAppendArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayAppendArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendArray( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayAppendArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [  1, 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayAppendArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppendArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayAppendArray( [ 1, 2 ], 2 );
  });
};

//

// function arrayAppendArrayOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _.arrayAppendArrayOnce( [  ] );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'an argument';
//   var got = _.arrayAppendArrayOnce( [ 1, 2, undefined ] );
//   var expected = [ 1, 2, undefined ];
//   test.identical( got, expected );
//
//   test.description = 'an array';
//   var got = _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
//   var expected = [ 1, 2, 'str', {}, 5 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayAppendArrayOnce();
//     });
//
//     test.description = 'arguments[0] is wrong, has to be an array';
//     test.shouldThrowError( function()
//     {
//       _.arrayAppendArrayOnce( 'wrong argument', 'str', 2, {}, [ 'str', 5 ] );
//     });
//
//     test.description = 'arguments[3] is undefined';
//     test.shouldThrowError( function()
//     {
//       _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, undefined, [ 'str', 5 ] );
//     });
//
//   }
//
// };

//

function arrayAppendArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.arrayAppendArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'appends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayAppendArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayAppendArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayAppendArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });

}

//

function arrayAppendArrayOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.arrayAppendArrayOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendArrayOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayAppendArrayOnceStrictly( dst, [ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArrayOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayAppendArrayOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnceStrictly();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnceStrictly( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnceStrictly( [ 1, 2 ], 2 );
  });

  test.description = 'one of elements is not unique';

  var dst = [ 1,2,3 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArrayOnceStrictly( dst, [ 4, 5, 2 ] );
  })
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArrayOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrayOnceStrictly( [ 1, 2 ], [ 2 ], 3 );
  });
}

//

function arrayAppendedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayAppendedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayAppendedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 2, 4, 5 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendedArray( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayAppendedArray( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, 4 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayAppendedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1,undefined, 2, ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArray( [ 1, 2 ], 2 );
  });
}

//

function arrayAppendedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayAppendedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayAppendedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var got = _.arrayAppendedArrayOnce( dst, [ 'a', 1, [ { a : 1 } ], { b : 2 } ] );
  test.identical( dst, [ 1, 'a', [ { a : 1 } ], { b : 2 } ] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendedArrayOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayAppendedArrayOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });

}

//

function arrayAppendArrays( test )
{

  test.description = 'nothing';
  var got = _.arrayAppendArrays( [], [] );
  var expected = [  ];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayAppendArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayAppendArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 5 ] ] ]
  var got = _.arrayAppendArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 1, 2, 3, [ 5 ] ] );
  test.identical( got, dst );

  test.description = 'arguments are not arrays';
  var dst = [];
  var got = _.arrayAppendArrays( dst, [ 1, 2, 3 ]);
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.arrayAppendArrays( dst, insArray );
  test.identical( dst, [  1, 'a', 1, { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayAppendArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrays( 1, [ 2 ] );
  });

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppendArrays( [], [ 1 ], [ 2 ] );
  });
};

//

function arrayAppendArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.arrayAppendArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayAppendArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.arrayAppendArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 5 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ];
  var got = _.arrayAppendArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 5, [ 4, [ 5 ] ], 6 ] );
  test.identical( got, dst );

  var dst = [ 1, 3 ];
  var got = _.arrayAppendArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( got, [ 1, 3, 2 ] );
  test.identical( dst, got );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 1, 3 ];
  var got = _.arrayAppendArraysOnce( dst, [ 1, 2, 3 ], onEqualize )
  test.identical( got, [ 1, 3, 2 ] );
  test.identical( dst, got );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayAppendArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnce( [], [ 1, 2, 3 ], [] );
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnce( [], 1 );
  });

}

//

function arrayAppendArraysOnceStrictly( test )
{
  test.description = 'nothing';

  var got = _.arrayAppendArraysOnceStrictly( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ [ 'a' ],[ { a : 1 } ], { b : 2 } ];
  var got = _.arrayAppendArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, dst );

  var dst = [ 0 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ];
  var got = _.arrayAppendArraysOnceStrictly( dst, insArray );
  test.identical( dst, [ 0, 1, 2, 3, [ 4, [ 5 ] ], 6 ] );
  test.identical( got, dst );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 4,5 ];
  var got = _.arrayAppendArraysOnceStrictly( dst, [ 1, 2, 3 ], onEqualize );
  test.identical( got, [ 4, 5, 1, 2, 3 ] );
  test.identical( dst, got );

  test.description = 'ins has existing element';

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayAppendArraysOnceStrictly( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnceStrictly();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnceStrictly( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnceStrictly( [], [ 1, 2, 3 ], [] )
  });

  var dst = [ 1, 2, 3 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArraysOnceStrictly( dst, [ 4, 2, 5 ] );
  })
  test.identical( dst, [ 1, 2, 3, 4, 5 ] )

  var dst = [ 1, 1, 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArraysOnceStrictly( dst, [ 1 ] );
  })
  test.identical( dst, [ 1, 1, 1 ] );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendArraysOnceStrictly( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.arrayAppendArraysOnceStrictly( [], 1 );
  });

}

//

function arrayAppendedArrays( test )
{
  test.description = 'nothing';
  var dst = [];
  var got = _.arrayAppendedArrays( dst, [] );
  var expected = [ ];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayAppendedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayAppendedArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendedArrays( dst, [ 1, 1 ] );
  test.identical( dst, [ 1, 1, 1, 1, 1 ] );
  test.identical( got, 2 );

  var dst = [ 1, 2, 3 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, 5 ], 6 ] ];
  var got = _.arrayAppendedArrays( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 1, 2, 3, [ 4, 5 ], 6 ] );
  test.identical( got, 5 );

  test.description = 'arguments are not arrays';
  var dst = [];
  var got = _.arrayAppendedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.arrayAppendedArrays( dst, insArray );
  test.identical( dst, [  1, 'a', 1, { a : 1 }, { b : 2 } ] );
  test.identical( got, 4 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayAppendedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );
  test.identical( got, 2 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrays();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrays( 1, [ 2 ] );
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendedArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArrays( [], [ 1 ], [ 2 ] );
  });

}

//

function arrayAppendedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayAppendedArraysOnce( dst, [] );
  var expected = [];
  test.identical( dst, expected );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayAppendedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayAppendedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 2 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayAppendedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1, 1 ] );
  test.identical( got, 0 );

  test.description = 'mixed arguments types';
  var dst = [ 1 ];
  var insArray = [ 'a', 1, [ { a : 1 } ], { b : 2 } ];
  var got = _.arrayAppendedArraysOnce( dst, insArray );
  test.identical( dst, [  1, 'a', { a : 1 }, { b : 2 } ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 5 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ];
  var got = _.arrayAppendedArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 2, 3, 5, [ 4, [ 5 ] ], 6 ] );
  test.identical( got, 2 );

  var dst = [ 1, 3 ];
  var got = _.arrayAppendedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [ 1, 3, 2 ] );
  test.identical( got, 1 );

  test.description = 'onEqualize';

  var onEqualize = function onEqualize( a, b )
  {
    return a === b;
  }

  var dst = [ 1, 3 ];
  var got = _.arrayAppendedArraysOnce( dst, [ 1, 2, 3 ], onEqualize );
  test.identical( dst, [ 1, 3, 2 ] );
  test.identical( got, 1 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    _.arrayAppendedArraysOnce( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1, undefined, 2 ] );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArraysOnce( [], [ 1, 2, 3 ], [] )
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayAppendedArraysOnce( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not a ArrayLike entity';
  test.shouldThrowError( function()
  {
    _.arrayAppendedArraysOnce( [], 1 );
  });

}

//

function arrayRemove( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemove( dst, 1 );
  test.identical( dst, [ ] );

  var dst = [ 1 ];
  var got = _.arrayRemove( dst, 1 );
  test.identical( dst, [  ] );

  var dst = [ 2,2,1 ];
  var got = _.arrayRemove( dst, 2 );
  test.identical( dst, [ 2,1 ] );

  var dst = [ 2,2,1 ];
  var got = _.arrayRemove( dst, 1 );
  test.identical( dst, [ 2,2 ] );

  var dst = [ 1 ];
  var got = _.arrayRemove( dst, '1' );
  test.identical( dst, [ 1 ] );

  var dst = [ 1 ];
  var got = _.arrayRemove( dst, -1 );
  test.identical( dst, [ 1 ] );

  var dst = [ 1 ];
  var got = _.arrayRemove( dst, [ 1 ] );
  test.identical( dst, [ 1 ] );

  var dst = [ { x : 1 } ];
  var got = _.arrayRemove( dst, { x : 1 } );
  test.identical( dst, [ { x : 1 } ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemove( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemove( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemove( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemove( dst, 1, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemove();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemove( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemove( 1, 1 );
  })
}

//

function arrayRemoved( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemoved( dst, 1 );
  test.identical( dst, [ ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayRemoved( dst, 1 );
  test.identical( dst, [  ] );
  test.identical( got, 0 );

  var dst = [ 2,2,1 ];
  var got = _.arrayRemoved( dst, 2 );
  test.identical( dst, [ 2,1 ] );
  test.identical( got, 0 );

  var dst = [ 2,2,1 ];
  var got = _.arrayRemoved( dst, 1 );
  test.identical( dst, [ 2,2 ] );
  test.identical( got, 2 );

  var dst = [ 1 ];
  var got = _.arrayRemoved( dst, '1' );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayRemoved( dst, -1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayRemoved( dst, [ 1 ] );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ { x : 1 } ];
  var got = _.arrayRemoved( dst, { x : 1 } );
  test.identical( dst, [ { x : 1 } ] );
  test.identical( got, -1 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemoved( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemoved( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );


  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemoved( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );


  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemoved( dst, 1, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );


  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemoved();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemoved( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemoved( 1, 1 );
  })
}

//

function arrayRemoveOnce( test )
{
  test.description = 'simple';

  var got = _.arrayRemoveOnce( [], 1 );
  test.identical( got, [] );

  var got = _.arrayRemoveOnce( [ 1 ], 1 );
  test.identical( got, [] );

  var got = _.arrayRemoveOnce( [ 1,2,2 ], 2 );
  test.identical( got, [ 1,2 ] );

  var got = _.arrayRemoveOnce( [ 1,3,2,3 ], 3 );
  test.identical( got, [ 1,2,3 ] );

  var got = _.arrayRemoveOnce( [ 1 ], '1' );
  test.identical( got, [ 1 ] );

  var got = _.arrayRemoveOnce( [ 1 ], -1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayRemoveOnce( [ 1 ], [ 1 ] );
  test.identical( got, [ 1 ] );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemoveOnce( dst, { num : 4 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemoveOnce( dst, { num : 1 }, onEqualize );
  test.identical( got, [ { num : 2 },{ num : 3 } ] );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemoveOnce( dst, 4, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 },{ num : 3 } ] );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemoveOnce( dst, 1, onEqualize );
  test.identical( got, [ { num : 2 },{ num : 3 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemoveOnce();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemoveOnce( 1, 1 );
  })

  test.description = 'onEqualize is not a function';
  test.shouldThrowError( function()
  {
    _.arrayRemoveOnce( 1, 1, 1 );
  })
}

//

// function arrayRemoveOnce( test ) {
//
//   test.description = 'nothing';
//   var got = _.arrayRemoveOnce( [  ], 2 );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'one element left';
//   var got = _.arrayRemoveOnce( [ 2, 4 ], 4 );
//   var expected = [ 2 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.arrayRemoveOnce( [ true, false, 6 ], true );
//   var expected = [ false, 6 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.description = 'no arguments';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemoveOnce();
//   });
//
//   test.description = 'not enough arguments';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemoveOnce( [ 2, 4, 6 ] );
//   });
//
//   test.description = 'extra argument';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemoveOnce( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//   });
//
//   test.description = 'arguments[0] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemoveOnce( 'wrong argument', 2 );
//   });
//
//   test.description = 'arguments[2] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemoveOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
//   });
//
// };

//

function arrayRemoveOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1,2,2 ];
  var got = _.arrayRemoveOnceStrictly( dst, 2 );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemoveOnceStrictly( dst, { num : 3 }, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemoveOnceStrictly( dst, 3, onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemoveOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemoveOnceStrictly( 1, 1 );
  })

  test.description = 'ins not exists';

  test.shouldThrowError( function()
  {
    _.arrayRemoveOnceStrictly( [ 1 ], 2 );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
    _.arrayRemoveOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.description = 'onEqualize';
  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

  test.shouldThrowError( function()
  {
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.arrayRemoveOnceStrictly( dst, { num : 4 }, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )


  test.shouldThrowError( function()
  {
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.arrayRemoveOnceStrictly( dst, 4, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
}

//

// function _arrayRemoved( test )
// {
//
//   test.description = 'nothing';
//   var got = _._arrayRemoved( [  ], 2 );
//   var expected = 0;
//   test.identical( got, expected );
//
//   test.description = 'one element removed';
//   var got = _._arrayRemoved( [ 2, 4, 6 ], 4 );
//   var expected = 1;
//   test.identical( got, expected );
//
//   test.description = 'two elements removed';
//   var got = _._arrayRemoved( [ true, false, 6, true ], true );
//   var expected = 2;
//   test.identical( got, expected );
//
//   test.description = 'three elements removed';
//   var got = _._arrayRemoved( [ 2, 4, 6, 7 ], 2, function ( el, ins ) {
//     return el > ins;
//   });
//   var expected = 3;
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( [ 2, 4, 6 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( 'wrong argument', 2 );
//     });
//
//     test.description = 'arguments[2] is wrong';
//     test.shouldThrowError( function()
//     {
//       _._arrayRemoved( [ 2, 4, 6 ], 2, 'wrong argument' );
//     });
//
//   }
//
// };

//

function arrayRemovedOnce( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemovedOnce( dst, 1 );
  test.identical( dst, [ ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayRemovedOnce( dst, 1 );
  test.identical( dst, [  ] );
  test.identical( got, 0 );

  var dst = [ 2,2,1 ];
  var got = _.arrayRemovedOnce( dst, 2 );
  test.identical( dst, [ 2,1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayRemovedOnce( dst, '1' );
  test.identical( dst, [ 1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayRemovedOnce( dst, -1 );
  test.identical( dst, [  1 ] );
  test.identical( got, -1 );

  var dst = [ 1 ];
  var got = _.arrayRemovedOnce( dst, [ 1 ] );
  test.identical( dst, [  1 ] );
  test.identical( got, -1 );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemovedOnce( dst, { num : 4 }, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemovedOnce( dst, { num : 1 }, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemovedOnce( dst, 4, onEqualize );
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] );
  test.identical( got, -1 );

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemovedOnce( dst, 1, onEqualize );
  test.identical( dst, [ { num : 2 },{ num : 3 } ] );
  test.identical( got, 0 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemovedOnce();
  })

  test.description = 'third is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemovedOnce( [], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemovedOnce( 1, 1 );
  })
}

//

// function arrayRemovedOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _.arrayRemovedOnce( [  ], 2 );
//   var expected = -1;
//   test.identical( got, expected );
//
//   test.description = 'second element removed';
//   var got = _.arrayRemovedOnce( [ 2, 4, 6 ], 4 );
//   var expected = 1;
//   test.identical( got, expected );
//
//   test.description = 'first element removed';
//   var got = _.arrayRemovedOnce( [ true, false, 6 ], true );
//   var expected = 0;
//   test.identical( got, expected );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.description = 'no arguments';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemovedOnce();
//   });
//
//   test.description = 'not enough arguments';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemovedOnce( [ 2, 4, 6 ] );
//   });
//
//   test.description = 'extra argument';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemovedOnce( [ 2, 4, 6 ], 2, function( el ) { return el; }, 'redundant argument' );
//   });
//
//   test.description = 'arguments[0] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemovedOnce( 'wrong argument', 2 );
//   });
//
//   test.description = 'arguments[2] is wrong';
//   test.shouldThrowError( function()
//   {
//     _.arrayRemovedOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
//   });
//
// };

//

function arrayRemoveArray( test )
{

  test.description = 'nothing';
  var got = _.arrayRemoveArray( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayRemoveArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayRemoveArray( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayRemoveArray( dst,[ 1,3 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayRemoveArray( dst, [ 1, 1 ] );
  test.identical( dst, [ ] );
  test.identical( got, dst );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayRemoveArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayRemoveArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArray( [ 1, 2 ], 2 );
  });
};

//

function arrayRemoveArrayOnce( test )
{
  test.description = 'nothing';

  var got = _.arrayRemoveArrayOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemoveArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayRemoveArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayRemoveArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.arrayRemoveArrayOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, dst );
  });

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });
}

// function arrayRemoveArrayOnce( test )
// {
//
//   test.description = 'nothing';
//   var got = _.arrayRemoveArrayOnce( [  ], [  ] );
//   var expected = 0;
//   test.identical( got, expected );
//
//   test.description = 'three elements left';
//   var got = _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
//   var expected = 2;
//   test.identical( got, expected );
//
//   test.description = 'one elements left';
//   var got = _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
//     return a < b;
//   } );
//   var expected = 4;
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveArrayOnce();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ] );
//     });
//
//     test.description = 'wrong type of arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveArrayOnce('wrong argument', 'wrong argument', 'wrong argument');
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) { return a < b }, 'redundant argument' );
//     });
//
//   }
//
// };

//

function arrayRemoveArrayOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1,2,2 ];
  var got = _.arrayRemoveArrayOnceStrictly( dst, [ 2 ] );
  test.identical( got, [ 1,2 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var got = _.arrayRemoveArrayOnceStrictly( dst, [ { num : 3 } ], onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var got = _.arrayRemoveArrayOnceStrictly( dst, [ 3 ], onEqualize );
  test.identical( got, [ { num : 1 },{ num : 2 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnceStrictly( 1, 1 );
  })

  test.description = 'ins not exists';

  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnceStrictly( [ 1 ], [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
    _.arrayRemoveArrayOnceStrictly( [ 1,2,3 ], 3, 3 );
  });

  test.description = 'onEqualize';
  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

  test.shouldThrowError( function()
  {
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    _.arrayRemoveArrayOnceStrictly( dst, [ { num : 4 } ], onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )


  test.shouldThrowError( function()
  {
    var onEqualize = function( a )
    {
      return a.num;
    }
    _.arrayRemoveArrayOnceStrictly( dst, [ 4 ], onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
}

//

function arrayRemovedArray( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayRemovedArray( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemovedArray( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayRemovedArray( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayRemovedArray( dst, [ 1 ] );
  test.identical( dst, [] );
  test.identical( got, 3 );

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayRemovedArray( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayRemovedArray( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArray();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArray( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArray( [ 1, 2 ], 2 );
  });
}

//

function arrayRemovedArrayOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayRemovedArrayOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemovedArrayOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayRemovedArrayOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayRemovedArrayOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.arrayRemovedArrayOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, 0 );
  });

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArrayOnce();
  });

  test.description = 'too many args';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArrayOnce( [ 1, 2 ],[ 1 ], [ 2 ] );
  });

  test.description = 'second args is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArrayOnce( [ 1, 2 ], 2 );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArrayOnce( [ 1, 2 ], [ 2 ], 3 );
  });

}

//

function arrayRemoveArrays( test )
{
  test.description = 'nothing';
  var got = _.arrayRemoveArrays( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';
  var dst = [];
  var got = _.arrayRemoveArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayRemoveArrays( dst,[ 4, 5 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayRemoveArrays( dst,[ 1,3 ] );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1, 2, 2, 2 ];
  var got = _.arrayRemoveArrays( dst, [ [ 1 ], [ 2 ] ] );
  test.identical( dst, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.arrayRemoveArrays( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, dst );

  var dst = [ 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemoveArrays( dst, insArray );
  test.identical( dst, [] );
  test.identical( got, dst );

  var dst = [ [ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemoveArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, dst );

  var dst = [ [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.arrayRemoveArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayRemoveArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArrays();
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayRemoveArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.arrayRemoveArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function ()
  {
    _.arrayRemoveArrays( [], [ 1 ], [ 1 ] );
  });

};

//

function arrayRemoveArraysOnce( test )
{
  test.description = 'nothing';

  var got = _.arrayRemoveArraysOnce( [], [] );
  var expected = [];
  test.identical( got, expected );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemoveArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( got, [] );
  test.identical( got, dst );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayRemoveArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayRemoveArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 2, 3, 3, 4, 5, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.arrayRemoveArraysOnce( dst, insArray );
  test.identical( got, [ 1, 3, 3, 4, 5 ] );
  test.identical( got, dst );

  var dst = [ 1, 1, 2, 2, 3, 4, 4, 5 ];
  var insArray = [ [ 1, 1 ], 2 , [ 3 ], 4, 4, [ 5 ] ];
  var got = _.arrayRemoveArraysOnce( dst, insArray );
  test.identical( dst, [ 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.arrayRemoveArraysOnce( dst, insArray );
  test.identical( got, [ 3, 4 ] );
  test.identical( got, dst );

  var dst = [ 5, 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemoveArraysOnce( dst, insArray );
  test.identical( got, [ 5 ] );
  test.identical( got, dst );

  var dst = [ [ 5 ],[ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemoveArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ],[ 5 ] ] );
  test.identical( got, dst );

  var dst = [ [ 5 ], [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.arrayRemoveArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ], [ 5 ] ] );
  test.identical( got, dst );

  function onEqualize( a, b ){ return a === b }
  var dst = [ 1, 2, [ 3 ] ];
  var insArray = [ 1, 2, [ 3 ] ];
  var got = _.arrayRemoveArraysOnce( dst, insArray, onEqualize );
  test.identical( got, [ [ 3 ] ]);
  test.identical( got, dst );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.arrayRemoveArraysOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, dst );
  });

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var insArray = [ [ { num : 3 } ], { num : 1 } ];
  var got = _.arrayRemoveArraysOnce( dst, insArray, onEqualize )
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var insArray = [ [ 3 ], 1  ];
  var got = _.arrayRemoveArraysOnce( dst, insArray, onEqualize )
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArraysOnce( [  ], [ 1, 2, 3 ], [] )
  });

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.arrayRemoveArraysOnce( [], 1 );
  });
}

//

function arrayRemoveArraysOnceStrictly( test )
{
  test.description = 'simple';

  var dst = [ 1, 2, 2 ];
  var got = _.arrayRemoveArraysOnceStrictly( dst, [ 2 ] );
  test.identical( got, [ 1, 2 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayRemoveArraysOnceStrictly( dst, [ 1, 2, 3 ] );
  test.identical( got, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4 ];
  var insArray = [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ];
  var got = _.arrayRemoveArraysOnceStrictly( dst, insArray );
  test.identical( got, [ ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, 3 ], [ 4 ], 5 ];
  var got = _.arrayRemoveArraysOnceStrictly( dst, insArray );
  test.identical( got, [] );
  test.identical( got, dst );

  var dst = [ 5, 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemoveArraysOnceStrictly( dst, insArray );
  test.identical( got, [ 5 ] );
  test.identical( got, dst );

  test.description = 'equalizer 2 args';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a, b )
  {
    return a.num === b.num;
  }
  var insArray = [ [ { num : 3 } ], { num : 1 }  ]
  var got = _.arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize )
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  test.description = 'equalizer 1 arg';

  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];
  var onEqualize = function( a )
  {
    return a.num;
  }
  var insArray = [ [ 3 ], 1  ];
  var got = _.arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize );
  test.identical( got, [ { num : 2 } ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArraysOnceStrictly();
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemoveArraysOnceStrictly( 1, 1 );
  })

  test.description = 'ins not exists';

  test.shouldThrowError( function()
  {
    _.arrayRemoveArraysOnceStrictly( [ 1 ], [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';

  test.shouldThrowError( function()
  {
    _.arrayRemoveArraysOnceStrictly( [], [ 1, 2, 3 ], [] );
  });

  test.description = 'onEqualize';
  var dst = [ { num : 1 },{ num : 2 },{ num : 3 } ];

  test.shouldThrowError( function()
  {
    var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    var insArray = [ [ { num : 4 } ] ];
    _.arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )

  test.shouldThrowError( function()
  {
    var onEqualize = function( a )
    {
      return a.num;
    }
    var insArray = [ [ 4 ] ];
    _.arrayRemoveArraysOnceStrictly( dst, insArray, onEqualize );
  });
  test.identical( dst, [ { num : 1 },{ num : 2 },{ num : 3 } ] )
}

//

function arrayRemovedArrays( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayRemovedArrays( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemovedArrays( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayRemovedArrays( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1,3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayRemovedArrays( dst, [ 1 ] );
  test.identical( dst, [] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 4, 5];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], 2 , [ 3 ], 4, [ 5 ] ]
  var got = _.arrayRemovedArrays( dst, insArray );
  test.identical( dst, [] );
  test.identical( got, 5 );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, 3 );

  var dst = [ 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemovedArrays( dst, insArray );
  test.identical( dst, [] );
  test.identical( got, 1 );

  var dst = [ [ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, 0 );

  var dst = [ [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.arrayRemovedArrays( dst, insArray );
  test.identical( dst, [ [ 5 ] ] );
  test.identical( got, 0 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  var got;
  test.mustNotThrowError( function ()
  {
    got = _.arrayRemovedArrays( dst, [ undefined, 2 ] );
  });
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArrays();
  });

  test.description = 'argument is undefined';
  var dst = [ 1 ];
  test.shouldThrowError( function ()
  {
    _.arrayRemovedArrays( dst, undefined );
  });
  test.identical( dst, [ 1 ] );

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.arrayRemovedArrays( [], 1 );
  });

  test.description = 'too many args';
  test.shouldThrowError( function ()
  {
    _.arrayRemovedArrays( [], [ 1 ], [ 1 ] );
  });
}

//

function arrayRemovedArraysOnce( test )
{
  test.description = 'nothing';

  var dst = [];
  var got = _.arrayRemovedArraysOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemovedArraysOnce( dst, [ 1, 2, 3 ] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  test.description = 'prepends only unique elements';

  var dst = [ 1,2,3 ];
  var got = _.arrayRemovedArraysOnce( dst, [ 2, 4, 5 ] );
  test.identical( dst, [ 1, 3] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayRemovedArraysOnce( dst, [ 1 ] );
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  var dst = [ 1, 1, 2, 3, 3, 4, 5, 5];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ]
  var got = _.arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 1, 3, 3, 4, 5 ] );
  test.identical( got, 3 );

  var dst = [ 1, 1, 2, 2, 3, 4, 4, 5 ];
  var insArray = [ [ 1, 1 ], 2 , [ 3 ], 4, 4, [ 5 ] ];
  var got = _.arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 2 ] );
  test.identical( got, 7 );

  var dst = [ 1, 2, 3, 4, 5 ];
  var insArray = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
  var got = _.arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 3, 4 ] );
  test.identical( got, 3 );

  var dst = [ 5, 5 ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ 5 ] );
  test.identical( got, 1 );

  var dst = [ [ 5 ],[ 5 ] ];
  var insArray = [ [ 5 ] ];
  var got = _.arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ],[ 5 ] ] );
  test.identical( got, 0 );

  var dst = [ [ 5 ], [ 5 ] ];
  var insArray = [ [ [ 5 ] ] ];
  var got = _.arrayRemovedArraysOnce( dst, insArray );
  test.identical( dst, [ [ 5 ], [ 5 ] ] );
  test.identical( got, 0 );

  function onEqualize( a, b ){ return a === b }
  var dst = [ 1, 2, [ 3 ] ];
  var insArray = [ 1, 2, [ 3 ] ];
  var got = _.arrayRemovedArraysOnce( dst, insArray, onEqualize );
  test.identical( dst, [ [ 3 ] ]);
  test.identical( got, 2 );

  test.description = 'array has undefined';
  var dst = [ 1 ];
  test.mustNotThrowError( function ()
  {
    var got = _.arrayRemovedArraysOnce( dst, [ undefined, 2 ] );
    test.identical( dst, [ 1 ] );
    test.identical( got, 0 );
  });

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArraysOnce();
  });

  test.description = 'dst is not a array';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArraysOnce( 1, [ 2 ] );
  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemovedArraysOnce( [], [ 1, 2, 3 ], [] )
  });

  test.description = 'second arg is not arrayLike entity';
  test.shouldThrowError( function ()
  {
    _.arrayRemovedArraysOnce( [], 1 );
  });
}

//

function arrayRemoveAll( test )
{
  test.description = 'simple';

  var got = _.arrayRemoveAll( [], 1 );
  test.identical( got, [] );

  var got = _.arrayRemoveAll( [ 1 ], 1 );
  test.identical( got, [ ] );

  var got = _.arrayRemoveAll( [ 1,2,2,2 ], 2 );
  test.identical( got, [ 1 ] );

  var got = _.arrayRemoveAll( [ 1 ], '1' );
  test.identical( got, [ 1 ] );

  var got = _.arrayRemoveAll( [ 1 ], -1 );
  test.identical( got, [ 1 ] );

  var got = _.arrayRemoveAll( [ 1 ], [ 1 ] );
  test.identical( got, [ 1 ] );

  function onEqualize( a, b )
  {
    return a.value === b;
  }
  var got = _.arrayRemoveAll( [ { value : 1 }, { value : 1 }, { value : 2 } ], 1, onEqualize );
  test.identical( got, [ { value : 2 } ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemoveAll();
  })

  test.description = 'third argument is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemoveAll( [ 1 ], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemoveAll( 1, 1 );
  })
}

//

// function arrayRemoveAll( test ) {
//
//   test.description = 'nothing';
//   var got = _.arrayRemoveAll( [  ], 2 );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'one element left';
//   var got = _.arrayRemoveAll( [ 2, 4 ], 4 );
//   var expected = [ 2 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.arrayRemoveAll( [ true, false, 6 ], true );
//   var expected = [ false, 6 ];
//   test.identical( got, expected );
//
//   test.description = 'two elements left';
//   var got = _.arrayRemoveAll( [ 2, 1, 4, 6 ], 2, function ( el, ins ) {
//     return el > ins;
//   });
//   var expected = [ 2, 1 ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll();
//     });
//
//     test.description = 'not enough arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ] );
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
//     });
//
//     test.description = 'arguments[0] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( 'wrong argument', 2 );
//     });
//
//     test.description = 'arguments[2] is wrong';
//     test.shouldThrowError( function()
//     {
//       _.arrayRemoveAll( [ 2, 4, 6 ], 2, 'wrong argument' );
//     });
//
//   }
//
// }

//

function arrayRemovedAll( test )
{
  test.description = 'simple';

  var dst = [];
  var got = _.arrayRemovedAll( dst, 1 );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayRemovedAll( dst, 1 );
  test.identical( dst, [] );
  test.identical( got, 1 );

  var dst = [ 1,2,2 ];
  var got = _.arrayRemovedAll( dst, 2 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 2 );

  var dst = [ 1 ];
  var got = _.arrayRemovedAll( dst, '1' );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayRemovedAll( dst, -1 );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  var dst = [ 1 ];
  var got = _.arrayRemovedAll( dst, [ 1 ] );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  function onEqualize( a, b )
  {
    return a.value === b;
  }
  var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
  var got = _.arrayRemovedAll( dst, 1, onEqualize );
  test.identical( dst, [ { value : 2 } ] );
  test.identical( got, 2 );

  //

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayRemovedAll();
  })

  test.description = 'third argument is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayRemoveAll( [ 1 ], 1, 1 );
  })

  test.description = 'dst is not an array';
  test.shouldThrowError( function()
  {
    _.arrayRemovedAll( 1, 1 );
  })
}

//

function arrayFlatten( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.arrayFlatten( [], [] );
  test.identical( got, [] );

  var got  = _.arrayFlatten( [], [ 1, 2, 3 ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.arrayFlatten( [], [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.arrayFlatten( [], [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.arrayFlatten( [], [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( got, [ 1 ] );

  test.description = 'make array flat, dst is not empty';

  var got  = _.arrayFlatten( [ 1, 2, 3 ], [ 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.arrayFlatten( [ 1, 2, 3 ], [ 1, 2, 3 ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.arrayFlatten( [ 1, 2, 3 ],[ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.arrayFlatten( [ 1, 2, 3 ],[ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3, 1, 2, 3 ] );

  var got  = _.arrayFlatten( [ 1 ],[ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( got, [ 1, 1 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.arrayFlatten
  (
    [],
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 2, 3, 4 ] );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayFlatten();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlatten( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlatten( [], 1 );
  });
}

//

function arrayFlattenOnce( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.arrayFlattenOnce( [], [] );
  test.identical( got, [] );

  var got  = _.arrayFlattenOnce( [], [ 1, 1, 2, 2, 3 , 3 ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.arrayFlattenOnce( [], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.arrayFlattenOnce( [], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  test.identical( got, [ 1, 2, 3 ] );

  var got  = _.arrayFlattenOnce( [], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  test.identical( got, [ 1 ] );

  test.description = 'make array flat, dst is not empty';

  var got  = _.arrayFlattenOnce( [ 1, 2, 3, 4 ], [ 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.arrayFlattenOnce( [ 1, 2, 3 ], [ 1, 2, 3, [ [ 4 ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.arrayFlattenOnce( [ 1, 2, 3 ],[ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.arrayFlattenOnce( [ 1, 2, 3 ],[ [ 1, [ 2, [ 3 ] ] ], 4 ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.arrayFlattenOnce( [ 1 ],[ [ [ [ [ 1, 1, 1 ] ] ] ] ]  );
  test.identical( got, [ 1 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.arrayFlattenOnce
  (
    [ 1, 4 ],
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 4, 2, 3 ] );

  test.description = 'onEqualize';
  var got  = _.arrayFlattenOnce( [ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnce();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnce( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnce( [], 1 );

  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnce( [], [ 1 ], [] );
  });
}

//

function arrayFlattenOnceStrictly( test )
{
  test.description = 'make array flat, dst is empty';

  var got  = _.arrayFlattenOnceStrictly( [], [] );
  test.identical( got, [] );

  var dst = [];
  var got = _.arrayFlattenOnceStrictly( dst, [ 1, 2, 3, 4 ] )
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.arrayFlattenOnceStrictly( dst, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ]  ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.arrayFlattenOnceStrictly( dst, [ [ 1, [ 2, [ 3 ], 4 ] ]  ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  var dst = [];
  var got = _.arrayFlattenOnceStrictly( dst, [ 1, [ 2, [ [ 3, [ 4 ] ] ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );
  test.identical( dst, got );

  test.description = 'make array flat, dst is not empty';

  var got  = _.arrayFlattenOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ] );
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  var got  = _.arrayFlattenOnceStrictly( [ 1, 2, 3 ], [ [ [ 4 ] ] ] );
  test.identical( got, [ 1, 2, 3, 4 ] );

  var got  = _.arrayFlattenOnceStrictly( [ 1 ], [ [ [ [ [ 0, 2, 3 ] ] ] ] ]  );
  test.identical( got, [ 1, 0, 2, 3 ] );

  test.description = 'make array flat from multiple arrays as one arg';

  var got  = _.arrayFlattenOnceStrictly
  (
    [ 1, 4 ],
    [
      [ [ 2 ] ],
      [ 3, [ [ [ 5 ] ] ] ]
    ]
  );
  test.identical( got, [ 1, 4, 2, 3, 5 ] );

  test.description = 'onEqualize';
  var got  = _.arrayFlattenOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( got, [ 1, 2, 3, 4, 5 ] );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly( [], 1 );

  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly( [], [ 1 ], [] );
  });

  var dst = [];
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly( dst, [ 1, 1, 2, 2, 3, 3 ] )
  });
  test.identical( dst, [ 1, 2, 3 ] );

  var dst = [];
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly( dst, [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  });
  test.identical( dst, [ 1, 2, 3 ] );

  var dst = [];
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly( dst, [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  });
  test.identical( dst, [ 1, 2, 3 ] );

  var dst = [];
  test.shouldThrowError( function()
  {
    _.arrayFlattenOnceStrictly( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  });
  test.identical( dst, [ 1 ] );
}

//

function arrayFlattened( test )
{
  test.description = 'make array flat, dst is empty';

  var dst = [];
  var got  = _.arrayFlattened( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [];
  var got  = _.arrayFlattened( dst, [ 1, 2, 3 ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.arrayFlattened( dst, [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.arrayFlattened( dst, [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got  = _.arrayFlattened( dst, [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( dst, [ 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat, dst is not empty';

  var dst = [ 1, 2, 3 ];
  var got  = _.arrayFlattened( dst, [ 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got  = _.arrayFlattened( dst, [ 1, 2, 3 ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayFlattened( dst, [ [ 1 ], [ 2 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayFlattened( dst, [ [ 1, [ 2, [ 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3, 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [ 1 ];
  var got = _.arrayFlattened( dst, [ [ [ [ [ 1 ] ] ] ] ]  )
  test.identical( dst, [ 1, 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat from multiple arrays as one arg';

  var dst = [];
  var got = _.arrayFlattened
  (
    dst,
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 4 );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayFlattened();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattened( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattened( [], 1 );
  });
}

//

function arrayFlattenedOnce( test )
{
  test.description = 'make array flat, dst is empty';

  var dst = [];
  var got = _.arrayFlattenedOnce( dst, [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [];
  var got = _.arrayFlattenedOnce( dst, [ 1, 1, 2, 2, 3 , 3 ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.arrayFlattenedOnce( dst, [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.arrayFlattenedOnce( dst, [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ]  ] )
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 3 );

  var dst = [];
  var got = _.arrayFlattenedOnce( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  )
  test.identical( dst, [ 1 ] );
  test.identical( got, 1 );

  test.description = 'make array flat, dst is not empty';

  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayFlattenedOnce( dst, [ 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 0 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayFlattenedOnce( dst, [ 1, 2, 3, [ [ 4 ] ] ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayFlattenedOnce( dst, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayFlattenedOnce( dst, [ [ 1, [ 2, [ 3 ] ] ], 4 ] );
  test.identical( dst, [ 1, 2, 3, 4 ] );
  test.identical( got, 1 );

  var dst = [ 1 ];
  var got = _.arrayFlattenedOnce( dst, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]  );
  test.identical( dst, [ 1 ] );
  test.identical( got, 0 );

  test.description = 'dst contains some inner arrays';

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  var got = _.arrayFlattenedOnce( dst, [ 1, 2, 3 ]  );
  test.identical( dst, [ [ 1 ], [ 2 ], [ 3 ], 1, 2, 3 ] );
  test.identical( got, 3 );

  test.description = 'make array flat from multiple arrays as one arg';

  var dst = [ 1, 4 ];
  var got  = _.arrayFlattenedOnce
  (
    dst,
    [
      [ 1 ],
      [ [ 2 ] ],
      [ 3, [ [ [ 4 ] ] ] ]
    ]
  );
  test.identical( dst, [ 1, 4, 2, 3 ] );
  test.identical( got, 2 );

  test.description = 'onEqualize';
  var dst = [ 1, 2, 3, 4 ];
  var got = _.arrayFlattenedOnce( dst, [ 1, 4, 2, 5 ], function( a, b )
  {
    return  a === b;
  });
  test.identical( dst, [ 1, 2, 3, 4, 5 ] );
  test.identical( got, 1 );

  if( !Config.debug )
  return;

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayFlattenedOnce();
  });

  test.description = 'first is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattenedOnce( 1, [ 1 ] );
  });

  test.description = 'second is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayFlattenedOnce( [], 1 );

  });

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayFlattenedOnce( [], [ 1 ], [] );
  });
}

//

function arrayFlatten2( test )
{

  test.description = 'array of the passed arguments';
  var got = _.arrayFlatten( [],[ 'str', {}, [ 1, 2 ], 5, true ] );
  var expected = [ 'str', {}, 1, 2, 5, true ];
  test.identical( got, expected );

  test.description = 'without undefined';
  var got = _.arrayFlatten( [ 1, 2, 3 ], [ 13, 'abc', null ] );
  var expected = [ 1, 2, 3, 13, 'abc', null ];
  test.identical( got, expected );

  test.description = 'bad arguments'; //

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.arrayFlatten() );
  test.shouldThrowError( () => _.arrayFlatten( [] ) );
  test.shouldThrowError( () => _.arrayFlatten( [ 1, 2 ], 13, 'abc', {} ) );
  test.shouldThrowError( () => _.arrayFlatten( [ 1, 2, 3 ], [ 13, 'abc', undefined, null ] ) );

}

//

function arrayReplaceOnce( test )
{

  test.description = 'nothing';
  var got = _.arrayReplaceOnce( [  ], 0, 0 );
  var expected = [];
  test.identical( got, expected );

  test.description = 'second element';
  var got = _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
  var expected = [ 1,2,3,4,5 ] ;
  test.identical( got, expected );

  test.description = 'third element';
  var got = _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
  var expected = [ 'Petre', 'Mikle', 'Oleg', 'Bob' ];
  test.identical( got, expected );

  test.description = 'fourth element';
  var got = _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
  var expected = [ true, true, true, true, true ];
  test.identical( got, expected );

  test.description = 'element not exists';
  var got = _.arrayReplaceOnce( [ 1,2,3 ], [ 1 ], [ 4 ] );
  var expected = [ 1,2,3 ];
  test.identical( got, expected );

  test.description = 'equalize';
  function onEqualize( a, b )
  {
    return a === b[ 0 ];
  }
  var got = _.arrayReplaceOnce( [ 1,2,3 ], [ 1 ], [ 4 ], onEqualize );
  var expected = [ [ 4 ],2,3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnce();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ] );
  });

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnce( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'argument' );
  });

  test.description = 'arguments[0] is wrong';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnce( 'wrong argument', undefined, 3 );
  });
}

//

function arrayReplaceOnceStrictly( test )
{

  test.description = 'second element';
  var got = _.arrayReplaceOnceStrictly( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
  var expected = [ 1,2,3,4,5 ] ;
  test.identical( got, expected );

  test.description = 'third element';
  var got = _.arrayReplaceOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
  var expected = [ 'Petre', 'Mikle', 'Oleg', 'Bob' ];
  test.identical( got, expected );

  test.description = 'fourth element';
  var got = _.arrayReplaceOnceStrictly( [ true, true, true, true, false ], false, true );
  var expected = [ true, true, true, true, true ];
  test.identical( got, expected );

  test.description = 'equalize';
  function onEqualize( a, b )
  {
    return a === b[ 0 ];
  }
  var got = _.arrayReplaceOnceStrictly( [ 1,2,3 ], [ 1 ], [ 4 ], onEqualize );
  var expected = [ [ 4 ],2,3 ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnceStrictly();
  });

  test.description = 'nothing';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnceStrictly( [], 0, 0 );
  });

  test.description = 'element not exists';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnceStrictly( [ 1,2,3 ], [ 1 ], [ 4 ] );
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnceStrictly( [ 1, 2, undefined, 4, 5 ] );
  });

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnceStrictly( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'argument' );
  });

  test.description = 'arguments[0] is wrong';
  test.shouldThrowError( function()
  {
    _.arrayReplaceOnceStrictly( 'wrong argument', undefined, 3 );
  });
}

//

function arrayReplacedOnce( test )
{

  test.description = 'nothing';
  var dst = [];
  var got = _.arrayReplacedOnce( dst, 0, 0 );
  test.identical( dst, [] );
  test.identical( got, -1 );

  test.description = 'second element';
  var dst = [ 1, undefined, 3, 4, 5 ];
  var got = _.arrayReplacedOnce( dst, undefined, 2 );
  var expected = [ 1,2,3,4,5 ] ;
  test.identical( dst, expected );
  test.identical( got, 1 );

  test.description = 'third element';
  var dst = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
  var got = _.arrayReplacedOnce( dst, 'Dmitry', 'Bob' );
  var expected = [ 'Petre', 'Mikle', 'Oleg', 'Bob' ];
  test.identical( dst, expected );
  test.identical( got, 3 );

  test.description = 'fourth element';
  var dst = [ true, true, true, true, false ];
  var got = _.arrayReplacedOnce( dst, false, true );
  var expected = [ true, true, true, true, true ];
  test.identical( dst, expected );
  test.identical( got, 4 );

  test.description = 'element not exists';
  var dst = [ 1,2,3 ];
  var got = _.arrayReplacedOnce( dst, [ 1 ], [ 4 ] );
  var expected = [ 1,2,3 ];
  test.identical( dst, expected );
  test.identical( got, -1 );

  test.description = 'equalize';
  function onEqualize( a, b )
  {
    return a === b[ 0 ];
  }
  var dst = [ 1,2,3 ];
  var got = _.arrayReplacedOnce( dst, [ 1 ], [ 4 ], onEqualize );
  var expected = [ [ 4 ],2,3 ];
  test.identical( dst, expected );
  test.identical( got,0 );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplacedOnce();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplacedOnce( [ 1, 2, undefined, 4, 5 ] );
  });

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplacedOnce( [ 1, 2, undefined, 4, 5 ], undefined, 3, 'argument' );
  });

  test.description = 'arguments[0] is wrong';
  test.shouldThrowError( function()
  {
    _.arrayReplacedOnce( 'wrong argument', undefined, 3 );
  });
}

//

function arrayReplaceArrayOnce( test )
{
  test.description = 'replace elements from ins with sub';

  var dst = [];
  var got = _.arrayReplaceArrayOnce( dst, [], [] );
  test.identical( got, [] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnce( dst, [ 1 ], 2 );
  test.identical( got, [ 2, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnce( dst, [ 1, 2 ], 3);
  test.identical( got, [ 3, 3, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnce( dst, [ 1, 0, 4 ], 3 );
  test.identical( got, [ 3, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnce( dst, [ 1, 0, 4 ], [ 3 ] );
  test.identical( got, [ [ 3 ], 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnce( dst, [ undefined ], 0 );
  test.identical( got, [ 1, 2, 3 ] );
  test.identical( got, dst );

  test.description = 'onEqualize'

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b;
  }
  var got = _.arrayReplaceArrayOnce( dst, [ 1 ], 0, onEqualize );
  test.identical( got, [ 0, [ 2 ], [ 3 ] ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnce( 1, [ 1 ], 1 );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnce( [ 1, 2 ], 1, 1 );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnce( [ 1, 2 ], [ 1 ], 1, 1 );
  })
}

//

function arrayReplaceArrayOnceStrictly( test )
{
  test.description = 'nothing replaced';
  var got = _.arrayReplaceArrayOnceStrictly( [], [], [] );
  test.identical( got, [] );

  //

  test.description = 'replace elements from ins with sub';

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnceStrictly( dst, [ 1 ], 2 );
  test.identical( got, [ 2, 2, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnceStrictly( dst, [ 1, 2 ], 3);
  test.identical( got, [ 3, 3, 3 ] );
  test.identical( got, dst );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArrayOnceStrictly( dst, [ 1, 2 ], [ 3 ]);
  test.identical( got, [ [ 3 ], [ 3 ], 3 ] );
  test.identical( got, dst );

  test.description = 'onEqualize'

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b;
  }
  var got = _.arrayReplaceArrayOnceStrictly( dst, [ 1 ], 0, onEqualize );
  test.identical( got, [ 0, [ 2 ], [ 3 ] ] );
  test.identical( got, dst );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnceStrictly();
  })

  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.arrayReplaceArrayOnceStrictly( dst, [ undefined ], 0 );
  })

  test.description = 'only one replaced';
  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.arrayReplaceArrayOnceStrictly( dst, [ 1, 0, 4 ], 3 );
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnceStrictly( 1, [ 1 ], 1 );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnceStrictly( [ 1, 2 ], 1, 1 );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArrayOnceStrictly( [ 1, 2 ], [ 1 ], 1, 1 );
  })
}

//

function arrayReplacedArrayOnce( test )
{
  test.description = 'replace elements from ins with sub';

  var dst = [];
  var got = _.arrayReplacedArrayOnce( dst, [], [] );
  test.identical( dst, [] );
  test.identical( got, 0 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArrayOnce( dst, [ 1 ], 2 );
  test.identical( dst, [ 2, 2, 3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArrayOnce( dst, [ 1, 2 ], 3);
  test.identical( dst, [ 3, 3, 3 ] );
  test.identical( got, 2 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArrayOnce( dst, [ 1, 0, 4 ], 3 );
  test.identical( dst, [ 3, 2, 3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArrayOnce( dst, [ 1, 0, 4 ], [ 3 ] );
  test.identical( dst, [ [ 3 ], 2, 3 ] );
  test.identical( got, 1 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArrayOnce( dst, [ undefined ], 0 );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 0 );

  test.description = 'onEqualize'

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b;
  }
  var got = _.arrayReplacedArrayOnce( dst, [ 1 ], 0, onEqualize );
  test.identical( dst, [ 0, [ 2 ], [ 3 ] ] );
  test.identical( got, 1 );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArrayOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArrayOnce( 1, [ 1 ], 1 );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArrayOnce( [ 1, 2 ], 1, 1 );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArrayOnce( [ 1, 2 ], [ 1 ], 1, 1 );
  })
}

//

function arrayReplaceArraysOnce( test )
{
  test.description = 'replace elements from arrays from ins with relevant values from sub';

  var dst = [];
  var got = _.arrayReplaceArraysOnce( dst, [ [] ], [ [] ] );
  test.identical( got, [] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
  test.identical( got, [ 3, 4, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ [ 1 ] ] ], [ 0 ] );
  test.identical( got, [ 1, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnce( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
  test.identical( got, [ 0, 2, 0 ] );

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b[ 0 ];
  }
  var got = _.arrayReplaceArraysOnce( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
  test.identical( got, [ [ 0 ], [ 0 ], [ 0 ] ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce( 1, [ [ 1 ] ], [ 1 ] );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce( [ 1, 2 ], 1, [ 1 ] );
  })

  test.description = 'ins must be array of arrays';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce( [ 1, 2 ],[ 1 ], [ 1 ] );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
  })

  test.description = 'ins and sub length are different';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
  })

  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
  })

  test.description = 'ins[ 0 ] and sub[ 0 ] length are different';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnce( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
  })
}

//

function arrayReplaceArraysOnceStrictly( test )
{
  test.description = 'replace elements from arrays from ins with relevant values from sub';

  var dst = [];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [] ], [ [] ] );
  test.identical( got, [] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
  test.identical( got, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
  test.identical( got, [ 3, 4, 3 ] );

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b[ 0 ];
  }
  var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
  test.identical( got, [ [ 0 ], [ 0 ], [ 0 ] ] );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly();
  })

  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.arrayReplaceArraysOnceStrictly( dst, [ [ [ 1 ] ] ], [ 0 ] );
  })

  test.description = 'one element is not replaced';
  test.shouldThrowError( function()
  {
    var dst = [ 1, 2, 3 ];
    _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly( 1, [ [ 1 ] ], [ 1 ] );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly( [ 1, 2 ], 1, [ 1 ] );
  })

  test.description = 'ins must be array of arrays';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly( [ 1, 2 ],[ 1 ], [ 1 ] );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
  })

  test.description = 'ins and sub length are different';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
  })

  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
  })

  test.description = 'ins[ 0 ] and sub[ 0 ] length are different';
  test.shouldThrowError( function()
  {
    _.arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
  })
}

//

function arrayReplacedArraysOnce( test )
{
  test.description = 'replace elements from arrays from ins with relevant values from sub';

  var dst = [];
  var got = _.arrayReplacedArraysOnce( dst, [ [] ], [ [] ] );
  test.identical( got, 0 );
  test.identical( dst, [] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ] ], [ [ 3 ] ] );
  test.identical( got, 1 );
  test.identical( dst, [ 3, 2, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
  test.identical( got, 3 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
  test.identical( got, 3 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
  test.identical( got, 3 );
  test.identical( dst, [ 3, 3, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
  test.identical( got, 2 );
  test.identical( dst, [ 3, 4, 3 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ [ 1 ] ] ], [ 0 ] );
  test.identical( dst, [ 1, 2, 3 ] );
  test.identical( got, 0 );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedArraysOnce( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
  test.identical( dst, [ 0, 2, 0 ] );
  test.identical( got, 2 );

  var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
  function onEqualize( a, b )
  {
    return a[ 0 ] === b[ 0 ];
  }
  var got = _.arrayReplacedArraysOnce( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
  test.identical( dst, [ [ 0 ], [ 0 ], [ 0 ] ] );
  test.identical( got, 3 );

  //

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce();
  })

  test.description = 'dstArray is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce( 1, [ [ 1 ] ], [ 1 ] );
  })

  test.description = 'ins is not a arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce( [ 1, 2 ], 1, [ 1 ] );
  })

  test.description = 'ins must be array of arrays';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce( [ 1, 2 ],[ 1 ], [ 1 ] );
  })

  test.description = 'onEqualize is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
  })

  test.description = 'ins and sub length are different';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
  })

  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
  })

  test.description = 'ins[ 0 ] and sub[ 0 ] length are different';
  test.shouldThrowError( function()
  {
    _.arrayReplacedArraysOnce( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
  })
}

//

function arrayReplaceAll( test )
{
  test.description = 'replace all ins with sub';

  var dst = [];
  var got = _.arrayReplaceAll( dst, undefined, 0 );
  test.identical( got, [] );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayReplaceAll( dst, 1, 0 );
  test.identical( got, [ 0, 0, 0 ] );

  var dst = [ 1, 2, 1 ];
  var got = _.arrayReplaceAll( dst, 1, 0 );
  test.identical( got, [ 0, 2, 0 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplaceAll( dst, 4, 0 );
  test.identical( got, [ 1, 2, 3 ] );

  function onEqualize( a, b )
  {
    return a.value === b;
  }

  var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
  var got = _.arrayReplaceAll( dst, 1, { value : 0 }, onEqualize );
  test.identical( got, [ { value : 0 }, { value : 0 }, { value : 2 } ] );

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayReplaceAll( );
  })

  test.description = 'first arg is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplaceAll( 1, 1, 1 );
  })

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplaceAll( 1, 1, 1, 1);
  })
}

//

function arrayReplacedAll( test )
{
  test.description = 'replace all ins with sub';

  var dst = [];
  var got = _.arrayReplacedAll( dst, undefined, 0 );
  test.identical( got, 0 );
  test.identical( dst, [] );

  var dst = [ 1, 1, 1 ];
  var got = _.arrayReplacedAll( dst, 1, 0 );
  test.identical( got, 3 );
  test.identical( dst, [ 0, 0, 0 ] );

  var dst = [ 1, 2, 1 ];
  var got = _.arrayReplacedAll( dst, 1, 0 );
  test.identical( got, 2 );
  test.identical( dst, [ 0, 2, 0 ] );

  var dst = [ 1, 2, 3 ];
  var got = _.arrayReplacedAll( dst, 4, 0 );
  test.identical( got, 0 );
  test.identical( dst, [ 1, 2, 3 ] );

  function onEqualize( a, b )
  {
    return a.value === b;
  }

  var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
  var got = _.arrayReplacedAll( dst, 1, { value : 0 }, onEqualize );
  test.identical( got, 2 );
  test.identical( dst, [ { value : 0 }, { value : 0 }, { value : 2 } ] );

  if( !Config.debug )
  return;

  test.description = 'no args';
  test.shouldThrowError( function()
  {
    _.arrayReplacedAll( );
  })

  test.description = 'first arg is not arrayLike';
  test.shouldThrowError( function()
  {
    _.arrayReplacedAll( 1, 1, 1 );
  })

  test.description = 'fourth argument is not a routine';
  test.shouldThrowError( function()
  {
    _.arrayReplacedAll( 1, 1, 1, 1);
  })
}

//

function arrayUpdate( test )
{

  test.description = 'add a new element';
  var got = _.arrayUpdate( [  ], 1, 1 );
  var expected = 0;
  test.identical( got, expected );

  test.description = 'add a new element';
  var got = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
  var expected = 5;
  test.identical( got, expected );

  test.description = 'add a new element';
  var got = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
  var expected = 3;
  test.identical( got, expected );

  test.description = 'change the fourth element';
  var got = _.arrayUpdate( [ true, true, true, true, false ], false, true );
  var expected = 4;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arrayUpdate();
  });

  test.description = 'not enough arguments';
  test.shouldThrowError( function()
  {
    _.arrayUpdate( [ 1, 2, 3, 4, 5 ] );
  });

  test.description = 'extra argument';
  test.shouldThrowError( function()
  {
    _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6, 'redundant argument' );
  });

  test.description = 'arguments[0] is wrong';
  test.shouldThrowError( function()
  {
    _.arrayUpdate( 'wrong argument', 6, 6 );
  });

}

//

function arraySetContainAll( test )
{

  test.description = 'Second argument contains all the same values as in the (src)';
  var a = [ 1, 'b', 'c', 4 ];
  var b = [ 1, 2, 3, 4, 5, 'b', 'c' ];
  var got = _.arraySetContainAll( a, b );
  var expected = true;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'length of the first argument is more than second argument';
  var a = [ 1, 2, 3, 4, 5 ];
  var b = [ 1, 2, 3, 4 ];
  var got = _.arraySetContainAll( a, b );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'length of the first argument is more than second argument';
  var a = [ 'abc', 'def', true, 26 ];
  var b = [ 1, 2, 3, 4 ];
  var c = [ 26, 'abc', 'def', true ];
  var got = _.arraySetContainAll( a, b, c );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'second argument is an empty array';
  var a = [ 1, 2, 3 ];
  var b = [];
  var got = _.arraySetContainAll( a, b );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'first argument is an empty array';
  var a = [];
  var b = [ 1, 2, 3 ];
  var got = _.arraySetContainAll( a, b );
  var expected = true;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'both arguments are empty';
  var a = [];
  var b = [];
  var got = _.arraySetContainAll( a, b );
  var expected = true;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  /**/

 /* special cases */

  if( !Config.debug )
  return;

  test.description = 'too few arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll( [ 1, 1, 1 ] );
  });

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll();
  });

  test.description = 'one or both arguments are not arrayLike entities, numerical arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll( 5, 8 );
  });

  test.description = 'one or both arguments are not arrayLike entities, string like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll( 'a', 'c' );
  });

  test.description = 'one or both arguments are not arrayLike entities, map like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll( { a : 1, b : 2 }, { c : 3 } );
  });

  test.description = 'wrong arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll( [ 1, 2, 3, 4 ], 'wrong arguments' );
  });

  test.description = 'both arguments are null';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll( null, null );
  });

  test.description = 'both arguments are undefined';
  test.shouldThrowError( function()
  {
    _.arraySetContainAll( undefined, undefined );
  });

};

//

function arraySetBut( test )
{
  test.description = 'first argument has single extra element, second argument has single extra element either';
  var a = [ 1, 2, 3, 4, 15 ];
  var b = [ 1, 2, 3, 4, 5 ];
  var got = _.arraySetBut( a, b );
  var expected = [ 15 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'first argument has several elements that are not present in second argument';
  var a = [ 1, 4, 9 ];
  var b = [ 2, 5 ];
  var got = _.arraySetBut( a, b );
  var expected = [ 1, 4, 9 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'first argument is the same as second';
  var a = [ 1, 2, 3, 4 ];
  var b = [ 1, 2, 3, 4 ];
  var got = _.arraySetBut( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'first argument is an empty array';
  var a = [];
  var b = [ 1, 2, 3, 4 ];
  var got = _.arraySetBut( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'second argument is an empty array';
  var a = [ 1, 2, 3, 4 ];
  var b = [];
  var got = _.arraySetBut( a, b );
  var expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'first array has the same elements as second ';
  var a = [ 1, 1, 1 ];
  var b = [ 1 ];
  var got = _.arraySetBut( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'both arguments are empty arrays';
  var a = [];
  var b = [];
  var got = _.arraySetBut( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  /**/

  /* special cases */

  if( !Config.debug )
  return;

  /* bad arguments */

  test.description = 'too few arguments';
  test.shouldThrowError( function()
  {
    _.arraySetBut( [ 1, 1, 1 ] );
  });

  test.description = 'too much arguments';
  test.shouldThrowError( function()
  {
    _.arraySetBut( [ 1, 1, 1 ], [ 5, 8, 2], [ 3, 1, 6, 10 ] );
  });

  test.description = 'no arguments, the count of arguments doesn\'t match 2';
  test.shouldThrowError( function()
  {
    _.arraySetBut();
  });

  test.description = 'one or both arguments are not arrayLike entities, numerical arguments';
  test.shouldThrowError( function()
  {
    _.arraySetBut( 5, 8 );
  });

  test.description = 'one or both arguments are not arrayLike entities, string like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetBut( 'a', 'c' );
  });

  test.description = 'one or both arguments are not arrayLike entities, map like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetBut( { a : 1 }, { b : 3, c : 8 } );
  });

  test.description = 'wrong argument';
  test.shouldThrowError( function()
  {
    _.arraySetBut( [ 1, 2, 3 ], "wrong argument" );
  });

  test.description = 'both arguments are null';
  test.shouldThrowError( function()
  {
    _.arraySetBut( null, null );
  });

  test.description = 'both arguments are undefined';
  test.shouldThrowError( function()
  {
    _.arraySetBut( undefined, undefined );
  });



  var cases =
  [
    { src : [], but : [], expected : [] },
    { src : [ 1, 2, 3 ], but : [], expected : [ 1, 2, 3 ] },
    { src : [], but : [ 1, 2, 3 ], expected : [ ] },
    { src : [ 1, 1, 1 ], but : [ 1 ], expected : [] },
    { src : [ 1, 2, 3 ], but : [ 3, 2, 1 ], expected : [] },
    { src : [ 1, 2, 3 ], but : [ 3 ], expected : [ 1, 2 ] },
    { src : [ 1, 2, 3 ], but : [ 4, 5, 6 ], expected : [ 1, 2, 3 ] },
    { src : 1, but : 1, error : true },
  ]

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];

    if( c.error )
    test.shouldThrowError( () => _.arraySetBut( c.src, c.but ) );
    else
    test.identical( _.arraySetBut( c.src, c.but ), c.expected );
  }
}

//

function arraySetDiff( test )
{

  test.description = 'first argument has single extra element, second argument has single extra element either';
  var a = [ 1, 2, 3, 4, 15 ];
  var b = [ 1, 2, 3, 4, 5 ];
  var got = _.arraySetDiff( a, b );
  var expected = [ 15, 5 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'first argument is an empty array';
  var a = [];
  var b = [ 1, 2, 3, 4 ];
  var got = _.arraySetDiff( a, b );
  var expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'second argument is an empty array';
  var a = [ 1, 2, 3, 4 ];
  var b = [];
  var got = _.arraySetDiff( a, b );
  var expected = [ 1, 2, 3, 4 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'both arguments are empty arrays';
  var a = [];
  var b = [];
  var got = _.arraySetDiff( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'all of the elements is present in both arrays';
  var a = [ 3, 3, 3 ];
  var b = [ 3, 3, 3, 3 ];
  var got = _.arraySetDiff( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );


  /**/

  /* special cases */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySetDiff();
  });

  test.description = 'too few arguments';
  test.shouldThrowError( function()
  {
    _.arraySetDiff([ 1, 2, 3, 4 ]);
  });

  test.description = 'too much arguments';
  test.shouldThrowError( function()
  {
    _.arraySetDiff([ 1, 2, 3, 4 ], [ 5, 7, 8, 9 ], [ 13, 15, 17 ]);
  });


  test.description = 'one or both arguments are not arrayLike entities, numeric arguments';
  test.shouldThrowError( function()
  {
    _.arraySetDiff( 10, 15 );
  });

  test.description = 'one or both arguments are not arrayLike entities, string like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetDiff( 'a', 'c' );
  });

  test.description = 'one or both arguments are not arrayLike entities, map arguments';
  test.shouldThrowError( function()
  {
    _.arraySetDiff( { a : 1 }, { b : 3, c : 8 } );
  });

  test.description = 'wrong argument';
  test.shouldThrowError( function()
  {
    _.arraySetDiff( [ 1, 2, 3 ], "wrong argument" );
  });

  test.description = 'both arguments are null';
  test.shouldThrowError( function()
  {
    _.arraySetDiff( null, null );
  });

  test.description = 'both arguments are undefined';
  test.shouldThrowError( function()
  {
    _.arraySetDiff( undefined, undefined );
  });

  var cases =
  [
    { src1 : [], src2 : [], expected : [] },
    { src1 : [ 1, 2, 3 ], src2 : [], expected : [ 1, 2, 3 ] },
    { src1 : [], src2 : [ 1, 2, 3 ], expected : [ 1, 2, 3 ] },
    { src1 : [ 1, 2, 3 ], src2 : [ 4, 5, 6 ], expected : [ 1, 2, 3, 4, 5, 6 ] },
    { src1 : [ 1, 2, 3 ], src2 : [ 3, 4, 5 ], expected : [ 1, 2, 4, 5 ] },
    { src1 : [ 1, 1, 2, 2, 3, 3 ], src2 : [ 1, 2, 3 ], expected : [] },
    { src1 : [ 1, 1, 2, 3, 3 ], src2 : [ 3, 3, 4, 5, 5 ], expected : [ 1, 1, 2, 4, 5, 5 ] },
    { src1 : 1, src2 : 1, error : true },
  ]

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];

    if( c.error )
    test.shouldThrowError( () => _.arraySetDiff( c.src1, c.src2 ) );
    else
    test.identical( _.arraySetDiff( c.src1, c.src2 ), c.expected );
  }
}

//

function arraySetIntersection( test )
{

  test.description = 'three arguments with one intersect';
  var a = [ 1, 2, 3, 4, 15 ];
  var b = [ 1, 2, 3, 4, 5 ];
  var c = [ 4, 15, 16, 17 ];
  var got = _.arraySetIntersection( a, b, c );
  var expected = [ 4 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'three arguments with many intersects';
  var a = [ 1, 2, 3, 4, 15 ];
  var b = [ 1, 2, 3, 4, 5 ];
  var c = [ 1, 2, 4, 15, 16, 17 ];
  var got = _.arraySetIntersection( a, b, c );
  var expected = [ 1, 2, 4 ];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );


  test.description = 'three arguments with no intersects';
  var a = [ 1, 2, 3, 4, 15 ];
  var b = [ 1, 2, 3, 4, 5 ];
  var c = [ 15, 16, 17 ];
  var got = _.arraySetIntersection( a, b, c );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );


  test.description = 'single array argument';
  var a = [ 1, 2, 3, 4, 15 ];
  var got = _.arraySetIntersection( a );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );

  test.description = 'first argument is an empty array';
  var a = [];
  var b = [ 1, 2, 3, 4, 15 ];
  var got = _.arraySetIntersection( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'first and second argument are empty arrays';
  var a = [];
  var b = [];
  var got = _.arraySetIntersection( a, b );
  var expected = [];
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  /**/

  /* special cases */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySetIntersection();
  });

  test.description = 'one or several arguments are not arrayLike entities, numerical arguments';
  test.shouldThrowError( function()
  {
    _.arraySetIntersection( 10, 15, 25 );
  });

  test.description = 'one or both arguments are not arrayLike entities, string like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetIntersection( 'a', 'c' );
  });

  test.description = 'one or both arguments are not arrayLike entities, map arguments';
  test.shouldThrowError( function()
  {
    _.arraySetIntersection( { a : 1 }, { b : 3, c : 8 } );
  });

  test.description = 'wrong argument';
  test.shouldThrowError( function()
  {
    _.arraySetIntersection( [ 1, 2, 3 ], "wrong argument" );
  });

  test.description = 'one or more arguments are null';
  test.shouldThrowError( function()
  {
    _.arraySetIntersection( null, null );
  });

  test.description = 'one or more arguments are undefined';
  test.shouldThrowError( function()
  {
    _.arraySetIntersection( undefined, undefined );
  });

  var cases =
  [
    { args : [ [] ], expected : [] },
    { args : [ [ 1 ], [ ] ], expected : [] },
    { args : [ [ ], [ 1 ] ], expected : [] },
    { args : [ [ 1 ], [ 2 ] ], expected : [] },
    { args : [ [ 1, 2, 3 ], [ 2 ] ], expected : [ 2 ] },
    { args : [ [ 1, 2, 3 ], [ 2 ], [ 1 ], [ 3 ] ], expected : [] },
    { args : [ [ 1, 1, 1 ], [ 1 ] ], expected : [ 1 ] },
    { args : [ [ 1, 2, 3 ], [ 0 ], [ 4 ], [ 0, 0, 3 ] ], expected : [] },
    { args : [ [ 1, 2, 3 ], [ 0 ], 1, [ 3 ] ], error : true },
    { args : [ 1 ], error : true },
  ]

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];

    if( c.error )
    test.shouldThrowError( () => _.arraySetIntersection.apply( _,c.args ) );
    else
    test.identical( _.arraySetIntersection.apply( _,c.args ) , c.expected );
  }
}

//

function arraySetContainAll( test )
{
  var cases =
  [
    { args : [ [], [] ], expected : true },
    { args : [ [ 1 ], [] ], expected : false },
    { args : [ [ 1 ], [ 1 ] ], expected : true },
    { args : [ [ 1, 1 ], [ 1, 1, 1 ] ], expected : true },
    { args : [ [ 1, 1, 1 ], [ 1, 1 ] ], expected : false },
    { args : [ [ 1 ], [ 1 ], [ 1 ], [] ], expected : false },
    { args : [ [ 1 ], [ 1 ], [ 1 ], [ 1, 1, 1 ] ], expected : true },
    { args : [ [ 1 ], [ 0, 1 ], [ 3, 2, 1 ], [ 1 ] ], expected : true },
    { args : [ [ 1, 2, 3 ], [ 1, 2, 3 ], [ 3, 2, 1 ], [ 1, 2 ] ], expected : false },
    { args : [ [], [ 1, 2, 3 ], [ 3, 2, 1 ], [ 1, 2 ] ], expected : true },
    { args : [ [], 1, [ 3, 2, 1 ], [ 1, 2 ] ], error : true },
    { args : [ 1 ], error : true },
  ]

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];

    if( c.error )
    test.shouldThrowError( () => _.arraySetContainAll.apply( _,c.args ) );
    else
    test.identical( _.arraySetContainAll.apply( _,c.args ) , c.expected );
  }
}

//

function arraySetContainSomething( test )
{

  test.description = 'second and third arrays contains several values from (src) array';
  var a = [ 33, 4, 5, 'b', 'c' ];
  var b = [ 1, 'b', 'c', 4 ];
  var c = [ 33, 13, 3 ];
  var got = _.arraySetContainSomething( a, b, c );
  var expected = true;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'second array is empty, third array contains elements from (src) array';
  var a = [ 33, 4, 5, 'b', 'c' ];
  var b = [];
  var c = [33];
  var got = _.arraySetContainSomething( a, b, c );
  var expected = true;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'second and third arrays doesn\'t contains matching elemets from (src) array';
  var a = [ 33, 4, 5, 'b', 'c' ];
  var b = [ 1, 'bcda', 'ce', 8 ];
  var c = [ 45, 13, 3 ];
  var got = _.arraySetContainSomething( a, b, c );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'first argument is an empty array';
  var a = [];
  var b = [ 1, 'bcda', 'ce', 8 ];
  var c = [ 45, 13, 3 ];
  var got = _.arraySetContainSomething( a, b, c );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'following array are empty, (src) array is not empty';
  var a = [ 33, 4, 5, 'b', 'c' ];
  var b = [];
  var c = [];
  var got = _.arraySetContainSomething( a, b, c );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'all the arrays (arguments) are empty';
  var a = [];
  var b = [];
  var c = [];
  var got = _.arraySetContainSomething( a, b, c );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );
  test.shouldBe( got !== c );

  test.description = 'one argument (non empty array) passed';
  var a = [ 33, 4, 5, 'b', 'c' ];
  var got = _.arraySetContainSomething( a );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );

  /**/

  /* special cases */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainSomething();
  });

  test.description = 'one or several arguments are not arrayLike entities,numeric arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainSomething( [ 33, 4, 5, 'b', 'c' ], 15, 25 );
  });

  test.description = 'one or several arguments are not arrayLike entities,string like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainSomething( [ 33, 4, 5, 'b', 'c' ], 'dfdf', 'ab' );
  });

  test.description = 'one or several arguments are not arrayLike entities,map like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetContainSomething( [ 33, 4, 5, 'b', 'c' ], { a : 33 }, { b : 44 } );
  });

  test.description = 'wrong argument';
  test.shouldThrowError( function()
  {
    _.arraySetContainSomething( [ 1, 2, 3 ], "wrong argument" );
  });

  var cases =
  [
    { args : [ [], [] ], expected : false },
    { args : [ [ 1, 2, 3 ], [ 1 ] ], expected : true },
    { args : [ [ 1, 2, 3 ], [], [ 3 ] ], expected : true },
    { args : [ [ 1, 2, 3 ], [ 0, 1 ], [ 9, 3 ] ], expected : true },
    { args : [ [ 1, 2, 3 ], [ 4 ], [ 3 ] ], expected : true },
    { args : [ [], [ 0 ], [ 4 ], [ 3 ] ], expected : false },
    { args : [ [ 1, 2, 3 ], [ 4 ], [ 5 ]  ], expected : false },
    { args : [ [ 0, 0, 0, 1 ], [ 5 ], [ 6 ], [ 2, 1 ]  ], expected : true },
    { args : [ [ 1, 2, 3 ], [ 4 ], 1  ], error : true },
    { args : [ 1, [ 4 ], 1  ], error : true },
  ]

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];

    if( c.error )
    test.shouldThrowError( () => _.arraySetContainSomething.apply( _,c.args ) );
    else
    test.identical( _.arraySetContainSomething.apply( _,c.args ) , c.expected );
  }
}

//

function arraySetIdentical( test )
{

  test.description = 'arguments have the same elements but the order is differ';
  var a = [ 1, 2, 4, 7, 5 ];
  var b = [ 4, 2, 1, 5, 7 ];
  var got = _.arraySetIdentical( a, b );
  var expected = true;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'argument length mismatch';
  var a = [ 1, 2, 4, 7, 5 ];
  var b = [ 1, 5, 7 ];
  var got = _.arraySetIdentical( a, b );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'arguments have the same elements have inner arrays';
  var a = [ 1, 2, [ 1, 3], 7, 5 ];
  var b = [ [ 1, 3], 2, 1, 5, 7 ];
  var got = _.arraySetIdentical( a, b );
  var expected = false;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  test.description = 'both arrays are empty';
  var a = [];
  var b = [];
  var got = _.arraySetIdentical( a, b );
  var expected = true;
  test.identical( got, expected );
  test.shouldBe( got !== a );
  test.shouldBe( got !== b );

  /**/

  /* special cases */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.arraySetIdentical();
  });

  test.description = 'one or 2 arguments are not arrayLike entities, numeric argument';
  test.shouldThrowError( function()
  {
    _.arraySetIdentical( [ 1, 2, 4, 7, 5 ], 15 );
  });

  test.description = 'one or 2 arguments are not arrayLike entities, string like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetIdentical( 'a', 'a' );
  });

  test.description = 'one or 2 arguments are not arrayLike entities, map like arguments';
  test.shouldThrowError( function()
  {
    _.arraySetIdentical( { a : 1 }, { b : 3, c : 8 } );
  });

  test.description = 'wrong argument';
  test.shouldThrowError( function()
  {
    _.arraySetIdentical( [ 1, 2, 4, 7, 5 ], "wrong argument" );
  });

  test.description = 'both arguments are null';
  test.shouldThrowError( function()
  {
    _.arraySetIdentical( null, null );
  });

  test.description = 'both arguments are undefined';
  test.shouldThrowError( function()
  {
    _.arraySetIdentical( undefined, undefined );
  });


  var cases =
  [
    { args : [ [], [] ], expected : true },
    { args : [ [ 1 ], [] ], expected : false },
    { args : [ [ 1 ], [ 1 ] ], expected : true },
    { args : [ [ 1, 1 ], [ 1 ] ], expected : false },
    { args : [ [ 1 ], [ 1, 1 ] ], expected : false },
    { args : [ [ 1, 2, 3 ], [ 1, 2, 4 ] ], expected : false },
    { args : [ [ 1, 2, 3 ], [ 3, 2, 1 ] ], expected : true },
    { args : [ [ 1, 2, 3 ], [ 3, 2, 1 ] ], expected : true },
    { args : [ [ [ 1 ], 2, 3 ], [ 3, 2, [ 1 ] ] ], expected : false },
    { args : [ 1, [ 1 ] ], error : true },
    { args : [ [ 1 ], 1 ], error : true },
  ]

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];

    if( c.error )
    test.shouldThrowError( () => _.arraySetIdentical.apply( _,c.args ) );
    else
    test.identical( _.arraySetIdentical.apply( _,c.args ) , c.expected );
  }
}

//

// function arraySetContainSomething( test )
// {

//   test.description = 'returns false';
//   var got = _.arraySetContainSomething( [  ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
//   var expected = false;
//   test.identical( got, expected );

//   test.description = 'returns false';
//   var got = _.arraySetContainSomething( [  ] );
//   var expected = false;
//   test.identical( got, expected );

//   test.description = 'returns false';
//   var got = _.arraySetContainSomething( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
//   var expected = false;
//   test.identical( got, expected );

//   test.description = 'matching from arguments[1]';
//   var got = _.arraySetContainSomething( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
//   var expected = true;
//   test.identical( got, expected );

//   test.description = 'matching from arguments[2]';
//   var got = _.arraySetContainSomething( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
//   var expected = true;
//   test.identical( got, expected );

//   /**/

//   if( !Config.debug )
//   return;

//   test.description = 'no arguments';
//   test.shouldThrowError( function()
//   {
//     _.arraySetContainSomething();
//   });

//   test.description = 'wrong arguments';
//   test.shouldThrowError( function()
//   {
//     _.arraySetContainSomething( [ 1, 2, 3, 4 ], 'wrong arguments' );
//   });

// };

// --
// not sorted
// --

//

// function arrayNewOfSameLength( test )
// {
//
//   test.description = 'nothing';
//   var got = _.arrayNewOfSameLength( [  ] );
//   var expected = [  ];
//   test.identical( got, expected );
//
//   test.description = 'length = 3';
//   var got = _.arrayNewOfSameLength( [ 1, 2, 3 ] );
//   var expected = [ , , , ];
//   test.identical( got, expected );
//
//   /**/
//
//   if( Config.debug )
//   {
//
//     test.description = 'no arguments';
//     test.shouldThrowError( function()
//     {
//       _.arrayNewOfSameLength();
//     });
//
//     test.description = 'extra argument';
//     test.shouldThrowError( function()
//     {
//       _.arrayNewOfSameLength( [ 1, 2, 3 ], 'redundant argument' );
//     });
//
//     test.description = 'argument is not wrapped into array';
//     test.shouldThrowError( function()
//     {
//       _.arrayNewOfSameLength( 1, 2, 3 );
//     });
//
//   }
//
// };

//

var Self =
{

  name : 'wTools.array',
  // verbosity : 7,
  // routine : 'bufferRelen',

  tests :
  {

    // buffer

    bufferRelen : bufferRelen,
    bufferRetype : bufferRetype,
    bufferRawFromBuffer : bufferRawFromBuffer,


    // type test

    arrayIs : arrayIs,
    arrayLike : arrayLike,
    clsLikeArray : clsLikeArray,
    hasLength : hasLength,


    // array maker

    arrayMakeSimilar : arrayMakeSimilar,
    arrayMakeSimilarZeroed : arrayMakeSimilarZeroed,
    arrayMakeRandom : arrayMakeRandom,
    arrayFromNumber : arrayFromNumber,
    arrayFromRange : arrayFromRange,
    arrayFrom : arrayFrom,
    arrayAs : arrayAs,

    arrayToMap : arrayToMap,
    arrayToStr : arrayToStr,


    // array transformer

    arraySub : arraySub,
    // arrayJoin : arrayJoin,
    arrayGrow : arrayGrow,
    arrayResize : arrayResize,
    arraySlice : arraySlice,
    arrayDuplicate : arrayDuplicate,

    arrayMask : arrayMask,

    arraySelect : arraySelect,


    // array manipulator

    arraySwap : arraySwap,
    arrayCutin : arrayCutin,
    arrayPut : arrayPut,
    // arrayFill : arrayFill,
    arrayFillTimes : arrayFillTimes,
    arrayFillWhole : arrayFillWhole,

    arraySupplement : arraySupplement,
    arrayExtendScreening : arrayExtendScreening,


    // array sequential search

    arrayLeftIndexOf : arrayLeftIndexOf,

    arrayLeft : arrayLeft,

    arrayCount : arrayCount,
    arrayCountUnique : arrayCountUnique,


    // array checker

    arrayCompare : arrayCompare,
    arrayIdentical : arrayIdentical,

    arrayHasAny : arrayHasAny,


    // array etc

    arraySum : arraySum,


    // array prepend

    arrayPrepend : arrayPrepend,
    arrayPrependOnce : arrayPrependOnce,
    arrayPrependOnceStrictly : arrayPrependOnceStrictly,
    arrayPrepended : arrayPrepended,
    arrayPrependedOnce : arrayPrependedOnce,

    arrayPrependArray : arrayPrependArray,
    arrayPrependArrayOnce : arrayPrependArrayOnce,
    arrayPrependArrayOnceStrictly : arrayPrependArrayOnceStrictly,
    arrayPrependedArray : arrayPrependedArray,
    arrayPrependedArrayOnce : arrayPrependedArrayOnce,

    arrayPrependArrays : arrayPrependArrays,
    arrayPrependArraysOnce : arrayPrependArraysOnce,
    arrayPrependArraysOnceStrictly : arrayPrependArraysOnceStrictly,
    arrayPrependedArrays : arrayPrependedArrays,
    arrayPrependedArraysOnce : arrayPrependedArraysOnce,


    // array append

    arrayAppend : arrayAppend,
    arrayAppended : arrayAppended,
    arrayAppendOnce : arrayAppendOnce,
    arrayAppendedOnce : arrayAppendedOnce,
    arrayAppendOnceStrictly : arrayAppendOnceStrictly,

    arrayAppendArray : arrayAppendArray,
    arrayAppendedArray : arrayAppendedArray,
    arrayAppendArrayOnce : arrayAppendArrayOnce,
    arrayAppendedArrayOnce : arrayAppendedArrayOnce,
    arrayAppendArrayOnceStrictly : arrayAppendArrayOnceStrictly,

    arrayAppendArrays : arrayAppendArrays,
    arrayAppendArraysOnce : arrayAppendArraysOnce,
    arrayAppendArraysOnceStrictly : arrayAppendArraysOnceStrictly,
    arrayAppendedArrays : arrayAppendedArrays,
    arrayAppendedArraysOnce : arrayAppendedArraysOnce,


    // array remove

    arrayRemove : arrayRemove,
    arrayRemoved : arrayRemoved,
    arrayRemoveOnce : arrayRemoveOnce,
    // _arrayRemoved : _arrayRemoved,
    arrayRemovedOnce : arrayRemovedOnce,
    arrayRemoveOnceStrictly : arrayRemoveOnceStrictly,

    arrayRemoveArray : arrayRemoveArray,
    arrayRemovedArray : arrayRemovedArray,
    arrayRemoveArrayOnce : arrayRemoveArrayOnce,
    arrayRemovedArrayOnce : arrayRemovedArrayOnce,
    arrayRemoveArrayOnceStrictly : arrayRemoveArrayOnceStrictly,

    arrayRemoveArrays : arrayRemoveArrays,
    arrayRemovedArrays : arrayRemovedArrays,
    arrayRemoveArraysOnce : arrayRemoveArraysOnce,
    arrayRemovedArraysOnce : arrayRemovedArraysOnce,
    arrayRemoveArraysOnceStrictly : arrayRemoveArraysOnceStrictly,

    arrayRemoveAll : arrayRemoveAll,
    // arrayRemoveAll : arrayRemoveAll,
    arrayRemovedAll : arrayRemovedAll,


    // array flatten

    arrayFlatten : arrayFlatten,
    arrayFlattenOnce : arrayFlattenOnce,
    arrayFlattenOnceStrictly : arrayFlattenOnceStrictly,
    arrayFlattened : arrayFlattened,
    arrayFlattenedOnce : arrayFlattenedOnce,

    arrayFlatten2 : arrayFlatten2,


    // array replace

    arrayReplaceOnce : arrayReplaceOnce,
    arrayReplaceOnceStrictly : arrayReplaceOnceStrictly,
    arrayReplacedOnce : arrayReplacedOnce,

    arrayReplaceArrayOnce : arrayReplaceArrayOnce,
    arrayReplaceArrayOnceStrictly : arrayReplaceArrayOnceStrictly,
    arrayReplacedArrayOnce : arrayReplacedArrayOnce,

    arrayReplaceArraysOnce : arrayReplaceArraysOnce,
    arrayReplaceArraysOnceStrictly : arrayReplaceArraysOnceStrictly,
    arrayReplacedArraysOnce : arrayReplacedArraysOnce,

    arrayReplaceAll : arrayReplaceAll,
    arrayReplacedAll : arrayReplacedAll,

    arrayUpdate : arrayUpdate,


    // array set

    arraySetBut : arraySetBut,
    arraySetDiff : arraySetDiff,
    arraySetIntersection : arraySetIntersection,
    arraySetContainAll: arraySetContainAll,
    arraySetContainSomething : arraySetContainSomething,
    arraySetIdentical : arraySetIdentical

  }

}

Self = wTestSuit( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );
