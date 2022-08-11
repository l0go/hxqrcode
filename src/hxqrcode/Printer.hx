package hxqrcode;

interface Printer<T> {
	function print(data:Data):T;
}
