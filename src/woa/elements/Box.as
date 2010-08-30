package woa.elements
{
	import woa.WoaObject;

	public class Box extends WoaObject
	{
		public var w:Number;
		public var h:Number;
		
		public function Box(_myworld:WOAWorld, _id:Number, x:Number, y:Number, w:Number, h:Number)
		{
			super(_myworld, _id, x, y);
			this.type = "box";
			this.w = w;
			this.h = h;
			// set back the java/flex world difference
			this.y = y;
			
		}
		
		public function DrawBox(color:uint) : void
		{
            this.graphics.beginFill(color , 1);            
            //rect.graphics.drawCircle(x, y, w);
            this.graphics.drawRect(x, y, w, h);
            this.graphics.endFill();  
            myworld.addChild(this);				
		}
		
	}
}