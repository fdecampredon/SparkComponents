////////////////////////////////////////////////////////////////////////////////
//
//  Kap IT  -  Copyright 2011 Kap IT  -  All Rights Reserved.
//
//  This component is distributed under the GNU LGPL v2.1 
//  (available at : http://www.hnu.org/licences/old-licenses/lgpl-2.1.html)
//
////////////////////////////////////////////////////////////////////////////////
package com.deCampredon.spark.components
{
	import flash.events.Event;
	
	import com.deCampredon.spark.components.supportClass.DropDownBase;
	
	import mx.core.IButton;
	
	//--------------------------------------
	//  Styles
	//--------------------------------------
	
	/**
	 *  The alpha of the border for this component.
	 *
	 *  @default 1.0
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Style(name="borderAlpha", type="Number", inherit="no", theme="spark, mobile", minValue="0.0", maxValue="1.0")]
	
	/**
	 *  The color of the border for this component.
	 *
	 *   @default #696969
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Style(name="borderColor", type="uint", format="Color", inherit="no", theme="spark, mobile")]
	
	/**
	 *  Controls the visibility of the border for this component.
	 *
	 *  @default true
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Style(name="borderVisible", type="Boolean", inherit="no", theme="spark, mobile")]
	
	/**
	 *  The alpha of the content background for this component.
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Style(name="contentBackgroundAlpha", type="Number", inherit="yes", theme="spark, mobile", minValue="0.0", maxValue="1.0")]
	
	/**
	 *  @copy spark.components.supportClasses.GroupBase#style:contentBackgroundColor
	 *   
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Style(name="contentBackgroundColor", type="uint", format="Color", inherit="yes", theme="spark, mobile")]
	
	
	
	/** 
	 *  The PopUpButton control adds a flexible pop-up control
	 *  interface  to a Button control.
	 *  It contains a main button and a secondary button,
	 *  called the pop-up button, which pops up any UIComponent
	 *  object when a user clicks the pop-up button. 
	 *
	 *  <p>A PopUpButton control can have a text label, an icon,
	 *  or both on its face.
	 *  When a user clicks the main part of the PopUpButton 
	 *  control, it dispatches a <code>click</code> event.</p>
	 *
	 *  <p>One common use for the PopUpButton control is to have
	 *  the pop-up button open a List control or a Menu control
	 *  that changes  the function and label of the main button.</p>
	 * 
	 *  @author François de Campredon
	 */
	
	public class PopUpButton extends DropDownBase implements IButton
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 
		 *  
		 */
		
		public function PopUpButton()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties - ButtonBase Delegate
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  label
		//----------------------------------
		/**
		 * @private
		 */
		private var _label:String;

		[Bindable(event="labelChange")]
		/**
		 * @copy spark.components.supportClasses.ButtonBase#label
		 */
		public function get label():String
		{
			return _label;
		}

		/**
		 * @private
		 */
		public function set label(value:String):void
		{
			if( _label == value)
				return;
			_label = value;
			if(openButton)
				openButton.label = label;
			dispatchEvent(new Event("labelChange"));
		}

		//----------------------------------
		//  stickyHighlighting
		//----------------------------------
		/**
		 * @private
		 */
		private var _stickyHighlighting:Boolean;
		
		[Bindable(event="stickyHighlightingChange")]
		/**
		 * @copy spark.components.supportClasses.ButtonBase#stickyHighlighting
		 */
		public function get stickyHighlighting():Boolean
		{
			return _stickyHighlighting;
		}
		
		/**
		 * @private
		 */
		public function set stickyHighlighting(value:Boolean):void
		{
			if( _stickyHighlighting == value)
				return;
			_stickyHighlighting = value;
			if(openButton)
				openButton.stickyHighlighting = stickyHighlighting;
			dispatchEvent(new Event("stickyHighlightingChange"));
		}
		
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Properties IButton implementation
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  emphasized
		//----------------------------------
		/**
		 * @private
		 */
		private var _emphasized:Boolean;
		
		[Bindable(event="emphasizedChange")]
		/**
		 * @inheritDoc
		 */
		public function get emphasized():Boolean
		{
			return _emphasized;
		}
		
		/**
		 * @private
		 */
		public function set emphasized(value:Boolean):void
		{
			if( _emphasized == value)
				return;
			_emphasized = value;
			if(openButton && openButton is IButton)
				IButton(openButton).emphasized = emphasized;
			dispatchEvent(new Event("emphasizedChange"));
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
				openButton.label = label;
				openButton.stickyHighlighting = stickyHighlighting;
				if(openButton is IButton)
					IButton(openButton).emphasized = emphasized;
			}
		}
		
	}
}