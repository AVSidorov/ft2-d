unit FT2D_Set;

interface

uses
  FT2D_Dat, Buttons, ExtCtrls, Controls, StdCtrls, Forms, ComCtrls,
  Windows, Messages, SysUtils, Classes, Graphics, Dialogs,
  checklst, Spin, Grids;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    SpeedButton24: TSpeedButton;
    Shape13: TShape;
    Shape2: TShape;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    SpeedButton2: TSpeedButton;
    ComboBox33a: TComboBox;
    StaticText33: TStaticText;
    ComboBox34a: TComboBox;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    ComboBox35a: TComboBox;
    SpeedButton4: TSpeedButton;
    Shape4: TShape;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StaticText1: TStaticText;
    Edit1: TEdit;
    procedure ComboBoxXChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses FT2D;

{$R *.DFM}

 procedure TForm2.FormActivate(Sender: TObject);
 // Запись начальных параметров для редактирования
  var C1 : byte;
  begin

   ComboBox33a.Text := IntToStr(InpTime);
   ComboBox34a.Text := IntToStr(InpRate);
   Edit1.Text := IntToStr(InpShift);
   ComboBox35a.ItemIndex := ChannelDelay;


   // Прорисовываем таблицу каналов АЦП
   StringGrid1.Cells[0,0]:='Имя канала';
   StringGrid1.Cells[1,0]:='Изм. коэфф.';

   For C1:= 1 to 48 do
    StringGrid1.Cells[0,C1]:=IntToStr(C1)
    +' (Слот '+IntToStr((C1-1) div 16)
    +' Канал '+IntToStr((C1-1) mod 16 + 1)+')';

   For C1:= 1 to 48 do
    StringGrid1.Cells[1,C1]:=FloatToStrF(AmpKoeff[C1],ffGeneral,5,4)+' mV/Счет';


   // Прорисовываем таблицу Диагностических сигналов
   StringGrid2.Cells[1,0]:='Имя сигнала';
   StringGrid2.Cells[2,0]:='Коэфф.';
   StringGrid2.Cells[3,0]:='Единицы';
   StringGrid2.Cells[4,0]:='Источник (канал АЦП)';
   StringGrid2.Cells[5,0]:='Усреднение (мкс)';
   StringGrid2.Cells[6,0]:='Ноль канала';


   For C1:= 1 to 48 do
    StringGrid2.Cells[0,C1]:= IntToStr(C1);

   For C1:= 1 to 48 do
    StringGrid2.Cells[1,C1]:= ChannelsNames[C1];

   For C1:= 1 to 48 do
    StringGrid2.Cells[2,C1]:=FloatToStrF(ChannelsKoeff[C1],
    ffGeneral,7,5)+' '+
    UnitsTable[C1]+'/mV';

   For C1:= 1 to 48 do
    StringGrid2.Cells[3,C1]:=UnitsTable[C1];

   For C1:= 1 to 48 do
    If ChannelsTable[C1] = 0 then
      StringGrid2.Cells[4,C1]:=' Канал не присвоен '
    Else
     StringGrid2.Cells[4,C1]:=' '+IntToStr(ChannelsTable[C1])
     +' (Слот '+IntToStr((ChannelsTable[C1]-1) div 16)
     +' Канал '+IntToStr((ChannelsTable[C1]-1) mod 16 + 1)+')';

   For C1:= 1 to 48 do
    StringGrid2.Cells[5,C1]:=IntToStr(AveragingTime[C1]);


  end;

 procedure TForm2.StringGrid1DblClick(Sender: TObject);
  // При смене параметра в каналах Ацп
  Var Str1 : String;
  begin
  // ShowMessage('Row '+IntToStr(StringGrid1.Row)+' Col '
  // +IntToStr(StringGrid1.Col));
   With StringGrid1 Do
   Case Col of
    1: Begin
        Str1:=IntToStr(ChannelsTable[Row]);
         If InputQuery(' Введите значение ', ' mV/Счет АЦП', Str1)
          Then
           begin
            AmpKoeff[Row]:= StrToFloat(Str1);
            Cells[Col,Row]:=
             FloatToStrF(AmpKoeff[Row],ffGeneral,5,4)+' mV/Счет';
           end;
       End;
   End;
  end;

 procedure TForm2.StringGrid2DblClick(Sender: TObject);
  // При смене параметра в Диагностических Сигналах
  Var Str1 : String;
  begin
     With StringGrid2 do
      Case Col of
        // Редактируем соответствие каналов

       1: Begin
           Str1:=ChannelsNames[Row];
           If InputQuery(' Введите значение ', '', Str1)
           Then
            begin
             Cells[Col,Row]:=Str1;
             ChannelsNames[Row]:= Str1;
             LabelsTable[Row].Caption:=
              ChannelsNames[Row]+', '+UnitsTable[Row];
            end;
          End;


       2: Begin
           Str1:=FloatToStrF(ChannelsKoeff[Row],ffGeneral,7,5);
           If InputQuery(' Введите значение ', UnitsTable[Row]+'/mV', Str1)
           Then
            begin
             ChannelsKoeff[Row]:= StrToFloat(Str1);
             Cells[Col,Row]:=
              FloatToStrF(ChannelsKoeff[Row],ffGeneral,7,5)+UnitsTable[Row]+'/mV';
            end;
          End;

       3: Begin
           Str1:=UnitsTable[Row];
           If InputQuery(' Введите значение ', '', Str1)
           Then
            begin
             Cells[Col,Row]:=Str1;
             UnitsTable[Row]:= Str1;
             LabelsTable[Row].Caption:=
              ChannelsNames[Row]+', '+UnitsTable[Row];
            end;
          End;

       4: Begin
           Str1:=IntToStr(ChannelsTable[Row]);
           If InputQuery(' Введите номер канала ', ' 1-48 (0 - не присвоен)', Str1)
            Then If (StrToInt(Str1) < 49) and (StrToInt(Str1) > -1)
             then begin
                   ChannelsTable[Row]:=StrToInt(Str1);
                   If StrToInt(Str1) = 0 then Cells[Col,Row]:= ' Канал не присвоен '
                   Else  Cells[Col,Row]:=' '
                    + Str1
                    +' (Слот '+IntToStr((ChannelsTable[Row]-1) div 16)
                    +' Канал '+IntToStr((ChannelsTable[Row]-1) mod 16 + 1)+')';
                  end;
            end;
        5: Begin
              Str1:=IntToStr(AveragingTime[Row]);
              If InputQuery(' Введите значение ', '', Str1) then
                Begin
                     Cells[Col,Row]:=Str1;
                     AveragingTime[Row]:=StrToInt(Str1);
                end;
              
              
           end;
      
     end;
 

  end;



 procedure TForm2.StringGrid1KeyPress(Sender: TObject; var Key: Char);
  // Нажатие на ENTER равносильно даблклику
  begin
   If Key = #13 then StringGrid1DblClick(Sender);
  end;


 procedure TForm2.ComboBoxXChange(Sender: TObject);
   // Запись соответствия номера канала и номера входа
   begin

    InpTime  := StrToInt(Trim(ComboBox33a.Text));
    InpRate  := StrToInt(Trim(ComboBox34a.Text));
    InpShift := StrToInt(Trim(Edit1.Text));
    ChannelDelay := ComboBox35a.ItemIndex;

   end;

 procedure TForm2.SpeedButton1Click(Sender: TObject);
  // Отключение всех каналов
  var C : byte;
  begin
  end;

 procedure TForm2.SpeedButton4Click(Sender: TObject);
  // Установка параметров по умолчанию для времени
  begin
   InpTime:=60;
   InpRate:=35;
   InpShift:=0;
   ChannelDelay:=2;
   ComboBox33a.Text := IntToStr(InpTime);
   ComboBox34a.Text := IntToStr(InpRate);
   Edit1.Text := IntToStr(InpShift);
   ComboBox35a.ItemIndex := ChannelDelay;
  end;

 procedure TForm2.SpeedButton2Click(Sender: TObject);
  // Закрыть окно устоновок
  begin
   Form2.Close;
  end;


 procedure TForm2.SpeedButton24Click(Sender: TObject);
  // сохранение настроек в инифайл
  Var
  C1 :  word;
  begin

   IniFile.WriteInteger('Основные','Длительность измерения',
   InpTime);
   IniFile.WriteInteger('Основные','Интервал между точками',
   InpRate);
   IniFile.WriteInteger('Основные','Время запуска',
   InpShift);
   
   For C1 := 1 to 48 do
    IniFile.WriteString('Имена Диагностических Каналов',
    'Канал '+IntToStr(C1),ChannelsNames[C1]);
   For C1 := 1 to 48 do
    IniFile.WriteString('Единицы Измерений Каналов',
    'Канал '+IntToStr(C1),UnitsTable[C1]);
   For C1 := 1 to 48 do
    IniFile.WriteString('Коэффициенты Диагностических Каналов',
    'Канал '+IntToStr(C1),FloatToStrF(ChannelsKoeff[C1],
    ffGeneral,5,8));
   For C1 := 1 to 48 do
    IniFile.WriteString('Коэффициенты Каналов АЦП',
    'Канал '+IntToStr(C1),FloatToStrF(AmpKoeff[C1]/ADCKoeff[C1],
    ffGeneral,5,8));
   For C1 := 1 to 48 do
    IniFile.WriteString('Соответствие каналов',
    'Канал '+IntToStr(C1),IntToStr(ChannelsTable[C1]));

  end;



 procedure TForm2.StringGrid2KeyPress(Sender: TObject; var Key: Char);
 // Нажатие на ENTER равносильно даблклику
  begin
   If Key = #13 then StringGrid2DblClick(Sender);
  end;



end.
