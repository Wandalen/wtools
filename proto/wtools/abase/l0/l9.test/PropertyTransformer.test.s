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

  test.case = 'routine - сustom condition without propertyTransformer';
  condition.identity = { propertyCondition : true }
  var src = condition;
  var got = _.props.mapperIs( condition );
  test.identical( got, false );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom condition';
  condition.identity = { propertyCondition : true, propertyTransformer : true }
  var src = condition;
  var got = _.props.mapperIs( condition );
  test.identical( got, false );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperIs( mapper );
  test.identical( got, true );

  test.case = 'routine - сustom condition functor';
  condition.identity = { propertyCondition : true, propertyTransformer : true, functor : true }
  var src = condition;
  var got = _.props.mapperIs( condition );
  test.identical( got, false );

  test.case = 'existing mapper';
  var got = _.props.mapperIs( _.props.mapper[ 'assigning' ] );
  test.identical( got, true );

  test.case = 'existing condition';
  var got = _.props.mapperIs( _.props.condition[ 'dstAndSrcOwn' ] );
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

  function condition( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

}

//

function conditionIs( test )
{
  test.case = 'primitive bool';
  var got = _.props.conditionIs( true );
  test.identical( got, false );

  test.case = 'primitive str';
  var got = _.props.conditionIs( 'hello' );
  test.identical( got, false );

  test.case = 'primitive number';
  var got = _.props.conditionIs( 1 );
  test.identical( got, false );

  test.case = 'empty object';
  var got = _.props.conditionIs({});
  test.identical( got, false );

  test.case = 'object with identity field';
  var src = { identity : { propertyMapper : true, propertyTransformer : true } }
  var got = _.props.conditionIs( src );
  test.identical( got, false );

  test.case = 'plain routine';
  var got = _.props.conditionIs( plain );
  test.identical( got, false );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  var got = _.props.conditionIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom condition without propertyTransformer';
  condition.identity = { propertyCondition : true }
  var src = condition;
  var got = _.props.conditionIs( condition );
  test.identical( got, true );

  test.case = 'routine - сustom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.conditionIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom condition';
  condition.identity = { propertyCondition : true, propertyTransformer : true }
  var src = condition;
  var got = _.props.conditionIs( condition );
  test.identical( got, true );

  test.case = 'routine - сustom mapper functor';
  var src = mapper;
  mapper.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.conditionIs( mapper );
  test.identical( got, false );

  test.case = 'routine - сustom condition functor';
  condition.identity = { propertyCondition : true, propertyTransformer : true, functor : true }
  var src = condition;
  var got = _.props.conditionIs( condition );
  test.identical( got, true );

  test.case = 'existing mapper';
  var got = _.props.conditionIs( _.props.mapper[ 'assigning' ] );
  test.identical( got, false );

  test.case = 'existing condition';
  var got = _.props.conditionIs( _.props.condition[ 'dstAndSrcOwn' ] );
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

  function condition( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

}

//

function mapperFromCondition( test )
{
  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition without propertyTransformer';
  var src = condition1;
  src.identity = { propertyCondition : true }
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition';
  var src = condition2;
  src.identity = { propertyCondition : true, propertyTransformer : true }
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition functor';
  var src = condition3;
  src.identity = { propertyCondition : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'existing mapper';
  var src = _.props.mapper[ 'assigning' ];
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'existing condition';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
  var got = _.props.mapperFromCondition( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  if( !Config.debug )
  return;

  test.case = 'primitive'
  test.shouldThrowErrorSync( () => _.props.mapperFromCondition( 'hello' ) )

  test.case = 'plain routine'
  test.shouldThrowErrorSync( () => _.props.mapperFromCondition( plain ) )

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

  function condition1( dstContainer, srcContainer, key )
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

  function condition2( dstContainer, srcContainer, key )
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

  function condition3()
  {
    let routine = primitive;
    routine.identity = { propertyCondition : true, propertyTransformer : true };
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

  test.case = 'routine - сustom condition without propertyTransformer';
  var src = condition1;
  src.identity = { propertyCondition : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition';
  var src = condition2;
  src.identity = { propertyCondition : true, propertyTransformer : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition functor';
  var src = condition3;
  src.identity = { propertyCondition : true, propertyTransformer : true, functor : true }
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got !== src );

  test.case = 'existing mapper';
  var src = _.props.mapper[ 'assigning' ];
  var got = _.props.mapperFrom( src );
  test.true( _.props.mapperIs( got ) );
  test.true( got === src );

  test.case = 'existing condition';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
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

  function condition1( dstContainer, srcContainer, key )
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

  function condition2( dstContainer, srcContainer, key )
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

  function condition3()
  {
    let routine = primitive;
    routine.identity = { propertyCondition : true, propertyTransformer : true };
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

function conditionFrom( test )
{
  test.case = 'plain routine';
  var src = plain;
  var got = _.props.conditionFrom( src );
  test.true( _.props.conditionIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition without propertyTransformer';
  var src = condition1;
  src.identity = { propertyCondition : true }
  var got = _.props.conditionFrom( src );
  test.true( _.props.conditionIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition';
  var src = condition2;
  src.identity = { propertyCondition : true, propertyTransformer : true }
  var got = _.props.conditionFrom( src );
  test.true( _.props.conditionIs( got ) );
  test.true( got === src );

  test.case = 'routine - сustom condition functor';
  var src = condition3;
  src.identity = { propertyCondition : true, propertyTransformer : true, functor : true }
  var got = _.props.conditionFrom( src );
  test.true( _.props.conditionIs( got ) );
  test.true( got === src );

  test.case = 'existing condition';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
  var got = _.props.conditionFrom( src );
  test.true( _.props.conditionIs( got ) );
  test.true( got === src );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.props.conditionFrom( 'hello' ) );

  test.case = 'custom mapper';
  var src = mapper;
  mapper.identity = { propertyMapper : true }
  test.shouldThrowErrorSync( () => _.props.conditionFrom( src ) );

  test.case = 'existing mapper';
  var src = _.props.mapper[ 'assigning' ]
  test.shouldThrowErrorSync( () => _.props.conditionFrom( src ) );

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

  function condition1( dstContainer, srcContainer, key )
  {
    return true;
  }

  function condition2( dstContainer, srcContainer, key )
  {
    if( !_.primitive.is( srcContainer[ key ] ) )
    return false;

    return true;
  }

  function condition3()
  {
    let routine = primitive;
    routine.identity = { propertyCondition : true, propertyTransformer : true };
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
  let conditionBefore = new Set( Object.getOwnPropertyNames( _.props.condition ) );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom condition without propertyTransformer';
  var src = condition1;
  src.identity = { propertyCondition : true }
  test.true( _.props.condition[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.conditionIs( src ) );
  test.true( _.props.conditionIs( _.props.condition[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom condition';
  var src = condition2;
  src.identity = { propertyCondition : true, propertyTransformer : true }
  test.true( _.props.condition[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.conditionIs( src ) );
  test.true( _.props.conditionIs( _.props.condition[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'routine - сustom condition functor';
  var src = condition3;
  src.identity = { propertyCondition : true, propertyTransformer : true, functor : true }
  test.true( _.props.condition[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.conditionIs( src ) );
  test.true( _.props.conditionIs( _.props.condition[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );

  test.case = 'existing mapper with custom name';
  var src = _.props.mapper[ 'assigning' ];
  var srcName = 'existingMapper';
  test.true( _.routine.is( _.props.mapper[ 'assigning' ] ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.mapperIs( src ) );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );

  test.case = 'existing condition with custom name';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
  var srcName = 'existingFilter';
  test.true( test.true( _.routine.is( _.props.condition[ 'dstAndSrcOwn' ] ) ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.conditionIs( src ) );
  test.true( _.props.conditionIs( _.props.condition[ srcName ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );

  _.props.transformersUnregister
  (
    [
      mapper1.name,
      condition1.name,
      mapper2.name,
      condition2.name,
      mapper3.name,
      condition3.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.props.transformersUnregister
  (
    [
      condition1.name,
      condition2.name,
      condition3.name,
      'existingFilter',
    ],
    'condition'
  );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( conditionBefore, new Set( Object.getOwnPropertyNames( _.props.condition ) ) );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( plain ) )

  test.case = 'plain routine';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( 'hello' ) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( _.props.mapper[ 'assigning' ] ) )

  test.case = 'existing condition';
  test.shouldThrowErrorSync( () => _.props.transformerRegister( _.props.condition[ 'dstAndSrcOwn' ] ) )

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

  function condition1( dstContainer, srcContainer, key )
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

  function condition2( dstContainer, srcContainer, key )
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

  function condition3()
  {
    let routine = primitive;
    routine.identity = { propertyCondition : true, propertyTransformer : true };
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
  let conditionBefore = new Set( Object.getOwnPropertyNames( _.props.condition ) );

  addIdentity();

  test.case = 'check not registered';
  test.true( _.props.mapper[ mapper1.name ] === undefined );
  test.true( _.props.condition[ condition1.name ] === undefined );

  test.true( _.props.mapper[ mapper2.name ] === undefined );
  test.true( _.props.condition[ condition2.name ] === undefined );
  test.true( _.props.mapper[ condition2.name ] === undefined );//

  test.true( _.props.mapper[ mapper3.name ] === undefined );
  test.true( _.props.condition[ condition3.name ] === undefined );
  test.true( _.props.mapper[ condition3.name ] === undefined );

  test.true( _.props.mapper[ mapper4.name ] === undefined );
  test.true( _.props.condition[ condition4.name ] === undefined );
  test.true( _.props.mapper[ condition4.name ] === undefined );

  test.true( _.props.mapper[ 'existingMapper' ] === undefined );
  test.true( _.props.condition[ 'existingFilter' ] === undefined );
  test.true( _.props.mapper[ 'existingFilter' ] === undefined );

  var transformers =
  {
    [ mapper3.name ] : mapper3,
    [ condition3.name ] : condition3,
    [ mapper4.name ] : mapper4,
    [ condition4.name ] : condition4,
    'existingMapper' : _.props.mapper[ 'assigning' ],
    'existingFilter' : _.props.condition[ 'dstAndSrcOwn' ],
  }

  _.props.transformersRegister( transformers );

  test.case = 'check registered';
  test.true( _.props.mapperIs( _.props.mapper[ mapper3.name ] ) );
  test.true( _.props.conditionIs( _.props.condition[ condition3.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ condition3.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ mapper4.name ] ) );
  test.true( _.props.conditionIs( _.props.condition[ condition4.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ condition4.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ 'existingMapper' ] ) );
  test.true( _.props.conditionIs( _.props.condition[ 'existingFilter' ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ 'existingFilter' ] ) );

  _.props.transformersUnregister
  (
    [
      mapper3.name,
      condition3.name,
      mapper4.name,
      condition4.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.props.transformersUnregister
  (
    [
      condition3.name,
      condition4.name,
      'existingFilter',
    ],
    'condition'
  );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( conditionBefore, new Set( Object.getOwnPropertyNames( _.props.condition ) ) );

  if( !Config.debug )
  return;

  test.case = 'primitive';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters( 'hello' ) )

  test.case = 'plain routine';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ plain.name ] : plain }) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ 'assigning' : _.props.mapper[ 'assigning' ] }) )

  test.case = 'existing condition';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ 'dstAndSrcOwn' : _.props.condition[ 'dstAndSrcOwn' ] }) )

  test.case = 'not functor mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ mapper1.name ] : mapper1 }) )

  test.case = 'not functor condition';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ condition1.name ] : condition1 }) )

  test.case = 'not functor mapper transformer';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ mapper2.name ] : mapper2 }) )

  test.case = 'not functor condition transformer';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ condition2.name ] : condition2 }) )

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

  function condition1( dstContainer, srcContainer, key )
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

  function condition2( dstContainer, srcContainer, key )
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

  function condition3()
  {
    let routine = primitive;
    routine.identity = { propertyCondition : true, propertyTransformer : true };
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

  function condition4()
  {
    let routine = notIdentical;
    routine.identity = { propertyCondition : true, propertyTransformer : true }; ;
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
    condition1.identity = { propertyCondition : true };

    mapper2.identity = { propertyMapper : true, propertyTransformer : true };
    condition2.identity = { propertyCondition : true, propertyTransformer : true };

    mapper3.identity = { propertyMapper : true, functor : true };
    condition3.identity = { propertyCondition : true, functor : true }

    mapper4.identity = { propertyMapper : true, propertyTransformer : true, functor : true };
    condition4.identity = { propertyCondition : true, propertyTransformer : true, functor : true };
  }

}

//

function transformerUnregister( test )
{
  let mapperBefore = new Set( Object.getOwnPropertyNames( _.props.mapper ) );
  let conditionBefore = new Set( Object.getOwnPropertyNames( _.props.condition ) );

  test.case = 'routine - сustom mapper without propertyTransformer';
  var src = mapper1;
  src.identity = { propertyMapper : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom condition without propertyTransformer';
  var src = condition1;
  src.identity = { propertyCondition : true }
  test.true( _.props.condition[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.conditionIs( _.props.condition[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  _.props.transformerUnregister( src.name, 'condition' );
  test.true( _.props.condition[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom mapper';
  var src = mapper2;
  src.identity = { propertyMapper : true, propertyTransformer : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom condition';
  var src = condition2;
  src.identity = { propertyCondition : true, propertyTransformer : true }
  test.true( _.props.condition[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.conditionIs( _.props.condition[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  _.props.transformerUnregister( src.name, 'condition' );
  test.true( _.props.condition[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom mapper functor';
  var src = mapper3;
  src.identity = { propertyMapper : true, propertyTransformer : true, functor : true }
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'routine - сustom condition functor';
  var src = condition3;
  src.identity = { propertyCondition : true, propertyTransformer : true, functor : true }
  test.true( _.props.condition[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );
  _.props.transformerRegister( src );
  test.true( _.props.conditionIs( _.props.condition[ src.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ src.name ] ) );
  _.props.transformerUnregister( src.name, 'mapper' );
  _.props.transformerUnregister( src.name, 'condition' );
  test.true( _.props.condition[ src.name ] === undefined );
  test.true( _.props.mapper[ src.name ] === undefined );

  test.case = 'existing mapper with custom name';
  var src = _.props.mapper[ 'assigning' ];
  var srcName = 'existingMapper';
  test.true( _.routine.is( _.props.mapper[ 'assigning' ] ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );
  _.props.transformerUnregister( srcName, 'mapper' );
  test.true( _.props.mapper[ srcName ] === undefined );

  test.case = 'existing condition with custom name';
  var src = _.props.condition[ 'dstAndSrcOwn' ];
  var srcName = 'existingFilter';
  test.true( test.true( _.routine.is( _.props.condition[ 'dstAndSrcOwn' ] ) ) );
  _.props.transformerRegister( src, srcName );
  test.true( _.props.conditionIs( _.props.condition[ srcName ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ srcName ] ) );
  _.props.transformerUnregister( srcName, 'mapper' );
  _.props.transformerUnregister( srcName, 'condition' );
  test.true( _.props.condition[ srcName ] === undefined );
  test.true( _.props.mapper[ srcName ] === undefined );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( conditionBefore, new Set( Object.getOwnPropertyNames( _.props.condition ) ) );

  if( !Config.debug )
  return;

  test.case = 'routine';
  test.shouldThrowErrorSync( () => _.props.transformerUnregister( plain ) )

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerUnregister( 'hello', 'mapper' ) )

  test.case = 'existing condition';
  test.shouldThrowErrorSync( () => _.props.transformerUnregister( 'hello', 'condition' ) )


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

  function condition1( dstContainer, srcContainer, key )
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

  function condition2( dstContainer, srcContainer, key )
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

  function condition3()
  {
    let routine = primitive;
    routine.identity = { propertyCondition : true, propertyTransformer : true };
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
  let conditionBefore = new Set( Object.getOwnPropertyNames( _.props.condition ) );

  addIdentity();

  test.case = 'check not registered';
  test.true( _.props.mapper[ mapper1.name ] === undefined );
  test.true( _.props.condition[ condition1.name ] === undefined );

  test.true( _.props.mapper[ mapper2.name ] === undefined );
  test.true( _.props.condition[ condition2.name ] === undefined );
  test.true( _.props.mapper[ condition2.name ] === undefined );//

  test.true( _.props.mapper[ mapper3.name ] === undefined );
  test.true( _.props.condition[ condition3.name ] === undefined );
  test.true( _.props.mapper[ condition3.name ] === undefined );

  test.true( _.props.mapper[ mapper4.name ] === undefined );
  test.true( _.props.condition[ condition4.name ] === undefined );
  test.true( _.props.mapper[ condition4.name ] === undefined );

  test.true( _.props.mapper[ 'existingMapper' ] === undefined );
  test.true( _.props.condition[ 'existingFilter' ] === undefined );
  test.true( _.props.mapper[ 'existingFilter' ] === undefined );

  var transformers =
  {
    [ mapper3.name ] : mapper3,
    [ condition3.name ] : condition3,
    [ mapper4.name ] : mapper4,
    [ condition4.name ] : condition4,
    'existingMapper' : _.props.mapper[ 'assigning' ],
    'existingFilter' : _.props.condition[ 'dstAndSrcOwn' ],
  }

  _.props.transformersRegister( transformers );

  test.case = 'check registered';
  test.true( _.props.mapperIs( _.props.mapper[ mapper3.name ] ) );
  test.true( _.props.conditionIs( _.props.condition[ condition3.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ condition3.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ mapper4.name ] ) );
  test.true( _.props.conditionIs( _.props.condition[ condition4.name ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ condition4.name ] ) );

  test.true( _.props.mapperIs( _.props.mapper[ 'existingMapper' ] ) );
  test.true( _.props.conditionIs( _.props.condition[ 'existingFilter' ] ) );
  test.true( _.props.mapperIs( _.props.mapper[ 'existingFilter' ] ) );

  _.props.transformersUnregister
  (
    [
      mapper3.name,
      condition3.name,
      mapper4.name,
      condition4.name,
      'existingMapper',
      'existingFilter',
    ],
    'mapper'
  );

  _.props.transformersUnregister
  (
    [
      condition3.name,
      condition4.name,
      'existingFilter',
    ],
    'condition'
  );

  test.case = 'check unregistered';
  test.true( _.props.mapper[ mapper1.name ] === undefined );
  test.true( _.props.condition[ condition1.name ] === undefined );

  test.true( _.props.mapper[ mapper2.name ] === undefined );
  test.true( _.props.condition[ condition2.name ] === undefined );
  test.true( _.props.mapper[ condition2.name ] === undefined );//

  test.true( _.props.mapper[ mapper3.name ] === undefined );
  test.true( _.props.condition[ condition3.name ] === undefined );
  test.true( _.props.mapper[ condition3.name ] === undefined );

  test.true( _.props.mapper[ mapper4.name ] === undefined );
  test.true( _.props.condition[ condition4.name ] === undefined );
  test.true( _.props.mapper[ condition4.name ] === undefined );

  test.true( _.props.mapper[ 'existingMapper' ] === undefined );
  test.true( _.props.condition[ 'existingFilter' ] === undefined );
  test.true( _.props.mapper[ 'existingFilter' ] === undefined );

  test.case = 'check no garbage left';
  test.identical( mapperBefore, new Set( Object.getOwnPropertyNames( _.props.mapper ) ) )
  test.identical( conditionBefore, new Set( Object.getOwnPropertyNames( _.props.condition ) ) );

  if( !Config.debug )
  return;

  test.case = 'routine';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters({ [ plain.name ] : plain }) );

  test.case = 'existing mapper';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters( [ 'hello' ], 'mapper' ) );

  test.case = 'existing condition';
  test.shouldThrowErrorSync( () => _.props.transformerRegisters( [ 'hello' ], 'condition' ) );

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

  function condition1( dstContainer, srcContainer, key )
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

  function condition2( dstContainer, srcContainer, key )
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

  function condition3()
  {
    let routine = primitive;
    routine.identity = { propertyCondition : true, propertyTransformer : true };
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

  function condition4()
  {
    let routine = notIdentical;
    routine.identity = { propertyCondition : true, propertyTransformer : true }; ;
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
    condition1.identity = { propertyCondition : true };

    mapper2.identity = { propertyMapper : true, propertyTransformer : true };
    condition2.identity = { propertyCondition : true, propertyTransformer : true };

    mapper3.identity = { propertyMapper : true, functor : true };
    condition3.identity = { propertyCondition : true, functor : true }

    mapper4.identity = { propertyMapper : true, propertyTransformer : true, functor : true };
    condition4.identity = { propertyCondition : true, propertyTransformer : true, functor : true };
  }

}

// --
// define test suite
// --

const Proto =
{

  name : 'Tools.PropertyTransformer.l0.l9',
  silencing : 1,

  tests :
  {

    // l5

    mapperIs,
    conditionIs,
    mapperFromCondition,
    mapperFrom,
    conditionFrom,
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
