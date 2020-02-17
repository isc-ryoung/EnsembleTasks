Class ETPKG.SynchronousFTP Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ETPKG.SynchronousFTP" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="SyncFTP" Category="" ClassName="EnsLib.FTP.PassthroughOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
