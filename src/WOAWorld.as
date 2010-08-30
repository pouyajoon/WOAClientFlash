//http://www.kbups.org/pub/60/7/1/3/red5-presentation-et-premiere-installation-deploiement-des-applications-red5/

package {

	
	import Box2D.General.*;
	
	import flash.display.Sprite;
	import flash.events.*;
	
	import mx.collections.ArrayCollection;
	
	import woa.dynamics.*;
	import woa.elements.*;
	import woa.statics.*;	

	   
	public class WOAWorld extends Sprite
	{
//		public var the_world:b2World;
		//public var time_count:Timer = new Timer(200);
		public var mxml:WOAClient;
		
		//public var draw_static:Array;
		public var draw_dynamic:Array;
		
		// catch elements on server but not on the client
		public var missing_bodys:ArrayCollection = new ArrayCollection();
		
//		public var debug_draw:b2DebugDraw;
		
		// world mouse position
		public var mouseXWorldPhys:Number;
		public var mouseYWorldPhys:Number;
		static public var mouseXWorld:Number;
		static public var mouseYWorld:Number;
//		public var m_mouseJoint:b2MouseJoint;
/*
		public var m_timeStep:Number = 1.0/30.0;

		public var m_iterations:int = 10;		
*/	
		public var m_physScale:Number = 0.3;	
		public var world_size_x:Number = 2400;
		public var world_size_y:Number = 1200;
		
		public function WOAWorld(_parent:WOAClient)
		{
			//width = 800;
			//height = 600;
			
			
//			//stage.setStyle("backgroundColor","#00CC00");
			
			// set the world scale (zoom)
			scaleX = m_physScale;
			scaleY = m_physScale;
			
			mxml = _parent;
			
			//this.draw_static = new Array();	
			this.draw_dynamic = new Array();
		
			// draw the borders
			WorldDrawBorder(world_size_x, world_size_y, 2);
			
			// setup the world, gravity, screen ...
//			setup_world();
//			setup_debugdraw();
			

			
			addEventListener(Event.ENTER_FRAME, on_enter_frame);
			
			// start the timer
			//time_count.start();
		}

  		

 		
		//@Embed(source='library/images/ant.png')
		//[Embed(source="library/images/ant.png")]
		/*
		public function print_dynamic(a:Object): void
		{

			mxml.add_log("size of dynamics : " + draw_dynamic.length);
			if (draw_dynamic[a.id] == null)
			{
				mxml.add_log("will create new dynamic : " + a.type + ", id:[" + a.id + "] at : " + a.pos.x + ", " + a.pos.y);
				//a.body = create_circle(a.pos.x, a.pos.y, 2, 0.5, 10, 0.0); //create_box(a.pos.x, a.pos.y, 5, 5, 1, 0);
				//mxml.dump(a.body);
				//mxml.add_log(a.id + ", size: " + a.size);
				//a.body = AntCircle(a.pos.x, a.pos.y, a.size);
				
				a.body = new Ant(this, a.pos.x, a.pos.y);
				a.body.Draw(); 
				// add to dynamics
				draw_dynamic[a.id] = a;
				
				if (a.body == null)
				{
					mxml.add_log("a body is null");
				}
				//draw_dynamic[a.id] = a;//new Array(c, final_body);
				
			}
			else
			{
					
				//b2DistanceJointDef()
				mxml.add_log(a.type + " exists, force will be applied; direction : " + a.direction + ",pos:["  + a.pos.x +","  + a.pos.y+"]");	
				//var final_body:b2Body = draw_dynamic[a.id].body as b2Body;
				var body:WoaObject = draw_dynamic[a.id].body as WoaObject;
				//
				//body.rotation = a.direction;
				body.Rotate(a.direction);
				body.MoveTo(a.pos.x, a.pos.y);
				//body.SetPosition(a.pos.x, a.pos.y);
				//body.SetPosition(a.pos.x, a.pos.y);
				//, _rotation : a.direction
				//Tweener.addTween(myobj, {x:a.pos.x;y:a.pos.y;...});		
				//mxml.add_log(a.id + ", dif : " + a.pos.x + ":" + a.pos.y);

			}	
		}
		
		public function print_static(c:Object) :void
		{
			//mxml.add_log("size of statics : " + draw_static.length);
			if (draw_static[c.id] == null)
			{
				//mxml.dump(c);
				//mxml.dump(c.pos.x);
				//mxml.dump(c.pos.y);
				mxml.add_log("will create new static : " + c.type  + ", pos : " + c.pos.x + "," + c.pos.y);
				//c.body = AntCircle(c.pos.x, c.pos.y, c.size);
				//c.body = DrawBox(c.pos.x, c.pos.y, c.size, c.size, this);
				c.body = new Colony(this, c.pos.x, c.pos.y);				
				c.body.Draw();
				draw_static[c.id] = c;//new Array(c, final_body);
			}
			else
			{
				mxml.add_log("old static : " + c.type  + ", pos : " + c.pos.x + "," + c.pos.y);
				//mxml.add_log(c.type + " exists no change");
				//colonies[c.id][1].ApplyForce(new b2Vec2(20, 20), colonies[c.id][1].GetLocalCenter());
//				colonies[c.id][0].pos.x += 5;
				//mxml.add_log("x pos : " + colonies[c.id][0].pos.x);
			}
			
		}
	*/
		
	
		
		public function WorldDrawBorder(w:Number, h:Number, border_size:Number):void
		{
			
			var top:Box = new Box(this, -1, 0, 0, w + border_size , border_size);
			var bottom:Box = new Box(this, -1, 0, h / 2, w + border_size , border_size);
			var left:Box = new Box(this, -1, 0, 0, border_size, h + border_size);
			var right:Box = new Box(this, -1, w / 2, 0, border_size, h + border_size);
			
			top.DrawBox(0x00FF00);
			bottom.DrawBox(0x00FF00);
			left.DrawBox(0x00FF00);
			right.DrawBox(0x00FF00);
			
		}
	

		public function translate_y(y:Number) : Number
		{
			return world_size_y - y;
		}
		
		//======================
		// Update mouseWorld
		//======================

		public function UpdateMouseWorld():void{
			mouseXWorldPhys = (Input.mouseX)/m_physScale - this.x; 
			mouseYWorldPhys =  translate_y((Input.mouseY)/m_physScale - this.y); 
			
			//mxml.add_log(mouseXWorld + ", " + mouseYWorld + ",-- "+ mouseXWorldPhys + ", "+ mouseYWorldPhys + ", ")
			mouseXWorld = (Input.mouseX); 
			mouseYWorld = (Input.mouseY); 
		}
		

		private var lastMouseX:Number = 0;
		private var lastMouseY:Number = 0;

		//======================
		// Mouse Drag 
		//======================
		public function MouseDrag():void{
			// mouse press
			//mxml.add_log("mouse pressed");
			if (Input.mouseDown)
			{
				if (Input.isKeyPressed(17))
				{ // CTRL is down
					//mxml.add_log("mouse down & control down, lastmX = "+ lastMouseX+ "| mouse:, " + mouseX + ", " + mouseY);
					if (lastMouseX == 0)
					{
						lastMouseX = mouseX;
					}
					if (lastMouseY == 0)
					{
						lastMouseY = mouseY;
					}					
					var moveMouseX:Number = (mouseX - lastMouseX) * m_physScale;
					var moveMouseY:Number = (mouseY - lastMouseY) * m_physScale;
					//mxml.add_log("move : " + moveMouseX);
					this.x += moveMouseX;	
					this.y += moveMouseY;	
					lastMouseX = mouseX;				
					lastMouseY = mouseY;					
				}
			}
			// mouse release
			if (!Input.mouseDown)
			{
				//mxml.add_log("mouse released");
				lastMouseX = 0;
				lastMouseY = 0;
			}
			// mouse move
//			if (m_mouseJoint)
			{
			}
		}
		
		/*
		//======================
		// Mouse Drag 
		//======================
		public function MouseDrag():void{
			// mouse press
			//mxml.add_log("mouse down");
			if (Input.mouseDown && !m_mouseJoint){
				
				var body:b2Body = GetBodyAtMouse();
				
				if (body)
				{
					mxml.l_mouse_ant.text = "selected ant : [" + body.GetPosition().x + "\r\n" + body.GetPosition().y + "]" + "\r\n" + 
							body.m_force.x + ", " + body.m_force.y + "! " + body;
					//mxml.add_log("body");
					var md:b2MouseJointDef = new b2MouseJointDef();
					md.body1 = the_world.GetGroundBody();
					md.body2 = body;
					md.target.Set(mouseXWorldPhys, mouseYWorldPhys);
					md.maxForce = 600.0 * (body.GetMass() + 1);
					md.timeStep = m_timeStep;
					m_mouseJoint = the_world.CreateJoint(md) as b2MouseJoint;
					body.WakeUp();
				}
				else
				{
					//mxml.add_log("no body");
				}
			}
			
			
			// mouse release
			if (!Input.mouseDown){
				if (m_mouseJoint)
				{
					the_world.DestroyJoint(m_mouseJoint);
					m_mouseJoint = null;
				}
			}
			
			
			// mouse move
			if (m_mouseJoint)
			{
				var p2:b2Vec2 = new b2Vec2(mouseXWorldPhys, mouseYWorldPhys);
				m_mouseJoint.SetTarget(p2);
			}
		}
		
		*/
		/*
		
		//======================
		// Mouse Destroy
		//======================
		public function MouseDestroy():void{
			// mouse press
			if (!Input.mouseDown && Input.isKeyPressed(68)){
				
				var body:b2Body = GetBodyAtMouse(true);
				
				if (body)
				{
					the_world.DestroyBody(body);
					return;
				}
			}
		}
		
		*/
		
		//======================
		// GetBodyAtMouse
		//======================
//		private var mousePVec:b2Vec2 = new b2Vec2();
		/*
		public function GetBodyAtMouse(includeStatic:Boolean=true):b2Body{
			// Make a small box.
			//mxml.add_log("mouse:[" + mouseXWorldPhys +"," + mouseYWorldPhys + "]");
			mousePVec.Set(mouseXWorldPhys, mouseYWorldPhys);
			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound.Set(mouseXWorldPhys - 0.001, mouseYWorldPhys - 0.001);
			aabb.upperBound.Set(mouseXWorldPhys + 0.001, mouseYWorldPhys + 0.001);
			
			// Query the world for overlapping shapes.
			var k_maxCount:int = 10;
			var shapes:Array = new Array();
			var count:int = the_world.Query(aabb, shapes, k_maxCount);
			var body:b2Body = null;
			for (var i:int = 0; i < count; ++i)
			{
				//mxml.add_log("i was visited");
				if (shapes[i].GetBody().IsStatic() == false || includeStatic)
				{
					var tShape:b2Shape = shapes[i] as b2Shape;
					var inside:Boolean = tShape.TestPoint(tShape.GetBody().GetXForm(), mousePVec);
					if (inside)
					{
						body = tShape.GetBody();
						break;
					}
				}
			}
			return body;
		}  
  		*/
  		
  		
  		public var f_is_down:Boolean = false;
		public function on_enter_frame(e:Event) :void {
			
			/*
			
			MouseDestroy();
				
			*/
			
			UpdateMouseWorld()
			MouseDrag();
			
			
			//Input.getKeyHold(70)
			if (Input.isKeyPressed(70))
			{ // "f", set a food
				if (f_is_down == false)
				{	
					f_is_down = true;
					mxml.callServer();
				}
				//var responder:Responder = new Responder( mxml.print_response );
				//nc.call("createFood", responder);
			}		
			if (Input.isKeyReleased(70))
			{ // "f", set a food
				f_is_down = false;
				//var responder:Responder = new Responder( mxml.print_response );
				//nc.call("createFood", responder);
			}		
			
				
			
			if (Input.isKeyPressed(37))
			{ // Left Arrow
				//mxml.add_log("Left arrow");			
				//if (this.x < 0)
				{
					this.x += 5;
				}
			}
			if (Input.isKeyPressed(39))
			{ // Right Arrow
				//mxml.add_log("Right arrow");
				//if (this.x > (-world_size_x + mxml.width) * m_physScale)
				{
					this.x -= 5;
				}
					
			}
			if (Input.isKeyPressed(38))
			{ // Top Arrow
			//mxml.add_log("Top arrow");
				//if (this.y < 0)
				{
					this.y += 5;
				}				
			}	
			if (Input.isKeyPressed(40))
			{ // Bottom Arrow
				//if (this.y > (-world_size_y + mxml.height) * m_physScale)
				{
					this.y -= 5;	
				}			
			}	
			if (Input.lastKey)
			{
				//mxml.add_log("world scroll:" + this.x + ", " + this.y);
				//mxml.add_log("stop playing with : " + Input.lastKey);
			}
			
			//Input.update();
		}
	}
}