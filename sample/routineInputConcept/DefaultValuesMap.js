const _ = require( 'wTools' );

function someFunction( o )
{
  if( !o.randomTotal )
  o.randomTotal = someFunction.defaults.randomTotal;

  const result = [];
  for( let i = 0; i < o.randomTotal; i++ )
  result.push( _.intRandom( [ -100, 100 ] ) );

  return result;
}
someFunction.defaults =
{
  randomTotal : 1
}

console.log( someFunction( { } ) );
// returns [ someRandomIntegerNumber ]
console.log( someFunction( { randomTotal : 2 } ) );
// returns [ someRandomIntegerNumber, someRandomIntegerNumber ]
