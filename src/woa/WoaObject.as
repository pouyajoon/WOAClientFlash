package woa
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;




	public class WoaObject extends MovieClip
	{
		public var myworld:WOAWorld;
		public var type:String = "woaobject";
		public var id:Number = 0;
		//public var pos:Position = null;
		public var direction:Number = 0;
		public var size:Number = 0;
		public var woaimage:MovieClip = null;
		

		
		public function SetPosition(x:Number, y:Number) :void
		{
			this.x = x;
            this.y = myworld.translate_y(y);
            if (woaimage != null)
            {
	            woaimage.x = x;
	            woaimage.y = myworld.translate_y(y);
            }
		}
		
		public function getX() : Number
		{
			return woaimage.x;
		}
		
		public function getY() : Number
		{
			return woaimage.y;
		}
				
		public function WoaObject(_myworld:WOAWorld, _id:Number, x:Number, y:Number)
		{
			super();
			// set the world (sprite)
			myworld = _myworld;
			this.id = _id;
			// repositioning shape
            SetPosition(x, y);
		}
		
		public function Resize(new_size:Number) :void
		{
			if (woaimage != null)
			{
				woaimage.width = new_size * 2;
				woaimage.height = new_size * 2;
			}
			this.width = new_size * 2;
			this.height = new_size * 2;
			this.size = new_size;
		}
		
		public function MoveTo(new_x:Number, new_y:Number) :void
		{						
			//var t:Tween = new Tween(woaimage, woaimage.x, new_x);
			//var t:Tween = new Tween(woaimage, myworld.translate_y(woaimage.y), myworld.translate_y(new_y));
			//Tweener.addTween(this, {x : new_x, y : myworld.translate_y(new_y), time: 0.5} );
			//Tweener.addTween(woaimage, {alpha:0, time: 1});
			//woaimage.
			//Tweener.addTween(this, {x : new_x, y : myworld.translate_y(new_y)});
			//woaimage.x  = new_x;
			//woaimage.y = myworld.translate_y(new_y);
			Tweener.addTween(woaimage, {x:new_x, y:myworld.translate_y(new_y), time:0.5, transition:"linear"});
			//Tweener.addTween(woaimage, "x", Regular.easeOut, new_x);						
			//SetPosition(new_x, new_y);
		}
		
		
		public function makeDegree(r:Number) : Number
		{
			return  r * 180/Math.PI;
		}
		
		//public oldRotation = 
		
		public function Rotate(r:Number) : void
		{
			//Tweener.addTween(woaimage, {rotation:-makeDegree(r), time:0.5});
			
			//this.rotation = -makeDegree(r);
			woaimage.rotation = -makeDegree(r);
		}		
		public override function toString() : String
		{
			return "woaobject: " + this.type + ", id:[" + this.id + "] at : " + getX() + ", " + getY() + ", direction:" + this.direction;
		}
		
		public function Draw() : void
		{
		}
		
	}
}