/// Resequencing
Class ETPKG.Resequencing.ResequencingBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Ens.Response' height='2300' width='2000' >
<context>
<property name='pid' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='oid' type='%Integer' instantiate='0' >
<annotation><![CDATA[object id]]></annotation>
</property>
<property name='orm' type='EnsLib.HL7.Message' instantiate='0' />
</context>
<sequence xend='200' yend='1550' >
<trace name='Trace msgType' value='request.Name' xpos='200' ypos='250' />
<if name='A01' condition='request.Name="ADT_A01"' xpos='200' ypos='350' xend='200' yend='1450' >
<true>
<call name='SendADTMessage' target='HL7FileOperation' async='1' xpos='740' ypos='500' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' />
</call>
<assign name="Assign PID" property="context.pid" value="request.GetValueAt(&quot;PID:3(1).1&quot;)" action="set" xpos='740' ypos='600' />
<trace name='Trace PID' value='"PID: "_context.pid' xpos='740' ypos='700' />
<if name='IsPIDStored' condition='$data(^pidoidstore(context.pid))' xpos='740' ypos='800' xend='740' yend='1350' >
<true>
<assign name="RetrieveORMOIDFromStore" property="context.oid" value="^pidoidstore(context.pid)" action="set" xpos='1010' ypos='950' />
<code name='RetrieveORMFromStore' xpos='1010' ypos='1050' >
<![CDATA[ $$$LOGINFO("OID: "_context.oid)

 set msg = ##class(EnsLib.HL7.Message).%OpenId(context.oid)
 $$$LOGINFO(msg)
 $$$LOGINFO(msg.RawContent)
 set context.orm = msg]]>
</code>
<call name='SendORMMessage' target='HL7FileOperation' async='1' xpos='1010' ypos='1150' >
<request type='Ens.Request' >
<assign property="callrequest" value="context.orm" action="set" />
</request>
<response type='Ens.Response' />
</call>
<code name='DeletePIDStored' xpos='1010' ypos='1250' >
<![CDATA[ kill ^pidoidstore(context.pid)]]>
</code>
</true>
<false>
<assign name="Store PID" property="^pidoidstore(context.pid)" value="&quot;&quot;" action="set" xpos='740' ypos='950' />
</false>
</if>
</true>
<false>
<assign name="Assign ORM PID" property="context.pid" value="request.GetValueAt(&quot;PIDgrp.PID:2.1&quot;)" action="set" xpos='200' ypos='500' />
<trace name='Trace PID' value='context.pid' xpos='200' ypos='600' />
<if name='IsPIDStored' condition='$data(^pidoidstore(context.pid))' xpos='200' ypos='700' xend='200' yend='1150' >
<true>
<call name='SendORMMessage' target='HL7FileOperation' async='1' xpos='200' ypos='850' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' />
</call>
<code name='DeletePIDStored' xpos='200' ypos='950' >
<![CDATA[ kill ^pidoidstore(context.pid)]]>
</code>
</true>
<false>
<assign name="AssignOID" property="context.oid" value="request.%Id()" action="set" xpos='470' ypos='850' />
<trace name='Trace OID' value='context.oid' xpos='470' ypos='950' />
<code name='StorePIDOID' xpos='470' ypos='1050' >
<![CDATA[ $$$LOGINFO("String ORM OID no message sent")
 set ^pidoidstore(context.pid)=context.oid]]>
</code>
</false>
</if>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
