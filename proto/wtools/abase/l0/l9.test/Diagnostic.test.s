( function _l0_l9_Diagnostic_test_s_()
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

function structureGenerate( test )
{

  test.case = 'implicity call';
  var got = _.diagnostic.structureGenerate();
  test.true( _.mapIs( got.result ) );
  test.identical( got.result[ 'number.big' ], 1 << 30 );
  test.true( _.number.is( got.size ) );

  test.case = 'defaultComplexity : 5, depth : 3';
  var got = _.diagnostic.structureGenerate({ defaultComplexity : 5, depth : 3 });
  test.true( _.mapIs( got.result ) );
  test.true( _.hashMap.is( got.result.hashMap ) );
  test.true( _.set.is( got.result.set ) );

}

structureGenerate.timeOut = 50000;

//

function objectMake( test )
{

  test.case = `length:2 countable:1 basic:1`;
  var got = _.diagnostic.objectMake({ elements : [ 'a', 'b' ], length : 2, countable : 1, basic : 1 });
  test.true(  _.countable.is( got ) );
  test.true(  _.vector.is( got ) );
  test.true( _.object.isBasic( got ) );
  test.true( _.object.is( got ) );

  test.case = `length:2 countable:1 basic:0`;
  var got = _.diagnostic.objectMake({ elements : [ 'a', 'b' ], length : 2, countable : 1, basic : 0 });
  test.true(  _.countable.is( got ) );
  test.true(  _.vector.is( got ) );
  test.true( !_.object.isBasic( got ) );
  test.true( _.object.is( got ) );

  act({ countable : 1, vector : 1, basic : 1 });
  act({ countable : 1, vector : 1, basic : 0 });
  act({ countable : 1, vector : 0, basic : 1 });
  act({ countable : 1, vector : 0, basic : 0 });
  act({ countable : 0, vector : 0, basic : 1 });
  act({ countable : 0, vector : 0, basic : 0 });
  act({ countable : null, vector : 1, basic : 1 });
  act({ countable : null, vector : 1, basic : 0 });
  act({ countable : null, vector : 0, basic : 1 });
  act({ countable : null, vector : 0, basic : 0 });
  act({ countable : 1, vector : null, basic : 1 });
  act({ countable : 1, vector : null, basic : 0 });
  act({ countable : 0, vector : null, basic : 1 });
  act({ countable : 0, vector : null, basic : 0 });

  /* */

  function act( env )
  {

    test.case = `${__.entity.exportStringSolo( env )}`;
    var got = _.diagnostic.objectMake({ elements : [ 'a', 'b' ], ... env });

    if( env.countable === null )
    env.countable = 1;
    if( !env.vector )
    env.vector = 0;

    test.true( !( _.countable.is( got ) ^ !!env.countable ) );
    test.true( !( _.vector.is( got ) ^ !!env.vector ) );
    test.true( !(_.object.isBasic( got ) ^ !!env.basic ) );
    test.true( _.object.is( got ) );

  }

}

// --
//
// --

const Proto =
{

  name : 'Tools.Diagnostic.l0.l9',
  silencing : 1,
  enabled : 1,

  tests :
  {

    structureGenerate,
    objectMake,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
