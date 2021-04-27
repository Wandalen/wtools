//#! /usr/bin/env node
( function _Layer1_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  module[ 'exports' ] = require( './Layer0.s' );

  require( './l1/Collection.s' );
  require( './l1/ContainerAdapter.s' );
  require( './l1/ContainerAdapterArray.s' );
  require( './l1/ContainerAdapterSet.s' );
  require( './l1/ModulesRegistry.s' );
  require( './l1/NameTools.s' );
  require( './l1/StrBasic.s' );
  require( './l1/Trie.s' );
}

})();
