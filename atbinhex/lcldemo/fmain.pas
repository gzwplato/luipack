unit fmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ATBinHex,
  ExtCtrls, Buttons, lclintf;

type

  { TForm1 }

  TForm1 = class(TForm)
    BinHexViewer: TATBinHex;
    ButOpenFile: TButton;
    ButChooseFont: TButton;
    FontDialog1: TFontDialog;
    OpenDialog1: TOpenDialog;
    PanelLeft: TPanel;
    RadioGroupMode: TRadioGroup;
    Splitter1: TSplitter;
    procedure ButChooseFontClick(Sender: TObject);
    procedure ButOpenFileClick(Sender: TObject);
    procedure ChangeMode(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

procedure TForm1.ButOpenFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    BinHexViewer.Open(OpenDialog1.FileName);
  end;
end;

procedure TForm1.ButChooseFontClick(Sender: TObject);
begin
  {.$ifdef Windows}
  if FontDialog1.Execute then
  begin
    BinHexViewer.Font:=FontDialog1.Font;
  end;
  {.$endif}
end;

procedure TForm1.ChangeMode(Sender: TObject);
begin
  case RadioGroupMode.ItemIndex of
    0: BinHexViewer.Mode:=vbmodeText;
    1: BinHexViewer.Mode:=vbmodeBinary;
    2: BinHexViewer.Mode:=vbmodeHex;
    3: BinHexViewer.Mode:=vbmodeUnicode;
  end;
end;

initialization
  {$I fmain.lrs}

end.
