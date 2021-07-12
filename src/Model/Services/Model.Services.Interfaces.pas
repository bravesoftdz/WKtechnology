unit Model.Services.Interfaces;

interface

uses
  Data.DB, System.SysUtils;

type
  IModelServicesFactory = interface

  end;

  IModelServicesOrder<T> = interface
    function &Abort: IModelServicesOrder<T>;
    function Add: IModelServicesOrder<T>;
    function Cancel: IModelServicesOrder<T>;
    function DataSource(aValue: TDataSource):IModelServicesOrder<T>;
    function DisplayAttFieldsOrder(aDisplay: TProc): IModelServicesOrder<T>;
    function Get: IModelServicesOrder<T>;
    function Save: IModelServicesOrder<T>;
    function This: T;

  end;

  IModelServicesProductOrder<T> = interface
    function &Abort: IModelServicesProductOrder<T>;
    function Add: IModelServicesProductOrder<T>;
    function Cancel: IModelServicesProductOrder<T>;
    function DataSource(aValue: TDataSource):IModelServicesProductOrder<T>;
    function DisplayAttValueTotal(aDisplay: TProc<Currency>): IModelServicesProductOrder<T>;
    function DisplayClearFieldsProduct(aDisplay: TProc):IModelServicesProductOrder<T>;
    function Get(aId: Integer): IModelServicesProductOrder<T>;
    function Remove(aValue: Integer): IModelServicesProductOrder<T>;
    function Save: IModelServicesProductOrder<T>;
    function This: T;
    function TotalOrder: Currency;
    function Update: IModelServicesProductOrder<T>;
  end;

implementation

end.
