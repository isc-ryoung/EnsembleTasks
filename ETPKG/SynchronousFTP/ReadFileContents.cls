Class ETPKG.SynchronousFTP.ReadFileContents Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pInput As %FileCharacterStream,pOutput As %RegisteredObject) As %Status
{
   set tsc=$$$OK
   
   set request=##class(Ens.StringRequest).%New()
   set request.StringValue=  pInput.ReadLine()
   	set tsc=..SendRequestAsync("RetrieveRemoteFile",request)
   	$$$LOGINFO("tsc: "+tsc)
    if 'tsc {
    	$$$LOGERROR("ReadFile error " _ $System.OBJ.DisplayError(tsc))
    }
    Quit tsc
}

}