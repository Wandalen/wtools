( function _gModule_s_() {

'use strict';

//

var _global = _global_;
var _ = _global_.wTools;

var Module = null;
var __nativeInclude;
if( typeof require !== 'undefined' )
__nativeInclude = require;
else if( typeof importScripts !== 'undefined' )
__nativeInclude = importScripts;
else if( _global._remoteRequire )
__nativeInclude = _global._remoteRequire;

let Self = _.module = _.module || Object.create( null );

// --
// routines
// --

function usePath( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ) );

  if( _.path && _.path.refine )
  src = _.path.refine( src );

  if( typeof module !== 'undefined' && module.paths )
  if( module.paths.indexOf( src ) === -1 )
  module.paths.push( src );

}

//

function usePathGlobally( paths )
{

  if( _.strIs( paths ) )
  paths = [ paths ];

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.arrayIs( paths ) );

  debugger;
  if( _.path.nativize && _.path.refine )
  {
    for( var p = 0 ; p < paths.length ; p++ )
    {
      paths[ p ] = _.path.nativize( _.path.resolve( paths[ p ] ) );
      console.log( 'usePathGlobally', paths[ p ] );
    }
  }

  return _usePathGlobally( module, paths, [] );
}

//

function _usePathGlobally( _module, paths, visited )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.arrayIs( paths ) );

  if( visited.indexOf( _module ) !== -1 )
  return;

  if( !Module )
  Module = require( 'module' );

  for( let p = 0 ; p < paths.length ; p++ )
  if( Module.globalPaths.indexOf( paths[ p ] ) === -1 )
  Module.globalPaths.push( paths[ p ] );

  // [].push.apply( Module.globalPaths, paths );

  /* patch parents */

  while( _module )
  {
    _usePathGloballyChildren( _module, paths, visited );
    _module = _module.parent;
  }

}

//

function _usePathGloballyChildren( _module, paths, visited )
{

  _.assert( arguments.length === 3, 'Expects exactly three arguments' );
  _.assert( _.arrayIs( paths ) );

  if( visited.indexOf( _module ) !== -1 )
  return;

  visited.push( _module );

  for( let p = 0 ; p < paths.length ; p++ )
  if( _module.paths.indexOf( paths[ p ] ) === -1 )
  _module.paths.push( paths[ p ] );

  // [].push.apply( _module.paths, paths );

  /* patch parents */

  if( _module.children )
  for( var c = 0 ; c < _module.children.length ; c++ )
  _usePathGloballyChildren( _module.children[ c ], paths, visited );

}

// --
// declare
// --

function declare( o )
{

  _.routineOptions( declare, arguments );
  _.assert( _.strIs( o.name ) );
  _.assert( !_.module.knownModulesByName.has( o.name ), () => `Module ${o.name} was already registered as known` );

  o.sourcePath = _.arrayAs( o.sourcePath );

  if( !o.basePath )
  o.basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );

  for( let i = 0 ; i < o.sourcePath.length ; i++ )
  {
    let sourcePath = o.sourcePath[ i ];
    let was = _.module.knownModulesByPath.get( sourcePath );
    _.assert( !was || was === o, () => `Module ${o.name} is trying to register path registered by ${was.name}\nPath : ${sourcePath}` );
    _.assert( _.strIs( sourcePath ), `Expects string, but got ${_.strType( sourcePath )}` );
  }

  for( let i = 0 ; i < o.sourcePath.length ; i++ )
  {
    let sourcePath = o.sourcePath[ i ];
    if( _.path.isDotted( sourcePath ) )
    {
      sourcePath = o.sourcePath[ i ] = _.path.canonize( o.basePath + '/' + sourcePath );
    }
    else
    {
      let normalized = _.path.canonize( sourcePath );
      if( _.path.isAbsolute( normalized ) )
      sourcePath = o.sourcePath[ i ] = normalized;
    }
    delete o.basePath;
    o.status = 0;
    _.module.knownModulesByPath.set( sourcePath, o );
  }

  _.module.knownModulesByName.set( o.name, o );

  return o;
}

declare.defaults =
{
  name : null,
  sourcePath : null,
  basePath : null,
  isIncluded : null,
}

//

function declareAll( knowns )
{

  _.assert( arguments.length === 1 );
  _.assert( _.mapIs( knowns ) );

  let basePath;

  for( let k in knowns )
  {
    let known = knowns[ k ];
    _.assert( known.name === k || known.name === undefined );
    _.assert( _.mapIs( known ) );
    known.name = k;
    if( !known.basePath )
    {
      if( !basePath )
      {
        basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );
        /* Transforms global path into local, required to make _.include work in a browser */
        if( _global_.Config.interpreter === 'browser' )
        if( typeof _starter_ !== 'undefined' )
        {
          basePath = _starter_.uri.parseConsecutive( basePath ).resourcePath;
          basePath = _.path.normalizeTolerant( basePath );
        }
      }
      known.basePath = basePath;
    }
    _.module.declare( known );
  }

}

// --
// include
// --

function _sourceFileIncludeSingle( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.strIs( src ), 'Expects string' );

  if( typeof module !== 'undefined' )
  try
  {
    return _.module.__nativeInclude( _.path.nativize( src ) );
  }
  catch( err )
  {
    debugger;
    throw _.err( err, '\n', 'Cant require', src );
  }
  else throw _.err( 'Cant include, routine "require" does not exist.' );

}

// //
//
// function _sourceFileInclude( src )
// {
//   if( arguments.length !== 1 )
//   return _.module._sourceFileInclude( arguments );
//
//   if( _.longIs( src ) )
//   {
//     var result = [];
//     src = _.arrayFlatten( [], src );
//     for( var a = 0 ; a < src.length ; a++ )
//     result[ a ] = _.module._sourceFileIncludeSingle( src[ a ] );
//     return result;
//   }
//
//   return _.module._sourceFileIncludeSingle( src );
// }
//
// //
//
// function _sourceFileIncludeAny( src )
// {
//   var errors = [];
//
//   _.assert( arguments.length >= 1, 'Expects at least one argument' );
//
//   for( var a = 0 ; a < arguments.length ; a++ )
//   {
//     var src = arguments[ a ];
//     var resolved;
//
//     _.assert( _.strIs( src ), () => `Expects string but got ${_.strType( src )}` );
//
//     if( src !== '' )
//     try
//     {
//       resolved = _.module.__nativeInclude.resolve( src );
//     }
//     catch( err )
//     {
//       if( a !== arguments.length-1 /*&& !usingSinglePath*/ )
//       continue;
//     }
//
//     if( a === arguments.length-1 && src === '' )
//     return;
//
//     var result = _.module._sourceFileIncludeSingle( resolved || arguments[ 0 ] );
//     return result;
//   }
//
//   _.assert( 0, 'unexpected' );
// }
//
// // --
// // include
// // --
//
// function _includeSingle( src )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.strIs( src ) );
//
//   var descriptor = _.module.knownModulesByName.get( src );
//
//   if( !descriptor )
//   {
//     return _.module._sourceFileIncludeAny( src );
//   }
//
//   /* */
//
//   if( descriptor.isIncluded )
//   if( descriptor.isIncluded() )
//   return descriptor.returned;
//
//   if( descriptor.status === 2 )
//   {
//     debugger;
//     return descriptor.returned;
//   }
//
//   var result;
//
//   descriptor.status = 1;
//
//   if( descriptor.sourcePath )
//   {
//     _.assert( _.arrayIs( descriptor.sourcePath ), 'include descriptor expect an array ( sourcePath ) if present' );
//     result = _.module._sourceFileIncludeAny.apply( _, descriptor.sourcePath );
//   }
//   else throw _.err( 'Module does not has {- sourcePath -}.\nCant use the descriptor to include file', src );
//
//   descriptor.returned = result;
//
//   return result;
// }
//
// //
//
// function _includeAnySingle( srcs )
// {
//   _.assert( arguments.length === 1, 'Expects single argument' );
//   _.assert( _.longIs( srcs ) );
//
//   /* */
//
//   var paths = [];
//   for( var s = 0 ; s < srcs.length ; s++ )
//   {
//     var src = srcs[ s ];
//     var descriptor = _.module.knownModulesByName.get( src );
//
//     if( !descriptor )
//     {
//       paths.push({ path : src });
//       continue;
//     }
//
//     if( descriptor.isIncluded )
//     if( descriptor.isIncluded() )
//     return descriptor.returned;
//
//     var result;
//     // if( descriptor.include )
//     // {
//     //   paths.push({ path : descriptor.include, descriptor }); debugger;
//     // }
//     // else
//     if( descriptor.sourcePath )
//     {
//       _.assert( _.arrayIs( descriptor.sourcePath ), 'Module descriptor expect an array {- sourcePath -} if present' );
//       for( var p = 0 ; p < descriptor.sourcePath.length ; p++ )
//       paths.push({ path : descriptor.sourcePath[ p ], descriptor });
//     }
//     else throw _.err( 'Module does not has {- sourcePath -}.\nCant use the descriptor to include file', src );
//
//   }
//
//   /* */
//
//   for( var a = 0 ; a < paths.length ; a++ )
//   {
//     var src = paths[ a ].path;
//
//     if( src !== '' )
//     try
//     {
//       var resolved = _.module.__nativeInclude.resolve( src );
//       src = resolved;
//     }
//     catch( err )
//     {
//       if( a !== paths.length-1 /*&& !usingSinglePath*/ )
//       continue;
//     }
//
//     if( a === paths.length-1 && src === '' )
//     return;
//
//     var result = _.module._sourceFileIncludeSingle( src );
//     if( paths[ a ].descriptor )
//     paths[ a ].descriptor.returned = result;
//     return result;
//   }
//
//   /* */
//
//   debugger;
//   throw _.err( 'Can include none of file', srcs );
// }
//
// //
//
// function include( src )
// {
//   if( arguments.length !== 1 )
//   return _.module._includeSingle( arguments );
//
//   if( _.longIs( src ) )
//   {
//     var result = [];
//     src = _.arrayFlatten( [], src );
//     for( var a = 0 ; a < src.length ; a++ )
//     result[ a ] = _.module._includeSingle( src[ a ] );
//     return result;
//   }
//
//   return _.module._includeSingle( src );
// }
//
// //
//
// function includeAny()
// {
//   return _.module._includeAnySingle( arguments );
// }

//

function include()
{
  _.assert( arguments.length === 1 );
  _.assert( _.strIs( arguments[ 0 ] ) );
  let resolved = _.module.resolve( ... arguments );
  return _.module._sourceFileIncludeSingle( resolved );
}

//

function includeFirst()
{
  let resolved = _.module.resolveFirst( ... arguments );
  if( resolved )
  return _.module._sourceFileIncludeSingle( resolved );
}

//

/* zzz : reimplement */
function isIncluded( src )
{
  var descriptor = _.module.knownModulesByName.get( src );

  if( !descriptor )
  return false;

  if( !descriptor.isIncluded )
  {
    debugger;
    return false;
  }

  return descriptor.isIncluded();
}

//

function _includedRegister( o )
{
  _.assertRoutineOptionsPreservingUndefines( _includedRegister, arguments );
  try
  {

    if( _.module.includedSourceFiles.has( o.sourcePath ) )
    return;

    _.module.includedSourceFiles.set( o.sourcePath, o );

    let module = _.module.knownModulesByPath.get( o.sroucePath );
    if( module )
    {
      debugger;
      module.returned = o.returned;
      module.status = 2;
      let was = _.module.includedModules.get( o.sourcePath );
      _.assert( !was || was === module );
      _.module.includedModules.set( module.name, module );
    }

  }
  catch( err )
  {
    console.log( _.err( err, `\nError in _.module._includedRegister of ${o.sourcePath}` ) );
  }
}

_includedRegister.defaults =
{
  sourcePath : null,
  requestedSourcePath : null,
  originalModule : null,
  returned : null,
}

//

function _resolve( moduleName )
{
  if( arguments.length > 1 )
  {
    let result = [];

    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let moduleName = arguments[ a ];

      if( moduleName === _.optional )
      continue;

      let r = _.module._resolveFirst
      ({
        moduleNames : [ moduleName ],
        basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
        throwing : 0,
      });
      if( r !== undefined )
      result.push( r );
    }

    return result;
  }

  return _.module._resolveFirst
  ({
    moduleNames : moduleName,
    basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
    throwing : 0,
  });
}

// //
//
// function _resolveFirst()
// {
//   let sourcePaths = this._modulesToSourcePaths( arguments );
//   let resolved = this._sourceFileResolve( sourcePaths );
//   return resolved;
// }

//

function resolve( moduleName )
{
  if( arguments.length > 1 )
  {
    let result = [];

    for( let a = 0 ; a < arguments.length ; a++ )
    {
      let moduleName = arguments[ a ];

      if( moduleName === _.optional )
      continue;

      // let r = _.module.resolveFirst( moduleName );
      let r = _.module._resolveFirst
      ({
        moduleNames : [ moduleName ],
        basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
        throwing : 1,
      });
      if( r !== undefined )
      result.push( r );
    }

    return result;
  }

  return _.module._resolveFirst
  ({
    moduleNames : [ moduleName ],
    basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
    throwing : 1,
  });
  // return _.module.resolveFirst( moduleName );
}

//

function _resolveFirst( o )
{

  if( !_.mapIs( o ) )
  o = { moduleNames : arguments }
  _.routineOptions( _resolveFirst, o );

  if( o.basePath === null )
  o.basePath = _.path.dir( _.introspector.location({ level : 1 }).filePath );

  let sourcePaths = this._modulesToSourcePaths( o.moduleNames );
  let resolved = this._sourceFileResolve({ sourcePaths, basePath : o.basePath });

  if( o.throwing )
  if( resolved === undefined && !_.longHas( o.moduleNames, _.optional ) )
  {
    debugger;
    throw _.err
    (
        `Cant resolve module::${_.longSlice( o.moduleNames ).join( ' module' )}.`
      + `\nLooked at:\n - ${sourcePaths.join( '\n - ' )}`
    );
  }

  return resolved;
}

_resolveFirst.defaults =
{
  moduleNames : null,
  basePath : null,
  throwing : 0,
}

// //
//
// function _resolveFirst()
// {
//   let sourcePaths = this._modulesToSourcePaths( arguments );
//   let resolved = this._sourceFileResolve( sourcePaths );
//   return resolved;
// }

//

function resolveFirst()
{
  return _.module._resolveFirst
  ({
    moduleNames : arguments,
    basePath : _.path.dir( _.introspector.location({ level : 1 }).filePath ),
  });
}

//

function _modulesToSourcePaths( names )
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
    var descriptor = _.module.knownModulesByName.get( src );
    if( descriptor )
    {
      _.assert( _.longIs( descriptor.sourcePath ) );
      _.arrayAppendArray( result, _.arrayAs( descriptor.sourcePath ) );
    }
    else
    {
      result.push( src );
    }
  }

  return result;
}

//

function _sourceFileResolve( o )
{
  let result = [];

  if( !_.mapIs( arguments[ 0 ] ) )
  o = { sourcePaths : arguments[ 0 ] }

  _.routineOptions( _sourceFileResolve, o );
  _.assert( arguments.length === 1 );
  _.assert( _.longIs( o.sourcePaths ) );

  for( let a = 0 ; a < o.sourcePaths.length ; a++ )
  {
    let sourcePath = o.sourcePaths[ a ];
    let resolved;

    try
    {
      resolved = _.module.__nativeInclude.resolve( _.path.nativize( sourcePath ) );
    }
    catch( err )
    {
      continue;
    }

    result.push( resolved );
    if( !o.all )
    return result[ 0 ];
  }

  if( o.basePath )
  {
    o.basePath = _.path.normalize( o.basePath );
    let index = o.basePath.indexOf( '/dwtools/' );
    if( index >= 0 )
    o.basePath = o.basePath.substring( 0, index+8 );
  }

  if( o.basePath )
  for( let a = 0 ; a < o.sourcePaths.length ; a++ )
  {
    let sourcePath = o.sourcePaths[ a ];
    let resolved;

    if( _.path.isAbsolute( sourcePath ) )
    continue;

    try
    {
      let filePath = _.path.nativize( _.path.normalize( o.basePath + '/' + sourcePath ) );
      // debugger;
      resolved = _.module.__nativeInclude.resolve( filePath );
    }
    catch( err )
    {
      continue;
    }

    result.push( resolved );
    if( !o.all )
    return result[ 0 ];
  }

  if( o.all )
  return result;
  else
  return undefined;
}

_sourceFileResolve.defaults =
{
  sourcePaths : null,
  basePath : null,
  all : 0,
}

// --
// etc
// --

function toolsPathGet()
{
  return _.path.normalize( __dirname + '/../../../../../dwtools/Tools.s' );
}

// --
// meta
// --

function _Setup()
{

  // yyy : remove
  // if( _.usePath && typeof __dirname !== 'undefined' )
  // _.usePath( __dirname + '/../..' );

  // if( _.module.knownModulesByName )
  // _.module.declareAll( _.module.knownModulesByName );

  if( _.module.lateModules )
  _.module.declareAll( _.module.lateModules );

  if( typeof require === 'undefined' )
  return;

  /* qqq xxx : remove that if-return branch */
  if( _global_.Config.interpreter === 'browser' )
  return;

  // debugger;
  let Module = require( 'module' );
  // debugger;

  let NjsResolveFilename = Module._resolveFilename;
  let NjsLoad = Module._load;
  let including = false;
  let resolvedPath = null;

  Module._resolveFilename = function _resolveFilename( request, parent, isMain, options )
  {
    let result = NjsResolveFilename.apply( this, arguments );
    resolvedPath = result;
    return result;
  }

  Module._load = function _load( request, parent, isMain )
  {
    let result;
    including = true;
    try
    {
      result = NjsLoad.apply( this, arguments );
    }
    finally
    {
      including = false;
    }
    _.module._includedRegister
    ({
      sourcePath : resolvedPath,
      requestedSourcePath : request,
      returned : result,
      originalModule : Module._cache[ resolvedPath ] || Module.builtinModules[ resolvedPath ] || null,
    });
    return result;
  }

}

// --
// declare
// --

var ToolsExtension =
{
  include,
  includeFirst,
  // includeAny,
}

var ModuleExtension =
{

  // use

  /* zzz : comment out maybe !!! */

  usePath,
  usePathGlobally,
  _usePathGlobally,
  _usePathGloballyChildren,

  // declare

  declare,
  declareAll,

  // include

  _sourceFileIncludeSingle,
  // _sourceFileInclude,
  // _sourceFileIncludeAny,
  //
  // // include
  //
  // _includeSingle,
  // _includeAnySingle,
  // include,
  // includeAny,

  include,
  includeFirst,

  isIncluded,
  _includedRegister,

  // resolve

  _resolve,
  _resolveFirst,
  resolve,
  resolveFirst,
  _modulesToSourcePaths,
  _sourceFileResolve,

  // etc

  toolsPathGet,

  // meta

  _Setup,

  // fields

  __nativeInclude,
  knownModulesByName : new HashMap,
  knownModulesByPath : new HashMap,
  includedModules : new HashMap,
  includedSourceFiles : new HashMap,

}

_.mapSupplement( _.module, ModuleExtension );
_.mapSupplement( _, ToolsExtension );

_.module._Setup();

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
