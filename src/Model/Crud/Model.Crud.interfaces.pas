unit Model.Crud.interfaces;

interface

uses
  Data.DB;

  type
  IModelCrudGeneric< T:Class > = interface
  function DataSource(aValue:TDataSource):IModelCrudGeneric<T>;
  function Delete:IModelCrudGeneric<T>;
  function GetAll:IModelCrudGeneric<T>;
  function GetId(aId:Integer):IModelCrudGeneric<T>;
  function Insert:IModelCrudGeneric<T>;
  function This:T;
  function Update:IModelCrudGeneric<T>;
  end;

implementation

end.
