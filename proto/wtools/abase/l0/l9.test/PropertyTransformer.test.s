( function _l0_l9_PropertyTransformer_test_s()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( 'Tools' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;

//--
// tests
//--

function mapperIs( test )
{
  test.case = 'primitive bool';
  var got = _.props.mapperIs( true );
  test.identical( got, false );

  test.case = 'primitive str';
  var got = _.props.mapperIs( 'hello' );
  test.identical( got, false );

  test.case = 'primitive number';
  var got = _.props.mapperIs( 1 );
  test.identical( got, false );

  test.case = 'empty object';
  var got = _.props.mapperIs({});
  test.identical( got, false );

  test.case = 'object with identity field';
  var src = { identity : { propertyMapper : true, propertyTransformer : true } }
  var got = _.props.mapperIs( src );
  test.identical( got, false );

  test.case = 'plain routine';
  var got = _.props.mapperIs( plain );
  test.identical( got, false );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  var got = _.props.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom filter without propertyTransformer';
  filter.identity = { propertyFilter : true }
  var src = filter;
  var got = _.props.mapperIs( filter );
  test.identical( got, false );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom filter';
  filter.identity = { propertyFilter : true, propertyTransformer : true }
  var src = filter;
  var got = _.props.mapperIs( filter );
  test.identical( got, false );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom filter functor';
  filter.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var src = filter;
  var got = _.props.mapperIs( filter );
  test.identical( got, false );

  test.case = 'existing mapper';
  var got = _.props.mapperIs( _.props.mapper[ 'assigning' ] );
  test.identical( got, true );

  test.case = 'existing filter';
  var got = _.props.mapperIs( _.props.filter[ 'dstAndSrcOwn' ] );
  test.identical( got, false );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

}

//

function filterIs( test )
{
  test.case = 'primitive bool';
  var got = _.props.filterIs( true );
  test.identical( got, false );

  test.case = 'primitive str';
  var got = _.props.filterIs( 'hello' );
  test.identical( got, false );

  test.case = 'primitive number';
  var got = _.props.filterIs( 1 );
  test.identical( got, false );

  test.case = 'empty object';
  var got = _.props.filterIs({});
  test.identical( got, false );

  test.case = 'object with identity field';
  var src = { identity : { propertyMapper : true, propertyTransformer : true } }
  var got = _.props.filterIs( src );
  test.identical( got, false );

  test.case = 'plain routine';
  var got = _.props.filterIs( plain );
  test.identical( got, false );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  var got = _.props.filterIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom filter without propertyTransformer';
  filter.identity = { propertyFilter : true }
  var src = filter;
  var got = _.props.filterIs( filter );
  test.identical( got, true );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.filterIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom filter';
  filter.identity = { propertyFilter : true, propertyTransformer : true }
  var src = filter;
  var got = _.props.filterIs( filter );
  test.identical( got, true );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.filterIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom filter functor';
  filter.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var src = filter;
  var got = _.props.filterIs( filter );
  test.identical( got, true );

  test.case = 'existing mapper';
  var got = _.props.filterIs( _.props.mapper[ 'assigning' ] );
  test.identical( got, false );

  test.case = 'existing filter';
  var got = _.props.filterIs( _.props.filter[ 'dstAndSrcOwn' ] );
  test.identical( got, true );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

}

//

function mapperFromFilter( test )
{
  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'existing mapper';
  var src = _.props.mapper[ 'assigning' ];
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'existing filter';
  var src = _.props.filter[ 'dstAndSrcOwn' ];
  var got = _.props.mapperFromFilter( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  if( !Config.debug )
  return;

  test.case = 'primitive'
  test.shouldThrowErrorSync( () => _.props.mapperFromFilter( 'hello' ) )

  test.case = 'plain routine'
  test.shouldThrowErrorSync( () => _.props.mapperFromFilter( plain ) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function mapperFrom( test )
{
  test.case = 'plain routine';
  var src = plain;
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'existing mapper';
  var src = _.props.mapper[ 'assigning' ];
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'existing filter';
  var src = _.props.filter[ 'dstAndSrcOwn' ];
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  if( !Config.debug )
  return;

  test.case = 'primitive'
  test.shouldThrowErrorSync( () => _.props.mapperFrom( 'hello' ) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function filterFrom( test )
{
  test.case = 'plain routine';
  var src = plain;
  var got = _.props.filterFrom( src );
  test.true( _.props.filterIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  var got = _.props.filterFrom( src );
  test.true( _.props.filterIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  var got = _.props.filterFrom( src );
  test.true( _.props.filterIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  var got = _.props.filterFrom( src );
  test.true( _.props.filterIs( got ) );
  test.true( got === src );

  test.case = 'existing filter';
  var src = _.props.filter[ 'dstAndSrcOwn' ];
  var got = _.props.filterFrom( src );
  test.true( _.props.filterIs( got ) );
  test.true( got === src );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.props.filterFrom( 'hello' ) );

  test.case = 'custom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  test.shouldThrowErrorSync( () => _.props.filterFrom( src ) );

  test.case = 'existing mapper';
  var src = _.props.mapper[ 'assigning' ]
  test.shouldThrowErrorSync( () => _.props.filterFrom( src ) );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }
}

//

function transformerRegister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.props.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.props.filter ) );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  test.true( _.props.filter[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.filterIs( src ) );
  test.true( _.props.filterIs( _.props.filter[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  test.true( _.props.filter[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.filterIs( src ) );
  test.true( _.props.filterIs( _.props.filter[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  test.true( _.props.filter[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.filterIs( src ) );
  test.true( _.props.filterIs( _.props.filter[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'existing mapper with custom name';
  var src = _.props.mapper[ 'assigning' ];
  var srcName = 'existingMapper';
  test.true( _.routine.is( _.props.mapper[ 'assigning' ] ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );

  test.case = 'existing filter with custom name';
  var src = _.props.filter[ 'dstAndSrcOwn' ];
  var srcName = 'existingFilter';
  test.true( test.true( _.routine.is( _.props.filter[ 'dstAndSrcOwn' ] ) ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.filterIs( src ) );
  test.true( _.props.filterIs( _.props.filter[ srcName ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );

  _.props.transformersUnregister
  (
    [
      mapper1.name,
      filter1.name,
      mapper2.name,
      filter2.name,
      mapper3.name,
      filter3.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.props.transformersUnregister
  (
    [
      filter1.name,
      filter2.name,
      filter3.name,
      'existingFilter',
    ],
    'filter'
  );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.props.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( plain ) )

  test.case = 'plain routine';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( 'hello' ) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( _.props.mapper[ 'assigning' ] ) )

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( _.props.filter[ 'dstAndSrcOwn' ] ) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function transformersRegister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.props.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.props.filter ) );

  addIdentity();

  test.case = 'check not registered';
  test.true( _.props.mapper[ mapper1.name ] === undefined );
  test.true( _.props.filter[ filter1.name ] === undefined );

  test.true( _.props.mapper[ mapper2.name ] === undefined );
  test.true( _.props.filter[ filter2.name ] === undefined );
  test.true( _.props.mapper[ filter2.name ] === undefined );//

  test.true( _.props.mapper[ mapper3.name ] === undefined );
  test.true( _.props.filter[ filter3.name ] === undefined );
  test.true( _.props.mapper[ filter3.name ] === undefined );

  test.true( _.props.mapper[ mapper4.name ] === undefined );
  test.true( _.props.filter[ filter4.name ] === undefined );
  test.true( _.props.mapper[ filter4.name ] === undefined );

  test.true( _.props.mapper[ 'existingMapper' ] === undefined );
  test.true( _.props.filter[ 'existingFilter' ] === undefined );
  test.true( _.props.mapper[ 'existingFilter' ] === undefined );

  var transformers =
  {
    [ mapper3.name ] : mapper3,
    [ filter3.name ] : filter3,
    [ mapper4.name ] : mapper4,
    [ filter4.name ] : filter4,
    'existingMapper' : _.props.mapper[ 'assigning' ],
    'existingFilter' : _.props.filter[ 'dstAndSrcOwn' ],
  }

  _.props.transformersRegister( transformers );

  test.case = 'check registered';
  test.true( _.props.mapperIs( _.props.mapper[ mapper3.name ] ) );
  test.true( _.props.filterIs( _.props.filter[ filter3.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ filter3.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ mapper4.name ] ) );
  test.true( _.props.filterIs( _.props.filter[ filter4.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ filter4.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ 'existingMapper' ] ) );
  test.true( _.props.filterIs( _.props.filter[ 'existingFilter' ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ 'existingFilter' ] ) );

  _.props.transformersUnregister
  (
    [
      mapper3.name,
      filter3.name,
      mapper4.name,
      filter4.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.props.transformersUnregister
  (
    [
      filter3.name,
      filter4.name,
      'existingFilter',
    ],
    'filter'
  );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.props.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters( 'hello' ) )

  test.case = 'plain routine';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ plain.name ] : plain }) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ 'assigning' : _.props.mapper[ 'assigning' ] }) )

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ 'dstAndSrcOwn' : _.props.filter[ 'dstAndSrcOwn' ] }) )

  test.case = 'not functor mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ mapper1.name ] : mapper1 }) )

  test.case = 'not functor filter';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ filter1.name ] : filter1 }) )

  test.case = 'not functor mapper transformer';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ mapper2.name ] : mapper2 }) )

  test.case = 'not functor filter transformer';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ filter2.name ] : filter2 }) )

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

  function mapper4()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }

  }

  function filter4()
  {
    let routine = notIdentical;
    routine.identity = { propertyFilter : true, propertyTransformer : true }; ;
    return routine;
    function notIdentical( dstContainer, srcContainer, key )
    {
      if( dstContainer[ key ] === srcContainer[ key ] )
      return false;
      return true;
    }
  }

  function addIdentity()
  {
    mapper1.identity = { propertyMapper : true };
    filter1.identity = { propertyFilter : true };

    mapper2.identity = { propertyMapper : true, propertyTransformer : true };
    filter2.identity = { propertyFilter : true, propertyTransformer : true };

    mapper3.identity = { propertyMapper : true, functor : true };
    filter3.identity = { propertyFilter : true, functor : true }

    mapper4.identity = { propertyMapper : true, propertyTransformer : true, functor : true };
    filter4.identity = { propertyFilter : true, propertyTransformer : true, functor : true };
  }

}

//

function transformerUnregister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.props.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.props.filter ) );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom filter without propertyTransformer';
  var src = filter1;
  src.identity = { propertyFilter : true }
  test.true( _.props.filter[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.filterIs( _.props.filter[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  _.props.transformerUnregister( src.name, 'filter' );
  test.true( _.props.filter[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom filter';
  var src = filter2;
  src.identity = { propertyFilter : true, propertyTransformer : true }
  test.true( _.props.filter[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.filterIs( _.props.filter[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  _.props.transformerUnregister( src.name, 'filter' );
  test.true( _.props.filter[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom filter functor';
  var src = filter3;
  src.identity = { propertyFilter : true, propertyTransformer : true, functor : true }
  test.true( _.props.filter[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.filterIs( _.props.filter[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  _.props.transformerUnregister( src.name, 'filter' );
  test.true( _.props.filter[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'existing mapper with custom name';
  var src = _.props.mapper[ 'assigning' ];
  var srcName = 'existingMapper';
  test.true( _.routine.is( _.props.mapper[ 'assigning' ] ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );
  _.props.transformerUnregister( srcName, 'mapper' );
  test.true( _.props.mapper[ srcName ] === undefined );

  test.case = 'existing filter with custom name';
  var src = _.props.filter[ 'dstAndSrcOwn' ];
  var srcName = 'existingFilter';
  test.true( test.true( _.routine.is( _.props.filter[ 'dstAndSrcOwn' ] ) ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.filterIs( _.props.filter[ srcName ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );
  _.props.transformerUnregister( srcName, 'mapper' );
  _.props.transformerUnregister( srcName, 'filter' );
  test.true( _.props.filter[ srcName ] === undefined );
  test.true( _.props.mapper[ srcName ] === undefined );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.props.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'routine';
  test.shouldThrowErrorSync( () => _.props.transformerUnregister( plain ) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerUnregister( 'hello', 'mapper' ) )

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.props.transformerUnregister( 'hello', 'filter' ) )


  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

}

//

function transformersUnregister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.props.mapper ) );
  let filterBefore = new Set( Object.getOwnPropertyNames( _.props.filter ) );

  addIdentity();

  test.case = 'check not registered';
  test.true( _.props.mapper[ mapper1.name ] === undefined );
  test.true( _.props.filter[ filter1.name ] === undefined );

  test.true( _.props.mapper[ mapper2.name ] === undefined );
  test.true( _.props.filter[ filter2.name ] === undefined );
  test.true( _.props.mapper[ filter2.name ] === undefined );//

  test.true( _.props.mapper[ mapper3.name ] === undefined );
  test.true( _.props.filter[ filter3.name ] === undefined );
  test.true( _.props.mapper[ filter3.name ] === undefined );

  test.true( _.props.mapper[ mapper4.name ] === undefined );
  test.true( _.props.filter[ filter4.name ] === undefined );
  test.true( _.props.mapper[ filter4.name ] === undefined );

  test.true( _.props.mapper[ 'existingMapper' ] === undefined );
  test.true( _.props.filter[ 'existingFilter' ] === undefined );
  test.true( _.props.mapper[ 'existingFilter' ] === undefined );

  var transformers =
  {
    [ mapper3.name ] : mapper3,
    [ filter3.name ] : filter3,
    [ mapper4.name ] : mapper4,
    [ filter4.name ] : filter4,
    'existingMapper' : _.props.mapper[ 'assigning' ],
    'existingFilter' : _.props.filter[ 'dstAndSrcOwn' ],
  }

  _.props.transformersRegister( transformers );

  test.case = 'check registered';
  test.true( _.props.mapperIs( _.props.mapper[ mapper3.name ] ) );
  test.true( _.props.filterIs( _.props.filter[ filter3.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ filter3.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ mapper4.name ] ) );
  test.true( _.props.filterIs( _.props.filter[ filter4.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ filter4.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ 'existingMapper' ] ) );
  test.true( _.props.filterIs( _.props.filter[ 'existingFilter' ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ 'existingFilter' ] ) );

  _.props.transformersUnregister
  (
    [
      mapper3.name,
      filter3.name,
      mapper4.name,
      filter4.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.props.transformersUnregister
  (
    [
      filter3.name,
      filter4.name,
      'existingFilter',
    ],
    'filter'
  );

  test.case = 'check unregistered';
  test.true( _.props.mapper[ mapper1.name ] === undefined );
  test.true( _.props.filter[ filter1.name ] === undefined );

  test.true( _.props.mapper[ mapper2.name ] === undefined );
  test.true( _.props.filter[ filter2.name ] === undefined );
  test.true( _.props.mapper[ filter2.name ] === undefined );//

  test.true( _.props.mapper[ mapper3.name ] === undefined );
  test.true( _.props.filter[ filter3.name ] === undefined );
  test.true( _.props.mapper[ filter3.name ] === undefined );

  test.true( _.props.mapper[ mapper4.name ] === undefined );
  test.true( _.props.filter[ filter4.name ] === undefined );
  test.true( _.props.mapper[ filter4.name ] === undefined );

  test.true( _.props.mapper[ 'existingMapper' ] === undefined );
  test.true( _.props.filter[ 'existingFilter' ] === undefined );
  test.true( _.props.mapper[ 'existingFilter' ] === undefined );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( filterBefore, new Set( Object.getOwnPropertyNames( _.props.filter ) ) );

  if( !Config.debug )
  return;

  test.case = 'routine';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ plain.name ] : plain }) );

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters( [ 'hello' ], 'mapper' ) );

  test.case = 'existing filter';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters( [ 'hello' ], 'filter' ) );

  /* - */

  function plain()
  {
    return 1 + 2;
  }

  function mapper1()
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : false,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function mapper2( dstContainer, srcContainer, key )
  {
    let properties =
    {
      value : srcContainer[ key ],
      enumerable : false,
      configurable : true,
    };
    Object.defineProperty( dstContainer, key, properties );
  }

  function filter2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function mapper3()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }
  }

  function filter3()
  {
    let routine = primitive;
    routine.identity = { propertyFilter : true, propertyTransformer : true };
    return routine;

    function primitive( dstContainer, srcContainer, key )
    {
      if( !_.primitive.is( srcContainer[ key ] ) )
      return false;

      return true;
    }
  }

  function mapper4()
  {
    let routine = hiding;

    routine.identity = { propertyMapper : true, propertyTransformer : true };
    return routine;

    function hiding( dstContainer, srcContainer, key )
    {
      let properties =
      {
        value : srcContainer[ key ],
        enumerable : false,
        configurable : true,
      };
      Object.defineProperty( dstContainer, key, properties );
    }

  }

  function filter4()
  {
    let routine = notIdentical;
    routine.identity = { propertyFilter : true, propertyTransformer : true }; ;
    return routine;
    function notIdentical( dstContainer, srcContainer, key )
    {
      if( dstContainer[ key ] === srcContainer[ key ] )
      return false;
      return true;
    }
  }

  function addIdentity()
  {
    mapper1.identity = { propertyMapper : true };
    filter1.identity = { propertyFilter : true };

    mapper2.identity = { propertyMapper : true, propertyTransformer : true };
    filter2.identity = { propertyFilter : true, propertyTransformer : true };

    mapper3.identity = { propertyMapper : true, functor : true };
    filter3.identity = { propertyFilter : true, functor : true }

    mapper4.identity = { propertyMapper : true, propertyTransformer : true, functor : true };
    filter4.identity = { propertyFilter : true, propertyTransformer : true, functor : true };
  }

}

// --
// define test suite
// --

const Proto =
{

  name : 'Tools.PropertyTransformer',
  silencing : 1,

  tests :
  {

    // l5

    mapperIs,
    filterIs,
    mapperFromFilter,
    mapperFrom,
    filterFrom,
    transformerRegister,
    transformersRegister,
    transformerUnregister,
    transformersUnregister,
  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
