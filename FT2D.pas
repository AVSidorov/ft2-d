unit FT2D;

interface

uses
  LCARD_32,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, Menus, TeEngine, Series, TeeProcs, Chart,
  StdCtrls, Mask,
  FT2D_Set,FT2D_Dat,IniFiles, Grids, TeeFunci, Spin;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Shape5: TShape;
    Shape6: TShape;
    Shape8: TShape;
    Bevel1: TBevel;
    ButtonStart: TSpeedButton;
    ButtonWrite: TSpeedButton;
    ButtonSettings: TSpeedButton;
    PageControl1: TPageControl;
    TabSheetSXR: TTabSheet;
    TabSheetDen: TTabSheet;
    TabSheetCX: TTabSheet;
    TabSheetMain: TTabSheet;
    TabSheetOpt: TTabSheet;
    ScrollBoxSXR: TScrollBox;
    ChartSXR3_4: TChart;
    ChartSXR1_2: TChart;
    ChartSXR5_6: TChart;
    ChartSXR7_8: TChart;
    ChartSXR9_10: TChart;
    ChartSXR11_12: TChart;
    ChartSXR13_14: TChart;
    Chart8: TChart;
    Chart9: TChart;
    Chart10: TChart;
    Chart11: TChart;
    Chart12: TChart;
    Chart13: TChart;
    ChartHXR: TChart;
    Chart15: TChart;
    Chart16: TChart;
    Chart17: TChart;
    Chart18: TChart;
    Chart19: TChart;
    Chart20: TChart;
    Chart21: TChart;
    Chart22: TChart;
    Chart25: TChart;
    SeriesSXR1: TLineSeries;
    SeriesSXR2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Series17: TLineSeries;
    Series18: TLineSeries;
    Series19: TLineSeries;
    Series20: TLineSeries;
    Series21: TLineSeries;
    Series22: TLineSeries;
    Series23: TLineSeries;
    Series24: TLineSeries;
    Series25: TLineSeries;
    Series26: TLineSeries;
    Series27: TLineSeries;
    Series28: TLineSeries;
    Series29: TLineSeries;
    Series30: TLineSeries;
    Series31: TLineSeries;
    Series32: TLineSeries;
    Series33: TLineSeries;
    Series34: TLineSeries;
    Series35: TLineSeries;
    Series36: TLineSeries;
    Series37: TLineSeries;
    Series38: TLineSeries;
    Series39: TLineSeries;
    Series40: TLineSeries;
    Series41: TLineSeries;
    Series42: TLineSeries;
    Series43: TLineSeries;
    Series44: TLineSeries;
    Series45: TLineSeries;
    Series46: TLineSeries;
    Series47: TLineSeries;
    PanelSXRButtons: TPanel;
    ButtonSXR1_4: TSpeedButton;
    ShapeSXR1_4: TShape;
    ShapeSXRAll: TShape;
    ButtonSXRAll: TSpeedButton;
    ButtonSXR5_8: TSpeedButton;
    ShapeSXR5_8: TShape;
    ButtonSXR7_10: TSpeedButton;
    ShapeSXR7_10: TShape;
    ButtonSXR11_14: TSpeedButton;
    ShapeSXR11_14: TShape;
    ScrollBoxMain: TScrollBox;
    SpeedButton17: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    PanelMainButtons: TPanel;
    ShapeAll: TShape;
    ButtonAll: TSpeedButton;
    SpeedButton18: TSpeedButton;
    ButtonHXR: TSpeedButton;
    ShapeHXR: TShape;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    Timer1: TTimer;
    TabSheetR1: TTabSheet;
    ScrollBoxR1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PanelDenZeros: TPanel;
    Shape18: TShape;
    SpeedButton40: TSpeedButton;
    StringGrid1: TStringGrid;
    SpeedButton2: TSpeedButton;
    Shape7: TShape;
    SpeedButton41: TSpeedButton;
    StaticText1: TStaticText;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Series48: TLineSeries;
    Series49: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    TeeFunction2: TAverageTeeFunction;
    Series50: TLineSeries;
    Series51: TLineSeries;
    TeeFunction3: TAverageTeeFunction;
    TeeFunction4: TAverageTeeFunction;
    Series52: TLineSeries;
    Series53: TLineSeries;
    TeeFunction5: TAverageTeeFunction;
    TeeFunction6: TAverageTeeFunction;
    Series54: TLineSeries;
    Series55: TLineSeries;
    TeeFunction7: TAverageTeeFunction;
    TeeFunction8: TAverageTeeFunction;
    Series56: TLineSeries;
    Series57: TLineSeries;
    TeeFunction9: TAverageTeeFunction;
    TeeFunction10: TAverageTeeFunction;
    Series58: TLineSeries;
    Series59: TLineSeries;
    TeeFunction11: TAverageTeeFunction;
    TeeFunction12: TAverageTeeFunction;
    Series60: TLineSeries;
    Series61: TLineSeries;
    TeeFunction13: TAverageTeeFunction;
    TeeFunction14: TAverageTeeFunction;
    SpinEdit1: TSpinEdit;
    StaticText3: TStaticText;
    SpeedButton10: TSpeedButton;
    Shape19: TShape;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Shape21: TShape;
    Bevel3: TBevel;
    Shape20: TShape;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    TabSheetR2: TTabSheet;
    TabSheetR3: TTabSheet;
    Chart23: TChart;
    Series62: TLineSeries;
    Label26: TLabel;
    Chart24: TChart;
    Label27: TLabel;
    Chart26: TChart;
    Label28: TLabel;
    Chart27: TChart;
    Label29: TLabel;
    Series63: TLineSeries;
    Series64: TLineSeries;
    Series65: TLineSeries;
    Chart28: TChart;
    Label30: TLabel;
    Chart29: TChart;
    Label31: TLabel;
    Chart30: TChart;
    Label32: TLabel;
    Chart31: TChart;
    Label33: TLabel;
    Series66: TLineSeries;
    Series67: TLineSeries;
    Series68: TLineSeries;
    Series69: TLineSeries;
    Series70: TLineSeries;
    TabSheetTemp: TTabSheet;
    EditK1: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    EditK2: TEdit;
    Label37: TLabel;
    ButtonTiZoom: TSpeedButton;
    Chart32: TChart;
    SpeedButton15: TSpeedButton;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Series71: TLineSeries;
    ButtonUloop: TSpeedButton;
    ButtonIp: TSpeedButton;
    ButtonBtor: TSpeedButton;
    ButtonUrUy: TSpeedButton;
    ButtonTSZond: TSpeedButton;
    ButtonDS: TSpeedButton;
    ShapeUrUy: TShape;
    ShapeBtor: TShape;
    ShapeIp: TShape;
    ShapeDS: TShape;
    ShapeUloop: TShape;
    ShapeTSZond: TShape;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    SpeedButton1: TSpeedButton;
    AutoStChkBox: TCheckBox;
    TimerAutoStart: TTimer;
    SpeedButton3: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure ButtonUloopClick(Sender: TObject);
    procedure ButtonIpClick(Sender: TObject);
    procedure ButtonBtorClick(Sender: TObject);
    procedure ButtonUrUyClick(Sender: TObject);
    procedure ButtonTSZondClick(Sender: TObject);
    procedure ButtonDSClick(Sender: TObject);
    procedure ButtonSXR1_4Click(Sender: TObject);
    procedure ButtonSXR5_8Click(Sender: TObject);
    procedure ButtonSXR7_10Click(Sender: TObject);
    procedure ButtonSXR11_14Click(Sender: TObject);
    procedure ButtonHXRClick(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ButtonAllClick(Sender: TObject);
    procedure ButtonSXRAllClick(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure ButtonSettingsClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonWriteClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TimerAutoStartTimer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MaxSeriesTable = 48;

var
  Form1: TForm1;
  SeriesTable: array[1..MaxSeriesTable] of TlineSeries;
  FunctionTable: array[1..MaxSeriesTable] of  TAverageTeeFunction;
  LabelsTable : Array[1..MaxSeriesTable] of TLabel;
  TFlag: integer = 0;


const
  K1 :Single = 1;
  K2 : Single = 1;
  K3 :Single = 1;
  K4 : Single = 1; // Калибровки плотности

implementation

uses FT2D_Inp, FT2D_Sav;

{$R *.DFM}

 procedure TForm1.FormCreate(Sender: TObject);
  //  при создании формы загружаем FT2D.ini
  var
   C1 : word;
  begin

   //  >>> считываются коэфф для формулы Льва Аркадьевича
  EditK1.Text:=FloatToStrF(k1_estim,ffGeneral,5,3);
  EditK2.Text:=FloatToStrF(k2_estim,ffGeneral,5,3);
    //  <<< считываются коэфф для формулы  Льва Аркадьевича

   IniFile:= TIniFile.Create( ExtractFilePath(Application.ExeName)
   +INIFileName);

   If FileExists(INIFileName) then
   Begin
    InpTime:=IniFile.ReadInteger('Основные','Длительность измерения',
    InpTime);
    InpRate:=IniFile.ReadInteger('Основные','Интервал между точками',
    InpRate);
    InpShift:=IniFile.ReadInteger('Основные','Время запуска',
    InpShift);
    For C1 := 1 to 48 do
     ChannelsNames[C1]:=IniFile.ReadString('Имена Диагностических Каналов',
     'Канал '+IntToStr(C1),ChannelsNames[C1]);
    For C1 := 1 to 48 do
     UnitsTable[C1]:=IniFile.ReadString('Единицы Измерений Каналов',
     'Канал '+IntToStr(C1),UnitsTable[C1]);
    For C1 := 1 to 48 do
     ChannelsKoeff[C1]:=StrToFloat(IniFile.ReadString(
     'Коэффициенты Диагностических Каналов','Канал '+IntToStr(C1),
     FloatToStr(ChannelsKoeff[C1])));
    For C1 := 1 to 48 do
     AmpKoeff[C1]:=ADCKoeff[C1]*StrToFloat(IniFile.ReadString(
     'Коэффициенты Каналов АЦП','Канал '+IntToStr(C1),
     FloatTostr(AmpKoeff[C1])));
    For C1 := 1 to 48 do
     ChannelsTable[C1]:=StrToInt(IniFile.ReadString(
     'Соответствие каналов','Канал '+IntToStr(C1),
     FloatToStr(ChannelsTable[C1])));

    For C1 := 1 to 48 do
     AveragingTime[C1]:=StrToInt(IniFile.ReadString(
     'Интервал усреднения','Канал '+IntToStr(C1),
     IntToStr(AveragingTime[C1])));

   End
  Else MessageDLG('Не найден INI-файл '+INIFileName+'. Параметры по умолчанию.',
  mtError,[mbOK],0);

  // Присвоим имена меткам-именам каналов
    LabelsTable[1]:= Label1;
    LabelsTable[2]:= Label2;
    LabelsTable[3]:=Label5;
    LabelsTable[4]:=Label6;
    LabelsTable[5]:=Label3;

    LabelsTable[6]:=Label4;
    LabelsTable[7]:=Label7;
    LabelsTable[8]:=Label8;
    LabelsTable[9]:=Label9;
   { LabelsTable[10]:=Label

    LabelsTable[11]:=Label
    LabelsTable[12]:=Label
    LabelsTable[13]:=Label
    LabelsTable[14]:=Label
    LabelsTable[15]:=Label

    LabelsTable[16]:=Label
    LabelsTable[17]:=Label
    LabelsTable[18]:=Label
    LabelsTable[19]:=Label
    LabelsTable[20]:=Label

    LabelsTable[21]:=Label
    LabelsTable[22]:=Label
    LabelsTable[23]:=Label
    LabelsTable[24]:=Label }
    LabelsTable[25]:=Label10;

    LabelsTable[26]:=Label11;
    LabelsTable[27]:=Label12;
    LabelsTable[28]:=Label13;
    LabelsTable[29]:=Label14;
    LabelsTable[30]:=Label20;

    LabelsTable[31]:=Label21;
    LabelsTable[32]:=Label15;
    LabelsTable[33]:=Label16;
    LabelsTable[34]:=Label17;
    LabelsTable[35]:=Label18;

    LabelsTable[36]:=Label19;
    LabelsTable[37]:=Label22;
    LabelsTable[38]:=Label23;
    LabelsTable[39]:=Label24;
    LabelsTable[40]:=Label25;

    LabelsTable[41]:=Label26;
    LabelsTable[42]:=Label27;
    LabelsTable[43]:=Label28;
    LabelsTable[44]:=Label29;
    LabelsTable[45]:=Label30;

    LabelsTable[46]:=Label31;
    LabelsTable[47]:=Label32;
    LabelsTable[48]:=Label33;


    For c1:= 1 to MaxSeriesTable do
     LabelsTable[C1].Caption:='('+IntToStr(C1)+') '+ChannelsNames[C1]+', '+UnitsTable[C1];

   //Создадим упорядоченную таблицу всех серий данных
   SeriesTable[1]:= Series15;
   SeriesTable[2]:= Series16;
   SeriesTable[3]:= Series17;
   SeriesTable[4]:= Series18;
   SeriesTable[5]:= Series19;

   SeriesTable[6]:= Series20;
   SeriesTable[7]:= Series21;
   SeriesTable[8]:= Series22;
   SeriesTable[9]:= Series23;
   SeriesTable[10]:= SeriesSXR1;

   SeriesTable[11]:= SeriesSXR2;
   SeriesTable[12]:= Series3;
   SeriesTable[13]:= Series4;
   SeriesTable[14]:= Series5;
   SeriesTable[15]:= Series6;

   SeriesTable[16]:= Series7;
   SeriesTable[17]:= Series8;
   SeriesTable[18]:= Series9;
   SeriesTable[19]:= Series10;
   SeriesTable[20]:= Series11;

   SeriesTable[21]:= Series12;
   SeriesTable[22]:= Series13;
   SeriesTable[23]:= Series14;
   SeriesTable[24]:= Series24;
   SeriesTable[25]:= Series25;

   SeriesTable[26]:= Series26;
   SeriesTable[27]:= Series27;
   SeriesTable[28]:= Series28;
   SeriesTable[29]:= Series29;
   SeriesTable[30]:= Series30;

   SeriesTable[31]:= Series31;
   SeriesTable[32]:= Series32;
   SeriesTable[33]:= Series33;
   SeriesTable[34]:= Series34;
   SeriesTable[35]:= Series35;

   SeriesTable[36]:= Series36;
   SeriesTable[37]:= Series37;
   SeriesTable[38]:= Series38;
   SeriesTable[39]:= Series39;
   SeriesTable[40]:= Series40;

   SeriesTable[41]:= Series62;
   SeriesTable[42]:= Series63;
   SeriesTable[43]:= Series64;
   SeriesTable[44]:= Series65;
   SeriesTable[45]:= Series66;

   SeriesTable[46]:= Series67;
   SeriesTable[47]:= Series68;
   SeriesTable[48]:= Series69;


   FunctionTable[10]:= TeeFunction1;
   FunctionTable[11]:= TeeFunction2;
   FunctionTable[12]:= TeeFunction3;
   FunctionTable[13]:= TeeFunction4;
   FunctionTable[14]:= TeeFunction5;

   FunctionTable[15]:= TeeFunction6;
   FunctionTable[16]:= TeeFunction7;
   FunctionTable[17]:= TeeFunction8;
   FunctionTable[18]:= TeeFunction9;
   FunctionTable[19]:= TeeFunction10;

   FunctionTable[20]:= TeeFunction11;
   FunctionTable[21]:= TeeFunction12;
   FunctionTable[22]:= TeeFunction13;
   FunctionTable[23]:= TeeFunction14;

  end;

 procedure TForm1.FormDestroy(Sender: TObject);
  begin
   IniFile.Destroy;
  end;

 procedure TForm1.FormActivate(Sender: TObject);
  // Проверка и инициализация плат
  var TimeString : String;
  begin


   SELECT_SLOT(0);
   SET_TIMER_SCALE(1); // Выбрали масштаб 1 = 100 нс
   SET_ADSP_SPEED(0);

   If PLATA_TEST =0 Then
    StatusBar1.Panels[0].Text:= ' Плата 0 обнаружена. '
   Else
    StatusBar1.Panels[0].Text:= ' Плата 0 НЕ обнаружена! ';

   SELECT_SLOT(1);
   SET_TIMER_SCALE(1); // Выбрали масштаб 1 = 100 нс
   SET_ADSP_SPEED(0);

   If PLATA_TEST =0 Then
    StatusBar1.Panels[1].Text:= ' Плата 1 обнаружена. '
   Else
    StatusBar1.Panels[1].Text:= ' Плата 1 НЕ обнаружена! ';

   //SELECT_SLOT(2);
   //SET_TIMER_SCALE(1); // Выбрали масштаб 1 = 100 нс
   //SET_ADSP_SPEED(0);

    StatusBar1.Panels[2].Text:= ' Плата 2 НЕ ПОДКЛЮЧЕНА! ';
   //If PLATA_TEST =0 Then
   // StatusBar1.Panels[2].Text:= ' Плата 2 обнаружена. '
   //Else
   // StatusBar1.Panels[2].Text:= ' Плата 2 НЕ обнаружена! ';

   TimeString:=(TimeToStr(Time));
   Delete(TimeString,6,3);
   StatusBar1.Panels[4].Text:=TimeString;


  end;



 procedure TForm1.ButtonSettingsClick(Sender: TObject);
  // Открыть окно установок - Form2
  begin
   Form2.ShowModal;
  end;

 procedure TForm1.ButtonStartClick(Sender: TObject);
 // По нажатию кнопки запуск - открытие FORM3 из FT2D_Inp
  var c1,c2:integer;
      I1:SmallInt;
      AverageSumm: Single;
  begin
   TimerAutoStart.Enabled:=false;
   Form3.ShowModal;

   // По закрытию Form3 - перерисовываем графики

   StatusBar1.Panels[2].Text:=' Разряд '+IntToStr(ShotNumber1);
   StatusBar1.Panels[3].Text:='';


   For C1:=1 to 16 do
    begin
    For C2:=1 to InpTime*1000 div InpRate do
     Begin
      I1:=Slot0_Data[(C2-1)*16+(C1-1)];
      If I1 > 32767 then I1:=-(65536 - I1);
      ChannelsData[C1,C2]:=I1;

      I1:=Slot1_Data[(C2-1)*16+(C1-1)];
      If I1 > 32767 then I1:=-(65536 - I1);
      ChannelsData[C1+16,C2]:= I1;

      //I1:=Slot2_Data[(C2-1)*16+(C1-1)];
      //If I1 > 32767 then I1:=-(65536 - I1);
      //ChannelsData[C1+32,C2]:= I1;

     End;
    end;

   // Перерисовка трейсов
   If Series15.Count >0 then
   Begin
    Series41.Clear;
    For C1:=0 to Series15.Count-1 do
     Begin
       Series41.AddXY(Series15.XValues[C1],Series15.YValues[C1],
       '',clTeeColor);
     End;
   End;

   If Series16.Count >0 then
   Begin
    Series42.Clear;
    For C1:=0 to Series16.Count-1 do
     Begin
       Series42.AddXY(Series16.XValues[C1],Series16.YValues[C1],
       '',clTeeColor);
     End;
   End;

   If Series19.Count >0 then
   Begin
    Series43.Clear;
    For C1:=0 to Series19.Count-1 do
     Begin
       Series43.AddXY(Series19.XValues[C1],Series19.YValues[C1],
       '',clTeeColor);
     End;
   End;

   If Series20.Count >0 then
   Begin
    Series44.Clear;
    For C1:=0 to Series20.Count-1 do
     Begin
       Series44.AddXY(Series20.XValues[C1],Series20.YValues[C1],
       '',clTeeColor);
     End;
   End;

   If Series18.Count >0 then
   Begin
    Series45.Clear;
    For C1:=0 to Series18.Count-1 do
     Begin
       Series45.AddXY(Series18.XValues[C1],Series18.YValues[C1],
       '',clTeeColor);
     End;
   End;

   If Series21.Count >0 then
   Begin
    Series46.Clear;
    For C1:=0 to Series21.Count-1 do
     Begin
       Series46.AddXY(Series21.XValues[C1],Series21.YValues[C1],
       '',clTeeColor);
     End;
   End;

   If Series23.Count >0 then
   Begin
    Series47.Clear;
    For C1:=0 to Series23.Count-1 do
     Begin
       Series47.AddXY(Series23.XValues[C1],Series23.YValues[C1],
       '',clTeeColor);
     End;
   End;
// тень на Btor >>>
   If Series17.Count >0 then
   Begin
    Series70.Clear;
    For C1:=0 to Series17.Count-1 do
     Begin
       Series70.AddXY(Series17.XValues[C1],Series17.YValues[C1],
       '',clTeeColor);
     End;
   End;
// тень на Btor <<<



   For C1:=1 to MaxSeriesTable do
    SeriesTable[C1].Clear;



   For C1:=1 to (InpTime*1000 div InpRate) do
   Begin
    // Собственно перерисовка
    For C2 := 1 to MaxSeriesTable do
    If ChannelsTable[C2] >0 then SeriesTable[C2].AddXY(InpShift/1000+C1*InpRate/1000,
     ChannelsData[ChannelsTable[C2],C1]*ChannelsKoeff[C2]
     *AmpKoeff[ChannelsTable[C2]],
     '',ClTeeColor);


   End;
   if Tflag=1 then
   Series71.Clear;
   For C1:=1 to (InpTime*1000 div InpRate)  do
     Begin
         if (ChannelsData[ChannelsTable[33],C1]<>0)
             and (ChannelsData[ChannelsTable[35],C1]<>0)
             and (C1>=700) and (C1<1500)  // чтобы отойти от нуля и от хвоста
           then
                  Series71.AddXY(InpShift/1000+C1*InpRate/1000,
                  (k1_estim/Ln(k2_estim*ChannelsData[ChannelsTable[33],C1]{*ChannelsKoeff[33]}
                    *AmpKoeff[ChannelsTable[33]]/                           
                     ChannelsData[ChannelsTable[35],C1]{*ChannelsKoeff[35]}
                     *AmpKoeff[ChannelsTable[35]])),
                  '',clTeeColor);
     End;
                             
 //    добавленно   по Льву Аркадьевичу


//  Перерисовка усредненных значений

   For C1 := 10 to 23 do
    Begin
     FunctionTable[C1].Period:=AveragingTime[C1];
     FunctionTable[C1].ReCalculate;
    End;
   if AutoStChkBox.Checked then
     TimerAutoStart.Enabled:=true;
  end;


 procedure TForm1.ButtonWriteClick(Sender: TObject);
  // Открываем окно записи на диск из Form4 FT2D_Sav
  begin
    If Form4.ShowModal = idOk then
     StatusBar1.Panels[3].Text:=' Записан в файл '+  FileName;
  end;

 procedure TForm1.Timer1Timer(Sender: TObject);
  // Событие по таймеру.
  Var TimeString: String;
  Var OldTime: TDateTime;
  begin
   If Time <> OldTime then
    begin
     TimeString:=(TimeToStr(Time));
     Delete(TimeString,6,3);
     StatusBar1.Panels[4].Text:=TimeString;
    end;
   OldTime:=Time;
  end;


// ----------- Служебные процедуры -----------

 procedure TForm1.ButtonSXR1_4Click(Sender: TObject);
  begin
   ScrollBoxSXR.VertScrollBar.Position:=0;
  end;

 procedure TForm1.ButtonSXR5_8Click(Sender: TObject);
  begin
   ScrollBoxSXR.VertScrollBar.Position:=500;
  end;

 procedure TForm1.ButtonSXR7_10Click(Sender: TObject);
  begin
     ScrollBoxSXR.VertScrollBar.Position:=750;
  end;

 procedure TForm1.ButtonSXR11_14Click(Sender: TObject);
  begin
   ScrollBoxSXR.VertScrollBar.Position:=1250;
  end;

 procedure TForm1.ButtonHXRClick(Sender: TObject);
  begin
   ScrollBoxSXR.VertScrollBar.Position:=1750;
  end;

 procedure TForm1.ButtonUloopClick(Sender: TObject);
  begin
   ScrollBoxMain.VertScrollBar.Position:=0;
  end;

 procedure TForm1.ButtonIpClick(Sender: TObject);
  begin
   ScrollBoxMain.VertScrollBar.Position:=218;
  end;

 procedure TForm1.ButtonBtorClick(Sender: TObject);
  begin
    ScrollBoxMain.VertScrollBar.Position:=750;
  end;

 procedure TForm1.ButtonUrUyClick(Sender: TObject);
  begin
   ScrollBoxMain.VertScrollBar.Position:=436;
  end;

 procedure TForm1.ButtonTSZondClick(Sender: TObject);
  begin
   ScrollBoxMain.VertScrollBar.Position:=1000;
  end;

 procedure TForm1.ButtonDSClick(Sender: TObject);
  begin
   ScrollBoxMain.VertScrollBar.Position:=1250;
  end;


 procedure TForm1.SpeedButton19Click(Sender: TObject);
  begin
   Chart10.UndoZoom;
  end;



 procedure TForm1.SpeedButton18Click(Sender: TObject);
  begin
   Chart9.UndoZoom;
  end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
begin
 Chart11.UndoZoom;
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
begin
 Chart12.UndoZoom;
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
 Chart8.UndoZoom;
end;

procedure TForm1.SpeedButton22Click(Sender: TObject);
begin
 Chart13.UndoZoom;
end;

procedure TForm1.ButtonAllClick(Sender: TObject);
begin
 Chart8.UndoZoom;
 Chart9.UndoZoom;
 Chart10.UndoZoom;
 Chart11.UndoZoom;
 Chart12.UndoZoom;
 Chart13.UndoZoom;
end;

procedure TForm1.ButtonSXRAllClick(Sender: TObject);
begin
 ChartSXR1_2.UndoZoom;
 ChartSXR3_4.UndoZoom;
 ChartSXR5_6.UndoZoom;
 ChartSXR7_8.UndoZoom;
 ChartSXR9_10.UndoZoom;
 ChartSXR11_12.UndoZoom;
 ChartSXR13_14.UndoZoom;
 ChartHXR.UndoZoom;
end;

procedure TForm1.SpeedButton32Click(Sender: TObject);
begin
 Chart15.UndoZoom;
end;

procedure TForm1.SpeedButton35Click(Sender: TObject);
begin
 Chart18.UndoZoom;
end;

procedure TForm1.SpeedButton34Click(Sender: TObject);
begin
 Chart17.UndoZoom;
end;

procedure TForm1.SpeedButton33Click(Sender: TObject);
begin
 Chart16.UndoZoom;
end;

procedure TForm1.SpeedButton36Click(Sender: TObject);
begin
 Chart19.UndoZoom;
end;


//---------------------




// ------------------ Работа с плотностью ----------

 procedure TForm1.SpeedButton2Click(Sender: TObject);
  // Открыть панель управления графиками плотности
  begin
   If  PanelDenZeros.Visible = False then
    Begin
     StringGrid1.Cells[0,0]:=' Имя канала ';
     StringGrid1.Cells[1,0]:='От (млс)';
     StringGrid1.Cells[2,0]:='До (млс)';
     StringGrid1.Cells[0,1]:= ChannelsNames[25];

     If StringGrid1.Cells[1,1] = '' then
        StringGrid1.Cells[1,1]:= '0';

     If StringGrid1.Cells[2,1] = '' then
        StringGrid1.Cells[2,1]:= '1';

     StaticText2.Caption:= ' '+ChannelsNames[25]+' : '
      +FloatTostrF(ChannelsKoeff[25],ffGeneral,6,4)+' : '
      +UnitsTable[25]+'/V';
     StaticText4.Caption:= ' '+ChannelsNames[26]+' : '
      +FloatTostrF(ChannelsKoeff[26],ffGeneral,6,4)+' : '
      +UnitsTable[26]+'/V';

     StaticText6.Caption:= ' '+ChannelsNames[27]+' : '
      +FloatTostrF(ChannelsKoeff[27],ffGeneral,6,4)+' : '
      +UnitsTable[27]+'/V';
     StaticText7.Caption:= ' '+ChannelsNames[28]+' : '
      +FloatTostrF(ChannelsKoeff[28],ffGeneral,6,4)+' : '
      +UnitsTable[28]+'/V';

     PanelDenZeros.Visible:=True;
    End
   Else PanelDenZeros.Visible:=False;
  end;

 procedure TForm1.SpeedButton40Click(Sender: TObject);
  // применить изменения
  var B1,B2,B3,B4,E1,E2,E3,E4, // начальные и конечные точки для нуля
      C1 : Integer;
      Zero1,Zero2,Zero3,Zero4 : Single; // Нули каналов

  begin

   If Series25.Count <> 0 then
   Begin
    B1:= Round(StrToFloat(StringGrid1.Cells[1,1])*1000/InpRate) ;
    E1:= Round(StrToFloat(StringGrid1.Cells[2,1])*1000/InpRate) ;
    Zero1:=0;
    For C1:= B1 to E1 do
      Zero1:=Zero1+Series25.YValue[C1];
    Zero1:= Zero1 / (E1-B1+1);
    For C1:= 0 to Series25.Count - 1 do
     Series25.YValue[C1]:=Series25.YValue[C1]-Zero1;

    StaticText1.Color:=  $0020E138;
    StaticText1.Caption:=' Ноль каналов установлен ';
   End;

   If Series26.Count > 0 then
   Begin
    B2:= Round(StrToFloat(StringGrid1.Cells[1,1])*1000/InpRate) ;
    E2:= Round(StrToFloat(StringGrid1.Cells[2,1])*1000/InpRate) ;
    Zero2:=0;
    For C1:= B2 to E2 do
      Zero2:=Zero2+Series26.YValue[C1];
    Zero2:= Zero2 / (E2-B2+1);
    For C1:= 0 to Series26.Count - 1 do
     Series26.YValue[C1]:=Series26.YValue[C1]-Zero2;

    StaticText1.Color:=  $0020E138;
    StaticText1.Caption:=' Ноль каналов установлен ';
   End;

   If Series27.Count > 0 then
   Begin
    B3:= Round(StrToFloat(StringGrid1.Cells[1,1])*1000/InpRate) ;
    E3:= Round(StrToFloat(StringGrid1.Cells[2,1])*1000/InpRate) ;
    Zero3:=0;
    For C1:= B3 to E3 do
      Zero3:=Zero3+Series27.YValue[C1];
    Zero3:= Zero3 / (E3-B3+1);
    For C1:= 0 to Series27.Count - 1 do
     Series27.YValue[C1]:=Series27.YValue[C1]-Zero3;

    StaticText1.Color:=  $0020E138;
    StaticText1.Caption:=' Ноль каналов установлен ';
   End;

   If Series28.Count > 0 then
   Begin
    B4:= Round(StrToFloat(StringGrid1.Cells[1,1])*1000/InpRate) ;
    E4:= Round(StrToFloat(StringGrid1.Cells[2,1])*1000/InpRate) ;
    Zero4:=0;
    For C1:= B4 to E4 do
      Zero4:=Zero4+Series28.YValue[C1];
    Zero4:= Zero4 / (E4-B4+1);
    For C1:= 0 to Series28.Count - 1 do
     Series28.YValue[C1]:=Series28.YValue[C1]-Zero4;

    StaticText1.Color:=  $0020E138;
    StaticText1.Caption:=' Ноль каналов установлен ';
   End;

  end;



 procedure TForm1.SpeedButton41Click(Sender: TObject);
  // отменить ноль
  var C1 : integer;
  begin
   Series25.Clear;
   Series26.Clear;
   Series27.Clear;
   Series28.Clear;

   If ChannelsTable[25] >0 then
   For C1:=1 to (InpTime*1000 div InpRate) do
     Series25.AddXY(InpShift/1000+C1*InpRate/1000,
     ChannelsData[ChannelsTable[25],C1]*ChannelsKoeff[25]
     *AmpKoeff[ChannelsTable[25]],
    '',ClTeeColor);

   If ChannelsTable[26] >0 then
   For C1:=1 to (InpTime*1000 div InpRate) do
     Series26.AddXY(InpShift/1000+C1*InpRate/1000,
     ChannelsData[ChannelsTable[26],C1]*ChannelsKoeff[26]
     *AmpKoeff[ChannelsTable[26]],
     '',ClTeeColor);

   If ChannelsTable[27] >0 then
   For C1:=1 to (InpTime*1000 div InpRate) do
     Series27.AddXY(InpShift/1000+C1*InpRate/1000,
     ChannelsData[ChannelsTable[27],C1]*ChannelsKoeff[27]
     *AmpKoeff[ChannelsTable[27]],
    '',ClTeeColor);

   If ChannelsTable[28] >0 then
   For C1:=1 to (InpTime*1000 div InpRate) do
     Series28.AddXY(InpShift/1000+C1*InpRate/1000,
     ChannelsData[ChannelsTable[28],C1]*ChannelsKoeff[28]
     *AmpKoeff[ChannelsTable[28]],
     '',ClTeeColor);


   StaticText1.Caption:=' Ноль каналов не установлен ';
   StaticText1.Color:= clRed;
  end;

 procedure TForm1.SpeedButton12Click(Sender: TObject);
  // Расчет калибровок плотности
  begin
   K1:=(SeriesTable[25].MaxYValue-SeriesTable[25].MinYValue) / SpinEdit1.Value;
   K2:=(SeriesTable[26].MaxYValue-SeriesTable[26].MinYValue) / SpinEdit1.Value;
   K3:=(SeriesTable[27].MaxYValue-SeriesTable[27].MinYValue) / SpinEdit1.Value;
   K4:=(SeriesTable[28].MaxYValue-SeriesTable[28].MinYValue) / SpinEdit1.Value;

   StaticText2.Caption:= ' '+ChannelsNames[25]+' : '
      +FloatTostrF(ChannelsKoeff[25]/K1,ffGeneral,6,4)+' : '
      +UnitsTable[25]+'/V';
   StaticText4.Caption:= ' '+ChannelsNames[26]+' : '
      +FloatTostrF(ChannelsKoeff[26]/K2,ffGeneral,6,4)+' : '
      +UnitsTable[26]+'/V';
   StaticText6.Caption:= ' '+ChannelsNames[27]+' : '
      +FloatTostrF(ChannelsKoeff[27]/K1,ffGeneral,6,4)+' : '
      +UnitsTable[27]+'/V';
   StaticText7.Caption:= ' '+ChannelsNames[28]+' : '
      +FloatTostrF(ChannelsKoeff[28]/K2,ffGeneral,6,4)+' : '
      +UnitsTable[28]+'/V';

  end;

 procedure TForm1.SpeedButton10Click(Sender: TObject);
 // отмена калибровок
  begin
   StaticText2.Caption:= ' '+ChannelsNames[25]+' : '
      +FloatTostrF(ChannelsKoeff[25],ffGeneral,6,4)+' : '
      +UnitsTable[25]+'/V';
   StaticText4.Caption:= ' '+ChannelsNames[26]+' : '
      +FloatTostrF(ChannelsKoeff[26],ffGeneral,6,4)+' : '
      +UnitsTable[26]+'/V';
   StaticText6.Caption:= ' '+ChannelsNames[27]+' : '
      +FloatTostrF(ChannelsKoeff[27],ffGeneral,6,4)+' : '
      +UnitsTable[27]+'/V';
   StaticText7.Caption:= ' '+ChannelsNames[28]+' : '
      +FloatTostrF(ChannelsKoeff[28],ffGeneral,6,4)+' : '
      +UnitsTable[28]+'/V';
  end;

 procedure TForm1.SpeedButton11Click(Sender: TObject);
 // Запись калибровок в файл.
  begin
   ChannelsKoeff[25]:=ChannelsKoeff[25]/K1;
   ChannelsKoeff[26]:=ChannelsKoeff[26]/K2;
   ChannelsKoeff[27]:=ChannelsKoeff[27]/K3;
   ChannelsKoeff[28]:=ChannelsKoeff[28]/K4;
   IniFile.WriteString('Коэффициенты Диагностических Каналов',
    'Канал '+IntToStr(25),FloatToStrF(ChannelsKoeff[25],
    ffFixed,8,5));
   IniFile.WriteString('Коэффициенты Диагностических Каналов',
    'Канал '+IntToStr(26),FloatToStrF(ChannelsKoeff[26],
    ffFixed,8,5));
   IniFile.WriteString('Коэффициенты Диагностических Каналов',
    'Канал '+IntToStr(27),FloatToStrF(ChannelsKoeff[27],
    ffFixed,8,5));
   IniFile.WriteString('Коэффициенты Диагностических Каналов',
    'Канал '+IntToStr(28),FloatToStrF(ChannelsKoeff[28],
    ffFixed,8,5));

  end;





 procedure TForm1.SpeedButton13Click(Sender: TObject);
  // Убрать лишние полосы.
  var
   Delta : Single;
   A1,A2 : Word;
   N1,N2  : Integer;
   Strape : Single;

  begin
   Strape :=0.5;

   For A2 := 25 to 26 do
   BEGIN
    N1 := 0;

    If SeriesTable[A2].Count > 0 then
     For A1 := 0 to SeriesTable[A2].Count - 2 do
      BegiN

       If N1 <> 0  then SeriesTable[A2].YValue[A1+1] :=
       SeriesTable[A2].YValue[A1+1] + (N1 * Strape);

       if Abs(SeriesTable[A2].YValue[A1]-SeriesTable[A2].YValue[A1+1])
              >= Strape then
        begin

         N2 :=  Trunc((SeriesTable[A2].YValue[A1]-
                     SeriesTable[A2].YValue[A1+1])/Strape);

         If N2 <> 0  then SeriesTable[A2].YValue[A1+1] :=
            SeriesTable[A2].YValue[A1+1] + (N2 * Strape);

         N1:=N1+N2;
        end;

      EnD;

   END;
    Chart15.UndoZoom;
  end;



procedure TForm1.Edit3Change(Sender: TObject);
begin
  k1_estim:= StrToFloat(EditK1.Text);
  EditK1.Text:=FloatToStrF(k1_estim,ffGeneral,5,3);
end;
procedure TForm1.Edit4Change(Sender: TObject);
begin
  k2_estim:= StrToFloat(EditK2.Text);
  EditK2.Text:=FloatToStrF(k2_estim,ffGeneral,5,3);
end;





procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 TFlag:=0;
 SpeedButton1.Visible:=false;
 SpeedButton3.Visible:=true;;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 TFlag:=1;
 SpeedButton3.Visible:=false;
 SpeedButton1.Visible:=true;;
end;


procedure TForm1.TimerAutoStartTimer(Sender: TObject);
begin
 ButtonStart.Click;
end;



End.
