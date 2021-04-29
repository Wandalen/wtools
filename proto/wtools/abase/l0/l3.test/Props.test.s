( function _l0_l3_Props_test_s()
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

//--
// map checker
//--

/* qqq : for junior : extend with construbile* cases */
/* qqq : for junior : extend with props checks */
function dichotomy( test )
{

  test.case = 'pure empty map';
  var src = Object.create( null );
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), true );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), true );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), true );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'pure map with constructor';
  var src = Object.create( null );
  src.constructor = function(){};
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), true );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'from pure with iterator';
  var src = Object.create( null );
  src[ Symbol.iterator ] = function(){};
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'empty polluted map';
  var src = {};
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.map.isEmpty( src ), true );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'polluted map';
  var src = { a : 7, b : 13 };
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'polluted map with constructor';
  var src = {};
  src.constructor = function(){};
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), true );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'from polluted with iterator';
  var src = {};
  src[ Symbol.iterator ] = function(){};
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'new object';
  var src = new Object();
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), true );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), true );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.map.isEmpty( src ), true );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'empty array';
  var src = [];
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'empty arguments array';
  var src = _.argumentsArray.make();
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'undefined';
  var src = undefined;
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'null';
  var src = null;
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'string';
  var src = 'str';
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'number';
  var src = 13;
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'symbol';
  var src = Symbol.for( 'a' );
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'boolean false';
  var src = true;
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'boolean true';
  var src = true;
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'routine';
  var src = function() {};
  test.identical( _.object.isBasic( src ), false );
  test.identical( _.object.like( src ), false );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from pure map deep';
  var prototype1 = Object.create( null );
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from pure map deep with props';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), true );

  test.case = 'prototyped from polluted map';
  var prototype = {};
  var src = Object.create( prototype );
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from polluted map with constructor';
  var prototype = {};
  prototype.constructor = function(){};
  var src = Object.create( prototype );
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), false );
  test.identical( _.aux.isPrototyped( src ), false );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), false );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from polluted map deep';
  var prototype1 = {};
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), true );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), false );

  test.case = 'prototyped from polluted map deep with props';
  var prototype1 = {};
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  test.identical( _.object.isBasic( src ), true );
  test.identical( _.object.like( src ), true );
  test.identical( _.mapIs( src ), false );
  test.identical( _.aux.is( src ), true );
  test.identical( _.aux.isPrototyped( src ), true );
  test.identical( _.mapIsPure( src ), false );
  test.identical( _.mapIsPolluted( src ), false );
  test.identical( _.aux.isPolluted( src ), true );
  test.identical( _.map.isEmpty( src ), false );
  test.identical( _.aux.isEmpty( src ), false );
  test.identical( _.map.isPopulated( src ), false );
  test.identical( _.aux.isPopulated( src ), true );

}

//

function exportStringShallowDiagnostic( test )
{

  test.case = 'pure empty map';
  var src = Object.create( null );
  var exp = '{- Map.pure with 0 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'pure map';
  var src = Object.create( null );
  var exp = '{- Map.pure with 1 elements -}';
  src.x = 1;
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'empty polluted map';
  var src = {};
  var exp = '{- Map.polluted with 0 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'polluted map';
  var src = { a : 7, b : 13 };
  var exp = '{- Map.polluted with 2 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var exp = '{- Aux.pure.prototyped with 0 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'prototyped from pure map deep';
  var prototype1 = Object.create( null );
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  var exp = '{- Aux.pure.prototyped with 0 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'prototyped from pure map deep with props';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  var exp = '{- Aux.pure.prototyped with 2 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'prototyped from polluted map';
  var prototype = {};
  var src = Object.create( prototype );
  var exp = '{- Aux.polluted.prototyped with 0 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'prototyped from polluted map deep';
  var prototype1 = {};
  var prototype2 = Object.create( prototype1 );
  var src = Object.create( prototype1 );
  var exp = '{- Aux.polluted.prototyped with 0 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'prototyped from polluted map deep with props';
  var prototype1 = {};
  prototype1.a = 1;
  var prototype2 = Object.create( prototype1 );
  prototype2.b = 1;
  var src = Object.create( prototype1 );
  src.c = 1;
  var exp = '{- Aux.polluted.prototyped with 2 elements -}';
  var got = _.props.exportStringShallowDiagnostic( src );
  test.identical( got, exp );

  test.case = 'number with options map';
  var exp = '{- Number with 0 elements -}';
  var got = _.props.exportStringShallowDiagnostic( 13, {} );
  test.identical( got, exp );

  if( !Config.debug )
  return;

  test.case = 'no args'
  test.shouldThrowErrorSync( () => _.props.exportStringShallowDiagnostic() );

  test.case = 'bad second argument'
  test.shouldThrowErrorSync( () => _.props.exportStringShallowDiagnostic( {}, 'a' ) );

  test.case = 'extra argument'
  test.shouldThrowErrorSync( () => _.props.exportStringShallowDiagnostic( [], {}, 'a' ) );

}

//

function identicalShallow( test )
{

  test.case = 'same map';
  var src = { a : 1 }
  var got = _.props.identicalShallow( src, src );
  test.identical( got, true );

  test.case = 'same values';
  var got = _.props.identicalShallow( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'same values with nested objects';
  var got = _.props.identicalShallow( { a : 7, b : { c : 13 } }, { a : 7, b : { c : 13 } } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'not the same values in'
  var got = _.props.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 14 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the first argument'
  var got = _.props.identicalShallow( { 'a' : 7, 'b' : 13, 'с' : 15 }, { 'a' : 7, 'b' : 13 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'different number of keys, more in the second argument'
  var got = _.props.identicalShallow( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 13, 'с' : 15 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty maps, standrard'
  var got = _.props.identicalShallow( {}, {} );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, pure'
  var got = _.props.identicalShallow( Object.create( null ), Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'empty maps, one standard another pure'
  var got = _.props.identicalShallow( {}, Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.case = 'not object-like 1 arg';
  var got = _.props.identicalShallow( [ 'a', 7, 'b', 14 ], { a : 7, b : 14 } );
  var expected = false;
  test.identical( got, expected );
  var got = _.props.identicalShallow( { a : 7, b : 14 }, [ 'a', 7, 'b', 14 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'not object-like arguments';
  var got = _.props.identicalShallow( [ 'a', 7, 'b', 14 ], [ 'a', 7, 'b', 14 ] );
  var expected = true;
  test.identical( got, expected );

  test.case = 'not object-like arguments';
  var got = _.props.identicalShallow( [ 'a', 7, 'b', 13 ], [ 'a', 7, 'b', 14 ] );
  var expected = false;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.props.identicalShallow();
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.props.identicalShallow( {} );
  });

  test.case = 'redundant arguments';
  test.shouldThrowErrorSync( function()
  {
    _.props.identicalShallow( {}, {}, {}, 'redundant argument' );
  });

}

//

function onlyImplicit( test )
{

  /* */

  test.case = 'pure map';
  var src = Object.create( null );
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  var got = _.props.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'polluted map';
  var src = {};
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.props.implicit.prototype, Object.prototype );
  var got = _.props.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'prototyped from pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.props.implicit.prototype, prototype );
  var got = _.props.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'prototyped from pure map';
  var prototype = {};
  var src = Object.create( prototype );
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.props.implicit.prototype, prototype );
  var got = _.props.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'function';
  var src = function(){};
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.props.implicit.prototype, Object.getPrototypeOf( Function ) );
  var got = _.props.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'array';
  var src = [];
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.props.implicit.prototype, Array.prototype );
  var got = _.props.onlyImplicit( src );
  test.identical( got, exp );

  /* */

  test.case = 'arguments array';
  var src = _.argumentsArray.make();
  src.a = '1';
  src[ Symbol.for( 'a' ) ] = '1';
  var exp = new HashMap();
  exp.set( _.props.implicit.prototype, Object.prototype );
  var got = _.props.onlyImplicit( src );
  test.identical( got, exp );

  /* */

}

//

function aptLeft( test )
{

  /* */

  test.case = 'left';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.props.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 'a', 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.props.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 'b', 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.props.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 'c', 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      3,
      'c',
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.props.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 3, 'c', 2, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      'a',
      0,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      3,
      'c',
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = Object.create( Object.create( null ) );
  var ops = [];
  var got = _.props.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var exp = [ 1, 'a', 0, true ];
  var got = _.props.aptLeft( src );
  test.identical( got, exp );
  var exp = [ 1, 'a', 0, true ];
  var got = _.props.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = Object.create( Object.create( null ) );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.props.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.props.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRight( test )
{

  /* */

  test.case = 'left';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  debugger;
  var got = _.props.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  debugger;
  var exp = [ 11, 'a', 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      1,
      'a',
      0,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.props.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 'b', 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.props.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 'c', 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var ops = [];
  var got = _.props.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 1, 'a', 0, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      'c',
      2,
      src,
    ],
    [
      2,
      'b',
      1,
      src,
    ],
    [
      1,
      'a',
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = Object.create( Object.create( null ) );
  var ops = [];
  var got = _.props.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = Object.create({ a : 1, b : 2, c : 3 });
  var exp = [ 3, 'c', 2, true ];
  var got = _.props.aptRight( src );
  test.identical( got, exp );
  var exp = [ 3, 'c', 2, true ];
  var got = _.props.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = Object.create( Object.create( null ) );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.props.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.props.last( src );
  test.identical( got, exp );

  /* */

}

// --
// define test suite
// --

const Proto =
{

  name : 'Tools.Props.l0.l3',
  silencing : 1,

  tests :
  {

    dichotomy,
    exportStringShallowDiagnostic,
    identicalShallow,

    onlyImplicit,

    aptLeft,
    aptRight,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
