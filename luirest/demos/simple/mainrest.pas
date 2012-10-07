unit MainREST;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, fpjson, fphttp, HTTPDefs, LuiREST;

type

  { TMainRESTModule }

  TMainRESTModule = class(TRESTServiceModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MainRESTModule: TMainRESTModule;

implementation

uses
  RESTResources;

{ TMainRESTModule }

procedure TMainRESTModule.DataModuleCreate(Sender: TObject);
begin
  RegisterResource('people', TPeople);
end;

{$R *.lfm}

initialization
  RegisterHTTPModule('TMainRESTModule', TMainRESTModule);
end.

