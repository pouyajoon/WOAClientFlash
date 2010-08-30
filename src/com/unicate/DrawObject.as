package com.unicate
{
	import woa.*;
	
	[RemoteClass(alias="com.unicate.DrawObject")] 
	public class DrawObject
	{
		public var type:String;
		public var id:Number;
		public var pos:Position;
		public var size:Number;
		public var direction:Number;
		
		//Integer d, Position pos, String type
		public function DrawObject(id:Number, pos:Position, t:String) //, s:Number
		{
			this.type = t;
			this.pos = pos;
			this.id = id;
			this.size = 0;
			this.direction = 0;
		}
	}
}