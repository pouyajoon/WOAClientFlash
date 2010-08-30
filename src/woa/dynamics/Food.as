package woa.dynamics
{
	import woa.WoaObject;
	import flash.display.MovieClip;
	
	public class Food extends WoaObject
	{
		[Embed(source = 'library/swc/apple_100x100.swf')]
		private var PersoClass:Class;
		 
		public var WoaObjectMovie:MovieClip = new PersoClass() as MovieClip;
		
		public function Food(_myworld:WOAWorld, _id:Number, x:Number, y:Number, _size:Number)
		{
			super(_myworld, _id, x, y);
			this.type = "food";
			this.size = _size;
		}
		
		public override function Draw() : void
		{
			var r:Number = this.size;
			 
            this.graphics.beginFill(0xff0000 , 1);
            // drawing circle 
            this.graphics.drawCircle(0 , 0 , r);
            
            this.graphics.beginFill(0x000000 , 1);
            // drawing eye 
            this.graphics.drawCircle(r / -1.6 , 0 , r / -5);
            this.graphics.endFill();         
			
            // repositioning shape

            // adding displayobject to the display list
          	 //myworld.addChild(this);			
            
            //myworld.mxml.add_log("create food size : "+ this.size);
			woaimage = WoaObjectMovie;
			woaimage.width = this.size * 2;
			woaimage.height = this.size * 2;
			woaimage.x = this.x - woaimage.width / 2;
			woaimage.y = this.y - woaimage.height / 2;
            // adding displayobject to the display list
            
            //SetPosition(woaimage.x, woaimage.y);
           
            myworld.addChild(woaimage);            
		}
	}
}