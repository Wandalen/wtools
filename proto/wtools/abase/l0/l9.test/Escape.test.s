( function _l0_l9_Escape_test_s_()
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
// implement
// --

function basic( test )
{

  /* */

  test.case = 'number';
  var src = 13;
  var exp = 13;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'null';
  var src = null;
  var exp = _.null;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'undefined';
  var src = undefined;
  var exp = _.undefined;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'nothing';
  var src = _.nothing;
  var exp = _.escape.escaped.nothing;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped1 null';
  var src = _.null;
  var exp = _.escape.escaped.null;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped1 undefined';
  var src = _.undefined;
  var exp = _.escape.escaped.undefined;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped1 nothing';
  var src = _.nothing;
  var exp = _.escape.escaped.nothing;
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped2 null';
  var src = _.escape.escaped.null;
  var exp = new _.Escape( _.escape.escaped.null );
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped2 undefined';
  var src = _.escape.escaped.undefined;
  var exp = new _.Escape( _.escape.escaped.undefined );
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

  test.case = 'escaped2 nothing';
  var src = _.escape.escaped.nothing;
  var exp = new _.Escape( _.escape.escaped.nothing );
  var left = _.escape.left( src );
  test.identical( left, exp );
  var right = _.escape.right( left );
  test.identical( right, src );
  test.true( right === src );

  /* */

}

//

function right( test )
{

  /* */

  test.case = 'null';
  var src = null;
  var exp = null;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right === src );

  /* */

  test.case = 'undefined';
  var src = undefined;
  var exp = undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right === src );

  /* */

  test.case = 'number';
  var src = 13;
  var exp = 13;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right === src );

  /* */

  test.case = 'nothing';
  var src = _.nothing;
  var exp = undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped null';
  var src = _.null;
  var exp = null;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped undefined';
  var src = _.undefined;
  var exp = undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped2 null';
  var src = _.escape.escaped.null;
  var exp = _.null;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped2 undefined';
  var src = _.escape.escaped.undefined;
  var exp = _.undefined;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

  test.case = 'escaped2 nothing';
  var src = _.escape.escaped.nothing;
  var exp = _.nothing;
  var right = _.escape.right( src );
  test.identical( right, exp );
  test.true( right !== src );

  /* */

}

//

function equal( test )
{

  /* */

  test.case = 'equal, 2 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( null ) );
  test.true( src1 === _.escape.escaped.null );
  test.true( src1 === src2 );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'equal, 3 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  test.true( src1 !== _.escape.escaped.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val === src2.val.val );
  test.true( src1.val.val === _.null );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'equal, 4 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  test.true( src1 !== _.escape.escaped.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val.val === src2.val.val.val );
  test.true( src1.val.val.val === _.null );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'not equal, 2 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( undefined ) );
  test.true( src1 === _.escape.escaped.null );
  test.true( src1 !== src2 );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not equal, 3 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( null ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( undefined ) ) );
  test.true( src1 !== _.escape.escaped.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val !== src2.val.val );
  test.true( src1.val.val === _.null );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not equal, 4 levels';
  var src1 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( undefined ) ) ) );
  test.true( src1 !== _.escape.escaped.null );
  test.true( src1 !== src2 );
  test.true( src1.val.val.val !== src2.val.val.val );
  test.true( src1.val.val.val === _.null );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not equal, 2 and 4 levels';
  var src1 = _.escape.left( _.escape.left( null ) );
  var src2 = _.escape.left( _.escape.left( _.escape.left( _.escape.left( null ) ) ) );
  test.true( src1 === _.escape.escaped.null );
  test.true( src1 !== src2 );
  test.true( src1.val === _.null );
  test.true( src2.val.val.val === _.null );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function toStrStandard( test )
{

  /* */

  test.case = 'String( Escape( null ) )';
  var src = new _.Escape( null );
  console.log( src );
  var got = String( src );
  var exp = `{- Escape null -}`;
  test.identical( got, exp );

  /* */

  test.case = 'strTypeSecondary( Escape( null ) )';
  var src = new _.Escape( null );
  console.log( src );
  var exp = `Escape`;
  test.identical( _.entity.strTypeSecondary( src ), exp );

  /* */

  test.case = 'strType( Escape( null ) )';
  var src = new _.Escape( null );
  console.log( src );
  var exp = `Escape.countable.constructible`;
  test.identical( _.entity.strType( src ), exp );

  /* */

  test.case = 'Object.prototype.toString( Escape( null ) )';
  var src = new _.Escape( null );
  console.log( src );
  var got = Object.prototype.toString.call( src );
  var exp = '[object Escape]';
  test.identical( got, exp );

  /* */

  test.case = 'String( Escape( _.null ) )';
  var src = new _.Escape( _.null );
  console.log( src );
  var got = String( src );
  var exp = `{- Escape {- Symbol null -} -}`;
  test.identical( got, exp );

  /* */

  test.case = 'strTypeSecondary( Escape( _.null ) )';
  var src = new _.Escape( _.null );
  console.log( src );
  var exp = `Escape`;
  test.identical( _.entity.strTypeSecondary( src ), exp );

  /* */

  test.case = 'strType( Escape( _.null ) )';
  var src = new _.Escape( _.null );
  console.log( src );
  var exp = `Escape.countable.constructible`;
  test.identical( _.entity.strType( src ), exp );

  /* */

  test.case = 'Object.prototype.toString( Escape( null ) )';
  var src = new _.Escape( _.null );
  console.log( src );
  var got = Object.prototype.toString.call( src );
  var exp = '[object Escape]';
  test.identical( got, exp );

  /* */

}

//

function is( test )
{

  test.case = '_.null';
  var src = _.null;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.undefined';
  var src = _.undefined;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.nothing';
  var src = _.nothing;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var exp = true;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'null';
  var src = null;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'undefined';
  var src = undefined;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'string';
  var src = 'string';
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'number';
  var src = 1;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'boolean';
  var src = true;
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

  test.case = 'object';
  var src = {};
  var exp = false;
  var got = _.escape.is( src )
  test.identical( got, exp );

}

//

function make( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.null );
  test.identical( got.val, src );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.undefined );
  test.identical( got.val, src );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.nothing );
  test.identical( got.val, src );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );
  test.identical( _.escape.unwrap( got ), src );

  test.case = 'null';
  var src = null;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.make( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

}

//

function from( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.nothing );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got, src );

  test.case = 'null';
  var src = null;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.from( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

}

//

function isEscapable( test )
{

  test.case = '_.null';
  var src = _.null;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.undefined';
  var src = _.undefined;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.nothing';
  var src = _.nothing;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'null';
  var src = null;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'undefined';
  var src = undefined;
  var exp = true;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'string';
  var src = 'string';
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'number';
  var src = 1;
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'boolean';
  var src = true;
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

  test.case = 'object';
  var src = {};
  var exp = false;
  var got = _.escape.isEscapable( src )
  test.identical( got, exp );

}

//

function left( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.nothing );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), true );
  test.identical( _.escape.unwrap( got ), src );
  test.identical( got.val, src );

  test.case = 'null';
  var src = null;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, _.null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, _.undefined );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.left( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

}

//

function rightWithNothing( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, undefined );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.null );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.undefined );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 1 );

  test.case = '_.escape.make( \'hello\' )';
  var src = _.escape.make( 'hello' );
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 'hello' );

  test.case = 'null';
  var src = null;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.rightWithNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

}

//

function rightWithoutNothing( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.null );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.undefined );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 1 );

  test.case = '_.escape.make( \'hello\' )';
  var src = _.escape.make( 'hello' );
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 'hello' );

  test.case = 'null';
  var src = null;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.rightWithoutNothing( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

}

//

function wrap( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got, _.escape.escaped.nothing );

  test.case = 'null';
  var src = null;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.wrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), true );
  test.identical( got.val, src );

  /* - */

  test.case = 'already escaped - _.escape.escaped.null'
  test.shouldThrowErrorSync( () => _.escape.wrap( _.escape.escaped.null ) );

  test.case = 'already escaped - _.escape.make( 1 )'
  test.shouldThrowErrorSync( () => _.escape.wrap( _.escape.make( 1 ) ) );

}

//

function unwrap( test )
{

  test.case = '_.null';
  var src = _.null;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.null );

  test.case = '_.undefined';
  var src = _.undefined;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.undefined );

  test.case = '_.nothing';
  var src = _.nothing;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.escaped.null';
  var src = _.escape.escaped.null;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.null );

  test.case = '_.escape.escaped.undefined';
  var src = _.escape.escaped.undefined;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.undefined );

  test.case = '_.escape.escaped.nothing';
  var src = _.escape.escaped.nothing;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, _.nothing );

  test.case = '_.escape.make( 1 )';
  var src = _.escape.make( 1 );
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 1 );

  test.case = '_.escape.make( \'hello\' )';
  var src = _.escape.make( 'hello' );
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), true );
  test.identical( _.escape.is( got ), false );
  test.identical( got, 'hello' );

  test.case = 'null';
  var src = null;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, null );

  test.case = 'undefined';
  var src = undefined;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( got, undefined );

  test.case = 'string';
  var src = 'string';
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'number';
  var src = 1;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'boolean';
  var src = true;
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

  test.case = 'object';
  var src = {};
  var got = _.escape.unwrap( src );
  test.identical( _.escape.is( src ), false );
  test.identical( _.escape.is( got ), false );
  test.identical( got, src );

}


// --
// declare
// --

const Proto =
{

  name : 'Tools.Escape.l0.l9',
  silencing : 1,

  tests :
  {

    basic,
    right,
    equal,
    toStrStandard,

    // l3

    is,
    make,
    from,

    // l5

    isEscapable,
    left,
    rightWithNothing,
    rightWithoutNothing,
    wrap,
    unwrap

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
