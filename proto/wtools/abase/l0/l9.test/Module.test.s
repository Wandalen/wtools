( function _l0_l9_Module_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  // _.include( 'wSelector' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;
const __ = _globals_.testing.wTools;
const fileProvider = __.fileProvider;
const path = fileProvider.path;

// --
// context
// --

function onSuiteBegin()
{
  let self = this;

  self.suiteTempPath = path.tempOpen( path.join( __dirname, '../..'  ), 'module' );
  // self.assetsOriginalPath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let self = this;
  _.assert( _.strHas( self.suiteTempPath, '/module-' ) )
  path.tempClose( self.suiteTempPath );
}

// --
// test routines implementation
// --

function modulePredeclareBasic( test )
{
  let context = this;
  let a = test.assetFor( false );
  let _ToolsPath_ = a.path.nativize( _.module.toolsPathGet() );
  let programRoutine1Path = a.program( programRoutine1 );
  let programRoutine2Path = a.program({ routine : programRoutine2, locals : { _ToolsPath_, programRoutine1Path } });

  /* */

  a.appStartNonThrowing({ execPath : programRoutine2Path })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'programRoutine2.begin' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine1.begin' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine1.end' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine2.end' ), 1 );
    test.identical( _.strCount( op.output, /programRoutine2.begin(.|\n|\r)*programRoutine1.begin(.|\n|\r)*programRoutine1.end(.|\n|\r)*programRoutine2.end(.|\n|\r)*/mg ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function programRoutine1()
  {
    console.log( 'programRoutine1.begin' );
    const _ = require( toolsPath );
    _global_.programRoutine2 = true;
    console.log( 'programRoutine1.end' );
  }

  function programRoutine2()
  {
    console.log( 'programRoutine2.begin' );
    const _ = require( _ToolsPath_ );
    _global_.programRoutine2 = true;
    _.module.predeclare
    ({
      name : 'programRoutine1',
      // isIncluded : () => !!_global_.programRoutine1,
      entryPath : programRoutine1Path,
      basePath : '.',
    });
    _.include( 'programRoutine1' );
    _.include( 'programRoutine1' );
    console.log( 'programRoutine2.end' );
  }

}

//

function modulePredeclareBasic2( test )
{
  let context = this;
  let a = test.assetFor( false );
  let _ToolsPath_ = a.path.nativize( _.module.toolsPathGet() );
  let programRoutine1Path = a.program( programRoutine1 );
  let programRoutine2Path = a.program({ routine : programRoutine2, locals : { _ToolsPath_, programRoutine1Path } });

  /* */

  a.appStartNonThrowing({ execPath : programRoutine2Path })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'programRoutine2.begin' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine1.begin' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine1.end' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine2.end' ), 1 );
    test.identical( _.strCount( op.output, /programRoutine2.begin(.|\n|\r)*programRoutine1.begin(.|\n|\r)*programRoutine1.end(.|\n|\r)*programRoutine2.end(.|\n|\r)*/mg ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function programRoutine1()
  {
    console.log( 'programRoutine1.begin' );
    const _ = require( toolsPath );
    _global_.programRoutine2 = true;
    console.log( 'programRoutine1.end' );
  }

  function programRoutine2()
  {
    console.log( 'programRoutine2.begin' );
    const _ = require( _ToolsPath_ );
    _global_.programRoutine2 = true;
    _.module.predeclare
    ({
      name : 'programRoutine1',
      entryPath : programRoutine1Path,
      basePath : '.',
    });
    _.include( 'programRoutine1' );
    _.include( 'programRoutine1' );
    console.log( 'programRoutine2.end' );
  }

}

//

function moduleExportsUndefined( test )
{
  let context = this;
  let a = test.assetFor( false );
  let programRoutine1Path = a.program( programRoutine1 );
  let modulePath = a.path.join( programRoutine1Path, '../module.js' )

  a.fileProvider.fileWrite({ filePath : modulePath, data : `module.exports = undefined;` })

  /* */

  a.appStartNonThrowing({ execPath : programRoutine1Path })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'programRoutine1.begin' ), 1 );
    test.identical( _.strCount( op.output, 'importedModule: undefined' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine1.end' ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function programRoutine1()
  {
    console.log( 'programRoutine1.begin' );
    const _ = require( toolsPath );
    var importedModule = require( './module.js' );
    console.log( 'importedModule:', importedModule)
    console.log( 'programRoutine1.end' );
  }
}

moduleExportsUndefined.description  =
`
  Included module returns undefined
`

//

/* qqq : rewrite test with several programs in differen dirs */
/* qqq : write test with several programs in differen dirs and declaring of modules */
function resolveBasic( test )
{
  let context = this;

  // var exp = _.path.nativize( _.path.normalize( __dirname + '/../Layer1.s' ) );
  // var exp = _.path.nativize( _.path.normalize( __dirname + '../../../../../node_modules/wTools' ) );
  // var exp = _.path.nativize( _.path.normalize( __dirname + '../../../../../node_modules/Tools' ) );
  var exp = _.path.normalize( __dirname + '../../../../../node_modules/Tools' );
  var got = _.module.resolve( 'wTools' );
  test.identical( got, exp );
  /* xxx : extend by other resolve calls */

}

resolveBasic.description  =
`
  Routine _.module.resolve return path to include path of module::wTools.
`

//

function toolsPathGetBasic( test )
{
  let context = this;

  /* */

  test.case = 'toolsPathGet';
  var got = _.module.toolsPathGet();
  // var exp = _.path.nativize( __.path.join( __dirname, '../../../../node_modules/Tools' ) );
  var exp = __.path.join( __dirname, '../../../../node_modules/Tools' );
  test.identical( got, exp );
  console.log( `toolsPathGet : ${got}` );

  /* */

  test.case = 'toolsDirGet';
  var got = _.module.toolsDirGet();
  // var exp = __.path.nativize( __.path.join( __dirname, '../../..' ) );
  var exp = __.path.join( __dirname, '../../..' );
  test.identical( got, exp );
  console.log( `toolsDirGet : ${got}` );

  /* */

  test.case = 'resolve wTools';
  var got = _.module.resolve( 'wTools' );
  // var exp = __.path.nativize( __.path.join( __dirname, '../../../../node_modules/Tools' ) );
  var exp = __.path.join( __dirname, '../../../../node_modules/Tools' );
  test.identical( got, exp );
  console.log( `resolved : ${got}` );

  /* */

}

//

function toolsPathGetProgram( test )
{
  let context = this;
  let a = test.assetFor( false );
  let programPath = a.program( program );

  console.log( 'programPath', programPath );

  return a.forkNonThrowing({ execPath : programPath })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    var exp =
`
toolsPath : ${__.path.nativize( __.path.join( __dirname, '../../../../node_modules/Tools' ) )}
module.resolve( wTools ) : ${__.path.join( __dirname, '../../../../node_modules/Tools' )}
module.toolsPathGet : ${__.path.join( __dirname, '../../../../node_modules/Tools' )}
module.toolsirGet : ${__.path.join( __dirname, '../../..' )}
`
    test.equivalent( op.output, exp );
    return op;
  });

  function program()
  {
    console.log( `toolsPath : ${toolsPath}` );
    const _ = require( toolsPath );
    console.log( `module.resolve( wTools ) : ${_.module.resolve( 'wTools' )}` );
    console.log( `module.toolsPathGet : ${_.module.toolsPathGet()}` );
    console.log( `module.toolsirGet : ${_.module.toolsDirGet()}` );
  }

}

//

/* xxx : duplicate test in utility::Testing */
function modulingLogistic( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  var toolsPath = _.module.resolve( 'wTools' );
  var toolsDirPath = _.module.toolsDirGet();
  var testingPath = _.module.resolve( 'wTesting' );
  var moduleFile = _.module.fileWithResolvedPath( testingPath );
  test.true( _.module.fileIs( moduleFile ) );
  test.true( _.module.fileUniversalIs( moduleFile ) );
  test.true( !_.module.fileNativeIs( moduleFile ) );
  test.true( _.module.fileIs( moduleFile.native ) );
  test.true( !_.module.fileUniversalIs( moduleFile.native ) );
  test.true( _.module.fileNativeIs( moduleFile.native ) );
  test.identical( moduleFile.sourcePath, testingPath );
  test.true( _.module.is( moduleFile.module ) );

  var module = _.module.withPath( testingPath );
  test.identical( _.entity.lengthOf( module.files ), 4 );
  test.identical( _.entity.lengthOf( module.alias ), 2 );
  var exp =
  [
    'proto/node_modules/wTesting',
    'proto/wtools/atop/testing/entry/Main.s',
    'proto/wtools/atop/testing/include/Top.s',
    'proto/wtools/abase/l0/l0/l0/Global.s',
  ]
  var files = __.select( [ ... module.files.values() ], '*/sourcePath' );
  test.identical( __.path.s.relative( testingPath + '/../../..', files ), exp );
  var module2 = _.module.withName( 'wTesting' );
  test.true( module === module2 );
  var module2 = _.module.withName( 'wtesting' );
  test.true( module === module2 );

  var module = _.module.withName( 'wTools' );
  test.gt( _.entity.lengthOf( module.files ), 100 );
  test.identical( _.entity.lengthOf( module.files ), 185 );
  test.identical( _.entity.lengthOf( module.alias ), 2 );
  test.true( _.module.filesMap.has( toolsPath ) );
  test.true( module.files.has( toolsPath ) );
  test.true( _.module.filesMap.has( __.path.join( toolsDirPath, 'abase/l0/l0/l0/Global.s' ) ) );
  test.true( module.files.has( __.path.join( toolsDirPath, 'abase/l0/l0/l0/Global.s' ) ) );
  var module2 = _.module.withName( 'wTools' );
  test.true( module === module2 );
  var module2 = _.module.withName( 'wtools' );
  test.true( module === module2 );
  log( __.path.join( toolsDirPath, 'abase/l0/l0/l0/Global.s' ) );

  test.identical( _.entity.lengthOf( _.module._modulesToPredeclare ), 0 );
  test.ge( _.entity.lengthOf( _.module.modulesMap ), 4 );

  console.log( 'lengthOf( _modulesToPredeclare )', _.entity.lengthOf( _.module._modulesToPredeclare ) );
  console.log( 'lengthOf( predeclaredWithNameMap )', _.entity.lengthOf( _.module.predeclaredWithNameMap ) );
  console.log( 'lengthOf( predeclaredWithEntryPathMap )', _.entity.lengthOf( _.module.predeclaredWithEntryPathMap ) );
  console.log( 'lengthOf( modulesMap )', _.entity.lengthOf( _.module.modulesMap ) );
  console.log( 'lengthOf( filesMap )', _.entity.lengthOf( _.module.filesMap ) );
  var diff = _.arraySet.diff_( null, [ ... _.module.filesMap.keys() ], [ ... _.module.withName( 'wTools' ).files.keys() ] )
  console.log( `filesMap but tools.files\n  ${diff.join( '\n  ' )}` );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `external program, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( programRoutine1 );

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      /*
      extra moddule file is program
      */
      var exp =
`
lengthOf( _modulesToPredeclare ) 0
lengthOf( predeclaredWithNameMap ) 2
lengthOf( predeclaredWithEntryPathMap ) 2
lengthOf( modulesMap ) ${_.entity.lengthOf( _.module.withName( 'wTools' ).alias )}
lengthOf( filesMap ) ${_.entity.lengthOf( _.module.withName( 'wTools' ).files ) + 1}
module.fileIs( moduleFile ) true
module.fileUniversalIs( moduleFile ) true
module.fileNativeIs( moduleFile ) false
module.fileIs( moduleFile.native ) true
module.fileUniversalIs( moduleFile.native ) false
module.fileNativeIs( moduleFile.native ) true
moduleFile.sourcePath ${testingPath}
moduleFile.downFile.sourcePath ${a.abs( 'programRoutine1' )}
moduleFile.downFile.module null
module.is( moduleFile.module ) true
filesOfTesting
  ${ __.path.join( _.module.resolve( 'wTesting' ), '.' ) }
  ${ __.path.join( _.module.resolve( 'wTesting' ), '../../wtools/atop/testing/entry/Main.s' ) }
  ${ __.path.join( _.module.resolve( 'wTesting' ), '../../wtools/atop/testing/include/Top.s' ) }
  ${ __.path.join( _.module.resolve( 'wTesting' ), '../../wtools/abase/l0/l0/l0/Global.s' ) }
lengthOf( _modulesToPredeclare ) 0
lengthOf( predeclaredWithNameMap ) 4
lengthOf( predeclaredWithEntryPathMap ) 3
lengthOf( modulesMap ) ${_.entity.lengthOf( _.module.withName( 'wTools' ).alias ) + _.entity.lengthOf( _.module.withName( 'wTesting' ).alias )}
modulesMap wTools wTools wTesting wTesting
`

      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function programRoutine1()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    console.log( 'lengthOf( _modulesToPredeclare )', _.entity.lengthOf( _.module._modulesToPredeclare ) );
    console.log( 'lengthOf( predeclaredWithNameMap )', _.entity.lengthOf( _.module.predeclaredWithNameMap ) );
    console.log( 'lengthOf( predeclaredWithEntryPathMap )', _.entity.lengthOf( _.module.predeclaredWithEntryPathMap ) );
    console.log( 'lengthOf( modulesMap )', _.entity.lengthOf( _.module.modulesMap ) );
    console.log( 'lengthOf( filesMap )', _.entity.lengthOf( _.module.filesMap ) );

    debugger;
    let __ = _.include( 'wTesting' );

    var testingPath = _.module.resolve( 'wTesting' );
    var moduleFile = _.module.fileWithResolvedPath( testingPath );
    console.log( `module.fileIs( moduleFile )`, _.module.fileIs( moduleFile ) );
    console.log( `module.fileUniversalIs( moduleFile )`, _.module.fileUniversalIs( moduleFile ) );
    console.log( `module.fileNativeIs( moduleFile )`, _.module.fileNativeIs( moduleFile ) );
    console.log( `module.fileIs( moduleFile.native )`, _.module.fileIs( moduleFile.native ) );
    console.log( `module.fileUniversalIs( moduleFile.native )`, _.module.fileUniversalIs( moduleFile.native ) );
    console.log( `module.fileNativeIs( moduleFile.native )`, _.module.fileNativeIs( moduleFile.native ) );
    console.log( `moduleFile.sourcePath`, moduleFile.sourcePath );
    console.log( `moduleFile.downFile.sourcePath`, moduleFile.downFile.sourcePath );
    console.log( `moduleFile.downFile.module`, moduleFile.downFile.module );
    console.log( `module.is( moduleFile.module )`, _.module.is( moduleFile.module ) );

    var module = _.module.withPath( testingPath );
    var filesOfTesting = __.select( [ ... module.files.values() ], '*/sourcePath' );
    console.log( `filesOfTesting\n  ${filesOfTesting.join( '\n  ' )}` );

    console.log( 'lengthOf( _modulesToPredeclare )', _.entity.lengthOf( _.module._modulesToPredeclare ) );
    console.log( 'lengthOf( predeclaredWithNameMap )', _.entity.lengthOf( _.module.predeclaredWithNameMap ) );
    console.log( 'lengthOf( predeclaredWithEntryPathMap )', _.entity.lengthOf( _.module.predeclaredWithEntryPathMap ) );
    console.log( 'lengthOf( modulesMap )', _.entity.lengthOf( _.module.modulesMap ) );
    console.log( 'modulesMap', [ ... _.module.modulesMap.values() ].map( ( m ) => m.name ).join( ' ' ) );

  }

  /* - */

  function log( filePath )
  {
    let moduleFile = _.module.fileWith( filePath );
    if( !moduleFile )
    return console.log( `${filePath} : ${moduleFile}` );
    let output = _.module.fileExportString( moduleFile, { verbosity : 2 } );
    output = _.strReplace( output, _.path.normalize( __dirname ), '.' );
    console.log( `${filePath} : ${output}` );
  }

  /* - */

}

modulingLogistic.description =
`
- relations between module files is sane
`

//

/* xxx : add testing of section "module files stack" */
function modulingNativeIncludeErrors( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `throwing, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainThrowing );
      a.program( throwing1 )

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      test.nil( op.exitCode, 0 );

      var exp =
`    error1
    Module file "${__.path.nativize( a.abs( './mainThrowing' ) )}" failed to include "./throwing1"`
      test.true( _.strHas( op.output, exp ) );

      var exp =
`main
throwing1`
      test.true( _.strHas( op.output, exp ) );


      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `throwing, catching ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainThrowingCatching );
      a.program( throwing1 )

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      test.nil( op.exitCode, 0 );

      var exp =
`    error1
    Module file "${__.path.nativize( a.abs( './mainThrowingCatching' ) )}" failed to include "./throwing1"`
      test.true( _.strHas( op.output, exp ) );

      var exp =
`main.begin
throwing1
fileNativeWith( throwing1 ) : undefined
fileWith( throwing1 ) : undefined
throwing1`
      test.true( _.strHas( op.output, exp ) );

      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `syntax error ${__.entity.exportStringSolo( env )}`;

      let syntax1 =
      `
      function syntax1()
      {
        console.log( 'syntax1' );
        console.log( 'a' 'b' 'c' );
      }
      `

      var programPath = a.program( mainSyntax );
      a.program({ sourceCode : syntax1, name : 'syntax1' })

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      test.nil( op.exitCode, 0 );

      var exp =
`main
--------------- uncaught error --------------->

 = Message of error#1
    missing ) after argument list
    Module file "${__.path.nativize( a.abs( './mainSyntax' ) )}" failed to include "./syntax1"`
      test.true( _.strHas( op.output, exp ) );

      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `syntax error catching ${__.entity.exportStringSolo( env )}`;

      let syntax1 =
      `
      function syntax1()
      {
        console.log( 'syntax1' );
        console.log( 'a' 'b' 'c' );
      }
      `

      var programPath = a.program( mainSyntaxCatching );
      a.program({ sourceCode : syntax1, name : 'syntax1' })

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      test.nil( op.exitCode, 0 );

      var exp =
`main.begin
fileNativeWith( syntax1 ) : undefined
fileWith( syntax1 ) : undefined
--------------- uncaught error --------------->

 = Message of error#2
    missing ) after argument list
    Module file "${__.path.nativize( a.abs( './mainSyntaxCatching' ) )}" failed to include "./syntax1"`
      test.true( _.strHas( op.output, exp ) );

      return op;
    });

    /* */

  }

  /* - */

  function mainThrowing()
  {
    console.log( 'main' );
    const _ = require( toolsPath );
    require( './throwing1' );
  }

  /* - */

  function mainThrowingCatching()
  {
    console.log( 'main.begin' );
    const _ = require( toolsPath );
    try
    {
      require( './throwing1' );
    }
    catch( err )
    {
    }
    console.log( 'fileNativeWith( throwing1 ) :', _.module.fileNativeWith( __dirname + '/throwing1' ) );
    console.log( 'fileWith( throwing1 ) :', _.module.fileWith( __dirname + '/throwing1' ) );
    require( './throwing1' );
    console.log( 'main.end' );
  }

  /* - */

  function throwing1()
  {
    console.log( 'throwing1' );
    throw Error( 'error1' );
  }

  /* - */

  function mainSyntax()
  {
    console.log( 'main' );
    const _ = require( toolsPath );
    require( './syntax1' );
  }

  /* - */

  function mainSyntaxCatching()
  {
    console.log( 'main.begin' );
    const _ = require( toolsPath );
    try
    {
      require( './syntax1' );
    }
    catch( err )
    {
    }
    console.log( 'fileNativeWith( syntax1 ) :', _.module.fileNativeWith( __dirname + '/syntax1' ) );
    console.log( 'fileWith( syntax1 ) :', _.module.fileWith( __dirname + '/syntax1' ) );
    require( './syntax1' );
    console.log( 'main.end' );
  }

  /* - */

}

modulingNativeIncludeErrors.description =
`
- module file throwing error does not get neithe native file descriptor nor universal file descriptor
`

//

function modulingSourcePathValid( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  let start = __.process.starter
  ({
    outputCollecting : 1,
    outputPiping : 1,
    inputMirroring : 1,
    throwingExitCode : 0,
    mode : 'fork',
  });

  act({});

  /* */

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      let program0 = __.program.write
      ({
        routine : _program0,
        tempPath : a.abs( '.' ),
        moduleFile : _.module.fileWith( 0 ),
      });

      let programRoutine1 = __.program.write
      ({
        routine : _programRoutine1,
        tempPath : a.abs( '.' ),
        moduleFile : _.module.fileWith( 0 ),
      });
      console.log( _.strLinesNumber( programRoutine1.sourceCode ) );

      let programRoutine2 = __.program.write
      ({
        routine : _programRoutine2,
        tempPath : a.abs( '.' ),
        moduleFile : _.module.fileWith( 0 ),
      });

      let program3 = __.program.write
      ({
        routine : _program3,
        tempPath : a.abs( '.' ),
        moduleFile : _.module.fileWith( 0 ),
      });

      return start
      ({
        execPath : program0.programPath,
        currentPath : _.path.dir( program0.programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
  `
program0.begin
programRoutine1.begin
programRoutine1.begin : program0 : sourcePath : ${a.abs( '.' )}/_program0
programRoutine1.begin : program0 : requestedSourcePath : null
programRoutine1.begin : program0 : moduleFile : true
programRoutine1.begin : program0 : returned : 0
programRoutine1.begin : program0 : module : null
programRoutine1.begin : programRoutine1 : sourcePath : ${a.abs( '.' )}/_programRoutine1
programRoutine1.begin : programRoutine1 : requestedSourcePath : null
programRoutine1.begin : programRoutine1 : moduleFile : true
programRoutine1.begin : programRoutine1 : returned : [object Object]
programRoutine1.begin : programRoutine1 : module : null
programRoutine2.begin
program3
program3 : programRoutine2 : sourcePath : ${a.abs( '.' )}/_programRoutine2
program3 : programRoutine2 : requestedSourcePath : ./_programRoutine2
program3 : programRoutine2 : moduleFile : true
program3 : programRoutine2 : returned : [object Object]
program3 : programRoutine2 : module : null
program3 : program3 : sourcePath : ${a.abs( '.' )}/_program3
program3 : program3 : requestedSourcePath : ./_program3
program3 : program3 : moduleFile : true
program3 : program3 : returned : 3
program3 : program3 : module : null
programRoutine2.end
programRoutine1.after : program0 : sourcePath : ${a.abs( '.' )}/_program0
programRoutine1.after : program0 : requestedSourcePath : null
programRoutine1.after : program0 : moduleFile : true
programRoutine1.after : program0 : returned : 0
programRoutine1.after : program0 : module : null
programRoutine1.after : programRoutine1 : sourcePath : ${a.abs( '.' )}/_programRoutine1
programRoutine1.after : programRoutine1 : requestedSourcePath : null
programRoutine1.after : programRoutine1 : moduleFile : true
programRoutine1.after : programRoutine1 : returned : 1
programRoutine1.after : programRoutine1 : module : null
programRoutine1.after : programRoutine2 : sourcePath : ${a.abs( '.' )}/_programRoutine2
programRoutine1.after : programRoutine2 : requestedSourcePath : ./_programRoutine2
programRoutine1.after : programRoutine2 : moduleFile : true
programRoutine1.after : programRoutine2 : returned : 2
programRoutine1.after : programRoutine2 : module : null
programRoutine1.after : program3 : sourcePath : ${a.abs( '.' )}/_program3
programRoutine1.after : program3 : requestedSourcePath : ./_program3
programRoutine1.after : program3 : moduleFile : true
programRoutine1.after : program3 : returned : 3
programRoutine1.after : program3 : module : null
programRoutine1.end
program0.end
  `
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function _program0()
  {
    console.log( 'program0.begin' );
    module.exports = 0;
    require( './_programRoutine1' );
    console.log( 'program0.end' );
  }

  /* - */

  function _programRoutine1()
  {
    const _ = require( toolsPath );
    console.log( 'programRoutine1.begin' );

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_program0' );
    console.log( `programRoutine1.begin : program0 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `programRoutine1.begin : program0 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `programRoutine1.begin : program0 : moduleFile : ${moduleFile.native === module.parent}` );
    console.log( `programRoutine1.begin : program0 : returned : ${moduleFile.returned}` );
    console.log( `programRoutine1.begin : program0 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_programRoutine1' );
    console.log( `programRoutine1.begin : programRoutine1 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `programRoutine1.begin : programRoutine1 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `programRoutine1.begin : programRoutine1 : moduleFile : ${moduleFile.native === module}` );
    console.log( `programRoutine1.begin : programRoutine1 : returned : ${moduleFile.returned}` );
    console.log( `programRoutine1.begin : programRoutine1 : module : ${moduleFile.module}` );

    module.exports = 1;
    require( './_programRoutine2' );

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_program0' );
    console.log( `programRoutine1.after : program0 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `programRoutine1.after : program0 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `programRoutine1.after : program0 : moduleFile : ${moduleFile.native === module.parent}` );
    console.log( `programRoutine1.after : program0 : returned : ${moduleFile.returned}` );
    console.log( `programRoutine1.after : program0 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_programRoutine1' );
    console.log( `programRoutine1.after : programRoutine1 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `programRoutine1.after : programRoutine1 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `programRoutine1.after : programRoutine1 : moduleFile : ${moduleFile.native === module}` );
    console.log( `programRoutine1.after : programRoutine1 : returned : ${moduleFile.returned}` );
    console.log( `programRoutine1.after : programRoutine1 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_programRoutine2' );
    console.log( `programRoutine1.after : programRoutine2 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `programRoutine1.after : programRoutine2 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `programRoutine1.after : programRoutine2 : moduleFile : ${moduleFile.native === module.children[ 1 ]}` );
    console.log( `programRoutine1.after : programRoutine2 : returned : ${moduleFile.returned}` );
    console.log( `programRoutine1.after : programRoutine2 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_program3' );
    console.log( `programRoutine1.after : program3 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `programRoutine1.after : program3 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `programRoutine1.after : program3 : moduleFile : ${moduleFile.native === module.children[ 1 ].children[ 0 ]}` );
    console.log( `programRoutine1.after : program3 : returned : ${moduleFile.returned}` );
    console.log( `programRoutine1.after : program3 : module : ${moduleFile.module}` );

    console.log( 'programRoutine1.end' );
  }

  /* - */

  function _programRoutine2()
  {
    const _ = _global_.wTools;
    console.log( 'programRoutine2.begin' );
    require( './_program3' );
    module.exports = 2;
    console.log( 'programRoutine2.end' );
  }

  /* - */

  function _program3()
  {
    const _ = _global_.wTools;
    console.log( 'program3' );
    module.exports = 3;

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_programRoutine2' );
    console.log( `program3 : programRoutine2 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program3 : programRoutine2 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program3 : programRoutine2 : moduleFile : ${moduleFile.native === module.parent}` );
    console.log( `program3 : programRoutine2 : returned : ${moduleFile.returned}` );
    console.log( `program3 : programRoutine2 : module : ${moduleFile.module}` );

    var moduleFile = _.module.fileWithResolvedPath( __dirname + '/_program3' );
    console.log( `program3 : program3 : sourcePath : ${moduleFile.sourcePath}` );
    console.log( `program3 : program3 : requestedSourcePath : ${moduleFile.requestedSourcePath}` );
    console.log( `program3 : program3 : moduleFile : ${moduleFile.native === module}` );
    console.log( `program3 : program3 : returned : ${moduleFile.returned}` );
    console.log( `program3 : program3 : module : ${moduleFile.module}` );

  }

  /* - */

}

//

function modulingGlobalNamespaces( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({ adeclaration : 'none', bdeclaration : 'before' });
  act({ adeclaration : 'none', bdeclaration : 'after' });

  act({ adeclaration : 'before', bdeclaration : 'before' });
  act({ adeclaration : 'before', bdeclaration : 'after' });

  act({ adeclaration : 'after', bdeclaration : 'before' });
  act({ adeclaration : 'after', bdeclaration : 'after' });

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      debugger;
      var programPath = a.program({ routine : programRoutine1, locals : env });
      debugger;
      a.program({ routine : programRoutine2, locals : env });
      a.program({ routine : programRoutine2b, locals : env });
      a.program({ routine : program3, locals : env });
      a.program({ routine : program4, locals : env });
      a.program({ routine : program5, locals : env });
      a.program({ routine : program6, locals : env });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {

      var exp =
`
programRoutine1
programRoutine2
program3
program4
program5.global : space2
program5._global_.wTools : 2
program6 : global : space2
program6 : wTools : space2

program6 : ./programRoutine1 : undefined
program6 : ./programRoutine2 : undefined
program6 : ./programRoutine2b : undefined
program6 : ./program3 : undefined
program6 : ./program4 : undefined
program6 : ./program5 : {- ModuleFile ./program5 -}
  downFiles
    {- ModuleFile ./program4 -}
  upFiles
    {- ModuleFile ${_.module.toolsPathGet()} -}
    {- ModuleFile ./program6 -}
program6 : ./program6 : {- ModuleFile ./program6 -}
  downFiles
    {- ModuleFile ./program5 -}

programRoutine2b

programRoutine1 : ./programRoutine1 : {- ModuleFile ./programRoutine1 -}
  upFiles
    {- ModuleFile ${_.module.toolsPathGet()} -}
    {- ModuleFile ./programRoutine2 -}
    {- ModuleFile ./programRoutine2b -}
programRoutine1 : ./programRoutine2 : {- ModuleFile ./programRoutine2 -}
  ${ env.adeclaration === 'none' ? '' : 'modules' }
  ${ env.adeclaration === 'none' ? '' : '{- Module Module1 -}' }
  downFiles
    {- ModuleFile ./programRoutine1 -}
  upFiles
    {- ModuleFile ./program3 -}
programRoutine1 : ./programRoutine2b : {- ModuleFile ./programRoutine2b -}
  modules
    {- Module Module1 -}
  downFiles
    {- ModuleFile ./programRoutine1 -}
  upFiles
    {- ModuleFile ./program3 -}
programRoutine1 : ./program3 : {- ModuleFile ./program3 -}
  modules
    {- Module Module1 -}
  downFiles
    {- ModuleFile ./programRoutine2 -}
    {- ModuleFile ./programRoutine2b -}
  upFiles
    {- ModuleFile ./program4 -}
programRoutine1 : ./program4 : {- ModuleFile ./program4 -}
  modules
    {- Module Module1 -}
  downFiles
    {- ModuleFile ./program3 -}
  upFiles
    {- ModuleFile ./program5 -}
programRoutine1 : ./program5 : undefined
programRoutine1 : ./program6 : undefined
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function programRoutine1()
  {
    debugger;
    console.log( 'programRoutine1' );
    const _ = require( toolsPath );
    require( './programRoutine2' );
    require( './programRoutine2b' );

    console.log( '' );
    log( './programRoutine1' );
    log( './programRoutine2' );
    log( './programRoutine2b' );
    log( './program3' );
    log( './program4' );
    log( './program5' );
    log( './program6' );
    console.log( '' );

    function log( filePath )
    {
      let prefix = 'programRoutine1'
      let moduleFile = _.module.fileWith( filePath );
      if( !moduleFile )
      return console.log( `${prefix} : ${filePath} : ${moduleFile}` );
      let output = _.module.fileExportString( moduleFile, { verbosity : 2 } );
      output = _.strReplace( output, _.path.normalize( __dirname ), '.' );
      console.log( `${prefix} : ${filePath} : ${output}` );
    }
  }

  /* - */

  function programRoutine2()
  {
    console.log( 'programRoutine2' );
    const _ = _global_.wTools;
    if( adeclaration === 'before' )
    _.module.predeclare( 'Module1', __dirname + '/programRoutine2' );
    require( './program3' );
    if( adeclaration === 'after' )
    _.module.predeclare( 'Module1', __dirname + '/programRoutine2' );
  }

  /* - */

  function programRoutine2b()
  {
    console.log( 'programRoutine2b' );
    const _ = _global_.wTools;
    if( bdeclaration === 'before' )
    _.module.predeclare( 'Module1', __dirname + '/programRoutine2b' );
    require( './program3' );
    if( bdeclaration === 'after' )
    _.module.predeclare( 'Module1', __dirname + '/programRoutine2b' );
  }

  /* - */

  function program3()
  {
    console.log( 'program3' );
    require( './program4' );
  }

  /* - */

  function program4()
  {
    console.log( 'program4' );
    const _ = _global_.wTools;
    _.global.new( 'space2' );
    _.global.open( 'space2' );
    _.module.fileSetEnvironment( module, 'space2' );
    require( './program5' );
    _.global.close( 'space2' );
  }

  /* - */

  function program5()
  {
    console.log( `program5.global : ${_global_.__GLOBAL_NAME__}` );
    console.log( `program5._global_.wTools : ${Object.keys( _global_.wTools ).length}` );
    const _ = require( toolsPath );
    require( './program6' );
  }

  /* - */

  function program6()
  {
    console.log( `program6 : global : ${_global_.__GLOBAL_NAME__}` );
    console.log( `program6 : wTools : ${_global_.wTools.__GLOBAL_NAME__}` );

    const _ = _global_.wTools;

    console.log( '' );
    log( './programRoutine1' );
    log( './programRoutine2' );
    log( './programRoutine2b' );
    log( './program3' );
    log( './program4' );
    log( './program5' );
    log( './program6' );
    console.log( '' );

    function log( filePath )
    {
      let prefix = 'program6'
      let moduleFile = _.module.fileWith( filePath );
      if( !moduleFile )
      return console.log( `${prefix} : ${filePath} : ${moduleFile}` );
      let output = _.module.fileExportString( moduleFile, { verbosity : 2 } );
      output = _.strReplace( output, _.path.normalize( __dirname ), '.' );
      console.log( `${prefix} : ${filePath} : ${output}` );
    }
  }

  /* - */

}

modulingGlobalNamespaces.description =
`
- virtual environment in inherited from parent modules
- module is stay in its environment
- no error or unhandled case
`

//

function preload( test )
{
  let context = this;
  let a = test.assetFor( false );
  let _ToolsPath_ = a.path.nativize( _.module.toolsPathGet() );
  let programRoutine1Path = _.path.nativize( a.program( programRoutine1 ) );

  /* */

  a.appStartNonThrowing({ execPath : `-r ${_ToolsPath_} ${programRoutine1Path}` })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'program.begin' ), 1 );
    test.identical( _.strCount( op.output, 'program.end' ), 1 );
    test.identical( _.strCount( op.output, _.module.toolsPathGet() ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function programRoutine1()
  {
    console.log( 'program.begin' );
    let _ = _global_.wTools;
    debugger;
    console.log( _.module.toolsPathGet() );
    console.log( 'program.end' );
  }
}

//

function preloadIncludeModule( test )
{
  let context = this;
  let a = test.assetFor( false );
  let _ToolsPath_ = a.path.nativize( _.module.toolsPathGet() );
  let programRoutine1Path = _.path.nativize( a.program( programRoutine1 ) );

  /* */

  a.appStartNonThrowing({ execPath : `-r ${_ToolsPath_} ${programRoutine1Path}` })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'program.begin' ), 1 );
    test.identical( _.strCount( op.output, 'program.end' ), 1 );
    test.identical( _.strCount( op.output, 'program is alive : true' ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function programRoutine1()
  {
    console.log( 'program.begin' );
    let _ = _global_.wTools;
    _.include( 'wProcess' );
    console.log( 'program is alive :', _.process.isAlive( process.pid ) );
    console.log( 'program.end' );
  }
}

//

function predeclareBasic( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `predeclare before, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( main );

      a.program
      ({
        routine : programRoutine1,
        dirPath : 'dir',
      });

      a.program( programRoutine2 )

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      /*
      extra module file is program
      */
      var exp =
`
main.before / lengthOf( predeclaredWithNameMap ) 2
main.before / lengthOf( predeclaredWithEntryPathMap ) 2
main.before / lengthOf( modulesMap ) ${_.entity.lengthOf( _.module.withName( 'wTools' ).alias )}
main.before / filesMap but tools.files
  ${a.abs( 'main' ) }
main.mid / predeclared.programRoutine1 : Module.constructible
main.mid / predeclared.programRoutine2 : Module.constructible
main.mid / lengthOf( predeclaredWithNameMap ) 4
main.mid / lengthOf( predeclaredWithEntryPathMap ) 4
main.mid / lengthOf( modulesMap ) 2
main.mid / lengthOf( filesMap ) 0
main.mid / isIncluded( Program1 ) false
main.mid / isIncluded( Program2 ) false
programRoutine1 / isIncluded( Program1 ) true
programRoutine1 / isIncluded( Program2 ) false
programRoutine2 / isIncluded( Program1 ) true
programRoutine2 / isIncluded( Program2 ) true
main.after / isIncluded( Program1 ) true
main.after / isIncluded( Program2 ) true
Program1
  ${a.abs( 'dir/programRoutine1' )}
Program2
  ${a.abs( 'programRoutine2' )}
orphans
  ${a.abs( 'main' )}
main.after / lengthOf( predeclaredWithNameMap ) 4
main.after / lengthOf( predeclaredWithEntryPathMap ) 4
main.after / lengthOf( modulesMap ) 4
main.after / lengthOf( filesMap ) 2
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

  }

  /* - */

  function main()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    let wasFilesMap = _.entity.lengthOf( _.module.filesMap );

    console.log( 'main.before / lengthOf( predeclaredWithNameMap )', _.entity.lengthOf( _.module.predeclaredWithNameMap ) );
    console.log( 'main.before / lengthOf( predeclaredWithEntryPathMap )', _.entity.lengthOf( _.module.predeclaredWithEntryPathMap ) );
    console.log( 'main.before / lengthOf( modulesMap )', _.entity.lengthOf( _.module.modulesMap ) );
    var diff = _.arraySet.diff_( null, [ ... _.module.filesMap.keys() ], [ ... _.module.withName( 'wTools' ).files.keys() ] )
    console.log( `main.before / filesMap but tools.files\n  ${diff.join( '\n  ' )}` );

    _.module.predeclare( 'Program1', __dirname + '/dir/programRoutine1' );
    _.module.predeclare( 'Program2', __dirname + '/programRoutine2/' );

    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/dir/programRoutine1/' ) );
    console.log( `main.mid / predeclared.programRoutine1 : ${_.entity.strType( module )}` );
    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/programRoutine2' ) );
    console.log( `main.mid / predeclared.programRoutine2 : ${_.entity.strType( module )}` );

    console.log( 'main.mid / lengthOf( predeclaredWithNameMap )', _.entity.lengthOf( _.module.predeclaredWithNameMap ) );
    console.log( 'main.mid / lengthOf( predeclaredWithEntryPathMap )', _.entity.lengthOf( _.module.predeclaredWithEntryPathMap ) );
    console.log( 'main.mid / lengthOf( modulesMap )', _.entity.lengthOf( _.module.modulesMap ) );
    console.log( 'main.mid / lengthOf( filesMap )', _.entity.lengthOf( _.module.filesMap ) - wasFilesMap );

    console.log( 'main.mid / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'main.mid / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );

    require( './dir/programRoutine1' );

    console.log( 'main.after / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'main.after / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );

    var files = [ ... _.module.withName( 'Program1' ).files.keys() ];
    console.log( `Program1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Program2' ).files.keys() ];
    console.log( `Program2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

    console.log( 'main.after / lengthOf( predeclaredWithNameMap )', _.entity.lengthOf( _.module.predeclaredWithNameMap ) );
    console.log( 'main.after / lengthOf( predeclaredWithEntryPathMap )', _.entity.lengthOf( _.module.predeclaredWithEntryPathMap ) );
    console.log( 'main.after / lengthOf( modulesMap )', _.entity.lengthOf( _.module.modulesMap ) );
    console.log( 'main.after / lengthOf( filesMap )', _.entity.lengthOf( _.module.filesMap ) - wasFilesMap );

  }

  /* - */

  function programRoutine1()
  {
    const _ = _global_.wTools;
    console.log( 'programRoutine1 / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'programRoutine1 / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );
    require( '../programRoutine2' );
  }

  /* - */

  function programRoutine2()
  {
    const _ = _global_.wTools;
    console.log( 'programRoutine2 / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'programRoutine2 / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );
  }

  /* - */

}

//

function predeclarePrime( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  special({ includingWith : 'require' });
  before({ includingWith : 'require' });
  before({ includingWith : 'include' });
  after({ includingWith : 'require', order : 'trp' }); /* tools, require, predeclare */
  after({ includingWith : 'require', order : 'rtp' }); /* require, tools, predeclare */
  after({ includingWith : 'require', order : 'prt' }); /* predeclare, require, tools */

  return ready;

  /* - */

  function localsFrom( env )
  {
    _.assert( _.routineIs( _.global.get ) );
    return _.props.extend( null, env, { get : _.global.get } );
  }

  /* - */

  function special( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `same entry path for both modules, ${__.entity.exportStringSolo( env )}`;
      var programPath = a.program( mainMultipleDeclare );
      a.program( common );
      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp = `Module Common2 is trying to register entry path ${a.abs( 'common' )} which is registered for {- Module Common1 -}`;
      test.true( _.strHas( op.output, exp ) );
      test.nil( op.exitCode, 0 );
      return op;
    });

    /* */

  }

  /* - */

  function before( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `before, single level, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainSingleBefore, locals : localsFrom( env ) });
      a.program({ routine : single1, locals : localsFrom( env ) });
      a.program({ routine : single2, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main.mid / predeclared.single1 : Module.constructible
main.mid / predeclared.single2 : Module.constructible
main.mid / isIncluded( Single1 ) false
main.mid / isIncluded( Single2 ) false
single1 / isIncluded( Single1 ) true
single1 / isIncluded( Single2 ) false
single2 / isIncluded( Single1 ) true
single2 / isIncluded( Single2 ) true
main.after / isIncluded( Single1 ) true
main.after / isIncluded( Single2 ) true
Single1
  ${a.abs( 'single1' )}
Single2
  ${a.abs( 'single2' )}
orphans
  ${a.abs( 'mainSingleBefore' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `before, deep, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainDeepBefore, locals : localsFrom( env ) });
      a.program({ routine : deep1a, locals : localsFrom( env ) });
      a.program({ routine : deep1b, locals : localsFrom( env ) });
      a.program({ routine : deep1c, locals : localsFrom( env ) });
      a.program({ routine : deep1d, locals : localsFrom( env ) });
      a.program({ routine : deep1e, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main.mid / isIncluded( Deep1b ) false
main.mid / isIncluded( Deep1d ) false
deep1a / isIncluded( Deep1b ) false
deep1a / isIncluded( Deep1d ) false
deep1b / isIncluded( Deep1b ) true
deep1b / isIncluded( Deep1d ) false
deep1c / isIncluded( Deep1b ) true
deep1c / isIncluded( Deep1d ) false
deep1d / isIncluded( Deep1b ) true
deep1d / isIncluded( Deep1d ) true
deep1e / isIncluded( Deep1b ) true
deep1e / isIncluded( Deep1d ) true
main.after / isIncluded( Deep1b ) true
main.after / isIncluded( Deep1d ) true
Deep1b
  ${a.abs( 'deep1b' )}
  ${a.abs( 'deep1c' )}
Deep1d
  ${a.abs( 'deep1d' )}
  ${a.abs( 'deep1e' )}
orphans
  ${a.abs( 'mainDeepBefore' )}
  ${a.abs( 'deep1a' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `before, common sub file, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainBeforeCommonSubFile, locals : localsFrom( env ) });
      a.program({ routine : common, locals : localsFrom( env ) });
      a.program({ routine : common1, locals : localsFrom( env ) });
      a.program({ routine : common2, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
common
common1 abc
Common1 abc
common2 abc
Common2 abc
Common1
  ${a.abs( 'common1' )}
  ${a.abs( 'common' )}
Common2
  ${a.abs( 'common2' )}
  ${a.abs( 'common' )}
orphans
  ${a.abs( 'mainBeforeCommonSubFile' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `before, common sub file deep, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainBeforeCommonSubFileDeep, locals : localsFrom( env ) });
      a.program({ routine : common, locals : localsFrom( env ) });
      a.program({ routine : deep2a, locals : localsFrom( env ) });
      a.program({ routine : deep2b, locals : localsFrom( env ) });
      a.program({ routine : deep3a, locals : localsFrom( env ) });
      a.program({ routine : deep3b, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
common
deep2b.1 abc
deep2b.2 abc
deep2a abc
Deep2 abc
deep3b.1 abc
deep3b.2 abc
deep3a abc
Deep3 abc
deep2b.upFiles
  ${a.abs( 'common' )}
deep3b.upFiles
  ${a.abs( 'common' )}
common.downFiles
  ${a.abs( 'deep2b' )}
  ${a.abs( 'deep3b' )}
Deep2
  ${a.abs( 'deep2a' )}
  ${a.abs( 'deep2b' )}
  ${a.abs( 'common' )}
Deep3
  ${a.abs( 'deep3a' )}
  ${a.abs( 'deep3b' )}
  ${a.abs( 'common' )}
orphans
  ${a.abs( 'mainBeforeCommonSubFileDeep' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `before, branching1, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainBranchingBefore1, locals : localsFrom( env ) });
      a.program({ routine : branching1a, locals : localsFrom( env ) });
      a.program({ routine : branching1b, locals : localsFrom( env ) });
      a.program({ routine : branching2a, locals : localsFrom( env ) });
      a.program({ routine : branching2b, locals : localsFrom( env ) });
      a.program({ routine : branchingCommon, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main.mid / isIncluded( Branching1 ) false
main.mid / isIncluded( Branching2 ) false
branching1a
branching1b
branchingCommon
branching2b
branching2a
main.after / isIncluded( Branching1 ) true
main.after / isIncluded( Branching2 ) true
Branching1
  ${a.abs( 'branching1a' )}
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
Branching2
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2a' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
orphans
  ${a.abs( 'mainBranchingBefore1' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `before, branching2, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainBranchingBefore2, locals : localsFrom( env ) });
      a.program({ routine : branching1a, locals : localsFrom( env ) });
      a.program({ routine : branching1b, locals : localsFrom( env ) });
      a.program({ routine : branching2a, locals : localsFrom( env ) });
      a.program({ routine : branching2b, locals : localsFrom( env ) });
      a.program({ routine : branchingCommon, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main.mid / isIncluded( Branching1 ) false
main.mid / isIncluded( Branching2 ) false
branching2a
branching2b
branchingCommon
branching1b
branching1a
main.after / isIncluded( Branching1 ) true
main.after / isIncluded( Branching2 ) true
Branching1
  ${a.abs( 'branching1a' )}
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
Branching2
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2a' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
orphans
  ${a.abs( 'mainBranchingBefore2' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

  }

  /* - */

  function after( env )
  {

    ready.then( () =>
    {
      test.case = `after, single, top first, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainSingleAfterTopFirst, locals : localsFrom( env ) });
      a.program({ routine : singleAfter1, locals : localsFrom( env ) });
      a.program({ routine : singleAfter2, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
singleAfter1
singleAfter2
main.after / predeclared.singleAfter1 : Module.constructible
main.after / predeclared.singleAfter2 : Module.constructible
main.after / isIncluded( Single1 ) true
main.after / isIncluded( Single2 ) true
Single1
  ${a.abs( 'singleAfter1' )}
Single2
  ${a.abs( 'singleAfter2' )}
orphans
  ${a.abs( 'mainSingleAfterTopFirst' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `after, single, bottom first, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainSingleAfterBottomFirst, locals : localsFrom( env ) });
      a.program({ routine : singleAfter1, locals : localsFrom( env ) });
      a.program({ routine : singleAfter2, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
singleAfter1
singleAfter2
main.after / predeclared.singleAfter1 : Module.constructible
main.after / predeclared.singleAfter2 : Module.constructible
main.after / isIncluded( Single1 ) true
main.after / isIncluded( Single2 ) true
Single1
  ${a.abs( 'singleAfter1' )}
Single2
  ${a.abs( 'singleAfter2' )}
orphans
  ${a.abs( 'mainSingleAfterBottomFirst' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `after, deep, b, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainDeepAfterB, locals : localsFrom( env ) });
      a.program({ routine : deep11a, locals : localsFrom( env ) });
      a.program({ routine : deep11b, locals : localsFrom( env ) });
      a.program({ routine : deep11c, locals : localsFrom( env ) });
      a.program({ routine : deep11d, locals : localsFrom( env ) });
      a.program({ routine : deep11e, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
deep11a
deep11b
deep11c
deep11d
deep11e
main.after / isIncluded( Deep1b ) true
main.after / isIncluded( Deep1d ) true
Deep1b
  ${a.abs( 'deep11b' )}
  ${a.abs( 'deep11c' )}
Deep1d
  ${a.abs( 'deep11d' )}
  ${a.abs( 'deep11e' )}
orphans
  ${a.abs( 'mainDeepAfterB' )}
  ${a.abs( 'deep11a' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `after, deep, d, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainDeepAfterD, locals : localsFrom( env ) });
      a.program({ routine : deep11a, locals : localsFrom( env ) });
      a.program({ routine : deep11b, locals : localsFrom( env ) });
      a.program({ routine : deep11c, locals : localsFrom( env ) });
      a.program({ routine : deep11d, locals : localsFrom( env ) });
      a.program({ routine : deep11e, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
deep11a
deep11b
deep11c
deep11d
deep11e
main.after / isIncluded( Deep1b ) true
main.after / isIncluded( Deep1d ) true
Deep1b
  ${a.abs( 'deep11b' )}
  ${a.abs( 'deep11c' )}
Deep1d
  ${a.abs( 'deep11d' )}
  ${a.abs( 'deep11e' )}
orphans
  ${a.abs( 'mainDeepAfterD' )}
  ${a.abs( 'deep11a' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `after, common sub file, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainAfterCommonSubFile, locals : localsFrom( env ) });
      a.program({ routine : common, locals : localsFrom( env ) });
      a.program({ routine : common1, locals : localsFrom( env ) });
      a.program({ routine : common2, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
common
common1 abc
Common1 abc
common2 abc
Common2 abc
common1.upFiles
  ${a.abs( 'common' )}
common2.upFiles
  ${a.abs( 'common' )}
common.downFiles
  ${a.abs( 'common1' )}
  ${a.abs( 'common2' )}
Common1
  ${a.abs( 'common1' )}
  ${a.abs( 'common' )}
Common2
  ${a.abs( 'common2' )}
  ${a.abs( 'common' )}
orphans
  ${a.abs( 'mainAfterCommonSubFile' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `after, common sub file deep, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainAfterCommonSubFileDeep, locals : localsFrom( env ) });
      a.program({ routine : common, locals : localsFrom( env ) });
      a.program({ routine : deep2a, locals : localsFrom( env ) });
      a.program({ routine : deep2b, locals : localsFrom( env ) });
      a.program({ routine : deep3a, locals : localsFrom( env ) });
      a.program({ routine : deep3b, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
common
deep2b.1 abc
deep2b.2 abc
deep2a abc
Deep2 abc
deep3b.1 abc
deep3b.2 abc
deep3a abc
Deep3 abc
deep2b.upFiles
  ${a.abs( 'common' )}
deep3b.upFiles
  ${a.abs( 'common' )}
common.downFiles
  ${a.abs( 'deep2b' )}
  ${a.abs( 'deep3b' )}
Deep2
  ${a.abs( 'deep2a' )}
  ${a.abs( 'deep2b' )}
  ${a.abs( 'common' )}
Deep3
  ${a.abs( 'deep3a' )}
  ${a.abs( 'deep3b' )}
  ${a.abs( 'common' )}
orphans
  ${a.abs( 'mainAfterCommonSubFileDeep' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `after, branching1, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainBranchingAfter1, locals : localsFrom( env ) });
      a.program({ routine : branching1a, locals : localsFrom( env ) });
      a.program({ routine : branching1b, locals : localsFrom( env ) });
      a.program({ routine : branching2a, locals : localsFrom( env ) });
      a.program({ routine : branching2b, locals : localsFrom( env ) });
      a.program({ routine : branchingCommon, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
branching1a
branching1b
branchingCommon
branching2b
branching2a
main.after / isIncluded( Branching1 ) true
main.after / isIncluded( Branching2 ) true
Branching1
  ${a.abs( 'branching1a' )}
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
Branching2
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2a' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
orphans
  ${a.abs( 'mainBranchingAfter1' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `after, branching2, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : mainBranchingAfter2, locals : localsFrom( env ) });
      a.program({ routine : branching1a, locals : localsFrom( env ) });
      a.program({ routine : branching1b, locals : localsFrom( env ) });
      a.program({ routine : branching2a, locals : localsFrom( env ) });
      a.program({ routine : branching2b, locals : localsFrom( env ) });
      a.program({ routine : branchingCommon, locals : localsFrom( env ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
branching2a
branching2b
branchingCommon
branching1b
branching1a
main.after / isIncluded( Branching1 ) true
main.after / isIncluded( Branching2 ) true
Branching1
  ${a.abs( 'branching1a' )}
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
Branching2
  ${a.abs( 'branching1b' )}
  ${a.abs( 'branching2a' )}
  ${a.abs( 'branching2b' )}
  ${a.abs( 'branchingCommon' )}
orphans
  ${a.abs( 'mainBranchingAfter2' )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

  }

  /* - */

  function mainSingleBefore()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    _.module.predeclare( 'Single1', __dirname + '/single1' );
    _.module.predeclare( 'Single2', __dirname + '/single2/' );

    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/single1' ) );
    console.log( `main.mid / predeclared.single1 : ${_.entity.strType( module )}` );
    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/single2' ) );
    console.log( `main.mid / predeclared.single2 : ${_.entity.strType( module )}` );

    console.log( 'main.mid / isIncluded( Single1 )', _.module.isIncluded( 'Single1' ) );
    console.log( 'main.mid / isIncluded( Single2 )', _.module.isIncluded( 'Single2' ) );

    if( includingWith === 'require' )
    require( './single1' );
    else
    _.include( 'Single1' );

    console.log( 'main.after / isIncluded( Single1 )', _.module.isIncluded( 'Single1' ) );
    console.log( 'main.after / isIncluded( Single2 )', _.module.isIncluded( 'Single2' ) );

    var files = [ ... _.module.withName( 'Single1' ).files.keys() ];
    console.log( `Single1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Single2' ).files.keys() ];
    console.log( `Single2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function single1()
  {
    const _ = _global_.wTools;
    console.log( 'single1 / isIncluded( Single1 )', _.module.isIncluded( 'Single1' ) );
    console.log( 'single1 / isIncluded( Single2 )', _.module.isIncluded( 'Single2' ) );

    if( includingWith === 'require' )
    require( './single2' );
    else
    _.include( 'Single2' );

  }

  /* - */

  function single2()
  {
    const _ = _global_.wTools;
    console.log( 'single2 / isIncluded( Single1 )', _.module.isIncluded( 'Single1' ) );
    console.log( 'single2 / isIncluded( Single2 )', _.module.isIncluded( 'Single2' ) );
  }

  /* - */

  function mainSingleAfterTopFirst()
  {

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      require( './singleAfter1' );
      _.module.predeclare( 'Single1', __dirname + '/singleAfter1' );
      _.module.predeclare( 'Single2', __dirname + '/singleAfter2/' );
    }
    else if( order === 'rtp' )
    {
      require( './singleAfter1' );
      _ = require( toolsPath );
      _.module.predeclare( 'Single1', __dirname + '/singleAfter1' );
      _.module.predeclare( 'Single2', __dirname + '/singleAfter2/' );
    }
    else if( order === 'prt' )
    {

      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Single1' ] = { entryPath : __dirname + '/singleAfter1' };
      _.module._modulesToPredeclare[ 'Single2' ] = { entryPath : __dirname + '/singleAfter2/' };
      require( './singleAfter1' );
      _ = require( toolsPath );
    }

    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/singleAfter1' ) );
    console.log( `main.after / predeclared.singleAfter1 : ${_.entity.strType( module )}` );
    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/singleAfter2' ) );
    console.log( `main.after / predeclared.singleAfter2 : ${_.entity.strType( module )}` );

    console.log( 'main.after / isIncluded( Single1 )', _.module.isIncluded( 'Single1' ) );
    console.log( 'main.after / isIncluded( Single2 )', _.module.isIncluded( 'Single2' ) );

    var files = [ ... _.module.withName( 'Single1' ).files.keys() ];
    console.log( `Single1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Single2' ).files.keys() ];
    console.log( `Single2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function mainSingleAfterBottomFirst()
  {

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      require( './singleAfter1' );
      _.module.predeclare( 'Single2', __dirname + '/singleAfter2/' );
      _.module.predeclare( 'Single1', __dirname + '/singleAfter1' );
    }
    else if( order === 'rtp' )
    {
      require( './singleAfter1' );
      _ = require( toolsPath );
      _.module.predeclare( 'Single2', __dirname + '/singleAfter2/' );
      _.module.predeclare( 'Single1', __dirname + '/singleAfter1' );
    }
    else if( order === 'prt' )
    {
      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Single2' ] = { entryPath : __dirname + '/singleAfter2/' };
      _.module._modulesToPredeclare[ 'Single1' ] = { entryPath : __dirname + '/singleAfter1' };
      require( './singleAfter1' );
      _ = require( toolsPath );
    }

    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/singleAfter1' ) );
    console.log( `main.after / predeclared.singleAfter1 : ${_.entity.strType( module )}` );
    var module = _.module.predeclaredWithEntryPathMap.get( _.path.canonize( __dirname + '/singleAfter2' ) );
    console.log( `main.after / predeclared.singleAfter2 : ${_.entity.strType( module )}` );

    console.log( 'main.after / isIncluded( Single1 )', _.module.isIncluded( 'Single1' ) );
    console.log( 'main.after / isIncluded( Single2 )', _.module.isIncluded( 'Single2' ) );

    var files = [ ... _.module.withName( 'Single1' ).files.keys() ];
    console.log( `Single1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Single2' ).files.keys() ];
    console.log( `Single2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function singleAfter1()
  {
    console.log( 'singleAfter1' );
    require( './singleAfter2' );
  }

  /* - */

  function singleAfter2()
  {
    console.log( 'singleAfter2' );
  }

  /* - */

  function mainDeepBefore()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    _.module.predeclare( 'Deep1b', __dirname + '/deep1b' );
    _.module.predeclare( 'Deep1d', __dirname + '/deep1d' );

    console.log( 'main.mid / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'main.mid / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    require( './deep1a' );

    console.log( 'main.after / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'main.after / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    var files = [ ... _.module.withName( 'Deep1b' ).files.keys() ];
    console.log( `Deep1b\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Deep1d' ).files.keys() ];
    console.log( `Deep1d\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function deep1a()
  {
    const _ = _global_.wTools;
    console.log( 'deep1a / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'deep1a / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    if( includingWith === 'require' )
    require( './deep1b' );
    else
    _.include( 'Deep1b' );

  }

  /* - */

  function deep1b()
  {
    const _ = _global_.wTools;
    console.log( 'deep1b / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'deep1b / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    require( './deep1c' );

  }

  /* - */

  function deep1c()
  {
    const _ = _global_.wTools;
    console.log( 'deep1c / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'deep1c / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    if( includingWith === 'require' )
    require( './deep1d' );
    else
    _.include( 'Deep1d' );

  }

  /* - */

  function deep1d()
  {
    const _ = _global_.wTools;
    console.log( 'deep1d / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'deep1d / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    require( './deep1e' );

  }

  /* - */

  function deep1e()
  {
    const _ = _global_.wTools;
    console.log( 'deep1e / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'deep1e / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );
  }

  /* - */

  function mainDeepAfterB()
  {

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      require( './deep11a' );
      _.module.predeclare( 'Deep1b', __dirname + '/deep11b' );
      _.module.predeclare( 'Deep1d', __dirname + '/deep11d' );
    }
    else if( order === 'rtp' )
    {
      require( './deep11a' );
      _ = require( toolsPath );
      _.module.predeclare( 'Deep1b', __dirname + '/deep11b' );
      _.module.predeclare( 'Deep1d', __dirname + '/deep11d' );
    }
    else if( order === 'prt' )
    {
      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Deep1b' ] = { entryPath : __dirname + '/deep11b' };
      _.module._modulesToPredeclare[ 'Deep1d' ] = { entryPath : __dirname + '/deep11d' };
      require( './deep11a' );
      _ = require( toolsPath );
    }

    console.log( 'main.after / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'main.after / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    var files = [ ... _.module.withName( 'Deep1b' ).files.keys() ];
    console.log( `Deep1b\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Deep1d' ).files.keys() ];
    console.log( `Deep1d\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function mainDeepAfterD()
  {

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      require( './deep11a' );
      _.module.predeclare( 'Deep1d', __dirname + '/deep11d' );
      _.module.predeclare( 'Deep1b', __dirname + '/deep11b' );
    }
    else if( order === 'rtp' )
    {
      require( './deep11a' );
      _ = require( toolsPath );
      _.module.predeclare( 'Deep1d', __dirname + '/deep11d' );
      _.module.predeclare( 'Deep1b', __dirname + '/deep11b' );
    }
    else if( order === 'prt' )
    {

      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Deep1d' ] = { entryPath : __dirname + '/deep11d' };
      _.module._modulesToPredeclare[ 'Deep1b' ] = { entryPath : __dirname + '/deep11b' };
      require( './deep11a' );
      _ = require( toolsPath );
    }

    console.log( 'main.after / isIncluded( Deep1b )', _.module.isIncluded( 'Deep1b' ) );
    console.log( 'main.after / isIncluded( Deep1d )', _.module.isIncluded( 'Deep1d' ) );

    var files = [ ... _.module.withName( 'Deep1b' ).files.keys() ];
    console.log( `Deep1b\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Deep1d' ).files.keys() ];
    console.log( `Deep1d\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function deep11a()
  {
    console.log( 'deep11a' );
    require( './deep11b' );
  }

  /* - */

  function deep11b()
  {
    console.log( 'deep11b' );
    require( './deep11c' );
  }

  /* - */

  function deep11c()
  {
    console.log( 'deep11c' );
    require( './deep11d' );
  }

  /* - */

  function deep11d()
  {
    console.log( 'deep11d' );
    require( './deep11e' );
  }

  /* - */

  function deep11e()
  {
    console.log( 'deep11e' );
  }

  /* - */

  function mainMultipleDeclare()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    _.module.predeclare( 'Common1', __dirname + '/common' );
    _.module.predeclare( 'Common2', __dirname + '/common' );

  }

  /* - */

  function mainBeforeCommonSubFile()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    _.module.predeclare( 'Common1', __dirname + '/common1' );
    _.module.predeclare( 'Common2', __dirname + '/common2' );

    if( includingWith === 'require' )
    console.log( 'Common1', require( './common1' ) );
    else
    console.log( 'Common1', _.include( 'Common1' ) );

    if( includingWith === 'require' )
    console.log( 'Common2', require( './common2' ) );
    else
    console.log( 'Common2', _.include( 'Common2' ) );

    var files = [ ... _.module.withName( 'Common1' ).files.keys() ];
    console.log( `Common1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Common2' ).files.keys() ];
    console.log( `Common2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function mainAfterCommonSubFile()
  {
    let _;

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      console.log( 'Common1', require( './common1' ) );
      console.log( 'Common2', require( './common2' ) );
      _.module.predeclare( 'Common1', __dirname + '/common1' );
      _.module.predeclare( 'Common2', __dirname + '/common2' );
    }
    else if( order === 'rtp' )
    {
      console.log( 'Common1', require( './common1' ) );
      console.log( 'Common2', require( './common2' ) );
      _ = require( toolsPath );
      _.module.predeclare( 'Common1', __dirname + '/common1' );
      _.module.predeclare( 'Common2', __dirname + '/common2' );
    }
    else if( order === 'prt' )
    {
      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Common1' ] = { entryPath : __dirname + '/common1' };
      _.module._modulesToPredeclare[ 'Common2' ] = { entryPath : __dirname + '/common2' };
      console.log( 'Common1', require( './common1' ) );
      console.log( 'Common2', require( './common2' ) );
      _ = require( toolsPath );
    }

    var file = _.module.fileWith( './common1' );
    var files = [ ... file.upFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `common1.upFiles\n  ${files.join( '\n  ' )}` );
    var file = _.module.fileWith( './common2' );
    var files = [ ... file.upFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `common2.upFiles\n  ${files.join( '\n  ' )}` );
    var file = _.module.fileWith( './common' );
    var files = [ ... file.downFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `common.downFiles\n  ${files.sort().join( '\n  ' )}` );

    var files = [ ... _.module.withName( 'Common1' ).files.keys() ];
    console.log( `Common1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Common2' ).files.keys() ];
    console.log( `Common2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function common()
  {
    console.log( 'common' );
    module.exports = 'abc';
  }

  /* - */

  function common1()
  {
    let result = require( './common' );
    console.log( 'common1', result );
    module.exports = result;
  }

  /* - */

  function common2()
  {
    let result = require( './common' );
    console.log( 'common2', result );
    module.exports = result;
  }

  /* - */

  function mainBeforeCommonSubFileDeep()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    _.module.predeclare( 'Deep2', __dirname + '/deep2a' );
    _.module.predeclare( 'Deep3', __dirname + '/deep3a' );

    if( includingWith === 'require' )
    console.log( 'Deep2', require( './deep2a' ) );
    else
    console.log( 'Deep2', _.include( 'Deep2' ) );

    if( includingWith === 'require' )
    console.log( 'Deep3', require( './deep3a' ) );
    else
    console.log( 'Deep3', _.include( 'Deep3' ) );

    var file = _.module.fileWith( './deep2b' );
    var files = [ ... file.upFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `deep2b.upFiles\n  ${files.join( '\n  ' )}` );
    var file = _.module.fileWith( './deep3b' );
    var files = [ ... file.upFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `deep3b.upFiles\n  ${files.join( '\n  ' )}` );
    var file = _.module.fileWith( './common' );
    var files = [ ... file.downFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `common.downFiles\n  ${files.sort().join( '\n  ' )}` );

    var files = [ ... _.module.withName( 'Deep2' ).files.keys() ];
    console.log( `Deep2\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Deep3' ).files.keys() ];
    console.log( `Deep3\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function mainAfterCommonSubFileDeep()
  {

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      console.log( 'Deep2', require( './deep2a' ) );
      console.log( 'Deep3', require( './deep3a' ) );
      _.module.predeclare( 'Deep2', __dirname + '/deep2a' );
      _.module.predeclare( 'Deep3', __dirname + '/deep3a' );
    }
    else if( order === 'rtp' )
    {
      console.log( 'Deep2', require( './deep2a' ) );
      console.log( 'Deep3', require( './deep3a' ) );
      _ = require( toolsPath );
      _.module.predeclare( 'Deep2', __dirname + '/deep2a' );
      _.module.predeclare( 'Deep3', __dirname + '/deep3a' );
    }
    else if( order === 'prt' )
    {
      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Deep2' ] = { entryPath : __dirname + '/deep2a' };
      _.module._modulesToPredeclare[ 'Deep3' ] = { entryPath : __dirname + '/deep3a' };
      console.log( 'Deep2', require( './deep2a' ) );
      console.log( 'Deep3', require( './deep3a' ) );
      _ = require( toolsPath );
    }

    var file = _.module.fileWith( './deep2b' );
    var files = [ ... file.upFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `deep2b.upFiles\n  ${files.join( '\n  ' )}` );
    var file = _.module.fileWith( './deep3b' );
    var files = [ ... file.upFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `deep3b.upFiles\n  ${files.join( '\n  ' )}` );
    var file = _.module.fileWith( './common' );
    var files = [ ... file.downFiles.values() ].map( ( file ) => file.sourcePath );
    console.log( `common.downFiles\n  ${files.sort().join( '\n  ' )}` );

    var files = [ ... _.module.withName( 'Deep2' ).files.keys() ];
    console.log( `Deep2\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Deep3' ).files.keys() ];
    console.log( `Deep3\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function deep2a()
  {
    let result = require( './deep2b' );
    console.log( 'deep2a', result );
    module.exports = result;
  }

  /* - */

  function deep2b()
  {
    let result = require( './common' );
    console.log( 'deep2b.1', result );
    let result2 = require( './common' );
    console.log( 'deep2b.2', result2 );
    module.exports = result;
  }

  /* - */

  function deep3a()
  {
    let result = require( './deep3b' );
    console.log( 'deep3a', result );
    module.exports = result;
  }

  /* - */

  function deep3b()
  {
    let result = require( './common' );
    console.log( 'deep3b.1', result );
    let result2 = require( './common' );
    console.log( 'deep3b.2', result2 );
    module.exports = result;
  }

  /* - */

  function mainBranchingBefore1()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    _.module.predeclare( 'Branching1', __dirname + '/branching1a' );
    _.module.predeclare( 'Branching2', __dirname + '/branching2a' );

    console.log( 'main.mid / isIncluded( Branching1 )', _.module.isIncluded( 'Branching1' ) );
    console.log( 'main.mid / isIncluded( Branching2 )', _.module.isIncluded( 'Branching2' ) );

    if( includingWith === 'require' )
    require( './branching1a' );
    else
    _.include( 'Branching1' );

    if( includingWith === 'require' )
    require( './branching2a' );
    else
    _.include( 'Branching2' );

    console.log( 'main.after / isIncluded( Branching1 )', _.module.isIncluded( 'Branching1' ) );
    console.log( 'main.after / isIncluded( Branching2 )', _.module.isIncluded( 'Branching2' ) );

    var files = [ ... _.module.withName( 'Branching1' ).files.keys() ].sort();
    console.log( `Branching1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Branching2' ).files.keys() ].sort();
    console.log( `Branching2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function mainBranchingBefore2()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );

    _.module.predeclare( 'Branching1', __dirname + '/branching1a' );
    _.module.predeclare( 'Branching2', __dirname + '/branching2a' );

    console.log( 'main.mid / isIncluded( Branching1 )', _.module.isIncluded( 'Branching1' ) );
    console.log( 'main.mid / isIncluded( Branching2 )', _.module.isIncluded( 'Branching2' ) );

    if( includingWith === 'require' )
    require( './branching2a' );
    else
    _.include( 'Branching2' );

    if( includingWith === 'require' )
    require( './branching1a' );
    else
    _.include( 'Branching1' );

    console.log( 'main.after / isIncluded( Branching1 )', _.module.isIncluded( 'Branching1' ) );
    console.log( 'main.after / isIncluded( Branching2 )', _.module.isIncluded( 'Branching2' ) );

    var files = [ ... _.module.withName( 'Branching1' ).files.keys() ].sort();
    console.log( `Branching1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Branching2' ).files.keys() ].sort();
    console.log( `Branching2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function mainBranchingAfter1()
  {

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      require( './branching1a' );
      require( './branching2a' );
      _.module.predeclare( 'Branching1', __dirname + '/branching1a' );
      _.module.predeclare( 'Branching2', __dirname + '/branching2a' );
    }
    else if( order === 'rtp' )
    {
      require( './branching1a' );
      require( './branching2a' );
      _ = require( toolsPath );
      _.module.predeclare( 'Branching1', __dirname + '/branching1a' );
      _.module.predeclare( 'Branching2', __dirname + '/branching2a' );
    }
    else if( order === 'prt' )
    {
      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Branching1' ] = { entryPath : __dirname + '/branching1a' };
      _.module._modulesToPredeclare[ 'Branching2' ] = { entryPath : __dirname + '/branching2a' };
      require( './branching1a' );
      require( './branching2a' );
      _ = require( toolsPath );
    }

    console.log( 'main.after / isIncluded( Branching1 )', _.module.isIncluded( 'Branching1' ) );
    console.log( 'main.after / isIncluded( Branching2 )', _.module.isIncluded( 'Branching2' ) );

    var files = [ ... _.module.withName( 'Branching1' ).files.keys() ].sort();
    console.log( `Branching1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Branching2' ).files.keys() ].sort();
    console.log( `Branching2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function mainBranchingAfter2()
  {

    if( order === 'trp' )
    {
      _ = require( toolsPath );
      require( './branching2a' );
      require( './branching1a' );
      _.module.predeclare( 'Branching1', __dirname + '/branching1a' );
      _.module.predeclare( 'Branching2', __dirname + '/branching2a' );
    }
    else if( order === 'rtp' )
    {
      require( './branching2a' );
      require( './branching1a' );
      _ = require( toolsPath );
      _.module.predeclare( 'Branching1', __dirname + '/branching1a' );
      _.module.predeclare( 'Branching2', __dirname + '/branching2a' );
    }
    else if( order === 'prt' )
    {
      let g = get();
      _ = g.wTools = g.wTools || Object.create( null );
      _.module = _.module || Object.create( null );
      _.module._modulesToPredeclare = _.module._modulesToPredeclare || Object.create( null );
      _.module._modulesToPredeclare[ 'Branching1' ] = { entryPath : __dirname + '/branching1a' };
      _.module._modulesToPredeclare[ 'Branching2' ] = { entryPath : __dirname + '/branching2a' };
      require( './branching2a' );
      require( './branching1a' );
      _ = require( toolsPath );
    }

    console.log( 'main.after / isIncluded( Branching1 )', _.module.isIncluded( 'Branching1' ) );
    console.log( 'main.after / isIncluded( Branching2 )', _.module.isIncluded( 'Branching2' ) );

    var files = [ ... _.module.withName( 'Branching1' ).files.keys() ].sort();
    console.log( `Branching1\n  ${files.join( '\n  ' )}` );
    var files = [ ... _.module.withName( 'Branching2' ).files.keys() ].sort();
    console.log( `Branching2\n  ${files.join( '\n  ' )}` );
    var orphans = [ ... _.module.filesMap.values() ].filter( ( file ) => !file.module ).map( ( file ) => file.sourcePath );
    console.log( `orphans\n  ${orphans.join( '\n  ' )}` );

  }

  /* - */

  function branching1a()
  {
    console.log( 'branching1a' );
    require( './branching1b' );
  }

  /* - */

  function branching1b()
  {
    console.log( 'branching1b' );
    require( './branchingCommon' );
    require( './branching2b' );
  }

  /* - */

  function branching2a()
  {
    console.log( 'branching2a' );
    require( './branching2b' );
  }

  /* - */

  function branching2b()
  {
    console.log( 'branching2b' );
    require( './branchingCommon' );
    require( './branching1b' );
  }

  /* - */

  function branchingCommon()
  {
    console.log( 'branchingCommon' );
  }

  /* - */

}

predeclarePrime.timeOut = 60000;

//

function predeclareRelative( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `full relative path, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainWithFullPath );
      a.program
      ({
        routine : module1,
        dirPath : 'node_modules',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main
module1
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `require name, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainWithRequireName );
      a.program
      ({
        routine : module1,
        dirPath : 'node_modules',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main
module1
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

  }

  /* - */

  function mainWithFullPath()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    console.log( 'main' );
    _.module.predeclare({ name : 'Mod1', entryPath : __dirname + '/node_modules/module1' } );
    _.include( 'Mod1' );
  }

  /* - */

  function mainWithRequireName()
  {
    console.log( 'main' );
    require( 'module1' );
  }

  /* - */

  function module1()
  {
    console.log( 'module1' );
  }

  /* - */

}

//

function predeclareAbsolute( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `assumption, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainAssuption );
      a.program
      ({
        routine : file1,
        dirPath : 'node_modules',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main
file1
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainProperCasedModule );
      a.program
      ({
        routine : file1,
        dirPath : 'node_modules',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main
file1
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `upper cased module, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainUpperCasedModule );
      a.program
      ({
        routine : file1,
        dirPath : 'node_modules',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`= Message of error#1
    Cant resolve module::MOD1.
    Looked at:
     - MOD1`
      test.nil( op.exitCode, 0 );
      test.true( _.strHas( op.output, exp ) );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `lower cased module, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainLowerCasedModule );
      a.program
      ({
        routine : file1,
        dirPath : 'node_modules',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`= Message of error#1
    Cant resolve module::mod1.
    Looked at:
     - mod1`
      test.nil( op.exitCode, 0 );
      test.true( _.strHas( op.output, exp ) );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `upper cased include, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainUpperCaseInclude );
      a.program
      ({
        routine : file1,
        dirPath : 'node_modules',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main
file1
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `relative, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( mainRelative );
      a.program
      ({
        routine : file1,
        dirPath : 'dir1',
      });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main
file1
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

  }

  /* - */

  function mainAssuption()
  {
    console.log( 'main' );
    require( 'file1' );
  }

  /* - */

  function mainProperCasedModule()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    console.log( 'main' );
    _.module.predeclare({ name : 'Mod1', entryPath : 'file1' } );
    _.include( 'Mod1' );
  }

  /* - */

  function mainUpperCasedModule()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    console.log( 'main' );
    _.module.predeclare({ name : 'Mod1', entryPath : 'file1' } );
    _.include( 'MOD1' );
  }

  /* - */

  function mainLowerCasedModule()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    console.log( 'main' );
    _.module.predeclare({ name : 'Mod1', entryPath : 'file1' } );
    _.include( 'mod1' );
  }

  /* - */

  function mainUpperCaseInclude()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    console.log( 'main' );
    _.include( 'FILE1' );
  }

  /* - */

  function mainRelative()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    console.log( 'main' );
    _.module.predeclare({ name : 'Mod1', entryPath : './dir1/file1' } );
    _.include( 'Mod1' );
  }

  /* - */

  function file1()
  {
    console.log( 'file1' );
  }

  /* - */

}

predeclareAbsolute.description =
`
  - assumed npm can find file with relative path without dot if such put in node_modules directory
  - it is possible to declare module with name of file ( not absolute path )
  - include with upper-cased name of module cant find the module
  - but include of upper-cased name of npm module works
  - delcaring of module with relative entry path based on path of the current module file
`

//

function predeclareRedeclaring( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( main1 );
      a.program( file1 );
      a.program( file2 );

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
main
file1
file2
./main1 : {- ModuleFile ./main1 -}
  modules
    {- Module Module1 -}
  upFiles
    {- ModuleFile ${_.module.toolsPathGet()} -}
    {- ModuleFile ./file1 -}
    {- ModuleFile ./file2 -}
./file1 : {- ModuleFile ./file1 -}
  modules
    {- Module Module1 -}
  downFiles
    {- ModuleFile ./main1 -}
    {- ModuleFile ./file2 -}
./file2 : {- ModuleFile ./file2 -}
  modules
    {- Module Module1 -}
  downFiles
    {- ModuleFile ./main1 -}
  upFiles
    {- ModuleFile ./file1 -}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

  }

  /* - */

  function main1()
  {
    console.log( 'main' );
    const _ = require( toolsPath );

    _.module.predeclare
    ({
      alias : [ 'Module1', 'module1' ],
      entryPath : __filename,
    });

    require( './file1' );
    require( './file2' );

    log( './main1' );
    log( './file1' );
    log( './file2' );

    function log( filePath )
    {
      let moduleFile = _.module.fileWith( filePath );
      if( !moduleFile )
      return console.log( `${filePath} : ${moduleFile}` );
      let output = _.module.fileExportString( moduleFile, { verbosity : 2 } );
      output = _.strReplace( output, _.path.normalize( __dirname ), '.' );
      console.log( `${filePath} : ${output}` );
    }

  }

  /* - */

  function file1()
  {
    console.log( 'file1' );
  }

  /* - */

  function file2()
  {
    console.log( 'file2' );
    const _ = require( toolsPath );

    require( './file1' );

    _.module.predeclare
    ({
      alias : [ 'Module1', 'module1' ],
      entryPath : __filename,
    });

  }

  /* - */

}

predeclareRedeclaring.description =
`
  - redeclaring of module does not thow any error
  - module graph is proper after redeclaring
`

//

function predeclareRedeclaringSharedFile( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({ after : 0 });
  act({ after : 1 });

  return ready;

  /* - */

  function act( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `without redeclaring, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : module1, locals : _.props.extend( null, env, { withRedeclaring : 0 } ) });
      a.program({ routine : module2, locals : _.props.extend( null, env, { withRedeclaring : 0 } ) });
      a.program({ routine : file1, locals : _.props.extend( null, env, { withRedeclaring : 0 } ) });
      a.program({ routine : file2, locals : _.props.extend( null, env, { withRedeclaring : 0 } ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
module1
file1
module2
file2
./module1 : {- ModuleFile ./module1 -}
  modules
    {- Module Module1 -}
  upFiles
    {- ModuleFile ${_.module.toolsPathGet()} -}
    {- ModuleFile ./file1 -}
    {- ModuleFile ./module2 -}
./module2 : {- ModuleFile ./module2 -}
  modules
    {- Module Module2 -}
  downFiles
    {- ModuleFile ./module1 -}
  upFiles
    {- ModuleFile ./file2 -}
    {- ModuleFile ./file1 -}
./file1 : {- ModuleFile ./file1 -}
  modules
    {- Module Module1 -}
    {- Module Module2 -}
  downFiles
    {- ModuleFile ./module1 -}
    {- ModuleFile ./module2 -}
./file2 : {- ModuleFile ./file2 -}
  modules
    {- Module Module2 -}
  downFiles
    {- ModuleFile ./module2 -}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

    ready.then( () =>
    {
      test.case = `without redeclaring, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program({ routine : module1, locals : _.props.extend( null, env, { withRedeclaring : 1 } ) });
      a.program({ routine : module2, locals : _.props.extend( null, env, { withRedeclaring : 1 } ) });
      a.program({ routine : file1, locals : _.props.extend( null, env, { withRedeclaring : 1 } ) });
      a.program({ routine : file2, locals : _.props.extend( null, env, { withRedeclaring : 1 } ) });
      a.program({ routine : file3, locals : _.props.extend( null, env, { withRedeclaring : 1 } ) });

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
`
module1
file1
module2
file2
file3
./module1 : {- ModuleFile ./module1 -}
  modules
    {- Module Module1 -}
  upFiles
    {- ModuleFile ${_.module.toolsPathGet()} -}
    {- ModuleFile ./file1 -}
    {- ModuleFile ./module2 -}
    {- ModuleFile ./file3 -}
./module2 : {- ModuleFile ./module2 -}
  modules
    {- Module Module2 -}
  downFiles
    {- ModuleFile ./module1 -}
  upFiles
    {- ModuleFile ./file2 -}
    {- ModuleFile ./file1 -}
./file1 : {- ModuleFile ./file1 -}
  modules
    {- Module Module1 -}
    {- Module Module2 -}
  downFiles
    {- ModuleFile ./module1 -}
    {- ModuleFile ./module2 -}
    {- ModuleFile ./file3 -}
./file2 : {- ModuleFile ./file2 -}
  modules
    {- Module Module2 -}
  downFiles
    {- ModuleFile ./module2 -}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

    /* */

  }

  /* - */

  function module1()
  {
    console.log( 'module1' );
    const _ = require( toolsPath );

    _.module.predeclare
    ({
      alias : [ 'Module1', 'module1' ],
      entryPath : __filename,
    });

    require( './file1' );
    require( './module2' );

    if( withRedeclaring )
    require( './file3' );

    log( './module1' );
    log( './module2' );
    log( './file1' );
    log( './file2' );

    function log( filePath )
    {
      let moduleFile = _.module.fileWith( filePath );
      if( !moduleFile )
      return console.log( `${filePath} : ${moduleFile}` );
      let output = _.module.fileExportString( moduleFile, { verbosity : 2 } );
      output = _.strReplace( output, _.path.normalize( __dirname ), '.' );
      console.log( `${filePath} : ${output}` );
    }

  }

  /* - */

  function file1()
  {
    console.log( 'file1' );
  }

  /* - */

  function module2()
  {
    console.log( 'module2' );
    let _ = _global_.wTools;

    if( !after )
    _.module.predeclare
    ({
      name : 'Module2',
      entryPath : __filename,
    });

    require( './file2' );
    require( './file1' );

    if( after )
    _.module.predeclare
    ({
      name : 'Module2',
      entryPath : __filename,
    });

  }

  /* - */

  function file2()
  {
    console.log( 'file2' );

  }

  /* - */

  function file3()
  {
    console.log( 'file3' );
    const _ = require( toolsPath );

    require( './file1' );

    _.module.predeclare
    ({
      alias : [ 'Module1', 'module1' ],
      entryPath : __filename,
    });

  }

  /* - */

}

predeclareRedeclaringSharedFile.description =
`
  - redeclaring of module does not unshare shared module file
`

//

function moduleIsIncluded( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  let start = __.process.starter
  ({
    outputCollecting : 1,
    outputPiping : 1,
    inputMirroring : 1,
    throwingExitCode : 0,
    mode : 'fork',
  });

  test.true( _.module.isIncluded( 'wTesting' ) );
  test.true( !_.module.isIncluded( 'abcdef123' ) );

  act({ routine : _programWithRequire });
  act({ routine : _programWithIncludeLower });
  act({ routine : _programWithIncludeUpper });

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      let program = __.program.write
      ({
        routine : env.routine,
        withSubmodules : 1,
        moduleFile : _.module.fileWith( 0 ),
        tempPath : a.abs( '.' ),
      });

      console.log( _.strLinesNumber( program.sourceCode ) );

      return start
      ({
        execPath : program.programPath,
        currentPath : _.path.dir( program.programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
  `
isIncluded( wLooker ) false
isIncluded( wlooker ) false
isIncluded( wLooker ) true
isIncluded( wlooker ) true
  `
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function _programWithRequire()
  {
    const _ = require( toolsPath );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
    _.include( 'wLooker' );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
  }

  /* - */

  function _programWithIncludeLower()
  {
    const _ = require( toolsPath );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
    _.include( 'wlooker' );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
  }

  /* - */

  function _programWithIncludeUpper()
  {
    const _ = require( toolsPath );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
    _.include( 'WLOOKER' );
    console.log( 'isIncluded( wLooker )', _.module.isIncluded( 'wLooker' ) );
    console.log( 'isIncluded( wlooker )', _.module.isIncluded( 'wlooker' ) );
  }

  /* - */

}

//

function moduleResolveFromAnotherGlobal( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    /* */

    ready.then( () =>
    {
      test.case = `throwing, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( main1 );

      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {
      test.identical( op.exitCode, 0 );

      var exp =
`
_.module.resolve( Main1 ) : ${ a.abs( 'main1' ) }
__.module.resolve( Main1 ) : undefined
_.module.resolve( Main1 ) : ${ a.abs( 'main1' ) }
__.module.resolve( Main1 ) : ${ a.abs( 'main1' ) }
`
      test.equivalent( op.output, exp );

      return op;
    });

    /* */

  }

  /* - */

  function main1()
  {
    const _ = require( toolsPath );
    let __ = _.include( 'wTesting' );

    _.module.predeclare
    ({
      name : 'Main1',
      entryPath : __filename,
    });
    console.log( `_.module.resolve( Main1 ) : ${_.module.resolve( 'Main1' )}` );
    console.log( `__.module.resolve( Main1 ) : ${__.module.resolve( 'Main1' )}` );

    __.module.predeclare
    ({
      name : 'Main1',
      entryPath : __filename,
    });
    console.log( `_.module.resolve( Main1 ) : ${_.module.resolve( 'Main1' )}` );
    console.log( `__.module.resolve( Main1 ) : ${__.module.resolve( 'Main1' )}` );
  }

  /* - */

}

moduleResolveFromAnotherGlobal.description =
`
- global namespace::testing have its own space of modules, so __.module.resolve will throw error, unless this special case is handled somehow
- if error not throwen then __.module.resolve after declaration of module should give correct path
`

//

/* xxx : move the test to introspector */
function programWriteOptionWithSubmodule( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  let start = __.process.starter
  ({
    outputCollecting : 1,
    outputPiping : 1,
    inputMirroring : 1,
    throwingExitCode : 0,
    mode : 'fork',
  });

  act({});

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      let program = __.program.write
      ({
        routine : env.routine,
        moduleFile : _.module.fileWith( 0 ),
        withSubmodules : 1,
      });

      return start
      ({
        execPath : program.programPath,
        currentPath : _.path.dir( program.programPath ),
      })
    })
    .then( ( op ) =>
    {
      var exp =
  `
  isIncluded( wTesting ) false
  isIncluded( wTesting ) true
  `
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function mainRegisterBefore()
  {
    const _ = require( toolsPath );
    let ModuleFileNative = require( 'module' );
    console.log( 'main / before / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'main / before / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );
    require( 'dir/programRoutine1' );
    console.log( 'main / after / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'main / after / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );
  }

  /* - */

  function programRoutine1()
  {
    const _ = _global_.wTools;
    console.log( 'programRoutine1 / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'programRoutine1 / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );
    require( '../programRoutine2' );
  }

  /* - */

  function programRoutine2()
  {
    const _ = _global_.wTools;
    console.log( 'programRoutine2 / isIncluded( Program1 )', _.module.isIncluded( 'Program1' ) );
    console.log( 'programRoutine2 / isIncluded( Program2 )', _.module.isIncluded( 'Program2' ) );
  }

  /* - */

}

//

function programInheritedModuleFilePaths( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;

      var programPath = a.program( programRoutine1 );
      a.program( programRoutine2 );
      a.program({ routine : program3, dirPath : 'dir', });
      return a.forkNonThrowing
      ({
        execPath : programPath,
        currentPath : _.path.dir( programPath ),
      })
    })
    .then( ( op ) =>
    {

      var exp =
`
programRoutine1.paths
  ${trailOf( __dirname, a.abs( '.' ) )}
programRoutine2.paths
  ${trailOf( __dirname, a.abs( '.' ) )}
program3.paths
  ${trailOf( __dirname, a.abs( 'dir' ) )}
`
      test.identical( op.exitCode, 0 );
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function programRoutine1()
  {
    console.log( `programRoutine1.paths\n  ${module.paths.join( '\n  ' )}` );
    require( './programRoutine2' );
  }

  /* - */

  function programRoutine2()
  {
    console.log( `programRoutine2.paths\n  ${module.paths.join( '\n  ' )}` );
    require( './dir/program3' );
  }

  /* - */

  function program3()
  {
    console.log( `program3.paths\n  ${module.paths.join( '\n  ' )}` );
  }

  /* - */

  function trailOf()
  {
    let result = [];
    for( let a = arguments.length-1 ; a >= 0 ; a-- )
    {
      let filePath = arguments[ a ];
      let trace = __.path.traceToRoot( filePath );
      if( process.platform === 'win32' )
      trace.splice( 0, 1 );
      _.arrayPrependArrayOnce( result, __.path.s.nativize( __.path.s.join( trace, 'node_modules' ) ).reverse() );
    }
    return '  ' + result.join( '\n  ' );
  }

  /* - */

}

/* xxx : duplicate test routine in module::wIntrospectorBasics */
programInheritedModuleFilePaths.description =
`
program should inherit path of parent
`

//

/* xxx : duplicate test routine in module::wIntrospectorBasics */
function programLocalsChanging( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({ tools : 'testing' });
  // act({ tools : 'real' });
  // xxx : switch on in introspector

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;
      const tools = _globals_[ env.tools ].wTools;

      var locals = { local1 : { a : 1 } };
      var program1 = tools.program.write
      ({
        routine : programRoutine1,
        tempPath : a.abs( '.' ),
        locals,
      });
      test.true( _.aux.is( program1.locals ) );
      test.true( program1.locals.a === locals.a );
      test.true( program1.locals === locals );
      locals.local1 = { a : 2 };
      var program2 = tools.program.write
      ({
        routine : programRoutine2,
        tempPath : a.abs( '.' ),
        locals,
      });
      test.true( _.aux.is( program2.locals ) );
      test.true( program2.locals.a === locals.a );
      test.true( program2.locals === locals );
      locals.local1 = { a : 3 };

      return a.forkNonThrowing
      ({
        execPath : [ program1.programPath, program2.programPath ],
        currentPath : program1.tempPath,
      });
    })
    .then( ( op ) =>
    {
      test.identical( op.exitCode, 0 );

      var exp = `programRoutine1.local1.a : 1`;
      test.equivalent( op.sessions[ 0 ].output, exp );

      var exp = `programRoutine2.local1.a : 2`;
      test.equivalent( op.sessions[ 1 ].output, exp );

      return op;
    });

  }

  /* - */

  function programRoutine1()
  {
    console.log( `programRoutine1.local1.a : ${local1.a}` );
  }

  /* - */

  function programRoutine2()
  {
    console.log( `programRoutine2.local1.a : ${local1.a}` );
  }

  /* - */

}

programLocalsChanging.description =
`
  - changing of locals after call of write does not has impact on written program
  - program.write does not clone lolcals map
`

//

/* xxx : duplicate test routine in module::wIntrospectorBasics */
/* xxx : in module::wIntrospectorBasic evolve exporting of locas and cover it.
  - make possible exporting of more complex structures
  - make possible exporting into global
*/

function programOptionLocalsRoutines( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ready = __.take( null );

  act({});

  return ready;

  /* - */

  function act( env )
  {

    ready.then( () =>
    {
      test.case = `basic, ${__.entity.exportStringSolo( env )}`;
      const tools = __;
      // const tools = _; /* xxx : use in introspector */

      var locals = { a : 1, routine1 };
      var program1 = tools.program.write
      ({
        routine : programRoutine1,
        tempPath : a.abs( '.' ),
        locals,
      });
      test.true( _.aux.is( program1.locals ) );

      return a.forkNonThrowing
      ({
        execPath : program1.programPath,
        currentPath : program1.tempPath,
      });
    })
    .then( ( op ) =>
    {
      test.identical( op.exitCode, 0 );
      var exp =
`
programRoutine1.a : 1
routine1.a : 1
`;
      test.equivalent( op.output, exp );
      return op;
    });

  }

  /* - */

  function programRoutine1()
  {
    console.log( `programRoutine1.a : ${a}` );
    routine1();
  }

  /* - */

  function routine1()
  {
    console.log( `routine1.a : ${a}` );
  }

  /* - */

}

programOptionLocalsRoutines.description =
`
  - basic passing routines in locals map make possible to call it in program
`

//

function selfFindAssumption( test )
{
  let context = this;
  let a = test.assetFor( false );

  programWrite( '.', programRoutine1, 'programRoutine1' );
  programWrite( 'dir1/dir2', programRoutine2, 'programRoutine2' );
  programWrite( 'dir1/node_modules', program3a, 'program3' );
  programWrite( 'node_modules', program3b, 'program3' );

  return a.fork({ execPath : a.abs( 'programRoutine1' ) })
  .then( ( op ) =>
  {
    var exp =
`
programRoutine1
programRoutine2
program3a
`
    test.equivalent( op.output, exp );
    test.identical( op.exitCode, 0 );
    return op;
  });

  /* */

  function programWrite( dirPath, program, name )
  {
    var postfix =
    `
    ${program.name}();
    `
    __.fileProvider.fileWrite( a.abs( dirPath, name ), program.toString() + postfix );
  }

  /* */

  function programRoutine1()
  {
    console.log( 'programRoutine1' );
    require( './dir1/dir2/programRoutine2' );
  }

  /* */

  function programRoutine2()
  {
    console.log( 'programRoutine2' );
    require( 'program3' );
  }

  /* */

  function program3a()
  {
    console.log( 'program3a' );
    require( 'program3' );
  }

  /* */

  function program3b()
  {
    console.log( 'program3b' );
  }

  /* */

}

selfFindAssumption.description =
`
  - include of a file with the same name as itself from node_modules dir does not find it, but find itself
`

//

function localPathAssumption( test )
{
  let context = this;
  let a = test.assetFor( false );

  programWrite( programRoutine1 );
  programWrite( programRoutine2 );
  programWrite( program3 );

  return a.fork({ execPath : a.abs( 'programRoutine1' ) })
  .then( ( op ) =>
  {
    var exp =
`
programRoutine1.before.paths
  ${trailOf( a.abs( '.' ) )}
  /pro
programRoutine2.before.paths
  ${trailOf( a.abs( '.' ) )}
  /programRoutine2/local
program3.paths
  ${trailOf( a.abs( '.' ) )}
  /program3/local
programRoutine2.after.paths
  ${trailOf( a.abs( '.' ) )}
  /programRoutine2/local
programRoutine1.after.paths
  ${trailOf( a.abs( '.' ) )}
  /pro
`
    test.equivalent( op.output, exp );
    test.identical( op.exitCode, 0 );
    return op;
  });

  /* */

  function programWrite( program )
  {
    var postfix =
    `
    ${program.name}();
    `
    __.fileProvider.fileWrite( a.abs( program.name ), program.toString() + postfix );
  }

  /* */

  function programRoutine1()
  {
    module.paths.push( '/pro' );
    console.log( `programRoutine1.before.paths\n  ${module.paths.join( '\n  ' )}` );
    require( './programRoutine2' );
    console.log( `programRoutine1.after.paths\n  ${module.paths.join( '\n  ' )}` );
  }

  /* */

  function programRoutine2()
  {
    module.paths.push( '/programRoutine2/local' );
    console.log( `programRoutine2.before.paths\n  ${module.paths.join( '\n  ' )}` );
    require( './program3' );
    console.log( `programRoutine2.after.paths\n  ${module.paths.join( '\n  ' )}` );
  }

  /* */

  function program3()
  {
    module.paths.push( '/program3/local' );
    console.log( `program3.paths\n  ${module.paths.join( '\n  ' )}` );
  }

  /* - */

  function trailOf()
  {
    let result = [];
    for( let a = arguments.length-1 ; a >= 0 ; a-- )
    {
      let filePath = arguments[ a ];
      let trace = __.path.traceToRoot( filePath );
      if( process.platform === 'win32' )
      trace.splice( 0, 1 );
      _.arrayPrependArrayOnce( result, __.path.s.nativize( __.path.s.join( trace, 'node_modules' ) ).reverse() );
    }
    return '  ' + result.join( '\n  ' );
  }

  /* */

}

localPathAssumption.description =
`
  - verify assumption about inheritance of local paths of module files of NPM
`

//

function globalPathAssumption( test )
{
  let context = this;
  let a = test.assetFor( false );
  let ModuleFileNative = require( 'module' );

  programWrite( programRoutine1 );
  programWrite( programRoutine2 );
  programWrite( program3 );

  return a.fork({ execPath : a.abs( 'programRoutine1' ) })
  .then( ( op ) =>
  {
    var exp =
`
programRoutine1.before.globalPaths
  ${ModuleFileNative.globalPaths.join( '\n' )}
  /programRoutine1/global
programRoutine2.before.globalPaths
  ${ModuleFileNative.globalPaths.join( '\n' )}
  /programRoutine1/global
  /programRoutine2/global
program3.globalPaths
  ${ModuleFileNative.globalPaths.join( '\n' )}
  /programRoutine1/global
  /programRoutine2/global
  /program3/global
programRoutine2.after.globalPaths
  ${ModuleFileNative.globalPaths.join( '\n' )}
  /programRoutine1/global
  /programRoutine2/global
  /program3/global
programRoutine1.after.globalPaths
  ${ModuleFileNative.globalPaths.join( '\n' )}
  /programRoutine1/global
  /programRoutine2/global
  /program3/global
`
    test.equivalent( op.output, exp );
    test.identical( op.exitCode, 0 );
    return op;
  });

  /* */

  function programWrite( program )
  {
    var postfix =
    `
    ${program.name}();
    `
    __.fileProvider.fileWrite( a.abs( program.name ), program.toString() + postfix );
  }

  /* */

  function programRoutine1()
  {
    let ModuleFileNative = require( 'module' );
    ModuleFileNative.globalPaths.push( '/programRoutine1/global' );
    console.log( `programRoutine1.before.globalPaths\n  ${ModuleFileNative.globalPaths.join( '\n  ' )}` );
    require( './programRoutine2' );
    console.log( `programRoutine1.after.globalPaths\n  ${ModuleFileNative.globalPaths.join( '\n  ' )}` );
  }

  /* */

  function programRoutine2()
  {
    let ModuleFileNative = require( 'module' );
    ModuleFileNative.globalPaths.push( '/programRoutine2/global' );
    console.log( `programRoutine2.before.globalPaths\n  ${ModuleFileNative.globalPaths.join( '\n  ' )}` );
    require( './program3' );
    console.log( `programRoutine2.after.globalPaths\n  ${ModuleFileNative.globalPaths.join( '\n  ' )}` );
  }

  /* */

  function program3()
  {
    let ModuleFileNative = require( 'module' );
    ModuleFileNative.globalPaths.push( '/program3/global' );
    console.log( `program3.globalPaths\n  ${ModuleFileNative.globalPaths.join( '\n  ' )}` );
  }

  /* */

}

globalPathAssumption.description =
`
  - verify assumption about inheritance of global paths of module files of NPM
`

//

function experiment( test )
{
  test.true( true );
}

experiment.experimental = 1;

//

function requireThirdPartyModule( test )
{
  let a = test.assetFor( false );

  let _ToolsPath_ = a.path.nativize( _.module.toolsPathGet() );
  let programRoutine1Path = a.program({ routine : programRoutine1, locals : { _ToolsPath_ } });

  let structure = { dependencies : { chalk : '4.1.1' } };
  a.fileProvider.fileWrite({ filePath : a.abs( 'package.json' ), data : structure, encoding : 'json' });

  /* */

  a.shell( `npm i --production` )
  a.appStartNonThrowing({ execPath : programRoutine1Path })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, 'nhandled' ), 0 );
    test.identical( _.strCount( op.output, 'error' ), 0 );
    test.identical( _.strCount( op.output, 'programRoutine1.begin' ), 1 );
    test.identical( _.strCount( op.output, 'programRoutine1.end' ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function programRoutine1()
  {
    console.log( 'programRoutine1.begin' )

    require( _ToolsPath_ );
    require( 'chalk' );

    console.log( 'programRoutine1.end' )
  }

}

// --
// test suite definition
// --

const Proto =
{

  name : 'Tools.Module.l0.l9',
  silencing : 1,
  routineTimeOut : 30000,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    suiteTempPath : null,
    assetsOriginalPath : null,
    appJsPath : null,
  },

  tests :
  {

    modulePredeclareBasic,
    modulePredeclareBasic2,
    moduleExportsUndefined,
    resolveBasic,
    toolsPathGetBasic,
    toolsPathGetProgram,

    modulingLogistic,
    modulingNativeIncludeErrors,
    modulingSourcePathValid,
    modulingGlobalNamespaces,
    preload,
    preloadIncludeModule,

    /* xxx : rename predeclare -> declare */
    predeclareBasic,
    predeclarePrime,
    predeclareRelative,
    predeclareAbsolute,
    predeclareRedeclaring,
    predeclareRedeclaringSharedFile,

    moduleIsIncluded,
    moduleResolveFromAnotherGlobal,

    programInheritedModuleFilePaths,
    programLocalsChanging,
    programOptionLocalsRoutines,

    selfFindAssumption,
    localPathAssumption,
    globalPathAssumption,
    experiment,

    requireThirdPartyModule

  }

}

/*
xxx : test to include file which does not exist to reproduce problem of throwing assert:
_.assert( native === moduleFile.native );
*/

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
