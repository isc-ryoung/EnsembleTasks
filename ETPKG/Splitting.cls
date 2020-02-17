Class ETPKG.Splitting Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ETPKG.Splitting" TestingEnabled="false" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">ETPKG.Splitting.AlertRule</Setting>
  </Item>
  <Item Name="HL7FileService" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Service." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">SplitOBXs</Setting>
    <Setting Target="Adapter" Name="ArchivePath">C:\InterSystems\data\ET\Splitting\HL7In\</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\data\ET\Splitting\HL7In\</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.txt</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.3.1</Setting>
  </Item>
  <Item Name="HL7FileOperation" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\data\ET\Splitting\HL7Out\</Setting>
  </Item>
  <Item Name="SplitOBXs" Category="" ClassName="ETPKG.Splitting.SplitOBXs" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
