package com.teamphysics.chrisp.screens {
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;

	
	/**
	 * Results Screen
	 * 
	 * @author Chris Park
	 */
	public class ResultsScreen extends AbstractScreen
	{
		
		//Buttons
		public var btResultsPlayAgain			:SimpleButton;
		public var btResultsToTitle				:SimpleButton;
		public var btResultsCredits				:SimpleButton;
		
		//Signals
		public var playAgainClickedSignal		:Signal = new Signal();
		public var toTitleClickedSignal			:Signal = new Signal();
		public var creditsClickedSignal			:Signal = new Signal();
		
		/* ---------------------------------------------------------------------------------------- */
		
		/**
		 * Constructs the ResultsScreen object.
		 */
		public function ResultsScreen()
		{
			super();
		}
		
		/* ---------------------------------------------------------------------------------------- */		
		
		override public function begin():void
		{
			super.begin();
			
			this.btResultsPlayAgain.addEventListener(MouseEvent.CLICK, playAgainClicked);
			this.btResultsToTitle.addEventListener(MouseEvent.CLICK, toTitleClicked);
			this.btResultsCredits.addEventListener(MouseEvent.CLICK, creditsClicked);
			
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		override public function end():void
		{
			super.end();
			
			this.btResultsPlayAgain.removeEventListener(MouseEvent.CLICK, playAgainClicked);
			this.btResultsToTitle.removeEventListener(MouseEvent.CLICK, toTitleClicked);
			this.btResultsCredits.removeEventListener(MouseEvent.CLICK, creditsClicked);
		}
		
		/* ---------------------------------------------------------------------------------------- */
		// [ BUTTON EVENT TRIGGERS ]
		/* ---------------------------------------------------------------------------------------- */
		
		protected function playAgainClicked($e:MouseEvent):void
		{
			trace("Results: Play Again Clicked.");
			this.playAgainClickedSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		protected function toTitleClicked($e:MouseEvent):void
		{
			trace("Results: To Title Clicked.");
			this.toTitleClickedSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		protected function creditsClicked($e:MouseEvent):void
		{
			trace("Results: Credits Clicked.");
			this.creditsClickedSignal.dispatch();
		}
		
		/* ---------------------------------------------------------------------------------------- */
		// [ / BUTTON EVENT TRIGGERS ]
		/* ---------------------------------------------------------------------------------------- */
	}
}

