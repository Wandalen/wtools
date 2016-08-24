( function _StringTools1_test_s_( ) {

'use strict';

/*

 to run this test
 from the project directory run

 npm install
 node ./staging/abase/z.tests/StringFormat.test.s

 */

if( typeof module !== 'undefined' )
{

  require( '../wTools.s' );
  require( '../component/StringTools.s' );

  if( require( 'fs' ).existsSync( __dirname + '/../object/Testing.debug.s' ) )
    require( '../object/Testing.debug.s' );
  else
    require( 'wTesting' );

}

var _ = wTools;
var Self = {};

//

var _toStrFromNumber = function( test )
{

  test.description = 'returns with precision until 5';
  var options = { precision : 5 };
  var got = _._toStrFromNumber( 3.123456, options );
  var expected = '3.1235';
  test.identical( got, expected );

  test.description = 'returns with precision until 2';
  var options = { precision : 2 };
  var got = _._toStrFromNumber( 3.123456, options );
  var expected = '3.1';
  test.identical( got, expected );

  test.description = 'is returned with four numbers after dot';
  var options = { fixed : 4 };
  var got = _._toStrFromNumber( 13.75, options );
  var expected = '13.7500';
  test.identical( got, expected );

  test.description = 'is returned the rounded number to the top';
  var options = { fixed : 0 };
  var got = _._toStrFromNumber( 13.50, options );
  var expected = '14';
  test.identical( got, expected );

  test.description = 'is returned the rounded number to the bottom';
  var options = { fixed : 0 };
  var got = _._toStrFromNumber( 13.49, options );
  var expected = '13';
  test.identical( got, expected );

  test.description = 'returns string';
  var options = {  };
  var got = _._toStrFromNumber( 13.75, options );
  var expected = '13.75';
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _._toStrFromNumber( );
    } );

    test.description = 'first argument is wrong';
    test.shouldThrowError( function( )
    {
      _._toStrFromNumber( 'wrong argument', { fixed : 3 } );
    } );

    test.description = 'second argument is not provided';
    test.shouldThrowError( function( )
    {
      _._toStrFromNumber( 13.75 );
    } );

    test.description = 'second argument is wrong precision must be between 1 and 21';
    test.shouldThrowError( function( )
    {
      _._toStrFromNumber( 13.75, { precision : 0 } );
    } );

  }

};


var _toStrIsSimpleElement = function( test )
{

  test.description = 'argument\'s length is less than 40 symbols';
  var got = _._toStrIsSimpleElement( 'test' );
  var expected = true;
  test.identical( got, expected );

  test.description = 'argument is number';
  var got = _._toStrIsSimpleElement( 13 );
  var expected = true;
  test.identical( got, expected );

  test.description = 'argument is boolean';
  var got = _._toStrIsSimpleElement( true );
  var expected = true;
  test.identical( got, expected );

  test.description = 'argument is null';
  var got = _._toStrIsSimpleElement( null );
  var expected = true;
  test.identical( got, expected );

  test.description = 'argument is undefined';
  var got = _._toStrIsSimpleElement( undefined );
  var expected = true;
  test.identical( got, expected );

  test.description = 'argument\'s length is greater than 40 symbols';
  var got = _._toStrIsSimpleElement( 'test,test,test,test,test,test,test,test,test.' );
  var expected = false;
  test.identical( got, expected );

  test.description = 'argument is an object';
  var got = _._toStrIsSimpleElement( { a: 33 } );
  var expected = false;
  test.identical( got, expected );

  test.description = 'argument is an array';
  var got = _._toStrIsSimpleElement( [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.description = 'argument is an array-like';
  var arrLike = ( function( ) { return arguments; } )( 1, 2, 3 );
  var got = _._toStrIsSimpleElement( arrLike );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {


  }

};


var toStrForRange = function( test )
{

  test.description = 'returns string representing the range of numbers';
  var got = _.toStrForRange( [ 1, 10 ] );
  var expected = '[ 1..10 ]';
  test.identical( got, expected );

  test.description = 'returns string representing the range of symbols';
  var got = _.toStrForRange( [ 'a', 'z' ] );
  var expected = '[ a..z ]';
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.toStrForRange( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.toStrForRange( 'wrong argument' );
    } );

    test.description = 'too many arguments';
    test.shouldThrowError( function( )
    {
      _.toStrForRange( [ 1, 10 ], 'redundant argument' );
    } );

  }

};

//

var strCapitalize = function( test )
{

  test.description = 'first letter is upper case';
  var got = _.strCapitalize( 'object' );
  var expected = 'Object';
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strCapitalize( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strCapitalize( 33 );
    } );

    test.description = 'too many arguments';
    test.shouldThrowError( function( )
    {
      _.strCapitalize( 'object', 'redundant argument' );
    } );

  }

};

//

var strTimes = function( test )
{

  test.description = 'returns the empty string';
  var got = _.strTimes( 'abc', 0 );
  var expected = '';
  test.identical( got, expected );

  test.description = 'returns the first copy of the given string';
  var got = _.strTimes( 'abc', 1 );
  var expected = 'abc';
  test.identical( got, expected );

  test.description = 'copies and concatenates first argument three times';
  var got = _.strTimes( 'abc', 3 );
  var expected = 'abcabcabc';
  test.identical( got, expected );

  test.description = 'copies and concatenates first argument ( number ) three times';
  var got = _.strTimes( 13, 3 );
  var expected = '131313';
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strTimes( );
    } );

    test.description = 'second argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strTimes( 'a', 'wrong argument' );
    } );

    test.description = 'second argument is not provided';
    test.shouldThrowError( function( )
    {
      _.strTimes( 'a' );
    } );

  }

}

//

var strLineCount = function( test )
{

  test.description = 'returns 1';
  var func = 'function( x, y ) { return x + y; }';
  var got = _.strLineCount( func );
  var expected = 1;
  test.identical( got, expected );

  test.description = 'returns 4';
  var func = 'function( x, y ) \n { \n   return x + y; \n }';
  var got = _.strLineCount( func );
  var expected = 4;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strLineCount( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strLineCount( [ 1, '\n', 2 ] );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strLineCount( 13 );
    } );

    test.description = 'too many arguments';
    test.shouldThrowError( function( )
    {
      _.strLineCount( 'function( x, y ) \n { \n   return x + y; \n }', 'redundant argument' );
    } );

  }

}

//

var strSplitStrNumber = function( test )
{

  test.description = 'returns object with one property';
  var got = _.strSplitStrNumber( 'abcdef' );
  var expected = { str : 'abcdef' };
  test.identical( got, expected );

  test.description = 'returns object with two properties';
  var got = _.strSplitStrNumber( 'abc3def' );
  var expected = { str : 'abc', number : 3 };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strSplitStrNumber( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strSplitStrNumber( [  ] );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strSplitStrNumber( 13 );
    } );

    test.description = 'too many arguments';
    test.shouldThrowError( function( )
    {
      _.strSplitStrNumber( 'abc3', 'redundant argument' );
    } );

  }

}

//

var strStrip = function( test )
{

  test.description = 'nothing to remove';
  var got = _.strStrip( 'test' );
  var expected = 'test';
  test.identical( got, expected );

  test.description = 'removes whitespace from both ends of a string';
  var got = _.strStrip( ' test ' );
  var expected = 'test';
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strStrip( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strStrip( [  ] );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strStrip( 13 );
    } );

    test.description = 'too many arguments';
    test.shouldThrowError( function( )
    {
      _.strStrip( ' test ', 'redundant argument' );
    } );

  }

};


var strSplit = function( test )
{

  test.description = 'returns an array of strings';
  var got = _.strSplit( 'test test test' );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  test.description = 'split string into an array of strings';
  var got = _.strSplit( ' test   test   test ' );
  var expected = [ 'test', 'test', 'test' ];
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strSplit( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strSplit( [  ] );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strSplit( 13 );
    } );

    test.description = 'too many arguments';
    test.shouldThrowError( function( )
    {
      _.strSplit( ' test   test   test ', 'redundant argument' );
    } );

  }

};


var strRemoveAllSpaces = function( test )
{

  test.description = 'removes the spaces from the given string';
  var got = _.strRemoveAllSpaces( 'a b c d e f' );
  var expected = 'abcdef';
  test.identical( got, expected );

  test.description = 'replaces the all spaces with the commas';
  var got = _.strRemoveAllSpaces( 'a b c d e f', ',' );
  var expected = 'a,b,c,d,e,f';
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strRemoveAllSpaces( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strRemoveAllSpaces( [  ] );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strRemoveAllSpaces( 13 );
    } );

    test.description = 'too many arguments';
    test.shouldThrowError( function( )
    {
      _.strRemoveAllSpaces( 'a b c d e f', ',', 'redundant argument' );
    } );

  }

};


var strDifference = function( test )
{

  test.description = 'returns the string';
  var got = _.strDifference( 'abc', 'abd' );
  var expected = 'ab*';
  test.identical( got, expected );

  test.description = 'returns the string where the difference in the first letter';
  var got = _.strDifference( 'abc', 'def' );
  var expected = '*';
  test.identical( got, expected );

  test.description = 'returns false because arguments are equal';
  var got = _.strDifference( 'abc', 'abc' );
  var expected = false;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strDifference( );
    } );

    test.description = 'first argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strDifference( [  ], 'abc' );
    } );

    test.description = 'second argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strDifference( 'abc', 13 );
    } );

    test.description = 'not enough arguments';
    test.shouldThrowError( function( )
    {
      _.strDifference( 'abc' );
    } );

  }

};


var strLattersSpectre = function( test )
{

  test.description = 'returns the object';
  var got = _.strLattersSpectre( 'abcacc' );
  var expected = { a: 2, b: 1, c: 3, length: 6 };
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strLattersSpectre( );
    } );

  }

};


var strNumberLines = function( test )
{

  test.description = 'returns the object';
  var got = _.strNumberLines( 'abc\ndef\nghi' );
  var expected = got;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strNumberLines( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strNumberLines( [  ] );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strNumberLines( 13 );
    } );

  }

};


var strCount = function( test )
{

  test.description = 'returns 2';
  var got = _.strCount( 'abc\ndef\nghi', '\n' );
  var expected = 2;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strCount( );
    } );

    test.description = 'first argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strCount( [  ], '\n' );
    } );

    test.description = 'second argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strCount( 'abc\ndef\nghi', 13 );
    } );

    test.description = 'not enough arguments';
    test.shouldThrowError( function( )
    {
      _.strCount( 'abc\ndef\nghi' );
    } );

  }

};



var strToBytes = function( test )
{

  test.description = 'returns the typed-array';
  var got = _.strToBytes( 'abc' );
  var expected = got;
  test.identical( got, expected );

  /**/

  if( Config.debug )
  {

    test.description = 'no arguments';
    test.shouldThrowError( function( )
    {
      _.strToBytes( );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strToBytes( [  ] );
    } );

    test.description = 'argument is wrong';
    test.shouldThrowError( function( )
    {
      _.strToBytes( 13 );
    } );

  }

};



// node ./staging/abase/z.tests/StringFormat.test.s

//

var Proto =
{

  name : 'StringTools',

  tests:
  {

    _toStrFromNumber : _toStrFromNumber,
    _toStrIsSimpleElement : _toStrIsSimpleElement,
    toStrForRange : toStrForRange,
    strCapitalize : strCapitalize,
    strTimes : strTimes,
    strLineCount : strLineCount,
    strSplitStrNumber : strSplitStrNumber,
    strStrip : strStrip,
    strSplit : strSplit,
    strRemoveAllSpaces : strRemoveAllSpaces,
    strDifference : strDifference,
    strLattersSpectre : strLattersSpectre,
    strNumberLines : strNumberLines,
    strCount : strCount,
    strToBytes : strToBytes,

  }

};

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
  _.testing.test( Self );

} )( );
