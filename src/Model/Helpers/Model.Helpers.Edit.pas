unit Model.Helpers.Edit;

interface
uses
  vcl.stdCtrls, SysUtils;
  type
  TEditHelper = class helper for TEdit
  procedure TextCurrency(aValue:String);overload;
  procedure TextCurrency(aValue:Currency);overload;
  procedure TextInteger(aValue:integer);
  function IsEmpty:Boolean;
  function ToInteger:Integer;
  function ToCurrency:Currency;
  end;
implementation

{ TEditHelper }

procedure TEditHelper.TextCurrency(aValue: String);
begin
  TextCurrency(StrToCurrDef(aValue,0));
end;

function TEditHelper.IsEmpty: Boolean;
begin
  Result := False;
  if (Trim(Self.Text) = '') then
    Result := True;
end;

procedure TEditHelper.TextCurrency(aValue: Currency);
begin
  Self.Text := FormatFloat('#,##0.00',aValue)
end;

procedure TEditHelper.TextInteger(aValue: integer);
begin
  Self.Text := IntToStr(aValue);
end;

function TEditHelper.ToCurrency: Currency;
begin
  Result := StrToCurrDef(Self.Text,0);
end;

function TEditHelper.ToInteger: Integer;
begin
  Result := StrToIntDef(Self.Text,0);
end;

end.
