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
	import spark.components.Spinner;
	import spark.core.IDisplayText;
	
	/**
	 *  A Spinner that allow navigation between year 
	 *  DateChooser SkinPart
	 * 
	 *  @see com.deCampredon.spark.components.DateChooser#yearNavigationEnabled
	 * 
	 *  @author François de Campredon
	 */
	public class YearNavigatorSpinner extends Spinner
	{
		public function YearNavigatorSpinner()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Skin parts
		//
		//--------------------------------------------------------------------------
		
		[SkinPart(required="true")]
		
		/**
		 *  A skin part that defines a TextInput control 
		 *  which allows a user to edit the value of
		 *  the NumericStepper component. 
		 *  The value is rounded and committed
		 *  when the user presses enter, focuses out of
		 *  the NumericStepper, or steps the NumericStepper.
		 */
		public var textDisplay:IDisplayText;
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		private var _yearSymbol:String;
		private var yearSymbolChanged:Boolean;

		public function get yearSymbol():String
		{
			return _yearSymbol;
		}
		
		public function set yearSymbol(value:String):void
		{
			if(_yearSymbol != value) {
				_yearSymbol = value;
				yearSymbolChanged = true;
				invalidateProperties();
			}
		}

		
		//--------------------------------------------------------------------------
		//
		//  Overriden Methods
		//
		//--------------------------------------------------------------------------
		private var valueChanged:Boolean;
		override protected function setValue(value:Number):void {
			valueChanged = true;
			super.setValue(value);
			invalidateProperties();
		}
		
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if(valueChanged || yearSymbolChanged) {
				if(textDisplay) {
					textDisplay.text = calculateYearLabel();
				}
				valueChanged = false;
				yearSymbolChanged = false;
			}
		}
		
		/**
		 * @private
		 */
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName,instance);
			if(instance == textDisplay) {
				textDisplay.text = calculateYearLabel();
			}
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private function calculateYearLabel():String
		{
			return String(value)+(yearSymbol?yearSymbol:"");
		}
	}
}