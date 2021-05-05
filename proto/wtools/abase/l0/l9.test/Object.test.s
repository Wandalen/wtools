( function _l0_l9_Object_test_s_()
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

//--
// tests
//--

/* qqq : for junior : extend */
function dichotomy( test )
{

  test.case = 'map.polluted';
  var src = {};
  test.true( _.object.is( src ) );
  test.true( _.object.isBasic( src ) );
  test.true( _.object.like( src ) );
  test.true( !_.object.likeStandard( src ) );
  test.true( _.object.isEmpty( src ) );
  test.true( !_.object.isPopulated( src ) );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  test.true( _.object.is( src ) );
  test.true( !_.object.isBasic( src ) );
  test.true( _.object.like( src ) );
  test.true( !_.object.likeStandard( src ) );
  test.true( !_.object.isEmpty( src ) );
  test.true( _.object.isPopulated( src ) );

  test.case = 'propertyTransformer & filter';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
  test.true( !_.object.is( src ) );
  test.true( !_.object.isBasic( src ) );
  test.true( !_.object.like( src ) );
  test.true( !_.object.likeStandard( src ) );
  test.true( !_.object.isEmpty( src ) );
  test.true( !_.object.isPopulated( src ) );

  test.case = 'propertyTransformer & mapper';
  var src = _.props.mapper[ 'assigning' ];
  test.true( !_.object.is( src ) );
  test.true( !_.object.isBasic( src ) );
  test.true( !_.object.like( src ) );
  test.true( !_.object.likeStandard( src ) );
  test.true( !_.object.isEmpty( src ) );
  test.true( !_.object.isPopulated( src ) );

  test.case = 'time';
  var src = _.time.now();
  test.true( !_.object.is( src ) );
  test.true( !_.object.isBasic( src ) );
  test.true( !_.object.like( src ) );
  test.true( !_.object.likeStandard( src ) );
  test.true( !_.object.isEmpty( src ) );
  test.true( !_.object.isPopulated( src ) );

  test.case = 'timer';
  var src = _.time._begin( Infinity );
  test.true( _.object.is( src ) );
  test.true( _.object.isBasic( src ) );
  test.true( _.object.isBasic( src ) );
  test.true( _.object.like( src ) );
  test.true( !_.object.likeStandard( src ) );
  test.true( !_.object.isEmpty( src ) );
  test.true( _.object.isPopulated( src ) );
  _.time.cancel( src );

  test.case = 'printerLike';
  var src = _global_.logger;
  test.true( _.object.is( src ) );
  test.true( _.object.isBasic( src ) );
  test.true( _.object.isBasic( src ) );
  test.true( _.object.like( src ) );
  test.true( !_.object.likeStandard( src ) );
  test.true( !_.object.isEmpty( src ) );
  test.true( _.object.isPopulated( src ) );

}

// --
//
// --

const Proto =
{

  name : 'Tools.Object.l0.l9',
  silencing : 1,

  tests :
  {

    dichotomy,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
