unit FT2D_Inp;

interface

uses
  LCARD_32,
  FT2D_Dat,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ComCtrls, StdCtrls;

type
  TForm3 = class(TForm)
    Timer1: TTimer;
    Shape2: TShape;
    SpeedButton2: TSpeedButton;
    Animate1: TAnimate;
    Edit1: TEdit;
    Edit2: TEdit;
    Bevel1: TBevel;
    Edit3: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

  Nkadr:dword;
  SMode,
  TtlMask,
  AdChannel,
  AdValue  : integer;

  Nch : integer;
  SRate : integer;

  RestartMode:integer;

  Const
   Ok1 : Boolean = False;
   Ok2 : Boolean = False;
   Ok3 : Boolean = False;

   // Список опрашиваемых каналов

  Channels1: array[0..15] of word =
   (0+512,1+512,2+512,3+512,4+512,5+512,6+512,7+512,
   8+512,9+512,10+512,11+512,12+512,13+512,14+512,15+512);

  Channels2: array[0..15] of word =
   (0+512,1+512,2+512,3+512,4+512,5+512,6+512,7+512,
   8+512,9+512,10+512,11+512,12+512,13+512,14+512,15+512);

  Channels3: array[0..15] of word =
   (0,1,2,3,4,5,6,7,
   8,9,10,11,12,13,14,15);

  // 512 - усиление


implementation

{$R *.DFM}


 procedure TForm3.FormActivate(Sender: TObject);
  // При Активизации формы начинаем съем данных

  begin
   Timer1.Enabled:=True;

   SMode:=3; {0-нет синхронизации, 3-по цифровому биту}
   TtlMask:=8;   {Бит 4 номер на разъеме 37}

      Nch:=16;
      Nkadr:=InpTime*1000 div InpRate;
      SRate:=1*InpRate; {1=1мкс}
      RestartMode:=0;

   SELECT_SLOT(0); // Выбрали  слот;

    SET_INTER_DELAY(19);  // (20=1мкс) было 38!!! 1.9 мкс
    SYNCHRO_MODE(SMode, TtlMask,0,0);
    SOFT_MEMORY_START(Nch*Nkadr,Channels1,NCh,SRate,0,0,RestartMode);

 //  SELECT_SLOT(1);

  //   SET_INTER_DELAY(19); // ??? 38(20=1мкс) 1.9 мкс
  //   SYNCHRO_MODE(SMode, TtlMask,0,0);
  //  SOFT_MEMORY_START(Nch*Nkadr,Channels2,NCh,SRate,0,0,RestartMode);


  // SELECT_SLOT(2); //

  //    SET_INTER_DELAY(19);  // (10=1мкс) 1.9 мкс
  //   SYNCHRO_MODE(SMode, TtlMask, AdChannel, AdValue);
  //    SOFT_MEMORY_START(Nch*Nkadr,Channels3,NCh,SRate,0,0,RestartMode);


   (*   SMode:=1; {по каналу АЦП}
   TtlMask:=1;   {превышение порога}
   AdChannel:= 15; {Номер канала 16}
   AdValue:= 200; {значение порога}
   SYNCHRO_MODE(SMode, TtlMask, AdChannel, AdValue);
*)


  end;

 procedure TForm3.Timer1Timer(Sender: TObject);
  // Проверяем окончание ввода данных
  begin

   SELECT_SLOT(0);
   If (TEST_FOR_INPUT_END=1) then Ok1:=True;

  // SELECT_SLOT(1);
  // If (TEST_FOR_INPUT_END=1) then Ok2:=True;

   //SELECT_SLOT(2);
   //If (TEST_FOR_INPUT_END=1) then Ok3:=True;


   If Ok1 then Edit1.Text:='Ввод завершен' Else Edit1.Text:='Ожидание ввода';
   //If Ok2 then Edit2.Text:='Ввод завершен' Else Edit2.Text:='Ожидание ввода';
   //If Ok3 then Edit3.Text:='Ввод завершен' Else Edit3.Text:='Ожидание ввода';

   If  (Ok1=True) then
    // if (Ok2=True) then
       //if (Ok3=True) then
      // отключен ввод с третьей платы
    Begin
     SELECT_SLOT(0);
     GET_INPUT_DATA(Slot0_Data,Nch*Nkadr);

   //  SELECT_SLOT(1);
   //  GET_INPUT_DATA(Slot1_Data,Nch*Nkadr);

     //SELECT_SLOT(2);
     //GET_INPUT_DATA(Slot2_Data,Nch*Nkadr);

     Form3.Close;

    End;

  end;

 procedure TForm3.SpeedButton2Click(Sender: TObject);
  // По нажатию Зарыть - закрытие формы
  begin
   Form3.Close;
  end;


 procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
  // по закрытии - отменить таймер и обнулить признаки ввода с плат
  begin
   Ok1:=False;
   Ok2:=False;
   Ok3:=False;
   Timer1.Enabled:=False;
  end;


end.
