( function _l0_l3_Regexp_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// implementation
// --

function identical( test )
{
  var context = this;

  /* */

  test.case = 'null';

  var expected = false;
  var got = _.regexp.identical( null, null );
  test.identical( got, expected );

  /* */

  test.case = 'null and regexp';

  var expected = false;
  var got = _.regexp.identical( /x/, null );
  test.identical( got, expected );

  /* */

  test.case = 'same string';

  var expected = false;
  var got = _.regexp.identical( 'x', 'x' );
  test.identical( got, expected );

  /* */

  test.case = 'same regexp';
  var expected = true;
  var got = _.regexp.identical( /abc/iy, /abc/yi );
  test.identical( got, expected );

  /* */

  test.case = 'not identical regexp, different flags';
  var expected = false;
  var got = _.regexp.identical( /abc/i, /abc/ );
  test.identical( got, expected );

  /* */

  test.case = 'not identical regexp, different source';
  var expected = false;
  var got = _.regexp.identical( /abcd/i, /abc/i );
  test.identical( got, expected );

  /* */

  test.case = 'not identical regexp';
  var expected = false;
  var got = _.regexp.identical( /abcd/y, /abc/i );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.identical() );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.identical( /abc/i, /def/i, 3, 4 ) );

}

//

function equivalent( test )
{
  test.case = 'null';
  var expected = false;
  var got = _.regexp.equivalent( null, null );
  test.identical( got, expected );

  test.case = 'null and regexp';
  var expected = false;
  var got = _.regexp.equivalent( /x/, null );
  test.identical( got, expected );

  test.case = 'same string';
  var expected = true;
  var got = _.regexp.equivalent( 'x', 'x' );
  test.identical( got, expected );

  test.case = 'same regexp';
  var expected = true;
  var got = _.regexp.equivalent( /abc/iy, /abc/yi );
  test.identical( got, expected );

  /* - */

  test.case = 'identical regexp, first with flag';
  var expected = false;
  var got = _.regexp.equivalent( /abc/i, /abc/ );
  test.identical( got, expected );

  test.case = 'identical regexp, different flags';
  var expected = false;
  var got = _.regexp.equivalent( /abc/i, /abc/g );
  test.identical( got, expected );

  test.case = 'identical regexp, second with flag';
  var expected = false;
  var got = _.regexp.equivalent( /abc/, /abc/g );
  test.identical( got, expected );

  /* - */

  test.case = 'not identical regexp, different source';
  var expected = false;
  var got = _.regexp.equivalent( /abcd/i, /abc/i );
  test.identical( got, expected );

  test.case = 'not identical regexp, different source & flags';
  var expected = false;
  var got = _.regexp.equivalent( /abcd/y, /abc/i );
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'none argument';
  test.shouldThrowErrorSync( () => _.regexp.identical() );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.regexp.identical( /abc/i, /def/i, 3, 4 ) );

}

//

function regexpEquivalent( test )
{
  test.open( 'true' );

  test.case = 'strings';
  var got = _.regexp.equivalent( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexp.equivalent( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexp.equivalent( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'true' );

  /* - */

  test.open( 'false' );

  test.case = 'strings';
  var got = _.regexp.equivalent( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexp.equivalent( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexp.equivalent( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexp.equivalent( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexp.equivalent( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexp.equivalent( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.case = 'diff strings with different newlines';
  var got = _.regexp.equivalent( '\n\nabc\nb', '\nabc\n\n' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs';
  var got = _.regexp.equivalent( '      \t\n\nabc\n    ', '        \nabc\n\n\t\t    c       ' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs on each line';
  var got = _.regexp.equivalent( '      \t\nab   \t\n\nb   \t   \n   \nc  \t     ', '        \na  \n  \n  \t   \nb  \t \n   \nc\t \n\n\t\t           ' );
  test.identical( got, false );

  test.close( 'false' );
}

//

function exportStringDiagnosticShallow( test )
{

  test.case = 'regexp without flags';
  var src = /regexp/;
  var expected = '/regexp/';
  var got = _.regexp.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'regexp with flags';
  var src = /regexp/gi;
  var expected = '/regexp/gi';
  var got = _.regexp.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'regexp complex';
  var src = /(?:\d{3}|\(\d{3}\))([-\/\.])\d{3}1\d{4}/gi;
  var expected = '/(?:\\d{3}|\\(\\d{3}\\))([-\\/\\.])\\d{3}1\\d{4}/gi';
  var got = _.regexp.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.routine.exportStringDiagnosticShallow() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.routine.exportStringDiagnosticShallow( /hello/, /hello/ ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.routine.exportStringDiagnosticShallow( {} ) );
}

// --
// suite definition
// --

const Proto =
{

  name : 'Tools.l1.Regexp.l0.l3',
  silencing : 1,

  tests :
  {

    identical,
    equivalent,

    regexpEquivalent,

    exportStringDiagnosticShallow

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
