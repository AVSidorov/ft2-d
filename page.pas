program PageOfData;
{������� 䠩�� ���� ������ ⮪����� ��-2}
{Shot ->   Sheet    ->     Channel         -> Page}
{����� -> ���� ������� -> ����� ����७�� -> ��࠭��}
Const
 RegimeType: array [1..8] of string [4] =
             ('OH', 'In', 'Out', 'CRU', 'LHCD', 'LHH', 'IR', ' ');
 RegimeParNames:  array [1..8] of string [8] =
             ('B_tor', 'I_pl', '<n_e>', 'P_rf', 'Tau_rf', '', '', '');
 RegimeParUnits:  array [1..8] of string [4] =
             ('kGs', 'kA', '���', 'kW', 'ms', '', '', ' ');

type
 ByteArray3       = array [1..3]  of byte;
 BooleanArray32   = array [1..32] of boolean;
 SingleArray16   = array [1..16] of Single;
 String8Array16  = array [1..16]  of String[8];
 String79   = string [79];
 String32   = string [32];
 String16   = string [16];
 String4    = string [4];
 Single2    = array [1..2] of single;
 WordArray  = array  [1..2048] of word;

 ShotHeadType = record
     {���ᠭ�� ����५�}
     ShotDate:          ByteArray3;           {��� ����५�}
     ShotTime:          ByteArray3;           {�६� ����५�}
     ShotNumber:        byte;                 {����� ����५�}
     Comment:           string79;             {�������਩}
     NumberOfSheets:    Byte;                 {��᫮ ���⮢}
     SheetNames:        String8Array16;       {ᯨ᮪ �������� ���⮢}
     RegimePar:         SingleArray16;        {��ࠬ���� ����५�}
     RegimeName:        String16;             {⨯ ����५�}
     ExtDiagnostics:    BooleanArray32;       {'���譨�' �������⨪�}
     end;

 PageType = record
     {���न���� ��࠭���}
     SheetNumber:    byte;
     ChannelNumber:  byte;
     ChannelName:    string16;
     ChPosition:     single2;
     ChParameter:    single;
     ParUnit:        string4;
     PageNumber:     byte;
     NumberOfPages:  byte;
     Source:         string16;                 {���筨� ������}

     {ᨭ�஭����� � ⠪�஢���� ��࠭��� ������}
     Start:          double;    {microsec}
                     {�६� ��ࢮ�� ����७�� �� ��࠭��}
     ShiftedStart:   double;    {microsec}
                     {ᤢ�� ��ࢮ�� ����७�� �� ��࠭��, (=0)}
     Tic:            double;    {microsec}
                     {���ࢠ� ����७�� �� ��࠭��}
     TicCoeff:       double;    {microsec}
                     {���ࠢ�� ���ࢠ�� ����७�� �� ��࠭�� (=1)}

     {��஢� ����� �� ��࠭��}
     Range:              word;   {����� ��஢�� �������� ���}
     DataMin,DataMax:    word;   {��஢�� �������� ��������� ᨣ���� �� ��࠭��}
     DataZero:           single; {�।��� �� "�㫥��� �����" ������ }
     SigmaDataZero:      single; {��c����� �।���� �� "�㫥��� �����" ������}
     Zero:               byte;   {���� Zero=0,1}

     {�����஢�� ����७��}
     { U(V):=UShift+Umin+(Data-Zero*DataZero)*(Umax-Umin)*UCoeff/Range }
     Umin, Umax:     single;   {V}
                     {�������, ᮮ⢥�����騥 0 � Range ����⠬ �� ��࠭��}
     UShift:         single;   {V}
                     {ᤢ�� ��������� ����७�� �� ��࠭��, (=0)}
     UCoeff:         single;
                     {���ࠢ�� ��������� ����७�� �� ��࠭��, (=1)}

     {���᫥��� �����塞�� ����稭�}
     { Value:= Value0+(U-U0)*ValueCoeff;}
     U0:             single;
     Value0:         single;   {���祭�� �����塞�� ����稭� �� U=U0}
     ValueCoeff:     single;   {dValue/dU}
     Units:          string4;  {������� ����७�� ����稭�}
     tau:            single;   {����ﭭ�� ��⥣�஢����}

     {�����}
     PageData:       WordArray;
     end;



var
   page: PageType;
   ShotHead: ShotHeadType;
   SizePage, SizeData, SizeShotHead: integer;
   k: word;
   Shot:file;
begin
   SizeData:=SizeOf(page.PageData);
   SizePage:=SizeOf(page);   SizeShotHead:=SizeOf(ShotHead);
   WriteLn('==========================');
   WriteLn('Page =', SizePage:5, ' byte;  Data =', SizeData:5,
           ' byte;  Header =', (SizePage-SizeData):5, '; byte.' );
   WriteLn('ShotHead =', SizeShotHead:5, ' byte');
   WriteLn;
with  ShotHead do
  begin
     ShotDate[1]:=99;ShotDate[2]:=10;ShotDate[3]:=01;
     ShotTime[1]:=09;ShotTime[2]:=15;ShotTime[3]:=00;
     ShotNumber:=1;
     NumberOfSheets:=4;
     Comment:='first shot';
     for k:=1 to 16 do SheetNames[k]:='Sheet';
     for k:=1 to 16 do RegimePar[k]:=k;
     for k:=1 to 16 do ExtDiagnostics[k]:=true;
  end;

with Page do
     begin
     SheetNumber:=1;   ChannelNumber:=1;      ChannelName:='FirstChannel';
     PageNumber:=1;    NumberOfPages:=1;      Source:='From Head';

     Start:=0;      ShiftedStart:=0;      Tic:=30;      TicCoeff:=1;

     Range:=4095;      DataMin:=1;      DataMax:=2048;     DataZero:=30.3;
     SigmaDataZero:=1.5;           Zero:=1;

     Umin:=0;       Umax:=10;     UShift:=0;     UCoeff:=1;

     U0:=0;          Value0:=0;     ValueCoeff:=1;     Units:='V';

     for k:=1 to 2048 do PageData[k]:=k;
     end;

assign(Shot, 'shot.dat');
close(Shot);

end.