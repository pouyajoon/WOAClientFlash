// ActionScript file
package woa
{
	[RemoteClass(alias="woa.Position")] 
	public class Position
	{
		public var x:Number;
		public var y:Number;
		public var _map:Number;
		
		public function Position(m:Number, _x:Number, _y:Number)
		{
			x = _x;
			y = _x;
			_map = m;
		}
		

	}
}