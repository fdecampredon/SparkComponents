package com.deCampredon.spark.components.supportClass
{
	import com.deCampredon.spark.components.DateChooser;
	
	import spark.components.Grid;
	
	public class DateChooserGrid extends Grid
	{
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
			invalidateDisplayList();
		}
		
		public function DateChooserGrid()
		{
			super();
			this.layout = new DateChooserGridLayout();
		}
	}
}
	
import com.deCampredon.spark.components.DateChooser;
import com.deCampredon.spark.components.supportClass.DateChooserGrid;

import flash.geom.Rectangle;

import mx.core.ClassFactory;
import mx.core.IUIComponent;
import mx.core.IVisualElement;

import spark.components.gridClasses.CellPosition;
import spark.components.gridClasses.GridLayer;
import spark.components.gridClasses.GridLayout;
import spark.components.gridClasses.IGridVisualElement;

class DateChooserGridLayout extends GridLayout
{
	public function DateChooserGridLayout()
	{
		super();
	}
	
	override public function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
		super.updateDisplayList(unscaledWidth,unscaledHeight);
		const todayIndicator:IVisualElement = todayIndicator;
		const todayIndicatorLayer:GridLayer = dateChooserGrid.getChildByName("todayIndicatorLayer") as GridLayer;
		if(todayIndicator && todayIndicatorLayer) {
			todayIndicator.visible = false;
			if(dateChooser && dateChooser.showToday) {
				if (todayIndicator.parent != todayIndicator)
					todayIndicatorLayer.addElement(todayIndicator);
				
				const cellPosition:CellPosition = dateChooser?dateChooser.getTodayCellPosition():null;
				const bounds:Rectangle = cellPosition?
					getCellBounds(cellPosition.rowIndex,cellPosition.columnIndex):null;
				
				if(bounds) {
					todayIndicator.setLayoutBoundsPosition(bounds.x,bounds.y);
					todayIndicator.setLayoutBoundsSize(bounds.width,bounds.height);
					todayIndicator.visible = true;
					if(todayIndicator is IGridVisualElement)
						IGridVisualElement(todayIndicator).prepareGridVisualElement(dateChooserGrid,cellPosition.rowIndex,cellPosition.columnIndex);
				}
			}
		}
		if(dateChooser && dateChooserGrid.columns) {
			var columnNumber:int = dateChooserGrid.columns?dateChooserGrid.columns.length:0;
			var rowsNumber:int = 6;
			for (var columnIndex:int = 0; columnIndex < columnNumber; columnIndex++) 
			{
				for (var rowIndex:int = 0; rowIndex < rowsNumber; rowIndex++) 
				{
					var renderer:IUIComponent =dateChooserGrid.getItemRendererAt(rowIndex,columnIndex) as IUIComponent;
					if(renderer)
						renderer.enabled = dateChooser.isEnabledCell(rowIndex,columnIndex);
				}
			}
			
		}
	}
	
	/**
	 *	@private
	 */
	private function get todayIndicator():IVisualElement {
		return dateChooser?dateChooser.todayIndicator:null;
	}
	
	/**
	 *	@private
	 */
	private function get dateChooser():DateChooser {
		return dateChooserGrid?dateChooserGrid.dateChooser:null;
	}
	
	/**
	 *	@private
	 */
	private function get dateChooserGrid():DateChooserGrid {
		return target as DateChooserGrid;
	}
}
