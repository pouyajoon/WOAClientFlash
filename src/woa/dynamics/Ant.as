package woa.dynamics
{
	import flash.display.MovieClip;
	
	import mx.controls.Image;
	
	import woa.*;
	
	public class Ant extends WoaObject
	{
		[Embed(source = 'library/swc/ant_100x100.swf')]
		private var PersoClass:Class;
		 
		public var WoaObjectMovie:MovieClip = new PersoClass() as MovieClip;
		
		public function Ant(_myworld:WOAWorld, _id:Number, x:Number, y:Number, _size:Number)
		{
			super (_myworld, _id, x, y);
			this.type = "ant";
			this.size = _size;
			//antImage = new Ressource.ANT_1();
		}
		
/*
		public override function MoveTo(new_x:Number, new_y:Number) :void
		{					
			Tweener.addTween(this, {x : new_x, y : translate_y(new_y), time: 8} );
			
			//antImage.x = new_x;
			//antImage.y = translate_y(new_y);
			//antImage.scaleX = myworld.scaleX;
			//antImage.scaleX = myworld.scaleY; 
			
			//SetPosition(new_x, new_y);
		}
*/	
				
		public override function Draw() : void
		{	        
			
			//var r:Number = 10;
           	//var circle:Shape = new Shape(); 
            // starting color filling
            
            this.graphics.beginFill(0xff9933 , 1);
            // drawing circle 
            this.graphics.drawCircle(0 , 0 , this.size);            
            this.graphics.beginFill(0x000000 , 1);
            // drawing eye 
            this.graphics.drawCircle(this.size / 1.6 , 0 , this.size / 5);
            this.graphics.endFill();         
 			
 			//myworld.addChild(this);	
            // repositioning shape

			
			woaimage = WoaObjectMovie;
			woaimage.width = this.size * 2;
			woaimage.height = this.size * 2;
			woaimage.x = this.x - woaimage.width / 2;
			woaimage.y = this.y - woaimage.height / 2;
			
			//this.addChild(woaimage);
			myworld.addChild(woaimage);
			
			//SetPosition(woaimage.x, woaimage.y);
			//var xRatio:Number = (this.size * 2) / 100;
			//myworld.mxml.add_log("x ratio : " + xRatio.toString());

			//woaimage.scaleX = xRatio;
			//woaimage.scaleY = xRatio;
			
            // adding displayobject to the display list
           
           
           // myworld.addChild(woaimage);
//          //antImage.
            //myworld.addChild(antImage);		
            //return this;	
		}
	}
}