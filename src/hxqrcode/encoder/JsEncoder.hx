package hxqrcode.encoder;

import hxqrcode.*;

/**
 * https://www.npmjs.com/package/qrcode-generator
 * 
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcode-generator/1.4.3/qrcode.min.js"></script>
 */
class JsEncoder {
	var errorCorrectionLevel:ErrorCorrectionLevel;

	public function new(errorCorrectionLevel: ErrorCorrectionLevel) {
		this.errorCorrectionLevel = errorCorrectionLevel;
	}
	
	public function encode(text:String):Data {
		var qr = QrcodeGeneratorGlobal.qrcode(0, errorCorrectionLevel);
		qr.addData(text);
		qr.make();
		var count = qr.getModuleCount();
		var data = [];
		for(y in 0...count) {
			data[y] = [];
			for(x in 0...count) {
				data[y][x] = qr.isDark(y, x) ? 1 : 0;
			}
		}
		return data;
	}
}
