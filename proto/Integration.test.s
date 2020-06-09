( function _Integration_test_s_()
{

'use strict';

//

if( typeof module !== 'undefined' )
{
  let _ = require( 'wTools' );
  _.include( 'wTesting' );
}

//

let _ = _testerGlobal_.wTools;
let fileProvider = _.fileProvider;
let path = fileProvider.path;

// --
// test
// --

function samples( test )
{
  let context = this;
  let ready = new _.Consequence().take( null );

  let sampleDir = path.join( __dirname, '../sample' );

  let appStartNonThrowing = _.process.starter
  ( {
    currentPath : sampleDir,
    outputCollecting : 1,
    outputGraying : 1,
    throwingExitCode : 0,
    ready,
    mode : 'fork'
  } )

  let found = fileProvider.filesFind
  ( {
    filePath : path.join( sampleDir, '**/*.(s|js|ss)' ),
    withStem : 0,
    withDirs : 0,
    mode : 'distinct',
    mandatory : 0,
  } );

  /* */

  for( let i = 0 ; i < found.length ; i++ )
  {
    if( _.longHas( found[ i ].exts, 'browser' ) )
    continue;

    let startTime;

    ready
    .then( () =>
    {
      test.case = found[ i ].relative;
      startTime = _.time.now();
      return null;
    } )

    if( _.longHas( found[ i ].exts, 'throwing' ) )
    {
      appStartNonThrowing( { execPath : found[ i ].relative } )
      .then( ( got ) =>
      {
        console.log( _.time.spent( startTime ) );
        test.description = 'nonzero exit code';
        test.notIdentical( got.exitCode, 0 );
        return null;
      } )
    }
    else
    {
      appStartNonThrowing( { execPath : found[ i ].relative } )
      .then( ( got ) =>
      {
        console.log( _.time.spent( startTime ) );
        test.description = 'good exit code';
        test.identical( got.exitCode, 0 );
        if( got.exitCode )
        return null;
        test.description = 'have no uncaught errors';
        test.identical( _.strCount( got.output, 'ncaught' ), 0 );
        test.identical( _.strCount( got.output, 'rror' ), 0 );
        test.description = 'have some output';
        test.ge( got.output.split( '\n' ).length, 1 );
        test.ge( got.output.length, 3 );
        return null;
      } )
    }
  }

  /* */

  return ready;
}

//

function eslint( test )
{
  let rootPath = path.join( __dirname, '..' );
  let eslint = process.platform === 'win32' ? 'node_modules/eslint/bin/eslint' : 'node_modules/.bin/eslint';
  eslint = path.join( rootPath, eslint );
  let sampleDir = path.join( rootPath, 'sample' );

  let ready = new _.Consequence().take( null );

  let start = _.process.starter
  ( {
    execPath : eslint,
    mode : 'fork',
    currentPath : rootPath,
    args : [ '-c', '.eslintrc.yml', '--ext', '.js,.s,.ss', '--ignore-pattern', '*.html', '--ignore-pattern', '*.txt' ],
    throwingExitCode : 0
  } )

  /**/

  ready.then( () =>
  {
    test.case = 'eslint proto';
    return start( 'proto/**' );
  } )
  .then( ( got ) =>
  {
    test.identical( got.exitCode, 0 );
    return null;
  } )

  /**/

  if( fileProvider.fileExists( sampleDir ) )
  ready.then( () =>
  {
    test.case = 'eslint samples';
    return start( 'sample/**' )
    .then( ( got ) =>
    {
      test.identical( got.exitCode, 0 );
      return null;
    } )
  } )

  return ready;
}

// --
// declare
// --

var Self =
{

  name : 'Integration',
  routineTimeOut : 500000,
  silencing : 1,

  tests :
  {
    samples,
    eslint,
  },

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
_global_.wTester.test( Self.name );

} )();
