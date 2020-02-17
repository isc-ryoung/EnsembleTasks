/// 
Class ETPKG.Splitting.SplitOBXs Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' height='2000' width='2000' >
<context>
<property name='obx' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2500' />
</parameters>
</property>
<property name='iter' type='%Integer' initialexpression='1' instantiate='0' />
</context>
<sequence xend='200' yend='550' >
<trace name='TraceStart' value='"Start"' xpos='200' ypos='250' />
<foreach name='ForOBX' property='request.{OBX()}' key='context.iter' xpos='200' ypos='350' xend='200' yend='650' >
<assign name="Set OBX" property="context.obx" value="request.{OBX(context.iter)}" action="set" xpos='200' ypos='250' />
<trace name='Trace OBX' value='context.obx' xpos='200' ypos='350' />
<transform name='XformSingleOBX' class='ETPKG.Splitting.SingleOBX' source='request' target='response' xpos='200' ypos='450' />
<call name='SendHL7' target='HL7FileOperation' async='1' xpos='200' ypos='550' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="response" action="set" />
</request>
</call>
</foreach>
<trace name='TraceEnd' value='"End"' xpos='200' ypos='450' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
