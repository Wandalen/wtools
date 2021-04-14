( function _Str_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );

  _.include( 'wTesting' );

  // _.include( 'wStringer' );

}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
//
// --

// function strLeft( test )
// {
//   test.open( 'string' );
//
//   test.case = 'begin';
//   var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', 'aa' );
//   test.identical( got, expected );
//
//   test.case = 'middle';
//   var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', 'bb' );
//   test.identical( got, expected );
//
//   test.case = 'end';
//   var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', 'cc' );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry';
//   var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ 'aa', 'bb' ] );
//   test.identical( got, expected );
//
//   var expected = { index : 0, entry : 'aa', instanceIndex : 1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'aa' ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry';
//   var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'cc' ] );
//   test.identical( got, expected );
//
//   var expected = { index : 6, entry : 'bb', instanceIndex : 1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'bb' ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry';
//   var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'dd' ] );
//
//   test.identical( got, expected );
//   var expected = { index : 12, entry : 'cc', instanceIndex : 1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry, several sources';
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'aa' ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry, several sources';
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'cc' ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'bb' ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry, several sources';
//   var expected = [ { index : 12, entry : 'cc', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'dd' ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 12, entry : 'cc', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'with window';
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -17 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -15 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -10 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -1 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -2 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 0 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 1 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 3 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 6 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 7 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 12, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 10 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -10 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -12 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -2, 17 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -10 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -12 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 17 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -10 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -12 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 17 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 8 ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'no entry';
//   var expected = { index : 17, entry : undefined, instanceIndex : -1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [] );
//   test.identical( got, expected );
//
//   test.case = 'not found';
//   var expected = { index : 17, entry : undefined, instanceIndex : -1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', 'dd' );
//   test.identical( got, expected );
//
//   test.case = 'empty entry';
//   var expected = { index : 0, entry : '', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', '' );
//   test.identical( got, expected );
//
//   test.case = 'empty entry, empty src';
//   var expected = { index : 0, entry : '', instanceIndex : 0 }
//   var got = _.strLeft( '', '' );
//   test.identical( got, expected );
//
//   test.case = 'empty src';
//   var expected = { index : 0, entry : undefined, instanceIndex : -1 }
//   var got = _.strLeft( '', 'aa' );
//   test.identical( got, expected );
//
//   test.close( 'string' );
//
//   /* - */
//
//   test.open( 'regexp' );
//
//   test.case = 'begin';
//   var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', /a+/ );
//   test.identical( got, expected );
//
//   test.case = 'middle';
//   var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', /b+/ );
//   test.identical( got, expected );
//
//   test.case = 'end';
//   var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', /c+/ );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin smeared';
//   var expected = { index : 0, entry : 'xa', instanceIndex : 0 }
//   var got = _.strLeft( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /\wa/ );
//   test.identical( got, expected );
//
//   test.case = 'middle smeared';
//   var expected = { index : 10, entry : 'xb', instanceIndex : 0 }
//   var got = _.strLeft( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /\wb/ );
//   test.identical( got, expected );
//
//   test.case = 'end ';
//   var expected = { index : 20, entry : 'xc', instanceIndex : 0 }
//   var got = _.strLeft( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /\wc/ );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry';
//   var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ /a+/, /b+/ ] );
//   test.identical( got, expected );
//
//   var expected = { index : 0, entry : 'aa', instanceIndex : 1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ /b+/, /a+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry';
//   var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ /b+/, /c+/ ] );
//   test.identical( got, expected );
//
//   var expected = { index : 6, entry : 'bb', instanceIndex : 1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ /c+/, /b+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry';
//   var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ /c+/, /d+/ ] );
//   test.identical( got, expected );
//
//   var expected = { index : 12, entry : 'cc', instanceIndex : 1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry, several sources';
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, /b+/ ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /a+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry, several sources';
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /c+/ ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /b+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry, several sources';
//   var expected = [ { index : 12, entry : 'cc', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /d+/ ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 12, entry : 'cc', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'with window, mixed';
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -17 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -15 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -10 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 16, entry : 'a', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -1 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -2 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], 0 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ -17, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 1, entry : 'a', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 1, entry : 'a', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'a', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strLeft( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 8 ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'no entry';
//   var expected = { index : 17, entry : undefined, instanceIndex : -1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', [] );
//   test.identical( got, expected );
//
//   test.case = 'not found';
//   var expected = { index : 17, entry : undefined, instanceIndex : -1 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', /d+/ );
//   test.identical( got, expected );
//
//   test.case = 'empty entry';
//   var expected = { index : 0, entry : '', instanceIndex : 0 }
//   var got = _.strLeft( 'aa_aa_bb_bb_cc_cc', /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'empty entry, empty src';
//   var expected = { index : 0, entry : '', instanceIndex : 0 }
//   var got = _.strLeft( '', /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'empty src';
//   var expected = { index : 0, entry : undefined, instanceIndex : -1 }
//   var got = _.strLeft( '', /a+/ );
//   test.identical( got, expected );
//
//   test.close( 'regexp' );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.open( 'throwing' );
//
//   test.case = 'wrong first index';
//   test.shouldThrowErrorSync( () => _.strLeft( 'abc', 'b', -100 ) );
//   test.shouldThrowErrorSync( () => _.strLeft( 'abc', 'b', 100 ) );
//
//   test.case = 'wrong lalt index';
//   test.shouldThrowErrorSync( () => _.strLeft( 'abc', 'b', 0, -100 ) );
//   test.shouldThrowErrorSync( () => _.strLeft( 'abc', 'b', 0, 100 ) );
//
//   test.case = 'wrong type of src';
//   test.shouldThrowErrorSync( () => _.strLeft( /a/, /a+/ ) );
//
//   test.case = 'wrong type of first index'
//   test.shouldThrowErrorSync( () => _.strLeft( 'abc', /a+/, 'a' ) );
//
//   test.case = 'wrong type of last index'
//   test.shouldThrowErrorSync( () => _.strLeft( 'abc', /a+/, 1, '' ) );
//
//   test.case = 'wrong type of ins'
//   test.shouldThrowErrorSync( () => _.strLeft( '123', 1 ) );
//   test.shouldThrowErrorSync( () => _.strLeft( '123', [ 1 ] ) );
//
//   test.case = 'without argument';
//   test.shouldThrowErrorSync( () => _.strLeft() );
//
//   test.case = 'one argument';
//   test.shouldThrowErrorSync( () => _.strLeft( 'abc' ) );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.strLeft( 'abcd', 'a', 0, 2, 'extra' ) );
//
//   test.close( 'throwing' );
// }

//

function strLeft_( test )
{
  test.open( 'string' );

  test.case = 'begin';
  var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', 'aa' );
  test.identical( got, expected );

  test.case = 'middle';
  var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', 'bb' );
  test.identical( got, expected );

  test.case = 'end';
  var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', 'cc' );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry';
  var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ 'aa', 'bb' ] );
  test.identical( got, expected );

  var expected = { index : 0, entry : 'aa', instanceIndex : 1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'aa' ] );
  test.identical( got, expected );

  test.case = 'middle, several entry';
  var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'cc' ] );
  test.identical( got, expected );

  var expected = { index : 6, entry : 'bb', instanceIndex : 1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'bb' ] );
  test.identical( got, expected );

  test.case = 'end, several entry';
  var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'dd' ] );

  test.identical( got, expected );
  var expected = { index : 12, entry : 'cc', instanceIndex : 1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ] );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry, several sources';
  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'aa' ] );
  test.identical( got, expected );

  test.case = 'middle, several entry, several sources';
  var expected = [ { index : 6, entry : 'bb', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'cc' ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'bb' ] );
  test.identical( got, expected );

  test.case = 'end, several entry, several sources';
  var expected = [ { index : 12, entry : 'cc', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'dd' ] );
  test.identical( got, expected );

  var expected = [ { index : 12, entry : 'cc', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ] );
  test.identical( got, expected );

  /* */

  test.case = 'with window';

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -17 );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -15 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -10 );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -1 );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -2 );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 0 );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 1 );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 3 );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 6 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 7 );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 12, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 10 );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -13 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -2, 16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -13 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 7 ] );
  test.identical( got, expected );

  /* */

  test.case = 'no entry';
  var expected = { index : 17, entry : undefined, instanceIndex : -1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [] );
  test.identical( got, expected );

  test.case = 'not found';
  var expected = { index : 17, entry : undefined, instanceIndex : -1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', 'dd' );
  test.identical( got, expected );

  test.case = 'empty entry';
  var expected = { index : 0, entry : '', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', '' );
  test.identical( got, expected );

  test.case = 'empty entry, empty src';
  var expected = { index : 0, entry : '', instanceIndex : 0 }
  var got = _.strLeft_( '', '' );
  test.identical( got, expected );

  test.case = 'empty src';
  var expected = { index : 0, entry : undefined, instanceIndex : -1 }
  var got = _.strLeft_( '', 'aa' );
  test.identical( got, expected );

  test.close( 'string' );

  /* - */

  test.open( 'regexp' );

  test.case = 'begin';
  var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', /a+/ );
  test.identical( got, expected );

  test.case = 'middle';
  var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', /b+/ );
  test.identical( got, expected );

  test.case = 'end';
  var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', /c+/ );
  test.identical( got, expected );

  /* */

  test.case = 'begin smeared';
  var expected = { index : 0, entry : 'xa', instanceIndex : 0 }
  var got = _.strLeft_( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /\wa/ );
  test.identical( got, expected );

  test.case = 'middle smeared';
  var expected = { index : 10, entry : 'xb', instanceIndex : 0 }
  var got = _.strLeft_( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /\wb/ );
  test.identical( got, expected );

  test.case = 'end ';
  var expected = { index : 20, entry : 'xc', instanceIndex : 0 }
  var got = _.strLeft_( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /\wc/ );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry';
  var expected = { index : 0, entry : 'aa', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ /a+/, /b+/ ] );
  test.identical( got, expected );

  var expected = { index : 0, entry : 'aa', instanceIndex : 1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ /b+/, /a+/ ] );
  test.identical( got, expected );

  test.case = 'middle, several entry';
  var expected = { index : 6, entry : 'bb', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ /b+/, /c+/ ] );
  test.identical( got, expected );

  var expected = { index : 6, entry : 'bb', instanceIndex : 1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ /c+/, /b+/ ] );
  test.identical( got, expected );

  test.case = 'end, several entry';
  var expected = { index : 12, entry : 'cc', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ /c+/, /d+/ ] );
  test.identical( got, expected );

  var expected = { index : 12, entry : 'cc', instanceIndex : 1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ] );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry, several sources';
  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, /b+/ ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /a+/ ] );
  test.identical( got, expected );

  test.case = 'middle, several entry, several sources';
  var expected = [ { index : 6, entry : 'bb', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /c+/ ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /b+/ ] );
  test.identical( got, expected );

  test.case = 'end, several entry, several sources';
  var expected = [ { index : 12, entry : 'cc', instanceIndex : 0 }, { index : 0, entry : 'cc', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /d+/ ] );
  test.identical( got, expected );

  var expected = [ { index : 12, entry : 'cc', instanceIndex : 1 }, { index : 0, entry : 'cc', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ] );
  test.identical( got, expected );

  /* */

  test.case = 'with window, mixed';

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -17 );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -15 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -10 );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 16, entry : 'a', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -1 );
  test.identical( got, expected );

  var expected = [ { index : 17, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -2 );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], 0 );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ -17, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 1, entry : 'a', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 1, entry : 'a', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'a', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 17, entry : undefined, instanceIndex : -1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strLeft_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 7 ] );
  test.identical( got, expected );

  /* */

  test.case = 'no entry';
  var expected = { index : 17, entry : undefined, instanceIndex : -1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', [] );
  test.identical( got, expected );

  test.case = 'not found';
  var expected = { index : 17, entry : undefined, instanceIndex : -1 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', /d+/ );
  test.identical( got, expected );

  test.case = 'empty entry';
  var expected = { index : 0, entry : '', instanceIndex : 0 }
  var got = _.strLeft_( 'aa_aa_bb_bb_cc_cc', /(?:)/ );
  test.identical( got, expected );

  test.case = 'empty entry, empty src';
  var expected = { index : 0, entry : '', instanceIndex : 0 }
  var got = _.strLeft_( '', /(?:)/ );
  test.identical( got, expected );

  test.case = 'empty src';
  var expected = { index : 0, entry : undefined, instanceIndex : -1 }
  var got = _.strLeft_( '', /a+/ );
  test.identical( got, expected );

  test.close( 'regexp' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong first index';
  test.shouldThrowErrorSync( () => _.strLeft_( 'abc', 'b', -100 ) );
  test.shouldThrowErrorSync( () => _.strLeft_( 'abc', 'b', 100 ) );

  test.case = 'wrong lalt index';
  test.shouldThrowErrorSync( () => _.strLeft_( 'abc', 'b', 0, -100 ) );
  test.shouldThrowErrorSync( () => _.strLeft_( 'abc', 'b', 0, 100 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strLeft_( /a/, /a+/ ) );

  test.case = 'wrong type of first index'
  test.shouldThrowErrorSync( () => _.strLeft_( 'abc', /a+/, 'a' ) );

  test.case = 'wrong type of last index'
  test.shouldThrowErrorSync( () => _.strLeft_( 'abc', /a+/, 1, '' ) );

  test.case = 'wrong type of ins'
  test.shouldThrowErrorSync( () => _.strLeft_( '123', 1 ) );
  test.shouldThrowErrorSync( () => _.strLeft_( '123', [ 1 ] ) );

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.strLeft_() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.strLeft_( 'abc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strLeft_( 'abcd', 'a', 0, 2, 'extra' ) );
}

// //
//
// function strRight( test )
// {
//   test.open( 'string' );
//
//   test.case = 'begin';
//   var expected = { index : 3, entry : 'aa', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', 'aa' );
//   test.identical( got, expected );
//
//   test.case = 'middle';
//   var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', 'bb' );
//   test.identical( got, expected );
//
//   test.case = 'end';
//   var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', 'cc' );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry';
//   var expected = { index : 9, entry : 'bb', instanceIndex : 1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ 'aa', 'bb' ] );
//   test.identical( got, expected );
//
//   var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'aa' ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry';
//   var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'cc' ] );
//   test.identical( got, expected );
//
//   var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'bb' ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry';
//   var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'dd' ] );
//   test.identical( got, expected );
//
//   var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry, several sources';
//   var expected = [ { index : 9, entry : 'bb', instanceIndex :  1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 0 }, { index : 15, entry : 'aa', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'aa' ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry, several sources';
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'cc' ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'bb' ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry, several sources';
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 3, entry : 'cc', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'dd' ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 3, entry : 'cc', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'with window';
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -17 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -15 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -10 );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -1 );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -2 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 0 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 1 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 3 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 6 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 7 );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 10 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -10 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -12 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -2, 17 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -10 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -12 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 17 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -10 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -9 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -12 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 17 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 8 ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'no entry';
//   var expected = { index : -1, entry : undefined, instanceIndex : -1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [] );
//   test.identical( got, expected );
//
//   test.case = 'not found';
//   var expected = { index : -1, entry : undefined, instanceIndex : -1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', 'dd' );
//   test.identical( got, expected );
//
//   test.case = 'empty entry';
//   var expected = { index : 17, entry : '', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', '' );
//   test.identical( got, expected );
//
//   test.case = 'empty entry, empty src';
//   var expected = { index : 0, entry : '', instanceIndex : 0 }
//   var got = _.strRight( '', '' );
//   test.identical( got, expected );
//
//   test.case = 'empty src';
//   var expected = { index : -1, entry : undefined, instanceIndex : -1 }
//   var got = _.strRight( '', 'aa' );
//   test.identical( got, expected );
//
//   test.close( 'string' );
//
//   /* - */
//
//   test.open( 'regexp' );
//
//   test.case = 'begin';
//   var expected = { index : 3, entry : 'aa', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', /a+/ );
//   test.identical( got, expected );
//
//   test.case = 'middle';
//   var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', /b+/ );
//   test.identical( got, expected );
//
//   test.case = 'end';
//   var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', /c+/ );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin smeared';
//   var expected = { index : 7, entry : 'ax', instanceIndex : 0 }
//   var got = _.strRight( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /a\w/ );
//   test.identical( got, expected );
//
//   test.case = 'middle smeared';
//   var expected = { index : 17, entry : 'bx', instanceIndex : 0 }
//   var got = _.strRight( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /b\w/ );
//   test.identical( got, expected );
//
//   test.case = 'end ';
//   var expected = { index : 27, entry : 'cx', instanceIndex : 0 }
//   var got = _.strRight( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /c\w/ );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry';
//   var expected = { index : 9, entry : 'bb', instanceIndex : 1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ /a+/, /b+/ ] );
//   test.identical( got, expected );
//
//   var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ /b+/, /a+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry';
//   var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ /b+/, /c+/ ] );
//   test.identical( got, expected );
//   var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ /c+/, /b+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry';
//   var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ /c+/, /d+/ ] );
//   test.identical( got, expected );
//   var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry, several sources';
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, /b+/ ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 0 }, { index : 15, entry : 'aa', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /a+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry, several sources';
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /c+/ ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /b+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry, several sources';
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 3, entry : 'cc', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /d+/ ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 3, entry : 'cc', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'with window, mixed';
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -17 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -15 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -10 );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 16, entry : 'a', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -1 );
//   test.identical( got, expected );
//
//   var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -2 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], 0 );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ -17, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 2 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -15 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 0, entry : 'a', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -16 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 8 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 7 ] );
//   test.identical( got, expected );
//
//   var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
//   var got = _.strRight( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 8 ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'no entry';
//   var expected = { index : -1, entry : undefined, instanceIndex : -1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', [] );
//   test.identical( got, expected );
//
//   test.case = 'not found';
//   var expected = { index : -1, entry : undefined, instanceIndex : -1 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', /d+/ );
//   test.identical( got, expected );
//
//   test.case = 'empty entry';
//   var expected = { index : 17, entry : '', instanceIndex : 0 }
//   var got = _.strRight( 'aa_aa_bb_bb_cc_cc', /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'empty entry, empty src';
//   var expected = { index : 0, entry : '', instanceIndex : 0 }
//   var got = _.strRight( '', /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'empty src';
//   var expected = { index : -1, entry : undefined, instanceIndex : -1 }
//   var got = _.strRight( '', /a+/ );
//   test.identical( got, expected );
//
//   test.close( 'regexp' );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.open( 'throwing' );
//
//   test.case = 'wrong first index';
//   test.shouldThrowErrorSync( () => _.strRight( 'abc', 'b', -100 ) );
//   test.shouldThrowErrorSync( () => _.strRight( 'abc', 'b', 100 ) );
//
//   test.case = 'wrong lalt index';
//   test.shouldThrowErrorSync( () => _.strRight( 'abc', 'b', 0, -100 ) );
//   test.shouldThrowErrorSync( () => _.strRight( 'abc', 'b', 0, 100 ) );
//
//   test.case = 'wrong type of src';
//   test.shouldThrowErrorSync( () => _.strRight( /a/, /a+/ ) );
//
//   test.case = 'wrong type of first index'
//   test.shouldThrowErrorSync( () => _.strRight( 'abc', /a+/, '' ) );
//
//   test.case = 'wrong type of last index'
//   test.shouldThrowErrorSync( () => _.strRight( 'abc', /a+/, 1, '' ) );
//
//   test.case = 'wrong type of ins'
//   test.shouldThrowErrorSync( () => _.strRight( '123', 1 ) );
//   test.shouldThrowErrorSync( () => _.strRight( '123', [ 1 ] ) );
//
//   test.case = 'without argument';
//   test.shouldThrowErrorSync( () => _.strRight() );
//
//   test.case = 'one argument';
//   test.shouldThrowErrorSync( () => _.strRight( 'abc' ) );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.strRight( 'abcd', 'a', 0, 2, 'extra' ) );
//
//   test.close( 'throwing' );
// }

//

function strRight_( test )
{
  test.open( 'string' );

  test.case = 'begin';
  var expected = { index : 3, entry : 'aa', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', 'aa' );
  test.identical( got, expected );

  test.case = 'middle';
  var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', 'bb' );
  test.identical( got, expected );

  test.case = 'end';
  var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', 'cc' );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry';
  var expected = { index : 9, entry : 'bb', instanceIndex : 1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ 'aa', 'bb' ] );
  test.identical( got, expected );

  var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'aa' ] );
  test.identical( got, expected );

  test.case = 'middle, several entry';
  var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'cc' ] );
  test.identical( got, expected );

  var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'bb' ] );
  test.identical( got, expected );

  test.case = 'end, several entry';
  var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'dd' ] );
  test.identical( got, expected );

  var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ] );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry, several sources';
  var expected = [ { index : 9, entry : 'bb', instanceIndex :  1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ] );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 0 }, { index : 15, entry : 'aa', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'aa' ] );
  test.identical( got, expected );

  test.case = 'middle, several entry, several sources';
  var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'cc' ] );
  test.identical( got, expected );

  var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'bb' ] );
  test.identical( got, expected );

  test.case = 'end, several entry, several sources';
  var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 3, entry : 'cc', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'dd' ] );
  test.identical( got, expected );

  var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 3, entry : 'cc', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ] );
  test.identical( got, expected );

  /* */

  test.case = 'with window';

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -17 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -15 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -10 );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -1 );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], -2 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 0 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 1 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 3 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 6 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 7 );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], 10 );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -17, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -15, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ -2, 16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 1, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, -13 ] );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ undefined, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -11 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -10 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, -13 ] );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 0, 7 ] );
  test.identical( got, expected );

  /* */

  test.case = 'no entry';
  var expected = { index : -1, entry : undefined, instanceIndex : -1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [] );
  test.identical( got, expected );

  test.case = 'not found';
  var expected = { index : -1, entry : undefined, instanceIndex : -1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', 'dd' );
  test.identical( got, expected );

  test.case = 'empty entry';
  var expected = { index : 17, entry : '', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', '' );
  test.identical( got, expected );

  test.case = 'empty entry, empty src';
  var expected = { index : 0, entry : '', instanceIndex : 0 }
  var got = _.strRight_( '', '' );
  test.identical( got, expected );

  test.case = 'empty src';
  var expected = { index : -1, entry : undefined, instanceIndex : -1 }
  var got = _.strRight_( '', 'aa' );
  test.identical( got, expected );

  test.close( 'string' );

  /* - */

  test.open( 'regexp' );

  test.case = 'begin';
  var expected = { index : 3, entry : 'aa', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', /a+/ );
  test.identical( got, expected );

  test.case = 'middle';
  var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', /b+/ );
  test.identical( got, expected );

  test.case = 'end';
  var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', /c+/ );
  test.identical( got, expected );

  /* */

  test.case = 'begin smeared';
  var expected = { index : 7, entry : 'ax', instanceIndex : 0 }
  var got = _.strRight_( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /a\w/ );
  test.identical( got, expected );

  test.case = 'middle smeared';
  var expected = { index : 17, entry : 'bx', instanceIndex : 0 }
  var got = _.strRight_( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /b\w/ );
  test.identical( got, expected );

  test.case = 'end ';
  var expected = { index : 27, entry : 'cx', instanceIndex : 0 }
  var got = _.strRight_( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /c\w/ );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry';
  var expected = { index : 9, entry : 'bb', instanceIndex : 1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ /a+/, /b+/ ] );
  test.identical( got, expected );

  var expected = { index : 9, entry : 'bb', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ /b+/, /a+/ ] );
  test.identical( got, expected );

  test.case = 'middle, several entry';
  var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ /b+/, /c+/ ] );
  test.identical( got, expected );
  var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ /c+/, /b+/ ] );
  test.identical( got, expected );

  test.case = 'end, several entry';
  var expected = { index : 15, entry : 'cc', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ /c+/, /d+/ ] );
  test.identical( got, expected );
  var expected = { index : 15, entry : 'cc', instanceIndex : 1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ] );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry, several sources';
  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, /b+/ ] );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 0 }, { index : 15, entry : 'aa', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /a+/ ] );
  test.identical( got, expected );

  test.case = 'middle, several entry, several sources';
  var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 9, entry : 'bb', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /c+/ ] );
  test.identical( got, expected );

  var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 9, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /b+/ ] );
  test.identical( got, expected );

  test.case = 'end, several entry, several sources';
  var expected = [ { index : 15, entry : 'cc', instanceIndex : 0 }, { index : 3, entry : 'cc', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /d+/ ] );
  test.identical( got, expected );

  var expected = [ { index : 15, entry : 'cc', instanceIndex : 1 }, { index : 3, entry : 'cc', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ] );
  test.identical( got, expected );

  /* */

  test.case = 'with window, mixed';

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -17 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -15 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -10 );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 16, entry : 'a', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -1 );
  test.identical( got, expected );

  var expected = [ { index : -1, entry : undefined, instanceIndex : -1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], -2 );
  test.identical( got, expected );

  var expected = [ { index : 9, entry : 'bb', instanceIndex : 1 }, { index : 15, entry : 'aa', instanceIndex : 0 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], 0 );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ -17, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 1 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 1, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -16 ] );
  test.identical( got, expected );

  var expected = [ { index : 0, entry : 'a', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, -17 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ undefined, 7 ] );
  test.identical( got, expected );

  var expected = [ { index : 3, entry : 'aa', instanceIndex : 0 }, { index : -1, entry : undefined, instanceIndex : -1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 6 ] );
  test.identical( got, expected );

  var expected = [ { index : 6, entry : 'bb', instanceIndex : 1 }, { index : 6, entry : 'bb', instanceIndex : 1 } ];
  var got = _.strRight_( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, 'bb' ], [ 0, 7 ] );
  test.identical( got, expected );

  /* */

  test.case = 'no entry';
  var expected = { index : -1, entry : undefined, instanceIndex : -1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', [] );
  test.identical( got, expected );

  test.case = 'not found';
  var expected = { index : -1, entry : undefined, instanceIndex : -1 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', /d+/ );
  test.identical( got, expected );

  test.case = 'empty entry';
  var expected = { index : 17, entry : '', instanceIndex : 0 }
  var got = _.strRight_( 'aa_aa_bb_bb_cc_cc', /(?:)/ );
  test.identical( got, expected );

  test.case = 'empty entry, empty src';
  var expected = { index : 0, entry : '', instanceIndex : 0 }
  var got = _.strRight_( '', /(?:)/ );
  test.identical( got, expected );

  test.case = 'empty src';
  var expected = { index : -1, entry : undefined, instanceIndex : -1 }
  var got = _.strRight_( '', /a+/ );
  test.identical( got, expected );

  test.close( 'regexp' );

  /* - */

  if( !Config.debug )
  return;

  test.open( 'throwing' );

  test.case = 'wrong first index';
  test.shouldThrowErrorSync( () => _.strRight_( 'abc', 'b', -100 ) );
  test.shouldThrowErrorSync( () => _.strRight_( 'abc', 'b', 100 ) );

  test.case = 'wrong lalt index';
  test.shouldThrowErrorSync( () => _.strRight_( 'abc', 'b', 0, -100 ) );
  test.shouldThrowErrorSync( () => _.strRight_( 'abc', 'b', 0, 100 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strRight_( /a/, /a+/ ) );

  test.case = 'wrong type of first index'
  test.shouldThrowErrorSync( () => _.strRight_( 'abc', /a+/, '' ) );

  test.case = 'wrong type of last index'
  test.shouldThrowErrorSync( () => _.strRight_( 'abc', /a+/, 1, '' ) );

  test.case = 'wrong type of ins'
  test.shouldThrowErrorSync( () => _.strRight_( '123', 1 ) );
  test.shouldThrowErrorSync( () => _.strRight_( '123', [ 1 ] ) );

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.strRight_() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.strRight_( 'abc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strRight_( 'abcd', 'a', 0, 2, 'extra' ) );

  test.close( 'throwing' );
}

//

function strEquivalent( test )
{
  test.open( 'true' );

  test.case = 'strings';
  var got = _.strEquivalent( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.strEquivalent( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.strEquivalent( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.strEquivalent( /\w+/, /\w+/ );
  test.identical( got, true );

  test.case = 'string with and without spaces ';
  var got = _.strEquivalent( 'abc', ' abc ' );
  test.identical( got, true );

  test.case = 'string with and without newlines ';
  var got = _.strEquivalent( 'abc', '\nabc\n' );
  test.identical( got, true );

  test.case = 'string with identical newlines';
  var got = _.strEquivalent( '\na\nb\nc\n', '\na\nb\nc\n' );
  test.identical( got, true );

  test.case = 'strings with different newlines';
  var got = _.strEquivalent( '\n\nabc\n', '\nabc\n\n' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs';
  var got = _.strEquivalent( '      \t\n\nabc\n    ', '        \nabc\n\n\t\t           ' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs on each line';
  var got = _.strEquivalent( '      \t\na   \t\n\nb   \t   \n   \nc  \t     ', '        \na  \n  \n  \t   \nb  \t \n   \nc\t \n\n\t\t           ' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs on each line from both sides';
  var got = _.strEquivalent( '      \t\n  \ta   \t\n\n  \n\t  b   \t   \n   \n  \n  \t  c  \t     ', '        \n  \t a  \n  \n  \t   \n \n  b  \t \n   \n \t c \t \n \n \t \t           ' );
  test.identical( got, true );

  test.close( 'true' );

  /* - */

  test.open( 'false' );

  test.case = 'strings';
  var got = _.strEquivalent( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strEquivalent( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strEquivalent( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strEquivalent( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strEquivalent( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strEquivalent( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strEquivalent( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strEquivalent( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.case = 'diff strings with different newlines';
  var got = _.strEquivalent( '\n\nabc\nb', '\nabc\n\n' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs';
  var got = _.strEquivalent( '      \t\n\nabc\n    ', '        \nabc\n\n\t\t    c       ' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs on each line';
  var got = _.strEquivalent( '      \t\nab   \t\n\nb   \t   \n   \nc  \t     ', '        \na  \n  \n  \t   \nb  \t \n   \nc\t \n\n\t\t           ' );
  test.identical( got, false );

  test.close( 'false' );
}

//

function strsEquivalent( test )
{
  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.strsEquivalent( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.strsEquivalent( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.strsEquivalent( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalent( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.strsEquivalent( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strsEquivalent( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strsEquivalent( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strsEquivalent( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strsEquivalent( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalent( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalent( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalent( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vector, true' );

  test.case = 'vector, vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
  var got = _.strsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.case = 'vector, scalar';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = 'abc';
  var got = _.strsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.case = 'scalar, vector';
  var src1 = 'abc';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.close( 'vector, true' );

  /* - */

  test.open( 'vector, false' );

  test.case = 'vector, vector';
  var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/g ];
  var src2 = [ 'abc', 'abc', 'abc', /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ];
  var got = _.strsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, false, false, false, false, false ] );

  test.case = 'vector, scalar';
  var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
  var src2 = 'abc';
  var got = _.strsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, true, true, true, true, true ] );

  test.case = 'scalar, vector';
  var src1 = 'abc';
  var src2 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
  var got = _.strsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, true, true, true, true, true ] );

  test.close( 'vector, false' );
}

//

function strsEquivalentAll( test )
{
  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.strsEquivalentAll( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.strsEquivalentAll( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.strsEquivalentAll( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAll( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.strsEquivalentAll( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strsEquivalentAll( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strsEquivalentAll( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strsEquivalentAll( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strsEquivalentAll( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAll( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAll( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAll( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = 'abc';
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = /\w+/;
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc';
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+/;
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'bb', 'aa' ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc', 'aa', 'bb' ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/gi ];
  var got = _.strsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function strsEquivalentAny( test )
{

  /* - */

  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.strsEquivalentAny( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.strsEquivalentAny( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.strsEquivalentAny( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAny( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.strsEquivalentAny( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strsEquivalentAny( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strsEquivalentAny( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strsEquivalentAny( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strsEquivalentAny( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAny( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAny( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentAny( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var src2 = /\w+/;
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+\s\w/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/gi, /\w+/g ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'a', 'b' ];
  var src2 = [ 'ab', 'ab', 'aa', 'b' ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc d', 'aa d', 'bb d' ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc d', 'aa d', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc d';
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+\s/;
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+\s/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'b', 'a' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
  var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
  var got = _.strsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function strsEquivalentNone( test )
{

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.strsEquivalentNone( 'abc', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.strsEquivalentNone( /\w+/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.strsEquivalentNone( 'abc', /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentNone( /\w+/, /\w+/ );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.strsEquivalentNone( 'abd', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.strsEquivalentNone( /\s+/, 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.strsEquivalentNone( /\w/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.strsEquivalentNone( 'abc', /\s+/ );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.strsEquivalentNone( 'abc', /\w/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentNone( /\w*/, /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentNone( /\w+/g, /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.strsEquivalentNone( /\w+/g, /\w+/gi );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc d';
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+\s/;
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+\s/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'b', 'a' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
  var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var src2 = /\w+/;
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+\s\w/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/gi, /\w+/g ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'aa'+'a', 'bb' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc d', 'aa'+'a d', 'bb d' ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc d', 'aa'+'a d', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
  var got = _.strsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function strBeginOf( test )
{
  test.case = 'begin - empty string';
  var got = _.strBeginOf( 'abc', '' );
  var expected = '';
  test.identical( got, expected )

  test.case = 'begin - char';
  var got = _.strBeginOf( 'abc', 'c' );
  var expected = undefined;
  test.identical( got, expected )

  test.case = 'begin - two chars';
  var got = _.strBeginOf( 'abc', 'bc' );
  var expected = undefined;
  test.identical( got, expected )

  test.case = 'begin.length > src.length';
  var got = _.strBeginOf( 'abc', 'abcd' );
  var expected = undefined;
  test.identical( got, expected )

  test.case = 'begin.length === src.length, not equal';
  var got = _.strBeginOf( 'abc', 'cba' );
  var expected = undefined;
  test.identical( got, expected )

  test.case = 'begin.length === src.length, equal';
  var got = _.strBeginOf( 'abc', 'abc' );
  var expected = 'abc';
  test.identical( got, expected )

  test.case = 'begin - empty array';
  var got = _.strBeginOf( 'abc', [] );
  var expected = undefined;
  test.identical( got, expected )

  test.case = 'begin - array with empty string';
  var got = _.strBeginOf( 'abc', [ '' ] );
  var expected = '';
  test.identical( got, expected )

  test.case = 'begin - array strings, not begins';
  var got = _.strBeginOf( 'abcc'+'c', [ 'c', 'cc'+'c' ] );
  var expected = undefined;
  test.identical( got, expected )

  test.case = 'begin - array strings, begins';
  var got = _.strBeginOf( 'abc', [ 'a', 'ab', 'abc' ] );
  var expected = 'a';
  test.identical( got, expected )

  test.case = 'begin - array strings, not begins';
  var got = _.strBeginOf( 'abc', [ 'x', 'y', 'c' ] );
  var expected = undefined;
  test.identical( got, expected )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strBeginOf() );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strBeginOf( 1, '' ) );

  test.case = 'wrong type of begin';
  test.shouldThrowErrorSync( () => _.strBeginOf( 'abc', 1 ) );

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( () => _.strBeginOf( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strBeginOf( null, null ) );
}

//

function strEndOf( test )
{
  var got, expected;

  test.case = 'strEndOf';

  /**/

  got = _.strEndOf( 'abc', '' );
  expected = '';
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abc', 'a' );
  expected = undefined;
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abc', 'ab' );
  expected = undefined;
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abc', ' a' );
  expected = undefined;
  test.identical( got, expected )

  /* end.length > src.length */

  got = _.strEndOf( 'abc', 'abcd' );
  expected = undefined;
  test.identical( got, expected )

  /* same length */

  got = _.strEndOf( 'abc', 'cba' );
  expected = undefined;
  test.identical( got, expected )

  /* equal */

  got = _.strEndOf( 'abc', 'abc' );
  expected = 'abc';
  test.identical( got, expected )

  /* array */

  got = _.strEndOf( 'abc', [] );
  expected = undefined;
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abc', [ '' ] );
  expected = '';
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abcc'+'c', [ 'a', 'ab' ] );
  expected = undefined;
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abc', [ 'ab', 'abc' ] );
  expected = 'abc';
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abc', [ 'x', 'y', 'a' ] );
  expected = undefined;
  test.identical( got, expected )

  /**/

  got = _.strEndOf( 'abc', [ 'x', 'y', 'z' ] );
  expected = undefined;
  test.identical( got, expected )

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.strEndOf( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strEndOf( 'abc', 1 ) );
  test.shouldThrowErrorSync( () => _.strEndOf() );
  test.shouldThrowErrorSync( () => _.strEndOf( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strEndOf( null, null ) );

}

//

function strBegins( test )
{
  var got, expected;

  test.case = 'strBegins';

  /**/

  got = _.strBegins( '', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'a', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'a', 'a' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'a', 'b' );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', 'ab' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', 'abc' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', ' a' );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [ 'x', 'y', 'ab' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [ '' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [] );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strBegins( 'abc', [ '1', 'b', 'a' ] );
  expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.strBegins( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strBegins( 'a', 1 ) );
  test.shouldThrowErrorSync( () => _.strBegins( 'abc', [ 1, 'b', 'a' ] ) );

}

//

function strEnds( test )
{
  var got, expected;

  test.case = 'strEnds';

  /**/

  got = _.strEnds( '', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'a', '' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'a', 'a' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'a', 'b' );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', 'bc' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', 'abc' );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [ 'x', 'y', 'bc' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [ '' ] );
  expected = true;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [] );
  expected = false;
  test.identical( got, expected );

  /**/

  got = _.strEnds( 'abc', [ '1', 'b', 'c' ] );
  expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.strEnds( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strEnds( 'a', 1 ) );
}

// --
// converter
// --

function exportStringShallowDiagnostic( test )
{

  /* xxx qqq : for Yevhen : countable, non-vector cases? */

  test.case = 'number';
  var src = 1;
  var expected = '1';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  var expected = 'true';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 0;
  var expected = '0';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'fuzzy';
  var src = _.maybe;
  var expected = '{- Symbol maybe -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'bigint';
  var src = 10n;
  var expected = '10n';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'str & regexpLike';
  var src = 'str';
  var expected = 'str';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  var expected = '/hello/g';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  var expected = '{- ArgumentsArray with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var expected = '{- ArgumentsArray with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'unroll';
  var src = _.unrollMake([ 2, 3, 4 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  var expected = '{- Array with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'long & longLike';
  var src = _.longMake([ 1, 2 ]);
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'vector & vectorLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var expected = '{- countableConstructor.countable with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'countable & countableLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = countableMake( null, { elements : [], withIterator : 1 } );
  var expected = '{- Object.countable with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = `object countable - non empty, non-vector`;
  var src = countableMake( null, { elements : [ '1', '2', '3' ], withIterator : 1 } );
  var expected = '{- Object.countable with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Global & GlobalReal';
  var src = global;
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringShallowDiagnostic( src ), expected ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( global );
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringShallowDiagnostic( src ), expected ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike'; /* qqq for Yevhen : bad : this is aux! lack of Object & Countable cases | aaa : Added. */
  var src = { [ Symbol.iterator ] : 1 };
  var expected = '{- Object -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & Container & ContainerLike with `exportString` method';
  var src =
  {
    [ Symbol.iterator ] : 1,
    exportString : () => 'Custom string transformation'
  };
  var expected = 'Custom string transformation';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var expected = '{- Aux.polluted.prototyped with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted with `exportString` method';
  var src = { a : 1 };
  var proto =
  {
    b : 2,
    exportString : () => 'Custom string transformation'
  }
  Object.setPrototypeOf( src, proto )
  var expected = '{- Aux.polluted.prototyped with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with `exportString` method';
  var src = Object.create( null );
  src.exportString = () => 'Custom string transformation'
  var expected = '{- Map.pure with 1 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var expected = '{- Map.pure with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var expected = '{- Map.polluted with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src = { a : 1, b : 2, c : 3 };
  var expected = '{- Map.polluted with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'HashMap';
  var src = new HashMap();
  var expected = '{- HashMap with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'HashMap with 2 elems';
  var src = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var expected = '{- HashMap with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Set & SetLike';
  var src = new Set();
  var expected = '{- Set with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Set with 3 elems';
  var src = new Set([ 1, 2, 3 ]);
  var expected = '{- Set with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'BufferNode';
  var src = BufferNode.from( 'str' );
  var expected = '{- BufferNode with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  var expected = '{- BufferRaw -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  var expected = '{- BufferRawShared -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  var expected = '{- I8x with 20 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) );
  var expected = '{- DataView.constructible -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  var expected = '{- U8x with 20 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'err';
  var src = _.err( 'error' );
  var expected = '{- Error.constructible -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  var expected = 'Escape( 1 )';
  debugger;
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );
  debugger;

  test.case = 'interval & BufferTyped';
  var src = new F32x( 2 );
  var expected = '{- F32x with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'pair';
  var src = _.pair.make();
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'path & str';
  var src = '/a/b/';
  var expected = '/a/b/';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'propertyTransformer & filter';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var expected = '{- routine dstAndSrcOwn -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'propertyTransformer & mapper';
  var src = _.property.mapper[ 'assigning' ];
  var expected = '{- routine assigning -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'routine & routineLike';
  var src = routine;
  var expected = '{- routine routine -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'timer';
  var src = _.time._begin( Infinity );
  var expected = '{- Map.pure with 9 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );
  _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date( '2021-02-19T11:26:42.840Z' );
  var expected = '2021-02-19T11:26:42.840Z';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'null';
  var src = null;
  var expected = 'null';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'undefined';
  var src = undefined;
  var expected = 'undefined';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = '{- Symbol null -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = '{- Symbol undefined -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = '{- Symbol nothing -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'primitive';
  var src = 5;
  var expected = '5';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var expected = '{- Symbol a -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var expected = '{- Promise.constructible -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  var expected = '{- Readable.constructible -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  // test.case = 'console';
  // var src = console;
  // var expected = '{- Console.constructible with 1 elements -}';
  // test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  /* qqq : for Yevhen : introduce namespace::printer | aaa : Done. */
  test.case = 'Map polluted'; /* qqq : bad : for Yevhen : this is not printer! this is placeholder for printer. add cases with printers | aaa : Added. */
  var src = _global.logger;
  var expected = '{- Map.polluted with 9 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'printerLike';
  var src = new __.Logger();
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'printerLike with output to console';
  var src = new __.Logger({ output : console });
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'process';
  var src = process;
  var expected = '{- process.constructible -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  /* */

  test.open( 'option::widthLimit' );

  test.case = 'string, widthLimit 0';
  var src = '0123456'
  var expected = '0123456';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 0 } ), expected );

  test.case = 'string, widthLimit 1';
  var src = '0123456'
  var expected = '0';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 1 } ), expected );

  test.case = 'string, widthLimit 5';
  var src = '0123456'
  var expected = '01256';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 5 } ), expected );

  test.case = 'string, widthLimit > str.length';
  var src = '0123456'
  var expected = '0123456';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 10 } ), expected );

  /* */

  test.case = 'map, widthLimit 0';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 0 } ), expected );

  test.case = 'map, widthLimit 1';
  var src = Object.create( null );
  var expected = '{';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 1 } ), expected );

  test.case = 'map, widthLimit 10';
  var src = Object.create( null );
  var expected = '{- Mats -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 10 } ), expected );

  test.case = 'map, widthLimit > str.length';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src, { widthLimit : 100 } ), expected );


  test.close( 'option::widthLimit' );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructor( o )
  {
    return countableMake( this, o );
  }

  /* */

  function countableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  function routine () {}

}

//


function exportStringShallowCode( test )
{

  test.case = 'number';
  var src = 1;
  var expected = '1';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'bool & boolLike & fuzzy';
  var src = true;
  var expected = 'true';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'boolLike & number & fuzzyLike';
  var src = 0;
  var expected = '0';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'fuzzy';
  var src = _.maybe;
  var expected = 'Symbol.for( \'maybe\' )';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'bigint';
  var src = 10n;
  var expected = '10n';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'str & regexpLike';
  var src = 'str';
  var expected = '\'str\'';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = /hello/g;
  var expected = '/hello/g';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'ArgumentsArray & arrayLike';
  var src = _.argumentsArray.make();
  var expected = '{- ArgumentsArray with 0 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var expected = '{- ArgumentsArray with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'unroll';
  var src = _.unrollMake([ 2, 3, 4 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  var expected = '{- Array with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'long & longLike';
  var src = _.longMake([ 1, 2 ]);
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'vector & vectorLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var expected = '{- countableConstructor.countable with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'countable & countableLike';
  var src = new countableConstructor({ elements : [ '1', '10' ], withIterator : 1 });
  var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = countableMake( null, { elements : [], withIterator : 1 } );
  var expected = '{- Object.countable with 0 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = `object countable - non empty, non-vector`;
  var src = countableMake( null, { elements : [ '1', '2', '3' ], withIterator : 1 } );
  var expected = '{- Object.countable with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Global & GlobalReal';
  var src = global;
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringShallowCode( src ), expected ) );

  test.case = 'Global & GlobalDerived';
  var src = Object.create( global );
  var expected = '{- Aux.polluted.prototyped with ';
  test.true( _.strHas( _.entity.exportStringShallowCode( src ), expected ) );

  test.case = 'Object & ObjectLike & Container & ContainerLike'; /* qqq for Yevhen : bad : this is aux! lack of Object & Countable cases | aaa : Added. */
  var src = { [ Symbol.iterator ] : 1 };
  var expected = '{- Object -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & Container & ContainerLike with `exportString` method';
  var src =
  {
    [ Symbol.iterator ] : 1,
    exportString : () => 'Custom string transformation'
  };
  var expected = 'Custom string transformation';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = { a : 1 };
  Object.setPrototypeOf( src, { b : 2 } )
  var expected = '{- Aux.polluted.prototyped with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted with `exportString` method';
  var src = { a : 1 };
  var proto =
  {
    b : 2,
    exportString : () => 'Custom string transformation'
  }
  Object.setPrototypeOf( src, proto )
  var expected = '{- Aux.polluted.prototyped with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = Object.create( null );
  var expected = '{- Map.pure with 0 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with `exportString` method';
  var src = Object.create( null );
  src.exportString = () => 'Custom string transformation'
  var expected = '{- Map.pure with 1 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src = Object.create( null );
  src.a = 1;
  src.b = 2;
  var expected = '{- Map.pure with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = {};
  var expected = '{- Map.polluted with 0 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src = { a : 1, b : 2, c : 3 };
  var expected = '{- Map.polluted with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'HashMap';
  var src = new HashMap();
  var expected = '{- HashMap with 0 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'HashMap with 2 elems';
  var src = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var expected = '{- HashMap with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Set & SetLike';
  var src = new Set();
  var expected = '{- Set with 0 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Set with 3 elems';
  var src = new Set([ 1, 2, 3 ]);
  var expected = '{- Set with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'BufferNode';
  var src = BufferNode.from( 'str' );
  var expected = '{- BufferNode with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'BufferRaw';
  var src = new BufferRaw( 'str' );
  var expected = '{- BufferRaw -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'BufferRawShared';
  var src = new BufferRawShared( 'str' );
  var expected = '{- BufferRawShared -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'BufferTyped';
  var src = new I8x( 20 );
  var expected = '{- I8x with 20 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'BufferView';
  var src = new BufferView( new BufferRaw( 20 ) );
  var expected = '{- DataView.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'BufferBytes & BufferTyped';
  var src = new U8x( 20 );
  var expected = '{- U8x with 20 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'err';
  var src = _.err( 'error' );
  var expected = '{- Error.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'escape';
  var src = _.escape.make( 1 );
  var expected = 'Escape( 1 )';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'interval & BufferTyped';
  var src = new F32x( 2 );
  var expected = '{- F32x with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'pair';
  var src = _.pair.make();
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'path & str';
  var src = '/a/b/';
  var expected = '\'/a/b/\'';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'propertyTransformer & filter';
  var src = _.property.filter[ 'dstAndSrcOwn' ];
  var expected = '{- routine dstAndSrcOwn -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'propertyTransformer & mapper';
  var src = _.property.mapper[ 'assigning' ];
  var expected = '{- routine assigning -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'routine & routineLike';
  var src = routine;
  var expected = '{- routine routine -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'timer';
  var src = _.time._begin( Infinity );
  var expected = '{- Map.pure with 9 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );
  _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date( '2021-02-19T11:26:42.840Z' );
  var expected = 'new Date( \'2021-02-19T11:26:42.840Z\' )';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'null';
  var src = null;
  var expected = 'null';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'undefined';
  var src = undefined;
  var expected = 'undefined';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Symbol null';
  var src = _.null;
  var expected = 'Symbol.for( \'null\' )';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = 'Symbol.for( \'undefined\' )';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = 'Symbol.for( \'nothing\' )';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'primitive';
  var src = 5;
  var expected = '5';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var expected = 'Symbol.for( \'a\' )';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var expected = '{- Promise.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  var expected = '{- Readable.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  // test.case = 'console';
  // var src = console;
  // var expected = '{- Console.constructible with 1 elements -}';
  // test.identical( _.entity.exportStringShallowCode( src ), expected );

  /* qqq : for Yevhen : introduce namespace::printer | aaa : Done. */
  test.case = 'Map polluted'; /* qqq : bad : for Yevhen : this is not printer! this is placeholder for printer. add cases with printers | aaa : Added. */
  var src = _global.logger;
  var expected = '{- Map.polluted with 9 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'printerLike';
  var src = new __.Logger();
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'printerLike with output to console';
  var src = new __.Logger({ output : console });
  var expected = '{- wLoggerTop.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'process';
  var src = process;
  var expected = '{- process.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  /* - */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function countableConstructor( o )
  {
    return countableMake( this, o );
  }

  /* */

  function countableMake( dst, o )
  {
    if( dst === null )
    dst = Object.create( null );
    _.mapExtend( dst, o );
    if( o.withIterator )
    dst[ Symbol.iterator ] = _iterate;
    return dst;
  }

  function routine () {}

}

//

function strPrimitive( test ) /* qqq for Yevhen : extend */
{

  test.case = 'undefined';
  var src = undefined;
  var expected = undefined;
  var got = _.entity.strPrimitive( src );
  test.identical( got, expected );

  test.case = 'null';
  var src = null;
  var expected = undefined;
  var got = _.entity.strPrimitive( src );
  test.identical( got, expected );

  test.case = 'number';
  var src = 13;
  var expected = '13';
  var got = _.entity.strPrimitive( src );
  test.identical( got, expected );

  test.case = 'boolean';
  var src = false;
  var expected = 'false';
  var got = _.entity.strPrimitive( src );
  test.identical( got, expected );

  test.case = 'string';
  var src = 'abc';
  var expected = 'abc';
  var got = _.entity.strPrimitive( src );
  test.identical( got, expected );

}

//

/* qqq for Yevhen : extend */
function strTypeWithTraitsBasic( test )
{

  test.case = 'undefined';
  var src = undefined;
  var expected = 'Undefined';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'null';
  var src = null;
  var expected = 'Null';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'number int';
  var src = 13;
  var expected = 'Number';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'number NaN';
  var src = 13;
  var expected = 'Number';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'number Infinity';
  var src = Infinity;
  var expected = 'Number';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'boolean';
  var src = false;
  var expected = 'Boolean';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'string';
  var src = 'abc';
  var expected = 'String';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'array';
  var src = [ 1, 2, 3 ];
  var expected = 'Array';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'ArgumentsArray';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var expected = 'ArgumentsArray';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'routine';
  var src = () => {};
  var expected = 'Routine';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'symbol';
  var src = Symbol( 'id' );
  var expected = 'Symbol';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'map';
  var src = new Map();
  var expected = 'HashMap';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'set';
  var src = new Set();
  var expected = 'Set';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'polluted map';
  var src = { a : 1, b : 2, c : 3 };
  var expected = 'Map.polluted';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.a = 1;
  var expected = 'Map.pure';
  var got = _.entity.strTypeWithTraits( src );
  test.identical( got, expected );

}

//

/* qqq for Yevhen : extend */
function strTypeWithoutTraitsBasic( test )
{

  test.case = 'undefined';
  var src = undefined;
  var expected = 'Undefined';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'null';
  var src = null;
  var expected = 'Null';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'number int';
  var src = 13;
  var expected = 'Number';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'number NaN';
  var src = 13;
  var expected = 'Number';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'number Infinity';
  var src = Infinity;
  var expected = 'Number';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'boolean';
  var src = false;
  var expected = 'Boolean';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'string';
  var src = 'abc';
  var expected = 'String';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'array';
  var src = [ 1, 2, 3 ];
  var expected = 'Array';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'ArgumentsArray';
  var src = _.argumentsArray.make([ 1, 2, 3 ]);
  var expected = 'ArgumentsArray';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'routine';
  var src = () => {};
  var expected = 'Routine';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'symbol';
  var src = Symbol( 'id' );
  var expected = 'Symbol';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'map';
  var src = new Map();
  var expected = 'HashMap';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'set';
  var src = new Set();
  var expected = 'Set';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'polluted map';
  var src = { a : 1, b : 2, c : 3 };
  var expected = 'Map';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

  test.case = 'pure map';
  var src = Object.create( null );
  src.a = 1;
  var expected = 'Map';
  var got = _.entity.strTypeWithoutTraits( src );
  test.identical( got, expected );

}

//

function strTypeWithTraitsGeneratedObject( test )
{

  let sets =
  {
    withIterator : [ 0, 1 ],
    pure : [ 0, 1 ],
    withOwnConstructor : [ 0, 1 ],
    withConstructor : [ 0, 1 ],
    new : [ 0, 1 ],
  };
  let samples = _.eachSample_({ sets });

  for( let env of samples )
  eachCase( env );

  function eachCase( env )
  {
    var handled = false;
    test.case = `${toStr( env )}`;
    var src = _.object.forTesting( { elements : [ '1', '10' ], ... env } );

    if( env.new )
    {
      if( _.mapIsPure( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Map.pure' );
      else if( _.mapIsPolluted( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Map.polluted' );
      else if( _.aux.isPure( src ) && _.aux.isPrototyped( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Aux.pure.prototyped' );
      else if( _.aux.isPolluted( src ) && _.aux.isPrototyped( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Aux.polluted.prototyped' );
      else if( env.withConstructor && env.withIterator && env.pure )
      test.identical( _.entity.strTypeWithTraits( src ), 'countableConstructorPure.countable.constructible' );
      else if( env.withConstructor && env.withIterator && !env.pure )
      test.identical( _.entity.strTypeWithTraits( src ), 'countableConstructorPolluted.countable.constructible' );
      else if( env.withConstructor && env.pure )
      test.identical( _.entity.strTypeWithTraits( src ), 'countableConstructorPure.constructible' );
      else if( env.withConstructor && !env.pure )
      test.identical( _.entity.strTypeWithTraits( src ), 'countableConstructorPolluted.constructible' );
      else if( env.withIterator )
      test.identical( _.entity.strTypeWithTraits( src ), 'Object.countable' );
      else
      test.identical( _.entity.strTypeWithTraits( src ), 'Object' );

    }
    else
    {

      if( _.mapIsPure( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Map.pure' );
      else if( _.mapIsPolluted( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Map.polluted' );
      else if( _.aux.isPure( src ) && _.aux.isPrototyped( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Aux.pure.prototyped' );
      else if( _.aux.isPolluted( src ) && _.aux.isPrototyped( src ) )
      test.identical( _.entity.strTypeWithTraits( src ), 'Aux.polluted.prototyped' );
      else if( env.withIterator )
      test.identical( _.entity.strTypeWithTraits( src ), 'Object.countable' );
      else
      test.identical( _.entity.strTypeWithTraits( src ), 'Object' );

    }

    /* - */

  }

  function toStr( src )
  {
    return __.entity.exportStringSolo( src );
  }

}

//

function strTypeWithoutTraitsGeneratedObject( test )
{

  let sets =
  {
    withIterator : [ 0, 1 ],
    pure : [ 0, 1 ],
    withOwnConstructor : [ 0, 1 ],
    withConstructor : [ 0, 1 ],
    new : [ 0, 1 ],
  };
  let samples = _.eachSample_({ sets });

  for( let env of samples )
  eachCase( env );

  function eachCase( env )
  {
    var handled = false;
    test.case = `${toStr( env )}`;
    var src = _.object.forTesting( { elements : [ '1', '10' ], ... env } );

    if( env.new )
    {

      if( _.mapIs( src ) )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'Map' );
      else if( _.aux.is( src ) )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'Aux' );
      else if( env.withConstructor && env.withIterator && env.pure )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'countableConstructorPure' );
      else if( env.withConstructor && env.withIterator && !env.pure )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'countableConstructorPolluted' );
      else if( env.withConstructor && env.pure )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'countableConstructorPure' );
      else if( env.withConstructor && !env.pure )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'countableConstructorPolluted' );
      else
      test.identical( _.entity.strTypeWithoutTraits( src ), 'Object' );

    }
    else
    {

      if( _.mapIs( src ) )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'Map' );
      else if( _.aux.is( src ) )
      test.identical( _.entity.strTypeWithoutTraits( src ), 'Aux' );
      else
      test.identical( _.entity.strTypeWithoutTraits( src ), 'Object' );

    }

    /* - */

  }

  function toStr( src )
  {
    return __.entity.exportStringSolo( src );
  }

}

//

function strParseType( test )
{
  test.open( 'without name' );

  test.case = 'number';
  var src = '1';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'bool & boolLike & fuzzy';
  var src = 'true';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'boolLike & number & fuzzyLike';
  var src = '0';
  var expected = {}
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'fuzzy';
  var src = '{- Symbol maybe -}';
  var expected =
  {
    type : 'Symbol',
    name : 'maybe',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'bigint';
  var src = '10n';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'str & regexpLike';
  var src = 'str';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src = '/hello/g';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'ArgumentsArray & arrayLike';
  var src = '{- ArgumentsArray with 0 elements -}';
  var expected =
  {
    type : 'ArgumentsArray',
    traits : [],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src = '{- ArgumentsArray with 3 elements -}';
  var expected =
  {
    type : 'ArgumentsArray',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'unroll';
  var src = '{- Array.unroll with 3 elements -}';
  var expected =
  {
    type : 'Array',
    traits : [ 'unroll' ],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'array';
  var src = '{- Array with 3 elements -}';
  var expected =
  {
    type : 'Array',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'long & longLike';
  var src = '{- Array with 2 elements -}';
  var expected =
  {
    type : 'Array',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'vector & vectorLike';
  var src = '{- countableConstructor.countable with 2 elements -}';
  var expected =
  {
    type : 'countableConstructor',
    traits : [ 'countable' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'countable & countableLike';
  var src = '{- countableConstructor.countable.constructible with 2 elements -}';
  var expected =
  {
    type : 'countableConstructor',
    traits : [ 'countable', 'constructible' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = '{- Object.countable with 0 elements -}';
  var expected =
  {
    type : 'Object',
    traits : [ 'countable' ],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = `object countable - non empty, non-vector`;
  var src = '{- Object.countable with 3 elements -}';
  var expected =
  {
    type : 'Object',
    traits : [ 'countable' ],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Global & GlobalReal';
  var src = '{- Aux.polluted.prototyped with 20 elements -}';
  var expected =
  {
    type : 'Aux',
    traits : [ 'polluted', 'prototyped' ],
    length : 20
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Global & GlobalDerived';
  var src = '{- Aux.polluted.prototyped with 21 elements -}';
  var expected =
  {
    type : 'Aux',
    traits : [ 'polluted', 'prototyped' ],
    length : 21
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = '{- Object -}';
  var expected =
  {
    type : 'Object',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = '{- Aux.polluted.prototyped with 2 elements -}';
  var expected =
  {
    type : 'Aux',
    traits : [ 'polluted', 'prototyped' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = '{- Map.pure with 0 elements -}';
  var expected =
  {
    type : 'Map',
    traits : [ 'pure' ],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src = '{- Map.pure with 2 elements -}';
  var expected =
  {
    type : 'Map',
    traits : [ 'pure' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = '{- Map.polluted with 0 elements -}';
  var expected =
  {
    type : 'Map',
    traits : [ 'polluted' ],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src = '{- Map.polluted with 3 elements -}';
  var expected =
  {
    type : 'Map',
    traits : [ 'polluted' ],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'HashMap';
  var src = '{- HashMap with 0 elements -}';
  var expected =
  {
    type : 'HashMap',
    traits : [],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'HashMap with 2 elems';
  var src = '{- HashMap with 2 elements -}';
  var expected =
  {
    type : 'HashMap',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Set & SetLike';
  var src = '{- Set with 0 elements -}';
  var expected =
  {
    type : 'Set',
    traits : [],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Set with 3 elems';
  var src = '{- Set with 3 elements -}';
  var expected =
  {
    type : 'Set',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferNode';
  var src = '{- BufferNode with 3 elements -}';
  var expected =
  {
    type : 'BufferNode',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferRaw';
  var src = '{- BufferRaw -}';
  var expected =
  {
    type : 'BufferRaw',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferRawShared';
  var src = '{- BufferRawShared -}';
  var expected =
  {
    type : 'BufferRawShared',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferTyped';
  var src = '{- I8x with 20 elements -}';
  var expected =
  {
    type : 'I8x',
    traits : [],
    length : 20
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferView';
  var src = '{- DataView.constructible -}';
  var expected =
  {
    type : 'DataView',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferBytes & BufferTyped';
  var src = '{- U8x with 20 elements -}';
  var expected =
  {
    type : 'U8x',
    traits : [],
    length : 20
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'err';
  var src = '{- Error.constructible -}';
  var expected =
  {
    type : 'Error',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'escape';
  var src = 'Escape( 1 )';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'interval & BufferTyped';
  var src = '{- F32x with 2 elements -}';
  var expected =
  {
    type : 'F32x',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'pair';
  var src = '{- Array with 2 elements -}';
  var expected =
  {
    type : 'Array',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'path & str';
  var src = '/a/b/';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'propertyTransformer & filter';
  var src = '{- routine dstAndSrcOwn -}';
  var expected =
  {
    type : 'routine',
    name : 'dstAndSrcOwn',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'propertyTransformer & mapper';
  var src = '{- routine assigning -}';
  var expected =
  {
    type : 'routine',
    name : 'assigning',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'routine & routineLike';
  var src = '{- routine routine -}';
  var expected =
  {
    type : 'routine',
    name : 'routine',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'timer';
  var src = '{- Map.pure with 9 elements -}';
  var expected =
  {
    type : 'Map',
    traits : [ 'pure' ],
    length : 9
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'date & objectLike';
  var src = '2021-02-19T11:26:42.840Z';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'null';
  var src = 'null';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'undefined';
  var src = 'undefined';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol null';
  var src = '{- Symbol null -}';
  var expected =
  {
    type : 'Symbol',
    name : 'null',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol undefined';
  var src = '{- Symbol undefined -}';
  var expected =
  {
    type : 'Symbol',
    name : 'undefined',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol Nothing';
  var src = '{- Symbol nothing -}';
  var expected =
  {
    type : 'Symbol',
    traits : [],
    name : 'nothing',
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'primitive';
  var src = '5';
  var expected = {}
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol';
  var src = '{- Symbol a -}';
  var expected =
  {
    type : 'Symbol',
    name : 'a',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = '{- Promise.constructible -}';
  var expected =
  {
    type : 'Promise',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'stream';
  var src = '{- Readable.constructible -}';
  var expected =
  {
    type : 'Readable',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'printerLike';
  var src = '{- Map.polluted with 9 elements -}';
  var expected =
  {
    type : 'Map',
    traits : [ 'polluted' ],
    length : 9
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'process';
  var src = '{- process.constructible -}';
  var expected =
  {
    type : 'process',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.close( 'without name' );

  /* - */

  test.open( 'with name' );

  test.case = 'ArgumentsArray & arrayLike';
  var src = '{- ArgumentsArray name with 0 elements -}';
  var expected =
  {
    type : 'ArgumentsArray',
    traits : [],
    name : 'name',
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src = '{- ArgumentsArray name with 3 elements -}';
  var expected =
  {
    type : 'ArgumentsArray',
    name : 'name',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'unroll';
  var src = '{- Array.unroll name with 3 elements -}';
  var expected =
  {
    type : 'Array',
    name : 'name',
    traits : [ 'unroll' ],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'array';
  var src = '{- Array name with 3 elements -}';
  var expected =
  {
    type : 'Array',
    name : 'name',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'long & longLike';
  var src = '{- Array name with 2 elements -}';
  var expected =
  {
    type : 'Array',
    name : 'name',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'vector & vectorLike';
  var src = '{- countableConstructor.countable name with 2 elements -}';
  var expected =
  {
    type : 'countableConstructor',
    name : 'name',
    traits : [ 'countable' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'countable & countableLike';
  var src = '{- countableConstructor.countable.constructible name with 2 elements -}';
  var expected =
  {
    type : 'countableConstructor',
    name : 'name',
    traits : [ 'countable', 'constructible' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = '{- Object.countable name with 0 elements -}';
  var expected =
  {
    type : 'Object',
    name : 'name',
    traits : [ 'countable' ],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = `object countable - non empty, non-vector`;
  var src = '{- Object.countable name with 3 elements -}';
  var expected =
  {
    type : 'Object',
    name : 'name',
    traits : [ 'countable' ],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Global & GlobalReal';
  var src = '{- Aux.polluted.prototyped name with 20 elements -}';
  var expected =
  {
    type : 'Aux',
    name : 'name',
    traits : [ 'polluted', 'prototyped' ],
    length : 20
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Global & GlobalDerived';
  var src = '{- Aux.polluted.prototyped name with 21 elements -}';
  var expected =
  {
    type : 'Aux',
    name : 'name',
    traits : [ 'polluted', 'prototyped' ],
    length : 21
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src = '{- Object name -}';
  var expected =
  {
    type : 'Object',
    name : 'name',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src = '{- Aux.polluted.prototyped name with 2 elements -}';
  var expected =
  {
    type : 'Aux',
    name : 'name',
    traits : [ 'polluted', 'prototyped' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src = '{- Map.pure name with 0 elements -}';
  var expected =
  {
    type : 'Map',
    name : 'name',
    traits : [ 'pure' ],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure name with 2 elems';
  var src = '{- Map.pure name with 2 elements -}';
  var expected =
  {
    type : 'Map',
    name : 'name',
    traits : [ 'pure' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src = '{- Map.polluted name with 0 elements -}';
  var expected =
  {
    type : 'Map',
    name : 'name',
    traits : [ 'polluted' ],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped name with 3 elems';
  var src = '{- Map.polluted name with 3 elements -}';
  var expected =
  {
    type : 'Map',
    name : 'name',
    traits : [ 'polluted' ],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'HashMap';
  var src = '{- HashMap name with 0 elements -}';
  var expected =
  {
    type : 'HashMap',
    name : 'name',
    traits : [],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'HashMap name with 2 elems';
  var src = '{- HashMap name with 2 elements -}';
  var expected =
  {
    type : 'HashMap',
    name : 'name',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Set & SetLike';
  var src = '{- Set name with 0 elements -}';
  var expected =
  {
    type : 'Set',
    name : 'name',
    traits : [],
    length : 0
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Set with 3 elems';
  var src = '{- Set name with 3 elements -}';
  var expected =
  {
    type : 'Set',
    name : 'name',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferNode';
  var src = '{- BufferNode name with 3 elements -}';
  var expected =
  {
    type : 'BufferNode',
    name : 'name',
    traits : [],
    length : 3
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferRaw';
  var src = '{- BufferRaw name -}';
  var expected =
  {
    type : 'BufferRaw',
    name : 'name',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferRawShared';
  var src = '{- BufferRawShared name -}';
  var expected =
  {
    type : 'BufferRawShared',
    name : 'name',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferTyped';
  var src = '{- I8x name with 20 elements -}';
  var expected =
  {
    type : 'I8x',
    name : 'name',
    traits : [],
    length : 20
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferView';
  var src = '{- DataView.constructible name -}';
  var expected =
  {
    type : 'DataView',
    name : 'name',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'BufferBytes & BufferTyped';
  var src = '{- U8x name with 20 elements -}';
  var expected =
  {
    type : 'U8x',
    name : 'name',
    traits : [],
    length : 20
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'err';
  var src = '{- Error.constructible name -}';
  var expected =
  {
    type : 'Error',
    name : 'name',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'interval & BufferTyped';
  var src = '{- F32x name with 2 elements -}';
  var expected =
  {
    type : 'F32x',
    name : 'name',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'pair';
  var src = '{- Array name with 2 elements -}';
  var expected =
  {
    type : 'Array',
    name : 'name',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'path & str';
  var src = '/a/b/';
  var expected = {};
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'propertyTransformer & filter';
  var src = '{- routine dstAndSrcOwn -}';
  var expected =
  {
    type : 'routine',
    name : 'dstAndSrcOwn',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'propertyTransformer & mapper';
  var src = '{- routine assigning -}';
  var expected =
  {
    type : 'routine',
    name : 'assigning',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'routine & routineLike';
  var src = '{- routine routine -}';
  var expected =
  {
    type : 'routine',
    name : 'routine',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'timer';
  var src = '{- Map.pure name with 9 elements -}';
  var expected =
  {
    type : 'Map',
    name : 'name',
    traits : [ 'pure' ],
    length : 9
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol null';
  var src = '{- Symbol null -}';
  var expected =
  {
    type : 'Symbol',
    name : 'null',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol undefined';
  var src = '{- Symbol undefined -}';
  var expected =
  {
    type : 'Symbol',
    name : 'undefined',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol Nothing';
  var src = '{- Symbol nothing -}';
  var expected =
  {
    type : 'Symbol',
    traits : [],
    name : 'nothing',
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'Symbol';
  var src = '{- Symbol a -}';
  var expected =
  {
    type : 'Symbol',
    name : 'a',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = '{- Promise.constructible name -}';
  var expected =
  {
    type : 'Promise',
    name : 'name',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'stream';
  var src = '{- Readable.constructible name -}';
  var expected =
  {
    type : 'Readable',
    name : 'name',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'printerLike';
  var src = '{- Map.polluted name with 9 elements -}';
  var expected =
  {
    type : 'Map',
    name : 'name',
    traits : [ 'polluted' ],
    length : 9
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'process';
  var src = '{- process.constructible name -}';
  var expected =
  {
    type : 'process',
    name : 'name',
    traits : [ 'constructible' ],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.close( 'with name' );

  /* special */

  test.case = 'only type=with';
  var src = '{- with -}';
  var expected =
  {
    type : 'with',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'type=with and name=name';
  var src = '{- with name -}';
  var expected =
  {
    type : 'with',
    name : 'name',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'type=with and name=with';
  var src = '{- with with -}';
  var expected =
  {
    type : 'with',
    name : 'with',
    traits : [],
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'type=with, name=with, 2 elems';
  var src = '{- with with with 2 elements -}';
  var expected =
  {
    type : 'with',
    name : 'with',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'type=with and name, 2 elems';
  var src = '{- with name with 2 elements -}';
  var expected =
  {
    type : 'with',
    name : 'name',
    traits : [],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'type=with, traits and name, 2 elems';
  var src = '{- with.trait name with 2 elements -}';
  var expected =
  {
    type : 'with',
    name : 'name',
    traits : [ 'trait' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'type=with, trait=with and name, 2 elems';
  var src = '{- with.with name with 2 elements -}';
  var expected =
  {
    type : 'with',
    name : 'name',
    traits : [ 'with' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

  test.case = 'type=with, trait=with, name=with, 2 elems';
  var src = '{- with.with with with 2 elements -}';
  var expected =
  {
    type : 'with',
    name : 'with',
    traits : [ 'with' ],
    length : 2
  };
  test.identical( _.entity.strParseType( src ), expected );

}

//

function strConcat( test )
{

  test.case = 'srcs - empty array';
  var srcs = [];
  var got = _.strConcat( srcs );
  test.identical( got, '' );

  test.case = 'srcs - empty string';
  var srcs = '';
  debugger;
  var got = _.strConcat( srcs );
  debugger;
  test.identical( got, '' );

  test.case = 'srcs - not empty string';
  var srcs = 'str';
  var got = _.strConcat( srcs );
  test.identical( got, 'str' );

  /* - */

  test.open( 'type of src is not the String' );

  test.case = 'srcs - number';
  var srcs = 1;
  var got = _.strConcat( srcs );
  test.identical( got, '1' );

  test.case = 'srcs - function';
  var srcs = ( e ) => 'str';
  var got = _.strConcat( srcs );
  test.identical( got, 'str' );

  test.case = 'srcs - map';
  var srcs = { a : 2 };
  var got = _.strConcat( srcs );
  if( _.entity.exportStringFine )
  test.identical( got, '{ a : 2 }' );
  else
  test.identical( got, '{- Map.polluted with 1 elements -}' );

  test.case = 'srcs - BufferRaw';
  var srcs = new BufferRaw( 3 );
  var got = _.strConcat( srcs );
  if( _.entity.exportStringFine )
  test.identical( got, '( new U8x([ 0x0, 0x0, 0x0 ]) ).buffer' );
  else
  test.identical( got, '{- BufferRaw -}' );

  test.case = 'srcs - BufferTyped';
  var srcs = new U8x( [ 1, 2, 3 ] );
  var got = _.strConcat( srcs );
  if( _.entity.exportStringFine )
  test.identical( got, '( new Uint8Array([ 1, 2, 3 ]) )' );
  else
  test.identical( got, '{- U8x with 3 elements -}' );

  test.case = 'srcs - array';
  var srcs = [ 1, 2, 'str', 3, [ 2 ] ];
  var got = _.strConcat( srcs );
  if( _.entity.exportStringFine )
  test.identical( got, '1 2 str 3 [ 2 ]' );
  else
  test.identical( got, '1 2 str 3 {- Array with 1 elements -}' );

  test.case = 'srcs - unroll';
  var srcs = _.unrollMake( [ 1, 2, 'str', 3, [ 2 ] ] );
  var got = _.strConcat( srcs );
  if( _.entity.exportStringFine )
  test.identical( got, '1 2 str 3 [ 2 ]' );
  else
  test.identical( got, '1 2 str 3 {- Array with 1 elements -}' );

  test.case = 'srcs - unroll';
  var srcs = [ 1, 2, 'str', 3, _.unrollFrom([ 2 ]) ];
  var got = _.strConcat( srcs );
  if( _.entity.exportStringFine )
  test.identical( got, '1 2 str 3 [ 2 ]' );
  else
  test.identical( got, '1 2 str 3 {- Array.unroll with 1 elements -}' );

  test.close( 'type of src is not the String' );

  /* - */

  test.open( 'srcs - array of strings, common cases' );

  test.case = 'new line symbol in the string';
  var srcs =
  [
    'b',
    'variant:: : #83\n  path::local'
  ];
  var got = _.strConcat( srcs );
  test.identical( got, 'b variant:: : #83\n  path::local' );

  test.case = 'strings begin with spaces';
  var srcs = [ '  b', '    a:: : c', '    d::e' ];
  var got = _.strConcat( srcs );
  test.identical( got, '  b a:: : c d::e' );

  test.case = 'strings end with spaces';
  var srcs = [ 'b    ', 'variant:: : #83    ', 'path::local    ' ];
  var got = _.strConcat( srcs );
  test.identical( got, 'b variant:: : #83 path::local    ' );

  test.case = 'strings begin and end with spaces';
  var srcs = [ '    b    ', '    variant:: : #83    ', '    path::local    ' ];
  var got = _.strConcat( srcs );
  test.identical( got, '    b variant:: : #83 path::local    ' );

  test.case = 'strings begin with spaces, end with new line symbol';
  var srcs = [ '  b\n', '  variant:: : #83\n', '  path::local' ];
  var got = _.strConcat( srcs );
  test.identical( got, '  b\n  variant:: : #83\n  path::local' );

  test.case = 'strings begin with new line symbol, end with spaces';
  var srcs = [ '\nb    ', '\nvariant:: : #83    ', '\npath::local    ' ];
  var got = _.strConcat( srcs );
  test.identical( got, '\nb\nvariant:: : #83\npath::local    ' );

  test.case = 'strings begin and end with new line symbol';
  var srcs = [ '\nb\n', '\nvariant:: : #83\n', '\npath::local\n' ];
  var got = _.strConcat( srcs );
  test.identical( got, '\nb\n\nvariant:: : #83\n\npath::local\n' );

  test.case = 'strings begin and end with new line symbol';
  var srcs = [ '\nb\n', '\nvariant:: : #83\n', '\npath::local\n' ];
  var got = _.strConcat( srcs );
  test.identical( got, '\nb\n\nvariant:: : #83\n\npath::local\n' );

  test.case = 'strings begin with new line symbol, end with new line symbol and spaces';
  var srcs = [ '\nb\n    ', '\nvariant:: : #83\n    ', '\npath::local\n    ' ];
  var got = _.strConcat( srcs );
  test.identical( got, '\nb\n\nvariant:: : #83\n\npath::local\n    ' );

  test.case = 'strings begin with new line symbol and spaces, end with new line symbol';
  var srcs = [ '    \nb\n', '    \nvariant:: : #83\n', '    \npath::local\n' ];
  var got = _.strConcat( srcs );
  test.identical( got, '    \nb\n    \nvariant:: : #83\n    \npath::local\n' );

  test.case = 'strings begin with new line symbol and spaces, end with new line symbol';
  var srcs = [ '    \nb\n', '    \nvariant:: : #83\n', '    \npath::local\n' ];
  var got = _.strConcat( srcs );
  test.identical( got, '    \nb\n    \nvariant:: : #83\n    \npath::local\n' );

  test.case = 'strings begin with new line symbol and spaces, end with new line symbol and spaces';
  var srcs = [ '    \nb\n    ', '    \nvariant:: : #83\n    ', '    \npath::local\n    ' ];
  var got = _.strConcat( srcs );
  test.identical( got, '    \nb\n    \nvariant:: : #83\n    \npath::local\n    ' );

  test.close( 'srcs - array of strings, common cases' );

  /* - */

  test.case = 'lineDelimter - not default, lineDelimter at the end of lines, the spaces after lineDelimter';
  var srcs = [ 'a || ', 'b || ', 'c || ', 'd' ];
  var o = { lineDelimter : '||' };
  var got = _.strConcat( srcs, o );
  test.identical( got, 'a ||b ||c ||d' );

  test.case = 'lineDelimter - not default, the spaces after lineDelimter';
  var srcs = [ ' || a', '    || b', '  || c', '|d' ];
  var o = { lineDelimter : '||' };
  var got = _.strConcat( srcs, o );
  test.identical( got, ' || a || b || c |d' );

  /* */

  test.case = 'onToStr - not default, not uses options';
  var onToStr = ( src ) => String( src ) + 1;
  var srcs = [ 1, 2, 3, 4 ];
  var o = { onToStr };
  var got = _.strConcat( srcs, o );
  test.identical( got, '11 21 31 41' );

  test.case = 'onToStr - not default, uses options';
  var onToStr = ( src, o ) => String( src ) + o.lineDelimter;
  var srcs = [ 1, 2, 3, 4 ];
  var o = { onToStr };
  var got = _.strConcat( srcs, o );
  test.identical( got, '1\n2\n3\n4\n' );

  test.case = 'onToStr - not default, uses options from o.optionsForToStr';
  var onToStr = ( src, o ) => String( src ) + o.optionsForToStr.postfix;
  var srcs = [ 1, 2, 3, 4 ];
  var optionsForToStr = { postfix : '...' }
  var o = { onToStr, optionsForToStr };
  var got = _.strConcat( srcs, o );
  test.identical( got, '1... 2... 3... 4...' );

  /* */

  test.case = 'linePrefix, not uses lineDelimter';
  var srcs = [ 'a', 'b', 'c', 'd' ];
  var o = { linePrefix : '|| ' };
  var got = _.strConcat( srcs, o );
  test.identical( got, '|| a b c d' );

  test.case = 'linePrefix, lineDelimter';
  var srcs = [ 'a\n', 'b\n', 'c\n', 'd\n' ];
  var o = { linePrefix : '|| ' };
  var got = _.strConcat( srcs, o );
  test.identical( got, '|| a\n|| b\n|| c\n|| d\n|| ' );

  test.case = 'linePostfix, not uses lineDelimter';
  var srcs = [ 'a', 'b', 'c', 'd' ];
  var o = { linePostfix : ' ||' };
  var got = _.strConcat( srcs, o );
  test.identical( got, 'a b c d ||' );

  test.case = 'linePostfix, lineDelimter';
  var srcs = [ 'a\n', 'b\n', 'c\n', 'd\n' ];
  var o = { linePostfix : ' ||' };
  var got = _.strConcat( srcs, o );
  test.identical( got, 'a ||\nb ||\nc ||\nd ||\n ||' );

  test.case = 'linePrefix and linePostfix, not uses lineDelimter';
  var srcs = [ 'a', 'b', 'c', 'd' ];
  var o = { linePostfix : ' ||', linePrefix : '|| ' };
  var got = _.strConcat( srcs, o );
  test.identical( got, '|| a b c d ||' )

  test.case = 'linePrefix and linePostfix, lineDelimter';
  var srcs = [ 'a\n', 'b\n', 'c\n', 'd\n' ];
  var o = { linePostfix : ' ||', linePrefix : '|| ' };
  var got = _.strConcat( srcs, o );
  test.identical( got, '|| a ||\n|| b ||\n|| c ||\n|| d ||\n||  ||' );

  /* */

  test.case = 'onPairWithDelimeter - not default, lines without lineDelimter';
  var srcs = [ 'a', 'b', 'c', 'd' ];
  var onPairWithDelimeter = ( src1, src2 ) => src1 + ' ... ' + src2;
  var o = { onPairWithDelimeter };
  var got = _.strConcat( srcs, o );
  test.identical( got, 'a b c d' );

  test.case = 'onPairWithDelimeter - not default, lines with lineDelimter at the end of line';
  var srcs = [ 'a\n', 'b\n', 'c' ];
  var onPairWithDelimeter = ( src1, src2 ) => src1 + ' ... ' + src2;
  var o = { onPairWithDelimeter };
  var got = _.strConcat( srcs, o );
  test.identical( got, 'a\n ... b\n ... c' );

  test.case = 'onPairWithDelimeter - not default, lines with lineDelimter at the begin of line';
  var srcs = [ '\na', '\nb', '\nc' ];
  var onPairWithDelimeter = ( src1, src2 ) => src1 + ' ... ' + src2;
  var o = { onPairWithDelimeter };
  var got = _.strConcat( srcs, o );
  test.identical( got, '\na ... \nb ... \nc' );

  test.case = 'onPairWithDelimeter - not default, lines with lineDelimter at the begin and the end of line';
  var srcs = [ '\na\n', '\nb\n', '\nc\n' ];
  var onPairWithDelimeter = ( src1, src2 ) => src1 + ' ... ' + src2;
  var o = { onPairWithDelimeter };
  var got = _.strConcat( srcs, o );
  test.identical( got, '\na\n ... \nb\n ... \nc\n' );

  test.case = 'onPairWithDelimeter - not default, use options map, lines without lineDelimter';
  var srcs = [ 'a', 'b', 'c', 'd' ];
  var onPairWithDelimeter = ( src1, src2, o ) => src1 + o.optionsForToStr.prefix + src2;
  var o = { onPairWithDelimeter, optionsForToStr : { prefix : ' .. ' } };
  var got = _.strConcat( srcs, o );
  test.identical( got, 'a b c d' );

  test.case = 'onPairWithDelimeter - not default, use options map, lines with lineDelimter at the end of line';
  var srcs = [ 'a\n', 'b\n', 'c' ];
  var onPairWithDelimeter = ( src1, src2, o ) => src1 + o.optionsForToStr.prefix + src2;
  var o = { onPairWithDelimeter, optionsForToStr : { prefix : ' .. ' } };
  var got = _.strConcat( srcs, o );
  test.identical( got, 'a\n .. b\n .. c' );

  test.case = 'onPairWithDelimeter - not default, use options map, lines with lineDelimter at the begin of line';
  var srcs = [ '\na', '\nb', '\nc' ];
  var onPairWithDelimeter = ( src1, src2, o ) => src1 + o.optionsForToStr.prefix + src2;
  var o = { onPairWithDelimeter, optionsForToStr : { prefix : ' .. ' } };
  var got = _.strConcat( srcs, o );
  test.identical( got, '\na .. \nb .. \nc' );

  test.case = 'onPairWithDelimeter - not default, use options map, lines with lineDelimter at the begin and the end of line';
  var srcs = [ '\na\n', '\nb\n', '\nc\n' ];
  var onPairWithDelimeter = ( src1, src2, o ) => src1 + o.optionsForToStr.prefix + src2;
  var o = { onPairWithDelimeter, optionsForToStr : { prefix : ' .. ' } };
  var got = _.strConcat( srcs, o );
  test.identical( got, '\na\n .. \nb\n .. \nc\n' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strConcat() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strConcat( [ 'a' ], { lineDelimter : '\n' }, 'extra' ) );

  test.case = 'wrong type of options map o';
  test.shouldThrowErrorSync( () => _.strConcat( [ 'a' ], 'wrong' ) );

  test.case = 'unknown property in options map o';
  test.shouldThrowErrorSync( () => _.strConcat( [ 'a' ], { unknown : 1 } ) );

  test.case = 'property optionsForToStr in not a Aux';
  test.shouldThrowErrorSync( () => _.strConcat( [ 'a' ], { optionsForToStr : 1 } ) );
}

//

function strQuote( test )
{
  test.open( 'default quote' );

  test.case = 'src - empty string';
  var got = _.strQuote( '' );
  test.identical( got, '""' );

  test.case = 'src - number';
  var got = _.strQuote( 1 );
  test.identical( got, '"1"' );

  test.case = 'src - null';
  var got = _.strQuote( null );
  test.identical( got, '"null"' );

  test.case = 'src - undefined';
  var got = _.strQuote( undefined );
  test.identical( got, '"undefined"' );

  test.case = 'src - boolean';
  var got = _.strQuote( false );
  test.identical( got, '"false"' );

  test.case = 'src - string';
  var got = _.strQuote( 'str' );
  test.identical( got, '"str"' );

  // test.case = 'src - map';
  // var got = _.strQuote( { src : {} } );
  // test.identical( got, '"[object Object] "' );
  /* */
  // test.case = 'src - Set';
  // var got = _.strQuote( new Set() );
  // test.identical( got, '"[object Set] "' );
  /* */
  // test.case = 'src - BufferRaw';
  // var got = _.strQuote( new BufferRaw( 10 ) );
  // test.identical( got, '"[object ArrayBuffer] "' );

  test.case = 'src - empty array';
  var got = _.strQuote( [] );
  test.identical( got, [] );

  test.case = 'src - array with elements';
  var got = _.strQuote( [ 0, '', undefined, null, true, 'str' ] );
  test.identical( got, [ '"0"', '""', '"undefined"', '"null"', '"true"', '"str"' ] );

  test.case = 'src - array with elements, quote - null';
  var got = _.strQuote( [ 0, '', undefined, null, true, 'str' ] );
  test.identical( got, [ '"0"', '""', '"undefined"', '"null"', '"true"', '"str"' ] );

  /* */

  test.case = 'src - empty string';
  var got = _.strQuote( { src : '' } );
  test.identical( got, '""' );

  test.case = 'src - number';
  var got = _.strQuote( { src : 1 } );
  test.identical( got, '"1"' );

  test.case = 'src - null';
  var got = _.strQuote( { src : null } );
  test.identical( got, '"null"' );

  test.case = 'src - undefined';
  var got = _.strQuote( { src : undefined } );
  test.identical( got, '"undefined"' );

  test.case = 'src - boolean';
  var got = _.strQuote( { src : false } );
  test.identical( got, '"false"' );

  test.case = 'src - string';
  var got = _.strQuote( { src : 'str' } );
  test.identical( got, '"str"' );

  test.case = 'src - empty array';
  var got = _.strQuote( { src : [] } );
  test.identical( got, [] );

  test.case = 'src - array with elements';
  var got = _.strQuote( { src : [ 0, '', undefined, null, true, 'str' ] } );
  test.identical( got, [ '"0"', '""', '"undefined"', '"null"', '"true"', '"str"' ] );

  test.case = 'src - array with elements, quote - null';
  var got = _.strQuote( { src : [ 0, '', undefined, null, true, 'str' ], quote : null } );
  test.identical( got, [ '"0"', '""', '"undefined"', '"null"', '"true"', '"str"' ] );

  test.close( 'default quote' );

  /* - */

  test.open( 'passed quote' );

  test.case = 'src - empty string';
  var got = _.strQuote( '', '`' );
  test.identical( got, '``' );

  test.case = 'src - number';
  var got = _.strQuote( 1, '--' );
  test.identical( got, '--1--' );

  test.case = 'src - null';
  var got = _.strQuote( null, '**' );
  test.identical( got, '**null**' );

  test.case = 'src - undefined';
  var got = _.strQuote( undefined, '||' );
  test.identical( got, '||undefined||' );

  test.case = 'src - boolean';
  var got = _.strQuote( false, '' );
  test.identical( got, 'false' );

  test.case = 'src - string';
  var got = _.strQuote( 'str', '_' );
  test.identical( got, '_str_' );

  test.case = 'src - empty array';
  var got = _.strQuote( [], 'a' );
  test.identical( got, [] );

  test.case = 'src - array with elements';
  var got = _.strQuote( [ 0, '', undefined, null, true, 'str' ], '"' );
  test.identical( got, [ '"0"', '""', '"undefined"', '"null"', '"true"', '"str"' ] );

  /* */

  test.case = 'src - empty string';
  var got = _.strQuote( { src : '', quote : '\'' } );
  test.identical( got, '\'\'' );

  test.case = 'src - number';
  var got = _.strQuote( { src : 1, quote : '``' } );
  test.identical( got, '``1``' );

  test.case = 'src - null';
  var got = _.strQuote( { src : null, quote : '**' } );
  test.identical( got, '**null**' );

  test.case = 'src - undefined';
  var got = _.strQuote( { src : undefined, quote : '|' } );
  test.identical( got, '|undefined|' );

  test.case = 'src - boolean';
  var got = _.strQuote( { src : false, quote : '\'' } );
  test.identical( got, '\'false\'' );

  test.case = 'src - string';
  var got = _.strQuote( { src : 'str', quote : '""' } );
  test.identical( got, '""str""' );

  test.case = 'src - empty array';
  var got = _.strQuote( { src : [], quote : '"' } );
  test.identical( got, [] );

  test.case = 'src - array with elements';
  var got = _.strQuote( { src : [ 0, '', undefined, null, true, 'str' ], quote : '"' } );
  test.identical( got, [ '"0"', '""', '"undefined"', '"null"', '"true"', '"str"' ] );

  test.close( 'passed quote' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strQuote() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strQuote( 'a', '"', 'extra' ) );

  test.case = 'unnacessary fields in options map';
  test.shouldThrowErrorSync( () => _.strQuote( { src : 'a', quote : '"', dst : [] } ) );
}

//

function strUnquote( test )
{
  test.open( 'default quote' );

  test.case = 'src - empty string';
  var got = _.strUnquote( '' );
  test.identical( got, '' );

  test.case = 'src - not quoted string';
  var got = _.strUnquote( 'abc' );
  test.identical( got, 'abc' );

  test.case = 'src - single quote';
  var got = _.strUnquote( '"abc' );
  test.identical( got, '"abc' );

  test.case = 'src - string with quotes';
  var got = _.strUnquote( '"", `abc` \'\'' );
  test.identical( got, '"", `abc` \'\'' );

  test.case = 'src - quoted string';
  var got = _.strUnquote( '"abc"' );
  test.identical( got, 'abc' );

  test.case = 'src - twice quoted string';
  var got = _.strUnquote( '""abc""' );
  test.identical( got, '"abc"' );

  test.case = 'src - empty array';
  var got = _.strUnquote( [] );
  test.identical( got, [] );

  test.case = 'src - array of strings';
  var got = _.strUnquote( [ 'a', '"b"', '`c`', '\'d\'', '""abc""' ] );
  test.identical( got, [ 'a', 'b', 'c', 'd', '"abc"' ] );

  test.case = 'src - array of strings, quote - null';
  var got = _.strUnquote( [ 'a', '"b"', '`c`', '\'d\'', '""abc""' ], null );
  test.identical( got, [ 'a', 'b', 'c', 'd', '"abc"' ] );

  /* */

  test.case = 'src - empty string';
  var got = _.strUnquote( { src : '' } );
  test.identical( got, '' );

  test.case = 'src - not quoted string';
  var got = _.strUnquote( { src : 'abc' } );
  test.identical( got, 'abc' );

  test.case = 'src - single quote';
  var got = _.strUnquote( { src : '"abc' } );
  test.identical( got, '"abc' );

  test.case = 'src - string with quotes';
  var got = _.strUnquote( { src : '"", `abc` \'\'' } );
  test.identical( got, '"", `abc` \'\'' );

  test.case = 'src - quoted string';
  var got = _.strUnquote( { src : '"abc"' } );
  test.identical( got, 'abc' );

  test.case = 'src - twice quoted string';
  var got = _.strUnquote( { src : '""abc""' } );
  test.identical( got, '"abc"' );

  test.case = 'src - empty array';
  var got = _.strUnquote( { src : [] } );
  test.identical( got, [] );

  test.case = 'src - array of strings';
  var got = _.strUnquote( { src : [ 'a', '"b"', '`c`', '\'d\'', '""abc""' ] } );
  test.identical( got, [ 'a', 'b', 'c', 'd', '"abc"' ] );

  test.case = 'src - array of strings, quote - null';
  var got = _.strUnquote( { src : [ 'a', '"b"', '`c`', '\'d\'', '""abc""' ], quote : null } );
  test.identical( got, [ 'a', 'b', 'c', 'd', '"abc"' ] );

  test.close( 'default quote' );

  /* - */

  test.open( 'passed quote' );

  test.case = 'src - empty string';
  var got = _.strUnquote( '', '*' );
  test.identical( got, '' );

  test.case = 'src - not quoted string';
  var got = _.strUnquote( 'abc', '' );
  test.identical( got, 'abc' );

  test.case = 'src - single quote';
  var got = _.strUnquote( '"abc', '`' );
  test.identical( got, '"abc' );

  test.case = 'src - string with quotes';
  var got = _.strUnquote( '**"", `abc` \'\'**', '**' );
  test.identical( got, '"", `abc` \'\'' );

  test.case = 'src - quoted string';
  var got = _.strUnquote( '"abc"', '\'' );
  test.identical( got, '"abc"' );

  test.case = 'src - twice quoted string';
  var got = _.strUnquote( '""abc""', '`' );
  test.identical( got, '""abc""' );

  test.case = 'src - empty array';
  var got = _.strUnquote( [], '|' );
  test.identical( got, [] );

  test.case = 'src - array of strings';
  var got = _.strUnquote( [ 'a', '"b"', '`c`', '\'d\'', '""abc""' ], '`' );
  test.identical( got, [ 'a', '"b"', 'c', '\'d\'', '""abc""' ] );

  /* */

  test.case = 'src - empty string';
  var got = _.strUnquote( { src : '', quote : '""' } );
  test.identical( got, '' );

  test.case = 'src - not quoted string';
  var got = _.strUnquote( { src : 'abc', quote : '' } );
  test.identical( got, 'abc' );

  test.case = 'src - single quote';
  var got = _.strUnquote( { src : '"abc', quote : '"' } );
  test.identical( got, '"abc' );

  test.case = 'src - string with quotes';
  var got = _.strUnquote( { src : '"", `abc` \'\'', quote : '\'' } );
  test.identical( got, '"", `abc` \'\'' );

  test.case = 'src - quoted string';
  var got = _.strUnquote( { src : '"abc"', quote : '`' } );
  test.identical( got, '"abc"' );

  test.case = 'src - twice quoted string';
  var got = _.strUnquote( { src : '""abc""', quote : '""' } );
  test.identical( got, 'abc' );

  test.case = 'src - empty array';
  var got = _.strUnquote( { src : [], quote : '""' } );
  test.identical( got, [] );

  test.case = 'src - array of strings';
  var got = _.strUnquote( { src : [ 'a', '"b"', '`c`', '\'d\'', '""abc""' ], quote : '`' } );
  test.identical( got, [ 'a', '"b"', 'c', '\'d\'', '""abc""' ] );

  test.close( 'passed quote' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strUnquote() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strUnquote( '"str"', '"', 'extra' ) );

  test.case = 'unnacessary fields in options map';
  test.shouldThrowErrorSync( () => _.strUnquote( { src : '"abc"', quote : '"', dst : [] } ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strUnquote( 1 ) );
  test.shouldThrowErrorSync( () => _.strUnquote( { src : 1, quote : '"', dst : [] } ) );
}

//

function strQuotePairsNormalize( test )
{
  test.case = 'quote - true';
  var got = _.strQuotePairsNormalize( true );
  var expected =
  [
    [ '"', '"' ],
    [ '`', '`' ],
    [ '\'', '\'' ]
  ];
  test.identical( got, expected );

  test.case = 'quote - boolLike';
  var got = _.strQuotePairsNormalize( 1 );
  var expected =
  [
    [ '"', '"' ],
    [ '`', '`' ],
    [ '\'', '\'' ]
  ];
  test.identical( got, expected );

  test.case = 'quote - empty string';
  var got = _.strQuotePairsNormalize( '' );
  var expected = [ [ '', '' ] ];
  test.identical( got, expected );

  test.case = 'quote - space';
  var got = _.strQuotePairsNormalize( ' ' );
  var expected = [ [ ' ', ' ' ] ];
  test.identical( got, expected );

  test.case = 'quote - new line symbol';
  var got = _.strQuotePairsNormalize( '\n' );
  var expected = [ [ '\n', '\n' ] ];
  test.identical( got, expected );

  test.case = 'quote - string';
  var got = _.strQuotePairsNormalize( 'str' );
  var expected = [ [ 'str', 'str' ] ];
  test.identical( got, expected );

  test.case = 'quote - array with strings';
  var got = _.strQuotePairsNormalize( [ '', ' ', '\n', 'str' ] );
  var expected =
  [
    [ '', '' ],
    [ ' ', ' ' ],
    [ '\n', '\n' ],
    [ 'str', 'str' ]
  ];
  test.identical( got, expected );

  test.case = 'quote - array with duplicated strings';
  var got = _.strQuotePairsNormalize( [ '', '', ' ',  ' ', '\n', '\n', 'str', 'str' ] );
  var expected =
  [
    [ '', '' ], [ '', '' ],
    [ ' ', ' ' ], [ ' ', ' ' ],
    [ '\n', '\n' ], [ '\n', '\n' ],
    [ 'str', 'str' ], [ 'str', 'str' ]
  ];
  test.identical( got, expected );

  test.case = 'quote - array with quete pairs';
  var got = _.strQuotePairsNormalize( [ [ '', '' ], [ ' ',  ' ' ], [ '\n', '\n' ], [ 'str', 'str' ] ] );
  var expected =
  [
    [ '', '' ],
    [ ' ', ' ' ],
    [ '\n', '\n' ],
    [ 'str', 'str' ]
  ];
  test.identical( got, expected );

  test.case = 'quote - mixed array with quete pairs and strings';
  var got = _.strQuotePairsNormalize( [ [ '', '' ], '', [ ' ',  ' ' ], '""', [ '\n', '\n' ], '\t', [ 'str', 'str' ], 'src' ] );
  var expected =
  [
    [ '', '' ], [ '', '' ],
    [ ' ', ' ' ], [ '""', '""' ],
    [ '\n', '\n' ], [ '\t', '\t' ],
    [ 'str', 'str' ], [ 'src', 'src' ]
  ];
  test.identical( got, expected );

  test.case = 'quote - array with mixed quete pairs';
  var got = _.strQuotePairsNormalize( [ [ '', '""' ], [ ' ',  '\t' ], [ '\n', '\r' ], [ 'str', 'src' ] ] );
  var expected =
  [
    [ '', '""' ],
    [ ' ', '\t' ],
    [ '\n', '\r' ],
    [ 'str', 'src' ]
  ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( '"', 'extra' ) );

  test.case = 'wrong type of quete';
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( { '' : '' } ) );
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( null ) );

  test.case = 'wrong type of quete in array';
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( [ ',', 1 ] ) );
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( [ '""', [ ',', {} ] ] ) );

  test.case = 'quote pair is not pair';
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( [ [ '', '', 'str' ] ] ) );

  test.case = 'boolLike argument - false';
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( false ) );
  test.shouldThrowErrorSync( () => _.strQuotePairsNormalize( 0 ) );
}

//

function strQuoteAnalyze( test )
{

  test.case = 'empty';
  var expected =
  {
    ranges : [],
    quotes : [],
  };
  var got = _.strQuoteAnalyze( '' );
  test.identical( got, expected );

  test.case = 'no quote';
  var expected =
  {
    ranges : [],
    quotes : [],
  };
  var got = _.strQuoteAnalyze( 'a b c' );
  test.identical( got, expected );

  test.case = 'left "';
  var expected =
  {
    ranges : [ 0, 4 ],
    quotes : [ '"' ],
  };
  var got = _.strQuoteAnalyze( '"a b" c' );
  test.identical( got, expected );

  test.case = 'mid "';
  var expected =
  {
    ranges : [ 1, 5 ],
    quotes : [ '"' ],
  };
  var got = _.strQuoteAnalyze( 'a" b "c' );
  test.identical( got, expected );

  test.case = 'right "';
  var expected =
  {
    ranges : [ 2, 6 ],
    quotes : [ '"' ],
  };
  var got = _.strQuoteAnalyze( 'a "b c"' );
  test.identical( got, expected );

  test.case = 'several';
  var expected =
  {
    ranges : [ 0, 3, 4, 8 ],
    quotes : [ '`', '"' ],
  };
  var got = _.strQuoteAnalyze( '`a `"b c"`' );
  test.identical( got, expected );

  test.case = 'several empty';
  var expected =
  {
    ranges : [ 0, 1, 2, 5, 6, 7, 8, 12, 13, 14, 15, 16 ],
    quotes : [ '"', '`', '"', '"', '`', '"' ],
  };
  var got = _.strQuoteAnalyze( '""`a `"""b c"``""' );
  test.identical( got, expected );

  test.case = 'src = string, quote - null ';
  var expected =
  {
    ranges : [ 1, 5, 6, 9 ],
    quotes : [ '\'', '`' ]
  };
  var got = _.strQuoteAnalyze( 'a\', b\'`,c` \"', null );
  test.identical( got, expected );

  test.case = 'src = string, quote - "\'" ';
  var expected =
  {
    ranges : [ 1, 5 ],
    quotes : [ '\'' ]
  };
  var got = _.strQuoteAnalyze( 'a\', b\'`,c` \"', '\'' );
  test.identical( got, expected );

  test.case = 'src = string, quote - array with quotes';
  var expected =
  {
    ranges : [ 1, 5, 6, 9 ],
    quotes : [ '\'', '`' ]
  };
  var got = _.strQuoteAnalyze( 'a\', b\'`,c` \"', [ '\'', '`' ] );
  test.identical( got, expected );

  test.case = 'src = string, quote - array with pairs of quotes';
  var expected =
  {
    ranges : [ 1, 5, 6, 9 ],
    quotes : [ '\'', '`' ]
  };
  var got = _.strQuoteAnalyze( 'a\', b\'`,c` \"', [ [ '\'', '\'' ], '`' ] );
  test.identical( got, expected );

  test.case = 'src = string, quote - string';
  var expected =
  {
    ranges : [ 0, 4, 7, 11 ],
    quotes : [ '--', '--' ]
  };
  var got = _.strQuoteAnalyze( '--aa-- --bb--``\'\'\"\",,cc,,', '--' );
  test.identical( got, expected );

  test.case = 'src = string, quote - pairs of different strings';
  var expected =
  {
    ranges : [ 0, 4 ],
    quotes : [ '**' ]
  };
  var got = _.strQuoteAnalyze( '**aa--- --bb--``\'\'\"\",,cc,,', [ [ '**', '---' ] ] );
  test.identical( got, expected );

  test.case = 'options map "';
  var expected =
  {
    ranges : [ 1, 5 ],
    quotes : [ '"' ],
  };
  var got = _.strQuoteAnalyze({ src : 'a" b "c', quote : [ '"', '`', '\'' ] });
  test.identical( got, expected );

  test.case = 'options map quote:``';
  var expected =
  {
    ranges : [ 1, 6 ],
    quotes : [ '``' ],
  };
  var got = _.strQuoteAnalyze({ src : 'a`` b ``c', quote : [ '"', '``', '\'' ] });
  test.identical( got, expected );

  test.case = 'options map quote:1';
  var expected =
  {
    ranges : [ 1, 4, 5, 8 ],
    quotes : [ '`', '"' ],
  };
  var got = _.strQuoteAnalyze({ src : 'a` b`" c"', quote : 1 });
  test.identical( got, expected );

  test.case = 'pair';
  var expected =
  {
    ranges : [ 1, 6 ],
    quotes : [ '``' ],
  };
  var got = _.strQuoteAnalyze({ src : 'a`` b ""c', quote : [ '"', [ '``', '""' ], '\'' ] });
  test.identical( got, expected );

  test.case = 'pair reverted';
  var expected =
  {
    ranges : [ 1, 2 ],
    quotes : [ '"' ],
  };
  var got = _.strQuoteAnalyze({ src : 'a"" b ``c', quote : [ '"', [ '``', '""' ], '\'' ] });
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strQuoteAnalyze() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strQuoteAnalyze( '\'a\'"b"`c`', null, 'extra' ) );

  test.case = 'wrong types of quote';
  test.shouldThrowErrorSync( () => _.strQuoteAnalyze( '\'a\'"b"`c`', {} ) );
}

//

function strInsideOf( test )
{
  test.open( 'string' );

  test.case = 'src - empty string, begin - empty string, end - empty string';
  var got = _.strInsideOf( '', '', '' );
  test.identical( got, '' );

  test.case = 'src - empty string, begin - empty string, end - !!!';
  var got = _.strInsideOf( '', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - empty string';
  var got = _.strInsideOf( '', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - !!!';
  var got = _.strInsideOf( '', '!!!', '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, begin - empty string, end - empty string';
  var got = _.strInsideOf( 'str', '', '' );
  test.identical( got, 'str' );

  test.case = 'src - string, begin - empty string, end - empty string';
  var got = _.strInsideOf( 'str', 's', 'r' );
  test.identical( got, 't' );

  test.case = 'src - string, begin - empty string, end - empty string';
  var got = _.strInsideOf( 'sstrr', 's', 'r' );
  test.identical( got, 'str' );

  test.case = 'src - string, begin - empty string, end - !!!, not equal';
  var got = _.strInsideOf( 'str', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - string, begin - !!!, not equal, end - empty string';
  var got = _.strInsideOf( 'str', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - string, begin - !!!, not equal, end - !!!, not equal';
  var got = _.strInsideOf( 'str', '!!!', '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, almost equal, begin - empty string, end - !!!';
  var got = _.strInsideOf( '!!!str!!!', '', '!!!' );
  test.identical( got, '!!!str' );

  test.case = 'src - string, almost equal, begin - !!!, end - empty string';
  var got = _.strInsideOf( '!!!str!!!', '!!!', '' );
  test.identical( got, 'str!!!' );

  test.case = 'src - string, almost equal, begin - !!!, end - !!!';
  var got = _.strInsideOf( '!!!str!!!', '!!!', '!!!' );
  test.identical( got, 'str' );

  /* */

  test.case = 'src - string, little difference, begin - empty string, end - !!!';
  var got = _.strInsideOf( '!!str!!', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - string, little difference, begin - !!!, end - empty string';
  var got = _.strInsideOf( '!!str!!', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - string, little difference, begin - !!!, end - !!!';
  var got = _.strInsideOf( '!!str!!', '!!!', '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, equals inside string, begin - empty string, end - !!!';
  var got = _.strInsideOf( 'str!!!str!!!str', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - string, equals inside string, begin - !!!, end - empty string';
  var got = _.strInsideOf( 'str!!!str!!!str', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - string, equals inside string, begin - !!!, end - !!!';
  var got = _.strInsideOf( 'str!!!str!!!str', '!!!', '!!!' );
  test.identical( got, undefined );

  test.close( 'string' );

  /* - */

  test.open( 'array' );

  test.case = 'src - empty string, begin - empty strings, end - empty strings';
  var got = _.strInsideOf( '', [ '', '', '' ], [ '', '', '' ] );
  test.identical( got, '' );

  test.case = 'src - empty string, begin - empty strings, end - !!!';
  var got = _.strInsideOf( '', [ '', '' ], [ '!!!', '!!!' ] );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - empty strings';
  var got = _.strInsideOf( '', [ '!!!', '!!!' ], [ '', '' ] );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - !!!';
  var got = _.strInsideOf( '', [ '!!!', '!!!' ], [ '!!!', '!!!' ] );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, begin - empty strings, end - empty strings';
  var got = _.strInsideOf( 'str', [ '', '', '' ], [ '', '', '' ] );
  test.identical( got, 'str' );

  test.case = 'src - string, begin - strings, end - strings, partial occurrence';
  var got = _.strInsideOf( 'str', [ 's', 't', 'r' ], [ 'r', 't', 's' ] );
  test.identical( got, 't' );

  test.case = 'src - string, begin - strings, end - strings, partial occurrence';
  var got = _.strInsideOf( 'str', [ 'str', 't', 'r' ], [ 'tr', 't', 's' ] );
  test.identical( got, 'tr' );

  test.case = 'src - string, begin - strings, end - strings full occurrence';
  var got = _.strInsideOf( 'str', [ 'str', 't', 'r' ], [ 'str', 't', 's' ] );
  test.identical( got, 'str' );

  test.case = 'src - string, begin - empty strings, end - empty strings';
  var got = _.strInsideOf( 'str', [ 'str', 't', 'r' ], [ 'tr', 't', 's' ] );
  test.identical( got, 'tr' );

  test.case = 'src - string, begin - empty string, end - mixed, not equal';
  var got = _.strInsideOf( 'str', [ '' ], [ '!!!', 'q', 'b' ] );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - empty string';
  var got = _.strInsideOf( 'str', [ '!!!', 'q', 'b' ], [ '' ] );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - mixed, not equal';
  var got = _.strInsideOf( 'str', [ '!!!', 'q', 'b' ], [ '!!!', 'q', 'b' ] );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, almost equal, begin - empty string, end - mix';
  var got = _.strInsideOf( '!!!str!!!', [ '' ], [ '!', '!!', '!!!' ] );
  test.identical( got, '!!!str!!' );

  test.case = 'src - string, almost equal, begin - mixed, end - empty string';
  var got = _.strInsideOf( '!!!str!!!', [ '!', '!!', '!!!' ], [ '' ] );
  test.identical( got, '!!str!!!' );

  test.case = 'src - string, almost equal, begin - mixed, end - mixed';
  var got = _.strInsideOf( '!!!str!!!', [ '!', '!!', '!!!' ], [ '!', '!!', '!!!' ] );
  test.identical( got, '!!str!!' );

  /* */

  test.case = 'src - string, little difference, begin - empty string, end - mixed';
  var got = _.strInsideOf( '!!str!!', [ '' ], [ '!!!', '!!' ] );
  test.identical( got, '!!str' );

  test.case = 'src - string, little difference, begin - mixed, end - empty string';
  var got = _.strInsideOf( '!!str!!', [ '!!!', '!!' ], [ '' ] );
  test.identical( got, 'str!!' );

  test.case = 'src - string, little difference, begin - mixed, end - mixed';
  var got = _.strInsideOf( '!!str!!', [ '!!!', '!!' ], [ '!!!', '!!' ] );
  test.identical( got, 'str' );

  /* */

  test.case = 'src - string, equals inside string, begin - empty string, end - mixed';
  var got = _.strInsideOf( 'str!!!str!!!str', [ '' ], [ '!!!', 'str' ] );
  test.identical( got, 'str!!!str!!!' );

  test.case = 'src - string, equals inside string, begin - mixed, end - empty string';
  var got = _.strInsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], [ '' ] );
  test.identical( got, '!!!str!!!str' );

  test.case = 'src - string, equals inside string, begin - mixed, end - mixed';
  var got = _.strInsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], [ '!!!', 'str' ] );
  test.identical( got, '!!!str!!!' );

  test.close( 'array' );

  /* - */

  test.open( 'mixed' );

  test.case = 'src - empty string, begin - empty strings, end - empty strings';
  var got = _.strInsideOf( '', [ '', '', '' ], '' );
  test.identical( got, '' );

  test.case = 'src - empty string, begin - empty string, end - !!!';
  var got = _.strInsideOf( '', '', [ '!!!', '!!!' ] );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - empty string';
  var got = _.strInsideOf( '', [ '!!!', '!!!' ], '' );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - !!!';
  var got = _.strInsideOf( '', [ '!!!', '!!!' ], '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, begin - empty string, end - mixed, not equal';
  var got = _.strInsideOf( 'str', '', [ '!!!', 'q', 'b' ] );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - empty string';
  var got = _.strInsideOf( 'str', [ '!!!', 'q', 'b' ], '' );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - string, not equal';
  var got = _.strInsideOf( 'str', [ '!!!', 'q', 'b' ], 'q' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, almost equal, begin - empty string, end - mix';
  var got = _.strInsideOf( '!!!str!!!', '', [ '!', '!!', '!!!' ] );
  test.identical( got, '!!!str!!' );

  test.case = 'src - string, almost equal, begin - mixed, end - empty string';
  var got = _.strInsideOf( '!!!str!!!', [ '!', '!!', '!!!' ], '' );
  test.identical( got, '!!str!!!' );

  test.case = 'src - string, almost equal, begin - string, end - mixed';
  var got = _.strInsideOf( '!!!str!!!', '!!!', [ '!', '!!', '!!!' ] );
  test.identical( got, 'str!!' );

  /* */

  test.case = 'src - string, little difference, begin - empty string, end - mixed';
  var got = _.strInsideOf( '!!str!!', '', [ '!!!', '!!' ] );
  test.identical( got, '!!str' );

  test.case = 'src - string, little difference, begin - mixed, end - empty string';
  var got = _.strInsideOf( '!!str!!', [ '!!!', '!!' ], '' );
  test.identical( got, 'str!!' );

  test.case = 'src - string, little difference, begin - mixed, end - string';
  var got = _.strInsideOf( '!!str!!', [ '!!!', '!!' ], '!!' );
  test.identical( got, 'str' );

  /* */

  test.case = 'src - string, equals inside string, begin - empty string, end - mixed';
  var got = _.strInsideOf( 'str!!!str!!!str', '', [ '!!!', 'str' ] );
  test.identical( got, 'str!!!str!!!' );

  test.case = 'src - string, equals inside string, begin - mixed, end - empty string';
  var got = _.strInsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], '' );
  test.identical( got, '!!!str!!!str' );

  test.case = 'src - string, equals inside string, begin - mixed, end - string';
  var got = _.strInsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], '!!!' );
  test.identical( got, undefined );

  test.close( 'mixed' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strInsideOf() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.strInsideOf( 'str' ) );
  test.shouldThrowErrorSync( () => _.strInsideOf( 'str', 's' ) );

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( () => _.strInsideOf( 1, '', '' ) );
  test.shouldThrowErrorSync( () => _.strInsideOf( 'str', 1, '' ) );
  test.shouldThrowErrorSync( () => _.strInsideOf( 'str', '', 1 ) );
}

//

function strInsideOfOptionPairing( test )
{
  test.open( 'src - empty string, pairing - 0' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf({ src : '', begin : '', end : '', pairing : 0 });
  test.identical( got, '' );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf({ src : '', begin : 'a', end : '', pairing : 0 });
  test.identical( got, undefined );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf({ src : '', begin : '', end : 'a', pairing : 0 });
  test.identical( got, undefined );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf({ src : '', begin : 'a', end : 'a', pairing : 0 });
  test.identical( got, undefined );

  test.close( 'src - empty string, pairing - 0' );

  /* - */

  test.open( 'src - string, begin === end, pairing - 0' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf({ src : 'abba', begin : '', end : '', pairing : 0 });
  test.identical( got, 'abba' );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf({ src : 'abba', begin : 'a', end : '', pairing : 0 });
  test.identical( got, 'bba' );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf({ src : 'abba', begin : '', end : 'a', pairing : 0 });
  test.identical( got, 'abb' );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf({ src : 'abba', begin : 'a', end : 'a', pairing : 0 });
  test.identical( got, 'bb' );

  test.close( 'src - string, begin === end, pairing - 0' );

  /* - */

  test.open( 'src - string, begin !== end, pairing - 0' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf({ src : 'abcd', begin : '', end : '', pairing : 0 });
  test.identical( got, 'abcd' );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf({ src : 'abcd', begin : 'a', end : '', pairing : 0 });
  test.identical( got, 'bcd' );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf({ src : 'abcd', begin : '', end : 'd', pairing : 0 });
  test.identical( got, 'abc' );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf({ src : 'abba', begin : 'a', end : 'd', pairing : 0 });
  test.identical( got, undefined );

  test.close( 'src - string, begin !== end, pairing - 0' );

  /* - */

  test.open( 'src - empty string, pairing - 1' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf({ src : '', begin : '', end : '', pairing : 1 });
  test.identical( got, '' );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf({ src : '', begin : 'a', end : '', pairing : 1 });
  test.identical( got, undefined );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf({ src : '', begin : '', end : 'a', pairing : 1 });
  test.identical( got, undefined );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf({ src : '', begin : 'a', end : 'a', pairing : 1 });
  test.identical( got, undefined );

  test.close( 'src - empty string, pairing - 1' );

  /* - */

  test.open( 'src - string, begin === end, pairing - 1' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf({ src : 'abba', begin : '', end : '', pairing : 1 });
  test.identical( got, 'abba' );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf({ src : 'abba', begin : 'a', end : '', pairing : 1 });
  test.identical( got, 'bba' );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf({ src : 'abba', begin : '', end : 'a', pairing : 1 });
  test.identical( got, 'abb' );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf({ src : 'abba', begin : 'a', end : 'a', pairing : 1 });
  test.identical( got, 'bb' );

  test.close( 'src - string, begin === end, pairing - 1' );

  /* - */

  test.open( 'src - string, begin !== end, pairing - 1' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf({ src : 'abcd', begin : '', end : '', pairing : 1 });
  test.identical( got, 'abcd' );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf({ src : 'abcd', begin : 'a', end : '', pairing : 1 });
  test.identical( got, 'bcd' );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf({ src : 'abcd', begin : '', end : 'd', pairing : 1 });
  test.identical( got, 'abc' );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf({ src : 'abba', begin : 'a', end : 'd', pairing : 1 });
  test.identical( got, undefined );

  test.close( 'src - string, begin !== end, pairing - 1' );

  /* - */

  test.open( 'src - empty string, pairing - 1' );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf({ src : '', begin : [ '' ], end : [ '' ], pairing : 1 });
  test.identical( got, '' );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf({ src : '', begin : [ 'a' ], end : '', pairing : 1 });
  test.identical( got, undefined );

  test.case = 'begin - array with entry, end - array without entry';
  var got = _.strInsideOf({ src : '', begin : [ '' ], end : [ 'a' ], pairing : 1 });
  test.identical( got, undefined );

  test.case = 'begin - array without entry, end - array without entry';
  var got = _.strInsideOf({ src : '', begin : [ 'a' ], end : [ 'a' ], pairing : 1 });
  test.identical( got, undefined );

  test.close( 'src - empty string, pairing - 1' );

  /* - */

  test.open( 'src - string, begin === end, pairing - 1' );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf({ src : 'abba', begin : [ '', 'a' ], end : [ '', 'b' ], pairing : 1 });
  test.identical( got, 'abba' );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf({ src : 'abba', begin : [ 'a' ], end : [ '' ], pairing : 1 });
  test.identical( got, 'bba' );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf({ src : 'abba', begin : [ '' ], end : [ 'a' ], pairing : 1 });
  test.identical( got, 'abb' );

  test.case = 'begin - array with entry, end - array with entry, different indexes';
  var got = _.strInsideOf({ src : 'abba', begin : [ 'a', 'b' ], end : [ 'b', 'a' ], pairing : 1 });
  test.identical( got, undefined );

  test.close( 'src - string, begin === end, pairing - 1' );

  /* - */

  test.open( 'src - string, begin !== end, pairing - 1' );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf({ src : 'abcd', begin : [ '' ], end : [ '' ], pairing : 1 });
  test.identical( got, 'abcd' );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf({ src : 'abcd', begin : [ 'a' ], end : [ '' ], pairing : 1 });
  test.identical( got, 'bcd' );

  test.case = 'begin - array with entry, end - array with entry, different indexes';
  var got = _.strInsideOf({ src : 'abcd', begin : [ '', 'a' ], end : [ 'a', 'd' ], pairing : 1 });
  test.identical( got, undefined );

  test.case = 'begin - array with entry, end - array without entry';
  var got = _.strInsideOf({ src : 'abba', begin : [ 'a', 'b' ], end : [ 'd', 'e' ], pairing : 1 });
  test.identical( got, undefined );

  test.close( 'src - string, begin !== end, pairing - 1' );
}

//

function strInsideOf_( test )
{
  test.open( 'src - empty string' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_( '', '', '' );
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_( '', 'a', '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_( '', '', 'a' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_( '', 'a', 'a' );
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry, end - empty string';
  var got = _.strInsideOf_( '', [ '' ], '' );
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_( '', [ 'b' ], '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry';
  var got = _.strInsideOf_( '', '', [ '' ] );
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_( '', '', [ 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf_( '', [ '', 'b' ], [ 'a', '' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry';
  var got = _.strInsideOf_( '', [ 'a', 'b' ], [ 'a', 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - empty string' );

  /* - */

  test.open( 'src - string, begin === end' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_( 'abba', '', '' );
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_( 'abba', 'a', '' );
  test.identical( got, [ 'a', 'bba', '' ] );

  test.case = 'begin - string, not entry, end - empty string';
  var got = _.strInsideOf_( 'abba', 'b', '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_( 'abba', '', 'a' );
  test.identical( got, [ '', 'abb', 'a' ] );

  test.case = 'begin - empty string, end - string, not entry';
  var got = _.strInsideOf_( 'abba', '', 'c' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_( 'abba', 'a', 'a' );
  test.identical( got, [ 'a', 'bb', 'a' ] );

  test.case = 'begin - string, not entry, end - string, not entry';
  var got = _.strInsideOf_( 'abba', 'b', 'b' );
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry - empty string, end - empty string';
  var got = _.strInsideOf_( 'abba', [ '' ], '' );
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - array with entry - string, end - empty string';
  var got = _.strInsideOf_( 'abba', [ 'b' ], '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_( 'abba', [ 'c' ], '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_( 'abba', '', [ '' ] );
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - empty string, end - array with entry - string';
  var got = _.strInsideOf_( 'abba', '', [ 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_( 'abba', '', [ 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_( 'abba', [ 'b', '' ], [ '', 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_( 'abba', [ '', 'b' ], [ '', 'b' ] );
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - array with entry - empty string, end - array without entry';
  var got = _.strInsideOf_( 'abba', [ 'b', '' ], [ 'c', 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry - empty string';
  var got = _.strInsideOf_( 'abba', [ 'b', 'c' ], [ '', 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_( 'abba', [ 'a', 'b' ], [ 'b', 'a' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_( 'abba', [ 'a', 'b' ], [ 'a', 'b' ] );
  test.identical( got, [ 'a', 'bb', 'a' ] );

  test.case = 'begin - array without entry - string, end - array with entry - string';
  var got = _.strInsideOf_( 'abba', [ 'b', 'c' ], [ 'b', 'a' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array without entry - string';
  var got = _.strInsideOf_( 'abba', [ 'b', 'a' ], [ 'b', 'c' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry - string, end - array without entry - string';
  var got = _.strInsideOf_( 'abba', [ 'b', 'c' ], [ 'b', 'c' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - string, begin === end' );

  /* - */

  test.open( 'src - string, begin !== end' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_( 'abcd', '', '' );
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_( 'abcd', 'a', '' );
  test.identical( got, [ 'a', 'bcd', '' ] );

  test.case = 'begin - string, not entry, end - empty string';
  var got = _.strInsideOf_( 'abcd', 'b', '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_( 'abcd', '', 'd' );
  test.identical( got, [ '', 'abc', 'd' ] );

  test.case = 'begin - empty string, end - string, not entry';
  var got = _.strInsideOf_( 'abcd', '', 'b' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_( 'abcd', 'a', 'd' );
  test.identical( got, [ 'a', 'bc', 'd' ] );

  test.case = 'begin - string, not entry, end - string, not entry';
  var got = _.strInsideOf_( 'abcd', 'c', 'b' );
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry - empty string, end - empty string';
  var got = _.strInsideOf_( 'abcd', [ '' ], '' );
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - array with entry - string, end - empty string';
  var got = _.strInsideOf_( 'abcd', [ 'b' ], '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_( 'abcd', [ 'c' ], '' );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_( 'abcd', '', [ '' ] );
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - empty string, end - array with entry - string';
  var got = _.strInsideOf_( 'abcd', '', [ 'd' ] );
  test.identical( got, [ '', 'abc', 'd' ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_( 'abcd', '', [ 'c' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_( 'abcd', [ 'b', '' ], [ '', 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_( 'abcd', [ 'b', '' ], [ 'b', '' ] );
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - array with entry - empty string, end - array without entry';
  var got = _.strInsideOf_( 'abcd', [ 'b', '' ], [ 'c', 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry - empty string';
  var got = _.strInsideOf_( 'abcd', [ 'b', 'c' ], [ '', 'b' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_( 'abcd', [ 'a', 'b' ], [ 'd', 'b' ] );
  test.identical( got, [ 'a', 'bc', 'd' ] );

  test.case = 'begin - array without entry - string, end - array with entry - string';
  var got = _.strInsideOf_( 'abcd', [ 'b', 'c' ], [ 'b', 'd' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array without entry - string';
  var got = _.strInsideOf_( 'abcd', [ 'b', 'a' ], [ 'b', 'c' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry - string, end - array without entry - string';
  var got = _.strInsideOf_( 'abcd', [ 'b', 'c' ], [ 'b', 'c' ] );
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - string, begin !== end' );
}

//

function strInsideOf_OptionPairingIs0( test )
{
  test.open( 'src - empty string' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : '', end : '', pairing : 0 });
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : 'a', end : '', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_({ src : '', begin : '', end : 'a', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_({ src : '', begin : 'a', end : 'a', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : [ 'a', '' ], end : '', pairing : 0 });
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : [ 'a', 'b' ], end : '', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry';
  var got = _.strInsideOf_({ src : '', begin : '', end : [ 'a', '' ], pairing : 0 });
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : '', begin : '', end : [ 'a', 'b' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf_({ src : '', begin : [ '', 'b' ], end : [ 'a', '' ], pairing : 0 });
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - array without entry, end - array without entry';
  var got = _.strInsideOf_({ src : '', begin : [ 'a', 'b' ], end : [ 'a', 'b' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - empty string' );

  /* - */

  test.open( 'src - string, begin === end' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : '', pairing : 0 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : 'a', end : '', pairing : 0 });
  test.identical( got, [ 'a', 'bba', '' ] );

  test.case = 'begin - string, not entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : 'b', end : '', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : 'a', pairing : 0 });
  test.identical( got, [ '', 'abb', 'a' ] );

  test.case = 'begin - empty string, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : 'c', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_({ src : 'abba', begin : 'a', end : 'a', pairing : 0 });
  test.identical( got, [ 'a', 'bb', 'a' ] );

  test.case = 'begin - string, not entry, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abba', begin : 'b', end : 'b', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', '' ], end : '', pairing : 0 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - array with entry - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'a', 'b' ], end : '', pairing : 0 });
  test.identical( got, [ 'a', 'bba', '' ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'c' ], end : '', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : [ 'b', '' ], pairing : 0 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - empty string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : [ 'b', 'a' ], pairing : 0 });
  test.identical( got, [ '', 'abb', 'a' ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : [ 'b', 'c' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', '' ], end : [ '', 'b' ], pairing : 0 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - array with entry - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', '' ], end : [ 'c', 'b' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'c' ], end : [ '', 'b' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'a', 'b' ], end : [ 'b', 'a' ], pairing : 0 });
  test.identical( got, [ 'a', 'bb', 'a' ] );

  test.case = 'begin - array without entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'c' ], end : [ 'b', 'a' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'a' ], end : [ 'b', 'c' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'c' ], end : [ 'b', 'c' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - string, begin === end' );

  /* - */

  test.open( 'src - string, begin !== end' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : '', pairing : 0 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'a', end : '', pairing : 0 });
  test.identical( got, [ 'a', 'bcd', '' ] );

  test.case = 'begin - string, not entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'b', end : '', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : 'd', pairing : 0 });
  test.identical( got, [ '', 'abc', 'd' ] );

  test.case = 'begin - empty string, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : 'b', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'a', end : 'd', pairing : 0 });
  test.identical( got, [ 'a', 'bc', 'd' ] );

  test.case = 'begin - string, not entry, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'c', end : 'b', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', '' ], end : '', pairing : 0 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - array with entry - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'a', 'b' ], end : '', pairing : 0 });
  test.identical( got, [ 'a', 'bcd', '' ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'c' ], end : '', pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : [ 'b', '' ], pairing : 0 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - empty string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : [ 'b', 'd' ], pairing : 0 });
  test.identical( got, [ '', 'abc', 'd' ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : [ 'b', 'c' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', '' ], end : [ '', 'b' ], pairing : 0 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - array with entry - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', '' ], end : [ 'c', 'b' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'c' ], end : [ '', 'b' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'a', 'b' ], end : [ 'b', 'd' ], pairing : 0 });
  test.identical( got, [ 'a', 'bc', 'd' ] );

  test.case = 'begin - array without entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'c' ], end : [ 'b', 'd' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'a' ], end : [ 'b', 'c' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'c' ], end : [ 'b', 'c' ], pairing : 0 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - string, begin !== end' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strInsideOf_() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.strInsideOf_( 'str', 's' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strInsideOf_( 'str', 's', '', 1 ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strInsideOf_( 1, '', '' ) );

  test.case = 'wrong type of begin';
  test.shouldThrowErrorSync( () => _.strInsideOf_( 'str', 1, '' ) );

  test.case = 'wrong type of end';
  test.shouldThrowErrorSync( () => _.strInsideOf_( 'str', '', 1 ) );

  test.case = 'wrong type of options map';
  test.shouldThrowErrorSync( () => _.strInsideOf_( 'str' ) );

  test.case = 'unknown property in options map';
  test.shouldThrowErrorSync( () => _.strInsideOf_({ src : 'str', begin : '', end : '', unknown : 1 }) );
}

//

function strInsideOf_OptionPairingIs1( test )
{
  test.open( 'src - empty string' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : '', end : '', pairing : 1 });
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : 'a', end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_({ src : '', begin : '', end : 'a', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_({ src : '', begin : 'a', end : 'a', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : [ '' ], end : '', pairing : 1 });
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_({ src : '', begin : [ 'b' ], end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry';
  var got = _.strInsideOf_({ src : '', begin : '', end : [ '' ], pairing : 1 });
  test.identical( got, [ '', '', '' ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : '', begin : '', end : [ 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry, end - array with entry';
  var got = _.strInsideOf_({ src : '', begin : [ '', 'b' ], end : [ 'a', '' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry';
  var got = _.strInsideOf_({ src : '', begin : [ 'a', 'b' ], end : [ 'a', 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - empty string' );

  /* - */

  test.open( 'src - string, begin === end' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : '', pairing : 1 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : 'a', end : '', pairing : 1 });
  test.identical( got, [ 'a', 'bba', '' ] );

  test.case = 'begin - string, not entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : 'b', end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : 'a', pairing : 1 });
  test.identical( got, [ '', 'abb', 'a' ] );

  test.case = 'begin - empty string, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : 'c', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_({ src : 'abba', begin : 'a', end : 'a', pairing : 1 });
  test.identical( got, [ 'a', 'bb', 'a' ] );

  test.case = 'begin - string, not entry, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abba', begin : 'b', end : 'b', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ '' ], end : '', pairing : 1 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - array with entry - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b' ], end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'c' ], end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : [ '' ], pairing : 1 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - empty string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : [ 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abba', begin : '', end : [ 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', '' ], end : [ '', 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ '', 'b' ], end : [ '', 'b' ], pairing : 1 });
  test.identical( got, [ '', 'abba', '' ] );

  test.case = 'begin - array with entry - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', '' ], end : [ 'c', 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry - empty string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'c' ], end : [ '', 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'a', 'b' ], end : [ 'b', 'a' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'a', 'b' ], end : [ 'a', 'b' ], pairing : 1 });
  test.identical( got, [ 'a', 'bb', 'a' ] );

  test.case = 'begin - array without entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'c' ], end : [ 'b', 'a' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'a' ], end : [ 'b', 'c' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abba', begin : [ 'b', 'c' ], end : [ 'b', 'c' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - string, begin === end' );

  /* - */

  test.open( 'src - string, begin !== end' );

  test.case = 'begin - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : '', pairing : 1 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'a', end : '', pairing : 1 });
  test.identical( got, [ 'a', 'bcd', '' ] );

  test.case = 'begin - string, not entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'b', end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : 'd', pairing : 1 });
  test.identical( got, [ '', 'abc', 'd' ] );

  test.case = 'begin - empty string, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : 'b', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - string, end - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'a', end : 'd', pairing : 1 });
  test.identical( got, [ 'a', 'bc', 'd' ] );

  test.case = 'begin - string, not entry, end - string, not entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : 'c', end : 'b', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  /* */

  test.case = 'begin - array with entry - empty string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ '' ], end : '', pairing : 1 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - array with entry - string, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b' ], end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'c' ], end : '', pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : [ '' ], pairing : 1 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - empty string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : [ 'd' ], pairing : 1 });
  test.identical( got, [ '', 'abc', 'd' ] );

  test.case = 'begin - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : '', end : [ 'c' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', '' ], end : [ '', 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - empty string, end - array with entry - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', '' ], end : [ 'b', '' ], pairing : 1 });
  test.identical( got, [ '', 'abcd', '' ] );

  test.case = 'begin - array with entry - empty string, end - array without entry';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', '' ], end : [ 'c', 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry, end - array without entry - empty string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'c' ], end : [ '', 'b' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'a', 'b' ], end : [ 'd', 'b' ], pairing : 1 });
  test.identical( got, [ 'a', 'bc', 'd' ] );

  test.case = 'begin - array without entry - string, end - array with entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'c' ], end : [ 'b', 'd' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array with entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'a' ], end : [ 'b', 'c' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.case = 'begin - array without entry - string, end - array without entry - string';
  var got = _.strInsideOf_({ src : 'abcd', begin : [ 'b', 'c' ], end : [ 'b', 'c' ], pairing : 1 });
  test.identical( got, [ undefined, undefined, undefined ] );

  test.close( 'src - string, begin !== end' );
}

//

function strOutsideOf( test )
{
  test.open( 'string' );

  test.case = 'src - empty string, begin - empty string, end - empty string';
  var got = _.strOutsideOf( '', '', '' );
  test.identical( got, '' );

  test.case = 'src - empty string, begin - empty string, end - !!!';
  var got = _.strOutsideOf( '', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - empty string';
  var got = _.strOutsideOf( '', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - !!!';
  var got = _.strOutsideOf( '', '!!!', '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, begin - empty string, end - empty string';
  var got = _.strOutsideOf( 'str', '', '' );
  test.identical( got, '' );

  test.case = 'src - string, begin - empty string, end - !!!, not equal';
  var got = _.strOutsideOf( 'str', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - string, begin - !!!, not equal, end - empty string';
  var got = _.strOutsideOf( 'str', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - string, begin - !!!, not equal, end - !!!, not equal';
  var got = _.strOutsideOf( 'str', '!!!', '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, almost equal, begin - empty string, end - !!!';
  var got = _.strOutsideOf( '!!!str!!!', '', '!!!' );
  test.identical( got, '!!!' );

  test.case = 'src - string, almost equal, begin - !!!, end - empty string';
  var got = _.strOutsideOf( '!!!str!!!', '!!!', '' );
  test.identical( got, '!!!' );

  test.case = 'src - string, almost equal, begin - !!!, end - !!!';
  var got = _.strOutsideOf( '!!!str!!!', '!!!', '!!!' );
  test.identical( got, '!!!!!!' );

  /* */

  test.case = 'src - string, little difference, begin - empty string, end - !!!';
  var got = _.strOutsideOf( '!!str!!', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - string, little difference, begin - !!!, end - empty string';
  var got = _.strOutsideOf( '!!str!!', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - string, little difference, begin - !!!, end - !!!';
  var got = _.strOutsideOf( '!!str!!', '!!!', '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, equals inside string, begin - empty string, end - !!!';
  var got = _.strOutsideOf( 'str!!!str!!!str', '', '!!!' );
  test.identical( got, undefined );

  test.case = 'src - string, equals inside string, begin - !!!, end - empty string';
  var got = _.strOutsideOf( 'str!!!str!!!str', '!!!', '' );
  test.identical( got, undefined );

  test.case = 'src - string, equals inside string, begin - !!!, end - !!!';
  var got = _.strOutsideOf( 'str!!!str!!!str', '!!!', '!!!' );
  test.identical( got, undefined );

  test.close( 'string' );

  /* - */

  test.open( 'array' );

  test.case = 'src - empty string, begin - empty strings, end - empty strings';
  var got = _.strOutsideOf( '', [ '', '', '' ], [ '', '', '' ] );
  test.identical( got, '' );

  test.case = 'src - empty string, begin - empty strings, end - !!!';
  var got = _.strOutsideOf( '', [ '', '' ], [ '!!!', '!!!' ] );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - empty strings';
  var got = _.strOutsideOf( '', [ '!!!', '!!!' ], [ '', '' ] );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - !!!';
  var got = _.strOutsideOf( '', [ '!!!', '!!!' ], [ '!!!', '!!!' ] );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, begin - empty strings, end - empty strings';
  var got = _.strOutsideOf( 'str', [ '', '', '' ], [ '', '', '' ] );
  test.identical( got, '' );

  test.case = 'src - string, begin - empty string, end - mixed, not equal';
  var got = _.strOutsideOf( 'str', [ '' ], [ '!!!', 'q', 'b' ] );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - empty string';
  var got = _.strOutsideOf( 'str', [ '!!!', 'q', 'b' ], [ '' ] );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - mixed, not equal';
  var got = _.strOutsideOf( 'str', [ '!!!', 'q', 'b' ], [ '!!!', 'q', 'b' ] );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, almost equal, begin - empty string, end - mix';
  var got = _.strOutsideOf( '!!!str!!!', [ '' ], [ '!', '!!', '!!!' ] );
  test.identical( got, '!' );

  test.case = 'src - string, almost equal, begin - mixed, end - empty string';
  var got = _.strOutsideOf( '!!!str!!!', [ '!', '!!', '!!!' ], [ '' ] );
  test.identical( got, '!' );

  test.case = 'src - string, almost equal, begin - mixed, end - mixed';
  var got = _.strOutsideOf( '!!!str!!!', [ '!', '!!', '!!!' ], [ '!', '!!', '!!!' ] );
  test.identical( got, '!!' );

  /* */

  test.case = 'src - string, little difference, begin - empty string, end - mixed';
  var got = _.strOutsideOf( '!!str!!', [ '' ], [ '!!!', '!!' ] );
  test.identical( got, '!!' );

  test.case = 'src - string, little difference, begin - mixed, end - empty string';
  var got = _.strOutsideOf( '!!str!!', [ '!!!', '!!' ], [ '' ] );
  test.identical( got, '!!' );

  test.case = 'src - string, little difference, begin - mixed, end - mixed';
  var got = _.strOutsideOf( '!!str!!', [ '!!!', '!!' ], [ '!!!', '!!' ] );
  test.identical( got, '!!!!' );

  /* */

  test.case = 'src - string, equals inside string, begin - empty string, end - mixed';
  var got = _.strOutsideOf( 'str!!!str!!!str', [ '' ], [ '!!!', 'str' ] );
  test.identical( got, 'str' );

  test.case = 'src - string, equals inside string, begin - mixed, end - empty string';
  var got = _.strOutsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], [ '' ] );
  test.identical( got, 'str' );

  test.case = 'src - string, equals inside string, begin - mixed, end - mixed';
  var got = _.strOutsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], [ '!!!', 'str' ] );
  test.identical( got, 'strstr' );

  test.close( 'array' );

  /* - */

  test.open( 'mixed' );

  test.case = 'src - empty string, begin - empty strings, end - empty strings';
  var got = _.strOutsideOf( '', [ '', '', '' ], '' );
  test.identical( got, '' );

  test.case = 'src - empty string, begin - empty string, end - !!!';
  var got = _.strOutsideOf( '', '', [ '!!!', '!!!' ] );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - empty string';
  var got = _.strOutsideOf( '', [ '!!!', '!!!' ], '' );
  test.identical( got, undefined );

  test.case = 'src - empty string, begin - !!!, end - !!!';
  var got = _.strOutsideOf( '', [ '!!!', '!!!' ], '!!!' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, begin - empty string, end - mixed, not equal';
  var got = _.strOutsideOf( 'str', '', [ '!!!', 'q', 'b' ] );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - empty string';
  var got = _.strOutsideOf( 'str', [ '!!!', 'q', 'b' ], '' );
  test.identical( got, undefined );

  test.case = 'src - string, begin - mixed, not equal, end - string, not equal';
  var got = _.strOutsideOf( 'str', [ '!!!', 'q', 'b' ], 'q' );
  test.identical( got, undefined );

  /* */

  test.case = 'src - string, almost equal, begin - empty string, end - mix';
  var got = _.strOutsideOf( '!!!str!!!', '', [ '!', '!!', '!!!' ] );
  test.identical( got, '!' );

  test.case = 'src - string, almost equal, begin - mixed, end - empty string';
  var got = _.strOutsideOf( '!!!str!!!', [ '!', '!!', '!!!' ], '' );
  test.identical( got, '!' );

  test.case = 'src - string, almost equal, begin - string, end - mixed';
  var got = _.strOutsideOf( '!!!str!!!', '!!!', [ '!', '!!', '!!!' ] );
  test.identical( got, '!!!!' );

  /* */

  test.case = 'src - string, little difference, begin - empty string, end - mixed';
  var got = _.strOutsideOf( '!!str!!', '', [ '!!!', '!!' ] );
  test.identical( got, '!!' );

  test.case = 'src - string, little difference, begin - mixed, end - empty string';
  var got = _.strOutsideOf( '!!str!!', [ '!!!', '!!' ], '' );
  test.identical( got, '!!' );

  test.case = 'src - string, little difference, begin - mixed, end - string';
  var got = _.strOutsideOf( '!!str!!', [ '!!!', '!!' ], '!!' );
  test.identical( got, '!!!!' );

  /* */

  test.case = 'src - string, equals inside string, begin - empty string, end - mixed';
  var got = _.strOutsideOf( 'str!!!str!!!str', '', [ '!!!', 'str' ] );
  test.identical( got, 'str' );

  test.case = 'src - string, equals inside string, begin - mixed, end - empty string';
  var got = _.strOutsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], '' );
  test.identical( got, 'str' );

  test.case = 'src - string, equals inside string, begin - mixed, end - string';
  var got = _.strOutsideOf( 'str!!!str!!!str', [ '!!!', 'str' ], '!!!' );
  test.identical( got, undefined );

  test.close( 'mixed' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strOutsideOf() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.strOutsideOf( 'str' ) );
  test.shouldThrowErrorSync( () => _.strOutsideOf( 'str', 's' ) );

  test.case = 'wrong type of arguments';
  test.shouldThrowErrorSync( () => _.strOutsideOf( 1, '', '' ) );
  test.shouldThrowErrorSync( () => _.strOutsideOf( 'str', 1, '' ) );
  test.shouldThrowErrorSync( () => _.strOutsideOf( 'str', '', 1 ) );
}

//--
// replacers
//--

function strRemoveBegin( test )
{
  test.open( 'src - string, begin - string' );

  test.case = 'empty string : empty string';
  var got = _.strRemoveBegin( '', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : x';
  var got = _.strRemoveBegin( '', 'x' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty string';
  var got = _.strRemoveBegin( 'abc', '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include begin';
  var got = _.strRemoveBegin( 'abc', 'a' );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include begin, begin.length < src.length';
  var got = _.strRemoveBegin( 'abc', 'ab' );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'include begin, begin.length === src.length';
  var got = _.strRemoveBegin( 'abc', 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include begin';
  var got = _.strRemoveBegin( 'abc', 'd' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( 'abc', 'bc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - string' );

  /* - */

  test.open( 'src - string, begin - array of strings' );

  test.case = 'empty string : empty strings';
  var got = _.strRemoveBegin( '', [ '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : strings';
  var got = _.strRemoveBegin( '', [ 'x', 'a', 'abc' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings';
  var got = _.strRemoveBegin( 'abc', [ '', '', '' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include one of begins';
  var got = _.strRemoveBegin( 'abc', [ 'd', 'bc', 'a' ] );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length < src.length';
  var got = _.strRemoveBegin( 'abc', [ 'bc', 'ab', 'da' ] );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length === src.length';
  var got = _.strRemoveBegin( 'abc', [ 'cba', 'dba', 'abc' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'include none of begins';
  var got = _.strRemoveBegin( 'abc', [ 'd', 'b', 'c' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( 'abc', [ 'c', 'bc' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - array of strings' );

  /* - */

  test.open( 'src - array of strings, begin - string' );

  test.case = 'empty strings : empty string';
  var got = _.strRemoveBegin( [ '', '', '' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : string';
  var got = _.strRemoveBegin( [ '', '', '' ], 'x' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty string';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], 'bc' );
  var expected = [ 'abc', 'a', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], 'ab' );
  var expected = [ 'c', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length';
  var got = _.strRemoveBegin( [ 'abc', 'cab', 'bca', 'cab' ], 'cab' );
  var expected = [ 'abc', '', 'bca', '' ];
  test.identical( got, expected );

  test.case = 'src include none of begin';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], 'd' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( [ 'abc', 'bac', 'cab' ], 'bc' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - string' );

  /* - */

  test.open( 'src - array of strings, begin - array of strings' );

  test.case = 'empty strings : empty strings';
  var got = _.strRemoveBegin( [ '', '', '' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings';
  var got = _.strRemoveBegin( [ '', '', '' ], [ 'x', 'a', 'b' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ '', '', '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ] );
  var expected = [ 'c', 'a', 'b' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'a', 'ca' ] );
  var expected = [ 'bc', 'a', 'b' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length';
  var got = _.strRemoveBegin( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', 'bca' ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'src include none of begins';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', 'h' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( [ 'abc', 'bda', 'cab' ], [ 'bc', 'da' ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - array of strings' );

  /* - */

  test.open( 'src - string, begin - RegExp' );

  test.case = 'empty string : RegExp';
  var got = _.strRemoveBegin( '', /\w/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp';
  var got = _.strRemoveBegin( '', /\w/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : RegExp';
  var got = _.strRemoveBegin( 'abc', /\w/ );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include begin';
  var got = _.strRemoveBegin( 'abc', /\w{2}/ );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'include begin, begin.length < src.length';
  var got = _.strRemoveBegin( 'abc', /\w/ );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include begin, begin.length === src.length';
  var got = _.strRemoveBegin( 'abc', /\w*/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include begin';
  var got = _.strRemoveBegin( 'abc', /\w\s/ );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( 'abc', /\sw/ );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - RegExp' );

  /* - */

  test.open( 'src - string, begin - array of strings and RegExp' );

  test.case = 'empty string : empty strings and RegExp';
  var got = _.strRemoveBegin( '', [ '', /\w/, '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp';
  var got = _.strRemoveBegin( '', [ /\w\s/, /\w+/, /\w*/ ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings and RegExp';
  var got = _.strRemoveBegin( 'abc', [ '', '', /\w$/ ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include one of begins';
  var got = _.strRemoveBegin( 'abc', [ 'd', 'bc', /a/ ] );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length < src.length';
  var got = _.strRemoveBegin( 'abc', [ 'bc', /ab/, 'da' ] );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length === src.length';
  var got = _.strRemoveBegin( 'abc', [ 'cba', 'dba', /\w+/ ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'include none of begins';
  var got = _.strRemoveBegin( 'abc', [ 'd', 'b', /c/ ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( 'abc', [ 'c', /\s+/ ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - array of strings and RegExp' );

  /* - */

  test.open( 'src - array of strings, begin - RegExp' );

  test.case = 'empty strings : RegExp';
  var got = _.strRemoveBegin( [ '', '', '' ], /\s/ );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp';
  var got = _.strRemoveBegin( [ '', '', '' ], /\w/ );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : RegExp';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], /\s*/ );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], /bc/ );
  var expected = [ 'abc', 'a', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], /a\w/ );
  var expected = [ 'c', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length';
  var got = _.strRemoveBegin( [ 'abc', 'cab', 'bca', 'cab' ], /ca\w/ );
  var expected = [ 'abc', '', 'bca', '' ];
  test.identical( got, expected );

  test.case = 'src include none of begin';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], /\wd/ );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( [ 'abc', 'bac', 'cab' ], /[efk]/ );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - RegExp' );

  /* - */

  test.open( 'src - array of strings, begin - array of strings and RegExp' );

  test.case = 'empty strings : empty strings and RegExp';
  var got = _.strRemoveBegin( [ '', '', '' ], [ '', '', /\w\s/ ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp';
  var got = _.strRemoveBegin( [ '', '', '' ], [ 'x', /\d\D/, 'b' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ '', /\D/, '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', /[abc]/, 'ca' ] );
  var expected = [ 'bc', 'a', 'ab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', /\w/, 'ca' ] );
  var expected = [ 'bc', 'a', 'ab' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length';
  var got = _.strRemoveBegin( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', /\w+$/ ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'src include none of begins';
  var got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', /\w\s/ ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strRemoveBegin( [ 'abc', 'bda', 'cab' ], [ 'bc', /\w\s/ ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - array of strings and RegExp' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strRemoveBegin() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strRemoveBegin( 'abcd', 'a', 'a' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strRemoveBegin( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strRemoveBegin( /\w*/, '2' ) );
  test.shouldThrowErrorSync( () => _.strRemoveBegin( [ 'str', 1 ], '2' ) );
  test.shouldThrowErrorSync( () => _.strRemoveBegin( [ 'str', /ex/ ], '2' ) );

  test.case = 'wrong type of begin';
  test.shouldThrowErrorSync( () => _.strRemoveBegin( 'a', 1 ) );
  test.shouldThrowErrorSync( () => _.strRemoveBegin( 'a', null ) );
  test.shouldThrowErrorSync( () => _.strRemoveBegin( 'aa', [ ' a', 2 ] ) );

  test.case = 'invalid type of arguments';
  test.shouldThrowErrorSync( () => _.strRemoveBegin( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strRemoveBegin( null, null ) );
}

//

function strRemoveEnd( test )
{
  test.open( 'src - string, end - string' );

  test.case = 'empty string : empty string';
  var got = _.strRemoveEnd( '', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : x';
  var got = _.strRemoveEnd( '', 'x' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty string';
  var got = _.strRemoveEnd( 'abc', '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include end';
  var got = _.strRemoveEnd( 'abc', 'c' );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'include end, end.length < src.length';
  var got = _.strRemoveEnd( 'abc', 'bc' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include end, end.length === src.length';
  var got = _.strRemoveEnd( 'abc', 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include end';
  var got = _.strRemoveEnd( 'abc', 'd' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( 'abc', 'ab' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - string' );

  /* - */

  test.open( 'src - string, end - array of strings' );

  test.case = 'empty string : empty strings';
  var got = _.strRemoveEnd( '', [ '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : strings';
  var got = _.strRemoveEnd( '', [ 'x', 'a', 'abc' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings';
  var got = _.strRemoveEnd( 'abc', [ '', '', '' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include one of ends';
  var got = _.strRemoveEnd( 'abc', [ 'd', 'ab', 'c' ] );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length < src.length';
  var got = _.strRemoveEnd( 'abc', [ 'bc', 'ab', 'da' ] );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length === src.length';
  var got = _.strRemoveEnd( 'abc', [ 'cba', 'dba', 'abc' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'include none of ends';
  var got = _.strRemoveEnd( 'abc', [ 'd', 'b', 'a' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( 'abc', [ 'a', 'ab' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - array of strings' );

  /* - */

  test.open( 'src - array of strings, end - string' );

  test.case = 'empty strings : empty string';
  var got = _.strRemoveEnd( [ '', '', '' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : string';
  var got = _.strRemoveEnd( [ '', '', '' ], 'x' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty string';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], 'bc' );
  var expected = [ 'a', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], 'ab' );
  var expected = [ 'abc', 'bca', 'c' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length';
  var got = _.strRemoveEnd( [ 'abc', 'cab', 'bca', 'cab' ], 'cab' );
  var expected = [ 'abc', '', 'bca', '' ];
  test.identical( got, expected );

  test.case = 'src include none of end';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], 'd' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( [ 'abc', 'bac', 'cab' ], 'ba' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - string' );

  /* - */

  test.open( 'src - array of strings, end - array of strings' );

  test.case = 'empty strings : empty strings';
  var got = _.strRemoveEnd( [ '', '', '' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings';
  var got = _.strRemoveEnd( [ '', '', '' ], [ 'x', 'a', 'b' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ '', '', '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ] );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'a', 'ca' ] );
  var expected = [ 'a', 'bc', 'cab' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length';
  var got = _.strRemoveEnd( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', 'bca' ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'src include none of ends';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', 'h' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( [ 'abc', 'bda', 'cab' ], [ 'cb', 'dc' ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - array of strings' );

  /* - */

  test.open( 'src - string, end - RegExp' );

  test.case = 'empty string : RegExp';
  var got = _.strRemoveEnd( '', /\w/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp';
  var got = _.strRemoveEnd( '', /\w/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : RegExp';
  var got = _.strRemoveEnd( 'abc', /\w/ );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'include end';
  var got = _.strRemoveEnd( 'abc', /\w{2}/ );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include end, end.length < src.length';
  var got = _.strRemoveEnd( 'abc', /\w/ );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'include end, end.length === src.length';
  var got = _.strRemoveEnd( 'abc', /\w*/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include end';
  var got = _.strRemoveEnd( 'abc', /\w\s/ );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( 'abc', /\sw/ );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - RegExp' );

  /* - */

  test.open( 'src - string, end - array of strings and RegExp' );

  test.case = 'empty string : empty strings and RegExp';
  var got = _.strRemoveEnd( '', [ '', /\w/, '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp';
  var got = _.strRemoveEnd( '', [ /\w\s/, /\w+/, /\w*/ ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings and RegExp';
  var got = _.strRemoveEnd( 'abc', [ '', '', /\w$/ ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include one of ends';
  var got = _.strRemoveEnd( 'abc', [ 'd', 'ba', /c/ ] );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length < src.length';
  var got = _.strRemoveEnd( 'abc', [ 'ba', /bc/, 'da' ] );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length === src.length';
  var got = _.strRemoveEnd( 'abc', [ 'cba', 'dba', /\w+/ ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'include none of ends';
  var got = _.strRemoveEnd( 'abc', [ 'd', 'b', /a/ ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( 'abc', [ 'a', /\s+/ ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - array of strings and RegExp' );

  /* - */

  test.open( 'src - array of strings, end - RegExp' );

  test.case = 'empty strings : RegExp';
  var got = _.strRemoveEnd( [ '', '', '' ], /\s/ );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp';
  var got = _.strRemoveEnd( [ '', '', '' ], /\w/ );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : RegExp';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], /\s*/ );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], /bc/ );
  var expected = [ 'a', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], /a\w/ );
  var expected = [ 'abc', 'bca', 'c' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length';
  var got = _.strRemoveEnd( [ 'abc', 'cab', 'bca', 'cab' ], /ca\w/ );
  var expected = [ 'abc', '', 'bca', '' ];
  test.identical( got, expected );

  test.case = 'src include none of end';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], /\wd/ );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( [ 'abc', 'bac', 'cab' ], /[efk]/ );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - RegExp' );

  /* - */

  test.open( 'src - array of strings, end - array of strings and RegExp' );

  test.case = 'empty strings : empty strings and RegExp';
  var got = _.strRemoveEnd( [ '', '', '' ], [ '', '', /\w\s/ ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp';
  var got = _.strRemoveEnd( [ '', '', '' ], [ 'x', /\d\D/, 'b' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ '', /\D/, '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', /[abc]/, 'ca' ] );
  var expected = [ 'a', 'bc', 'ca' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', /\w/, 'ca' ] );
  var expected = [ 'a', 'bc', 'ca' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length';
  var got = _.strRemoveEnd( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', /\w+$/ ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'src include none of ends';
  var got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', /\w\s/ ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strRemoveEnd( [ 'abc', 'bda', 'cab' ], [ 'ba', /\w\s/ ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - array of strings and RegExp' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strRemoveEnd() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strRemoveEnd( 'abcd', 'a', 'a' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strRemoveEnd( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strRemoveEnd( /\w*/, '2' ) );
  test.shouldThrowErrorSync( () => _.strRemoveEnd( [ 'str', 1 ], '2' ) );
  test.shouldThrowErrorSync( () => _.strRemoveEnd( [ 'str', /ex/ ], '2' ) );

  test.case = 'wrong type of end';
  test.shouldThrowErrorSync( () => _.strRemoveEnd( 'a', 1 ) );
  test.shouldThrowErrorSync( () => _.strRemoveEnd( 'a', null ) );
  test.shouldThrowErrorSync( () => _.strRemoveEnd( 'aa', [ ' a', 2 ] ) );

  test.case = 'invalid type of arguments';
  test.shouldThrowErrorSync( () => _.strRemoveEnd( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strRemoveEnd( null, null ) );
}

//

function strReplaceBegin( test )
{
  test.open( 'src - string, begin - string' );

  test.case = 'empty string : empty string : empty string';
  var got = _.strReplaceBegin( '', '', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : empty string : string';
  var got = _.strReplaceBegin( '', '', 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'empty string : string : empty string';
  var got = _.strReplaceBegin( '', 'x', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : string : string';
  var got = _.strReplaceBegin( '', 'x', 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty string : empty string';
  var got = _.strReplaceBegin( 'abc', '', '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty string : string';
  var got = _.strReplaceBegin( 'abc', '', 'abc' );
  var expected = 'abcabc';
  test.identical( got, expected );

  test.case = 'include begin, ins - empty string';
  var got = _.strReplaceBegin( 'abc', 'a', '' );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include begin, ins - string';
  var got = _.strReplaceBegin( 'abc', 'a', 'd' );
  var expected = 'dbc';
  test.identical( got, expected );

  test.case = 'include begin, begin.length === src.length';
  var got = _.strReplaceBegin( 'abc', 'abc', 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'not include begin';
  var got = _.strReplaceBegin( 'abc', 'd', 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( 'abc', 'bc', 'ab' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - string' );

  /* - */

  test.open( 'src - string, begin - array of strings' );

  test.case = 'empty string : empty strings : empty string';
  var got = _.strReplaceBegin( '', [ '', '', '' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : empty strings : string';
  var got = _.strReplaceBegin( '', [ '', '', '' ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'empty string : strings : empty string';
  var got = _.strReplaceBegin( '', [ 'x', 'a', 'abc' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : strings : string';
  var got = _.strReplaceBegin( '', [ 'x', 'a', 'abc' ], 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings : empty string';
  var got = _.strReplaceBegin( 'abc', [ '', '', '' ], '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty strings : string';
  var got = _.strReplaceBegin( 'abc', [ '', '', '' ], 'abc' );
  var expected = 'abcabc';
  test.identical( got, expected );

  test.case = 'include one of begins, ins - empty string';
  var got = _.strReplaceBegin( 'abc', [ 'd', 'bc', 'a' ], '' );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length < src.length';
  var got = _.strReplaceBegin( 'abc', [ 'bc', 'ab', 'da' ], 'cb' );
  var expected = 'cbc';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length === src.length';
  var got = _.strReplaceBegin( 'abc', [ 'cba', 'dba', 'abc' ], 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'include none of begins';
  var got = _.strReplaceBegin( 'abc', [ 'd', 'b', 'c' ], 'cb' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( 'abc', [ 'c', 'bc' ], 'ba' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - array of strings' );

  /* - */

  test.open( 'src - array of strings, begin - string' );

  test.case = 'empty strings : empty string : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], '', '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty string : string';
  var got = _.strReplaceBegin( [ '', '', '' ], '', 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : string : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], 'abc', '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : string : string';
  var got = _.strReplaceBegin( [ '', '', '' ], 'abc', 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty string : empty string';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], '', '' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty string : string';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], '', 'abc' );
  var expected = [ 'abcabc', 'abcbac', 'abccab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, ins - empty string';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], 'a', '' );
  var expected = [ 'bc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], 'ab', 'cb' );
  var expected = [ 'cbc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length === src.length';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], 'abc', 'cba' );
  var expected = [ 'cba', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'include none of begins';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], 'd', 'cb' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], 'bc', 'ba' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - string' );

  /* - */

  test.open( 'src - array of strings, begin - array of strings' );

  test.case = 'empty strings : empty strings : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ '', '', '' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings : string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ '', '', '' ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', 'a', 'b' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', 'a', 'b' ], 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : empty string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], 'abc' );
  var expected = [ 'abcabc', 'abcbca', 'abccab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, ins - empty string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], '' );
  var expected = [ 'c', 'a', 'b' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], 'abc' );
  var expected = [ 'abcc', 'abca', 'abcb' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'a', 'ca' ], 'abc ' );
  var expected = [ 'abc bc', 'abc a', 'abc b' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', 'bca' ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of begins';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', 'h' ], 'abc' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( [ 'abc', 'bda', 'cab' ], [ 'bc', 'da' ], 'abc' );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - array of strings' );

  /* - */

  test.open( 'src - array of strings, begin - array of strings, ins - array of strings' );

  test.case = 'empty strings : empty strings : empty strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ '', '', '' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings : strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ '', '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : empty strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', 'a', 'b' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', 'a', 'b' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : empty strings';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], [ '', '', '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abcabc', 'abcbca', 'abccab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, ins - empty strings';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], [ '', '', '' ] );
  var expected = [ 'c', 'a', 'b' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bacc', 'abca', 'cabb' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', 'a', 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bacbc', 'abca', 'cabb' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', 'bca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bac', 'abc', 'cab', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of begins';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', 'h' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( [ 'abc', 'bda', 'cab' ], [ 'bc', 'da' ], [ 'abc', 'bac' ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - array of strings, ins - array of strings' );

  /* - */

  test.open( 'src - string, begin - RegExp' );

  test.case = 'empty string : RegExp : empty string';
  var got = _.strReplaceBegin( '', /\w/, '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : string';
  var got = _.strReplaceBegin( '', /\w/, 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : empty string';
  var got = _.strReplaceBegin( '', /\w/, '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : string';
  var got = _.strReplaceBegin( '', /\w/, 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : RegExp : empty string';
  var got = _.strReplaceBegin( 'abc', /\w/, '' );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'string : RegExp : string';
  var got = _.strReplaceBegin( 'abc', /\w/, 'abc' );
  var expected = 'abcbc';
  test.identical( got, expected );

  test.case = 'include begin, ins - empty string';
  var got = _.strReplaceBegin( 'abc', /\w{2}/, '' );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'include begin, ins - string';
  var got = _.strReplaceBegin( 'abc', /\w{2}/, 'abc' );
  var expected = 'abcc';
  test.identical( got, expected );

  test.case = 'include begin, begin.length < src.length';
  var got = _.strReplaceBegin( 'abc', /\w/, 'abc' );
  var expected = 'abcbc';
  test.identical( got, expected );

  test.case = 'include begin, begin.length === src.length';
  var got = _.strReplaceBegin( 'abc', /\w*/, 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'not include begin';
  var got = _.strReplaceBegin( 'abc', /\w\s/, 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( 'abc', /\sw/, 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - RegExp' );

  /* - */

  test.open( 'src - string, begin - array of strings and RegExp' );

  test.case = 'empty string : empty strings and RegExp : empty string';
  var got = _.strReplaceBegin( '', [ '', /\w/, '' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : empty strings and RegExp : string';
  var got = _.strReplaceBegin( '', [ '', /\w/, '' ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : empty string';
  var got = _.strReplaceBegin( '', [ /\w\s/, /\w+/, /\w*/ ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : string';
  var got = _.strReplaceBegin( '', [ /\w\s/, /\w+/, /\w*/ ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty strings and RegExp : empty string';
  var got = _.strReplaceBegin( 'abc', [ '', '', /\w$/ ], '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty strings and RegExp : string';
  var got = _.strReplaceBegin( 'abc', [ '', '', /\w$/ ], 'abc' );
  var expected = 'abcabc';
  test.identical( got, expected );

  test.case = 'include one of begins';
  var got = _.strReplaceBegin( 'abc', [ 'd', 'bc', /a/ ], 'abc' );
  var expected = 'abcbc';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length < src.length';
  var got = _.strReplaceBegin( 'abc', [ 'bc', /ab/, 'da' ], 'abc' );
  var expected = 'abcc';
  test.identical( got, expected );

  test.case = 'include one of begins, begin.length === src.length';
  var got = _.strReplaceBegin( 'abc', [ 'cba', 'dba', /\w+/ ], 'bca' );
  var expected = 'bca';
  test.identical( got, expected );

  test.case = 'include none of begins';
  var got = _.strReplaceBegin( 'abc', [ 'd', 'b', /c/ ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( 'abc', [ 'c', /\s+/ ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, begin - array of strings and RegExp' );

  /* - */

  test.open( 'src - array of strings, begin - RegExp' );

  test.case = 'empty strings : RegExp : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], /\s/, '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp : string';
  var got = _.strReplaceBegin( [ '', '', '' ], /\s/, 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], /\w/, '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp : string';
  var got = _.strReplaceBegin( [ '', '', '' ], /\s*/, 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'strings : RegExp : empty string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], /\s*/, '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : RegExp : string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], /\s*/, 'abc' );
  var expected = [ 'abcabc', 'abcbca', 'abccab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], /bc/, 'abc' );
  var expected = [ 'abc', 'abca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], /a\w/, 'bca' );
  var expected = [ 'bcac', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length';
  var got = _.strReplaceBegin( [ 'abc', 'cab', 'bca', 'cab' ], /ca\w/, 'abc' );
  var expected = [ 'abc', 'abc', 'bca', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of begin';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], /\wd/, 'abc' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( [ 'abc', 'bac', 'cab' ], /[efk]/, 'abc' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - RegExp' );

  /* - */

  test.open( 'src - array of strings, begin - array of strings and RegExp' );

  test.case = 'empty strings : empty strings and RegExp : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ '', '', /\w\s/ ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings and RegExp : string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ '', '', /\w\s/ ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : empty string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', /\d\D/, 'b' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : string';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', /\d\D/, 'b' ], 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : empty string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ '', /\D/, '' ], '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ '', /\D/, '' ], 'abc' );
  var expected = [ 'abcabc', 'abcbca', 'abccab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', /[abc]/, 'ca' ], 'abc' );
  var expected = [ 'abcbc', 'abca', 'abcab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', /\w/, 'ca' ], 'abc' );
  var expected = [ 'abcbc', 'abca', 'abcab' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length';
  var got = _.strReplaceBegin( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', /\w+$/ ], 'bca' );
  var expected = [ 'bca', 'bca', 'bca', 'bca' ];
  test.identical( got, expected );

  test.case = 'src include none of begins';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', /\w\s/ ], 'abc' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( [ 'abc', 'bda', 'cab' ], [ 'bc', /\w\s/ ], 'abc' );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - array of strings and RegExp' );

  /* - */

  test.open( 'src - array of strings, begin - array of strings and RegExp, ins - array of strings' );

  test.case = 'empty strings : empty strings and RegExp : empty strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ /\s*/, '', '' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings and RegExp : strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ /\w*/, '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : empty strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', /\w*/, 'b' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : strings';
  var got = _.strReplaceBegin( [ '', '', '' ], [ 'x', /\s*/, 'b' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bac', 'bac', 'bac' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : empty strings';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ '', /\w+/, '' ], [ '', '', '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ /\w/, '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abcbc', 'abcca', 'abcab' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, ins - empty strings';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ /[bc]a/, 'ab', 'ca' ], [ '', '', '' ] );
  var expected = [ 'c', 'bca', 'b' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', /\w*/, 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bac', 'abca', 'bac' ];
  test.identical( got, expected );

  test.case = 'one of src includes begin, begin.length < src.length, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'bc', /[afk]/, 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bacbc', 'abca', 'cabb' ];
  test.identical( got, expected );

  test.case = 'src includes begin, begin.length === src.length, ins - string';
  var got = _.strReplaceBegin( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', /\w+/ ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bac', 'abc', 'cab', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of begins';
  var got = _.strReplaceBegin( [ 'abc', 'bca', 'cab' ], [ 'd', /\s+/, 'h' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'begin equal to end, not include';
  var got = _.strReplaceBegin( [ 'abc', 'bda', 'cab' ], [ 'bc', /[dhg]/ ], [ 'abc', 'bac' ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, begin - array of strings and RegExp, ins - array of strings' );


  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strReplaceBegin() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strReplaceBegin( 'abcd', 'a', 'a', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strReplaceBegin( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strReplaceBegin( /\w*/, '2' ) );
  test.shouldThrowErrorSync( () => _.strReplaceBegin( [ 'str', 1 ], '2' ) );
  test.shouldThrowErrorSync( () => _.strReplaceBegin( [ 'str', /ex/ ], '2' ) );

  test.case = 'wrong type of begin';
  test.shouldThrowErrorSync( () => _.strReplaceBegin( 'a', 1 ) );
  test.shouldThrowErrorSync( () => _.strReplaceBegin( 'a', null ) );
  test.shouldThrowErrorSync( () => _.strReplaceBegin( 'aa', [ ' a', 2 ] ) );

  test.case = 'invalid type of arguments';
  test.shouldThrowErrorSync( () => _.strReplaceBegin( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strReplaceBegin( null, null ) );
}

//

function strReplaceEnd( test )
{
  test.open( 'src - string, end - string' );

  test.case = 'empty string : empty string : empty string';
  var got = _.strReplaceEnd( '', '', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : empty string : string';
  var got = _.strReplaceEnd( '', '', 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'empty string : string : empty string';
  var got = _.strReplaceEnd( '', 'x', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : string : string';
  var got = _.strReplaceEnd( '', 'x', 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty string : empty string';
  var got = _.strReplaceEnd( 'abc', '', '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty string : string';
  var got = _.strReplaceEnd( 'abc', '', 'abc' );
  var expected = 'abcabc';
  test.identical( got, expected );

  test.case = 'include end, ins - empty string';
  var got = _.strReplaceEnd( 'abc', 'c', '' );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'include end, ins - string';
  var got = _.strReplaceEnd( 'abc', 'c', 'd' );
  var expected = 'abd';
  test.identical( got, expected );

  test.case = 'include end, end.length === src.length';
  var got = _.strReplaceEnd( 'abc', 'abc', 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'not include end';
  var got = _.strReplaceEnd( 'abc', 'd', 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( 'abc', 'ac', 'ab' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - string' );

  /* - */

  test.open( 'src - string, end - array of strings' );

  test.case = 'empty string : empty strings : empty string';
  var got = _.strReplaceEnd( '', [ '', '', '' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : empty strings : string';
  var got = _.strReplaceEnd( '', [ '', '', '' ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'empty string : strings : empty string';
  var got = _.strReplaceEnd( '', [ 'x', 'a', 'abc' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : strings : string';
  var got = _.strReplaceEnd( '', [ 'x', 'a', 'abc' ], 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings : empty string';
  var got = _.strReplaceEnd( 'abc', [ '', '', '' ], '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty strings : string';
  var got = _.strReplaceEnd( 'abc', [ '', '', '' ], 'abc' );
  var expected = 'abcabc';
  test.identical( got, expected );

  test.case = 'include one of ends, ins - empty string';
  var got = _.strReplaceEnd( 'abc', [ 'd', 'bc', 'c' ], '' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length < src.length';
  var got = _.strReplaceEnd( 'abc', [ 'bc', 'ab', 'da' ], 'cb' );
  var expected = 'acb';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length === src.length';
  var got = _.strReplaceEnd( 'abc', [ 'cba', 'dba', 'abc' ], 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'include none of ends';
  var got = _.strReplaceEnd( 'abc', [ 'd', 'b', 'a' ], 'cb' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( 'abc', [ 'd', 'ac' ], 'ba' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - array of strings' );

  /* - */

  test.open( 'src - array of strings, end - string' );

  test.case = 'empty strings : empty string : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], '', '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty string : string';
  var got = _.strReplaceEnd( [ '', '', '' ], '', 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : string : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], 'abc', '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : string : string';
  var got = _.strReplaceEnd( [ '', '', '' ], 'abc', 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty string : empty string';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], '', '' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty string : string';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], '', 'abc' );
  var expected = [ 'abcabc', 'bacabc', 'cababc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, ins - empty string';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], 'c', '' );
  var expected = [ 'ab', 'ba', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], 'ab', 'cb' );
  var expected = [ 'abc', 'bac', 'ccb' ];
  test.identical( got, expected );

  test.case = 'include one of ends, end.length === src.length';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], 'abc', 'cba' );
  var expected = [ 'cba', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'include none of ends';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], 'd', 'cb' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], 'cb', 'ba' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - string' );

  /* - */

  test.open( 'src - array of strings, end - array of strings' );

  test.case = 'empty strings : empty strings : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ '', '', '' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings : string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ '', '', '' ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', 'a', 'b' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', 'a', 'b' ], 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : empty string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], 'abc' );
  var expected = [ 'abcabc', 'bcaabc', 'cababc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, ins - empty string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], '' );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], 'abc' );
  var expected = [ 'aabc', 'babc', 'cabc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'a', 'ca' ], 'abc ' );
  var expected = [ 'aabc ', 'bcabc ', 'cab' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', 'bca' ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of ends';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', 'h' ], 'abc' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( [ 'abc', 'bda', 'cab' ], [ 'ca', 'dc' ], 'abc' );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - array of strings' );

  /* - */

  test.open( 'src - array of strings, end - array of strings, ins - array of strings' );

  test.case = 'empty strings : empty strings : empty strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ '', '', '' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings : strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ '', '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : empty strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', 'a', 'b' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings : strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', 'a', 'b' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : empty strings';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], [ '', '', '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings : string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ '', '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abcabc', 'bcaabc', 'cababc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, ins - empty strings';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], [ '', '', '' ] );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'aabc', 'bcab', 'cbac' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', 'a', 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'aabc', 'bcbac', 'cab' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', 'bca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bac', 'abc', 'cab', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of ends';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', 'h' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( [ 'abc', 'bda', 'cab' ], [ 'ba', 'dc' ], [ 'abc', 'bac' ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - array of strings, ins - array of strings' );

  /* - */

  test.open( 'src - string, end - RegExp' );

  test.case = 'empty string : RegExp : empty string';
  var got = _.strReplaceEnd( '', /\w/, '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : string';
  var got = _.strReplaceEnd( '', /\w/, 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : empty string';
  var got = _.strReplaceEnd( '', /\w/, '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : string';
  var got = _.strReplaceEnd( '', /\w/, 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : RegExp : empty string';
  var got = _.strReplaceEnd( 'abc', /\w/, '' );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'string : RegExp : string';
  var got = _.strReplaceEnd( 'abc', /\w/, 'abc' );
  var expected = 'ababc';
  test.identical( got, expected );

  test.case = 'include end, ins - empty string';
  var got = _.strReplaceEnd( 'abc', /\w{2}/, '' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include end, ins - string';
  var got = _.strReplaceEnd( 'abc', /\w{2}/, 'abc' );
  var expected = 'aabc';
  test.identical( got, expected );

  test.case = 'include end, end.length < src.length';
  var got = _.strReplaceEnd( 'abc', /\w/, 'abc' );
  var expected = 'ababc';
  test.identical( got, expected );

  test.case = 'include end, end.length === src.length';
  var got = _.strReplaceEnd( 'abc', /\w*/, 'cab' );
  var expected = 'cab';
  test.identical( got, expected );

  test.case = 'not include end';
  var got = _.strReplaceEnd( 'abc', /\w\s/, 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( 'abc', /\sw/, 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - RegExp' );

  /* - */

  test.open( 'src - string, end - array of strings and RegExp' );

  test.case = 'empty string : empty strings and RegExp : empty string';
  var got = _.strReplaceEnd( '', [ '', /\w/, '' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : empty strings and RegExp : string';
  var got = _.strReplaceEnd( '', [ '', /\w/, '' ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : empty string';
  var got = _.strReplaceEnd( '', [ /\w\s/, /\w+/, /\w*/ ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : RegExp : string';
  var got = _.strReplaceEnd( '', [ /\w\s/, /\w+/, /\w*/ ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty strings and RegExp : empty string';
  var got = _.strReplaceEnd( 'abc', [ '', '', /\w$/ ], '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string : empty strings and RegExp : string';
  var got = _.strReplaceEnd( 'abc', [ '', '', /\w$/ ], 'abc' );
  var expected = 'abcabc';
  test.identical( got, expected );

  test.case = 'include one of ends';
  var got = _.strReplaceEnd( 'abc', [ 'd', 'bc', /a/ ], 'abc' );
  var expected = 'aabc';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length < src.length';
  var got = _.strReplaceEnd( 'abc', [ /bc/, /ab/, 'da' ], 'abc' );
  var expected = 'aabc';
  test.identical( got, expected );

  test.case = 'include one of ends, end.length === src.length';
  var got = _.strReplaceEnd( 'abc', [ 'cba', 'dba', /\w+/ ], 'bca' );
  var expected = 'bca';
  test.identical( got, expected );

  test.case = 'include none of ends';
  var got = _.strReplaceEnd( 'abc', [ 'd', 'b', /a/ ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( 'abc', [ 'a', /\s+/ ], 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, end - array of strings and RegExp' );

  /* - */

  test.open( 'src - array of strings, end - RegExp' );

  test.case = 'empty strings : RegExp : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], /\s/, '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp : string';
  var got = _.strReplaceEnd( [ '', '', '' ], /\s/, 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], /\w/, '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : RegExp : string';
  var got = _.strReplaceEnd( [ '', '', '' ], /\s*/, 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'strings : RegExp : empty string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], /\s*/, '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : RegExp : string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], /\s*/, 'abc' );
  var expected = [ 'abcabc', 'bcaabc', 'cababc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], /bc/, 'abc' );
  var expected = [ 'aabc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], /a\w/, 'bca' );
  var expected = [ 'abc', 'bca', 'cbca' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length';
  var got = _.strReplaceEnd( [ 'abc', 'cab', 'bca', 'cab' ], /ca\w/, 'abc' );
  var expected = [ 'abc', 'abc', 'bca', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of end';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], /\wd/, 'abc' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( [ 'abc', 'bac', 'cab' ], /[efk]/, 'abc' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - RegExp' );

  /* - */

  test.open( 'src - array of strings, end - array of strings and RegExp' );

  test.case = 'empty strings : empty strings and RegExp : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ '', '', /\w\s/ ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings and RegExp : string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ '', '', /\w\s/ ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : empty string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', /\d\D/, 'b' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : string';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', /\s*/, 'b' ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : empty string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ '', /\D/, '' ], '' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ /\w*/, /\D/, '' ], 'abc' );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', /[abc]/, 'ca' ], 'abc' );
  var expected = [ 'aabc', 'bcabc', 'caabc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', /\w/, 'ca' ], 'abc' );
  var expected = [ 'aabc', 'bcabc', 'caabc' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length';
  var got = _.strReplaceEnd( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', /\w+$/ ], 'bca' );
  var expected = [ 'bca', 'bca', 'bca', 'bca' ];
  test.identical( got, expected );

  test.case = 'src include none of ends';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'd', 'j', /\w\s/ ], 'abc' );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( [ 'abc', 'bda', 'cab' ], [ 'ba', /\w\s/ ], 'abc' );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - array of strings and RegExp' );

  /* - */

  test.open( 'src - array of strings, end - array of strings and RegExp, ins - array of strings' );

  test.case = 'empty strings : empty strings and RegExp : empty strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ /\s*/, '', '' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : empty strings and RegExp : strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ /\w*/, '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'abc', 'abc' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : empty strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', /\w*/, 'b' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings and RegExp : strings';
  var got = _.strReplaceEnd( [ '', '', '' ], [ 'x', /\s*/, 'b' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bac', 'bac', 'bac' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : empty strings';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ '', /\w+/, '' ], [ '', '', '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ /\w/, '', '' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'ababc', 'bcabc', 'caabc' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, ins - empty strings';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ /[bc]a/, 'ab', 'ca' ], [ '', '', '' ] );
  var expected = [ 'abc', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', /\w*/, 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'aabc', 'bac', 'bac' ];
  test.identical( got, expected );

  test.case = 'one of src includes end, end.length < src.length, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'bc', /[afk]/, 'ca' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'aabc', 'bcbac', 'cab' ];
  test.identical( got, expected );

  test.case = 'src includes end, end.length === src.length, ins - string';
  var got = _.strReplaceEnd( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', /\w+/ ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'bac', 'abc', 'cab', 'abc' ];
  test.identical( got, expected );

  test.case = 'src include none of ends';
  var got = _.strReplaceEnd( [ 'abc', 'bca', 'cab' ], [ 'd', /\s+/, 'h' ], [ 'abc', 'bac', 'cab' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'end equal to begin, not include';
  var got = _.strReplaceEnd( [ 'abc', 'bda', 'cab' ], [ 'ba', /[dhg]/ ], [ 'abc', 'bac' ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, end - array of strings and RegExp, ins - array of strings' );


  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strReplaceEnd() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strReplaceEnd( 'abcd', 'a', 'a', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strReplaceEnd( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strReplaceEnd( /\w*/, '2' ) );
  test.shouldThrowErrorSync( () => _.strReplaceEnd( [ 'str', 1 ], '2' ) );
  test.shouldThrowErrorSync( () => _.strReplaceEnd( [ 'str', /ex/ ], '2' ) );

  test.case = 'wrong type of end';
  test.shouldThrowErrorSync( () => _.strReplaceEnd( 'a', 1 ) );
  test.shouldThrowErrorSync( () => _.strReplaceEnd( 'a', null ) );
  test.shouldThrowErrorSync( () => _.strReplaceEnd( 'aa', [ ' a', 2 ] ) );

  test.case = 'invalid type of arguments';
  test.shouldThrowErrorSync( () => _.strReplaceEnd( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strReplaceEnd( null, null ) );
}

//

function strReplaceSrcIsString( test )
{
  test.open( 'src - string, ins - string' );

  test.case = 'src - empty string, ins - string, sub - empty string';
  var got = _.strReplace( '', 'x', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - string, sub - string';
  var got = _.strReplace( '', 'x', 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', 'd', 'abc' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', 'ac', 'ab' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - string, single entry, sub - empty string';
  var got = _.strReplace( 'ca cb cc', 'a', '' );
  var expected = 'c cb cc';
  test.identical( got, expected );

  test.case = 'ins - string, single entry, sub - string';
  var got = _.strReplace( 'ca cb cc', 'a', 'd' );
  var expected = 'cd cb cc';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - empty string';
  var got = _.strReplace( 'ca cb cc', 'c', '' );
  var expected = 'a b ';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - string';
  var got = _.strReplace( 'ca cb cc', 'c', 'd' );
  var expected = 'da db dd';
  test.identical( got, expected );

  test.case = 'src === ins';
  var got = _.strReplace( 'abc', 'abc', 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'src is palindrom';
  var got = _.strReplace( 'abcdcba', 'c', 'a' );
  var expected = 'abadaba';
  test.identical( got, expected );

  test.close( 'src - string, ins - string' );

  /* - */

  test.open( 'src - string, ins - array of strings, sub - string' );

  test.case = 'src - empty string, ins - array of strings, sub - empty string';
  var got = _.strReplace( '', [ 'a', 'b', 'c' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of strings, sub - string';
  var got = _.strReplace( '', [ 'a', 'b', 'c' ], 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ 'd', 'e', 'f' ], 'abc' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ 'cab', 'ce', 'cf' ], 'ab' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - empty string';
  var got = _.strReplace( 'ca cb cc', [ 'a', 'bc', 'cd' ], '' );
  var expected = 'c cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - string';
  var got = _.strReplace( 'ca cb cc', [ 'a', 'bc', 'cd' ], 'd' );
  var expected = 'cd cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - empty string';
  var got = _.strReplace( 'ca cb cc', [ 'a', 'b', 'c', ' ' ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - string';
  var got = _.strReplace( 'ca cb cc', [ 'ca', 'cb', 'c' ], 'd' );
  var expected = 'd d dd';
  test.identical( got, expected );

  test.case = 'src === ins';
  var got = _.strReplace( 'abc', [ 'adb', 'aab', 'abc' ], 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'src is palindrom';
  var got = _.strReplace( 'abcdcba', [ 'd', 'c', 'b', 'a' ], 'a' );
  var expected = 'aa'+'aa'+'aa'+'a';
  test.identical( got, expected );

  test.close( 'src - string, ins - array of strings, sub - string' );

  /* - */

  test.open( 'src - string, ins - array of strings, sub - array of strings' );

  test.case = 'src - empty string, ins - array of strings, sub - array of empty strings';
  var got = _.strReplace( '', [ 'a', 'b', 'c' ], [ '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of strings, sub - array of strings';
  var got = _.strReplace( '', [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ 'd', 'e', 'f' ], [ 'a', 'b', 'c' ] );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ 'cab', 'ce', 'cf' ], [ 'a', 'b', 'c' ] );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - array of empty strings';
  var got = _.strReplace( 'ca cb cc', [ 'a', 'bc', 'cd' ], [ '', '', '' ] );
  var expected = 'c cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - array of strings';
  var got = _.strReplace( 'ca cb cc', [ 'a', 'bc', 'cd' ], [ 'd', 'e', 'f' ] );
  var expected = 'cd cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - array of empty strings';
  var got = _.strReplace( 'ca cb cc', [ 'a', 'b', 'c', ' ' ], [ '', '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - array of strings';
  var got = _.strReplace( 'ca cb cc', [ 'ca', 'cb', 'c' ], [ 'e', 'f', 'd' ] );
  var expected = 'e f dd';
  test.identical( got, expected );

  test.case = 'src === ins';
  var got = _.strReplace( 'abc', [ 'adb', 'aab', 'abc' ], [ 'a', 'b', 'cba' ] );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'src is palindrom';
  var got = _.strReplace( 'aabbccddccbbaa', [ 'dd', 'cc', 'bb', 'aa' ], [ 'aa', 'bb', 'cc', 'dd' ] );
  var expected = 'ddccbbaabbccdd';
  test.identical( got, expected );

  test.close( 'src - string, ins - array of strings, sub - array of strings' );

  /* - */

  test.open( 'src - string, ins - RegExp' );

  test.case = 'src - empty string, ins - RegExp, sub - empty string';
  var got = _.strReplace( '', /\w+/, '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - RegExp, sub - empty string';
  var got = _.strReplace( '', /\w/, '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - RegExp, sub - string';
  var got = _.strReplace( '', /\w/, 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - RegExp, sub - string';
  var got = _.strReplace( '', /(?:a)/, 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', /\w\s\s/, 'abc' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', /\sw/, 'abc' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - empty string';
  var got = _.strReplace( 'ca cb cc', /a/, '' );
  var expected = 'c cb cc';
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - string';
  var got = _.strReplace( 'ca cb cc', /a/, 'd' );
  var expected = 'cd cb cc';
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - empty string';
  var got = _.strReplace( 'ca cb cc', /c+/, '' );
  var expected = 'a b ';
  test.identical( got, expected );

  test.case = 'ins - RegExp, sub - empty string';
  var got = _.strReplace( 'ca cb cc', /(?:ba)/, '' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - string';
  var got = _.strReplace( 'ca cb cc', /(?:ba)/, 'd' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - string';
  var got = _.strReplace( 'ca cb cc', /c+/, 'd' );
  var expected = 'da db d';
  test.identical( got, expected );

  test.case = 'src == ins';
  var got = _.strReplace( 'abc', /\w+/, 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'src is palindrom';
  var got = _.strReplace( 'abcdcba', /c+/, 'a' );
  var expected = 'abadaba';
  test.identical( got, expected );

  test.close( 'src - string, ins - RegExp' );

  /* - */

  test.open( 'src - string, ins - array of strings and RegExp, sub - string' );

  test.case = 'src - empty string, ins - array of RegExps, sub - array of empty strings';
  var got = _.strReplace( '', [ /a/, /\w/, /\s/ ], [ '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of RegExps, sub - array of empty strings';
  var got = _.strReplace( '', [ /a$/, /\w+/, /(?:a)/ ], [ '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of RegExps, sub - array of strings';
  var got = _.strReplace( '', [ /a/, /\w/, /\s/ ], [ 'a', 'b', 'c' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of RegExps, sub - array of strings';
  var got = _.strReplace( '', [ /a+/, /\w$/, /(?:a)/ ], [ 'a', 'b', 'c' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ /\sa/, /\w\s{2}/, /\s\W/ ], [ 'a', 'b', 'c' ] );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ /\sa/, /\w\s{3}/, /\s\W/ ], [ 'a', 'b', 'c' ] );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of RegExps, single entry, sub - array of empty strings';
  var got = _.strReplace( 'ca cb cc', [ /(?:a)/, /\w{3}/, /\w\s\W/ ], [ '', '', '' ] );
  var expected = 'c cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of RegExps, single entry, sub - array of strings';
  var got = _.strReplace( 'ca cb cc', [ /(?:a)/, /\w{3}/, /\w\s\W/ ], [ 'd', '', 'k' ] );
  var expected = 'cd cb cc';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - array of empty strings';
  var got = _.strReplace( 'ca cb cc', [ /ca/, /\wb/, /\s\wc/, /\s/ ], [ '', '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - array of empty string';
  var got = _.strReplace( 'ca cb cc', [ /(?:aa)/, /\wd/, /\s\we/, /\s{2}/ ], [ '', '', '', '' ] );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - array of strings';
  var got = _.strReplace( 'ca cb cc', [ /ca/, /\wb/, /\s\wc/, /\s/ ], [ 'd', 'd', 'd', 'e' ] );
  var expected = 'dedd';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - array of strings';
  var got = _.strReplace( 'ca cb cc', [ /(?:aa)/, /\wd/, /\s\we/, /\s{2}/ ], [ 'd', 'a', 'f', 'k' ] );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src == ins';
  var got = _.strReplace( 'abc', [ /\s+/, /\s\w/, /\w+/  ], [ 'a', 'f', 'cba' ] );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'src is palindrom';
  var got = _.strReplace( 'abcdcba', [ /d/, /^a+/, /a$/, /\s*b/m, /c/ ], 'a' );
  var expected = 'aa'+'aa'+'aa'+'a';
  test.identical( got, expected );

  test.close( 'src - string, ins - array of strings and RegExp, sub - string' );

  /* - */

  test.open( 'src - string, ins - array of strings and RegExp, sub - array of strings' );

  test.case = 'src - empty string, ins - array of RegExps, sub - empty string';
  var got = _.strReplace( '', [ /a/, /\w/, /\s/ ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of RegExps, sub - empty string';
  var got = _.strReplace( '', [ /a+/, /\w+/, /(?:a)/ ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of RegExps, sub - string';
  var got = _.strReplace( '', [ /a/, /\w/, /\s/ ], 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty string, ins - array of RegExps, sub - string';
  var got = _.strReplace( '', [ /a+/, /\w+/, /(?:a)/ ], 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ /\sa/, /\w\s{2}/, /\s\W/ ], 'abc' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( 'ca cb cc', [ /\sa/, /\w\s{3}/, /\s\W/ ], 'ab' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of RegExps, single entry, sub - empty string';
  var got = _.strReplace( 'ca cb cc', [ /(?:a)/, /\w{3}/, /\w\s\W/ ], '' );
  var expected = 'c cb cc';
  test.identical( got, expected );

  test.case = 'ins - array of RegExps, single entry, sub - string';
  var got = _.strReplace( 'ca cb cc', [ /(?:a)/, /\w{3}/, /\w\s\W/ ], 'd' );
  var expected = 'cd cb cc';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - empty string';
  var got = _.strReplace( 'ca cb cc', [ /ca/, /\wb/, /\s\wc/, /\s/ ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - empty string';
  var got = _.strReplace( 'ca cb cc', [ /(?:aa)/, /\wd/, /\s\we/, /\s{2}/ ], '' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - string';
  var got = _.strReplace( 'ca cb cc', [ /ca/, /\wb/, /\s\wc/, /\s/ ], 'd' );
  var expected = 'dd'+'dd';
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - string';
  var got = _.strReplace( 'ca cb cc', [ /(?:aa)/, /\wd/, /\s\we/, /\s{2}/ ], 'd' );
  var expected = 'ca cb cc';
  test.identical( got, expected );

  test.case = 'src == ins';
  var got = _.strReplace( 'abc', [ /\s+/, /\s\w/, /\w+/  ], 'cba' );
  var expected = 'cba';
  test.identical( got, expected );

  test.case = 'src is palindrom';
  var got = _.strReplace( 'abcdcba', [ /d/, /^a+/, /a$/, /\s*b/m, /c/ ], [ '1', '4', '4', '3', '2' ] );
  var expected = '4321234';
  test.identical( got, expected );

  test.close( 'src - string, ins - array of strings and RegExp, sub - array of strings' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strReplace() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strReplace( 'abcd', 'a', 'a', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strReplace( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strReplace( /\w*/, '2' ) );
  test.shouldThrowErrorSync( () => _.strReplace( [ 'str', 1 ], '2' ) );
  test.shouldThrowErrorSync( () => _.strReplace( [ 'str', /ex/ ], '2' ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.strReplace( 'a', 1 ) );
  test.shouldThrowErrorSync( () => _.strReplace( 'a', '' ) );
  test.shouldThrowErrorSync( () => _.strReplace( 'a', null ) );
  test.shouldThrowErrorSync( () => _.strReplace( 'aa', [ ' a', 2 ] ) );
  test.shouldThrowErrorSync( () => _.strReplace( 'aa', [ '', 2 ] ) );

  test.case = 'invalid type of arguments';
  test.shouldThrowErrorSync( () => _.strReplace( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strReplace( null, null ) );
}

//

function strReplaceSrcIsArrayOfStrings( test )
{
  test.open( 'src - array of strings, ins - string' );

  test.case = 'src - array with empty strings ins - string, sub - empty string';
  var got = _.strReplace( [ '', '', '' ], 'x', '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - string, sub - string';
  var got = _.strReplace( [ '', '', '' ], 'x', 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], 'd', 'abc' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], 'ad', 'ab' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'ins - string, single entry, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], 'd', '' );
  var expected = [ 'aa ab ac a', 'ba bb bc b', 'ca cb cc c' ];
  test.identical( got, expected );

  test.case = 'ins - string, single entry, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], 'd', 'e' );
  var expected = [ 'aa ab ac ae', 'ba bb bc be', 'ca cb cc ce' ];
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], 'c', '' );
  var expected = [ 'aa ab a ad', 'ba bb b bd', 'a b  d' ];
  test.identical( got, expected );

  test.case = 'ins - string, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], 'c', 'd' );
  var expected = [ 'aa ab ad ad', 'ba bb bd bd', 'da db dd dd' ];
  test.identical( got, expected );

  test.case = 'src === ins';
  var got = _.strReplace( [ 'bbc', 'abc', 'abc' ], 'abc', 'cba' );
  var expected = [ 'bbc', 'cba', 'cba' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, ins - string' );

  /* - */

  test.open( 'src - array of strings, ins - array of strings' );

  test.case = 'src - array with empty strings ins - array of strings, sub - empty string';
  var got = _.strReplace( [ '', '', '' ], [ 'a', 'b', 'c' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - array of strings, sub - string';
  var got = _.strReplace( [ '', '', '' ], [ 'a', 'b', 'c' ], 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ 'd', 'e', 'f' ], 'abc' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ 'ad', 'bd', 'cd' ], 'ab' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'e', 'd', 'f' ], '' );
  var expected = [ 'aa ab ac a', 'ba bb bc b', 'ca cb cc c' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'e', 'd', 'f' ], 'e' );
  var expected = [ 'aa ab ac ae', 'ba bb bc be', 'ca cb cc ce' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'c', 'e', 'f' ], '' );
  var expected = [ 'aa ab a ad', 'ba bb b bd', 'a b  d' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'e', 'f', 'c' ], 'd' );
  var expected = [ 'aa ab ad ad', 'ba bb bd bd', 'da db dd dd' ];
  test.identical( got, expected );

  test.case = 'src === ins';
  var got = _.strReplace( [ 'bbc', 'abc', 'abc' ], [ 'ssd', 'abc', 'abc' ], 'cba' );
  var expected = [ 'bbc', 'cba', 'cba' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, ins - array of strings' );

  /* - */

  test.open( 'src - array of strings, ins - array of strings, sub - array of strings' );

  test.case = 'src - array with empty strings ins - string, sub - array of empty strings';
  var got = _.strReplace( [ '', '', '' ], [ 'a', 'b', 'c' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - string, sub - array of strings';
  var got = _.strReplace( [ '', '', '' ], [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ 'd', 'e', 'f' ], [ 'a', 'b', 'c' ] );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ 'ad', 'bd', 'cd' ], [ 'a', 'b', 'c' ] );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'e', 'd', 'f' ], [ '', '', '' ] );
  var expected = [ 'aa ab ac a', 'ba bb bc b', 'ca cb cc c' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, single entry, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'e', 'd', 'f' ], [ 'a', 'e', 'c' ] );
  var expected = [ 'aa ab ac ae', 'ba bb bc be', 'ca cb cc ce' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'c', 'e', 'f' ], [ '', '', '' ] );
  var expected = [ 'aa ab a ad', 'ba bb b bd', 'a b  d' ];
  test.identical( got, expected );

  test.case = 'ins - array of strings, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ 'e', 'f', 'c' ], [ 'a', 'f', 'd' ] );
  var expected = [ 'aa ab ad ad', 'ba bb bd bd', 'da db dd dd' ];
  test.identical( got, expected );

  test.case = 'src === ins';
  var got = _.strReplace( [ 'bbc', 'abc', 'abc' ], [ 'ssd', 'abc', 'abc' ], [ 'abc', 'cba', 'ssd' ] );
  var expected = [ 'bbc', 'cba', 'cba' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, ins - array of strings, sub - array of strings' );

  /* - */

  /* - */

  test.open( 'src - array of strings, ins - RegExp' );

  test.case = 'src - array with empty strings ins - RegExp, sub - empty string';
  var got = _.strReplace( [ '', '', '' ], /a/, '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings ins - RegExp, sub - empty string';
  var got = _.strReplace( [ '', '', '' ], /(?:a)/, '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - RegExp, sub - string';
  var got = _.strReplace( [ '', '', '' ], /a/, 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - RegExp, sub - string';
  var got = _.strReplace( [ '', '', '' ], /(?:a)/, 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], /d\s*/g, 'abc' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], /\wad\s/m, 'ab' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cD' ], /\s*d/i, '' );
  var expected = [ 'aa ab ac a', 'ba bb bc b', 'ca cb cc c' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bD', 'ca cb cc cd' ], /\s*d/i, 'e' );
  var expected = [ 'aa ab ac ae', 'ba bb bc be', 'ca cb cc ce' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], /c+/, '' );
  var expected = [ 'aa ab a ad', 'ba bb b bd', 'a b  d' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], /(?:ee)/, '' );
  var expected = [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], /c+/, 'd' );
  var expected = [ 'aa ab ad ad', 'ba bb bd bd', 'da db d dd' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], /(?:ee)/, 'd' );
  var expected = [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ];
  test.identical( got, expected );

  test.case = 'src == ins';
  var got = _.strReplace( [ 'bbc', 'abc', 'abc' ], /abc*$/, 'cba' );
  var expected = [ 'bbc', 'cba', 'cba' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, ins - RegExp' );

  /* - */

  test.open( 'src - array of strings, ins - array of RegExp' );

  test.case = 'src - array with empty strings ins - array of RegExps, sub - empty string';
  var got = _.strReplace( [ '', '', '' ], [ /a/, /b/, /c/ ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings ins - array of RegExps, sub - empty string';
  var got = _.strReplace( [ '', '', '' ], [ /(?:a)/, /\w+$/, /\sa*/ ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - array of RegExps, sub - string';
  var got = _.strReplace( [ '', '', '' ], [ /a/, /b/, /c/ ], 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - array of RegExps, sub - string';
  var got = _.strReplace( [ '', '', '' ], [ /(?:a)/, /\w+$/, /\sa*/ ], 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ /\sa\s/m, /\wa\s+$/g, /^\sa/i ], 'abc' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ /\sa\s/m, /\w\s{3}$/, /\wad\s/m ], 'ab' );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cD' ], [ /f\s/, /\W$/, /\s*d/i ], '' );
  var expected = [ 'aa ab ac a', 'ba bb bc b', 'ca cb cc c' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bD', 'ca cb cc cd' ], [ /f\s/, /\W+$/, /\s*d/i ], 'e' );
  var expected = [ 'aa ab ac ae', 'ba bb bc be', 'ca cb cc ce' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /c+/, /f+$/, /\s+e/ ], '' );
  var expected = [ 'aa ab a ad', 'ba bb b bd', 'a b  d' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - empty string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /(?:ee)/, /f+$/, /e+d/ ], '' );
  var expected = [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /\W+$/, /c+/, /\s*e/ ], 'd' );
  var expected = [ 'aa ab ad ad', 'ba bb bd bd', 'da db d dd' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /(?:ee)/, /f+/, /\s+e/ ], 'd' );
  var expected = [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ];
  test.identical( got, expected );

  test.case = 'src == ins';
  var got = _.strReplace( [ 'bbc', 'abc', 'abc' ], [ /\w+k/, /abc*$/, /abc\s*$/ ], 'cba' );
  var expected = [ 'bbc', 'cba', 'cba' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, ins - array of RegExp' );

  /* - */

  test.open( 'src - array of strings, ins - array of RegExp, sub - array of strings' );

  test.case = 'src - array with empty strings ins - array of RegExps, sub - array of empty strings';
  var got = _.strReplace( [ '', '', '' ], [ /a/, /b/, /c/ ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings ins - array of RegExps, sub - array of empty strings';
  var got = _.strReplace( [ '', '', '' ], [ /(?:a)/, /\w$/, /\s+/ ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - array of RegExps, sub - array of strings';
  var got = _.strReplace( [ '', '', '' ], [ /a/, /b/, /c/ ], [ 'a', 'b', 'c' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src - array with empty strings, ins - array of RegExps, sub - array of strings';
  var got = _.strReplace( [ '', '', '' ], [ /(?:a)/, /\w$/, /\s+/ ], [ 'a', 'b', 'c' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ /\sa\s/m, /\wa\s+$/g, /^\sa/i ], [ 'a', 'b', 'c' ] );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'src has not ins entry';
  var got = _.strReplace( [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ], [ /\sa\s/m, /\w\s{3}$/, /\wad\s/m ], [ 'a', 'b', 'c' ] );
  var expected = [ 'aa ab ac', 'ba bb bc', 'ca cb cc' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - array of empty strings';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cD' ], [ /f\s/, /\W+$/, /\s*d/i ], [ '', '', '' ] );
  var expected = [ 'aa ab ac a', 'ba bb bc b', 'ca cb cc c' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, single entry, sub - array of strings';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bD', 'ca cb cc cd' ], [ /f\s/, /\W+$/, /\s*d/i ], [ 'a', 'b', 'e' ] );
  var expected = [ 'aa ab ac ae', 'ba bb bc be', 'ca cb cc ce' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - array of empty strings';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /c+/, /f+$/, /\se/ ], [ '', '', '' ] );
  var expected = [ 'aa ab a ad', 'ba bb b bd', 'a b  d' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - array of empty strings';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /(?:ee)/, /f+$/, /e+d/ ], [ '', '', '' ] );
  var expected = [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - array of strings';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /\W$/, /c+/, /\s*e/ ], [ 'e', 'd', 'b' ] );
  var expected = [ 'aa ab ad ad', 'ba bb bd bd', 'da db d dd' ];
  test.identical( got, expected );

  test.case = 'ins - RegExp, a few entries, sub - string';
  var got = _.strReplace( [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ], [ /(?:ee)/, /f+/, /\s+e/ ], [ 'd', 'e', 'f' ] );
  var expected = [ 'aa ab ac ad', 'ba bb bc bd', 'ca cb cc cd' ];
  test.identical( got, expected );

  test.case = 'src === ins';
  var got = _.strReplace( [ 'bbc', 'abc', 'abc' ], [ /\w+k/, /abc*$/, /abc\s*$/ ], [ 'a', 'cba', 'aac' ] );
  var expected = [ 'bbc', 'cba', 'cba' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, ins - array of RegExp, sub - array of strings' );
}

//

function strStripWithDefaultOptions( test )
{
  test.open( 'no strip, src - string' );

  test.case = 'src - empty string';
  var src = '';
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - string without trailing characters';
  var src = 'abc';
  var got = _.strStrip( src );
  test.identical( got, 'abc' );

  test.case = 'src - string with spaces in the middle';
  var src = 'a \tbc';
  var got = _.strStrip( src );
  test.identical( got, 'a \tbc' );

  test.case = 'src - string with new line symbol in the middle';
  var src = 'a\n\nbc';
  var got = _.strStrip( src );
  test.identical( got, 'a\n\nbc' );

  test.case = 'src - string with zero symbol in the middle';
  var src = 'a\0\0bc';
  var got = _.strStrip( src );
  test.identical( got, 'a\0\0bc' );

  /* */

  test.case = 'src - empty string';
  var src = { src : '' };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - string without trailing characters';
  var src = { src : 'abc' };
  var got = _.strStrip( src );
  test.identical( got, 'abc' );

  test.case = 'src - string with spaces in the middle';
  var src = { src : 'a \tbc' };
  var got = _.strStrip( src );
  test.identical( got, 'a \tbc' );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : 'a\n\nbc' };
  var got = _.strStrip( src );
  test.identical( got, 'a\n\nbc' );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : 'a\0\0bc' };
  var got = _.strStrip( src );
  test.identical( got, 'a\0\0bc' );

  test.close( 'no strip, src - string' );

  /* - */

  test.open( 'strip, src - string' );

  test.case = 'src - string contains only trailing characters';
  var src = ' \n\t\0\n  \n\t\n\0';
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = ' \n\t\0\n  \n\t\n\0a';
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = ' \n\t\0\n  \n\t\n\0a \t\n\0b';
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = 'a \n\t\0\n  \n\t\n\0';
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = 'a \t\n\0b \n\t\0\n  \n\t\n\0';
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0';
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0';
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.close( 'strip, src - string' );

  /* - */

  test.open( 'no strip, src - array' );

  test.case = 'src - empty string';
  var src = [ '', '' ];
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - string without trailing characters';
  var src = [ 'abc', 'abc' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'abc', 'abc' ] );
  test.true( got!== src );

  test.case = 'src - string with spaces in the middle';
  var src = [ 'a \tbc', 'a \tbc' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a \tbc', 'a \tbc' ] );
  test.true( got!== src );

  test.case = 'src - string with new line symbol in the middle';
  var src = [ 'a\n\nbc', 'a\n\nbc' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a\n\nbc', 'a\n\nbc' ] );
  test.true( got!== src );

  test.case = 'src - string with zero symbol in the middle';
  var src = [ 'a\0\0bc', 'a\0\0bc' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a\0\0bc', 'a\0\0bc' ] );
  test.true( got!== src );

  /* */

  test.case = 'src - empty string';
  var src = { src : [ '', '' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - string without trailing characters';
  var src = { src : [ 'abc', 'abc' ] };
  var got = _.strStrip( src );
  test.identical( got, [ 'abc', 'abc' ] );
  test.true( got!== src );

  test.case = 'src - string with spaces in the middle';
  var src = { src : [ 'a \tbc', 'a \tbc' ] };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \tbc', 'a \tbc' ] );
  test.true( got!== src );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : [ 'a\n\nbc', 'a\n\nbc' ] };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\n\nbc', 'a\n\nbc' ] );
  test.true( got!== src );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : [ 'a\0\0bc', 'a\0\0bc' ] };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\0\0bc', 'a\0\0bc' ] );
  test.true( got!== src );

  test.close( 'no strip, src - array' );

  /* - */

  test.open( 'strip, src - array' );

  test.case = 'src - string contains only trailing characters';
  var src = [ ' \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0' ];
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = [ ' \n\t\0\n  \n\t\n\0a', ' \n\t\0\n  \n\t\n\0a' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = [ ' \n\t\0\n  \n\t\n\0a \t\n\0b', ' \n\t\0\n  \n\t\n\0a \t\n\0b' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = [ 'a \n\t\0\n  \n\t\n\0', 'a \n\t\0\n  \n\t\n\0' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = [ 'a \t\n\0b \n\t\0\n  \n\t\n\0', 'a \t\n\0b \n\t\0\n  \n\t\n\0' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = [ ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = [ ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0' ];
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.close( 'strip, src - array' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strStrip() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strStrip( 'abc', 'abc' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strStrip( 1 ) );
  test.shouldThrowErrorSync( () => _.strStrip({ src : 1 }) );

  test.case = 'wrong type of stripper';
  test.shouldThrowErrorSync( () => _.strStrip({ src : 'abc', stripper : {} }) );
}

//

function strStripStripperIsTrueLike( test )
{
  test.open( 'no strip, src - string' );

  test.case = 'src - empty string';
  var src = { src : '', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - string without trailing characters';
  var src = { src : 'abc', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'abc' );

  test.case = 'src - string with spaces in the middle';
  var src = { src : 'a \tbc', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a \tbc' );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : 'a\n\nbc', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a\n\nbc' );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : 'a\0\0bc', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a\0\0bc' );

  test.close( 'no strip, src - string' );

  /* - */

  test.open( 'strip, src - string' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : ' \n\t\0\n  \n\t\n\0', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : 'a \n\t\0\n  \n\t\n\0', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : 'a \t\n\0b \n\t\0\n  \n\t\n\0', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', stripper : true };
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.close( 'strip, src - string' );

  /* - */

  test.open( 'no strip, src - array' );

  test.case = 'src - empty string';
  var src = { src : [ '', '' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - string without trailing characters';
  var src = { src : [ 'abc', 'abc' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'abc', 'abc' ] );
  test.true( got!== src );

  test.case = 'src - string with spaces in the middle';
  var src = { src : [ 'a \tbc', 'a \tbc' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \tbc', 'a \tbc' ] );
  test.true( got!== src );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : [ 'a\n\nbc', 'a\n\nbc' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\n\nbc', 'a\n\nbc' ] );
  test.true( got!== src );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : [ 'a\0\0bc', 'a\0\0bc' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\0\0bc', 'a\0\0bc' ] );
  test.true( got!== src );

  test.close( 'no strip, src - array' );

  /* - */

  test.open( 'strip, src - array' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a', ' \n\t\0\n  \n\t\n\0a' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b', ' \n\t\0\n  \n\t\n\0a \t\n\0b' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : [ 'a \n\t\0\n  \n\t\n\0', 'a \n\t\0\n  \n\t\n\0' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : [ 'a \t\n\0b \n\t\0\n  \n\t\n\0', 'a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : true };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.close( 'strip, src - array' );
}

//

function strStripStripperIsString( test )
{
  test.open( 'no strip, src - string' );

  test.case = 'src - empty string';
  var src = { src : '', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - string without trailing characters';
  var src = { src : 'abc', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, 'abc' );

  test.case = 'src - string with spaces in the middle';
  var src = { src : 'a \tbc', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, 'a\tbc' );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : 'a\n\nbc', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, 'a\n\nbc' );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : 'a\0\0bc', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, 'a\0\0bc' );

  test.close( 'no strip, src - string' );

  /* - */

  test.open( 'strip, src - string' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : ' \n\t\0\n  \n\t\n\0', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, '\n\t\0\n\n\t\n\0' );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, '\n\t\0\n\n\t\n\0a' );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, '\n\t\0\n\n\t\n\0a\t\n\0b' );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : 'a \n\t\0\n  \n\t\n\0', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, 'a\n\t\0\n\n\t\n\0' );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : 'a\t\n\0b \n\t\0\n  \n\t\n\0', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, 'a\t\n\0b\n\t\0\n\n\t\n\0' );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, '\n\t\0\n\n\t\n\0a\n\t\0\n\n\t\n\0' );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, '\n\t\0\n\n\t\n\0a\t\n\0b\n\t\0\n\n\t\n\0' );

  test.close( 'strip, src - string' );

  /* - */

  test.open( 'no strip, src - array' );

  test.case = 'src - empty string';
  var src = { src : [ '', '' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - string without trailing characters';
  var src = { src : [ 'abc', 'abc' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ 'abc', 'abc' ] );
  test.true( got!== src );

  test.case = 'src - string with spaces in the middle';
  var src = { src : [ 'a \tbc', 'a \tbc' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\tbc', 'a\tbc' ] );
  test.true( got!== src );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : [ 'a\n\nbc', 'a\n\nbc' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\n\nbc', 'a\n\nbc' ] );
  test.true( got!== src );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : [ 'a\0\0bc', 'a\0\0bc' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\0\0bc', 'a\0\0bc' ] );
  test.true( got!== src );

  test.close( 'no strip, src - array' );

  /* - */

  test.open( 'strip, src - array' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ '\n\t\0\n\n\t\n\0', '\n\t\0\n\n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a', ' \n\t\0\n  \n\t\n\0a' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ '\n\t\0\n\n\t\n\0a', '\n\t\0\n\n\t\n\0a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b', ' \n\t\0\n  \n\t\n\0a \t\n\0b' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ '\n\t\0\n\n\t\n\0a\t\n\0b', '\n\t\0\n\n\t\n\0a\t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : [ 'a \n\t\0\n  \n\t\n\0', 'a \n\t\0\n  \n\t\n\0' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\n\t\0\n\n\t\n\0', 'a\n\t\0\n\n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : [ 'a \t\n\0b \n\t\0\n  \n\t\n\0', 'a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\t\n\0b\n\t\0\n\n\t\n\0', 'a\t\n\0b\n\t\0\n\n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ '\n\t\0\n\n\t\n\0a\n\t\0\n\n\t\n\0', '\n\t\0\n\n\t\n\0a\n\t\0\n\n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : ' ' };
  var got = _.strStrip( src );
  test.identical( got, [ '\n\t\0\n\n\t\n\0a\t\n\0b\n\t\0\n\n\t\n\0', '\n\t\0\n\n\t\n\0a\t\n\0b\n\t\0\n\n\t\n\0' ] );
  test.true( got!== src );

  test.close( 'strip, src - array' );
}

//

function strStripStripperIsRegexp( test )
{
  test.open( 'no strip, src - string' );

  test.case = 'src - empty string';
  var src = { src : '', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - string without trailing characters';
  var src = { src : 'abc', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'abc' );

  test.case = 'src - string with spaces in the middle';
  var src = { src : 'a \tbc', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a \tbc' );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : 'a\n\nbc', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a\n\nbc' );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : 'a\0\0bc', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a\0\0bc' );

  test.close( 'no strip, src - string' );

  /* - */

  test.open( 'strip, src - string' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : ' \n\t\0\n  \n\t\n\0', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : 'a \n\t\0\n  \n\t\n\0', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : 'a \t\n\0b \n\t\0\n  \n\t\n\0', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a' );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, 'a \t\n\0b' );

  test.close( 'strip, src - string' );

  /* - */

  test.open( 'no strip, src - array' );

  test.case = 'src - empty string';
  var src = { src : [ '', '' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - string without trailing characters';
  var src = { src : [ 'abc', 'abc' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'abc', 'abc' ] );
  test.true( got!== src );

  test.case = 'src - string with spaces in the middle';
  var src = { src : [ 'a \tbc', 'a \tbc' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \tbc', 'a \tbc' ] );
  test.true( got!== src );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : [ 'a\n\nbc', 'a\n\nbc' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\n\nbc', 'a\n\nbc' ] );
  test.true( got!== src );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : [ 'a\0\0bc', 'a\0\0bc' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a\0\0bc', 'a\0\0bc' ] );
  test.true( got!== src );

  test.close( 'no strip, src - array' );

  /* - */

  test.open( 'strip, src - array' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a', ' \n\t\0\n  \n\t\n\0a' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b', ' \n\t\0\n  \n\t\n\0a \t\n\0b' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : [ 'a \n\t\0\n  \n\t\n\0', 'a \n\t\0\n  \n\t\n\0' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : [ 'a \t\n\0b \n\t\0\n  \n\t\n\0', 'a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a', 'a' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : /^(\s|\n|\0)+|(\s|\n|\0)+$/g };
  var got = _.strStrip( src );
  test.identical( got, [ 'a \t\n\0b', 'a \t\n\0b' ] );
  test.true( got!== src );

  test.close( 'strip, src - array' );
}

//

function strStripStripperIsArrayOfStrings( test )
{
  test.open( 'no strip, src - string' );

  test.case = 'src - empty string';
  var src = { src : '', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - string without trailing characters';
  var src = { src : 'abc', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, 'bc' );

  test.case = 'src - string with spaces in the middle';
  var src = { src : 'a \tbc', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\tbc' );

  test.case = 'src - string with only strip characters';
  var src = { src : ' a', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '' );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : 'a\n\nbc', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, 'bc' );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : 'a\0\0bc', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\0\0bc' );

  test.close( 'no strip, src - string' );

  /* - */

  test.open( 'strip, src - string' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : ' \n\t\0\n  \n\t\n\0', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\t\0\n  \n\t\n\0' );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\t\0\n  \n\t\n\0' );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\t\0\n  \n\t\n\0a \t\n\0b' );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : 'a \n\t\0\n  \n\t\n\0', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\t\0\n  \n\t\n\0' );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : 'a \t\n\0b \n\t\0\n  \n\t\n\0', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\t\n\0b \n\t\0\n  \n\t\n\0' );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0' );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, '\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0' );

  test.close( 'strip, src - string' );

  /* - */

  test.open( 'no strip, src - array' );

  test.case = 'src - empty string';
  var src = { src : [ '', '' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - string without trailing characters';
  var src = { src : [ 'abc', 'abc' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ 'bc', 'bc' ] );
  test.true( got!== src );

  test.case = 'src - string with spaces in the middle';
  var src = { src : [ 'a \tbc', 'a \tbc' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\tbc', '\tbc' ] );
  test.true( got!== src );

  test.case = 'src - string with only strip characters';
  var src = { src : [ ' a', ' a' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '', '' ] );
  test.true( got!== src );

  test.case = 'src - string with new line symbol in the middle';
  var src = { src : [ 'a\n\nbc', 'a\n\nbc' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ 'bc', 'bc' ] );
  test.true( got!== src );

  test.case = 'src - string with zero symbol in the middle';
  var src = { src : [ 'a\0\0bc', 'a\0\0bc' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\0\0bc', '\0\0bc' ] );
  test.true( got!== src );

  test.close( 'no strip, src - array' );

  /* - */

  test.open( 'strip, src - array' );

  test.case = 'src - string contains only trailing characters';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\t\0\n  \n\t\n\0', '\t\0\n  \n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, regular symbol, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a', ' \n\t\0\n  \n\t\n\0a' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\t\0\n  \n\t\n\0', '\t\0\n  \n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left, string with trailing characters in the middle, strip left';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b', ' \n\t\0\n  \n\t\n\0a \t\n\0b' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\t\0\n  \n\t\n\0a \t\n\0b', '\t\0\n  \n\t\n\0a \t\n\0b' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, regular symbol, strip right';
  var src = { src : [ 'a \n\t\0\n  \n\t\n\0', 'a \n\t\0\n  \n\t\n\0' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\t\0\n  \n\t\n\0', '\t\0\n  \n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - right, string with trailing characters in the middle, strip right';
  var src = { src : [ 'a \t\n\0b \n\t\0\n  \n\t\n\0', 'a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\t\n\0b \n\t\0\n  \n\t\n\0', '\t\n\0b \n\t\0\n  \n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, regular symbol, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0', '\t\0\n  \n\t\n\0a \n\t\0\n  \n\t\n\0' ] );
  test.true( got!== src );

  test.case = 'src - trailing characters - left and right, string with trailing characters in the middle, strip';
  var src = { src : [ ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', ' \n\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0' ], stripper : [ ' ', '\n', 'a' ] };
  var got = _.strStrip( src );
  test.identical( got, [ '\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0', '\t\0\n  \n\t\n\0a \t\n\0b \n\t\0\n  \n\t\n\0' ] );
  test.true( got!== src );

  test.close( 'strip, src - array' );
}

//

function strIsolateLeftOrNone( test )
{
  var got, expected;

  /* - */

  test.case = 'single delimeter';

  /**/

  got = _.strIsolateLeftOrNone( '', '' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( '', [ '' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abc', [ '' ] );
  expected = [ '', '', 'abc' ];
  test.identical( got, expected );

  /* empty delimeters array */

  got = _.strIsolateLeftOrNone( 'abca', [] );
  expected = [ '', undefined, 'abca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( '', 'a' );
  expected = [ '', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( '', [ 'a' ] );
  expected = [ '', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', 'a' );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'a' ] );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strIsolateLeftOrNone( 'abca', 'd' );
  expected = [ '', undefined, 'abca' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strIsolateLeftOrNone( 'abca', [ 'd' ] );
  expected = [ '', undefined, 'abca' ];
  test.identical( got, expected );

  /* - */

  test.case = 'single delimeter, number';

  got = _.strIsolateLeftOrNone( 'abca', '', 2 );
  expected = [ 'a', '', 'bca' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strIsolateLeftOrNone( 'abca', 'a', 2 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strIsolateLeftOrNone( 'abca', [ 'a' ], 2 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strIsolateLeftOrNone( 'abcaca', 'a', 3 );
  expected = [ 'abcac', 'a', '' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strIsolateLeftOrNone( 'abcaca', [ 'a' ], 3 );
  expected = [ 'abcac', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abcaca', 'a', 4 );
  expected = [ 'abcaca', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abcaca', [ 'a' ], 4 );
  expected = [ 'abcaca', undefined, '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'several delimeters';

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'a', 'c' ] );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'c', 'a' ] );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'x', 'y' ] );
  expected = [ '', undefined, 'abca'  ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'x', 'y', 'a' ] );
  expected = [ '', 'a', 'bca'  ];
  test.identical( got, expected );

  /* - */

  test.case = 'several delimeters, number';

  /* empty delimeters array */

  got = _.strIsolateLeftOrNone( 'abca', [], 2 );
  expected = [ '', undefined, 'abca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abcbc', [ 'c', 'a' ], 2 );
  expected = [ 'ab', 'c', 'bc' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'cbcbc', [ 'c', 'a' ], 3 );
  expected = [ 'cbcb', 'c', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'cbcbc', [ 'c', 'a' ], 4 );
  expected = [ 'cbcbc', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'jj', [ 'c', 'a' ], 4 );
  expected = [ '', undefined, 'jj' ];
  test.identical( got, expected );

  /* - */

  test.case = 'one of delimeters contains other';

  /* - */

  got = _.strIsolateLeftOrNone( 'ab', [ 'a', 'ab' ] );
  expected = [ '', 'a', 'b' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'ab', [ 'ab', 'a' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'ab', [ 'b', 'ab' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'ab', [ 'ab', 'b' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'a b c', ' ', 1 );
  expected = [ 'a', ' ', 'b c' ];
  test.identical( got, expected );

  /* - */

  test.case = 'single delimeter'

  /* cut on first appear */

  got = _.strIsolateLeftOrNone( 'abca', 'a', 1 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* no occurrences */

  got = _.strIsolateLeftOrNone( 'jj', 'a', 1 );
  expected = [ '', undefined, 'jj' ];
  test.identical( got, expected );

  /* cut on second appear */

  got = _.strIsolateLeftOrNone( 'abca', 'a', 2 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* 5 attempts */

  got = _.strIsolateLeftOrNone( 'abca', 'a', 5 );
  expected = [ 'abca', undefined, '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'multiple delimeter'

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'a', 'c' ], 1 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrNone( 'abca', [ 'a', 'c' ], 3 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* no occurrences */

  got = _.strIsolateLeftOrNone( 'jj', [ 'a', 'c' ], 1 );
  expected = [ '', undefined, 'jj' ];
  test.identical( got, expected );

  /* no occurrences */

  got = _.strIsolateLeftOrNone( 'jj', [ 'a' ], 1 );
  expected = [ '', undefined, 'jj' ];
  test.identical( got, expected );

  /* - */

  test.case = 'options as map';

  /**/

  got = _.strIsolateLeftOrNone({ src : 'abca', delimeter : 'a', times : 1 });
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* number option is missing */

  got = _.strIsolateLeftOrNone({ src : 'abca', delimeter : 'a' });
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* - */

  test.case = 'number option check';

  /* number is zero */

  got = _.strIsolateLeftOrNone( 'abca', 'a', 0 );
  expected = [ '', undefined, 'abca' ];
  test.identical( got, expected );

  /* number is negative */

  got = _.strIsolateLeftOrNone( 'abca', 'a', -1 );
  expected = [ '', undefined, 'abca' ];
  test.identical( got, expected );

  /* - */

  test.open( 'abaaca with strings' )

  got = _.strIsolateLeftOrNone( 'abaaca', 'a', 0 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', 'a', 1 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', 'a', 2 );
  expected = [ 'ab', 'a', 'aca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', 'a', 3 );
  expected = [ 'aba', 'a', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', 'a', 4 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', 'a', 5 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abaaca with strings' )
  test.open( 'abababa with strings' )

  got = _.strIsolateLeftOrNone( 'abababa', 'aba', 1 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abababa', 'aba', 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abababa', 'aba', 3 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abababa', 'aba', 4 );
  expected = [ 'abababa', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abababa with strings' )

  /* - */

  test.open( 'abaaca with regexp' )

  got = _.strIsolateLeftOrNone( 'abaaca', /a+/, 0 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', /a+/, 1 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', /a+/, 2 );
  expected = [ 'ab', 'aa', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', /a+/, 3 );
  expected = [ 'aba', 'a', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', /a+/, 4 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abaaca', /a+/, 5 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abaaca with regexp' )
  test.open( 'abababa with regexp' )

  got = _.strIsolateLeftOrNone( 'abababa', /aba/, 1 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abababa', /aba/, 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abababa', /aba/, 3 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrNone( 'abababa', /aba/, 4 );
  expected = [ 'abababa', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abababa with regexp' )

  /* - */

  /* aaa : extend the group */
  /* Dmytro : extended by new test cases */
  test.open( 'quoting' );

  test.case = 'quote - 0';
  var got = _.strIsolateLeftOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 0 } );
  var expected = [ '"a', ' ', 'b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 0, times - 3';
  var got = _.strIsolateLeftOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 0, times : 3 } );
  var expected = [ '"a b" c', ' ', '"d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 0';
  var got = _.strIsolateLeftOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 0 } );
  var expected = [ '', undefined, '"a b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 1';
  var got = _.strIsolateLeftOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 1 } );
  var expected = [ '"a b"', ' ', 'c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 2';
  var got = _.strIsolateLeftOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 2 } );
  var expected = [ '"a b" c', ' ', '"d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 3';
  var got = _.strIsolateLeftOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 3 } );
  var expected = [ '"a b" c "d e"', undefined, '' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 4';
  var got = _.strIsolateLeftOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 4 } );
  var expected = [ '"a b" c "d e"', undefined, '' ];
  test.identical( got, expected );

  test.close( 'quoting' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'single argument but object expected';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateLeftOrNone( 'abc' );
  })

  test.case = 'invalid option';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateLeftOrNone({ src : 'abc', delimeter : 'a', x : 'a' });
  })

  test.case = 'changing of left option not allowed';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateLeftOrNone({ src : 'abc', delimeter : 'a', left : 0 });
  })

}

//

function strIsolateLeftOrAll( test )
{
  var got, expected;

  test.case = 'cut in most left position';

  /* nothing */

  got = _.strIsolateLeftOrAll( '', 'b' );
  expected = [ '', undefined, '' ];
  test.identical( got, expected );

  /* nothing */

  got = _.strIsolateLeftOrAll( '', '' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrAll( 'appc', 'p' );
  expected = [ 'a', 'p', 'pc' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrAll( 'appc', 'c' );
  expected = [ 'app', 'c', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrAll( 'appc', 'a' );
  expected = [ '', 'a', 'ppc' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateLeftOrAll( 'jj', 'a' );
  expected = [ 'jj', undefined, '' ];
  test.identical( got, expected );

  /* - */

  test.open( 'abaaca with strings' )

  got = _.strIsolateLeftOrAll( 'abaaca', 'a', 0 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', 'a', 1 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', 'a', 2 );
  expected = [ 'ab', 'a', 'aca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', 'a', 3 );
  expected = [ 'aba', 'a', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', 'a', 4 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', 'a', 5 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abaaca with strings' )
  test.open( 'abababa with strings' )

  got = _.strIsolateLeftOrAll( 'abababa', 'aba', 1 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abababa', 'aba', 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abababa', 'aba', 3 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abababa', 'aba', 4 );
  expected = [ 'abababa', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abababa with strings' )

  /* - */

  test.open( 'abaaca with regexp' )

  got = _.strIsolateLeftOrAll( 'abaaca', /a+/, 0 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', /a+/, 1 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', /a+/, 2 );
  expected = [ 'ab', 'aa', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', /a+/, 3 );
  expected = [ 'aba', 'a', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', /a+/, 4 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abaaca', /a+/, 5 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abaaca with regexp' )
  test.open( 'abababa with regexp' )

  got = _.strIsolateLeftOrAll( 'abababa', /aba/, 1 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abababa', /aba/, 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abababa', /aba/, 3 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateLeftOrAll( 'abababa', /aba/, 4 );
  expected = [ 'abababa', undefined, '' ];
  test.identical( got, expected );

  test.close( 'abababa with regexp' )

  /* - */

  /* aaa : extend the group */
  /* Dmytro : extended by new test cases */
  test.open( 'quoting' );

  test.case = 'quote - 0';
  var got = _.strIsolateLeftOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 0 } );
  var expected = [ '"a', ' ', 'b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 0, times - 3';
  var got = _.strIsolateLeftOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 0, times : 3 } );
  var expected = [ '"a b" c', ' ', '"d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 0';
  var got = _.strIsolateLeftOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 0 } );
  var expected = [ '', undefined, '"a b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 1';
  var got = _.strIsolateLeftOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 1 } );
  var expected = [ '"a b"', ' ', 'c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 2';
  var got = _.strIsolateLeftOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 2 } );
  var expected = [ '"a b" c', ' ', '"d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 3';
  var got = _.strIsolateLeftOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 3 } );
  var expected = [ '"a b" c "d e"', undefined, '' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 4';
  var got = _.strIsolateLeftOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 4 } );
  var expected = [ '"a b" c "d e"', undefined, '' ];
  test.identical( got, expected );

  test.close( 'quoting' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'delimeter must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateLeftOrAll( 'jj', 1 );
  });

  test.case = 'source must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateLeftOrAll( 1, '1' );
  });

}

//

function strIsolateRightOrNone( test )
{
  var got, expected;

  /* - */

  test.case = 'single delimeter';

  /**/

  got = _.strIsolateRightOrNone( '', '' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( '', [ '' ] );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abc', [ '' ] );
  expected = [ 'abc', '', '' ];
  test.identical( got, expected );

  /* empty delimeters array */

  got = _.strIsolateRightOrNone( 'abca', [] );
  expected = [ 'abca', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( '', 'a' );
  expected = [ '', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( '', [ 'a' ] );
  expected = [ '', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', 'a' );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'a' ] );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strIsolateRightOrNone( 'abca', 'd' );
  expected = [ 'abca', undefined, '' ];
  test.identical( got, expected );

  /* number 1 by default, no cut, just returns src */

  got = _.strIsolateRightOrNone( 'abca', [ 'd' ] );
  expected = [ 'abca', undefined, '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'single delimeter, number';

  got = _.strIsolateRightOrNone( 'abca', '', 2 );
  expected = [ 'abc', '', 'a' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strIsolateRightOrNone( 'abca', 'a', 2 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* cut on second occurrence */

  got = _.strIsolateRightOrNone( 'abca', [ 'a' ], 2 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strIsolateRightOrNone( 'abcaca', 'a', 3 );
  expected = [ '', 'a', 'bcaca' ];
  test.identical( got, expected );

  /* cut on third occurrence */

  got = _.strIsolateRightOrNone( 'abcaca', [ 'a' ], 3 );
  expected = [ '', 'a', 'bcaca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abcaca', 'a', 4 );
  expected = [ '', undefined, 'abcaca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abcaca', [ 'a' ], 4 );
  expected = [ '', undefined, 'abcaca' ];
  test.identical( got, expected );

  /* - */

  test.case = 'several delimeters';

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'a', 'c' ] );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'c', 'a' ] );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'x', 'y' ] );
  expected = [ 'abca', undefined, ''  ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'x', 'y', 'a' ] );
  expected = [ 'abc', 'a', ''  ];
  test.identical( got, expected );

  /* - */

  test.case = 'several delimeters, number';

  /* empty delimeters array */

  got = _.strIsolateRightOrNone( 'abca', [], 2 );
  expected = [ 'abca', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'a', 'c' ], 1 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abcbc', [ 'c', 'a' ], 2 );
  expected = [ 'ab', 'c', 'bc' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'cbcbc', [ 'c', 'a' ], 3 );
  expected = [ '', 'c', 'bcbc' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'cbcbc', [ 'c', 'a' ], 4 );
  expected = [ '', undefined, 'cbcbc' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'jj', [ 'c', 'a' ], 4 );
  expected = [ 'jj', undefined, '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'one of delimeters contains other';

  /* - */

  got = _.strIsolateRightOrNone( 'ab', [ 'a', 'ab' ] );
  expected = [ '', 'a', 'b' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'ab', [ 'ab', 'a' ] );
  expected = [ '', 'ab', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'ab', [ 'b', 'ab' ] );
  expected = [ 'a', 'b', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'ab', [ 'ab', 'b' ] );
  expected = [ 'a', 'b', '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'defaults'

  /**/

  got = _.strIsolateRightOrNone( 'a b c', ' ', 1 );
  expected = [ 'a b', ' ', 'c' ];
  test.identical( got, expected );

  /* - */

  test.case = 'single delimeter'

  /* cut on first appear */

  got = _.strIsolateRightOrNone( 'abca', 'a', 1 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* no occurrences */

  got = _.strIsolateRightOrNone( 'jj', 'a', 1 );
  expected = [ 'jj', undefined, '' ];
  test.identical( got, expected );

  /* cut on second appear */

  got = _.strIsolateRightOrNone( 'abca', 'a', 2 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', 'a', 5 );
  expected = [ '', undefined, 'abca' ];
  test.identical( got, expected );

  /* - */

  test.case = 'multiple delimeter'

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'a', 'c' ], 1 );
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'a', 'c' ], 2 );
  expected = [ 'ab', 'c', 'a' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrNone( 'abca', [ 'a', 'c' ], 3 );
  expected = [ '', 'a', 'bca' ];
  test.identical( got, expected );

  /* no occurrences */

  got = _.strIsolateRightOrNone( 'jj', [ 'a', 'c' ], 1 );
  expected = [ 'jj', undefined, '' ];
  test.identical( got, expected );

  /* no occurrences */

  got = _.strIsolateRightOrNone( 'jj', [ 'a' ], 1 );
  expected = [ 'jj', undefined, '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'options as map';

  /**/

  got = _.strIsolateRightOrNone({ src : 'abca', delimeter : 'a', times : 1 });
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* number option is missing */

  got = _.strIsolateRightOrNone({ src : 'abca', delimeter : 'a' });
  expected = [ 'abc', 'a', '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'number option check';

  /* number is zero */

  got = _.strIsolateRightOrNone( 'abca', 'a', 0 );
  expected = [ 'abca', undefined, '' ];
  test.identical( got, expected );

  /* number is negative */

  got = _.strIsolateRightOrNone( 'abca', 'a', -1 );
  expected = [ 'abca', undefined, '' ];
  test.identical( got, expected );

  /* */

  got = _.strIsolateRightOrNone( 'acbca', [ 'a', 'c' ], 1 );
  expected = [ 'acbc', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'acbca', [ 'a', 'c' ], 2 );
  expected = [ 'acb', 'c', 'a' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 1 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 3 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 4 );
  expected = [ '', undefined, 'abababa' ];
  test.identical( got, expected );

  /* - */

  test.open( 'abaaca with strings' )

  got = _.strIsolateRightOrNone( 'abaaca', 'a', 0 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', 'a', 1 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', 'a', 2 );
  expected = [ 'aba', 'a', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', 'a', 3 );
  expected = [ 'ab', 'a', 'aca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', 'a', 4 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', 'a', 5 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  test.close( 'abaaca with strings' )
  test.open( 'abababa with strings' )

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 1 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 3 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', 'aba', 4 );
  expected = [ '', undefined, 'abababa' ];
  test.identical( got, expected );

  test.close( 'abababa with strings' )

  /* - */

  test.open( 'abaaca with regexp' )

  got = _.strIsolateRightOrNone( 'abaaca', /a+/, 0 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', /a+/, 1 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', /a+/, 2 );
  expected = [ 'ab', 'aa', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', /a+/, 3 );
  expected = [ 'ab', 'a', 'aca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', /a+/, 4 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abaaca', /a+/, 5 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  test.close( 'abaaca with regexp' )
  test.open( 'abababa with regexp' )

  got = _.strIsolateRightOrNone( 'abababa', /aba/, 1 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', /aba/, 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', /aba/, 3 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrNone( 'abababa', /aba/, 4 );
  expected = [ '', undefined, 'abababa' ];
  test.identical( got, expected );

  test.close( 'abababa with regexp' )

  /* - */

  /* aaa : extend the group */
  /* Dmytro : extended by new test cases */
  test.open( 'quoting' );

  test.case = 'quote - 0';
  var got = _.strIsolateRightOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 0 } );
  var expected = [ '"a b" c "d', ' ', 'e"' ];
  test.identical( got, expected );

  test.case = 'quote - 0, times - 3';
  var got = _.strIsolateRightOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 0, times : 4 } );
  var expected = [ '"a', ' ', 'b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 0';
  var got = _.strIsolateRightOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 0 } );
  var expected = [ '"a b" c "d e"', undefined, '' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 1';
  var got = _.strIsolateRightOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 1 } );
  var expected = [ '"a b" c', ' ', '"d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 2';
  var got = _.strIsolateRightOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 2 } );
  var expected = [ '"a b"', ' ', 'c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 3';
  var got = _.strIsolateRightOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 3 } );
  var expected = [ '', undefined, '"a b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 4';
  var got = _.strIsolateRightOrNone( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 4 } );
  var expected = [ '', undefined, '"a b" c "d e"' ];
  test.identical( got, expected );

  test.close( 'quoting' );

  /* */

  if( !Config.debug )
  return;

  test.case = 'single argument but object expected';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateRightOrNone( 'abc' );
  });

  test.case = 'invalid option';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateRightOrNone({ src : 'abc', delimeter : 'a', x : 'a' });
  });

  test.case = 'changing of left option not allowed';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateRightOrNone({ src : 'abc', delimeter : 'a', left : 0 });
  });

}

//

function strIsolateRightOrAll( test )
{
  var got, expected;

  test.case = 'cut in most right position';

  /* nothing */

  got = _.strIsolateRightOrAll( '', '' );
  expected = [ '', '', '' ];
  test.identical( got, expected );

  /* nothing */

  got = _.strIsolateRightOrAll( '', 'b' );
  expected = [ '', undefined, '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrAll( 'ahpc', 'h' );
  expected = [ 'a', 'h', 'pc' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrAll( 'ahpc', 'c' );
  expected = [ 'ahp', 'c', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrAll( 'appbb', 'b' );
  expected = [ 'appb', 'b', '' ];
  test.identical( got, expected );

  /**/

  got = _.strIsolateRightOrAll( 'jj', 'a' );
  expected = [ '', undefined, 'jj' ];
  test.identical( got, expected );

  /* */

  got = _.strIsolateRightOrAll( 'acbca', [ 'a', 'c' ], 1 );
  expected = [ 'acbc', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'acbca', [ 'a', 'c' ], 2 );
  expected = [ 'acb', 'c', 'a' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 1 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 3 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 4 );
  expected = [ '', undefined, 'abababa' ];
  test.identical( got, expected );

  /* - */

  test.open( 'abaaca with strings' )

  got = _.strIsolateRightOrAll( 'abaaca', 'a', 0 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', 'a', 1 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', 'a', 2 );
  expected = [ 'aba', 'a', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', 'a', 3 );
  expected = [ 'ab', 'a', 'aca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', 'a', 4 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', 'a', 5 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  test.close( 'abaaca with strings' )
  test.open( 'abababa with strings' )

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 1 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 3 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', 'aba', 4 );
  expected = [ '', undefined, 'abababa' ];
  test.identical( got, expected );

  test.close( 'abababa with strings' )

  /* - */

  test.open( 'abaaca with regexp' )

  got = _.strIsolateRightOrAll( 'abaaca', /a+/, 0 );
  expected = [ 'abaaca', undefined, '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', /a+/, 1 );
  expected = [ 'abaac', 'a', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', /a+/, 2 );
  expected = [ 'ab', 'aa', 'ca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', /a+/, 3 );
  expected = [ 'ab', 'a', 'aca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', /a+/, 4 );
  expected = [ '', 'a', 'baaca' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abaaca', /a+/, 5 );
  expected = [ '', undefined, 'abaaca' ];
  test.identical( got, expected );

  test.close( 'abaaca with regexp' )
  test.open( 'abababa with regexp' )

  got = _.strIsolateRightOrAll( 'abababa', /aba/, 1 );
  expected = [ 'abab', 'aba', '' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', /aba/, 2 );
  expected = [ 'ab', 'aba', 'ba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', /aba/, 3 );
  expected = [ '', 'aba', 'baba' ];
  test.identical( got, expected );

  got = _.strIsolateRightOrAll( 'abababa', /aba/, 4 );
  expected = [ '', undefined, 'abababa' ];
  test.identical( got, expected );

  test.close( 'abababa with regexp' )

  /* - */

  /* aaa : extend the group */
  /* Dmytro : extended by new test cases */
  test.open( 'quoting' );

  test.case = 'quote - 0';
  var got = _.strIsolateRightOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 0 } );
  var expected = [ '"a b" c "d', ' ', 'e"' ];
  test.identical( got, expected );

  test.case = 'quote - 0, times - 3';
  var got = _.strIsolateRightOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 0, times : 4 } );
  var expected = [ '"a', ' ', 'b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 0';
  var got = _.strIsolateRightOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 0 } );
  var expected = [ '"a b" c "d e"', undefined, '' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 1';
  var got = _.strIsolateRightOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 1 } );
  var expected = [ '"a b" c', ' ', '"d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 2';
  var got = _.strIsolateRightOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 2 } );
  var expected = [ '"a b"', ' ', 'c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 3';
  var got = _.strIsolateRightOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 3 } );
  var expected = [ '', undefined, '"a b" c "d e"' ];
  test.identical( got, expected );

  test.case = 'quote - 1, times - 4';
  var got = _.strIsolateRightOrAll( { src : '"a b" c "d e"', delimeter : ' ', quote : 1, times : 4 } );
  var expected = [ '', undefined, '"a b" c "d e"' ];
  test.identical( got, expected );

  test.close( 'quoting' );

  /* */

  if( !Config.debug )
  return;

  test.case = 'delimeter must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateRightOrAll( 'jj', 1 );
  })

  test.case = 'source must be a String';
  test.shouldThrowErrorSync( function()
  {
    _.strIsolateRightOrAll( 1, '1' );
  })

}

//
//
// function strIsolateInsideOrNone( test )
// {
//
//   /* - */
//
//   test.open( 'string' );
//
//   /* - */
//
//   test.case = 'begin';
//
//   var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', 'aa', 'bb' );
//   test.identical( got, expected );
//
//   test.case = 'middle';
//
//   var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', 'bb', 'cc' );
//   test.identical( got, expected );
//
//   test.case = 'end';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', 'cc', 'dd' );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', 'cc', '' );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry';
//
//   var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ 'aa', 'bb' ], [ 'aa', 'bb' ] );
//   test.identical( got, expected );
//   var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'aa' ], [ 'bb', 'aa' ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry';
//
//   var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'cc' ], [ 'bb', 'cc' ] );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'bb' ], [ 'cc', 'bb' ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry';
//
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'dd' ], [ 'cc', 'dd' ] );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ], [ 'dd', 'cc' ] );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ], [ '', '' ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry, several sources';
//
//   var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 'aa', 'bb' ] );
//   test.identical( got, expected );
//   var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'aa' ], [ 'bb', 'aa' ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry, several sources';
//
//   var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'cc' ], [ 'bb', 'cc' ] );
//   test.identical( got, expected );
//   var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'bb' ], [ 'cc', 'bb' ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry, several sources';
//
//   var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'dd' ], [ 'cc', 'dd' ] );
//   test.identical( got, expected );
//   var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ], [ 'dd', 'cc' ] );
//   test.identical( got, expected );
//   var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ], [ '', 'cc', '_cc_bb_bb_aa_aa', '', '' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ], [ '', '' ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'no entry';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [], [] );
//   test.identical( got, expected );
//
//   test.case = 'not found';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', 'dd', 'dd' );
//   test.identical( got, expected );
//
//   test.case = 'not found begin';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', 'dd', '' );
//   test.identical( got, expected );
//
//   test.case = 'not found end';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', '', 'dd' );
//   test.identical( got, expected );
//
//   test.case = 'empty entry';
//
//   var expected = [ '', '', 'aa_aa_bb_bb_cc_cc', '', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', '', '' );
//   test.identical( got, expected );
//
//   test.case = 'empty entry, empty src';
//
//   var expected = [ '', '', '', '', '' ];
//   var got = _.strIsolateInsideOrNone( '', '', '' );
//   test.identical( got, expected );
//
//   test.case = 'empty src';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( '', 'aa', 'bb' );
//   test.identical( got, expected );
//
//   /* - */
//
//   test.close( 'string' );
//   test.open( 'regexp' );
//
//   /* */
//
//   test.case = 'begin smeared';
//
//   var expected = [ 'x', 'aa', 'x_xaax_xbbx_xb', 'bx', '_xccx_xccx' ];
//   var got = _.strIsolateInsideOrNone( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /a\w/, /b\w/ );
//   test.identical( got, expected );
//
//   test.case = 'middle smeared';
//
//   var expected = [ 'xaax_xaax_x', 'bb', 'x_xbbx_xccx_xc', 'cx', '' ];
//   var got = _.strIsolateInsideOrNone( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /b\w/, /c\w/ );
//   test.identical( got, expected );
//
//   test.case = 'end smeared';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /c\w/, /d\w/ );
//   test.identical( got, expected );
//   var expected = [ 'xaax_xaax_xbbx_xbbx_x', 'cc', 'x_xccx', '', '' ];
//   var got = _.strIsolateInsideOrNone( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /c\w/, /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'begin';
//
//   var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /a+/, /b+/ );
//   test.identical( got, expected );
//
//   test.case = 'middle';
//
//   var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /b+/, /c+/ );
//   test.identical( got, expected );
//
//   test.case = 'end';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /c+/, /d+/ );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /c+/, /(?:)/ );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry';
//
//   var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ /a+/, /b+/ ], [ /a+/, /b+/ ] );
//   test.identical( got, expected );
//   var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ /b+/, /a+/ ], [ /b+/, /a+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry';
//
//   var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ /b+/, /c+/ ], [ /b+/, /c+/ ] );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ /c+/, /b+/ ], [ /c+/, /b+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry';
//
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ /c+/, /d+/ ], [ /c+/, /d+/ ] );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ], [ /d+/, /c+/ ] );
//   test.identical( got, expected );
//   var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ], [ /(?:)/, /(?:)/ ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'begin, several entry, several sources';
//
//   var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, /b+/ ], [ /a+/, /b+/ ] );
//   test.identical( got, expected );
//   var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /a+/ ], [ /b+/, /a+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'middle, several entry, several sources';
//
//   var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /c+/ ], [ /b+/, /c+/ ] );
//   test.identical( got, expected );
//   var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /b+/ ], [ /c+/, /b+/ ] );
//   test.identical( got, expected );
//
//   test.case = 'end, several entry, several sources';
//
//   var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /d+/ ], [ /c+/, /d+/ ] );
//   test.identical( got, expected );
//   var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ], [ /d+/, /c+/ ] );
//   test.identical( got, expected );
//   var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ], [ '', 'cc', '_cc_bb_bb_aa_aa', '', '' ] ];
//   var got = _.strIsolateInsideOrNone( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ], [ /(?:)/, /(?:)/ ] );
//   test.identical( got, expected );
//
//   /* */
//
//   test.case = 'no entry';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', [], [] );
//   test.identical( got, expected );
//
//   test.case = 'not found';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /d+/, /d+/ );
//   test.identical( got, expected );
//
//   test.case = 'not found begin';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /d+/, /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'not found end';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /(?:)/, /d+/ );
//   test.identical( got, expected );
//
//   test.case = 'empty entry';
//
//   var expected = [ '', '', 'aa_aa_bb_bb_cc_cc', '', '' ];
//   var got = _.strIsolateInsideOrNone( 'aa_aa_bb_bb_cc_cc', /(?:)/, /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'empty entry, empty src';
//
//   var expected = [ '', '', '', '', '' ];
//   var got = _.strIsolateInsideOrNone( '', /(?:)/, /(?:)/ );
//   test.identical( got, expected );
//
//   test.case = 'empty src';
//
//   var expected = undefined;
//   var got = _.strIsolateInsideOrNone( '', /a+/, /b+/ );
//   test.identical( got, expected );
//
//   /* - */
//
//   test.close( 'regexp' );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.shouldThrowErrorSync( () => _.strIsolateInsideOrNone() );
//   test.shouldThrowErrorSync( () => _.strIsolateInsideOrNone( '' ) );
//   test.shouldThrowErrorSync( () => _.strIsolateInsideOrNone( '', '' ) );
//   test.shouldThrowErrorSync( () => _.strIsolateInsideOrNone( '', '', '', '' ) );
//   test.shouldThrowErrorSync( () => _.strIsolateInsideOrNone( 1, '', '' ) );
//   test.shouldThrowErrorSync( () => _.strIsolateInsideOrNone( '123', 1, '' ) );
//   test.shouldThrowErrorSync( () => _.strIsolateInsideOrNone( '123', '', 3 ) );
//
// }

//

function strIsolateInside( test )
{
  test.open( 'string' );

  test.case = 'begin';
  var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'aa', 'bb' );
  test.identical( got, expected );

  test.case = 'middle';
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'bb', 'cc' );
  test.identical( got, expected );

  test.case = 'end';
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'cc', '' );
  test.identical( got, expected );

  test.case = 'nothing found';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'cc', 'dd' );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry';
  var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ 'aa', 'bb' ], [ 'aa', 'bb' ] );
  test.identical( got, expected );
  var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'aa' ], [ 'bb', 'aa' ] );
  test.identical( got, expected );

  test.case = 'middle, several entry';
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ 'bb', 'cc' ], [ 'bb', 'cc' ] );
  test.identical( got, expected );
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'bb' ], [ 'cc', 'bb' ] );
  test.identical( got, expected );

  test.case = 'end, several entry';
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ 'cc', 'dd' ], [ 'cc', 'dd' ] );
  test.identical( got, expected );
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ], [ 'dd', 'cc' ] );
  test.identical( got, expected );
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ 'dd', 'cc' ], [ '', '' ] );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry, several sources';
  var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'aa', 'bb' ], [ 'aa', 'bb' ] );
  test.identical( got, expected );
  var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'aa' ], [ 'bb', 'aa' ] );
  test.identical( got, expected );

  test.case = 'middle, several entry, several sources';
  var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'bb', 'cc' ], [ 'bb', 'cc' ] );
  test.identical( got, expected );
  var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'bb' ], [ 'cc', 'bb' ] );
  test.identical( got, expected );

  test.case = 'end, several entry, several sources';
  var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'cc', 'dd' ], [ 'cc', 'dd' ] );
  test.identical( got, expected );
  var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ], [ 'dd', 'cc' ] );
  test.identical( got, expected );
  var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ], [ '', 'cc', '_cc_bb_bb_aa_aa', '', '' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ 'dd', 'cc' ], [ '', '' ] );
  test.identical( got, expected );

  /* */

  test.case = 'no entry';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [], [] );
  test.identical( got, expected );

  test.case = 'not found';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'dd', 'dd' );
  test.identical( got, expected );

  test.case = 'not found begin';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'dd', '' );
  test.identical( got, expected );

  test.case = 'not found end';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', '', 'dd' );
  test.identical( got, expected );

  test.case = 'empty entry';
  var expected = [ '', '', 'aa_aa_bb_bb_cc_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', '', '' );
  test.identical( got, expected );

  test.case = 'empty entry, empty src';
  var expected = [ '', '', '', '', '' ];
  var got = _.strIsolateInside( '', '', '' );
  test.identical( got, expected );

  test.case = 'empty src';
  var expected = [ '', undefined, '', undefined, '' ];
  var got = _.strIsolateInside( '', 'aa', 'bb' );
  test.identical( got, expected );

  test.close( 'string' );

  /* - */

  test.open( 'regexp' );

  test.case = 'begin smeared';
  var expected = [ 'x', 'aa', 'x_xaax_xbbx_xb', 'bx', '_xccx_xccx' ];
  var got = _.strIsolateInside( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /a\w/, /b\w/ );
  test.identical( got, expected );

  test.case = 'middle smeared';
  var expected = [ 'xaax_xaax_x', 'bb', 'x_xbbx_xccx_xc', 'cx', '' ];
  var got = _.strIsolateInside( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /b\w/, /c\w/ );
  test.identical( got, expected );

  test.case = 'end smeared';
  var expected = [ '', undefined, 'xaax_xaax_xbbx_xbbx_xccx_xccx', undefined, '' ];
  var got = _.strIsolateInside( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /c\w/, /d\w/ );
  test.identical( got, expected );
  var expected = [ 'xaax_xaax_xbbx_xbbx_x', 'cc', 'x_xccx', '', '' ];
  var got = _.strIsolateInside( 'xaax_xaax_xbbx_xbbx_xccx_xccx', /c\w/, /(?:)/ );
  test.identical( got, expected );

  test.case = 'begin';
  var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /a+/, /b+/ );
  test.identical( got, expected );

  test.case = 'middle';
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /b+/, /c+/ );
  test.identical( got, expected );

  test.case = 'end';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /c+/, /d+/ );
  test.identical( got, expected );
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /c+/, /(?:)/ );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry';
  var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ /a+/, /b+/ ], [ /a+/, /b+/ ] );
  test.identical( got, expected );
  var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ /b+/, /a+/ ], [ /b+/, /a+/ ] );
  test.identical( got, expected );

  test.case = 'middle, several entry';
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ /b+/, /c+/ ], [ /b+/, /c+/ ] );
  test.identical( got, expected );
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ /c+/, /b+/ ], [ /c+/, /b+/ ] );
  test.identical( got, expected );

  test.case = 'end, several entry';
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ /c+/, /d+/ ], [ /c+/, /d+/ ] );
  test.identical( got, expected );
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ], [ /d+/, /c+/ ] );
  test.identical( got, expected );
  var expected = [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ /d+/, /c+/ ], [ /(?:)/, /(?:)/ ] );
  test.identical( got, expected );

  /* */

  test.case = 'begin, several entry, several sources';
  var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /a+/, /b+/ ], [ /a+/, /b+/ ] );
  test.identical( got, expected );
  var expected = [ [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ], [ 'cc_cc_', 'bb', '_bb_aa_', 'aa', '' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /a+/ ], [ /b+/, /a+/ ] );
  test.identical( got, expected );

  test.case = 'middle, several entry, several sources';
  var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /b+/, /c+/ ], [ /b+/, /c+/ ] );
  test.identical( got, expected );
  var expected = [ [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ], [ '', 'cc', '_cc_bb_', 'bb', '_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /b+/ ], [ /c+/, /b+/ ] );
  test.identical( got, expected );

  test.case = 'end, several entry, several sources';
  var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /c+/, /d+/ ], [ /c+/, /d+/ ] );
  test.identical( got, expected );
  var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_', 'cc', '' ], [ '', 'cc', '_', 'cc', '_bb_bb_aa_aa' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ], [ /d+/, /c+/ ] );
  test.identical( got, expected );
  var expected = [ [ 'aa_aa_bb_bb_', 'cc', '_cc', '', '' ], [ '', 'cc', '_cc_bb_bb_aa_aa', '', '' ] ];
  var got = _.strIsolateInside( [ 'aa_aa_bb_bb_cc_cc', 'cc_cc_bb_bb_aa_aa' ], [ /d+/, /c+/ ], [ /(?:)/, /(?:)/ ] );
  test.identical( got, expected );

  /* */

  test.case = 'no entry';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [], [] );
  test.identical( got, expected );

  test.case = 'not found';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /d+/, /d+/ );
  test.identical( got, expected );

  test.case = 'not found begin';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /d+/, /(?:)/ );
  test.identical( got, expected );

  test.case = 'not found end';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /(?:)/, /d+/ );
  test.identical( got, expected );

  test.case = 'empty entry';
  var expected = [ '', '', 'aa_aa_bb_bb_cc_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', /(?:)/, /(?:)/ );
  test.identical( got, expected );

  test.case = 'empty entry, empty src';
  var expected = [ '', '', '', '', '' ];
  var got = _.strIsolateInside( '', /(?:)/, /(?:)/ );
  test.identical( got, expected );

  test.case = 'empty src';
  var expected = [ '', undefined, '', undefined, '' ];
  var got = _.strIsolateInside( '', /a+/, /b+/ );
  test.identical( got, expected );

  test.close( 'regexp' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strIsolateInside() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.strIsolateInside( '' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strIsolateInside( '', '', '', '' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strIsolateInside( 1, '', '' ) );

  test.case = 'wrong type of begin';
  test.shouldThrowErrorSync( () => _.strIsolateInside( '', 3 ) );
  test.shouldThrowErrorSync( () => _.strIsolateInside( '123', 1, '' ) );

  test.case = 'wrong type of end';
  test.shouldThrowErrorSync( () => _.strIsolateInside( '123', '', 3 ) );
}

//

function strIsolateInsidePairs( test )
{

  /* */

  test.case = 'string';
  var expected = [ '', 'aa', '_', 'aa', '_bb_bb_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'aa' );
  test.identical( got, expected );

  test.case = 'string, nothing found';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', 'aa'+'a' );
  test.identical( got, expected );

  test.case = 'all empty';
  var expected = [ '', '', '', '', '' ];
  var got = _.strIsolateInside( '', '' );
  test.identical( got, expected );

  test.case = 'empty str delimeter';
  var expected = [ '', '', 'aa_aa_bb_bb_cc_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', '' );
  test.identical( got, expected );

  test.case = 'empty array delimeter';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [] );
  test.identical( got, expected );

  test.case = 'begin';
  var expected = [ '', 'aa', '_aa_bb_', 'bb', '_cc_cc' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ [ 'aa', 'bb' ], [ 'bb', 'cc' ] ] );
  test.identical( got, expected );

  test.case = 'middle';
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_', 'cc', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ [ 'bb', 'cc' ], [ 'cc', 'cc' ] ] );
  test.identical( got, expected );

  test.case = 'end';
  var expected = [ 'aa_aa_', 'bb', '_bb_cc_cc', '', '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ [ 'cc', '' ], [ 'bb', '' ] ] );
  test.identical( got, expected );

  test.case = 'nothing found';
  var expected = [ '', undefined, 'aa_aa_bb_bb_cc_cc', undefined, '' ];
  var got = _.strIsolateInside( 'aa_aa_bb_bb_cc_cc', [ [ 'cc', 'dd' ], [ 'aa', 'dd' ] ] );
  test.identical( got, expected );

  /* */

}

// --
// splits
// --

function strSplitsCoupledGroup( test )
{

  test.open( 'trivial' );

  test.case = 'empty';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', '<<-', 'dd' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', '<<-' ], 'dd' ];
  test.identical( got, expected );

  test.case = 'middle';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', 'bb', 'cc', '<<-', 'dd' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', 'bb', 'cc', '<<-' ], 'dd' ];
  test.identical( got, expected );

  test.case = 'left';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ '>>', 'bb', 'cc', '<<-', 'dd' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ [ '>>', 'bb', 'cc', '<<-' ], 'dd' ];
  test.identical( got, expected );

  test.case = 'right';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', 'bb', 'cc', '<<-' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', 'bb', 'cc', '<<-' ] ];
  test.identical( got, expected );

  /* - */

  test.close( 'trivial' );
  test.open( 'several' );

  /* - */

  test.case = 'empty';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', '<<-', '>>', '<<-', 'dd' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', '<<-' ], [ '>>', '<<-' ], 'dd' ];
  test.identical( got, expected );

  test.case = 'middle';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', 'bb', 'cc', '<<-', 'dd', '>>', 'ee', 'ff', '<<-', 'gg' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', 'bb', 'cc', '<<-' ], 'dd', [ '>>', 'ee', 'ff', '<<-' ], 'gg' ];
  test.identical( got, expected );

  test.case = 'left';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ '>>', 'bb', 'cc', '<<-', '>>', 'ee', 'ff', '<<-', 'gg' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ [ '>>', 'bb', 'cc', '<<-' ], [ '>>', 'ee', 'ff', '<<-' ], 'gg' ];
  test.identical( got, expected );

  test.case = 'right';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', 'bb', 'cc', '<<-', '>>', 'ee', 'ff', '<<-' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', 'bb', 'cc', '<<-' ], [ '>>', 'ee', 'ff', '<<-' ] ];
  test.identical( got, expected );

  test.close( 'several' );
  test.open( 'recursion' );

  /* - */

  test.case = 'empty';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', '>>', '<<=', '<<-', 'dd' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', [ '>>', '<<=' ], '<<-' ], 'dd' ];
  test.identical( got, expected );

  test.case = 'middle';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', 'bb', '>>', 'cc', 'dd', '<<=', 'ee', '<<-', 'ff' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', 'bb', [ '>>', 'cc', 'dd', '<<=' ], 'ee', '<<-' ], 'ff' ];
  test.identical( got, expected );

  test.case = 'left';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ '>>', '>>', 'cc', 'dd', '<<=', 'ee', '<<-', 'ff' ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ [ '>>', [ '>>', 'cc', 'dd', '<<=' ], 'ee', '<<-' ], 'ff' ];
  test.identical( got, expected );

  test.case = 'right';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', 'bb', '>>', 'cc', 'dd', '<<=', '<<-'  ],
    prefix : '>>',
    postfix : /^<</,
  });
  var expected = [ 'aa', [ '>>', 'bb', [ '>>', 'cc', 'dd', '<<=' ], '<<-' ] ];
  test.identical( got, expected );

  test.close( 'recursion' );
  test.open( 'uncoupled prefix' );

  /* - */

  test.case = 'empty';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', '>>', '<<-', 'dd' ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPrefix : 1,
  });
  var expected = [ 'aa', '>>', [ '>>', '<<-' ], 'dd' ];
  test.identical( got, expected );

  test.case = 'middle';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', 'bb', '>>', 'cc', '>>', 'dd', '<<=', 'ee', 'ff' ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPrefix : 1,
  });
  var expected = [ 'aa', 'bb', '>>', 'cc', [ '>>', 'dd', '<<=' ], 'ee', 'ff' ];
  test.identical( got, expected );

  test.case = 'left';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ '>>', '>>', 'dd', '<<=', 'ee', 'ff' ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPrefix : 1,
  });
  var expected = [ '>>', [ '>>', 'dd', '<<=' ], 'ee', 'ff' ];
  test.identical( got, expected );

  test.case = 'right';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', 'bb', '>>', 'cc', '>>', '<<=' ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPrefix : 1,
  });
  var expected = [ 'aa', 'bb', '>>', 'cc', [ '>>', '<<=' ] ];
  test.identical( got, expected );

  /* - */

  test.close( 'uncoupled prefix' );
  test.open( 'uncoupled postfix' );

  /* - */

  test.case = 'empty';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', '>>', '<<=', '<<-', 'dd' ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPostfix : 1,
  });
  var expected = [ 'aa', [ '>>', '<<=' ], '<<-', 'dd' ];
  test.identical( got, expected );

  test.case = 'middle';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', 'bb', '>>', 'cc', 'dd', '<<=', 'ee', '<<-', 'ff' ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPostfix : 1,
  });
  var expected = [ 'aa', 'bb', [ '>>', 'cc', 'dd', '<<=' ], 'ee', '<<-', 'ff' ];
  test.identical( got, expected );

  test.case = 'left';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ '>>', 'cc', 'dd', '<<=', 'ee', '<<-', 'ff' ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPostfix : 1,
  });
  var expected = [ [ '>>', 'cc', 'dd', '<<=' ], 'ee', '<<-', 'ff' ];
  test.identical( got, expected );

  test.case = 'right';

  var got = _.strSplitsCoupledGroup
  ({
    splits : [ 'aa', 'bb', '>>', 'cc', 'dd', '<<=', '<<-'  ],
    prefix : '>>',
    postfix : /^<</,
    allowingUncoupledPostfix : 1,
  });
  var expected = [ 'aa', 'bb', [ '>>', 'cc', 'dd', '<<=' ], '<<-'  ];
  test.identical( got, expected );

  /* - */

  test.close( 'uncoupled postfix' );
  test.open( 'throwing' )

  /* - */

  test.case = 'uncoupled postfix';
  test.shouldThrowErrorSync( () =>
  {
    _.strSplitsCoupledGroup
    ({
      splits : [ 'aa', '>>', '<<=', '<<-', 'dd' ],
      prefix : '>>',
      postfix : /^<</,
    });
  });

  test.case = 'uncoupled prefix';
  test.shouldThrowErrorSync( () =>
  {
    _.strSplitsCoupledGroup
    ({
      splits : [ 'aa', '>>', '>>', '<<=', 'dd' ],
      prefix : '>>',
      postfix : /^<</,
    });
  });

  test.close( 'throwing' );

}

//

function strSplitsDropEmpty( test )
{
  test.case = 'empty splits array';
  var got = _.strSplitsDropEmpty( { splits : [] } );
  test.identical( got, [] );

  test.case = 'splits array has elements';
  var got = _.strSplitsDropEmpty( { splits : [ '1', '2', '3' ] } );
  test.identical( got, [ '1', '2', '3' ] );

  test.case = 'splits array has elements : null, undefined, false';
  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', null ] } );
  test.identical( got, [ '1', 'str' ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', undefined ] } );
  test.identical( got, [ '1', 'str' ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', false ] } );
  test.identical( got, [ '1', 'str' ] );

  var got = _.strSplitsDropEmpty( { splits : [ null, false, undefined ] } );
  test.identical( got, [] );

  test.case = 'splits array has elements in container';
  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', [ '2' ] ] } );
  test.identical( got, [ '1', 'str', [ '2' ] ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', { a : '2' } ] } );
  test.identical( got, [ '1', 'str', { a : '2' } ] );

  test.case = 'splits array has elements in container : null, undefined, false';
  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', [ null ] ] } );
  test.identical( got, [ '1', 'str', [ null ] ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', [ undefined ] ] } );
  test.identical( got, [ '1', 'str', [ undefined ] ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', [ false ] ] } );
  test.identical( got, [ '1', 'str', [ false ] ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', { a : null } ] } );
  test.identical( got, [ '1', 'str', { a : null } ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', { a : undefined } ] } );
  test.identical( got, [ '1', 'str', { a : undefined } ] );

  var got = _.strSplitsDropEmpty( { splits : [ '1', 'str', { a : false } ] } );
  test.identical( got, [ '1', 'str', { a : false } ] );

  /* - */

  test.case = 'splits is unroll, empty';
  var splits = _.unrollFrom( [] );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [] );
  test.true( _.unrollIs( got ) );

  test.case = 'splits is unroll, no undefines';
  var splits = _.unrollFrom( [ '1', '3', 'str' ] );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [ '1', '3', 'str' ] );
  test.true( _.unrollIs( got ) );

  test.case = 'splits is unroll, has undefines';
  var splits = _.unrollFrom( [ '1', 'str', null ] );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [ '1', 'str' ] );
  test.true( _.unrollIs( got ) );

  var splits = _.unrollFrom( [ null, false, undefined ] );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [] );
  test.true( _.unrollIs( got ) );

  test.case = 'unroll contains another unroll';
  var splits = _.unrollFrom( [ '1', 'str', _.unrollMake( [ '0' ] ) ] );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [ '1', 'str', '0' ] );
  test.true( _.unrollIs( got ) );

  test.case = 'unroll contains another unroll, undefines';
  var splits = _.unrollFrom( [ '1', 'str', _.unrollMake( [ null, undefined, false ] ) ] );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [ '1', 'str' ] );
  test.true( _.unrollIs( got ) );

  var splits = _.unrollFrom( [ '1', 'str', _.unrollMake( [ [ null, undefined, false ] ] ) ] );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [ '1', 'str', [ null, undefined, false ] ] );
  test.true( _.unrollIs( got ) );

  /* - */

  test.case = 'another arrayLike objects in splits';
  var src = _.argumentsArray.make( [ '0', 'str', false ] );
  var splits = _.arrayFrom( src );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [ '0', 'str' ] );

  var splits = new Array( '0', 'str', undefined );
  var got = _.strSplitsDropEmpty( { splits } );
  test.identical( got, [ '0', 'str' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty() );
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( {} ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( { splits : [ '1', '2' ] }, 1 ) );

  test.case = 'extra option';
  var src = { splits : [ 1, 2, 3 ], delimeter : '/' };
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( src ) );

  test.case = 'invalid arguments';
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( 1 ) );
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( 'str' ) );
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( null ) );
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( NaN ) );
  test.shouldThrowErrorSync( () => _.strSplitsDropEmpty( [ 1, 'str' ] ) );
}

//

function strSplitsUngroupedJoin( test )
{

  test.case = 'empty array';
  var got = _.strSplitsUngroupedJoin( [] );
  var expected = [];
  test.identical( got, expected );

  test.case = 'array of empty string';
  var got = _.strSplitsUngroupedJoin( [ '' ] );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'src = [ \'abc\' ]';
  var got = _.strSplitsUngroupedJoin( [ 'abc' ] );
  var expected = [ 'abc' ];
  test.identical( got, expected );

  test.case = 'src = [ \'abc\', \'bca\', \'cab\' ]';
  var got = _.strSplitsUngroupedJoin( [ 'abc', 'bca', 'cab' ] );
  var expected = [ 'abcbcacab' ];
  test.identical( got, expected );

  test.case = 'src = [ 2 ]';
  var got = _.strSplitsUngroupedJoin( [ 2 ] );
  var expected = [ 2 ];
  test.identical( got, expected );

  test.case = 'src = [ \'a\', \'b\', \'c\', 1 ]';
  var got = _.strSplitsUngroupedJoin( [ 'a', 'b', 'c', 1 ] );
  var expected = [ 'abc', 1 ];
  test.identical( got, expected );

  test.case = 'src = [ \'a\', \'b\', 1, \'c\' ]';
  var got = _.strSplitsUngroupedJoin( [ 'a', 'b', 1, 'c' ] );
  var expected = [ 'ab', 1, 'c' ];
  test.identical( got, expected );

  test.case = 'src = [ \'a\', \'b\', 1, \'c\', null, \'d\', \'e\', \'f\' ]';
  var got = _.strSplitsUngroupedJoin( [ 'a', 'b', 1, 'c', null, 'd', 'e', 'f' ] );
  var expected = [ 'ab', 1, 'c', null, 'def' ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strSplitsUngroupedJoin() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strSplitsUngroupedJoin( { splits : [ 'a', 'b' ], a : 1 } ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strSplitsUngroupedJoin( '' ) );
}

//

function strSplitsQuotedRejoin( test )
{

  test.case = 'empty splits';

  var splits = [];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [];
  test.identical( splits, expected );

  /* */

  test.case = 'splits : prefix and postfix';

  var splits = [ '<', '>' ];
  var delimeter = [ '<', '>' ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '<', '>' ];
  test.identical( splits, expected );

  /* */

  test.case = 'splits : prefix and prefix';

  var splits = [ '<', '<' ];
  var delimeter = [ '<', '>' ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '<', '<' ];
  test.identical( splits, expected );

  /* */

  test.case = 'splits : postfix and postfix';

  var splits = [ '>', '>' ];
  var delimeter = [ '<', '>' ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '>', '>' ];
  test.identical( splits, expected );

  /* */

  test.case = 'default quotingPrefixes, quotingPostfixes';

  var splits = [ `"`, `r1`, `"`, `"`, `r2`, `"` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `"r1"`, `"r2"` ];
  test.identical( splits, expected );

  /* */

  test.case = 'quoting : 0';
  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 0,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'only prefixes and postfixes in splits';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `>`, `<`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<><>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  debugger;
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  debugger;
  var expected = [ `<r1>`, `<r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, preservingQuoting : 0';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 0,
    inliningQuoting : 0,
  });
  var expected = [ `r1`, `r2` ];

  /* */

  test.case = 'basic, first el withot quoting';
  var splits = [ `r1`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ 'r1', '<r2>' ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, last el withot quoting';
  var splits = [ `<`, `r1`, `>`, `r2` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '<r1>', 'r2' ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix and postfix are the same, complementary';

  var splits = [ `<`, `r1`, `<`, `<`, `r2`, `<` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '<' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1<`, `<r2<` ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix and postfix are NOT the same, not complementary';

  var splits = [ `<`, `r1`, `<`, `<`, `r2`, `<` ];
  var delimeter = [ '<', '>' ]
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<`, `r1`, `<`, `<`, `r2`, `<` ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix and postfix are NOT the same, complementary';

  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1>`, `<r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix[ 0 ] and postfix[ 0 ] are the same, prefix[ 1 ] and postfix[ 1 ] are NOT the same, complementary';
  var splits = [ `"`, `r1`, `"`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '"', '<' ],
    quotingPostfixes : [ '"', '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '"r1"', '<r2>' ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix[ 0 ] and postfix[ 0 ] are NOT the same, prefix[ 1 ] and postfix[ 1 ] are the same, complementary';
  var splits = [ `<`, `r1`, `>`, `"`, `r2`, `"` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<', '"' ],
    quotingPostfixes : [ '>', '"' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '<r1>', '"r2"' ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix[ 0 ] = postfix[ 1 ] prefix[ 1 ] = postfix[ 0 ]';
  var delimeter = [ '<', '"' ];
  var splits = [ `<`, `r1`, `>`, `"`, `r2`, `"` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<', '"' ],
    quotingPostfixes : [ '"', '<' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '<r1>"', 'r2', '"' ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix[ 0 ], postfix[ 0 ] - complementary, prefix[ 1 ], postfix[ 1 ] - not complementary';
  var delimeter = [ '<', '"', '{', '>' ];
  var splits = [ `<`, `r1`, `"`, `{`, `r2`, `}` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<', '{' ],
    quotingPostfixes : [ '"', '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '<r1"', `{`, `r2`, `}` ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix and postfix are the same, first el withot quoting';
  var splits = [ `r1`, `"`, `r2`, `"` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '"' ],
    quotingPostfixes : [ '"' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ 'r1', '"r2"' ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, o.pairing : 1, prefix and postfix are the same, last el withot quoting';
  var splits = [ `"`, `r1`, `"`, `r2` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '"' ],
    quotingPostfixes : [ '"' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ '"r1"', 'r2' ];
  test.identical( splits, expected );

  /* */

  test.case = 'basic, prefix and postfix have different lengths';

  var splits = [ `<<`, `r1`, `>>>`, `<<`, `r2`, `>>>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    quotingPrefixes : [ '<<' ],
    quotingPostfixes : [ '>>>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<<r1>>>`, `<<r2>>>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are custom & the same';

  var delimeter = [ '-' ];
  var splits = [ `-`, `r1`, `-`, `-`, `r2`, `-` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '-' ],
    quotingPostfixes : [ '-' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `-r1-`, `-r2-` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, 2 prefixes';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<<r1>`, `<r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, 2 postfixes';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1>`, `>`, `<r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, no matching postfix first';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1<r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, no matching postfix last';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1>`, `<`, `r2` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, no matching postfix first, with delimiter';

  var delimeter = [ '|' ];
  var splits = [ `<`, `r1`, `|`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1|<r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, no matching postfix last, with delimiter';

  var delimeter = [ '|' ];
  var splits = [ `<`, `r1`, `>`, `|`, `<`, `r2` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1>`, `|<r2` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, postfix before prefix';

  var delimeter = [ '<', '>' ];
  var splits = [ `>`, `r1`, `<` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `>`, `r1`, `<` ];
  test.identical( splits, expected );

  /* */

  test.case = `quotingPrefixes : [ '{', '<' ], quotingPostfixes : [ '>', '}' ]`;

  var splits = [ `{`, `r1`, `>`, `<`, `r2`, `}` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    quotingPrefixes : [ '{', '<' ],
    quotingPostfixes : [ '>', '}' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `{r1>`, `<r2}` ];
  test.identical( splits, expected );

  /* */

  test.case = 'only prefix in splits';

  var delimeter = [ '<', '>' ];
  var splits = [ `<` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<` ];
  test.identical( splits, expected );

  /* */

  test.case = '3 elems in splits';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>`, `<`, `r3`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1>`, `<r2>`, `<r3>` ];
  test.identical( splits, expected );

  /* */

  test.case = '3 elems in splits, wrong enclosing';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `<`, `r2`, `>`, `<`, `r3` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
  });
  var expected = [ `<r1<r2>`, `<`, `r3` ];
  test.identical( splits, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitsQuotedRejoin();
  });

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitsQuotedRejoin([]);
  });

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitsQuotedRejoin( 13 );
  });

  test.case = 'o.pairing : 1, o.quotingPrefixes.length !== o.quotingPostfixes.length';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitsQuotedRejoin
    ({
      splits : [ '<<', 'a', '>' ],
      quoting : 1,
      quotingPrefixes : [ '<', '<<' ],
      quotingPostfixes : [ '>' ],
      preservingQuoting : 1,
      inliningQuoting : 0,
    });
  });

}

//

function strSplitsQuotedRejoinOptionOnQuoting( test )
{

  test.case = 'empty splits, return +';

  var delimeter = [ '<', '>' ];
  var splits = [];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => '+'
  });
  var expected = [];
  test.identical( splits, expected );

  /* */

  test.case = 'add strings';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => '+' + el + '+'
  });
  var expected = [ `+<r1>+`, `+<r2>+` ];
  test.identical( splits, expected );

  /* */

  test.case = 'preservingQuoting : 0, add strings';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 0,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => '+' + el + '+'
  });
  var expected = [ `+r1+`, `+r2+` ];

  /* */

  test.case = 'prefix & postfix are the same, no transformation';

  var delimeter = [ '-' ];
  var splits = [ `-`, `r1`, `-`, `-`, `r2`, `-` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '-' ],
    quotingPostfixes : [ '-' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => el
  });
  var expected = [ `-r1-`, `-r2-` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, 2 prefixes, return +';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => '+'
  });
  var expected = [ `+`, `+` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, 2 postfixes, return empty string';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => ''
  });
  var expected = [ ``, `>`, `` ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, no matching postfix first, return [ o.quoting, o.delimeter ]';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => [ o.quoting, o.delimeter ]
  });
  var expected = [ [ 1, delimeter ] ];
  test.identical( splits, expected );

  /* */

  test.case = 'prefix & postfix are different, no matching postfix last, return [ el, o.quoting ]';

  var delimeter = [ '<', '>' ];
  var splits = [ `<`, `r1`, `>`, `<`, `r2` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => [ el, o.quoting ]
  });
  var expected = [ [ '<r1>', 1 ], '<', 'r2' ];
  test.identical( splits, expected );

  /* */

  test.case = `prefix & postfix are different, no matching postfix first, with delimiter, return 'el : ' + el`;

  var delimeter = [ '|' ];
  var splits = [ `<`, `r1`, `|`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ `el : <r1|<r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = `prefix & postfix are different, no matching postfix last, with delimiter, return 'el : ' + el`;

  var delimeter = [ '|' ];
  var splits = [ `<`, `r1`, `>`, `|`, `<`, `r2` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ `el : <r1>`, `|<r2` ];
  test.identical( splits, expected );

  /* */

  test.case = `prefix & postfix are different, postfix before prefix, return 'el : ' + el`;

  var delimeter = [ '<', '>' ];
  var splits = [ `>`, `r1`, `<` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ `>`, `r1`, `<` ];
  test.identical( splits, expected );

  /* */

  test.case = `only prefix in splits, return 'el : ' + el`;

  var delimeter = [ '<', '>' ];
  var splits = [ `<` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ `<` ];
  test.identical( splits, expected );

  /* */

  test.case = `o.pairing : 1, prefix and postfix are the same, complementary, return 'el : ' + el`;

  var splits = [ `<`, `r1`, `<`, `<`, `r2`, `<` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '<' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ `el : <r1<`, `el : <r2<` ];
  test.identical( splits, expected );

  /* */

  test.case = `o.pairing : 1, prefix and postfix are NOT the same, not complementary, return 'el : ' + el`;

  var splits = [ `<`, `r1`, `<`, `<`, `r2`, `<` ];
  var delimeter = [ '<', '>' ]
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ `<`, `r1`, `<`, `<`, `r2`, `<` ];
  test.identical( splits, expected );

  /* */

  test.case = `o.pairing : 1, prefix and postfix are NOT the same, complementary, return 'el : ' + el`;

  var splits = [ `<`, `r1`, `>`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<' ],
    quotingPostfixes : [ '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ `el : <r1>`, `el : <r2>` ];
  test.identical( splits, expected );

  /* */

  test.case = `o.pairing : 1, prefix[ 1 ] and postfix[ 1 ] are NOT the same, complementary, return 'el : ' + el`;
  var splits = [ `"`, `r1`, `"`, `<`, `r2`, `>` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '"', '<' ],
    quotingPostfixes : [ '"', '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ 'el : "r1"', 'el : <r2>' ];
  test.identical( splits, expected );

  /* */

  test.case = `o.pairing : 1, prefix[ 1 ] and postfix[ 1 ] are the same, complementary, return 'el : ' + el`;
  var splits = [ `<`, `r1`, `>`, `"`, `r2`, `"` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<', '"' ],
    quotingPostfixes : [ '>', '"' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ 'el : <r1>', 'el : "r2"' ];
  test.identical( splits, expected );

  /* */

  test.case = `o.pairing : 1, prefix[ 0 ] = postfix[ 1 ] prefix[ 1 ] = postfix[ 0 ], return 'el : ' + el`;
  var delimeter = [ '<', '"' ];
  var splits = [ `<`, `r1`, `>`, `"`, `r2`, `"` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<', '"' ],
    quotingPostfixes : [ '"', '<' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ 'el : <r1>"', 'r2', '"' ];
  test.identical( splits, expected );

  /* */

  test.case =
  `o.pairing : 1, prefix[ 0 ], postfix[ 0 ] - complementary, prefix[ 1 ], postfix[ 1 ] - not complementary, return 'el : ' + el`;
  var delimeter = [ '<', '"', '{', '>' ];
  var splits = [ `<`, `r1`, `"`, `{`, `r2`, `}` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    delimeter,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '<', '{' ],
    quotingPostfixes : [ '"', '>' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ 'el : <r1"', `{`, `r2`, `}` ];
  test.identical( splits, expected );

  /* */

  test.case = `basic, o.pairing : 1, prefix and postfix are the same, first el withot quoting, return 'el : ' + el`;
  var splits = [ `r1`, `"`, `r2`, `"` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '"' ],
    quotingPostfixes : [ '"' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ 'r1', 'el : "r2"' ];
  test.identical( splits, expected );

  /* */

  test.case = `basic, o.pairing : 1, prefix and postfix are the same, last el withot quoting, return 'el : ' + el`;
  var splits = [ `"`, `r1`, `"`, `r2` ];
  _.strSplitsQuotedRejoin
  ({
    splits,
    quoting : 1,
    pairing : 1,
    quotingPrefixes : [ '"' ],
    quotingPostfixes : [ '"' ],
    preservingQuoting : 1,
    inliningQuoting : 0,
    onQuoting : ( el, o ) => 'el : ' + el
  });
  var expected = [ 'el : "r1"', 'r2' ];
  test.identical( splits, expected );

}

// --
// splitter
// --

function strSplitFast( test )
{
  test.case = 'trivial';

  var got = _.strSplitFast( '', '' );
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplitFast( 'abc', '' );
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  var got = _.strSplitFast( '', 'a' );
  var expected = [ '' ];
  test.identical( got, expected );

  var got = _.strSplitFast( 'test test test' );
  var expected = [ 'test', ' ', 'test', ' ', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var got = _.strSplitFast( ' test   test   test ' );
  var expected = [ '', ' ', 'test', ' ', '', ' ', '', ' ', 'test', ' ', '', ' ', '', ' ', 'test', ' ', '' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var got = _.strSplitFast( ' test   test   test ', 'something' );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var got = _.strSplitFast( ' test <delimteter>  test<delimteter>   test ', '<delimteter>' );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var got = _.strSplitFast( 'a b c d' );
  var expected = [ 'a', ' ', 'b', ' ', 'c', ' ', 'd' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 1,
    preservingDelimeters : 0,
  */

  var op =
  {
    preservingEmpty : 1,
    preservingDelimeters : 0,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', '', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ '', 'test', '', '', 'test', '', '', 'test', '' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '  test', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ '', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'Aa', '', '', '', '', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', ' ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'a1', 'a2', 'a3', '', '', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', '', ' b ', '', ' c ', '', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ '', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ '', '', '', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', 'a b', ' ', '', ' c', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '" ""', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', '', '', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', 'x', '', '', '', '', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 0,
    preservingDelimeters : 0,
  */

  var op =
  {
    preservingEmpty : 0,
    preservingDelimeters : 0,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '  test', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'Aa', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', ' ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'a1', 'a2', 'a3', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a b', ' ', ' c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '" ""' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ 'x', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 1,
    preservingDelimeters : 1,
  */

  var op =
  {
    preservingEmpty : 1,
    preservingDelimeters : 1,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', '', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', ' ', 'test', ' ', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ '', ' ', 'test', ' ', '', ' ', '', ' ', 'test', ' ', '', ' ', '', ' ', 'test', ' ', '' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', 'c', ' ', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', ',', 'b', ',', 'c', ',', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ '', '.', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '.', '' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'Aa', ' ', '', '<<!', '', ' ', '', '<<-', '', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', '<<!', ' ', '<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', '<<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'a1', ' ', 'a2', ' ', 'a3', ' ', '', '<<<-', '', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', '.', '', ',', ' b ', '.', '', ',', ' c ', '.', '', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ',', ' b ', ',', ' c ', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ '', ',', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ '', ',', '', ',', '', ',', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', 'a b', '"', ' ', '"', '', '"', ' c', '"', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '" ""', ' c', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', '', '"', '', '"', '', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', '', '"', '', '"', '', ' c', '' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '', 'a', '', ' ', '', 'b', '', '"', '', ' ', '', '"', '', '"', '', ' ', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', 'x', '', '', ' ', '', '"', '', '"', '', ' ', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 0,
    preservingDelimeters : 1,
  */

  var op =
  {
    preservingEmpty : 0,
    preservingDelimeters : 1,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', ' ', 'test', ' ', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ ' ', 'test', ' ', ' ', ' ', 'test', ' ', ' ', ' ', 'test', ' ' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = 'x';
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = '<delimteter>';
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', 'c', ' ', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', ',', 'b', ',', 'c', ',', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ '.', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '.' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'Aa', ' ', '<<!', ' ', '<<-', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', '<<!', ' ', '<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa ', '<<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'a1', ' ', 'a2', ' ', 'a3', ' ', '<<<-', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a ', '.', ',', ' b ', '.', ',', ' c ', '.', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a ', ',', ' b ', ',', ' c ', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ ',' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ ',', ',', ',' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' c', '"' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '" ""', ' c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' c' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', 'x', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strSplitFast( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strSplitFast( [  ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strSplitFast( 13 );
  } );

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitFast( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitFast( 123 );
  });

  test.case = 'invalid option type';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitFast( { src : 3 } );
  });

  test.case = 'invalid option defined';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitFast( { src : 'word', delimeter : 0, left : 1 } );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitFast();
  });

}

//

function strSplitFastRegexp( test )
{

  test.case = 'trivial';

  var got = _.strSplitFast( 'a b c', / / );
  var expected = [ 'a', ' ', 'b', ' ', 'c' ];
  test.identical( got, expected );

  var got = _.strSplitFast( 'abc', /(?:)/ );
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  var got = _.strSplitFast( '', /(?:)/ );
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplitFast( '', 'a' );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var got = _.strSplitFast( ' test <delimteter>  test<delimteter>   test ', /<delimteter>/ );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 1,
    preservingDelimeters : 0,
  */

  var op =
  {
    preservingEmpty : 1,
    preservingDelimeters : 0,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /a/;
  var got = _.strSplitFast( o );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = /x/;
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = /<delimteter>/;
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '  test', '   test ' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = /,/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ /,/, /\./ ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ /,/ ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ /\./, /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ '', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ /\./, /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'Aa', '', '', '', '', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', ' ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'a1', 'a2', 'a3', '', '', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ /\./ ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ /,/, /\./ ];
  var expected = [ 'a ', '', ' b ', '', ' c ', '', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = /,/;
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = /,/;
  var expected = [ '', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = /,/;
  var expected = [ '', '', '', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ '', 'a b', ' ', '', ' c', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '" ""', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / /, / c/, /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', '', '', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/, /"/, / / ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ new RegExp(), /a b/, / /, '', ' c' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ /a b/, / /, ' c', '"', '' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '', '', '', 'x', '', '', '', '', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 0,
    preservingDelimeters : 0,
  */

  var op =
  {
    preservingEmpty : 0,
    preservingDelimeters : 0,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /a/;
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = /x/;
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = /<delimteter>/;
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '  test', '   test ' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = /,/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ /,/, /\./ ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ /,/ ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', 'b', 'c', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'Aa', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', ' ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'a1', 'a2', 'a3', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ /\./ ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ /,/, /\./ ];
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = /,/;
  var expected = [ 'a ', ' b ', ' c ', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = /,/;
  var expected = [];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = /,/;
  var expected = [];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ 'a b', ' ', ' c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '" ""' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / /, / c/, /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/, /"/, / / ];
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', /a b/, / /, /(?:)/, / c/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ /a b/, / /, / c/, /"/, '' ];
  var got = _.strSplitFast( o );
  var expected = [ 'x', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 1,
    preservingDelimeters : 1,
  */

  var op =
  {
    preservingEmpty : 1,
    preservingDelimeters : 1,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /a/;
  var got = _.strSplitFast( o );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = /x/;
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = /<delimteter>/;
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = /,/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ /,/, /\./ ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ /,/ ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', ',', 'b', ',', 'c', ',', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ '', '.', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '.', '' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'Aa', ' ', '', '<<!', '', ' ', '', '<<-', '', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', '<<!', ' ', '<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', '<<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'a1', ' ', 'a2', ' ', 'a3', ' ', '', '<<<-', '', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ /\./ ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ /,/, /\./ ];
  var expected = [ 'a ', '.', '', ',', ' b ', '.', '', ',', ' c ', '.', '', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = /,/;
  var expected = [ 'a ', ',', ' b ', ',', ' c ', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = /,/;
  var expected = [ '', ',', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = /,/;
  var expected = [ '', ',', '', ',', '', ',', '' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', 'a b', '"', ' ', '"', '', '"', ' c', '"', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '" ""', ' c', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / /, / c/, /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', '', '"', '', '"', '', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/, /"/, / / ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', '', '"', '', '"', '', ' c', '' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', /a b/, / /, /(?:)/, / c/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', '', 'a', '', ' ', '', 'b', '', '"', '', ' ', '', '"', '', '"', '', ' ', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ /a b/, / /, / c/, /"/, '' ];
  var got = _.strSplitFast( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', ' ', 'x', '', '', ' ', '', '"', '', '"', '', ' ', 'c' ];
  test.identical( got, expected );

  /*
    preservingEmpty : 0,
    preservingDelimeters : 1,
  */

  var op =
  {
    preservingEmpty : 0,
    preservingDelimeters : 1,
  }

  /* */

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = /(?:)/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = /a/;
  var got = _.strSplitFast( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplitFast( o );
  var expected = [ 'test', ' ', 'test', ' ', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplitFast( o );
  var expected = [ ' ', 'test', ' ', ' ', ' ', 'test', ' ', ' ', ' ', 'test', ' ' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = /x/;
  var got = _.strSplitFast( o );
  var expected = [ ' test   test   test ' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = /<delimteter>/;
  var got = _.strSplitFast( o );
  var expected = [ ' test ', '<delimteter>', '  test', '<delimteter>', '   test ' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplitFast( o );
  var expected = [ 'a', ' ', 'b', ' ', 'c', ' ', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = /,/;
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ /,/, /\./ ];
  var got = _.strSplitFast( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplitFast( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ /,/ ];
  var got = _.strSplitFast( o );
  var expected = [ '    a', ',', 'b', ',', 'c', ',', 'd   ' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ '.', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', /#/ ];
  var got = _.strSplitFast( o )
  var expected = [ 'content', '.' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'Aa', ' ', '<<!', ' ', '<<-', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', '<<!', ' ', '<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ];
  var expected = [ 'Aa ', '<<<-', ' Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ];
  var expected = [ 'a1', ' ', 'a2', ' ', 'a3', ' ', '<<<-', ' ', 'Bb' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ /\./ ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ /,/, /\./ ];
  var expected = [ 'a ', '.', ',', ' b ', '.', ',', ' c ', '.', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = /,/;
  var expected = [ 'a ', ',', ' b ', ',', ' c ', ',', ' d' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = /,/;
  var expected = [ ',' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = /,/;
  var expected = [ ',', ',', ',' ];
  var got = _.strSplitFast( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' c', '"' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '" ""', ' c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / /, / c/, /"/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ /a b/, / c/, /"/, / / ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', '"', '"', ' c' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', /a b/, / /, /(?:)/, / c/ ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a', ' ', 'b', '"', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ /a b/, / /, / c/, /"/, '' ];
  var got = _.strSplitFast( o );
  var expected = [ '"', 'a b', '"', ' ', 'x', ' ', '"', '"', ' ', 'c' ];
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strSplitFast( /1/, /2/, '3' );
  });

}

//

function strSplit( test )
{

  /* - */

  test.open( 'empty' );

  var got = _.strSplit( '', '' );
  var expected = [];
  test.identical( got, expected );

  debugger;
  var got = _.strSplit( 'abc', '' );
  debugger;
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 0,
  });
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 0,
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit( '', 'a' );
  var expected = [ '' ];
  test.identical( got, expected );

  test.close( 'empty' );

  /* - */

  test.open( 'trivial' );

  var got = _.strSplit( 'test test test' );
  var expected = [ 'test', '', 'test', '', 'test' ];
  test.identical( got, expected );

  var got = _.strSplit( ' test   test   test ' );
  var expected = [ '', '', 'test', '', '', '', '', '', 'test', '', '', '', '', '', 'test', '', '' ];
  test.identical( got, expected );

  var got = _.strSplit( ' test   test   test ', 'something' );
  var expected = [ 'test   test   test' ];
  test.identical( got, expected );

  var got = _.strSplit( ' test <delimteter>  test<delimteter>   test ', '<delimteter>' );
  var expected = [ 'test', '<delimteter>', 'test', '<delimteter>', 'test' ];
  test.identical( got, expected );

  var got = _.strSplit( 'a b c d' );
  var expected = [ 'a', '', 'b', '', 'c', '', 'd' ];
  test.identical( got, expected );

  test.close( 'trivial' );

  /* - */

  test.open( 'trivial, pe:0' );

  var got = _.strSplit({ src : 'test test test', preservingEmpty : 0 });
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  var got = _.strSplit({ src : ' test   test   test ', preservingEmpty : 0 });
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  var got = _.strSplit({ src : ' test   test   test ', delimeter : 'something', preservingEmpty : 0 });
  var expected = [ 'test   test   test' ];
  test.identical( got, expected );

  var got = _.strSplit({ src : ' test <delimteter>  test<delimteter>   test ', delimeter : '<delimteter>', preservingEmpty : 0 });
  var expected = [ 'test', '<delimteter>', 'test', '<delimteter>', 'test' ];
  test.identical( got, expected );

  var got = _.strSplit({ src : 'a b c d', preservingEmpty : 0 });
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.close( 'trivial, pe:0' );

  /* - */

  test.open( 'd:" " trivial' );

  /* */

  test.case = ' space at the beginning';
  var got = _.strSplit( ' aa b#b cc', ' ' );
  var expected = [ '', '', 'aa', '', 'b#b', '', 'cc' ];
  test.identical( got, expected );

  /* */

  test.case = 'space in the end';
  var got = _.strSplit( 'aa b#b cc ', ' ' );
  var expected = [ 'aa', '', 'b#b', '', 'cc', '', '' ];
  test.identical( got, expected );

  /* */

  test.case = 'space on the beginning and the end';
  var got = _.strSplit( ' aa b#b cc ', ' ' );
  var expected = [ '', '', 'aa', '', 'b#b', '', 'cc', '', '' ];
  test.identical( got, expected );

  test.close( 'd:" " trivial' );

  /* - */

  test.open( 'd:"#" trivial' );

  /* */

  test.case = ' space at the beginning';
  var got = _.strSplit( ' aa b#b cc', '#' );
  var expected = [ 'aa b', '#', 'b cc' ];
  test.identical( got, expected );

  /* */

  test.case = 'space in the end';
  var got = _.strSplit( 'aa b#b cc ', '#' );
  var expected = [ 'aa b', '#', 'b cc' ];
  test.identical( got, expected );

  /* */

  test.case = 'space on the beginning and the end';
  var got = _.strSplit( ' aa b#b cc ', '#' );
  var expected = [ 'aa b', '#', 'b cc' ];
  test.identical( got, expected );

  test.close( 'd:"#" trivial' );

  /* - */

  test.open( 's:1 q:0 pe:0' );

  var op =
  {
    stripping : 1,
    quoting : 0,
    preservingEmpty : 0,
  }

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplit( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplit( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplit( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplit( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplit( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplit( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = 'x';
  var got = _.strSplit( o );
  var expected = [ 'test   test   test' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = '<delimteter>';
  var got = _.strSplit( o );
  var expected = [ 'test', '<delimteter>', 'test', '<delimteter>', 'test' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplit( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplit( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplit( o )
  var expected = [ '.', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplit( o )
  var expected = [ 'content', '.' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa', '<<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'a1', 'a2', 'a3', '<<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a', '.', ',', 'b', '.', ',', 'c', '.', ',', 'd' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ ',' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ ',', ',', ',' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplit( o );
  var expected = [ '"', 'a b', '"', '"', '"', 'c', '"' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplit( o );
  var expected = [ '"', 'a b', '" ""', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplit( o );
  var expected = [ '"', 'a b', '"', '"', '"', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplit( o );
  var expected = [ '"', 'a b', '"', '"', '"', 'c' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplit( o );
  var expected = [ '"', 'a', 'b', '"', '"', '"', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplit( o );
  var expected = [ '"', 'a b', '"', 'x', '"', '"', 'c' ];
  test.identical( got, expected );

  test.close( 's:1 q:0 pe:0' );

  /* - */

  test.open( 's:1 q:0 pe:1' );

  var op =
  {
    stripping : 1,
    quoting : 0,
    preservingEmpty : 1,
  }

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplit( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplit( o );
  var expected = [ 'a', '', 'b', '', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplit( o );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplit( o );
  var expected = [ 'a', '', 'b', '', '', '', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplit( o );
  var expected = [ 'test', '', 'test', '', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplit( o );
  var expected = [ '', '', 'test', '', '', '', '', '', 'test', '', '', '', '', '', 'test', '', '' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = 'x';
  var got = _.strSplit( o );
  var expected = [ 'test   test   test' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = '<delimteter>';
  var got = _.strSplit( o );
  var expected = [ 'test', '<delimteter>', 'test', '<delimteter>', 'test' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplit( o );
  var expected = [ 'a', '', 'b', '', 'c', '', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplit( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplit( o )
  var expected = [ '', '.', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplit( o )
  var expected = [ 'content', '.', '' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'Aa', '', '', '<<!', '', '', '', '<<-', '', '', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa', '<<!', '', '<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa', '<<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'a1', '', 'a2', '', 'a3', '', '', '<<<-', '', '', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a', '.', '', ',', 'b', '.', '', ',', 'c', '.', '', ',', 'd' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ '', ',', '' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ '', ',', '', ',', '', ',', '' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c"';
  o.delimeter = [ '"' ];
  var got = _.strSplit( o );
  var expected = [ '', '"', 'a b', '"', '', '"', '', '"', 'c', '"', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplit( o );
  var expected = [ '"', 'a b', '" ""', 'c', '' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplit( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', '', '', '"', '', '"', '', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplit( o );
  var expected = [ '', '"', '', 'a b', '', '"', '', '', '', '"', '', '"', '', 'c', '' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplit( o );
  var expected = [ '"', '', 'a', '', '', '', 'b', '', '"', '', '', '', '"', '', '"', '', '', '', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ '', '"', '', 'a b', '', '"', '', '', 'x', '', '', '', '', '"', '', '"', '', '', 'c' ];
  var got = _.strSplit( o );
  var expected = [ '"', '', 'a', '', '', '', 'b', '', '"', '', '', '', 'x', '', '', '', '"', '', '"', '', '', '', 'c' ];
  test.identical( got, expected );

  test.close( 's:1 q:0 pe:1' );

  /* - */

  test.open( 's:1 q:1 pe:0' );

  var op =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
  }

  test.case = 'empty both';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = '';
  var got = _.strSplit( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'empty delimeter';
  var o = _.mapExtend( null, op );
  o.src = 'abc';
  o.delimeter = '';
  var got = _.strSplit( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'empty src';
  var o = _.mapExtend( null, op );
  o.src = '';
  o.delimeter = 'a';
  var got = _.strSplit( o );
  var expected = [];
  test.identical( got, expected );

  test.case = 'has empty element in result';
  var o = _.mapExtend( null, op );
  o.src = 'a b  c';
  var got = _.strSplit( o );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'returns an array of strings';
  var o = _.mapExtend( null, op );
  o.src = 'test test test';
  var got = _.strSplit( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split string into an array of strings';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  var got = _.strSplit( o );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.case = 'split with delimeter which src does not have';
  var o = _.mapExtend( null, op );
  o.src = ' test   test   test ';
  o.delimeter = 'x';
  var got = _.strSplit( o );
  var expected = [ 'test   test   test' ];
  test.identical( got, expected );

  test.case = 'custom delimeter';
  var o = _.mapExtend( null, op );
  o.src = ' test <delimteter>  test<delimteter>   test ';
  o.delimeter = '<delimteter>';
  var got = _.strSplit( o );
  var expected = [ 'test', '<delimteter>', 'test', '<delimteter>', 'test' ];
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var o = _.mapExtend( null, op );
  o.src = 'a b c d';
  var got = _.strSplit( o );
  var expected = [ 'a', 'b', 'c', 'd' ];
  test.identical( got, expected );

  test.case = 'arguments as map';
  var o = _.mapExtend( null, op );
  o.src = 'a,b,c,d';
  o.delimeter = ',';
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  test.case = 'delimeter as array';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [ ',', '.' ];
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', '.', 'c', '.', 'd' ];
  test.identical( got, expected );

  test.case = 'zero delimeter length';
  var o = _.mapExtend( null, op );
  o.src = 'a,b.c.d';
  o.delimeter = [];
  var got = _.strSplit( o );
  var expected = [ 'a,b.c.d' ];
  test.identical( got, expected );

  test.case = 'stripping off';
  var o = _.mapExtend( null, op );
  o.src = '    a,b,c,d   ';
  o.delimeter = [ ',' ];
  var got = _.strSplit( o );
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  test.identical( got, expected );

  /* */

  test.case = 'many delimeters, delimeter on the begin';
  var o = _.mapExtend( null, op );
  o.src = '.content';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplit( o )
  var expected = [ '.', 'content' ];
  test.identical( got, expected );

  test.case = 'many delimeters, delimeter on the end';
  var o = _.mapExtend( null, op );
  o.src = 'content.';
  o.delimeter = [ '.', '#' ];
  var got = _.strSplit( o )
  var expected = [ 'content', '.' ];
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'many delimeters having common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<! <<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa', '<<!', '<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'having long common';
  var o = _.mapExtend( null, op );
  o.src = 'Aa <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<' ];
  var expected = [ 'Aa', '<<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'having long common 2';
  var o = _.mapExtend( null, op );
  o.src = 'a1 a2 a3 <<<- Bb';
  o.delimeter = [ '->>>', '<<<-', '->>', '<<-', '!>>', '<<!', '>>', '<<', ' ' ];
  var expected = [ 'a1', 'a2', 'a3', '<<<-', 'Bb' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'delimeter not exist in src';

  var o = _.mapExtend( null, op );
  o.src = 'a,b,c';
  o.delimeter = [ '.' ];
  var expected = [ 'a,b,c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /**/

  test.case = 'several delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a ., b ., c ., d';
  o.delimeter = [ ',', '.' ];
  var expected = [ 'a', '.', ',', 'b', '.', ',', 'c', '.', ',', 'd' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'one delimeters';
  var o = _.mapExtend( null, op );
  o.src = 'a , b , c , d';
  o.delimeter = ',';
  var expected = [ 'a', ',', 'b', ',', 'c', ',', 'd' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'delimeters equal src';
  var o = _.mapExtend( null, op );
  o.src = ',';
  o.delimeter = ',';
  var expected = [ ',' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  test.case = 'src is triplet of delimeter';
  var o = _.mapExtend( null, op );
  o.src = ',,,';
  o.delimeter = ',';
  var expected = [ ',', ',', ',' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'complex quoted at edges';
  var o = _.mapExtend( null, op );
  o.src = '"a b" " c"';
  o.delimeter = [ '"' ];
  var got = _.strSplit( o );
  var expected = [ '"a b" " c"' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c' ];
  var got = _.strSplit( o );
  var expected = [ '"a b" ""', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space first';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"' ];
  var got = _.strSplit( o );
  var expected = [ '"a b"', '""', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle with space last';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ 'a b', ' c', '"', ' ' ];
  var got = _.strSplit( o );
  var expected = [ '"a b"', '""', 'c' ];
  test.identical( got, expected );

  test.case = 'delimeter with empty string at the beginning of array';
  var o = _.mapExtend( null, op );
  o.src = '"a b" "" c';
  o.delimeter = [ '', 'a b', ' ', '', ' c' ];
  var got = _.strSplit( o );
  var expected = [ '"a b"', '""', 'c' ];
  test.identical( got, expected );

  test.case = 'quoted in the middle';
  var o = _.mapExtend( null, op );
  o.src = '"a b" x "" c';
  o.delimeter = [ 'a b', ' ', ' c', '"', '' ];
  var got = _.strSplit( o );
  var expected = [ '"a b"', 'x', '""', 'c' ];
  test.identical( got, expected );

  /* special quoting tests */

  test.case = 'quoted at edges, delimeter : #';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb"cc"';
  o.delimeter = [ '#' ];
  var got = _.strSplit( o );
  var expected = [ '"aa"bb"cc"' ];
  test.identical( got, expected );

  test.close( 's:1 q:1 pe:0' );

  /* - */

  test.open( 's:1 q:1 pe:0 pq:1 iq:0 delimeter:#' );

  var op =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
    preservingQuoting : 1,
    inliningQuoting : 0,
    delimeter : '#',
  }

  test.case = 'quoted at edges"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb"cc"';
  var got = _.strSplit( o );
  var expected = [ '"aa"', 'bb', '"cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with extra quote inside "';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '"aa"', 'bb', '""', 'cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside the first quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"a#a"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '"a#a"', 'bb', '""', 'cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside not quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"b#b""cc"';
  var got = _.strSplit( o );
  var expected = [ '"aa"', 'b', '#', 'b', '""', 'cc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside the last quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb""c#c"';
  var got = _.strSplit( o );
  var expected = [ '"aa"', 'bb', '""', 'c', '#', 'c"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside all 3 text splits"';
  var o = _.mapExtend( null, op );
  o.src = '"a#a"b#b""c#c"';
  var got = _.strSplit( o );
  var expected = [ '"a#a"', 'b', '#', 'b', '""', 'c', '#', 'c"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with extra spaces on edges';
  var o = _.mapExtend( null, op );
  o.src = ' "aa"bb"cc" ';
  var got = _.strSplit( o );
  var expected = [ '"aa"', 'bb', '"cc"' ];
  test.identical( got, expected );

  test.close( 's:1 q:1 pe:0 pq:1 iq:0 delimeter:#' );

  /* - */

  test.open( 's:1 q:1 pe:0 pq:0 iq:1 delimeter:#' );

  var op =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
    preservingQuoting : 0,
    inliningQuoting : 1,
    delimeter : '#',
  }

  test.case = 'quoted at edges"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb"cc"';
  var got = _.strSplit( o );
  var expected = [ 'aabbcc' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with extra quote inside "';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ 'aabbcc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside the first quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"a#a"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ 'a#abbcc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside not quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"b#b""cc"';
  var got = _.strSplit( o );
  var expected = [ 'aab', '#', 'bcc"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside the last quoted text"';
  var o = _.mapExtend( null, op );
  o.src = '"aa"bb""c#c"';
  var got = _.strSplit( o );
  var expected = [ 'aabbc', '#', 'c"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with # inside all 3 text splits"';
  var o = _.mapExtend( null, op );
  o.src = '"a#a"b#b""c#c"';
  var got = _.strSplit( o );
  var expected = [ 'a#ab', '#', 'bc', '#', 'c"' ];
  test.identical( got, expected );

  test.case = 'quoted at edges with extra spaces on edges';
  var o = _.mapExtend( null, op );
  o.src = ' "aa"bb"cc" ';
  var got = _.strSplit( o );
  var expected = [ 'aabbcc' ];
  test.identical( got, expected );

  test.close( 's:1 q:1 pe:0 pq:0 iq:1 delimeter:#' );

  /* - */

  test.open( 'complex' );

  var src = 'Test check // ( Tools/base/l2/String / strSplit / delimeter:" " > space on the beginning and the end <  ) # 3 ... failed';

  test.case = 's:0 q:1 pe:1 pd:1 pq:0 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 0,
    inliningQuoting : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter:', ' ', '', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:1 pe:1 pd:1 pq:1 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 1,
    inliningQuoting : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter:', '" "', '', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:1 pe:1 pd:1 pq:0 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 0,
    inliningQuoting : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter: ', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:1 pe:1 pd:1 pq:1 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 1,
    inliningQuoting : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter:" "', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:0 pe:0 pd:0';

  var o =
  {
    stripping : 0,
    quoting : 0,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', ' ( Tools', 'base', 'l2', 'String ', ' strSplit ', ' delimeter:" "', 'space on the beginning and the end', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:0 pe:0 pd:1';

  var o =
  {
    stripping : 0,
    quoting : 0,
    preservingEmpty : 0,
    preservingDelimeters : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter:" "', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:0 pe:1 pd:0';

  var o =
  {
    stripping : 0,
    quoting : 0,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '', ' ( Tools', 'base', 'l2', 'String ', ' strSplit ', ' delimeter:" "', 'space on the beginning and the end', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:0 pe:1 pd:1';

  var o =
  {
    stripping : 0,
    quoting : 0,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter:" "', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:1 pe:0 pd:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', ' ( Tools', 'base', 'l2', 'String ', ' strSplit ', ' delimeter:" "', 'space on the beginning and the end', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:1 pe:0 pd:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 0,
    preservingDelimeters : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter:" "', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:1 pe:0 pd:1 pq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 0,
    preservingDelimeters : 1,
    preservingQuoting : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '/', '/', ' ( Tools', '/', 'base', '/', 'l2', '/', 'String ', '/', ' strSplit ', '/', ' delimeter:" "', ' > ', 'space on the beginning and the end', ' < ', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:0 q:1 pe:1 pd:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check ', '', ' ( Tools', 'base', 'l2', 'String ', ' strSplit ', ' delimeter:" "', 'space on the beginning and the end', ' ) # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:1 q:0 pe:0 pd:0';

  var o =
  {
    stripping : 1,
    quoting : 0,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '( Tools', 'base', 'l2', 'String', 'strSplit', 'delimeter:" "', 'space on the beginning and the end', ') # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:1 q:0 pe:0 pd:1';

  var o =
  {
    stripping : 1,
    quoting : 0,
    preservingEmpty : 0,
    preservingDelimeters : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '/', '/', '( Tools', '/', 'base', '/', 'l2', '/', 'String', '/', 'strSplit', '/', 'delimeter:" "', '>', 'space on the beginning and the end', '<', ') # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:1 q:0 pe:1 pd:0';

  var o =
  {
    stripping : 1,
    quoting : 0,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '', '( Tools', 'base', 'l2', 'String', 'strSplit', 'delimeter:" "', 'space on the beginning and the end', ') # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:1 q:0 pe:1 pd:1';

  var o =
  {
    stripping : 1,
    quoting : 0,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '/', '', '/', '( Tools', '/', 'base', '/', 'l2', '/', 'String', '/', 'strSplit', '/', 'delimeter:" "', '>', 'space on the beginning and the end', '<', ') # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:1 q:1 pe:0 pd:0';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '( Tools', 'base', 'l2', 'String', 'strSplit', 'delimeter:" "', 'space on the beginning and the end', ') # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:1 q:1 pe:0 pd:1';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 0,
    preservingDelimeters : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '/', '/', '( Tools', '/', 'base', '/', 'l2', '/', 'String', '/', 'strSplit', '/', 'delimeter:" "', '>', 'space on the beginning and the end', '<', ') # 3 ... failed' ];
  test.identical( got, expected );

  test.case = 's:1 q:1 pe:1 pd:0';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '', '( Tools', 'base', 'l2', 'String', 'strSplit', 'delimeter:" "', 'space on the beginning and the end', ') # 3 ... failed' ];
  test.identical( got, expected );

  /* */

  test.case = 's:1 q:1 pe:1 pd:1';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    delimeter : [ ' > ', ' < ', '/' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ 'Test check', '/', '', '/', '( Tools', '/', 'base', '/', 'l2', '/', 'String', '/', 'strSplit', '/', 'delimeter:" "', '>', 'space on the beginning and the end', '<', ') # 3 ... failed' ];
  test.identical( got, expected );

  var src =
`
= Org

- Q: "Where?"
- A1: "Here."

- A2: "There."
`

  /* */

  test.case = 's:1 q:1 pe:1 pd:0 pq:1 iq:1';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 1,
    delimeter : [ '\n' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ '', '= Org', '', '- Q: "Where?"', '- A1: "Here."', '', '- A2: "There."', '' ];
  test.identical( got, expected );

  test.case = 's:1 q:1 pe:1 pd:0 pq:1 iq:0';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 0,
    delimeter : [ '\n' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ '', '= Org', '', '- Q:', '"Where?"', '', '- A1:', '"Here."', '', '', '- A2:', '"There."', '', '' ];
  test.identical( got, expected );

  /* */

  test.case = 's:1 q:1 pe:1 pd:0 pq:0 iq:1';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 1,
    delimeter : [ '\n' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ '', '= Org', '', '- Q: Where?', '- A1: Here.', '', '- A2: There.', '' ];
  test.identical( got, expected );

  /* */

  test.case = 's:1 q:1 pe:1 pd:0 pq:0 iq:0';

  var o =
  {
    stripping : 1,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 0,
    delimeter : [ '\n' ],
    src,
  }
  var got = _.strSplit( o );
  var expected = [ '', '= Org', '', '- Q:', 'Where?', '', '- A1:', 'Here.', '', '', '- A2:', 'There.', '', '' ];
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges, s:1 q:1 pe:1 pd:0 pq:0 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 0,
    delimeter : [ '"' ],
  }

  o.src = '"a b" " c"';
  var expected = [ '', 'a b', ' ', ' c', '' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges, s:1 q:1 pe:1 pd:0 pq:0 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 1,
    delimeter : [ '"' ],
  }

  o.src = '"a b" " c"';
  var expected = [ 'a b  c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges, s:1 q:1 pe:1 pd:0 pq:1 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 0,
    delimeter : [ '"' ],
  }

  o.src = '"a b" " c"';
  var expected = [ '', '"a b"', ' ', '" c"', '' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted at edges, s:1 q:1 pe:1 pd:0 pq:1 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 1,
    delimeter : [ '"' ],
  }

  o.src = '"a b" " c"';
  var expected = [ '"a b" " c"' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted in the middle, s:1 q:1 pe:1 pd:0 pq:1 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 1,
    delimeter : [ '"' ],
  }

  o.src = '"a b" """x" c';
  var expected = [ '"a b" """x" c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted in the middle, s:1 q:1 pe:1 pd:0 pq:1 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 0,
    delimeter : [ '"' ],
  }

  o.src = '"a b" """x" c';
  var expected = [ '', '"a b"', ' ', '""', '', '"x"', ' c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted in the middle, s:1 q:1 pe:1 pd:0 pq:0 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 1,
    delimeter : [ '"' ],
  }

  o.src = '"a b" """x" c';
  var expected = [ 'a b x c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'quoted in the middle, s:1 q:1 pe:1 pd:0 pq:0 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 0,
    delimeter : [ '"' ],
  }

  o.src = '"a b" """x" c';
  var expected = [ '', 'a b', ' ', '', '', 'x', ' c' ];
  var got = _.strSplit( o );
  test.identical( got, expected );

  /* */

  test.case = 'extra quote, s:1 q:1 pe:1 pd:0 pq:1 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 1,
    delimeter : [ '#' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '"aa"bb""cc"' ];
  test.identical( got, expected );

  test.case = 'extra quote, s:1 q:1 pe:1 pd:0 pq:0 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 1,
    delimeter : [ '#' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ 'aabbcc"' ];
  test.identical( got, expected );

  test.case = 'extra quote, s:1 q:1 pe:1 pd:0 pq:1 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 1,
    inliningQuoting : 0,
    delimeter : [ '#' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '', '"aa"', 'bb', '""', 'cc"' ];
  test.identical( got, expected );

  test.case = 'extra quote, s:1 q:1 pe:1 pd:0 pq:0 iq:0';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingQuoting : 0,
    inliningQuoting : 0,
    delimeter : [ '#' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '', 'aa', 'bb', '', 'cc"' ];
  test.identical( got, expected );

  /* */

  test.case = 'extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:1 iq:1';

  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 1,
    inliningQuoting : 1,
    delimeter : [ '#', '"' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '"aa"bb""cc', '"', '' ];
  test.identical( got, expected );

  test.case = 'extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:0 iq:1';
  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 0,
    inliningQuoting : 1,
    delimeter : [ '#', '"' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ 'aabbcc', '"', '' ];
  test.identical( got, expected );

  test.case = 'extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:1 iq:0';
  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 1,
    inliningQuoting : 0,
    delimeter : [ '#', '"' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '', '"aa"', 'bb', '""', 'cc', '"', '' ];
  test.identical( got, expected );

  test.case = 'extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:0 iq:0';
  var o =
  {
    stripping : 0,
    quoting : 1,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingQuoting : 0,
    inliningQuoting : 0,
    delimeter : [ '#', '"' ],
  }

  o.src = '"aa"bb""cc"';
  var got = _.strSplit( o );
  var expected = [ '', 'aa', 'bb', '', 'cc', '"', '' ];
  test.identical( got, expected );

  test.close( 'complex' );
}

//

function strSplitOptionOnQuote( test )
{
  test.open( 'single empty delimeter, String' );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : '',
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 1,
    onQuote : ( e ) => '#',
  });
  var expected = [ '', '#', 'a', '', 'b', '', 'c', '', '', '#', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : '',
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => String( i ),
  });
  var expected = [ '0', 'a', 'b', 'c', '0' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ '#', 'a', 'b', 'c', '#' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ '#', 'a', 'b', 'c', '#' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ '#', 'a', 'b', 'c', '#' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ '#', 'a', 'b', 'c', '#' ];
  test.identical( got, expected );

  test.close( 'single empty delimeter, String' );

  /* - */

  test.open( 'many delimeters, String' );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => i === 0 ? '0' : ' 1',
  });
  var expected = [ '', '0', '', '0', ' ', '#', ' a ', '#', ' ', '0', '', '0', ' ', '#', ' b ', '#', ' ', '0', '', '0', ' ', '#', ' c ', '#', ' ', '0', '', '0', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => String( i ),
  });
  var expected = [ '', '0', '', '0', ' ', ' a ', ' ', '0', '', '0', ' ', ' b ', ' ', '0', '', '0', ' ', ' c ', ' ', '0', '', '0', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ ' ', ' a ', ' ', ' ', ' b ', ' ', ' ', ' c ', ' ' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ ' ', ' a ', ' ', ' ', ' b ', ' ', ' ', ' c ', ' ' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.close( 'many delimeters, String' );

  /* - */

  test.open( 'single empty delimeter, RegExp' );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : /(?:)/,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 1,
    onQuote : ( e ) => '#',
  });
  var expected = [ '', '#', 'a', '', 'b', '', 'c', '', '', '#', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : /(?:)/,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => String( i ),
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"abc"',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  test.close( 'single empty delimeter, RegExp' );

  /* - */

  test.open( 'many delimeters, RegExp' );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => i === 0 ? '0' : ' 1',
  });
  var expected = [ '', '0', '', '0', ' ', '#', ' a ', '#', ' ', '0', '', '0', ' ', '#', ' b ', '#', ' ', '0', '', '0', ' ', '#', ' c ', '#', ' ', '0', '', '0', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => String( i ),
  });
  var expected = [ '', '0', '', '0', ' ', ' a ', ' ', '0', '', '0', ' ', ' b ', ' ', '0', '', '0', ' ', ' c ', ' ', '0', '', '0', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ ' ', ' a ', ' ', ' ', ' b ', ' ', ' ', ' c ', ' ' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ ' ', ' a ', ' ', ' ', ' b ', ' ', ' ', ' c ', ' ' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onQuote : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.close( 'many delimeters, RegExp' );
}

//

function strSplitOptionOnDelimeter( test )
{
  test.open( 'single empty delimeter, String' );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e ) => '#',
  });
  var expected = [ 'a', '#', 'b', '#', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => String( i ),
  });
  var expected = [ 'a', '0', 'b', '0', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : '',
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.close( 'single empty delimeter, String' );

  /* - */

  test.open( 'many delimeters, String' );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => i === 0 ? '0' : ' 1',
  });
  var expected = [ '', ' 1', ' ', '0', ' a ', '0', ' ', ' 1', ' ', '0', ' b ', '0', ' ', ' 1', ' ', '0', ' c ', '0', ' ', ' 1', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => String( i ),
  });
  var expected = [ '', '1', ' ', '0', ' a ', '0', ' ', '1', ' ', '0', ' b ', '0', ' ', '1', ' ', '0', ' c ', '0', ' ', '1', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ ' ', ' a ', ' ', ' ', ' b ', ' ', ' ', ' c ', ' ' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ '"" ', ' a ', ' "" ', ' b ', ' "" ', ' c ', ' ""' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ '#', '""' ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ '""', 'a', '""', 'b', '""', 'c', '""' ];
  test.identical( got, expected );

  test.close( 'many delimeters, String' );

  /* - */

  test.open( 'single empty delimeter, RegExp' );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : /(?:)/,
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e ) => '#',
  });
  var expected = [ '#', '#', '#', '#', '#' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : /(?:)/,
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => String( i ),
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : 'abc',
    delimeter : /(?:)/,
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [];
  test.identical( got, expected );

  test.close( 'single empty delimeter, RegExp' );

  /* - */

  test.open( 'many delimeters, RegExp' );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 1,
    preservingDelimeters : 1,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => i === 0 ? '0' : ' 1',
  });
  var expected = [ '', ' 1', ' ', '0', ' a ', '0', ' ', ' 1', ' ', '0', ' b ', '0', ' ', ' 1', ' ', '0', ' c ', '0', ' ', ' 1', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 1,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => String( i ),
  });
  var expected = [ '', '1', ' ', '0', ' a ', '0', ' ', '1', ' ', '0', ' b ', '0', ' ', '1', ' ', '0', ' c ', '0', ' ', '1', '' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ ' ', ' a ', ' ', ' ', ' b ', ' ', ' ', ' c ', ' ' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 0,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ ' a ', ' b ', ' c ' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 0,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  var got = _.strSplit
  ({
    src : '"" # a # "" # b # "" # c # ""',
    delimeter : [ /#/, /\"\"/ ],
    preservingEmpty : 0,
    preservingDelimeters : 0,
    stripping : 1,
    quoting : 1,
    onDelimeter : ( e, i ) => e === '' ? '' : '#',
  });
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.close( 'many delimeters, RegExp' );
}

//

function strSplitInlinedDefaultOptions( test )
{
  test.open( 'arguments' );

  test.case = 'srcStr - empty string';
  var srcStr = '';
  var got = _.strSplitInlined( srcStr );
  var expected = [ '' ];
  test.identical( got, expected );

  test.case = 'srcStr - without default delimeter, delimeter - default';
  var srcStr = 'a b c d e';
  var got = _.strSplitInlined( srcStr );
  var expected = [ 'a b c d e' ];
  test.identical( got, expected );

  test.case = 'srcStr - without default delimeter, delimeter - space';
  var srcStr = 'a b c d e';
  var got = _.strSplitInlined( srcStr, ' ' );
  var expected = [ 'a', [ 'b' ], 'c', [ 'd' ], 'e' ];
  test.identical( got, expected );

  test.case = 'srcStr - without default delimeter, delimeter - space, not closed delimeter';
  var srcStr = 'a b c d';
  var got = _.strSplitInlined( srcStr, ' ' );
  var expected = [ 'a', [ 'b' ], 'c d' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - string with default delimeter, delimeter - default';
  var srcStr = 'ab#cd#ef';
  var got = _.strSplitInlined( srcStr );
  var expected = [ 'ab', [ 'cd' ], 'ef' ];
  test.identical( got, expected );

  test.case = 'srcStr - string with default delimeter, delimeter - default, not closed delimeter';
  var srcStr = 'ab#cd#ef#gh';
  var got = _.strSplitInlined( srcStr );
  var expected = [ 'ab', [ 'cd' ], 'ef#gh' ];
  test.identical( got, expected );

  test.case = 'srcStr - string with default delimeter, delimeter - space';
  var srcStr = 'ab#cd#ef';
  var got = _.strSplitInlined( srcStr, ' ' );
  var expected = [ 'ab#cd#ef' ];
  test.identical( got, expected );

  test.close( 'arguments' );

  /* - */

  test.open( 'default' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this #background:red#is#background:default# text and is not';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this #background:red#is#background:default# text and # is not';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and # is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '#simple # text #background:red#is#background:default# text and # is not#';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '', [ 'simple ' ], ' text ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and ', [ ' is not' ], '' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '#background:red#i#s#background:default##text';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default', [ '' ], 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '#background:red#i#s#background:default#';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default#' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '##ordinary#inline2#';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '', [ '' ], 'ordinary', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '#inline1#ordinary##';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '', [ 'inline1' ], 'ordinary', [ '' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '#inline1##inline2#';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '', [ 'inline1' ], '', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '####';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '', [ '' ], '', [ '' ], '' ];
  test.identical( got, expected );

  test.close( 'default' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strSplitInlined() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strSplitInlined( 'abc', '##', 'extra' ) );

  test.case = 'wrong type of srcStr';
  test.shouldThrowErrorSync( () => _.strSplitInlined( [ 'abc' ], '' ) );
  test.shouldThrowErrorSync( () => _.strSplitInlined( { 'a' : 'b' }, '' ) );

  test.case = 'wrong type of delimeter';
  test.shouldThrowErrorSync( () => _.strSplitInlined( 'abc', new U8x() ) );
  test.shouldThrowErrorSync( () => _.strSplitInlined( 'abc', {} ) );

  test.case = 'wrong type of map o';
  test.shouldThrowErrorSync( () => _.strSplitInlined( [ 'abc', '' ] ) );
  test.shouldThrowErrorSync( () => _.strSplitInlined( { 'abc' : '' } ) );
}

//

function strSplitInlinedOptionDelimeter( test )
{
  test.case = 'full split, closing delimeter';
  var srcStr = 'this background:red is background:default text and is not';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text', [ 'and' ], 'is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this background:red is background:default text and is not ';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text', [ 'and' ], 'is', [ 'not' ], '' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = ' simple text background:red is background:default text and is not ';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ '', [ 'simple' ], 'text', [ 'background:red' ], 'is', [ 'background:default' ], 'text', [ 'and' ], 'is', [ 'not' ], '' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = ' background:red i s background:default  text';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default', [ '' ], 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = ' background:red i s background:default ';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '  ordinary inline2 ';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ '', [ '' ], 'ordinary', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = ' inline1 ordinary  ';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ '', [ 'inline1' ], 'ordinary', [ '' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = ' inline1  inline2 ';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ '', [ 'inline1' ], '', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '    ';
  var got = _.strSplitInlined( { src : srcStr, delimeter : ' ' } );
  var expected = [ '', [ '' ], '', [ '' ], '' ];
  test.identical( got, expected );
}

//

function strSplitInlinedOptionStripping( test )
{
  test.open( 'stripping - 0' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this  # \nbackground:red\t# is # background:default   #  text  and  is not \n';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ 'this  ', [ ' \nbackground:red\t' ], ' is ', [ ' background:default   ' ], '  text  and  is not \n' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this  # \nbackground:red\t# is # background:default   #  text  and  #  is not\n';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ 'this  ', [ ' \nbackground:red\t' ], ' is ', [ ' background:default   ' ], '  text  and  #  is not\n' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '\n#\n\t simple  # \n\t\rtext #  background:red  #  is  #  background:default  # text and # is not   #';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '\n', [ '\n\t simple  ' ], ' \n\t\rtext ', [ '  background:red  ' ], '  is  ', [ '  background:default  ' ], ' text and ', [ ' is not   ' ], '' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '   # \t\tbackground:red  # \n\ni  #  s  #background:default  #\n\r\t  #  text\n';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '   ', [ ' \t\tbackground:red  ' ], ' \n\ni  ', [ '  s  ' ], 'background:default  ', [ '\n\r\t  ' ], '  text\n' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '  #  background:red  #  i  #  s  #   background:default  #  ';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '  ', [ '  background:red  ' ], '  i  ', [ '  s  ' ], '   background:default  #  ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '  #  #\n\nordinary\t\t#\ninline2 # ';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '  ', [ '  ' ], '\n\nordinary\t\t', [ '\ninline2 ' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '\t#\ninline1\r#\tordinary\n#\r#\t';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '\t', [ '\ninline1\r' ], '\tordinary\n', [ '\r' ], '\t' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '  #  inline1  #  #  inline2  #';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '  ', [ '  inline1  ' ], '  ', [ '  inline2  ' ], '' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '\n#\n#\n#\n#\r';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '\n', [ '\n' ], '\n', [ '\n' ], '\r' ];
  test.identical( got, expected );

  test.close( 'stripping - 0' );

  /* - */

  test.open( 'stripping - 1' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this  # \nbackground:red\t# is # background:default   #  text  and  is not \n';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text  and  is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this  # \nbackground:red\t# is # background:default   #  text  and  #  is not\n';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text  and#is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '\n#\n\t simple  # \n\t\rtext #  background:red  #  is  #  background:default  # text and # is not   #';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'simple' ], 'text', [ 'background:red' ], 'is', [ 'background:default' ], 'text and', [ 'is not' ], '' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '   # \t\tbackground:red  # \n\ni  #  s  #background:default  #\n\r\t  #  text\n';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default', [ '' ], 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '  #  background:red  #  i  #  s  #   background:default  #  ';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default#' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '  #  #\n\nordinary\t\t#\ninline2 # ';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ '' ], 'ordinary', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '\t#\ninline1\r#\tordinary\n#\r#\t';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'inline1' ], 'ordinary', [ '' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '  #  inline1  #  #  inline2  #';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'inline1' ], '', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '\n#\n#\n#\n#\r';
  var got = _.strSplitInlined( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ '' ], '', [ '' ], '' ];
  test.identical( got, expected );

  test.close( 'stripping - 1' );
}

//

function strSplitInlinedOptionQuoting( test )
{
  test.open( 'quoting - 0' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this "#"background:red"#"is"#"background:default"#" text and is not';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ 'this "', [ '"background:red"' ], '"is"', [ '"background:default"' ], '" text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this "#"background:red"#"is"#"background:default"#" text and "#" is not';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ 'this "', [ '"background:red"' ], '"is"', [ '"background:default"' ], '" text and "#" is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '"#"simple "#" text "#"background:red"#"is"#"background:default"#" text and "#" is not"#"';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '"', [ '"simple "' ], '" text "', [ '"background:red"' ], '"is"', [ '"background:default"' ], '" text and "', [ '" is not"' ], '"' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '"#"background:red"#"i"#"s"#"background:default"#""#"text';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '"', [ '"background:red"' ], '"i"', [ '"s"' ], '"background:default"', [ '""' ], '"text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '"#"background:red"#"i"#"s"#"background:default"#"';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '"', [ '"background:red"' ], '"i"', [ '"s"' ], '"background:default"#"' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '"#""#"ordinary"#"inline2"#"';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '"', [ '""' ], '"ordinary"', [ '"inline2"' ], '"' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '"#"inline1"#"ordinary"#""#"';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '"', [ '"inline1"' ], '"ordinary"', [ '""' ], '"' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '"#"inline1"#""#"inline2"#"';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '"', [ '"inline1"' ], '""', [ '"inline2"' ], '"' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '"#""#""#""#"';
  var got = _.strSplitInlined( { src : srcStr } );
  var expected = [ '"', [ '""' ], '""', [ '""' ], '"' ];
  test.identical( got, expected );

  test.close( 'quoting - 0' );

  /* - */

  test.open( 'quoting - 1' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this "#"background:red"#"is"#"background:default"#" text and is not';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ 'this "#"background:red"#"is"#"background:default"#" text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this "#"background:red"#"is"#"background:default"#" text and "#" is not';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ 'this "#"background:red"#"is"#"background:default"#" text and "#" is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '"#"simple "#" text "#"background:red"#"is"#"background:default"#" text and "#" is not"#"';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ '"#"simple "#" text "#"background:red"#"is"#"background:default"#" text and "#" is not"#"' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '"#"background:red"#"i"#"s"#"background:default"#""#"text';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ '"#"background:red"#"i"#"s"#"background:default"#""#"text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '"#"background:red"#"i"#"s"#"background:default"#"';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ '"#"background:red"#"i"#"s"#"background:default"#"' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '"#""#"ordinary"#"inline2"#"';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ '"#""#"ordinary"#"inline2"#"' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '"#"inline1"#"ordinary"#""#"';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ '"#"inline1"#"ordinary"#""#"' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '"#"inline1"#""#"inline2"#"';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ '"#"inline1"#""#"inline2"#"' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '"#""#""#""#"';
  var got = _.strSplitInlined( { src : srcStr, quoting : 1 } );
  var expected = [ '"#""#""#""#"' ];
  test.identical( got, expected );

  test.close( 'quoting - 1' );
}

//

function strSplitInlinedOptionPreservingEmpty( test )
{
  test.case = 'full split, closing delimeter';
  var srcStr = 'this #background:red#is#background:default# text and is not';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this #background:red#is#background:default# text and # is not';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and # is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '#simple # text #background:red#is#background:default# text and # is not#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ 'simple ' ], ' text ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and ', [ ' is not' ] ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '#background:red#i#s#background:default##text';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ 'background:red' ], 'i', [ 's' ], 'background:default', [ '' ], 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '#background:red#i#s#background:default#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ 'background:red' ], 'i', [ 's' ], 'background:default#' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '##ordinary#inline2#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ '' ], 'ordinary', [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '#inline1#ordinary##';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ 'inline1' ], 'ordinary', [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '#inline1##inline2#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ 'inline1' ], [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '####';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ '' ], [ '' ] ];
  test.identical( got, expected );
}

//

function strSplitInlinedOptionOnInlined( test )
{
  var onInlined = ( part ) =>
  {
    var temp = part.split( ':' );

    if( temp.length === 2 )
    return temp;

    return undefined;
  };

  /* - */

  test.case = 'full split, closing delimeter';
  var srcStr = 'this #background:red#is#background:default# text and is not';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ 'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this #background:red#is#background:default# text and # is not';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ 'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '#simple # text #background:red#is#background:default# text and # is not#';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ '#simple # text ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not#' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '#background:red#i#s#background:default##text';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ '', [ 'background', 'red' ], 'i#s', [ 'background', 'default' ], '#text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '#background:red#i#s#background:default#';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ '', [ 'background', 'red' ], 'i#s', [ 'background', 'default' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '##ordinary#inline2#';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ '##ordinary#inline2#' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '#inline1#ordinary##';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ '#inline1#ordinary##' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '#inline1##inline2#';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ '#inline1##inline2#' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '####';
  var got = _.strSplitInlined( { src : srcStr, onInlined } );
  var expected = [ '####' ];
  test.identical( got, expected );
}

//

function strSplitInlinedCombineOnInlinedAndPreservingEmpty( test )
{
  var onInlined = ( part ) =>
  {
    var temp = part.split( ':' );

    if( temp.length === 2 )
    return temp;

    return undefined;
  };

  /* - */

  test.open( 'preservingEmpty - 0, onInlined' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this #background:red#is#background:default# text and is not';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ 'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this #background:red#is#background:default# text and # is not';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ 'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '#simple # text #background:red#is#background:default# text and # is not#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ '#simple # text ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and # is not#' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '#background:red#i#s#background:default##text';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ [ 'background', 'red' ], 'i#s', [ 'background', 'default' ], '#text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '#background:red#i#s#background:default#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ [ 'background', 'red' ], 'i#s', [ 'background', 'default' ] ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '##ordinary#inline2#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ '##ordinary#inline2#' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '#inline1#ordinary##';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ '#inline1#ordinary##' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '#inline1##inline2#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ '#inline1##inline2#' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '####';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined } );
  var expected = [ '####' ];
  test.identical( got, expected );

  test.close( 'preservingEmpty - 0, onInlined' );

  /* - */

  test.open( 'preservingEmpty - 0, onInlined - null' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this #background:red#is#background:default# text and is not';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'this ', 'background:red', 'is', 'background:default', ' text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter # does not have closing';
  var srcStr = 'this #background:red#is#background:default# text and # is not';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'this ', 'background:red', 'is', 'background:default', ' text and # is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '#simple # text #background:red#is#background:default# text and # is not#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'simple ', ' text ', 'background:red', 'is', 'background:default', ' text and ', ' is not' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '#background:red#i#s#background:default##text';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'background:red', 'i', 's', 'background:default', 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '#background:red#i#s#background:default#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'background:red', 'i', 's', 'background:default#' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '##ordinary#inline2#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'ordinary', 'inline2' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '#inline1#ordinary##';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'inline1', 'ordinary' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '#inline1##inline2#';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [ 'inline1', 'inline2' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '####';
  var got = _.strSplitInlined( { src : srcStr, preservingEmpty : 0, onInlined : null } );
  var expected = [];
  test.identical( got, expected );

  test.close( 'preservingEmpty - 0, onInlined - null' );
}

//

function strSplitInlinedStereo( test )
{
  var got, expected;

  test.case = 'default';

  /* nothing */

  got = _.strSplitInlinedStereo( '' );
  expected = [ '' ];
  test.identical( got, expected );

  /* prefix/postfix # by default */

  debugger;
  got = _.strSplitInlinedStereo( '#abc#' );
  debugger;
  expected = [ '', 'abc', '' ];
  test.identical( got, expected );

  /* - */

  test.case = 'with options';

  /* head/post are same */

  got = _.strSplitInlinedStereo( { prefix : '/', postfix : '/', src : '/abc/' } );
  expected = [ '', 'abc', '' ];
  test.identical( got, expected );

  /**/

  got = _.strSplitInlinedStereo( { prefix : '/', postfix : '/', src : '//abc//' } );
  expected = [ '', '', 'abc', '', '' ];
  test.identical( got, expected );

  /* different head/post */

  got = _.strSplitInlinedStereo( { prefix : '/#', postfix : '#', src : '/#abc#' } );
  expected = [ 'abc' ];
  test.identical( got, expected );

  /* postfix appears in source two times */
  got = _.strSplitInlinedStereo( { prefix : '/', postfix : '#', src : '/ab#c#' } );
  expected = [ 'ab', 'c#' ];
  test.identical( got, expected );

  /* onInlined #1 */
  function onInlined1( strip )
  {
    if( strip.length )
    return strip;
  }
  got = _.strSplitInlinedStereo( { onInlined : onInlined1, src : '#abc#' } );
  expected = [ '#abc#' ];
  test.identical( got, expected );

  /* onInlined #2 */
  function onInlined2( strip )
  {
    return strip + strip;
  }
  got = _.strSplitInlinedStereo( { prefix : '/', postfix : '#', onInlined : onInlined2, src : '/abc#' } );
  expected = [ 'abcabc' ];
  test.identical( got, expected );

}

//

function strSplitInlinedStereo_Basic( test )
{

  test.case = 'no styles';
  var srcStr = 'this background:red is background:default text and is not';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ 'this background:red is background:default text and is not' ];
  test.identical( got, expected );

  test.case = 'two styles';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and is not';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is not';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ 'this ', [ 'background:red' ], ' is ', [ 'background:default' ], ' text ', [ 'and' ], ' is not' ];
  test.identical( got, expected );

  test.case = 'four styles';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ 'this ', [ 'background:red' ], ' is ', [ 'background:default' ], ' text ', [ 'and' ], ' is ', [ 'not' ] ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '❮simple❯ text ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯ ';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ [ 'simple' ], ' text ', [ 'background:red' ], ' is ', [ 'background:default' ], ' text ', [ 'and' ], ' is ', [ 'not' ], ' ' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = ' ❮background:red❯ i ❮s❯ background:default ';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ ' ', [ 'background:red' ], ' i ', [ 's' ], ' background:default ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '❮❯ ordinary ❮inline2❯ ';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ [ '' ], ' ordinary ', [ 'inline2' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = ' ❮inline1❯ ordinary ❮❯';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ ' ', [ 'inline1' ], ' ordinary ', [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = ' ❮inline1❯❮inline2❯ ';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ ' ', [ 'inline1' ], [ 'inline2' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '❮❯❮❯';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ [ '' ], [ '' ] ];
  test.identical( got, expected );

  /* - */

  test.open( 'single delimiter' )

  test.case = '❮ at the start';
  var srcStr = '❮inline1 inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮inline1 inline2' ];
  test.identical( got, expected );

  test.case = '❮ at the end';
  var srcStr = 'inline1 inline2❮';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ 'inline1 inline2❮' ];
  test.identical( got, expected );

  test.case = '❯ at the start';
  var srcStr = '❯inline1 inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❯inline1 inline2' ];
  test.identical( got, expected );

  test.case = '❯ at the end';
  var srcStr = 'inline1 inline2❯';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ 'inline1 inline2❯' ];
  test.identical( got, expected );

  test.close( 'single delimiter' )

  /* - */

  test.open( 'wrong delimiter enclosing' )

  test.case = 'same open and close delimeter ❮';
  var srcStr = '❮inline1❮ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮inline1❮ inline2' ];
  test.identical( got, expected );

  test.case = 'same open and close delimeter ❯';
  var srcStr = '❯inline1❯ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❯inline1❯ inline2' ];
  test.identical( got, expected );

  test.case = 'reverse open and close delimeters';
  var srcStr = '❯inline1❮ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❯inline1❮ inline2' ];
  test.identical( got, expected );

  /* - */

  test.case = 'odd number of delimeters - 2 opening';
  var srcStr = '❮inline1 ❮inline2❯';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮inline1 ', [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'odd number of delimeters - 2 closing';
  var srcStr = '❮inline1❯ inline2❯';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ [ 'inline1' ], ' inline2❯' ];
  test.identical( got, expected );

  /* - */

  test.case = '2 open, 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮', [ 'inline1' ], '❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮ ', [ 'inline1' ], ' ❯ inline2' ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters';
  var srcStr = '❮❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮❮', [ 'inline1' ], '❯ inline2' ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮ ❮ ', [ 'inline1' ], ' ❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮', [ 'inline1' ], '❯❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing & 3 open 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2 ❮❮❮inline1❯❯';
  var got = _.strSplitInlinedStereo_( srcStr );
  var expected = [ '❮', [ 'inline1' ], '❯❯ inline2 ❮❮', [ 'inline1' ], '❯' ];
  test.identical( got, expected );

  test.close( 'wrong delimiter enclosing' )

}

//

function strSplitInlinedStereo_OptionStripping( test )
{
  test.open( 'stripping - 0' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this  ❮ \nbackground:red\t❯ is ❮ background:default   ❯  text  and  is not \n';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ 'this  ', [ ' \nbackground:red\t' ], ' is ', [ ' background:default   ' ], '  text  and  is not \n' ];
  test.identical( got, expected );

  test.case = 'openning delimeter ❮ does not have closing';
  var srcStr = 'this  ❮ \nbackground:red\t❯ is ❮ background:default   ❯  text  and  ❮  is not\n';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ 'this  ', [ ' \nbackground:red\t' ], ' is ', [ ' background:default   ' ], '  text  and  ❮  is not\n' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '\n❮\n\t simple  ❯ \n\t\rtext ❮  background:red  ❯  is  ❮  background:default  ❯ text and ❮ is not   ❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '\n', [ '\n\t simple  ' ], ' \n\t\rtext ', [ '  background:red  ' ], '  is  ', [ '  background:default  ' ], ' text and ', [ ' is not   ' ] ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '   ❮ \t\tbackground:red  ❯ \n\ni  ❮  s  ❯background:default  ❮\n\r\t  ❯  text\n';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '   ', [ ' \t\tbackground:red  ' ], ' \n\ni  ', [ '  s  ' ], 'background:default  ', [ '\n\r\t  ' ], '  text\n' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '  ❮  background:red  ❯  i  ❮  s  ❯   background:default  ❮  ';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '  ', [ '  background:red  ' ], '  i  ', [ '  s  ' ], '   background:default  ❮  ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '  ❮  ❯\n\nordinary\t\t❮\ninline2 ❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '  ', [ '  ' ], '\n\nordinary\t\t', [ '\ninline2 ' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '\t❮\ninline1\r❯\tordinary\n❮\r❯\t';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '\t', [ '\ninline1\r' ], '\tordinary\n', [ '\r' ], '\t' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '  ❮  inline1  ❯  ❮  inline2  ❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '  ', [ '  inline1  ' ], '  ', [ '  inline2  ' ] ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '\n❮\n❯\n❮\n❯\r';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '\n', [ '\n' ], '\n', [ '\n' ], '\r' ];
  test.identical( got, expected );

  test.close( 'stripping - 0' );

  /* - */

  test.open( 'stripping - 1' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this  ❮ \nbackground:red\t❯ is ❮ background:default   ❯  text  and  is not \n';

  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text  and  is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter ❮ does not have closing';
  var srcStr = 'this  ❮ \nbackground:red\t❯ is ❮ background:default   ❯  text  and  ❮  is not\n';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text  and  ❮  is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '\n❮\n\t simple  ❯ \n\t\rtext ❮  background:red  ❯  is  ❮  background:default  ❯ text and ❮ is not   ❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'simple' ], 'text', [ 'background:red' ], 'is', [ 'background:default' ], 'text and', [ 'is not' ] ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '   ❮ \t\tbackground:red  ❯ \n\ni  ❮  s  ❯background:default  ❮\n\r\t  ❯  text\n';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default', [ '' ], 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '  ❮  background:red  ❯  i  ❮  s  ❯   background:default  ❮  ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default  ❮' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '  ❮  ❯\n\nordinary\t\t❮\ninline2 ❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ '' ], 'ordinary', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '\t❮\ninline1\r❯\tordinary\n❮\r❯\t';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'inline1' ], 'ordinary', [ '' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '  ❮  inline1  ❯  ❮  inline2  ❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ 'inline1' ], '', [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '\n❮\n❯\n❮\n❯\r';
  var got = _.strSplitInlinedStereo_( { src : srcStr, stripping : 1 } );
  var expected = [ '', [ '' ], '', [ '' ], '' ];
  test.identical( got, expected );

  test.close( 'stripping - 1' );
}

//

function strSplitInlinedStereo_OptionPreservingEmpty( test )
{
  test.case = 'full split, closing delimeter';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter ❮ does not have closing';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and ❮ is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and ❮ is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '❮simple ❯ text ❮background:red❯is❮background:default❯ text and ❮ is not❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ '', [ 'simple ' ], ' text ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and ', [ ' is not' ], '' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '❮background:red❯i❮s❯background:default❮❯text';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default', [ '' ], 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '❮background:red❯i❮s❯background:default❮';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ '', [ 'background:red' ], 'i', [ 's' ], 'background:default❮' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '❮❯ordinary❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ '', [ '' ], 'ordinary', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '❮inline1❯ordinary❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ '', [ 'inline1' ], 'ordinary', [ '' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '❮❯ordinary❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ '' ], 'ordinary', [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '❮inline1❯ordinary❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ 'inline1' ], 'ordinary', [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '❮inline1❯❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ '', [ 'inline1' ], '', [ 'inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '❮inline1❯❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ 'inline1' ], [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '❮❯❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 1 } );
  var expected = [ '', [ '' ], '', [ '' ], '' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '❮❯❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingEmpty : 0 } );
  var expected = [ [ '' ], [ '' ] ];
  test.identical( got, expected );

}

//

function strSplitInlinedStereo_OptionPrefixPostfix( test )
{
  test.open( 'prefix, postfix are different' )

  test.case = 'full split, closing delimeter';
  var srcStr = 'this<background:red>is<background:default>text<and>is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text', [ 'and' ], 'is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter < does not have closing';
  var srcStr = 'this<background:red>is<background:default>text<and>is<not>';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ 'this', [ 'background:red' ], 'is', [ 'background:default' ], 'text', [ 'and' ], 'is', [ 'not' ] ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '<simple>text<background:red>is<background:default>text<and>is<not>';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ [ 'simple' ], 'text', [ 'background:red' ], 'is', [ 'background:default' ], 'text', [ 'and' ], 'is', [ 'not' ] ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '<background:red>i<s>background:default<>text';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ [ 'background:red' ], 'i', [ 's' ], 'background:default', [ '' ], 'text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '{background:red}i{s}background:default ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '{', postfix : '}' } );
  var expected = [ [ 'background:red' ], 'i', [ 's' ], 'background:default ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '<>ordinary<inline2>';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ [ '' ], 'ordinary', [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '<inline1>ordinary<>';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ [ 'inline1' ], 'ordinary', [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '<inline1><inline2>';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ [ 'inline1' ], [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '<><>';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '<', postfix : '>' } );
  var expected = [ [ '' ], [ '' ] ];
  test.identical( got, expected );

  test.close( 'prefix, postfix are different' );

  /* - */

  test.open( 'prefix, postfix are the same' )

  test.case = 'no styles';
  var srcStr = 'this background:red is background:default text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ 'this background:red is background:default text and is not' ];
  test.identical( got, expected );

  test.case = 'two styles';
  var srcStr = 'this #background:red#is#background:default# text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ 'this ', [ 'background:red' ], 'is', [ 'background:default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this #background:red# is #background:default# text #and# is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ 'this ', [ 'background:red' ], ' is ', [ 'background:default' ], ' text ', [ 'and' ], ' is not' ];
  test.identical( got, expected );

  test.case = 'four styles';
  var srcStr = 'this #background:red# is #background:default# text #and# is #not#';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ 'this ', [ 'background:red' ], ' is ', [ 'background:default' ], ' text ', [ 'and' ], ' is ', [ 'not' ] ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '#simple# text #background:red# is #background:default# text #and# is #not# ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ 'simple' ], ' text ', [ 'background:red' ], ' is ', [ 'background:default' ], ' text ', [ 'and' ], ' is ', [ 'not' ], ' ' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = ' #background:red# i #s# background:default ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ ' ', [ 'background:red' ], ' i ', [ 's' ], ' background:default ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '## ordinary #inline2# ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ '' ], ' ordinary ', [ 'inline2' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = ' #inline1# ordinary ##';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ ' ', [ 'inline1' ], ' ordinary ', [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = ' #inline1##inline2# ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ ' ', [ 'inline1' ], [ 'inline2' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '####';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ '' ], [ '' ] ];
  test.identical( got, expected );

  /* - */

  test.open( 'single delimiter' )

  test.case = '# at the start';
  var srcStr = '#inline1 inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ '#inline1 inline2' ];
  test.identical( got, expected );

  test.case = '# at the end';
  var srcStr = 'inline1 inline2#';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ 'inline1 inline2#' ];
  test.identical( got, expected );

  test.case = '# at the start';
  var srcStr = '#inline1 inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ '#inline1 inline2' ];
  test.identical( got, expected );

  test.case = '# at the end';
  var srcStr = 'inline1 inline2#';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ 'inline1 inline2#' ];
  test.identical( got, expected );

  test.close( 'single delimiter' )

  /* - */

  test.open( 'wrong delimiter enclosing' )

  test.case = '3 delimeters';
  var srcStr = '#inline1 #inline2#';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ 'inline1 ' ], 'inline2#' ];
  test.identical( got, expected );

  /* - */

  test.case = '4 delimeters';
  var srcStr = '##inline1## inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ '' ], 'inline1', [ '' ], ' inline2' ];
  test.identical( got, expected );

  test.case = '4 delimeters with spaces';
  var srcStr = '# #inline1# # inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ ' ' ], 'inline1', [ ' ' ], ' inline2' ];
  test.identical( got, expected );

  test.case = '5 delimeters';
  var srcStr = '###inline1## inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ '' ], [ 'inline1' ], '# inline2' ];
  test.identical( got, expected );

  test.case = '5 delimeters with spaces';
  var srcStr = '# # #inline1# # inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ ' ' ], ' ', [ 'inline1' ], ' # inline2' ];
  test.identical( got, expected );

  test.case = '5 + 5 delimeters';
  var srcStr = '##inline1### inline2 ###inline1##';
  var got = _.strSplitInlinedStereo_( { src : srcStr, prefix : '#', postfix : '#' } );
  var expected = [ [ '' ], 'inline1', [ '' ], [ ' inline2 ' ], [ '' ], 'inline1', [ '' ] ];
  test.identical( got, expected );

  test.close( 'wrong delimiter enclosing' )

  /* - */

  test.close( 'prefix, postfix are the same' )
}

//

function strSplitInlinedStereo_OptionPreservingDelimeters( test )
{

  test.case = 'no styles';
  var srcStr = 'this background:red is background:default text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ 'this background:red is background:default text and is not' ];
  test.identical( got, expected );

  test.case = 'two styles';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ 'this ', [ '❮', 'background:red', '❯' ], 'is', [ '❮', 'background:default', '❯' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ 'this ', [ '❮', 'background:red', '❯' ], ' is ', [ '❮', 'background:default', '❯' ], ' text ', [ '❮', 'and', '❯' ], ' is not' ];
  test.identical( got, expected );

  test.case = 'four styles';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ 'this ', [ '❮', 'background:red', '❯' ], ' is ', [ '❮', 'background:default', '❯' ], ' text ', [ '❮', 'and', '❯' ], ' is ', [ '❮', 'not', '❯' ] ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '❮simple❯ text ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '', [ '❮', 'simple', '❯' ], ' text ', [ '❮', 'background:red', '❯' ], ' is ', [ '❮', 'background:default', '❯' ], ' text ', [ '❮', 'and', '❯' ], ' is ', [ '❮', 'not', '❯' ], ' ' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = ' ❮background:red❯ i ❮s❯ background:default ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ ' ', [ '❮', 'background:red', '❯' ], ' i ', [ '❮', 's', '❯' ], ' background:default ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '❮❯ ordinary ❮inline2❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '', [ '❮', '❯' ], ' ordinary ', [ '❮', 'inline2', '❯' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = ' ❮inline1❯ ordinary ❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ ' ', [ '❮', 'inline1', '❯' ], ' ordinary ', [ '❮', '❯' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = ' ❮inline1❯❮inline2❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ ' ', [ '❮', 'inline1', '❯' ], [ '❮', 'inline2', '❯' ], ' ' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '❮❯❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '', [ '❮', '❯' ], [ '❮', '❯' ] ];
  test.identical( got, expected );

  /* - */

  test.open( 'single delimiter' )

  test.case = '❮ at the start';
  var srcStr = '❮inline1 inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮inline1 inline2' ];
  test.identical( got, expected );

  test.case = '❮ at the end';
  var srcStr = 'inline1 inline2❮';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ 'inline1 inline2❮' ];
  test.identical( got, expected );

  test.case = '❯ at the start';
  var srcStr = '❯inline1 inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❯inline1 inline2' ];
  test.identical( got, expected );

  test.case = '❯ at the end';
  var srcStr = 'inline1 inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ 'inline1 inline2❯' ];
  test.identical( got, expected );

  test.close( 'single delimiter' )

  /* - */

  test.open( 'wrong delimiter enclosing' )

  test.case = 'same open and close delimeter ❮';
  var srcStr = '❮inline1❮ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮inline1❮ inline2' ];
  test.identical( got, expected );

  test.case = 'same open and close delimeter ❯';
  var srcStr = '❯inline1❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❯inline1❯ inline2' ];
  test.identical( got, expected );

  test.case = 'reverse open and close delimeters';
  var srcStr = '❯inline1❮ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❯inline1❮ inline2' ];
  test.identical( got, expected );

  /* - */

  test.case = 'odd number of delimeters - 2 opening';
  var srcStr = '❮inline1 ❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮inline1 ', [ '❮', 'inline2', '❯' ] ];
  test.identical( got, expected );

  test.case = 'odd number of delimeters - 2 closing';
  var srcStr = '❮inline1❯ inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '', [ '❮inline1❯' ], ' inline2❯' ];
  test.identical( got, expected );

  /* - */

  test.case = '2 open, 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮', [ '❮', 'inline1', '❯' ], '❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮ ', [ '❮', 'inline1', '❯' ], ' ❯ inline2' ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters';
  var srcStr = '❮❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮❮', [ '❮', 'inline1', '❯' ], '❯ inline2' ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮ ❮ ', [ '❮', 'inline1', '❯' ], ' ❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮', [ '❮', 'inline1', '❯' ], '❯❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing & 3 open 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2 ❮❮❮inline1❯❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '❮', [ '❮', 'inline1', '❯' ], '❯❯ inline2 ❮❮', [ '❮', 'inline1', '❯' ], '❯' ];
  test.identical( got, expected );

  test.close( 'wrong delimiter enclosing' )

  test.case = 'text with spaces inside delimiters';
  var srcStr = '❮  inline1 \n❯ ❮ inline2\t❯❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingDelimeters : 1 } );
  var expected = [ '', [ '❮', '  inline1 \n', '❯' ], ' ', [ '❮', ' inline2\t', '❯' ], '❯' ];
  test.identical( got, expected );

}

//

function strSplitInlinedStereo_OptionQuoting( test )
{
  test.open( 'quoting - 0' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this "❮"background:red"❯"is"❮"background:default"❯" text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ 'this "', [ '"background:red"' ], '"is"', [ '"background:default"' ], '" text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter ❮ does not have closing';
  var srcStr = 'this "❮"background:red"❯"is"❮"background:default"❯" text and "❮" is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ 'this "', [ '"background:red"' ], '"is"', [ '"background:default"' ], '" text and "❮" is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '"❮"simple "❯" text "❮"background:red"❯"is"❮"background:default"❯" text and "❮" is not"❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '"', [ '"simple "' ], '" text "', [ '"background:red"' ], '"is"', [ '"background:default"' ], '" text and "', [ '" is not"' ], '"' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '"❮"background:red"❯"i"❮"s"❯"background:default"❮""❯"text';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '"', [ '"background:red"' ], '"i"', [ '"s"' ], '"background:default"', [ '""' ], '"text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '"❮"background:red"❯"i"❮"s"❯"background:default"❮"';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '"', [ '"background:red"' ], '"i"', [ '"s"' ], '"background:default"❮"' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '"❮""❯"ordinary"❮"inline2"❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '"', [ '""' ], '"ordinary"', [ '"inline2"' ], '"' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '"❮"inline1"❯"ordinary"❮""❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '"', [ '"inline1"' ], '"ordinary"', [ '""' ], '"' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '"❮"inline1"❯""❮"inline2"❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '"', [ '"inline1"' ], '""', [ '"inline2"' ], '"' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '"❮""❯""❮""❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr } );
  var expected = [ '"', [ '""' ], '""', [ '""' ], '"' ];
  test.identical( got, expected );

  test.close( 'quoting - 0' );

  /* - */

  test.open( 'quoting - 1' );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this "❮"background:red"❯"is"❮"background:default"❯" text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ 'this "❮"background:red"❯"is"❮"background:default"❯" text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter ❯ does not have closing';
  var srcStr = 'this "❮"background:red"❯"is"❮"background:default"❯" text and "❮" is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ 'this "❮"background:red"❯"is"❮"background:default"❯" text and "❮" is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '"❮"simple "❯" text "❮"background:red"❯"is"❮"background:default"❯" text and "❮" is not"❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮"simple "❯" text "❮"background:red"❯"is"❮"background:default"❯" text and "❮" is not"❯"' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '"❮"background:red"❯"i"❮"s"❯"background:default"❮""❯"text';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮"background:red"❯"i"❮"s"❯"background:default"❮""❯"text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '"❮"background:red"❯"i"❮"s"❯"background:default"❮"';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮"background:red"❯"i"❮"s"❯"background:default"❮"' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '"❮""❯"ordinary"❮"inline2"❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮""❯"ordinary"❮"inline2"❯"' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '"❮"inline1"❯"ordinary"❮""❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮"inline1"❯"ordinary"❮""❯"' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '"❮"inline1"❯""❮"inline2"❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮"inline1"❯""❮"inline2"❯"' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '"❮""❯""❮""❯"';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮""❯""❮""❯"' ];
  test.identical( got, expected );

  /* - */

  test.case = 'two quotted, one normal';
  var srcStr = '"❮""❯""❮""❯"❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮""❯""❮""❯"', [ '' ] ];
  test.identical( got, expected );

  test.case = 'one quotted, two normal';
  var srcStr = '"❮""❯""❮""❯"❮❯ aa ❮inline❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮""❯""❮""❯"', [ '' ], ' aa ', [ 'inline' ] ];
  test.identical( got, expected );

  test.case = 'two quotted, two normal';
  var srcStr = '❮""❯"❮""❯"❮❯ aa ❮inline❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ [ '""' ], '"❮""❯"', [ '' ], ' aa ', [ 'inline' ] ];
  test.identical( got, expected );

  /* - */

  test.case = 'escaped 1 inline';
  var srcStr = '"❮inlined❯"i❮s❯"ordinary"❮';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮inlined❯"i', [ 's' ], '"ordinary"❮' ]
  test.identical( got, expected );

  test.case = 'escaped whole str';
  var srcStr = '"❮inlined❯i❮s❯ordinary❮"';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮inlined❯i❮s❯ordinary❮"' ]
  test.identical( got, expected );

  test.case = 'escaped each separately str';
  var srcStr = '"❮inlined❯"i"❮s❯"ordinary❮';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1 } );
  var expected = [ '"❮inlined❯"i"❮s❯"ordinary❮' ]
  test.identical( got, expected );

  test.case = 'escaped 2 inline';
  var srcStr = '"❮inlined❯"i❮s❯"ordinary"❮';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1, preservingQuoting : 0 } );
  var expected = [ '❮inlined❯i', [ 's' ], 'ordinary❮' ];
  test.identical( got, expected );

  test.case = 'escaped each separately str';
  var srcStr = '&&❮inlined❯||i&&❮s❯||ordinary❮';
  var got = _.strSplitInlinedStereo_( { src : srcStr, quoting : 1, quotingPrefixes : [ '&&' ], quotingPostfixes : [ '||' ] } );
  var expected = [ '&&❮inlined❯||i&&❮s❯||ordinary❮' ];
  test.identical( got, expected );

  test.close( 'quoting - 1' );
}

//

function strSplitInlinedStereo_OptionOnInlined( test )
{
  var onInlined = ( part ) =>
  {
    var temp = part.split( ':' );

    if( temp.length === 2 )
    return temp;

    return [ 'not splittable' ];
  };

  /* - */

  test.case = 'full split, closing delimeter';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onInlined } );
  var expected = [ 'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and is not' ];
  test.identical( got, expected );

  test.case = 'openning delimeter ❮ does not have closing';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and ❮ is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onInlined } );
  var expected = [ 'this ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and ❮ is not' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '❮simple ❯ text ❮background:red❯is❮background:default❯ text and ❮ is not❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onInlined } );
  var expected = [ [ 'not splittable' ], ' text ', [ 'background', 'red' ], 'is', [ 'background', 'default' ], ' text and ', [ 'not splittable' ] ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '❮background:red❯i❮s❮background:default❯❮text';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onInlined } );
  var expected = [ [ 'background', 'red' ], 'i❮s', [ 'background', 'default' ], '❮text' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '❮background:red❯i❮s❮background:default❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onInlined } );
  var expected = [ [ 'background', 'red' ], 'i❮s', [ 'background', 'default' ] ];
  test.identical( got, expected );

}

//

function strSplitInlinedStereo_OptionOnOrdinary( test )
{
  var onOrdinary = ( part ) =>
  {
    var temp = '~' + part + '~';

    if( temp.length >= 4 )
    return temp;

    return undefined;
  };

  /* - */

  test.case = 'full split, closing delimeter';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ '~this ~', [ 'background:red' ], '~is~', [ 'background:default' ], '~ text and is not~' ];
  test.identical( got, expected );

  test.case = 'openning delimeter ❮ does not have closing';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and ❮ is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ '~this ~', [ 'background:red' ], '~is~', [ 'background:default' ], '~ text and ❮ is not~' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '❮simple ❯ text ❮background:red❯is❮background:default❯ text and ❮ is not❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ 'simple ' ], '~ text ~', [ 'background:red' ], '~is~', [ 'background:default' ], '~ text and ~', [ ' is not' ] ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var srcStr = '❮background:red❯i❮s❮background:default❯❮text';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ 'background:red' ], '~i❮s~', [ 'background:default' ], '~❮text~' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = '❮background:red❯i❮s❮background:default❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ 'background:red' ], '~i❮s~', [ 'background:default' ] ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '❮❯ordinary❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ '' ], '~ordinary~', [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = '❮inline1❯ordinary❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ 'inline1' ], '~ordinary~', [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '❮inline1❯❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ 'inline1' ], [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '❮❯❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ '' ], [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '❮inline1❯i';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ 'inline1' ], 'i' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = '❮inline1❯1';
  var got = _.strSplitInlinedStereo_( { src : srcStr, onOrdinary } );
  var expected = [ [ 'inline1' ], '1' ];
  test.identical( got, expected );
}

//

function strSplitInlinedStereo_OptionPreservingOrdinary( test )
{

  test.case = 'no styles';
  var srcStr = 'this background:red is background:default text and is not';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  test.case = 'two styles';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and is not';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'background:red' ], [ 'background:default' ] ];
  test.identical( got, expected );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is not';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'background:red' ], [ 'background:default' ], [ 'and' ] ];
  test.identical( got, expected );

  test.case = 'four styles';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'background:red' ], [ 'background:default' ], [ 'and' ], [ 'not' ] ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '❮simple❯ text ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯ ';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'simple' ], [ 'background:red' ], [ 'background:default' ], [ 'and' ], [ 'not' ] ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = ' ❮background:red❯ i ❮s❯ background:default ';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'background:red' ], [ 's' ] ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '❮❯ ordinary ❮inline2❯ ';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ '' ], [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = ' ❮inline1❯ ordinary ❮❯';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ], [ '' ] ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = ' ❮inline1❯❮inline2❯ ';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ], [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '❮❯❮❯';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ '' ], [ '' ] ];
  test.identical( got, expected );

  /* - */

  test.open( 'single delimiter' )

  test.case = '❮ at the start';
  var srcStr = '❮inline1 inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  test.case = '❮ at the end';
  var srcStr = 'inline1 inline2❮';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  test.case = '❯ at the start';
  var srcStr = '❯inline1 inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  test.case = '❯ at the end';
  var srcStr = 'inline1 inline2❯';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  test.close( 'single delimiter' )

  /* - */

  test.open( 'wrong delimiter enclosing' )

  test.case = 'same open and close delimeter ❮';
  var srcStr = '❮inline1❮ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  test.case = 'same open and close delimeter ❯';
  var srcStr = '❯inline1❯ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  test.case = 'reverse open and close delimeters';
  var srcStr = '❯inline1❮ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected =
  [];
  test.identical( got, expected );

  /* - */

  test.case = 'odd number of delimeters - 2 opening';
  var srcStr = '❮inline1 ❮inline2❯';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline2' ] ];
  test.identical( got, expected );

  test.case = 'odd number of delimeters - 2 closing';
  var srcStr = '❮inline1❯ inline2❯';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ] ];
  test.identical( got, expected );

  /* - */

  test.case = '2 open, 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ] ];
  test.identical( got, expected );

  test.case = '2 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ] ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters';
  var srcStr = '❮❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ] ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ] ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ] ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing & 3 open 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2 ❮❮❮inline2❯❯';
  var got = _.strSplitInlinedStereo_({ src : srcStr, preservingOrdinary : 0 });
  var expected = [ [ 'inline1' ], [ 'inline2' ] ];
  test.identical( got, expected );

  test.close( 'wrong delimiter enclosing' )

}

//

function strSplitInlinedStereo_OptionPreservingInlined( test )
{

  test.case = 'no styles';
  var srcStr = 'this background:red is background:default text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ 'this background:red is background:default text and is not' ];
  test.identical( got, expected );

  test.case = 'two styles';
  var srcStr = 'this ❮background:red❯is❮background:default❯ text and is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ 'this ', 'is', ' text and is not' ];
  test.identical( got, expected );

  test.case = 'full split, closing delimeter';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is not';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ 'this ', ' is ', ' text ', ' is not' ];
  test.identical( got, expected );

  test.case = 'four styles';
  var srcStr = 'this ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ 'this ', ' is ', ' text ', ' is ' ];
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var srcStr = '❮simple❯ text ❮background:red❯ is ❮background:default❯ text ❮and❯ is ❮not❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ ' text ', ' is ', ' text ', ' is ', ' ' ];
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var srcStr = ' ❮background:red❯ i ❮s❯ background:default ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ ' ', ' i ', ' background:default ' ];
  test.identical( got, expected );

  test.case = 'empty string left';
  var srcStr = '❮❯ ordinary ❮inline2❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ ' ordinary ', ' ' ];
  test.identical( got, expected );

  test.case = 'empty string right';
  var srcStr = ' ❮inline1❯ ordinary ❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ ' ', ' ordinary ' ];
  test.identical( got, expected );

  test.case = 'empty string middle';
  var srcStr = ' ❮inline1❯❮inline2❯ ';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ ' ', ' ' ];
  test.identical( got, expected );

  test.case = 'empty all';
  var srcStr = '❮❯❮❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [];
  test.identical( got, expected );

  /* - */

  test.open( 'single delimiter' )

  test.case = '❮ at the start';
  var srcStr = '❮inline1 inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮inline1 inline2' ];
  test.identical( got, expected );

  test.case = '❮ at the end';
  var srcStr = 'inline1 inline2❮';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ 'inline1 inline2❮' ];
  test.identical( got, expected );

  test.case = '❯ at the start';
  var srcStr = '❯inline1 inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❯inline1 inline2' ];
  test.identical( got, expected );

  test.case = '❯ at the end';
  var srcStr = 'inline1 inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ 'inline1 inline2❯' ];
  test.identical( got, expected );

  test.close( 'single delimiter' )

  /* - */

  test.open( 'wrong delimiter enclosing' )

  test.case = 'same open and close delimeter ❮';
  var srcStr = '❮inline1❮ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮inline1❮ inline2' ];
  test.identical( got, expected );

  test.case = 'same open and close delimeter ❯';
  var srcStr = '❯inline1❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❯inline1❯ inline2' ];
  test.identical( got, expected );

  test.case = 'reverse open and close delimeters';
  var srcStr = '❯inline1❮ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❯inline1❮ inline2' ];
  test.identical( got, expected );

  /* - */

  test.case = 'odd number of delimeters - 2 opening';
  var srcStr = '❮inline1 ❮inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮inline1 ' ];
  test.identical( got, expected );

  test.case = 'odd number of delimeters - 2 closing';
  var srcStr = '❮inline1❯ inline2❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ ' inline2❯' ];
  test.identical( got, expected );

  /* - */

  test.case = '2 open, 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮', '❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮ ', ' ❯ inline2' ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters';
  var srcStr = '❮❮❮inline1❯❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮❮', '❯ inline2' ];
  test.identical( got, expected );

  test.case = '3 open, 2 closing delimeters with spaces';
  var srcStr = '❮ ❮ ❮inline1❯ ❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮ ❮ ', ' ❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮', '❯❯ inline2' ];
  test.identical( got, expected );

  test.case = '2 open, 3 closing & 3 open 2 closing delimeters';
  var srcStr = '❮❮inline1❯❯❯ inline2 ❮❮❮inline1❯❯';
  var got = _.strSplitInlinedStereo_( { src : srcStr, preservingInlined : 0 } );
  var expected = [ '❮', '❯❯ inline2 ❮❮', '❯' ];
  test.identical( got, expected );

  test.close( 'wrong delimiter enclosing' )

}

//

function strSplitInlinedStereo_OptionsCombined( test )
{

  test.case = 'no inlined';
  var src =
  {
    src : 'this background:red is background:default text and is not',
    prefix : '❮',
    postfix : '❯',
    onInlined : ( e ) => [ e ],
    onOrdinary : null,

    stripping : 0,
    quoting : 0,

    preservingEmpty : 1,
    preservingDelimeters : 0,
    preservingOrdinary : 1,
    preservingInlined : 1,
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ 'this background:red is background:default text and is not' ];
  test.identical( got, expected );

  test.case = 'onIn, onOrd, s : 1, q : 0, pe : 0, pd : 1, po : 1, pi : 1';
  var src =
  {
    src : 'this ❯background:red❮is❯background:default❮ text and is not',
    prefix : '❯',
    postfix : '❮',
    onInlined : ( e ) => [ e + e ],
    onOrdinary : ( e ) => e + e,

    stripping : 1,
    quoting : 0,

    preservingEmpty : 0,
    preservingDelimeters : 1,
    preservingOrdinary : 1,
    preservingInlined : 1,
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ 'thisthis', [ '❯background:red❮❯background:red❮' ], 'isis', [ '❯background:default❮❯background:default❮' ], 'text and is nottext and is not' ];
  test.identical( got, expected );

  test.case = 'onIn, s : 0, q : 1, pe : 1, pd : 0, po : 1, pi : 1';
  var src =
  {
    src : 'this ❯background:red❮is❯background:default❮ text ❯and❮ is "❯"not"❮"',
    prefix : '❯',
    postfix : '❮',
    onInlined : ( e ) => '~' + e + '~',

    stripping : 0,
    quoting : 1,

    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingOrdinary : 1,
    preservingInlined : 1,
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ 'this ', '~❯background:red❮~', 'is', '~❯background:default❮~', ' text ', '~❯and❮~', ' is "❯"not"❮"' ];
  test.identical( got, expected );

  test.case = 'po : 0, pi : 0';
  var src =
  {
    src : 'this ❯background:red❮is❯background:default❮ text ❯and❮ is "❯"not"❮"',
    prefix : '❯',
    postfix : '❮',
    onInlined : ( e ) => '~' + e + '~',

    stripping : 0,
    quoting : 1,

    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingOrdinary : 0,
    preservingInlined : 0,
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected =
  [];
  test.identical( got, expected );

  test.case = 'po : 1, pi : 0';
  var src =
  {
    src : 'this ❯background:red❮is❯background:default❮ text ❯and❮ is "❯"not"❮"',
    prefix : '❯',
    postfix : '❮',
    onInlined : ( e ) => '~' + e + '~',

    stripping : 0,
    quoting : 1,

    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingOrdinary : 1,
    preservingInlined : 0,
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ 'this ', 'is', ' text ', ' is "❯"not"❮"' ];
  test.identical( got, expected );

  test.case = 'po : 0, pi : 1';
  var src =
  {
    src : 'this ❯background:red❮is❯background:default❮ text ❯and❮ is "❯"not"❮"',
    prefix : '❯',
    postfix : '❮',
    onInlined : ( e ) => '~' + e + '~',

    stripping : 0,
    quoting : 1,

    preservingEmpty : 1,
    preservingDelimeters : 1,
    preservingOrdinary : 0,
    preservingInlined : 1,
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ '', '~❯background:red❮~', '', '~❯background:default❮~', '', '~❯and❮~', '' ];
  test.identical( got, expected );

  test.case = 'prefix : \'❮❮\', postfix : \'❯❯\', pe : 0, s : 1';
  var src =
  {
    src : '❮❮inline1❯❯ ❮inline2❯',
    prefix : '❮❮',
    postfix : '❯❯',
    preservingEmpty : 0,
    stripping : 1
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ [ 'inline1' ], '❮inline2❯' ];
  test.identical( got, expected );

  test.case = 'src : ❮inline1 inline2, head : ❮, post : inline1 inline2, pe : 0, s : 1';
  var src =
  {
    src : '❮inline1 inline2',
    prefix : '❮',
    postfix : 'inline1 inline2',
    preservingEmpty : 0,
    stripping : 1
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ [ '' ] ];
  test.identical( got, expected );

  test.case = 'src : ❮inline1 inline2, head : ❮, post : inline1 inline2, pe : 1, s : 1';
  var src =
  {
    src : '❮inline1 inline2',
    prefix : '❮',
    postfix : 'inline1 inline2',
    preservingEmpty : 1,
    stripping : 1
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ '', [ '' ], '' ];
  test.identical( got, expected );

  test.case = 'src : a❮❮❮inline1 inline2❯❯, head : ❮❮, post : ❯, pe : 1, s : 1';
  var src =
  {
    src : 'a❮❮❮inline1 inline2❯❯',
    prefix : '❮❮',
    postfix : '❯',
    preservingEmpty : 1,
    stripping : 1
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ 'a', [ '❮inline1 inline2' ], '❯' ];
  test.identical( got, expected );

  test.case = 'src : a❮❮❮inline1 inline2❯❯, head : ❮❮, post : ❯, pe : 1, s : 1, po : 0';
  var src =
  {
    src : 'a❮❮❮inline1 inline2❯❯',
    prefix : '❮❮',
    postfix : '❯',
    preservingEmpty : 1,
    preservingOrdinary : 0,
    stripping : 1
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ '', [ '❮inline1 inline2' ], '' ];
  test.identical( got, expected );

  test.case = 'src : a❮❮❮inline1 inline2❯❯, head : ❮❮, post : ❯, pe : 0, s : 1, po : 0';
  var src =
  {
    src : 'a❮❮❮inline1 inline2❯❯',
    prefix : '❮❮',
    postfix : '❯',
    preservingEmpty : 0,
    preservingOrdinary : 0,
    stripping : 1
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ [ '❮inline1 inline2' ] ];
  test.identical( got, expected );

  test.case = 'src : a❮❮❮inline1 inline2❯❯, head : ❮❮, post : ❯, pe : 1, s : 1, pi : 0';
  var src =
  {
    src : 'a❮❮❮inline1 inline2❯❯',
    prefix : '❮❮',
    postfix : '❯',
    preservingEmpty : 1,
    preservingInlined : 0,
    stripping : 1,
  };
  var got = _.strSplitInlinedStereo_( src );
  var expected = [ 'a', '❯' ];
  test.identical( got, expected );

}

//

function strLine( test )
{
  test.case = 'empty str';
  var src = '';
  var got = _.strLine( src, 1 );
  test.identical( got, src );

  test.case = 'lines < index';
  var src = 'a\nb\nc';
  var got = _.strLine( src, 10 );
  test.identical( got, src );

  test.case = 'get first line';
  var src = 'a\nb\nc';
  var got = _.strLine( src, 1 );
  test.identical( got, 'a' );

  test.case = 'get middle line';
  var src = 'a\nb\nc';
  var got = _.strLine( src, 2 );
  test.identical( got, 'b' );

  test.case = 'get last line';
  var src = 'a\nb\nc';
  var got = _.strLine( src, 3 );
  test.identical( got, 'c' );
}

// --
// test suite
// --

const Proto =
{

  name : 'Tools.Str',
  silencing : 1,

  tests :
  {

    /* */

    // strLeft, /* aaa : update */ /* Dmytro : updated, new option implemented */ /* !!! */
    strLeft_,
    // strRight, /* aaa : update */ /* Dmytro : updated, new option implemented */ /* !!! */
    strRight_,

    strEquivalent,
    strsEquivalent,
    strsEquivalentAll,
    strsEquivalentAny,
    strsEquivalentNone,

    strBeginOf,
    strEndOf,
    strBegins,
    strEnds,

    // converter

    exportStringShallowDiagnostic,
    exportStringShallowCode,
    strPrimitive,
    strTypeWithTraitsBasic,
    strTypeWithoutTraitsBasic,
    strTypeWithTraitsGeneratedObject,
    strTypeWithoutTraitsGeneratedObject,

    strParseType,

    strConcat,

    strQuote,
    strUnquote,
    strQuotePairsNormalize,
    strQuoteAnalyze,

    strInsideOf,
    strInsideOfOptionPairing,
    strInsideOf_,
    strInsideOf_OptionPairingIs0,
    strInsideOf_OptionPairingIs1,
    strOutsideOf,

    strRemoveBegin,
    strRemoveEnd,

    strReplaceBegin,
    strReplaceEnd,

    strReplaceSrcIsString,
    strReplaceSrcIsArrayOfStrings,

    strStripWithDefaultOptions,
    strStripStripperIsTrueLike,
    strStripStripperIsString,
    strStripStripperIsRegexp,
    strStripStripperIsArrayOfStrings,

    strIsolateLeftOrNone,
    strIsolateLeftOrAll,
    strIsolateRightOrNone,
    strIsolateRightOrAll,
    // strIsolateInsideOrNone,
    strIsolateInside,
    strIsolateInsidePairs,

    // splits

    strSplitsCoupledGroup,
    strSplitsDropEmpty,
    strSplitsUngroupedJoin,
    strSplitsQuotedRejoin,
    strSplitsQuotedRejoinOptionOnQuoting,

    // splitter

    strSplitFast,
    strSplitFastRegexp,
    strSplit,
    strSplitOptionOnQuote,
    strSplitOptionOnDelimeter,

    strSplitInlinedDefaultOptions,
    strSplitInlinedOptionDelimeter,
    strSplitInlinedOptionStripping,
    strSplitInlinedOptionQuoting,
    strSplitInlinedOptionPreservingEmpty,
    strSplitInlinedOptionOnInlined,
    strSplitInlinedCombineOnInlinedAndPreservingEmpty,

    // strSplitInlinedStereo,
    strSplitInlinedStereo_Basic,
    strSplitInlinedStereo_OptionPrefixPostfix,
    strSplitInlinedStereo_OptionStripping,
    strSplitInlinedStereo_OptionPreservingEmpty,
    // strSplitInlinedStereo_OptionPreservingDelimeters, /* qqq : for Yevhen : bad : fix */
    strSplitInlinedStereo_OptionQuoting,
    strSplitInlinedStereo_OptionOnInlined,
    strSplitInlinedStereo_OptionOnOrdinary,
    strSplitInlinedStereo_OptionPreservingOrdinary,
    strSplitInlinedStereo_OptionPreservingInlined,
    strSplitInlinedStereo_OptionsCombined,

    strLine,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
