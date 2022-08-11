package hxqrcode;

typedef QRCode = {
	function addData(data:String, ?mode:Mode):Void;
	function make():Void;
	function getModuleCount():Float;
	function isDark(row:Float, col:Float):Bool;
	function createImgTag(?cellSize:Float, ?margin:Float):String;
	@:overload(function(?opts:{ @:optional var cellSize : Float; @:optional var margin : Float; @:optional var scalable : Bool; }):String { })
	function createSvgTag(?cellSize:Float, ?margin:Float):String;
	function createDataURL(?cellSize:Float, ?margin:Float):String;
	function createTableTag(?cellSize:Float, ?margin:Float):String;
	function createASCII(?cellSize:Float, ?margin:Float):String;
	function renderTo2dContext(context:js.html.CanvasRenderingContext2D, ?cellSize:Float):Void;
};
