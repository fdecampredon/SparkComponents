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
	/**
	 *  Constants that define the  values of the <code>detail</code> property
	 *  of a DateChooserScrollEvent object.
	 *
	 *  @author François de Campredon
	 */
	public class DateChooserScrollEventDetail
	{
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Indicates that the user scrolled the calendar to the next month.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public static const NEXT_MONTH:String = "nextMonth";
		
		/**
		 *  Indicates that the user scrolled the calendar to the next year.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public static const NEXT_YEAR:String = "nextYear";
		
		/**
		 *  Indicates that the user scrolled the calendar to the previous month.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public static const PREVIOUS_MONTH:String = "previousMonth";
		
		/**
		 *  Indicates that the user scrolled the calendar to the previous year.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		public static const PREVIOUS_YEAR:String = "previousYear";
	}
}