( function _l0_l9_Entity_test_s_()
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
// tests
// --

function assign( test )
{
  test.case = 'src null';
  var dst = 'string';
  var src = null;
  var got = _.entity.assign2( dst, src );
  var expected = null;
  test.identical( got, expected );

  test.case = 'dst.copy';
  var dst =
  {
    copy : function( src )
    {
      for( var i in src )
      this[ i ] = src[ i ]
    }
  };
  var src = { src : 'string', num : 123 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected =
  {
    copy : dst.copy,
    src : 'string',
    num : 123

  };
  test.identical( got, expected );

  test.case = 'src.clone';
  var dst = 1;
  var src = { src : 'string', num : 123, clone : function() { return { src : 'string', num : 123 } } }
  var got = _.entity.assign2( dst, src  );
  var expected = { src : 'string', num : 123 };
  test.identical( got, expected );
  test.true( got !== expected );
  test.true( got !== src );

  test.case = 'src.slice returns copy of array';
  var dst = [ ];
  var src = [ 1, 2, 3 ];
  var got = _.entity.assign2( dst, src  );
  var expected = src;
  test.identical( got, expected );

  test.case = 'dst.set ';
  var dst = { set : function( src ){ this.value = src[ 'value' ]; } };
  var src = { value : 100 };
  _.entity.assign2( dst, src  );
  var got = dst;
  var expected = { set : dst.set, value : 100 };
  test.identical( got, expected );

  test.case = 'onRecursive ';
  var dst = { };
  var src = { value : 100, a : {  b : 101 } };
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  _.entity.assign2( dst, src, onRecursive  );
  var got = dst;
  var expected = src;
  test.identical( got, expected );

  test.case = 'atomic ';
  var src = 2;
  var got = _.entity.assign2( null, src );
  var expected = src;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.entity.assign2( );
  });

  test.case = 'src.clone throws "unexpected"';
  test.shouldThrowErrorSync( function()
  {
    var dst = {};
    var src = { src : 'string', num : 123, clone : function() { var clone = _.cloneObject( { src : this } ); return clone; } }
    _.entity.assign2( dst, src  );
  });

}

//

function assignFieldFromContainer( test )
{
  test.case = 'non recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = dst[ name ];
  test.identical( got, expected );

  test.case = 'undefined';
  var dst ={};
  var src = { a : undefined };
  var name = 'a';
  var got = _.entity.assign2FieldFromContainer(dst, src, name );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'recursive';
  var dst ={};
  var src = { a : 'string' };
  var name = 'a';
  function onRecursive( dstContainer, srcContainer, key )
  {
    _.assert( _.strIs( key ) );
    dstContainer[ key ] = srcContainer[ key ];
  };
  var got = _.entity.assign2FieldFromContainer( dst, src, name, onRecursive );
  var expected = dst[ name ];
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entity.assign2FieldFromContainer() );
}

//

function uncountableSize( test )
{
  test.case = 'undefined';
  var got = _.uncountableSize( undefined );
  test.identical( got, 8 );

  test.case = 'null';
  var got = _.uncountableSize( null );
  test.identical( got, 8 );

  test.case = 'false';
  var got = _.uncountableSize( false );
  test.identical( got,  8);

  test.case = 'true';
  var got = _.uncountableSize( true );
  test.identical( got, 8 );

  test.case = 'zero';
  var got = _.uncountableSize( 0 );
  test.identical( got, 8 );

  test.case = 'number';
  var got = _.uncountableSize( 34 );
  test.identical( got, 8 );

  test.case = 'NaN';
  var got = _.uncountableSize( NaN );
  test.identical( got, 8 );

  test.case = 'Infinity';
  var got = _.uncountableSize( Infinity );
  test.identical( got, 8 );

  test.case = 'empty string';
  var got = _.uncountableSize( '' );
  test.identical( got, 0 );

  test.case = 'string';
  var got = _.uncountableSize( 'str' );
  test.identical( got, 3 );

  test.case = 'symbol';
  var got = _.uncountableSize( Symbol.for( 'x' ) );
  test.identical( got, 8 );

  test.case = 'empty array';
  var got = _.uncountableSize( [] );
  test.identical( got, NaN );

  test.case = 'array';
  var got = _.uncountableSize( [ [ 23, 17 ], undefined, 34 ] );
  test.identical( got, NaN );

  test.case = 'argumentsArray';
  var got = _.uncountableSize( _.argumentsArray.make( [ 1, [ 2, 3 ], 4 ] ) );
  test.identical( got, NaN );

  test.case = 'unroll';
  var got = _.uncountableSize( _.argumentsArray.make( [ 1, 2, [ 3, 4 ] ] ) );
  test.identical( got, NaN );

  test.case = 'BufferTyped';
  var got = _.uncountableSize( new U8x( [ 1, 2, 3, 4 ] ) );
  test.identical( got, 4 );

  test.case = 'BufferRaw';
  var got = _.uncountableSize( new BufferRaw( 10 ) );
  test.identical( got, 10 );

  test.case = 'BufferView';
  var got = _.uncountableSize( new BufferView( new BufferRaw( 10 ) ) );
  test.identical( got, 10 );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var got1 = _.uncountableSize( BufferNode.from( [ 1, 2, 3, 4 ] ) );
    test.identical( got1, 4 );
  }

  test.case = 'Set';
  var got = _.uncountableSize( new Set( [ 1, 2, undefined, 4 ] ) );
  test.identical( got, NaN );

  test.case = 'map';
  var got = _.uncountableSize( { a : 1, b : 2, c : { d : 3 } } );
  test.identical( got, NaN );

  test.case = 'HashMap';
  var got = _.uncountableSize( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
  test.identical( got, NaN );

  test.case = 'function';
  var got = _.uncountableSize( function(){} );
  test.identical( got, 8 );

  test.case = 'instance of class';
  function Constr1()
  {
    this.a = 34;
    this.b = 's';
    this[ 100 ] = 'sms';
  };
  var got = _.uncountableSize( new Constr1() );
  test.identical( got, 8 );

  test.case = 'object, some properties are non enumerable';
  var src = Object.create( null );
  var o =
  {
    'property3' :
    {
      enumerable : true,
      value : 'World',
      writable : true
    }
  };
  Object.defineProperties( src, o );
  var got = _.uncountableSize( src );
  test.identical( got, NaN );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.uncountableSize() );
}

//

/* zzz : find better solution instead of `_.look ?` */

function entitySize( test )
{
  test.case = 'undefined';
  var got = _.entitySize( undefined );
  test.identical( got, 8 );

  test.case = 'null';
  var got = _.entitySize( null );
  test.identical( got, 8 );

  test.case = 'false';
  var got = _.entitySize( false );
  test.identical( got,  8);

  test.case = 'true';
  var got = _.entitySize( true );
  test.identical( got, 8 );

  test.case = 'zero';
  var got = _.entitySize( 0 );
  test.identical( got, 8 );

  test.case = 'number';
  var got = _.entitySize( 34 );
  test.identical( got, 8 );

  test.case = 'NaN';
  var got = _.entitySize( NaN );
  test.identical( got, 8 );

  test.case = 'Infinity';
  var got = _.entitySize( Infinity );
  test.identical( got, 8 );

  test.case = 'empty string';
  var got = _.entitySize( '' );
  test.identical( got, 0 );

  test.case = 'string';
  var got = _.entitySize( 'str' );
  test.identical( got, 3 );

  test.case = 'symbol';
  var got = _.entitySize( Symbol.for( 'x' ) );
  test.identical( got, 8 );

  /* zzz : temp fix */ /* Dmytro : the second part of test routine in module Looker */

  if( !_.look ) /* prevents fails if Looker is included */
  {
    test.case = 'empty array';
    var got = _.entitySize( [] );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'array';
    var got = _.entitySize( [ 3, undefined, 34 ] );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'argumentsArray';
    var got = _.entitySize( _.argumentsArray.make( [ 1, null, 4 ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'unroll';
    var got = _.entitySize( _.argumentsArray.make( [ 1, 2, 'str' ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'BufferTyped';
    var got = _.entitySize( new U8x( [ 1, 2, 3, 4 ] ) );
    test.identical( got, 4 );

    test.case = 'BufferRaw';
    var got = _.entitySize( new BufferRaw( 10 ) );
    test.identical( got, 10 );

    test.case = 'BufferView';
    var got = _.entitySize( new BufferView( new BufferRaw( 10 ) ) );
    test.identical( got, 10 );

    if( Config.interpreter === 'njs' )
    {
      test.case = 'BufferNode';
      var got1 = _.entitySize( BufferNode.from( [ 1, 2, 3, 4 ] ) );
      test.identical( got1, 4 );
    }

    test.case = 'Set';
    var got = _.entitySize( new Set( [ 1, 2, undefined, 4 ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'map';
    var got = _.entitySize( { a : 1, b : 2, c : 'str' } );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'HashMap';
    var got = _.entitySize( new Map( [ [ undefined, undefined ], [ 1, 2 ], [ '', 'str' ] ] ) );
    var exp = NaN;
    test.identical( got, exp );

    test.case = 'function';
    var got = _.entitySize( function(){} );
    test.identical( got, 8 );

    test.case = 'instance of class';
    function Constr1()
    {
      this.a = 34;
      this.b = 's';
      this[ 100 ] = 'sms';
    };
    var got = _.entitySize( new Constr1() );
    test.identical( got, 8 );

    test.case = 'object, some properties are non enumerable';
    var src = Object.create( null );
    var o =
    {
      'property3' :
      {
        enumerable : true,
        value : 'World',
        writable : true
      }
    };
    Object.defineProperties( src, o );
    var got = _.entitySize( src );
    var exp = NaN;
    test.identical( got, exp );
  }

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.entitySize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.entitySize( 1, 2 ) );
  test.shouldThrowErrorSync( () => _.entitySize( 1, 'extra' ) );
}

// --
//
// --

const Proto =
{

  name : 'Tools.Entity.l0.l9',
  silencing : 1,

  tests :
  {

    assign,
    assignFieldFromContainer,

    uncountableSize,
    entitySize,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
