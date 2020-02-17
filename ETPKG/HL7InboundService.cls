Class ETPKG.HL7InboundService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pInput As %FileCharacterStream, pOutput As %RegisteredObject) As %Status
{

	Quit $$$ERROR($$$NotImplemented)
}

}
