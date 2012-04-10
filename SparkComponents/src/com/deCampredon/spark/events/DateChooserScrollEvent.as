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
	 *  The DateChooserEvent class represents the event object passed to 
	 *  the event listener for the <code>scroll</code> event for 
	 *  the DateChooser and DateField controls.
	 *
	 *  @see com.deCampredon.spark.components.DateChooser
	 *  @see com.deCampredon.spark.events.DateChooserScrollEventDetail
	 *  
	 * 	@author François de Campredon
	 */
	public class DateChooserScrollEvent extends Event
	{
		/**
		 *  The <code>DateChooserEvent.SCROLL</code> constant defines the value of the 
		 *  <code>type</code> property of the event object for a <code>scroll</code>event.
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
		 *     <tr><td><code>detail</code></td><td>The scroll direction.</td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event; 
		 *       it is not always the Object listening for the event. 
		 *       Use the <code>currentTarget</code> property to always access the 
		 *       Object listening for the event.</td></tr>
		 *     <tr><td><code>triggerEvent</code></td><td>The event that triggered this change event;
		 *       usually a <code>scroll</code>.</td></tr>
		 *  </table>
		 *
		 *  @eventType scroll
		 * 
		 * 
		 */
		public static const SCROLL:String = "scroll";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		/**
		 *  Constructor.
		 *  Normally called by the DateChooser object and not used in application code.
		 *
		 *  @param type The event type; indicates the action that triggered the event.
		 *
		 *  @param bubbles Specifies whether the event can bubble up the display list hierarchy.
		 *
		 *  @param cancelable Specifies whether the behavior associated with the event can be prevented.
		 *
		 *  @param detail Indicates the unit and direction of scrolling.
		 *  The possible values are
		 *  <code>DateChooserScrollEventDetail.NEXT_MONTH</code>,
		 *  <code>DateChooserScrollEventDetail.NEXT_YEAR</code>,
		 *  <code>DateChooserScrollEventDetail.PREVIOUS_MONTH</code>, or
		 *  <code>DateChooserScrollEventDetail.PREVIOUS_YEAR</code>.
		 *
		 */
		public function DateChooserScrollEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false,detail:String = null)
		{
			super(type, bubbles, cancelable);
			this.detail = detail;
		}
		
		//----------------------------------
		//  detail
		//----------------------------------
		
		/**
		 *  Indicates the direction of scrolling. The values are defined by 
		 *  the DateChooserEventDetail class.
		 *  The possible values are
		 *  <code>DateChooserEventDetail.NEXT_MONTH</code>,
		 *  <code>DateChooserEventDetail.NEXT_YEAR</code>,
		 *  <code>DateChooserEventDetail.PREVIOUS_MONTH</code>, or
		 *  <code>DateChooserEventDetail.PREVIOUS_YEAR</code>.
		 *
		 *  @see com.deCampredon.spark.events.DateChooserScrollEventDetail
		 *  
		 */
		public var detail:String;
	}
}