Class ETPKG.Splitting.SingleOBX Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.3.1:ADT_A06' targetDocType='2.3.1:ADT_A06' create='new' language='objectscript' >
<assign value='source' property='target' action='set' />
<assign value='' property='target.{OBX()}' action='remove' />
<assign value='source.{OBX(context.iter)}' property='target.{OBX(1)}' action='set' />
</transform>
}

}
