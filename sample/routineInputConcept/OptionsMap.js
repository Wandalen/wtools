function someFunction1( optionsMap )
{
  if( optionsMap.option1 >= 0 )
  {
    console.log( 'option1' );
    // some code
  }

  if( optionsMap.option2 < 0 )
  {
    console.log( 'option2' );
    // some code
  }
}
someFunction1( { option1 : 1, option2 : 2 } ); // logs option1

// creating new routines by reusing the original routine code
function someFunction2( mapOptions )
{
  let result = someFunction1( mapOptions );
  // some code
}
