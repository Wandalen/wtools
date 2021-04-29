( function _l0_l3_Set_test_s_()
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
// tests
// --

function aptLeft( test )
{

  /* */

  test.case = 'left';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 1, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 2, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 3, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      3,
      3,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 3, 3, 2, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      1,
      1,
      0,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      3,
      3,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = new Set([]);
  var ops = [];
  var got = _.set.aptLeft( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = new Set([ 1, 2, 3 ]);
  var exp = [ 1, 1, 0, true ];
  var got = _.set.aptLeft( src );
  test.identical( got, exp );
  var exp = [ 1, 1, 0, true ];
  var got = _.set.first( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = new Set([]);
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.aptLeft( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.first( src );
  test.identical( got, exp );

  /* */

}

//

function aptRight( test )
{

  /* */

  test.case = 'left';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 1 )
    return val + 10;
  });
  var exp = [ 11, 1, 0, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      1,
      1,
      0,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'middle';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 2 )
    return val + 10;
  });
  var exp = [ 12, 2, 1, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'right';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 3 )
    return val + 10;
  });
  var exp = [ 13, 3, 2, true ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ]
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'no';
  var src = new Set([ 1, 2, 3 ]);
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ 1, 1, 0, false ];
  test.identical( got, exp );
  var exp =
  [
    [
      3,
      3,
      2,
      src,
    ],
    [
      2,
      2,
      1,
      src,
    ],
    [
      1,
      1,
      0,
      src,
    ],
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'empty';
  var src = new Set([]);
  var ops = [];
  var got = _.set.aptRight( src, function( val )
  {
    ops.push( Array.prototype.slice.call( arguments ) );
    if( val === 4 )
    return val + 10;
  });
  var exp = [ undefined, undefined, -1, false ];
  test.identical( got, exp );
  var exp =
  [
  ]
  test.identical( ops, exp );

  /* */

  test.case = 'without callback';
  var src = new Set([ 1, 2, 3 ]);
  var exp = [ 3, 3, 2, true ];
  var got = _.set.aptRight( src );
  test.identical( got, exp );
  var exp = [ 3, 3, 2, true ];
  var got = _.set.last( src );
  test.identical( got, exp );

  /* */

  test.case = 'without callback, empty';
  var src = new Set([]);
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.aptRight( src );
  test.identical( got, exp );
  var exp = [ undefined, undefined, -1, false ];
  var got = _.set.last( src );
  test.identical( got, exp );

  /* */

}

// --
// declaration
// --

const Proto =
{

  name : 'Tools.Set.l0.l3',
  silencing : 1,

  tests :
  {

    aptLeft,
    aptRight,

  }

}

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
