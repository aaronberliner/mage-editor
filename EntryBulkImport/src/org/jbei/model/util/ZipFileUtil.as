package org.jbei.model.util
{
	import deng.fzip.FZip;
	import deng.fzip.FZipFile;
	
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;

    /**
    * Utility wrapper around attachmentZipfile and sequenceZip file
    */ 
	public class ZipFileUtil
	{
        private var _attach:FZip;
        private var _seq:FZip;
        private var _attArray:ByteArray;
        private var _seqArray:ByteArray;
		
		public function ZipFileUtil( attArray:ByteArray, attachZip:FZip, seqArray:ByteArray, seqZip:FZip )
		{
            this._attach = attachZip;
            this._attArray = attArray;
            this._seq = seqZip;
            this._seqArray = seqArray;
		}     
        
        public function get sequenceZip() : FZip 
        {
            return this._seq;
        }
        
        public function get attachmentZip() : FZip
        {
            return this._attach;
        }
        
        public function get sequenceZipArray() : ByteArray
        {
            return this._seqArray;
        }
        
        public function get attachmentZipArray() : ByteArray
        {
            return this._attArray;
        }
        
        /**
        * @returns true, if the attachment zip file contains a file 
        * with the name passed in the parameter. false otherwise, including
        * cases where the zipfile itself is null
        */ 
        public function containsAttachmentFile( name:String ) : Boolean
        {
            if( this._attach == null || name == null )
                return false;
            
            
            for( var i:uint = 0; i < this._attach.getFileCount(); i += 1 )
            {
                var file:FZipFile = this._attach.getFileAt( i ) as FZipFile;
                if( file == null )
                    continue;
                if( filename( file.filename ) === name )
                    return true;
            }
            return false;
        }
        
        public function containsSequenceFile( name:String) : Boolean
        {
            if( this._seq == null || name == null )
                return false;            
            
            for( var i:uint = 0; i < this._seq.getFileCount(); i += 1 )
            {
                var file:FZipFile = this._seq.getFileAt( i ) as FZipFile;
                if( file == null )
                    continue;
                if( filename( file.filename ) === name )
                    return true;
            }
            return false;
        }
        
        /**
        * checks if the file named in the parameter is contained in the
        * sequence zip file and returns it if that is case. Returns null in
        * all other instances
        */ 
        public function fileInSequenceZip( name:String ) : ByteArray 
        {
            if( this._seq == null || name == null )
                return null;
            
            for( var i:int=0; i < this._seq.getFileCount(); i += 1 )
            {
                var file:FZipFile = _seq.getFileAt( i ) as FZipFile;
                if( filename( file.filename ) == name )
                    return file.content;
            }
            return null;
        }
		
        public function fileInAttachmentZip( name:String ) : ByteArray 
        {
            if( this._attach == null || name == null )
                return null;
            
            for( var i:int=0; i < this._attach.getFileCount(); i += 1 )
            {
                var file:FZipFile = _attach.getFileAt( i ) as FZipFile;
                if( filename( file.filename ) == name )
                    return file.content;
            }
            return null;
        }
        
		private function filename( relName:String ) : String
		{
			var index:int = relName.lastIndexOf( "/" );
			if( index == -1)
				return relName;
			
			return relName.substr( index+1, relName.length );
		}
	}
}