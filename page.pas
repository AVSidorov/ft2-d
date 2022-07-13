program PageOfData;
{структура файла базы данных токамака ФТ-2}
{Shot ->   Sheet    ->     Channel         -> Page}
{Разряд -> Блок каналов -> Канал измерений -> страница}
Const
 RegimeType: array [1..8] of string [4] =
             ('OH', 'In', 'Out', 'CRU', 'LHCD', 'LHH', 'IR', ' ');
 RegimeParNames:  array [1..8] of string [8] =
             ('B_tor', 'I_pl', '<n_e>', 'P_rf', 'Tau_rf', '', '', '');
 RegimeParUnits:  array [1..8] of string [4] =
             ('kGs', 'kA', 'пол', 'kW', 'ms', '', '', ' ');

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
     {описание выстрела}
     ShotDate:          ByteArray3;           {дата выстрела}
     ShotTime:          ByteArray3;           {время выстрела}
     ShotNumber:        byte;                 {номер выстрела}
     Comment:           string79;             {комментарий}
     NumberOfSheets:    Byte;                 {Число листов}
     SheetNames:        String8Array16;       {список названий листов}
     RegimePar:         SingleArray16;        {параметры выстрела}
     RegimeName:        String16;             {тип выстрела}
     ExtDiagnostics:    BooleanArray32;       {'Внешние' диагностики}
     end;

 PageType = record
     {координаты страницы}
     SheetNumber:    byte;
     ChannelNumber:  byte;
     ChannelName:    string16;
     ChPosition:     single2;
     ChParameter:    single;
     ParUnit:        string4;
     PageNumber:     byte;
     NumberOfPages:  byte;
     Source:         string16;                 {источник данных}

     {синхронизация и тактирование страницы данных}
     Start:          double;    {microsec}
                     {время первого измерения на странице}
     ShiftedStart:   double;    {microsec}
                     {сдвиг первого измерения на странице, (=0)}
     Tic:            double;    {microsec}
                     {интервал измерений на странице}
     TicCoeff:       double;    {microsec}
                     {поправка интервала измерений на странице (=1)}

     {цифровые данные на странице}
     Range:              word;   {полный цифровой диапазон АЦП}
     DataMin,DataMax:    word;   {цифровой диапазон изменения сигнала на странице}
     DataZero:           single; {среднее по "нулевой линии" канала }
     SigmaDataZero:      single; {диcперсия среднего по "нулевой линии" канала}
     Zero:               byte;   {ключ Zero=0,1}

     {калибровка измерений}
     { U(V):=UShift+Umin+(Data-Zero*DataZero)*(Umax-Umin)*UCoeff/Range }
     Umin, Umax:     single;   {V}
                     {Сигналы, соответствующие 0 и Range отсчетам на странице}
     UShift:         single;   {V}
                     {сдвиг диапазона измерений на странице, (=0)}
     UCoeff:         single;
                     {поправка диапазона измерений на странице, (=1)}

     {вычисление измеряемой величины}
     { Value:= Value0+(U-U0)*ValueCoeff;}
     U0:             single;
     Value0:         single;   {значение измеряемой величины при U=U0}
     ValueCoeff:     single;   {dValue/dU}
     Units:          string4;  {единицы измерений величины}
     tau:            single;   {постоянная интегрирования}

     {данные}
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