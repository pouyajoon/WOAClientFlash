package woa.statics
{
	import flash.display.MovieClip;
	
	import woa.*;
	
	public class Colony extends WoaObject
	{
		public function Colony(_myworld:WOAWorld, _id:Number, x:Number, y:Number, _size:Number)
		{
			super (_myworld, _id, x, y);
			this.type = "colony";
			this.size = _size;
		}
		

		[Embed(source = 'library/swc/colony_100x100.swf')]
		private var PersoClass:Class;
		 		 
		private var WoaObjectMovie:MovieClip = new PersoClass() as MovieClip;
		
		public override function Draw() : void
		{	        
            // starting color filling
            
            this.graphics.beginFill(0x00FF00 , 1);            
            //rect.graphics.drawCircle(x, y, w);
            this.graphics.drawRect(-this.size, -this.size, this.size * 2, this.size * 2);
            this.graphics.endFill();  
			
            //myworld.addChild(this);		
            
            
            var xratio:Number = (this.size / 100);
            
            //myworld.mxml.add_log("x ratio : " + xratio.toString());
            
            woaimage = WoaObjectMovie;
            
			woaimage.width = this.size * 2;
			woaimage.height = this.size * 2;
			woaimage.x = this.x ;
			woaimage.y = this.y ;
//- woaimage.width  - woaimage.height
            //monPerso.scaleX = xratio;
            //monPerso.scaleY = xratio;
           	myworld.addChild(woaimage);
            
            //return this;
            	
		}

	}
}