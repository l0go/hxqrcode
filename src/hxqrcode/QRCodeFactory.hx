package hxqrcode;

import hxqrcode.ErrorCorrectionLevel;

typedef QRCodeFactory = {
	@:selfCall
	function call(typeNumber:TypeNumber, errorCorrectionLevel:ErrorCorrectionLevel):QRCode;
	function stringToBytes(s:String):Array<Float>;
	var stringToBytesFuncs : haxe.DynamicAccess<(s:String) -> Array<Float>>;
	function createStringToBytes(unicodeData:String, numChars:Float):(s:String) -> Array<Float>;
};
