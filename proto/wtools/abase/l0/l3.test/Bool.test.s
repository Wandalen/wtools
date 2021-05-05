( function _l0_l3_Bool_test_s()
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

// --
//
// --

/* qqq : for junior : extend please */
function compare( test )
{

  test.case = 'true - true';
  var src1 = true;
  var src2 = true;
  test.identical( _.bool.equivalentShallow( src1, src2 ), true );
  test.identical( _.bool.equivalent( src1, src2 ), true );
  test.identical( _.bool.identicalShallow( src1, src2 ), true );
  test.identical( _.bool.identical( src1, src2 ), true );

  test.case = 'undefined - undefined';
  var src1 = undefined;
  var src2 = undefined;
  test.identical( _.bool.equivalentShallow( src1, src2 ), false );
  test.identical( _.bool.equivalent( src1, src2 ), false );
  test.identical( _.bool.identicalShallow( src1, src2 ), false );
  test.identical( _.bool.identical( src1, src2 ), false );

  test.case = 'null - undefined';
  var src1 = null;
  var src2 = undefined;
  test.identical( _.bool.equivalentShallow( src1, src2 ), false );
  test.identical( _.bool.equivalent( src1, src2 ), false );
  test.identical( _.bool.identicalShallow( src1, src2 ), false );
  test.identical( _.bool.identical( src1, src2 ), false );

  test.case = 'map - array';
  var src1 = {};
  var src2 = [];
  test.identical( _.bool.equivalentShallow( src1, src2 ), false );
  test.identical( _.bool.equivalent( src1, src2 ), false );
  test.identical( _.bool.identicalShallow( src1, src2 ), false );
  test.identical( _.bool.identical( src1, src2 ), false );

  test.case = 'false - false';
  var got = _.bool.equivalentShallow( false, false );
  test.identical( got, true );

  test.case = '1 - true';
  var got = _.bool.equivalentShallow( 1, true );
  test.identical( got, true );

  test.case = '0 - false';
  var got = _.bool.equivalentShallow( 0, false );
  test.identical( got, true );

  test.case = '1 - 1';
  var got = _.bool.equivalentShallow( 1, 1 );
  test.identical( got, true );

  test.case = '0 - 0';
  var got = _.bool.equivalentShallow( 1, 1 );
  test.identical( got, true );

  /* */

  test.case = 'true - false';
  var got = _.bool.equivalentShallow( true, false );
  test.identical( got, false );

  test.case = '1 - false';
  var got = _.bool.equivalentShallow( 1, false );
  test.identical( got, false );

  test.case = '0 - true';
  var got = _.bool.equivalentShallow( 0, true );
  test.identical( got, false );

  test.case = '1 - 0';
  var got = _.bool.equivalentShallow( 1, 0 );
  test.identical( got, false );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no args';
  test.shouldThrowErrorSync( () => _.bool.equivalentShallow() );

  test.case = 'too many args';
  test.shouldThrowErrorSync( () => _.bool.equivalentShallow( true, true, true, true ) );

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Bool.l0.l3',
  silencing : 1,
  enabled : 1,

  tests :
  {

    compare,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
