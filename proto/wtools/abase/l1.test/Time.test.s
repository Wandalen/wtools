( function _Time_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../../Tools.s' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
// const __ = _globals_.testing.wTools;

// --
// tests
// --

function performance( test )
{
  test.case = 'trivial';

  let arrBig = Array( 1e5 );
  let arrSmall = Array( 1e2 );

  let resultBigFor = _.time.performance
  ({
    routine : forCycle,
    input : arrBig,
    inputSize : arrBig.length,
  })

  let resultSmallFor = _.time.performance
  ({
    routine : forCycle,
    input : arrSmall,
    inputSize : arrSmall.length,
  })

  let resultBigForOf = _.time.performance
  ({
    routine : forOfCycle,
    input : arrBig,
    inputSize : arrBig.length,
  })

  let resultSmallForOf = _.time.performance
  ({
    routine : forOfCycle,
    input : arrSmall,
    inputSize : arrSmall.length,
  })

  // test.true( true );
  console.log( resultBigFor );

  /* - */

  function forCycle( arr )
  {
    for( let i = 0; i < arr.length; i++ )
    {
      i++;
    }
    return i;
  }

  function forOfCycle( arr )
  {
    let i = 0;
    for( let i of arr )
    {
      i++;
    }
    return i;
  }
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.l1.Time',
  silencing : 1,

  context :
  {
    t1 : 10,
    t2 : 1000,
  },
  /* aaa xxx : minimize number of time parameters. too many of such */ /* Dmytro : minimized, the step is power of 10 */

  tests :
  {
    performance,
  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();

