Class ETPKG.SynchronousFTP.WriteToFile Extends Ens.BusinessOperation
{
Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";


Method writeToFile(
       pRequest As Ens.StringRequest,
       Output pResponse As Ens.StringResponse)
       As %Status
{

	set message= pRequest.StringValue
	$$$LOGINFO("Msg: "_message)

	set st=..Adapter.PutLine("out.txt",message)

	
	$$$LOGINFO("Message written to file")
  
	quit $$$OK
}


XData MessageMap
{
<MapItems>
   <MapItem MessageType="Ens.StringRequest">
    <Method>writeToFile</Method>
  </MapItem>
</MapItems>
}
}