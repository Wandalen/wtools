( function _l0_l9_HashMap_test_s_()
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

function fromMap( test )
{

  test.case = 'basic, 1 arg';
  var src =
  {
    a : 1,
    b : 2,
  }
  var got = _.hashMap.fromProps( src );
  var exp = new HashMap();
  exp.set( 'a', 1 );
  exp.set( 'b', 2 );
  test.identical( got, exp );

  test.case = 'basic, 2 args';
  var src =
  {
    a : 1,
    b : 2,
  }
  var got = _.hashMap.fromProps( null, src );
  var exp = new HashMap();
  exp.set( 'a', 1 );
  exp.set( 'b', 2 );
  test.identical( got, exp );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.HashMap.l0.l9', /* xxx : make optional name. deduce if not defined */
  silencing : 1,

  tests :
  {

    fromMap,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
