( function _l0_l9_Class_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{

  const _ = require( 'Tools' );
  _.include( 'wTesting' );

}

const _global = _global_;
const _ = _global_.wTools;

// --
// tests
// --

function methodIteratorOf( test )
{
  test.case = 'without argument';
  var got = _.class.methodIteratorOf();
  var expected = false;
  test.identical( got, expected );

  test.case = 'undefined';
  var got = _.class.methodIteratorOf( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.class.methodIteratorOf( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.class.methodIteratorOf( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.class.methodIteratorOf( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.class.methodIteratorOf( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.class.methodIteratorOf( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.class.methodIteratorOf( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.class.methodIteratorOf( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.class.methodIteratorOf( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = constr;
  function constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.class.methodIteratorOf( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var src = 'str';
  var got = _.class.methodIteratorOf( src );
  var expected = src[ _.class.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an array';
  var src = [];
  var got = _.class.methodIteratorOf( src );
  var expected = src[ _.class.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an unroll';
  var src = _.unroll.make( 1 );
  var got = _.class.methodIteratorOf( src );
  var expected = src[ _.class.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'an argumentsArray';
  var src = _.argumentsArray.make( 1 );
  var got = _.class.methodIteratorOf( _.argumentsArray.make( [ 1 ] ) );
  var expected = src[ _.class.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.class.methodIteratorOf( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.class.methodIteratorOf( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped';
  var src = new U8x([ 5 ]);
  var got = _.class.methodIteratorOf( src );
  var expected = src[ _.class.iteratorSymbol ];
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    var src = BufferNode.alloc( 3 );
    let got = _.class.methodIteratorOf( src );
    var expected = src[ _.class.iteratorSymbol ];
    test.identical( got, expected );
  }

  test.case = 'Set';
  var src = new Set([ 5 ]);
  var got = _.class.methodIteratorOf( src );
  var expected = src[ _.class.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'Map';
  var src = new Map([ [ 1, 2 ] ]);
  var got = _.class.methodIteratorOf( src );
  var expected = src[ _.class.iteratorSymbol ];
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.class.methodIteratorOf( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.class.methodIteratorOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.class.methodIteratorOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.class.methodIteratorOf( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.class.methodIteratorOf( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );
}

//

/* qqq : for Yevhen : extend the routine, please */
function methodEqualOf( test )
{
  test.case = 'without argument';
  var got = _.class.methodEqualOf();
  var expected = false;
  test.identical( got, expected );

  test.case = 'undefined';
  var got = _.class.methodEqualOf( undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.class.methodEqualOf( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'false';
  var got = _.class.methodEqualOf( false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.class.methodEqualOf( '' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'zero';
  var got = _.class.methodEqualOf( 0 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'NaN';
  var got = _.class.methodEqualOf( NaN );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a boolean';
  var got = _.class.methodEqualOf( true );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a number';
  var got = _.class.methodEqualOf( 13 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a function';
  var got = _.class.methodEqualOf( function() {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'constructor';
  var Constr = constr;
  function constr( x )
  {
    this.x = x;
    return this;
  }
  var got = _.class.methodEqualOf( new Constr( 0 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'a string';
  var got = _.class.methodEqualOf( 'str' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an array';
  var got = _.class.methodEqualOf( [] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an unroll';
  var got = _.class.methodEqualOf( _.unroll.make( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an argumentsArray';
  var got = _.class.methodEqualOf( _.argumentsArray.make( [ 1 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferRaw';
  var got = _.class.methodEqualOf( new BufferRaw( 5 ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferView';
  var got = _.class.methodEqualOf( new BufferView( new BufferRaw( 5 ) ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'BufferTyped';
  var got = _.class.methodEqualOf( new U8x( 5 ) );
  var expected = false;
  test.identical( got, expected );

  if( Config.interpreter === 'njs' )
  {
    test.case = 'BufferNode';
    let got = _.class.methodEqualOf( BufferNode.alloc( 5 ) );
    let expected = false;
    test.identical( got, expected );
  }

  test.case = 'Set';
  var got = _.class.methodEqualOf( new Set( [ 5 ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'Map';
  var got = _.class.methodEqualOf( new Map( [ [ 1, 2 ] ] ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure empty map';
  var got = _.class.methodEqualOf( Object.create( null ) );
  var expected = false;
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.x = 1;
  var got = _.class.methodEqualOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'map from pure map';
  var src = Object.create( Object.create( null ) );
  var got = _.class.methodEqualOf( src );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an empty object';
  var got = _.class.methodEqualOf( {} );
  var expected = false;
  test.identical( got, expected );

  test.case = 'an object';
  var got = _.class.methodEqualOf( { a : 7, b : 13 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'map with routine under symbol equalAreSymbol';
  var equivalentAre = ( e1, e2 ) => e1 === e2;
  var src = {};
  src[ _.class.equalAreSymbol ] = equivalentAre;
  var got = _.class.methodEqualOf( src );
  test.identical( got, equivalentAre );

  test.case = 'object with routine under symbol equalAreSymbol';
  var equivalentAre = ( e1, e2 ) => e1 === e2;
  function Constr1()
  {
    this.x = 2;
    this[ _.class.equalAreSymbol ] = equivalentAre;
    return this;
  };
  var src = new Constr1();
  var got = _.class.methodEqualOf( src );
  test.identical( got, equivalentAre );

  /* */

}

// --
//
// --

const Proto =
{

  name : 'Tools.Class',
  silencing : 1,

  tests :
  {

    methodIteratorOf,
    methodEqualOf,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
