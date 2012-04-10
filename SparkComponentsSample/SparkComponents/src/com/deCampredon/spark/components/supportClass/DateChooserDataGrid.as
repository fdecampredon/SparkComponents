package com.deCampredon.spark.components.supportClass
{
	import com.deCampredon.spark.components.DateChooser;
	
	import mx.core.ClassFactory;
	
	import spark.components.DataGrid;
	import spark.components.gridClasses.IGridVisualElement;
	

	public class DateChooserDataGrid extends DataGrid
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		/**
		 * Constructor
		 */
		public function DateChooserDataGrid()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  SkinPart
		//
		//--------------------------------------------------------------------------
		
		[SkinPart(required="false",type="spark.components.gridClasses.IGridVisualElement")]
		/**
		 * Skin part that will renderer the "today" indicator
		 */
		public var todayIndicator:ClassFactory;
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		public function get dateChooserGrid():DateChooserGrid {
			return grid as DateChooserGrid;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  dateChooser
		//----------------------------------
		
		private var _dateChooser:DateChooser = null;
		
		[Bindable("dateChooserChanged")]
		
		/**
		 *  The DateChooser control for which this DateChooserDataGrid is used as the grid skin part.
		 * 
		 *  @default null
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 2.5
		 *  @productversion Flex 4.5
		 */
		public function get dateChooser():DateChooser
		{
			return _dateChooser;
		}
		
		/**
		 *  @private
		 */
		public function set dateChooser(value:DateChooser):void
		{
			if (_dateChooser == value)
				return;
			
			_dateChooser = value;
			if(dateChooserGrid) {
				dateChooserGrid.dateChooser = value;
			}
			dispatchChangeEvent("dateChooserChanged");
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overriden methods
		//
		//--------------------------------------------------------------------------
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName,instance);
			if(instance == dateChooserGrid) {
				dateChooserGrid.dateChooser = dateChooser;
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
		private function dispatchChangeEvent(event:String):void
		{
			if(hasEventListener(event))
				dispatchChangeEvent(event);
		}
	}
}
