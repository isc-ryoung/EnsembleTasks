Class ETPKG.SynchronousFTP Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ETPKG.SynchronousFTP" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="ReadFileIn" Category="" ClassName="ETPKG.SynchronousFTP.ReadFileContents" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\data\ET\SynchronousFTP\in\</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.txt</Setting>
    <Setting Target="Adapter" Name="ArchivePath">C:\InterSystems\data\ET\SynchronousFTP\in\</Setting>
  </Item>
  <Item Name="RetrieveRemoteFile" Category="" ClassName="ETPKG.SynchronousFTP.SyncFTP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Credentials">FTPionos</Setting>
    <Setting Target="Adapter" Name="FTPServer">home156117793.1and1-data.host</Setting>
    <Setting Target="Adapter" Name="FilePath">ftp</Setting>
  </Item>
  <Item Name="WriteFileOut" Category="" ClassName="ETPKG.SynchronousFTP.WriteToFile" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\data\ET\SynchronousFTP\out\</Setting>
  </Item>
</Production>
}

}
