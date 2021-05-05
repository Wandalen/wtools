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

  test.case = 'regexp and string';
  var got = _.str.equivalent( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.str.equivalent( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.str.equivalent( /\w+/, /\w+/ );
  test.identical( got, true );

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

function strConcat( test )
{

  test.case = 'srcs - empty array';
  var srcs = [];
  var got = _.strConcat( srcs );
  test.identical( got, '' );

  test.case = 'srcs - empty string';
  var srcs = '';
  var got = _.strConcat( srcs );
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

//

function exportStringCodeShallow( test )
{

  test.case = 'string';
  var src = 'string';
  var expected = '\'string\'';
  var got = _.str.exportStringCodeShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.str.exportStringCodeShallow() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.str.exportStringCodeShallow( {} ) );

}

//

function exportStringDiagnosticShallow( test )
{

  test.case = 'string';
  var src = 'string';
  var expected = 'string';
  var got = _.str.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.str.exportStringDiagnosticShallow() );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.str.exportStringDiagnosticShallow( {} ) );
}

exportStringDiagnosticShallow.timeOut = 10000;

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
    strConcat,

    exportStringCodeShallow,
    exportStringDiagnosticShallow,

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
