Class ETPKG.Resequencing Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ETPKG.Resequencing" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description>Resequencing HL7 messages</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="BadMessageHandler" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="Bad messages are sent to this operation." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">ETPKG.Resequencing.AlertRule</Setting>
  </Item>
  <Item Name="EMailAlert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="PagerAlert" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This sends alerts to a pager via e-mail." LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HL7FileOperation" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\data\ET\Resquencing\HL7Out\</Setting>
  </Item>
  <Item Name="HL7FileServiceIn" Category="HL7" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.3.1</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\data\ET\Resquencing\HL7In</Setting>
    <Setting Target="Adapter" Name="ArchivePath">C:\InterSystems\data\ET\Resquencing\HL7In\archive\</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.txt</Setting>
    <Setting Target="Host" Name="TargetConfigNames">ResequencingBP</Setting>
  </Item>
  <Item Name="ResequencingBP" Category="HL7" ClassName="ETPKG.Resequencing.ResequencingBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
