Class ETPKG.SyncFTP Extends EnsLib.FTP.PassthroughOperation
{

Method OnMessage(pRequest As Ens.StreamContainer, Output pResponse As %Persistent) As %Status
{
	///Quit:'$IsObject(pRequest.Stream) $$$ERROR($$$EnsErrGeneral,"No Stream contained in StreamContainer Request")
	/*
	Set tNameIn=##class(%File).GetFilename(pRequest.OriginalFilename)
	Set (tFilename,tFinalFilename)=..Adapter.CreateTimestamp(tNameIn,..Filename)
	If ""'=..TempFilename {
		Set tFilename=..Adapter.CreateTimestamp(tNameIn,..TempFilename)
	}
	Set tSC=..Adapter.PutStream(tFilename, pRequest.Stream)
	*/

	Set tFilename= pRequest.StringValue
	$$$LOGINFO("File: "_tFilename)
  
	///.StreamGet().ReadLine()
	Set stream = ##class(%Stream.GlobalBinary).%New()
	Set tSC=..Adapter.GetStream(tFilename, .stream)
	
	set pResponse = stream
	 
	Quit tSC
}

}
