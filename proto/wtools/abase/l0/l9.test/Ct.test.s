( function _l0_l9_Ct_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;

//--
// l0/l8/Ct.s
//--

function strip( test )
{
  test.open( 'without space symbols' );

  test.case = 'full split, closing delimeter';
  var got = _.ct.strip( 'this❮background:red❯is❮background:default❯text' );
  var expected = 'thisistext';
  test.identical( got, expected );

  test.case = 'openning delimeter. does not have closing';
  var got = _.ct.strip( 'this❮background:red❯is❮background:default❯text❮is' );
  var expected = 'thisistext❮is';
  test.identical( got, expected );
  var got = _.ct.strip( 'this❮background:red❯is❮background:default❯text❯is' );
  var expected = 'thisistext❯is';
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var got = _.ct.strip( '❮simple❯text❮background:red❯is❮background:default❯text❮is❯' );
  var expected = 'textistext';
  test.identical( got, expected );
  var got = _.ct.strip( '❯simple❮text❮background:red❯is❮background:default❯text❯is❮' );
  var expected = '❯simple❮textistext❯is❮';
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var got = _.ct.strip( '❮background:red❯i❮s❮background:default❯❮text' );
  var expected = 'i❮s❮text';
  test.identical( got, expected );
  var got = _.ct.strip( '❮background:red❯i❯s❮background:default❯❮text' );
  var expected = 'i❯s❮text';
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var got = _.ct.strip( '❮background:red❯i❮s❮background:default❯' );
  var expected = 'i❮s';
  test.identical( got, expected );
  var got = _.ct.strip( '❮background:red❯i❯s❮background:default❯' );
  var expected = 'i❯s';
  test.identical( got, expected );

  test.case = 'wrong enclosing';
  var got = _.ct.strip( '❯❯ordinary❯inline2❯' );
  var expected = '❯❯ordinary❯inline2❯';
  test.identical( got, expected );
  var got = _.ct.strip( '❮❮ordinary❯inline2❮' );
  var expected = '❮inline2❮';
  test.identical( got, expected );
  var got = _.ct.strip( '❯❮ordinary❯inline2❮' );
  var expected = '❯inline2❮';
  test.identical( got, expected );

  test.case = 'empty string right';
  var got = _.ct.strip( '❯inline1❮ordinary❮❯' );
  var expected = '❯inline1❮ordinary';
  test.identical( got, expected );
  var got = _.ct.strip( '❮inline1❯ordinary❮❯' );
  var expected = 'ordinary';
  test.identical( got, expected );
  var got = _.ct.strip( '❮inline1❮ordinary❯❮' );
  var expected = '❮inline1❮';
  test.identical( got, expected );

  test.case = 'empty string middle';
  var got = _.ct.strip( '❮inline1❯❮inline2❯' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty all';
  var got = _.ct.strip( '❯❮❮❯' );
  var expected = '❯❮';
  test.identical( got, expected );
  var got = _.ct.strip( '❮❯❮❯' );
  var expected = '';
  test.identical( got, expected );

  test.close( 'without space symbols' );

  /* - */

  test.open( 'with space symbols' );

  test.case = 'full split, closing delimeter';
  var got = _.ct.strip( 'this  ❮ \nbackground:red\t❯ is ❮ background:default   ❯  text  and  is not \n' );
  var expected = 'this   is   text  and  is not \n';
  test.identical( got, expected );

  test.case = 'openning delimeter ❯ does not have closing';
  var got = _.ct.strip( 'this  ❮ \nbackground:red\t❯ is ❮ background:default   ❯  text  and  ❯  is not\n' );
  var expected = 'this   is   text  and  ❯  is not\n';
  test.identical( got, expected );

  test.case = 'two inlined substrings is not in fact inlined';
  var got = _.ct.strip( '\n❮\n\t simple  ❯ \n\t\rtext ❮  background:red  ❯  is  ❮  background:default  ❯ text and ❯ is not   ❯' );
  var expected = '\n \n\t\rtext   is   text and ❯ is not   ❯';
  test.identical( got, expected );

  test.case = 'inlined at the beginning and false inlined';
  var got = _.ct.strip( '   ❮ \t\tbackground:red  ❯ \n\ni  ❮  s  ❮background:default  ❯\n\r\t  ❯  text\n' );
  var expected = '    \n\ni  ❮  s  \n\r\t  ❯  text\n';
  test.identical( got, expected );

  test.case = 'inlined at the beginning and the end';
  var got = _.ct.strip( '  ❮  background:red  ❯  i  ❯  s  ❮   background:default  ❯  ' );
  var expected = '    i  ❯  s    ';
  test.identical( got, expected );

  test.case = 'empty string left';
  var got = _.ct.strip( '  ❮  ❯\n\nordinary\t\t❮\ninline2 ❯ ' );
  var expected = '  \n\nordinary\t\t ';
  test.identical( got, expected );

  test.case = 'empty string right';
  var got = _.ct.strip( '\t❮\ninline1\r❯\tordinary\n❮\r❯\t' );
  var expected = '\t\tordinary\n\t';
  test.identical( got, expected );

  test.case = 'empty string middle';
  var got = _.ct.strip( '  ❯  inline1  ❮  ❯  inline2  ❮' );
  var expected = '  ❯  inline1    inline2  ❮';
  test.identical( got, expected );

  test.case = 'empty all';
  var got = _.ct.strip( '\n❮\n❯\n❮\n❯\r' );
  var expected = '\n\n\r';
  test.identical( got, expected );

  test.close( 'with space symbols' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong type of srcStr';
  test.shouldThrowErrorSync( () => _.ct.strip( undefined ) );
  test.shouldThrowErrorSync( () => _.ct.strip( {} ) );
}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Ct',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // l0/l8/Ct.s

    strip,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
