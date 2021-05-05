( function _l7_Module_s_()
{

'use strict';

//

const _global = _global_;
const _ = _global_.wTools;
const __ = _realGlobal_.wTools;
let ModuleFileNative = null;

let __fileNativeInclude;
if( typeof require !== 'undefined' )
__fileNativeInclude = require;
else if( typeof importScripts !== 'undefined' )
__fileNativeInclude = importScripts;
else if( _global._remoteRequire )
__fileNativeInclude = _global._remoteRequire;

const hasModuleFileDescriptor = !( typeof module === 'undefined' );
const Self = _.module = _.module || Object.create( null );
__.module = __.module || Object.create( null );

/* = concepts

Module
ModuleFile
EntryFile
ModulesEnvironment

*/

// --
// Module methods
// --

function moduleExportString()
{
  return `{- ${this.constructor.name} ${this.name} -}`;
}

// --
// Module File methods
// --

function moduleFileExportString()
{
  return `{- ${this.constructor.name} ${this.sourcePath} -}`;
}

//

function moduleFileReturnedGet()
{
  if( !this.native )
  return;
  return this.native.exports;
}

// xxx : use later
// //
//
// function ModuleFileReturnedSet( val )
// {
//   if( !this.native )
//   return;
//   return this.native.exports = val;
// }

// --
// module
// --

function is( src )
{
  if( !src )
  return false;
  if( Reflect.hasOwnProperty( src, 'constructor' ) )
  return false;
  // if( !Reflect.has( src, 'constructor' ) )
  // return false;
  return src[ ModuleSymbol ] === true;
}

//

/* xxx : cover */
function _with( name )
{
  let module = _.module.withName( name );
  if( module )
  return module;
  module = _.module.withPath( name );
  return module;
}

//

/* xxx : cover */
function withName( name )
{
  let module = _.module.modulesMap.get( name );
  if( !module )
  return null;
  return module;
}

//

/* xxx : cover */
function withPath( filePath )
{
  let normalizedPath = _.path.canonize( filePath );
  let file = _.module.filesMap.get( normalizedPath );
  if( !file )
  return null;
  return file.module;
}

//

function predeclare_head( routine, args )
{

  let o = args[ 0 ]
  if( _.strIs( args[ 0 ] ) )
  o = { name : args[ 0 ], entryPath : ( args.length > 1 ? args[ 1 ] : null ) }

  _.routine.options( routine, o );

  if( _.strIs( o.alias ) )
  o.alias = [ o.alias ];
  else if( o.alias === null )
  o.alias = [];

  if( !o.name )
  o.name = o.alias[ 0 ];

  o.entryPath = _.arrayAs( o.entryPath );
  // o.entryPath = o.entryPath.map( ( path ) => _.path.canonize( path ) );

  _.assert( _.arrayIs( o.alias ) );
  _.assert( _.strDefined( o.name ) );
  _.assert( _.mapIs( o ) );
  _.assert( o.files === undefined );

  return o;
}

//

function predeclare_body( o )
{

  _.arrayPrependOnce( o.alias, o.name );
  // o.entryPath = _.arrayAs( o.entryPath );
  _.assert( _.arrayIs( o.entryPath ) );

  o.entryPath.forEach( ( entryPath, i ) =>
  {
    if( _.path.isDotted( entryPath ) )
    {
      if( o.basePath === null )
      o.basePath = _.path.dir( _.introspector.location({ level : 4 }).filePath );
      /* xxx : use _.introspector.dirPath */
      /* xxx : qqq : make sure _.introspector.location works properly for built-in routines ( without files ) */
      _.assert( _.strDefined( o.basePath ), '{-o.basePath-} is required if path is relative' );
      entryPath = o.entryPath[ i ] = _.path.canonize( o.basePath + '/' + entryPath );
    }
    else
    {
      let normalized = _.path.canonize( entryPath );
      if( _.path.isAbsolute( normalized ) )
      entryPath = o.entryPath[ i ] = normalized;
    }

    if( _.path.isAbsolute( entryPath ) )
    {
      let module2 = _.module.predeclaredWithEntryPathMap.get( entryPath );
      _.assert
      (
        !module2 || module2.name === o.name,
        () => `Module ${o.name} is trying to register entry path ${entryPath} which is registered for ${module2}`
      );
      _.module.predeclaredWithEntryPathMap.set( entryPath, o );
    }
    else
    {
      _.assert( !_.path.isDotted( entryPath ) );
      let module2 = _.module.predeclaredWithEntryPathMap.get( entryPath );
      _.assert
      (
        !module2 || module2.name === o.name,
        () => `Module ${o.name} is trying to register entry path ${entryPath} which is registered for ${module2}`
      );
      _.module.predeclaredWithEntryPathMap.set( entryPath, o );
    }
  });

  let module2 = _.module.predeclaredWithNameMap.get( o.name );
  if( module2 )
  {
    _.assert( o.name === module2.name );
    _.arrayAppendArrayOnce( module2.entryPath, o.entryPath );
    _.arrayAppendArrayOnce( module2.alias, o.alias );
    _.arrayAppendArrayOnce( module2.filePath, o.entryPath );
    _.arrayAppendArrayOnce( module2.lookPath, o.entryPath );
    _.arrayAppendArrayOnce( module2.lookPath, o.alias );

    register( module2, o.entryPath, o.alias );

    // let files = _.module._filesWhichEnds( o.entryPath )
    let files = _.module._filesWithResolvedPath( o.entryPath )
    _.module._filesUniversalAssociateModule( files, module2, true );

    return module2;
  }

  register( o, o.entryPath, o.alias );

  _.assert( o.files === undefined );
  o.files = null;
  _.assert( o.filePath === undefined );
  o.filePath = o.filePath || [];
  _.arrayAppendArray( o.filePath, o.entryPath );
  _.assert( o.lookPath === undefined );
  o.lookPath = [ ... o.entryPath, ... o.alias ];
  /* xxx : set? */

  delete o.basePath;
  o.status = 0;
  Object.setPrototypeOf( o, _.module.Module.prototype );
  Object.preventExtensions( o );

  // debugger;
  // let files = _.module._filesWhichEnds( o.entryPath )
  let files = _.module._filesWithResolvedPath( o.entryPath )
  _.module._filesUniversalAssociateModule( files, o, true );

  return o;

  function register( module, entryPath, alias )
  {
    entryPath.forEach( ( entryPath ) => _.module.predeclaredWithEntryPathMap.set( entryPath, module ) );
    alias.forEach( ( name ) =>
    {
      let module3 = _.module.predeclaredWithNameMap.get( name );
      _.assert( module3 === undefined || module3 === module );
      _.module.predeclaredWithNameMap.set( name, module );
    });
  }
}

predeclare_body.defaults =
{
  name : null,
  alias : null,
  entryPath : null,
  basePath : null,
}

const predeclare = _.routine.unite( predeclare_head, predeclare_body );

//

function predeclareAll( o )
{

  _.assert( arguments.length === 1 );
  _.assert( _.mapIs( o.modules ) );
  _.routine.options( predeclareAll, arguments );

  for( let k in o.modules )
  {
    let module = o.modules[ k ];
    _.assert( module.name === k || module.name === undefined );
    _.assert( _.mapIs( module ) );
    module.name = k;
    if( !module.basePath )
    module.basePath = o.basePath;
    _.module.predeclare( module );
    delete o.modules[ k ];
  }

}

predeclareAll.defaults =
{
  modules : null,
  basePath : null,
}

//

function _predeclaredWithEntryPath( entryPath )
{
  let predeclaredModule = _.module.predeclaredWithEntryPathMap.get( entryPath );
  if( predeclaredModule )
  return predeclaredModule;
}

// --
// file
// --

/* qqq xxx : cover */
function fileIs( src )
{
  if( !src )
  return false;
  if( !src.constructor )
  return false;
  if( src.constructor.name === 'ModuleFile' )
  return true;
  if( src instanceof ModuleFileNative );
  return true;
  return false;
}

//

/* qqq : cover please */
function fileExportString( file, o )
{

  _.assert( _.module.fileUniversalIs( file ), () => `Expects module file, but got ${_.strType( file )}` );
  o = _.routine.options_( fileExportString, o || null );

  if( !o.verbosity )
  return '';

  if( o.verbosity === 1 )
  return String( file );

  let result = String( file );

  if( file.modules.size > 0 )
  result += '\n  modules\n    ' + [ ... file.modules ].join( '\n    ' );
  if( file.downFiles.size > 0 )
  result += '\n  downFiles\n    ' + [ ... file.downFiles ].join( '\n    ' );
  if( file.upFiles.size > 0 )
  result += '\n  upFiles\n    ' + [ ... file.upFiles ].join( '\n    ' );

  return result;
}

fileExportString.defaults =
{
  verbosity : 1,
  it : null,
}

//

function _fileUniversalFinit( file )
{
  _.assert( _.module.fileUniversalIs( file ) );

  file.status = -1;

  file.native.children.forEach( ( nativeFile, index ) =>
  {
    if( nativeFile.universal )
    _.module._fileUniversalDisassociateFile( nativeFile.universal, file );
  });

  file.downFiles.forEach( ( file2 ) =>
  {
    _.module._fileUniversalDisassociateFile( file, file2 );
  });

  _.module._fileUniversalDisassociateModules( file, false );

  if( Config.debug )
  {
    let file2 = _.module.filesMap.get( file.sourcePath );
    _.assert( file2 === undefined || file2 === file );
    _.assert( file.downFiles.size === 0 );
    _.assert( file.upFiles.size === 0 );
    _.assert( file.modules.size === 0 );
  }

  _.module.filesMap.delete( file.sourcePath );
  Object.freeze( file );
}

//

function _fileUniversalFrom( o )
{
  try
  {

    o.sourcePath = _.path.canonize( o.sourcePath ); /* zzz : qqq : optimize */

    let moduleFile2 = _.module.filesMap.get( o.sourcePath );
    if( moduleFile2 )
    {
      debugger; /* xxx : qqq : cover */
      return moduleFile2;
    }

    if( Config.debug )
    verify();

    o.native.universal = o;
    Object.setPrototypeOf( o, _.module.File.prototype );
    _.module.filesMap.set( o.sourcePath, o );

    o.moduleNativeFilesMap = o.moduleNativeFilesMap || _.module.nativeFilesMap;
    o.global = o.global || _global;
    o.error = o.error || null;

    pathsAmend();
    modulesAssociate();
    filesAssociate();

    if( Config.debug )
    validate();

    Object.preventExtensions( o );
    return o;
  }
  catch( err )
  {
    err = _.err( err, `\nError in _.module._fileUniversalFrom of ${o.sourcePath}` );
    throw err;
  }

  /* -

  verify,
  pathsAmend,
  filesAssociate,
  modulesAssociate,
  validate,

  */

  function verify()
  {
    _.assert( o.module === undefined );
    _.assert( o.modules === undefined );
    _.assert( o.downFile === undefined );
    _.assert( o.upFiles === undefined );
    _.assert( _.module.fileNativeIs( o.native ) );
    _.assert( o.native.universal === undefined );
    _.assert( !o.native.universal );
    _.assert( !o.native.moduleNativeFilesMap );
    _.assert
    (
      _.module.nativeFilesMap[ _.path.nativizeMinimal( o.sourcePath ) ] === o.native,
      `Module file ${o.sourcePath} is not in the current module files list`
    );
  }

  /* - */

  function pathsAmend()
  {
    /* qqq : cover */
    if( _.module._prependPath )
    _.arrayPrependArrayOnce( o.native.paths, _.module._prependPath );
    if( _.module._appendPath )
    _.arrayAppendArrayOnce( o.native.paths, _.module._appendPath );
  }

  /* - */

  function filesAssociate()
  {

/*

o.native.id - "/pro/builder/proto/wtools/atop/testing/include/Base.s"
o.native.parent.id - "/pro/builder/proto/wtools/atop/testing/include/Top.s"
xxx : test to check the parent has the child and the child has the parent

o.native.id -- "/pro/builder/proto/wtools/atop/testing/include/Top.s"
xxx : test to check the module file has universal file for each children

*/

    o.downFiles = new Set;

    let parent = _.module.fileNativeParent( o.native );
    if( parent && parent.universal )
    {
      _.module._fileUniversalAssociateFile( o, parent.universal );
    }
    else
    {
      o.downFile = null;
    }

    o.upFiles = new Set;

    o.native.children.forEach( ( file, index ) =>
    {
      if( file.universal )
      {
        _.module._fileUniversalAssociateFile( file.universal, o );
      }
    });

  }

  /* - */

  function modulesAssociate()
  {

    _.assert( o.module === undefined );
    _.assert( o.modules === undefined );

    o.module = null;
    o.modules = new Set();

    let predeclaredModule = _.module._predeclaredWithEntryPath( o.sourcePath );
    if( predeclaredModule )
    {
      _.module._fileUniversalAssociateModule( o, predeclaredModule );
    }

    if( !predeclaredModule )
    if( o.requestedSourcePath === null || _.path.isRelative( o.requestedSourcePath ) )
    {

      let parentNative = _.module.fileNativeParent( o.native );
      let parentModules;
      if
      (
        parentNative
        && parentNative.universal
        && o.moduleNativeFilesMap === parentNative.universal.moduleNativeFilesMap
        && parentNative.universal.module
      )
      {
        _.assert( !!_.module.is( parentNative.universal.module ) );
        _.assert( parentNative.universal.module instanceof _.module.Module );
        _.assert( _.set.is( parentNative.universal.modules ) );
        parentModules = parentNative.universal.modules;
        _.assert( parentModules.size > 0 );
        _.module._fileUniversalAssociateModule( o, parentModules );
      }

    }

  }

  /* - */

  function validate()
  {
    _.assert( o instanceof _.module.File );
    _.assert( _.module.fileIs( o ) );
    _.assert( _.module.fileUniversalIs( o ) );
    _.assert( o.module !== undefined );
  }

  /* - */

}

_fileUniversalFrom.defaults =
{
  sourcePath : null,
  nativeSourcePath : null,
  requestedSourcePath : null,
  native : null,
  moduleNativeFilesMap : null,
  error : null,
  global : null,
  status : null,
}

//

function _filesUniversalFrom( o )
{
  let visited = new Set;
  let stack = [];

  _.routine.options( _filesUniversalFrom, o );
  o.files = _.arrayAs( o.files );
  stack.push( ... o.files );

  for( let i = 0 ; i < stack.length ; i++ )
  up( stack[ i ] );

  while( stack.length )
  down( stack.pop() );

  return visited;

  function up( file )
  {
    if( visited.has( file ) )
    return;
    visited.add( file );

    stack.push( ... file.children );

    _.assert( _.module.fileNativeIs( file ) );

    if( !file.universal && _.module.nativeFilesMap[ file.filename || file.id ] === file )
    _.module._fileUniversalFrom
    ({
      sourcePath : file.filename || file.id,
      nativeSourcePath : file.filename || file.id,
      requestedSourcePath : null,
      native : file,
      status : 2,
    });

  }

  function down( file )
  {

    if( file.universal )
    file.children.forEach( ( file2, index ) =>
    {
      if( file2.universal )
      {
        _.module._fileUniversalAssociateFile( file2.universal, file.universal );
        if( file.universal.moduleNativeFilesMap === _.module.nativeFilesMap && file.universal.module )
        _.module._filesUniversalAssociateModule( file2.universal, file.universal.module, false );
      }
    });

  }

}

_filesUniversalFrom.defaults =
{
  files : null,
}

//

function _fileUniversalAssociateFile( upFile, downFile )
{

  /*
  files could belong to different environments!
  */

  _.assert( _.module.fileUniversalIs( upFile ) );
  _.assert( _.module.fileUniversalIs( downFile) );

  upFile.downFile = upFile.downFile || downFile;
  upFile.downFiles.add( downFile );

  downFile.upFiles.add( upFile );

}

//

function _fileUniversalDisassociateFile( upFile, downFile )
{

  /*
  files could belong to different environments
  */

  _.assert( _.module.fileUniversalIs( upFile ) );
  _.assert( _.module.fileUniversalIs( downFile) );

  upFile.downFiles.delete( downFile );
  if( upFile.downFile === downFile )
  upFile.downFile = [ ... upFile.downFiles ][ 0 ] || null; /* qqq : cover */

  downFile.upFiles.delete( upFile );

}

//

function _fileUniversalAssociateModule( file, module )
{
  let result = 0;

  if( Config.debug )
  {
    _.assert( arguments.length === 2 );
    let module2 = _.module._predeclaredWithEntryPath( file.sourcePath );
    _.assert
    (
      module2 === undefined || module2 === module,
      () => `Attempt to associate ${file} with ${module}, but it is entry of ${module2}`
    );
  }

  if( _.set.is( module ) )
  {
    module.forEach( ( module ) => result += _.module._fileUniversalAssociateModule( file, module ) );
    return result;
  }

  _.assert( _.module.fileUniversalIs( file ) );
  _.assert( _.module.is( module ) );

  file.modules.add( module );
  file.module = file.module || module;

  result += 1;

  module.files = module.files || new HashMap();
  module.files.set( file.sourcePath, file );
  module.alias.forEach( ( name ) =>
  {
    if( Config.debug )
    {
      let module2 = _.module.modulesMap.get( name );
      _.assert( module2 === undefined || module2 === module );
    }
    _.module.modulesMap.set( name, module );
  });

  return result;
}

//

function _fileUniversalDisassociateModules( file, reassociating )
{
  let result = 0;

  if( Config.debug )
  {
    _.assert( arguments.length === 1 || arguments.length === 2 );
    _.assert( _.module.fileUniversalIs( file ) );
  }

  result += file.modules.size;

  if( !file.modules.size )
  return result;

  if( reassociating )
  reassociate();
  else
  deassociate();

  return result;

  function moduleDisassociate( module )
  {
    module.files.delete( file.sourcePath );
    if( module.files.size === 0 )
    debugger; /* xxx : qqq : cover */
    if( module.files.size === 0 )
    module.alias.forEach( ( name ) =>
    {
      debugger; /* xxx : qqq : cover */
      _.module.modulesMap.delete( name );
    });
  }

  function deassociate()
  {
    file.modules.forEach( ( module ) => moduleDisassociate( module ) );
    file.modules.clear();
    file.module = null;
  }

  function reassociate()
  {
    let downModules = new Set();

    file.downFiles.forEach( ( file2 ) => downModules.add( ... file2.modules ) );

    file.modules.forEach( ( module ) =>
    {
      if( !downModules.has( module ) )
      {
        moduleDisassociate( module, downModules );
        file.modules.delete( module );
        if( module === file.module )
        file.module = null;
      }
    });

    if( file.module = null && file.modules.size > 0 )
    {
      debugger; /* xxx : qqq : cover */
      file.module = [ ... file.modules ][ 0 ];
    }

  }

}

//

function _filesUniversalAssociateModule( files, modules, disassociating )
{
  let visited = new Set;
  let stack = [];

  files = _.countable.is( files ) ? files : [ files ];
  stack.push( ... files );

  if( disassociating )
  files.forEach( ( file ) => _.module._fileUniversalDisassociateModules( file, false ) );

  if( Config.debug )
  {
    _.assert( _.module.is( modules ) || _.set.is( modules ) );
    if( _.set.is( modules ) )
    modules.forEach( ( module ) => _.assert( _.module.is( module ) ) );
  }

  if( _.set.is( modules ) )
  {
    while( stack.length )
    modulesAssociate( stack.pop() );
  }
  else
  {
    while( stack.length )
    moduleAssociate( stack.pop() );
  }

  return visited;

  /* - */

  function modulesAssociate( file )
  {
    if( visited.has( file ) )
    return;
    visited.add( file );

    _.assert( _.module.fileUniversalIs( file ) );
    _.assert( _.setIs( file.upFiles ) );

    if( file.moduleNativeFilesMap !== _.module.nativeFilesMap )
    {
      return;
    }

    let module2 = _.module._predeclaredWithEntryPath( file.sourcePath );
    if( module2 && !modules.has( module2 ) )
    return;
    if( module2 && modules.size > 1 )
    _.assert( 0, 'not tested' ); /* xxx qqq : cover and fix */

    if( _.set.identicalShallow( file.modules, modules ) )
    return;

    if( disassociating )
    _.module._fileUniversalDisassociateModules( file, true );

    modules.forEach( ( module ) => singleAssociate( file, module ) );
  }

  /* - */

  function moduleAssociate( file )
  {
    if( visited.has( file ) )
    return;
    visited.add( file );

    let module = modules;

    _.assert( _.module.fileUniversalIs( file ) );
    _.assert( _.setIs( file.upFiles ) );

    if( file.moduleNativeFilesMap !== _.module.nativeFilesMap )
    return;

    let module2 = _.module._predeclaredWithEntryPath( file.sourcePath );
    if( module2 && module2 !== module )
    return;

    if( file.modules.has( module ) )
    {
      if( file.modules.size === 1 || !disassociating )
      return;
    }

    if( disassociating )
    _.module._fileUniversalDisassociateModules( file, true );

    singleAssociate( file, module );
  }

  /* - */

  function singleAssociate( file, module )
  {

    file.upFiles.forEach( ( file2 ) =>
    {
      if( file2 === undefined )
      debugger; /* xxx : qqq : cover */
      if( file2 === undefined )
      return;
      stack.push( file2 );
    });

    _.module._fileUniversalAssociateModule( file, module );
  }

  /* - */

}

// //
//
// function _filesWhichEnds( filePaths )
// {
//   let result = new Set();
//
//   filePaths.forEach( ( filePath ) =>
//   {
//     let file = _.module.filesMap.get( filePath );
//     if( file )
//     result.add( file );
//   });
//
//   return result;
// }

//

function _fileWithResolvedPath( caninicalSourcePath )
{
  _.assert( _.strIs( caninicalSourcePath ) );
  var result = _.module.filesMap.get( caninicalSourcePath );
  return result;
}

//

function _filesWithResolvedPath( caninicalSourcePathCountable )
{
  let result = new Set();
  if( _.strIs( caninicalSourcePathCountable ) )
  caninicalSourcePathCountable = [ caninicalSourcePathCountable ];
  caninicalSourcePathCountable.forEach( ( sourcePath ) =>
  {
    let file = _.module.filesMap.get( sourcePath );
    if( file )
    result.add( file );
  });
  return result;
}

//

function fileWithResolvedPath( sourcePath )
{
  var result = _.module.filesMap.get( _.path.canonize( sourcePath ) );
  return result;
}

//

function fileWith( relativeSourcePath )
{
  let absoluteSourcePath = relativeSourcePath;

  if( _.numberIs( relativeSourcePath ) )
  {
    _.assert( relativeSourcePath >= 0 );
    absoluteSourcePath = _.introspector.location({ level : relativeSourcePath + 1 }).filePath;
    return _.module._fileWithResolvedPath( absoluteSourcePath );
  }

  if( _.path.isDotted( relativeSourcePath ) )
  {
    /* zzz : qqq : optimize _.introspector.location({ level : 1 }).filePath */
    /* zzz : qqq : optimize _.path.dir( _.introspector.location({ level : 1 }).filePath ) */
    let basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );
    absoluteSourcePath = _.path.canonize( basePath + '/' + absoluteSourcePath );
  }
  else
  {
    absoluteSourcePath = _.path.canonize( absoluteSourcePath );
  }

  let moduleFile = _.module._fileWithResolvedPath( absoluteSourcePath );
  return moduleFile;
}

//

function _fileNativeWithResolvedNativePath( caninicalSourcePath, nativeFilesMap )
{
  nativeFilesMap = nativeFilesMap || _.module.nativeFilesMap;
  let result = nativeFilesMap[ caninicalSourcePath ];
  return result;
}

//

function fileNativeWith( relativeSourcePath, nativeFilesMap )
{
  let absoluteSourcePath = relativeSourcePath;

  if( _.numberIs( relativeSourcePath ) )
  {
    _.assert( relativeSourcePath >= 0 );
    absoluteSourcePath = _.introspector.location({ level : relativeSourcePath + 1 }).filePath;
    return _.module._fileNativeWithResolvedNativePath( _.path.nativizeMinimal( absoluteSourcePath ), nativeFilesMap );
  }

  if( _.path.isDotted( relativeSourcePath ) )
  {
    let basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );
    absoluteSourcePath = _.path.nativizeMinimal( _.path.canonize( basePath + '/' + absoluteSourcePath ) );
  }
  else
  {
    absoluteSourcePath = _.path.nativizeMinimal( absoluteSourcePath );
  }

  let moduleFile = _.module._fileNativeWithResolvedNativePath( absoluteSourcePath, nativeFilesMap );
  return moduleFile;
}

// --
// file path
// --

/* xxx : qqq : for junior : cover _.module.fileNativeIs() */
/* qqq : for junior : cover */
function path_head( routine, args )
{

  let o = args[ 0 ];
  if( !_.mapIs( o ) )
  o = { paths : o }
  if( _.strIs( o.paths ) )
  o.paths = [ o.paths ];

  _.assert( args.length === 1 );
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( o.paths ) );
  _.routine.options( filePathAmend, o );

  if( _.path.nativizeMinimal && _.path.canonize )
  {
    for( var p = 0 ; p < o.paths.length ; p++ )
    {
      o.paths[ p ] = _.path.nativizeMinimal( _.path.canonize( o.paths[ p ] ) );
    }
  }

  return o;
}

//

function pathAmend_body( o )
{
  const ModuleFileNative = require( 'module' );

  if( o.moduleFile )
  if( typeof _ !== 'undefined' )
  o.moduleFile = fileNativeFrom( o.moduleFile );

  let filePathAmend = o.amending === 'prepend' ? arrayPrependedArrayOnce : arrayAppendedArrayOnce;

  if( o.globally )
  filePathAmend( ModuleFileNative.globalPaths, o.paths );

  if( o.locally && o.moduleFile )
  filePathAmend( o.moduleFile.paths, o.paths );

  if( o.locally && o.permanent )
  {
    if( o.amending === 'prepend' ) /* qqq : cover please */
    {
      _.module._prependPath = _.module._prependPath || [];
      filePathAmend( _.module._prependPath, o.paths );
    }
    else if( o.amending === 'append' ) /* qqq : cover please */
    {
      _.module._appendPath = _.module._appendPath || [];
      filePathAmend( _.module._appendPath, o.paths );
    }
  }

  if( o.locally && o.recursive && o.moduleFile )
  return _root( o.moduleFile, o.paths, new Set );

  /* - */

  function _root( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    if( o.recursive >= 2 )
    while( fileNativeParent( _module ) )
    _module = fileNativeParent( _module );

    _children1( _module, paths, visited );
  }

  /* - */

  function fileNativeParent( file )
  {
    if( file.parent && file.parent.id !== undefined )
    return file.parent;
  }

  /* - */

  function _children1( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    filePathAmend( _module.paths, paths );

    if( o.recursive >= 2 )
    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function _children2( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    filePathAmend( _module.paths, paths );

    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function fileNativeFrom( src )
  {
    if( _.module.fileNativeFrom )
    return _.module.fileNativeFrom( src );
    return src;
  }

  /* - */

  function arrayAppendedArrayOnce( dstArray, insArray )
  {
    let result = 0;

    for( let i = 0, len = insArray.length ; i < len ; i++ )
    {
      if( dstArray.indexOf( insArray[ i ] ) === -1 )
      {
        dstArray.push( insArray[ i ] );
        result += 1;
      }
    }

    return result;
  }

  /* - */

  function arrayPrependedArrayOnce( dstArray, insArray )
  {
    let result = 0;

    for( let i = insArray.length - 1 ; i >= 0 ; i-- )
    {
      let index = i;
      if( dstArray === insArray )
      index = i + result;
      if( dstArray.indexOf( insArray[ index ] ) === -1 )
      {
        dstArray.unshift( insArray[ index ] );
        result += 1;
      }
    }

    return result;
  }

  /* - */

}

pathAmend_body.defaults =
{
  moduleFile : null,
  paths : null,
  permanent : 0,
  globally : 1,
  locally : 0,
  recursive : 2,
  amending : 'append',
}

let filePathAmend = _.routine.unite( path_head, pathAmend_body );

//

function pathRemove_body( o )
{
  const ModuleFileNative = require( 'module' );

  if( o.moduleFile )
  o.moduleFile = _.module.fileNativeFrom( o.moduleFile );

  if( o.globally )
  remove( ModuleFileNative.globalPaths, o.paths );

  if( o.locally && o.moduleFile )
  remove( o.moduleFile.paths, o.paths );

  if( o.locally && o.permanent )
  {
    if( _.module._prependPath )
    remove( _.module._prependPath, o.paths );
    if( _.module._appendPath )
    remove( _.module._appendPath, o.paths );
  }

  if( o.locally && o.recursive && o.moduleFile )
  return _root( o.moduleFile, o.paths, new Set );

  /* - */

  function _root( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    if( o.recursive >= 2 )
    while( _.module.fileNativeParent( _module ) )
    _module = _.module.fileNativeParent( _module );

    _children1( _module, paths, visited );
  }

  /* - */

  function _children1( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    remove( _module.paths, paths );

    if( o.recursive >= 2 )
    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function _children2( _module, paths, visited )
  {

    if( visited.has( _module ) )
    return;

    visited.add( _module );

    remove( _module.paths, paths );

    if( _module.children )
    {
      for( var c = 0 ; c < _module.children.length ; c++ )
      _children2( _module.children[ c ], paths, visited );
    }

  }

  /* - */

  function remove( dst, src )
  {
    for( let p = 0 ; p < src.length ; p++ )
    {
      if( dst.indexOf( src[ p ] ) !== -1 )
      dst.splice( p, 1 );
    }
  }

  /* - */

}

pathRemove_body.defaults =
{
  moduleFile : null,
  paths : null,
  permanent : 0,
  globally : 1,
  locally : 0,
  recursive : 2,
  amending : 'append',
}

let filePathRemove = _.routine.unite( path_head, pathRemove_body );

//

function filePathGet( o )
{
  const ModuleFileNative = require( 'module' );

  if( !_.mapIs( o ) )
  o = { moduleFile : o }

  _.assert( arguments.length === 0 || arguments.length === 1 );
  o = _.routine.options( filePathGet, o );

  if( o.all === null )
  o.all = o.locally && o.globally;

  let result = Object.create( null );
  if( o.locally )
  result.local = [];
  if( o.globally )
  result.global = [];
  if( o.all )
  result.all = [];

  if( o.moduleFile )
  o.moduleFile = _.module.fileNativeFrom( o.moduleFile );
  o.moduleFile = o.moduleFile || module;

  if( o.globally )
  {
    _.assert( _.arrayIs( ModuleFileNative.globalPaths ) );
    result.global.push( ... ModuleFileNative.globalPaths );
    if( result.all )
    result.all.push( ... ModuleFileNative.globalPaths );
  }

  if( o.locally )
  {
    _.assert( _.arrayIs( o.moduleFile.paths ) );
    result.local.push( ... o.moduleFile.paths );
    if( result.all )
    result.all.push( ... o.moduleFile.paths );
  }

  return result;
}

filePathGet.defaults =
{
  moduleFile : null,
  globally : 1,
  locally : 1,
  all : null,
}

// --
//
// --

function _resolve( o )
{

  _.map.assertHasAll( o, _resolve.defaults );

  if( _.argumentsArray.like( o.moduleName ) )
  {
    let result = [];
    for( let a = 0 ; a < o.moduleName.length ; a++ )
    {
      let r = _.module._resolve
      ({
        basePath : o.basePath,
        downPath : o.downPath,
        moduleName : o.moduleName[ a ],
        throwing : o.throwing,
        withAlternatives : o.withAlternatives,
      });
      if( r !== undefined )
      result[ a ] = r;
    }
    return result;
  }

  if( o.moduleName === _.optional )
  return;

  let r = _.module._resolveFirst
  ({
    moduleNames : [ o.moduleName ],
    downPath : o.downPath,
    basePath : o.basePath,
    throwing : o.throwing,
    withAlternatives : o.withAlternatives,
  });

  return r;
}

_resolve.defaults =
{
  basePath : null,
  downPath : null,
  moduleName : null,
  throwing : 0,
  withAlternatives : 1,
}

//

function resolve( moduleName )
{
  let downPath = _.path.normalize( _.introspector.location({ level : 1 }).filePath );
  let basePath = _.path.dir( downPath );
  /* qqq zzz : optimize for release build for utility::starter */
  let result = _.module._resolve
  ({
    basePath,
    downPath,
    moduleName : arguments,
    throwing : 0,
    withAlternatives : 1,
  });
  _.assert( _.arrayIs( result ) );
  if( result.length <= 1 )
  return result[ 0 ];
  return result;
}

//

function _resolveFirst( o )
{

  if( !_.mapIs( o ) )
  o = { moduleNames : arguments }

  _.map.assertHasAll( o, _resolveFirst.defaults );
  _.assert( _.strDefined( o.downPath ) );
  _.assert( _.strDefined( o.basePath ) );

  let sourcePaths = this._moduleNamesToPaths( o.moduleNames );
  let resolved = this._fileResolve
  ({
    sourcePaths,
    basePath : o.basePath,
    downPath : o.downPath,
    withAlternatives : o.withAlternatives,
    all : 0,
  });

  if( o.throwing )
  if( resolved === undefined && !_.longHas( o.moduleNames, _.optional ) )
  {
    /* xxx : take care of section module files stack */
    throw _.err
    (
      `Cant resolve module::${_.longSlice( o.moduleNames ).join( ' module::' )}.`
      + `\nLooked at:\n - ${sourcePaths.join( '\n - ' )}`
    );
  }

  return resolved;
}

_resolveFirst.defaults =
{
  moduleNames : null,
  downPath : null,
  basePath : null,
  throwing : 0,
  withAlternatives : 1,
}

//

function resolveFirst()
{
  let downPath = _.path.normalize( _.introspector.location({ level : 1 }).filePath );
  let basePath = _.path.dir( downPath );
  return _.module._resolveFirst
  ({
    moduleNames : arguments,
    basePath,
    downPath,
    throwing : 0,
  });
}

//

function _fileResolve( o )
{
  let result = [];

  if( !_.mapIs( arguments[ 0 ] ) )
  o = { sourcePaths : arguments[ 0 ] }

  let native = _.module.nativeFilesMap[ _.path.nativizeMinimal( o.downPath ) ];
  native = native || module; /* xxx : comment out and look among namesapces? */

  _.map.assertHasAll( o, _fileResolve.defaults );
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( o.sourcePaths ) );
  _.strDefined( o.downPath );
  _.strDefined( o.basePath );
  _.assert( !!native );

  for( let a = 0 ; a < o.sourcePaths.length ; a++ )
  {
    let sourcePath = o.sourcePaths[ a ];
    let resolved;

    if( _.strHas( sourcePath, '/Main.s' ) )
    debugger;

    resolved = nativeResolve( sourcePath );
    if( resolved === undefined && o.withAlternatives )
    {
      let sourcePath2 = sourcePath.toLowerCase();
      if( sourcePath !== sourcePath2 )
      resolved = nativeResolve( sourcePath2 );
    }

    result.push( resolved );
    if( !o.all )
    return result[ 0 ];
  }

  // /* zzz : remove later */
  // if( o.basePath )
  // {
  //   o.basePath = _.path.canonize( o.basePath );
  //   let index = o.basePath.indexOf( '/wtools/' );
  //   if( index >= 0 )
  //   o.basePath = o.basePath.substring( 0, index+8 );
  // }

  // if( o.basePath )
  // for( let a = 0 ; a < o.sourcePaths.length ; a++ )
  // {
  //   let sourcePath = o.sourcePaths[ a ];
  //   let resolved;
  //
  //   if( _.path.isAbsolute( sourcePath ) )
  //   continue;
  //
  //   try
  //   {
  //     let filePath = _.path.nativizeMinimal( _.path.canonize( o.basePath + '/' + sourcePath ) );
  //     resolved = ModuleFileNative._resolveFilename( filePath, native, false, undefined );
  //   }
  //   catch( err )
  //   {
  //     continue;
  //   }
  //
  //   result.push( resolved );
  //   if( !o.all )
  //   return result[ 0 ];
  // }

  if( o.all )
  return result;
  else
  return undefined;

  function nativeResolve( sourcePath )
  {
    /* xxx : not optimal */
    try
    {
      let r;
      if( _.path.isAbsolute( sourcePath ) )
      r = ModuleFileNative._resolveFilename( _.path.nativizeMinimal( sourcePath ), native, false, undefined );
      else
      r = ModuleFileNative._resolveFilename( sourcePath, native, false, undefined );
      if( r )
      r = _.path.normalize( r );
      return r;
    }
    catch( err )
    {
      return;
    }
  }
}

_fileResolve.defaults =
{
  sourcePaths : null,
  downPath : null,
  basePath : null,
  withAlternatives : 1,
  all : 0,
}

//

function _moduleNamesToPaths( names )
{
  let result = [];

  _.assert( arguments.length === 1 );
  _.assert( _.longIs( names ) );

  for( let a = 0 ; a < names.length ; a++ )
  {
    let src = names[ a ];
    if( src === _.optional )
    continue;
    _.assert( _.strDefined( src ) );
    var descriptor = _.module.predeclaredWithNameMap.get( src );
    if( descriptor )
    {
      _.assert( _.longIs( descriptor.lookPath ) );
      _.arrayAppendArray( result, descriptor.lookPath );
    }
    else
    {
      result.push( src );
    }
  }

  return result;
}

//

const _toolsPath = _.path.canonize( __dirname + '/../../../../node_modules/Tools' );
function toolsPathGet()
{
  return _toolsPath;
}

//

const _toolsDir = _.path.canonize( __dirname + '/../../../../wtools' );
function toolsDirGet()
{
  return _toolsDir;
}

// --
// include
// --

function _fileIncludeSingle( downPath, filePath )
{
  _.assert( arguments.length === 2 );
  _.assert( _.strIs( filePath ), 'Expects string' );

  if( !hasModuleFileDescriptor )
  throw _.err( 'Cant include, routine "require" does not exist.' );

  let normalizedPath = _.path.nativizeMinimal( filePath );
  let moduleFile = _.module._fileWithResolvedPath( downPath );
  if( moduleFile )
  return moduleFile.native.require( normalizedPath );
  return _.module.__fileNativeInclude( normalizedPath );

}

//

/* xxx : implement _.path._dir */
/* xxx : qqq : optimize _.path.dir */

function include()
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( arguments[ 0 ] ) );

  let downPath = _.path.normalize( _.introspector.location({ level : 1 }).filePath );
  let basePath = _.path.dir( downPath );
  let resolved = _.module._resolve
  ({
    basePath,
    downPath,
    moduleName : arguments,
    throwing : 1,
    withAlternatives : 1,
  });

  if( resolved.length === 1 )
  {
    return _.module._fileIncludeSingle( downPath, resolved[ 0 ] );
  }
  else
  {
    let result = [];
    for( let i = 0 ; i < resolved.length ; i++ )
    result[ i ] = _.module._fileIncludeSingle( downPath, resolved[ i ] );
    return result;
  }

}

//

function includeFirst()
{
  let downPath = _.path.normalize( _.introspector.location({ level : 1 }).filePath );
  let basePath = _.path.dir( downPath );
  let resolved = _.module._resolveFirst
  ({
    basePath,
    downPath,
    moduleNames : arguments,
    throwing : 1,
    withAlternatives : 1,
  });
  if( resolved )
  {
    return _.module._fileIncludeSingle( downPath, resolved );
  }
}

//

function isIncluded( src )
{
  if( _.module.modulesMap.has( src ) )
  return true;
  return false;
}

// --
// setup
// --

function _trackingEnable()
{

  const ModuleFileNative = require( 'module' );
  const NjsResolveFilename = ModuleFileNative._resolveFilename;
  const NjsLoad1 = ModuleFileNative._load;
  const NjsLoad2 = ModuleFileNative.prototype.load;

  const resolving = Object.create( null );
  resolving.request = null;
  resolving.parent = null;
  resolving.resolvedPath = null;

  const loading = Object.create( null );
  loading.request = null;
  loading.parent = null;
  loading.childrenLength = null;
  loading.counter = 0;

  _.assert( _.routineIs( NjsResolveFilename ) );
  _.assert( _.routineIs( NjsLoad1 ) );
  _.assert( _.routineIs( NjsLoad2 ) );

  ModuleFileNative._resolveFilename = _resolveFilename;

  if( _global === _realGlobal_ )
  ModuleFileNative._load = _loadEnvironment;

  ModuleFileNative.prototype.load = moduleFileLoad;

  /* */

  function _resolveFilename( /* request, parent, isMain, options */ )
  {
    let request = arguments[ 0 ];
    let parent = arguments[ 1 ];
    let isMain = arguments[ 2 ];
    let options = arguments[ 3 ];
    if( resolving.parent === parent && resolving.request === request )
    return resolving.resolvedPath;
    resolving.resolvedPath = NjsResolveFilename.apply( this, arguments );
    resolving.request = request;
    resolving.parent = parent;
    return resolving.resolvedPath;
  }

  /* - */

  function _loadModuling( request, parent, isMain )
  {
    let result, err;
    const counter = loading.counter;

    loading.request = request;
    loading.parent = parent;
    loading.childrenLength = parent ? parent.children.length : 0;

    try
    {
      result = NjsLoad1.apply( this, arguments );
    }
    catch( _err )
    {
      err = _err;
    }

    if( !err )
    {
      try
      {
        if( loading.counter === counter )
        second( request, parent );
      }
      catch( err2 )
      {
        console.error( err2 );
      }
    }

    loading.request = null;
    loading.parent = null;

    if( err )
    throw err;
    return result;
  }

  /* - */

  function second( request, parent )
  {

    if( !parent.universal )
    return;
    if( parent.universal.moduleNativeFilesMap !== _.module.nativeFilesMap )
    return;
    if( parent.universal.moduleNativeFilesMap !== ModuleFileNative._cache )
    return;
    if( !_.path.isDotted( request ) )
    return;

    let native;
    if( loading.request === request && loading.parent === parent )
    {
      _.assert( loading.childrenLength === parent.children.length || loading.childrenLength + 1 === parent.children.length );
      if( loading.childrenLength === parent.children.length )
      return;
      else
      native = parent.children[ parent.children.length - 1 ];
    }
    else
    {
      let resolvedPath = _resolveFilename( request, parent, false );
      native = ModuleFileNative._cache[ resolvedPath ];
      _.assert( !!_.module.fileNativeParent( native ) );
      _.assert( 0, 'not tested' ); /* xxx : qqq : cover? */
    }

    if( _.module.fileNativeParent( native ) !== parent )
    {
      _.module._fileUniversalAssociateFile( native.universal, parent.universal );
      _.module._filesUniversalAssociateModule( native.universal, parent.universal.modules );
    }
  }

  /* - */

  function _loadEnvironment( request, parent, isMain )
  {
    let result;
    const originalModuleNativeFiles = ModuleFileNative._cache;
    const originalGlobal = _realGlobal_._global_;

    if( parent )
    if( parent._virtualEnvironment )
    {
      if( parent._virtualEnvironment.moduleNativeFilesMap )
      ModuleFileNative._cache = parent._virtualEnvironment.moduleNativeFilesMap;
      if( parent._virtualEnvironment.global )
      _realGlobal_._global_ = parent._virtualEnvironment.global;
    }
    else if( parent.universal )
    {
      if( parent.universal.moduleNativeFilesMap )
      ModuleFileNative._cache = parent.universal.moduleNativeFilesMap;
      if( parent.universal.global )
      _realGlobal_._global_ = parent.universal.global;
    }

    try
    {
      result = _loadModuling.apply( this, arguments );
    }
    catch( err )
    {
      let error;
      if( parent && parent.filename )
      error = _.err( err, `\nModule file "${parent.filename}" failed to include "${request}"` );
      else
      error = _.err( err, `\nFailed to include "${request}"` );
      throw error;
    }
    finally
    {
      ModuleFileNative._cache = originalModuleNativeFiles;
      _realGlobal_._global_ = originalGlobal;
    }

    return result;
  }

  /* - */

  function moduleFileLoad( nativeSourcePath )
  {
    loading.counter += 1;

    /*
    ignore includes of other global namespaces
    */
    if( _.module.nativeFilesMap !== ModuleFileNative._cache )
    {
      return NjsLoad2.apply( this, arguments );
    }

    let result;
    let native = this
    let moduleFile = _.module._fileUniversalFrom
    ({
      sourcePath : nativeSourcePath,
      nativeSourcePath,
      requestedSourcePath : resolving.request,
      native,
      status : 1,
    });

    _.assert( native === ModuleFileNative._cache[ moduleFile.nativeSourcePath ] );
    _.assert( native === moduleFile.native );
    _.assert( resolving.resolvedPath === nativeSourcePath );

    try
    {
      result = NjsLoad2.apply( this, arguments );
    }
    catch( err )
    {
      err = _.err( err );
      try
      {
        moduleFile.error = moduleFile.error || err;
        _.module._fileUniversalFinit( moduleFile );
      }
      catch( err2 )
      {
        console.error( _.err( err2 ) );
      }
      throw err;
    }

    if( moduleFile.status !== -1 )
    {
      moduleFile.status = 2;
      // _.assert( Object.is( moduleFile.returned, native.exports ) );
    }

    return result;
  }

  /* - */

}

//

function _Setup()
{

  if( _.module._modulesToPredeclare )
  _.module.predeclareAll({ modules : _.module._modulesToPredeclare, basePath : __dirname });

  if( typeof require === 'undefined' )
  return;

  if( !ModuleFileNative )
  ModuleFileNative = require( 'module' );

  if( !_.module.rootFileNative )
  {
    let rootFileNative = _.module.rootFileNative = module;
    while( _.module.fileNativeParent( rootFileNative ) )
    rootFileNative = _.module.fileNativeParent( rootFileNative );
    _.module.rootFileNative = rootFileNative;
  }

  if( !_.module.nativeFilesMap )
  _.module.nativeFilesMap = ModuleFileNative._cache;

  if( _.module._setupRequireDone )
  return;
  _.module._setupRequireDone = 1;

  // /* qqq xxx : remove that if-return branch */
  // if( _global_.Config.interpreter === 'browser' )
  // return;

  _.module._trackingEnable();
  _.module._filesUniversalFrom({ files : [ _.module.rootFileNative ] });

  if( _.module.rootFileNative.universal )
  _.module.rootFile = _.module.rootFileNative.universal;

}

// --
// Module
// --

const ModuleSymbol = Symbol.for( 'Module' );

function Module()
{
  _.assert( 0, 'not implemented' );
  if( arguments.length !== 0 )
  throw new Error( 'Expects no arguments' );
  _.assert( this instanceof Module );
  return this;
}

_.class.declareBasic
({
  constructor : Module,
  exportString : moduleExportString,
});

Object.defineProperty( Module.prototype, ModuleSymbol,
{
  enumerable : false,
  configurable : false,
  writable : false,
  value : true,
});

// --
// Module File
// --

const ModuleFileSymbol = Symbol.for( 'ModuleFile' );

function ModuleFile()
{
  _.assert( 0, 'not implemented' );
  if( arguments.length !== 0 )
  throw new Error( 'Expects no arguments' );
  _.assert( this instanceof ModuleFile );
  return this;
}

_.class.declareBasic
({
  constructor : ModuleFile,
  exportString : moduleFileExportString,
});

Object.defineProperty( ModuleFile.prototype, ModuleFileSymbol,
{
  enumerable : false,
  configurable : false,
  writable : false,
  value : true,
});

/* xxx : qqq : for junior : cover */
Object.defineProperty( ModuleFile.prototype, 'returned',
{
  enumerable : true,
  configurable : true,
  get : moduleFileReturnedGet,
  // set : _returnedSet, /* qqq : uncomment later and write test */
});

// --
// extend namespaces
// --

var ToolsExtension =
{
  include,
  includeFirst,
}

var ModuleExtension =
{

  // module

  is,
  with : _with,
  withName,
  withPath,

  predeclare,
  predeclareAll,
  _predeclaredWithEntryPath,

  // file

  fileIs,
  fileNativeIs : __.module.fileNativeIs,
  fileUniversalIs : __.module.fileUniversalIs,
  fileExportString,
  _fileUniversalFinit,
  _fileUniversalFrom,
  _filesUniversalFrom,
  _fileUniversalAssociateFile,
  _fileUniversalDisassociateFile,
  _fileUniversalAssociateModule,
  _fileUniversalDisassociateModules,
  _filesUniversalAssociateModule,

  // _filesWhichEnds,
  _filesWithResolvedPath,
  _fileWithResolvedPath,
  fileWithResolvedPath,
  fileWith,

  fileNativeFrom : __.module.fileNativeFrom,
  fileNativeParent : __.module.fileNativeParent,
  _fileNativeWithResolvedNativePath,
  fileNativeWith,

  // file path

  filePathAmend,
  filePathRemove,
  filePathGet,

  // resolve

  _resolve,
  resolve,
  _resolveFirst,
  resolveFirst,
  _fileResolve,

  _moduleNamesToPaths,
  toolsPathGet,
  toolsDirGet,

  // include

  _fileIncludeSingle,

  include,
  includeFirst,

  isIncluded,

  // setup

  _trackingEnable,
  /* qqq : implement and cover routine _trackingDisable */
  _Setup,

  // fields

  Module,
  File : ModuleFile,
  __fileNativeInclude,
  _prependPath : null,
  _appendPath : null,
  rootFile : null,
  rootFileNative : null,
  predeclaredWithNameMap : new HashMap,
  predeclaredWithEntryPathMap : new HashMap,
  modulesMap : new HashMap,
  nativeFilesMap : null,
  filesMap : new HashMap,
  _setupRequireDone : null,

}

/* xxx : move to l3/l5 */
/* xxx : test of include file which deos not exist and reinclude file wich was trying include file which does not exist */

_.props.supplement( _.module, ModuleExtension );
_.props.supplement( _, ToolsExtension );
_.module._Setup();

})();
