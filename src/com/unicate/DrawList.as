package com.unicate
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="com.unicate.DrawList")] 
	public class DrawList
	{
		public var out:ArrayCollection;
		public function DrawList(o:ArrayCollection)
		{
			this.out = o;	
		}
	}
}