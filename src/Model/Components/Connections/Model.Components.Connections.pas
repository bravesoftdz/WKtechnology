unit Model.Components.Connections;

interface

uses Model.Components.Connections.interfaces,
  Model.Components.Connections.FireDac;
  type
  TModelComponentsConnections = class(TInterfacedObject,IModelComponentsConnectionsFactory)
    private
    FConnection:IModelComponentsConnectionsGeneric;
    public
    constructor Create;
    destructor Destroy;override;
    class function New:IModelComponentsConnectionsFactory;
    function Connection:IModelComponentsConnectionsGeneric;
  end;

implementation

{ TModelComponentsConnections }

function TModelComponentsConnections.Connection: IModelComponentsConnectionsGeneric;
begin
  if not Assigned(FConnection) then
    FConnection := TModelComponentsConnectionsFireDac.New;

  Result := FConnection;
end;

constructor TModelComponentsConnections.Create;
begin

end;

destructor TModelComponentsConnections.Destroy;
begin

  inherited;
end;

class function TModelComponentsConnections.New: IModelComponentsConnectionsFactory;
begin
  Result := Self.Create;
end;

end.
