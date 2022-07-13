unit FT2D_Dat;

interface

uses
 inifiles;

Type

 ChannelsTableType = array[1..48] of Byte;

 SlotDataType = Array [0..32767] of Word;

 //  Тип - массив данных от плат по каналам
 ChannelsDataType = array[1..48,1..2048] of SmallInt;

 // Запись Параметров режима
 RegimeParType = record
  Name : String[8];
  Units : String[4];
  Value : Single;
 end;

 DiagType = record
  Name : String[8];
  Enabled : Boolean;
 end;

 // Данные по одному каналу для записи в файл
 ChannelFileBlockType = record

  ShotDate:String[8]; //  Дата выстрела
  ShotTime:String[8]; //  Время выстрела
  ShotNumber:SmallInt; // Номер выстрела
  RegimeName: String[32]; // Тип режима
  RegimeParameters : Array[1..16] of RegimeParType; // Параметры режима
  CommentString: String[80]; // Строка комментариев
  Parameters: array[1..16] of Single; // Зарезервированные параметры
  Diagnostics: array[1..32] of DiagType; // Диагностики


  ChannelName : String[32]; // Имя Канала

  Rate : Word; // период измерения по одному каналу, мкс
  InTime : Word; // промежуток времени измерений, мс
  Shift : Single; // Время первого измерения, мкс

  ChannelNumber:byte; // Номер канала в программе
  NumberInTable:byte; // Номер входа на платах соответствующий каналу

  BlockNumber: byte; // Номер блока двнных если канал поделен на
              // блоки по 2048 точки   =0 если нет такого деления

  ADCRange : Word; // Диапазон счетов АЦП

  Statistics : Boolean; //  Подтверждение первичной стат. обработки данных
   DataMin:SmallInt; // минимальное значение
   DataMax:SmallInt; // максимальное значение
   DataZero:Single; //  Средний ноль канала
   SigmaDataZero:Single; // его дисперсия

  {калибровка измерений}
  { U(V):=UShift+Umin+(Data-Zero*DataZero)*(Umax-Umin)*UCoeff/Range }
  Umin:     Single;   {mV}
  Umax:     Single;   {mV}
                   {Сигналы, соответствующие 0 и Range отсчетам на странице}
  UShift:   Single;   {mV}
                   {сдвиг диапазона измерений на странице (=0)}
  UCoeff:   Single;
                   {Вольты канала/Счеты АЦП}

  {вычисление измеряемой величины}
  { Value:= Value0+(U-U0)*ValueCoeff;}
  U0:             single;
  Value0:         single;   {значение измеряемой величины при U=U0}
  ValueCoeff:     single;   {dValue/dU}
  Units:          string[4];  {единицы измерений величины}
  tau:            single;   {постоянная интегрирования}

  Data : Array[1..2048] of SmallInt; // Собственно данные

 end;


 var
 Slot0_Data:SlotDataType; // Данные нулевого слота
 Slot1_Data:SlotDataType; // Данные первого слота
 Slot2_Data:SlotDataType; //array[0..131071] of Word; // Данные второго слота

 ChannelsData:ChannelsDataType; // Таблица данных слотов

 IniFile : TIniFile;


Const

 ADCKoeff : Array [1..48] of Single =
 (2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,
 0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,
 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5);

 // Коэффициент усиления каналов АЦП

 ChannelDelay : Word =2 ; // Межканальная задержка 0-слота mks
                    // Табличная!!!!!!!! 0=1.8 1=1.9 2=2.0 итд
 InpRate:Word = 35 ;  // Частота измерений слота mks
 InpTime:Word = 60; // Промежуток измерения ms
 InpShift:Word = 0; // Промежуток измерения mks

 INIFilename : String = 'FT2D.INI';

 ShotNumber1 : SmallInt = 0; // Номер выстрела

 FileName: String = ''; // Имя файла сохраненных данных

 (*Var {загружается из FT2D.ini}
 // Имена Диагностических Каналов
 ChannelsNames : Array[1..48] of String[32];

 // Коэффициенты Диагностических Каналов  **** Единиц/V ****
 ChannelsKoeff: array[1..48] of Single;
 DefaultChannelsKoeff: array[1..48] of Single;

 // Коэффициенты Каналов АЦП      **** V/Счет *****
 AmpKoeff: array[1..48] of Single;

 //  Соответствие: Канал Диагностики = Канал АЦП
 DefaultChannelsTable : ChannelsTableType;
 ChannelsTable : ChannelsTableType; *)


// Имена Диагностических Каналов
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
  'Плотность_1',

  'Плотность_2',
  'Плотность_3',
  'Плотность_4',
  'Плотность_5',
  'Оптика_1',

  'Оптика_2',
  'CX_01',
  'CX_02',
  'CX_03',
  'CX_04',

  'CX_05',
  'резерв_1',
  'резерв_2',
  'резерв_3',
  'резерв_4',

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

 // Коэффициенты Диагностических Каналов
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

 // Коэффициенты передачи в блоках развязки
 AmpKoeff: array[1..48] of Single =
 (1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1,
  1,1,1,1, 1,1,1,1);

 //  Соответствие: Канал Диагностики = Канал АЦП
 DefaultChannelsTable : ChannelsTableType =
 (1, // 1  - Series15 - Напряжение обхода
 2,  // 2  - Series16 - Ток плазмы
 3,  // 3  - Series17 - B тороидальное
 0,  // 4  - Series18 - HXR
 5,  // 5  - Series19 - Ur
 6,  // 6  - Series20 - Uy
 0,  // 7  - Series21 - Магнитный зонд
 0,  // 8  - Series22 - TS
 9,  // 9  - Series23 - Диамагнитный сигнал
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
  0, // 25 - Series25 - Плотность 1
  0, // 26 - Series26 - Плотность 2
  0, // 27 - Series27 - Плотность 3
  0, // 28 - Series28 - Плотность 4
  0, // 29 - Series29 - Плотность 5
  0, // 30 - Series30 - Оптика 1
  0, // 31 - Series31 - Оптика 2
  12, // 32 - Series32 - CX 1
  13, // 33 - Series33 - CX 2
  14, // 34 - Series34 - CX 3
  15, // 35 - Series35 - CX 4
  16, // 36 - Series36 - CX 5
  0, // 37 - !резерв
  0, // 38 - !резерв
  0, // 39 - !резерв
  0, // 37 - !резерв
  0, // 38 - !резерв
  0, // 39 - !резерв
  0, // 37 - !резерв
  0, // 38 - !резерв
  0, // 39 - !резерв
  0,
  0,
  0); // 40 - !резерв

 // Таблица соответствия каналов слотов сигналам программы.
 ChannelsTable : ChannelsTableType =
 (1, // 1  - Series15 - Напряжение обхода
 2,  // 2  - Series16 - Ток плазмы
 3,  // 3  - Series17 - B тороидальное
 0,  // 4  - Series18 - HXR
 5,  // 5  - Series19 - Ur
 6,  // 6  - Series20 - Uy
 0,  // 7  - Series21 - Магнитный зонд
 0,  // 8  - Series22 - TS
 9,  // 9  - Series23 - Диамагнитный сигнал
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
  0, // 25 - Series25 - Плотность 1
  0, // 26 - Series26 - Плотность 2
  0, // 27 - Series27 - Плотность 3
  0, // 28 - Series28 - Плотность 4
  0, // 29 - Series29 - Плотность 5
  0, // 30 - Series30 - Оптика 1
  0, // 31 - Series31 - Оптика 2
  12, // 32 - Series32 - CX 1
  13, // 33 - Series33 - CX 2
  14, // 34 - Series34 - CX 3
  15, // 35 - Series35 - CX 4
  16, // 36 - Series36 - CX 5
  0, // 37 - !резерв
  0, // 38 - !резерв
  0, // 39 - !резерв
  0, // 37 - !резерв
  0, // 38 - !резерв
  0, // 39 - !резерв
  0, // 37 - !резерв
  0, // 38 - !резерв
  0, // 39 - !резерв
  0,
  0,
  0); // 40 - !резерв

 // Интервал усреднения для каналов
  AveragingTime : array[1..48] of Integer =
  (
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0,0,0,
   0,0,0,0,0, 0,0,0);


  {
Коэффициенты коробки на нулевом слоте
1- ?
2 - 16 :  1.1

Коэффициенты каналов диагностик
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
  'Плотность_1',
  'Плотность_2',
  'Плотность_3',
  'Плотность_4',
  'Плотность_5',
  'Оптика_1',
  'Оптика_2',
  'CX_01',          ?
  'CX_02',          ?
  'CX_03',          ?
  'CX_04',          ?
  'CX_05',          ?
  'резерв_1',
  'резерв_2',
  'резерв_3',
  'резерв_4');

  }

  k1_estim:real = 370; // для формулы Льва Акрадьевича
  k2_estim:real = 4.3; // для формулы Льва Акрадьевича

implementation


end.
