( function _String_toStr2_test_s_( ) {

'use strict';

/*

 to run this test
 from the project directory run

 npm install
 node ./staging/abase/z.tests/String.toStr2.test.s

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

var toStr = function( test )
{
  var cases =
  [
    {
      desc :  'empty arguments',
      src : [ {}, '', [] ],
      options : [ {} ],
      expected :[ '{}', '""', '[]' ]
    },

    {
      desc :  'Symbol,options empty',
      src :
      [
        Symbol(),
        Symbol('sm'),
        Symbol('sm')

      ],
      options :
      [
        {},
        {},
        { levels : 0 }
      ],
      expected :
      [
        'Symbol()',
        'Symbol(sm)',
        'Symbol(sm)'
      ]
    }
  ];

  debugger;
  for( var i = 0; i < cases.length; ++i )
  {
    var _case = cases[ i ];
    var src = _case['src'];
    var exp = _case['expected'];
    var o = _case['options'];

    for( var k = 0; k < src.length; ++k  )
    {
      test.description = _case.desc;
      var got = _.toStr( src[ k ], o[ k ] || o[ 0 ] );
      var expected = exp[ k ];
      test.identical( got,expected )
    }


  }
  debugger;

}

// node ./staging/abase/z.tests/String.toStr2.test.s

//

var Proto =
{

  name : 'toStr',

  tests:
  {
      toStr : toStr


  }

};

_.mapExtend( Self,Proto );

if( typeof module !== 'undefined' && !module.parent )
  _.testing.test( Self );

} )( );
