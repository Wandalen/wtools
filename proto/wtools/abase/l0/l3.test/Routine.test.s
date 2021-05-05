( function _l0_l3_Routine_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../Include3.s' );
  require( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// test
// --

function exportStringDiagnosticShallow( test )
{

  test.case = 'function';
  var src = plain;
  var expected = '{- routine plain -}';
  var got = _.routine.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'async function';
  var src = async;
  var expected = '{- routine async -}';
  var got = _.routine.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'arrow function';
  var arrow = () => {};
  var src = arrow;
  var expected = '{- routine arrow -}';
  var got = _.routine.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'anonymos function';
  var expected = '{- routine.anonymous -}';
  var got = _.routine.exportStringDiagnosticShallow( function () {} );
  test.identical( got, expected );

  test.case = 'anonymos arrow function';
  var expected = '{- routine.anonymous -}';
  var got = _.routine.exportStringDiagnosticShallow( () => {} );
  test.identical( got, expected );

  test.case = 'func expression';
  var expr = function () {};
  var src = expr;
  var expected = '{- routine expr -}';
  var got = _.routine.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  test.case = 'func expression with name';
  var expr = function expr2() {};
  var src = expr;
  var expected = '{- routine expr2 -}';
  var got = _.routine.exportStringDiagnosticShallow( src );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'without argument';
  test.shouldThrowErrorSync( () => _.routine.exportStringDiagnosticShallow() );

  test.case = 'extra arguments';
  test.shouldThrowErrorSync( () => _.routine.exportStringDiagnosticShallow( () => {}, () => {} ) );

  test.case = 'wrong type';
  test.shouldThrowErrorSync( () => _.routine.exportStringDiagnosticShallow( {} ) );

  /* - */

  function plain() {};
  async function async() {};
}

// --
//
// --

const Proto =
{

  name : 'Tools.Routine.l0.l3',
  silencing : 1,

  tests :
  {

    exportStringDiagnosticShallow,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
