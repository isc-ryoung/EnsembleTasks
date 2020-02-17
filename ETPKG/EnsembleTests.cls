Class ETPKG.EnsembleTests
{

/// HealthShare20192
/// Namespace ET
/// do ##class(ETPKG.EnsembleTests).getHL7Msg(162)
ClassMethod getHL7Msg(id)
{

	set msg = ##class(EnsLib.HL7.Message).%OpenId(id)
	w msg
	set dmp = $SYSTEM.OBJ.Dump(msg)
	write "dmp:", dmp, !
	//zw msg
	set ^Debug = msg
	
	set orm = msg.RawContentGet()
	zw orm
}

}
