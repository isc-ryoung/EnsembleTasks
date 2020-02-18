Class ETPKG.SynchronousFTP.ReadFileContents Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pInput As %FileCharacterStream,pOutput As %RegisteredObject) As %Status
{
   set tsc=$$$OK
   
   set request=##class(Ens.StringRequest).%New()
   set request.StringValue=  pInput.ReadLine()
   set response=##class(Ens.StringRequest).%New()   
   
   	set tsc=..SendRequestSync("RetrieveRemoteFile",request,.response,10)
   	$$$LOGINFO("tsc: "_tsc)
    if 'tsc {
    	$$$LOGERROR("ReadFile error " _ $System.OBJ.DisplayError(tsc))
    }
    $$$LOGINFO("Resp: "_response.StringValue)
    $$$TRACE("Resp: "_response.StringValue)

    set request.StringValue=  response.StringValue
   
  
   	set tsc=..SendRequestAsync("WriteFileOut",request)

    Quit tsc
}

}