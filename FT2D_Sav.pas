unit FT2D_Sav;

interface

uses
  FT2D_Dat,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, Outline, DirOutln, Calendar, checklst;

type
  TForm4 = class(TForm)
    SaveDialog1: TSaveDialog;
    Shape2: TShape;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Shape3: TShape;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    CheckListBox1: TCheckListBox;
    Edit3: TEdit;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.DFM}


 procedure TForm4.FormActivate(Sender: TObject);
  // ����������� ��� ����� �� ���������

  var
    ExtString: string;
    YY,MM,DD: String; {������ ��� �������������� ���� DDMMYY -> YYMMDD}
  begin

   // ��� ����� �� ��������� - 'A' + ������� ����
   FileName:=DateToStr(Date);
   Delete(FileName,3,1);
   Delete(FileName,5,1);
   DD:=Filename;
   Delete(DD,3,4);
   YY:=Filename;
   Delete(YY,1,4);
   MM:=FileName;
   Delete(MM,5,2);
   Delete(MM,1,2);
   FileName:='A'+YY+MM+DD;

   // ���������� �� �������� �������� ���������� �� ����.

   If ShotNumber1 < 10 then
    ExtString:='00'+IntToStr(ShotNumber1)
   Else
    If ShotNumber1 <100 then
     ExtString:='0'+IntToStr(ShotNumber1)
    Else
      ExtString:= IntToStr(ShotNumber1);


   FileName:= FileName +'.'+Extstring;

   Edit1.Text:= GetCurrentDir + '\' + FileName;

   SaveDialog1.FileName:=Edit1.Text;

   StringGrid1.Cells[0,0]:= '��������';
   StringGrid1.Cells[1,0]:= '�������';
   StringGrid1.Cells[2,0]:= '��������';


  end;

 procedure TForm4.SpeedButton1Click(Sender: TObject);
  begin
   If SaveDialog1.Execute then
    Edit1.Text:=SaveDialog1.FileName;
  end;




 procedure TForm4.SpeedButton3Click(Sender: TObject);
  // ������������� �������� �������� ������� �� ���� -
  // ��� �������� - ���������� �����.
  var
    ExtString: string;
    YY,MM,DD: String; {������ ��� �������������� ���� DDMMYY -> YYMMDD}

  begin
   ShotNumber1:=StrToInt(Trim(InputBox('���� �������� �������� ������','',IntToStr(ShotNumber1))));

   FileName:=DateToStr(Date);
   Delete(FileName,3,1);
   Delete(FileName,5,1);
   DD:=Filename;
   Delete(DD,3,4);
   YY:=Filename;
   Delete(YY,1,4);
   MM:=FileName;
   Delete(MM,5,2);
   Delete(MM,1,2);
   FileName:='A'+YY+MM+DD;


   If ShotNumber1 < 10 then
    ExtString:='00'+IntToStr(ShotNumber1)
   Else
    If ShotNumber1 <100 then
     ExtString:='0'+IntToStr(ShotNumber1)
    Else
      ExtString:= IntToStr(ShotNumber1);

   FileName:= FileName +'.'+Extstring;
   Edit1.Text:= GetCurrentDir + '\' + FileName;

   SaveDialog1.FileName:=Edit1.Text;

  end;

 procedure TForm4.SpeedButton2Click(Sender: TObject);
  var
    C1,C2,C3:Word;
    DataFile : File of ChannelFileBlockType;
    ChannelBlock :  ChannelFileBlockType;
  // ��������� ������ � ���� � ��������� ������
  begin
   If FileExists(Edit1.Text) then
     Begin
      ShowMessage(' ���� ��� ����������! ');
      Form4.ModalResult:= idCancel;
     End
    Else
      // ����� c��������� ������ �����!!!!
     Begin
       AssignFile(DataFile,ExtractFileName(Edit1.Text));
       Rewrite(DataFile);
       For C1:=1 to 48 do
        If ChannelsTable[C1] <> 0 then
         // ���� ������ ������ ������������� ��������� ����� ������
         With ChannelBlock do
         Begin
           ShotDate:=DateToStr(Date);
           ShotTime:=TimeToStr(Time);
           ShotNumber:=ShotNumber1;
           RegimeName:=Edit3.Text;
           {RegParameters}
           Commentstring:=Edit2.Text;
           {Parameters}
           {ExtDiagnostics}
           ChannelName:=ChannelsNames[C1];
           Rate:=InpRate;
           InTime:=InpTime;
           Shift:=InpShift;
           ChannelNumber:=C1;
           NumberInTable:=ChannelsTable[C1];
           BlockNumber:=0;
           ADCRange:=4096;
           Statistics:=False;
           Umin:= - (ADCRange div 2)*AmpKoeff[ChannelsTable[C1]];
           Umax:= (ADCRange div 2 - 1)*AmpKoeff[ChannelsTable[C1]]; ;
    {������ ������/����� ���}
           UCoeff:=AmpKoeff[ChannelsTable[C1]];
    {������� ��������� ������/������ ������}
           ValueCoeff:=ChannelsKoeff[C1];
    {������� ���������}
           Units:= UnitsTable[C1];

           For C2 := 1 to 2048 do
            Data[C2]:=ChannelsData[ChannelsTable[C1],C2];
           Write(DataFile,ChannelBlock);
         End;
       CloseFile(DataFile);
      ShotNumber1:=ShotNumber1+1; // ��������� ������� �������
      Form4.ModalResult:= idOk;
     End;
  end;


 procedure TForm4.CheckListBox1ClickCheck(Sender: TObject);
  // ��������� ���������� ������.
  var
   C1 : byte;
  const
   ParArray: array[0..15] of string =
   ('OH','RF','CRU','CD',
    'E','F','G','H',
    'I','J','K','L',
    'M','N','O','P');

  begin
   Edit3.Text:='';
   For C1 := 0 to 15 do
    If CheckListBox1.State[C1]=cbChecked then
     Edit3.Text:=Edit3.Text+' '+ParArray[C1];
  end;






end.
