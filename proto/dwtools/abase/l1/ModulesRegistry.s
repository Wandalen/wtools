( function _ModulesRegistry_s_() {

'use strict';

let _global = _global_;
let _ = _global.wTools = _global.wTools || Object.create( null );
_.module = _.module || Object.create( null );
_.module.modulesToRegister = _.module.modulesToRegister || Object.create( null );
let Self = _.module.modulesToRegister;

/*
  Temporary solution.
*/

/**
 * @typedef {Object} ModulesRegistry - Map that contains info about modules, is uses by {@link wTools.include}.
 * @namespace Tools
 */

// --
// helper
// --

function sourcePath( filePath, name )
{
  _.assert( arguments.length === 2 );
  return [ '../../' + filePath, filePath, name ];
}

// --
// include map
// --

// base / l1

let wTools =
{
  sourcePath : sourcePath( 'abase/Layer1.s', 'wTools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.longHas },
}

// base / l2

let wBlueprint =
{
  sourcePath : sourcePath( 'abase/l2_blueprint/Include.s', 'wblueprint' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.blueprint },
}

let wEntityBasic =
{
  sourcePath : sourcePath( 'abase/l2/EntityBasic.s', 'wentitybasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entityVals; },
}

let wLooker =
{
  sourcePath : sourcePath( 'abase/l2/Looker.s', 'wlooker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.look; },
}

let wPathBasic =
{
  sourcePath : sourcePath( 'abase/l3/PathsBasic.s', 'wpathbasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.path && !!_global.wTools.path.s },
}

let wRoutineBasic =
{
  sourcePath : sourcePath( 'abase/l2/RoutineBasic.s', 'wroutinebasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.exec },
}

// base / l3

let wProto =
{
  sourcePath : sourcePath( 'abase/l3_proto/Include.s', 'wProto' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.mixinDelcare },
}

let wStringer =
{
  sourcePath : sourcePath( 'abase/l3/Stringer.s', 'wstringer' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Stringer; },
}

// base / l4

let wReplicator =
{
  sourcePath : sourcePath( 'abase/l4/Replicator.s', 'wreplicator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.replicate; },
}

let wLookerExtra =
{
  sourcePath : sourcePath( 'abase/l4/LookerExtra.s', 'wlookerextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entitySearch },
}

let wArraySorted =
{
  sourcePath : sourcePath( 'abase/l4/ArraySorted.s', 'warraysorted' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.sorted && !!_global.wTools.sorted.lookUp },
}

let wArraySparse =
{
  sourcePath : sourcePath( 'abase/l4/ArraySparse.s', 'warraysparse' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.sparse },
}

let wProcess =
{
  sourcePath : sourcePath( 'abase/l4_process/Basic.s', 'wprocess' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.process && !!_global.wTools.process.start },
}

let wUriBasic =
{
  sourcePath : sourcePath( 'abase/l5/Uris.s', 'wuribasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.uri && !!_global.wTools.uri.s && !!_global.wTools.uri.s.parse },
}

let wTraverser =
{
  sourcePath : sourcePath( 'abase/l4/Traverser.s', 'wtraverser' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.traverse },
}

let wBaseEncoder =
{
  sourcePath : sourcePath( 'abase/l4/Encoder.s', 'wbaseencoder' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.encode },
}

// base / l5

let wPathTools =
{
  sourcePath : sourcePath( 'abase/l5/PathTools.s', 'wpathtools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.path && !!_global.wTools.path.mapExtend },
}

let wSelector =
{
  sourcePath : sourcePath( 'abase/l5/Selector.s', 'wselector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.select; },
}

let wWebUriBasic =
{
  sourcePath : sourcePath( 'abase/l5/WebUri.s', 'wweburibasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.weburi },
}

let wCloner =
{
  sourcePath : sourcePath( 'abase/l5/Cloner.s', 'wcloner' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._clone },
}

let wStringsExtra =
{
  sourcePath : sourcePath( 'abase/l5/StringTools.s', 'wstringsextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.strSorterParse; },
}

let wProcessWatcher =
{
  sourcePath : sourcePath( 'abase/l5/ProcessWatcher.s', 'wprocesswatcher' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.process && !!_global.wTools.process.watchMaking; },
}

// base / l6

let wResolver =
{
  sourcePath : sourcePath( 'abase/l6/Resolver.s', 'wresolver' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.resolver; },
}

let wEqualer =
{
  sourcePath : sourcePath( 'abase/l6/Equaler.s', 'wequaler' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._equalIt },
}

let wSelectorExtra =
{
  sourcePath : sourcePath( 'abase/l6/SelectorExtra.s', 'wselectorextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.entityProbe; },
}

// base / l7

let wResolverExtra =
{
  sourcePath : sourcePath( 'abase/l7/ResolverExtra.s', 'wresolverextra' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.resolver && !!_global.wTools.resolveQualified; },
}

// base / l7_mixin

let wConsequizer =
{
  sourcePath : sourcePath( 'abase/l7_mixin/Consequizer.', 'wconsequizer' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Consequizer; },
}

let wCopyable =
{
  sourcePath : sourcePath( 'abase/l7_mixin/Copyable.s', 'wCopyable' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Copyable; },
}

let wInstancing =
{
  sourcePath : sourcePath( 'abase/l7_mixin/Instancing.s', 'winstancing' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Instancing; },
}

let wEventHandler =
{
  sourcePath : sourcePath( 'abase/l7_mixin/EventHandler.s', 'wEventHandler' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.EventHandler; },
}

let wFieldsStack =
{
  sourcePath : sourcePath( 'abase/l7_mixin/FieldsStack.s', 'wfieldsstack' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FieldsStack; },
}

// base / l8

let wProcedure =
{
  sourcePath : sourcePath( 'abase/l8_procedure/Include.s', 'wprocedure' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.procedure },
}

// base / l9

let wLogger =
{
  sourcePath : sourcePath( 'abase/l9/printer/top/Logger.s', 'wLogger' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Logger; },
}

let wPrinterToFile =
{
  sourcePath : sourcePath( 'abase/l9/printer/top/ToFile.ss', 'wloggertofile' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PrinterToFile; },
}

let wPrinterToJs =
{
  sourcePath : sourcePath( 'abase/l9/printer/top/ToJstructure.s', 'wloggertojs' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PrinterToJs; },
}

let wConsequence =
{
  sourcePath : sourcePath( 'abase/l9/consequence/Consequence.s', 'wConsequence' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Consequence; },
}

// abase_dom

let wDomBaseLayer1 =
{
  sourcePath : sourcePath( 'abase_dom/l1/Common.js', 'wdombaselayer1' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBaselayer1Loaded },
}

let wDomBaseLayer3 =
{
  sourcePath : sourcePath( 'abase_dom/l3/Common.js', 'wdombaselayer3' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBaselayer3Loaded },
}

let wDomBaseLayer5 =
{
  sourcePath : sourcePath( 'abase_dom/l5/Common.js', 'wdombasel5' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools._domBasel5Loaded },
}

// amid

// amid / l1

let wGdf =
{
  sourcePath : sourcePath( 'amid/l1/gdf/entry/Gdf.s', 'wgdf' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Gdf },
}

let wGraphBasic =
{
  sourcePath : sourcePath( 'amid/l1/graphBasic/IncludeTop.s', 'wgraphbasic' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.graph && !!_global.wTools.graph.AbstractGraphSystem },
}

let wGraphTools =
{
  sourcePath : sourcePath( 'amid/l1/graphTools/IncludeTop.s', 'wgraphtools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.graph && !!_global.wTools.graph.GraphSystem },
}

// let wGraphLive =
// {
//   sourcePath : sourcePath( 'amid/l1/graphTools/IncludeLive', 'wgraphlive' ),
//   isIncluded : function(){ return !!_global.wTools && !!_global.wTools.LiveSystem },
// }

let wRegexpObject =
{
  sourcePath : sourcePath( 'amid/l1/regexp/RegexpObject.s', 'wRegexpObject' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.RegexpObject; },
}

let wVocabulary =
{
  sourcePath : sourcePath( 'amid/l1/vocabulary/Vocabulary.s', 'wvocabulary' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Vocabulary },
}

let wSchema =
{
  sourcePath : sourcePath( 'amid/l1/schema/IncludeMid.s', 'wSchema' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.schema },
}

let wStxt =
{
  sourcePath : sourcePath( 'amid/l1/stxt/Include.s', 'wstxtparser' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.stxt && !!_global.wTools.stxt.Parser },
}

let wLoggerSocket =
{
  sourcePath : sourcePath( 'amid/l1_logger/Socket.s', 'wloggersocket' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.LoggerSocketReceiver },
}

let wHttp =
{
  sourcePath : sourcePath( 'amid/l1/http/Include.s', 'whttp' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.http },
}

// mid / l3

let wStager =
{
  sourcePath : sourcePath( 'amid/l3/stager/Stager.s', 'wstager' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Stager },
}

let wIntrospector =
{
  sourcePath : sourcePath( 'amid/l3/introspector/module/Full.s', 'wintrospector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.introspector && !!_global.wTools.thisFile },
}

let wPersistent =
{
  sourcePath : sourcePath( 'amid/l3/persistent/Include.s', 'wpersistent' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.persistent },
}

let wRemote =
{
  sourcePath : sourcePath( 'amid/l3/remote/Include.s', 'wremote' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.remote },
}

let wGitTools =
{
  sourcePath : sourcePath( 'amid/l3/git/entry/Include.s', 'wgittools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.git },
}

let wNpmTools =
{
  sourcePath : sourcePath( 'amid/l3/npm/Include.ss', 'wnpmtools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.npm },
}

let wYamlTools =
{
  sourcePath : sourcePath( 'amid/l3/yaml/IncludeMid.s', 'wyamltools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.yaml },
}

// mid / l3 / image

let wImage =
{
  sourcePath : sourcePath( 'amid/l3/image/entry/Image.s', 'wimage' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image },
}

let wImageReader =
{
  sourcePath : sourcePath( 'amid/l3/image/entry/Reader.s', 'wimagereader' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.reader },
}

let wImageWriter =
{
  sourcePath : sourcePath( 'amid/l3/image/entry/Writer.s', 'wimagewriter' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.writer },
}

let wImageReaderPng =
{
  sourcePath : sourcePath( 'amid/l3/image/entry/ReaderPng.s', 'wimagereaderpng' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.reader.Png },
}

let wImageReaderPngjs =
{
  sourcePath : sourcePath( 'amid/l3/image/entry/ReaderPngjs.s', 'wimagereaderpngjs' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.image.reader.Pngjs },
}

// mid / l4 / files

let wFiles =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/Files.s', 'wFiles' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider },
}

let wFilesArchive =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/Archive.s', 'wfilesarchive' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesArchive },
}

let wFilesEncoders =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/EncodersExtended.s', 'wfilesencoders' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.files && !!_global.wTools.files.ReadEncoders && !!_global.wTools.files.ReadEncoders.yml },
}

let wFilesExtract =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/Extract.ss', 'wfilesextract' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Extract },
}

let wFilesHardDrive =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/HardDrive.ss', 'wfilesharddrive' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.HardDrive },
}

let wFilesNpm =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/Npm.ss', 'wfilesnpm' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Npm },
}

let wFilesGit =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/Git.ss', 'wfilesgit' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Git },
}

let wFilesSvn =
{
  sourcePath : sourcePath( 'amid/l4_files/entry/Svn.ss', 'wfilesvn' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider.Svn },
}

let wFilesImap =
{
  sourcePath : sourcePath( 'amid/l4_files/l7_provider/Imap.ss', 'wfilesimap' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.fileProvider },
}

// mid / l5

let wCensorBasic =
{
  sourcePath : sourcePath( 'amid/l5/censor/entry/CensorBasic.s', 'wcensorbasic' ),
  isIncluded : function(){ return !!_global.censor && !!_global.censor.replace },
}

let wBitmask =
{
  sourcePath : sourcePath( 'amid/l5_mapper/Bitmask.s', 'wBitmask' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Bitmask },
}

let wPathTranslator =
{
  sourcePath : sourcePath( 'amid/l5_mapper/PathTranslator.s', 'wpathtranslator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.PathTranslator },
}

let wNameMapper =
{
  sourcePath : sourcePath( 'amid/l5_mapper/NameMapper.s', 'wnamemapper' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.NameMapper },
}

let wTemplateTreeResolver =
{
  sourcePath : sourcePath( 'amid/l5_mapper/TemplateTreeAresolver.s', 'wtemplatetreeresolver' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeResolver },
}

let wTemplateTreeResolver2 =
{
  sourcePath : sourcePath( 'amid/l5_mapper/TemplateTreeResolver2.s', 'wtemplatetreeresolver2' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeResolver2 },
}

let wTemplateTreeEnvironment =
{
  sourcePath : sourcePath( 'amid/l5_mapper/TemplateTreeEnvironment.s', 'wtemplatetreeenvironment' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateTreeEnvironment },
}

let wTemplateFileWriter =
{
  sourcePath : sourcePath( 'amid/l5_mapper/TemplateFileWriter.s', 'wtemplatefilewriter' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TemplateFileWriter },
}

//

let wColor =
{
  sourcePath : sourcePath( 'amid/color/Color.s', 'wColor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.color && !!_global.wTools.color.ColorMap },
}

let wColor256 =
{
  sourcePath : sourcePath( 'amid/color/Color256.s', 'wColor256' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.color && !!_global.wTools.color.ColorMap && Object.keys( _global.wTools.color.ColorMap ).length > 100 },
}

let wChangeTransactor =
{
  sourcePath : sourcePath( 'amid/changes/ChangeTransactor.s', 'wChangeTransactor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ChangeTransactor },
}

let wCommandsAggregator =
{
  sourcePath : sourcePath( 'amid/l7/commands/CommandsAggregator.s', 'wcommandsaggregator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CommandsAggregator },
}

let wCommandsConfig =
{
  sourcePath : sourcePath( 'amid/l7/commands/mixin/CommandsConfig.s', 'wcommandsconfig' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CommandsConfig },
}

let wFileExecutor =
{
  sourcePath : sourcePath( 'amid/l7/executor/FileExecutor.s', 'wFileExecutor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.wFileExecutor },
}

let wFileExecutorHtmlFormatters =
{
  sourcePath : sourcePath( 'amid/l7/executor/HtmlFormatters.s', 'wFileExecutorHtmlFormatters' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FileExecutorHtmlFormatters },
}

let wTimeMarker =
{
  sourcePath : sourcePath( 'amid/amixin/TimeMarker.s', 'wtimemarker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.TimeMarker },
}

let wVerbal =
{
  sourcePath : sourcePath( 'amid/amixin/Verbal.s', 'wverbal' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Verbal },
}

let wStateStorage =
{
  sourcePath : sourcePath( 'amid/amixin/aStateStorage.s', 'wstatestorage' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StateStorage },
}

let wStateSession =
{
  sourcePath : sourcePath( 'amid/amixin/StateSession.s', 'wstatesession' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StateSession },
}

let wScriptLauncher =
{
  sourcePath : sourcePath( 'amid/launcher/ScriptLauncher.s', 'wscriptlauncher' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ScriptLauncher },
}

let wExchangePoint =
{
  sourcePath : sourcePath( 'amid/exchangePoint/ExchangePoint.s', 'wExchangePoint' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.ExchangePoint },
}

let wCommunicator =
{
  sourcePath : sourcePath( 'amid/communicator/Communicator.s', 'wCommunicator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Communicator },
}

let wIncubator =
{
  sourcePath : sourcePath( 'amid/worker/Incubator.s', 'wIncubator' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Incubator },
}

let wCollectionOfInstances =
{
  sourcePath : sourcePath( 'amid/container/CollectionOfInstances.s', 'wcollectionofinstances' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.CollectionOfInstances },
}

let wServletTools =
{
  sourcePath : sourcePath( 'amid/servlet/ServletTools.ss', 'wservlettools' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.servlet },
}

// math

let wMathScalar =
{
  sourcePath : sourcePath( 'amath/l1/Scalar.s', 'wmathscalar' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.math && !!_global.wTools.math.clamp },
}

let wMathVector =
{
  sourcePath : sourcePath( 'amath/l3_vector/Include.s', 'wmathvector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.avector && !!_global.wTools.avector.abs },
}

let wMathMatrix =
{
  sourcePath : sourcePath( 'amath/l5_matrix/module/full/Include.s', 'wmathmatrix' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Space },
}

let wMathGeometric =
{
  sourcePath : sourcePath( 'amath/l6/Geometric.s', 'wmathgeometric' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.math.d2TriPointInside },
}

let wMathConcepts =
{
  sourcePath : sourcePath( 'amath/l8/Concepts.s', 'wmathconcepts' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.box },
}

// top

let willbe =
{
  sourcePath : sourcePath( 'atop/will/entry/Include.s', 'willbe' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Will },
}

let wStarter =
{
  sourcePath : sourcePath( 'atop/starter/entry/Main.s', 'wstarter' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.StarterMaker },
}

let wTesting =
{
  sourcePath : sourcePath( 'atop/tester/entry/Main.s', 'wTesting' ),
  isIncluded : function(){ return _realGlobal_.wTester && _realGlobal_.wTester._isReal_; },
}

let wTranspile =
{
  sourcePath : sourcePath( 'atop/transpile/entry/Include.s', 'wtranspile' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.trs },
}

let wFilesOperationsDirector =
{
  sourcePath : sourcePath( 'atop/files/OperationsDirector.s', 'wfilesoperationsdirector' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesOperationsDirector },
}

let wFilesLinker =
{
  sourcePath : sourcePath( 'atop/files/Linker.s', 'wfileslinker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.FilesLinker },
}

let wBaker =
{
  sourcePath : sourcePath( 'atop/baker/Baker.s', 'wBaker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Baker },
}

let wBakerWithFileExecutor =
{
  sourcePath : sourcePath( 'atop/baker/BakerWithFileExecutor.s', 'wBakerWithFileExecutor' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.wBakerWithFileExecutor },
}

let wMaker =
{
  sourcePath : sourcePath( 'atop/maker/Maker.s', 'wMaker' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.Maker },
}

let wPuppet =
{
  sourcePath : sourcePath( 'atop/puppet/Main.s', 'wpuppet' ),
  isIncluded : function(){ return !!_global.wTools && !!_global.wTools.puppet },
}

let wFiler =
{
  sourcePath : sourcePath( 'atop/filer/entry/Exec', 'wfiler' ),
  isIncluded : function(){ return !!_global.filer && !!_global.filer.Cui },
}

// --
// declare
// --

let Modules =
{

  // base / l1

  wTools,

  // base / l2

  wBlueprint,
  wEntityBasic,
  wLooker,
  wPathBasic,
  wRoutineBasic,

  // base / l3

  wProto,
  wStringer,

  // base / l4

  wReplicator,
  wLookerExtra,
  wArraySorted,
  wArraySparse,
  wProcess,
  wUriBasic,
  wTraverser,
  wBaseEncoder,

  // base / l5

  wPathTools,
  wSelector,
  wWebUriBasic,
  wCloner,
  wStringsExtra,
  wProcessWatcher,

  // base / l6

  wResolver,
  wEqualer,
  wSelectorExtra,

  // base / l7

  wResolverExtra,

  // base / l7_mixin

  wConsequizer,
  wCopyable,
  wInstancing,
  wEventHandler,
  wFieldsStack,

  // base / l8

  wProcedure,

  // base / l9

  wLogger,
  wPrinterToFile,
  wPrinterToJs,
  wConsequence,

  // base_dom

  wDomBaseLayer1,
  wDomBaseLayer3,
  wDomBaseLayer5,

  // mid

  // mid / l1

  wGdf,
  wGraphBasic,
  wGraphTools,
  wRegexpObject,
  wVocabulary,
  wSchema,
  wStxt,

  wLoggerSocket,
  wHttp,

  // mid / l3

  wStager,
  wIntrospector,
  wPersistent,
  wRemote,
  wGitTools,
  wNpmTools,
  wYamlTools,

  // mid / l3 / image

  /* xxx : move to l4 */

  wImage,
  wImageReader,
  wImageWriter,
  wImageReaderPng,
  wImageReaderPngjs,

  // amid / l4 / files

  wFiles,
  wFilesArchive,
  wFilesEncoders,
  wFilesExtract,
  wFilesHardDrive,
  wFilesNpm,
  wFilesGit,
  wFilesSvn,
  wFilesImap,

  // amid / l5

  wCensorBasic,
  wBitmask,
  wPathTranslator,
  wNameMapper,
  wTemplateTreeResolver,
  wTemplateTreeResolver2,
  wTemplateTreeEnvironment,
  wTemplateFileWriter,

  //

  wColor,
  wColor256,
  wChangeTransactor,
  wCommandsAggregator,
  wCommandsConfig,

  wFileExecutor,
  wFileExecutorHtmlFormatters,

  wTimeMarker,
  wVerbal,
  wStateStorage,
  wStateSession,

  wScriptLauncher,
  wExchangePoint,
  wCommunicator,
  wIncubator,
  wCollectionOfInstances,
  wServletTools,

  // math

  wMathScalar,
  wMathVector,
  wMathMatrix,
  wMathGeometric,
  wMathConcepts,

  // top

  willbe,
  wStarter,
  wTesting,
  wTranspile,
  wFilesOperationsDirector,
  wFilesLinker,
  wBaker,
  wBakerWithFileExecutor,
  wMaker,
  wPuppet,
  wFiler,

}

Object.assign( _.module.modulesToRegister, Modules );
if( _.module.declareAll )
_.module.declareAll({ modules : _.module.modulesToRegister, basePath : __dirname });

/*
xxx : remove isIncluded
*/

// _.mapSupplement( _global.ModulesRegistry, Modules );
// if( _.module )
// _.module.registerKnown( _global.ModulesRegistry );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();

/* xxx : rename
- wequaler -> wequaler
- wpathbasic -> wpathbasic
- wuribasic -> wuribasic
- wprocess -> wprocess
- wentitybasic -> wentitybasic
- wweburibasic -> wweburibasic
- wroutinebasic -> wroutinebasic
- wdombasic -> wdombasic

- wEqualer -> wEqualer
- wPathBasic -> wPathBasic
- wUriBasic -> wUriBasic
- wProcess -> wProcessBasic
- wEntityBasic -> wEntityBasic
- wWebUriBasic -> wWebUriBasic
- wRoutineBasic -> wRoutineBasic
- wDomBasic -> wDomBasic
*/
