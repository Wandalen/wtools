( function _l0_l1_Str_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  require( '../Include1.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

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
//
// --

//

function strShort_Special( test )
{

  /* */

  test.case = 'no cutting';
  var src = 'a13';
  var widthLimit = 1;
  var got = _.strShort_({ src, onLength, widthLimit });
  var expected = 'a13';
  test.identical( got.result, expected );

  /* */

  function onLength( src )
  {
    src = src.replace( /13/mg, '' );
    return src.length;
  }

}

//

function strShort_( test )
{

  test.case = 'nothing to cut = limit';
  var src = { src : 'string', widthLimit : 6 }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'string' );

  test.case = 'nothing to cut < limit';
  var src = { src : 'string', widthLimit : 7 }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'string' );

  //

  test.case = 'nothing to cut = limit, with delimeter';
  var src = { src : 'string', widthLimit : 6, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'str.ng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'nothing to cut < limit, with delimeter';
  var src = { src : 'string', widthLimit : 7, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'string' );

  //

  test.open( 'change src' );

  test.case = 'src is empty string';
  var src = { src : '', widthLimit : 4 }
  var got = _.strShort_( src );
  var expected = '';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, '' );

  test.case = 'src length > widthLimit';
  var src = { src : 'string', widthLimit : 4 }
  var got = _.strShort_( src );
  var expected = 'stng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'src length > widthLimit & src length is odd, widthLimit = 1';
  var src = { src : 'pie', widthLimit : 1 }
  var got = _.strShort_( src );
  var expected = 'p';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'pie' );

  test.case = 'src length > widthLimit & src length is even, widthLimit = 1';
  var src = { src : 'apie', widthLimit : 1 }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'apie' );

  test.case = 'src length < widthLimit';
  var src = { src : 'pie', widthLimit : 4 }
  var got = _.strShort_( src );
  var expected = 'pie';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'pie' );

  test.case = 'src length = widthLimit';
  var src = { src : 'pie', widthLimit : 4 }
  var got = _.strShort_( src );
  var expected = 'pie';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'pie' );

  test.close( 'change src' );

  /* - */

  test.open( 'change widthLimit' );

  test.case = 'widthLimit = 0';
  var src = { src : 'string', widthLimit : 0 }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'string' );

  test.case = 'src length > widthLimit, widthLimit = 3';
  var src = { src : 'string', widthLimit : 3 }
  var got = _.strShort_( src );
  var expected = 'stg';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'src length > widthLimit, widthLimit = 3';
  var src = { src : '{- Map.pure with 0 elements -}', widthLimit : 10 }
  var got = _.strShort_( src );
  var expected = '{- Mats -}';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '{- Map.pure with 0 elements -}' );

  test.close( 'change widthLimit' );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strShort_( 1, 5 );
  });

  test.case = 'invalid second argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strShort_( 'string', '0' );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strShort_();
  });

  test.case = 'unknown property provided';
  test.shouldThrowErrorSync( function()
  {
    _.strShort_({ src : 'string', widthLimit : 4, fixed : 5 });
  });

}

//

function strShort_OptionDelimeter( test )
{

  test.case = 'infix is empty string';
  var src = { src : 'string', widthLimit : 5, delimeter : '' }
  var got = _.strShort_( src );
  var expected = 'strng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'infix is default';
  var src = { src : 'string', widthLimit : 5, delimeter : 1 }
  var got = _.strShort_( src );
  var expected = 's...g';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'infix < widthLimit';
  var src = { src : 'string', widthLimit : 5, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'st.ng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'infix < widthLimit, even length in the output';
  var src = { src : 'string', widthLimit : 4, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'st.g';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'infix = widthLimit + 1';
  var src = { src : 'string', widthLimit : 5, delimeter : '..'+'..' }
  var got = _.strShort_( src );
  var expected = 's..'+'..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'infix = widthLimit';
  var src = { src : 'string', widthLimit : 5, delimeter : '..'+'..'+'.' }
  var got = _.strShort_( src );
  var expected = '..'+'..'+'.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  test.case = 'infix > widthLimit';
  var src = { src : 'string', widthLimit : 5, delimeter : '..'+'..'+'..'+'..'+'..' }
  var got = _.strShort_( src );
  var expected = '..'+'..'+'.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string' );

  /* delimeter multiline */

  test.case = 'infix is empty string';
  var src = { src : 'string\nstring\nstring\nstring', widthLimit : 5, delimeter : '' }
  var got = _.strShort_( src );
  var expected = 'strng\nstrng\nstrng\nstrng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string\nstring\nstring\nstring' );

  test.case = 'infix is default';
  var src = { src : 'string\nstring\nstring\nstring', widthLimit : 5, delimeter : 1 }
  var got = _.strShort_( src );
  var expected = 's...g\ns...g\ns...g\ns...g';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string\nstring\nstring\nstring' );

  test.case = 'infix < widthLimit';
  var src = { src : 'string\nstring\nstring\nstring', widthLimit : 5, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'st.ng\nst.ng\nst.ng\nst.ng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string\nstring\nstring\nstring' );

  test.case = 'infix < widthLimit, even length in the output';
  var src = { src : 'string\nstring\nstring\nstring', widthLimit : 4, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'st.g\nst.g\nst.g\nst.g';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string\nstring\nstring\nstring' );

  test.case = 'infix = widthLimit + 1';
  var src = { src : 'string\nstring\nstring\nstring', widthLimit : 5, delimeter : '..'+'..' }
  var got = _.strShort_( src );
  var expected = 's..'+'..' + '\n' + 's..'+'..' + '\n' + 's..'+'..' + '\n' + 's..'+'..' ;
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string\nstring\nstring\nstring' );

  test.case = 'infix = widthLimit';
  var src = { src : 'string\nstring\nstring\nstring', widthLimit : 5, delimeter : '..'+'..'+'.' }
  var got = _.strShort_( src );
  var expected = '..'+'..'+'.' + '\n' + '..'+'..'+'.' + '\n' + '..'+'..'+'.' + '\n' + '..'+'..'+'.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string\nstring\nstring\nstring' );

  test.case = 'infix > widthLimit';
  var src = { src : 'string\nstring\nstring\nstring', widthLimit : 5, delimeter : '..'+'..'+'..'+'..'+'..' }
  var got = _.strShort_( src );
  var expected = '..'+'..'+'.' + '\n' + '..'+'..'+'.' + '\n' + '..'+'..'+'.' + '\n' + '..'+'..'+'.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'string\nstring\nstring\nstring' );

}

//

function strShort_OptionsOnLength( test )
{
  test.case = 'true length is smaller, cutting : center';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '1' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '202020';
  test.identical( got.result, expected );

  test.case = 'true length is smaller, cutting : left';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    cutting : 'left',
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '1' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '202020';
  test.identical( got.result, expected );

  test.case = 'true length is smaller, cutting : right';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    cutting : 'right',
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '1' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '202020';
  test.identical( got.result, expected );

  test.case = 'true length is the same, cutting center';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '10' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '200';
  test.identical( got.result, expected );

  test.case = 'true length is the same, cutting left';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    cutting : 'left',
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '10' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '020';
  test.identical( got.result, expected );

  test.case = 'true length is the same, cutting right';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    cutting : 'right',
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '10' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '202';
  test.identical( got.result, expected );

  test.case = 'true length is bigger, cutting center';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '100' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '20';
  test.identical( got.result, expected );

  test.case = 'true length is bigger, cutting left';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    cutting : 'left',
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '100' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '20';
  test.identical( got.result, expected );

  test.case = 'true length is bigger, cutting right';
  var src =
  {
    src : '202020',
    widthLimit : 3,
    cutting : 'right',
    onLength : ( src ) =>
    {
      src = src.replace( /20/mg, '100' );
      return src.length;
    }
  }
  var got = _.strShort_( src )
  var expected = '20';
  test.identical( got.result, expected );

  /* left */

  test.case = 'same characters as 1 el, cut left';
  var src =
  {
    src : 'abbcc' + 'cdd' + 'dd',
    widthLimit : 2,
    cutting : 'left',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'cc'+'cdd'+'dd';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, cut left, big input';
  var src =
  {
    src : '--' + '--' + '-2323aa' + 'aabb' + 'bb' + 'b00' + '0011' + '1122' + '233' + '3cc' + 'cdd' + 'dd',
    widthLimit : 2,
    cutting : 'left',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'cc'+'cd'+'dd'+'d';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, cut left, big input, big width';
  var src =
  {
    src : '--' + '--' + '-2323aa' + 'aabb' + 'bb' + 'b00' + '0011' + '1122' + '233' + '3cc' + 'cdd' + 'dd',
    widthLimit : 8,
    cutting : 'left',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'aa'+'aa'+'bb'+'bb'+'b00'+'001'+'11'+'122'+'233'+'3cc'+'cdd'+'dd';
  test.identical( got.result, expected );

  /* right */

  test.case = 'same characters as 1 el, cut right';
  var src =
  {
    src : 'abbcc'+'cdd'+'dd',
    widthLimit : 2,
    cutting : 'right',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'abb';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, cut right, big input';
  var src =
  {
    src : '--'+'--'+'-22'+'22aa'+'aab'+'bb'+'bb00'+'0011'+'1122'+'233'+'3cc'+'cdd'+'dd',
    widthLimit : 2,
    cutting : 'right',
    onLength
  }
  var got = _.strShort_( src )
  var expected = '--'+'--'+'-22'+'22';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, cut right, big input, big width';
  var src =
  {
    src : '--'+'--'+'-22'+'22aa'+'aab'+'bb'+'bb00'+'0011'+'1122'+'23'+'33cc'+'cdd'+'dd',
    widthLimit : 8,
    cutting : 'right',
    onLength
  }
  var got = _.strShort_( src )
  var expected = '--'+'--'+'-22'+'22aa'+'aabb'+'bb'+'b00'+'0011'+'1122'+'233'+'3';
  test.identical( got.result, expected );

  /* cut middle */

  test.case = 'same characters as 1 el, cut middle';
  var src =
  {
    src : 'abbcc'+'cdd'+'dd',
    widthLimit : 2,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'add'+'dd';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, 5 characters, cut middle';
  var src =
  {
    src : 'abcde',
    widthLimit : 4,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'abde';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, 4 characters, cut middle';
  var src =
  {
    src : 'abde',
    widthLimit : 3,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'abe';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, big str, cut middle';
  var src =
  {
    src : 'aabbcc'+'cc'+'cc'+'cc'+'c11'+'122'+'233'+'3dd'+'dee'+'e',
    widthLimit : 4,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'aabbdd'+'dee'+'e';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, big str, check overcut , cut middle';
  var src =
  {
    src : 'aa'+'aa'+'aabcdftgee'+'ee'+'ee'+'e',
    widthLimit : 4,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'aa'+'aa'+'aa'+'bge'+'ee'+'ee'+'ee';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, 3 characters, cut middle';
  var src =
  {
    src : 'abc',
    widthLimit : 2,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'ac';
  test.identical( got.result, expected );

  /* */

  test.case = 'same characters as 1 el, cut middle, odd width';
  var src =
  {
    src : 'abbcc'+'cdd'+'dd',
    widthLimit : 3,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'abbdd'+'dd';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, 5 characters, cut middle, odd width';
  var src =
  {
    src : 'abcde',
    widthLimit : 3,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'abe';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, big str, cut middle, odd width';
  var src =
  {
    src : 'aabbcc'+'cc'+'cc'+'cc'+'c11'+'122'+'233'+'3dd'+'dee'+'e',
    widthLimit : 5,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'aabbcc'+'cc'+'cc'+'cc'+'cdd'+'dee'+'e';
  test.identical( got.result, expected );

  test.case = 'same characters as 1 el, 3 characters, cut middle, odd width';
  var src =
  {
    src : 'abc',
    widthLimit : 1,
    cutting : 'middle',
    onLength
  }
  var got = _.strShort_( src )
  var expected = 'a';
  test.identical( got.result, expected );

  /* - */

  function onLength( src )
  {
    let match = src.match( /(.)\1*/g ); /* match one character or same characters repeating as 1 */

    if( match === null ) /* prefix, postfix, infix */
    return src.length;

    return match.length;
  }

}

//

function strShort_OptionCutting( test )
{
  test.open( 'cutting : left' )

  test.case = 'cut nothing';
  var src = { src : 'string', widthLimit : 6, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );

  test.case = 'cut 1 letter';
  var src = { src : 'string', widthLimit : 5, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'tring';
  test.identical( got.result, expected );

  test.case = 'cut a few letters';
  var src = { src : 'string', widthLimit : 3, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'ing';
  test.identical( got.result, expected );

  test.case = 'cut nothing, widthLimit : 0';
  var src = { src : 'string', widthLimit : 0, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );

  test.case = 'cut to 1, widthLimit : 1';
  var src = { src : 'string', widthLimit : 1, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'g';
  test.identical( got.result, expected );

  test.case = 'cut to 1, widthLimit : 1';
  var src = { src : 'ab', widthLimit : 1, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'b';
  test.identical( got.result, expected );

  test.close( 'cutting : left' )

  /* - */

  test.open( 'cutting : right' )

  test.case = 'cut nothing';
  var src = { src : 'string', widthLimit : 6, cutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );

  test.case = 'cut 1 letter';
  var src = { src : 'string', widthLimit : 5, cutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'strin';
  test.identical( got.result, expected );

  test.case = 'cut a few letters';
  var src = { src : 'string', widthLimit : 3, cutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'str';
  test.identical( got.result, expected );

  test.case = 'cut nothing';
  var src = { src : 'string', widthLimit : 0, cutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );

  test.case = 'cut to 1, widthLimit : 1';
  var src = { src : 'string', widthLimit : 1, cutting : 'right' }
  var got = _.strShort_( src );
  var expected = 's';
  test.identical( got.result, expected );

  test.case = 'cut to 1, widthLimit : 1';
  var src = { src : 'ab', widthLimit : 1, cutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  test.close( 'cutting : right' )

  /* - */

  test.open( 'cutting : center' )

  test.case = 'cut nothing';
  var src = { src : 'string', widthLimit : 6, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );

  test.case = 'cut 1 letter';
  var src = { src : 'string', widthLimit : 5, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'strng';
  test.identical( got.result, expected );

  test.case = 'cut a few letters';
  var src = { src : 'string', widthLimit : 3, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'stg';
  test.identical( got.result, expected );

  test.case = 'cut nothing';
  var src = { src : 'string', widthLimit : 0, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );

  test.case = 'cut to 1, widthLimit : 1';
  var src = { src : 'string', widthLimit : 1, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 's';
  test.identical( got.result, expected );

  test.case = 'cut to 1, widthLimit : 1';
  var src = { src : 'ab', widthLimit : 1, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  test.close( 'cutting : center' )

}

//


function strShort_OptionHeightCutting( test )
{
  test.case = 'cut 1 symbol left, cut 1 line left';
  var src = { src : 'ab\ncd\neg', widthLimit : 1, heightLimit : 2, cutting : 'left', heightCutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'd\ng';
  test.identical( got.result, expected );

  test.case = 'cut 1 symbol left, cut 1 line right';
  var src = { src : 'ab\ncd\neg', widthLimit : 1, heightLimit : 2, cutting : 'left', heightCutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'b\nd';
  test.identical( got.result, expected );

  test.case = 'cut 1 symbol left, cut 1 line center';
  var src = { src : 'ab\ncd\neg', widthLimit : 1, heightLimit : 2, cutting : 'left', heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'b\ng';
  test.identical( got.result, expected );

  //

  test.case = 'cut 1 symbol right, cut 1 line left';
  var src = { src : 'ab\ncd\neg', widthLimit : 1, heightLimit : 2, cutting : 'right', heightCutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'c\ne';
  test.identical( got.result, expected );

  test.case = 'cut 1 symbol right, cut 1 line right';
  var src = { src : 'ab\ncd\neg', widthLimit : 1, heightLimit : 2, cutting : 'right', heightCutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'a\nc';
  test.identical( got.result, expected );

  test.case = 'cut 1 symbol right, cut 1 line center';
  var src = { src : 'ab\ncd\neg', widthLimit : 1, heightLimit : 2, cutting : 'right', heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\ne';
  test.identical( got.result, expected );

  //

  test.case = 'cut 1 symbol center, cut 1 line left';
  var src = { src : 'ab1\ncd2\neg3', widthLimit : 2, heightLimit : 2, cutting : 'center', heightCutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'c2\ne3';
  test.identical( got.result, expected );

  test.case = 'cut 1 symbol center, cut 1 line right';
  var src = { src : 'ab1\ncd2\neg3', widthLimit : 2, heightLimit : 2, cutting : 'center', heightCutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'a1\nc2';
  test.identical( got.result, expected );

  test.case = 'cut 1 symbol center, cut 1 line center';
  var src = { src : 'ab1\ncd2\neg3', widthLimit : 2, heightLimit : 2, cutting : 'center', heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a1\ne3';
  test.identical( got.result, expected );

}

//

function strShort_OptionWidthLimit( test )
{

  test.case = 'cut 1 letter, hl : null';
  var src = { src : 'string\nstring\nstring', widthLimit : 5, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'tring\ntring\ntring';
  test.identical( got.result, expected );

  test.case = 'cut 1 letter, hl : null';
  var src = { src : 'string\nstring\nstring', widthLimit : 5, cutting : 'right' }
  var got = _.strShort_( src );
  var expected = 'strin\nstrin\nstrin';
  test.identical( got.result, expected );

  test.case = 'cut 1 letter, hl : null';
  var src = { src : 'string\nstring\nstring', widthLimit : 5, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'strng\nstrng\nstrng';
  test.identical( got.result, expected );

  /* wl */

  test.case = 'a b [c d e] g f, len 7, desired 4';
  var src = { src : 'abcdegf', widthLimit : 4, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'abgf';
  test.identical( got.result, expected );

  test.case = 'a b b [c d e] g f g, len 9, desired 6';
  var src = { src : 'abbcdegfg', widthLimit : 6, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'abbgfg';
  test.identical( got.result, expected );

  test.case = 'a b [c d e g] f, len 7, desired 3';
  var src = { src : 'abcdegf', widthLimit : 3, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'abf';
  test.identical( got.result, expected );

  test.case = 'a b c [d e g] f i, len 8, desired 5';
  var src = { src : 'abcdegfi', widthLimit : 5, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'abcfi';
  test.identical( got.result, expected );

  test.case = 'a b [c d e g] f i, len 8, desired 4';
  var src = { src : 'abcdegfi', widthLimit : 4, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'abfi';
  test.identical( got.result, expected );

  test.case = 'a b [c] d, len 4';
  var src = { src : 'abcd', widthLimit : 3, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'abd';
  test.identical( got.result, expected );

  test.case = 'a [bc] d, len 4';
  var src = { src : 'abcd', widthLimit : 2, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'ad';
  test.identical( got.result, expected );

  test.case = 'a [bcd], len 4';
  var src = { src : 'abcd', widthLimit : 1, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  test.case = 'a [b] i, len 3, desired 2';
  var src = { src : 'abi', widthLimit : 2, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'ai';
  test.identical( got.result, expected );

  test.case = 'a [i], len 2, desired 1';
  var src = { src : 'ai', widthLimit : 1, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  test.case = 'a';
  var src = { src : 'a', widthLimit : 1, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  test.case = 'abcde, wl : 0';
  var src = { src : 'abcde', widthLimit : 0, cutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'abcde';
  test.identical( got.result, expected );

}

//

function strShort_OptionHeightLimit( test )
{
  /* heightCutting : center */

  test.case = 'a b [c d e] g f, len 7, desired 4';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf', heightLimit : 4, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\nb\ng\nf';
  test.identical( got.result, expected );

  test.case = 'a b b [c d e] g f g, len 9, desired 6';
  var src = { src : 'a\nb\nb\nc\nd\ne\ng\nf\ng', heightLimit : 6, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\nb\nb\ng\nf\ng';
  test.identical( got.result, expected );

  test.case = 'a b [c d e g] f, len 7, desired 3';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf', heightLimit : 3, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\nb\nf';
  test.identical( got.result, expected );

  test.case = 'a b c [d e g] f i, len 8, desired 5';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf\ni', heightLimit : 5, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\nb\nc\nf\ni';
  test.identical( got.result, expected );

  test.case = 'a b [c d e g] f i, len 8, desired 4';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf\ni', heightLimit : 4, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\nb\nf\ni';
  test.identical( got.result, expected );

  test.case = 'a b [c] d, len 4';
  var src = { src : 'a\nb\nc\nd', heightLimit : 3, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\nb\nd';
  test.identical( got.result, expected );

  test.case = 'a [bc] d, len 4';
  var src = { src : 'a\nb\nc\nd', heightLimit : 2, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\nd';
  test.identical( got.result, expected );

  test.case = 'a [bcd], len 4';
  var src = { src : 'a\nb\nc\nd', heightLimit : 1, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  test.case = 'a [b] i, len 3, desired 2';
  var src = { src : 'a\nb\ni', heightLimit : 2, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a\ni';
  test.identical( got.result, expected );

  test.case = 'a [i], len 2, desired 1';
  var src = { src : 'a\ni', heightLimit : 1, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  test.case = 'a';
  var src = { src : 'a', heightLimit : 1, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = 'a';
  test.identical( got.result, expected );

  /* empty str from both sides */

  test.case = 'a b [c d e] g f, len 7, desired 4';
  var src = { src : '\na\nb\nc\nd\ne\ng\nf\n', heightLimit : 4, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '\na\nf\n';
  test.identical( got.result, expected );

  test.case = 'a b b [c d e] g f g, len 9, desired 6';
  var src = { src : '\na\nb\nb\nc\nd\ne\ng\nf\ng\n', heightLimit : 6, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '\na\nb\nf\ng\n';
  test.identical( got.result, expected );

  test.case = 'a b [c d e g] f, len 7, desired 3';
  var src = { src : '\na\nb\nc\nd\ne\ng\nf\n', heightLimit : 3, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '\na\n';
  test.identical( got.result, expected );

  test.case = 'a b [c] d, len 4';
  var src = { src : '\na\nb\nc\nd\n', heightLimit : 3, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '\na\n';
  test.identical( got.result, expected );

  test.case = 'a [bc] d, len 4';
  var src = { src : '\na\nb\nc\nd\n', heightLimit : 2, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '\n';
  test.identical( got.result, expected );

  test.case = 'a [bcd], len 4';
  var src = { src : '\na\nb\nc\nd\n', heightLimit : 1, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '';
  test.identical( got.result, expected );

  test.case = 'a [b] i, len 3, desired 2';
  var src = { src : '\na\nb\ni\n', heightLimit : 2, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '\n';
  test.identical( got.result, expected );

  test.case = 'a [i], len 2, desired 1';
  var src = { src : '\na\ni\n', heightLimit : 1, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '';
  test.identical( got.result, expected );

  test.case = 'a';
  var src = { src : '\na\n', heightLimit : 1, heightCutting : 'center' }
  var got = _.strShort_( src );
  var expected = '';
  test.identical( got.result, expected );

  /* hl : 0 */

  test.case = 'cut nothing, hl : 0';
  var src = { src : 'string\nstring\nstring\n', widthLimit : 6, heightLimit : 0, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'string\nstring\nstring\n';
  test.identical( got.result, expected );

  test.case = 'cut 1 letter, hl : 0';
  var src = { src : 'string\nstring\nstring\n', widthLimit : 5, heightLimit : 0, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'tring\ntring\ntring\n';
  test.identical( got.result, expected );

  test.case = 'cut a few letters, hl : 0, empty str at the end';
  var src = { src : 'string\nstring\nstring\n', widthLimit : 3, heightLimit : 0, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'ing\ning\ning\n';
  test.identical( got.result, expected );

  test.case = 'cut a few letters, hl : 0, empty str at the start and end';
  var src = { src : '\nstring\nstring\nstring\n', widthLimit : 3, heightLimit : 0, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = '\ning\ning\ning\n';
  test.identical( got.result, expected );

  test.case = 'hl : 0, wl < str overall, wl = 1 line length';
  var src = { src : 'ab\ncd\neg', widthLimit : 2, heightLimit : 0, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'ab\ncd\neg';
  test.identical( got.result, expected );

  test.case = 'cut 1 symbol, hl : 0, wl < str overall, wl = 1 line length';
  var src = { src : 'ab\ncd\neg', widthLimit : 1, heightLimit : 0, cutting : 'left' }
  var got = _.strShort_( src );
  var expected = 'b\nd\ng';
  test.identical( got.result, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong heightLimit'
  test.shouldThrowErrorSync( () => _.strShort_({ src : 'abc', heightLimit : 'hello' }) )
  test.shouldThrowErrorSync( () => _.strShort_({ src : 'abc', heightLimit : -5 }) )

}

//

function strShort_OptionsCombination( test )
{

  test.case = 'src is empty, delimeter < widthLimit'
  var src = { src : '', widthLimit : 3, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = '';
  test.identical( got.result, expected );

  /* */

  test.case = 'src is empty, delimeter = widthLimit'
  var src = { src : '', widthLimit : 3, delimeter : '...' }
  var got = _.strShort_( src );
  var expected = '';
  test.identical( got.result, expected );

  test.case = 'src is empty, delimeter = widthLimit'
  var src = { src : '\n\n', widthLimit : 3, delimeter : '...' }
  var got = _.strShort_( src );
  var expected = '...\n...\n...';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  /* */

  test.case = 'src is not empty, delimeter < widthLimit'
  var src = { src : 'abc', widthLimit : 4, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'abc';
  test.identical( got.result, expected );

  /* multiline */

  test.case = 'src is empty, delimeter < widthLimit'
  var src = { src : '\n\n\n', widthLimit : 3, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = '\n\n\n';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'src is not empty, delimeter < widthLimit'
  var src = { src : 'abc\nabc\nabc', widthLimit : 4, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'abc\nabc\nabc';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  /* */

  test.case = 'src = widthLimit - 1, delimeter length = 1';
  var src = { src : 'string', widthLimit : 7, delimeter : '.' }
  var got = _.strShort_( src );
  var expected = 'string';
  test.identical( got.result, expected );

  /* */

  test.case = 'cutting : left, heightCutting : left';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'left',
    heightCutting : 'left'
  }
  var got = _.strShort_( src );
  var expected = '*\n.78\n.90';
  test.identical( got.result, expected );

  test.case = 'cutting : left, heightCutting : right';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'left',
    heightCutting : 'right'
  }
  var got = _.strShort_( src );
  var expected = '.12\n.34\n*';
  test.identical( got.result, expected );

  test.case = 'cutting : left, heightCutting : center';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'left',
    heightCutting : 'center'
  }
  var got = _.strShort_( src );
  var expected = '.12\n*\n.90';
  test.identical( got.result, expected );

  //

  test.case = 'cutting : right, heightCutting : left';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'right',
    heightCutting : 'left'
  }
  var got = _.strShort_( src );
  var expected = '*\ngh.\nkl.';
  test.identical( got.result, expected );

  test.case = 'cutting : right, heightCutting : right';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'right',
    heightCutting : 'right'
  }
  var got = _.strShort_( src );
  var expected = 'ab.\ncd.\n*';
  test.identical( got.result, expected );

  test.case = 'cutting : right, heightCutting : center';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'right',
    heightCutting : 'center'
  }
  var got = _.strShort_( src );
  var expected = 'ab.\n*\nkl.';
  test.identical( got.result, expected );

  //

  test.case = 'cutting : center, heightCutting : left';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'center',
    heightCutting : 'left'
  }
  var got = _.strShort_( src );
  var expected = '*\ng.8\nk.0';
  test.identical( got.result, expected );

  test.case = 'cutting : center, heightCutting : right';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'center',
    heightCutting : 'right'
  }
  var got = _.strShort_( src );
  var expected = 'a.2\nc.4\n*';
  test.identical( got.result, expected );

  test.case = 'cutting : center, heightCutting : center';
  var src =
  {
    src : 'ab12\ncd34\nef56\ngh78\nkl90',
    widthLimit : 3,
    heightLimit : 3,
    delimeter : '.',
    heightDelimeter : '*',
    cutting : 'center',
    heightCutting : 'center'
  }
  var got = _.strShort_( src );
  var expected = 'a.2\n*\nk.0';
  test.identical( got.result, expected );

}


//

function strShortWidth( test )
{

  test.case = 'a b [c d e] g f, len 7, desired 4';
  var src = { src : 'abcdegf', limit : 4, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'abgf';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abcdegf' );

  test.case = 'a b b [c d e] g f g, len 9, desired 6';
  var src = { src : 'abbcdegfg', limit : 6, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'abbgfg';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abbcdegfg' );

  test.case = 'a b [c d e g] f, len 7, desired 3';
  var src = { src : 'abcdegf', limit : 3, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'abf';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abcdegf' );

  test.case = 'a b c [d e g] f i, len 8, desired 5';
  var src = { src : 'abcdegfi', limit : 5, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'abcfi';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abcdegfi' );

  test.case = 'a b [c d e g] f i, len 8, desired 4';
  var src = { src : 'abcdegfi', limit : 4, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'abfi';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abcdegfi' );

  test.case = 'a b [c] d, len 4';
  var src = { src : 'abcd', limit : 3, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'abd';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abcd' );

  test.case = 'a [bc] d, len 4';
  var src = { src : 'abcd', limit : 2, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'ad';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abcd' );

  test.case = 'a [bcd], len 4';
  var src = { src : 'abcd', limit : 1, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abcd' );

  test.case = 'a [b] i, len 3, desired 2';
  var src = { src : 'abi', limit : 2, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'ai';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'abi' );

  test.case = 'a [i], len 2, desired 1';
  var src = { src : 'ai', limit : 1, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'ai' );

  test.case = 'a';
  var src = { src : 'a', limit : 1, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'a' );

  test.case = 'abcde, wl : 0';
  var src = { src : 'abcde', limit : 0, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'abcde';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'abcde' );

}

//

function strShortWidthOptionCutting( test )
{
  test.case = 'cut 1 letter';
  var src = { src : 'string\nstring\nstring', limit : 5, cutting : 'left' }
  var got = _.strShortWidth( src );
  var expected = 'tring\ntring\ntring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter';
  var src = { src : 'string\nstring\nstring', limit : 5, cutting : 'right' }
  var got = _.strShortWidth( src );
  var expected = 'strin\nstrin\nstrin';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter';
  var src = { src : 'string\nstring\nstring', limit : 5, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'strng\nstrng\nstrng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.open( 'cutting : left' )

  test.case = 'cut nothing';
  var src = { src : 'string', limit : 6, cutting : 'left' }
  var got = _.strShortWidth( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut 1 letter';
  var src = { src : 'string', limit : 5, cutting : 'left' }
  var got = _.strShortWidth( src );
  var expected = 'tring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut a few letters';
  var src = { src : 'string', limit : 3, cutting : 'left' }
  var got = _.strShortWidth( src );
  var expected = 'ing';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut nothing, limit : 0';
  var src = { src : 'string', limit : 0, cutting : 'left' }
  var got = _.strShortWidth( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut to 1, limit : 1';
  var src = { src : 'string', limit : 1, cutting : 'left' }
  var got = _.strShortWidth( src );
  var expected = 'g';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut to 1, limit : 1';
  var src = { src : 'ab', limit : 1, cutting : 'left' }
  var got = _.strShortWidth( src );
  var expected = 'b';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.close( 'cutting : left' )

  /* - */

  test.open( 'cutting : right' )

  test.case = 'cut nothing';
  var src = { src : 'string', limit : 6, cutting : 'right' }
  var got = _.strShortWidth( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut 1 letter';
  var src = { src : 'string', limit : 5, cutting : 'right' }
  var got = _.strShortWidth( src );
  var expected = 'strin';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut a few letters';
  var src = { src : 'string', limit : 3, cutting : 'right' }
  var got = _.strShortWidth( src );
  var expected = 'str';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut nothing';
  var src = { src : 'string', limit : 0, cutting : 'right' }
  var got = _.strShortWidth( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut to 1, limit : 1';
  var src = { src : 'string', limit : 1, cutting : 'right' }
  var got = _.strShortWidth( src );
  var expected = 's';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut to 1, limit : 1';
  var src = { src : 'ab', limit : 1, cutting : 'right' }
  var got = _.strShortWidth( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.close( 'cutting : right' )

  /* - */

  test.open( 'cutting : center' )

  test.case = 'cut nothing';
  var src = { src : 'string', limit : 6, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut 1 letter';
  var src = { src : 'string', limit : 5, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'strng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut a few letters';
  var src = { src : 'string', limit : 3, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'stg';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut nothing';
  var src = { src : 'string', limit : 0, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'string';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut to 1, limit : 1';
  var src = { src : 'string', limit : 1, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 's';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut to 1, limit : 1';
  var src = { src : 'ab', limit : 1, cutting : 'center' }
  var got = _.strShortWidth( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.close( 'cutting : center' );

}

//

function strShortWidthOptionDelimeter( test )
{

  test.case = 'a b [c d e] g f, len 7, desired 4';
  var src = { src : 'abcdegf', limit : 4, cutting : 'center', delimeter : '.' }
  var got = _.strShortWidth( src );
  var expected = 'ab.f';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'a b b [c d e] g f g, len 9, desired 6';
  var src = { src : 'abbcdegfg', limit : 6, cutting : 'center', delimeter : '.' }
  var got = _.strShortWidth( src );
  var expected = 'abb.fg';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'a b [c d e g] f, len 7, desired 3';
  var src = { src : 'abcdegf', limit : 3, cutting : 'center', delimeter : '.' }
  var got = _.strShortWidth( src );
  var expected = 'a.f';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'a b c [d e g] f i, len 8, desired 5';
  var src = { src : 'abcdegfi', limit : 5, cutting : 'center', delimeter : '.' }
  var got = _.strShortWidth( src );
  var expected = 'ab.fi';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'a b [c d e g] f i, len 8, desired 4';
  var src = { src : 'abcdegfi', limit : 4, cutting : 'center', delimeter : '..' }
  var got = _.strShortWidth( src );
  var expected = 'a..i';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'a b [c] d, len 4';
  var src = { src : 'abcd', limit : 3, cutting : 'center', delimeter : '..' }
  var got = _.strShortWidth( src );
  var expected = 'a..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'a [bc] d, len 4';
  var src = { src : 'abcd', limit : 2, cutting : 'center', delimeter : '..' }
  var got = _.strShortWidth( src );
  var expected = '..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'a [bcd], len 4';
  var src = { src : 'abcd', limit : 1, cutting : 'center', delimeter : '....' }
  var got = _.strShortWidth( src );
  var expected = '.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  /* multiline */

  test.case = 'cut 1 letter left';
  var src = { src : 'string\nstring\nstring', limit : 5, cutting : 'left', delimeter : '.' }
  var got = _.strShortWidth( src );
  var expected = '.ring\n.ring\n.ring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter right';
  var src = { src : 'string\nstring\nstring', limit : 5, cutting : 'right', delimeter : '.' }
  var got = _.strShortWidth( src );
  var expected = 'stri.\nstri.\nstri.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter center';
  var src = { src : 'string\nstring\nstring', limit : 5, cutting : 'center', delimeter : '.' }
  var got = _.strShortWidth( src );
  var expected = 'st.ng\nst.ng\nst.ng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  //

  test.case = 'cut 1 letter, delimeter = o.src';
  var src = { src : 'st\nst\nst', limit : 2, cutting : 'left', delimeter : '..' }
  var got = _.strShortWidth( src );
  var expected = '..\n..\n..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter, delimeter = o.src';
  var src = { src : 'st\nst\nst', limit : 2, cutting : 'right', delimeter : '..' }
  var got = _.strShortWidth( src );
  var expected = '..\n..\n..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter, delimeter = o.src';
  var src = { src : 'st\nst\nst', limit : 2, cutting : 'center', delimeter : '..' }
  var got = _.strShortWidth( src );
  var expected = '..\n..\n..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  //

  test.case = 'cut 1 letter, delimeter > o.src';
  var src = { src : 'st\nst\nst', limit : 2, cutting : 'left', delimeter : '...' }
  var got = _.strShortWidth( src );
  var expected = '..\n..\n..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter, delimeter > o.src';
  var src = { src : 'st\nst\nst', limit : 2, cutting : 'right', delimeter : '...' }
  var got = _.strShortWidth( src );
  var expected = '..\n..\n..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 letter, delimeter > o.src';
  var src = { src : 'st\nst\nst', limit : 2, cutting : 'center', delimeter : '...' }
  var got = _.strShortWidth( src );
  var expected = '..\n..\n..';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
}

//

function strShortHeight( test )
{

  test.case = 'cut nothing';
  var src = { src : 'a\nb\nc', limit : 4, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nb\nc';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'a\nb\nc' );

  /* */

  test.case = 'a b [c d e] g f, len 7, desired 4';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf', limit : 4, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nb\ng\nf';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nc\nd\ne\ng\nf' );

  test.case = 'a b b [c d e] g f g, len 9, desired 6';
  var src = { src : 'a\nb\nb\nc\nd\ne\ng\nf\ng', limit : 6, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nb\nb\ng\nf\ng';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nb\nc\nd\ne\ng\nf\ng' );

  test.case = 'a b [c d e g] f, len 7, desired 3';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf', limit : 3, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nb\nf';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nc\nd\ne\ng\nf' );

  test.case = 'a b c [d e g] f i, len 8, desired 5';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf\ni', limit : 5, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nb\nc\nf\ni';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nc\nd\ne\ng\nf\ni' );

  test.case = 'a b [c d e g] f i, len 8, desired 4';
  var src = { src : 'a\nb\nc\nd\ne\ng\nf\ni', limit : 4, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nb\nf\ni';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nc\nd\ne\ng\nf\ni' );

  test.case = 'a b [c] d, len 4';
  var src = { src : 'a\nb\nc\nd', limit : 3, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nb\nd';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nc\nd' );

  test.case = 'a [bc] d, len 4';
  var src = { src : 'a\nb\nc\nd', limit : 2, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\nd';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nc\nd' );

  test.case = 'a [bcd], len 4';
  var src = { src : 'a\nb\nc\nd', limit : 1, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\nc\nd' );

  test.case = 'a [b] i, len 3, desired 2';
  var src = { src : 'a\nb\ni', limit : 2, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a\ni';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\nb\ni' );

  test.case = 'a [i], len 2, desired 1';
  var src = { src : 'a\ni', limit : 1, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, 'a\ni' );

  test.case = 'a';
  var src = { src : 'a', limit : 1, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'a';
  test.identical( got.result, expected );
  test.identical( got.changed, false );
  test.identical( got.src, 'a' );

  /* empty str from both sides */

  test.case = 'a b [c d e] g f, len 7, desired 4';
  var src = { src : '\na\nb\nc\nd\ne\ng\nf\n', limit : 4, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '\na\nf\n';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\nb\nc\nd\ne\ng\nf\n' );

  test.case = 'a b b [c d e] g f g, len 9, desired 6';
  var src = { src : '\na\nb\nb\nc\nd\ne\ng\nf\ng\n', limit : 6, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '\na\nb\nf\ng\n';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\nb\nb\nc\nd\ne\ng\nf\ng\n' );

  test.case = 'a b [c d e g] f, len 7, desired 3';
  var src = { src : '\na\nb\nc\nd\ne\ng\nf\n', limit : 3, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '\na\n';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\nb\nc\nd\ne\ng\nf\n' );

  test.case = 'a b [c] d, len 4';
  var src = { src : '\na\nb\nc\nd\n', limit : 3, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '\na\n';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\nb\nc\nd\n' );

  test.case = 'a [bc] d, len 4';
  var src = { src : '\na\nb\nc\nd\n', limit : 2, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '\n';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\nb\nc\nd\n' );

  test.case = 'a [bcd], len 4';
  var src = { src : '\na\nb\nc\nd\n', limit : 1, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\nb\nc\nd\n' );

  test.case = 'a [b] i, len 3, desired 2';
  var src = { src : '\na\nb\ni\n', limit : 2, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '\n';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\nb\ni\n' );

  test.case = 'a [i], len 2, desired 1';
  var src = { src : '\na\ni\n', limit : 1, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\ni\n' );

  test.case = 'a';
  var src = { src : '\na\n', limit : 1, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = '';
  test.identical( got.result, expected );
  test.identical( got.changed, true );
  test.identical( got.src, '\na\n' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong limit'
  test.shouldThrowErrorSync( () => _.strShortHeight({ src : 'abc', limit : 'hello' }) )
  test.shouldThrowErrorSync( () => _.strShortHeight({ src : 'abc', limit : -5 }) )

}

//

function strShortHeightOptionCutting( test )
{
  test.case = 'cut 1 line left';
  var src = { src : 'ab\ncd\neg', limit : 2, cutting : 'left' }
  var got = _.strShortHeight( src );
  var expected = 'cd\neg';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 line right';
  var src = { src : 'ab\ncd\neg', limit : 2, cutting : 'right' }
  var got = _.strShortHeight( src );
  var expected = 'ab\ncd';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 1 line center';
  var src = { src : 'ab\ncd\neg', limit : 2, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'ab\neg';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  /*  */

  test.case = 'cut 2 lines left';
  var src = { src : 'ab\ncd\neg', limit : 1, cutting : 'left' }
  var got = _.strShortHeight( src );
  var expected = 'eg';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 2 lines right';
  var src = { src : 'ab\ncd\neg', limit : 1, cutting : 'right' }
  var got = _.strShortHeight( src );
  var expected = 'ab';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut 2 lines center';
  var src = { src : 'ab\ncd\neg', limit : 1, cutting : 'center' }
  var got = _.strShortHeight( src );
  var expected = 'ab';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

}

//

function strShortHeightOptionDelimeter( test )
{

  test.case = 'cut left, o.limit=1';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 1, cutting : 'left', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = '.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut right, o.limit=1';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 1, cutting : 'right', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = '.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut center, o.limit=1';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 1, cutting : 'center', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = '.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  //

  test.case = 'cut left, o.limit=2';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 2, cutting : 'left', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = '.\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut right, o.limit=2';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 2, cutting : 'right', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\n.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut center, o.limit=2';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 2, cutting : 'center', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\n.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  //

  test.case = 'cut left, o.limit=3';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 3, cutting : 'left', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = '.\nstring\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut right, o.limit=3';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 3, cutting : 'right', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring\n.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut center, o.limit=3';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 3, cutting : 'center', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\n.\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  //

  test.case = 'cut left, o.limit=4';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 4, cutting : 'left', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = '.\nstring\nstring\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut right, o.limit=4';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 4, cutting : 'right', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring\nstring\n.';
  test.identical( got.result, expected );
  test.identical( got.changed, true );

  test.case = 'cut center, o.limit=4';
  var src = { src : 'string\nstring\nstring\nstring\nstring\nstring\nstring\nstring', limit : 4, cutting : 'center', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring\n.\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, true );


  //

  test.case = 'cut left, o.limit > str.length, delimeter is not placed';
  var src = { src : 'string\nstring', limit : 4, cutting : 'left', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut right, o.limit > str.length, delimeter is not placed';
  var src = { src : 'string\nstring', limit : 4, cutting : 'right', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut center, o.limit > str.length, delimeter is not placed';
  var src = { src : 'string\nstring', limit : 4, cutting : 'center', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  //

  test.case = 'cut left, o.limit = str.length, delimeter is not placed';
  var src = { src : 'string\nstring', limit : 4, cutting : 'left', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut right, o.limit = str.length, delimeter is not placed';
  var src = { src : 'string\nstring', limit : 4, cutting : 'right', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

  test.case = 'cut center, o.limit = str.length, delimeter is not placed';
  var src = { src : 'string\nstring', limit : 4, cutting : 'center', delimeter : '.' }
  var got = _.strShortHeight( src );
  var expected = 'string\nstring';
  test.identical( got.result, expected );
  test.identical( got.changed, false );

}

// function strShort_Performance( test )
// {
//   /*
//     |     **Routine**     |  type   | **Njs : v10.23.0** | **Njs : v12.9.1** | **Njs : v13.14.0** | **Njs : v14.15.1** | **Njs : v15.4.0** |
//     | :-----------------: | :-----: | :----------------: | :---------------: | :----------------: | :----------------: | :---------------: |
//     |    strShort_ BISI    | regular |      6.5488s       |      5.2201s      |      5.5969s       |      5.1944s       |      5.2801s      |
//     | strShort_Binary BISI | binary  |      0.0036s       |      0.0032s      |      0.0029s       |      0.0026s       |      0.0025s      |
//     |    strShort_ SIBI    | regular |     0.003011s      |     0.002554s     |     0.002522s      |     0.002347s      |     0.002528s     |
//     | strShort_Binary SIBI | binary  |     0.000092s      |     0.000092s     |      0.0001s       |     0.000078s      |      0.0001s      |

//     BISI = Big input( length : 1e4 ), small amount of iterations ( 1e1 )
//     SIBI = Small input ( length : 2e2 ), big amount of iterations ( 1e3 )
//   */

//   test.case = 'long string, 10 iterations';
//   var times = 1e1;
//   var size = 1e3;
//   var filler = 'abbcc'+'cdd'+'dd';
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
//     test.identical( resultLeft.result, 'cc'+'cdd'+'dd' );
//     test.identical( resultRigth.result, 'abb' );
//     test.identical( resultCenter.result, 'add'+'dd' );
//   }

//   console.log( `String length = ${stringSize}, iterations = ${times}` );
//   console.log( `Routine BISI took : ${took / ( times * 1000 )}s on Njs ${process.version}` );
//   // console.log( `Counter = ${testing.counter / times / 3 }` );
//   console.log( '----------------------------------------------------' );

//   /* - */

//   test.case = 'short string, 1000 iterations';
//   var times = 1e3;
//   var size = 2e1;
//   var filler = 'abbcc'+'cdd'+'dd';
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
//     test.identical( resultLeft.result, 'cc'+'cdd'+'dd' );
//     test.identical( resultRigth.result, 'abb' );
//     test.identical( resultCenter.result, 'add'+'dd' );
//   }

//   console.log( `String length = ${stringSize}, iterations = ${times}` );
//   console.log( `Routine SIBI took : ${took / ( times * 1000 )}s on Njs ${process.version}` );
//   // console.log( `Counter = ${testing.counter / times / 3}` );
//   console.log( '----------------------------------------------------' );

//   /* - */

//   function act() /* existing implementation with fixed 'center' cutting */
//   {
//     let result1 = _.strShort({ src : string, onLength, widthLimit : 2, cutting : 'left' });
//     let result2 = _.strShort({ src : string, onLength, widthLimit : 2, cutting : 'right' });
//     let result3 = _.strShort({ src : string, onLength, widthLimit : 2, cutting : 'center' });

//     return [ result1, result2, result3 ];
//   }

//   function act2() /* binary search implementation */
//   {
//     let result1 = _.strShort_({ src : string, onLength, widthLimit : 2, cutting : 'left' });
//     let result2 = _.strShort_({ src : string, onLength, widthLimit : 2, cutting : 'right' });
//     let result3 = _.strShort_({ src : string, onLength, widthLimit : 2, cutting : 'center' });

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

// strShort_Performance.timeOut = 1e7;
// strShort_Performance.experimental = true;

// --
//
// --

const Proto =
{

  name : 'Tools.Str.l0.l1',
  silencing : 1,

  tests :
  {

    strBeginOf,
    strEndOf,
    strBegins,
    strEnds,

    strShort_Special,
    strShort_, /* qqq : rewrite and enable */
    strShort_OptionDelimeter,
    strShort_OptionsOnLength,
    strShort_OptionCutting,
    strShort_OptionHeightCutting,
    strShort_OptionWidthLimit,
    strShort_OptionHeightLimit,
    strShort_OptionsCombination,
    strShortWidth,
    strShortWidthOptionCutting,
    strShortWidthOptionDelimeter,
    strShortHeight,
    strShortHeightOptionCutting,
    strShortHeightOptionDelimeter,
    // strShort_Performance,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
