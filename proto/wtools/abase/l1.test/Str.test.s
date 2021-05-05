( function _Str_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;

// --
// evaluator
// --

function strCount( test )
{

  test.open( 'string' );

  test.case = 'none';
  var got = _.strCount( 'abc', 'z' );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'nl';
  var got = _.strCount( 'abc\ndef\nghi', '\n' );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'simple string';
  var got = _.strCount( 'ababacabacabaaba', 'aba' );
  var expected = 4;
  test.identical( got, expected );

  test.case = 'empty src';
  var got = _.strCount( '', 'abc' );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'empty ins';
  var got = _.strCount( 'abc', '' );
  var expected = 3;
  test.identical( got, expected );

  test.close( 'string' );

  /* - */

  test.open( 'regexp' );

  test.case = 'none';
  var got = _.strCount( 'abc', /z/ );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'nl';
  var got = _.strCount( 'abc\ndef\nghi', /\n/m );
  var expected = 2;
  test.identical( got, expected );

  test.case = 'simple string';
  var got = _.strCount( 'ababacabacabaaba', /aba/ );
  var expected = 4;
  test.identical( got, expected );

  test.case = 'empty src';
  var got = _.strCount( '', /a/ );
  var expected = 0;
  test.identical( got, expected );

  test.case = 'empty ins';
  var got = _.strCount( 'abc', /(?:)/ );
  var expected = 3;
  test.identical( got, expected );

  test.close( 'regexp' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strCount( );
  } );

  test.case = 'first argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strCount( [  ], '\n' );
  } );

  test.case = 'second argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strCount( 'abc\ndef\nghi', 13 );
  } );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strCount( 'abc\ndef\nghi' );
  } );

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strCount( '1', '2', '3' );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strCount( 123, '1' );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowErrorSync( function()
  {
    _.strCount( 'one two', 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strCount();
  });

}

// --
// replacer
// --

// function strRemoveBegin( test )
// {
//   var got, expected;
//
//   /* - */
//
//   test.case = 'returns string with removed occurrence from start';
//   var got = _.strRemoveBegin( 'example','exa' );
//   var expected = 'mple';
//   test.identical( got, expected );
//
//   test.case = 'returns original if no occurrence found';
//   var got = _.strRemoveBegin( 'mple','exa' );
//   var expected = 'mple';
//   test.identical( got, expected );
//
//   test.case = 'returns original if occurence is not at the beginning';
//   var got = _.strRemoveBegin( 'example','ple' );
//   var expected = 'example';
//   test.identical( got, expected );
//
//   /* - */
//
//   test.case = 'other';
//
//   /**/
//
//   got = _.strRemoveBegin( '', '' );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( '', 'x' );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', 'a' );
//   expected = 'bc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', 'ab' );
//   expected = 'c';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', 'x' );
//   expected = 'abc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', 'abc' );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', '' );
//   expected = 'abc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', [ 'a', 'b', 'c' ] );
//   expected = 'bc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', [ 'b', 'c', 'a' ] );
//   expected = 'bc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'aabbcc', [ 'a', 'b', 'c' ] );
//   expected = 'abbcc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abcabc', [ 'a', 'b', 'c' ] );
//   expected = 'bcabc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', [ '', 'a' ] );
//   expected = 'abc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'abc', [ 'abc', 'a' ] );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'a', 'd' ] );
//   expected = [ 'bc', 'bca', 'cab' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'abc', 'bca', 'cab' ], [ 'a', 'b', 'c' ] );
//   expected = [ 'bc', 'ca', 'ab' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'abcabc', 'bcabca', 'cabcab' ], [ 'a', 'b', 'c' ] );
//   expected = [ 'bcabc', 'cabca', 'abcab' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'abcabc', 'bcabca', 'cabcab' ], [ 'b', 'c', 'a' ] );
//   expected = [ 'bcabc', 'cabca', 'abcab' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'a', 'b', 'c' ], [ 'x' ] );
//   expected = [ 'a', 'b', 'c' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ] );
//   expected = [ '', '', '' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'a', 'b', 'c' ], [ ] );
//   expected = [ 'a', 'b', 'c' ];
//   test.identical( got, expected );
//
//   /* - */
//
//   test.case = 'RegExp';
//
//   /**/
//
//   got = _.strRemoveBegin( 'example', /ex/ );
//   expected = 'ample';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'example', 'examplex' ] , /ex\z/ );
//   expected = [ 'example', 'examplex' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( [ 'example', '1example', 'example2', 'exam3ple' ], /\d/ );
//   expected = [ 'example', 'example', 'example2', 'exam3ple' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'example', [ /am/ ] );
//   expected = 'example';
//   test.identical( got, expected );
//
//
//   /**/
//
//   got = _.strRemoveBegin( 'example', [ /ex/, /\w/ ] );
//   expected = 'ample';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'example', [ /\w/, /ex/ ] );
//   expected = 'xample';
//   test.identical( got, expected );
//
//
//   /**/
//
//   got = _.strRemoveBegin( 'example', /[axe]/ );
//   expected = 'xample';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveBegin( 'example', /\w{4}/ );
//   expected = 'ple';
//   test.identical( got, expected );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.case = 'without arguments';
//   test.shouldThrowErrorSync( () => _.strRemoveBegin() );
//
//   test.case = 'extra arguments';
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( 'abcd','a','a' ) );
//
//   test.case = 'invalid type of src argument';
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( 1, '' ) );
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( 1,'2' ) );
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( [ 'str', 1 ], '2' ) );
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( [ 'str', /ex/ ], '2' ) );
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( [ 'str', true ], '2' ) );
//
//   test.case = 'invalid type of begin argument';
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( 'a', 1 ) );
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( 'a', null ) );
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( 'aa', [ ' a', 2 ] ) );
//
//   test.case = 'invalid type of arguments';
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( undefined, undefined ) );
//   test.shouldThrowErrorSync( () => _.strRemoveBegin( null, null ) );
// }
//
// //
//
// function strRemoveEnd( test )
// {
//   var got, expected;
//
//   test.case = 'returns string with removed occurrence from end';
//   var got = _.strRemoveEnd( 'example','mple' );
//   var expected = 'exa';
//   test.identical( got, expected );
//
//   test.case = 'returns original if no occurrence found ';
//   var got = _.strRemoveEnd( 'example','' );
//   var expected = 'example';
//   test.identical( got, expected );
//
//   test.case = 'returns original if occurrence is not at the end ';
//   var got = _.strRemoveEnd( 'example','exa' );
//   var expected = 'example';
//   test.identical( got, expected );
//
//   /* - */
//
//   test.case = 'other';
//
//   /**/
//
//   got = _.strRemoveEnd( '', '' );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( '', 'x' );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', 'c' );
//   expected = 'ab';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', 'bc' );
//   expected = 'a';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', 'x' );
//   expected = 'abc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', 'abc' );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', '' );
//   expected = 'abc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', [ 'a', 'b', 'c' ] );
//   expected = 'ab';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', [ '', 'a' ] );
//   expected = 'abc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', [ '', 'c' ] );
//   expected = 'abc';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'abc', [ 'abc', 'a' ] );
//   expected = '';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'a', 'd' ] );
//   expected = [ 'abc', 'bc', 'cab' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( [ 'abc', 'bca', 'cab' ], [ 'a', 'b', 'c' ] );
//   expected = [ 'ab', 'bc', 'ca' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( [ 'a', 'b', 'c' ], [ 'x' ] );
//   expected = [ 'a', 'b', 'c' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ] );
//   expected = [ '', '', '' ];
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( [ 'a', 'b', 'c' ], [ ] );
//   expected = [ 'a', 'b', 'c' ];
//   test.identical( got, expected );
//
//   /* - */
//
//   test.case = 'RegExp';
//
//   /**/
//
//   got = _.strRemoveEnd( 'example', /ple/ );
//   expected = 'exam';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'example', /le$/ );
//   expected = 'examp';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'example', /^le/ );
//   expected = 'example';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'example', /\d/ );
//   expected = 'example';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'example', /am/ );
//   expected = 'example';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'example', /[axe]/ );
//   expected = 'exampl';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( 'example', /\w{4}/ );
//   expected = 'exa';
//   test.identical( got, expected );
//
//   /**/
//
//   got = _.strRemoveEnd( [ 'example', '1example', 'example2', 'exam3ple' ], [ /\d/, /e/, /^3/ ] );
//   expected = [ 'exampl', '1exampl', 'example', 'exam3pl' ];
//   test.identical( got, expected );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.shouldThrowErrorSync( () => _.strRemoveEnd( 1, '' ) );
//   test.shouldThrowErrorSync( () => _.strRemoveEnd( 'a', 1 ) );
//   test.shouldThrowErrorSync( () => _.strRemoveEnd() );
//   test.shouldThrowErrorSync( () => _.strRemoveEnd( undefined, undefined ) );
//   test.shouldThrowErrorSync( () => _.strRemoveEnd( null, null ) );
//
//   test.case = 'invalid arguments count';
//   test.shouldThrowErrorSync( function()
//   {
//     _.strRemoveEnd( 'one','two','three' );
//   });
//
//   test.case = 'no arguments';
//   test.shouldThrowErrorSync( function()
//   {
//     _.strRemoveEnd( );
//   });
//
//   test.case = 'first argument is wrong';
//   test.shouldThrowErrorSync( function()
//   {
//     _.strRemoveEnd( 1,'second' );
//   });
//
//   test.case = 'second argument is wrong';
//   test.shouldThrowErrorSync( function()
//   {
//     _.strRemoveEnd( 'first',2 );
//   });
//
// }

//

function strRemove( test )
{
  test.open( 'src - string, insStr - string' );

  test.case = 'empty string : empty string';
  var got = _.strRemove( '', '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : string';
  var got = _.strRemove( '', 'x' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty string';
  var got = _.strRemove( 'abc', '' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include insStr';
  var got = _.strRemove( 'abcd', 'c' );
  var expected = 'abd';
  test.identical( got, expected );

  test.case = 'include insStr, insStr.length === src.length';
  var got = _.strRemove( 'abc', 'abc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( 'abc', 'ac' );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, insStr - string' );

  /* - */

  test.open( 'src - string, insStr - array of strings' );

  test.case = 'empty string : empty strings';
  var got = _.strRemove( '', [ '', '', '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'empty string : strings';
  var got = _.strRemove( '', [ 'x', 'a', 'abc' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings';
  var got = _.strRemove( 'abc', [ '', '', '' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'include one of insStrs';
  var got = _.strRemove( 'abc', [ 'd', 'bc', 'c' ] );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include one of insStrs, insStr.length < src.length';
  var got = _.strRemove( 'abc', [ 'bc', 'ab', 'da' ] );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include one of insStrs, insStr.length === src.length';
  var got = _.strRemove( 'abc', [ 'cba', 'dba', 'abc' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( 'abc', [ 'd', 'ac' ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, insStr - array of strings' );

  /* - */

  test.open( 'src - array of strings, insStr - string' );

  test.case = 'empty strings : empty string';
  var got = _.strRemove( [ '', '', '' ], '' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : string';
  var got = _.strRemove( [ '', '', '' ], 'abc' );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty string';
  var got = _.strRemove( [ 'abc', 'bac', 'cab' ], '' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr';
  var got = _.strRemove( [ 'abc', 'bac', 'cab' ], 'c' );
  var expected = [ 'ab', 'ba', 'ab' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr, insStr.length < src.length';
  var got = _.strRemove( [ 'abc', 'bac', 'cab' ], 'c' );
  var expected = [ 'ab', 'ba', 'ab' ];
  test.identical( got, expected );

  test.case = 'include one of insStrs, insStr.length === src.length';
  var got = _.strRemove( [ 'abc', 'bac', 'cab' ], 'abc' );
  var expected = [ '', 'bac', 'cab' ];
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( [ 'abc', 'bac', 'cab' ], 'cb' );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, insStr - string' );

  /* - */

  test.open( 'src - array of strings, insStr - array of strings' );

  test.case = 'empty strings : empty strings';
  var got = _.strRemove( [ '', '', '' ], [ '', '', '' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'empty strings : strings';
  var got = _.strRemove( [ '', '', '' ], [ 'x', 'a', 'b' ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], [ '', '', '' ] );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], [ 'bc', 'ab', 'ca' ] );
  var expected = [ 'a', 'a', 'c' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr, insStr.length < src.length';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], [ 'bc', 'a', 'ca' ] );
  var expected = [ '', '', 'cb' ];
  test.identical( got, expected );

  test.case = 'src includes insStr, insStr.length === src.length';
  var got = _.strRemove( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', 'bca' ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( [ 'abc', 'bda', 'cab' ], [ 'cb', 'dc' ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, insStr - array of strings' );

  /* - */

  test.open( 'src - string, insStr - RegExp' );

  test.case = 'empty string : RegExp';
  var got = _.strRemove( '', /\w/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : RegExp';
  var got = _.strRemove( 'abc', /\w/ );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include insStr';
  var got = _.strRemove( 'abc', /\w{2}/ );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'include insStr, insStr.length < src.length';
  var got = _.strRemove( 'abc', /\w/ );
  var expected = 'bc';
  test.identical( got, expected );

  test.case = 'include insStr, insStr.length === src.length';
  var got = _.strRemove( 'abc', /\w*/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( 'abc', /\sw/ );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, insStr - RegExp' );

  /* - */

  test.open( 'src - string, insStr - array of strings and RegExp' );

  test.case = 'empty string : empty strings and RegExp : empty string';
  var got = _.strRemove( '', [ '', /\w/, '' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string : empty strings and RegExp';
  var got = _.strRemove( 'abc', [ '', '', /\w$/ ] );
  var expected = 'ab';
  test.identical( got, expected );

  test.case = 'include one of insStrs';
  var got = _.strRemove( 'abc', [ 'd', 'bc', /a/ ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'include one of insStrs, insStr.length < src.length';
  var got = _.strRemove( 'abc', [ /bc/, /ab/, 'da' ] );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'include one of insStrs, insStr.length === src.length';
  var got = _.strRemove( 'abc', [ 'cba', 'dba', /\w+/ ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( 'abc', [ 'd', /\s+/ ] );
  var expected = 'abc';
  test.identical( got, expected );

  test.close( 'src - string, insStr - array of strings and RegExp' );

  /* - */

  test.open( 'src - array of strings, insStr - RegExp' );

  test.case = 'empty strings : RegExp';
  var got = _.strRemove( [ '', '', '' ], /\s/ );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : RegExp';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], /\s*/ );
  var expected = [ 'abc', 'bca', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr';
  var got = _.strRemove( [ 'aabc', 'abca', 'cab' ], /bc/ );
  var expected = [ 'aa', 'aa', 'cab' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr, insStr.length < src.length';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], /a\w/ );
  var expected = [ 'c', 'bca', 'c' ];
  test.identical( got, expected );

  test.case = 'src includes insStr, insStr.length === src.length';
  var got = _.strRemove( [ 'abc', 'cab', 'bca', 'cab' ], /ca\w/ );
  var expected = [ 'abc', '', 'bca', '' ];
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( [ 'abc', 'bac', 'cab' ], /[efk]/ );
  var expected = [ 'abc', 'bac', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, insStr - RegExp' );

  /* - */

  test.open( 'src - array of strings, insStr - array of strings and RegExp' );

  test.case = 'empty strings : empty strings and RegExp';
  var got = _.strRemove( [ '', '', '' ], [ '', '', /\w\s/ ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'strings : empty strings and RegExp : empty string';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], [ '', /\D/, '' ] );
  var expected = [ 'bc', 'ca', 'ab' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], [ 'bc', /[abc]/, 'ca' ] );
  var expected = [ '', '', 'ab' ];
  test.identical( got, expected );

  test.case = 'one of src includes insStr, insStr.length < src.length';
  var got = _.strRemove( [ 'abc', 'bca', 'cab' ], [ 'bc', /\w/, 'ca' ] );
  var expected = [ '', '', 'ab' ];
  test.identical( got, expected );

  test.case = 'src includes insStr, insStr.length === src.length';
  var got = _.strRemove( [ 'abc', 'cab', 'bca', 'cab' ], [ 'cab', 'abc', /\w+$/ ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'not include';
  var got = _.strRemove( [ 'abc', 'bda', 'cab' ], [ 'ba', /\w\s/ ] );
  var expected = [ 'abc', 'bda', 'cab' ];
  test.identical( got, expected );

  test.close( 'src - array of strings, insStr - array of strings and RegExp' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strRemove() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strRemove( 'abcd', 'a', 'a', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strRemove( 1, '' ) );
  test.shouldThrowErrorSync( () => _.strRemove( /\w*/, '2' ) );
  test.shouldThrowErrorSync( () => _.strRemove( [ 'str', 1 ], '2' ) );
  test.shouldThrowErrorSync( () => _.strRemove( [ 'str', /ex/ ], '2' ) );

  test.case = 'wrong type of insStr';
  test.shouldThrowErrorSync( () => _.strRemove( 'a', 1 ) );
  test.shouldThrowErrorSync( () => _.strRemove( 'a', null ) );
  test.shouldThrowErrorSync( () => _.strRemove( 'aa', [ ' a', 2 ] ) );

  test.case = 'invalid type of arguments';
  test.shouldThrowErrorSync( () => _.strRemove( undefined, undefined ) );
  test.shouldThrowErrorSync( () => _.strRemove( null, null ) );
}

//

// function strReplaceBegin( test )
// {
//   /**/
//
//   var got, expected;
//
//   got = _.strReplaceBegin( '', '', '' );
//   expected = '';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( '', '', 'a' );
//   expected = 'a';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( 'a', 'a', 'b' );
//   expected = 'b';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( 'a', 'x', 'b' );
//   expected = 'a';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( 'abc', 'ab', 'c' );
//   expected = 'cc';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( 'abc', '', 'c' );
//   expected = 'cabc';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [], '', '' );
//   expected = [];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'a', 'b', 'c' ], 'a', 'c' );
//   expected = [ 'c', 'b', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], 'c' );
//   expected = [ 'c', 'c', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'x', 'y', 'z' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'aa', 'bb', 'cc' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'xa', 'yb', 'zc' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'aa', 'bb', 'cc' ], [ 'y', 'z', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'aa', 'bb', 'zc' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ], 'c' );
//   expected = [ 'a', 'b', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'a', 'ab', 'ac' ], 'a', [ 'x', 'y', 'z' ] );
//   expected = [ 'x', 'xb', 'xc' ];
//   test.identical( got, expected );  /* - */
//
//   /**/
//
//   test.case = 'RegExp';
//
//   /**/
//
//   got = _.strReplaceBegin( 'example', /exa/, 'si' );
//   expected = 'simple';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( 'example', /ex$/, 'no' );
//   expected = 'example';
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'example', 'lexical' ], [ /^le/, /ex$/, /\w{3}/ ], [ 'a', 'b', 'si' ]  );
//   expected = [ 'simple', 'axical' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'example', 'lexical' ], [ /^le/, /ex$/, /\w{3}/ ], 'si' );
//   expected = [ 'simple', 'sixical' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'example1', '3example', 'exam4ple' ], /\d/, '2' );
//   expected = [ 'example1', '2example', 'exam4ple' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( [ 'example', '1example', 'example2', 'exam3ple' ], [ /\d/, /e/, /^3/ ], [ '3', '2', '1' ]  );
//   expected = [ '2xample', '3example', '2xample2', '2xam3ple' ];
//   test.identical( got, expected );
//
//   /**/
//
//   test.case = 'Null';
//
//   /**/
//
//   got = _.strReplaceBegin( null, /exa/, 'si' );
//   expected = [];
//   test.identical( got, expected );
//
//   got = _.strReplaceBegin( 'example', null, 'no' );
//   expected = 'example';
//   test.identical( got, expected );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.shouldThrowErrorSync( () => _.strReplaceBegin() );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 1, '', '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 1, '', '', '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'a', 1, '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'a', 'a', 1 ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'a', [ 'x', 1 ], 'a' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'a', [ 'b', 'a' ], [ 'x', 1 ] ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'a', [ 'a' ], [ 'x', '1' ] ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'string', 'begin', null ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'string', 'begin', undefined ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( 'string', undefined, 'ins' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceBegin( undefined, 'begin', 'ins' ) );
// }
//
// //
//
// function strReplaceEnd( test )
// {
//   /**/
//
//   var got, expected;
//
//   got = _.strReplaceEnd( '', '', '' );
//   expected = '';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( '', '', 'a' );
//   expected = 'a';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( 'a', 'a', 'b' );
//   expected = 'b';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( 'a', 'x', 'b' );
//   expected = 'a';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( 'abc', 'bc', 'c' );
//   expected = 'ac';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( 'abc', '', 'c' );
//   expected = 'abcc';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [], '', '' );
//   expected = [];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'a', 'b', 'c' ], 'a', 'c' );
//   expected = [ 'c', 'b', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], 'c' );
//   expected = [ 'c', 'c', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'x', 'y', 'z' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'aa', 'bb', 'cc' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'ax', 'by', 'cz' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'aa', 'bb', 'cc' ], [ 'y', 'z', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'aa', 'bb', 'cz' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ], 'c' );
//   expected = [ 'a', 'b', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'a', 'ab', 'ca' ], 'a', [ 'x', 'y', 'z' ] );
//   expected = [ 'x', 'ab', 'cx' ];
//   test.identical( got, expected );
//
//   /**/
//
//   test.case = 'RegExp';
//
//   /**/
//
//   got = _.strReplaceEnd( 'example', /ple/, 'en' );
//   expected = 'examen';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( 'example', /^le/, 'no' );
//   expected = 'example';
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'example', 'lexical' ], [ /^le/, /ex$/, /\w{3}/ ], [ 'a', 'b', 'en' ]  );
//   expected = [ 'examen', 'lexien' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'example', 'lexical' ], [ /al$/, /ex$/, /\w{3}/ ], 'en' );
//   expected = [ 'examen', 'lexien' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'example1', '3example', 'exam4ple' ], /\d/, '2' );
//   expected = [ 'example2', '3example', 'exam4ple' ];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( [ 'example', '1example', 'example2', 'exam2ple' ], [ /\d/, /e/, /^3/ ], [ '3', '2', '1' ]  );
//   expected = [ 'exampl2', '1exampl2', 'example3', 'exam2pl2' ];
//   test.identical( got, expected );
//
//   /**/
//
//   test.case = 'Null';
//
//   /**/
//
//   got = _.strReplaceEnd( null, /le/, 'si' );
//   expected = [];
//   test.identical( got, expected );
//
//   got = _.strReplaceEnd( 'example', null, 'no' );
//   expected = 'example';
//   test.identical( got, expected );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.shouldThrowErrorSync( () => _.strReplaceEnd() );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 1, '', '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 1, '', '', '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'a', 1, '' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'a', 'a', 1 ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'a', [ 'x', 1 ], 'a' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'a', [ 'a' ], [ 1 ] ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'a', [ 'b', 'c' ], [ 'c' ] ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'string', 'end', null ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'string', 'end', undefined ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( 'string', undefined, 'ins' ) );
//   test.shouldThrowErrorSync( () => _.strReplaceEnd( undefined, 'end', 'ins' ) );
// }
//
// //
//
// function strReplace( test )
// {
//   /**/
//
//   var got, expected;
//
//   got = _.strReplace( '', '', '' );
//   expected = '';
//   test.identical( got, expected );
//
//   got = _.strReplace( '', '', 'a' );
//   expected = 'a';
//   test.identical( got, expected );
//
//   got = _.strReplace( 'a', 'a', 'b' );
//   expected = 'b';
//   test.identical( got, expected );
//
//   got = _.strReplace( 'a', 'x', 'b' );
//   expected = 'a';
//   test.identical( got, expected );
//
//   got = _.strReplace( 'bcabcabc', 'bc', 'c' );
//   expected = 'cabcabc';
//   test.identical( got, expected );
//
//   got = _.strReplace( [], '', '' );
//   expected = [];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'aa', 'ba', 'c' ], 'a', 'c' );
//   expected = [ 'ca', 'bc', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'abc', 'cab', 'cba' ], [ 'a', 'b', 'c' ], [ 'c', 'c', 'c' ] );
//   expected = [ 'cc'+'c', 'cc'+'c', 'cc'+'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'a', 'b', 'c' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'x', 'y', 'z' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'ab', 'bc', 'ca' ], [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'xy', 'yz', 'zx' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'aa', 'bb', 'cc' ], [ 'y', 'z', 'c' ], [ 'x', 'y', 'z' ] );
//   expected = [ 'aa', 'bb', 'zc' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'a', 'b', 'c' ], [ 'x', 'y', 'z' ], [ '1', '2', '3' ] );
//   expected = [ 'a', 'b', 'c' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'a', 'bab', 'ca' ], 'a', 'x' );
//   expected = [ 'x', 'bxb', 'cx' ];
//   test.identical( got, expected );
//
//   /**/
//
//   test.case = 'RegExp';
//
//   /**/
//
//   got = _.strReplace( 'example', /ple/, 'en' );
//   expected = 'examen';
//   test.identical( got, expected );
//
//   got = _.strReplace( 'example', /^le/, 'no' );
//   expected = 'example';
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'example', 'lex11ical' ], [ /^le/, /ex$/, /\d{2}/ ], [ 'a', 'b', 'en' ]  );
//   expected = [ 'example', 'axenical' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'example', 'lexical' ], [ /al$/, /^ex/ ], [ '1', '2' ] );
//   expected = [ '2ample', 'lexic1' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ 'example1', '3example', 'exam4ple' ], /\d/, '2' );
//   expected = [ 'example2', '2example', 'exam2ple' ];
//   test.identical( got, expected );
//
//   got = _.strReplace( [ '3example', '1example', 'example2', 'exam2ple' ], [ /\d/, /e/, /^3/ ], [ '3', '2', '1' ]  );
//   expected = [ '12xample', '12xample', '2xample3', '2xam3ple' ];
//   test.identical( got, expected );
//
//   /* - */
//
//   if( !Config.debug )
//   return;
//
//   test.shouldThrowErrorSync( () => _.strReplace() );
//   test.shouldThrowErrorSync( () => _.strReplace( 1, '', '' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( '' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 1, '', '', '' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'a', 1, '' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'a', 'a', 1 ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'a', [ 'x', 1 ], 'a' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'a', [ 'a' ], [ 1 ] ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'a', [ 'b', 'c' ], [ 'c' ] ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'string', 'sub', null ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'string', 'sub', undefined ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'string', null, 'ins' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( 'string', undefined, 'ins' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( null, 'sub', 'ins' ) );
//   test.shouldThrowErrorSync( () => _.strReplace( undefined, 'sub', 'ins' ) );
// }

//

function strPrependOnce( test )
{
  var got, expected;

  /* - */

  test.case = 'strPrependOnce';

  /**/

  got = _.strPrependOnce( '', '' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( '', 'a' );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', 'a' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', 'ab' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', 'x' );
  expected = 'xab';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'ab', '' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'morning', 'Good ' );
  expected = 'Good morning';
  test.identical( got, expected );

  /**/

  got = _.strPrependOnce( 'Good morning', 'Good ' );
  expected = 'Good morning';
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.strPrependOnce() );
  test.shouldThrowErrorSync( () => _.strPrependOnce( null, '' ) );
  test.shouldThrowErrorSync( () => _.strPrependOnce( '', null ) );
  test.shouldThrowErrorSync( () => _.strPrependOnce( NaN, '' ) );
  test.shouldThrowErrorSync( () => _.strPrependOnce( '', NaN ) );
  test.shouldThrowErrorSync( () => _.strPrependOnce( 3, '' ) );
  test.shouldThrowErrorSync( () => _.strPrependOnce( '', 3 ) );
  test.shouldThrowErrorSync( () => _.strPrependOnce( [], '' ) );
  test.shouldThrowErrorSync( () => _.strPrependOnce( '', [] ) );

}

//

function strAppendOnce( test )
{
  var got, expected;

  /* - */

  test.case = 'strAppendOnce';

  /**/

  got = _.strAppendOnce( '', '' );
  expected = '';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( '', 'a' );
  expected = 'a';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', 'a' );
  expected = 'aba';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', 'ab' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', 'x' );
  expected = 'abx';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'ab', '' );
  expected = 'ab';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'Good ', 'morning' );
  expected = 'Good morning';
  test.identical( got, expected );

  /**/

  got = _.strAppendOnce( 'Good morning', 'morning' );
  expected = 'Good morning';
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.shouldThrowErrorSync( () => _.strAppendOnce() );
  test.shouldThrowErrorSync( () => _.strAppendOnce( null, '' ) );
  test.shouldThrowErrorSync( () => _.strAppendOnce( '', null ) );
  test.shouldThrowErrorSync( () => _.strAppendOnce( NaN, '' ) );
  test.shouldThrowErrorSync( () => _.strAppendOnce( '', NaN ) );
  test.shouldThrowErrorSync( () => _.strAppendOnce( 3, '' ) );
  test.shouldThrowErrorSync( () => _.strAppendOnce( '', 3 ) );
  test.shouldThrowErrorSync( () => _.strAppendOnce( [], '' ) );
  test.shouldThrowErrorSync( () => _.strAppendOnce( '', [] ) );

}

//

function strReplaceWords( test )
{

  test.case = 'simple string';
  var got = _.strReplaceWords( 'a b c d', [ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = 'a x y d';
  test.identical( got, expected );

  test.case = 'escaping string';
  var got = _.strReplaceWords( '\na b \n c d', [ 'b', 'c' ], [ 'x', 'y' ] );
  var expected = '\na x \n y d';
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strReplaceWords( '1', '2' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strReplaceWords( 123, [], [] );
  });

  test.case = 'invalid arrays length';
  test.shouldThrowErrorSync( function()
  {
    _.strReplaceWords( 'one two', [ 'one' ], [ 'one', 'two' ] );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowErrorSync( function()
  {
    _.strReplaceWords( 'one two', 5, [ 'one', 'two' ] );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strReplaceWords();
  });

}

// --
// etc
// --

function strCommonLeft( test )
{
  test.case = 'no args';
  var got = _.strCommonLeft( );
  var expected = '';
  test.identical( got, expected );

  test.case = 'one argument';
  var got = _.strCommonLeft( 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'ins is empty string';
  var got = _.strCommonLeft( '', 'a', 'b' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'one string is empty';
  var got = _.strCommonLeft( 'abc', '', 'abc', 'ada' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'no match';
  var got = _.strCommonLeft( 'abcd', 'abc', 'd' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'several strings';
  var got = _.strCommonLeft( 'abc', 'abd', 'abc', 'ada' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'several strings';
  var got = _.strCommonLeft( 'abcd', 'ab', 'abc', 'a' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'Several character string';
  var got = _.strCommonLeft( 'abc', 'abcd', 'abcde', 'abcdef' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'Several character string';
  var got = _.strCommonLeft( 'abcdef', 'abcd', 'abcde', 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'Several character string';
  var got = _.strCommonLeft( 'abcd', 'abc', 'abcd' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonLeft( 'abcd', 'abc', 3 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonLeft( 'abcd', 'abc', NaN );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonLeft( 'abcd', 'ab', 'abc', [ 3 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonLeft( 'abcd', 'ab', 'abc', /a/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonLeft( 'abcd', 'ab', 'abc', [ 'abc' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'no match case';
  var got = _.strCommonLeft( 'abcd', 'ab', 'Abc' );
  var expected = '';
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'ins is array';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( [ 'a', 'b', 'c' ], 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is number';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( 3, 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is regExp';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( /^a/, 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is NaN';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( NaN, 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is null';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( null, 'abd', 'abc', 'ada' );
  });

  test.case = 'One arg null';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( 'abd', 'abc', 'ada', null );
  });

  test.case = 'ins is undefined';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( undefined, 'abd', 'abc', 'ada' );
  });

  test.case = 'One arg undefined';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonLeft( 'abd', 'abc', 'ada', undefined );
  });

}

//

function strCommonRight( test )
{
  test.case = 'no args';
  var got = _.strCommonRight( );
  var expected = '';
  test.identical( got, expected );

  test.case = 'one argument';
  var got = _.strCommonRight( 'abc' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'ins is empty string';
  var got = _.strCommonRight( '', 'ab', 'b' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'one string is empty';
  var got = _.strCommonRight( 'abc', '', 'abc', 'bc' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'no match';
  var got = _.strCommonRight( 'abcd', 'abc', 'd' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'several strings';
  var got = _.strCommonRight( 'a', 'cba', 'dba', 'ada' );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'several strings';
  var got = _.strCommonRight( 'abcd', 'cd', 'abcd', 'd' );
  var expected = 'd';
  test.identical( got, expected );

  test.case = 'Several character string';
  var got = _.strCommonRight( 'cdef', 'abcdef', 'def', 'bcdef' );
  var expected = 'def';
  test.identical( got, expected );

  test.case = 'Several character string';
  var got = _.strCommonRight( 'abcdef', 'bcdef', 'cdef', 'def' );
  var expected = 'def';
  test.identical( got, expected );

  test.case = 'Several character string';
  var got = _.strCommonRight( 'abcd', 'bcd', 'abcd' );
  var expected = 'bcd';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonRight( 'abc', 'abc', 3 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonRight( 'acde', 'bcde', NaN );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonRight( 'abcd', 'abd', 'ad', [ 3 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonRight( 'c', 'bc', 'abc', /c/ );
  var expected = '';
  test.identical( got, expected );

  test.case = 'One arg is not a string';
  var got = _.strCommonRight( 'abcd', 'cd', 'bcd', [ 'abcd' ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'no match case';
  var got = _.strCommonRight( 'abcd', 'cD', 'AbcD' );
  var expected = '';
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'ins is array';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( [ 'a', 'b', 'c' ], 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is number';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( 3, 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is regExp';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( /^a/, 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is NaN';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( NaN, 'abd', 'abc', 'ada' );
  });

  test.case = 'ins is null';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( null, 'abd', 'abc', 'ada' );
  });

  test.case = 'One arg null';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( 'abd', 'abc', 'ada', null );
  });

  test.case = 'ins is undefined';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( undefined, 'abd', 'abc', 'ada' );
  });

  test.case = 'One arg undefined';
  test.shouldThrowErrorSync( function( )
  {
    _.strCommonRight( 'abd', 'abc', 'ada', undefined );
  });

}

//

function strRandom( test )
{
  test.case = 'empty';
  var got = _.strRandom( 0 );
  test.identical( got, '' );

  test.case = 'o - number > 0';
  var got = _.strRandom( 4 );
  test.identical( got.length, 4 );
  test.true( _.strIs( got ) );
  test.true( _.strHas( _.strAlphabetFromRange( [ 'a', 'z' ] ), got[ 0 ] ) );
  test.true( _.strHas( _.strAlphabetFromRange( [ 'a', 'z' ] ), got[ 1 ] ) );
  test.true( _.strHas( _.strAlphabetFromRange( [ 'a', 'z' ] ), got[ 2 ] ) );
  test.true( _.strHas( _.strAlphabetFromRange( [ 'a', 'z' ] ), got[ 3 ] ) );

  test.case = 'range';
  for( let i = 0 ; i < 10 ; i++ )
  {
    let got = _.strRandom( [ 1, 3 ] );
    test.ge( got.length, 1 );
    test.lt( got.length, 3 );
    test.true( _.strHas( _.strAlphabetFromRange( [ 'a', 'z' ] ), got[ 0 ] ) );
  }

  test.case = 'options';
  for( let i = 0 ; i < 5 ; i++ )
  {
    let got = _.strRandom({ length : [ 1, 5 ], alphabet : _.strAlphabetFromRange( [ 33, 130 ] ) });
    test.ge( got.length, 1 );
    test.lt( got.length, 5 );
    test.true( _.strHas( _.strAlphabetFromRange( [ 33, 130 ] ), got[ 0 ] ) );
  }

  test.case = 'set with single symbol';
  var got = _.strRandom( { length : 2, alphabet : 'aa'+'a' } );
  test.identical( got, 'aa' );

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strRandom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strRandom( 1, 'extra' ) );

  test.case = 'length is not a range, not a number';
  test.shouldThrowErrorSync( () => _.strRandom( [ 1, 2, 3 ] ) );
  test.shouldThrowErrorSync( () => _.strRandom( { length : [ 1, 2, 3 ] } ) );

  test.case = 'unnacessary fields in options map';
  test.shouldThrowErrorSync( () => _.strRandom( { length : [ 1, 2, 3 ], unnacessary : 1 } ) );
}

//

function strAlphabetFromRange( test )
{
  test.case = 'single character';
  var got = _.strAlphabetFromRange( [ 'a', 'b' ] );
  var exp = 'a';
  test.identical( got, exp );

  test.case = 'a few character';
  var got = _.strAlphabetFromRange( [ 'b', 'f' ] );
  var exp = 'bcde';
  test.identical( got, exp );

  test.case = 'single character';
  var got = _.strAlphabetFromRange( [ 'abc', 'bcd' ] );
  var exp = 'a';
  test.identical( got, exp );

  test.case = 'a few character';
  var got = _.strAlphabetFromRange( [ 'bcd', 'fgh' ] );
  var exp = 'bcde';
  test.identical( got, exp );

  /* */

  test.case = 'single character';
  var got = _.strAlphabetFromRange( [ 99, 100 ] );
  var exp = 'c';
  test.identical( got, exp );

  test.case = 'a few character';
  var got = _.strAlphabetFromRange( [ 100, 104 ] );
  var exp = 'defg';
  test.identical( got, exp );

  // test.case = 'single character';
  // var got = _.strAlphabetFromRange( [ 100, 99 ] );
  // var exp = 'd';
  // test.identical( got, exp );
  //
  // test.case = 'a few character';
  // var got = _.strAlphabetFromRange( [ 104, 100 ] );
  // var exp = 'hgfe';
  // test.identical( got, exp );

  /* */

  test.case = 'single character';
  var got = _.strAlphabetFromRange( [ 'c', 100 ] );
  var exp = 'c';
  test.identical( got, exp );

  test.case = 'a few character';
  var got = _.strAlphabetFromRange( [ 'd', 104 ] );
  var exp = 'defg';
  test.identical( got, exp );

  test.case = 'single character';
  var got = _.strAlphabetFromRange( [ 99, 'd' ] );
  var exp = 'c';
  test.identical( got, exp );

  test.case = 'a few character';
  var got = _.strAlphabetFromRange( [ 100, 'h' ] );
  var exp = 'defg';
  test.identical( got, exp );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strAlphabetFromRange() );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.strAlphabetFromRange( 'ab' ) );

  test.case = 'wrong length of range';
  test.shouldThrowErrorSync( () => _.strAlphabetFromRange( [] ) );
  test.shouldThrowErrorSync( () => _.strAlphabetFromRange( [ 'a' ] ) );
  test.shouldThrowErrorSync( () => _.strAlphabetFromRange( [ 'a', 'b', 'c' ] ) );

  test.case = 'wrong type of range elements';
  test.shouldThrowErrorSync( () => _.strAlphabetFromRange( [ { a : 'a' }, 67 ] ) );
  test.shouldThrowErrorSync( () => _.strAlphabetFromRange( [ [ 'a' ], 67 ] ) );
}

//--
// formatter
//--

function strForRange( test )
{

  test.case = 'returns string representing the range of numbers';
  var got = _.strForRange( [ 1, 10 ] );
  var expected = '[ 1..10 ]';
  test.identical( got, expected );

  test.case = 'returns string representing the range of symbols';
  var got = _.strForRange( [ 'a', 'z' ] );
  var expected = '[ a..z ]';
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strForRange( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strForRange( 'wrong argument' );
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strForRange( [ 1, 10 ], 'redundant argument' );
  } );

}

//--
// transformer
//--

function strCapitalize( test )
{
  test.case = 'first letter is upper case';
  var got = _.strCapitalize( 'object' );
  var expected = 'Object';
  test.identical( got, expected );

  test.case = 'single word';
  var got = _.strCapitalize( 'one' );
  var expected = 'One';
  test.identical( got, expected );

  test.case = 'two words';
  var got = _.strCapitalize( 'one two' );
  var expected = 'One two';
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments length';
  test.shouldThrowErrorSync( function()
  {
    _.strCapitalize( 'first', 'wrond argument' );
  });

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.strCapitalize( 777 );
  });

  test.case = 'no argument provided';
  test.shouldThrowErrorSync( function()
  {
    _.strCapitalize();
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strCapitalize( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strCapitalize( 33 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strCapitalize( 'object', 'redundant argument' );
  } );

}

//

function strDecapitalize( test )
{

  test.case = 'empty string';
  var got = _.strDecapitalize( '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'single word';
  var got = _.strDecapitalize( 'One' );
  var expected = 'one';
  test.identical( got, expected );

  test.case = 'two words';
  var got = _.strDecapitalize( 'One two' );
  var expected = 'one two';
  test.identical( got, expected );

  test.case = 'two words, first letter is lowercase';
  var got = _.strDecapitalize( 'one two' );
  var expected = 'one two';
  test.identical( got, expected );

  test.case = 'string number';
  var got = _.strDecapitalize( '1' );
  var expected = '1';
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDecapitalize( 777 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strDecapitalize();
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strDecapitalize( 'object', 'redundant argument' );
  } );

}

//

function strSignBasic( test )
{

  test.case = 'src = A';
  var got = _.strSign( 'A' );
  var expected = 'wA';
  test.identical( got, expected );

  test.case = 'src = Tools';
  var got = _.strSign( 'Tools' );
  var expected = 'wTools';
  test.identical( got, expected );

  test.case = 'src = tools';
  var got = _.strSign( 'tools' );
  var expected = 'wTools';
  test.identical( got, expected );

  test.case = 'src = Module wTools';
  var got = _.strSign( 'Module wTools' );
  var expected = 'wModule wTools';
  test.identical( got, expected );

  test.case = 'src = w';
  var got = _.strSign( 'w' );
  var expected = 'wW';
  test.identical( got, expected );

  test.case = 'src = W';
  var got = _.strSign( 'W' );
  var expected = 'wW';
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.strSign( 777 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strSign();
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strSign( 'Object', 'w', 1 );
  } );

  test.case = 'Signed string';
  test.shouldThrowErrorSync( function()
  {
    _.strSign( 'wObject', 'w' );
  } );

  test.case = 'prefix.length > 1';
  test.shouldThrowErrorSync( function()
  {
    _.strSign( 'Object', 'wa' );
  } );
}


//

function strDesignBasic( test )
{
  test.case = 'src = wA';
  var got = _.strDesign( 'wA' );
  var expected = 'A';
  test.identical( got, expected );

  test.case = 'src = wTools';
  var got = _.strDesign( 'wTools' );
  var expected = 'Tools';
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDesign( 777 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strDesign();
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strDesign( 'wObject', 'w', 1 );
  } );

  test.case = 'Not signed string';
  test.shouldThrowErrorSync( function()
  {
    _.strDesign( 'Object', 'w' );
  } );

  test.case = 'prefix.length > 1';
  test.shouldThrowErrorSync( function()
  {
    _.strDesign( 'Object', 'wa' );
  } );
}

//

function strIsSignedBasic( test )
{
  test.open( 'signed' )

  test.case = 'src = wA';
  var got = _.strIsSigned( 'wA' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = wTools';
  var got = _.strIsSigned( 'wTools' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = wModule wTools';
  var got = _.strIsSigned( 'wModule wTools' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = wW';
  var got = _.strIsSigned( 'wW' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = w123';
  var got = _.strIsSigned( 'w123' );
  var expected = true;
  test.identical( got, expected );

  test.close( 'signed' )

  /* - */

  test.open( 'not signed' )

  test.case = 'src = A';
  var got = _.strIsSigned( 'A' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = Tools';
  var got = _.strIsSigned( 'Tools' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = wtools';
  var got = _.strIsSigned( 'wtools' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = Module wTools';
  var got = _.strIsSigned( 'Module wTools' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = w';
  var got = _.strIsSigned( 'w' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = W';
  var got = _.strIsSigned( 'W' );
  var expected = false;
  test.identical( got, expected );

  test.close( 'not signed' )

  /* - */

  if( !Config.debug )
  return;

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( function()
  {
    _.strIsSigned( 777 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strIsSigned();
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strIsSigned( 'Object', 'w', 1 );
  } );

  test.case = 'prefix.length > 1';
  test.shouldThrowErrorSync( function()
  {
    _.strIsSigned( 'Object', 'wa' );
  } );

}

//

function strSignOptionPrefix( test )
{
  test.case = 'src = A, prefix = w';
  var got = _.strSign( 'A', 'w' );
  var expected = 'wA';
  test.identical( got, expected );

  test.case = 'src = Tools, prefix = a';
  var got = _.strSign( 'Tools', 'a' );
  var expected = 'aTools';
  test.identical( got, expected );

  test.case = 'src = wtools, prefix = \'2\'';
  var got = _.strSign( 'wtools', '2' );
  var expected = '2Wtools';
  test.identical( got, expected );

  test.case = 'src = module wTools, prefix = r';
  var got = _.strSign( 'module wTools', 'r' );
  var expected = 'rModule wTools';
  test.identical( got, expected );

  test.case = 'src = a, prefix = a';
  var got = _.strSign( 'a', 'a' );
  var expected = 'aA';
  test.identical( got, expected );

  test.case = 'src = W, prefix = q';
  var got = _.strSign( 'W', 'q' );
  var expected = 'qW';
  test.identical( got, expected );

  test.case = 'src = 2be, prefix = q';
  var got = _.strSign( '2be', 'q' );
  var expected = 'q2be';
  test.identical( got, expected );
}

//

function strDesignOptionPrefix( test )
{
  test.case = 'src = wA, prefix = w';
  var got = _.strDesign( 'wA', 'w' );
  var expected = 'A';
  test.identical( got, expected );

  test.case = 'src = Tools, prefix = a';
  var got = _.strDesign( 'aTools', 'a' );
  var expected = 'Tools';
  test.identical( got, expected );

  test.case = 'src = wtools, prefix = \'2\'';
  var got = _.strDesign( '2Wtools', '2' );
  var expected = 'Wtools';
  test.identical( got, expected );

  test.case = 'src = rModule wTools, prefix = r';
  var got = _.strDesign( 'rModule wTools', 'r' );
  var expected = 'Module wTools';
  test.identical( got, expected );

}

//

function strIsSignedOptionPrefix( test )
{
  test.open( 'signed' );

  test.case = 'src = wA, prefix = w';
  var got = _.strIsSigned( 'wA', 'w' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = aTools, prefix = a';
  var got = _.strIsSigned( 'aTools', 'a' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = 2Wtools, prefix = \'2\'';
  var got = _.strIsSigned( '2Wtools', '2' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = rModule wTools, prefix = r';
  var got = _.strIsSigned( 'rModule wTools', 'r' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'src = qW, prefix = q';
  var got = _.strIsSigned( 'qW', 'q' );
  var expected = true;
  test.identical( got, expected );

  test.close( 'signed' );

  /* - */

  test.open( 'not signed' );

  test.case = 'src = A, prefix = w';
  var got = _.strIsSigned( 'A', 'w' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = Tools, prefix = a';
  var got = _.strIsSigned( 'Tools', 'a' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = wtools, prefix = \'2\'';
  var got = _.strIsSigned( 'wtools', '2' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = module wTools, prefix = r';
  var got = _.strIsSigned( 'module wTools', 'r' );
  var expected =  false;
  test.identical( got, expected );

  test.case = 'src = module wTools, prefix = m';
  var got = _.strIsSigned( 'module wTools', 'm' );
  var expected =  false;
  test.identical( got, expected );

  test.case = 'src = a, prefix = a';
  var got = _.strIsSigned( 'a', 'a' );
  var expected = false;
  test.identical( got, expected );

  test.case = 'src = 2be, prefix = q';
  var got = _.strIsSigned( 'wTools', 'q' );
  var expected = false;
  test.identical( got, expected );

  test.close( 'not signed' );
}

//

function strSignDesignCombination( test )
{
  test.open( 'sign then design' );

  test.case = 'src = Tools';
  var src = 'Tools';
  var gotSigned = _.strSign( src );
  var gotDesigned = _.strDesign( gotSigned );
  test.identical( gotSigned, 'wTools' );
  test.identical( gotDesigned, src );

  test.case = 'src = tools';
  var src = 'tools';
  var gotSigned = _.strSign( src );
  var gotDesigned = _.strDesign( gotSigned );
  test.identical( gotSigned, 'wTools' );
  test.identical( gotDesigned, 'Tools' );

  test.case = 'src = 123';
  var src = '123';
  var gotSigned = _.strSign( src );
  var gotDesigned = _.strDesign( gotSigned );
  test.identical( gotSigned, 'w123' );
  test.identical( gotDesigned, src );

  test.close( 'sign then design' );

  /* - */

  test.open( 'design then sign' );

  test.case = 'src = wTools';
  var src = 'wTools';
  var gotDesigned = _.strDesign( src );
  var gotSigned = _.strSign( gotDesigned );
  test.identical( gotSigned, src );
  test.identical( gotDesigned, 'Tools' );

  test.case = 'src = w123';
  var src = 'w123';
  var gotDesigned = _.strDesign( src );
  var gotSigned = _.strSign( gotDesigned );
  test.identical( gotSigned, src );
  test.identical( gotDesigned, '123' );

  test.close( 'design then sign' );
}

//

function strUnicodeEscape( test )
{

  test.case = 'simple string';
  var got = _.strUnicodeEscape( 'prefix' );
  var expected = '\\u0070\\u0072\\u0065\\u0066\\u0069\\u0078';
  test.identical( got, expected );

  test.case = 'escaping';
  var got = _.strUnicodeEscape( '\npostfix//' );
  var expected = '\\u000a\\u0070\\u006f\\u0073\\u0074\\u0066\\u0069\\u0078\\u002f\\u002f';
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.strUnicodeEscape( '' );
  var expected = '';
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strUnicodeEscape( '1', '2', '3' );
  });

  test.case = 'invalid  argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnicodeEscape( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strUnicodeEscape();
  });

}

//--
// stripper
//--

/* qqq : uncover it please | Dmytro : test routines strStrip() and strStripLeft(), strStripRight uncovered */

function strStrip( test )
{
  test.case = 'defaults, src is a string';

  var got = _.strStrip( '' );
  test.identical( got, '' );

  var got = _.strStrip( 'a' );
  test.identical( got, 'a' );

  var got = _.strStrip( '   a   ' );
  test.identical( got, 'a' );

  var got = _.strStrip( '\0 a \0' );
  test.identical( got, 'a' );

  var got = _.strStrip( '\r\n\t\f\v a \v\r\n\t\f' );
  test.identical( got, 'a' );

  var got = _.strStrip( '\r\n\t\f\v hello world \v\r\n\t\f' );
  test.identical( got, 'hello world' );

  var got = _.strStrip( '\nabc  ' );
  test.identical( got, 'abc' );

  /* - */

  test.case = 'stripper contains regexp special symbols';

  var got = _.strStrip( { src : '\\s\\s', stripper : '\\s' } );
  test.identical( got, '' );

  var got = _.strStrip( { src : '(x)(x)', stripper : '(x)' } );
  test.identical( got, '' );

  var got = _.strStrip( { src : 'abc', stripper : '[abc]' } );
  test.identical( got, 'abc' );

  var got = _.strStrip( { src : '[abc]', stripper : '[abc]' } );
  test.identical( got, '' );

  var got = _.strStrip( { src : 'abc', stripper : '[^abc]' } );
  test.identical( got, 'abc' );

  var got = _.strStrip( { src : 'abc', stripper : '[a-c]' } );
  test.identical( got, 'abc' );

  var got = _.strStrip( { src : '[a-c]', stripper : '[a-c]' } );
  test.identical( got, '' );

  var got = _.strStrip( { src : 'ab(a|b)', stripper : '(a|b)' } );
  test.identical( got, 'ab' );

  var got = _.strStrip( { src : 'gp', stripper : 'a+' } );
  test.identical( got, 'gp' );

  var got = _.strStrip( { src : 'hp', stripper : 'b{3}' } );
  test.identical( got, 'hp' );

  var got = _.strStrip( { src : 'abc', stripper : '^[ab]c$' } );
  test.identical( got, 'abc' );

  /* - */

  test.case = 'stripper is regexp';

  var got = _.strStrip( { src : ' abc', stripper : /[abc]/ } );
  test.identical( got, ' bc' );

  var got = _.strStrip( { src : 'abc', stripper : /\D/ } );
  test.identical( got, 'bc' );

  var got = _.strStrip( { src : 'abc', stripper : /[abc]$/ } );
  test.identical( got, 'ab' );

  var got = _.strStrip( { src : 'abc', stripper : /abc/ } );
  test.identical( got, '' );

  var got = _.strStrip( { src : 'hello', stripper : /lo?/ } );
  test.identical( got, 'helo' );

  /* - */

  test.case = 'Empty array';
  var got = _.strStrip( [] );
  test.identical( got, [] );

  test.case = 'Array with single string';
  var got = _.strStrip( [ '' ] );
  test.identical( got, [ '' ] );

  test.case = 'defaults, src is an array';
  var got = _.strStrip
  ([
    '',
    'a',
    '   a   ',
    ' \0 a \0 ',
    '\r\n\t\f\v a \v\r\n\t\f'
  ]);
  var expected =
  [
    '',
    'a',
    'a',
    'a',
    'a'
  ];
  test.identical( got, expected );

  test.case = 'src array of strings, custom stripper';
  var got = _.strStrip
  ({
    src :
    [
      '',
      'a',
      ' a ',
      '  a  ',
      ' \n ',
      ' a b c ',
    ],
    stripper : ' '
  });
  var expected =
  [
    '',
    'a',
    'a',
    'a',
    '\n',
    'abc'
  ];
  test.identical( got, expected );

  test.case = 'src array of strings, custom stripper as regexp';
  var got = _.strStrip
  ({
    src :
    [
      'x',
      'xx',
      'axbxc',
      'x\nx'
    ],
    stripper : /x/
  });
  var expected =
  [
    '',
    'x',
    'abxc',
    '\nx'
  ];
  test.identical( got, expected );

  test.case = 'src array of strings, custom stripper as regexp';
  var got = _.strStrip
  ({
    src :
    [
      'abc',
      'acb',
      'bac',
      'cab',
    ],
    stripper : /abc|[abc]/
  });
  var expected =
  [
    '',
    'cb',
    'ac',
    'ab'
  ];
  test.identical( got, expected );

  test.case = 'src array of strings, custom stripper as regexp';
  var got = _.strStrip
  ({
    src :
    [
      'abc',
      'acb',
      'bac',
      'bca',
      'cba',
      'cab',
    ],
    stripper : /[abc]/g
  });
  var expected = [ '', '', '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'src string, stripper array of strings';
  var got = _.strStrip
  ({
    src : 'xxyy',
    stripper : [ 'x', 'y' ]
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'src string, stripper array of strings';
  var got = _.strStrip
  ({
    src : 'jjkk',
    stripper : [ 'x', 'y' ]
  });
  var expected = 'jjkk';
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strStrip() );

  test.case = 'invalid type';
  test.shouldThrowErrorSync( () => _.strStrip( 10 ) );
  test.shouldThrowErrorSync( () => _.strStrip( null ) );
  test.shouldThrowErrorSync( () => _.strStrip( NaN ) );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.strStrip( 'a', '' ) );

  test.case = 'one string has invalid type';
  test.shouldThrowErrorSync( () => _.strStrip( [ 'a', 0, 'b' ] ) );

  test.case = 'stripper has invalid type';
  test.shouldThrowErrorSync( () => _.strStrip( { src : 'a', stripper : 0 } ) );
  test.shouldThrowErrorSync( () => _.strStrip( { src : 'a', stripper : [ 'a', 0 ] } ) );
  test.shouldThrowErrorSync( () => _.strStrip( { src : [ 'a', 'b' ], stripper : null } ) );
  test.shouldThrowErrorSync( () => _.strStrip( { src : [ 'a', 'b' ], stripper : NaN } ) );

  test.case = 'invalid property defined';
  var src = { src : ' word ', delimeter : ' ', left : 1 };
  test.shouldThrowErrorSync( () => _.strStrip( src ) );
}

//

function strStripLeft( test )
{
  test.case = 'defaults, src is a string';

  var got = _.strStripLeft( '   a   ' );
  test.identical( got, 'a   ' );

  var got = _.strStripLeft( ' \0 a \0 ' );
  test.identical( got, 'a \u0000 ' );

  var got = _.strStripLeft( '\r\v a \v\r\n\t\f' );
  test.identical( got, 'a \u000b\r' );

  var got = _.strStripLeft( '\0 hello world \0' );
  test.identical( got, 'hello world \u0000' );

  /* - */

  test.case = 'defaults, src is an array';
  var got = _.strStripLeft
  ({
    src :
    [
      '',
      'a',
      '   a   ',
      ' \0 a \0 ',
      '\r\n\t\f\v a \v\r'
    ],
  });
  var expected =
  [
    '',
    'a',
    'a   ',
    'a \u0000 ',
    'a \u000b\r'
  ];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strStripLeft() );

  test.case = 'invalid type';
  test.shouldThrowErrorSync( () => _.strStripLeft( 10 ) );
  test.shouldThrowErrorSync( () => _.strStripLeft( null ) );
  test.shouldThrowErrorSync( () => _.strStripLeft( NaN ) );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.strStripLeft( 'a', '' ) );

  test.case = 'one string has invalid type';
  test.shouldThrowErrorSync( () => _.strStripLeft( [ 'a', 0, 'b' ] ) );

  test.case = 'stripper has invalid type';
  test.shouldThrowErrorSync( () => _.strStripLeft( { src : 'a', stripper : 0 } ) );
  test.shouldThrowErrorSync( () => _.strStripLeft( { src : 'a', stripper : [ 'a', 0 ] } ) );
  test.shouldThrowErrorSync( () => _.strStripLeft( { src : [ 'a', 'b' ], stripper : null } ) );
  test.shouldThrowErrorSync( () => _.strStripLeft( { src : [ 'a', 'b' ], stripper : NaN } ) );

  test.case = 'invalid property defined';
  var src = { src : ' word ', delimeter : ' ', left : 1 };
  test.shouldThrowErrorSync( () => _.strStripLeft( src ) );
}

//

function strStripRight( test )
{
  test.case = 'defaults, src is a string';

  var got = _.strStripRight( '   ul   ' );
  test.identical( got, '   ul' );

  var got = _.strStripRight( ' \0 om \0 ' );
  test.identical( got, ' \u0000 om' );

  var got = _.strStripRight( '\r\v a \v\n\t\f\r' );
  test.identical( got, '\r\u000b a' );

  var got = _.strStripRight( '\0 hello world \0' );
  test.identical( got, '\u0000 hello world' );

  /* - */

  test.case = 'defaults, src is an array';
  var src =
  [
    '',
    'a',
    '   a   ',
    ' \0 a \0 ',
    '\r\v a \v\n\t\f\r'
  ];
  var expected =
  [
    '',
    'a',
    '   a',
    ' \u0000 a',
    '\r\u000b a'
  ];
  var got = _.strStripRight( src );
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strStripRight() );

  test.case = 'invalid type';
  test.shouldThrowErrorSync( () => _.strStripRight( 10 ) );
  test.shouldThrowErrorSync( () => _.strStripRight( null ) );
  test.shouldThrowErrorSync( () => _.strStripRight( NaN ) );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( () => _.strStripRight( 'a', '' ) );

  test.case = 'one string has invalid type';
  test.shouldThrowErrorSync( () => _.strStripRight( [ 'a', 0, 'b' ] ) );

  test.case = 'stripper has invalid type';
  test.shouldThrowErrorSync( () => _.strStripRight( { src : 'a', stripper : 0 } ) );
  test.shouldThrowErrorSync( () => _.strStripRight( { src : 'a', stripper : [ 'a', 0 ] } ) );
  test.shouldThrowErrorSync( () => _.strStripRight( { src : [ 'a', 'b' ], stripper : null } ) );
  test.shouldThrowErrorSync( () => _.strStripRight( { src : [ 'a', 'b' ], stripper : NaN } ) );

  test.case = 'invalid property defined';
  var src = { src : ' word ', delimeter : ' ', left : 1 };
  test.shouldThrowErrorSync( () => _.strStripRight( src ) );
}

//

function strRemoveAllSpaces( test )
{
  test.case = 'removes the spaces from the borders';
  var got = _.strRemoveAllSpaces( '  abcdef  ' );
  var expected = 'abcdef';
  test.identical( got, expected );

  test.case = 'removes the spaces from the given string';
  var got = _.strRemoveAllSpaces( 'a b c d e f' );
  var expected = 'abcdef';
  test.identical( got, expected );

  test.case = 'replaces the all spaces with the commas';
  var got = _.strRemoveAllSpaces( 'a b c d e f', ',' );
  var expected = 'a,b,c,d,e,f';
  test.identical( got, expected );

  test.case = 'simple string, default options';
  var got = _.strRemoveAllSpaces( 'a b c d e' );
  var expected = 'abcde';
  test.identical( got, expected );

  test.case = 'sub defined';
  var got = _.strRemoveAllSpaces( 'a b c d e', ', ' );
  var expected = 'a, b, c, d, e';
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.strRemoveAllSpaces( ' ' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'sub as word';
  var got = _.strRemoveAllSpaces( 'a b c', ' and ' );
  var expected = 'a and b and c';
  test.identical( got, expected );

  test.case = 'sub as number';
  var got = _.strRemoveAllSpaces( 'a b c', 0 );
  var expected = 'a0b0c';
  test.identical( got, expected );

  test.case = 'sub as array';
  var got = _.strRemoveAllSpaces( 'a b c d e', [ 5, 6 ] );
  var expected = 'a5,6b5,6c5,6d5,6e';
  test.identical( got, expected );

  test.case = 'sub as null';
  var got = _.strRemoveAllSpaces( 'a b c d e', null );
  var expected = 'anullbnullcnulldnulle';
  test.identical( got, expected );

  test.case = 'sub as NaN';
  var got = _.strRemoveAllSpaces( 'a b c d e', NaN );
  var expected = 'aNaNbNaNcNaNdNaNe';
  test.identical( got, expected );

  test.case = 'sub as regexp';
  var got = _.strRemoveAllSpaces( 'a b c d e', /a$/ );
  var expected = 'a/a$/b/a$/c/a$/d/a$/e';
  test.identical( got, expected );

  test.case = 'vectorized input';
  var got = _.strRemoveAllSpaces( [ '  a b ', 'c  d ', ' e f ' ] );
  var expected = [ 'ab', 'cd', 'ef' ];
  test.identical( got, expected );

  test.case = 'vectorized input';
  var got = _.strRemoveAllSpaces( [ '  a b ', 'c  d ', ' e f ' ], '-' );
  var expected = [ '--a-b-', 'c--d-', '-e-f-' ];
  test.identical( got, expected );

  test.case = 'vectorized input';
  var got = _.strRemoveAllSpaces( [ '  a b ', 'c  d ', ' e f ' ], 3 );
  var expected = [ '33a3b3', 'c33d3', '3e3f3' ];
  test.identical( got, expected );

  test.case = 'vectorized input';
  var got = _.strRemoveAllSpaces( [ 'a b', 'cd ', ' ef' ], [ 0, 1 ] );
  var expected = [ 'a0,1b', 'cd0,1', '0,1ef' ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strRemoveAllSpaces( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strRemoveAllSpaces( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strRemoveAllSpaces();
  });

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strRemoveAllSpaces( 13 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strRemoveAllSpaces( 'a b c d e f', ',', 'redundant argument' );
  } );

  test.case = 'Null argument';
  test.shouldThrowErrorSync( function( )
  {
    _.strRemoveAllSpaces( null );
  } );

  test.case = 'NaN argument';
  test.shouldThrowErrorSync( function( )
  {
    _.strRemoveAllSpaces( NaN );
  } );

  test.case = 'Regexp argument';
  test.shouldThrowErrorSync( function( )
  {
    _.strRemoveAllSpaces( /^a/ );
  } );

}

//

function strStripEmptyLines( test )
{

  test.case = 'simple string';
  var got = _.strStripEmptyLines( 'line_one\n\nline_two' );
  var expected = 'line_one\nline_two';
  test.identical( got, expected );

  test.case = 'empty string';
  var got = _.strStripEmptyLines( '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'single line';
  var got = _.strStripEmptyLines( 'b' );
  var expected = 'b';
  test.identical( got, expected );

  test.case = 'multiple breaklines';
  var got = _.strStripEmptyLines( '\n\na\n\nb\n\n\n' );
  var expected = 'a\nb';
  test.identical( got, expected );

  test.case = 'Lines with spaces';
  var got = _.strStripEmptyLines( ' line one\n\n line two \n\n line 3 \n' );
  var expected = ' line one\n line two \n line 3 ';
  test.identical( got, expected );

  test.case = 'Lines with spaces and tabs';
  var got = _.strStripEmptyLines( ' line one\n\t\n\n line \t two \n\n line 3 \n' );
  var expected = ' line one\n line \t two \n line 3 ';
  test.identical( got, expected );

  test.case = 'Array input';
  var got = _.strStripEmptyLines( [ '  a \n\n b ', ' \nc  d \n\n\n ' ] );
  var expected = [ '  a \n b ', 'c  d ' ];
  test.identical( got, expected );

  test.case = 'Empty array input';
  var got = _.strStripEmptyLines( [ ] );
  var expected = [ ];
  test.identical( got, expected );


  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strStripEmptyLines( '1', '2', '3' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strStripEmptyLines( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strStripEmptyLines();
  });

  test.case = 'null argument';
  test.shouldThrowErrorSync( function()
  {
    _.strStripEmptyLines( null );
  });

  test.case = 'NaN argument';
  test.shouldThrowErrorSync( function()
  {
    _.strStripEmptyLines( NaN );
  });

  test.case = 'Regexp argument';
  test.shouldThrowErrorSync( function()
  {
    _.strStripEmptyLines( /a?$/ );
  });

  test.case = 'Array with wrong arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strStripEmptyLines( [ null, NaN, 3, /a?$/ ] );
  });

}

//--
// splitter
//--

function strSplitStrNumber( test )
{

  test.case = 'returns object with one property';
  var got = _.strSplitStrNumber( 'abcdef' );
  var expected = { str : 'abcdef' };
  test.identical( got, expected );

  test.case = 'returns object with two properties';
  var got = _.strSplitStrNumber( 'abc3def' );
  var expected = { str : 'abc', number : 3 };
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strSplitStrNumber( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strSplitStrNumber( [  ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strSplitStrNumber( 13 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strSplitStrNumber( 'abc3', 'redundant argument' );
  } );

}

//

function strSplitCamel( test )
{
  test.case = 'without uppercase character';
  var src = '';
  var got = _.strSplitCamel( src );
  test.identical( got, [ '' ] );

  var src = 'abc';
  var got = _.strSplitCamel( src );
  test.identical( got, [ 'abc' ] );

  var src = '"a" "b" "c"';
  var got = _.strSplitCamel( src );
  test.identical( got, [ '"a" "b" "c"' ] );

  test.case = 'src in camelCase';
  var src = 'heLloWorLd';
  var got = _.strSplitCamel( src );
  test.identical( got, [ 'he', 'llo', 'wor', 'ld' ] );

  test.case = 'without uppercase character, special symbols';
  var src = '"a" \n "b" \r "c"';
  var got = _.strSplitCamel( src );
  test.identical( got, [ '"a" \n "b" \r "c"' ] );

  test.case = 'str has uppercase';
  var src = 'aAb Bc C Dd';
  var got = _.strSplitCamel( src );
  test.identical( got, [ 'a', 'ab ', 'bc ', 'c ', 'dd' ] );

  test.case = 'str has uppercase, special symbols';
  var src = 'aAb \r Bc \n C Dd';
  var got = _.strSplitCamel( src );
  test.identical( got, [ 'a', 'ab \r ', 'bc \n ', 'c ', 'dd' ] );

  var src = '\n Ab \r Bc \n C Dd';
  var got = _.strSplitCamel( src );
  test.identical( got, [ '\n ', 'ab \r ', 'bc \n ', 'c ', 'dd' ] );

  test.case = 'one character has uppercase';
  var src = 'A';
  var got = _.strSplitCamel( src );
  test.identical( got, [ '', 'a' ] );

  test.case = 'all character has uppercase';
  var src = 'ABCDE';
  var got = _.strSplitCamel( src );
  test.identical( got, [ '', 'a', 'b', 'c', 'd', 'e' ] );

  test.case = 'a few arguments';
  var got = _.strSplitCamel( 'AaB', 'b', 'c' );
  test.identical( got, [ '', 'aa', 'b' ] );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( () => _.strSplitCamel() );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( () => _.strSplitCamel( [] ) );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( () => _.strSplitCamel( 13 ) );

  test.case = 'invalid option type';
  test.shouldThrowErrorSync( () => _.strSplitCamel( { src : null } ) );

  test.case = 'invalid option defined';
  test.shouldThrowErrorSync( () => _.strSplitCamel( [ { src : 'word' } ] ) );
}

//--
// extractor
//--

function _strOnly( test )
{
  test.case = 'range - number, first symbol';
  var src = 'a\nb\nc';
  var got = _._strOnly( src, 0 );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'range - number';
  var src = 'a\nb\nc';
  var got = _._strOnly( src, 1 );
  var expected = '\n';
  test.identical( got, expected );

  test.case = 'range - number, last symbol';
  var src = 'a\nb\nc';
  var got = _._strOnly( src, 4 );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'range - number bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _._strOnly( src, 6 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = 'a\nb\nc';
  var got = _._strOnly( src, -1 );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol';
  var src = 'a\nb\nc';
  var got = _._strOnly( src, -5 );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _._strOnly( src, -7 );
  var expected = '';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty string';
  var got = _._strOnly( '', [ 2, 2 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] > range[ 1 ]';
  var got = _._strOnly( 'Hello', [ 1, 0 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _._strOnly( 'Hello', [ 0, 4 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _._strOnly( 'Hello', [ 0, 7 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get subString';
  var got = _._strOnly( 'Hello', [ 2, 2 ] );
  var expected = 'l';
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _._strOnly( 'Hello', [ 3, 4 ] );
  var expected = 'lo';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _._strOnly( 'Hello', [ 4, 0 ] );
  var expected = '';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _._strOnly( 'Hello', [ -2, -3 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _._strOnly( 'Hello', [ -5, 4 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _._strOnly( 'Hello', [ -7, 4 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strOnly( 'Hello', [ -3, -3 ] );
  var expected = 'l';
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strOnly( 'Hello', [ -5, -5 ] );
  var expected = 'H';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strOnly( 'Hello', [ -2, -2 ] );
  var expected = 'l';
  test.identical( got, expected );

  /* - */

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _._strOnly() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _._strOnly( 'abc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _._strOnly( 'abc', [ 1, 2 ], 'extra' ) );

  test.case = 'wrong type of srcStr';
  test.shouldThrowErrorSync( () => _._strOnly( 123, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _._strOnly( null, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _._strOnly( /a?$/, [ 0, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _._strOnly( 'abc', null ) );
  test.shouldThrowErrorSync( () => _._strOnly( 'abc', 'wrong' ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _._strOnly( 'abc', [ 1 ] ) );
  test.shouldThrowErrorSync( () => _._strOnly( 'abc', [ 1, 2, 3 ] ) );
}

//

function strOnly( test )
{
  test.open( 'not vectorized' );

  test.case = 'range - number, first symbol';
  var src = 'a\nb\nc';
  var got = _.strOnly( src, 0 );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'range - number';
  var src = 'a\nb\nc';
  var got = _.strOnly( src, 1 );
  var expected = '\n';
  test.identical( got, expected );

  test.case = 'range - number, last symbol';
  var src = 'a\nb\nc';
  var got = _.strOnly( src, 4 );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'range - number bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _.strOnly( src, 6 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = 'a\nb\nc';
  var got = _.strOnly( src, -1 );
  var expected = 'c';
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol';
  var src = 'a\nb\nc';
  var got = _.strOnly( src, -5 );
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _.strOnly( src, -7 );
  var expected = '';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty string';
  var got = _.strOnly( '', [ 2, 2 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] > range[ 1 ]';
  var got = _.strOnly( 'Hello', [ 1, 0 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _.strOnly( 'Hello', [ 0, 4 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _.strOnly( 'Hello', [ 0, 8 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get subString';
  var got = _.strOnly( 'Hello', [ 2, 2 ] );
  var expected = 'l';
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _.strOnly( 'Hello', [ 3, 4 ] );
  var expected = 'lo';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _.strOnly( 'Hello', [ 4, 0 ] );
  var expected = '';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _.strOnly( 'Hello', [ -2, -3 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _.strOnly( 'Hello', [ -5, 4 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _.strOnly( 'Hello', [ -7, 4 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strOnly( 'Hello', [ -3, -3 ] );
  var expected = 'l';
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strOnly( 'Hello', [ -5, -5 ] );
  var expected = 'H';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strOnly( 'Hello', [ -2, -2 ] );
  var expected = 'l';
  test.identical( got, expected );

  test.close( 'not vectorized' );

  /* - */

  test.open( 'vectorized' );

  test.case = 'range - number, first symbol';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strOnly( src, 0 );
  var expected = [ 'a', '', 'a' ];
  test.identical( got, expected );

  test.case = 'range - number';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strOnly( src, 1 );
  var expected = [ '\n', '', 'b' ];
  test.identical( got, expected );

  test.case = 'range - number, last symbol of longest string';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strOnly( src, 4 );
  var expected = [ 'c', '', '' ];
  test.identical( got, expected );

  test.case = 'range - number bigger then longest srcStr.length';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strOnly( src, 6 );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strOnly( src, -1 );
  var expected = [ 'c', '', 'c' ];
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol of longest string';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strOnly( src, -5 );
  var expected = [ 'a', '', '' ];
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then longest srcStr.length';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strOnly( src, -7 );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty strings';
  var got = _.strOnly( [ '', '', '' ], [ 2, 3 ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] > range[ 1 ]';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ 1, 0 ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ 0, 4 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ 0, 7 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ 2, 2 ] );
  var expected = [ 'l', 'r', 'c', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ 3, 4 ] );
  var expected = [ 'lo', 'ld', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ 4, 0 ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ -2, -3 ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ -5, 5 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ -7, 5 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ -3, -3 ] );
  var expected = [ 'l', 'r', 'a', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strOnly( [ 'hello', 'world', 'abc', '' ], [ -5, -5 ] );
  var expected = [ 'h', 'w', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strOnly( [ 'Hello', 'world', 'abc', '' ], [ -3, -3 ] );
  var expected = [ 'l', 'r', 'a', '' ];
  test.identical( got, expected );

  test.close( 'vectorized' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strOnly() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.strOnly( 'abc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strOnly( 'abc', [ 1, 2 ], 'extra' ) );

  test.case = 'wrong type of srcStr';
  test.shouldThrowErrorSync( () => _.strOnly( 123, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _.strOnly( null, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _.strOnly( /a?$/, [ 0, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.strOnly( 'abc', null ) );
  test.shouldThrowErrorSync( () => _.strOnly( 'abc', 'wrong' ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.strOnly( 'abc', [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.strOnly( 'abc', [ 1, 2, 3 ] ) );
}

//

function _strBut( test )
{
  test.open( 'without ins' );

  test.case = 'range - number, first symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 0 );
  var expected = '\nb\nc';
  test.identical( got, expected );

  test.case = 'range - number';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 1 );
  var expected = 'ab\nc';
  test.identical( got, expected );

  test.case = 'range - number, last symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 4 );
  var expected = 'a\nb\n';
  test.identical( got, expected );

  test.case = 'range - number bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 6 );
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -1 );
  var expected = 'a\nb\n';
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -5 );
  var expected = '\nb\nc';
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -7 );
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty string';
  var got = _._strBut( '', [ 2, 3 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] > range[ 1 ]';
  var got = _._strBut( 'Hello', [ 1, 0 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _._strBut( 'Hello', [ 0, 5 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _._strBut( 'Hello', [ 0, 8 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] === range[ 1 ]';
  var got = _._strBut( 'Hello', [ 2, 2 ] );
  var expected = 'Helo';
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _._strBut( 'Hello', [ 3, 4 ] );
  var expected = 'Hel';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _._strBut( 'Hello', [ 4, 0 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -2, -3 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -5, 5 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -7, 5 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -3, -3 ] );
  var expected = 'Helo';
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -5, -5 ] );
  var expected = 'ello';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -2, -5 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -2, -3 ], undefined );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -5, 4 ], undefined );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -7, 4 ], undefined );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -3, -3 ], undefined );
  var expected = 'Helo';
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -5, -5 ], undefined );
  var expected = 'ello';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -3, -2 ], undefined );
  var expected = 'Heo';
  test.identical( got, expected );

  test.close( 'without ins' );

  /* - */

  test.open( 'ins - string' );

  test.case = 'range - number, first symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 0, 'append\nn' );
  var expected = 'append\nn\nb\nc';
  test.identical( got, expected );

  test.case = 'range - number';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 1, 'append\nn' );
  var expected = 'aappend\nnb\nc';
  test.identical( got, expected );

  test.case = 'range - number, last symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 4, 'append\nn' );
  var expected = 'a\nb\nappend\nn';
  test.identical( got, expected );

  test.case = 'range - number bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 6, 'append\nn' );
  var expected = 'a\nb\ncappend\nn';
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -1, 'append\nn' );
  var expected = 'a\nb\nappend\nn';
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -5, 'append\nn' );
  var expected = 'append\nn\nb\nc';
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -7, 'append\nn' );
  var expected = 'append\nna\nb\nc';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty string';
  var got = _._strBut( '', [ 2, 3 ], 'append\nn' );
  var expected = 'append\nn';
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] > range[ 1 ]';
  var got = _._strBut( 'Hello', [ 1, 0 ], 'append\nn' );
  var expected = 'Happend\nnello';
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _._strBut( 'Hello', [ 0, 5 ], 'append\nn' );
  var expected = 'append\nn';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _._strBut( 'Hello', [ 0, 8 ], 'append\nn' );
  var expected = 'append\nn';
  test.identical( got, expected );

  test.case = 'srcStr, get subString';
  var got = _._strBut( 'Hello', [ 2, 2 ], 'append\nn' );
  var expected = 'Heappend\nnlo';
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _._strBut( 'Hello', [ 3, 4 ], 'append\nn' );
  var expected = 'Helappend\nn';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _._strBut( 'Hello', [ 4, 0 ], 'append\nn' );
  var expected = 'Hellappend\nno';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -2, -3 ], 'append\nn' );
  var expected = 'Helappend\nnlo';
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -5, 4 ], 'append\nn' );
  var expected = 'append\nn';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _._strBut( 'Hello', [ -7, 4 ], 'append\nn' );
  var expected = 'append\nn';
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -3, -3 ], 'append\nn' );
  var expected = 'Heappend\nnlo';
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -5, -5 ], 'append\nn' );
  var expected = 'append\nnello';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _._strBut( 'Hello', [ -2, -4 ], 'append\nn' );
  var expected = 'Helappend\nnlo';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0, ins - empty string';
  var got = _._strBut( 'Hello', [ -2, -3 ], '' );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0, ins - empty string';
  var got = _._strBut( 'Hello', [ -5, 4 ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0, ins - empty string';
  var got = _._strBut( 'Hello', [ -7, 4 ], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0, ins - empty string';
  var got = _._strBut( 'Hello', [ -3, -3 ], '' );
  var expected = 'Helo';
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0, ins - empty string';
  var got = _._strBut( 'Hello', [ -5, -5 ], '' );
  var expected = 'ello';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0, ins - empty string';
  var got = _._strBut( 'Hello', [ -2, -4 ], '' );
  var expected = 'Hello';
  test.identical( got, expected );

  test.close( 'ins - string' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _._strBut() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _._strBut( 'abc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _._strBut( 'abc', [ 1, 2 ], ' some ', 'extra' ) );

  test.case = 'wrong type of srcStr';
  test.shouldThrowErrorSync( () => _._strBut( 123, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _._strBut( null, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _._strBut( /a?$/, [ 0, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _._strBut( 'abc', null ) );
  test.shouldThrowErrorSync( () => _._strBut( 'abc', 'wrong' ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _._strBut( 'abc', [ 1 ] ) );
  test.shouldThrowErrorSync( () => _._strBut( 'abc', [ 1, 2, 3 ] ) );

  test.case = 'wrong ins';
  test.shouldThrowErrorSync( () => _._strBut( 'abc', [ 1, 2 ], { a : 1 } ) );
}

//

function _strButInsIsLong( test )
{
  test.case = 'srcStr - empty string, range - inside string';
  var got = _._strBut( '', [ 0, -1 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  test.case = 'srcStr - empty string, range - outside string';
  var got = _._strBut( '', [ 0, 2 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  test.case = 'srcStr - empty string, range - outside string';
  var got = _._strBut( '', [ -2, 2 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  /* */

  test.case = 'range - |negative number| > src.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -7, [ 'append', 'n' ] );
  var expected = [ 'appenda\nb\nc', 'na\nb\nc' ];
  test.identical( got, expected );

  test.case = 'range - |negative number| < src.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -2, [ 'append', 'n' ] );
  var expected = [ 'a\nbappendc', 'a\nbnc' ];
  test.identical( got, expected );

  test.case = 'range - number - -1, last symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, -1, [ 'append', 'n' ] );
  var expected = [ 'a\nb\nappend', 'a\nb\nn' ];
  test.identical( got, expected );

  test.case = 'range - number - 0, first symbol';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 0, [ 'append', 'n' ] );
  var expected = [ 'append\nb\nc', 'n\nb\nc' ];
  test.identical( got, expected );

  test.case = 'range - number < src.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 1, [ 'append', 'n' ] );
  var expected = [ 'aappendb\nc', 'anb\nc' ];
  test.identical( got, expected );

  test.case = 'range - number > src.length';
  var src = 'a\nb\nc';
  var got = _._strBut( src, 6, [ 'append', 'n' ] );
  var expected = [ 'a\nb\ncappend', 'a\nb\ncn' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -6 > src.length';
  var got = _._strBut( 'Hello', [ 0, -6 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -2 < src.length';
  var got = _._strBut( 'Hello', [ 0, -2 ], [ 'append', 'n' ] );
  var expected = [ 'appendo', 'no' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -1';
  var got = _._strBut( 'Hello', [ 0, -1 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === range[ 0 ]';
  var got = _._strBut( 'Hello', [ 0, 0 ], [ 'append', 'n' ] );
  var expected = [ 'appendello', 'nello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, src.length > range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 0, 1 ], [ 'append', 'n' ] );
  var expected = [ 'appendllo', 'nllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, src.length < range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 0, 6 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -1, range[ 1 ] === -6 > src.length';
  var got = _._strBut( 'Hello', [ -1, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 1 ] === -2 < src.length';
  var got = _._strBut( 'Hello', [ -1, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 0 ] === range[ 1 ]';
  var got = _._strBut( 'Hello', [ -1, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -1, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, src.length > range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -1, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, src.length < range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -1, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappend', 'Helln' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -2, range[ 1 ] === -6 > src.length';
  var got = _._strBut( 'Hello', [ -2, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] === range[ 0 ]';
  var got = _._strBut( 'Hello', [ -2, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendo', 'Helno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] === -1';
  var got = _._strBut( 'Hello', [ -2, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -2, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, src.length > range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -2, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, src.length < range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -2, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Helappend', 'Heln' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -6, range[ 1 ] === range[ 0 ] < src.length';
  var got = _._strBut( 'Hello', [ -6, -6 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] === range[ 0 ]';
  var got = _._strBut( 'Hello', [ -6, -2 ], [ 'append', 'n' ] );
  var expected = [ 'appendo', 'no' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] === -1';
  var got = _._strBut( 'Hello', [ -6, -1 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -6, 0 ], [ 'append', 'n' ] );
  var expected = [ 'appendello', 'nello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, src.length > range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -6, 1 ], [ 'append', 'n' ] );
  var expected = [ 'appendllo', 'nllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, src.length < range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ -6, 6 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -6 > src.length';
  var got = _._strBut( 'Hello', [ 1, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Happendello', 'Hnello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -2 < src.length';
  var got = _._strBut( 'Hello', [ 1, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Happendo', 'Hno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -1';
  var got = _._strBut( 'Hello', [ 1, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Happendello', 'Hnello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 1, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Happendello', 'Hnello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, src.length > range[ 1 ] === range[ 0 ]';
  var got = _._strBut( 'Hello', [ 1, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Happendllo', 'Hnllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, src.length < range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 1, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Happend', 'Hn' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -6 > src.length';
  var got = _._strBut( 'Hello', [ 2, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -2 < src.length';
  var got = _._strBut( 'Hello', [ 2, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendo', 'Heno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -1';
  var got = _._strBut( 'Hello', [ 2, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 2, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, src.length > range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 2, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, src.length < range[ 1 ] < range[ 0 ]';
  var got = _._strBut( 'Hello', [ 2, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Heappend', 'Hen' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -6 > src.length';
  var got = _._strBut( 'Hello', [ 6, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -2 < src.length';
  var got = _._strBut( 'Hello', [ 6, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -1';
  var got = _._strBut( 'Hello', [ 6, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 6, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, src.length > range[ 1 ] > range[ 0 ]';
  var got = _._strBut( 'Hello', [ 6, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, src.length < range[ 1 ] < range[ 0 ]';
  var got = _._strBut( 'Hello', [ 6, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );
}

//

function strBut( test )
{
  test.open( 'not vectorized' );

  test.case = 'range - number, first symbol';
  var src = 'a\nb\nc';
  var got = _.strBut( src, 0 );
  var expected = '\nb\nc';
  test.identical( got, expected );

  test.case = 'range - number';
  var src = 'a\nb\nc';
  var got = _.strBut( src, 1 );
  var expected = 'ab\nc';
  test.identical( got, expected );

  test.case = 'range - number, last symbol';
  var src = 'a\nb\nc';
  var got = _.strBut( src, 4 );
  var expected = 'a\nb\n';
  test.identical( got, expected );

  test.case = 'range - number bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _.strBut( src, 6 );
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = 'a\nb\nc';
  var got = _.strBut( src, -1 );
  var expected = 'a\nb\n';
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol';
  var src = 'a\nb\nc';
  var got = _.strBut( src, -5 );
  var expected = '\nb\nc';
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then srcStr.length';
  var src = 'a\nb\nc';
  var got = _.strBut( src, -7 );
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty string';
  var got = _.strBut( '', [ 2, 2 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] > range[ 1 ]';
  var got = _.strBut( 'Hello', [ 1, 0 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _.strBut( 'Hello', [ 0, 4 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _.strBut( 'Hello', [ 0, 7 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get subString';
  var got = _.strBut( 'Hello', [ 2, 2 ] );
  var expected = 'Helo';
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _.strBut( 'Hello', [ 3, 4 ] );
  var expected = 'Hel';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _.strBut( 'Hello', [ 4, 0 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _.strBut( 'Hello', [ -2, -3 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _.strBut( 'Hello', [ -5, 4 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _.strBut( 'Hello', [ -7, 4 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( 'Hello', [ -3, -3 ] );
  var expected = 'Helo';
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( 'Hello', [ -5, -5 ] );
  var expected = 'ello';
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( 'Hello', [ -2, -4 ] );
  var expected = 'Hello';
  test.identical( got, expected );

  test.close( 'not vectorized' );

  /* - */

  test.open( 'vectorized, ins - undefined' );

  test.case = 'range - number, first symbol';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 0 );
  var expected = [ '\nb\nc', '', 'bc' ];
  test.identical( got, expected );

  test.case = 'range - number';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 1 );
  var expected = [ 'ab\nc', '', 'ac' ];
  test.identical( got, expected );

  test.case = 'range - number, last symbol of longest string';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 4 );
  var expected = [ 'a\nb\n', '', 'abc' ];
  test.identical( got, expected );

  test.case = 'range - number bigger then longest srcStr.length';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 6 );
  var expected = [ 'a\nb\nc', '', 'abc' ];
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, -1 );
  var expected = [ 'a\nb\n', '', 'ab' ];
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol of longest string';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, -5 );
  var expected = [ '\nb\nc', '', 'abc' ];
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then longest srcStr.length';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, -7 );
  var expected = [ 'a\nb\nc', '', 'abc' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty strings';
  var got = _.strBut( [ '', '', '' ], [ 2, 2 ] );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] > range[ 1 ]';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 1, 0 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 0, 4 ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 0, 7 ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 2, 2 ] );
  var expected = [ 'Helo', 'wold', 'ab', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 3, 4 ] );
  var expected = [ 'Hel', 'wor', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 4, 0 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -3 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, 4 ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -7, 5 ] );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -3, -3 ] );
  var expected = [ 'Helo', 'wold', 'bc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, -5 ] );
  var expected = [ 'ello', 'orld', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -3 ] );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -3 ], undefined );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, 4 ], undefined );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -7, 5 ], undefined );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -3, -3 ], undefined );
  var expected = [ 'Helo', 'wold', 'bc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, -5 ], undefined );
  var expected = [ 'ello', 'orld', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -4 ], undefined );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.close( 'vectorized, ins - undefined' );

  /* - */

  test.open( 'vectorized, ins - string' );

  test.case = 'range - number, first symbol';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 0, 'append\nn' );
  var expected = [ 'append\nn\nb\nc', 'append\nn', 'append\nnbc' ];
  test.identical( got, expected );

  test.case = 'range - number';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 1, 'append\nn' );
  var expected = [ 'aappend\nnb\nc', 'append\nn', 'aappend\nnc' ];
  test.identical( got, expected );

  test.case = 'range - number, last symbol of longest string';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 4, 'append\nn' );
  var expected = [ 'a\nb\nappend\nn', 'append\nn', 'abcappend\nn' ];
  test.identical( got, expected );

  test.case = 'range - number bigger then longest srcStr.length';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, 6, 'append\nn' );
  var expected = [ 'a\nb\ncappend\nn', 'append\nn', 'abcappend\nn' ];
  test.identical( got, expected );

  test.case = 'range - negative number, last symbol';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, -1, 'append\nn' );
  var expected = [ 'a\nb\nappend\nn', 'append\nn', 'abappend\nn' ];
  test.identical( got, expected );

  test.case = 'range - negative number, first symbol of longest string';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, -5, 'append\nn' );
  var expected = [ 'append\nn\nb\nc', 'append\nn', 'append\nnabc' ];
  test.identical( got, expected );

  test.case = 'range - negative number, absolute value bigger then longest srcStr.length';
  var src = [ 'a\nb\nc', '', 'abc' ];
  var got = _.strBut( src, -7, 'append\nn' );
  var expected = [ 'append\nna\nb\nc', 'append\nn', 'append\nnabc' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr - empty strings';
  var got = _.strBut( [ '', '', '' ], [ 2, 4 ], 'append\nn' );
  var expected = [ 'append\nn', 'append\nn', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, range[ 0 ] === range[ 1 ]';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 1, 0 ], 'append\nn' );
  var expected = [ 'Happend\nnello', 'wappend\nnorld', 'aappend\nnbc', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 0, 4 ], 'append\nn' );
  var expected = [ 'append\nn', 'append\nn', 'append\nn', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 0, 7 ], 'append\nn' );
  var expected = [ 'append\nn', 'append\nn', 'append\nn', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 2, 2 ], 'append\nn' );
  var expected = [ 'Heappend\nnlo', 'woappend\nnld', 'abappend\nn', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, get end of string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 3, 4 ], 'append\nn' );
  var expected = [ 'Helappend\nn', 'worappend\nn', 'abcappend\nn', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ 4, 0 ], 'append\nn' );
  var expected = [ 'Hellappend\nno', 'worlappend\nnd', 'abcappend\nn', 'append\nn' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -3 ], 'append\nn' );
  var expected = [ 'Helappend\nnlo', 'worappend\nnld', 'aappend\nnbc', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, 4 ], 'append\nn' );
  var expected = [ 'append\nn', 'append\nn', 'append\nn', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -7, 5 ], 'append\nn' );
  var expected = [ 'append\nn', 'append\nn', 'append\nn', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -3, -3 ], 'append\nn' );
  var expected = [ 'Heappend\nnlo', 'woappend\nnld', 'append\nnbc', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, -5 ], 'append\nn' );
  var expected = [ 'append\nnello', 'append\nnorld', 'append\nnabc', 'append\nn' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -4 ], 'append\nn' );
  var expected = [ 'Helappend\nnlo', 'worappend\nnld', 'aappend\nnbc', 'append\nn' ];
  test.identical( got, expected );

  /* */

  test.case = 'srcStr, range[ 0 ] > range[ 1 ], range[ 0 ] < 0, ins - empty string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -3 ], '' );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get all, range[ 0 ] < 0, ins - empty string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, 4 ], '' );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range bigger than length, range[ 0 ] < 0, ins - empty string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -7, 5 ], '' );
  var expected = [ '', '', '', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get subString, range[ 0 ] and range[ 1 ] < 0, ins - empty string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -3, -3 ], '' );
  var expected = [ 'Helo', 'wold', 'bc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, get start of string, range[ 0 ] and range[ 1 ] < 0, ins - empty string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -5, -5 ], '' );
  var expected = [ 'ello', 'orld', 'abc', '' ];
  test.identical( got, expected );

  test.case = 'srcStr, range reversed, range[ 0 ] and range[ 1 ] < 0, ins - empty string';
  var got = _.strBut( [ 'Hello', 'world', 'abc', '' ], [ -2, -4 ], '' );
  var expected = [ 'Hello', 'world', 'abc', '' ];
  test.identical( got, expected );

  test.close( 'vectorized, ins - string' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strBut() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.strBut( 'abc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strBut( 'abc', [ 1, 2 ], 'some', 'extra' ) );

  test.case = 'wrong type of srcStr';
  test.shouldThrowErrorSync( () => _.strBut( 123, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _.strBut( null, [ 0, 1 ] ) );
  test.shouldThrowErrorSync( () => _.strBut( /a?$/, [ 0, 1 ] ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.strBut( 'abc', null ) );
  test.shouldThrowErrorSync( () => _.strBut( 'abc', 'wrong' ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.strBut( 'abc', [ 1 ] ) );
  test.shouldThrowErrorSync( () => _.strBut( 'abc', [ 1, 2, 3 ] ) );

  test.case = 'wrong ins';
  test.shouldThrowErrorSync( () => _.strBut( 'abc', [ 1, 2 ], { a : 1 } ) );
}


//

function strButInsIsLong( test )
{
  test.open( 'src - single string' );

  test.case = 'srcStr - empty string, range - inside string';
  var got = _.strBut( '', [ 0, -1 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  test.case = 'srcStr - empty string, range - outside string';
  var got = _.strBut( '', [ 0, 2 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  test.case = 'srcStr - empty string, range - outside string';
  var got = _.strBut( '', [ -2, 2 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  /* */

  test.case = 'range - |negative number| > src.length';
  var src = 'a\nb\nc';
  var got = _.strBut( src, -7, [ 'append', 'n' ] );
  var expected = [ 'appenda\nb\nc', 'na\nb\nc' ];
  test.identical( got, expected );

  test.case = 'range - |negative number| < src.length';
  var src = 'a\nb\nc';
  var got = _.strBut( src, -2, [ 'append', 'n' ] );
  var expected = [ 'a\nbappendc', 'a\nbnc' ];
  test.identical( got, expected );

  test.case = 'range - number - -1, last symbol';
  var src = 'a\nb\nc';
  var got = _.strBut( src, -1, [ 'append', 'n' ] );
  var expected = [ 'a\nb\nappend', 'a\nb\nn' ];
  test.identical( got, expected );

  test.case = 'range - number - 0, first symbol';
  var src = 'a\nb\nc';
  var got = _.strBut( src, 0, [ 'append', 'n' ] );
  var expected = [ 'append\nb\nc', 'n\nb\nc' ];
  test.identical( got, expected );

  test.case = 'range - number < src.length';
  var src = 'a\nb\nc';
  var got = _.strBut( src, 1, [ 'append', 'n' ] );
  var expected = [ 'aappendb\nc', 'anb\nc' ];
  test.identical( got, expected );

  test.case = 'range - number > src.length';
  var src = 'a\nb\nc';
  var got = _.strBut( src, 6, [ 'append', 'n' ] );
  var expected = [ 'a\nb\ncappend', 'a\nb\ncn' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -6 > src.length';
  var got = _.strBut( 'Hello', [ 0, -6 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -2 < src.length';
  var got = _.strBut( 'Hello', [ 0, -2 ], [ 'append', 'n' ] );
  var expected = [ 'appendo', 'no' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -1';
  var got = _.strBut( 'Hello', [ 0, -1 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === range[ 0 ]';
  var got = _.strBut( 'Hello', [ 0, 0 ], [ 'append', 'n' ] );
  var expected = [ 'appendello', 'nello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, src.length > range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 0, 1 ], [ 'append', 'n' ] );
  var expected = [ 'appendllo', 'nllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, src.length < range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 0, 6 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -1, range[ 1 ] === -6 > src.length';
  var got = _.strBut( 'Hello', [ -1, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 1 ] === -2 < src.length';
  var got = _.strBut( 'Hello', [ -1, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 0 ] === range[ 1 ]';
  var got = _.strBut( 'Hello', [ -1, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -1, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, src.length > range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -1, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappendo', 'Hellno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, src.length < range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -1, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Hellappend', 'Helln' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -2, range[ 1 ] === -6 > src.length';
  var got = _.strBut( 'Hello', [ -2, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] === range[ 0 ]';
  var got = _.strBut( 'Hello', [ -2, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendo', 'Helno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] === -1';
  var got = _.strBut( 'Hello', [ -2, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -2, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, src.length > range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -2, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Helappendlo', 'Helnlo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, src.length < range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -2, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Helappend', 'Heln' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -6, range[ 1 ] === range[ 0 ] < src.length';
  var got = _.strBut( 'Hello', [ -6, -6 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] === range[ 0 ]';
  var got = _.strBut( 'Hello', [ -6, -2 ], [ 'append', 'n' ] );
  var expected = [ 'appendo', 'no' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] === -1';
  var got = _.strBut( 'Hello', [ -6, -1 ], [ 'append', 'n' ] );
  var expected = [ 'appendHello', 'nHello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -6, 0 ], [ 'append', 'n' ] );
  var expected = [ 'appendello', 'nello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, src.length > range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -6, 1 ], [ 'append', 'n' ] );
  var expected = [ 'appendllo', 'nllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, src.length < range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ -6, 6 ], [ 'append', 'n' ] );
  var expected = [ 'append', 'n' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -6 > src.length';
  var got = _.strBut( 'Hello', [ 1, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Happendello', 'Hnello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -2 < src.length';
  var got = _.strBut( 'Hello', [ 1, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Happendo', 'Hno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -1';
  var got = _.strBut( 'Hello', [ 1, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Happendello', 'Hnello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 1, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Happendello', 'Hnello' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, src.length > range[ 1 ] === range[ 0 ]';
  var got = _.strBut( 'Hello', [ 1, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Happendllo', 'Hnllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, src.length < range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 1, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Happend', 'Hn' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -6 > src.length';
  var got = _.strBut( 'Hello', [ 2, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -2 < src.length';
  var got = _.strBut( 'Hello', [ 2, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendo', 'Heno' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -1';
  var got = _.strBut( 'Hello', [ 2, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 2, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, src.length > range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 2, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Heappendllo', 'Henllo' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, src.length < range[ 1 ] < range[ 0 ]';
  var got = _.strBut( 'Hello', [ 2, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Heappend', 'Hen' ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -6 > src.length';
  var got = _.strBut( 'Hello', [ 6, -6 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -2 < src.length';
  var got = _.strBut( 'Hello', [ 6, -2 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -1';
  var got = _.strBut( 'Hello', [ 6, -1 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 6, 0 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, src.length > range[ 1 ] > range[ 0 ]';
  var got = _.strBut( 'Hello', [ 6, 1 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, src.length < range[ 1 ] < range[ 0 ]';
  var got = _.strBut( 'Hello', [ 6, 6 ], [ 'append', 'n' ] );
  var expected = [ 'Helloappend', 'Hellon' ];
  test.identical( got, expected );

  test.close( 'src - single string' );

  /* - */

  test.open( 'src - vector of strings' );

  test.open( 'range - number' );

  test.case = '|negative number| >= src.length';
  var src = [ 'aa' + 'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, -5, [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa' + 'aa', 'ddaa' + 'aa' ], [ 'bb', 'dd' ], [ 'bbc\ncc', 'ddc\ncc' ] ];
  test.identical( got, expected );

  test.case = '|-1| < src.length';
  var src = [ 'aa' + 'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, -1, [ 'bb', 'dd' ] );
  var expected = [ [ 'aa' + 'abb', 'aa' + 'add' ], [ 'bb', 'dd' ], [ 'cc\ncbb', 'cc\ncdd' ] ];
  test.identical( got, expected );

  test.case = 'range === 0';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, 0, [ 'bb', 'dd' ] );
  var expected = [ [ 'bba'+'aa', 'dda'+'aa' ], [ 'bb', 'dd' ], [ 'bbc\ncc', 'ddc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range === 1 < src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, 1, [ 'bb', 'dd' ] );
  var expected = [ [ 'abbaa', 'addaa' ], [ 'bb', 'dd' ], [ 'cbb\ncc', 'cdd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range >= src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, 5, [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'aabb', 'aa'+'aadd' ], [ 'bb', 'dd' ], [ 'cc\nccbb', 'cc\nccdd' ] ];
  test.identical( got, expected );

  test.close( 'range - number' );

  /* */

  test.open( 'range is cinterval' );

  test.case = 'srcStr - empty strings, range - inside string';
  var got = _.strBut( [ '', '' ], [ 0, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bb', 'dd' ], [ 'bb', 'dd' ] ];
  test.identical( got, expected );

  test.case = 'srcStr - empty strings, range - outside string';
  var got = _.strBut( [ '', '' ], [ 0, 2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bb', 'dd' ], [ 'bb', 'dd' ] ];
  test.identical( got, expected );

  test.case = 'srcStr - empty strings, range - outside string';
  var got = _.strBut( [ '', '' ], [ -2, 2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bb', 'dd' ], [ 'bb', 'dd' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -6 > src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 0, -6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa'+'aa', 'ddaa'+'aa' ], [ 'bb', 'dd' ], [ 'bbcc\ncc', 'ddcc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -2 < src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 0, -2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bba', 'dda' ], [ 'bb', 'dd' ], [ 'bbc', 'ddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === -1';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 0, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa'+'aa', 'ddaa'+'aa' ], [ 'bb', 'dd' ], [ 'bbcc\ncc', 'ddcc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, range[ 1 ] === range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 0, 0 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa'+'a', 'ddaa'+'a' ], [ 'bb', 'dd' ], [ 'bbc\ncc', 'ddc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, src.length > range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 0, 1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa', 'ddaa' ], [ 'bb', 'dd' ], [ 'bb\ncc', 'dd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 0, src.length < range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 0, 6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bb', 'dd' ], [ 'bb', 'dd' ], [ 'bb', 'dd' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -1, range[ 1 ] === -6 > src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -1, -6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'abba', 'aa'+'adda' ], [ 'bb', 'dd' ], [ 'cc\ncbbc', 'cc\ncddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 1 ] === -2 < src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -1, -2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'abba', 'aa'+'adda' ], [ 'bb', 'dd' ], [ 'cc\ncbbc', 'cc\ncddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 0 ] === range[ 1 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -1, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'abba', 'aa'+'adda' ], [ 'bb', 'dd' ], [ 'cc\ncbbc', 'cc\ncddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -1, 0 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'abba', 'aa'+'adda' ], [ 'bb', 'dd' ], [ 'cc\ncbbc', 'cc\ncddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, src.length > range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -1, 1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'abba', 'aa'+'adda' ], [ 'bb', 'dd' ], [ 'cc\ncbbc', 'cc\ncddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -1, src.length < range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -1, 6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'abb', 'aa'+'add' ], [ 'bb', 'dd' ], [ 'cc\ncbb', 'cc\ncdd' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -2, range[ 1 ] === -6 > src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -2, -6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'cc\nbbcc', 'cc\nddcc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] === range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -2, -2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabba', 'aadda' ], [ 'bb', 'dd' ], [ 'cc\nbbc', 'cc\nddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] === -1';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -2, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'cc\nbbcc', 'cc\nddcc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -2, 0 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'cc\nbbcc', 'cc\nddcc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, src.length > range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -2, 1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'cc\nbbcc', 'cc\nddcc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -2, src.length < range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -2, 6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabb', 'aadd' ], [ 'bb', 'dd' ], [ 'cc\nbb', 'cc\ndd' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === -6, range[ 1 ] === range[ 0 ] < src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -6, -6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa'+'aa', 'ddaa'+'aa' ], [ 'bb', 'dd' ], [ 'bbcc\ncc', 'ddcc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] === range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -6, -2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bba', 'dda' ], [ 'bb', 'dd' ], [ 'bbc', 'ddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] === -1';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -6, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa'+'aa', 'ddaa'+'aa' ], [ 'bb', 'dd' ], [ 'bbcc\ncc', 'ddcc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -6, 0 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa'+'a', 'ddaa'+'a' ], [ 'bb', 'dd' ], [ 'bbc\ncc', 'ddc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, src.length > range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -6, 1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bbaa', 'ddaa' ], [ 'bb', 'dd' ], [ 'bb\ncc', 'dd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === -6, src.length < range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ -6, 6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'bb', 'dd' ], [ 'bb', 'dd' ], [ 'bb', 'dd' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -6 > src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 1, -6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'abbaa'+'a', 'addaa'+'a' ], [ 'bb', 'dd' ], [ 'cbbc\ncc', 'cddc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -2 < src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 1, -2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'abba', 'adda' ], [ 'bb', 'dd' ], [ 'cbbc', 'cddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] === -1';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 1, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'abbaa'+'a', 'addaa'+'a' ], [ 'bb', 'dd' ], [ 'cbbc\ncc', 'cddc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 1, 0 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'abbaa'+'a', 'addaa'+'a' ], [ 'bb', 'dd' ], [ 'cbbc\ncc', 'cddc\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, src.length > range[ 1 ] === range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 1, 1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'abbaa', 'addaa' ], [ 'bb', 'dd' ], [ 'cbb\ncc', 'cdd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 1, src.length < range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 1, 6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'abb', 'add' ], [ 'bb', 'dd' ], [ 'cbb', 'cdd' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -6 > src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 2, -6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'ccbb\ncc', 'ccdd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -2 < src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 2, -2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabba', 'aadda' ], [ 'bb', 'dd' ], [ 'ccbbc', 'ccddc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] === -1';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 2, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'ccbb\ncc', 'ccdd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 2, 0 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'ccbb\ncc', 'ccdd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, src.length > range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 2, 1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabbaa', 'aaddaa' ], [ 'bb', 'dd' ], [ 'ccbb\ncc', 'ccdd\ncc' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 2, src.length < range[ 1 ] < range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 2, 6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aabb', 'aadd' ], [ 'bb', 'dd' ], [ 'ccbb', 'ccdd' ] ];
  test.identical( got, expected );

  /* */

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -6 > src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 6, -6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'aabb', 'aa'+'aadd' ], [ 'bb', 'dd' ], [ 'cc\nccbb', 'cc\nccdd' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -2 < src.length';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 6, -2 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'aabb', 'aa'+'aadd' ], [ 'bb', 'dd' ], [ 'cc\nccbb', 'cc\nccdd' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] === -1';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 6, -1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'aabb', 'aa'+'aadd' ], [ 'bb', 'dd' ], [ 'cc\nccbb', 'cc\nccdd' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 6, 0 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'aabb', 'aa'+'aadd' ], [ 'bb', 'dd' ], [ 'cc\nccbb', 'cc\nccdd' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, src.length > range[ 1 ] > range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 6, 1 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'aabb', 'aa'+'aadd' ], [ 'bb', 'dd' ], [ 'cc\nccbb', 'cc\nccdd' ] ];
  test.identical( got, expected );

  test.case = 'range[ 0 ] === 6, src.length < range[ 1 ] < range[ 0 ]';
  var src = [ 'aa'+'aa', '', 'cc\ncc' ];
  var got = _.strBut( src, [ 6, 6 ], [ 'bb', 'dd' ] );
  var expected = [ [ 'aa'+'aabb', 'aa'+'aadd' ], [ 'bb', 'dd' ], [ 'cc\nccbb', 'cc\nccdd' ] ];
  test.identical( got, expected );

  test.close( 'range is cinterval' );

  test.close( 'src - vector of strings' );
}

//

function strUnjoin( test )
{
  var any = _.strUnjoin.any;

  test.case = 'case 1';
  var got = _.strUnjoin( 'prefix_something_postfix', [ 'prefix', any, 'postfix' ] );
  var expected = [ 'prefix', '_something_', 'postfix' ];
  test.identical( got, expected );

  test.case = 'case 2a';
  var got = _.strUnjoin( 'prefix_something_postfix', [ any, 'something', 'postfix' ] );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'case 2b';
  var got = _.strUnjoin( 'prefix_something_postfix', [ any, 'something', any, 'postfix' ] );
  var expected = [ 'prefix_', 'something', '_', 'postfix' ];
  test.identical( got, expected );

  test.case = 'case 3a';
  var got = _.strUnjoin( 'prefix_something_postfix', [ 'something', 'postfix', any ] );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'case 3b';
  var got = _.strUnjoin( 'prefix_something_postfix', [ any, 'something', any, 'postfix', any ] );
  var expected = [ 'prefix_', 'something', '_', 'postfix', '' ];
  test.identical( got, expected );

  test.case = 'case 4';
  var got = _.strUnjoin( 'abc', [ any ] );
  var expected = [ 'abc' ];
  test.identical( got, expected );

  test.case = 'case 5';
  var got = _.strUnjoin( 'abc', [ 'a', any ] );
  var expected = [ 'a', 'bc' ];
  test.identical( got, expected );

  test.case = 'case 5b';
  var got = _.strUnjoin( 'abc', [ any, 'a'  ] );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'case 6';
  var got = _.strUnjoin( 'abc', [ 'b', any ] );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'case 6b';
  var got = _.strUnjoin( 'abc', [ any, 'b' ] );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'case 7';
  var got = _.strUnjoin( 'abc', [ any, 'c' ] );
  var expected = [ 'ab', 'c' ];
  test.identical( got, expected );

  test.case = 'case 7b';
  var got = _.strUnjoin( 'abc', [ 'c', any ] );
  var expected = undefined;
  test.identical( got, expected );

  test.case = 'case 8';
  var got = _.strUnjoin( 'abc', [ 'a', any, 'c' ] );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'case 9';
  var got = _.strUnjoin( 'abc', [ any, 'b', any ] );
  var expected = [ 'a', 'b', 'c' ];
  test.identical( got, expected );

  test.case = 'case 9b';
  var got = _.strUnjoin( 'abc', [ any, 'c', any ] );
  var expected = [ 'ab', 'c', '' ];
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin();
  });

  test.case = 'Not enough arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( '1' );
  });

  test.case = 'Too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( '1', '2', '3' );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 123, [] );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', 123 );
  });

  test.case = 'invalid array element type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', [ 1, 'two' ] );
  });

  test.case = 'null first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( null, [] );
  });

  test.case = 'null second arg type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', null );
  });

  test.case = 'null array element type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', [ null, 'two' ] );
  });

  test.case = 'NaN first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( NaN, [] );
  });

  test.case = 'NaN second arg type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', NaN );
  });

  test.case = 'NaN array element type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', [ NaN, 'two' ] );
  });

  test.case = 'RegExp first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( /\d$/, [] );
  });

  test.case = 'RegExp second arg type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', /\D$/ );
  });

  test.case = 'RegExp array element type';
  test.shouldThrowErrorSync( function()
  {
    _.strUnjoin( 'one two', [ /^\d/, 'two' ] );
  });

}

//--
// joiner
//--

function strDup( test )
{

  test.case = 'srcString  and number of times remain unchanged';
  var srcString = 'Hi, ';
  var times = 3;
  var got = _.strDup( srcString, times );

  var expected = 'Hi, Hi, Hi, ';
  test.identical( got, expected );

  var oldSrcString = 'Hi, ';
  test.identical( srcString, oldSrcString );

  var oldTimes = 3;
  test.identical( times, oldTimes );

  test.case = 'concatenation test';
  var got = _.strDup( 'a', 2 );
  var expected = 'aa';
  test.identical( got, expected );

  test.case = 'simple string';
  var got = _.strDup( 'ab', 2 );
  var expected = 'abab';
  test.identical( got, expected );

  test.case = 'invalid times value';
  var got = _.strDup( 'a', -2 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'zero times';
  var got = _.strDup( 'a', 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'returns the empty string';
  var got = _.strDup( 'abc ', 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'Second argument NaN';
  var got = _.strDup( 'abc', NaN );
  var expected = '';
  test.identical( got, expected );

  test.case = 'Two words with a spaces';
  var got = _.strDup( 'Hi world ', 2 );
  var expected = 'Hi world Hi world ';
  test.identical( got, expected );

  test.case = 'one space';
  var got = _.strDup( ' ', 2 );
  var expected = '  ';
  test.identical( got, expected );

  test.case = 'returns the first copy of the given string';
  var got = _.strDup( 'abc', 1 );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'copies and concatenates first argument three times';
  var got = _.strDup( 'abc', 3 );
  var expected = 'abcabcabc';
  test.identical( got, expected );

  test.case = 'copies and concatenates first argument 10 times';
  var got = _.strDup( '1', 10 );
  var expected = '1111111111';
  test.identical( got, expected );

  test.case = 'vectorized input concatenated negative times';
  var got = _.strDup( [ 'ab', 'cd', 'ef' ], - 2 );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'vectorized input concatenated zero times';
  var got = _.strDup( [ 'ab', 'cd', 'ef' ], 0 );
  var expected = [ '', '', '' ];
  test.identical( got, expected );

  test.case = 'vectorized input concatenated one time';
  var got = _.strDup( [ 'ab', 'cd', 'ef' ], 1 );
  var expected = [ 'ab', 'cd', 'ef' ];
  test.identical( got, expected );

  test.case = 'vectorized input concatenated 3 times';
  var got = _.strDup( [ 'ab', 'cd', 'ef' ], 3 );
  var expected = [ 'ababab', 'cdcdcd', 'efefef' ];
  test.identical( got, expected );

  test.case = 'Empty vectorized input';
  var got = _.strDup( [ ], 3 );
  var expected = [];
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strDup();
  });

  test.case = 'second argument is not provided';
  test.shouldThrowErrorSync( function( )
  {
    _.strDup( 'a' );
  } );

  test.case = 'first argument is not provided';
  test.shouldThrowErrorSync( function( )
  {
    _.strDup( 3 );
  } );

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( '1' );
  });

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( '1', '2', 3 );
  });

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( '1', '2', '3' );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( 123, 1 );
  });

  test.case = 'times is not number';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( 'ab', [ 3, 4 ] );
  });

  test.case = 'invalid second arg type';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( 'one', 'two'  );
  });

  test.case = 'second argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strDup( 'a', 'wrong argument' );
  } );

  test.case = 'invalid first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( 1, 2 );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( [ 1, 2 ], 2 );
  });

  test.case = 'invalid first argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( [ '1', 2 ], 2 );
  });

  test.case = 'invalid second argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( '1', '2' );
  });

  test.case = 'null argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( null, 2 );
  });

  test.case = 'null second argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( '2', null );
  });

  test.case = 'undefined argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( undefined, 2 );
  });

  test.case = 'undefined second argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( '2', undefined );
  });

  test.case = 'NaN argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( NaN, 2 );
  });

  test.case = 'Regexp argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( /^\d/, 2 );
  });

  test.case = 'regExp second argument';
  test.shouldThrowErrorSync( function()
  {
    _.strDup( '2', /^\d/ );
  });


}

//

function strJoin( test )
{

  /* - */

  test.open( 'single argument' );

  test.case = 'join nothing';
  var got = _.strJoin([]);
  var expected = [];
  test.identical( got, expected );

  test.case = 'join empty vector';
  var got = _.strJoin([ [] ]);
  var expected = [];
  test.identical( got, expected );

  test.case = 'join empty vectors';
  var got = _.strJoin([ [], [] ]);
  var expected = [];
  test.identical( got, expected );

  test.case = 'join empty vector and string';
  var got = _.strJoin([ [], 'abc' ]);
  var expected = [];
  test.identical( got, expected );

  // test.case = 'join empty vector and strings';
  // var got = _.strJoin([ [], [ 'abc', 'def' ] ]);
  // var expected = [];
  // test.identical( got, expected );

  test.case = 'join numbers';
  var got = _.strJoin([ 1, 2, 3 ]);
  var expected = '123';
  test.identical( got, expected );

  test.case = 'join strings';
  var got = _.strJoin([ '1', '2', '3' ]);
  var expected = '123';
  test.identical( got, expected );

  test.case = 'join two arrays';
  var got = _.strJoin([ [ 'b', 'c' ], [ 'x', 'y' ] ]);
  var expected = [ 'bx', 'cy' ];
  test.identical( got, expected );

  test.case = 'join string + number';
  var got = _.strJoin([ 1, 2, '3' ]);
  var expected = '123';
  test.identical( got, expected );

  test.case = 'join array + string';
  var got = _.strJoin([ [ 1, 2 ], '3' ]);
  var expected = [ '13', '23' ];
  test.identical( got, expected );

  test.case = 'join array + number';
  var got = _.strJoin([ [ 1, 2 ], 3 ]);
  var expected = [ '13', '23' ];
  test.identical( got, expected );

  test.case = 'one argument';
  var got = _.strJoin([ '1' ]);
  var expected = '1';
  test.identical( got, expected );

  test.case = 'NaN argument';
  var got = _.strJoin([ '1', NaN ]);
  var expected = '1NaN';
  test.identical( got, expected );

  test.case = 'different types';
  var got = _.strJoin([ 1, '2', [ '3', 4 ], 5, '6' ]);
  var expected = [ '12356', '12456' ];
  test.identical( got, expected );

  test.case = 'different types with two arrays';
  var got = _.strJoin([ '1', 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ]);
  var expected = [ '1236', '1247', '1258' ];
  test.identical( got, expected );

  test.close( 'single argument' );

  /* - */

  test.open( 'two arguments' );

  test.case = 'join number array with joiner';
  var got = _.strJoin( [ 1, 2 ], '3' );
  var expected = '132';
  test.identical( got, expected );

  test.case = 'join string array with joiner';
  var got = _.strJoin( [ 'b', 'c' ], '0' );
  var expected = 'b0c';
  test.identical( got, expected );

  test.case = 'join string array with joiner';
  var got = _.strJoin( [ 'Hello', 'world', '!' ], ' ' );
  var expected = 'Hello world !';
  test.identical( got, expected );

  test.case = 'join array and joiner';
  var got = _.strJoin( [ 0, [ '1', '2' ] ], '3' );
  var expected = [ '031', '032' ];
  test.identical( got, expected );

  test.case = 'join arrays and joiner';
  var got = _.strJoin( [ 0, [ '1', '2' ], [ 'a', 'b' ] ], '-' );
  var expected = [ '0-1-a', '0-2-b' ];
  test.identical( got, expected );

  test.case = 'join umber arrays and joiner';
  var got = _.strJoin( [ [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ] ], 'x' );
  var expected = [ '0x1x2', '3x4x5', '6x7x8' ];
  test.identical( got, expected );

  test.case = 'join array + string + joiner';
  var got = _.strJoin([ [ 1, 2 ], '3' ], '__' );
  var expected = [ '1__3', '2__3' ];
  test.identical( got, expected );

  test.case = 'Undefined joiner';
  var got = _.strJoin([ [ 1, 2 ], '3' ], undefined );
  var expected = [ '13', '23' ];
  test.identical( got, expected );

  test.close( 'two arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'No arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( );
  });

  test.case = 'Too many arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( '1', '2', '3' );
  });

  test.case = 'Empty arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( [ ], [ ] );
  });

  test.case = 'invalid argument type in array';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin([ { a : 1 }, [ 1 ], [ 2 ] ]);
  });

  test.case = 'null argument in array';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin([ '1', null ]);
  });

  test.case = 'null argument in array';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin([ '1', undefined ]);
  });

  test.case = 'RegExp argument in array';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin([ '1', /a?/ ]);
  });

  test.case = 'arrays with different lengths in array';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin([ [ 1, 2 ], [ 1 ], [ 2 ] ]);
  });

  test.case = 'invalid argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( { a : 1 }, [ 1 ] );
  });

  test.case = 'null argument';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( [ '1' ], null, null );
  });

  test.case = 'NaN argument';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( [ '1' ], NaN );
  });

  test.case = 'Wrong argument';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( '1', 2 );
  });

  test.case = 'RegExp argument';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( '1', /a?/ );
  });

  test.case = 'arrays with different length';
  test.shouldThrowErrorSync( function()
  {
    _.strJoin( [ 1, 2 ], [ 1 ] );
  });

}

//

function strJoinPath( test )
{
  test.case = 'Empty';
  var got = _.strJoinPath( [], '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'join string array with joiner';
  var got = _.strJoinPath( [ 'b', 'c' ], '0' );
  var expected = 'b0c';
  test.identical( got, expected );

  test.case = 'join string array with joiner';
  var got = _.strJoinPath( [ 'Hello', 'world', '!' ], ' ' );
  var expected = 'Hello world !';
  test.identical( got, expected );

  test.case = 'join array with joiner';
  var got = _.strJoinPath( [ '1', '2', '4' ], '/' );
  var expected = '1/2/4';
  test.identical( got, expected );

  test.case = 'join array with joiner ( only numbers )';
  var got = _.strJoinPath( [ 1, 2, 4 ], '/' );
  var expected = '1/2/4';
  test.identical( got, expected );

  test.case = 'join array with joiner ( string and numbers )';
  var got = _.strJoinPath( [ 1, '4 is smaller than 2', 4 ], '/' );
  var expected = '1/4 is smaller than 2/4';
  test.identical( got, expected );

  test.case = 'join array and joiner';
  var got = _.strJoinPath( [ '0', [ '1', '2' ] ], '3' );
  var expected = [ '031', '032' ];
  test.identical( got, expected );

  test.case = 'join arrays and joiner';
  var got = _.strJoinPath( [ '0', [ '1', '2' ], [ 'a', 'b' ] ], '-' );
  var expected = [ '0-1-a', '0-2-b' ];
  test.identical( got, expected );

  test.case = 'join arrays and joiner';
  var got = _.strJoinPath( [ [ '0', '3', '6' ], [ '1', '4', '7' ], [ '2', '5', '8' ] ], 'x' );
  var expected = [ '0x1x2', '3x4x5', '6x7x8' ];
  test.identical( got, expected );

  test.case = 'join array + string + joiner';
  var got = _.strJoinPath([ [ '1', '2' ], '3' ], '__' );
  var expected = [ '1__3', '2__3' ];
  test.identical( got, expected );

  test.case = 'join array + string + joiner ( with numbers )';
  var got = _.strJoinPath([ [ 1, 2 ], 3, 'string' ], '__' );
  var expected = [ '1__3__string', '2__3__string' ];
  test.identical( got, expected );

  test.case = 'arrays with different lengths in array';
  var src = [ [ [ 1, [ 2 ] ], 2 ],  [ 3, 4 ], 2 ];
  var got = _.strJoinPath( src, '/' );
  var expected = [ '1,2/3/2', '2/4/2' ];
  test.identical( got, expected );

  /* Joiner in src strings */

  test.case = 'String does not end with joiner';
  var got = _.strJoinPath( [ 'Hi,', 'world' ], '/' );
  var expected = 'Hi,/world';
  test.identical( got, expected );

  test.case = 'String ends with joiner';
  var got = _.strJoinPath( [ 'Hi,', 'world' ], ',' );
  var expected = 'Hi,world';
  test.identical( got, expected );

  test.case = 'String ends with joiner';
  var got = _.strJoinPath( [ 'Hi,', 'world', 2 ], ',' );
  var expected = 'Hi,world,2';
  test.identical( got, expected );

  test.case = 'String does not begin with joiner';
  var got = _.strJoinPath( [ 'Hi', ',world' ], '/' );
  var expected = 'Hi/,world';
  test.identical( got, expected );

  test.case = 'String begins with joiner';
  var got = _.strJoinPath( [ 'Hi', ',world' ], ',' );
  var expected = 'Hi,world';
  test.identical( got, expected );

  test.case = 'String begins and ends with joiner';
  var got = _.strJoinPath( [ '/1/', '/2/', '/3/', 4, '/5/' ], '/' );
  var expected = '/1/2/3/4/5/';
  test.identical( got, expected );

  test.case = 'String begins and ends with joiner';
  var got = _.strJoinPath( [ '/1//', '/2//', '//4/' ], '/' );
  var expected = '/1//2///4/';
  test.identical( got, expected );

  /* - */

  test.case = 'srcs is unroll';
  var srcs = _.unroll.from( [ 'he', '.llo.', ',', 'world', '!' ] );
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, 'he.llo.,.world.!' );

  test.case = 'srcs is unroll, unroll has nested unroll';
  var srcs = _.unroll.from( [ 'he', '.llo.', _.unroll.make( [ ',', 'world', '!' ] ) ] );
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, 'he.llo.,.world.!' );

  test.case = 'srcs is array, has nested unrolls';
  var srcs = [ 'he', '.llo.', _.unroll.make( [ ',', 'world', '!' ] ) ];
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, [ 'he.llo.,', 'he.llo.world', 'he.llo.!' ] );

  var srcs = [ _.unroll.from( [ 'he', '.llo.' ] ), _.unroll.make( [ ',', 'world' ] ) ];
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, [ 'he.,', '.llo.world' ] );

  /* - */

  test.case = 'srcs is argumentsArray';
  var srcs = _.argumentsArray.make( [ 'he', '.llo.', ',', 'world', '!' ] );
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, 'he.llo.,.world.!' );

  test.case = 'srcs is Array';
  var srcs = new Array( 'he', '.llo.', ',', 'world', '!' );
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, 'he.llo.,.world.!' );

  test.case = 'srcs is F32x';
  var arr = new F32x( [ 1, 2, 3, 4 ] );
  var srcs = _.array.from( arr );
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, '1.2.3.4' );

  var arr = new F32x( [ 1, 2, 3, 'str' ] );
  var srcs = _.array.from( arr );
  var got = _.strJoinPath( srcs, '.' );
  test.identical( got, '1.2.3.NaN' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strJoinPath() );

  test.case = 'one argument';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1' ] ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1' ], '2', '3' ) );

  test.case = 'invalid argument type in array';
  var src = [ { a : 1 }, [ '1' ] ];
  test.shouldThrowErrorSync( () => _.strJoinPath( src, '/' ) );

  test.case = 'null argument in array';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1', null ], '/' ) );

  test.case = 'undefined argument in array';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1', undefined ], '/' ) );

  test.case = 'RegExp argument in array';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1', /a?/ ], '/' ) );

  test.case = 'arrays with different lengths in array';
  var src = [ [ 1, 2 ], [ 1 ], [ 2 ] ];
  test.shouldThrowErrorSync( () => _.strJoinPath( src, '/' ) );

  test.case = 'invalid type of joiner';
  var src = [ 'foo', 'bar', 'baz' ];
  test.shouldThrowErrorSync( () => _.strJoinPath( src, [ 1 ] ) );

  test.case = 'joiner is null';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1' ], null ) );

  test.case = 'joiner is NaN';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1' ], NaN ) );

  test.case = 'srcs is not arrayLike';
  test.shouldThrowErrorSync( () => _.strJoinPath( '1', '/' ) );

  test.case = 'RegExp argument';
  test.shouldThrowErrorSync( () => _.strJoinPath( [ '1' ], /a?/ ) );

  test.case = 'arrays with different length';
  var src = [ [ 1, 2 ], [ 1 ] ];
  test.shouldThrowErrorSync( () => _.strJoinPath( src, '/' ) );
}

//--
// liner
//--

function strLinesIndentation( test )
{
  test.open( 'src - string, tab - string' );

  test.case = 'empty line';
  var got = _.strLinesIndentation( '', '_' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string without new line symbol';
  var got = _.strLinesIndentation( 'abc', '_' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string with new line symbol at the end';
  var got = _.strLinesIndentation( 'abc\n', '_' );
  var expected = 'abc\n_';
  test.identical( got, expected );

  test.case = 'string with new line symbol at the start';
  var got = _.strLinesIndentation( '\nabc', '_' );
  var expected = '\n_abc';
  test.identical( got, expected );

  test.case = 'new line symbol at the mid';
  var got = _.strLinesIndentation( 'a\nb', '_' );
  var expected = 'a\n_b';
  test.identical( got, expected );

  test.case = 'tab before first and each new line';
  var got = _.strLinesIndentation( '\na\nb\nc', '_' );
  var expected = '\n_a\n_b\n_c';
  test.identical( got, expected );

  test.case = 'only new line symbols';
  var got = _.strLinesIndentation( '\n\n\n', '_' );
  var expected = '\n_\n_\n_';
  test.identical( got, expected );

  test.case = 'tab - special symbol';
  var got = _.strLinesIndentation( 'a\nb\nc', '\t' );
  var expected = 'a\n\tb\n\tc';
  test.identical( got, expected );

  test.close( 'src - string, tab - string' );

  /* - */

  test.open( 'src - string, tab - number' );

  test.case = 'empty line';
  var got = _.strLinesIndentation( '', 2 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'string without new line symbol';
  var got = _.strLinesIndentation( 'abc', 2 );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'string with new line symbol at the end';
  var got = _.strLinesIndentation( 'abc\n', 2 );
  var expected = 'abc\n  ';
  test.identical( got, expected );

  test.case = 'string with new line symbol at the start';
  var got = _.strLinesIndentation( '\nabc', 2 );
  var expected = '\n  abc';
  test.identical( got, expected );

  test.case = 'new line symbol at the mid';
  var got = _.strLinesIndentation( 'a\nb', 2 );
  var expected = 'a\n  b';
  test.identical( got, expected );

  test.case = 'tab before first and each new line';
  var got = _.strLinesIndentation( '\na\nb\nc', 2 );
  var expected = '\n  a\n  b\n  c';
  test.identical( got, expected );

  test.case = 'only new line symbols';
  var got = _.strLinesIndentation( '\n\n\n', 2 );
  var expected = '\n  \n  \n  ';
  test.identical( got, expected );

  test.case = 'tab - negative number';
  var got = _.strLinesIndentation( 'a\nb\nc', -1 );
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.close( 'src - string, tab - number' );

  /* - */

  test.open( 'src - array, tab - string' );

  test.case = 'single empty string';
  var got = _.strLinesIndentation( [ '' ], '_' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'single string';
  var got = _.strLinesIndentation( [ 'abc' ], '_' );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'last element - empty string';
  var got = _.strLinesIndentation( [ 'abc', '' ], '_' );
  var expected = 'abc\n_';
  test.identical( got, expected );

  test.case = 'first element - empty string';
  var got = _.strLinesIndentation( [ '', 'abc' ], '_' );
  var expected = '\n_abc';
  test.identical( got, expected );

  test.case = 'two strings';
  var got = _.strLinesIndentation( [ 'a', 'b' ], '_' );
  var expected = 'a\n_b';
  test.identical( got, expected );

  test.case = 'first element - empty string';
  var got = _.strLinesIndentation( [ '', 'a', 'b', 'c' ], '_' );
  var expected = '\n_a\n_b\n_c';
  test.identical( got, expected );

  test.case = 'only empty strings';
  var got = _.strLinesIndentation( [ '', '', '', '' ], '_' );
  var expected = '\n_\n_\n_';
  test.identical( got, expected );

  test.case = 'tab - special symbol';
  var got = _.strLinesIndentation( [ 'a', 'b', 'c' ], '\t' );
  var expected = 'a\n\tb\n\tc';
  test.identical( got, expected );

  test.close( 'src - array, tab - string' );

  /* - */

  test.open( 'src - array, tab - number' );

  test.case = 'single empty string';
  var got = _.strLinesIndentation( [ '' ], 2 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'single string';
  var got = _.strLinesIndentation( [ 'abc' ], 2 );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'last element - empty string';
  var got = _.strLinesIndentation( [ 'abc', '' ], 2 );
  var expected = 'abc\n  ';
  test.identical( got, expected );

  test.case = 'first element - empty string';
  var got = _.strLinesIndentation( [ '', 'abc' ], 2 );
  var expected = '\n  abc';
  test.identical( got, expected );

  test.case = 'two strings';
  var got = _.strLinesIndentation( [ 'a', 'b' ], 2 );
  var expected = 'a\n  b';
  test.identical( got, expected );

  test.case = 'first element - empty string';
  var got = _.strLinesIndentation( [ '', 'a', 'b', 'c' ], 2 );
  var expected = '\n  a\n  b\n  c';
  test.identical( got, expected );

  test.case = 'only empty strings';
  var got = _.strLinesIndentation( [ '', '', '', '' ], 2 );
  var expected = '\n  \n  \n  ';
  test.identical( got, expected );

  test.case = 'tab - negative number';
  var got = _.strLinesIndentation( [ 'a', 'b', 'c' ], -1 );
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.close( 'src - array, tab - number' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strLinesIndentation() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strLinesIndentation( 'one', 'two', 'three' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strLinesIndentation( 12, 'two' ) );

  test.case = 'wrong type of tab';
  test.shouldThrowErrorSync( () => _.strLinesIndentation( 'one', [] ) );
}

//

function strLinesBut( test )
{
  test.open( 'src - string, range' );

  test.case = 'src - empty string, range - number';
  var src = '';
  var got = _.strLinesBut( src, 0 );
  test.identical( got, '' );

  test.case = 'src - empty string, range - range';
  var src = '';
  var got = _.strLinesBut( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative number';
  var src = '';
  var got = _.strLinesBut( src, -2 );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative range[ 0 ]';
  var src = '';
  var got = _.strLinesBut( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative range[ 1 ]';
  var src = '';
  var got = _.strLinesBut( src, [ 0, -5 ] );
  test.identical( got, '' );

  /* */

  test.case = 'src - string without new lines, range - number';
  var src = 'abc';
  var got = _.strLinesBut( src, 0 );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - number > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, 2 );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - range';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - range[ 0 ] > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 2, 5 ] );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - negative number';
  var src = 'abc';
  var got = _.strLinesBut( src, -2 );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - negative range[ 0 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - negative range[ 1 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, -5 ] );
  test.identical( got, 'abc' );

  /* */

  test.case = 'src - string with new lines, range - number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 0 );
  test.identical( got, 'def\nghi' );

  test.case = 'src - string with new lines, range - number > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 5 );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - string with new lines, range - range';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - string with new lines, range - range[ 0 ] > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 4, 5 ] );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - string with new lines, range - negative number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, -2 );
  test.identical( got, 'abc\nghi' );

  test.case = 'src - string with new lines, range - negative range[ 0 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - string with new lines, range - negative range[ 1 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, -5 ] );
  test.identical( got, 'abc\ndef\nghi' );

  test.close( 'src - string, range' );

  /* - */

  test.open( 'src - string, range, ins - undefined' );

  test.case = 'src - empty string, range - number';
  var src = '';
  var got = _.strLinesBut( src, 0, undefined );
  test.identical( got, '' );

  test.case = 'src - empty string, range - range';
  var src = '';
  var got = _.strLinesBut( src, [ 0, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative number';
  var src = '';
  var got = _.strLinesBut( src, -2, undefined );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative range[ 0 ]';
  var src = '';
  var got = _.strLinesBut( src, [ -2, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative range[ 1 ]';
  var src = '';
  var got = _.strLinesBut( src, [ 0, -5 ], undefined );
  test.identical( got, '' );

  /* */

  test.case = 'src - string without new lines, range - number';
  var src = 'abc';
  var got = _.strLinesBut( src, 0, undefined );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - number > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, 2, undefined );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - range';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - range[ 0 ] > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 2, 5 ], undefined );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - negative number';
  var src = 'abc';
  var got = _.strLinesBut( src, -2, undefined );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - negative range[ 0 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ -2, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - negative range[ 1 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, -5 ], undefined );
  test.identical( got, 'abc' );

  /* */

  test.case = 'src - string with new lines, range - number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 0, undefined );
  test.identical( got, 'def\nghi' );

  test.case = 'src - string with new lines, range - number > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 5, undefined );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - string with new lines, range - range';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - string with new lines, range - range[ 0 ] > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 4, 5 ], undefined );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - string with new lines, range - negative number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, -2, undefined);
  test.identical( got, 'abc\nghi' );

  test.case = 'src - string with new lines, range - negative range[ 0 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ -2, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - string with new lines, range - negative range[ 1 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, -5 ], undefined );
  test.identical( got, 'abc\ndef\nghi' );

  test.close( 'src - string, range, ins - undefined' );

  /* - */

  test.open( 'src - string, range, ins - string' );

  test.case = 'src - empty string, range - number';
  var src = '';
  var got = _.strLinesBut( src, 0, 'str' );
  test.identical( got, 'str' );

  test.case = 'src - empty string, range - range';
  var src = '';
  var got = _.strLinesBut( src, [ 0, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - empty string, range - negative number';
  var src = '';
  var got = _.strLinesBut( src, -2, 'str' );
  test.identical( got, 'str\n' );

  test.case = 'src - empty string, range - negative range[ 0 ]';
  var src = '';
  var got = _.strLinesBut( src, [ -2, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - empty string, range - negative range[ 1 ]';
  var src = '';
  var got = _.strLinesBut( src, [ 0, -5 ], 'str' );
  test.identical( got, 'str\n' );

  /* */

  test.case = 'src - string without new lines, range - number';
  var src = 'abc';
  var got = _.strLinesBut( src, 0, 'str' );
  test.identical( got, 'str' );

  test.case = 'src - string without new lines, range - number > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, 2, 'str' );
  test.identical( got, 'abc\nstr' );

  test.case = 'src - string without new lines, range - range';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - string without new lines, range - range[ 0 ] > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 2, 5 ], 'str' );
  test.identical( got, 'abc\nstr' );

  test.case = 'src - string without new lines, range - negative number';
  var src = 'abc';
  var got = _.strLinesBut( src, -2, 'str' );
  test.identical( got, 'str\nabc' );

  test.case = 'src - string without new lines, range - negative range[ 0 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ -2, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - string without new lines, range - negative range[ 1 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, -5 ], 'str' );
  test.identical( got, 'str\nabc' );

  /* */

  test.case = 'src - string with new lines, range - number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 0, 'str' );
  test.identical( got, 'str\ndef\nghi' );

  test.case = 'src - string with new lines, range - number > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 5, 'str' );
  test.identical( got, 'abc\ndef\nghi\nstr' );

  test.case = 'src - string with new lines, range - range';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - string with new lines, range - range[ 0 ] > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 4, 5 ], 'str' );
  test.identical( got, 'abc\ndef\nghi\nstr' );

  test.case = 'src - string without new lines, range - range[ 0 ] === 1, range[ 2 ] === 2';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 1, 2 ], 'str' );
  test.identical( got, 'abc\nstr\nghi' );

  test.case = 'src - string with new lines, range - negative number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, -2, 'str' );
  test.identical( got, 'abc\nstr\nghi' );

  test.case = 'src - string with new lines, range - negative range[ 0 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ -2, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - string with new lines, range - negative range[ 1 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, -5 ], 'str' );
  test.identical( got, 'str\nabc\ndef\nghi' );

  test.close( 'src - string, range, ins - string' );

  /* - */

  test.open( 'src - string, range, ins - array' );

  test.case = 'src - empty string, range - number';
  var src = '';
  var got = _.strLinesBut( src, 0, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - empty string, range - range';
  var src = '';
  var got = _.strLinesBut( src, [ 0, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - empty string, range - negative number';
  var src = '';
  var got = _.strLinesBut( src, -2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\n' );

  test.case = 'src - empty string, range - negative range[ 0 ]';
  var src = '';
  var got = _.strLinesBut( src, [ -2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - empty string, range - negative range[ 1 ]';
  var src = '';
  var got = _.strLinesBut( src, [ 0, -5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\n' );

  /* */

  test.case = 'src - string without new lines, range - number';
  var src = 'abc';
  var got = _.strLinesBut( src, 0, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - string without new lines, range - number > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, 2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none' );

  test.case = 'src - string without new lines, range - range';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - string without new lines, range - range[ 0 ] > number of lines';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none' );

  test.case = 'src - string without new lines, range - negative number';
  var src = 'abc';
  var got = _.strLinesBut( src, -2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\nabc' );

  test.case = 'src - string without new lines, range - negative range[ 0 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ -2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - string without new lines, range - negative range[ 1 ]';
  var src = 'abc';
  var got = _.strLinesBut( src, [ 0, -5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\nabc' );

  /* */

  test.case = 'src - string with new lines, range - number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 0, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\ndef\nghi' );

  test.case = 'src - string with new lines, range - number > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, 5, [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\ndef\nghi\nstr\nnew\none' );

  test.case = 'src - string with new lines, range - range';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - string with new lines, range - range[ 0 ] > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 4, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\ndef\nghi\nstr\nnew\none' );

  test.case = 'src - string without new lines, range - range[ 0 ] === 1, range[ 2 ] === 2';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 1, 2 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none\nghi' );

  test.case = 'src - string with new lines, range - negative number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, -2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none\nghi' );

  test.case = 'src - string with new lines, range - negative range[ 0 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ -2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - string with new lines, range - negative range[ 1 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesBut( src, [ 0, -5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\nabc\ndef\nghi' );

  test.close( 'src - string, range, ins - array' );

  /* - */

  test.open( 'src - array, range' );

  test.case = 'src - array with one empty string, range - number';
  var src = [ '' ];
  var got = _.strLinesBut( src, 0 );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - range';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative number';
  var src = [ '' ];
  var got = _.strLinesBut( src, -2 );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative range[ 0 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative range[ 1 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, -5 ] );
  test.identical( got, '' );

  /* */

  test.case = 'src - array with one string, range - number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 0 );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - number > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 2 );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - range';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - range[ 0 ] > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 2, 5 ] );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - negative number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, -2 );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - negative range[ 0 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - negative range[ 1 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, -5 ] );
  test.identical( got, 'abc' );

  /* */

  test.case = 'src - array with a few string, range - number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 0 );
  test.identical( got, 'def\nghi' );

  test.case = 'src - array with a few string, range - number > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 5 );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - array with a few string, range - range';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with a few string, range - range[ 0 ] > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 4, 5 ] );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - array with a few string, range - negative number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, -2 );
  test.identical( got, 'abc\nghi' );

  test.case = 'src - array with a few string, range - negative range[ 0 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with a few string, range - negative range[ 1 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, -5 ] );
  test.identical( got, 'abc\ndef\nghi' );

  test.close( 'src - array, range' );

  /* - */

  test.open( 'src - array, range, ins - undefined' );

  test.case = 'src - array with one empty string, range - number';
  var src = [ '' ];
  var got = _.strLinesBut( src, 0, undefined );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - range';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative number';
  var src = [ '' ];
  var got = _.strLinesBut( src, -2, undefined );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative range[ 0 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ -2, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative range[ 1 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, -5 ], undefined );
  test.identical( got, '' );

  /* */

  test.case = 'src - array with one string, range - number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 0, undefined );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - number > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 2, undefined );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - range';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - range[ 0 ] > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 2, 5 ], undefined );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - negative number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, -2, undefined );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - negative range[ 0 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ -2, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - negative range[ 1 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, -5 ], undefined );
  test.identical( got, 'abc' );

  /* */

  test.case = 'src - array with a few string, range - number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 0, undefined );
  test.identical( got, 'def\nghi' );

  test.case = 'src - array with a few string, range - number > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 5, undefined );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - array with a few string, range - range';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - array with a few string, range - range[ 0 ] > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 4, 5 ], undefined );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - array with a few string, range - negative number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, -2, undefined);
  test.identical( got, 'abc\nghi' );

  test.case = 'src - array with a few string, range - negative range[ 0 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ -2, 5 ], undefined );
  test.identical( got, '' );

  test.case = 'src - array with a few string, range - negative range[ 1 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, -5 ], undefined );
  test.identical( got, 'abc\ndef\nghi' );

  test.close( 'src - array, range, ins - undefined' );

  /* - */

  test.open( 'src - array, range, ins - string' );

  test.case = 'src - array with one empty string, range - number';
  var src = [ '' ];
  var got = _.strLinesBut( src, 0, 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with one empty string, range - range';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with one empty string, range - negative number';
  var src = [ '' ];
  var got = _.strLinesBut( src, -2, 'str' );
  test.identical( got, 'str\n' );

  test.case = 'src - array with one empty string, range - negative range[ 0 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ -2, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with one empty string, range - negative range[ 1 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, -5 ], 'str' );
  test.identical( got, 'str\n' );

  /* */

  test.case = 'src - array with one string, range - number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 0, 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with one string, range - number > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 2, 'str' );
  test.identical( got, 'abc\nstr' );

  test.case = 'src - array with one string, range - range';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with one string, range - range[ 0 ] > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 2, 5 ], 'str' );
  test.identical( got, 'abc\nstr' );

  test.case = 'src - array with one string, range - negative number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, -2, 'str' );
  test.identical( got, 'str\nabc' );

  test.case = 'src - array with one string, range - negative range[ 0 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ -2, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with one string, range - negative range[ 1 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, -5 ], 'str' );
  test.identical( got, 'str\nabc' );

  /* */

  test.case = 'src - array with a few string, range - number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 0, 'str' );
  test.identical( got, 'str\ndef\nghi' );

  test.case = 'src - array with a few string, range - number > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 5, 'str' );
  test.identical( got, 'abc\ndef\nghi\nstr' );

  test.case = 'src - array with a few string, range - range';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with a few string, range - range[ 0 ] > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 4, 5 ], 'str' );
  test.identical( got, 'abc\ndef\nghi\nstr' );

  test.case = 'src - array with one string, range - range[ 0 ] === 1, range[ 2 ] === 2';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 1, 2 ], 'str' );
  test.identical( got, 'abc\nstr\nghi' );

  test.case = 'src - array with a few string, range - negative number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, -2, 'str' );
  test.identical( got, 'abc\nstr\nghi' );

  test.case = 'src - array with a few string, range - negative range[ 0 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ -2, 5 ], 'str' );
  test.identical( got, 'str' );

  test.case = 'src - array with a few string, range - negative range[ 1 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, -5 ], 'str' );
  test.identical( got, 'str\nabc\ndef\nghi' );

  test.close( 'src - array, range, ins - string' );

  /* - */

  test.open( 'src - array, range, ins - array' );

  test.case = 'src - array with one empty string, range - number';
  var src = [ '' ];
  var got = _.strLinesBut( src, 0, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with one empty string, range - range';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with one empty string, range - negative number';
  var src = [ '' ];
  var got = _.strLinesBut( src, -2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\n' );

  test.case = 'src - array with one empty string, range - negative range[ 0 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ -2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with one empty string, range - negative range[ 1 ]';
  var src = [ '' ];
  var got = _.strLinesBut( src, [ 0, -5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\n' );

  /* */

  test.case = 'src - array with one string, range - number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 0, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with one string, range - number > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, 2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none' );

  test.case = 'src - array with one string, range - range';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with one string, range - range[ 0 ] > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none' );

  test.case = 'src - array with one string, range - negative number';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, -2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\nabc' );

  test.case = 'src - array with one string, range - negative range[ 0 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ -2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with one string, range - negative range[ 1 ]';
  var src = [ 'abc' ];
  var got = _.strLinesBut( src, [ 0, -5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\nabc' );

  /* */

  test.case = 'src - array with a few string, range - number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 0, [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\ndef\nghi' );

  test.case = 'src - array with a few string, range - number > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, 5, [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\ndef\nghi\nstr\nnew\none' );

  test.case = 'src - array with a few string, range - range';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with a few string, range - range[ 0 ] > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 4, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\ndef\nghi\nstr\nnew\none' );

  test.case = 'src - array with a few string, range - range[ 0 ] === 1, range[ 2 ] === 2';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 1, 2 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none\nghi' );

  test.case = 'src - array with a few string, range - negative number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, -2, [ 'str', 'new', 'one' ] );
  test.identical( got, 'abc\nstr\nnew\none\nghi' );

  test.case = 'src - array with a few string, range - negative range[ 0 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ -2, 5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none' );

  test.case = 'src - array with a few string, range - negative range[ 1 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( src, [ 0, -5 ], [ 'str', 'new', 'one' ] );
  test.identical( got, 'str\nnew\none\nabc\ndef\nghi' );

  test.close( 'src - array, range, ins - array' );

  /* - */

  test.case = 'strLinesBut from returned result';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesBut( _.strLinesBut( src, [ 0, -5 ], [ 'str', 'new', 'one' ] ), -1 );
  test.identical( got, 'str\nnew\none\nabc\ndef' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strLinesBut() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.strLinesBut( 'str\nabc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strLinesBut( 'str\nabc', 1, 'cba', 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strLinesBut( { 'str\nabc' : 'str\nabc' }, 1, 'cba' ) );
  test.shouldThrowErrorSync( () => _.strLinesBut( new Set( [ 'abc' ] ), 1, 'cba' ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.strLinesBut( 'str\nabc', [], 'cba' ) );
  test.shouldThrowErrorSync( () => _.strLinesBut( 'str\nabc', [ 1, 2, 3 ], 'cba' ) );
  test.shouldThrowErrorSync( () => _.strLinesBut( 'str\nabc', [ undefined, undefined ], 'cba' ) );

  test.case = 'wrong type of ins';
  test.shouldThrowErrorSync( () => _.strLinesBut( 'str\nabc', 1, { 'cba' : 'cba' } ) );
  test.shouldThrowErrorSync( () => _.strLinesBut( 'str\nabc', 1, new BufferRaw( 10 ) ) );
}

//

function strLinesOnly( test )
{
  test.open( 'src - string, range' );

  test.case = 'src - empty string, range - number';
  var src = '';
  var got = _.strLinesOnly( src, 0 );
  test.identical( got, '' );

  test.case = 'src - empty string, range - range';
  var src = '';
  var got = _.strLinesOnly( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative number';
  var src = '';
  var got = _.strLinesOnly( src, -2 );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative range[ 0 ]';
  var src = '';
  var got = _.strLinesOnly( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - empty string, range - negative range[ 1 ]';
  var src = '';
  var got = _.strLinesOnly( src, [ 0, -5 ] );
  test.identical( got, '' );

  /* */

  test.case = 'src - string without new lines, range - number';
  var src = 'abc';
  var got = _.strLinesOnly( src, 0 );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - number > number of lines';
  var src = 'abc';
  var got = _.strLinesOnly( src, 2 );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - range';
  var src = 'abc';
  var got = _.strLinesOnly( src, [ 0, 5 ] );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - range[ 0 ] > number of lines';
  var src = 'abc';
  var got = _.strLinesOnly( src, [ 2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - negative number';
  var src = 'abc';
  var got = _.strLinesOnly( src, -2 );
  test.identical( got, '' );

  test.case = 'src - string without new lines, range - negative range[ 0 ]';
  var src = 'abc';
  var got = _.strLinesOnly( src, [ -2, 5 ] );
  test.identical( got, 'abc' );

  test.case = 'src - string without new lines, range - negative range[ 1 ]';
  var src = 'abc';
  var got = _.strLinesOnly( src, [ 0, -5 ] );
  test.identical( got, '' );

  /* */

  test.case = 'src - string with new lines, range - number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesOnly( src, 0 );
  test.identical( got, 'abc' );

  test.case = 'src - string with new lines, range - number > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesOnly( src, 5 );
  test.identical( got, '' );

  test.case = 'src - string with new lines, range - range';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesOnly( src, [ 0, 5 ] );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - string with new lines, range - range[ 0 ] > number of lines';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesOnly( src, [ 4, 5 ] );
  test.identical( got, '' );

  test.case = 'src - string with new lines, range - negative number';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesOnly( src, -2 );
  test.identical( got, 'def' );

  test.case = 'src - string with new lines, range - negative range[ 0 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesOnly( src, [ -2, 5 ] );
  test.identical( got, 'def\nghi' );

  test.case = 'src - string with new lines, range - negative range[ 1 ]';
  var src = 'abc\ndef\nghi';
  var got = _.strLinesOnly( src, [ 0, -5 ] );
  test.identical( got, '' );

  test.close( 'src - string, range' );

  /* - */

  test.open( 'src - array, range' );

  test.case = 'src - array with one empty string, range - number';
  var src = [ '' ];
  var got = _.strLinesOnly( src, 0 );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - range';
  var src = [ '' ];
  var got = _.strLinesOnly( src, [ 0, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative number';
  var src = [ '' ];
  var got = _.strLinesOnly( src, -2 );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative range[ 0 ]';
  var src = [ '' ];
  var got = _.strLinesOnly( src, [ -2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with one empty string, range - negative range[ 1 ]';
  var src = [ '' ];
  var got = _.strLinesOnly( src, [ 0, -5 ] );
  test.identical( got, '' );

  /* */

  test.case = 'src - array with one string, range - number';
  var src = [ 'abc' ];
  var got = _.strLinesOnly( src, 0 );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - number > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesOnly( src, 2 );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - range';
  var src = [ 'abc' ];
  var got = _.strLinesOnly( src, [ 0, 5 ] );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - range[ 0 ] > number of lines';
  var src = [ 'abc' ];
  var got = _.strLinesOnly( src, [ 2, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - negative number';
  var src = [ 'abc' ];
  var got = _.strLinesOnly( src, -2 );
  test.identical( got, '' );

  test.case = 'src - array with one string, range - negative range[ 0 ]';
  var src = [ 'abc' ];
  var got = _.strLinesOnly( src, [ -2, 5 ] );
  test.identical( got, 'abc' );

  test.case = 'src - array with one string, range - negative range[ 1 ]';
  var src = [ 'abc' ];
  var got = _.strLinesOnly( src, [ 0, -5 ] );
  test.identical( got, '' );

  /* */

  test.case = 'src - array with a few string, range - number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesOnly( src, 0 );
  test.identical( got, 'abc' );

  test.case = 'src - array with a few string, range - number > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesOnly( src, 5 );
  test.identical( got, '' );

  test.case = 'src - array with a few string, range - range';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesOnly( src, [ 0, 5 ] );
  test.identical( got, 'abc\ndef\nghi' );

  test.case = 'src - array with a few string, range - range[ 0 ] > number of lines';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesOnly( src, [ 4, 5 ] );
  test.identical( got, '' );

  test.case = 'src - array with a few string, range - negative number';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesOnly( src, -2 );
  test.identical( got, 'def' );

  test.case = 'src - array with a few string, range - negative range[ 0 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesOnly( src, [ -2, 5 ] );
  test.identical( got, 'def\nghi' );

  test.case = 'src - array with a few string, range - negative range[ 1 ]';
  var src = [ 'abc', 'def', 'ghi' ];
  var got = _.strLinesOnly( src, [ 0, -5 ] );
  test.identical( got, '' );

  test.close( 'src - array, range' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strLinesOnly() );

  test.case = 'not enough arguments';
  test.shouldThrowErrorSync( () => _.strLinesOnly( 'str\nabc' ) );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strLinesOnly( 'str\nabc', 1, 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strLinesOnly( { 'str\nabc' : 'str\nabc' }, 1, 'cba' ) );
  test.shouldThrowErrorSync( () => _.strLinesOnly( new Set( [ 'abc' ] ), 1, 'cba' ) );

  test.case = 'wrong range';
  test.shouldThrowErrorSync( () => _.strLinesOnly( 'str\nabc', [], 'cba' ) );
  test.shouldThrowErrorSync( () => _.strLinesOnly( 'str\nabc', [ 1, 2, 3 ], 'cba' ) );
  test.shouldThrowErrorSync( () => _.strLinesOnly( 'str\nabc', [ undefined, undefined ], 'cba' ) );
}

//

function strLinesStrip( test )
{
  test.open( 'src - string' );

  test.case = 'empty string';
  var got = _.strLinesStrip( '' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'only escape sequences';
  var got = _.strLinesStrip( '\n\t\r' );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src stays unchanged';
  var srcString = '\na\nbc\ndef';
  var got = _.strLinesStrip( srcString );
  var expected = 'a\nbc\ndef';
  test.identical( got, expected );

  test.case = 'string without escape sequences and begin/end spaces';
  var got = _.strLinesStrip( 'Hello world' );
  var expected = 'Hello world';
  test.identical( got, expected );

  test.case = 'string with begin/end spaces';
  var got = _.strLinesStrip( '  Hello world   ' );
  var expected = 'Hello world';
  test.identical( got, expected );

  test.case = 'string with begin/end escape sequences';
  var got = _.strLinesStrip( '\t\r\nHello world\r\n\t' );
  var expected = 'Hello world';
  test.identical( got, expected );

  test.case = 'string with escape sequences';
  var got = _.strLinesStrip( '\n\tHello\r\n\tworld\r\n' );
  var expected = 'Hello\nworld';
  test.identical( got, expected );

  test.case = 'string with escape sequences';
  var got = _.strLinesStrip( '\n\tHello\r\n\t\t\r\nworld\r\n'  );
  var expected = 'Hello\nworld';
  test.identical( got, expected );

  test.case = 'string with escape sequences and spaces';
  var got = _.strLinesStrip( '\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t'  );
  var expected = 'Hello\nWorld\n!';
  test.identical( got, expected );

  test.close( 'src - string' );

  /* - */

  test.open( 'src - single array' );

  test.case = 'empty array';
  var dst = [];
  var got = _.strLinesStrip( dst );
  var expected = [];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'empty array with empty string';
  var dst = [ '' ];
  var got = _.strLinesStrip( dst );
  var expected = [];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'src stays unchanged';
  var dst = [ '\na\n\nbc\ndef\n' ];
  var got = _.strLinesStrip( dst );
  var expected = [ 'a\n\nbc\ndef' ];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'only escape sequences';
  var dst = [ '', '\t\r\n' ];
  var got = _.strLinesStrip( dst );
  var expected = [];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'string without escape sequences and begin/end spaces';
  var dst = [ 'Hello world', '', '\t\r\n' ];
  var got = _.strLinesStrip( dst );
  var expected = [ 'Hello world' ];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'string with begin/end spaces';
  var dst = [ '  Hello ', ' world   ' ];
  var got = _.strLinesStrip( dst );
  var expected = [ 'Hello', 'world' ];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'string with begin/end escape sequences';
  var dst = [ '\t\r\nHello  ', '  world\r\n\t' ];
  var got = _.strLinesStrip( dst );
  var expected = [ 'Hello', 'world' ];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'string with escape sequences';
  var dst = [ '\n\tHello\r\n\tworld\r\n' ];
  var got = _.strLinesStrip( dst );
  var expected = [ 'Hello\r\n\tworld' ];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'string with escape sequences';
  var dst = [ '\n\tHello\r\n\t\t\r\nworld\r\n' ];
  var got = _.strLinesStrip( dst  );
  var expected = [ 'Hello\r\n\t\t\r\nworld' ];
  test.identical( got, expected );
  test.true( got !== dst );

  test.case = 'string with escape sequences and spaces';
  var dst = [ '\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t', '  \nHow are you?  \r  \n  \t  ' ];
  var got = _.strLinesStrip( dst );
  var expected = [ 'Hello  \r\n\t\t\r\n World \t\r\n!', 'How are you?' ] ;
  test.identical( got, expected );
  test.true( got !== dst );

  test.close( 'src - single array' );

  /* - */

  test.open( 'several arguments' );

  test.case = 'several strings';
  var got = _.strLinesStrip( '\n\tHello  \r\n\t\t\r\n', ' World \t\r\n! \r\n\t', ' \nHow are you?  ' );
  var expected = [ 'Hello', 'World\n!', 'How are you?' ] ;
  test.identical( got, expected );
  test.true( _.unrollIs( got ) );

  test.case = 'several arrays';
  var got = _.strLinesStrip( [ '\n\tHello  \r\n\t\t\r\n', ' World \t\r\n! \r\n\t' ], [ ' \n\nHow  ', ' \r\nare\t', ' you \n ?  \r' ], [ '  \n\r\t ' ]  );
  var expected = [ [ 'Hello', 'World \t\r\n!' ], [ 'How', 'are', 'you \n ?' ], [ ] ];
  test.identical( got, expected );
  test.true( _.unrollIs( got ) );

  test.case = 'several strings and arrays';
  var got = _.strLinesStrip( '\n\tHello  \r\n\t\t\r\n', [ ' World \t\r\n ', ' ! \r\n\t' ], [ ' \n\nHow  ', ' \r\nare\t', ' you \n ?  \r' ], ' I am \n\r\t good \n\n ' );
  var expected = [ 'Hello', [ 'World', '!' ], [ 'How', 'are', 'you \n ?' ], 'I am\ngood' ];
  test.identical( got, expected );
  test.true( _.unrollIs( got ) );

  test.close( 'several arguments' );

  /* - */

  test.case = 'input one line string and array'
  var str = '\tHello  World \t! \r';
  var arrStr = [ str ];
  var gotStr = _.strLinesStrip( str );
  var gotArr = _.strLinesStrip( arrStr );
  test.identical( gotArr[ 0 ], gotStr );

  test.case = 'several input strings and array'
  var strOne = '\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t';
  var strTwo = '  How \n\n Are \r\n\t you   today \t\r\n? \r\n';
  var strThree = '\n\t  I \t am \r\n\t \t\r\n Great ! ';
  var arrStrOne = strOne.split( '\n' );
  var arrStrTwo = strTwo.split( '\n' );
  var arrStrThree = strThree.split( '\n' );
  var gotStr = _.strLinesStrip( strOne, strTwo, strThree );
  var gotArr = _.strLinesStrip( arrStrOne, arrStrTwo, arrStrThree );
  test.identical( gotArr[ 0 ], gotStr[ 0 ].split( '\n' ) );
  test.identical( gotArr[ 1 ], gotStr[ 1 ].split( '\n' ) );
  test.identical( gotArr[ 2 ], gotStr[ 2 ].split( '\n' ) );
  test.true( _.unrollIs( gotArr ) );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () =>  _.strLinesStrip() );

  test.case = 'wrong type of argument';
  test.shouldThrowErrorSync( () =>  _.strLinesStrip( null ) );
  test.shouldThrowErrorSync( () =>  _.strLinesStrip( undefined ) );
  test.shouldThrowErrorSync( () =>  _.strLinesStrip( NaN ) );
  test.shouldThrowErrorSync( () =>  _.strLinesStrip( 3 ) );
  test.shouldThrowErrorSync( () =>  _.strLinesStrip( [ 3 ] ) );
  test.shouldThrowErrorSync( () =>  _.strLinesStrip( /^a/ ) );
}

//

function strLinesNumber( test )
{
  test.open( 'arguments' );

  test.case = 'src - empty string';
  var got = _.strLinesNumber( '' );
  var expected = '1 : ';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol';
  var got = _.strLinesNumber( 'a' );
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols';
  var got = _.strLinesNumber( 'abc\ndef\nghi' );
  var expected = '1 : abc\n2 : def\n3 : ghi';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank';
  var got = _.strLinesNumber( 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj' );
  var expected = ' 1 : a\n 2 : b\n 3 : c\n 4 : d\n 5 : e\n 6 : f\n 7 : g\n 8 : h\n 9 : i\n10 : j';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array';
  var got = _.strLinesNumber( [] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols';
  got = _.strLinesNumber( [ 'line1', 'line2', 'line3' ] );
  expected =
  [
    '1 : line1',
    '2 : line2',
    '3 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols';
  got = _.strLinesNumber( [ 'line\n', 'line\n', 'line\n' ] );
  expected =
  [
    '1 : line\n',
    '2 : line\n',
    '3 : line\n',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank';
  got = _.strLinesNumber( [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ] );
  expected =
  [
    ' 1 : a',
    ' 2 : b',
    ' 3 : c',
    ' 4 : d',
    ' 5 : e',
    ' 6 : f',
    ' 7 : g',
    ' 8 : h',
    ' 9 : i',
    '10 : j',
  ].join( '\n' );
  test.identical( got, expected );

  test.close( 'arguments' );

  /* - */

  test.open( 'map' );

  test.case = 'src - empty string';
  var got = _.strLinesNumber( { src : '' } );
  var expected = '1 : ';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol';
  var got = _.strLinesNumber( { src : 'a' } );
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols';
  var got = _.strLinesNumber( { src : 'abc\ndef\nghi' } );
  var expected = '1 : abc\n2 : def\n3 : ghi';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank';
  var got = _.strLinesNumber( { src : 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj' } );
  var expected = ' 1 : a\n 2 : b\n 3 : c\n 4 : d\n 5 : e\n 6 : f\n 7 : g\n 8 : h\n 9 : i\n10 : j';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array';
  var got = _.strLinesNumber( { src : [] } );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols';
  got = _.strLinesNumber( { src : [ 'line1', 'line2', 'line3' ] } );
  expected =
  [
    '1 : line1',
    '2 : line2',
    '3 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols';
  got = _.strLinesNumber( { src : [ 'line\n', 'line\n', 'line\n' ] } );
  expected =
  [
    '1 : line\n',
    '2 : line\n',
    '3 : line\n',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank';
  got = _.strLinesNumber( { src : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ] } );
  expected =
  [
    ' 1 : a',
    ' 2 : b',
    ' 3 : c',
    ' 4 : d',
    ' 5 : e',
    ' 6 : f',
    ' 7 : g',
    ' 8 : h',
    ' 9 : i',
    '10 : j',
  ].join( '\n' );
  test.identical( got, expected );

  test.close( 'map' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strLinesNumber() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strLinesNumber( 'str', 2, 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strLinesNumber( 13 ) );

  test.case = 'unnacessary options in map';
  test.shouldThrowErrorSync( () => _.strLinesNumber({ src : 'a', unnacessary : 1 }) );
}

//

function strLinesNumberOptionHighlighting( test )
{

  test.open( 'single line' )

  test.open( 'change src' )

  test.case = '1 letter with highlighting';
  var got = _.strLinesNumber({ src : 'a', highlighting : 1 });
  var expected = '* 1 : a';
  test.identical( got, expected );

  test.case = '1 line with highlighting';
  var got = _.strLinesNumber({ src : 'abcde', highlighting : 1 });
  var expected = '* 1 : abcde';
  test.identical( got, expected );

  test.case = '1 line of numbers with highlighting';
  var got = _.strLinesNumber({ src : '123', highlighting : 1 });
  var expected = '* 1 : 123';
  test.identical( got, expected );

  test.close( 'change src' )

  /* - */

  test.open( 'change highlighting & highlighting token' )

  test.case = '1 line with array highlighting ';
  var got = _.strLinesNumber({ src : 'a', highlighting : [ 1 ] });
  var expected = '* 1 : a';
  test.identical( got, expected );

  test.case = '1 line with long highlighting, ';
  var got = _.strLinesNumber({ src : 'a', highlighting : 1, highlightingToken : '-->' });
  var expected = '--> 1 : a';
  test.identical( got, expected );


  test.close( 'change highlighting & highlighting token' )

  /* - */

  test.open( 'wrong highligting option' )

  test.case = '1 line with highlighting, wrong highlighting - negative';
  var got = _.strLinesNumber({ src : 'a', highlighting : -5 });
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = '1 line with highlighting, wrong highlighting - out of the range';
  var got = _.strLinesNumber({ src : 'a', highlighting : 15 });
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = '1 line with highlighting, wrong array highlighting - out of the range';
  var got = _.strLinesNumber({ src : 'a', highlighting : [ 15 ] });
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = '1 line with highlighting, wrong array highlighting: one\'s in and one\'s out of the range';
  var got = _.strLinesNumber({ src : 'a', highlighting : [ 1, 15 ] });
  var expected = '* 1 : a';
  test.identical( got, expected );

  test.close( 'wrong highligting option' )

  test.close( 'single line' )

  /* - */

  test.open( 'multiline' )

  test.open( 'change src' )

  test.case = 'a few lines';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : 2 });
  var expected = '  1 : abc\n* 2 : def\n  3 : ghi';
  test.identical( got, expected );

  test.case = 'a few lines of numbers';
  var got = _.strLinesNumber({ src : '123\n456\n789', highlighting : 2 });
  var expected = '  1 : 123\n* 2 : 456\n  3 : 789';
  test.identical( got, expected );

  test.case = 'a few lines of numbers, letters with highlighting';
  var got = _.strLinesNumber({ src : '12a\nbcd\n3ef', highlighting : 2 });
  var expected = '  1 : 12a\n* 2 : bcd\n  3 : 3ef';
  test.identical( got, expected );

  test.case = 'a few lines, different amount of letters in lines';
  var got = _.strLinesNumber({ src : '1\nbcd\n3ef\naa'+'aa'+'aa', highlighting : 2 });
  var expected = '  1 : 1\n* 2 : bcd\n  3 : 3ef\n  4 : aa'+'aa'+'aa';
  test.identical( got, expected );

  test.close( 'change src' )

  /* - */

  test.open( 'change highlighting & highlighting token' )

  test.case = 'a few lines, one with highlighting, array highlighting';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 2 ] });
  var expected = '  1 : abc\n* 2 : def\n  3 : ghi';
  test.identical( got, expected );

  test.case = 'a few lines, two with highlighting';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 2, 3 ] });
  var expected = '  1 : abc\n* 2 : def\n* 3 : ghi';
  test.identical( got, expected );

  test.case = 'a few lines, all with highlighting';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 1, 2, 3 ] });
  var expected = '* 1 : abc\n* 2 : def\n* 3 : ghi';
  test.identical( got, expected );

  test.case = 'a few lines, changed highlightingToken';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : 2, highlightingToken : '-->' });
  var expected = '    1 : abc\n--> 2 : def\n    3 : ghi';
  test.identical( got, expected );

  test.case = 'a few lines, changed to long highlightingToken';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : 2, highlightingToken : '----------->' });
  var expected = '             1 : abc\n-----------> 2 : def\n             3 : ghi';
  test.identical( got, expected );

  test.close( 'change highlighting & highlighting token' )

  /* - */

  test.open( 'change zeroLine' );

  test.case = 'middle with highlighting, two digit numbers';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi\nklm', highlighting : 91, zeroLine : 90 });
  var expected = '  90 : abc\n* 91 : def\n  92 : ghi\n  93 : klm';
  test.identical( got, expected );

  test.case = 'middle with highlighting, three digit numbers';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi\nklm', highlighting : 101, zeroLine : 100 });
  var expected = '  100 : abc\n* 101 : def\n  102 : ghi\n  103 : klm';
  test.identical( got, expected );

  test.case = 'middle with highlighting, two ( with highlighting ) and three digit numbers';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi\nklm', highlighting : 99, zeroLine : 98 });
  var expected = '   98 : abc\n*  99 : def\n  100 : ghi\n  101 : klm';
  test.identical( got, expected );

  test.case = 'middle with highlighting, two and three ( with highlighting ) digit numbers';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi\nklm', highlighting : 101, zeroLine : 98 });
  var expected = '   98 : abc\n   99 : def\n  100 : ghi\n* 101 : klm';
  test.identical( got, expected );

  test.close( 'change zeroLine' )

  /* - */

  test.open( 'combinations of options' )

  test.case = 'two with highlighting, changed highlightingToken';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 2, 3 ], highlightingToken : '-->' });
  var expected = '    1 : abc\n--> 2 : def\n--> 3 : ghi';
  test.identical( got, expected );

  test.case = 'src with numbers, two with highlighting, changed highlightingToken';
  var got = _.strLinesNumber({ src : '123\n456\n789', highlighting : [ 2, 3 ], highlightingToken : '-->' });
  var expected = '    1 : 123\n--> 2 : 456\n--> 3 : 789';
  test.identical( got, expected );

  test.case = 'src with letters and numbers, two with highlighting, changed highlightingToken';
  var got = _.strLinesNumber({ src : '123\n4ab\nc56', highlighting : [ 2, 3 ], highlightingToken : '-->' });
  var expected = '    1 : 123\n--> 2 : 4ab\n--> 3 : c56';
  test.identical( got, expected );

  test.case = '2 digit number : without highlighting and 3 digit numbers : all with highlighting, changed highlightingToken';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 100, 101 ], highlightingToken : '>>>>', zeroLine : 99 });
  var expected = '      99 : abc\n>>>> 100 : def\n>>>> 101 : ghi';
  test.identical( got, expected );

  test.case = '2 digit numbers : all with highlighting and 3 digit numbers : without highlighting, changed highlightingToken';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi\nklm\nopq', highlighting : [ 98, 99 ], highlightingToken : '>>>>', zeroLine : 98 });
  var expected = '>>>>  98 : abc\n>>>>  99 : def\n     100 : ghi\n     101 : klm\n     102 : opq';
  test.identical( got, expected );

  test.case = '2 digit numbers : all with highlighting and 3 digit numbers : one with highlighting, changed highlightingToken';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi\nklm\nopq', highlighting : [ 98, 99, 101 ], highlightingToken : '>>>>', zeroLine : 98 });
  var expected = '>>>>  98 : abc\n>>>>  99 : def\n     100 : ghi\n>>>> 101 : klm\n     102 : opq';
  test.identical( got, expected );

  test.case = '2 digit numbers: one with highlighting and 3 digit numbers: all with highlighting, changed highlightingToken';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi\nklm\nopq', highlighting : [ 98, 100, 101, 102 ], highlightingToken : '>>>>', zeroLine : 98 });
  var expected = '>>>>  98 : abc\n      99 : def\n>>>> 100 : ghi\n>>>> 101 : klm\n>>>> 102 : opq';
  test.identical( got, expected );

  test.close( 'combinations of options' )

  /* - */

  test.open( 'wrong highligting option' )

  test.case = 'wrong highlighting - negative';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : -5 });
  var expected = '1 : abc\n2 : def\n3 : ghi';
  test.identical( got, expected );

  test.case = 'wrong highlighting - out of the range';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : 15 });
  var expected = '1 : abc\n2 : def\n3 : ghi';
  test.identical( got, expected );

  test.case = 'wrong array highlighting - one out of the range';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 15 ] });
  var expected = '1 : abc\n2 : def\n3 : ghi';
  test.identical( got, expected );

  test.case = 'wrong array highlighting - all elements of an array highlighting are out of range';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 20, 30 ] });
  var expected = '1 : abc\n2 : def\n3 : ghi';
  test.identical( got, expected );

  test.case = 'wrong array highlighting: one\'s in and one\'s out of the range';
  var got = _.strLinesNumber({ src : 'abc\ndef\nghi', highlighting : [ 1, 15 ] });
  var expected = '* 1 : abc\n  2 : def\n  3 : ghi';
  test.identical( got, expected );

  test.close( 'wrong highligting option' )

  test.close( 'multiline' )

}

//

function strLinesNumberZeroLine( test )
{
  test.open( 'arguments' );

  test.case = 'src - empty string, zeroLine = 0';
  var got = _.strLinesNumber( '', 0 );
  var expected = '0 : ';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol, zeroLine - 1';
  var got = _.strLinesNumber( 'a', 1 );
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols, zeroLine - 2';
  var got = _.strLinesNumber( 'abc\ndef\nghi', 2 );
  var expected = '2 : abc\n3 : def\n4 : ghi';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, zeroLine - 3';
  var got = _.strLinesNumber( 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj', 3 );
  var expected = ' 3 : a\n 4 : b\n 5 : c\n 6 : d\n 7 : e\n 8 : f\n 9 : g\n10 : h\n11 : i\n12 : j';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array, zeroLine - 0';
  var got = _.strLinesNumber( [], 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols, zeroLine - -1';
  got = _.strLinesNumber( [ 'line1', 'line2', 'line3' ], -1 );
  expected =
  [
    '-1 : line1',
    ' 0 : line2',
    ' 1 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols, zeroLine - 2';
  got = _.strLinesNumber( [ 'line\n', 'line\n', 'line\n' ], 2 );
  expected =
  [
    '2 : line\n',
    '3 : line\n',
    '4 : line\n',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, zeroLine - 3';
  got = _.strLinesNumber( [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ], 3 );
  expected =
  [
    ' 3 : a',
    ' 4 : b',
    ' 5 : c',
    ' 6 : d',
    ' 7 : e',
    ' 8 : f',
    ' 9 : g',
    '10 : h',
    '11 : i',
    '12 : j',
  ].join( '\n' );
  test.identical( got, expected );

  test.close( 'arguments' );

  /* - */

  test.open( 'map' );

  test.case = 'src - empty string, zeroLine - 0';
  var got = _.strLinesNumber( { src : '', zeroLine : 0 } );
  var expected = '0 : ';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol, zeroLine - 1';
  var got = _.strLinesNumber( { src : 'a', zeroLine : 1 } );
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols, zeroLine - 2';
  var got = _.strLinesNumber( { src : 'abc\ndef\nghi', zeroLine : 2 } );
  var expected = '2 : abc\n3 : def\n4 : ghi';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, zeroLine - 3';
  var got = _.strLinesNumber( { src : 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj', zeroLine : 3 } );
  var expected = ' 3 : a\n 4 : b\n 5 : c\n 6 : d\n 7 : e\n 8 : f\n 9 : g\n10 : h\n11 : i\n12 : j';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array, zeroLine - 0';
  var got = _.strLinesNumber( { src : [], zeroLine : 0 } );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols, zeroLine - -1';
  got = _.strLinesNumber( { src : [ 'line1', 'line2', 'line3' ], zeroLine : -1 } );
  expected =
  [
    '-1 : line1',
    ' 0 : line2',
    ' 1 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols, zeroLine - 2';
  got = _.strLinesNumber( { src : [ 'line\n', 'line\n', 'line\n' ], zeroLine : 2 } );
  expected =
  [
    '2 : line\n',
    '3 : line\n',
    '4 : line\n',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, zeroLine - 3';
  got = _.strLinesNumber( { src : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ], zeroLine : 3 } );
  expected =
  [
    ' 3 : a',
    ' 4 : b',
    ' 5 : c',
    ' 6 : d',
    ' 7 : e',
    ' 8 : f',
    ' 9 : g',
    '10 : h',
    '11 : i',
    '12 : j',
  ].join( '\n' );
  test.identical( got, expected );

  test.close( 'map' );
}

//

function strLinesNumberZeroChar( test )
{
  test.case = 'src - empty string, zeroChar - 1';
  var got = _.strLinesNumber( { src : '', zeroChar : 1 } );
  var expected = '1 : ';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol, zeroChar - 2';
  var got = _.strLinesNumber( { src : 'a', zeroChar : 2 } );
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols, zeroChar - 8';
  var got = _.strLinesNumber( { src : 'abc\ndef\nghi', zeroChar : 8 } );
  var expected = '3 : abc\n4 : def\n5 : ghi';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, zeroChar - 3';
  var got = _.strLinesNumber( { src : 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj', zeroChar : 3 } );
  var expected = ' 3 : a\n 4 : b\n 5 : c\n 6 : d\n 7 : e\n 8 : f\n 9 : g\n10 : h\n11 : i\n12 : j';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array, zeroChar - 1';
  var got = _.strLinesNumber( { src : [], zeroChar : 1 } );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols, zeroChar - 10';
  got = _.strLinesNumber( { src : [ 'line1', 'line2', 'line3' ], zeroChar : 10 } );
  expected =
  [
    '2 : line1',
    '3 : line2',
    '4 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols, zeroChar - 11';
  got = _.strLinesNumber( { src : [ 'line\n', 'line\n', 'line\n' ], zeroChar : 11 } );
  expected =
  [
    '5 : line\n',
    '6 : line\n',
    '7 : line\n',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, zeroChar - 6';
  got = _.strLinesNumber( { src : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ], zeroChar : 6 } );
  expected =
  [
    ' 4 : a',
    ' 5 : b',
    ' 6 : c',
    ' 7 : d',
    ' 8 : e',
    ' 9 : f',
    '10 : g',
    '11 : h',
    '12 : i',
    '13 : j',
  ].join( '\n' );
  test.identical( got, expected );
}

//

function strLinesNumberOnLine( test )
{
  test.open( 'only onLine' );

  test.case = 'src - empty string, onLine appends number of string';
  var got = _.strLinesNumber( { src : '', onLine : ( e, k ) => e.join( '' ) + ' ' + k } );
  var expected = '1 :  1';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol, onLine returns string';
  var got = _.strLinesNumber( { src : 'a', onLine : ( e, k ) => e.join( '' ) } );
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols, onLine returns undefined';
  var got = _.strLinesNumber( { src : 'abc\ndef\nghi', onLine : ( e, k ) => k > 1 ? undefined : e.join( '' ) } );
  var expected = '1 : abc';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, onLine check container';
  var got = _.strLinesNumber( { src : 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj', onLine : ( e, k, c ) => c.zeroChar ? e.join( '' ) : k + ' : ' + k } );
  var expected = '1 : 1\n2 : 2\n3 : 3\n4 : 4\n5 : 5\n6 : 6\n7 : 7\n8 : 8\n9 : 9\n10 : 10';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array, onLine returns key';
  var got = _.strLinesNumber( { src : [], onLine : ( e, k, c ) => String( k ) } );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols, onLine returns element';
  got = _.strLinesNumber( { src : [ 'line1', 'line2', 'line3' ], onLine : ( e, k ) => e.join( '' ) } );
  expected =
  [
    '1 : line1',
    '2 : line2',
    '3 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols, onLine returns undefined';
  got = _.strLinesNumber( { src : [ 'line\n', 'line\n', 'line\n' ], onLine : ( e, k ) => k > 1 ? undefined : e.join( '' ) } );
  expected =
  [ '1 : line\n' ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, onLine checks container';
  got = _.strLinesNumber( { src : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ], onLine : ( e, k, c ) => c.zeroChar ? e.join( '' ) : k + ' : ' + k } );
  expected =
  [
    '1 : 1',
    '2 : 2',
    '3 : 3',
    '4 : 4',
    '5 : 5',
    '6 : 6',
    '7 : 7',
    '8 : 8',
    '9 : 9',
    '10 : 10',
  ].join( '\n' );
  test.identical( got, expected );

  test.close( 'only onLine' );

  /* - */

  test.open( 'onLine and zeroLine' );

  test.case = 'src - empty string, onLine appends number of string, zeroLine - 2';
  var got = _.strLinesNumber( { src : '', zeroLine : 2, onLine : ( e, k ) => e.join( '' ) + ' ' + k } );
  var expected = '2 :  2';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol, onLine returns string, zeroLine - 2';
  var got = _.strLinesNumber( { src : 'a', zeroLine : 2, onLine : ( e, k ) => e.join( '' ) } );
  var expected = '2 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols, onLine returns undefined, zeroLine - 2 ';
  var got = _.strLinesNumber( { src : 'abc\ndef\nghi', zeroLine : 2, onLine : ( e, k ) => k > 2 ? undefined : e.join( '' ) } );
  var expected = '2 : abc';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, onLine check container, zeroLine - 2';
  var got = _.strLinesNumber( { src : 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj', zeroLine : 2, onLine : ( e, k, c ) => c.zeroChar ? e.join( '' ) : k + ' : ' + k } );
  var expected = '2 : 2\n3 : 3\n4 : 4\n5 : 5\n6 : 6\n7 : 7\n8 : 8\n9 : 9\n10 : 10\n11 : 11';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array, onLine returns key, zeroLine - 2';
  var got = _.strLinesNumber( { src : [], zeroLine : 2, onLine : ( e, k, c ) => String( k ) } );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols, onLine returns element, zeroLine - 2';
  got = _.strLinesNumber( { src : [ 'line1', 'line2', 'line3' ], zeroLine : 2, onLine : ( e, k ) => e.join( '' ) } );
  expected =
  [
    '2 : line1',
    '3 : line2',
    '4 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols, onLine returns undefined, zeroLine - 2';
  got = _.strLinesNumber( { src : [ 'line\n', 'line\n', 'line\n' ], zeroLine : 2, onLine : ( e, k ) => k > 2 ? undefined : e.join( '' ) } );
  expected =[ '2 : line\n' ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, onLine checks container, zeroLine - 2';
  got = _.strLinesNumber( { src : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ], zeroLine : 2, onLine : ( e, k, c ) => c.zeroChar ? e.join( '' ) : k + ' : ' + k } );
  expected =
  [
    '2 : 2',
    '3 : 3',
    '4 : 4',
    '5 : 5',
    '6 : 6',
    '7 : 7',
    '8 : 8',
    '9 : 9',
    '10 : 10',
    '11 : 11'
  ].join( '\n' );
  test.identical( got, expected );

  test.close( 'onLine and zeroLine' );

  /* - */

  test.open( 'onLine and zeroChar' );

  test.case = 'src - empty string, onLine appends number of string, zeroChar - 2';
  var got = _.strLinesNumber( { src : '', zeroChar : 2, onLine : ( e, k ) => e.join( '' ) + ' ' + k } );
  var expected = '1 :  1';
  test.identical( got, expected );

  test.case = 'src - string without new line symbol, onLine returns string, zeroChar - 2';
  var got = _.strLinesNumber( { src : 'a', zeroChar : 2, onLine : ( e, k ) => e.join( '' ) } );
  var expected = '1 : a';
  test.identical( got, expected );

  test.case = 'src - string with new line symbols, onLine returns undefined, zeroChar - 5';
  var got = _.strLinesNumber( { src : 'abc\ndef\nghi', zeroChar : 5, onLine : ( e, k ) => k > 2 ? undefined : e.join( '' ) } );
  var expected = '2 : abc';
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, onLine check container, zeroChar - 3';
  var got = _.strLinesNumber( { src : 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj', zeroChar : 2, onLine : ( e, k, c ) => c.zeroChar ? e.join( '' ) : k + ' : ' + k } );
  var expected = ' 2 : a\n 3 : b\n 4 : c\n 5 : d\n 6 : e\n 7 : f\n 8 : g\n 9 : h\n10 : i\n11 : j';
  test.identical( got, expected );

  /* */

  test.case = 'src - empty array, onLine returns key, zeroChar - 2';
  var got = _.strLinesNumber( { src : [], zeroChar : 2, onLine : ( e, k, c ) => String( k ) } );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - array of lines without new line symbols, onLine returns element, zeroChar -5 ';
  got = _.strLinesNumber( { src : [ 'line1', 'line2', 'line3' ], zeroChar : 5, onLine : ( e, k ) => e.join( '' ) } );
  expected =
  [
    '2 : line1',
    '3 : line2',
    '4 : line3',
  ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - array of lines with new line symbols, onLine returns undefined, zeroChar - 5';
  got = _.strLinesNumber( { src : [ 'line\n', 'line\n', 'line\n' ], zeroChar : 5, onLine : ( e, k ) => k > 3 ? undefined : e.join( '' ) } );
  expected = [ '3 : line\n' ].join( '\n' );
  test.identical( got, expected );

  test.case = 'src - string, number of strings has different rank, onLine checks container, zeroChar - 2';
  got = _.strLinesNumber( { src : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' ], zeroChar : 2, onLine : ( e, k, c ) => c.zeroChar ? e.join( '' ) : k + ' : ' + k } );
  expected =
  [
    ' 2 : a',
    ' 3 : b',
    ' 4 : c',
    ' 5 : d',
    ' 6 : e',
    ' 7 : f',
    ' 8 : g',
    ' 9 : h',
    '10 : i',
    '11 : j'
  ].join( '\n' );
  test.identical( got, expected );

  test.close( 'onLine and zeroChar' );
}

//

function strLinesSelect( test )
{
  test.open( 'range - number' );

  test.case = 'src - empty line, range < 0';
  var got = _.strLinesSelect( '', -1 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty line, range === 0';
  var got = _.strLinesSelect( '', 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - empty line, range > 0';
  var got = _.strLinesSelect( '', 1 );
  var expected = '';
  test.identical( got, expected );

  /* */

  test.case = 'src - single line, range < 0';
  var got = _.strLinesSelect( 'abc', -1 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - single line, range === 0';
  var got = _.strLinesSelect( 'abc', 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - single line, range > 0';
  var got = _.strLinesSelect( 'abc', 1 );
  var expected = 'abc';
  test.identical( got, expected );

  test.case = 'src - single line, range > src lines';
  var got = _.strLinesSelect( 'abc', 2 );
  var expected = '';
  test.identical( got, expected );

  /* */

  test.case = 'src - multiline, range < 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, -1 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range === 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range > 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 2 );
  var expected = 'b';
  test.identical( got, expected );

  test.case = 'src - multiline, range - number > lines number';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 99 );
  var expected = '';
  test.identical( got, expected );

  test.close( 'range - number' );

  /* - */

  test.open( 'range - two numbers' );

  test.case = 'src - multiline, number1 < 0, number2 < 0, number1 < number2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, -2, -1 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, number1 < 0, number2 < 0, number1 === number2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, -2, -2 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, number1 < 0, number2 === 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, -2, 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, number1 < 0, number2 > 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, -2, 3 );
  var expected = 'a\nb';
  test.identical( got, expected );

  /* */

  test.case = 'src - multiline, number1 === 0, number2 < 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 0, -1 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, number1 === 0, number2 === 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 0, 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, number1 === 0, number2 > 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 0, 3 );
  var expected = 'a\nb';
  test.identical( got, expected );

  /* */

  test.case = 'src - multiline, number1 > 0, number2 < 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 2, -1 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, number1 > 0, number2 === 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 2, 0 );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, number1 > 0, number2 > 0, number1 < number2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 1, 2 );
  var expected = 'a';

  test.case = 'src - multiline, number1 > 0, number2 > 0, number1 > number2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, 2, 1 );
  var expected = '';

  test.close( 'range - two numbers' );

  /* - */

  test.open( 'range - ointerval' );

  test.case = 'src - multiline, range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] < range[ 1 ]';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ -2, -1 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range[ 0 ] < 0, range[ 1 ] < 0, range[ 0 ] === range[ 1 ]';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ -2, -2 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range[ 0 ] < 0, range[ 1 ] === 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ -2, 0 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range[ 0 ] < 0, range[ 1 ] > 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ -2, 3 ] );
  var expected = 'a\nb';
  test.identical( got, expected );

  /* */

  test.case = 'src - multiline, range[ 0 ] === 0, range[ 1 ] < 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ 0, -1 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range[ 0 ] === 0, range[ 1 ] === 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ 0, 0 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range[ 0 ] === 0, range[ 1 ] > 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ 0, 3 ] );
  var expected = 'a\nb';
  test.identical( got, expected );

  /* */

  test.case = 'src - multiline, range[ 0 ] > 0, range[ 1 ] < 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ 2, -1 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range[ 0 ] > 0, range[ 1 ] === 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ 2, 0 ] );
  var expected = '';
  test.identical( got, expected );

  test.case = 'src - multiline, range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] < range[ 1 ]';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ 1, 2 ] );
  var expected = 'a';

  test.case = 'src - multiline, range[ 0 ] > 0, range[ 1 ] > 0, range[ 0 ] > range[ 1 ]';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect( src, [ 2, 1 ] );
  var expected = '';

  test.close( 'range - ointerval' );

  /* - */

  test.case = 'numbering';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    range : [ 1, 3 ],
    numbering : 1
  });
  var expected = '  1 : a\n* 2 : b';
  test.identical( got, expected );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.strLinesSelect() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.strLinesSelect( 'a\nb\nc', 1, 2, 'extra' ) );

  test.case = 'wrong type of src';
  test.shouldThrowErrorSync( () => _.strLinesSelect( 1, 1 ) );

  test.case = 'wrong type of range';
  test.shouldThrowErrorSync( () => _.strLinesSelect( 'lorem\nipsum\n', 'second' ) );

  test.case = 'unknown property provided';
  test.shouldThrowErrorSync( () => _.strLinesSelect( { src : 'lorem\nipsum\n', range : [ 0, 1 ], x : 1 } ) );

  test.case = 'line has negative value';
  test.shouldThrowErrorSync( () => _.strLinesSelect( { src : 'lorem\nipsum\n', range : [ 0, 1 ], line : -1 } ) );
}

//

function strLinesSelectOptionSelectMode( test )
{
  test.open('selectMode : center' );

  test.case = 'line - 2, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 3,
    selectMode : 'center',
  });
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.case = 'line - 2, nearestLines - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 1,
    selectMode : 'center',
  });
  var expected = 'b';
  test.identical( got, expected );

  test.case = 'line - 2, nearestLines - 99';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 99,
    selectMode : 'center',
  });
  var expected = 'a\nb\nc\nd';
  test.identical( got, expected );

  test.case = 'line - 2, nearestLines - 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 0,
    selectMode : 'center',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 1,
    selectMode : 'center',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 3,
    selectMode : 'center',
  });
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'line - 5, nearestLines - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 5,
    nearestLines : 1,
    selectMode : 'center',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 5, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 5,
    nearestLines : 3,
    selectMode : 'center',
  });
  var expected = 'd';
  test.identical( got, expected );

  test.close( 'selectMode : center' );

  /* - */

  test.open( 'selectMode : begin' );

  test.case = 'line - 2, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 3,
    selectMode : 'begin',
  });
  var expected = 'b\nc\nd';
  test.identical( got, expected );

  test.case = 'line - 2, nearestLines - 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 0,
    selectMode : 'begin',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 2, nearestLines - 99';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 99,
    selectMode : 'begin',
  });
  var expected = 'b\nc\nd';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 1,
    selectMode : 'begin',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 3,
    selectMode : 'begin',
  });
  var expected = 'a\nb';
  test.identical( got, expected );

  test.case = 'line - 5, nearestLines - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 5,
    nearestLines : 1,
    selectMode : 'begin',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 5, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 5,
    nearestLines : 3,
    selectMode : 'begin',
  });
  var expected = '';
  test.identical( got, expected );

  test.close( 'selectMode : begin' );

  /* - */

  test.open( 'selectMode : end' );

  test.case = 'line - 3, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    nearestLines : 3,
    selectMode : 'end'
  });
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.case = 'line - 3, nearestLines - 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    nearestLines : 0,
    selectMode : 'end'
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 3, nearestLines - 99';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    nearestLines : 99,
    selectMode : 'end'
  });
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 1,
    selectMode : 'end',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 3,
    selectMode : 'end',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 5, nearestLines - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 5,
    nearestLines : 1,
    selectMode : 'end',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 5, nearestLines - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 5,
    nearestLines : 3,
    selectMode : 'end',
  });
  var expected = 'c\nd';
  test.identical( got, expected );

  test.close( 'selectMode : end' );
}

//

function strLinesSelectOptionHighlighting( test )
{
  test.open( 'highlighting - default' );

  test.case = 'numbering - 0';
  var src = 'a\nb\nc\nd\ne';
  var got = _.strLinesSelect
  ({
    src,
    numbering : 0,
  });
  var expected = 'a\nb\nc\nd';
  test.identical( got, expected );

  test.case = 'numbering - 1';
  var src = 'a\nb\nc\nd\ne';
  var got = _.strLinesSelect
  ({
    src,
    numbering : 1,
  });
  var expected = '  1 : a\n* 2 : b\n  3 : c\n  4 : d';
  test.identical( got, expected );

  test.close( 'highlighting - default' );

  /* - */

  test.open( 'no highlighting' );

  test.case = 'numbering - 0, highlighting - 0';
  var src = 'a\nb\nc\nd\ne';
  var got = _.strLinesSelect
  ({
    src,
    numbering : 0,
    highlighting : 0,
  });
  var expected = 'a\nb\nc\nd';
  test.identical( got, expected );

  test.case = 'numbering - 0, highlighting - 1';
  var src = 'a\nb\nc\nd\ne';
  var got = _.strLinesSelect
  ({
    src,
    numbering : 0,
    highlighting : 1,
  });
  var expected = 'a\nb\nc\nd';
  test.identical( got, expected );

  test.case = 'numbering - 1, highlighting - 0';
  var src = 'a\nb\nc\nd\ne';
  var got = _.strLinesSelect
  ({
    src,
    numbering : 1,
    highlighting : 0
  });
  var expected = '1 : a\n2 : b\n3 : c\n4 : d';
  test.identical( got, expected );

  test.close( 'no highlighting' );

  /* - */

  test.open( 'numbering - 1, highlighting - 1, line - variable' );

  test.case = 'defaults';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  1 : a\n* 2 : b\n  3 : c';
  test.identical( got, expected );

  test.case = 'line - 0';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  1 : a';
  test.identical( got, expected );

  test.case = 'line - 3';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  2 : b\n* 3 : c\n  4 : d';
  test.identical( got, expected );

  test.case = 'line - 4, numbering - 1, highlighting - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 4,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  3 : c\n* 4 : d';
  test.identical( got, expected );

  test.case = 'line - 5, numbering - 1, highlighting - 1';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 5,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  4 : d';
  test.identical( got, expected );

  test.close( 'numbering - 1, highlighting - 1, line - variable' );

  /* - */

  test.open( 'numbering - 1, highlighting - 1, not default options' );

  test.case = 'line - 0, nearestLines - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 2,
    line : 0,
    numbering : 1,
    highlighting : 1
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 3, nearestLines - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 2,
    line : 3,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  2 : b\n* 3 : c';
  test.identical( got, expected );

  test.case = 'line - 5, nearestLines - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 2,
    line : 5,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  4 : d';
  test.identical( got, expected );

  /* */

  test.case = 'line - 0, nearestLines - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 3,
    line : 0,
    numbering : 1,
    highlighting : 1,
    selectMode : 'end'
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 4, nearestLines - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 3,
    line : 4,
    numbering : 1,
    highlighting : 1,
    selectMode : 'end'
  });
  var expected = '  2 : b\n  3 : c\n* 4 : d';
  test.identical( got, expected );

  test.case = 'line - 11, nearestLines - 3, selectMode - end';
  var src = 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 3,
    line : 11,
    numbering : 1,
    highlighting : 1,
    selectMode : 'end'
  });
  var expected = '   9 : i\n  10 : j';
  test.identical( got, expected );

  /* */

  test.case = 'line - 0, nearestLines - 2, selectMode - begin';
  var src = 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 2,
    line : 0,
    numbering : 1,
    highlighting : 1,
    selectMode : 'begin'
  });
  var expected = '  1 : a';
  test.identical( got, expected );

  test.case = 'line - 7, nearestLines - 2, selectMode - begin';
  var src = 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 2,
    line : 7,
    numbering : 1,
    highlighting : 1,
    selectMode : 'begin'
  });
  var expected = '* 7 : g\n  8 : h';
  test.identical( got, expected );

  test.case = 'line - 11, nearestLines - 2, selectMode - begin';
  var src = 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj';
  var got = _.strLinesSelect
  ({
    src,
    nearestLines : 2,
    line : 11,
    numbering : 1,
    highlighting : 1,
    selectMode : 'begin'
  });
  var expected = '';
  test.identical( got, expected );

  test.close( 'numbering - 1, highlighting - 1, not default options' );

  /* - */

  test.open( 'numbering - 1, highlighting - 1, range - const, line - variable' );

  test.case = 'line - 2, inside of range';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    range : [ 1, 4 ],
    line : 2,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  1 : a\n* 2 : b\n  3 : c';
  test.identical( got, expected );

  test.case = 'line - 0, line < range[ 0 ]';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    range : [ 1, 4 ],
    line : 0,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  1 : a\n  2 : b\n  3 : c';
  test.identical( got, expected );

  test.case = 'line - 5, line > range[ 1 ]';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    range : [ 1, 4 ],
    line : 5,
    numbering : 1,
    highlighting : 1
  });
  var expected = '  1 : a\n  2 : b\n  3 : c';
  test.identical( got, expected );

  test.close( 'numbering - 1, highlighting - 1, range - const, line - variable' );
}

//

function strLinesSelectOptionNumbering( test )
{
  test.case = 'line - 0, nearestLines - 5, src - 2 lines, selectMode - center';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'center',
  });
  var expected = '  1 : a\n  2 : b';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 5, src - 2 lines, selectMode - begin';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'begin',
  });
  var expected = '  1 : a\n  2 : b';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 5, src - 2 lines, selectMode - end';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 0,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'end',
  });
  var expected = '';
  test.identical( got, expected );

  /* */

  test.case = 'line - 2, nearestLines - 5, src - 2 lines, selectMode - center';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'center',
  });
  var expected = '  1 : a\n* 2 : b';
  test.identical( got, expected );

  test.case = 'line - 2, nearestLines - 5, src - 2 lines, selectMode - begin';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'begin',
  });
  var expected = '* 2 : b';
  test.identical( got, expected );

  test.case = 'line - 0, nearestLines - 5, src - 2 lines, selectMode - end';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'end',
  });
  var expected = '  1 : a\n* 2 : b';
  test.identical( got, expected );

  /* */

  test.case = 'line - 3, nearestLines - 5, src - 2 lines, selectMode - center';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'center',
  });
  var expected = '  1 : a\n  2 : b';
  test.identical( got, expected );

  test.case = 'line - 3, nearestLines - 5, src - 2 lines, selectMode - begin';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'begin',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'line - 3, nearestLines - 5, src - 2 lines, selectMode - end';
  var src = 'a\nb';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    nearestLines : 5,
    numbering : 1,
    selectMode : 'end',
  });
  var expected = '  1 : a\n  2 : b';
  test.identical( got, expected );
}

//

function strLinesSelectOptionZeroLine( test )
{
  test.case = 'zeroLine - default, line - 2';
  var src = 'a\nb\nc\nd\ne\nf\ng\nh\ni\nj';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
  });
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  /* - */

  test.open( 'without numbering' );

  test.case = 'zeroLine - 1, line - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 1,
  });
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.case = 'zeroLine - 4, line - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 4,
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'zeroLine - 0, line - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 0,
  });
  var expected = 'b\nc\nd';
  test.identical( got, expected );

  /* */

  test.case = 'zeroLine - 1, line - 2, selectMode - begin';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 1,
    selectMode : 'begin',
  });
  var expected = 'b\nc\nd';
  test.identical( got, expected );

  test.case = 'zeroLine - 4, line - 2, selectMode - begin';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 4,
    selectMode : 'begin',
  });
  var expected = 'a';
  test.identical( got, expected );

  test.case = 'zeroLine - 0, line - 2, selectMode - begin';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 0,
    selectMode : 'begin',
  });
  var expected = 'c\nd';
  test.identical( got, expected );

  /* */

  test.case = 'zeroLine - 1, line - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    zeroLine : 1,
    selectMode : 'end',
  });
  var expected = 'a\nb\nc';
  test.identical( got, expected );

  test.case = 'zeroLine - 4, line - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    zeroLine : 4,
    selectMode : 'end',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'zeroLine - 0, line - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    zeroLine : 0,
    selectMode : 'end',
  });
  var expected = 'b\nc\nd';
  test.identical( got, expected );

  test.close( 'without numbering' );

  /* - */

  test.open( 'with numbering' );

  test.case = 'zeroLine - 1, line - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 1,
    numbering : 1
  });
  var expected = '  1 : a\n* 2 : b\n  3 : c';
  test.identical( got, expected );

  test.case = 'zeroLine - 4, line - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 4,
    numbering : 1
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'zeroLine - 0, line - 2';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 0,
    numbering : 1
  });
  var expected = '  1 : b\n* 2 : c\n  3 : d';
  test.identical( got, expected );

  /* */

  test.case = 'zeroLine - 1, line - 2, selectMode - begin';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 1,
    numbering : 1,
    selectMode : 'begin',
  });
  var expected = '* 2 : b\n  3 : c\n  4 : d';
  test.identical( got, expected );

  test.case = 'zeroLine - 4, line - 2, selectMode - begin';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 4,
    numbering : 1,
    selectMode : 'begin',
  });
  var expected = '* 2 : a';
  test.identical( got, expected );

  test.case = 'zeroLine - 0, line - 2, selectMode - begin';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    zeroLine : 0,
    numbering : 1,
    selectMode : 'begin',
  });
  var expected = '* 2 : c\n  3 : d';
  test.identical( got, expected );

  /* */

  test.case = 'zeroLine - 1, line - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    zeroLine : 1,
    numbering : 1,
    selectMode : 'end',
  });
  var expected = '  1 : a\n  2 : b\n* 3 : c';
  test.identical( got, expected );

  test.case = 'zeroLine - 4, line - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    zeroLine : 4,
    numbering : 1,
    selectMode : 'end',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'zeroLine - 0, line - 3, selectMode - end';
  var src = 'a\nb\nc\nd';
  var got = _.strLinesSelect
  ({
    src,
    line : 3,
    zeroLine : 0,
    numbering : 1,
    selectMode : 'end',
  });
  var expected = '  1 : b\n  2 : c\n* 3 : d';
  test.identical( got, expected );

  test.close( 'with numbering' );
}

//

function strLinesSelectOptionDelimeter( test )
{
  test.case = 'src - empty line, delimteter - x';
  var src = '';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    delimteter : 'x',
  });
  var expected = '';
  test.identical( got, expected );

  test.case = 'src, delimteter - x, not exists';
  var src = 'a b c d';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    delimteter : 'x'
  });
  var expected = 'a b c d';
  test.identical( got, expected );

  test.case = 'src, delimteter - x, exists';
  var src = 'axbxcxd';
  var got = _.strLinesSelect
  ({
    src,
    line : 2,
    delimteter : 'x'
  });
  var expected = 'axbxc';
  test.identical( got, expected );
}

//

function strLinesNearest( test )
{

  var srcStr =
`
a
bc
def
ghij

`;

  /* - */

  test.open( 'Range is a number' );

  test.case = 'nearestLines : 0';
  var cinterval = 6;

  var expectedSplits =
  [
    '',
    'd',
    '',
  ];
  var expectedSpans = [ 6, 6, 7, 7 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 0,
  });

  test.will = 'check strLinesNearest';
  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 1';
  var cinterval = 6;

  var expectedSplits =
  [
    '',
    'd',
    'ef',
  ];
  var expectedSpans = [ 6, 6, 7, 9 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 1,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 2';
  var cinterval = 6;

  var expectedSplits =
  [
    'bc\n',
    'd',
    'ef',
  ];
  var expectedSpans = [ 3, 6, 7, 9 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 2,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 8 ( > all lines )';
  var cinterval = 6;

  var expectedSplits =
  [
    '\na\nbc\n',
    'd',
    'ef\nghij\n\n',
  ];
  var expectedSpans = [ 0, 6, 7, 16 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 8,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'NaN range';
  var cinterval = NaN;

  var expectedSplits =
  [
    '',
    '',
    '',
  ];
  var expectedSpans = [ NaN, NaN, NaN, NaN ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 8,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  test.close( 'Range is a number' );

  /* - */

  test.open( 'aligned range, single line' );

  test.case = 'nearestLines not defined ( = 3 )';
  var cinterval = [ 3, 5 ];

  var expectedSplits =
  [
    'a\n',
    'bc',
    '\ndef',
  ];
  var expectedSpans = [ 1, 3, 5, 9 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    // nearestLines : undefined,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : NaN';
  var cinterval = [ 3, 5 ];

  var expectedSplits =
  [
    '\na\n',
    'bc',
    '\ndef\nghij\n\n',
  ];
  var expectedSpans = [ undefined, 3, 5, undefined ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : NaN,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  // qqq : for junior : bad
  // test.case = 'nearestLines : null';
  // var cinterval = [ 3, 5 ];
  //
  // var expectedSplits =
  // [
  //   '',
  //   'bc',
  //   'bc',
  // ];
  // var expectedSpans = [ 3, 3, 5, 3 ];  // Could be wrong?
  //
  // var got = _.strLinesNearest
  // ({
  //   src : srcStr,
  //   charsRangeLeft : cinterval,
  //   nearestLines : null,
  // });
  //
  // test.identical( got.splits, expectedSplits );
  // test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 0';
  var cinterval = [ 6, 9 ];

  var expectedSplits =
  [
    '',
    'def',
    '',
  ];
  var expectedSpans = [ 6, 6, 9, 9 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 0,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 1';
  var cinterval = [ 6, 9 ];

  var expectedSplits =
  [
    '',
    'def',
    '',
  ];
  var expectedSpans = [ 6, 6, 9, 9 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 1,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 2';
  var cinterval = [ 6, 9 ];

  var expectedSplits =
  [
    'bc\n',
    'def',
    '',
  ];
  var expectedSpans = [ 3, 6, 9, 9 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 2,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 3';
  var cinterval = [ 6, 9 ];

  var expectedSplits =
  [
    'bc\n',
    'def',
    '\nghij',
  ];
  var expectedSpans = [ 3, 6, 9, 14 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 3,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 4';

  var cinterval = [ 6, 9 ];
  var sub = _.strOnly( srcStr, cinterval );

  var expectedSplits =
  [
    'a\nbc\n',
    'def',
    '\nghij',
  ];
  var expectedSpans = [ 1, 6, 9, 14 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 4,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  test.close( 'aligned range, single line' );

  /* - */

  test.open( 'not aligned range, several lines' );

  test.case = 'nearestLines : 0';
  var cinterval = [ 4, 11 ];

  var expectedSplits =
  [
    '',
    'c\ndef\ng',
    '',
  ];
  var expectedSpans = [ 4, 4, 11, 11 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 0,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 1';
  var cinterval = [ 4, 11 ];

  var expectedSplits =
  [
    'b',
    'c\ndef\ng',
    'hij',
  ];
  var expectedSpans = [ 3, 4, 11, 14 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 1,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 2';
  var cinterval = [ 4, 11 ];

  var expectedSplits =
  [
    'a\nb',
    'c\ndef\ng',
    'hij',
  ];
  var expectedSpans = [ 1, 4, 11, 14 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 2,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 3';
  var cinterval = [ 4, 11 ];

  var expectedSplits =
  [
    'a\nb',
    'c\ndef\ng',
    'hij\n',
  ];
  var expectedSpans = [ 1, 4, 11, 15 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 3,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  /* */

  test.case = 'nearestLines : 4';
  var cinterval = [ 4, 11 ];

  var expectedSplits =
  [
    '\na\nb',
    'c\ndef\ng',
    'hij\n',
  ];
  var expectedSpans = [ 0, 4, 11, 15 ];

  var got = _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 4,
  });

  test.identical( got.splits, expectedSplits );
  test.identical( got.spans, expectedSpans );

  test.close( 'not aligned range, several lines' );

  /* - */

  if( !Config.debug )
  return;

  test.open( 'Wrong range' );

  var cinterval = [ 4, 11, 12 ];
  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : cinterval,
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : null,
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : srcStr,
    charsRangeLeft : 'cinterval',
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : srcStr,
    nearestLines : 4,
  }));

  test.close( 'Wrong range' );

  /* -  */

  test.open( 'Wrong src' );

  var cinterval = [ 4, 11 ];
  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    charsRangeLeft : cinterval,
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : null,
    charsRangeLeft : cinterval,
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : NaN,
    charsRangeLeft : cinterval,
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : undefined,
    charsRangeLeft : cinterval,
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : 3,
    charsRangeLeft : cinterval,
    nearestLines : 4,
  }));

  test.shouldThrowErrorSync( () =>  _.strLinesNearest
  ({
    src : [ 'abd', 'ef' ],
    charsRangeLeft : cinterval,
    nearestLines : 4,
  }));

  test.close( 'Wrong src' );

  /* - */

  test.open( 'Wrong arg' );

  test.shouldThrowErrorSync( () =>  _.strLinesNearest( 3 ));
  test.shouldThrowErrorSync( () =>  _.strLinesNearest( [ 3, 4 ] ));
  test.shouldThrowErrorSync( () =>  _.strLinesNearest( null ));
  test.shouldThrowErrorSync( () =>  _.strLinesNearest( undefined ));
  test.shouldThrowErrorSync( () =>  _.strLinesNearest( NaN ));
  test.shouldThrowErrorSync( () =>  _.strLinesNearest( 'args' ));

  let o =
  {
    src : [ 'abd', 'ef' ],
    charsRangeLeft : cinterval,
    nearestLines : 4,
  };
  test.shouldThrowErrorSync( () =>  _.strLinesNearest(  ));
  test.shouldThrowErrorSync( () =>  _.strLinesNearest( o, o ));

  test.close( 'Wrong arg' );
}

//

function strLinesNearestLog( test )
{

  test.open( 'single line' );

  test.case = 'changes - charsRangeLeft: one letter to the left';
  var src = 'function add( x,y ) { return x + y }';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 1, 7 ], gray : 1, nearestLines : 1 });
  var expectedNearest =  [ 'f', 'unctio', 'n add( x,y ) { return x + y }' ];
  var expectedLog = '1 : function add( x,y ) { return x + y }';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - charsRangeLeft: a few letters to the left';
  var src = 'function add( x,y ) { return x + y }';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 5, 7 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ 'funct', 'io', 'n add( x,y ) { return x + y }' ];
  var expectedLog = '1 : function add( x,y ) { return x + y }';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - charsRangeLeft: one letter in the range';
  var src = 'function add( x,y ) { return x + y }';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 5, 6 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ 'funct', 'i', 'on add( x,y ) { return x + y }' ];
  var expectedLog = '1 : function add( x,y ) { return x + y }';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - charsRangeLeft: a few letters in the range';
  var src = 'function add( x,y ) { return x + y }';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 5, 8 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ 'funct', 'ion', ' add( x,y ) { return x + y }' ];
  var expectedLog = '1 : function add( x,y ) { return x + y }';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - charsRangeLeft: one letter to the right';
  var src = 'function add( x,y ) { return x + y }';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 1, 35 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ 'f', 'unction add( x,y ) { return x + y ', '}' ];
  var expectedLog = '1 : function add( x,y ) { return x + y }';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - charsRangeLeft: a few letters to the right';
  var src = 'function add( x,y ) { return x + y }';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 1, 33 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ 'f', 'unction add( x,y ) { return x + ', 'y }' ];
  var expectedLog = '1 : function add( x,y ) { return x + y }';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  /* */

  test.case = 'src - empty string';
  var src = '';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 0, 0 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ '', '', '' ];
  var expectedLog = '1 : ';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.close( 'single line' );

  /* - */

  test.open( 'multiline' );

  test.case = 'changes - src: one letter to the right';
  var src = 'a\nb\nc';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 1, 4 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ 'a', '\nb\n', 'c' ];
  var expectedLog = '1 : a\n2 : b\n3 : c';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - src: a few letters to the right';
  var src = 'a\nb\ncd';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 1, 4 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ 'a', '\nb\n', 'cd' ];
  var expectedLog = '1 : a\n2 : b\n3 : cd';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  /* */

  test.case = 'changes - nearestLines: multiline report';
  var src = '0\n1\nabcde\n2\n3\n4\n5\n6';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 3, 5 ], gray : 1, nearestLines : 5 });
  var expectedNearest = [ '0\n1', '\na', 'bcde\n2\n3' ];
  var expectedLog = '1 : 0\n2 : 1\n3 : abcde\n4 : 2\n5 : 3';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - nearestLines: out of the range';
  var src = '0\n1\nabcde\n2\n3\n4\n5\n6';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 3, 5 ], gray : 1, nearestLines : 2 });
  var expectedNearest = [ '0\n1', '\na', 'bcde' ];
  var expectedLog = '1 : 0\n2 : 1\n3 : abcde';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'changes - nearestLines: big amount';
  var src = '0\n1\nabcde\n2\n3\n4\n5\n6';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 3, 5 ], gray : 1, nearestLines : 10 });
  var expectedNearest = [ '0\n1', '\na', 'bcde\n2\n3\n4\n5' ];
  var expectedLog = '1 : 0\n2 : 1\n3 : abcde\n4 : 2\n5 : 3\n6 : 4\n7 : 5';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  /* */

  test.case = 'wrong range (first === second) - charsRangeLeft: [ 5, 5 ]'
  var src = '0\n1\nabcde\n2\n3\n4\n5\n6';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 5, 5 ], gray : 1, nearestLines : 5 });
  var expectedNearest = [ '0\n1\na', '', 'bcde\n2\n3' ];
  var expectedLog = '1 : 0\n2 : 1\n3 : abcde\n4 : 2\n5 : 3';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'wrong range (first > second) - charsRangeLeft: [ 1, 0 ]';
  var src = 'abc';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 1, 0 ], gray : 1, nearestLines : 5 });
  var expectedNearest = [ 'a', '', 'bc' ];
  var expectedLog = '1 : abc';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'wrong range (first === second) - charsRangeLeft: [ 0, 0 ]';
  var src = 'abcdefg';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 0, 0 ], gray : 1, nearestLines : 5 });
  var expectedNearest = [ '', '', 'abcdefg' ];
  var expectedLog = '1 : abcdefg';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'wrong range (first > second) - charsRangeLeft: [ 7, 2 ]';
  var src = 'abcdefg';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 7, 2 ], gray : 1, nearestLines : 5 });
  var expectedNearest = [ 'abcdefg', '', '' ];
  var expectedLog = '1 : abcdefg';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.close( 'multiline' );

  /* - */

  test.open( 'check-fix test' );

  test.case = 'start at 1';
  var src = 'ab\ncd\nef\ngh';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 6, 8 ], gray : 1, nearestLines : 5 });
  var expectedNearest = [ 'ab\ncd\n', 'ef', '\ngh' ];
  var expectedLog = '1 : ab\n2 : cd\n3 : ef\n4 : gh';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'start at 1 & one line';
  var src = 'ab\ncd\nef\ngh';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 6, 8 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ '', 'ef', '' ];
  var expectedLog = '3 : ef';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'start at 2';
  var src = 'ab\ncd\nef\ngh';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 6, 8 ], gray : 1, nearestLines : 3 });
  var expectedNearest = [ 'cd\n', 'ef', '\ngh' ];
  var expectedLog = '2 : cd\n3 : ef\n4 : gh';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'start at 2 & one line';
  var src = 'ab\ncd\nef\ngh';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 6, 8 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ '', 'ef', '' ];
  var expectedLog = '3 : ef';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'start at 3';
  var src = 'ab\ncd\nef\ngh\nik\nlm';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 9, 11 ], gray : 1, nearestLines : 3 });
  var expectedNearest = [ 'ef\n', 'gh', '\nik' ];
  var expectedLog = '3 : ef\n4 : gh\n5 : ik';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.case = 'start at 3 & one line';
  var src = 'ab\ncd\nef\ngh\nik\nlm';
  var got = _.strLinesNearestLog({ src, charsRangeLeft : [ 9, 11 ], gray : 1, nearestLines : 1 });
  var expectedNearest = [ '', 'gh', '' ];
  var expectedLog = '4 : gh';
  test.identical( got.nearest, expectedNearest );
  test.identical( got.log, expectedLog );

  test.close( 'check-fix test' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () =>  _.strLinesNearestLog());

  test.case = 'wrong type of args';
  test.shouldThrowErrorSync( () =>  _.strLinesNearestLog( 3 ));

  test.case = 'charsRangeLeft[ 0 ] < 0';
  test.shouldThrowErrorSync( () =>  _.strLinesNearestLog({ src : 'abcde', charsRangeLeft : [ -1, 2 ], gray : 1, nearestLines : 5 }));

  test.case = 'charsRangeLeft[ 1 ] < 0';
  test.shouldThrowErrorSync( () =>  _.strLinesNearestLog({ src : 'abcde', charsRangeLeft : [ 1, -2 ], gray : 1, nearestLines : 5 }));

  test.case = 'charsRangeLeft[ 0 ] > src.length';
  test.shouldThrowErrorSync( () =>  _.strLinesNearestLog({ src : 'abcde', charsRangeLeft : [ 100, 2 ], gray : 1, nearestLines : 5 }));

  test.case = 'charsRangeLeft[ 0 ] > src.length';
  test.shouldThrowErrorSync( () =>  _.strLinesNearestLog({ src : 'abcde', charsRangeLeft : [ 1, 200 ], gray : 1, nearestLines : 5 }));
}

//

function strLinesCount( test )
{

  test.case = 'returns 1';
  var func = 'function( x, y ) { return x + y; }';
  var got = _.strLinesCount( func );
  var expected = 1;
  test.identical( got, expected );

  test.case = 'returns 4';
  var func = 'function( x, y ) \n { \n   return x + y; \n }';
  var got = _.strLinesCount( func );
  var expected = 4;
  test.identical( got, expected );

  test.case = 'one line string test';
  var got = _.strLinesCount( 'one line' );
  var expected = 1;
  test.identical( got, expected );

  test.case = 'multiline string test';
  var got = _.strLinesCount( 'first line\nsecond line\nthird line' );
  var expected = 3;
  test.identical( got, expected );

  test.case = 'multiline  text test';
  var got = _.strLinesCount
  (
    `one
     two
     three`
  );
  var expected = 3;
  test.identical( got, expected );

  /**/

  if( !Config.debug )
  return;

  test.case = 'invalid arguments count';
  test.shouldThrowErrorSync( function()
  {
    _.strLinesCount( '1', '2' );
  });

  test.case = 'invalid argument type';
  test.shouldThrowErrorSync( function()
  {
    _.strLinesCount( 123 );
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function()
  {
    _.strLinesCount();
  });

  test.case = 'no arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strLinesCount( );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strLinesCount( [ 1, '\n', 2 ] );
  } );

  test.case = 'argument is wrong';
  test.shouldThrowErrorSync( function( )
  {
    _.strLinesCount( 13 );
  } );

  test.case = 'too many arguments';
  test.shouldThrowErrorSync( function( )
  {
    _.strLinesCount( 'function( x, y ) \n { \n   return x + y; \n }', 'redundant argument' );
  } );

}

//

function strLinesRangeWithCharRange( test )
{

  test.open( 'embraced by empty lines' );

  var srcStr =
`
a
bc
def
ghij

`;

  /* */

  test.case = 'single line in the middle';
  var cinterval = [ 3, 4 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 2, 3 ] );
  test.identical( sub, 'bc' );

  /* */

  test.case = 'line in the middle with NL';
  var cinterval = [ 3, 5 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 2, 4 ] );
  test.identical( sub, 'bc\n' );

  /* */

  test.case = 'single line in the beginning';
  var cinterval = [ 1, 1 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 1, 2 ] );
  test.identical( sub, 'a' );

  /* */

  test.case = 'line in the beginning with NL';
  var cinterval = [ 1, 2 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 1, 3 ] );
  test.identical( sub, 'a\n' );

  /* */

  test.case = 'single line in the end';
  var cinterval = [ 10, 13 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 4, 5 ] );
  test.identical( sub, 'ghij' );

  /* */

  test.case = 'line in the end with NL';
  var cinterval = [ 10, 14 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 4, 6 ] );
  test.identical( sub, 'ghij\n' );

  /* */

  test.case = 'not aligned range with multiple lines';
  var cinterval = [ 4, 10 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 2, 5 ] );
  test.identical( sub, 'c\ndef\ng' );

  /* */

  test.case = 'empty line in the beginning';
  var cinterval = [ 0, -1 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 0, 1 ] );
  test.identical( sub, '' );

  /* */

  test.case = 'empty line in the end';
  var cinterval = [ 15, 14 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 5, 6 ] );
  test.identical( sub, '' );

  test.close( 'embraced by empty lines' );

  /* */

  test.open( 'not embraced by empty lines' );

  var srcStr =
`a
bc
def
ghij`;

  /* */

  test.case = 'single line in the middle';
  var cinterval = [ 2, 3 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 1, 2 ] );
  test.identical( sub, 'bc' );

  /* */

  test.case = 'line in the middle with NL';
  var cinterval = [ 2, 4 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 1, 3 ] );
  test.identical( sub, 'bc\n' );

  /* */

  test.case = 'single line in the beginning';
  var cinterval = [ 0, 0 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 0, 1 ] );
  test.identical( sub, 'a' );

  /* */

  test.case = 'line in the beginning with NL';
  var cinterval = [ 0, 1 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 0, 2 ] );
  test.identical( sub, 'a\n' );

  /* */

  test.case = 'single line in the end';
  var cinterval = [ 9, 12 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 3, 4 ] );
  test.identical( sub, 'ghij' );

  /* */

  test.case = 'line in the end with NL';
  var cinterval = [ 9, 13 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 3, 4 ] );
  test.identical( sub, 'ghij' );

  /* */

  test.case = 'not aligned range with multiple lines';
  var cinterval = [ 3, 9 ];
  var sub = _.strOnly( srcStr, cinterval );
  var linterval = _.strLinesRangeWithCharRange( srcStr, cinterval );
  test.identical( linterval, [ 1, 4 ] );
  test.identical( sub, 'c\ndef\ng' );

  test.close( 'not embraced by empty lines' );

}

//

function strLinesSize( test )
{
  test.open( 'change src' )

  test.case = 'src is empty';
  var src = { src : '' };
  var expected = [ 1, 0 ];
  var got  = _.strLinesSize( src );

  test.case = 'src is a sequence of linebreaks';
  var src = { src : '\n\n' };
  var expected = [ 3, 0 ];
  var got  = _.strLinesSize( src );

  test.identical( got, expected );

  test.case = '1 letter';
  var src = { src : 's' };
  var expected = [ 1, 1 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = 'a few letters, one line';
  var src = { src : 'string' };
  var expected = [ 1, 6 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = '3 lines with 1 letter each';
  var src = { src : 'a\nb\nc' };
  var expected = [ 3, 1 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = '3 lines with 2 letters each';
  var src = { src : 'ab\ncd\nef' };
  var expected = [ 3, 2 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = '3 lines with different amount of letters';
  var src = { src : 'ab\ncde\nfghk' };
  var expected = [ 3, 4 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = '3 lines with different amount of letters';
  var src = { src : 'ab\ncde\nfghk' };
  var expected = [ 3, 4 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = '3 lines with different amount of letters and numbers';
  var src = { src : 'ab\ncde\nfghk5678' };
  var expected = [ 3, 8 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.close( 'change src' )

  /* - */

  test.open( 'change onLength' )

  test.case = 'true length is smaller';
  var src =
  {
    src : 'ab\ncde\nfghk',
    onLength : ( src ) =>
    {
      src = src.replace( /fghk/mg, 'a' );
      return src.length;
    }
  };
  var expected = [ 3, 3 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = 'true length is the same';
  var src =
  {
    src : 'ab\ncde\nfghk',
    onLength : ( src ) =>
    {
      src = src.replace( /fghk/mg, 'aa'+'aa' );
      return src.length;
    }
  };
  var expected = [ 3, 4 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.case = 'true length is bigger';
  var src =
  {
    src : 'ab\ncde\nfghk',
    onLength : ( src ) =>
    {
      src = src.replace( /ab/mg, 'aa'+'aa'+'aa' );
      return src.length;
    }
  };
  var expected = [ 3, 6 ];
  var got  = _.strLinesSize( src );
  test.identical( got, expected );

  test.close( 'change onLength' )
}

// --
// test suite definition
// --

const Proto =
{

  name : 'Tools.Str.l1',
  silencing : 1,
  enabled : 1,

  tests :
  {

    // evaluator

    strCount,

    // replacer

    // strRemoveBegin,
    // strRemoveEnd,
    strRemove,

    // strReplaceBegin,
    // strReplaceEnd,
    // strReplace,

    strPrependOnce,
    strAppendOnce,

    strReplaceWords,

    // etc

    strCommonLeft,
    strCommonRight,
    strRandom,
    strAlphabetFromRange,

    // formatter

    strForRange,

    // transformer

    strCapitalize,
    strDecapitalize,
    strSignBasic,
    strDesignBasic,
    strIsSignedBasic,
    strSignOptionPrefix,
    strDesignOptionPrefix,
    strIsSignedOptionPrefix,
    strSignDesignCombination,

    strUnicodeEscape,

    // stripper

    strStrip,
    strStripLeft,
    strStripRight,
    strRemoveAllSpaces,
    strStripEmptyLines,

    // splitter

    strSplitStrNumber,

    strSplitCamel,

    // extractor

    _strOnly,
    strOnly,
    _strBut,
    _strButInsIsLong,
    strBut,
    strButInsIsLong,

    strUnjoin,

    // joiner

    strDup,
    strJoin,
    strJoinPath,

    // liner

    strLinesIndentation,
    strLinesBut,
    strLinesOnly,
    strLinesStrip,
    strLinesNumber,
    strLinesNumberOptionHighlighting,
    strLinesNumberZeroLine,
    strLinesNumberZeroChar,
    strLinesNumberOnLine,

    strLinesSelect,
    strLinesSelectOptionSelectMode,
    strLinesSelectOptionHighlighting,
    strLinesSelectOptionNumbering,
    strLinesSelectOptionZeroLine,
    strLinesSelectOptionDelimeter,

    strLinesNearest,
    strLinesNearestLog,
    strLinesCount,
    strLinesRangeWithCharRange,
    strLinesSize,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
