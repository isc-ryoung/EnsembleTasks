Class ETPKG.SynchronousFTP.SyncFTP Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.FTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method retrieveRemoteFile(
       pRequest As Ens.StringRequest,
       Output pResponse As Ens.StringResponse)
       As %Status
{

	Set tFilename= pRequest.StringValue
	$$$LOGINFO("File: "_tFilename)
	Set stream = ##class(%Stream.GlobalBinary).%New()
	Set tSC=..Adapter.GetStream(tFilename, .stream)
	
	set pResponse=##class(Ens.StringResponse).%New()
	set pResponse.StringValue=stream.ReadLine()
	$$$LOGINFO("Out: "_pResponse.StringValue)
	quit $$$OK
}



XData MessageMap
{
<MapItems>
   <MapItem MessageType="Ens.StringRequest">
    <Method>retrieveRemoteFile</Method>
  </MapItem>
</MapItems>
}


}