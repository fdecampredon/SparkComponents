////////////////////////////////////////////////////////////////////////////////
//
//  Kap IT  -  Copyright 2011 Kap IT  -  All Rights Reserved.
//
//  This component is distributed under the GNU LGPL v2.1 
//  (available at : http://www.hnu.org/licences/old-licenses/lgpl-2.1.html)
//
////////////////////////////////////////////////////////////////////////////////
package com.deCampredon.spark.components.supportClass
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import spark.components.SkinnableContainer;
	import spark.components.supportClasses.ButtonBase;
	import spark.components.supportClasses.DropDownController;
	import spark.events.DropDownEvent;
	
	//--------------------------------------
	//  Styles
	//--------------------------------------
	
	/**
	 *  The radius of the corners for this component.
	 *
	 *  @default 4
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Style(name="cornerRadius", type="Number", format="Length", inherit="no", theme="spark")]
	
	/**
	 *  Controls the visibility of the drop shadow for this component.
	 *
	 *  @default true
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Style(name="dropShadowVisible", type="Boolean", inherit="no", theme="spark")]
	
	//--------------------------------------
	//  Events
	//--------------------------------------
	
	/**
	 *  Dispatched when the drop-down list closes for any reason, such when 
	 *  the user:
	 *  <ul>
	 *      <li>Selects an item in the drop-down list.</li>
	 *      <li>Clicks outside of the drop-down list.</li>
	 *      <li>Clicks the anchor button while the drop-down list is 
	 *  displayed.</li>
	 *  </ul>
	 *
	 *  @eventType spark.events.DropDownEvent.CLOSE
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Event(name="close", type="spark.events.DropDownEvent")]
	
	/**
	 *  Dispatched when the user clicks the anchor button
	 *  to display the drop-down list.  
	 *  It is also dispatched if the user
	 *  uses Control-Down to open the dropDown.
	 *
	 *  @eventType spark.events.DropDownEvent.OPEN
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Event(name="open", type="spark.events.DropDownEvent")]
	
	//--------------------------------------
	//  SkinStates
	//--------------------------------------
	
	/**
	 *  Skin state for the open state of the DropDownListBase control.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("open")]
	
	
	/**
	 * Base Class for Components that display a PopUp
	 * 
	 * @author François de Campredon
	 */
	public class DropDownBase extends SkinnableContainer
	{
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		
		public function DropDownBase()
		{
			super();
			dropDownController = new DropDownController();
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Skin parts
		//
		//--------------------------------------------------------------------------    
		
		
		
		//----------------------------------
		//  openButton
		//----------------------------------
		
		[SkinPart(required="true")]
		
		/**
		 *  A skin part that defines the anchor button.  
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public var openButton:ButtonBase;
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  baselinePosition
		//----------------------------------
		
		/**
		 *  @private
		 */
		override public function get baselinePosition():Number
		{
			return getBaselinePositionForPart(openButton);
		}
		
		//----------------------------------
		//  dropDownController
		//----------------------------------
		
		/**
		 *  @private
		 */
		private var _dropDownController:DropDownController; 
		
		/**
		 *  Instance of the DropDownController class that handles all of the mouse, keyboard 
		 *  and focus user interactions. 
		 * 
		 *  Flex calls the <code>initializeDropDownController()</code> method after 
		 *  the DropDownController instance is created in the constructor.
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		protected function get dropDownController():DropDownController
		{
			return _dropDownController;
		}
		
		/**
		 *  @private
		 */
		protected function set dropDownController(value:DropDownController):void
		{
			if (_dropDownController == value)
				return;
			
			_dropDownController = value;
			
			_dropDownController.addEventListener(DropDownEvent.OPEN, dropDownController_openHandler);
			_dropDownController.addEventListener(DropDownEvent.CLOSE, dropDownController_closeHandler);
			
			if (openButton)
				_dropDownController.openButton = openButton;
			if (contentGroup)
				_dropDownController.dropDown = contentGroup;    
		}
		
		//----------------------------------
		//  isDropDownOpen
		//----------------------------------
		
		/**
		 *  @copy spark.components.supportClasses.DropDownController#isOpen
		 */
		public function get isDropDownOpen():Boolean
		{
			if (dropDownController)
				return dropDownController.isOpen;
			else
				return false;
		}
		
		//----------------------------------
		//  hitAreaAdditions
		//----------------------------------
		
		/**
		 *  A list of display objects to consider part of the hit area
		 *  of the drop down.  Mouse clicks within any component listed
		 *  as an inclusion will not automatically close the drop down.
		 */
		public function get hitAreaAdditions():Vector.<DisplayObject>
		{
			if(dropDownController)
				return dropDownController.hitAreaAdditions;
			return null;
		}
		
		/**
		 * @private
		 */
		public function set hitAreaAdditions(value:Vector.<DisplayObject>):void
		{
			if(dropDownController)
				dropDownController.hitAreaAdditions = value;
		}
		
		
		//----------------------------------
		//  openOnRollOver
		//----------------------------------
		
		private var _openOnRollOver:Boolean
		
		[Bindable(event="openOnRollOverChange")]
		public function get openOnRollOver():Boolean
		{
			return _openOnRollOver;
		}

		public function set openOnRollOver(value:Boolean):void
		{
			if( _openOnRollOver == value)
				return;
			_openOnRollOver = value;
			updateRollOverOpenDelay()
			dispatchEvent(new Event("openOnRollOverChange"));
		}
		
		
		//----------------------------------
		//  rolloverOpenDelay
		//----------------------------------
		
		/**
		 *  @private 
		 */
		private var _rollOverOpenDelay:Number = 0;
		
		[Bindable(event="rollOverOpenDelayChanged")]
		/**
		 *  Specifies the delay, in milliseconds, to wait for opening the drop down 
		 *  when the anchor button is rolled over.  
		 * 
		 *  @default 0
		 */
		public function get rollOverOpenDelay():Number
		{
			return _rollOverOpenDelay;
		}
		
		/**
		 *  @private 
		 */
		public function set rollOverOpenDelay(value:Number):void
		{
			if (_rollOverOpenDelay == value)
				return;
			_rollOverOpenDelay = value;
			updateRollOverOpenDelay();
			dispatchEvent(new Event("rollOverOpenDelayChanged"));
		}
		
		private function updateRollOverOpenDelay():void
		{
			if(openOnRollOver) {
				dropDownController.rollOverOpenDelay = isNaN(rollOverOpenDelay)?0:rollOverOpenDelay;
			}
			else {
				dropDownController.rollOverOpenDelay = NaN;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------   
		
		/**
		 *  Open the drop-down list and dispatch 
		 *  a <code>DropdownEvent.OPEN</code> event.
		 *  
		 */ 
		public function openDropDown():void
		{
			dropDownController.openDropDown();
		}
		
		/**
		 *  Close the drop-down list and dispatch a <code>DropDownEvent.CLOSE</code> event. 
		 *   
		 *  @param commit If <code>true</code>, commit the selected
		 *  data item. 
		 *  
		 */
		public function closeDropDown(commit:Boolean = true):void
		{
			dropDownController.closeDropDown(commit);
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		
		/**
		 *  @private
		 */ 
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == openButton)
			{
				if (dropDownController)
					dropDownController.openButton = openButton;
			}
			else if (instance == contentGroup && dropDownController)
			{
				dropDownController.dropDown = contentGroup;
			}
		}
		
		/**
		 *  @private
		 */
		override protected function partRemoved(partName:String, instance:Object):void
		{
			if (dropDownController)
			{
				if (instance == openButton)
					dropDownController.openButton = null;
				
				if (instance == contentGroup)
					dropDownController.dropDown = null;
			}
			
			super.partRemoved(partName, instance);
		}
		
		/**
		 *  @private
		 */ 
		override protected function getCurrentSkinState():String
		{
			return !enabled ? "disabled" : isDropDownOpen ? "open" : "normal";
		}   
		
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------   
		
		
		/**
		 *  @private
		 *  Event handler for the <code>dropDownController</code> 
		 *  <code>DropDownEvent.OPEN</code> event. Updates the skin's state and 
		 *  ensures that the selectedItem is visible. 
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		protected function dropDownController_openHandler(event:DropDownEvent):void
		{
			invalidateSkinState();  
		}
		
		
		/**
		 *  @private
		 *  Event handler for the <code>dropDownController</code> 
		 *  <code>DropDownEvent.CLOSE</code> event. Updates the skin's state.
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		protected function dropDownController_closeHandler(event:DropDownEvent):void
		{
			invalidateSkinState();
			
		}
	}
}