( function _l5_Regexp_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
// const Self = _global_.wTools;
let Regexp = _global_.wTools.regexp = _global_.wTools.regexp || Object.create( null );
let Regexps = _global_.wTools.regexp.s = _global_.wTools.regexp.s || Object.create( null );


// --
// regexp
// --

function _test( regexp, str )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );
  _.assert( _.strIs( str ) );

  if( _.strIs( regexp ) )
  return regexp === str;
  else
  return regexp.test( str );

}

//

function test( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _.regexp._test( regexp, strs );
  else if( _.argumentsArray.like( strs ) )
  return strs.map( ( str ) => _.regexp._test( regexp, str ) )
  else _.assert( 0 );

}

//

function testAll( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _.regexp._test( regexp, strs );
  else if( _.argumentsArray.like( strs ) )
  return strs.every( ( str ) => _.regexp._test( regexp, str ) )
  else _.assert( 0 );

}

//

function testAny( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return _.regexp._test( regexp, strs );
  else if( _.argumentsArray.like( strs ) )
  return strs.some( ( str ) => _.regexp._test( regexp, str ) )
  else _.assert( 0 );

}

//

function testNone( regexp, strs )
{
  _.assert( arguments.length === 2 );
  _.assert( _.regexpLike( regexp ) );

  if( _.strIs( strs ) )
  return !_.regexp._test( regexp, strs );
  else if( _.argumentsArray.like( strs ) )
  return !strs.some( ( str ) => _.regexp._test( regexp, str ) )
  else _.assert( 0 );

}

//

function regexpsTestAll( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestAll( regexps, strs );

  _.assert( _.regexpsLikeAll( regexps ) );

  return regexps.every( ( regexp ) => _.regexpTestAll( regexp, strs ) );
}

//

function regexpsTestAny( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestAny( regexps, strs );

  _.assert( _.regexpsLikeAll( regexps ) );

  return regexps.some( ( regexp ) => _.regexpTestAny( regexp, strs ) );
}

//

function regexpsTestNone( regexps, strs )
{
  _.assert( arguments.length === 2 );

  if( !_.arrayIs( regexps ) )
  return _.regexpTestNone( regexps, strs );

  _.assert( _.regexpsLikeAll( regexps ) );

  return regexps.every( ( regexp ) => _.regexpTestNone( regexp, strs ) );
}

//

// --
// extension
// --

let ToolsExtension =
{

  regexpsEscape : _.vectorize( _.regexpEscape ),

  _regexpTest : _test,
  regexpTest : test,

  regexpTestAll : testAll,
  regexpTestAny : testAny,
  regexpTestNone : testNone,

  regexpsTestAll,
  regexpsTestAny,
  regexpsTestNone,

}

//

let Extension =
{

  // regexp

  _test,
  test,

  testAll,
  testAny,
  testNone,

}

//

let ExtensionS =
{

  // regexps

  escape : _.vectorize( _.regexpEscape ),

  testAll : regexpsTestAll,
  testAny : regexpsTestAny,
  testNone : regexpsTestNone,

}

//

_.props.supplement( Regexp, Extension );
_.props.supplement( Regexps, ExtensionS );
_.props.supplement( _, ToolsExtension ); /* qqq for Yevhen : create namespace _.regexp. stand-alone PR | aaa : Done. */

})();
