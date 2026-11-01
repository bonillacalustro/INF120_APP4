unit fventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids
  , uvectorplus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ELE: TEdit;
    Label1: TLabel;
    POS: TEdit;
    SGA: TStringGrid;
    SGB: TStringGrid;
    SGC: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    vA,vB,vC:TVectorPlus;
    procedure updateSG(grid:TStringGrid; v:TVectorPlus);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  vA := TVectorPlus.crear();
  vB := TVectorPlus.crear();
  vC := TVectorPlus.crear();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  vA.cargar(StrToInt(ELE.Text));
  updateSG(SGA,vA);
  ELE.Text:='';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  vB.cargar(StrToInt(ELE.Text));
  updateSG(SGB,vB);
  ELE.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  vC.cargar(StrToInt(ELE.Text));
  updateSG(SGC,vC);
  ELE.Text:='';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  showMessage('Cortes en A : '+IntToStr(vA.CortedeControl())+sLineBreak+
              'Cortes en B : '+IntToStr(vB.CortedeControl())+sLineBreak+
              'Cortes en C : '+IntToStr(vC.CortedeControl())+sLineBreak);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  showMessage('Disepericion de A : '+sLineBreak+vA.Dispersion()+sLineBreak+
              'Disepericion de B : '+sLineBreak+vB.Dispersion()+sLineBreak+
              'Disepericion de C : '+sLineBreak+vC.Dispersion()+sLineBreak);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  vA.vectorParImpar(vB,vC);
  updateSG(SGB, vB);
  updateSG(SGC, vC);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  vC.intercalar(vA,vB);
  updateSG(SGC,vC);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  CLOSE();
end;

procedure TForm1.updateSG(grid: TStringGrid; v: TVectorPlus);
var
  i:integer;
begin
  Grid.ColCount:=V.getDim();
  for i:=1 to V.getDim() do
      grid.Cells[i-1,0]:=IntToStr(V.getElem(i));
end;

end.

