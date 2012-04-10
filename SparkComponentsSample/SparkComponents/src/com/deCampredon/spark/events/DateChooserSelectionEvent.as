////////////////////////////////////////////////////////////////////////////////
//
//  Kap IT  -  Copyright 2011 Kap IT  -  All Rights Reserved.
//
//  This component is distributed under the GNU LGPL v2.1 
//  (available at : http://www.hnu.org/licences/old-licenses/lgpl-2.1.html)
//
////////////////////////////////////////////////////////////////////////////////
package com.deCampredon.spark.events
{
	import flash.events.Event;
	
	/**
	 *  The DateChooserSelectionEvent class represents the event object passed to 
	 *  the event listener for the <code>selectionChange</code> and <code>selectionChanging</code> 
	 *  event for the DateChooser and DateField controls.
	 *
	 *  @see com.deCampredon.spark.components.DateChooser
	 *  
	 * 	@author François de Campredon
	 */
	public class DateChooserSelectionEvent extends Event
	{
		
		/**
		 *  The <code>DateChooserSelectionEvent.SELECTION_CHANGE</code> constant 
		 *  defines the value of the <code>type</code> property of the event 
		 *  object for a <code>selectionChange</code> event.
		 *
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the 
		 *       event listener that handles the event. For example, if you use 
		 *       <code>myButton.addEventListener()</code> to register an event listener, 
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>newDate</code></td><td>The date selected in the control.</td></tr>
		 * 	   <tr><td><code>previousDate</code></td><td>The date previously selected in the control.</td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event; 
		 *       it is not always the Object listening for the event. 
		 *       Use the <code>currentTarget</code> property to always access the 
		 *       Object listening for the event.</td></tr>
		 *  </table>
		 *
		 *  @eventType selectionChange
		 */
		public static const SELECTION_CHANGE:String = "selectionChange";
		
		/**
		 *  The <code>DateChooserSelectionEvent.SELECTION_CHANGE</code> constant 
		 *  defines the value of the <code>type</code> property of the event 
		 *  object for a <code>selectionChanging</code> event.
		 *
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the 
		 *       event listener that handles the event. For example, if you use 
		 *       <code>myButton.addEventListener()</code> to register an event listener, 
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>newDate</code></td><td>The date selected in the control.</td></tr>
		 * 	   <tr><td><code>previousDate</code></td><td>The date previously selected in the control.</td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event; 
		 *       it is not always the Object listening for the event. 
		 *       Use the <code>currentTarget</code> property to always access the 
		 *       Object listening for the event.</td></tr>
		 *  </table>
		 *
		 *  @eventType selectionChange
		 */
		public static const SELECTION_CHANGING:String = "selectionChanging";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor.
		 *
		 *  @param type The event type; indicates the action that triggered the event.
		 *
		 *  @param bubbles Specifies whether the event can bubble
		 *  up the display list hierarchy.
		 *
		 *  @param cancelable Specifies whether the behavior
		 *  associated with the event can be prevented.
		 *
		 *  @param previousDate The date previously selected in the control.
		 * 
		 *  @param newDate The date selected in the control.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public function DateChooserSelectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false,previousDate:Date = null,newDate:Date = null)
		{
			super(type, bubbles, cancelable);
			this.previousDate = previousDate;
			this.newDate = newDate;
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		//----------------------------------
		//  newDate
		//----------------------------------
		
		/**
		 *  The date previously selected in the control.
		 */
		public var previousDate:Date;
		
		//----------------------------------
		//  newDate
		//----------------------------------
		
		/**
		 *  The selected date of the control.
		 */
		public var newDate:Date;
	}
}