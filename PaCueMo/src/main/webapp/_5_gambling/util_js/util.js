/****************************************************************************
 ******************************* 工具js code  *******************************
 ****************************************************************************/
//============================================================================
/**
 * 比較時間
 */
var compareDateTime = function( nowTime/*目前時間*/ , targetTime/*被比較的時間*/ ){
	 if ( (Date.parse(nowTime)).valueOf() > (Date.parse(targetTime)).valueOf())
	 {
		//$("#confirmBet").attr("disabled",true); // 設定﹝確認下注﹞不能按
		 return true;
	 }else{
		//$("#confirmBet").attr("disabled",false);// 設定﹝確認下注﹞可按
		 return false;
	 }
}	