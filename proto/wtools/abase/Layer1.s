//#! /usr/bin/env node
( function _wToolsLayer1_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{

  require( './Layer0.s' );

  require( './l1/ContainerAdapter.s' );
  require( './l1/ContainerAdapterArray.s' );
  require( './l1/ContainerAdapterSet.s' );

  require( './l1/ModulesRegistry.s' );
  require( './l1/NameTools.s' );
  require( './l1/StrBasic.s' );

  require( './l1/Performance.s' );

}

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
