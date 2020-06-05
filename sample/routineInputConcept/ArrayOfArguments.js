let pseudoArray = { 0 : 'value 1', 1 : 'value 2', 2 : 'value 3', length : 3 };

// conversion of a pseudo array of `arguments`
function foo()
{
  console.log( arguments instanceof Array ); // false
  const argumentsArr = Array.from( arguments );
  console.log( argumentsArr instanceof Array ); // true
}
foo( 'hello', 'world' );

// different ways to access a routine argument
function logMsgs( msg1, msg2 )
{
  if( msg1 && !msg2 )
  console.log( msg1 );
  if( !msg1 && msg2 )
  console.log( msg2, arguments[ 1 ] );  // two variants of calls of signed parameter
  if( arguments[ 2 ] )
  console.log( arguments[ 2 ] );
}

logMsgs( 'one' ); // returns one
logMsgs( null, 'two' ) // returns two two
logMsgs( null, undefined, 'three' ) // returns three
logMsgs( 'one', 'two', 'three', 'four', 'five' ) // returns three
