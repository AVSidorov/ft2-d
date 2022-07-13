unit FT2D_Dat;

interface

uses
 inifiles;

Type

 ChannelsTableType = array[1..48] of Byte;

 SlotDataType = Array [0..32767] of Word;

 //  ��� - ������ ������ �� ���� �� �������
 ChannelsDataType = array[1..48,1..2048] of SmallInt;

 // ������ ���������� ������
 RegimeParType = record
  Name : String[8];
  Units : String[4];
  Value : Single;
 end;

 DiagType = record
  Name : String[8];
  Enabled : Boolean;
 end;

 // ������ �� ������ ������ ��� ������ � ����
 ChannelFileBlockType = record

  ShotDate:String[8]; //  ���� ��������
  ShotTime:String[8]; //  ����� ��������
  ShotNumber:SmallInt; // ����� ��������
  RegimeName: String[32]; // ��� ������
  RegimeParameters : Array[1..16] of RegimeParType; // ��������� ������
  CommentString: String[80]; // ������ ������������
  Parameters: array[1..16] of Single; // ����������������� ���������
  Diagnostics: array[1..32] of DiagType; // �����������


  ChannelName : String[32]; // ��� ������

  Rate : Word; // ������ ��������� �� ������ ������, ���
  InTime : Word; // ���������� ������� ���������, ��
  Shift : Single; // ����� ������� ���������, ���

  ChannelNumber:byte; // ����� ������ � ���������
  NumberInTable:byte; // ����� ����� �� ������ ��������������� ������

  BlockNumber: byte; // ����� ����� ������ ���� ����� ������� ��
              // ����� �� 2048 �����   =0 ���� ��� ������ �������

  ADCRange : Word; // �������� ������ ���

  Statistics : Boolean; //  ������������� ��������� ����. ��������� ������
   DataMin:SmallInt; // ����������� ��������
   DataMax:SmallInt; // ������������ ��������
   DataZero:Single; //  ������� ���� ������
   SigmaDataZero:Single; // ��� ���������

  {���������� ���������}
  { U(V):=UShift+Umin+(Data-Zero*DataZero)*(Umax-Umin)*UCoeff/Range }
  Umin:     Single;   {mV}
  Umax:     Single;   {mV}
                   {�������, ��������������� 0 � Range �������� �� ��������}
  UShift:   Single;   {mV}
                   {����� ��������� ��������� �� �������� (=0)}
  UCoeff:   Single;
                   {������ ������/����� ���}

  {���������� ���������� ��������}
  { Value:= Value0+(U-U0)*ValueCoeff;}
  U0:             single;
  Value0:         single;   {�������� ���������� �������� ��� U=U0}
  ValueCoeff:     single;   {dValue/dU}
  Units:          string[4];  {������� ��������� ��������}
  tau:            single;   {���������� ��������������}

  Data : Array[1..2048] of SmallInt; // ���������� ������

 end;


 var
 Slot0_Data:SlotDataType; // ������ �������� �����
 Slot1_Data:SlotDataType; // ������ ������� �����
 Slot2_Data:SlotDataType; //array[0..131071] of Word; // ������ ������� �����

 ChannelsData:ChannelsDataType; // ������� ������ ������

 IniFile : TIniFile;


Const

 ADCKoeff : Array [1..48] of Single =
 (2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,
 0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5);

 // ����������� �������� ������� ���

 ChannelDelay : Word =2 ; // ������������ �������� 0-����� mks
                    // ���������!!!!!!!! 0=1.8 1=1.9 2=2.0 ���
 InpRate:Word = 35 ;  // ������� ��������� ����� mks
 InpTime:Word = 60; // ���������� ��������� ms
 InpShift:Word = 0; // ���������� ��������� mks

 INIFilename : String = 'FT2D.INI';

 ShotNumber1 : SmallInt = 0; // ����� ��������

 FileName: String = ''; // ��� ����� ����������� ������

 (*Var {����������� �� FT2D.ini}
 // ����� ��������������� �������
 ChannelsNames : Array[1..48] of String[32];

 // ������������ ��������������� �������  **** ������/V ****
 ChannelsKoeff: array[1..48] of Single;
 DefaultChannelsKoeff: array[1..48] of Single;

 // ������������ ������� ���      **** V/���� *****
 AmpKoeff: array[1..48] of Single;

 //  ������������: ����� ����������� = ����� ���
 DefaultChannelsTable : ChannelsTableType;
 ChannelsTable : ChannelsTableType; *)


// ����� ��������������� �������
 ChannelsNames : Array[1..48] of String[32] =
  ('Up',
  'Ip',
  'Btor',
  'HXR',
  'Ur',

  'Uy',
  'Zond',
  'TS',
  'DS',
  'SXR1',

  'SXR2',
  'SXR3',
  'SXR4',
  'SXR5',
  'SXR6',

  'SXR7',
  'SXR8',
  'SXR9',
  'SXR10',
  'SXR11',

  'SXR12',
  'SXR13',
  'SXR14',
  'HXR',
  '���������_1',

  '���������_2',
  '���������_3',
  '���������_4',
  '���������_5',
  '������_1',

  '������_2',
  'CX_01',
  'CX_02',
  'CX_03',
  'CX_04',

  'CX_05',
  '������_1',
  '������_2',
  '������_3',
  '������_4',

  '',
  '',
  '',
  '',
  '',

  '',
  '',
  '');

  UnitsTable : Array[1..48] of String[4] =
 ('V',
  'kA',
  'kGs',
  'mV',
  'mV',

  'mV',
  'mV',
  'mV',
  'J',
  'V',

  'mV',
  'mV',
  'mV',
  'mV',
  'mV',

  'mV',
  'mV',
  'mV',
  'mV',
  'mV',

  'mV',
  'mV',
  'mV',
  'mV',
  'mV',

  'mV',
  'mV',
  'mV',
  'mV',
  'mV',

  'mV',
  'mV',
  'mV',
  'mV',
  'mV',

  'mV',
  'mV',
  'mV',
  'mV',
  'mV',

  '',
  '',
  '',
  '',
  '',

  '',
  '',
  '');

 // ������������ ��������������� �������
 ChannelsKoeff: array[1..48] of Single =
 (25,-2.5,-2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5);

 DefaultChannelsKoeff: array[1..48] of Single =
 (25,-2.5,-2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5);

 // ������������ �������� � ������ ��������
 AmpKoeff: array[1..48] of Single =
 (1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1);

 //  ������������: ����� ����������� = ����� ���
 DefaultChannelsTable : ChannelsTableType =
 (1, // 1  - Series15 - ���������� ������
 2,  // 2  - Series16 - ��� ������
 3,  // 3  - Series17 - B ������������
 0,  // 4  - Series18 - HXR
 5,  // 5  - Series19 - Ur
 6,  // 6  - Series20 - Uy
 0,  // 7  - Series21 - ��������� ����
 0,  // 8  - Series22 - TS
 9,  // 9  - Series23 - ������������ ������
 0, // 10 - Series1  - SXR1
 0, // 11 - Series2  - SXR2
 0, // 12 - Series3  - SXR3
 0, // 13 - Series4  - SXR4
 0, // 14 - Series5  - SXR5
 0, // 15 - Series6  - SXR6
 0, // 16 - Series7  - SXR7
 0, // 17 - Series8  - SXR8
 0, // 18 - Series9  - SXR9
 0, // 19 - Series10 - SXR10
 0, // 20 - Series11 - SXR11
 0, // 21 - Series12 - SXR12
 0, // 22 - Series13 - SXR13
 0, // 23 - Series14 - SXR14
 0, // 24 - Series24 - HXR
  0, // 25 - Series25 - ��������� 1
  0, // 26 - Series26 - ��������� 2
  0, // 27 - Series27 - ��������� 3
  0, // 28 - Series28 - ��������� 4
  0, // 29 - Series29 - ��������� 5
  0, // 30 - Series30 - ������ 1
  0, // 31 - Series31 - ������ 2
  12, // 32 - Series32 - CX 1
  13, // 33 - Series33 - CX 2
  14, // 34 - Series34 - CX 3
  15, // 35 - Series35 - CX 4
  16, // 36 - Series36 - CX 5
  0, // 37 - !������
  0, // 38 - !������
  0, // 39 - !������
  0, // 37 - !������
  0, // 38 - !������
  0, // 39 - !������
  0, // 37 - !������
  0, // 38 - !������
  0, // 39 - !������
  0,
  0,
  0); // 40 - !������

 // ������� ������������ ������� ������ �������� ���������.
 ChannelsTable : ChannelsTableType =
 (1, // 1  - Series15 - ���������� ������
 2,  // 2  - Series16 - ��� ������
 3,  // 3  - Series17 - B ������������
 0,  // 4  - Series18 - HXR
 5,  // 5  - Series19 - Ur
 6,  // 6  - Series20 - Uy
 0,  // 7  - Series21 - ��������� ����
 0,  // 8  - Series22 - TS
 9,  // 9  - Series23 - ������������ ������
 0, // 10 - Series1  - SXR1
 0, // 11 - Series2  - SXR2
 0, // 12 - Series3  - SXR3
 0, // 13 - Series4  - SXR4
 0, // 14 - Series5  - SXR5
 0, // 15 - Series6  - SXR6
 0, // 16 - Series7  - SXR7
 0, // 17 - Series8  - SXR8
 0, // 18 - Series9  - SXR9
 0, // 19 - Series10 - SXR10
 0, // 20 - Series11 - SXR11
 0, // 21 - Series12 - SXR12
 0, // 22 - Series13 - SXR13
 0, // 23 - Series14 - SXR14
 0, // 24 - Series24 - HXR
  0, // 25 - Series25 - ��������� 1
  0, // 26 - Series26 - ��������� 2
  0, // 27 - Series27 - ��������� 3
  0, // 28 - Series28 - ��������� 4
  0, // 29 - Series29 - ��������� 5
  0, // 30 - Series30 - ������ 1
  0, // 31 - Series31 - ������ 2
  12, // 32 - Series32 - CX 1
  13, // 33 - Series33 - CX 2
  14, // 34 - Series34 - CX 3
  15, // 35 - Series35 - CX 4
  16, // 36 - Series36 - CX 5
  0, // 37 - !������
  0, // 38 - !������
  0, // 39 - !������
  0, // 37 - !������
  0, // 38 - !������
  0, // 39 - !������
  0, // 37 - !������
  0, // 38 - !������
  0, // 39 - !������
  0,
  0,
  0); // 40 - !������

 // �������� ���������� ��� �������
  AveragingTime : array[1..48] of Integer =
  (
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0);


  {
������������ ������� �� ������� �����
1- ?
2 - 16 :  1.1

������������ ������� ����������
  'Up',      mV /1000  [V]
  'Ip',      mV /94.5  [kA]
  'Btor',    mV /1000
  'HXR',
  'Ur',      mV /1000
  'Uy',      mV /1000
  'Zond',
  'TS',      mV /1000
  'DS',      mV /1000
  'SXR1',
  'SXR2',
  'SXR3',
  'SXR4',
  'SXR5',
  'SXR6',
  'SXR7',
  'SXR8',
  'SXR9',
  'SXR10',
  'SXR11',
  'SXR12',
  'SXR13',
  'SXR14',
  'HXR',
  '���������_1',
  '���������_2',
  '���������_3',
  '���������_4',
  '���������_5',
  '������_1',
  '������_2',
  'CX_01',          ?
  'CX_02',          ?
  'CX_03',          ?
  'CX_04',          ?
  'CX_05',          ?
  '������_1',
  '������_2',
  '������_3',
  '������_4');

  }

  k1_estim:real = 370; // ��� ������� ���� �����������
  k2_estim:real = 4.3; // ��� ������� ���� �����������

implementation


end.
