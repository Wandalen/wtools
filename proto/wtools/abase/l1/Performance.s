( function _l1_Time_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools.time = _global_.wTools.time || Object.create( null );

// --
// implementation
// --


function performance( o )
{

  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  o = _.routine.options( performance, o );

  _.assert( o.routine, 'Expects option::routine' )
  _.assert( o.input, 'Expects option::input' )
  _.assert( o.inputSize, 'Expects option::inputSize' )

  let result = Object.create( null );
  let took = 0;

  for( let i = o.iterations; i > 0; i-- )
  {
    let time1 = _.time.now();
    let result = o.routine( o.input );
    let time2 = _.time.now();
    took += time2 - time1;
    if( o.onEnd )
    {
      let isPassed = o.onEnd( result );

      if( !isPassed )
      result.isPassed = false;
    }
  }

  if( o.onEnd && result.isPassed === null )
  result.isPassed = true;

  result.iterations = o.iterations;
  result.inputSize = o.inputSize;
  result.took = ( took / o.iterations ) * 1000; /* ? */
  result.njs = process.version;
  result.pretty =
`
Input size = ${o.inputSize}, iterations = ${o.iterations}
Routine took : ${result.took}s on Njs ${result.njs}
`

  return result;

}
performance.defaults =
{
  routine : null,
  input : null,
  inputSize : null,
  iterations : 10,
  onEnd : null /* callback for checking the result. Must return true or false */
}

// function strShortPerformance( test )
// {
//   /*
//     |     **Routine**     |  type   | **Njs : v10.23.0** | **Njs : v12.9.1** | **Njs : v13.14.0** | **Njs : v14.15.1** | **Njs : v15.4.0** |
//     | :-----------------: | :-----: | :----------------: | :---------------: | :----------------: | :----------------: | :---------------: |
//     |    strShort BISI    | regular |      6.5488s       |      5.2201s      |      5.5969s       |      5.1944s       |      5.2801s      |
//     | strShortBinary BISI | binary  |      0.0033s       |      0.0031s      |      0.0029s       |      0.0026s       |      0.0027s      |
//     |    strShort SIBI    | regular |     0.003011s      |     0.002554s     |     0.002522s      |     0.002347s      |     0.002528s     |
//     | strShortBinary SIBI | binary  |     0.000092s      |     0.000101s     |     0.000085s      |     0.000107s      |     0.000095s     |

//     BISI = Big input( length : 1e4 ), small amount of iterations ( 1e1 )
//     SIBI = Small input ( length : 2e2 ), big amount of iterations ( 1e3 )
//   */

//   test.case = 'long string, 10 iterations';
//   var times = 1e1;
//   var size = 1e3;
//   var filler = 'abbcccdddd';
//   var string = new Array( size )
//   .fill( filler )
//   .join( '' );
//   var stringSize = string.length;
//   test.true( true );

//   var testing = { counter : 0 };
//   var took = 0;

//   for( let i = times; i > 0; i-- )
//   {
//     var time1 = _.time.now();
//     let [ resultLeft, resultRigth, resultCenter ] = act2();
//     var time2 = _.time.now();
//     took += time2 - time1;
//     test.identical( resultLeft, 'cccdddd' );
//     test.identical( resultRigth, 'abb' );
//     test.identical( resultCenter, 'adddd' );
//   }

//   console.log( `String length = ${stringSize}, iterations = ${times}` );
//   console.log( `Routine BISI took : ${took / ( times * 1000 )}s on Njs ${process.version}` );
//   // console.log( `Counter = ${testing.counter / times / 3 }` );
//   console.log( '----------------------------------------------------' );

//   /* - */

//   test.case = 'short string, 1000 iterations';
//   var times = 1e3;
//   var size = 2e1;
//   var filler = 'abbcccdddd';
//   var string = new Array( size )
//   .fill( filler )
//   .join( '' );
//   var stringSize = string.length;

//   var testing = { counter : 0 }
//   var took = 0;

//   for( let i = times; i > 0; i-- )
//   {
//     var time1 = _.time.now();
//     let [ resultLeft, resultRigth, resultCenter ] = act2();
//     var time2 = _.time.now();
//     took += time2 - time1;
//     test.identical( resultLeft, 'cccdddd' );
//     test.identical( resultRigth, 'abb' );
//     test.identical( resultCenter, 'adddd' );
//   }

//   console.log( `String length = ${stringSize}, iterations = ${times}` );
//   console.log( `Routine SIBI took : ${took / ( times * 1000 )}s on Njs ${process.version}` );
//   // console.log( `Counter = ${testing.counter / times / 3}` );
//   console.log( '----------------------------------------------------' );

//   /* - */

//   function act() /* existing implementation with fixed 'center' cutting */
//   {
//     let result1 = _.strShort2({ src : string, onLength, widthLimit : 2, cutting : 'left', testingData : testing });
//     let result2 = _.strShort2({ src : string, onLength, widthLimit : 2, cutting : 'right', testingData : testing });
//     let result3 = _.strShort2({ src : string, onLength, widthLimit : 2, cutting : 'center', testingData : testing });

//     return [ result1, result2, result3 ];
//   }

//   function act2() /* binary search implementation */
//   {
//     let result1 = _.strShort({ src : string, onLength, widthLimit : 2, cutting : 'left', testingData : testing });
//     let result2 = _.strShort({ src : string, onLength, widthLimit : 2, cutting : 'right', testingData : testing });
//     let result3 = _.strShort({ src : string, onLength, widthLimit : 2, cutting : 'center', testingData : testing });

//     return [ result1, result2, result3 ];
//   }

//   function onLength( src )
//   {
//     let match = src.match( /(.)\1*/g ); /* match one character or same characters repeating as 1 */

//     if( match === null ) /* prefix, postfix, infix */
//     return src.length;

//     return match.length;
//   }

// }

// --
// Extesion
// --

let Extension =
{

  performance

}

//

Object.assign( Self, Extension );

})();
