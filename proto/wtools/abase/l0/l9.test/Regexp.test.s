( function _l0_l9_Regexp_test_s_()
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
// implementation
// --

function regexpsEquivalent( test )
{
  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalent( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalent( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalent( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalent( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalent( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalent( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalent( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalent( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalent( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vector, true' );

  test.case = 'vector, vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.case = 'vector, scalar';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.case = 'scalar, vector';
  var src1 = 'abc';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ true, true, true, true ] );

  test.close( 'vector, true' );

  /* - */

  test.open( 'vector, false' );

  test.case = 'vector, vector';
  var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/g ];
  var src2 = [ 'abc', 'abc', 'abc', /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, false, false, false, false, false ] );

  test.case = 'vector, scalar';
  var src1 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
  var src2 = 'abc';
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, true, true, true, true, true ] );

  test.case = 'scalar, vector';
  var src1 = 'abc';
  var src2 = [ 'abd', /\s+/, /\w/, 'abc', 'abc', /\w*/, /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalent( src1, src2 );
  test.identical( got, [ false, false, false, true, true, true, true, true ] );

  test.close( 'vector, false' );
}

//

function regexpsEquivalentAll( test )
{
  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAll( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAll( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAll( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAll( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAll( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAll( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAll( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAll( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAll( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc', 'abc', 'aa', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'bb', 'aa' ];
  var src2 = [ 'abc', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'abc', 'abc', /\w+/, /\w+/gi ];
  var got = _.regexpsEquivalentAll( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function regexpsEquivalentAny( test )
{

  /* - */

  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAny( 'abc', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAny( /\w+/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAny( 'abc', /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w+/, /\w+/ );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalentAny( 'abd', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAny( /\s+/, 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentAny( /\w/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAny( 'abc', /\s+/ );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentAny( 'abc', /\w/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w*/, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w+/g, /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentAny( /\w+/g, /\w+/gi );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+\s\w/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/gi, /\w+/g ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'a', 'b' ];
  var src2 = [ 'ab', 'ab', 'aa', 'b' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc d', 'aa d', 'bb d' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc d', 'aa d', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+\s/;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+\s/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'b', 'a' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
  var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
  var got = _.regexpsEquivalentAny( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function regexpsEquivalentNone( test )
{

  /* - */

  test.open( 'scalar, false' );

  test.case = 'strings';
  var got = _.regexpsEquivalentNone( 'abc', 'abc' );
  test.identical( got, false );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentNone( /\w+/, 'abc' );
  test.identical( got, false );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentNone( 'abc', /\w+/ );
  test.identical( got, false );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w+/, /\w+/ );
  test.identical( got, false );

  test.close( 'scalar, false' );

  /* - */

  test.open( 'scalar, true' );

  test.case = 'strings';
  var got = _.regexpsEquivalentNone( 'abd', 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentNone( /\s+/, 'abc' );
  test.identical( got, true );

  test.case = 'regexp and string';
  var got = _.regexpsEquivalentNone( /\w/, 'abc' );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentNone( 'abc', /\s+/ );
  test.identical( got, true );

  test.case = 'string and regexp';
  var got = _.regexpsEquivalentNone( 'abc', /\w/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w*/, /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w+/g, /\w+/ );
  test.identical( got, true );

  test.case = 'regexp and regexp';
  var got = _.regexpsEquivalentNone( /\w+/g, /\w+/gi );
  test.identical( got, true );

  test.close( 'scalar, true' );

  /* - */

  test.open( 'vectors, true' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'abc', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/g ];
  var src2 = /\w+\s/;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+\s/g;
  var src2 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/g, /\w+/g ];
  var src2 = /\w+/gi;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc d';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/gi;
  var src2 = [ /\w+/g, /\w+/g ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'b', 'a' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc d', 'abc d', 'aa d', 'bb d' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc', 'aa', 'bb d' ];
  var src2 = [ /\w+/, /\w+\s/gi, /\w+\s/g, /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc d', /\w+\s/, /\w+/gi ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, true );

  test.close( 'vectors, true' );

  /* - */

  test.open( 'vectors, false' );

  test.case = 'mixed vector, scalar - string';
  var src1 = [ 'ab', /\w+/, 'ab', /\w+/ ];
  var src2 = 'abc';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, scalar - regexp';
  var src1 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var src2 = /\w+/;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, mixed vector';
  var src1 = 'abc d';
  var src2 = [ 'abc', /\w+/, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, mixed vector';
  var src1 = /\w+/;
  var src2 = [ 'abc d', /\w+/g, 'abc d', /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - string';
  var src1 = [ /\w+\s\w/g, /\w+/gi ];
  var src2 = 'abc d';
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, scalar - regexp';
  var src1 = [ /\w+/, /\w+/g ];
  var src2 = /\w+/g;
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - string, vector of regexp';
  var src1 = 'abc';
  var src2 = [ /\w+/g, /\w+/gi ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'scalar - regexp, vector of regexp';
  var src1 = /\w+/g;
  var src2 = [ /\w+/gi, /\w+/g ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of strings';
  var src1 = [ 'abc', 'abc', 'aa'+'a', 'bb' ];
  var src2 = [ 'ab', 'ab', 'aa', 'bb' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of regexp, vector of strings';
  var src1 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var src2 = [ 'abc', 'abc d', 'aa'+'a d', 'bb d' ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'vector of strings, vector of regexp';
  var src1 = [ 'abc d', 'abc d', 'aa'+'a d', 'bb' ];
  var src2 = [ /\w+/, /\w+/gi, /\w+/g, /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.case = 'mixed vector, mixed vector';
  var src1 = [ 'abc', /\w+/, 'abc', /\w+/ ];
  var src2 = [ 'ab', 'abc', /\w+/, /\w+/ ];
  var got = _.regexpsEquivalentNone( src1, src2 );
  test.identical( got, false );

  test.close( 'vectors, false' );
}

//

function maybeFrom( test )
{
  test.open( 'default options, without options map' );

  test.case = 'srcStr - empty string';
  var src = '';
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /(?:)/g );

  test.case = 'srcStr - simple string';
  var src = 'abc';
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /abc/g );

  test.case = 'srcStr - string similar to regexp';
  var src = '[abc]$';
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /\[abc\]\$/g );

  test.case = 'srcStr - string with regexp';
  var src = '/[abc]$/g';
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /\/\[abc\]\$\/g/g );

  test.case = 'srcStr - string with three regexps without flags';
  var src = '/[abc]//\s//\d$/';
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /\/\[abc\]sd\$\//g );

  test.case = 'srcStr - string with spaces';
  var src = 'a b c $';
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /a\s*b\s*c\s*\$/g );

  /* */

  test.case = 'srcStr - simple regexp';
  var src = /abc/;
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /abc/ );

  test.case = 'srcStr - regexp with flags';
  var src = /[abc]$/gm;
  var got = _.regexp.maybeFrom( src );
  test.identical( got, /[abc]$/gm );

  test.close( 'default options, without options map' );

  /* - */

  test.open( 'default options, options map' );

  test.case = 'srcStr - empty string';
  var src = '';
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /(?:)/g );

  test.case = 'srcStr - simple string';
  var src = 'abc';
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /abc/g );

  test.case = 'srcStr - string similar to regexp';
  var src = '[abc]$';
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /\[abc\]\$/g );

  test.case = 'srcStr - string with regexp';
  var src = '/[abc]$/g';
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /\/\[abc\]\$\/g/g );

  test.case = 'srcStr - string with three regexps without flags';
  var src = '/[abc]//\s//\d$/';
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /\/\[abc\]sd\$\//g );

  test.case = 'srcStr - string with spaces';
  var src = 'a b c $';
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /a\s*b\s*c\s*\$/g );

  /* */

  test.case = 'srcStr - simple regexp';
  var src = /abc/;
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /abc/ );

  test.case = 'srcStr - regexp with flags';
  var src = /[abc]$/gm;
  var got = _.regexp.maybeFrom( { srcStr : src } );
  test.identical( got, /[abc]$/gm );

  test.close( 'default options, options map' );

  /* - */

  test.open( 'not default flags' );

  test.case = 'srcStr - empty string';
  var src = '';
  var got = _.regexp.maybeFrom( { srcStr : src, flags : '' } );
  test.identical( got, /(?:)/ );

  test.case = 'srcStr - simple string';
  var src = 'abc';
  var got = _.regexp.maybeFrom( { srcStr : src, flags : '' } );
  test.identical( got, /abc/ );

  test.case = 'srcStr - string similar to regexp';
  var src = '[abc]$';
  var got = _.regexp.maybeFrom( { srcStr : src, flags : 'gm' } );
  test.identical( got, /\[abc\]\$/gm );

  test.case = 'srcStr - string with regexp';
  var src = '/[abc]$/g';
  var got = _.regexp.maybeFrom( { srcStr : src, flags : '' } );
  test.identical( got, /\/\[abc\]\$\/g/ );

  test.case = 'srcStr - string with three regexps without flags';
  var src = '/[abc]//\s//\d$/';
  var got = _.regexp.maybeFrom( { srcStr : src, flags : 'gm' } );
  test.identical( got, /\/\[abc\]sd\$\//gm );

  test.case = 'srcStr - string with spaces';
  var src = 'a b c $';
  var got = _.regexp.maybeFrom( { srcStr : src, flags : '' } );
  test.identical( got, /a\s*b\s*c\s*\$/ );

  /* */

  test.case = 'srcStr - simple regexp';
  var src = /abc/;
  var got = _.regexp.maybeFrom( { srcStr : src, flags : 'gm' } );
  test.identical( got, /abc/ );

  test.case = 'srcStr - regexp with flags';
  var src = /[abc]$/gm;
  var got = _.regexp.maybeFrom( { srcStr : src, flags : '' } );
  test.identical( got, /[abc]$/gm );

  test.close( 'not default flags' );

  /* - */

  test.open( 'toleratingSpaces - 0' );

  test.case = 'srcStr - empty string';
  var src = '';
  var got = _.regexp.maybeFrom( { srcStr : src, toleratingSpaces : 0 } );
  test.identical( got, /(?:)/g );

  test.case = 'srcStr - simple string';
  var src = 'a b c';
  var got = _.regexp.maybeFrom( { srcStr : src, toleratingSpaces : 0 } );
  test.identical( got, /a b c/g );

  test.case = 'srcStr - string similar to regexp';
  var src = '[ a  b  c ]  $';
  var got = _.regexp.maybeFrom( { srcStr : src, toleratingSpaces : 0 } );
  test.identical( got, /\[ a  b  c \]  \$/g );

  test.case = 'srcStr - string with regexp';
  var src = '/ [ a b c ] $ /   g';
  var got = _.regexp.maybeFrom( { srcStr : src, toleratingSpaces : 0 } );
  test.identical( got, /\/ \[ a b c \] \$ \/   g/g );

  test.case = 'srcStr - string with three regexps without flags';
  var src = '/ [ a b c ] // \ s // \ d $/';
  var got = _.regexp.maybeFrom( { srcStr : src, toleratingSpaces : 0 } );
  test.identical( got, /\/ \[ a b c \]   s   d \$\//g );

  /* */

  test.case = 'srcStr - simple regexp';
  var src = /a b c/;
  var got = _.regexp.maybeFrom( { srcStr : src, flags : 'gm' } );
  test.identical( got, /a b c/ );

  test.case = 'srcStr - regexp with flags';
  var src = /[ a b c ] $/gm;
  var got = _.regexp.maybeFrom( { srcStr : src, flags : '' } );
  test.identical( got, /[ a b c ] $/gm );

  test.close( 'toleratingSpaces - 0' );

  /* - */

  test.open( 'stringWithRegexp - 0' );

  test.case = 'srcStr - empty string';
  var src = '';
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /(?:)/g );

  test.case = 'srcStr - simple string';
  var src = 'abc';
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /abc/g );

  test.case = 'srcStr - string similar to regexp';
  var src = '[abc]$';
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /\[abc\]\$/g );

  test.case = 'srcStr - string with regexp';
  var src = '/[abc]$/g';
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /\/\[abc\]\$\/g/g );

  test.case = 'srcStr - string with three regexps without flags';
  var src = '/[abc]//\s//\d$/';
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /\/\[abc\]\/\/s\/\/d\$\//g );

  test.case = 'srcStr - string with spaces';
  var src = 'a b c $';
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /a\s*b\s*c\s*\$/g );

  /* */

  test.case = 'srcStr - simple regexp';
  var src = /abc/;
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /abc/ );

  test.case = 'srcStr - regexp with flags';
  var src = /[abc]$/gm;
  var got = _.regexp.maybeFrom( { srcStr : src, stringWithRegexp : 0 } );
  test.identical( got, /[abc]$/gm );

  test.close( 'stringWithRegexp - 0' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.regexp.maybeFrom() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.regexp.maybeFrom( 'abc', 'wrong' ) );

  test.case = 'wrong type of srcStr';
  test.shouldThrowErrorSync( () => _.regexp.maybeFrom( 1 ) );
  test.shouldThrowErrorSync( () => _.regexp.maybeFrom( { srcStr : [] } ) );

  test.case = 'unknown option in map options';
  test.shouldThrowErrorSync( () => _.regexp.maybeFrom( { srcStr : 'a', range : [ 1, 2 ] } ) );
}

//

function regexpsSources( test )
{
  var context = this;

  /* */

  test.case = 'empty';

  var expected =
  {
    sources : [],
    flags : null,
    escaping : 0,
  }
  var got = _.regexp.s.sources([]);
  test.identical( got, expected );

  /* */

  test.case = 'single string';

  var r1 = 'abc';
  var expected =
  {
    sources : [ 'abc' ],
    flags : null,
    escaping : 0
  }
  var got = _.regexp.s.sources([ r1 ]);
  test.identical( got, expected );

  /* */

  test.case = 'single regexp';

  var r1 = /abc/i;
  var expected =
  {
    sources : [ 'abc' ],
    flags : 'i',
    escaping : 0
  }
  var got = _.regexp.s.sources([ r1 ]);
  test.identical( got, expected );

  /* */

  test.case = 'all strings';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = '.+';
  var expected =
  {
    sources : [ 'abc', 'def', '.+' ],
    flags : null,
    escaping : 0
  }
  var got = _.regexp.s.sources([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'strings with regexps';

  var r1 = 'abc';
  var r2 = /def/;
  var r3 = /.+/;
  var expected =
  {
    sources : [ 'abc', 'def', '.+' ],
    flags : '',
    escaping : 0
  }
  var got = _.regexp.s.sources([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'strings with regexps and flags i';

  var r1 = 'abc';
  var r2 = /def/i;
  var r3 = /.+/i;
  var expected =
  {
    sources : [ 'abc', 'def', '.+' ],
    flags : 'i',
    escaping : 0
  }
  var got = _.regexp.s.sources([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'strings with regexps and flags iy';

  var r1 = /abc/iy;
  var r2 = 'def';
  var r3 = /.+/yi;
  var expected =
  {
    sources : [ 'abc', 'def', '.+' ],
    flags : 'iy',
    escaping : 0
  }
  var got = _.regexp.s.sources([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'empty in map';

  var expected =
  {
    sources : [],
    flags : null,
    escaping : 0
  }
  var o =
  {
    sources : []
  }
  var got = _.regexp.s.sources( o );
  test.identical( got, expected );
  test.true( o === got );

  /* */

  test.case = 'strings with regexps and flags iy in map';

  var r1 = /abc/iy;
  var r2 = 'def';
  var r3 = /.+/yi;
  var expected =
  {
    sources : [ 'abc', 'def', '.+' ],
    flags : 'iy',
    escaping : 0
  }
  var o =
  {
    sources : [ r1, r2, r3 ],
  }
  var got = _.regexp.s.sources( o );
  test.identical( got, expected );
  test.true( o === got );

  /* */

  test.case = 'options map with flags';

  var r1 = /abc/i;
  var r2 = 'def';
  var r3 = /.+/i;
  var expected =
  {
    sources : [ 'abc', 'def', '.+' ],
    flags : 'i',
    escaping : 0
  }
  var o =
  {
    sources : [ r1, r2, r3 ],
    flags : 'i',
  }
  var got = _.regexp.s.sources( o );
  test.identical( got, expected );
  test.true( o === got );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.sources() );

  test.case = 'strings with different flags';

  test.shouldThrowErrorSync( () => _.regexp.s.sources([ /abc/i, /def/iy ]) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.sources( 'ab', 'cd' ) );

  test.case = 'different flags in map';

  test.shouldThrowErrorSync( () => _.regexp.s.sources({ sources : [ /abc/i ], flags : 'y' }) );

}

//

function regexpsJoin( test )
{
  var context = this;

  /* */

  test.case = 'empty';

  var expected = /(?:)/;
  // var expected = new RegExp( '', '' );
  var got = _.regexp.s.join([]);
  test.identical( got, expected );

  /* */

  test.case = 'single string';

  var r1 = 'abc';
  var expected = /abc/;
  var got = _.regexp.s.join([ r1 ]);
  test.identical( got, expected );

  /* */

  test.case = 'single regexp';

  var r1 = /abc/i;
  var expected = /abc/i;
  var got = _.regexp.s.join([ r1 ]);
  test.identical( got, expected );
  test.true( got === r1 );

  /* */

  test.case = 'all strings';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = '.+';
  var expected = /abcdef.+/;
  var got = _.regexp.s.join([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'strings with regexps';

  var r1 = 'abc';
  var r2 = /def/;
  var r3 = /.+/;
  var expected = /abcdef.+/;
  var got = _.regexp.s.join([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'strings with regexps and flags i';

  var r1 = 'abc';
  var r2 = /def/i;
  var r3 = /.+/i;
  var expected = /abcdef.+/i;
  var got = _.regexp.s.join([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'strings with regexps and flags iy';

  var r1 = /abc/iy;
  var r2 = 'def';
  var r3 = /.+/yi;
  var expected = /abcdef.+/iy;
  var got = _.regexp.s.join([ r1, r2, r3 ]);
  test.identical( got, expected );

  /* */

  test.case = 'empty in map';

  var o =
  {
    sources : [],
    flags : null,
  }
  var expected = /(?:)/;
  // var expected = new RegExp( '', '' );
  var got = _.regexp.s.join( o );
  test.identical( got, expected );

  /* */

  test.case = 'strings with regexps and flags iy in map';

  var r1 = /abc/iy;
  var r2 = 'def';
  var r3 = /.+/yi;
  var expected = /abcdef.+/iy;
  var o =
  {
    sources : [ r1, r2, r3 ],
  }
  var got = _.regexp.s.join( o );
  test.identical( got, expected );

  /* */

  test.case = 'options map with flags';

  var r1 = /abc/i;
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /abcdef.+/i;
  var o =
  {
    sources : [ r1, r2, r3 ],
    flags : 'i',
  }
  var got = _.regexp.s.join( o );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.join() );

  test.case = 'strings with different flags';

  test.shouldThrowErrorSync( () => _.regexp.s.join([ /abc/i, /def/iy ]) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.join( 'ab', 'cd' ) );

  test.case = 'different flags in map';

  test.shouldThrowErrorSync( () => _.regexp.s.join({ sources : [ /abc/i ], flags : 'y' }) );

}

//

function regexpsAtLeastFirst( test )
{
  var context = this;

  test.case = 'empty';

  var expected = /(?:)/;
  // var expected = new RegExp( '' );
  var got = _.regexp.s.atLeastFirst([]);
  test.identical( got, expected );

  test.case = 'single regexp';

  var r1 = /.+/i;
  var expected = /.+/i;
  var got = _.regexp.s.atLeastFirst([ r1 ]);
  test.identical( got, expected );
  test.true( got === r1 );

  test.case = 'strings';

  var r1 = 'abc';
  var r2 = 'def';
  var expected = /abc(?:def)?/;
  var got = _.regexp.s.atLeastFirst([ r1, r2 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /abc(?:def(?:.+)?)?/i;
  var got = _.regexp.s.atLeastFirst([ r1, r2, r3 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps and flags';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /abc(?:def(?:.+)?)?/i;
  var got = _.regexp.s.atLeastFirst({ sources : [ r1, r2, r3 ], flags : 'i' });
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.atLeastFirst() );

  test.case = 'strings with different flags';

  test.shouldThrowErrorSync( () => _.regexp.s.atLeastFirst([ /abc/i, /def/iy ]) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.atLeastFirst( 'ab', 'cd' ) );

  test.case = 'different flags in map';

  test.shouldThrowErrorSync( () => _.regexp.s.atLeastFirst({ sources : [ /abc/i ], flags : 'y' }) );

}

//

function regexpsNone( test )
{
  var context = this;

  test.case = 'empty';

  var expected = /^(?:(?!(?:)).)+$/;
  var got = _.regexp.s.none([]);
  test.identical( got, expected );

  test.case = 'single regexp';

  var r1 = /.+/i;
  var expected = /^(?:(?!(?:.+)).)+$/i;
  var got = _.regexp.s.none([ r1 ]);
  test.identical( got, expected );
  test.true( got !== r1 );

  test.case = 'strings';

  var r1 = 'abc';
  var r2 = 'def';
  var expected = /^(?:(?!(?:abc)|(?:def)).)+$/;
  var got = _.regexp.s.none([ r1, r2 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /^(?:(?!(?:abc)|(?:def)|(?:.+)).)+$/i;
  var got = _.regexp.s.none([ r1, r2, r3 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps and flags';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /^(?:(?!(?:abc)|(?:def)|(?:.+)).)+$/i;
  var got = _.regexp.s.none({ sources : [ r1, r2, r3 ], flags : 'i' });
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.none() );

  test.case = 'strings with different flags';

  test.shouldThrowErrorSync( () => _.regexp.s.none([ /abc/i, /def/iy ]) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.none( 'ab', 'cd' ) );

  test.case = 'different flags in map';

  test.shouldThrowErrorSync( () => _.regexp.s.none({ sources : [ /abc/i ], flags : 'y' }) );

}

//

function regexpsAny( test )
{
  var context = this;

  test.case = 'empty';

  var expected = /(?:)/;
  var got = _.regexp.s.any([]);
  test.identical( got, expected );

  test.case = 'single regexp';

  var r1 = /.+/i;
  var expected = /.+/i;
  var got = _.regexp.s.any([ r1 ]);
  test.identical( got, expected );
  test.true( got === r1 );

  test.case = 'strings';

  var r1 = 'abc';
  var r2 = 'def';
  var expected = /(?:abc)|(?:def)/;
  var got = _.regexp.s.any([ r1, r2 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /(?:abc)|(?:def)|(?:.+)/i;
  var got = _.regexp.s.any([ r1, r2, r3 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps and flags';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /(?:abc)|(?:def)|(?:.+)/i;
  var got = _.regexp.s.any({ sources : [ r1, r2, r3 ], flags : 'i' });
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.any() );

  test.case = 'strings with different flags';

  test.shouldThrowErrorSync( () => _.regexp.s.any([ /abc/i, /def/iy ]) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.any( 'ab', 'cd' ) );

  test.case = 'different flags in map';

  test.shouldThrowErrorSync( () => _.regexp.s.any({ sources : [ /abc/i ], flags : 'y' }) );

}

//

function regexpsAll( test )
{
  var context = this;

  test.case = 'empty';

  var expected = /(?:)/;
  // var expected = new RegExp( '' );
  var got = _.regexp.s.all([]);
  test.identical( got, expected );

  test.case = 'single regexp';

  var r1 = /.+/i;
  var expected = /.+/i;
  var got = _.regexp.s.all([ r1 ]);
  test.identical( got, expected );
  test.true( got === r1 );

  test.case = 'strings';

  var r1 = 'abc';
  var r2 = 'def';
  var expected = /(?=abc)(?:def)/;
  var got = _.regexp.s.all([ r1, r2 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /(?=abc)(?=def)(?:.+)/i;
  var got = _.regexp.s.all([ r1, r2, r3 ]);
  test.identical( got, expected );

  test.case = 'strings and regexps and flags';

  var r1 = 'abc';
  var r2 = 'def';
  var r3 = /.+/i;
  var expected = /(?=abc)(?=def)(?:.+)/i;
  var got = _.regexp.s.all({ sources : [ r1, r2, r3 ], flags : 'i' });
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.all() );

  test.case = 'strings with different flags';

  test.shouldThrowErrorSync( () => _.regexp.s.all([ /abc/i, /def/iy ]) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.all( 'ab', 'cd' ) );

  test.case = 'different flags in map';

  test.shouldThrowErrorSync( () => _.regexp.s.all({ sources : [ /abc/i ], flags : 'y' }) );

}

//

function _test( test )
{
  var context = this;

  test.case = 'identical strings';

  var r1 = 'abc';
  var r2 = 'abc';
  var expected = true;
  var got = _.regexp._test( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings';

  var r1 = 'abc';
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp._test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string';

  var r1 = /abc/;
  var r2 = 'abcd';
  var expected = true;
  var got = _.regexp._test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string';

  var r1 = /.abc/;
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp._test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in string';

  var r1 = /\d+(?!\.)/;
  var r2 = 'abcd3';
  var expected = true;
  var got = _.regexp._test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp not in string';

  var r1 = /\d+(?=\.)/;
  var r2 = 'abcd4';
  var expected = false;
  var got = _.regexp._test( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp._test() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp._test( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp._test( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp._test([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp._test([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp._test([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp._test([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp._test([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp._test([ [], 's' ]) );
  test.shouldThrowErrorSync( () => _.regexp._test([  /o/, [] ]) );

}

//

function test( test )
{
  var context = this;

  test.case = 'identical strings';

  var r1 = 'hi';
  var r2 = 'hi';
  var expected = true;
  var got = _.regexp.test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string';

  var r1 = /^bc/;
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in string array';

  var r1 = /\d+(?!\.)/;
  var r2 = [ 'abcd3', '2', 'dwq1!c' ];
  var expected = [ true, true, true ];
  var got = _.regexp.test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in part of string array';

  var r1 = /\d+(?=\.)/;
  var r2 = [ 'abcd4', '1.5768', 'Hi' ];
  var expected = [ false, true, false ];
  var got = _.regexp.test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string array';

  var r1 = /^abc{2}$/;
  var r2 = [ 'abcc4', '1.5768', 'bcc', '0abcc' ];
  var expected = [ false, false, false, false ];
  var got = _.regexp.test( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string array once';

  var r1 = /^abc{2}$/;
  var r2 = [ 'abcc4', '1.5768', 'bcc', '0abcc', 'abcc' ];
  var expected = [ false, false, false, false, true ];
  var got = _.regexp.test( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.test() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp.test( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.test( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp.test([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp.test([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp.test([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp.test([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp.test([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp.test([ [], 's' ]) );
  test.shouldThrowErrorSync( () => _.regexp.test([  /o/, [] ]) );

}

//

function testAll( test )
{
  var context = this;

  test.case = 'identical strings';

  var r1 = 'abc';
  var r2 = 'abc';
  var expected = true;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings';

  var r1 = 'abc';
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'identical strings array';

  var r1 = 'abc';
  var r2 = [ 'abc', 'abc' ];
  var expected = true;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings array';

  var r1 = 'abc';
  var r2 = [ 'abc', 'a', 'b', 'c' ];
  var expected = false;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string';

  var r1 = /b/;
  var r2 = 'abcd';
  var expected = true;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string';

  var r1 = /.a/;
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string array';

  var r1 = /abc/;
  var r2 = [ 'dabcd', 'efabcgh', 'ijklabc' ];
  var expected = true;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string array';

  var r1 = /.abc/;
  var r2 = [ 'abcd', 'efgh', 'ijkl' ];
  var expected = false ;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in string';

  var r1 = /\d|a/;
  var r2 = 'abcd3';
  var expected = true;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp not in string';

  var r1 = /\d(?=\.)/;
  var r2 = 'abcd4';
  var expected = false;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in string array';

  var r1 = /\d+(?!\.)|\d+(?=\.)/;
  var r2 = [ 'abcd3', 'abcd4', '2' ];
  var expected = true;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp not in string array';

  var r1 = /[^fdh]/;
  var r2 = [ 'abcd4', 'fd' ];
  var expected = false;
  var got = _.regexp.testAll( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.testAll() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp.testAll( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.testAll( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp.testAll([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp.testAll([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp.testAll([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp.testAll([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp.testAll([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp.testAll([ [], 'h' ]) );

}

//

function testAny( test )
{
  var context = this;

  test.case = 'identical strings';

  var r1 = 'abc';
  var r2 = 'abc';
  var expected = true;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings';

  var r1 = 'abc';
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'One identical string, array';

  var r1 = 'abc';
  var r2 = [ 'abc', 'abc' ];
  var expected = true;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings array';

  var r1 = 'abc';
  var r2 = [ 'abd', 'a', 'b', 'c' ];
  var expected = false;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string';

  var r1 = /b/;
  var r2 = 'abcd';
  var expected = true;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string';

  var r1 = /.a/;
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string array';

  var r1 = /abc/;
  var r2 = [ 'dabcd', 'efabcgh', 'ijklabc' ];
  var expected = true;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in only one string array';

  var r1 = /.abc/;
  var r2 = [ 'dabcd', 'efgh', 'ijkl' ];
  var expected = true;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string array';

  var r1 = /.abc/;
  var r2 = [ 'abcd', 'efgh', 'ijkl' ];
  var expected = false ;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in string';

  var r1 = /\d|a/;
  var r2 = 'abcd3';
  var expected = true;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp not in string';

  var r1 = /\d(?=\.)/;
  var r2 = 'abcd4';
  var expected = false;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in one string array';

  var r1 = /\d+(?!\.)|\d+(?=\.)/;
  var r2 = [ 'abcd3', 'abcd', 'fgh' ];
  var expected = true;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp not in string array';

  var r1 = /[^f-h]/;
  var r2 = [ 'fg', 'fh', 'h' ];
  var expected = false;
  var got = _.regexp.testAny( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.testAny() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp.testAny( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.testAny( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp.testAny([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp.testAny([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp.testAny([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp.testAny([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp.testAny([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp.testAny([ [], 'h' ]) );

}

//

function testNone( test )
{
  var context = this;

  test.case = 'identical strings';

  var r1 = 'abc';
  var r2 = 'abc';
  var expected = false;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings';

  var r1 = 'c';
  var r2 = 'abcd';
  var expected = true;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'One identical string, array';

  var r1 = 'abc';
  var r2 = [ 'abc', 'abcd' ];
  var expected = false;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings array';

  var r1 = 'abc';
  var r2 = [ 'abd', 'a', 'b', 'c' ];
  var expected = true;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string';

  var r1 = /b/;
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string';

  var r1 = /a+/;
  var r2 = 'bcd';
  var expected = true;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in string array';

  var r1 = /abc/;
  var r2 = [ 'dabcd', 'efabcgh', 'ijklabc' ];
  var expected = false;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp in only one string array';

  var r1 = /.abc/;
  var r2 = [ 'dabcd', 'efgh', 'ijkl' ];
  var expected = false;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexp not in string array';

  var r1 = /.abc/;
  var r2 = [ 'abcd', 'efgh', 'ijkl' ];
  var expected = true ;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in string';

  var r1 = /\d|a/;
  var r2 = 'abcd3';
  var expected = false;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp not in string';

  var r1 = /\d(?=\.)/;
  var r2 = 'abcd4';
  var expected = true;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp in one string array';

  var r1 = /\d+(?!\.)|\d+(?!\!)/;
  var r2 = [ 'abcd3', 'abcd', 'fgh' ];
  var expected = false;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexp not in string array';

  var r1 = /[^f-h]/;
  var r2 = [ 'fg', 'fh', 'h' ];
  var expected = true;
  var got = _.regexp.testNone( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.testNone() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp.testNone( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.testNone( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp.testNone([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp.testNone([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp.testNone([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp.testNone([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp.testNone([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp.testNone([ [], 'h' ]) );

}

//

function regexpsTestAll( test )
{
  var context = this;

  test.case = 'identical strings';

  var r1 = 'abc';
  var r2 = 'abc';
  var expected = true;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings';

  var r1 = 'abc';
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'identical strings array';

  var r1 = [ 'abc', 'abc' ];
  var r2 = 'abc';
  var expected = true;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings array';

  var r1 = [ 'abc', 'a', 'b', 'c' ];
  var r2 = 'abc';
  var expected = false;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps in string';

  var r1 = /b/;
  var r2 = 'abcd';
  var expected = true;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps not in string';

  var r1 = /.a/;
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps array in string';

  var r1 = [ /a/, /b/, /c/ ];
  var r2 = 'abc';
  var expected = true;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps array not in string';

  var r1 = [ /a/, /b/, /c/, /d/, /e/ ];
  var r2 = 'abcd';
  var expected = false ;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexps in string';

  var r1 = /\d|a/;
  var r2 = 'abcd3';
  var expected = true;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexps not in string';

  var r1 = /\d(?=\.)/;
  var r2 = 'abcd4';
  var expected = false;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexps array not in string';

  var r1 = [ /\d+(?!\.)/, /\d+(?=\.)/ ];
  var r2 = 'abcd3';
  var expected = false;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexps array in string';

  var r1 = [ /[^fdh]/, /\d+(?!\.)/ ];
  var r2 = 'abcd4';
  var expected = true;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexps array in string array';

  var r1 = [ /[^fdh]/, /\d+(?!\.)/ ];
  var r2 = [ 'abcd4', 'd3,', '7' ];
  var expected = true;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  test.case = 'Regexps array not in part of string array';

  var r1 = [ /[^fdh]/, /\d+(?!\.)/ ];
  var r2 = [ 'abcd4', 'd3,', '7', 'd' ];
  var expected = false;
  var got = _.regexp.s.testAll( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.testAll() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testAll( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testAll( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testAll([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp.s.testAll([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp.s.testAll([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp.s.testAll([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp.s.testAll([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp.s.testAll([ 'h', [] ]) );

}

//

function regexpsTestAny( test )
{

  var context = this;

  test.case = 'One different regexp';

  var r1 = [ 'abc', 'def' ];
  var r2 = 'abc';
  var expected = true;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Identical regexp and string arrays';

  var r1 = [ 'abc', 'def' ];
  var r2 = [ 'abc', 'def' ];
  var expected = true;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'String array with one no- match';

  var r1 = [ 'abc', 'def' ];
  var r2 = [ 'abc', 'def', 'ghi' ];
  var expected = true;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'different regexp array';

  var r1 = [ 'abd', 'a', 'b', 'c' ];
  var r2 = 'abc';
  var expected = false;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps in string';

  var r1 = /b/;
  var r2 = 'abcd';
  var expected = true;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps not in string';

  var r1 = /.a/;
  var r2 = 'abcd';
  var expected = false;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps array with one no-match in string ';

  var r1 = [ /[abc]/, /.a/, /\d/ ];
  var r2 = 'dabcd';
  var expected = true;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'No regexps in string -  array';

  var r1 = [ /[abc]/, /.a/, /\d/ ];;
  var r2 = 'ijkl';
  var expected = false;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexps in one string array';

  var r1 = [ /\d+(?!\.)/, /\d+(?=\!)/ ];
  var r2 = [ 'abcd3', 'abcd', 'fg2!h' ];
  var expected = true;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  test.case = 'Conditional regexps not in string array';

  var r1 = [ /[^f-h]/, /[ab]/ ];
  var r2 = [ 'fg', 'fh', 'h' ];
  var expected = false;
  var got = _.regexp.s.testAny( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.testAny() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testAny( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testAny( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testAny([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp.s.testAny([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp.s.testAny([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp.s.testAny([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp.s.testAny([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp.s.testAny([ 'h', [] ]) );

}

//

function regexpsTestNone( test )
{

  var context = this;

  test.case = 'identical strings';

  var r1 = 'abc';
  var r2 = 'abc';
  var expected = false;
  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings';

  var r1 = 'c';
  var r2 = 'abcd';
  var expected = true;
  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'One identical string, array';

  var r1 = 'abc';
  var r2 = [ 'abc', 'abcd' ];
  var expected = false;
  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'One identical string, array';

  var r1 = [ 'abc', 'abcd' ];
  var r2 = 'abc';
  var expected = false;
  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'different strings array';

  var r1 = [ 'abc', /\d/ ];
  var r2 = [ 'abd', 'a', 'b', 'c' ];
  var expected = true;
  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps in string';

  var r1 = [ /b/, /c$/ ];
  var r2 = [ 'abc', 'hij', '6' ];
  var expected = false;
  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'regexps not in string';

  var r1 = [ /ba+/, /^\s/ ];
  var r2 = [ 'bcd', 'a a', '7633.32' ];
  var expected = true;

  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  test.case = 'one regexps in only one string array';

  var r1 = [ /.abc/, /\d$/ ];
  var r2 = [ 'dabcd', 'efgh', 'ijkl' ];
  var expected = false;
  var got = _.regexp.s.testNone( r1, r2 );
  test.identical( got, expected );

  /* */

  if( !Config.debug )
  return;

  test.case = 'none argument';

  test.shouldThrowErrorSync( () => _.regexp.s.testNone() );

  test.case = 'not enough arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testNone( 'ab' ) );

  test.case = 'too many arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testNone( 'ab', 'cd', 'ef' ) );

  test.case = 'wrong order of arguments';

  test.shouldThrowErrorSync( () => _.regexp.s.testNone([ 'Hello', /o/ ]) );

  test.case = 'null';

  test.shouldThrowErrorSync( () => _.regexp.s.testNone([ null, 'Hello' ]) );
  test.shouldThrowErrorSync( () => _.regexp.s.testNone([ 'Hello', null ]) );

  test.case = 'NaN';

  test.shouldThrowErrorSync( () => _.regexp.s.testNone([ 'Hello', NaN ]) );
  test.shouldThrowErrorSync( () => _.regexp.s.testNone([ NaN, 'Hello' ]) );

  test.case = 'array';

  test.shouldThrowErrorSync( () => _.regexp.s.testNone([ 'h', [] ]) );

}

// --
// suite definition
// --

const Proto =
{

  name : 'Tools.l1.Regexp.l0.l9',
  silencing : 1,

  tests :
  {

    regexpsEquivalent,
    regexpsEquivalentAll,
    regexpsEquivalentAny,
    regexpsEquivalentNone,

    maybeFrom, /* xxx : move? */

    regexpsSources,
    regexpsJoin,
    regexpsAtLeastFirst,

    regexpsNone,
    regexpsAny,
    regexpsAll,

    _test,
    test,

    testAll,
    testAny,
    testNone,

    regexpsTestAll,
    regexpsTestAny,
    regexpsTestNone,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
