( function _l0_l9_Time_test_s_()
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

function bulky( test )
{

  test.case = 'without argument';
  var got = _.timerIs();
  test.identical( got, false );

  test.case = 'check _begin timer';
  var src = _.time._begin( Infinity );
  var got = _.timerIs( src );
  test.identical( got, true );
  _.time.cancel( src );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Time.l0.l9',
  silencing : 1,

  context :
  {
    t1 : 10,
    t2 : 1000,
  },

  tests :
  {

    bulky,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();

