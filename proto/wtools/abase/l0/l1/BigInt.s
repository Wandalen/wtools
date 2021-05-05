( function _l1_BigInt_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.bigInt = _.bigInt || Object.create( null );

// --
// implementation
// --

function is( src )
{
  let result = Object.prototype.toString.call( src ) === '[object BigInt]';
  return result;
}

//

function exportStringCodeShallow( src )
{
  _.assert( arguments.length === 1, 'Expects exactly one argument' );
  _.assert( _.bigInt.is( src ) );

  return `${String( src )}n`;
}

// --
// extension
// --

let ToolsExtension =
{

  bigIntIs : is,

}

Object.assign( _, ToolsExtension );

//

let BigIntExtension =
{

  //

  is,

  // exporter

  exportString : exportStringCodeShallow,
  // exportStringDiagnosticShallow : exportStringCodeShallow,
  exportStringCodeShallow,
  exportStringDiagnosticShallow : exportStringCodeShallow,
  // // exportStringDiagnostic : exportStringCodeShallow,
  // exportStringCode : exportStringCodeShallow,

}

Object.assign( _.bigInt, BigIntExtension );

})();
