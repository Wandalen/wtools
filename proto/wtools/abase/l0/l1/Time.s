( function _l1_Time_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;

// --
// time
// --

function timerIs( src )
{
  if( !src )
  return false;
  return _.strIs( src.type ) && !!src.time && !!src.cancel;
}

//

function competitorIs( src )
{
  if( !src )
  return false;
  if( !_.mapIs( src ) )
  return false;
  return src.competitorRoutine !== undefined;
}

// --
// implementation
// --

let ToolsExtension =
{

  /* qqq : for Yevhen : bad */
  timerIs,
  competitorIs, /* xxx : move */

}

//

Object.assign( _, ToolsExtension );
/* qqq : for Yevhen : replace Routines+Fields -> {- name of namespace -}Extension in all files */

})();
