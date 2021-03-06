﻿package com.teamphysics.zachl.blocks 
{
	
	import com.teamphysics.util.GameObjectType;
	import com.teamphysics.util.SpaceRef;
	import flash.display.Sprite;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Polygon;
	import org.osflash.signals.*;
	
	public class KingPlacementBlock extends BaseBlock 
	{
		/** A variable to track when the hero has died. */
		private var collisionGroupHolder 	:int;
		public var mcKing					:KingBlock;
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function KingPlacementBlock() 
		{
			super();
			this.mouseChildren = false;
			this.mouseEnabled = false;
			this._nHeight = 60;
			this._nWidth = 33;
			this._sObjectType = GameObjectType.TYPE_KING_PLACEMENT_BLOCK
			this.addCollidableType(GameObjectType.TYPE_CANNONBALL);
			this.mcKing = new KingBlock();
			this.mcKing.visible = false;
			this.stop();
		}
		
		/* ---------------------------------------------------------------------------------------- */	
		
		override public function buildBlock($xPlacement:int, $yPlacement:int, $collisionType:int):void
		{	
			var s:Sprite = new KingPlacementBlockGraphic();
			s.width = _nWidth
			s.height = _nHeight;
			this.addChild(s);
			var material :Material = new Material(); //Material(.1, 10, 2, 10);
			
			if ($collisionType == 1)
				bOwnerIsP1 = true;
			else
				bOwnerIsP1 = false;
			
			body = new Body(BodyType.DYNAMIC);
			
			var polygon:Polygon = new Polygon(Polygon.box(_nWidth, _nHeight), material);
			polygon.filter.collisionGroup = $collisionType;
			this.collisionGroupHolder = polygon.filter.collisionGroup;
			
			body.shapes.add(polygon);
			body.position.setxy($xPlacement, $yPlacement);
			body.space = SpaceRef.space;
			body.userData.graphic = s;	
		}
		
		/* ---------------------------------------------------------------------------------------- */	
		
		override public function end():void
		{
			super.end();
			body.space = null;
		}

		/* ---------------------------------------------------------------------------------------- */	
		
		override public function get getCollisionGroup(): int
		{
			return this.collisionGroupHolder;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function get xCoordinate():int
		{
			return this.body.position.x;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		public function get yCoordinate():int
		{
			return this.body.position.y;
		}
		
		/* ---------------------------------------------------------------------------------------- */
	}
}