unit uvectorplus;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
const
  MAX_ELEM=5000;
type

  { TVectorPlus }

  TVectorPlus=class
    private
      elem:array[1..MAX_ELEM]of integer;
      dim:integer;
    public
      constructor crear();
      procedure setDim(dime:integer);
      function getDim():integer;
      procedure setElem(pos,ele:integer);
      function getElem(pos:integer):integer;
      procedure cargar(n:integer);
      function CortedeControl():integer;
      function Dispersion():string;
      procedure vectorParImpar(var vPar,vImpar:TVectorPlus);
      procedure intercalar(A,B:TVectorPlus);
      procedure purgar(var vPurga:TVectorPlus);
  end;
implementation

{ TVectorPlus }

constructor TVectorPlus.crear();
var
  pos:integer;
begin
  dim:=0;
  for pos:=1 to MAX_ELEM do
    elem[pos]:=0;
end;

procedure TVectorPlus.setDim(dime: integer);
begin
  if(dime>=0) AND (dime<=MAX_ELEM)then
     dim:=dime
  else
    showMessage('TVector::setDim: Fuera de Rango...');
end;

function TVectorPlus.getDim(): integer;
begin
  result:=dim;
end;

procedure TVectorPlus.setElem(pos, ele: integer);
begin
  if(pos>=1)AND(pos<=dim)then
    elem[pos]:=ele
  else
    showMessage('TVector::setElem: Fuera de Rango...');
end;

function TVectorPlus.getElem(pos: integer): integer;
begin
  if(pos>=1)AND(pos<=dim)then
    result:=elem[pos]
  else
    result:=-999;
end;

procedure TVectorPlus.cargar(n: integer);
var
  pos:integer;
begin
  if(n>=1)AND(n<=MAX_ELEM)then
    begin
    dim:=n;
    for pos:=1 to dim do
       begin
         elem[pos]:=StrToInt(InputBox('Vector','Ingrese un número','0'));
       end;
    end;
end;

function TVectorPlus.CortedeControl: integer;
var
  pos,cc:integer;//CC=Corte de Control
begin
  cc:=0;
  for pos:=1 to dim-1 do
  begin
    if elem[pos]<>elem[pos+1]then
      cc:=cc+1;
  end;
  result:=cc;
end;

function TVectorPlus.Dispersion: string;
var
  i,clave,frec:integer;
  cad:string;
begin
  cad:='';
  if dim=0 then
  begin
    result:='Vector vacío';
    Exit;
  end;
  i:=1;
  while(i<=dim)do
  begin
    clave:=elem[i];
    frec:=0;
    while(i<=dim)and(elem[i]=clave)do
    begin
      frec:=frec+1;
      i:=i+1;
    end;
    cad:=cad+IntToStr(clave)+' => '+IntToStr(frec)+' elementos'+sLineBreak;
  end;
  result:=cad;
end;

procedure TVectorPlus.vectorParImpar(var vPar, vImpar: TVectorPlus);
var
  i,cPar,cImpar:integer;
begin
  cPar:=0;
  cImpar:=0;
  for i:=1 to dim do
  begin
    if(elem[i] mod 2=0)then
    begin
      cPar:=cPar+1;
      vPar.elem[cPar]:=elem[i];
    end
    else
    begin
      cImpar:=cImpar+1;
      vImpar.elem[cImpar]:=elem[i];
    end;
  end;
  vPar.dim:=cPar;
  vImpar.dim:=cImpar;
end;

procedure TVectorPlus.intercalar(A, B: TVectorPlus);
var
  iA,iB,k:integer;
begin
  iA:=1;
  iB:=1;
  k:=0;
  while(iA<=A.dim)and(iB<=B.dim)do
  begin
    k:=k+1;
    elem[k]:=A.elem[iA];
    iA:=iA+1;
    k:=k+1;
    elem[k]:=B.elem[iB];
    iB:=iB+1;
  end;
  while(iA<=A.dim)do
  begin
    k:=k+1;
    elem[k]:=A.elem[iA];
    iA:=iA+1;
  end;
  while(iB<=B.dim)do
  begin
    k:=k+1;
    elem[k]:=B.elem[iB];
    iB:=iB+1;
  end;
  dim:=k;
end;

procedure TVectorPlus.purgar(var vPurga: TVectorPlus);
var
  i,k,clave:integer;
begin
  if dim=0 then
  begin
    vPurga.dim:=0;
    Exit;
  end;
  i:=1;
  k:=0;
  while(i<=dim)do
  begin
    clave:=elem[i];
    k:=k+1;
    vPurga.elem[k]:=clave;
    while(i<=dim)and(elem[i]=clave)do
      i:=i+1;
  end;
  vPurga.dim:=k;
end;

end.

