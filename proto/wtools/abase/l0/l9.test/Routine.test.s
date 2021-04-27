( function _l0_l9_Routine_test_s_()
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
// context
// --

// /* qqq : move that into test routines, please */
// function testFunction1( x, y )
// {
//   return x + y;
// }
//
// function testFunction2( x, y )
// {
//   return this;
// }
//
// function testFunction3( x, y )
// {
//   return x + y + this.k;
// }
//
// function testFunction4( x, y )
// {
//   return this;
// }
//
// function contextConstructor3()
// {
//   this.k = 15
// }
//
// var context3 = new contextConstructor3();

// --
// test
// --

// function is( test )
// {
//   test.case = 'without argument';
//   var got = _.routine.is();
//   test.identical( got, false );
//
//   test.case = 'check null';
//   var got = _.routine.is( null );
//   test.identical( got, false );
//
//   test.case = 'check undefined';
//   var got = _.routine.is( undefined );
//   test.identical( got, false );
//
//   test.case = 'check _.nothing';
//   var got = _.routine.is( _.nothing );
//   test.identical( got, false );
//
//   test.case = 'false';
//   var got = _.routine.is( false );
//   test.identical( got, false );
//
//   test.case = 'NaN';
//   var got = _.routine.is( NaN );
//   test.identical( got, false );
//
//   test.case = 'Symbol';
//   var got = _.routine.is( Symbol( 'a' ) );
//   test.identical( got, false );
//
//   test.case = 'array';
//   var got = _.routine.is( [] );
//   test.identical( got, false );
//
//   test.case = 'arguments array';
//   var got = _.routine.is( _.argumentsArray.make( [] ) );
//   test.identical( got, false );
//
//   test.case = 'unroll';
//   var got = _.routine.is( _.unroll.make( [] ) );
//   test.identical( got, false );
//
//   test.case = 'pure map';
//   var got = _.routine.is( Object.create( null ) );
//   test.identical( got, false );
//
//   test.case = 'Set';
//   var got = _.routine.is( new Set( [] ) );
//   test.identical( got, false );
//
//   test.case = 'Map';
//   var got = _.routine.is( new Map( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check BufferRaw';
//   var got = _.routine.is( new BufferRaw() );
//   test.identical( got, false );
//
//   test.case = 'check BufferTyped';
//   var got = _.routine.is( new U8x() );
//   test.identical( got, false );
//
//   test.case = 'number';
//   var got = _.routine.is( 3 );
//   test.identical( got, false );
//
//   test.case = 'bigInt';
//   var got = _.routine.is( 1n );
//   test.identical( got, false );
//
//   test.case = 'string';
//   var got = _.routine.is( 'str' );
//   test.identical( got, false );
//
//   test.case = 'array';
//   var got = _.routine.is( [ null ] );
//   test.identical( got, false );
//
//   test.case = 'map';
//   var got = _.routine.is( { '' : null } );
//   test.identical( got, false );
//
//   test.case = 'check instance of constructor';
//   function Constr(){ this.x = 1; return this };
//   var src = new Constr();
//   var got = _.routine.is( src );
//   test.identical( got, false );
//
//   test.case = 'check instance constructor';
//   function Constr1(){ this.x = 1; return this };
//   var src = new Constr1();
//   var got = _.routine.is( src.constructor );
//   test.identical( got, true );
//
//   test.case = 'Object';
//   var got = _.routine.is( Object );
//   test.identical( got, true )
//
//   test.case = 'arrow routine';
//   var got = _.routine.is( () => {} );
//   test.identical( got, true )
//
//   test.case = 'unnamed routine';
//   var got = _.routine.is( function (){} );
//   test.identical( got, true )
//
//   test.case = 'named routine';
//   var got = _.routine.is( function a(){} );
//   test.identical( got, true )
//
//   test.case = 'async arrow routine';
//   var got = _.routine.is( async () => {} );
//   test.identical( got, true )
//
//   test.case = 'async unnamed routine';
//   var got = _.routine.is( async function (){} );
//   test.identical( got, true )
//
//   test.case = 'async named routine';
//   var got = _.routine.is( async function a(){} );
//   test.identical( got, true )
// }
//
// //
//
// function like( test )
// {
//   test.case = 'without argument';
//   var got = _.routine.like();
//   test.identical( got, false );
//
//   test.case = 'check null';
//   var got = _.routine.like( null );
//   test.identical( got, false );
//
//   test.case = 'check undefined';
//   var got = _.routine.like( undefined );
//   test.identical( got, false );
//
//   test.case = 'check _.nothing';
//   var got = _.routine.like( _.nothing );
//   test.identical( got, false );
//
//   test.case = 'false';
//   var got = _.routine.like( false );
//   test.identical( got, false );
//
//   test.case = 'NaN';
//   var got = _.routine.like( NaN );
//   test.identical( got, false );
//
//   test.case = 'Symbol';
//   var got = _.routine.like( Symbol( 'a' ) );
//   test.identical( got, false );
//
//   test.case = 'array';
//   var got = _.routine.like( [] );
//   test.identical( got, false );
//
//   test.case = 'arguments array';
//   var got = _.routine.like( _.argumentsArray.make( [] ) );
//   test.identical( got, false );
//
//   test.case = 'unroll';
//   var got = _.routine.like( _.unroll.make( [] ) );
//   test.identical( got, false );
//
//   test.case = 'pure map';
//   var got = _.routine.like( Object.create( null ) );
//   test.identical( got, false );
//
//   test.case = 'Set';
//   var got = _.routine.like( new Set( [] ) );
//   test.identical( got, false );
//
//   test.case = 'Map';
//   var got = _.routine.like( new Map( [] ) );
//   test.identical( got, false );
//
//   test.case = 'check BufferRaw';
//   var got = _.routine.like( new BufferRaw() );
//   test.identical( got, false );
//
//   test.case = 'check BufferTyped';
//   var got = _.routine.like( new U8x() );
//   test.identical( got, false );
//
//   test.case = 'number';
//   var got = _.routine.like( 3 );
//   test.identical( got, false );
//
//   test.case = 'bigInt';
//   var got = _.routine.like( 1n );
//   test.identical( got, false );
//
//   test.case = 'string';
//   var got = _.routine.like( 'str' );
//   test.identical( got, false );
//
//   test.case = 'array';
//   var got = _.routine.like( [ null ] );
//   test.identical( got, false );
//
//   test.case = 'map';
//   var got = _.routine.like( { '' : null } );
//   test.identical( got, false );
//
//   test.case = 'check instance of constructor';
//   function Constr(){ this.x = 1; return this };
//   var src = new Constr();
//   var got = _.routine.like( src );
//   test.identical( got, false );
//
//   test.case = 'check instance constructor';
//   function Constr1(){ this.x = 1; return this };
//   var src = new Constr1();
//   var got = _.routine.like( src.constructor );
//   test.identical( got, true );
//
//   test.case = 'Object';
//   var got = _.routine.like( Object );
//   test.identical( got, true );
//
//   test.case = 'arrow routine';
//   var got = _.routine.like( () => {} );
//   test.identical( got, true );
//
//   test.case = 'unnamed routine';
//   var got = _.routine.like( function (){} );
//   test.identical( got, true );
//
//   test.case = 'named routine';
//   var got = _.routine.like( function a(){} );
//   test.identical( got, true );
//
//   test.case = 'async arrow routine';
//   var got = _.routine.like( async () => {} );
//   test.identical( got, true );
//
//   test.case = 'async unnamed routine';
//   var got = _.routine.like( async function (){} );
//   test.identical( got, true )
//
//   test.case = 'async named routine';
//   var got = _.routine.like( async function a(){} );
//   test.identical( got, true )
// }
//
// //
//
// function isTrivial( test )
// {
//
//   var got = _.routine.isTrivial( 1 );
//   test.identical( got, false )
//
//   var got = _.routine.isTrivial( '' );
//   test.identical( got, false )
//
//   var got = _.routine.isTrivial( {} );
//   test.identical( got, false )
//
//   var got = _.routine.isTrivial( [] );
//   test.identical( got, false )
//
//   var got = _.routine.isTrivial( () => {} );
//   test.identical( got, true )
//
//   var got = _.routine.isTrivial( Object );
//   test.identical( got, true )
//
//   var got = _.routine.isTrivial( function () {} );
//   test.identical( got, true )
//
//   var got = _.routine.isTrivial( function a() {} );
//   test.identical( got, true )
//
//   var got = _.routine.isTrivial( async function () {} );
//   test.identical( got, true )
//
//   var got = _.routine.isTrivial( async () => {} );
//   test.identical( got, true )
//
//   var got = _.routine.isTrivial( async function a() {} );
//   test.identical( got, true )
//
//   function sync1(){}
//   var got = _.routine.isTrivial( sync1 );
//   test.identical( got, true )
//
//   function sync2(){}
//   sync2.map = {};
//   var got = _.routine.isTrivial( sync2 );
//   test.identical( got, true )
//
//   function async1(){}
//   var got = _.routine.isTrivial( async1 );
//   test.identical( got, true )
//
//   function async2(){}
//   async2.map = {};
//   var got = _.routine.isTrivial( async2 );
//   test.identical( got, true )
//
//   test.case = 'map';
//   var src = Object.create( null );
//   var got = _.routine.isTrivial( src );
//   test.identical( got, false )
//
//   test.case = 'prototyped';
//   var src = Object.create( Object.create( null ) );
//   var got = _.routine.isTrivial( src );
//   test.identical( got, false )
//
// }
//
// //
//
// function isSync( test )
// {
//
//   function sync1(){}
//   function sync2(){}
//   sync2.map = {};
//   function async1(){}
//   function async2(){}
//   async2.map = {};
//
//   var got = _.routine.isSync( 1 );
//   test.identical( got, false )
//
//   var got = _.routine.isSync( '' );
//   test.identical( got, false )
//
//   var got = _.routine.isSync( {} );
//   test.identical( got, false )
//
//   var got = _.routine.isSync( [] );
//   test.identical( got, false )
//
//   var got = _.routine.isSync( Object );
//   test.identical( got, true )
//
//   var got = _.routine.isSync( () => {} );
//   test.identical( got, true )
//
//   var got = _.routine.isSync( function () {} );
//   test.identical( got, true )
//
//   var got = _.routine.isSync( function a() {} );
//   test.identical( got, true )
//
//   var got = _.routine.isSync( async function () {} );
//   test.identical( got, false )
//
//   var got = _.routine.isSync( async () => {} );
//   test.identical( got, false )
//
//   var got = _.routine.isSync( async function a() {} );
//   test.identical( got, false )
//
//   var got = _.routine.is( sync1 );
//   test.identical( got, true )
//
//   var got = _.routine.is( sync2 );
//   test.identical( got, true )
//
//   var got = _.routine.is( async1 );
//   test.identical( got, true )
//
//   var got = _.routine.is( async2 );
//   test.identical( got, true )
//
// }
//
// //
//
// function isAsync( test )
// {
//
//   function sync1(){}
//   function sync2(){}
//   sync2.map = {};
//   function async1(){}
//   function async2(){}
//   async2.map = {};
//
//   var got = _.routine.isAsync( 1 );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( '' );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( {} );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( [] );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( () => {} );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( Object );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( function () {} );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( function a() {} );
//   test.identical( got, false )
//
//   var got = _.routine.isAsync( async function () {} );
//   test.identical( got, true )
//
//   var got = _.routine.isAsync( async () => {} );
//   test.identical( got, true )
//
//   var got = _.routine.isAsync( async function a() {} );
//   test.identical( got, true )
//
//   var got = _.routine.is( sync1 );
//   test.identical( got, true )
//
//   var got = _.routine.is( sync2 );
//   test.identical( got, true )
//
//   var got = _.routine.is( async1 );
//   test.identical( got, true )
//
//   var got = _.routine.is( async2 );
//   test.identical( got, true )
//
// }
//
// //
//
// function _join( test )
// {
//   var context3 = new contextConstructor3();
//   var testParam1 = 2;
//   var testParam2 = 4;
//   var options1 =
//   {
//     sealing : false,
//     routine : testFunction1,
//     args : [ testParam2 ], // x
//     extending : true
//   };
//   var options2 =
//   {
//     sealing : true,
//     routine : testFunction2,
//     args : [ testParam2 ], // x
//     extending : true
//   };
//
//   var options3 =
//   {
//     sealing : false,
//     routine : testFunction3,
//     args : [ testParam2 ], // x
//     context : context3,
//     extending : true
//   };
//   var options4 =
//   {
//     sealing : false,
//     routine : testFunction4,
//     args : [ testParam2 ], // x
//     context : context3,
//     extending : true
//   };
//
//   var options5 =
//   {
//     sealing : true,
//     routine : testFunction3,
//     args : [ testParam1, testParam2 ], // x
//     context : context3,
//     extending : true
//   };
//
//   var wrongOpt1 =
//   {
//     sealing : true,
//     routine : {},
//     args : [ testParam1, testParam2 ], // x
//     context : context3,
//     extending : true
//   };
//
//   var wrongOpt2 =
//   {
//     sealing : true,
//     routine : testFunction3,
//     args : 'wrong', // x
//     context : context3,
//     extending : true
//   };
//
//   var expected1 = 6;
//   var expected2 = undefined;
//   var expected3 = 21;
//   var expected5 = 21;
//
//   test.case = 'simple function without context with arguments bind without seal : result check';
//   var gotfn = _.routine._join( options1 );
//   var got = gotfn( testParam1 );
//   test.identical( got, expected1 );
//
//   test.case = 'simple function without context and seal : context test';
//   var gotfn = _.routine._join(options2);
//   var got = gotfn( testParam1 );
//   test.identical( got, expected2 );
//
//   test.case = 'simple function with context and arguments : result check';
//   var gotfn = _.routine._join(options3);
//   var got = gotfn( testParam1 );
//   test.identical( got, expected3 );
//
//   test.case = 'simple function with context and arguments : context check';
//   var gotfn = _.routine._join(options4);
//   var got = gotfn( testParam1 );
//   test.identical( got instanceof contextConstructor3, true );
//
//   test.case = 'simple function with context and arguments : result check, seal == true ';
//   var gotfn = _.routine._join(options5);
//   var got = gotfn( testParam1 );
//   test.identical( got, expected5 );
//
//   test.case = 'simple function with context and arguments : result check, seal == true ';
//   var gotfn = _.routine._join(options5);
//   var got = gotfn( 0, 0 );
//   test.identical( got, expected5 );
//
//   test.case = 'extending';
//   function srcRoutine(){}
//   srcRoutine.defaults = { a : 10 };
//   var gotfn = _.routine.join( undefined, srcRoutine, [] );
//   test.identical( gotfn.defaults, srcRoutine.defaults );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'missed argument';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine._join();
//   });
//
//   test.case = 'extra argument';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine._join( options1, options2 );
//   });
//
//   test.case = 'passed non callable object';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine._join( wrongOpt1 );
//   });
//
//   test.case = 'passed arguments as primitive value';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine._join( wrongOpt2 );
//   });
//
//   function testFunction1( x, y )
//   {
//     return x + y;
//   }
//
//   function testFunction2( x, y )
//   {
//     return this;
//   }
//
//   function testFunction3( x, y )
//   {
//     return x + y + this.k;
//   }
//
//   function testFunction4( x, y )
//   {
//     return this;
//   }
//
//   function contextConstructor3()
//   {
//     this.k = 15
//   }
//
//   // var context3 = new contextConstructor3(); // xxx
//
// };
//
// //
// //
// // function routineBind( test )
// // {
// //
// //   var testParam1 = 2,
// //     testParam2 = 4,
// //     expected1 = 6,
// //     expected2 = undefined,
// //     expected3 = 21;
// //
// //   test.case = 'simple function without context with arguments bind : result check';
// //   var gotfn = _.routineBind( testFunction1, undefined, [ testParam2 ]);
// //   var got = gotfn( testParam1 );
// //   test.identical( got, expected1 );
// //
// //   test.case = 'simple function without context test';
// //   var gotfn = _.routineBind(testFunction2, undefined, [ testParam2 ]);
// //   var got = gotfn( testParam1 );
// //   test.identical( got, expected2 );
// //
// //   test.case = 'simple function with context and arguments : result check';
// //   var gotfn = _.routineBind(testFunction3, context3, [ testParam2 ]);
// //   var got = gotfn( testParam1 );
// //   test.identical( got, expected3 );
// //
// //   test.case = 'simple function with context and arguments : context check';
// //   var gotfn = _.routineBind(testFunction4, context3, [ testParam2 ]);
// //   var got = gotfn( testParam1 );
// //   test.identical( got instanceof contextConstructor3, true );
// //
// //   if( !Config.debug )
// //   return;
// //
// //   test.case = 'missed argument';
// //   test.shouldThrowErrorSync( function()
// //   {
// //     _.routineBind();
// //   });
// //
// //   test.case = 'extra argument';
// //   test.shouldThrowErrorSync( function()
// //   {
// //     _.routineBind( testFunction4, context3, [ testParam2 ], [ testParam1 ] );
// //   });
// //
// //   test.case = 'passed non callable object';
// //   test.shouldThrowErrorSync( function()
// //   {
// //     _.routineBind( {}, context3, [ testParam2 ] );
// //   });
// //
// //   test.case = 'passed arguments as primitive value';
// //   test.shouldThrowErrorSync( function()
// //   {
// //     _.routineBind( testFunction4, context3, testParam2 );
// //   });
// //
// // };
//
// //
//
// function constructorJoin( test )
// {
//   function srcRoutine()
//   {
//     var result =
//     {
//       context : this,
//       args : _.longSlice( arguments )
//     }
//     return result;
//   }
//   srcRoutine.prop = true;
//
//   /* */
//
//   test.case = 'without args';
//   var got = _.constructorJoin( srcRoutine );
//   test.true( _.routine.is( got ) );
//   var result = got();
//   test.identical( _.props.keys( srcRoutine ), [ 'prop' ] )
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result.args, [] );
//   test.identical( result.context, srcRoutine );
//   test.false( result.context instanceof srcRoutine );
//
//   test.case = 'args - undefined';
//   var got = _.constructorJoin( srcRoutine, undefined );
//   test.true( _.routine.is( got ) );
//   var result = got();
//   test.identical( _.props.keys( srcRoutine ), [ 'prop' ] )
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result.args, [] );
//   test.identical( result.context, srcRoutine );
//   test.false( result.context instanceof srcRoutine );
//
//   test.case = 'args - null';
//   var got = _.constructorJoin( srcRoutine, null );
//   test.true( _.routine.is( got ) );
//   var result = got();
//   test.identical( _.props.keys( srcRoutine ), [ 'prop' ] )
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result.args, [] );
//   test.identical( result.context, srcRoutine );
//   test.false( result.context instanceof srcRoutine );
//
//   test.case = 'args - empty array';
//   var args = [];
//   var got = _.constructorJoin( srcRoutine, args );
//   test.true( _.routine.is( got ) );
//   var result = new got();
//   test.identical( _.props.keys( srcRoutine ), [ 'prop' ] )
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result.args, args );
//   test.notIdentical( result.context, srcRoutine );
//   test.true( result.context instanceof srcRoutine );
//
//   test.case = 'args - array with map, returned routine exexute without arguments';
//   var args = [ { a : 1 } ];
//   var got = _.constructorJoin( srcRoutine, args );
//   test.true( _.routine.is( got ) );
//   var result = got();
//   test.identical( _.props.keys( srcRoutine ), [ 'prop' ] )
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result.args, args );
//   test.identical( result.context, srcRoutine );
//   test.false( result.context instanceof srcRoutine );
//
//   test.case = 'args - array with map, returned routine exexute with arguments';
//   var args = [ { a : 1 } ];
//   var got = _.constructorJoin( srcRoutine, args );
//   test.true( _.routine.is( got ) );
//   var result = got({ b : 1 });
//   test.identical( _.props.keys( srcRoutine ), [ 'prop' ] )
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result.args, [ { a : 1 }, { b : 1 } ] );
//   test.identical( result.context, srcRoutine );
//   test.false( result.context instanceof srcRoutine );
//
//   test.case = 'Array contructor, args = U8x buffer, execute without arguments';
//   var args = new U8x( [ 1, 2, 3, 4 ] );
//   var got = _.constructorJoin( Array, args );
//   test.true( _.routine.is( got ) );
//   var result = new got();
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result, [ 1, 2, 3, 4 ] );
//
//   test.case = 'Array contructor, args = U8x buffer, exexute with number';
//   var args = new U8x( [ 1, 2, 3, 4 ] );
//   var got = _.constructorJoin( Array, args );
//   test.true( _.routine.is( got ) );
//   var result = new got( 1 );
//   test.identical( _.props.keys( got ), [] );
//   test.identical( result, [ 1, 2, 3, 4, 1 ] );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.constructorJoin() );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.constructorJoin( Array, [ 1, 2 ], [ 1, 2 ] ) );
//
//   test.case = 'wrong type of routine';
//   test.shouldThrowErrorSync( () => _.constructorJoin( [], [] ) );
//
//   test.case = 'wrong type of args';
//   test.shouldThrowErrorSync( () => _.constructorJoin( srcRoutine, srcRoutine ) );
// }
//
// //
//
// function join( test )
// {
//   function testFunction1( x, y ){ return this }
//   function testFunction2( x, y ){ return x + y }
//   function testFunction3( x, y ){ return x + y + ( this !== undefined ? this.k : 1 ) }
//   function Constr(){ this.k = 15; return this }
//   var context = new Constr();
//
//   /* - */
//
//   test.open( 'context - undefined, args - undefined' );
//
//   test.case = 'named function without context, check context';
//   var gotfn = _.routine.join( undefined, testFunction1, undefined );
//   test.identical( gotfn.name, 'testFunction1' );
//   test.identical( gotfn.originalRoutine, testFunction1 );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, undefined );
//
//   test.case = 'named function with arguments bind : result check';
//   var gotfn = _.routine.join( undefined, testFunction2, undefined );
//   test.identical( gotfn.name, 'testFunction2' );
//   test.identical( gotfn.originalRoutine, testFunction2 );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 5 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( undefined, testFunction3, undefined );
//   test.identical( gotfn.name, 'testFunction3' );
//   test.identical( gotfn.originalRoutine, testFunction3 );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 6 );
//
//   test.case = 'unnamed function without context, check context';
//   var gotfn = _.routine.join( undefined, ( x, y ) => x + y, undefined );
//   test.identical( gotfn.name, '' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => x + y )( 2, 3 ) );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 5 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( undefined, ( x, y ) => Math.pow( x, y ), undefined );
//   test.identical( gotfn.name, '' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => Math.pow( x, y ) )( 2, 3 ) );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 8 );
//
//   test.close( 'context - undefined, args - undefined' );
//
//   /* - */
//
//   test.open( 'context - undefined, args - long' );
//
//   test.case = 'named function without context, check context';
//   var gotfn = _.routine.join( undefined, testFunction1, [ 4 ] );
//   test.identical( gotfn.name, 'testFunction1' );
//   test.identical( gotfn.originalRoutine, testFunction1 );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got, undefined );
//
//   test.case = 'named function with arguments bind : result check';
//   var gotfn = _.routine.join( undefined, testFunction2, [ 4 ] );
//   test.identical( gotfn.name, 'testFunction2' );
//   test.identical( gotfn.originalRoutine, testFunction2 );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got, 6 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( undefined, testFunction3, [ 4 ] );
//   test.identical( gotfn.name, 'testFunction3' );
//   test.identical( gotfn.originalRoutine, testFunction3 );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 5 );
//   test.identical( got, 10 );
//
//   test.case = 'unnamed function without context, check context';
//   var gotfn = _.routine.join( undefined, ( x, y ) => x + y, [ 4 ] );
//   test.identical( gotfn.name, '__joinedArguments' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => x + y )( 2, 3 ) );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got, 6 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( undefined, ( x, y ) => Math.pow( x, y ), [ 4 ] );
//   test.identical( gotfn.name, '__joinedArguments' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => Math.pow( x, y ) )( 2, 3 ) );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got, 16 );
//
//   test.close( 'context - undefined, args - long' );
//
//   /* - */
//
//   test.open( 'context - exists, args - undefined' );
//
//   test.case = 'named function without context, check context';
//   var gotfn = _.routine.join( context, testFunction1, undefined );
//   test.identical( gotfn.name, 'bound testFunction1' );
//   test.identical( gotfn.originalRoutine, testFunction1 );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got instanceof Constr, true );
//
//   test.case = 'named function with arguments bind : result check';
//   var gotfn = _.routine.join( context, testFunction2, undefined );
//   test.identical( gotfn.name, 'bound testFunction2' );
//   test.identical( gotfn.originalRoutine, testFunction2 );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 5 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( context, testFunction3, undefined );
//   test.identical( gotfn.name, 'bound testFunction3' );
//   test.identical( gotfn.originalRoutine, testFunction3 );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 20 );
//
//   test.case = 'unnamed function without context, check context';
//   var gotfn = _.routine.join( context, ( x, y ) => x + y, undefined );
//   test.identical( gotfn.name, 'bound ' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => x + y )( 2, 3 ) );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 5 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( context, ( x, y ) => Math.pow( x, y ), undefined );
//   test.identical( gotfn.name, 'bound ' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => Math.pow( x, y ) )( 2, 3 ) );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, undefined );
//   var got = gotfn( 2, 3 );
//   test.identical( got, 8 );
//
//   test.close( 'context - exists, args - undefined' );
//
//   /* - */
//
//   test.open( 'context - exists, args - long' );
//
//   test.case = 'named function without context, check context';
//   var gotfn = _.routine.join( context, testFunction1, [ 4 ] );
//   test.identical( gotfn.name, 'bound testFunction1' );
//   test.identical( gotfn.originalRoutine, testFunction1 );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got instanceof Constr, true );
//
//   test.case = 'named function with arguments bind : result check';
//   var gotfn = _.routine.join( context, testFunction2, [ 4 ] );
//   test.identical( gotfn.name, 'bound testFunction2' );
//   test.identical( gotfn.originalRoutine, testFunction2 );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got, 6 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( context, testFunction3, [ 4 ] );
//   test.identical( gotfn.name, 'bound testFunction3' );
//   test.identical( gotfn.originalRoutine, testFunction3 );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 5 );
//   test.identical( got, 24 );
//
//   test.case = 'unnamed function without context, check context';
//   var gotfn = _.routine.join( context, ( x, y ) => x + y, [ 4 ] );
//   test.identical( gotfn.name, 'bound ' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => x + y )( 2, 3 ) );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got, 6 );
//
//   test.case = 'unnamed function with arguments bind : result check';
//   var gotfn = _.routine.join( context, ( x, y ) => Math.pow( x, y ), [ 4 ] );
//   test.identical( gotfn.name, 'bound ' );
//   test.identical( gotfn.originalRoutine( 2, 3 ), ( ( x, y ) => Math.pow( x, y ) )( 2, 3 ) );
//   test.identical( gotfn.boundContext, context );
//   test.identical( gotfn.boundArguments, [ 4 ] );
//   var got = gotfn( 2 );
//   test.identical( got, 16 );
//
//   test.close( 'context - exists, args - long' );
//
//   /* - */
//
//   test.case = 'extending'
//   var srcRoutine = () => {};
//   srcRoutine.defaults = { a : 10 };
//   var gotfn = _.routine.join( undefined, srcRoutine, [] );
//   test.identical( gotfn.defaults, srcRoutine.defaults );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.routine.join() );
//
//   test.case = 'extra argument';
//   test.shouldThrowErrorSync( () => _.routine.join( undefined, testFunction4, [ 4 ], [ 2 ] ) );
//
//   test.case = 'wrong type of routine';
//   test.shouldThrowErrorSync( () => _.routine.join( undefined, 1, [ 4 ] ) );
//   test.shouldThrowErrorSync( () => _.routine.join( undefined, {}, [ 4 ] ) );
//
//   test.case = 'wrong type of args';
//   test.shouldThrowErrorSync( () => _.routine.join( undefined, testFunction4, 4 ) );
//   test.shouldThrowErrorSync( () => _.routine.join( undefined, testFunction4, null ) );
// }
//
// //
//
// function seal( test )
// {
//
//   var context3 = new contextConstructor3();
//   var testParam1 = 2;
//   var testParam2 = 4;
//   var expected1 = 6;
//   var expected2 = undefined;
//   var expected3 = 21;
//
//   test.case = 'simple function with seal arguments : result check';
//   var gotfn = _.routine.seal(undefined, testFunction1, [ testParam1, testParam2 ]);
//   var got = gotfn( testParam1 );
//   test.identical( got, expected1 );
//
//   test.case = 'simple function with seal arguments : context check';
//   var gotfn = _.routine.seal(undefined, testFunction2, [ testParam1, testParam2 ]);
//   var got = gotfn( testParam1 );
//   test.identical( got, expected2 );
//
//   test.case = 'simple function with seal context and arguments : result check';
//   var gotfn = _.routine.seal(context3, testFunction3, [ testParam1, testParam2 ]);
//   var got = gotfn( testParam1 );
//   test.identical( got, expected3 );
//
//   test.case = 'simple function with seal context and arguments : context check';
//   var gotfn = _.routine.seal(context3, testFunction4, [ testParam1, testParam2 ]);
//   var got = gotfn( testParam1 );
//   test.identical( got instanceof contextConstructor3, true );
//
//   test.case = 'simple function with seal context and arguments : result check';
//   var gotfn = _.routine.seal(context3, testFunction3, [ testParam1, testParam2 ]);
//   var got = gotfn( 0, 0 );
//   test.identical( got, expected3 );
//
//   test.case = 'extending';
//   function srcRoutine(){}
//   srcRoutine.defaults = { a : 10 };
//   var gotfn = _.routine.join( undefined, srcRoutine, [] );
//   test.identical( gotfn.defaults, srcRoutine.defaults );
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'missed argument';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.seal();
//   });
//
//   test.case = 'extra argument';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.seal( context3, testFunction4, [ testParam2 ], [ testParam1 ] );
//   });
//
//   test.case = 'passed non callable object';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.seal( context3, {}, [ testParam1, testParam2 ] );
//   });
//
//   test.case = 'passed arguments as primitive value';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.seal( context3, testFunction4, testParam2 );
//   });
//
//
//   function testFunction1( x, y )
//   {
//     return x + y;
//   }
//
//   function testFunction2( x, y )
//   {
//     return this;
//   }
//
//   function testFunction3( x, y )
//   {
//     return x + y + this.k;
//   }
//
//   function testFunction4( x, y )
//   {
//     return this;
//   }
//
//   function contextConstructor3()
//   {
//     this.k = 15
//   }
//
// }

// //
//
// function options( test )
// {
//   test.case = 'args - empty map, defaults - empty map';
//   var testRoutine = () => true;
//   var defaults = {};
//   var options = {};
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, {} );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 0, defaults - empty map';
//   var testRoutine = () => true;
//   var defaults = {};
//   var options = [];
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, {} );
//   test.identical( options, [] );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - empty map, defaults - empty map';
//   var testRoutine = () => true;
//   var defaults = {};
//   var options = [ {} ];
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, {} );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - empty map, routine.defaults - empty map';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var options = {};
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, {} );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 0, routine.defaults - empty map';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var options = [];
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, {} );
//   test.identical( options, [] );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - empty map, defaults - empty map';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var options = [ {} ];
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, {} );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* */
//
//   test.case = 'args - empty map, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = {};
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : null, b : 1 } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 0, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = [];
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : null, b : 1 } );
//   test.identical( options, [] );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - empty map, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = [ {} ];
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : null, b : 1 } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - empty map, routine.defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = {};
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : null, b : 1 } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 0, routine.defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = [];
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : null, b : 1 } );
//   test.identical( options, [] );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - empty map, defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = [ {} ];
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : null, b : 1 } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* */
//
//   test.case = 'args - map with undefined, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = { a : undefined, b : undefined };
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : null, b : 1 } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - map with undefined, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = [ { a : undefined, b : undefined } ];
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : null, b : 1 } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - map with undefined, routine.defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = { a : undefined, b : undefined };
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : null, b : 1 } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - map with undefined, defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = [ { a : undefined, b : undefined } ];
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : null, b : 1 } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* */
//
//   test.case = 'args - map with undefine JS value, but not undefined, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = { a : 0, b : '' };
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : 0, b : '' } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = [ { a : 0, b : '' } ];
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : 0, b : '' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - map with undefine JS value, but not undefined, routine.defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = { a : 0, b : '' };
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : 0, b : '' } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = [ { a : 0, b : '' } ];
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : 0, b : '' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* */
//
//   test.case = 'args - map with defined values, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.options( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - map with defined values, routine.defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.options( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.routine.options() );
//
//   test.case = 'not enough arguments';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine ) );
//
//   test.case = 'extra arguments';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, {}, {} ) );
//
//   test.case = 'wrong type of routine';
//   test.shouldThrowErrorSync( () => _.routine.options( 'wrong', {}, {} ) );
//
//   test.case = 'wrong type of args';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, 'wrong', {} ) );
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ 'wrong' ], {} ) );
//
//   test.case = 'wrong type of defaults';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, 'wrong' ) );
//
//   test.case = 'wrong type of defaults';
//   var testRoutine = () => true;
//   testRoutine.defaults = 'wrong';
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {} ) );
//
//   test.case = 'args.length > 1';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ {}, {} ], {} ) );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   var msg = 'Routine testRoutine does not expect options: "unknown", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, { unknown : true, b : 1 }, {} ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ { unknown : true, b : 1 } ], {} ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, { unknown : true, b : 1 }, { known : 1 } ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ { unknown : true, b : 1 } ], { known : 1 } ), errCallback );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : 1 };
//   var msg = 'Routine testRoutine does not expect options: "unknown"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, { unknown : true } ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, [ { unknown : true } ] ), errCallback );
//
//   test.case = 'defaults has objectLike value';
//   var testRoutine = () => true;
//   var msg = 'Source map should have only primitive elements, but known is [object Object]';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, { known : { objectLike : true } } ), errCallback );
//
//   test.case = 'defaults has objectLike value';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : { objectLike : true } };
//   var msg = 'Source map should have only primitive elements, but known is [object Object]';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {} ), errCallback );
//
//   test.case = 'defaults has value `undefined`';
//   var testRoutine = () => true;
//   var msg = 'Options map for routine testRoutine should have no undefined fields, but it does have "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {}, { known : undefined } ), errCallback );
//
//   test.case = 'defaults has value `undefined`';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : undefined };
//   var msg = 'Options map for routine testRoutine should have no undefined fields, but it does have "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options( testRoutine, {} ), errCallback );
// }
//
// //
//
// function options_( test )
// {
//   test.open( 'empty defaults' );
//
//   test.case = 'defaults - null, args - empty map';
//   var defaults = null;
//   var options = {};
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - null, args - array with empty map';
//   var defaults = null;
//   var options = [ {} ];
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - routine with empty defaults, args - empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = {};
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with empty defaults, args - array with empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = [ {} ];
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - empty map';
//   var defaults = {};
//   var options = {};
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with empty map';
//   var defaults = {};
//   var options = [ {} ];
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'empty defaults' );
//
//   /* - */
//
//   test.open( 'defaults, options - empty' );
//
//   test.case = 'defaults - routine with defaults, args - empty map';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = {};
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with empty map';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = [ {} ];
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - defaults, args - empty map';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = {};
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options );
//
//   test.case = 'defaults - defaults, args - array with empty map';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = [ {} ];
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'defaults, options - empty' );
//
//   /* - */
//
//   test.open( 'defaults, options - filled, no complementing' );
//
//   test.case = 'defaults - routine with defaults, args - map';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = { a : null, b : null, c : null };
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with map';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = [ { a : null, b : null, c : null } ];
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - map';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = { a : null, b : null, c : null };
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with map';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = [ { a : null, b : null, c : null } ];
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'defaults, options - filled, no complementing' );
//
//   /* - */
//
//   test.open( 'defaults, options - filled, complementing' );
//
//   test.case = 'defaults - routine with defaults, args - map with property value - undefined';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = { b : undefined };
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with map with property value - undefined';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = [ { b : undefined } ];
//   var got = _.routineOptions_( routine, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - defaults, args - map with property value - undefined';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = { b : undefined };
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options );
//
//   test.case = 'defaults - defaults, args - array with map with property value - undefined';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = [ { b : undefined } ];
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got, { a : 1, b : null, c : 3 } );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'defaults, options - filled, complementing' );
//
//   /* - */
//
//   test.case = 'defaults - has prototyped map, args - empty map';
//   var defaults = { a : 1, b : null, c : 3 };
//   var prototype = { a : 1, b : 2 };
//   var options = Object.create( prototype );
//   var got = _.routineOptions_( defaults, options );
//   test.identical( got.a, 1 );
//   test.identical( got.b, 2 );
//   test.identical( got.c, 3 );
//   var gotPrototype = Object.getPrototypeOf( got );
//   test.identical( gotPrototype, { a : 1, b : 2 } );
//   test.true( got === options );
//   test.true( gotPrototype === prototype );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.routineOptions_() );
//
//   test.case = 'not enough arguments';
//   test.shouldThrowErrorSync( () => _.routineOptions_( {} ) );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.routineOptions_( {}, {}, {} ) );
//
//   test.case = 'wrong type of defaults';
//   test.shouldThrowErrorSync( () => _.routineOptions_( 'wrong', {} ) );
//
//   test.case = 'wrong type of defaults';
//   var routine = () => true;
//   routine.defaults = 'wrong';
//   test.shouldThrowErrorSync( () => _.routineOptions_( routine, {} ) );
//
//   test.case = 'wrong type of options';
//   var routine = () => true;
//   test.shouldThrowErrorSync( () => _.routineOptions_( routine, 'wrong' ) );
//   test.shouldThrowErrorSync( () => _.routineOptions_( routine, [ 'wrong' ] ) );
//
//   test.case = 'options.length > 1';
//   test.shouldThrowErrorSync( () => _.routineOptions_( {}, [ {}, {} ] ) );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var msg = 'Routine testRoutine does not expect options: "unknown", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routineOptions_( testRoutine, { unknown : true, b : 1 } ), errCallback );
//   test.shouldThrowErrorSync( () => _.routineOptions_( testRoutine, [ { unknown : true, b : 1 } ] ), errCallback );
//
//   test.case = 'options has unknown options';
//   var msg = 'Routine  does not expect options: "unknown"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routineOptions_( {}, { unknown : true } ), errCallback );
//   test.shouldThrowErrorSync( () => _.routineOptions_( {}, [ { unknown : true } ] ), errCallback );
//
//   test.case = 'defaults has objectLike value';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : { objectLike : true } };
//   var msg = 'Source map should have only primitive elements, but known is [object Object]';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routineOptions_( testRoutine, {} ), errCallback );
//
//   test.case = 'defaults has value `undefined`';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : undefined };
//   var msg = 'Options map for routine testRoutine should have no undefined fields, but it does have "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routineOptions_( testRoutine, {} ), errCallback );
// }
//
// //
//
// function assertOptions( test )
// {
//   test.case = 'args - empty map, defaults - empty map';
//   var testRoutine = () => true;
//   var defaults = {};
//   var options = {};
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, {} );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - empty map, defaults - empty map';
//   var testRoutine = () => true;
//   var defaults = {};
//   var options = [ {} ];
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - empty map, routine.defaults - empty map';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var options = {};
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, {} );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - empty map, routine.defaults - empty map';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var options = [ {} ];
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   /* */
//
//   test.case = 'args - map with undefine JS value, but not undefined, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = { a : 0, b : '' };
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : 0, b : '' } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = [ { a : 0, b : '' } ];
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : 0, b : '' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - map with undefine JS value, but not undefined, routine.defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = { a : 0, b : '' };
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : 0, b : '' } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - map with undefine JS value, but not undefined, defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = [ { a : 0, b : '' } ];
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : 0, b : '' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* */
//
//   test.case = 'args - map with defined values, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with options';
//   var testRoutine = () => true;
//   var defaults = { a : null, b : 1 };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - map with defined values, routine.defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : null, b : 1 };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* */
//
//   test.case = 'args - map with defined values, defaults - map with undefined';
//   var testRoutine = () => true;
//   var defaults = { a : undefined, b : undefined };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with undefined';
//   var testRoutine = () => true;
//   var defaults = { a : undefined, b : undefined };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - map with defined values, routine.defaults - map with undefined';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : undefined, b : undefined };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with undefined';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : undefined, b : undefined };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* */
//
//   test.case = 'args - map with defined values, defaults - map with undefined';
//   var testRoutine = () => true;
//   var defaults = { a : { c : 'c' }, b : [ 'b' ] };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with undefined';
//   var testRoutine = () => true;
//   var defaults = { a : { c : 'c' }, b : [ 'b' ] };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.assertOptions( testRoutine, options, defaults );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== defaults );
//
//   test.case = 'args - map with defined values, routine.defaults - map with undefined';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : { c : 'c' }, b : [ 'b' ] };
//   var options = { a : true, b : 'b' };
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.true( got === options );
//   test.true( got !== testRoutine.defaults );
//
//   test.case = 'args.length === 1 - map with defined values, defaults - map with maps and arrays';
//   var testRoutine = () => true;
//   testRoutine.defaults = { a : { c : 'c' }, b : [ 'b' ] };
//   var options = [ { a : true, b : 'b' } ];
//   var got = _.routine.assertOptions( testRoutine, options );
//   test.identical( got, { a : true, b : 'b' } );
//   test.identical( options.length, 1 );
//   test.true( got === options[ 0 ] );
//   test.true( got !== testRoutine.defaults );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.routine.assertOptions() );
//
//   test.case = 'not enough arguments';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine ) );
//
//   test.case = 'extra arguments';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {}, {}, {} ) );
//
//   test.case = 'wrong type of routine';
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( 'wrong', {}, {} ) );
//
//   test.case = 'wrong type of args';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, 'wrong', {} ) );
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ 'wrong' ], {} ) );
//
//   test.case = 'wrong type of defaults';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {}, 'wrong' ) );
//
//   test.case = 'wrong type of defaults';
//   var testRoutine = () => true;
//   testRoutine.defaults = 'wrong';
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {} ) );
//
//   test.case = 'args.length > 1';
//   var testRoutine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ {}, {} ], {} ) );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   var msg = 'Object should have no fields : "unknown", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { unknown : true, b : 1 }, {} ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ { unknown : true, b : 1 } ], {} ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { unknown : true, b : 1 }, { known : 1 } ), errCallback );
//   test.shouldThrowErrorSync( () =>
//   {
//     return _.routine.assertOptions( testRoutine, [ { unknown : true, b : 1 } ], { known : 1 } );
//   },
//   errCallback );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : 1 };
//   var msg = 'Object should have no fields : "unknown"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { unknown : true } ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, [ { unknown : true } ] ), errCallback );
//
//   test.case = 'options has not all keys';
//   var testRoutine = () => true;
//   var msg = 'Object should have fields : "known", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {}, { known : true, b : 1 } ), errCallback );
//
//   test.case = 'options has not all keys';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : true, b : 1 };
//   var msg = 'Object should have fields : "known", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, {} ), errCallback );
//
//   test.case = 'options has value `undefined`';
//   var testRoutine = () => true;
//   var msg = 'Object should have no undefines, but has : "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { known : undefined }, { known : 1 } ), errCallback );
//
//   test.case = 'options has value `undefined`';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : 1 };
//   var msg = 'Object should have no undefines, but has : "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.assertOptions( testRoutine, { known : undefined } ), errCallback );
// }
//
// //
//
// function assertOptions_( test )
// {
//   test.open( 'empty defaults' );
//
//   test.case = 'defaults - null, args - empty map';
//   var defaults = null;
//   var options = {};
//   var got = _.assertRoutineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - null, args - array with empty map';
//   var defaults = null;
//   var options = [ {} ];
//   var got = _.assertRoutineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - routine with empty defaults, args - empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = {};
//   var got = _.assertRoutineOptions_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with empty defaults, args - array with empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = [ {} ];
//   var got = _.assertRoutineOptions_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - empty map';
//   var defaults = {};
//   var options = {};
//   var got = _.assertRoutineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with empty map';
//   var defaults = {};
//   var options = [ {} ];
//   var got = _.assertRoutineOptions_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'empty defaults' );
//
//   /* - */
//
//   test.open( 'defaults, options - filled, no complementing' );
//
//   test.case = 'defaults - routine with defaults, args - map';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = { a : null, b : null, c : null };
//   var got = _.assertRoutineOptions_( routine, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with map';
//   var routine = () => null;
//   routine.defaults = { a : 1, b : null, c : 3 };
//   var options = [ { a : null, b : null, c : null } ];
//   var got = _.assertRoutineOptions_( routine, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - map';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = { a : null, b : null, c : null };
//   var got = _.assertRoutineOptions_( defaults, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with map';
//   var defaults = { a : 1, b : null, c : 3 };
//   var options = [ { a : null, b : null, c : null } ];
//   var got = _.assertRoutineOptions_( defaults, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'defaults, options - filled, no complementing' );
//
//   /* - */
//
//   test.case = 'defaults - has prototyped map, args - empty map';
//   var defaults = { a : 0, b : null };
//   var prototype = { a : 1, b : 2 };
//   var options = Object.create( prototype );
//   var got = _.assertRoutineOptions_( defaults, options );
//   test.identical( got.a, 1 );
//   test.identical( got.b, 2 );
//   var gotPrototype = Object.getPrototypeOf( got );
//   test.identical( gotPrototype, { a : 1, b : 2 } );
//   test.true( got === options );
//   test.true( gotPrototype === prototype );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_() );
//
//   test.case = 'not enough arguments';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( {} ) );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( {}, {}, {} ) );
//
//   test.case = 'wrong type of defaults';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( 'wrong', {} ) );
//
//   test.case = 'wrong type of defaults';
//   var routine = () => true;
//   routine.defaults = 'wrong';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( routine, {} ) );
//
//   test.case = 'wrong type of options';
//   var routine = () => true;
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( routine, 'wrong' ) );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( routine, [ 'wrong' ] ) );
//
//   test.case = 'options.length > 1';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( {}, [ {}, {} ] ) );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var msg = 'Object should have no fields : "unknown", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( testRoutine, { unknown : true, b : 1 } ), errCallback );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( testRoutine, [ { unknown : true, b : 1 } ] ), errCallback );
//
//   test.case = 'options has unknown options';
//   var msg = 'Object should have no fields : "unknown"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( {}, { unknown : true } ), errCallback );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( {}, [ { unknown : true } ] ), errCallback );
//
//   test.case = 'defaults has more keys than options';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : null };
//   var msg = 'Object should have fields : "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( testRoutine, {} ), errCallback );
//
//   test.case = 'defaults has value `undefined`';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : null };
//   var msg = 'Object should have no undefines, but has : "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptions_( testRoutine, { known : undefined } ), errCallback );
// }
//
// //
//
// function optionsPreservingUndefines_( test )
// {
//   test.open( 'empty defaults' );
//
//   test.case = 'defaults - null, args - empty map';
//   var defaults = null;
//   var options = {};
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - null, args - array with empty map';
//   var defaults = null;
//   var options = [ {} ];
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - routine with empty defaults, args - empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = {};
//   var got = _.routine.options_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with empty defaults, args - array with empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = [ {} ];
//   var got = _.routine.options_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - empty map';
//   var defaults = {};
//   var options = {};
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with empty map';
//   var defaults = {};
//   var options = [ {} ];
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'empty defaults' );
//
//   /* - */
//
//   test.open( 'defaults, options - empty' );
//
//   test.case = 'defaults - routine with defaults, args - empty map';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = {};
//   var got = _.routine.options_( routine, options );
//   test.identical( got, { a : { d : 1 }, b : null, c : [ 'a' ] } );
//   test.true( got.c !== routine.defaults.c );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with empty map';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ {} ];
//   var got = _.routine.options_( routine, options );
//   test.identical( got, { a : { d : 1 }, b : null, c : [ 'a' ] } );
//   test.true( got === options[ 0 ] );
//   test.true( got.c !== routine.defaults.c );
//
//   test.case = 'defaults - defaults, args - empty map';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = {};
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, { a : { d : 1 }, b : null, c : [ 'a' ] } );
//   test.true( got === options );
//   test.true( got.c !== defaults.c );
//
//   test.case = 'defaults - defaults, args - array with empty map';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ {} ];
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, { a : { d : 1 }, b : null, c : [ 'a' ] } );
//   test.true( got === options[ 0 ] );
//   test.true( got.c !== defaults.c );
//
//   test.close( 'defaults, options - empty' );
//
//   /* - */
//
//   test.open( 'defaults, options - filled, no complementing' );
//
//   test.case = 'defaults - routine with defaults, args - map';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = { a : null, b : null, c : null };
//   var got = _.routine.options_( routine, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with map';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ { a : null, b : null, c : null } ];
//   var got = _.routine.options_( routine, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - map';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = { a : null, b : null, c : null };
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with map';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ { a : null, b : null, c : null } ];
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, { a : null, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'defaults, options - filled, no complementing' );
//
//   /* - */
//
//   test.open( 'defaults, options - filled, complementing' );
//
//   test.case = 'defaults - routine with defaults, args - map with property value - undefined';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = { b : undefined };
//   var got = _.routine.options_( routine, options );
//   test.identical( got, { a : { d : 1 }, b : undefined, c : [ 'a' ] } );
//   test.true( got.c !== routine.defaults.c );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with map with property value - undefined';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ { b : undefined } ];
//   var got = _.routine.options_( routine, options );
//   test.identical( got, { a : { d : 1 }, b : undefined, c : [ 'a' ] } );
//   test.true( got === options[ 0 ] );
//   test.true( got.c !== routine.defaults.c );
//
//   test.case = 'defaults - defaults, args - map with property value - undefined';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = { b : undefined };
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, { a : { d : 1 }, b : undefined, c : [ 'a' ] } );
//   test.true( got === options );
//   test.true( got.c !== defaults.c );
//
//   test.case = 'defaults - defaults, args - array with map with property value - undefined';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ { b : undefined } ];
//   var got = _.routine.options_( defaults, options );
//   test.identical( got, { a : { d : 1 }, b : undefined, c : [ 'a' ] } );
//   test.true( got === options[ 0 ] );
//   test.true( got.c !== defaults.c );
//
//   test.close( 'defaults, options - filled, complementing' );
//
//   /* - */
//
//   test.case = 'defaults - has prototyped map, args - empty map';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var prototype = { a : 1, b : 2 };
//   var options = Object.create( prototype );
//   var got = _.routine.options_( defaults, options );
//   test.identical( got.a, { d : 1 } );
//   test.identical( got.b, null );
//   test.identical( got.c, [ 'a' ] );
//   var gotPrototype = Object.getPrototypeOf( got );
//   test.identical( gotPrototype, { a : 1, b : 2 } );
//   test.true( got === options );
//   test.true( gotPrototype === prototype );
//
//   test.case = 'defaults - has prototyped map, args - empty map';
//   var prototype = { a : 1, b : 2 };
//   var defaults = Object.create( null );
//   defaults.a = Object.create( prototype );
//   defaults.a.d = 1;
//   defaults.b = null;
//   defaults.c = [ 'a' ];
//   var options = {};
//   var got = _.routine.options_( defaults, options );
//   test.identical( got.a.d, 1 );
//   test.identical( got.b, null );
//   test.identical( got.c, [ 'a' ] );
//   var gotPrototype = Object.getPrototypeOf( got.a );
//   test.identical( gotPrototype, { a : 1, b : 2 } );
//   test.true( got === options );
//   test.true( gotPrototype === prototype );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.routine.options_() );
//
//   test.case = 'not enough arguments';
//   test.shouldThrowErrorSync( () => _.routine.options_( {} ) );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.routine.options_( {}, {}, {} ) );
//
//   test.case = 'wrong type of defaults';
//   test.shouldThrowErrorSync( () => _.routine.options_( 'wrong', {} ) );
//
//   test.case = 'wrong type of defaults';
//   var routine = () => true;
//   routine.defaults = 'wrong';
//   test.shouldThrowErrorSync( () => _.routine.options_( routine, {} ) );
//
//   test.case = 'wrong type of options';
//   var routine = () => true;
//   test.shouldThrowErrorSync( () => _.routine.options_( routine, 'wrong' ) );
//   test.shouldThrowErrorSync( () => _.routine.options_( routine, [ 'wrong' ] ) );
//
//   test.case = 'options.length > 1';
//   test.shouldThrowErrorSync( () => _.routine.options_( {}, [ {}, {} ] ) );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var msg = 'Routine testRoutine does not expect options: "unknown", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options_( testRoutine, { unknown : true, b : 1 } ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.options_( testRoutine, [ { unknown : true, b : 1 } ] ), errCallback );
//
//   test.case = 'options has unknown options';
//   var msg = 'Routine  does not expect options: "unknown"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.routine.options_( {}, { unknown : true } ), errCallback );
//   test.shouldThrowErrorSync( () => _.routine.options_( {}, [ { unknown : true } ] ), errCallback );
// }
//
// //
//
// function assertOptionsPreservingUndefines_( test )
// {
//   test.open( 'empty defaults' );
//
//   test.case = 'defaults - null, args - empty map';
//   var defaults = null;
//   var options = {};
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - null, args - array with empty map';
//   var defaults = null;
//   var options = [ {} ];
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - routine with empty defaults, args - empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = {};
//   var got = _.assertRoutineOptionsPreservingUndefines_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with empty defaults, args - array with empty map';
//   var routine = () => null;
//   routine.defaults = {};
//   var options = [ {} ];
//   var got = _.assertRoutineOptionsPreservingUndefines_( routine, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - empty map';
//   var defaults = {};
//   var options = {};
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with empty map';
//   var defaults = {};
//   var options = [ {} ];
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got, {} );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'empty defaults' );
//
//   /* - */
//
//   test.open( 'defaults, options - filled, no complementing' );
//
//   test.case = 'defaults - routine with defaults, args - map';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = { a : undefined, b : null, c : null };
//   var got = _.assertRoutineOptionsPreservingUndefines_( routine, options );
//   test.identical( got, { a : undefined, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - routine with defaults, args - array with map';
//   var routine = () => null;
//   routine.defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ { a : undefined, b : null, c : null } ];
//   var got = _.assertRoutineOptionsPreservingUndefines_( routine, options );
//   test.identical( got, { a : undefined, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.case = 'defaults - empty defaults, args - map';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = { a : undefined, b : null, c : null };
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got, { a : undefined, b : null, c : null } );
//   test.true( got === options );
//
//   test.case = 'defaults - empty defaults, args - array with map';
//   var defaults = { a : { d : 1 }, b : null, c : [ 'a' ] };
//   var options = [ { a : undefined, b : null, c : null } ];
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got, { a : undefined, b : null, c : null } );
//   test.true( got === options[ 0 ] );
//
//   test.close( 'defaults, options - filled, no complementing' );
//
//   /* - */
//
//   test.case = 'defaults - has prototyped map, args - empty map';
//   var defaults = { a : { d : 1 }, b : null };
//   var prototype = { a : 1, b : 2 };
//   var options = Object.create( prototype );
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got.a, 1 );
//   test.identical( got.b, 2 );
//   var gotPrototype = Object.getPrototypeOf( got );
//   test.identical( gotPrototype, { a : 1, b : 2 } );
//   test.true( got === options );
//   test.true( gotPrototype === prototype );
//
//   test.case = 'defaults - has prototyped map, args - empty map';
//   var prototype = { a : 1, b : 2 };
//   var defaults = Object.create( null );
//   defaults.a = Object.create( prototype );
//   defaults.a.d = 1;
//   defaults.b = null;
//   var options = { a : null, b : null };
//   var got = _.assertRoutineOptionsPreservingUndefines_( defaults, options );
//   test.identical( got.a, null );
//   test.identical( got.b, null );
//   test.true( got === options );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_() );
//
//   test.case = 'not enough arguments';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( {} ) );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( {}, {}, {} ) );
//
//   test.case = 'wrong type of defaults';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( 'wrong', {} ) );
//
//   test.case = 'wrong type of defaults';
//   var routine = () => true;
//   routine.defaults = 'wrong';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( routine, {} ) );
//
//   test.case = 'wrong type of options';
//   var routine = () => true;
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( routine, 'wrong' ) );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( routine, [ 'wrong' ] ) );
//
//   test.case = 'options.length > 1';
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( {}, [ {}, {} ] ) );
//
//   test.case = 'options has unknown options';
//   var testRoutine = () => true;
//   testRoutine.defaults = {};
//   var msg = 'Object should have no fields : "unknown", "b"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( testRoutine, { unknown : true, b : 1 } ), errCallback );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( testRoutine, [ { unknown : true, b : 1 } ] ), errCallback );
//
//   test.case = 'options has unknown options';
//   var msg = 'Object should have no fields : "unknown"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( {}, { unknown : true } ), errCallback );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( {}, [ { unknown : true } ] ), errCallback );
//
//   test.case = 'options has no all options from defaults';
//   var testRoutine = () => true;
//   testRoutine.defaults = { known : true };
//   var msg = 'Object should have fields : "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( testRoutine, {} ), errCallback );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( testRoutine, [ {} ] ), errCallback );
//
//   test.case = 'options has no all options from defaults';
//   var msg = 'Object should have fields : "known"';
//   var errCallback = ( err, arg ) =>
//   {
//     test.identical( arg, undefined );
//     test.true( _.error.is( err ) );
//     test.identical( _.strCount( err.message, msg ), 1 );
//   };
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( { known : true }, {} ), errCallback );
//   test.shouldThrowErrorSync( () => _.assertRoutineOptionsPreservingUndefines_( { known : true }, [ {} ] ), errCallback );
// }

//

function routinesCompose( test )
{

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function routineNotUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    // return _.arrayAppend_( result, counter );
    let result = _.arrayAppendArrays( null, arguments );
    return _.arrayAppend( result, counter );
  }

  function r2()
  {
    counter += 100;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _break()
  {
    return _.dont;
  }

  function chainer1( /* args, result, o, k */ )
  {
    let args = arguments[ 0 ];
    let result = arguments[ 1 ];
    let o = arguments[ 2 ];
    let k = arguments[ 3 ];
    return result;
  }

  /* - */

  test.case = 'empty';

  var counter = 0;
  var routines = [];
  var composition = _.routine.s.compose( routines );
  var got = composition( 1, 2, 3 );
  var expected = [];
  test.identical( got, expected );
  test.identical( counter, 0 );

  /* - */

  test.open( 'unrolling:1' )

  /* */

  test.case = 'without chainer';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 128 ];
  test.identical( got, expected );
  test.identical( counter, 128 );

  /* */

  test.case = 'with chainer';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  /* */

  test.case = 'with chainer and break';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _break, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, _.dont ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  /* */

  test.close( 'unrolling:1' )

  /* - */

  test.open( 'unrolling:0' )

  /* */

  test.case = 'without chainer';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ], 128 ];
  test.identical( got, expected );
  test.identical( counter, 128 );

  /* */

  test.case = 'with chainer';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ], 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  /* */

  test.case = 'with chainer and break';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, _break, null, r2, null ];
  var composition = _.routine.s.compose( routines, chainer1 );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ], _.dont ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  /* */

  test.close( 'unrolling:0' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAll() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){}, function(){} ) );

}

//

function routinesComposeAll( test )
{

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function routineNotUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    // return _.arrayAppend_( null, arguments, counter );
    let result = _.arrayAppendArrays( null, arguments );
    return _.arrayAppend( result, counter );
  }

  function r2()
  {
    counter += 100;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _nothing()
  {
    return undefined;
  }

  function _dont()
  {
    return _.dont;
  }

  test.case = 'with nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, r2, null ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 128 ];
  test.identical( got, expected );
  test.identical( counter, 128 );

  test.case = 'last nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16 ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'not unrolling and last nothing';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ [ 1, 2, 3, 16 ] ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'with nothing and dont';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, _dont, null, r2, null ];
  var composition = _.routine.s.composeAll( routines );
  var got = composition( 1, 2, 3 );
  var expected = false;
  test.identical( got, expected );
  test.identical( counter, 16 );

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAll() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){} ) );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){}, function(){} ) );

}

//

function routinesComposeAllReturningLast( test )
{

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function routineNotUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    // return _.arrayAppend_( null, arguments, counter );
    let result = _.arrayAppendArrays( null, arguments );
    return _.arrayAppend( result, counter );
  }

  function r2()
  {
    counter += 100;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _nothing()
  {
    return undefined;
  }

  function _dont()
  {
    return _.dont;
  }

  test.case = 'with nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, r2, null ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = 128;
  test.identical( got, expected );
  test.identical( counter, 128 );

  test.case = 'last nothing';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = 16;
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'not unrolling and last nothing';

  var counter = 0;
  var routines = [ null, routineNotUnrolling, null, _nothing ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16 ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  test.case = 'with nothing and dont';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _nothing, null, _dont, null, r2, null ];
  var composition = _.routine.s.composeAllReturningLast( routines );
  var got = composition( 1, 2, 3 );
  var expected = _.dont;
  test.identical( got, expected );
  test.identical( counter, 16 );

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAllReturningLast() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAllReturningLast( routines, function(){} ) );
  test.shouldThrowErrorSync( () => _.routine.s.composeAllReturningLast( routines, function(){}, function(){} ) );

}

//

function routinesChain( test )
{

  function routineUnrolling()
  {
    counter += 10;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += arguments[ a ];
    return _.unrollAppend( _.unroll.make( null ), _.unroll.make( arguments ), counter );
  }

  function r2()
  {
    counter += 100;
    for( var a = 0 ; a < arguments.length ; a++ )
    counter += 2*arguments[ a ];
    return counter;
  }

  function _break()
  {
    return _.dont;
  }

  function dontInclude()
  {
    return undefined;
  }

  /* */

  test.case = 'without break';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, r2, null ];
  var composition = _.routine.s.chain( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  /* */

  test.case = 'with break';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, _break, null, r2, null ];
  var composition = _.routine.s.chain( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16 ];
  test.identical( got, expected );
  test.identical( counter, 16 );

  /* */

  test.case = 'with dont include';

  var counter = 0;
  var routines = [ null, routineUnrolling, null, dontInclude, null, r2, null ];
  var composition = _.routine.s.chain( routines );
  var got = composition( 1, 2, 3 );
  var expected = [ 1, 2, 3, 16, 160 ];
  test.identical( got, expected );
  test.identical( counter, 160 );

  if( !Config.debug )
  return;

  test.case = 'bad arguments';

  test.shouldThrowErrorSync( () => _.routine.s.composeAll() );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){} ) );
  test.shouldThrowErrorSync( () => _.routine.s.composeAll( routines, function(){}, function(){} ) );

}

// //
//
// function routineExtend_old( test )
// {
//
//   test.open( 'dst is null, src has head and body properties');
//
//   test.case = 'dst is null, src is routine maked by routine.unite';
//   var got = _.routine.extend_old( null, _.routine.unite );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   test.identical( typeof got, 'function' );
//
//   var got = _.routine.extend_old( null, _.routine.s.compose );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );п
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   test.identical( typeof got, 'function' );
//
//   function f1(){}
//   f1.map1 = {};
//   f1.map1.a = 1;
//   f1.map2 = Object.create( {} );
//   f1.map2.a = 2;
//   f1.str = 'str';
//   f1.number = 13;
//   f1.routine = function r(){};
//
//   var got = _.routine.extend_old( null, f1 );
//   test.equivalent( got.map1, f1.map1 );
//   test.equivalent( got.map2, f1.map2 );
//   test.equivalent( got.str, f1.str );
//   test.equivalent( got.number, f1.number );
//   test.equivalent( got.routine, f1.routine );
//
//   test.case = 'second arg has not head and body properties';
//   var got = _.routine.extend_old( null, _.unrollIs );
//   test.true( _.routine.is( got ) );
//   test.true( got( _.unroll.from( [] ) ) );
//
//   test.case = 'dst is null, src is map with head and body properties';
//   var src =
//   {
//     head : _.routine.unite.head,
//     body : _.routine.unite.body,
//     map : { a : 2 },
//   }
//   var got = _.routine.extend_old( null, src );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   test.equivalent( got.map, { a : 2 } );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'dst is null, src is map with head and body properties';
//   var src =
//   {
//     head : _.routine.unite.head,
//     body : _.routine.unite.body,
//     map : { a : 2 },
//   };
//   var got = _.routine.extend_old( null, src );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   test.equivalent( got.map, { a : 2 } );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'dst is null, src is map with head and body properties';
//   var src =
//   {
//     head : _.routine.unite.head,
//     body : _.routine.unite.body,
//     a : [ 1 ],
//     b : 'str',
//     c : { str : 'str' }
//   }
//   var got = _.routine.extend_old( null, src );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   test.identical( got.a, [ 1 ] );
//   test.identical( got.b, 'str' );
//   test.identical( got.c, Object.create( { str : 'str' } ) );
//   test.identical( typeof got, 'function' );
//
//   test.close( 'dst is null, src has head and body properties');
//
//   /* - */
//
//   test.open( 'single dst');
//
//   test.case = 'single dst';
//   var dst = ( o ) =>
//   {
//   }
//   var got = _.routine.extend_old( dst );
//   test.identical( got, dst );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'single dst is routine, has properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 3;
//   dst.c = 'c';
//   var got = _.routine.extend_old( dst );
//   test.identical( got, dst );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, 3 );
//   test.identical( got.c, 'c' );
//
//   test.case = 'single dst is routine, has hiden properties';
//   var dst = ( o ) =>
//   {
//   };
//   var props =
//   {
//     'a' :
//     {
//       value : 0,
//       enumerable : true,
//       writable : false,
//     },
//     'b' :
//     {
//       value : { a : 2 },
//       enumerable : false,
//       writable : false,
//     }
//   };
//   Object.defineProperties( dst, props );
//   var got = _.routine.extend_old( dst );
//   test.identical( got, dst );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, { a : 2 } );
//   var got = Object.getOwnPropertyDescriptor( got, 'b' );
//   test.false( got.enumerable );
//
//   test.close( 'single dst');
//
//   test.case = 'dst has properties, src map has different properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 0;
//   var got = _.routine.extend_old( dst, { c : 1, d : 1, e : { s : 1 } } );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, 0 );
//   test.identical( got.c, 1 );
//   test.identical( got.e, Object.create( { s : 1 } ) );
//
//   test.case = 'dst has properties, src map has the same properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 0;
//   var got = _.routine.extend_old( dst, { a : 1, b : 1 } );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 1 );
//   test.identical( got.b, 1 );
//
//   /* */
//
//   test.case = 'dst has non-writable properties';
//   var dst = ( o ) =>
//   {
//   };
//   var props =
//   {
//     'a' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 0,
//     },
//     'b' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 0,
//     }
//   };
//   Object.defineProperties( dst, props );
//   var got = _.routine.extend_old( dst, { a : 3, b : 2 } );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, 0 );
//
//   test.case = 'src has non-writable properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 0;
//   var src = {};
//   var props =
//   {
//     'a' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 3,
//     },
//     'b' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 2,
//     }
//   };
//   Object.defineProperties( src, props );
//   var got = _.routine.extend_old( dst, src );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 3 );
//   test.identical( got.b, 2 );
//
//   test.case = 'src is an array';
//   test.shouldThrowErrorSync( () =>
//   {
//     var dst = ( o ) =>
//     {
//     };
//     var got = _.routine.extend_old( dst, [ 'a', 1 ] );
//     test.identical( typeof got, 'function' );
//     test.identical( got[ 0 ], 'a' );
//     test.identical( got[ 1 ], 1 );
//   });
//
//   test.open( 'few extends');
//
//   test.case = 'null extends other routine, null extends result';
//   var src = _.routine.extend_old( null, _.routine.s.compose );
//   var got = _.routine.extend_old( null, src );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'src extends routine, result extends map ';
//   var src1 =
//   {
//     head : _.routine.unite.head,
//     body : _.routine.unite.body,
//     a : 'str',
//     b : { b : 3 },
//   };
//   var src = _.routine.extend_old( null, _.routine.s.compose );
//   var got = _.routine.extend_old( src, src1 );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   test.identical( got.b, Object.create( { b : 3 } ) );
//   test.true( got.a === 'str' );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'dst extends map, dst extends other map';
//   var dst = () =>
//   {
//   };
//   var src1 =
//   {
//     head : _.routine.s.compose.head,
//     body : _.routine.s.compose.body,
//     a : [ 'str' ],
//     c : { d : 2 },
//   };
//   var src = _.routine.extend_old( dst, { c : {}, b : 'str' } );
//   var got = _.routine.extend_old( dst, src1 );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   test.identical( got.a, [ 'str' ] );
//   test.identical( got.b, 'str' );
//   test.identical( got.c, Object.create( { d : 2 } ) );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'dst has map property, dst extends other map';
//   var dst = () =>
//   {
//   };
//   dst.map = { a : 'str' };
//   var src1 =
//   {
//     head : _.routine.s.compose.head,
//     body : _.routine.s.compose.body,
//     a : [ 'str' ],
//     map : { d : 2 },
//   };
//   var src = _.routine.extend_old( dst, { c : {} } );
//   var got = _.routine.extend_old( dst, src1 );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   test.identical( got.a, [ 'str' ] );
//   var expectedMap = Object.create( { d : 2 } );
//   expectedMap.a = 'str';
//   test.identical( got.map, expectedMap );
//   test.equivalent( got.c, {} );
//   test.identical
//   (
//     _.mapBut_( null, _.props.onlyExplicit( got.c ), [ '__proto__' ] ),
//     _.mapBut_( null, _.props.onlyExplicit( {} ), [ '__proto__' ] )
//   );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'dst extends routine1, src extends routine, dst extends src';
//   var dst = () =>
//   {
//   };
//   var src = () =>
//   {
//   };
//   var routine = () =>
//   {
//   };
//   routine.a = 0;
//   routine.b = [ 'str' ];
//   var routine1 = () =>
//   {
//   };
//   routine1.a = 2;
//   routine1.c = 'str';
//   var src1 = _.routine.extend_old( src, routine );
//   var src2 = _.routine.extend_old( dst, routine1 );
//   var got = _.routine.extend_old( src2, src1 )
//   test.identical( got.a, 0 );
//   test.identical( got.b, [ 'str' ] );
//   test.identical( got.c, 'str' );
//   test.identical( dst.a, got.a );
//   test.identical( dst.b, got.b );
//   test.identical( dst.c, got.c );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'dst extends map, src extends map, dst extends src';
//   var dst = () =>
//   {
//   };
//   var src = () =>
//   {
//   };
//   var src1 = _.routine.extend_old( src, { o1 : 1, o2 : 'str' } );
//   var src2 = _.routine.extend_old( dst, { o3 : 'o3', o1 : 'map' } );
//   var got = _.routine.extend_old( src2, src1 )
//   test.identical( got.o1, 1 );
//   test.identical( got.o2, 'str' );
//   test.identical( got.o3, 'o3' );
//   test.identical( dst.a, got.a );
//   test.identical( dst.b, got.b );
//   test.identical( dst.c, got.c );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'extend by map';
//   var dst = () =>
//   {
//   };
//   Object.defineProperties( dst, {
//     'b' : {
//       value : { a : 2 },
//       enumerable : true,
//       writable : true,
//     }
//   });
//   var got = _.routine.extend_old( dst );
//   test.equivalent( got.b, { a : 2 } );
//
//   test.case = 'extend by map';
//   var dst = ( o ) =>
//   {
//   };
//   dst.b = { map : 2 };
//   var got = _.routine.extend_old( dst, { b : { map : 3 } } );
//   test.equivalent( got.b, { map : 3 } );
//
//   test.close( 'few extends');
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'no arguments';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend_old();
//   });
//
//   test.case = 'three arguments';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend_old( null, { a : 1 }, { b : 2 });
//   });
//
//   test.case = 'single dst is null';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend_old( null );
//   });
//
//   // test.case = 'second arg has not head and body properties';
//   // test.shouldThrowErrorSync( function()
//   // {
//   //   _.routine.extend_old( null, _.unrollIs );
//   // });
//
//   test.case = 'second arg is primitive';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend_old( _.unrollIs, 'str' );
//   });
//
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend_old( _.unrollIs, 1 );
//   });
//
//   test.case = 'dst is not routine or null';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend_old( 1, { a : 1 } );
//   });
//
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend_old( 'str', { a : 1 } );
//   });
//
// }
//
// //
//
// /* qqq : for Dmytro : split on test routines by number of arguments and extend */
// /* qqq : for Dmytro : write test routines for supplement */
// /* qqq : for Dmytro : write test for each strategy ( with subroutine act ) */
// function routineExtend( test )
// {
//   test.open( 'dst is null, src has head and body properties');
//
//   // test.case = 'dst is null, src is routine maked by routine.unite';
//   // var got = _.routine.extend( null, _.routine.unite );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   // test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : bad : dont use routines from modules as test assets */
//
//   var got = _.routine.extend( null, _.routine.s.compose );
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   test.identical( typeof got, 'function' );
//
//   function f1(){}
//   f1.map1 = {};
//   f1.map1.a = 1;
//   f1.map2 = Object.create( {} );
//   f1.map2.a = 2;
//   f1.str = 'str';
//   f1.number = 13;
//   f1.routine = function r(){};
//
//   var got = _.routine.extend( null, f1 );
//   test.equivalent( got.map1, f1.map1 );
//   test.identical( _.props.keys( got.map2 ), [ 'a' ] );
//   test.identical( got.map2.a, f1.map2.a );
//   test.equivalent( got.str, f1.str );
//   test.equivalent( got.number, f1.number );
//   test.equivalent( got.routine, f1.routine );
//
//   test.case = 'second arg has not head and body properties';
//   var got = _.routine.extend( null, _.unrollIs );
//   test.true( _.routine.is( got ) );
//   test.true( got( _.unroll.from( [] ) ) );
//
//   // test.case = 'dst is null, src is map with head and body properties';
//   // var src =
//   // {
//   //   head : _.routine.unite.head,
//   //   body : _.routine.unite.body,
//   //   map : { a : 2 },
//   // }
//   // var got = _.routine.extend( null, src );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   // test.equivalent( got.map, { a : 2 } );
//   // test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : bad : dont use routines from modules as test assets */
//
//   // test.case = 'dst is null, src is map with head and body properties';
//   // var src =
//   // {
//   //   head : _.routine.unite.head,
//   //   body : _.routine.unite.body,
//   //   map : { a : 2 },
//   // };
//   // var got = _.routine.extend( null, src );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   // test.equivalent( got.map, { a : 2 } );
//   // test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : bad : dont use routines from modules as test assets */
//
//   // test.case = 'dst is null, src is map with head and body properties';
//   // var src =
//   // {
//   //   head : _.routine.unite.head,
//   //   body : _.routine.unite.body,
//   //   a : [ 1 ],
//   //   b : 'str',
//   //   c : { str : 'str' }
//   // }
//   // var got = _.routine.extend( null, src );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   // test.identical( got.a, [ 1 ] );
//   // test.identical( got.b, 'str' );
//   // test.identical( got.c, { str : 'str' } );
//   // test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : bad : dont use routines from modules as test assets */
//
//   test.close( 'dst is null, src has head and body properties');
//
//   /* - */
//
//   test.open( 'single dst');
//
//   test.case = 'single dst';
//   var dst = ( o ) =>
//   {
//   }
//   var got = _.routine.extend( dst );
//   test.identical( got, dst );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'single dst is routine, has properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 3;
//   dst.c = 'c';
//   var got = _.routine.extend( dst );
//   test.identical( got, dst );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, 3 );
//   test.identical( got.c, 'c' );
//
//   test.case = 'single dst is routine, has hiden properties';
//   var dst = ( o ) =>
//   {
//   };
//   var props =
//   {
//     'a' :
//     {
//       value : 0,
//       enumerable : true,
//       writable : false,
//     },
//     'b' :
//     {
//       value : { a : 2 },
//       enumerable : false,
//       writable : false,
//     }
//   };
//   Object.defineProperties( dst, props );
//   var got = _.routine.extend( dst );
//   test.identical( got, dst );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, { a : 2 } );
//   var got = Object.getOwnPropertyDescriptor( got, 'b' );
//   test.false( got.enumerable );
//
//   test.close( 'single dst');
//
//   test.case = 'dst has properties, src map has different properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 0;
//   var got = _.routine.extend( dst, { c : 1, d : 1, e : { s : 1 } } );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, 0 );
//   test.identical( got.c, 1 );
//   test.identical( got.e, { s : 1 } );
//
//   test.case = 'dst has properties, src map has the same properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 0;
//   var got = _.routine.extend( dst, { a : 1, b : 1 } );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 1 );
//   test.identical( got.b, 1 );
//
//   /* */
//
//   test.case = 'dst has non-writable properties';
//   var dst = ( o ) =>
//   {
//   };
//   var props =
//   {
//     'a' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 0,
//     },
//     'b' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 0,
//     }
//   };
//   Object.defineProperties( dst, props );
//   var got = _.routine.extend( dst, { a : 3, b : 2 } );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 0 );
//   test.identical( got.b, 0 );
//
//   test.case = 'src has non-writable properties';
//   var dst = ( o ) =>
//   {
//   };
//   dst.a = 0;
//   dst.b = 0;
//   var src = {};
//   var props =
//   {
//     'a' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 3,
//     },
//     'b' :
//     {
//       enumerable : true,
//       writable : false,
//       value : 2,
//     }
//   };
//   Object.defineProperties( src, props );
//   var got = _.routine.extend( dst, src );
//   test.identical( typeof got, 'function' );
//   test.identical( got.a, 3 );
//   test.identical( got.b, 2 );
//
//   test.case = 'src is an array';
//   test.shouldThrowErrorSync( () =>
//   {
//     var dst = ( o ) =>
//     {
//     };
//     var got = _.routine.extend( dst, [ 'a', 1 ] );
//     test.identical( typeof got, 'function' );
//     test.identical( got[ 0 ], 'a' );
//     test.identical( got[ 1 ], 1 );
//   });
//
//   test.open( 'few extends');
//
//   test.case = 'null extends other routine, null extends result';
//   var src = _.routine.extend( null, _.routine.s.compose );
//   var got = _.routine.extend( null, src );
//   /* qqq : for Dmytro : don't use routiens from the module as data for testing */
//   test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : lack of checks */
//
//   // test.case = 'src extends routine, result extends map ';
//   // var src1 =
//   // {
//   //   head : _.routine.unite.head,
//   //   body : _.routine.unite.body,
//   //   a : 'str',
//   //   b : { b : 3 },
//   // };
//   // var src = _.routine.extend( null, _.routine.s.compose );
//   // var got = _.routine.extend( src, src1 );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.unite.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.unite.body ) );
//   // test.identical( got.b, { b : 3 } );
//   // test.true( got.a === 'str' );
//   // test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : bad : dont use routines from modules as test assets */
//
//   // test.case = 'dst extends map, dst extends other map';
//   // var dst = () =>
//   // {
//   // };
//   // var src1 =
//   // {
//   //   head : _.routine.s.compose.head,
//   //   body : _.routine.s.compose.body,
//   //   a : [ 'str' ],
//   //   c : { d : 2 },
//   // };
//   // var src = _.routine.extend( dst, { c : {}, b : 'str' } );
//   // var got = _.routine.extend( dst, src1 );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   // test.identical( got.a, [ 'str' ] );
//   // test.identical( got.b, 'str' );
//   // test.identical( got.c, { d : 2 } );
//   // test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : bad : dont use routines from modules as test assets */
//
//   // test.case = 'dst has map property, dst extends other map';
//   // var dst = () =>
//   // {
//   // };
//   // dst.map = { a : 'str' };
//   // var src1 =
//   // {
//   //   head : _.routine.s.compose.head,
//   //   body : _.routine.s.compose.body,
//   //   a : [ 'str' ],
//   //   map : { d : 2 },
//   // };
//   // var src = _.routine.extend( dst, { c : {} } );
//   // var got = _.routine.extend( dst, src1 );
//   // test.identical( _.props.extend( null, got.head ), _.props.extend( null, _.routine.s.compose.head ) );
//   // test.identical( _.props.extend( null, got.body ), _.props.extend( null, _.routine.s.compose.body ) );
//   // test.identical( got.a, [ 'str' ] );
//   // var expectedMap = { d : 2 };
//   // expectedMap.a = 'str';
//   // test.identical( got.map, expectedMap );
//   // test.equivalent( got.c, {} );
//   // test.identical
//   // (
//   //   _.mapBut_( null, _.props.onlyExplicit( got.c ), [ '__proto__' ] ),
//   //   _.mapBut_( null, _.props.onlyExplicit( Object.create( null ) ), [ '__proto__' ] )
//   // );
//   // test.identical( typeof got, 'function' );
//   /* qqq : for Dmytro : bad : dont use routines from modules as test assets */
//
//   test.case = 'dst extends routine1, src extends routine, dst extends src';
//   var dst = () =>
//   {
//   };
//   var src = () =>
//   {
//   };
//   var routine = () =>
//   {
//   };
//   routine.a = 0;
//   routine.b = [ 'str' ];
//   var routine1 = () =>
//   {
//   };
//   routine1.a = 2;
//   routine1.c = 'str';
//   var src1 = _.routine.extend( src, routine );
//   var src2 = _.routine.extend( dst, routine1 );
//   var got = _.routine.extend( src2, src1 )
//   test.identical( got.a, 0 );
//   test.identical( got.b, [ 'str' ] );
//   test.identical( got.c, 'str' );
//   test.identical( dst.a, got.a );
//   test.identical( dst.b, got.b );
//   test.identical( dst.c, got.c );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'dst extends map, src extends map, dst extends src';
//   var dst = () =>
//   {
//   };
//   var src = () =>
//   {
//   };
//   var src1 = _.routine.extend( src, { o1 : 1, o2 : 'str' } );
//   var src2 = _.routine.extend( dst, { o3 : 'o3', o1 : 'map' } );
//   var got = _.routine.extend( src2, src1 )
//   test.identical( got.o1, 1 );
//   test.identical( got.o2, 'str' );
//   test.identical( got.o3, 'o3' );
//   test.identical( dst.a, got.a );
//   test.identical( dst.b, got.b );
//   test.identical( dst.c, got.c );
//   test.identical( typeof got, 'function' );
//
//   test.case = 'extend by map';
//   var dst = () =>
//   {
//   };
//   Object.defineProperties( dst, {
//     'b' : {
//       value : { a : 2 },
//       enumerable : true,
//       writable : true,
//     }
//   });
//   var got = _.routine.extend( dst );
//   test.equivalent( got.b, { a : 2 } );
//
//   test.case = 'extend by map';
//   var dst = ( o ) =>
//   {
//   };
//   dst.b = { map : 2 };
//   var got = _.routine.extend( dst, { b : { map : 3 } } );
//   test.equivalent( got.b, { map : 3 } );
//
//   test.close( 'few extends');
//
//   test.case = 'sanitare';
//   var exp =
//   {
//     'defaults' :
//     {
//       'head' : null,
//       'body' : null,
//       'tail' : null,
//       'name' : null,
//       'strategy' : null,
//     }
//   }
//   test.identical( _.props.extend( null, _.routine.unite.body ), exp );
//   var exp =
//   {
//     'defaults' :
//     {
//       'head' : null,
//       'body' : null,
//       'tail' : null,
//       'name' : null,
//       'strategy' : 'replacing',
//     }
//   }
//   test.identical( _.mapBut_( null, _.routine.unite, [ 'body', 'head' ] ), exp );
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'no arguments';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend();
//   });
//
//   test.case = 'three arguments';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend( null, { a : 1 }, { b : 2 });
//   });
//
//   test.case = 'single dst is null';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend( null );
//   });
//
//   // test.case = 'second arg has not head and body properties';
//   // test.shouldThrowErrorSync( function()
//   // {
//   //   _.routine.extend( null, _.unrollIs );
//   // });
//
//   test.case = 'second arg is primitive';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend( _.unrollIs, 'str' );
//   });
//
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend( _.unrollIs, 1 );
//   });
//
//   test.case = 'dst is not routine or null';
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend( 1, { a : 1 } );
//   });
//
//   test.shouldThrowErrorSync( function()
//   {
//     _.routine.extend( 'str', { a : 1 } );
//   });
// }
//
// //
//
// function extendSpecial( test )
// {
//
//   test.case = 'assumption';
//
//   var obj = { f1, f2 : f1.bind() }
//   test.true( obj.f1() === obj );
//   test.true( obj.f2() === undefined );
//
//   /* */
//
//   act({ method : 'extendCloning' });
//   act({ method : 'extendInheriting' });
//   act({ method : 'extendReplacing' });
//
//   /* */
//
//   function f1()
//   {
//     return this;
//   }
//
//   /* */
//
//   function act( env )
//   {
//
//     /* */
//
//     test.case = `${__.entity.exportStringSolo( env )}, basic`;
//
//     function routine1a( o )
//     {
//       return o.a + o.b;
//     }
//     routine1a.defaults =
//     {
//       a : 1,
//       b : 3,
//     }
//
//     var routine1b = _.routine.extendInheriting( null, routine1a );
//     test.true( routine1a !== routine1b );
//     test.true( routine1a.defaults !== routine1b.defaults );
//     test.true( _.prototype.has( routine1b.defaults, routine1a.defaults ) );
//     test.equivalent( routine1a.defaults, routine1b.defaults );
//
//     var united = _.routine.unite( null, routine1b );
//     test.identical( united(), 4 );
//
//     /* */
//
//     test.case = `${__.entity.exportStringSolo( env )}, triple`;
//
//     function routine2a( o )
//     {
//       return o.a + o.b;
//     }
//     var defaults2a = routine2a.defaults =
//     {
//       a : 1,
//       b : 3,
//     }
//
//     function routine2b( o )
//     {
//       return o.a + o.b;
//     }
//     var defaults2b = routine2b.defaults =
//     {
//       a : 2,
//       b : 5,
//     }
//
//     var routine2c = _.routine[ env.method ]( null, routine2a, routine2b );
//     test.true( routine2c !== routine2a );
//     test.true( routine2c !== routine2b );
//     test.true( routine2a.defaults === defaults2a );
//     test.true( routine2b.defaults === defaults2b );
//     test.true( !_.prototype.has( routine2c.defaults, routine2a.defaults ) );
//
//     if( env.method === 'extendCloning' )
//     test.true( !_.prototype.has( routine2c.defaults, routine2b.defaults ) );
//     else
//     test.true( _.prototype.has( routine2c.defaults, routine2b.defaults ) );
//
//     if( env.method === 'extendReplacing' )
//     {
//       test.true( routine2c.defaults === routine2b.defaults );
//     }
//     else
//     {
//       test.true( routine2c.defaults !== routine2b.defaults );
//     }
//
//     var exp =
//     {
//       a : 1,
//       b : 3,
//     }
//     test.equivalent( routine2a.defaults, exp );
//
//     var exp =
//     {
//       a : 2,
//       b : 5,
//     }
//     test.equivalent( routine2b.defaults, exp );
//
//     var exp =
//     {
//       a : 2,
//       b : 5,
//     }
//     test.equivalent( routine2c.defaults, exp );
//
//     var united = _.routine.unite( null, routine2c ); /* qqq : for Dmytro : write such test routine for _.routine.unite() */
//     test.identical( united(), 7 );
//
//     /* */
//
//   }
//
// }
//
// //
//
// function extendBodyInstanicing( test )
// {
//
//   act({ method : 'extendCloning' });
//   act({ method : 'extendInheriting' });
//   act({ method : 'extendReplacing' });
//   act({ method : 'extend' });
//
//   /* */
//
//   function act( env )
//   {
//
//     test.case = `${__.entity.exportStringSolo( env )}`;
//
//     function routine1Dst( o )
//     {
//       return o.a + o.b;
//     }
//
//     function routine1a_body( o )
//     {
//       return o.a + o.b + 1;
//     }
//     var defaults1a = routine1a_body.defaults =
//     {
//       a : 1,
//       b : 3,
//     }
//
//     var routine1a = _.routine.uniteReplacing( null, routine1a_body );
//
//     test.true( routine1a.body.defaults === defaults1a );
//     test.true( routine1a.defaults === defaults1a );
//
//     _.routine[ env.method ]( routine1Dst, routine1a );
//     test.identical( env.method === 'extendReplacing', routine1Dst.body === routine1a_body );
//     test.true( routine1a.body === routine1a_body );
//
//   }
//
// }
//
// //
//
// /* qqq : for Dmytro : extend */
// function extendThrowing( test )
// {
//
//   act({ method : 'extendCloning' });
//   act({ method : 'extendInheriting' });
//   act({ method : 'extendReplacing' });
//   act({ method : 'extend' });
//
//   /* */
//
//   function act( env )
//   {
//
//     test.case = 'assumption';
//     var got = _.routine[ env.method ]( f1 );
//     test.true( got === f1 );
//
//     if( Config.debug )
//     return test.true( true );
//
//     test.case = 'undefined second arg';
//     test.shouldThrowErrorSync( () => _.routine[ env.method ]( f1, undefined ) );
//     test.case = 'undefined first arg';
//     test.shouldThrowErrorSync( () => _.routine[ env.method ]( undefined, f1 ) );
//
//     test.case = 'sanitare';
//     test.identical( _.props.extend( null, f1 ), {} );
//
//   }
//
//   function f1()
//   {
//   }
//
// }
//
// //
//
// function routineDefaults( test )
// {
//
//   test.case = 'make new routine';
//
//   function add1_head( routine, args )
//   {
//     return _.routine.options( routine, args );
//   }
//   function add1_body( o )
//   {
//     o = _.routine.assertOptions( add1, arguments );
//     return o.a + o.b;
//   }
//   add1_body.defaults =
//   {
//     a : 1,
//     b : 3,
//   }
//   let add1 = _.routine.unite( add1_head, add1_body );
//
//   test.description = 'control call';
//   var got = add1();
//   test.identical( got, 4 );
//
//   test.description = 'generate';
//   let add2 = _.routine.defaults( null, add1, { b : 5 } );
//   test.true( add1 !== add2 );
//   test.true( add1.defaults !== add2.defaults );
//   test.true( _.aux.is( add1.defaults ) );
//   test.true( _.aux.is( add2.defaults ) );
//   test.true( add1.defaults.b === 3 );
//   test.true( add2.defaults.b === 5 );
//
//   test.description = 'trivial call';
//   var got = add2();
//   test.identical( got, 6 );
//
//   /* */
//
//   test.case = 'adjust routine defaults';
//
//   function add3_head( routine, args )
//   {
//     return _.routine.options( routine, args );
//   }
//   function add3_body( o )
//   {
//     o = _.routine.assertOptions( add1, arguments );
//     return o.a + o.b;
//   }
//   add3_body.defaults =
//   {
//     a : 1,
//     b : 3,
//   }
//   let add3 = _.routine.unite( add3_head, add3_body );
//
//   test.description = 'control call';
//   var got = add3();
//   test.identical( got, 4 );
//
//   test.description = 'generate';
//   let add4 = _.routine.defaults( add3, { b : 5 } );
//   test.true( add3 === add4 );
//   test.true( add3.defaults === add4.defaults );
//   test.true( _.aux.is( add3.defaults ) );
//   test.true( _.aux.is( add4.defaults ) );
//   test.true( add3.defaults.b === 5 );
//   test.true( add4.defaults.b === 5 );
//
//   test.description = 'trivial call';
//   var got = add4();
//   test.identical( got, 6 );
//
// }
//
// //
//
// // qqq : for Dmytro : extend the routine. introduce subroutine for strategies. maybe split?
// function uniteBasic( test )
// {
//   function headObject( rotine, args )
//   {
//     let o = Object.create( null );
//     o.args = args;
//     return o;
//   }
//
//   function headUnroll( rotine, args )
//   {
//     return _.unroll.make( args );
//   }
//
//   function bodyObject( o )
//   {
//     return _.array.make( o.args );
//   }
//   bodyObject.defaults =
//   {
//     args : null,
//   }
//
//   function bodyUnroll()
//   {
//     return _.array.make( arguments );
//   }
//   bodyUnroll.defaults =
//   {
//     args : null,
//   }
//
//   function tail( result )
//   {
//     result[ 0 ] += 1;
//     return result;
//   }
//
//   /* - */
//
//   test.open( 'only body' );
//
//   test.case = 'head - undefined, body expects map';
//   var routine = _.routine.unite( undefined, bodyObject );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine({ args : _.argumentsArray.make([ 1, 2 ]) });
//   test.true( _.arrayIs( got ) );
//   test.identical( got, [ 1, 2 ] );
//
//   // test.case = 'head - undefined, body expects unroll';
//   // var routine = _.routine.unite( undefined, bodyUnroll );
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 1, 2 ] );
//
//   test.case = 'head - null, body expects map';
//   var routine = _.routine.unite( null, bodyObject );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine({ args : _.argumentsArray.make([ 1, 2 ]) });
//   test.true( _.arrayIs( got ) );
//   test.identical( got, [ 1, 2 ] );
//
//
//   // test.case = 'head - null, body expects unroll';
//   // var routine = _.routine.unite( null, bodyUnroll );
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 1, 2 ] );
//
//   /* */
//
//
//   // test.case = 'head - null';
//   // var routine = _.routine.unite({ head : null, body : bodyUnroll });
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 1, 2 ] );
//
//   // test.case = 'head - undefined';
//   // var routine = _.routine.unite({ head : undefined, body : bodyUnroll });
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 1, 2 ] );
//
//   test.close( 'only body' );
//
//   /* - */
//
//   test.open( 'head and body' );
//
//   test.case = 'make from arguments, routine expects map';
//   var routine = _.routine.unite( headObject, bodyObject );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   test.case = 'make from arguments, routine expects unroll';
//   var routine = _.routine.unite( headUnroll, bodyUnroll );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyUnroll' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   /* */
//
//   test.case = 'make from map, routine expects map';
//   var routine = _.routine.unite({ head : headObject, body : bodyObject });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   test.case = 'make from map, routine expects unroll';
//   var routine = _.routine.unite({ head : headUnroll, body : bodyUnroll });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyUnroll' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   test.close( 'head and body' );
//
//   /* - */
//
//   test.open( 'body and tail' );
//
//   test.case = 'head - undefined, body expects map';
//   var routine = _.routine.unite( undefined, bodyObject, tail );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine({ args : _.argumentsArray.make([ 1, 2 ]) });
//   test.true( _.arrayIs( got ) );
//   test.identical( got, [ 2, 2 ] );
//
//
//   // test.case = 'head - undefined, body expects unroll';
//   // var routine = _.routine.unite( undefined, bodyUnroll, tail );
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 2, 2 ] );
//
//   test.case = 'head - null, body expects map';
//   var routine = _.routine.unite( null, bodyObject, tail );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine({ args : _.argumentsArray.make([ 1, 2 ]) });
//   test.true( _.arrayIs( got ) );
//   test.identical( got, [ 2, 2 ] );
//
//
//   // test.case = 'head - null, body expects unroll';
//   // var routine = _.routine.unite( null, bodyUnroll, tail );
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 2, 2 ] );
//
//   /* */
//
//
//   // test.case = 'head - null';
//   // var routine = _.routine.unite({ head : null, body : bodyUnroll, tail });
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 2, 2 ] );
//
//
//   // test.case = 'head - undefined';
//   // var routine = _.routine.unite({ head : undefined, body : bodyUnroll, tail });
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var got = routine( _.unroll.make([ 1, 2 ]) );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 2, 2 ] );
//
//   /* */
//
//   var tailUseOptions = ( result, o ) =>
//   {
//     result[ 0 ] += 1;
//     _.arrayAppend( result, o );
//     return result;
//   }
//
//   test.case = 'head - null, tail use options map';
//   var routine = _.routine.unite( null, bodyObject, tailUseOptions );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var o = { args : _.argumentsArray.make([ 1, 2 ]) };
//   var got = routine( o );
//   test.true( _.arrayIs( got ) );
//   test.identical( got, [ 2, 2, o ] );
//
//
//   // test.case = 'head - null, tail use options map';
//   // var routine = _.routine.unite({ head : null, body : bodyUnroll, tail : tailUseOptions });
//   // test.true( _.routine.is( routine ) );
//   // test.identical( routine.name, 'bodyUnroll' );
//   // test.identical( routine.defaults, { args : null } );
//   // var o = _.unroll.make([ 1, 2 ]);
//   // var got = routine( o );
//   // test.true( _.arrayIs( got ) );
//   // test.identical( got, [ 2, 2, o ] );
//
//   test.close( 'body and tail' );
//
//   /* - */
//
//   test.open( 'head, body and tail' );
//
//   test.case = 'head, body and tail, with map';
//   var routine = _.routine.unite( headObject, bodyObject, tail );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 2, 2 ] );
//
//   test.case = 'head, body and tail, with unroll';
//   var routine = _.routine.unite( headUnroll, bodyUnroll, tail );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyUnroll' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 2, 2 ] );
//
//   /* */
//
//   test.case = 'head, body and tail, with map';
//   var routine = _.routine.unite({ head : headObject, body : bodyObject, tail });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 2, 2 ] );
//
//   test.case = 'head, body and tail, with unroll';
//   var routine = _.routine.unite({ head : headUnroll, body : bodyUnroll, tail });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyUnroll' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 2, 2 ] );
//
//   /* */
//
//   var tailUseOptions = ( result, o ) =>
//   {
//     result[ 0 ] += 1;
//     _.arrayAppend( result, o );
//     return result;
//   }
//
//   test.case = 'head - null, tail use options map';
//   var routine = _.routine.unite( headObject, bodyObject, tailUseOptions );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.true( _.arrayIs( got ) );
//   test.identical( got, [ 2, 2, { args : _.argumentsArray.make([ 1, 2 ]) } ] );
//
//   test.case = 'head - null, tail use options map';
//   var routine = _.routine.unite({ head : headUnroll, body : bodyUnroll, tail : tailUseOptions });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyUnroll' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.true( _.arrayIs( got ) );
//   test.identical( got, [ 2, 2, _.unroll.make([ 1, 2 ]) ] );
//
//   test.close( 'head, body and tail' );
//
//   /* - */
//
//   test.open( 'names' );
//
//   test.case = 'name defined by field, head and body';
//   var routine = _.routine.unite({ head : headObject, body : bodyObject, name : 'someName' });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'someName' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   test.case = 'name defined by field, head, body and tail, with map';
//   var routine = _.routine.unite({ head : headObject, body : bodyObject, tail, name : 'someName' });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'someName' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 2, 2 ] );
//
//   /* */
//
//   test.case = 'routine body name has postfix `_body`';
//   function someRoutine_body( o )
//   {
//     return _.array.make( o.args );
//   }
//   someRoutine_body.defaults = { args : null };
//
//   var routine = _.routine.unite( headObject, someRoutine_body );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'someRoutine' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   test.close( 'names' );
//
//   /* - */
//
//   test.open( 'composed head' );
//
//   function headComposeObject( routine, args )
//   {
//     let o = Object.create( null );
//     o.args = args[ 0 ].args;
//     return o;
//   }
//
//   test.case = 'compose head and body, with map';
//   var routine = _.routine.unite( [ headObject, headComposeObject ], bodyObject );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   test.case = 'compose head, body and tail, with map';
//   var routine = _.routine.unite( [ headObject, headComposeObject ], bodyObject, tail );
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 2, 2 ] );
//
//   /* */
//
//   test.case = 'compose head and body, with map';
//   var routine = _.routine.unite({ head : [ headObject, headComposeObject ], body : bodyObject });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 1, 2 ] );
//
//   test.case = 'compose head, body and tail, with map';
//   var routine = _.routine.unite({ head : [ headObject, headComposeObject ], body : bodyObject, tail });
//   test.true( _.routine.is( routine ) );
//   test.identical( routine.name, 'bodyObject' );
//   test.identical( routine.defaults, { args : null } );
//   var got = routine( 1, 2 );
//   test.identical( got, [ 2, 2 ] );
//
//   test.close( 'composed head' );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.routine.unite() );
//
//   test.case = 'not enough arguments';
//   test.shouldThrowErrorSync( () => _.routine.unite( headObject ) );
//
//   test.case = 'wrong type of body routine';
//   test.shouldThrowErrorSync( () => _.routine.unite( headObject, null ) );
//
//   test.case = 'wrong type of head';
//   test.shouldThrowErrorSync( () => _.routine.unite( 'a', bodyObject ) );
//
//   test.case = 'wrong type of body';
//   test.shouldThrowErrorSync( () => _.routine.unite( headObject, 1 ) );
//
//   test.case = 'wrong type of tail routine';
//   test.shouldThrowErrorSync( () => _.routine.unite( headObject, bodyObject, 'tail' ) );
//
//   test.case = 'body routine without defaults';
//   function bodyWithoutDefaults( o )
//   {
//     return o.args;
//   }
//   test.shouldThrowErrorSync( () => _.routine.unite( headObject, bodyWithoutDefaults ) );
//
//   test.case = 'body routine has no name';
//   test.shouldThrowErrorSync( () => _.routine.unite( headObject, ( o ) => o.args ) );
// }
//
// //
//
// function uniteInstancing( test )
// {
//
//   act({ method : 'uniteCloning' });
//   act({ method : 'uniteInheriting' });
//   act({ method : 'uniteReplacing' });
//   act({ method : 'unite' });
//
//   /* */
//
//   function act( env )
//   {
//
//     test.case = `${__.entity.exportStringSolo( env )}`;
//
//     function r1_head( routine, args )
//     {
//       let o = args.length ? args[ 0 ] : null;
//       return _.routine.options_( routine, o );
//     }
//
//     function r1_body( o )
//     {
//       return o.a + o.b + 1;
//     }
//
//     var extra1 = r1_body.extra =
//     {
//     }
//
//     var defaults1 = r1_body.defaults =
//     {
//       a : 1,
//       b : 3,
//     }
//
//     var r1 = _.routine[ env.method ]( r1_head, r1_body );
//
//     test.identical( env.method === 'uniteReplacing' || env.method === 'unite', r1_body === r1.body );
//
//     test.true( r1.defaults === r1.body.defaults );
//     test.identical( env.method === 'uniteReplacing' || env.method === 'unite', r1.defaults === r1_body.defaults );
//     test.true( r1_body.defaults === defaults1 );
//     test.identical( env.method === 'uniteCloning', !_.prototype.has( r1.defaults, defaults1 ) );
//
//     test.true( r1.extra === r1.body.extra );
//     test.identical( env.method === 'uniteReplacing' || env.method === 'unite', r1.extra === r1_body.extra );
//     test.true( r1_body.extra === extra1 );
//     test.identical( env.method === 'uniteCloning', !_.prototype.has( r1.extra, extra1 ) );
//
//     test.identical( r1(), 5 );
//
//   }
//
// }
//
// //
//
// function uniteWithNumberInsteadOfHead( test )
// {
//
//   act({ method : 'uniteCloning' });
//   act({ method : 'uniteInheriting' });
//   act({ method : 'uniteReplacing' });
//   act({ method : 'unite' });
//
//   /* */
//
//   function act( env )
//   {
//
//     /* */
//
//     test.case = `${__.entity.exportStringSolo( env )}, 1 arg`;
//
//     function r1_body( arg, o )
//     {
//       test.identical( arguments.length, 2 );
//       return arg + o.a + o.b;
//     }
//
//     var defaults1 = r1_body.defaults =
//     {
//       a : 1,
//       b : 3,
//     }
//
//     var r1 = _.routine[ env.method ]( 1, r1_body );
//     test.identical( r1( 10 ), 14 );
//
//     /* */
//
//     test.case = `${__.entity.exportStringSolo( env )}, 2 args`;
//
//     function r2_body( arg1, arg2, o )
//     {
//       test.identical( arguments.length, 3 );
//       debugger;
//       return arg1 + arg2 + o.a + o.b;
//     }
//
//     var defaults1 = r2_body.defaults =
//     {
//       a : 1,
//       b : 3,
//     }
//
//     var r2 = _.routine[ env.method ]( 2, r2_body );
//     test.identical( r2( 10, 20 ), 34 );
//
//     /* */
//
//   }
//
// }

//

function er( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }
    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null };

  /* - */

  test.open( 'check work of erhead' );

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null } );

  var got = gotRoutine();
  test.identical( got, { arg : null } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  test.close( 'check work of erhead' );

  /* - */

  test.case = 'routine - with field erhead, erhead - routine, routine should rewrite field';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  var erhead2 = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg2' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine, erhead2 );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg2' } );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, head return not a Map, not an Unroll';
  var head = () => 'head';
  var routine = _.routine.unite( head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, undefined );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, body expects Unroll';
  var head = ( r, a ) => { return _.unroll.make( a ) };
  var body = ( o ) => o;
  body.defaults = { arg : null };
  var routine = _.routine.unite( head, body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine({ arg2 : 'arg2' });
  test.identical( got, { arg2 : 'arg2' } );

  test.case = 'erhead returns map with undefined';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : undefined } };
  var got = _.routine.er( routine, erhead );
  var gotRoutine = got.er();
  test.identical( gotRoutine.defaults, { arg : undefined } );
  var got = gotRoutine();
  test.identical( got, { arg : undefined } );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.routine.er() );

  test.case = 'extra arguments';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.er( routine, ( r, a ) => a[ 0 ], 'extra' ) );

  test.case = 'wrong type of routine';
  test.shouldThrowErrorSync( () => _.routine.er( 'wrong', ( r, a ) => a[ 0 ] ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.er( routine, 'wrong' ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  routine.erhead = 'wrong';
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine without defaults, head and body';
  var routine = () => 'routine';
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine, has fields, head has wrong type';
  var routine = () => 'routine';
  routine.head = 'wrong';
  routine.body = () => 'body';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine, has fields, body has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'call with simple routine, has fields, defaults has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = null;
  test.shouldThrowErrorSync( () => _.routine.er( routine ) );

  test.case = 'functor should fail because erhead returns no map';
  var routine = _.routine.unite( test_head, test_body );
  var got = _.routine.er( routine, ( r, a ) => a );
  test.shouldThrowErrorSync( () => got.er() );

}

//

function erShouldSupplementNotDefinedFields( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }

    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null, arg2 : 'arg2' };

  /* - */

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null, arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : null, arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var got = _.routine.er( routine );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var got = _.routine.er( routine, erhead );
  test.true( _.routine.is( got ) );
  test.true( got === routine );
  test.true( _.routine.is( got.er ) );
  test.identical( got.er.defaults, undefined );

  var gotRoutine = got.er( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );
}

//

function erMake( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }

    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null };

  /* - */

  test.open( 'check work of erhead' );

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null } );

  var got = gotRoutine();
  test.identical( got, { arg : null } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1' } );

  test.close( 'check work of erhead' );

  /* - */

  test.case = 'routine - with field erhead, erhead - routine, routine should rewrite field';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  var erhead2 = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg2' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine, erhead2 );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg2' } );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, head return not a Map, not an Unroll';
  var head = () => 'head';
  var routine = _.routine.unite( head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine();
  test.identical( got, undefined );

  /* */

  test.case = 'routine - without field erhead, erhead - routine, body expects Unroll';
  var head = ( r, a ) => { return _.unroll.make( a ) };
  var body = ( o ) => o;
  body.defaults = { arg : null };
  var routine = _.routine.unite( head, body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg' } );

  var got = gotRoutine({ arg2 : 'arg2' });
  test.identical( got, { arg2 : 'arg2' } );

  /* */

  test.case = 'erhead returns map with undefined';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : undefined } };
  var got = _.routine.er( routine, erhead );
  var gotRoutine = got.er();
  test.identical( gotRoutine.defaults, { arg : undefined } );
  var got = gotRoutine();
  test.identical( got, { arg : undefined } );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.routine.erMake() );

  test.case = 'extra arguments';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.erMake( routine, ( r, a ) => a[ 0 ], 'extra' ) );

  test.case = 'wrong type of routine';
  test.shouldThrowErrorSync( () => _.routine.erMake( 'wrong', ( r, a ) => a[ 0 ] ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  test.shouldThrowErrorSync( () => _.routine.erMake( routine, 'wrong' ) );

  test.case = 'wrong type of erhead';
  var routine = _.routine.unite( test_head, test_body );
  routine.erhead = 'wrong';
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine without defaults, head and body';
  var routine = () => 'routine';
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine, has fields, head has wrong type';
  var routine = () => 'routine';
  routine.head = 'wrong';
  routine.body = () => 'body';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine, has fields, body has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = {};
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'call with simple routine, has fields, defaults has wrong type';
  var routine = () => 'routine';
  routine.head = () => 'head';
  routine.body = 'wrong';
  routine.erhead = () => {};
  routine.defaults = null;
  test.shouldThrowErrorSync( () => _.routine.erMake( routine ) );

  test.case = 'functor should fail because erhead returns no map';
  var routine = _.routine.unite( test_head, test_body );
  var gotFunctor = _.routine.erMake( routine, ( r, a ) => a );
  test.shouldThrowErrorSync( () => gotFunctor() );

}

//

function erMakeShouldSupplementNotDefinedFields( test )
{
  function test_head( routine, args )
  {
    let o = args[ 0 ];
    if( !_.mapIs( o ) )
    {
      if( o !== undefined )
      o = { arg : o };
      else
      o = Object.create( null );
    }

    _.routine.options( routine, o );
    return o;
  }

  function test_body( o )
  {
    return o;
  }
  test_body.defaults = { arg : null, arg2 : 'arg2' };

  /* - */

  test.case = 'routine - no field erhead, erhead - undefined, call without argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : null, arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : null, arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - erhead, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - with field erhead, erhead - undefined, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };
  routine.erhead = erhead;

  var gotFunctor = _.routine.erMake( routine );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call without argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor();
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg', arg2 : 'arg2' } );

  /* */

  test.case = 'routine - no field erhead, erhead - routine, call with argument';
  var routine = _.routine.unite( test_head, test_body );
  var erhead = ( r, a ) => { return { arg : a[ 0 ] !== undefined ? a[ 0 ] : 'arg' } };

  var gotFunctor = _.routine.erMake( routine, erhead );
  test.true( _.routine.is( gotFunctor ) );
  test.identical( gotFunctor.defaults, undefined );

  var gotRoutine = gotFunctor( 'arg1' );
  test.true( _.routine.is( gotRoutine ) );
  test.identical( gotRoutine.name, 'er' );
  test.identical( gotRoutine.defaults, { arg : 'arg1', arg2 : 'arg2' } );

  var got = gotRoutine();
  test.identical( got, { arg : 'arg1', arg2 : 'arg2' } );
}

// //
//
// function vectorizeVectorizeArray( test )
// {
//   function routine()
//   {
//     if( arguments.length === 0 )
//     return null;
//     return _.longSlice( arguments );
//   };
//   var srcRoutine = routine;
//
//   /* */
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : 1
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'without arguments';
//   var got = routine();
//   test.identical( got, null );
//
//   test.case = 'single argument';
//   var src = 1;
//   var got = routine( src );
//   test.identical( got, [ 1 ] );
//   test.true( got !== src );
//
//   test.case = 'multiply arguments';
//   var src = 1;
//   var got = routine( src, 0 );
//   test.identical( got, [ 1, 0 ] );
//   test.true( got !== src );
//
//   /* - */
//
//   test.open( 'array' );
//
//   test.case = 'single argument';
//
//   var src = [ 1 ];
//   var got = routine( src );
//   test.identical( got, [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2, 3 ];
//   var got = routine( src );
//   test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = [ 1, 2, 3 ];
//   var got = routine( src, 2 );
//   test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
//   test.true( got !== src );
//
//   var src = 2;
//   var got = routine( src, [ 1, 2, 3 ] );
//   test.identical( got, [ 2, [ 1, 2, 3 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2 ];
//   var got = routine( src, [ 3, 4 ] )
//   test.identical( got, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
//   test.true( got !== src );
//
//   test.close( 'array' );
//
//   /* - */
//
//   test.open( 'Set' );
//
//   test.case = 'single argument';
//
//   var src = new Set( [ 1 ] );
//   var got = routine( src );
//   test.identical( [ ... got ], [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = new Set( [ 1, 2, 3 ] );
//   var got = routine( src );
//   test.identical( [ ... got ], [ [ 1 ], [ 2 ], [ 3 ] ] );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = new Set( [ 1, 2, 3 ] );
//   var got = routine( src, 2 );
//   test.identical( [ ... got ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
//   test.true( got !== src );
//
//   var src = new Set( [ 2 ] );
//   var got = routine( src, [ 1, 2, 3 ] );
//   test.identical( [ ... got ], [ [ 2, [ 1, 2, 3 ] ] ] );
//   test.true( got !== src );
//
//   var src = new Set( [ 1, 2 ] );
//   var got = routine( new Set( [ 1, 2 ] ), [ 3, 4 ] )
//   test.identical( [ ... got ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
//   test.true( got !== src );
//
//   test.close( 'Set' );
//
//   /* - */
//
//   var src = _.containerAdapter.make( [ 1, 2 ] );
//   var got = routine( src, [ 3, 4 ] )
//   test.identical( [ ... got[ 0 ].original ], [ 1, 2 ] );
//   test.identical( [ got[ 1 ] ], [ [ 3, 4 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
//   var got = routine( src, 2 );
//   test.identical( [ ... got[ 0 ].original ], [ 1, 2, 3 ] );
//   test.identical( [ got[ 1 ] ], [ 2 ] );
//   test.true( got !== src );
//
//   /* - */
//
//   test.open( 'containerAdapter, no unwraping' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : 1,
//     vectorizingContainerAdapter : 1,
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'single argument';
//   var src = _.containerAdapter.make( [ 1 ] );
//   var got = routine( src );
//   test.identical( got.original, [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( [ 1, 2, 3 ] );
//   var got = routine( src );
//   test.identical( got.original, [ [ 1 ], [ 2 ], [ 3 ] ] );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = _.containerAdapter.make( [ 1, 2, 3 ] );
//   var got = routine( src, 2 );
//   test.identical( got.original, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( [ 2 ] );
//   var got = routine( src, [ 1, 2, 3 ] );
//   test.identical( got.original, [ [ 2, [ 1, 2, 3 ] ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( [ 1, 2 ] );
//   var got = routine( src, [ 3, 4 ] )
//   test.identical( got.original, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
//   test.true( got !== src );
//
//   /* */
//
//   var src = _.containerAdapter.make( new Set( [ 1 ] ) );
//   var got = routine( src );
//   test.identical( [ ... got.original ], [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
//   var got = routine( src );
//   test.identical( [ ... got.original ], [ [ 1 ], [ 2 ], [ 3 ] ] );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
//   var got = routine( src, 2 );
//   test.identical( [ ... got.original ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( [ 2 ] );
//   var got = routine( src, [ 1, 2, 3 ] );
//   test.identical( [ ... got.original ], [ [ 2, [ 1, 2, 3 ] ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
//   var got = routine( src, [ 3, 4 ] )
//   test.identical( [ ... got.original ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
//   test.true( got !== src );
//
//   test.close( 'containerAdapter, no unwraping' );
//
//   /* - */
//
//   test.open( 'containerAdapter, no unwraping' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : 1,
//     vectorizingContainerAdapter : 1,
//     unwrapingContainerAdapter : 1,
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'single argument';
//
//   var src = _.containerAdapter.make( [ 1 ] );
//   var got = routine( src );
//   test.identical( got, [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( [ 1, 2, 3 ] );
//   var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ) );
//   test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = _.containerAdapter.make( [ 1, 2, 3 ] );
//   var got = routine( _.containerAdapter.make( [ 1, 2, 3 ] ), 2 );
//   test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( [ 2 ] );
//   var got = routine( _.containerAdapter.make( [ 2 ] ), [ 1, 2, 3 ] );
//   test.identical( got, [ [ 2, [ 1, 2, 3 ] ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( [ 1, 2 ] );
//   var got = routine( _.containerAdapter.make( [ 1, 2 ] ), [ 3, 4 ] )
//   test.identical( got, [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
//   test.true( got !== src );
//
//   /* */
//
//   var src = _.containerAdapter.make( new Set( [ 1 ] ) );
//   var got = routine( src );
//   test.identical( [ ... got ], [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
//   var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ) );
//   test.identical( [ ... got ], [ [ 1 ], [ 2 ], [ 3 ] ] );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) );
//   var got = routine( _.containerAdapter.make( new Set( [ 1, 2, 3 ] ) ), 2 );
//   test.identical( [ ... got ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( new Set( [ 2 ] ) );
//   var got = routine( _.containerAdapter.make( new Set( [ 2 ] ) ), [ 1, 2, 3 ] );
//   test.identical( [ ... got ], [ [ 2, [ 1, 2, 3 ] ] ] );
//   test.true( got !== src );
//
//   var src = _.containerAdapter.make( new Set( [ 1, 2 ] ) );
//   var got = routine( _.containerAdapter.make( new Set( [ 1, 2 ] ) ), [ 3, 4 ] )
//   test.identical( [ ... got ], [ [ 1, [ 3, 4 ] ], [ 2, [ 3, 4 ] ] ] );
//   test.true( got !== src );
//
//   test.close( 'containerAdapter, no unwraping' );
//
//   /* - */
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : 1,
//     bypassingEmpty : 1
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'without arguments';
//   var got = routine();
//   test.identical( got, [] );
// }
//
// //
//
// function vectorizeOriginalRoutine( test )
// {
//   function routine()
//   {
//     return _.longSlice( arguments );
//   }
//   var srcRoutine = routine;
//
//   /* */
//
//   var o =
//   {
//     vectorizingArray : 0,
//     vectorizingMapVals : 0,
//     select : 1
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//   test.identical( routine, srcRoutine );
//
//   test.case = 'empty';
//   var got = routine();
//   test.identical( got, [] );
//
//   test.case = 'arguments';
//   var got = routine( [ 1, 2 ], [ 3, 4 ] );
//   test.identical( got, [ [ 1, 2 ], [ 3, 4 ] ] );
// }
//
// //
//
// function vectorizeVectorizeMapOrArray( test )
// {
//   function routine()
//   {
//     if( arguments.length === 0 )
//     return null;
//     return _.longSlice( arguments );
//   }
//   var srcRoutine = routine;
//
//   /* - */
//
//   test.open( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 1' );
//
//   var o =
//   {
//     vectorizingArray : 0,
//     vectorizingMapVals : 1,
//     select : 1
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   /* */
//
//   test.case = 'without arguments';
//   var got = routine();
//   test.identical( got, null );
//
//   test.case = 'single argument';
//
//   var src = 1;
//   var got = routine( src );
//   test.identical( got, [ 1 ] );
//   test.true( got !== src );
//
//   var src = [ 1 ];
//   var got = routine( src );
//   test.identical( got, [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2, 3 ];
//   var got = routine( src );
//   test.identical( got, [ [ 1, 2, 3 ] ] );
//   test.true( got !== src );
//
//   var src = { 1 : 1, 2 : 2, 3 : 3 };
//   var got = routine( src );
//   test.identical( got, { 1 : [ 1 ], 2 : [ 2 ], 3 : [ 3 ] } );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = 1;
//   var got = routine( src, 0 );
//   test.identical( got, [ 1, 0 ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2, 3 ];
//   var got = routine( src, 2 );
//   test.identical( got, [ [ 1, 2, 3 ], 2 ] );
//   test.true( got !== src );
//
//   var src = 2;
//   var got = routine( src, [ 1, 2, 3 ] );
//   test.identical( got, [ 2, [ 1, 2, 3 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2 ];
//   var got = routine( src, [ 1, 2 ] );
//   test.identical( got, [ [ 1, 2 ], [ 1, 2 ] ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, 0 );
//   test.identical( got, { a : [ 1, 0 ] } );
//   test.true( got !== src );
//
//   var src = 0;
//   var got = routine( src, { a : 1 } );
//   test.identical( routine( 0, { a : 1 } ), [ 0, { a : 1 } ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, { b : 2 } );
//   test.identical( got, { a : [ 1, { b : 2 } ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, 2, 3 );
//   test.identical( got, { a : [ 1, 2, 3 ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, { b : 2 }, { c : 3 } );
//   test.identical( got, { a : [ 1, { b : 2 }, { c : 3 } ] } );
//   test.true( got !== src );
//
//   /* */
//
//   test.case = 'not an array, not a map';
//   var src = _.containerAdapter.make( [ 1 ] );
//   var got = routine( src );
//   test.identical( got[ 0 ].original, [ 1 ] );
//   test.identical( got.length, 1 );
//   test.true( got !== src );
//
//   test.close( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 1' );
//
//   /* - */
//
//   test.open( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 2' );
//
//   var o =
//   {
//     vectorizingArray : 0,
//     vectorizingMapVals : 1,
//     select : 2
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'multiple argument';
//
//   var src = 1;
//   var got = routine( src, 0 );
//   test.identical( got, [ 1, 0 ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2, 3 ];
//   var got = routine( src, 2 );
//   test.identical( got, [ [ 1, 2, 3 ], 2 ] );
//   test.true( got !== src );
//
//   var src = 2;
//   var got = routine( src, [ 1, 2, 3 ] );
//   test.identical( got, [ 2, [ 1, 2, 3 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2 ];
//   var got = routine( src, [ 1, 2 ] );
//   test.identical( got, [ [ 1, 2 ], [ 1, 2 ] ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, 0 );
//   test.identical( got, { a : [ 1, 0 ] } );
//   test.true( got !== src );
//
//   var src = 0;
//   var got = routine( src, { a : 1 } );
//   test.identical( routine( 0, { a : 1 } ), { a : [ 0, 1 ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, { a : 2 } );
//   test.identical( got, { a : [ 1, 2 ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, 2 );
//   test.identical( got, { a : [ 1, 2 ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, { a : [ 2 ] } );
//   test.identical( got, { a : [ 1, [ 2 ] ] } );
//   test.true( got !== src );
//
//   /* */
//
//   test.case = 'not an array, not a map';
//   var src = _.containerAdapter.make( [ 1 ] );
//   var got = routine( src, 1 );
//   test.identical( got[ 0 ].original, [ 1 ] );
//   test.identical( got.length, 2 );
//   test.true( got !== src );
//
//   /* */
//
//   if( Config.debug )
//   {
//     test.case = 'without arguments';
//     test.shouldThrowErrorSync( () => routine() );
//
//     test.case = 'one argument';
//     test.shouldThrowErrorSync( () => routine( 1 ) );
//     test.shouldThrowErrorSync( () => routine( [ 1, 2, 3 ] ) );
//     test.shouldThrowErrorSync( () => routine( { a : 1, b : 2 } ) );
//
//     test.case = 'extra arguments';
//     test.shouldThrowErrorSync( () => routine( [ 1 ], 2, 3 ) );
//
//     test.case = 'different keys';
//     test.shouldThrowErrorSync( () => routine( { a : 1 }, { b : 2 } ) );
//   }
//
//   test.close( 'vectorizingArray : 0, vectorizingMapVals : 1, select : 2' );
//
//   /* - */
//
//   test.open( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     select : 1
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'single argument';
//
//   var src = 1;
//   var got = routine( src );
//   test.identical( got, [ 1 ] );
//   test.true( got !== src );
//
//   var src = [ 1 ];
//   var got = routine( src );
//   test.identical( got, [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2, 3 ];
//   var got = routine( src );
//   test.identical( got, [ [ 1 ], [ 2 ], [ 3 ] ] );
//   test.true( got !== src );
//
//   var src = { 1 : 1, 2 : 2, 3 : 3 };
//   var got = routine( src );
//   test.identical( got, { 1 : [ 1 ], 2 : [ 2 ], 3 : [ 3 ] } );
//   test.true( got !== src );
//
//   test.case = 'multiple argument';
//
//   var src = 1;
//   var got = routine( src, 0 );
//   test.identical( got, [ 1, 0 ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2, 3 ];
//   var got = routine( src, 2 );
//   test.identical( got, [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ] );
//   test.true( got !== src );
//
//   var src = 2;
//   var got = routine( src, [ 1, 2, 3 ] );
//   test.identical( got, [ 2, [ 1, 2, 3 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2 ];
//   var got = routine( src, [ 1, 2 ] );
//   test.identical( got, [ [ 1, [ 1, 2 ] ], [ 2, [ 1, 2 ] ] ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, 0 );
//   test.identical( got, { a : [ 1, 0 ] } );
//   test.true( got !== src );
//
//   var src = 0;
//   var got = routine( src, { a : 1 } );
//   test.identical( got, [ 0, { a : 1 } ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, { b : 2 } );
//   test.identical( got, { a : [ 1, { b : 2 } ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, 2, 3 );
//   test.identical( got, { a : [ 1, 2, 3 ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, { b : 2 }, { c : 3 } );
//   test.identical( got, { a : [ 1, { b : 2 }, { c : 3 } ] } );
//   test.true( got !== src );
//
//   var src = [ 1 ];
//   var got = routine( src, { a : 2 } );
//   test.identical( got, [ [ 1, { a : 2 } ] ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, [ 2 ] );
//   test.identical( got, { a : [ 1, [ 2 ] ] } );
//   test.true( got !== src );
//
//   var src = [ 1 ];
//   var got = routine( src, { a : 2 }, 3 );
//   test.identical( got, [ [ 1, { a : 2 }, 3 ] ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, [ 2 ], 3 );
//   test.identical( got, { a : [ 1, [ 2 ], 3 ] } );
//   test.true( got !== src );
//
//   test.close( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );
//
//   /* */
//
//   test.open( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     select : 2
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   var src = [ 1, 2 ];
//   var got = routine( src, 3 );
//   test.identical( got, [ [ 1, 3 ], [ 2, 3 ] ] );
//   test.true( got !== src );
//
//   var src = 1;
//   var got = routine( src, [ 1, 2 ] );
//   test.identical( got, [ [ 1, 1 ], [ 1, 2 ] ] );
//   test.true( got !== src );
//
//   var src = [ 1, 2 ];
//   var got = routine( src, [ 1, 2 ] );
//   test.identical( got, [ [ 1, 1 ], [ 2, 2 ] ] );
//   test.true( got !== src );
//
//   var src = 1;
//   var got = routine( src, 2 );
//   test.identical( got, [ 1, 2 ] );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, 1 );
//   test.identical( got, { a : [ 1, 1 ] } );
//   test.true( got !== src );
//
//   var src = 1;
//   var got = routine( src, { a : 1 } );
//   test.identical( got, { a : [ 1, 1 ] } );
//   test.true( got !== src );
//
//   var src = { a : 1 };
//   var got = routine( src, { a : 2 } );
//   test.identical( got, { a : [ 1, 2 ] } );
//   test.true( got !== src );
//
//   var src = { a : 1, b : 1 };
//   var got = routine( src, { b : 2, a : 2 } );
//   test.identical( got, { a : [ 1, 2 ], b : [ 1, 2 ] } );
//   test.true( got !== src );
//
//   test.close( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );
//
//   var o =
//   {
//     vectorizingArray : 0,
//     vectorizingMapVals : 1,
//     select : 1,
//     bypassingEmpty : 1,
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   /* */
//
//   test.case = 'without arguments';
//   var got = routine();
//   test.identical( got, [] );
// }
//
// //
//
// function vectorizeVectorizeForOptionsMap( test )
// {
//   function routine()
//   {
//     return _.longSlice( arguments );
//   }
//   var srcRoutine = routine;
//
//   /* - */
//
//   test.open( 'without head' );
//
//   test.open( 'array' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : 'b'
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'not map, not set, not array';
//   var src = '1';
//   var got = routine( src );
//   test.identical( got, [ '1' ] );
//   test.true( got !== src );
//
//   test.case = 'single argument';
//
//   var src = [ 1 ];
//   var got = routine( src );
//   test.identical( got, [ [ 1 ] ] );
//   test.true( got !== src );
//
//   var src = { a : 0 };
//   var got = routine( src );
//   test.identical( got, [ { a : 0 } ] );
//   test.true( got !== src );
//
//   var src = { a : 0, b : 1 };
//   var got = routine( src );
//   test.identical( got, [ { a : 0, b : 1 } ] );
//   test.true( got !== src );
//
//   var src = { a : 0, b : [ 1 ] };
//   var got = routine( src );
//   test.identical( got, [ [ { a : 0, b : 1 } ] ] );
//   test.true( got !== src );
//
//   var src = { a : 0, b : [ 1, 2 ] };
//   var got = routine( src );
//   test.identical( got, [ [ { a : 0, b : 1 } ], [ { a : 0, b : 2 } ] ] );
//   test.true( got !== src );
//
//   /* */
//
//   if( Config.debug )
//   {
//     test.case = 'without arguments';
//     test.shouldThrowErrorSync( () => routine() );
//
//     test.case = 'extra arguments';
//     test.shouldThrowErrorSync( () => routine( { a : 0, b : [ 1 ] }, 2 ) );
//   }
//
//   test.close( 'array' );
//
//   /* - */
//
//   test.open( 'Set' );
//
//   test.case = 'single argument';
//
//   var src = new Set( [ 1 ] );
//   var got = routine( src );
//   test.identical( [ ... got[ 0 ] ], [ 1 ] );
//   test.identical( got.length, 1 );
//   test.true( got !== src );
//
//   var src = { b : new Set( [ 0 ] ) };
//   var got = routine( src );
//   test.identical( [ ... got ], [ [ { b : 0 } ] ] );
//   test.true( got !== src );
//
//   var src = { b : new Set( [ 0 ] ), a : 1 };
//   var got = routine( src );
//   test.identical( [ ... got ], [ [ { b : 0, a : 1 } ] ] );
//   test.true( got !== src );
//
//   var src = { b : new Set( [ [ 0 ] ] ), a : 1 };
//   var got = routine( src );
//   test.identical( [ ... got ], [ [ { b : [ 0 ], a : 1 } ] ] );
//   test.true( got !== src );
//
//   var src = { b : new Set( [ 1, 2 ] ),  a : 0 };
//   var got = routine( src );
//   test.identical( [ ... got ], [ [ { a : 0, b : 1 } ], [ { a : 0, b : 2 } ] ] );
//   test.true( got !== src );
//
//   test.close( 'Set' );
//
//   test.close( 'without head' );
//
//   /* - */
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : 'b',
//     bypassingEmpty : 1
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'without arguments';
//   var got = routine();
//   test.identical( got, [] );
// }
//
// //
//
// function vectorizeVectorizeForOptionsMapForKeys( test )
// {
//   function routine()
//   {
//     if( arguments.length === 0 )
//     return null;
//     return _.longSlice( arguments );
//   }
//   var srcRoutine = routine;
//
//   /* */
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : [ 'a', 'b' ]
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.case = 'single argument';
//
//   var src = 'a';
//   var got = routine( src );
//   var expected = [ [ src ], [ src ] ];
//   test.identical( got, expected );
//
//   var src = [ 1 ]
//   var got = routine( src );
//   var expected = [ [ src ], [ src ] ];
//   test.identical( got, expected );
//
//   var src = { c : 1 }
//   var got = routine( src );
//   var expected = [ [ src ], [ src ] ];
//   test.identical( got, expected );
//
//   var got = routine({ a : 0, b : [ 1 ] });
//   var expected =
//   [
//     [
//       {
//         a : 0,
//         b : [ 1 ]
//       }
//     ],
//     [ [ { a : 0, b : 1 } ] ]
//   ]
//   test.identical( got, expected );
//
//   /**/
//
//   var got = routine({ a : 0, b : [ 1, 2 ] });
//   var expected =
//   [
//     [
//       {
//         a : 0,
//         b : [ 1, 2 ]
//       }
//     ],
//     [
//       [ { a : 0, b : 1 } ],
//       [ { a : 0, b : 2 } ]
//     ],
//
//   ]
//   test.identical( got, expected );
//
//   test.case = 'multiple argument';
//
//   if( Config.debug )
//   test.shouldThrowErrorSync( () => routine({ a : 0, b : [ 1 ] }, 2 ) );
// }
//
// //
//
// function vectorize( test )
// {
//   function srcRoutine( a, b )
//   {
//     return _.longSlice( arguments );
//   }
//
//   /* */
//
//   test.open( 'vectorizingArray : 1, select : 2' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     select : 2
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.identical( routine( [ 1, 2 ], 1 ), [ [ 1, 1 ], [ 2, 1 ] ] );
//   test.identical( routine( 1, [ 1, 2 ] ), [ [ 1, 1 ], [ 1, 2 ] ] );
//   test.identical( routine( [ 1, 2 ], [ 1, 2 ] ), [ [ 1, 1 ], [ 2, 2 ] ] );
//   test.identical( routine( 1, 2 ), [ 1, 2 ] );
//
//   test.identical( routine( { a : 1 }, 1 ), [ { a : 1 }, 1 ] );
//   test.identical( routine( 1, { a : 1 } ), [ 1, { a : 1 } ] );
//   test.identical( routine( { a : 1 }, { b : 2 } ), [ { a : 1 }, { b : 2 } ] );
//
//   test.identical( routine( [ 1 ], { a : 2 } ), [ [ 1, { a : 2 } ] ] );
//   test.identical( routine( [ 1, 2 ], { a : 3 } ), [ [ 1, { a : 3 } ], [ 2, { a : 3 } ] ] );
//   test.identical( routine( { a : 3 }, [ 1, 2 ] ), [ [ { a : 3 }, 1  ], [ { a : 3 }, 2 ] ] );
//
//   if( Config.debug )
//   {
//     test.shouldThrowErrorSync( () => routine( 1 ) );
//     test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );
//     test.shouldThrowErrorSync( () => routine( [ 1, 2 ], [ 1, 2, 3 ] ) );
//     test.shouldThrowErrorSync( () => routine( [ 1 ], [ 2 ], [ 3 ] ) );
//   }
//
//   test.close( 'vectorizingArray : 1, select : 2' );
//
//   /* */
//
//   test.open( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     select : 2
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.identical( routine( [ 1, 2 ], 3 ), [ [ 1, 3 ], [ 2, 3 ] ] );
//   test.identical( routine( 1, [ 1, 2 ] ), [ [ 1, 1 ], [ 1, 2 ] ] );
//   test.identical( routine( [ 1, 2 ], [ 1, 2 ] ), [ [ 1, 1 ], [ 2, 2 ] ] );
//   test.identical( routine( 1, 2 ), [ 1, 2 ] );
//
//   test.identical( routine( { a : 1 }, 1 ), { a : [ 1, 1 ] } );
//   test.identical( routine( 1, { a : 1 } ), { a : [ 1, 1 ] } );
//   test.identical( routine( { a : 1 }, { a : 2 } ), { a : [ 1, 2 ] } );
//   test.identical( routine( { a : 1, b : 1 }, { b : 2, a : 2 } ), { a : [ 1, 2 ], b : [ 1, 2 ] } );
//
//   if( Config.debug )
//   {
//     test.shouldThrowErrorSync( () => routine( [ 1, 2 ], [ 1, 2, 3 ] ) )
//     test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );
//     test.shouldThrowErrorSync( () => routine( { a : 1 }, { b : 1 } ) );
//     test.shouldThrowErrorSync( () => routine( [ 1 ], { b : 1 } ) );
//     test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ] ) );
//     test.shouldThrowErrorSync( () => routine( 1, [ 1 ], { b : 1 } ) );
//     test.shouldThrowErrorSync( () => routine( [ 1 ], 1, { b : 1 } ) );
//     test.shouldThrowErrorSync( () => routine( { b : 1 }, 1, [ 1 ] ) );
//     test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ], 1 ) );
//   }
//
//   test.close( 'vectorizingArray : 1, vectorizingMapVals : 1, select : 2' );
//
//   test.open( ' vectorizingMapKeys : 1' );
//
//   var o =
//   {
//     vectorizingArray : 0,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 1
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.identical( routine( 1  ), [ 1 ] );
//   test.identical( routine( [ 1 ] ), [ [ 1 ] ] );
//   test.identical( routine( { a : 1 } ), { a : 1 } );
//
//   if( Config.debug )
//   test.shouldThrowErrorSync( () => routine( 1, 2 ) )
//
//   test.close( ' vectorizingMapKeys : 1' );
//
//   test.open( 'vectorizingMapKeys : 1, select : 2' );
//
//   var o =
//   {
//     vectorizingArray : 0,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 2
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.identical( routine(  1, 1  ), [ 1, 1 ] );
//   test.identical( routine( [ 1 ], 1 ), [ [ 1 ], 1 ] );
//   test.identical( routine( { a : 1 }, 'b' ), { 'a,b' : 1 } );
//   test.identical( routine( 'a', { b : 1, c : 2 } ), { 'a,b' : 1, 'a,c' : 2 } );
//   test.identical( routine( [ 'a' ], { b : 1, c : 2 } ), { 'a,b' : 1, 'a,c' : 2 } );
//   test.identical( routine( { b : 1, c : 2 }, [ 'a' ] ), { 'b,a' : 1, 'c,a' : 2 } );
//
//   if( Config.debug )
//   test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );
//
//   test.close( 'vectorizingMapKeys : 1, select : 2' );
//
//   test.open( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 2' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 2
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.identical( routine( [ 1, 2 ], 3 ), [ [ 1, 3 ], [ 2, 3 ] ] );
//   test.identical( routine( 1, [ 1, 2 ] ), [ [ 1, 1 ], [ 1, 2 ] ] );
//   test.identical( routine( [ 1, 2 ], [ 1, 2 ] ), [ [ 1, 1 ], [ 2, 2 ] ] );
//   test.identical( routine( 1, 2 ), [ 1, 2 ] );
//
//   test.identical( routine( { a : 1 }, 'b' ), { 'a,b' : 1 } );
//   test.identical( routine( 'a', { b : 1, c : 2 } ), { 'a,b' : 1, 'a,c' : 2 } );
//
//   test.identical( routine( { a : 1 }, 1 ), { 'a,1' : 1 } );
//   test.identical( routine( 1, { b : 1, c : 2 } ), { '1,b' : 1, '1,c' : 2 } );
//
//   test.identical( routine( [ 1 ], { b : true } ), { '1,b' : true } );
//   test.identical( routine( [ 1, 2 ], { b : true } ), { '1,b' : true, '2,b' : true } );
//
//   if( Config.debug )
//   {
//     test.shouldThrowErrorSync( () => routine( 1, 2, 3 ) );
//     test.shouldThrowErrorSync( () => routine( { a : 1 }, { b : 1 } ) );
//     // test.shouldThrowErrorSync( () => routine( [ 1 ], { b : 1 } ) );
//     // test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ] ) );
//     // test.shouldThrowErrorSync( () => routine( 1, [ 1 ], { b : 1 } ) );
//     test.shouldThrowErrorSync( () => routine( [ 1 ], 1, { b : 1 } ) );
//     test.shouldThrowErrorSync( () => routine( { b : 1 }, 1, [ 1 ] ) );
//     test.shouldThrowErrorSync( () => routine( { b : 1 }, [ 1 ], 1 ) );
//   }
//
//   test.close( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 2' );
//
//   test.open( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 3' );
//
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 3
//   }
//   o.routine = srcRoutine;
//   var routine = _.vectorize( o );
//
//   test.identical( routine( [ 1 ], { b : true }, 'c' ), { '1,b,c' : true } );
//   test.identical( routine( [ 1 ], { b : true }, [ 'c' ] ), { '1,b,c' : true } );
//   test.identical( routine( [ 1 ], { b : true, c : false }, 'd' ), { '1,b,d' : true, '1,c,d' : false } );
//   test.identical( routine( [ 1, 2 ], { b : true }, 'c' ), { '1,b,c' : true, '2,b,c' : true } );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], { b : true, c : false }, [ 'd', 'e' ] );
//   var expected =
//   {
//     '1,b,d' : true,
//     '1,c,d' : false,
//     '2,b,e' : true,
//     '2,c,e' : false
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], [ 'd', 'e' ], { b : true, c : false } );
//   var expected =
//   {
//     '1,d,b' : true,
//     '1,d,c' : false,
//     '2,e,b' : true,
//     '2,e,c' : false
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( { b : true, c : false }, [ 1, 2 ], [ 'd', 'e' ]  );
//   var expected =
//   {
//     'b,1,d' : true,
//     'c,1,d' : false,
//     'b,2,e' : true,
//     'c,2,e' : false
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], { b : true, c : false, d : true }, [ 'e', 'f' ] );
//   var expected =
//   {
//     '1,b,e' : true,
//     '1,c,e' : false,
//     '1,d,e' : true,
//     '2,b,f' : true,
//     '2,c,f' : false,
//     '2,d,f' : true
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], [ 'e', 'f' ], { b : true, c : false, d : true } );
//   var expected =
//   {
//     '1,e,b' : true,
//     '1,e,c' : false,
//     '1,e,d' : true,
//     '2,f,b' : true,
//     '2,f,c' : false,
//     '2,f,d' : true
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( { b : true, c : false, d : true }, [ 1, 2 ], [ 'e', 'f' ] );
//   var expected =
//   {
//     'b,1,e' : true,
//     'c,1,e' : false,
//     'd,1,e' : true,
//     'b,2,f' : true,
//     'c,2,f' : false,
//     'd,2,f' : true
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( 1, { b : true, c : false, d : true }, 2 );
//   var expected =
//   {
//     '1,b,2' : true,
//     '1,c,2' : false,
//     '1,d,2' : true
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( { b : true, c : false, d : true }, 1, 2 );
//   var expected =
//   {
//     'b,1,2' : true,
//     'c,1,2' : false,
//     'd,1,2' : true
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( 1, 2, { b : true, c : false, d : true } );
//   var expected =
//   {
//     '1,2,b' : true,
//     '1,2,c' : false,
//     '1,2,d' : true
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], { b : true }, 'c' );
//   var expected =
//   {
//     '1,b,c' : true,
//     '2,b,c' : true,
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( { b : true }, [ 1, 2 ], 'c' );
//   var expected =
//   {
//     'b,1,c' : true,
//     'b,2,c' : true,
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], 'c', { b : true } );
//   var expected =
//   {
//     '1,c,b' : true,
//     '2,c,b' : true,
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], { b : true, c : false }, 'd' );
//   var expected =
//   {
//     '1,b,d' : true,
//     '1,c,d' : false,
//     '2,b,d' : true,
//     '2,c,d' : false
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( { b : true, c : false }, [ 1, 2 ], 'd' );
//   var expected =
//   {
//     'b,1,d' : true,
//     'b,2,d' : true,
//     'c,1,d' : false,
//     'c,2,d' : false
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   var got =  routine( [ 1, 2 ], 'd', { b : true, c : false } );
//   var expected =
//   {
//     '1,d,b' : true,
//     '1,d,c' : false,
//     '2,d,b' : true,
//     '2,d,c' : false
//   }
//   test.identical( got, expected );
//
//   /* */
//
//   if( Config.debug )
//   {
//     test.shouldThrowErrorSync( () => routine( { a : 1 }, 'c', { b : 1 } ) );
//     test.shouldThrowErrorSync( () => routine( [ 1 ], { b : true }, [ 'c', 'd' ] ) );
//   }
//
//   test.close( 'vectorizingMapKeys : 1, vectorizingArray : 1, select : 3' );
//
//   test.open( 'vectorizingMapKeys : 1, vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );
//   function srcRoutine2( src )
//   {
//     return src + 1;
//   }
//   var o =
//   {
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     vectorizingMapKeys : 1,
//     select : 1
//   }
//   o.routine = srcRoutine2;
//   var routine = _.vectorize( o );
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), [ 2 ] );
//   test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 2, 21 : 3, 31 : 4 } );
//
//   test.close( 'vectorizingMapKeys : 1, vectorizingArray : 1, vectorizingMapVals : 1, select : 1' );
// }
//
// //
//
// function vectorizeBypassingEmpty( test )
// {
//   function srcRoutine()
//   {
//     _.sure( arguments.length );
//     return _.longSlice( arguments );
//   }
//
//   function srcRoutine2()
//   {
//     _.sure( arguments.length );
//     return arguments[ 0 ] + 1;
//   }
//
//   /* */
//
//   test.open( 'vectorizing off, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine,
//     bypassingEmpty : 0,
//     vectorizingArray : 0,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.case = 'with arg';
//   var got = routine( 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected )
//
//   test.close( 'vectorizing off, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizing off, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine,
//     bypassingEmpty : 1,
//     vectorizingArray : 0,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.case = 'with arg';
//   var got = routine( 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected )
//
//   test.close( 'vectorizing off, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine,
//     bypassingEmpty : 0,
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.case = 'with arg';
//   var got = routine( 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected )
//
//   test.close( 'vectorizingArray:1, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, bypassingEmpty:1' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine,
//     bypassingEmpty : 1,
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   var got = routine();
//   var expected = [];
//   test.identical( got, expected )
//
//   test.case = 'with arg';
//   var got = routine( 1 );
//   var expected = [ 1 ];
//   test.identical( got, expected )
//
//   test.close( 'vectorizingArray:1, bypassingEmpty:1' );
//
//   /* */
//
//   test.open( 'vectorizingMapVals:1, bypassingEmpty:1' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 1,
//     vectorizingArray : 0,
//     vectorizingMapVals : 1,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   var got = routine();
//   var expected = [];
//   test.identical( got, expected )
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), '11' );
//   test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );
//
//   test.close( 'vectorizingMapVals:1, bypassingEmpty:1' );
//
//   /* */
//
//   test.open( 'vectorizingMapVals:1, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 0,
//     vectorizingArray : 0,
//     vectorizingMapVals : 1,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), '11' );
//   test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );
//
//   test.close( 'vectorizingMapVals:1, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:1' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 1,
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   var got = routine();
//   var expected = [];
//   test.identical( got, expected )
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), [ 2 ] );
//   test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );
//
//   test.close( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:1' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 0,
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     vectorizingMapKeys : 0,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), [ 2 ] );
//   test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 1 : 2, 2 : 3, 3 : 4 } );
//
//   test.close( 'vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizingMapKeys:1, bypassingEmpty:1' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 1,
//     vectorizingArray : 0,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   var got = routine();
//   var expected = [];
//   test.identical( got, expected )
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), '11' );
//   test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );
//
//   test.close( 'vectorizingMapKeys:1, bypassingEmpty:1' );
//
//   /* */
//
//   test.open( 'vectorizingMapKeys:1, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 0,
//     vectorizingArray : 0,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), '11' );
//   test.identical( routine( [ 1, 2, 3 ] ), '1,2,31' );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );
//
//   test.close( 'vectorizingMapKeys:1, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:1' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 1,
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   var got = routine();
//   var expected = [];
//   test.identical( got, expected )
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), [ 2 ] );
//   test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );
//
//   test.close( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:1' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 0,
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 1,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), [ 2 ] );
//   test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 1, 21 : 2, 31 : 3 } );
//
//   test.close( 'vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:1' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 1,
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     vectorizingMapKeys : 1,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   var got = routine();
//   var expected = [];
//   test.identical( got, expected )
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), [ 2 ] );
//   test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 2, 21 : 3, 31 : 4 } );
//
//   test.close( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:1' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:0' );
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine2,
//     bypassingEmpty : 0,
//     vectorizingArray : 1,
//     vectorizingMapVals : 1,
//     vectorizingMapKeys : 1,
//     select : 1
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.identical( routine( 1 ), 2 );
//   test.identical( routine( [ 1 ] ), [ 2 ] );
//   test.identical( routine( [ 1, 2, 3 ] ), [ 2, 3, 4 ] );
//   test.identical( routine( { 1 : 1, 2 : 2, 3 : 3 } ), { 11 : 2, 21 : 3, 31 : 4 } );
//
//   test.close( 'vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:0' );
//
//   // vectorizeForOptionsMapForKeys
//
//   test.open( 'vectorizingArray:1, select : array, bypassingEmpty:0' );
//
//   function srcRoutine3( src )
//   {
//     return src;
//   }
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine3,
//     bypassingEmpty : 0,
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 0,
//     select : [ '0' ]
//   });
//
//   test.case = 'no arg';
//   test.shouldThrowErrorSync( () => routine() );
//
//   test.identical( routine( 1 ), [ 1 ] );
//   test.identical( routine( [ 1 ] ), [ [ 1 ] ] );
//   test.identical( routine( [ [ 1 ] ] ), [ [ { 0 : 1 } ] ] );
//   test.identical( routine( { 0 : [ 1 ] } ), [ [ { 0 : 1 } ] ] );
//
//   test.close( 'vectorizingArray:1, select : array, bypassingEmpty:0' );
//
//   /* */
//
//   test.open( 'vectorizingArray:1, select : array, bypassingEmpty:1' );
//
//   function srcRoutine3( src )
//   {
//     return src;
//   }
//
//   var routine = _.vectorize
//   ({
//     routine : srcRoutine3,
//     bypassingEmpty : 1,
//     vectorizingArray : 1,
//     vectorizingMapVals : 0,
//     vectorizingMapKeys : 0,
//     select : [ '0' ]
//   });
//
//   test.identical( routine(), [] );
//   test.identical( routine( 1 ), [ 1 ] );
//   test.identical( routine( [ 1 ] ), [ [ 1 ] ] );
//   test.identical( routine( [ [ 1 ] ] ), [ [ { 0 : 1 } ] ] );
//   test.identical( routine( { 0 : [ 1 ] } ), [ [ { 0 : 1 } ] ] );
//
//   test.close( 'vectorizingArray:1, select : array, bypassingEmpty:1' );
// }
//
// //
//
// function vectorizeAll( test )
// {
//
//   test.case = 'trivial';
//   function isOdd( a )
//   {
//     return a % 2;
//   }
//   isOdd.map1 = {};
//   isOdd.map1.a = 1;
//   isOdd.map2 = Object.create( {} );
//   isOdd.map2.a = 2;
//   isOdd.str = 'str';
//   isOdd.number = 13;
//   isOdd.routine = function r(){};
//   var got = _.vectorizeAll( isOdd );
//   test.identical( got.map1, isOdd.map1 );
//   test.identical( _.props.keys( got.map2 ), [ 'a' ] );
//   test.identical( got.map2.a, isOdd.map2.a );
//   test.identical( got.str, isOdd.str );
//   test.identical( got.number, isOdd.number );
//   test.identical( got.routine, isOdd.routine );
//   test.true( _.routine.is( got ) );
//   test.identical( got([ 0, 1, 2, 3 ]), 0 );
//   test.identical( got([ 0, 2 ]), 0 );
//   test.identical( got([ 1, 3 ]), true );
// }
//
// //
//
// function vectorizeAny( test )
// {
//   test.case = 'trivial';
//   function isOdd( a )
//   {
//     return a % 2;
//   }
//   isOdd.map1 = {};
//   isOdd.map1.a = 1;
//   isOdd.map2 = Object.create( {} );
//   isOdd.map2.a = 2;
//   isOdd.str = 'str';
//   isOdd.number = 13;
//   isOdd.routine = function r(){};
//   var got = _.vectorizeAny( isOdd );
//   test.identical( got.map1, isOdd.map1 );
//   test.identical( _.props.keys( got.map2 ), [ 'a' ] );
//   test.identical( got.map2.a, isOdd.map2.a );
//   test.identical( got.str, isOdd.str );
//   test.identical( got.number, isOdd.number );
//   test.identical( got.routine, isOdd.routine );
//   test.true( _.routine.is( got ) );
//   test.identical( got([ 0, 1, 2, 3 ]), true );
//   test.identical( got([ 0, 2 ]), false );
//   test.identical( got([ 1, 3 ]), true );
// }
//
// //
//
// function vectorizeNone( test )
// {
//   test.case = 'trivial';
//   function isOdd( a )
//   {
//     return a % 2;
//   }
//   isOdd.map1 = {};
//   isOdd.map1.a = 1;
//   isOdd.map2 = Object.create( {} );
//   isOdd.map2.a = 2;
//   isOdd.str = 'str';
//   isOdd.number = 13;
//   isOdd.routine = function r(){};
//   var got = _.vectorizeNone( isOdd );
//   test.identical( got.map1, isOdd.map1 );
//   test.identical( _.props.keys( got.map2 ), [ 'a' ] );
//   test.identical( got.map2.a, isOdd.map2.a );
//   test.identical( got.str, isOdd.str );
//   test.identical( got.number, isOdd.number );
//   test.identical( got.routine, isOdd.routine );
//   test.true( _.routine.is( got ) );
//   test.identical( got([ 0, 1, 2, 3 ]), false );
//   test.identical( got([ 0, 2 ]), true );
//   test.identical( got([ 1, 3 ]), false );
// }
//
// //
//
// function vectorizeAccessBasic( test )
// {
//   test.open( 'get' );
//
//   test.case = 'get property, not a routine';
//   var vector = [ { a : 1, b : 2 }, { a : 3, b : 4, c : 5 } ];
//   var src = _.vectorizeAccess( vector );
//   var got = src.a;
//   test.identical( got.$, [ 1, 3 ] );
//
//   test.case = 'execute method on number';
//   var routine = ( e ) => e;
//   var vector = [ { a : routine, b : 2 }, { a : routine, b : 4, c : 5 } ];
//   var src = _.vectorizeAccess( vector );
//   var got = src.a( 1 );
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.case = 'execute method on element of vector';
//   var routine = ( e ) => e;
//   var vector = [ { a : routine, b : 2 }, { a : routine, b : 4, c : 5 } ];
//   var src = _.vectorizeAccess( vector );
//   var got = src.a( vector[ 0 ] );
//   test.identical( got.$, [ { a : routine, b : 2 }, { a : routine, b : 2 } ] );
//   test.true( got !== src );
//
//   test.case = 'execute method on element of vector, execute new vector';
//   var routine = ( e ) => e;
//   var vector = [ { a : routine, b : 2 }, { a : routine, b : 4, c : 5 } ];
//   var src = _.vectorizeAccess( vector );
//   var got = src.a( vector[ 0 ] ).a( 1 );
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.case = 'passed element of vector, return original proxy';
//   var routine = ( e ) => e;
//   var vector = [ { a : routine, b : 2 } ];
//   var src = _.vectorizeAccess( vector );
//   var got = src.a( vector[ 0 ] );
//   test.identical( got.$, [ { a : routine, b : 2 } ] );
//   test.true( got === src );
//
//   /* - */
//
//   test.case = 'vector has not nested vectors or objects, key is $';
//   var vector = [ 1, 2, 3, 4 ];
//   var src = _.vectorizeAccess( vector );
//   var got = src.$;
//   test.identical( got, [ 1, 2, 3, 4 ] );
//   test.true( got === vector );
//
//   test.case = 'get first element of vectors, not a routine';
//   var vector = [ [ 1, 2 ], [ 1, 2 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ];
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.case = 'execute routine in vectors on number';
//   var routine = ( e ) => e;
//   var vector = [ [ routine, 2 ], [ routine, 3 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ]( 1 );
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.case = 'execute routine in vectors on element of original vector';
//   var routine = ( e ) => e;
//   var vector = [ [ routine, 2 ], [ routine, 3 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ]( vector[ 0 ] );
//   test.identical( got.$, [ [ routine, 2 ], [ routine, 2 ] ] );
//   test.true( got !== src );
//
//   test.case = 'execute routine in vectors on element of original vector, execute resulted vector on number';
//   var routine = ( e ) => e;
//   var vector = [ [ routine, 2 ], [ routine, 3 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ]( vector[ 0 ] )[ 0 ]( 1 );
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.case = 'passed element of vector ';
//   var routine = ( e ) => e;
//   var vector = [ [ routine, 2 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ]( vector[ 0 ] );
//   test.identical( got.$, [ [ routine, 2 ] ] );
//   test.true( got === src );
//
//   /* - */
//
//   test.case = 'get first element of vectors, not a routine';
//   var vector = [ { 0 : 1, 1 : 2 }, [ 1, 2 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ];
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.case = 'execute routine in vectors on number';
//   var routine = ( e ) => e;
//   var vector = [ { 0 : routine, 1 : 2 }, [ routine, 3 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ]( 1 );
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.case = 'execute routine in vectors on element of original vector';
//   var routine = ( e ) => e;
//   var vector = [ { 0 : routine, 1 : 2 }, [ routine, 3 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ]( vector[ 0 ] );
//   test.identical( got.$, [ { 0 : routine, 1 : 2 }, { 0 : routine, 1 : 2 } ] );
//   test.true( got !== src );
//
//   test.case = 'execute routine on element of original vector, execute resulted vector on number';
//   var routine = ( e ) => e;
//   var vector = [ { 0 : routine, 1 : 2 }, [ routine, 3 ] ];
//   var src = _.vectorizeAccess( vector );
//   var got = src[ 0 ]( vector[ 0 ] )[ 0 ]( 1 );
//   test.identical( got.$, [ 1, 1 ] );
//
//   test.close( 'get' );
//
//   /* - */
//
//   test.open( 'set' );
//
//   test.case = 'set property of objects';
//   var vector = [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ];
//   var src = _.vectorizeAccess( vector );
//   test.identical( src.$, [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ] );
//   src.a = 0;
//   test.identical( src.$, [ { a : 0, b : 2 }, { a : 0, b : 4, c : 1 }, { a : 0, b : 6 } ] );
//
//   test.case = 'set method in property of objects';
//   var routine = ( e ) => e;
//   var vector = [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ];
//   var src = _.vectorizeAccess( vector );
//   test.identical( src.$, [ { a : 1, b : 2 }, { a : 3, b : 4, c : 1 }, { a : 5, b : 6 } ] );
//   src.b = routine;
//   test.identical( src.$, [ { a : 1, b : routine }, { a : 3, b : routine, c : 1 }, { a : 5, b : routine } ] );
//
//   /* */
//
//   test.case = 'set property of vectors';
//   var vector = [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ];
//   var src = _.vectorizeAccess( vector );
//   test.identical( src.$, [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ] );
//   src[ 0 ] = 0;
//   test.identical( src.$, [ [ 0, 2 ], [ 0, 4, 1 ], [ 0, 6 ] ] );
//
//   test.case = 'set method in property of objects';
//   var routine = ( e ) => e;
//   var vector = [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ];
//   var src = _.vectorizeAccess( vector );
//   test.identical( src.$, [ [ 1, 2 ], [ 3, 4, 1 ], [ 5, 6 ] ] );
//   src[ 1 ] = routine;
//   test.identical( src.$, [ [ 1, routine ], [ 3, routine, 1 ], [ 5, routine ] ] );
//
//   /* */
//
//   test.case = 'set property of vectors';
//   var vector = [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ];
//   var src = _.vectorizeAccess( vector );
//   test.identical( src.$, [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ] );
//   src[ 0 ] = 0;
//   test.identical( src.$, [ { 0 : 0, 1 : 2 }, [ 0, 4, 1 ], [ 0, 6 ] ] );
//
//   test.case = 'set method in property of objects';
//   var routine = ( e ) => e;
//   var vector = [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ];
//   var src = _.vectorizeAccess( vector );
//   test.identical( src.$, [ { 0 : 1, 1 : 2 }, [ 3, 4, 1 ], [ 5, 6 ] ] );
//   src[ 1 ] = routine;
//   test.identical( src.$, [ { 0 : 1, 1 : routine }, [ 3, routine, 1 ], [ 5, routine ] ] );
//
//   test.close( 'set' );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.vectorizeAccess() );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.vectorizeAccess( [ { name : 'a', id : '20' } ], [ { date : '01.01.2020' } ] ) );
//
//   test.case = 'object has no property, get property';
//   test.shouldThrowErrorSync( () =>
//   {
//     var src = _.vectorizeAccess( [ { a : 1 }, { b : 1 } ] );
//     var got = src.a;
//   } );
//
//   test.case = 'object has no property, set property';
//   test.shouldThrowErrorSync( () =>
//   {
//     var src = _.vectorizeAccess( [ { a : 1 }, { b : 1 } ] );
//     src.a = 2;
//   } );
// }
//
// //
//
// function vectorizeAccessSpecial( test )
// {
//
//   var cb1 = ( e ) => e;
//   var cb2 = ( e ) => e ** 2;
//   var cb3 = ( e ) => Math.sqrt( e );
//   var elements = [ { routine : cb1, name : 'first' }, { routine : cb2, name : 'second' }, { routine : cb3, name : 'third' } ];
//   var vectorized = _.vectorizeAccess( elements );
//
//   test.description = 'get';
//   test.identical( vectorized.$, elements );
//   test.true( _.routine.is( vectorized.routine ) );
//
//   test.description = 'does not exist';
//   test.identical( vectorized.haveNo, undefined );
//
//   var exp = [ 'first', 'second', 'third' ];
//   var name = vectorized.name;
//   console.log( name.$ );
//   console.log( _.longIs( name.$ ) );
//   test.identical( name.$, exp );
//
//   test.description = 'set';
//   vectorized.name = 'new value';
//   console.log( vectorized.$ );
//   test.identical( vectorized.$, elements );
//   test.true( _.routine.is( vectorized.routine ) );
//   var exp = [ 'new value', 'new value', 'new value' ];
//   test.identical( vectorized.name.$, exp );
//
//   test.description = 'call';
//   var exp = [ 2, 4, Math.sqrt( 2 ) ];
//   var got = vectorized.routine( 2 ).$;
//   test.identical( got, exp );
//
// }

//

function exportStringShallowDiagnostic( test )
{

  test.case = 'function';
  var src = plain;
  var expected = '{- routine plain -}';
  var got = _.routine.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'async function';
  var src = async;
  var expected = '{- routine async -}';
  var got = _.routine.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'arrow function';
  var arrow = () => {};
  var src = arrow;
  var expected = '{- routine arrow -}';
  var got = _.routine.exportStringShallowDiagnostic( src );
  test.identical( got, expected );

  test.case = 'anonymos function';
  var expected = '{- routine.anonymous -}';
  var got = _.routine.exportStringShallowDiagnostic( function () {} );
  test.identical( got, expected );

  test.case = 'anonymos arrow function';
  var expected = '{- routine.anonymous -}';
  var got = _.routine.exportStringShallowDiagnostic( () => {} );
  test.identical( got, expected );

  // test.case = 'func expression';
  // var expr = function () {};
  // var src = expr;
  // var expected = '{- routine expr -}';
  // var got = _.routine.exportStringShallowDiagnostic( src );
  // test.identical( got, expected );

  // test.case = 'func expression with name';
  // var expr = function expr2() {};
  // var src = expr;
  // var expected = '{- routine expr2 -}';
  // var got = _.routine.exportStringShallowDiagnostic( src );
  // test.identical( got, expected );


  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.routine.exportStringShallowDiagnostic() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.routine.exportStringShallowDiagnostic( () => {}, () => {} ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.routine.exportStringShallowDiagnostic( {} ) );

  /* - */

  function plain() {};

  async function async() {};
}

// --
//
// --

//
const Proto =
{

  name : 'Tools.Routine.l9',
  silencing : 1,

  tests :
  {

    // is,
    // like,
    // isSync,
    // isAsync,
    // isTrivial,
    //
    // /* aaa : tests for constructorJoin, extend tests for routineJoin | Dmytro : coverage is extended */
    //
    // _join,
    // constructorJoin,
    // join,
    // seal,

    // options,
    // options_,
    // assertOptions,
    // assertOptions_,
    // optionsPreservingUndefines_,
    // assertOptionsPreservingUndefines_,

    /* xxx : deprecate */
    routinesCompose,
    routinesComposeAll,
    routinesComposeAllReturningLast,
    routinesChain,

    // // routineExtend_old,
    // routineExtend,
    // extendSpecial,
    // extendBodyInstanicing,
    // extendThrowing,
    // routineDefaults,
    // uniteBasic,
    // uniteInstancing,
    // uniteWithNumberInsteadOfHead,

    er,
    erShouldSupplementNotDefinedFields,
    erMake,
    erMakeShouldSupplementNotDefinedFields,

    // vectorizeVectorizeArray,
    // vectorizeOriginalRoutine,
    // vectorizeVectorizeMapOrArray,
    // vectorizeVectorizeForOptionsMap,
    // vectorize,
    // /* qqq : split test routine vectorize */
    // /* qqq : add tests for vectorize* routines */
    // vectorizeBypassingEmpty,
    //
    // vectorizeAll, /* qqq : extend please */
    // vectorizeAny, /* qqq : extend please */
    // vectorizeNone, /* qqq : extend please */
    //
    // vectorizeAccessBasic,
    // vectorizeAccessSpecial,

    exportStringShallowDiagnostic,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
