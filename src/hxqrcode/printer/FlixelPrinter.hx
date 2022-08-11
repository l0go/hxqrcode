package hxqrcode.printer;

import hxqrcode.*;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flash.display.BitmapData;

using flixel.util.FlxSpriteUtil;

class FlixelPrinter implements Printer<FlxSprite> {
	var margin:Int;
	var blockSize:Int;
	var backgroundColor:Int;
	var foregroundColor:Int;

	public function new(?options:FlixelPrinterOptions) {
		margin = options == null || options.margin == null ? 4 : options.margin;
		blockSize = options == null || options.blockSize == null ? 4 : options.blockSize;
		backgroundColor = options == null || options.backgroundColor == null ? 0xffffffff : options.backgroundColor;
		foregroundColor = options == null || options.foregroundColor == null ? 0xff000000 : options.foregroundColor;
	}

	public function print(data:Data):FlxSprite {
		var sprite = new FlxSpriteGroup();
		var size = data.size;

		var bg = new FlxSprite();

		var bitmapData = new BitmapData(size, size);
		bitmapData.lock();
		for(x in 0...size) for(y in 0...size) {
			bitmapData.setPixel(x, y, data.get(x, y) ? foregroundColor : backgroundColor);
		}
		bitmapData.unlock();

		var code = new FlxSprite();
		code.pixels = bitmapData;

		sprite.add(bg);
		sprite.add(code);

		return sprite;
	}
}

typedef FlixelPrinterOptions = {
	?margin:Int,
	?blockSize:Int,
	?backgroundColor:Int,
	?foregroundColor:Int,
}
