package org.jbei.registry.models
{
	[Bindable]
	[RemoteClass(alias="org.jbei.ice.services.blazeds.vo.UserPreferences")]
    /**
     * @author Zinovii Dmytriv
     */
	public class UserPreferences
	{
		private var _bpPerRow:int = -1;
		private var _sequenceFontSize:int = 11;
		private var _orfMinimumLength:int = 300;
		private var _labelsFontSize:int = 10;
		private var _maxResitrictionEnzymesCuts:int = -1;
		
		// Constructor
		public function UserPreferences()
		{
		}
		
		// Properties
		public function get bpPerRow():int
		{
			return _bpPerRow;
		}
		
		public function set bpPerRow(value:int):void
		{
			_bpPerRow = value;
		}
		
		public function get sequenceFontSize():int
		{
			return _sequenceFontSize;
		}
		
		public function set sequenceFontSize(value:int):void
		{
			_sequenceFontSize = value;
		}
		
		public function get orfMinimumLength():int
		{
			return _orfMinimumLength;
		}
		
		public function set orfMinimumLength(value:int):void
		{
			_orfMinimumLength = value;
		}
		
		public function get labelsFontSize():int
		{
			return _labelsFontSize;
		}
		
		public function set labelsFontSize(value:int):void
		{
			_labelsFontSize = value;
		}
		
		public function get maxResitrictionEnzymesCuts():int
		{
			return _maxResitrictionEnzymesCuts;
		}
		
		public function set maxResitrictionEnzymesCuts(value:int):void
		{
			_maxResitrictionEnzymesCuts = value;
		}
	}
}
