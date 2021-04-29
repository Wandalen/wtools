( function _l0_l3_Str_test_s_()
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
//
// --

function strEquivalent( test )
{
  test.open( 'true' );

  test.case = 'strings';
  var got = _.str.equivalent( 'abc', 'abc' );
  test.identical( got, true );

  // test.case = 'regexp and string';
  // var got = _.str.equivalent( /\w+/, 'abc' );
  // test.identical( got, true );
  //
  // test.case = 'string and regexp';
  // var got = _.str.equivalent( 'abc', /\w+/ );
  // test.identical( got, true );
  //
  // test.case = 'regexp and regexp';
  // var got = _.str.equivalent( /\w+/, /\w+/ );
  // test.identical( got, true );

  test.case = 'string with and without spaces ';
  var got = _.str.equivalent( 'abc', ' abc ' );
  test.identical( got, true );

  test.case = 'string with and without newlines ';
  var got = _.str.equivalent( 'abc', '\nabc\n' );
  test.identical( got, true );

  test.case = 'string with identical newlines';
  var got = _.str.equivalent( '\na\nb\nc\n', '\na\nb\nc\n' );
  test.identical( got, true );

  test.case = 'strings with different newlines';
  var got = _.str.equivalent( '\n\nabc\n', '\nabc\n\n' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs';
  var got = _.str.equivalent( '      \t\n\nabc\n    ', '        \nabc\n\n\t\t           ' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs on each line';
  var got = _.str.equivalent( '      \t\na   \t\n\nb   \t   \n   \nc  \t     ', '        \na  \n  \n  \t   \nb  \t \n   \nc\t \n\n\t\t           ' );
  test.identical( got, true );

  test.case = 'strings with different newlines, spaces and tabs on each line from both sides';
  var got = _.str.equivalent( '      \t\n  \ta   \t\n\n  \n\t  b   \t   \n   \n  \n  \t  c  \t     ', '        \n  \t a  \n  \n  \t   \n \n  b  \t \n   \n \t c \t \n \n \t \t           ' );
  test.identical( got, true );

  test.close( 'true' );

  /* - */

  test.open( 'false' );

  test.case = 'strings';
  var got = _.str.equivalent( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.str.equivalent( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.str.equivalent( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.str.equivalent( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.str.equivalent( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.str.equivalent( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.str.equivalent( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.str.equivalent( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.case = 'diff strings with different newlines';
  var got = _.str.equivalent( '\n\nabc\nb', '\nabc\n\n' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs';
  var got = _.str.equivalent( '      \t\n\nabc\n    ', '        \nabc\n\n\t\t    c       ' );
  test.identical( got, false );

  test.case = 'diff strings with different newlines, spaces and tabs on each line';
  var got = _.str.equivalent( '      \t\nab   \t\n\nb   \t   \n   \nc  \t     ', '        \na  \n  \n  \t   \nb  \t \n   \nc\t \n\n\t\t           ' );
  test.identical( got, false );

  test.close( 'false' );
}

//

// function strsEquivalent( test )
// {
//   test.open( 'scalar, true' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalent( 'abc', 'abc' );
//   test.identical( got, true );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalent( /\w+/, 'abc' );
//   test.identical( got, true );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalent( 'abc', /\w+/ );
//   test.identical( got, true );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalent( /\w+/, /\w+/ );
//   test.identical( got, true );
//
//   test.close( 'scalar, true' );
//
//   /* - */
//
//   test.open( 'scalar, false' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalent( 'abd', 'abc' );
//   test.identical( got, false );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalent( /\s+/, 'abc' );
//   test.identical( got, false );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalent( /\w/, 'abc' );
//   test.identical( got, false );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalent( 'abc', /\s+/ );
//   test.identical( got, false );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalent( 'abc', /\w/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalent( /\w*/, /\w+/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalent( /\w+/g, /\w+/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalent( /\w+/g, /\w+/gi );
//   test.identical( got, false );
//
//   test.close( 'scalar, false' );
//
//   /* - */
//
//   test.open( 'vector, true' );
//
//   test.case = 'vector, vector';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
//   var got = _.strsEquivalent( src1, src2 );
//   test.identical( got, [ true, true, true, true ] );
//
//   test.case = 'vector, scalar';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = 'abc';
//   var got = _.strsEquivalent( src1, src2 );
//   test.identical( got, [ true, true, true, true ] );
//
//   test.case = 'scalar, vector';
//   var src1 = 'abc';
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalent( src1, src2 );
//   test.identical( got, [ true, true, true, true ] );
//
//   test.close( 'vector, true' );
//
//   /* - */
//
//   test.open( 'vector, false' );
//
//   test.case = 'vector, vector';
//   var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/g ];
//   var src2 = [ 'abc', 'abc', 'abc', /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ];
//   var got = _.strsEquivalent( src1, src2 );
//   test.identical( got, [ false, false, false, false, false, false, false, false ] );
//
//   test.case = 'vector, scalar';
//   var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
//   var src2 = 'abc';
//   var got = _.strsEquivalent( src1, src2 );
//   test.identical( got, [ false, false, false, true, true, true, true, true ] );
//
//   test.case = 'scalar, vector';
//   var src1 = 'abc';
//   var src2 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
//   var got = _.strsEquivalent( src1, src2 );
//   test.identical( got, [ false, false, false, true, true, true, true, true ] );
//
//   test.close( 'vector, false' );
// }
//
// //
//
// function strsEquivalentAll( test )
// {
//   test.open( 'scalar, true' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalentAll( 'abc', 'abc' );
//   test.identical( got, true );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentAll( /\w+/, 'abc' );
//   test.identical( got, true );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentAll( 'abc', /\w+/ );
//   test.identical( got, true );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAll( /\w+/, /\w+/ );
//   test.identical( got, true );
//
//   test.close( 'scalar, true' );
//
//   /* - */
//
//   test.open( 'scalar, false' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalentAll( 'abd', 'abc' );
//   test.identical( got, false );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentAll( /\s+/, 'abc' );
//   test.identical( got, false );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentAll( /\w/, 'abc' );
//   test.identical( got, false );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentAll( 'abc', /\s+/ );
//   test.identical( got, false );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentAll( 'abc', /\w/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAll( /\w*/, /\w+/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAll( /\w+/g, /\w+/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAll( /\w+/g, /\w+/gi );
//   test.identical( got, false );
//
//   test.close( 'scalar, false' );
//
//   /* - */
//
//   test.open( 'vectors, true' );
//
//   test.case = 'mixed vector, scalar - string';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = 'abc';
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'mixed vector, scalar - regexp';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = /\w+/;
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - string, mixed vector';
//   var src1 = 'abc';
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - regexp, mixed vector';
//   var src1 = /\w+/;
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, scalar - string';
//   var src1 = [ /\w+/g, /\w+/gi ];
//   var src2 = 'abc';
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, scalar - regexp';
//   var src1 = [ /\w+/g, /\w+/g ];
//   var src2 = /\w+/g;
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - string, vector of regexp';
//   var src1 = 'abc';
//   var src2 = [ /\w+/g, /\w+/gi ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - regexp, vector of regexp';
//   var src1 = /\w+/g;
//   var src2 = [ /\w+/g, /\w+/g ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of strings, vector of strings';
//   var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
//   var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, vector of strings';
//   var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of strings, vector of regexp';
//   var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
//   var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'mixed vector, mixed vector';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, true );
//
//   test.close( 'vectors, true' );
//
//   /* - */
//
//   test.open( 'vectors, false' );
//
//   test.case = 'mixed vector, scalar - string';
//   var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
//   var src2 = 'abc';
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'mixed vector, scalar - regexp';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
//   var src2 = /\w+/;
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - string, mixed vector';
//   var src1 = 'abc d';
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - regexp, mixed vector';
//   var src1 = /\w+/g;
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, scalar - string';
//   var src1 = [ /\w+/g, /\w+/gi ];
//   var src2 = 'abc d';
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, scalar - regexp';
//   var src1 = [ /\w+/g, /\w+/g ];
//   var src2 = /\w+/gi;
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - string, vector of regexp';
//   var src1 = 'abc d';
//   var src2 = [ /\w+/g, /\w+/gi ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - regexp, vector of regexp';
//   var src1 = /\w+/gi;
//   var src2 = [ /\w+/g, /\w+/g ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of strings, vector of strings';
//   var src1 = [ 'abc', 'abc', 'bb', 'aa' ];
//   var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, vector of strings';
//   var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var src2 = [ 'abc d', 'abc', 'aa', 'bb' ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of strings, vector of regexp';
//   var src1 = [ 'abc d', 'abc', 'aa', 'bb' ];
//   var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'mixed vector, mixed vector';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = [ 'abc', 'abc', /\w+/, /\w+/gi ];
//   var got = _.strsEquivalentAll( src1, src2 );
//   test.identical( got, false );
//
//   test.close( 'vectors, false' );
// }
//
// //
//
// function strsEquivalentAny( test )
// {
//
//   /* - */
//
//   test.open( 'scalar, true' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalentAny( 'abc', 'abc' );
//   test.identical( got, true );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentAny( /\w+/, 'abc' );
//   test.identical( got, true );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentAny( 'abc', /\w+/ );
//   test.identical( got, true );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAny( /\w+/, /\w+/ );
//   test.identical( got, true );
//
//   test.close( 'scalar, true' );
//
//   /* - */
//
//   test.open( 'scalar, false' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalentAny( 'abd', 'abc' );
//   test.identical( got, false );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentAny( /\s+/, 'abc' );
//   test.identical( got, false );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentAny( /\w/, 'abc' );
//   test.identical( got, false );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentAny( 'abc', /\s+/ );
//   test.identical( got, false );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentAny( 'abc', /\w/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAny( /\w*/, /\w+/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAny( /\w+/g, /\w+/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentAny( /\w+/g, /\w+/gi );
//   test.identical( got, false );
//
//   test.close( 'scalar, false' );
//
//   /* - */
//
//   test.open( 'vectors, true' );
//
//   test.case = 'mixed vector, scalar - string';
//   var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
//   var src2 = 'abc';
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'mixed vector, scalar - regexp';
//   var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
//   var src2 = /\w+/;
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - string, mixed vector';
//   var src1 = 'abc d';
//   var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - regexp, mixed vector';
//   var src1 = /\w+/;
//   var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, scalar - string';
//   var src1 = [ /\w+\s\w/g, /\w+/gi ];
//   var src2 = 'abc d';
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, scalar - regexp';
//   var src1 = [ /\w+/, /\w+/g ];
//   var src2 = /\w+/g;
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - string, vector of regexp';
//   var src1 = 'abc';
//   var src2 = [ /\w+/g, /\w+/gi ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - regexp, vector of regexp';
//   var src1 = /\w+/g;
//   var src2 = [ /\w+/gi, /\w+/g ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of strings, vector of strings';
//   var src1 = [ 'abc', 'abc', 'a', 'b' ];
//   var src2 = [ 'ab', 'ab', 'aa', 'b' ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, vector of strings';
//   var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var src2 = [ 'abc', 'abc d', 'aa d', 'bb d' ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of strings, vector of regexp';
//   var src1 = [ 'abc d', 'abc d', 'aa d', 'bb' ];
//   var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'mixed vector, mixed vector';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, true );
//
//   test.close( 'vectors, true' );
//
//   /* - */
//
//   test.open( 'vectors, false' );
//
//   test.case = 'mixed vector, scalar - string';
//   var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
//   var src2 = 'abc d';
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'mixed vector, scalar - regexp';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
//   var src2 = /\w+\s/;
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - string, mixed vector';
//   var src1 = 'abc d';
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - regexp, mixed vector';
//   var src1 = /\w+\s/g;
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, scalar - string';
//   var src1 = [ /\w+/g, /\w+/gi ];
//   var src2 = 'abc d';
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, scalar - regexp';
//   var src1 = [ /\w+/g, /\w+/g ];
//   var src2 = /\w+/gi;
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - string, vector of regexp';
//   var src1 = 'abc d';
//   var src2 = [ /\w+/g, /\w+/gi ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - regexp, vector of regexp';
//   var src1 = /\w+/gi;
//   var src2 = [ /\w+/g, /\w+/g ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of strings, vector of strings';
//   var src1 = [ 'abc', 'abc', 'b', 'a' ];
//   var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, vector of strings';
//   var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of strings, vector of regexp';
//   var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
//   var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'mixed vector, mixed vector';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
//   var got = _.strsEquivalentAny( src1, src2 );
//   test.identical( got, false );
//
//   test.close( 'vectors, false' );
// }
//
// //
//
// function strsEquivalentNone( test )
// {
//
//   /* - */
//
//   test.open( 'scalar, false' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalentNone( 'abc', 'abc' );
//   test.identical( got, false );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentNone( /\w+/, 'abc' );
//   test.identical( got, false );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentNone( 'abc', /\w+/ );
//   test.identical( got, false );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentNone( /\w+/, /\w+/ );
//   test.identical( got, false );
//
//   test.close( 'scalar, false' );
//
//   /* - */
//
//   test.open( 'scalar, true' );
//
//   test.case = 'strings';
//   var got = _.strsEquivalentNone( 'abd', 'abc' );
//   test.identical( got, true );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentNone( /\s+/, 'abc' );
//   test.identical( got, true );
//
//   test.case = 'regexp and string';
//   var got = _.strsEquivalentNone( /\w/, 'abc' );
//   test.identical( got, true );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentNone( 'abc', /\s+/ );
//   test.identical( got, true );
//
//   test.case = 'string and regexp';
//   var got = _.strsEquivalentNone( 'abc', /\w/ );
//   test.identical( got, true );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentNone( /\w*/, /\w+/ );
//   test.identical( got, true );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentNone( /\w+/g, /\w+/ );
//   test.identical( got, true );
//
//   test.case = 'regexp and regexp';
//   var got = _.strsEquivalentNone( /\w+/g, /\w+/gi );
//   test.identical( got, true );
//
//   test.close( 'scalar, true' );
//
//   /* - */
//
//   test.open( 'vectors, true' );
//
//   test.case = 'mixed vector, scalar - string';
//   var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
//   var src2 = 'abc d';
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'mixed vector, scalar - regexp';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
//   var src2 = /\w+\s/;
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - string, mixed vector';
//   var src1 = 'abc d';
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - regexp, mixed vector';
//   var src1 = /\w+\s/g;
//   var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, scalar - string';
//   var src1 = [ /\w+/g, /\w+/gi ];
//   var src2 = 'abc d';
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, scalar - regexp';
//   var src1 = [ /\w+/g, /\w+/g ];
//   var src2 = /\w+/gi;
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - string, vector of regexp';
//   var src1 = 'abc d';
//   var src2 = [ /\w+/g, /\w+/gi ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'scalar - regexp, vector of regexp';
//   var src1 = /\w+/gi;
//   var src2 = [ /\w+/g, /\w+/g ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of strings, vector of strings';
//   var src1 = [ 'abc', 'abc', 'b', 'a' ];
//   var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of regexp, vector of strings';
//   var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'vector of strings, vector of regexp';
//   var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
//   var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.case = 'mixed vector, mixed vector';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, true );
//
//   test.close( 'vectors, true' );
//
//   /* - */
//
//   test.open( 'vectors, false' );
//
//   test.case = 'mixed vector, scalar - string';
//   var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
//   var src2 = 'abc';
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'mixed vector, scalar - regexp';
//   var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
//   var src2 = /\w+/;
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - string, mixed vector';
//   var src1 = 'abc d';
//   var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - regexp, mixed vector';
//   var src1 = /\w+/;
//   var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, scalar - string';
//   var src1 = [ /\w+\s\w/g, /\w+/gi ];
//   var src2 = 'abc d';
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, scalar - regexp';
//   var src1 = [ /\w+/, /\w+/g ];
//   var src2 = /\w+/g;
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - string, vector of regexp';
//   var src1 = 'abc';
//   var src2 = [ /\w+/g, /\w+/gi ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'scalar - regexp, vector of regexp';
//   var src1 = /\w+/g;
//   var src2 = [ /\w+/gi, /\w+/g ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of strings, vector of strings';
//   var src1 = [ 'abc', 'abc', 'aa'+'a', 'bb' ];
//   var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of regexp, vector of strings';
//   var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var src2 = [ 'abc', 'abc d', 'aa'+'a d', 'bb d' ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'vector of strings, vector of regexp';
//   var src1 = [ 'abc d', 'abc d', 'aa'+'a d', 'bb' ];
//   var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.case = 'mixed vector, mixed vector';
//   var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
//   var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
//   var got = _.strsEquivalentNone( src1, src2 );
//   test.identical( got, false );
//
//   test.close( 'vectors, false' );
// }

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
  var src = _.unroll.make([ 2, 3, 4 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  var expected = '{- Array with 3 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'long & longLike';
  var src = _.long.make([ 1, 2 ]);
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'vector & vectorLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var expected = '{- countableConstructor.countable with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = 'countable & countableLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], withIterator : 1 });
  var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = __.diagnostic.objectMake({ /* ttt */ elements : [], withIterator : 1 } );
  var expected = '{- Object.countable with 0 elements -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  test.case = `object countable - non empty, non-vector`;
  var src = __.diagnostic.objectMake({ /* ttt */ elements : [ '1', '2', '3' ], withIterator : 1 } );
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
  var expected = '{- Escape 1 -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

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

  test.case = 'routine & routineLike';
  var src = routine;
  var expected = '{- routine routine -}';
  test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

  // qqq : xxx : uncomment
  // test.case = 'timer';
  // var src = _.time._begin( Infinity );
  // var expected = '{- Map.pure with 9 elements -}';
  // test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );
  // _.time.cancel( src );

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
  //
  // /* qqq : for Yevhen : introduce namespace::printer | aaa : Done. */
  // test.case = 'Map polluted'; /* qqq : bad : for Yevhen : this is not printer! this is placeholder for printer. add cases with printers | aaa : Added. */
  // var src = _global.logger;
  // var expected = '{- Map.polluted with 9 elements -}';
  // test.identical( _.entity.exportStringShallowDiagnostic( src ), expected );

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
    _.props.extend( dst, o );
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
  var expected = '{- Symbol maybe -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'bigint';
  var src = 10n;
  var expected = '10n';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'str & regexpLike';
  var src = 'str';
  var expected = 'str';
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
  var src = _.unroll.make([ 2, 3, 4 ]);
  var expected = '{- Array.unroll with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'array';
  var src = [ 2, 3, 4 ];
  var expected = '{- Array with 3 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'long & longLike';
  var src = _.long.make([ 1, 2 ]);
  var expected = '{- Array with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'vector & vectorLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], withIterator : 1, length : 2 });
  var expected = '{- countableConstructor.countable with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'countable & countableLike';
  var src = __.diagnostic.objectMake({ /* ttt */ new : 1, elements : [ '1', '10' ], withIterator : 1 });
  var expected = '{- countableConstructor.countable.constructible with 2 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = `object countable - empty, non-vector`;
  var src = __.diagnostic.objectMake({ /* ttt */ elements : [], withIterator : 1 } );
  var expected = '{- Object.countable with 0 elements -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = `object countable - non empty, non-vector`;
  var src = __.diagnostic.objectMake({ /* ttt */ elements : [ '1', '2', '3' ], withIterator : 1 } );
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
  var expected = '{- Escape 1 -}'; /* xxx2 : qqq : bad */
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
  var expected = '/a/b/';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'routine & routineLike';
  var src = routine;
  var expected = '{- routine routine -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  // qqq : xxx : uncomment
  // test.case = 'timer';
  // var src = _.time._begin( Infinity );
  // var expected = '{- Map.pure with 9 elements -}';
  // test.identical( _.entity.exportStringShallowCode( src ), expected );
  // _.time.cancel( src );

  test.case = 'date & objectLike';
  var src = new Date( '2021-02-19T11:26:42.840Z' );
  var expected = '2021-02-19T11:26:42.840Z';
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
  var expected = '{- Symbol null -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Symbol undefined';
  var src = _.undefined;
  var expected = '{- Symbol undefined -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Symbol Nothing';
  var src = _.nothing;
  var expected = '{- Symbol nothing -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'primitive';
  var src = 5;
  var expected = '5';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'Symbol';
  var src = Symbol( 'a' );
  var expected = '{- Symbol a -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var expected = '{- Promise.constructible -}';
  test.identical( _.entity.exportStringShallowCode( src ), expected );

  test.case = 'stream';
  var src = require( 'stream' ).Readable();
  var expected = '{- Readable.constructible -}';
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
    _.props.extend( dst, o );
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
    var src = _.diagnostic.objectMake( { elements : [ '1', '10' ], ... env } );

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
    var src = _.diagnostic.objectMake( { elements : [ '1', '10' ], ... env } );

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
  var srcs = _.unroll.make( [ 1, 2, 'str', 3, [ 2 ] ] );
  var got = _.strConcat( srcs );
  if( _.entity.exportStringFine )
  test.identical( got, '1 2 str 3 [ 2 ]' );
  else
  test.identical( got, '1 2 str 3 {- Array with 1 elements -}' );

  test.case = 'srcs - unroll';
  var srcs = [ 1, 2, 'str', 3, _.unroll.from([ 2 ]) ];
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

// --
// test suite
// --

const Proto =
{

  name : 'Tools.Str.l0.l3',
  silencing : 1,

  tests :
  {

    /* */

    strEquivalent,
    // strsEquivalent,
    // strsEquivalentAll,
    // strsEquivalentAny,
    // strsEquivalentNone,

    // converter

    exportStringShallowDiagnostic,
    exportStringShallowCode,
    strPrimitive,
    strTypeWithTraitsBasic,
    strTypeWithoutTraitsBasic,
    // strTypeWithTraitsGeneratedObject,
    // strTypeWithoutTraitsGeneratedObject,

    strParseType,

    strConcat,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
