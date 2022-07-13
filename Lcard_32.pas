{-------------------------------------------------------------------------}
{ Интерфейсный модуль библиотеки Lcard_ad для BP7.0/Delphi                }
{-------------------------------------------------------------------------}
UNIT LCARD_32;
interface
uses
    Windows, Messages;

type
    Proc=procedure;
    PTErrorHandler=pointer;
{procedure(Error:DWORD;OSError:DWORD);}
    TDDS=record
        Size:DWORD;
        Offset:DWORD;
        SegSel:word;
        BufferID:word;
        Physical:DWORD;
    End;
    PTDDS=^TDDS;
    PWord=^word;
    TDmaChannel=record
        DDS:TDDS;
        DmaChannelNo:integer;
        PLinear:PWord;
    End;
    PTDmaChannel=^TDmaChannel;

{ типы поддерживаемых данной библиотекой плат                             }
const
    NO_BOARD=0;
    L305=1;
    L1610=2;
    L1250=3;
    L154=4;
    L164=5;
    L1056=6;
    L1208=7;
    L264=8;
    E330=9;
    L1210=10;
    LCI01=11;
    CRAIT=12;
    L241=13;
    L1211=14;
    L1620=15;
    L1221=16;
    L750=17;
    Unknown=18;

    AUTODETECT_INTERFACE =-1;
    EPP_INTERFACE        = 0;
    SERIAL_INTERFACE     = 1;
    BIDIR_INTERFACE      = 2;
    IDE_INTERFACE        = 3;

procedure SELECT_SLOT(Slot:integer);stdcall;
function PLATA_TEST:integer;stdcall;
procedure SET_BOARD_TYPE(BoardType:integer);stdcall;
function GET_BOARD_TYPE:integer;stdcall;
procedure SET_BASE_ADDRESS(Address:integer);stdcall;
procedure ENABLE_INT(_IntEnabled:integer);stdcall;
function CREATE_CHANNEL(Channel:integer; Usil:integer; Mode:integer):word;stdcall;
function MEMORY_STATE:integer;stdcall;
function MEMORY_PM_STATE:integer;stdcall;
procedure SET_INTER_DELAY(delay_value:integer);stdcall;
procedure SET_ADSP_SPEED(DspType:integer);stdcall;
procedure SET_WAIT_STATE(wait_state:integer);stdcall;
procedure SET_TIMER_SCALE(ScaleValue:integer);stdcall;
procedure TIMER_L154_L164(TimerNumber:integer; Mode:integer; Rate:integer);stdcall;
procedure WAIT_TICK_L154_L164(TimerNumber:integer);stdcall;
function GET_TIMER_L154_L164:integer;stdcall;
procedure CALIBRATION;stdcall;
procedure INIT_COMPARATOR(Channel:integer; Porog:integer; BitNPoint:integer; HandleMode:integer
);stdcall;
procedure LOW_POWER(ModeReg:integer);stdcall;
function GET_SLOT_CODE(CraitNumber:integer; ModuleNumber:integer):integer;stdcall;
procedure RESET_ALL;stdcall;
function MAKE_CHANNEL(CraitNumber:integer; ModuleNumber:integer; Chan:integer; 
Kadrr:integer; 
Usil:integer
):word;stdcall;
procedure PROGRAM_FILTER(CraitNumber:integer; ModuleNumber:integer; CutFrequency:integer; 
AnalogFilterType:integer
);stdcall;
procedure PROGRAM_LM_201(CraitNumber:integer; ModuleNumber:integer; Chan:integer; 
Usil1:integer; 
Source:integer
);stdcall;
procedure PROGRAM_LM_102(CraitNumber:integer; ModuleNumber:integer; Usil1:integer
);stdcall;
procedure PROGRAM_LM_501(CraitNumber:integer; ModuleNumber:integer; M3:integer; 
M2:integer; 
M1:integer; 
EN:integer; 
EP:integer; 
AN:integer; 
AP:integer
);stdcall;
procedure PROGRAM_LM_DAC(CraitNumber:integer; ModuleNumber:integer; Mode:integer; 
Coded:integer; 
DacCh:integer
);stdcall;
function GET_LM_401(CraitNumber:integer; ModuleNumber:integer):integer;stdcall;
function LM_404(Coded:word):word;stdcall;
procedure PROGRAM_LM_TTLOUT(CraitNumber:integer; ModuleNumber:integer; Coded:word
);stdcall;
procedure SETCHANNEL(Channel:word);stdcall;
function SAMPLE:word;stdcall;
function ADCHAN(Chan:word):word;stdcall;
procedure KADR(var Datad; var Chans; Nch:integer);stdcall;
procedure STREAM(var Datad; Npoint:integer; Chan:word; Rate:integer);stdcall;
procedure SOFT(var Datad; Nkadr:integer; var Chan; Nch:integer; Rate:integer
);stdcall;
procedure SOFT_HUGE(var Datad; Nkadr:dword; var Chan; Nch:integer; Rate:integer
);stdcall;
procedure DMAONE(var Datad; Npoint:integer; Chan:integer; Rate:integer; 
Dmm:integer
);stdcall;
procedure DMAALL(var Datad; Nkadr:integer; var Chan; Nch:integer; Rate:integer; 
Dmm:integer
);stdcall;
procedure DMA_ALL_DA(var AdDatad; AdNkadr:integer; var Chan; Nch:integer; Rate:integer; 
AdDmm:integer; 
var DaDatad; 
DaNkadr:integer; 
DaDmm:integer; 
DaNumber:integer
);stdcall;
procedure OUTDA(Coded:integer);stdcall;
procedure SET_DA_NUMBER(SoftDaMode:integer; DaNumber:integer);stdcall;
procedure STREAM_OUTDA(Coded:word);stdcall;
procedure DASTREAM(Rate:integer; Npoint:integer; var Datad);stdcall;
procedure DASTREAM_HUGE(Rate:integer; Npoint:dword; var Datad);stdcall;
procedure DADMASTREAM(var Datad; Npoint:integer; Rate:integer; Dmm:integer
);stdcall;
procedure OUTBYTE(CodeVal:integer);stdcall;
function INPBYTE:integer;stdcall;
function DSP_INPBYTE:integer;stdcall;
procedure DSP_OUTBYTE(CodeVal:integer);stdcall;
procedure INTR_SETUP(Number:integer);stdcall;
procedure STOP_INTR;stdcall;
procedure RESET_IRQ;stdcall;
function INIT_SIMPLE_INTR(Rate:integer; Rate1:integer; Vector:pointer):THANDLE;stdcall;
function STREAM_INTR(Rate:integer; Vector:pointer; Chan:word):THANDLE;stdcall;
function SOFT_INTR(Rate:integer; Vector:pointer; var Chan; Nch:integer):THANDLE;stdcall;
function READ_DATA:integer;stdcall;
function DATA_READY:integer;stdcall;
procedure SYNCHRO_MODE(SMode:integer; TtlMask:integer; AdChannel:word; AdValue:word
);stdcall;
procedure SOFT_MEMORY_START(Nkadr:dword; var Chan; Nch:integer; Rate:integer; PageNumber:integer; 
OffsetNumber:integer; 
RestartMode:integer
);stdcall;
function TEST_FOR_INPUT_END:integer;stdcall;
procedure GET_INPUT_DATA(var Datad; Npoint:integer);stdcall;
procedure SOFT_MEMORY_RESTART;stdcall;
procedure DMA_OFF;stdcall;
function DMA_TEST:integer;stdcall;
function DMA_COUNTER_IN:integer;stdcall;
function DMA_COUNTER_OUT:integer;stdcall;
procedure GET_BUFFER(var Data);stdcall;
function GET_BUFFER_HALF(var Data):integer;stdcall;
procedure PUT_BUFFER(var Data);stdcall;
function PUT_BUFFER_HALF(var Data):integer;stdcall;
procedure CONFIG_FIFO(fifo_mode:integer);stdcall;
procedure CONFIG_2FIFO_TYPE(fifo_type:integer; fifo_length:integer);stdcall;
procedure READ_FIFO(var Datad; Npoint:integer);stdcall;
function STREAM_FIFO2_BEGIN(Rate:integer; Vector:pointer; var Chan; Nch:integer):THANDLE;stdcall;
procedure GET_DIGITS_1056(Chan:integer; var Data);stdcall;
procedure OUT_DIGITS_1056(Data:integer);stdcall;
procedure STREAM_1056(var Datad; NKadr:integer; Chan:integer; Rate:integer);stdcall;
procedure STREAM_DMA_1056(var Datad; Nkadr:integer; Chan:integer; Rate:integer; Dmm:integer
);stdcall;
procedure OUT_STREAM_1056(var Datad; NPoint:integer; Rate:integer);stdcall;
procedure OUT_STREAM_DMA_1056(var Datad; Npoint:integer; Rate:integer; Dmm:integer
);stdcall;
function INIT_INTR_1056(Rate:integer; Chan:integer; Vector:pointer):THANDLE;stdcall;
procedure SET_SYNCHRO_MODE_1056(s_mode:integer; s_number:integer; s_mask:integer);stdcall;
procedure ZERO_MODE_1208(Mode:integer);stdcall;
procedure OUTDA_1208(Coded:word; DacNumber:integer);stdcall;
procedure KADR_1208(Nch:integer; var Datad; var DacNumber);stdcall;
procedure SOFT_1208(var Datad; NPoint:integer; var DacNumber; NCh:integer; 
Rate:integer
);stdcall;
procedure SOFT_FON_1208(var Datad; NPoint:integer; var DacNumber; NCh:integer; 
Rate:integer
);stdcall;
procedure DMASOFT_1208(var Datad; NPoint:integer; var DacNumber; Nch:integer; 
Rate:integer; 
Dmm:integer
);stdcall;
function SOFT_INTR_1208(Rate:integer; Vector:pointer; NCh:integer):THANDLE;stdcall;
function GET_DATA:integer;stdcall;
procedure PUT_DATA(Data:word);stdcall;
procedure READ_INT_MEMORY(var Datad; Page:integer; StartAddr:integer; NWords:integer
);stdcall;
procedure WRITE_INT_MEMORY(var Datad; Page:integer; StartAddr:integer; NWords:integer
);stdcall;
function LOADBIOS(var FileName; LoadMode:cardinal):integer;stdcall;
procedure POWER_AND_PRINTER_E330(ModePower:integer; ModePrinter:integer);stdcall;
procedure SET_EPP_MODE_E330(aEppMode:integer);stdcall;
procedure SET_FIFO_PARAMETERS_E330(FifoSize:integer; FifoMode:integer);stdcall;
procedure SET_SOFT_PARM_E330(Nch:integer; var Channels);stdcall;
procedure SET_TIME_PARAMETERS_E330(Rate:cardinal);stdcall;
procedure TIMER_INPUT_START_E330;stdcall;
procedure STOP_FUNC_E330;stdcall;
procedure TIMER_INPUT_E330(var Datad; NWords:integer);stdcall;
procedure SOFT_MEMORY_PREPARE_E330(Nkadr:dword; PageNumber:integer; OffsetNumber:integer; RestartMode:integer
);stdcall;
procedure SOFT_MEMORY_START_E330;stdcall;
function TIMER_INPUT_IRQ_START_E330(Vector:pointer):THANDLE;stdcall;
function IRQ_SLOW_START_E330(IrqPeriod:integer; Vector:pointer):THANDLE;stdcall;
procedure SET_TEST_SPEED_MODE_E330(TestMode:integer);stdcall;
procedure WRITE_BY_ADDRESS_E330(Address:integer; Data:word);stdcall;
function READ_BY_ADDRESS_E330(Address:integer):word;stdcall;
procedure BOARD_SPECIFIC_INIT(LowPowerMode:integer);stdcall;
procedure SELECT_BOARD(Board:integer);stdcall;
procedure SETBASEADDRESS(Address:integer);stdcall;
procedure EXEC_ADSP_COMMAND(Command:integer; NWordsOut:integer; var WordsOut; NWordsIn:integer; 
var WordsIn
);stdcall;
function GET_STATUS:integer;stdcall;
procedure ALLOCATEBUFFER(Size:dword; var PLinear; var PPhysical);stdcall;
procedure CONFIG_TX_CHANNEL_LCI01(Channel:integer);stdcall;
procedure FREEBUFFER(var Linear);stdcall;
procedure GET_HALF_FIFO(var Datad; NPoint:integer; Mode:integer);stdcall;
procedure GET_INPUT_POINTS(var Datad);stdcall;
function QADCHAN(Chan:word):word;stdcall;
function LOADBIOSFROMARRAY_L1211(var BiosCode):integer;stdcall;
procedure INIT_CORRECTION_LC302(Type_:word);stdcall;
procedure QSOFT(var Datad; Rate:cardinal);stdcall;
procedure RESERVED2(var p1; p2:integer; p3:integer);stdcall;
procedure READ_CALIBR_CC;stdcall;
procedure CONFIG_RX_CHANNEL_LCI01(Channel:integer);stdcall;
procedure SELECT_DEVICE(DeviceNumber:integer);stdcall;
procedure SET_AD_MODE(Mode:integer);stdcall;
procedure CONFIGURE_FAST_READ_CC(Nch:smallint; var FastLogChanBuff);stdcall;
procedure SET_CHANNELS(Nch:word; Single:word);stdcall;
procedure INITIALIZE_CORRECTION_PC(CalibrMode:word);stdcall;
procedure SET_DAC_BUFER_E330(Npoint:integer; var Data);stdcall;
procedure SET_TIME(Rate:integer; Scale:integer; Epocha:integer);stdcall;
procedure SET_FAST_PARAMS_CC(Slot301:smallint; DACDelayValue:smallint; NChannel:smallint
);stdcall;
procedure START_LOOP_DAC_E330;stdcall;
procedure STOP_INPUT;stdcall;
procedure TIMER_INPUT;stdcall;
function TIMER_INPUT_INTR(Vector:pointer):THANDLE;stdcall;
procedure RESERVED4(var p1; p2:integer; p3:integer);stdcall;
procedure GET_TABLE(var Table; NWords:integer);stdcall;
procedure CONFIG_LC227(Slot:integer; Mode:integer; Scale:integer);stdcall;
procedure GET_SAMPLE_LC227(Slot:integer; Chan:integer; var Dest);stdcall;
function STATUS_LC227(Slot:integer):word;stdcall;
procedure GET_KADR_LC227(Slot:integer; Mask:integer; var NWords; var DestInt);stdcall;
function LOAD_BIOS_LC227(Slot:integer; var BiosCode):integer;stdcall;
function GET_ERROR_HANDLER:PTErrorHandler;stdcall;
function GET_TIMEOUT:dword;stdcall;
function PLATA_TEST_CC:integer;stdcall;
function MEMORY_STATE_CC:integer;stdcall;
function MEMORY_PM_STATE_CC:integer;stdcall;
procedure EXECUTE_COMMAND_CC(Code:integer; NWordsOut:integer; var WordsOut; NWordsIn:integer; 
var WordsIn
);stdcall;
procedure SET_CALIBR_MODE_CC(CalibrMode:integer);stdcall;
procedure SET_ERROR_HANDLER(NewErrorHandler:PTErrorHandler);stdcall;
procedure OUTDA_LC301(Slot:integer; Code1:integer; Code2:integer);stdcall;
function SAMPLE_LC301(Slot_301:integer; SourceSlot:integer; LogChannel:integer):word;stdcall;
function SAMPLE_LC111(Slot_111:integer; LogChannel:integer):word;stdcall;
procedure SET_FIFO_SIZE_CC(FifoSize:integer);stdcall;
procedure CONFIG_FIFO_CC(FirstFifoPage:integer; LastFifoPage:integer);stdcall;
procedure SOFT_CONFIG_CC(Slot_301:integer; NChannel:integer; var Channels; Rate:integer
);stdcall;
procedure SOFT_START_CC;stdcall;
procedure SOFT_STOP_CC;stdcall;
function GET_NWORDS_CC(var NWords):integer;stdcall;
procedure GET_SOFT_DATA_CC(var Datad; NWords:dword);stdcall;
procedure SOFT_CC(Slot_301:integer; NChannel:integer; var Channels; NKadr:dword; 
Rate:integer; 
var Datad
);stdcall;
function FAST_SOFT_IRQ_START_CC(Vector:pointer):THANDLE;stdcall;
procedure GET_FAST_SOFT_DATA(var Datad; NWords:integer);stdcall;
procedure FAST_SOFT_START_CC;stdcall;
procedure GET_FAST_SOFT_IRQ_DATA(var Datad; NWords:integer);stdcall;
procedure FAST_SOFT_IRQ_STOP_CC;stdcall;
procedure WAIT_SOFT_DATA_CC(var Datad; NWords:dword);stdcall;
function GET_CTRL_LC301(Slot:integer):integer;stdcall;
procedure SET_CTRL_LC301(Slot:integer; CtrlWord:integer);stdcall;
procedure READ_REG_7710(Chan:integer; A0:integer; var Datad);stdcall;
procedure WRITE_REG_7710(Chan:integer; A0:integer; var Datad);stdcall;
function LOAD_BIOS_LC351(Slot:integer; var BiosCode):integer;stdcall;
function MEMORY_STATE_LC351(Slot:integer):integer;stdcall;
procedure SET_CTRL_LC351(Slot:integer; AttenMode:integer; CommutMode:integer);stdcall;
procedure OUTDA_LC351(Slot:integer; Coded:integer);stdcall;
procedure LOAD_DATA_LC351(Slot:integer; Page:integer; NWords:integer; var Datad
);stdcall;
procedure START_OUT_LC351(Slot:integer; NWords:longint; Delay:integer);stdcall;
function LOAD_BIOS_LC451(Slot:integer; var BiosCode):integer;stdcall;
function INP_DIGITS_401(Slot:integer):word;stdcall;
procedure ENABLE_IRQ_401(Slot:integer; Enable:integer);stdcall;
procedure OUT_DIGITS_402(Slot:integer; Data:word);stdcall;
procedure ENABLE_IRQ_402(Slot:integer; Enable:integer);stdcall;
procedure OUT_DIGITS_403(Slot:integer; Data:dword);stdcall;
function INP_DIGITS_403(Slot:integer):dword;stdcall;
procedure ENABLE_IRQ_403(Slot:integer; Enable:integer);stdcall;
procedure ENABLE_OUT_403(Slot:integer; EnableMask:integer);stdcall;
function READ_IO_403(Slot:integer):integer;stdcall;
procedure RESET_ANSW_403(Slot:integer);stdcall;
procedure PROGRAM_FILTER_LC201(Slot:integer; Freq:longint);stdcall;
procedure PROGRAM_USIL_LC201(Slot:integer; Channel:integer; Kusil:integer);stdcall;
procedure PROGRAM_FILTER_LC210(Slot:integer; Freq:longint);stdcall;
procedure PROGRAM_USIL_LC210(Slot:integer; Channel:integer; Kusil:integer);stdcall;
function READ_FLASH_CC(Slot:cardinal; Addr:cardinal):cardinal;stdcall;
procedure WRITE_FLASH_CC(Slot:integer; Addr:integer; Data:integer);stdcall;
procedure WRITE_EN_DS_CC(Slot:integer; Enable:integer);stdcall;
procedure PUT_REMOTE_WORD_CC(Addr:integer; Data:word);stdcall;
function GET_REMOTE_WORD_CC(Addr:integer):word;stdcall;
procedure PUT_REMOTE_ARRAY_CC(aPage:integer; Addr:integer; NWords:integer; var Datad
);stdcall;
procedure GET_REMOTE_ARRAY_CC(aPage:integer; Addr:integer; NWords:integer; var Datad
);stdcall;
procedure SET_IRQ_MASK_CC(IrqMask:integer);stdcall;
procedure GET_MODULE_IRQ(var IrqCount; var IrqMarkers);stdcall;
procedure SET_TIMEOUT(Value:dword);stdcall;
procedure LOW_POWER_CC(IsLowPower:integer);stdcall;
procedure OUTDA_LC302(Slot:integer; Channel:integer; Datad:integer);stdcall;
procedure KADR_LC302(Slot:integer; var ChanAndData; NChannel:integer);stdcall;
procedure SET_CTRL_LC302(Slot:integer; CtrlWord:integer);stdcall;
procedure PROGRAM_AD8402(Slot:integer; ChanExt:integer; ChanInt:integer; Data:integer
);stdcall;
procedure PROGRAM_MAX(Slot:integer; ChanExt:integer; Data:longint);stdcall;
procedure OUTDA_AD8842(Slot:integer; ChanInt:integer; Datad:integer);stdcall;
procedure RELEASEDMACHANNEL(Channel:cardinal);stdcall;
procedure FORCE_INTER_DELAY_CC(InterDelay:integer);stdcall;
procedure CONNECT_LC501(Slot:integer; Connection:dword);stdcall;
function ADCHAN_L241(LogChannel:integer):longint;stdcall;
procedure SELFCALIBR_L241(LogChannel:integer; Control:longint);stdcall;
procedure SET_INTERFACE_TYPE(aEppMode:integer);stdcall;
procedure SET_DEVICE_BINDING(InterfaceDevice:integer);stdcall;
procedure SET_CRAIT_ADDRESS(aBase:integer);stdcall;
procedure GET_INI_SETTINGS;stdcall;
procedure CONFIG_LC451(Slot:integer; Mode:integer; Scale:integer);stdcall;
function STATUS_LC451(Slot:integer):word;stdcall;
procedure GET_SAMPLE_LC451(Slot:integer; Chan:integer; var Dest);stdcall;
procedure GET_KADR_LC451(Slot:integer; Mask:integer; var NWords; var DestInt);stdcall;
procedure SET_THRESHOLD_LC451(Slot:integer; Chan:integer; Typ_:integer; Val:integer
);stdcall;
procedure SET_IRQ_INFOM_CC(NumCraitSlots:integer; var InfArr);stdcall;
procedure SET_LC227DATA_IRQSET_CC;stdcall;
procedure GET_IRQ1DATA_CC(Slot:integer; NWords:integer; var DatArr);stdcall;
function GET_LC227CHMASK(Slot:integer; ShiftVal:integer):word;stdcall;
procedure REQUESTDMACHANNEL(var Data; NPoint:cardinal; Channel:cardinal; Dmm:cardinal
);stdcall;
function CALIBRLC201_STEP1_BEG(aSlot_201:integer; aSlot_301:integer):integer;stdcall;
function CALIBRLC201_STEP1_CYCLE(aChannel:integer; aGain:integer; var Value):integer;stdcall;
function CALIBRLC201_STEP1_FIN(var NameOfClbFile):integer;stdcall;
function CALIBRLC201_STEP2_BEG(aSlot_201:integer; aSlot_301:integer):integer;stdcall;
function CALIBRLC201_STEP2_CYCLE_CHANV0(aChannel:integer; var ValueExpected; var ValueMeasured):integer;stdcall;
function CALIBRLC201_STEP2_CYCLE_CHANV5(aChannel:integer; var ValueExpected; var ValueMeasured):integer;stdcall;
function CALIBRLC201_STEP2_CYCLE_CHANZG(aChannel:integer; var Values; var OffsetValue; var GainValue
):integer;stdcall;
function CALIBRLC201_STEP2_CYCLE_GAIN(aGain:integer; var NameClbFile):integer;stdcall;
function CALIBRLC201_STEP2_FIN(var FileName):integer;stdcall;
procedure CALIBR_LC201_STEP1(Slot201:integer; Slot301:integer);stdcall;
function CALIBR_LC201_STEP2(Slot201:integer; Slot301:integer):integer;stdcall;
function GET_DFLTCALIBRSET_LC201(var xFltFreq; var xForceIntDel; var xnGains; var xckdFile; 
var Ku; 
var xTimeDAC; 
var xNPoint
):integer;stdcall;
procedure SETU_LC301(Slot_301:integer; U:double);stdcall;
function SET_DFLTCALIBRSET_LC201(xFltFreq:longint; xForceIntDel:integer; xnGains:integer; var xckdFile; 
var Ku; 
xTimeDAC:integer; 
xNPoint:integer
):integer;stdcall;
procedure SET_TRIM_DAC_LC201_FILE(Slot_201:integer; Chan:integer; Gain:integer; var NameClbFile
);stdcall;
procedure READ_REG_7710_CRAIT(Slot:integer; A0:integer; var Datad);stdcall;
procedure WRITE_REG_7710_CRAIT(Slot:integer; A0:integer; var Datad);stdcall;
function CHECK_OVERFLOW_7710_CRAIT:integer;stdcall;
procedure ENABLE_7710_CRAIT(Slot:integer; Mode:integer);stdcall;
function FINISH_READ_7710_CRAIT(Slot_301:integer):double;stdcall;
function FINISH_READ_CODE_7710_CRAIT(Slot_301:integer):longint;stdcall;
function IS_7710_PRESENT_CRAIT(Slot_301:integer):integer;stdcall;
function IS_7710_READY_CRAIT(Slot_301:integer):integer;stdcall;
function READ_7710_CRAIT(Slot_301:integer):double;stdcall;
function READ_CODE_7710_CRAIT(Slot_301:integer):longint;stdcall;
procedure RESET_FILTER_7710_CRAIT;stdcall;
procedure SELF_CALIBR_7710_CRAIT(Slot_301:integer; Gain:integer);stdcall;
procedure SET_CHANNEL_7710_CRAIT(Slot_301:integer; ExtChan:integer);stdcall;
function CREATE_CHANNEL_LC201(Channel:integer; Gain:integer; UvxOpened:integer; ConnectDAC:integer
):integer;stdcall;
procedure KADR_LC227(Slot:integer; Scale:integer; Mask:integer; var Dest
);stdcall;
function SET_CALIBRATION_LC227(Slot:integer):integer;stdcall;
procedure SET_CALIBRATION_LC227_ALL;stdcall;
function GET_LC201_CONNECTDAC_MODE:integer;stdcall;
procedure SET_LC201_CONNECTDAC_MODE(aConnectDACMode:integer);stdcall;
procedure INIT_LC201_FROM_FILE(Slot_201:integer; var FileName; CalibrMode:integer; Freq:longint; 
var GainsForChan; 
InterDelayVal:integer; 
aPage1_Fifo:integer; 
aPage2_Fifo:integer
);stdcall;
procedure INIT_LC201_FROM_PPZU(Slot_201:integer; Freq:longint; var GainsForChan; InterDelayVal:integer; 
aPage1_Fifo:integer; 
aPage2_Fifo:integer
);stdcall;
procedure KADR_LC451(Slot:integer; Mode:integer; Scale:integer; Mask:integer; 
var Dest
);stdcall;
procedure INIT_MODULE_LC201(Slot:integer; CalibrMode:integer; Freq:longint; var CurrentModes; 
InterDelayVal:integer; 
aPage1_Fifo:integer; 
aPage2_Fifo:integer
);stdcall;
procedure TRANSMIT_CALIBR_DATA201_TO_PPZU(Slot:integer; var FileName; var GainSet);stdcall;
function IN_BYTE(Port:cardinal):cardinal;stdcall;
function IN_WORD(Port:cardinal):cardinal;stdcall;
function OUT_BYTE(Port:cardinal; Value:cardinal):cardinal;stdcall;
function OUT_WORD(Port:cardinal; Value:cardinal):cardinal;stdcall;
procedure RESET_SYNMODE;stdcall;
procedure SET_SYNMODE_ADC(Slot_301:word; SourceSynSlot:word; LogSynChan:word; SynDir:word; 
SynLevel:word
);stdcall;
procedure SET_SYNMODE_TTL(SMode:word; SynSlot:word; SynChan:word; Dir:word);stdcall;
procedure START_SYNSOFT;stdcall;
procedure SYNSOFT_CC(Slot_301:word; NChannel:word; var Channels; NKadr:word; 
Rate:word; 
var Datad
);stdcall;
function LOADBIOS_MODULE_CC(xSlot:integer; var FileName; ModuleType:integer):integer;stdcall;
function CREATE_CHANNEL_LC101(Channel:integer; Gain:integer; Mode:integer):integer;stdcall;
function CREATE_CHANNEL_LC102(Channel:integer; Gain:integer; Mode:integer):integer;stdcall;
function CREATE_CHANNEL_LC104(Channel:integer; Gain:integer; Mode:integer):integer;stdcall;
function CREATE_CHANNEL_LC111(Channel:integer; Gain:integer; Mode:integer):integer;stdcall;
function CREATE_CHANNEL_LC210(Channel:integer; UvxOpened:integer; BaseChan:integer):integer;stdcall;
procedure DEINSTALLLOGIO;stdcall;
procedure INSTALLLOGIO;stdcall;
function CREATE_CONTROL_WORD_LC302(Slot:smallint; Channel:smallint; Datad:smallint):word;stdcall;
function CREATE_FAST_CHAN_CC(ModuleType:smallint; Slot:smallint; LogChan:word):word;stdcall;
procedure KADR_OUT_LC302_FAST_CC(Slot302:smallint; NChan:smallint; var CtrlWrdBuff);stdcall;
procedure OUT_LC302_FAST_CC(Slot302:smallint; Datad:word);stdcall;
procedure READ_FAST_KADR_CC(Nch:smallint; var Datad);stdcall;
function READ_FAST_SAMPLE_CC(CtrlWrdFast:word):smallint;stdcall;
function LOADCRAIT(CraitType:integer; Adr:integer):integer;stdcall;
function AUTO_PREPARE_MODULE(ModuleCode:smallint):word;stdcall;
function _GET_DATA:word;stdcall;
procedure _PUT_DATA(Data:word);stdcall;
procedure _SEND_COMMAND(Command:word);stdcall;
function FAST_LOADING_LC010(var BiosCode):integer;stdcall;
function FAST_LOADING_LCI01(var BiosCode):integer;stdcall;
procedure COMMAND_L1221(CommandD:cardinal);stdcall;
procedure GET_DATA_MEMORY_L1221(var DataPointer; Count:cardinal; Address:cardinal);stdcall;
function GET_DM_WORD_L1221(Address:cardinal):cardinal;stdcall;
function LOAD_ADSP2186(var BiosCode):cardinal;stdcall;
procedure PUT_DATA_MEMORY_L1221(var DataPointer; Count:cardinal; Address:cardinal);stdcall;
procedure PUT_DM_WORD_L1221(Address:cardinal; DataD:cardinal);stdcall;
function INIT_INTR(Vector:pointer):THANDLE;stdcall;
procedure DELAY(Count:cardinal);stdcall;
procedure SET_DELAY(Value:cardinal);stdcall;
function LOAD_DSP_DM(var FileName):integer;stdcall;
function LOAD_DSP_EXT_PM(var FileName):integer;stdcall;
procedure LOAD_DSP_INT_PM(var BiosCode);stdcall;
function LOAD_INT_PM(var FileName):pointer;stdcall;
procedure RESET_AD_L1221;stdcall;
procedure CONFIG_FIFO_L750(FifoSize:cardinal);stdcall;
procedure CONFIG_INPUT_L750(InputMode:longbool);stdcall;
procedure DISABLE_PLATA_INT_L750;stdcall;
procedure DIS_EEPROM_WRITE_L750;stdcall;
procedure ENABLE_PLATA_INT_L750;stdcall;
procedure ENA_EEPROM_WRITE_L750;stdcall;
function GET_DM_WORD_L750(Address:cardinal):cardinal;stdcall;
function LOAD_BIOS_L750(var BiosCode):longbool;stdcall;
procedure OUTDA_L750(DAC_Val:cardinal);stdcall;
function PLATA_TEST_L750:longbool;stdcall;
procedure PUT_DM_WORD_L750(Address:cardinal; DataD:cardinal);stdcall;
procedure PUT_TRM_BYTE_L750(Address:cardinal; Datad:cardinal);stdcall;
function READ_EEPROM_L750(Address:cardinal):cardinal;stdcall;
procedure RESET_DSP_L750;stdcall;
function SAMPLE_L750:integer;stdcall;
procedure SELECT_INPUT_MODE_L750(Mode:cardinal);stdcall;
procedure SETCHANNEL_L750(Chan:cardinal);stdcall;
procedure SET_DA_NUMBER_L750(DAC_Num:cardinal);stdcall;
procedure SET_REFERENCE_L750(RefVolt:longbool);stdcall;
procedure SET_TIMER_SCALE_L750(Scale:cardinal);stdcall;
procedure SOFT_L750(var DataD; NKadr:dword; var Channels; Nch:cardinal; Rate:cardinal
);stdcall;
procedure STREAM_L750(var DataD; Npoint:dword; Channel:cardinal; Rate:cardinal
);stdcall;
procedure SYNCHRO_MODE_L750(SynchroMode:longbool);stdcall;
procedure TTL_CONFIG_L750(TTL_Mode:cardinal);stdcall;
function TTL_INPUT_L750:cardinal;stdcall;
procedure TTL_OUTPUT_L750(DataD:cardinal);stdcall;
procedure WRITE_DA_L750(DAC_Num:cardinal; DAC_Val:cardinal);stdcall;
procedure WRITE_EEPROM_L750(Address:cardinal; DataD:cardinal);stdcall;
function IN_DWORD(Port:cardinal):dword;stdcall;
function OUT_DWORD(Port:cardinal; Value:dword):dword;stdcall;
procedure REP_IN_BYTE(Port:cardinal; Count:dword; var DataD);stdcall;
procedure REP_IN_DWORD(Port:cardinal; Count:dword; var DataD);stdcall;
procedure REP_IN_WORD(Port:cardinal; Count:dword; var DataD);stdcall;
procedure REP_OUT_BYTE(Port:cardinal; Count:dword; var DataD);stdcall;
procedure REP_OUT_DWORD(Port:cardinal; Count:dword; var DataD);stdcall;
procedure REP_OUT_WORD(Port:cardinal; Count:dword; var DataD);stdcall;
procedure DSP_COMMAND_L750(Command:cardinal);stdcall;
procedure GET_DATA_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);stdcall;
function GET_PM_WORD_L750(Address:cardinal):cardinal;stdcall;
procedure GET_PROGRAM_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);stdcall;
function GET_TRM_BYTE_L750(Address:cardinal):cardinal;stdcall;
function GET_TRM_WORD_L750(Address:cardinal):cardinal;stdcall;
procedure PUT_DATA_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);stdcall;
procedure PUT_PM_WORD_L750(Address:cardinal; DataD:cardinal);stdcall;
procedure PUT_PROGRAM_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);stdcall;
procedure PUT_TRM_DWORD_L750(Datad:dword);stdcall;
procedure PUT_TRM_WORD_L750(Address:cardinal; Datad:cardinal);stdcall;
procedure SETRATE_L750(Rate:cardinal);stdcall;
function SET_ADC_FREQ_L750(Freq:cardinal):cardinal;stdcall;
procedure SET_DATA_ADDRESS_L750(Address:cardinal);stdcall;
function ADCHAN_L750(Chan:cardinal):integer;stdcall;
procedure SPELT_AMPLIFIER_OLD_TIGER(Number:cardinal; Coded:cardinal);stdcall;
procedure SPELT_FILTER_OLD_TIGER(FilterNumber:cardinal; CutFrequency:cardinal);stdcall;
function CALIBR_LC212(xSlot:word; xType:word; IsUseFlash:word):word;stdcall;
procedure CREATE_CHANNEL_LC212(Slot:word; Chan:word; Diapazon:word);stdcall;
function GET_LC212_DATA(xSlot:word; NPoints:word; var xData):word;stdcall;
procedure IDMA_FORCE_IRQ2(xSlot:word);stdcall;
procedure IDMA_FORCE_RESET(Slot:word);stdcall;
procedure IDMA_GET_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);stdcall;
function IDMA_GET_DM_WORD(Slot:word; Addr:word):word;stdcall;
procedure IDMA_PUT_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);stdcall;
procedure IDMA_PUT_DM_WORD(Slot:word; Addr:word; xData:word);stdcall;
procedure LC212_COLD_REBOOT(xSlot:word);stdcall;
function LOAD_LC212(Slot:word; var FileName):word;stdcall;
procedure RESET_LC212_AD7730(xSlot:word);stdcall;
procedure RESTORE_LC212(xSlot:word);stdcall;
procedure SET_FIFO_SIZE_LC212(xSlot:word; xLen:word);stdcall;
procedure SET_MODE_LC212(Slot:word; Mode:word; HiRef:word; FreqCode:word; AC:word
);stdcall;
procedure START_LC212(Slot:word; Mask:word; IsUseFlash:word);stdcall;
procedure STOP_LC212(Slot:word);stdcall;
procedure WRITEPM_V(Address:cardinal; Value:cardinal);stdcall;
procedure STOP_LC212_FOR_CALIBR(xSlot:word; StopCalibrType:word);stdcall;
procedure CONFIGURE_FAST_KADR_CC(Nch:smallint; var Buffer; ModuleType:word);stdcall;
procedure OUTDA_LC352(slot:word; Coded:word; Atten:word; SwType:word);stdcall;
procedure OUTDA_LC352_VOLT(slot:word; Volts:double; Atten:word; SwType:word);stdcall;
function PROGRAM_LC352(Slot:word; Ampl:double; ModeConnect:word; var Freq; 
Sigtype:word; 
var Atten; 
a:word; 
b:word
):word;stdcall;
procedure READ_FAST_KADR111_CC(NCH111:word; var Buffer);stdcall;
procedure SETU_LC352(U:double);stdcall;
procedure GET_FILTERS_INFO_LC212(xSlot:word; var xIirOn; var xFirOn; var xDec; var xloadIir; 
var xloadFir; 
var xtaps
);stdcall;
function LOAD_FILTER_LC212(xSlot:word; FilterType:word; var FilterFileName):word;stdcall;
procedure MANAGE_FILTERS_LC212(xSlot:word; xIirOn:word; xFirOn:word);stdcall;
procedure RESET_DIGITAL_FILTERS_LC212(xSlot:word);stdcall;
procedure RESET_POINTER_LC212(xSlot:word);stdcall;
function GET_LC114_DATA_FOR_CHANNEL(Slot:word; FifoLength:word; Lc114Nch:word; N:word; 
var BufferLc114; 
Lc114Channel:word; 
CodacBit:word
):word;stdcall;
function GET_LC114_DS1820_TEMP(Slot:word):double;stdcall;
function GET_LC114_MODULE_TEMP(Slot:word):double;stdcall;
function LOAD_BIOS_LC114(Slot:word; var NameBIOS):word;stdcall;
function READY_LC114_SAMPLES(Slot:word; SlotLC114_1:word; SlotLC114_2:word):word;stdcall;
procedure SEND_COMMAND_LC114(Slot:word; Command:word; Wait:word);stdcall;
function SET_LC114_CALIBR(Slot:word; WaitNewSamples:word):word;stdcall;
procedure SET_LC114_CONTROL_WORDS(Slot:word; Lc114AutoCalibrType:word; Lc114CommutatorType:word; var pLc114Range; 
WaitNewSamples:word
);stdcall;
procedure SET_LC114_DECIMATION(Slot:word; Decimate:word; WaitNewSamples:word);stdcall;
procedure SET_LC114_FIFO(Slot:word; MaskForChannels:word; FifoLength:word; WaitNewSaples:word
);stdcall;
function SET_LC114_FILTER(Slot:word; var FileName; var NormalizatorName; WaitNewSaples:word
):word;stdcall;
procedure SET_LC114_PROGRAM_VERSION(Slot:word; Version:word; WaitNewSamples:word);stdcall;
procedure SHOW_SELF_SLAVE_FOR_LC114_UNIT2(Slot:word; SlotLC114_1:word; SlotLC114_2:word);stdcall;
procedure START_MASTER_LC114(Slot:word; SlotLC114_1:word; SlotLC114_2:word; WaitNewSamples:word
);stdcall;
function CHECK_OVERFLOW_LC202(Slot:word; Channel:word):word;stdcall;
function FIFO_CONFIG_LC202(Slot:word; AddressIndex:word; Length:word):word;stdcall;
function FLASH_READ_LC202(Slot:word; FAddress:word; var FByte):word;stdcall;
function FLASH_WRITE_LC202(Slot:word; FAddress:word; FByte:word):word;stdcall;
function GET_DATA_LC202(Slot:word; N_Points:word; var Buffer):word;stdcall;
function GET_FI_LC202(Slot:word; var FI):word;stdcall;
function LOAD_BIOS_LC202(Slot:word; var NameBIOS):word;stdcall;
function LOAD_COEF_LC202(Slot:word):word;stdcall;
function SEND_COMMAND_LC202(Slot:word; Command:word):word;stdcall;
function SET_ATTENUATION_LC202(Slot:word; Attenuation:word):word;stdcall;
function SET_DSP_TYPE_LC202(Slot:word; DSP_Type:word):word;stdcall;
function SET_FO_LC202(Slot:word; FO:word):word;stdcall;
function SET_GAIN_LC202(Slot:word; Gain:word; Channel:word):word;stdcall;
function SET_INPUT_MODE_LC202(Slot:word; InputMode:word):word;stdcall;
function SET_POSTOYANKA_LC202(Slot:word; ConstLevel:word):word;stdcall;
function SET_RATE_LC202(Slot:word; Rate:word; FreqDiv_256or384:word):word;stdcall;
function SYNCHRO_CONFIG_LC202(Slot:word; SynType:word; SynSens:word; SynBuf:word; SynMode:word; 
AdCh:word; 
AdP:word
):word;stdcall;
function TEST_CIRCUIT_LC212(xSlot:word; var States):word;stdcall;
procedure XIDMA_GET_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);stdcall;
function XIDMA_GET_DM_WORD(Slot:word; Addr:word):word;stdcall;
procedure XIDMA_PUT_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);stdcall;
procedure XIDMA_PUT_DM_WORD(Slot:word; Addr:word; xData:word);stdcall;
procedure IDMA301_CONFIG_CC(Slot_301:word; NChannel:word; var Channels; Rate:word; 
xFifoSize:word; 
var NModulesIdma; 
var TableEnaAddr; 
var TableMainIDMA
);stdcall;
procedure IDMA301_IRQ_INPUT_CC(var xPointers; var xFlags);stdcall;
function IDMA301_IRQ_START_CC(Vector:pointer):THANDLE;stdcall;
procedure IDMA301_IRQ_STOP_CC;stdcall;
procedure IDMA301_PREPARE_LC212(xSlot:word; var TableEnaAdr; var TableMain);stdcall;
procedure SET_ENA_FLAG_LC212(xSlot:word; EnaFlag:word);stdcall;
procedure IDMA301_INPUT_CC(var Datad; var IDs);stdcall;
procedure IDMA301_START_CC;stdcall;
procedure IDMA301_STOP_CC;stdcall;
function GET_LPT_DELAY_CC:word;stdcall;
procedure SET_LPT_DELAY_CC(DelayVal:word);stdcall;
procedure IDMA301_PREPARE_LC202(xSlot:word; var TableEnaAdr; var TableMain);stdcall;
procedure CONFIG_LC302_ON_FLY(xNwrd:word; var xData);stdcall;
function LOAD_BIOS_LCIDE(var FileName):integer;stdcall;
procedure SET_BASE_ADDRESS_IDE(BaseAddrData:integer; BaseAddrCtrl:integer);stdcall;
procedure SET_DELAY_IDE(DelayValue:integer);stdcall;
procedure MAIN_INP111_OUT302(var Datad; NWords:word; var Data302; N302:word);stdcall;
function START_INP111_OUT302(Vector:pointer):THANDLE;stdcall;
procedure STOP_INP111_OUT302;stdcall;
function GET_BASE_ADDRESS:integer;stdcall;
procedure HANDL_SET_LC116_CURRENT(Slot:integer; Scale:integer; Channel:integer; CalibrData:integer
);stdcall;
function READ_LC116_CALIBR(Slot:integer; var Data):integer;stdcall;
function SET_LC116_CURRENT(Slot:integer; Scale:integer; Channel:integer):integer;stdcall;
procedure WRITE_LC116_CALIBR(Slot:integer; var Data);stdcall;
function GET_LC114_DATA_FOR_CHANNELS(Slot:word; FifoLength:word; Lc114Nch:word; N:word; 
var BufferLc114; 
CodacBit:word
):word;stdcall;
function LC114_CHECK_FIFO(Slot:smallint):smallint;stdcall;
function LC114_GET_ADC_TYPE(Slot:smallint):smallint;stdcall;
function LC114_GET_CDATA1(Slot:smallint; NC:smallint):smallint;stdcall;
procedure LC114_GET_CDATA16(Slot:smallint; var CData);stdcall;
function LC114_GET_DS1820(Slot:smallint):double;stdcall;
procedure LC114_GET_FIFO(Slot:smallint; var FIFO_Buf; half:smallint);stdcall;
function LC114_GET_FIFO_POINTER(Slot:smallint):smallint;stdcall;
function LC114_LOAD_BIOS(Slot:word; var Bios_Name):smallint;stdcall;
procedure LC114_LOAD_CALIBRATION_COEF(Slot:smallint);stdcall;
function LC114_LOAD_FILTR(Slot:smallint; var Filtr_Name):smallint;stdcall;
function LC114_PUT_DQI_HIGH(Slot:smallint):smallint;stdcall;
function LC114_PUT_DQI_LOW(Slot:smallint):smallint;stdcall;
procedure LC114_SET_BOARD_MODE(Slot:smallint; Mode:smallint);stdcall;
procedure LC114_SET_CALIBRATION_COEF(Slot:smallint; var CalibrCoef);stdcall;
procedure LC114_SET_CBAND1(Slot:smallint; Nc:char; CBand:char);stdcall;
procedure LC114_SET_CBAND16(Slot:smallint; var CBands);stdcall;
procedure LC114_SET_CMASK(Slot:smallint; CMask:word);stdcall;
procedure LC114_SET_DECIMATION(Slot:smallint; Dec_K:smallint);stdcall;
procedure LC114_SET_FIFO(Slot:smallint; FIFO_Size:smallint);stdcall;
procedure LC114_SET_FILTR(Slot:smallint; FiltrFlag:char);stdcall;
procedure LC114_SET_ZCALIBRATION(Slot:smallint; CalibrFlag:char);stdcall;
function LC114_START(Slot:smallint):smallint;stdcall;
function LC114_STOP(Slot:smallint):smallint;stdcall;
function LC114_WRITE_FLASH(Slot:smallint; var CalibrCoef):smallint;stdcall;
function LC114_CHECK_TC(Slot:smallint):word;stdcall;
function GET_SERR:dword;stdcall;
procedure RST_SERR(Val:dword);stdcall;
procedure LOAD_DATA_LC352_BY8192(Slot:word; DatSz:word; ShiftVal:word; var Datax);stdcall;

implementation

procedure SELECT_SLOT(Slot:integer);external 'LCARD_32.DLL';
function PLATA_TEST:integer;external 'LCARD_32.DLL';
procedure SET_BOARD_TYPE(BoardType:integer);external 'LCARD_32.DLL';
function GET_BOARD_TYPE:integer;external 'LCARD_32.DLL';
procedure SET_BASE_ADDRESS(Address:integer);external 'LCARD_32.DLL';
procedure ENABLE_INT(_IntEnabled:integer);external 'LCARD_32.DLL';
function CREATE_CHANNEL(Channel:integer; Usil:integer; Mode:integer):word;external 'LCARD_32.DLL';
function MEMORY_STATE:integer;external 'LCARD_32.DLL';
function MEMORY_PM_STATE:integer;external 'LCARD_32.DLL';
procedure SET_INTER_DELAY(delay_value:integer);external 'LCARD_32.DLL';
procedure SET_ADSP_SPEED(DspType:integer);external 'LCARD_32.DLL';
procedure SET_WAIT_STATE(wait_state:integer);external 'LCARD_32.DLL';
procedure SET_TIMER_SCALE(ScaleValue:integer);external 'LCARD_32.DLL';
procedure TIMER_L154_L164(TimerNumber:integer; Mode:integer; Rate:integer);external 'LCARD_32.DLL';
procedure WAIT_TICK_L154_L164(TimerNumber:integer);external 'LCARD_32.DLL';
function GET_TIMER_L154_L164:integer;external 'LCARD_32.DLL';
procedure CALIBRATION;external 'LCARD_32.DLL';
procedure INIT_COMPARATOR(Channel:integer; Porog:integer; BitNPoint:integer; HandleMode:integer
);external 'LCARD_32.DLL';
procedure LOW_POWER(ModeReg:integer);external 'LCARD_32.DLL';
function GET_SLOT_CODE(CraitNumber:integer; ModuleNumber:integer):integer;external 'LCARD_32.DLL';
procedure RESET_ALL;external 'LCARD_32.DLL';
function MAKE_CHANNEL(CraitNumber:integer; ModuleNumber:integer; Chan:integer; 
Kadrr:integer; 
Usil:integer
):word;external 'LCARD_32.DLL';
procedure PROGRAM_FILTER(CraitNumber:integer; ModuleNumber:integer; CutFrequency:integer; 
AnalogFilterType:integer
);external 'LCARD_32.DLL';
procedure PROGRAM_LM_201(CraitNumber:integer; ModuleNumber:integer; Chan:integer; 
Usil1:integer; 
Source:integer
);external 'LCARD_32.DLL';
procedure PROGRAM_LM_102(CraitNumber:integer; ModuleNumber:integer; Usil1:integer
);external 'LCARD_32.DLL';
procedure PROGRAM_LM_501(CraitNumber:integer; ModuleNumber:integer; M3:integer; 
M2:integer; 
M1:integer; 
EN:integer; 
EP:integer; 
AN:integer; 
AP:integer
);external 'LCARD_32.DLL';
procedure PROGRAM_LM_DAC(CraitNumber:integer; ModuleNumber:integer; Mode:integer; 
Coded:integer; 
DacCh:integer
);external 'LCARD_32.DLL';
function GET_LM_401(CraitNumber:integer; ModuleNumber:integer):integer;external 'LCARD_32.DLL';
function LM_404(Coded:word):word;external 'LCARD_32.DLL';
procedure PROGRAM_LM_TTLOUT(CraitNumber:integer; ModuleNumber:integer; Coded:word
);external 'LCARD_32.DLL';
procedure SETCHANNEL(Channel:word);external 'LCARD_32.DLL';
function SAMPLE:word;external 'LCARD_32.DLL';
function ADCHAN(Chan:word):word;external 'LCARD_32.DLL';
procedure KADR(var Datad; var Chans; Nch:integer);external 'LCARD_32.DLL';
procedure STREAM(var Datad; Npoint:integer; Chan:word; Rate:integer);external 'LCARD_32.DLL';
procedure SOFT(var Datad; Nkadr:integer; var Chan; Nch:integer; Rate:integer
);external 'LCARD_32.DLL';
procedure SOFT_HUGE(var Datad; Nkadr:dword; var Chan; Nch:integer; Rate:integer
);external 'LCARD_32.DLL';
procedure DMAONE(var Datad; Npoint:integer; Chan:integer; Rate:integer; 
Dmm:integer
);external 'LCARD_32.DLL';
procedure DMAALL(var Datad; Nkadr:integer; var Chan; Nch:integer; Rate:integer; 
Dmm:integer
);external 'LCARD_32.DLL';
procedure DMA_ALL_DA(var AdDatad; AdNkadr:integer; var Chan; Nch:integer; Rate:integer; 
AdDmm:integer; 
var DaDatad; 
DaNkadr:integer; 
DaDmm:integer; 
DaNumber:integer
);external 'LCARD_32.DLL';
procedure OUTDA(Coded:integer);external 'LCARD_32.DLL';
procedure SET_DA_NUMBER(SoftDaMode:integer; DaNumber:integer);external 'LCARD_32.DLL';
procedure STREAM_OUTDA(Coded:word);external 'LCARD_32.DLL';
procedure DASTREAM(Rate:integer; Npoint:integer; var Datad);external 'LCARD_32.DLL';
procedure DASTREAM_HUGE(Rate:integer; Npoint:dword; var Datad);external 'LCARD_32.DLL';
procedure DADMASTREAM(var Datad; Npoint:integer; Rate:integer; Dmm:integer
);external 'LCARD_32.DLL';
procedure OUTBYTE(CodeVal:integer);external 'LCARD_32.DLL';
function INPBYTE:integer;external 'LCARD_32.DLL';
function DSP_INPBYTE:integer;external 'LCARD_32.DLL';
procedure DSP_OUTBYTE(CodeVal:integer);external 'LCARD_32.DLL';
procedure INTR_SETUP(Number:integer);external 'LCARD_32.DLL';
procedure STOP_INTR;external 'LCARD_32.DLL';
procedure RESET_IRQ;external 'LCARD_32.DLL';
function INIT_SIMPLE_INTR(Rate:integer; Rate1:integer; Vector:pointer):THANDLE;external 'LCARD_32.DLL';
function STREAM_INTR(Rate:integer; Vector:pointer; Chan:word):THANDLE;external 'LCARD_32.DLL';
function SOFT_INTR(Rate:integer; Vector:pointer; var Chan; Nch:integer):THANDLE;external 'LCARD_32.DLL';
function READ_DATA:integer;external 'LCARD_32.DLL';
function DATA_READY:integer;external 'LCARD_32.DLL';
procedure SYNCHRO_MODE(SMode:integer; TtlMask:integer; AdChannel:word; AdValue:word
);external 'LCARD_32.DLL';
procedure SOFT_MEMORY_START(Nkadr:dword; var Chan; Nch:integer; Rate:integer; PageNumber:integer; 
OffsetNumber:integer; 
RestartMode:integer
);external 'LCARD_32.DLL';
function TEST_FOR_INPUT_END:integer;external 'LCARD_32.DLL';
procedure GET_INPUT_DATA(var Datad; Npoint:integer);external 'LCARD_32.DLL';
procedure SOFT_MEMORY_RESTART;external 'LCARD_32.DLL';
procedure DMA_OFF;external 'LCARD_32.DLL';
function DMA_TEST:integer;external 'LCARD_32.DLL';
function DMA_COUNTER_IN:integer;external 'LCARD_32.DLL';
function DMA_COUNTER_OUT:integer;external 'LCARD_32.DLL';
procedure GET_BUFFER(var Data);external 'LCARD_32.DLL';
function GET_BUFFER_HALF(var Data):integer;external 'LCARD_32.DLL';
procedure PUT_BUFFER(var Data);external 'LCARD_32.DLL';
function PUT_BUFFER_HALF(var Data):integer;external 'LCARD_32.DLL';
procedure CONFIG_FIFO(fifo_mode:integer);external 'LCARD_32.DLL';
procedure CONFIG_2FIFO_TYPE(fifo_type:integer; fifo_length:integer);external 'LCARD_32.DLL';
procedure READ_FIFO(var Datad; Npoint:integer);external 'LCARD_32.DLL';
function STREAM_FIFO2_BEGIN(Rate:integer; Vector:pointer; var Chan; Nch:integer):THANDLE;external 'LCARD_32.DLL';
procedure GET_DIGITS_1056(Chan:integer; var Data);external 'LCARD_32.DLL';
procedure OUT_DIGITS_1056(Data:integer);external 'LCARD_32.DLL';
procedure STREAM_1056(var Datad; NKadr:integer; Chan:integer; Rate:integer);external 'LCARD_32.DLL';
procedure STREAM_DMA_1056(var Datad; Nkadr:integer; Chan:integer; Rate:integer; Dmm:integer
);external 'LCARD_32.DLL';
procedure OUT_STREAM_1056(var Datad; NPoint:integer; Rate:integer);external 'LCARD_32.DLL';
procedure OUT_STREAM_DMA_1056(var Datad; Npoint:integer; Rate:integer; Dmm:integer
);external 'LCARD_32.DLL';
function INIT_INTR_1056(Rate:integer; Chan:integer; Vector:pointer):THANDLE;external 'LCARD_32.DLL';
procedure SET_SYNCHRO_MODE_1056(s_mode:integer; s_number:integer; s_mask:integer);external 'LCARD_32.DLL';
procedure ZERO_MODE_1208(Mode:integer);external 'LCARD_32.DLL';
procedure OUTDA_1208(Coded:word; DacNumber:integer);external 'LCARD_32.DLL';
procedure KADR_1208(Nch:integer; var Datad; var DacNumber);external 'LCARD_32.DLL';
procedure SOFT_1208(var Datad; NPoint:integer; var DacNumber; NCh:integer; 
Rate:integer
);external 'LCARD_32.DLL';
procedure SOFT_FON_1208(var Datad; NPoint:integer; var DacNumber; NCh:integer; 
Rate:integer
);external 'LCARD_32.DLL';
procedure DMASOFT_1208(var Datad; NPoint:integer; var DacNumber; Nch:integer; 
Rate:integer; 
Dmm:integer
);external 'LCARD_32.DLL';
function SOFT_INTR_1208(Rate:integer; Vector:pointer; NCh:integer):THANDLE;external 'LCARD_32.DLL';
function GET_DATA:integer;external 'LCARD_32.DLL';
procedure PUT_DATA(Data:word);external 'LCARD_32.DLL';
procedure READ_INT_MEMORY(var Datad; Page:integer; StartAddr:integer; NWords:integer
);external 'LCARD_32.DLL';
procedure WRITE_INT_MEMORY(var Datad; Page:integer; StartAddr:integer; NWords:integer
);external 'LCARD_32.DLL';
function LOADBIOS(var FileName; LoadMode:cardinal):integer;external 'LCARD_32.DLL';
procedure POWER_AND_PRINTER_E330(ModePower:integer; ModePrinter:integer);external 'LCARD_32.DLL';
procedure SET_EPP_MODE_E330(aEppMode:integer);external 'LCARD_32.DLL';
procedure SET_FIFO_PARAMETERS_E330(FifoSize:integer; FifoMode:integer);external 'LCARD_32.DLL';
procedure SET_SOFT_PARM_E330(Nch:integer; var Channels);external 'LCARD_32.DLL';
procedure SET_TIME_PARAMETERS_E330(Rate:cardinal);external 'LCARD_32.DLL';
procedure TIMER_INPUT_START_E330;external 'LCARD_32.DLL';
procedure STOP_FUNC_E330;external 'LCARD_32.DLL';
procedure TIMER_INPUT_E330(var Datad; NWords:integer);external 'LCARD_32.DLL';
procedure SOFT_MEMORY_PREPARE_E330(Nkadr:dword; PageNumber:integer; OffsetNumber:integer; RestartMode:integer
);external 'LCARD_32.DLL';
procedure SOFT_MEMORY_START_E330;external 'LCARD_32.DLL';
function TIMER_INPUT_IRQ_START_E330(Vector:pointer):THANDLE;external 'LCARD_32.DLL';
function IRQ_SLOW_START_E330(IrqPeriod:integer; Vector:pointer):THANDLE;external 'LCARD_32.DLL';
procedure SET_TEST_SPEED_MODE_E330(TestMode:integer);external 'LCARD_32.DLL';
procedure WRITE_BY_ADDRESS_E330(Address:integer; Data:word);external 'LCARD_32.DLL';
function READ_BY_ADDRESS_E330(Address:integer):word;external 'LCARD_32.DLL';
procedure BOARD_SPECIFIC_INIT(LowPowerMode:integer);external 'LCARD_32.DLL';
procedure SELECT_BOARD(Board:integer);external 'LCARD_32.DLL';
procedure SETBASEADDRESS(Address:integer);external 'LCARD_32.DLL';
procedure EXEC_ADSP_COMMAND(Command:integer; NWordsOut:integer; var WordsOut; NWordsIn:integer; 
var WordsIn
);external 'LCARD_32.DLL';
function GET_STATUS:integer;external 'LCARD_32.DLL';
procedure ALLOCATEBUFFER(Size:dword; var PLinear; var PPhysical);external 'LCARD_32.DLL';
procedure CONFIG_TX_CHANNEL_LCI01(Channel:integer);external 'LCARD_32.DLL';
procedure FREEBUFFER(var Linear);external 'LCARD_32.DLL';
procedure GET_HALF_FIFO(var Datad; NPoint:integer; Mode:integer);external 'LCARD_32.DLL';
procedure GET_INPUT_POINTS(var Datad);external 'LCARD_32.DLL';
function QADCHAN(Chan:word):word;external 'LCARD_32.DLL';
function LOADBIOSFROMARRAY_L1211(var BiosCode):integer;external 'LCARD_32.DLL';
procedure INIT_CORRECTION_LC302(Type_:word);external 'LCARD_32.DLL';
procedure QSOFT(var Datad; Rate:cardinal);external 'LCARD_32.DLL';
procedure RESERVED2(var p1; p2:integer; p3:integer);external 'LCARD_32.DLL';
procedure READ_CALIBR_CC;external 'LCARD_32.DLL';
procedure CONFIG_RX_CHANNEL_LCI01(Channel:integer);external 'LCARD_32.DLL';
procedure SELECT_DEVICE(DeviceNumber:integer);external 'LCARD_32.DLL';
procedure SET_AD_MODE(Mode:integer);external 'LCARD_32.DLL';
procedure CONFIGURE_FAST_READ_CC(Nch:smallint; var FastLogChanBuff);external 'LCARD_32.DLL';
procedure SET_CHANNELS(Nch:word; Single:word);external 'LCARD_32.DLL';
procedure INITIALIZE_CORRECTION_PC(CalibrMode:word);external 'LCARD_32.DLL';
procedure SET_DAC_BUFER_E330(Npoint:integer; var Data);external 'LCARD_32.DLL';
procedure SET_TIME(Rate:integer; Scale:integer; Epocha:integer);external 'LCARD_32.DLL';
procedure SET_FAST_PARAMS_CC(Slot301:smallint; DACDelayValue:smallint; NChannel:smallint
);external 'LCARD_32.DLL';
procedure START_LOOP_DAC_E330;external 'LCARD_32.DLL';
procedure STOP_INPUT;external 'LCARD_32.DLL';
procedure TIMER_INPUT;external 'LCARD_32.DLL';
function TIMER_INPUT_INTR(Vector:pointer):THANDLE;external 'LCARD_32.DLL';
procedure RESERVED4(var p1; p2:integer; p3:integer);external 'LCARD_32.DLL';
procedure GET_TABLE(var Table; NWords:integer);external 'LCARD_32.DLL';
procedure CONFIG_LC227(Slot:integer; Mode:integer; Scale:integer);external 'LCARD_32.DLL';
procedure GET_SAMPLE_LC227(Slot:integer; Chan:integer; var Dest);external 'LCARD_32.DLL';
function STATUS_LC227(Slot:integer):word;external 'LCARD_32.DLL';
procedure GET_KADR_LC227(Slot:integer; Mask:integer; var NWords; var DestInt);external 'LCARD_32.DLL';
function LOAD_BIOS_LC227(Slot:integer; var BiosCode):integer;external 'LCARD_32.DLL';
function GET_ERROR_HANDLER:PTErrorHandler;external 'LCARD_32.DLL';
function GET_TIMEOUT:dword;external 'LCARD_32.DLL';
function PLATA_TEST_CC:integer;external 'LCARD_32.DLL';
function MEMORY_STATE_CC:integer;external 'LCARD_32.DLL';
function MEMORY_PM_STATE_CC:integer;external 'LCARD_32.DLL';
procedure EXECUTE_COMMAND_CC(Code:integer; NWordsOut:integer; var WordsOut; NWordsIn:integer; 
var WordsIn
);external 'LCARD_32.DLL';
procedure SET_CALIBR_MODE_CC(CalibrMode:integer);external 'LCARD_32.DLL';
procedure SET_ERROR_HANDLER(NewErrorHandler:PTErrorHandler);external 'LCARD_32.DLL';
procedure OUTDA_LC301(Slot:integer; Code1:integer; Code2:integer);external 'LCARD_32.DLL';
function SAMPLE_LC301(Slot_301:integer; SourceSlot:integer; LogChannel:integer):word;external 'LCARD_32.DLL';
function SAMPLE_LC111(Slot_111:integer; LogChannel:integer):word;external 'LCARD_32.DLL';
procedure SET_FIFO_SIZE_CC(FifoSize:integer);external 'LCARD_32.DLL';
procedure CONFIG_FIFO_CC(FirstFifoPage:integer; LastFifoPage:integer);external 'LCARD_32.DLL';
procedure SOFT_CONFIG_CC(Slot_301:integer; NChannel:integer; var Channels; Rate:integer
);external 'LCARD_32.DLL';
procedure SOFT_START_CC;external 'LCARD_32.DLL';
procedure SOFT_STOP_CC;external 'LCARD_32.DLL';
function GET_NWORDS_CC(var NWords):integer;external 'LCARD_32.DLL';
procedure GET_SOFT_DATA_CC(var Datad; NWords:dword);external 'LCARD_32.DLL';
procedure SOFT_CC(Slot_301:integer; NChannel:integer; var Channels; NKadr:dword; 
Rate:integer; 
var Datad
);external 'LCARD_32.DLL';
function FAST_SOFT_IRQ_START_CC(Vector:pointer):THANDLE;external 'LCARD_32.DLL';
procedure GET_FAST_SOFT_DATA(var Datad; NWords:integer);external 'LCARD_32.DLL';
procedure FAST_SOFT_START_CC;external 'LCARD_32.DLL';
procedure GET_FAST_SOFT_IRQ_DATA(var Datad; NWords:integer);external 'LCARD_32.DLL';
procedure FAST_SOFT_IRQ_STOP_CC;external 'LCARD_32.DLL';
procedure WAIT_SOFT_DATA_CC(var Datad; NWords:dword);external 'LCARD_32.DLL';
function GET_CTRL_LC301(Slot:integer):integer;external 'LCARD_32.DLL';
procedure SET_CTRL_LC301(Slot:integer; CtrlWord:integer);external 'LCARD_32.DLL';
procedure READ_REG_7710(Chan:integer; A0:integer; var Datad);external 'LCARD_32.DLL';
procedure WRITE_REG_7710(Chan:integer; A0:integer; var Datad);external 'LCARD_32.DLL';
function LOAD_BIOS_LC351(Slot:integer; var BiosCode):integer;external 'LCARD_32.DLL';
function MEMORY_STATE_LC351(Slot:integer):integer;external 'LCARD_32.DLL';
procedure SET_CTRL_LC351(Slot:integer; AttenMode:integer; CommutMode:integer);external 'LCARD_32.DLL';
procedure OUTDA_LC351(Slot:integer; Coded:integer);external 'LCARD_32.DLL';
procedure LOAD_DATA_LC351(Slot:integer; Page:integer; NWords:integer; var Datad
);external 'LCARD_32.DLL';
procedure START_OUT_LC351(Slot:integer; NWords:longint; Delay:integer);external 'LCARD_32.DLL';
function LOAD_BIOS_LC451(Slot:integer; var BiosCode):integer;external 'LCARD_32.DLL';
function INP_DIGITS_401(Slot:integer):word;external 'LCARD_32.DLL';
procedure ENABLE_IRQ_401(Slot:integer; Enable:integer);external 'LCARD_32.DLL';
procedure OUT_DIGITS_402(Slot:integer; Data:word);external 'LCARD_32.DLL';
procedure ENABLE_IRQ_402(Slot:integer; Enable:integer);external 'LCARD_32.DLL';
procedure OUT_DIGITS_403(Slot:integer; Data:dword);external 'LCARD_32.DLL';
function INP_DIGITS_403(Slot:integer):dword;external 'LCARD_32.DLL';
procedure ENABLE_IRQ_403(Slot:integer; Enable:integer);external 'LCARD_32.DLL';
procedure ENABLE_OUT_403(Slot:integer; EnableMask:integer);external 'LCARD_32.DLL';
function READ_IO_403(Slot:integer):integer;external 'LCARD_32.DLL';
procedure RESET_ANSW_403(Slot:integer);external 'LCARD_32.DLL';
procedure PROGRAM_FILTER_LC201(Slot:integer; Freq:longint);external 'LCARD_32.DLL';
procedure PROGRAM_USIL_LC201(Slot:integer; Channel:integer; Kusil:integer);external 'LCARD_32.DLL';
procedure PROGRAM_FILTER_LC210(Slot:integer; Freq:longint);external 'LCARD_32.DLL';
procedure PROGRAM_USIL_LC210(Slot:integer; Channel:integer; Kusil:integer);external 'LCARD_32.DLL';
function READ_FLASH_CC(Slot:cardinal; Addr:cardinal):cardinal;external 'LCARD_32.DLL';
procedure WRITE_FLASH_CC(Slot:integer; Addr:integer; Data:integer);external 'LCARD_32.DLL';
procedure WRITE_EN_DS_CC(Slot:integer; Enable:integer);external 'LCARD_32.DLL';
procedure PUT_REMOTE_WORD_CC(Addr:integer; Data:word);external 'LCARD_32.DLL';
function GET_REMOTE_WORD_CC(Addr:integer):word;external 'LCARD_32.DLL';
procedure PUT_REMOTE_ARRAY_CC(aPage:integer; Addr:integer; NWords:integer; var Datad
);external 'LCARD_32.DLL';
procedure GET_REMOTE_ARRAY_CC(aPage:integer; Addr:integer; NWords:integer; var Datad
);external 'LCARD_32.DLL';
procedure SET_IRQ_MASK_CC(IrqMask:integer);external 'LCARD_32.DLL';
procedure GET_MODULE_IRQ(var IrqCount; var IrqMarkers);external 'LCARD_32.DLL';
procedure SET_TIMEOUT(Value:dword);external 'LCARD_32.DLL';
procedure LOW_POWER_CC(IsLowPower:integer);external 'LCARD_32.DLL';
procedure OUTDA_LC302(Slot:integer; Channel:integer; Datad:integer);external 'LCARD_32.DLL';
procedure KADR_LC302(Slot:integer; var ChanAndData; NChannel:integer);external 'LCARD_32.DLL';
procedure SET_CTRL_LC302(Slot:integer; CtrlWord:integer);external 'LCARD_32.DLL';
procedure PROGRAM_AD8402(Slot:integer; ChanExt:integer; ChanInt:integer; Data:integer
);external 'LCARD_32.DLL';
procedure PROGRAM_MAX(Slot:integer; ChanExt:integer; Data:longint);external 'LCARD_32.DLL';
procedure OUTDA_AD8842(Slot:integer; ChanInt:integer; Datad:integer);external 'LCARD_32.DLL';
procedure RELEASEDMACHANNEL(Channel:cardinal);external 'LCARD_32.DLL';
procedure FORCE_INTER_DELAY_CC(InterDelay:integer);external 'LCARD_32.DLL';
procedure CONNECT_LC501(Slot:integer; Connection:dword);external 'LCARD_32.DLL';
function ADCHAN_L241(LogChannel:integer):longint;external 'LCARD_32.DLL';
procedure SELFCALIBR_L241(LogChannel:integer; Control:longint);external 'LCARD_32.DLL';
procedure SET_INTERFACE_TYPE(aEppMode:integer);external 'LCARD_32.DLL';
procedure SET_DEVICE_BINDING(InterfaceDevice:integer);external 'LCARD_32.DLL';
procedure SET_CRAIT_ADDRESS(aBase:integer);external 'LCARD_32.DLL';
procedure GET_INI_SETTINGS;external 'LCARD_32.DLL';
procedure CONFIG_LC451(Slot:integer; Mode:integer; Scale:integer);external 'LCARD_32.DLL';
function STATUS_LC451(Slot:integer):word;external 'LCARD_32.DLL';
procedure GET_SAMPLE_LC451(Slot:integer; Chan:integer; var Dest);external 'LCARD_32.DLL';
procedure GET_KADR_LC451(Slot:integer; Mask:integer; var NWords; var DestInt);external 'LCARD_32.DLL';
procedure SET_THRESHOLD_LC451(Slot:integer; Chan:integer; Typ_:integer; Val:integer
);external 'LCARD_32.DLL';
procedure SET_IRQ_INFOM_CC(NumCraitSlots:integer; var InfArr);external 'LCARD_32.DLL';
procedure SET_LC227DATA_IRQSET_CC;external 'LCARD_32.DLL';
procedure GET_IRQ1DATA_CC(Slot:integer; NWords:integer; var DatArr);external 'LCARD_32.DLL';
function GET_LC227CHMASK(Slot:integer; ShiftVal:integer):word;external 'LCARD_32.DLL';
procedure REQUESTDMACHANNEL(var Data; NPoint:cardinal; Channel:cardinal; Dmm:cardinal
);external 'LCARD_32.DLL';
function CALIBRLC201_STEP1_BEG(aSlot_201:integer; aSlot_301:integer):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP1_CYCLE(aChannel:integer; aGain:integer; var Value):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP1_FIN(var NameOfClbFile):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP2_BEG(aSlot_201:integer; aSlot_301:integer):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP2_CYCLE_CHANV0(aChannel:integer; var ValueExpected; var ValueMeasured):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP2_CYCLE_CHANV5(aChannel:integer; var ValueExpected; var ValueMeasured):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP2_CYCLE_CHANZG(aChannel:integer; var Values; var OffsetValue; var GainValue
):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP2_CYCLE_GAIN(aGain:integer; var NameClbFile):integer;external 'LCARD_32.DLL';
function CALIBRLC201_STEP2_FIN(var FileName):integer;external 'LCARD_32.DLL';
procedure CALIBR_LC201_STEP1(Slot201:integer; Slot301:integer);external 'LCARD_32.DLL';
function CALIBR_LC201_STEP2(Slot201:integer; Slot301:integer):integer;external 'LCARD_32.DLL';
function GET_DFLTCALIBRSET_LC201(var xFltFreq; var xForceIntDel; var xnGains; var xckdFile; 
var Ku; 
var xTimeDAC; 
var xNPoint
):integer;external 'LCARD_32.DLL';
procedure SETU_LC301(Slot_301:integer; U:double);external 'LCARD_32.DLL';
function SET_DFLTCALIBRSET_LC201(xFltFreq:longint; xForceIntDel:integer; xnGains:integer; var xckdFile; 
var Ku; 
xTimeDAC:integer; 
xNPoint:integer
):integer;external 'LCARD_32.DLL';
procedure SET_TRIM_DAC_LC201_FILE(Slot_201:integer; Chan:integer; Gain:integer; var NameClbFile
);external 'LCARD_32.DLL';
procedure READ_REG_7710_CRAIT(Slot:integer; A0:integer; var Datad);external 'LCARD_32.DLL';
procedure WRITE_REG_7710_CRAIT(Slot:integer; A0:integer; var Datad);external 'LCARD_32.DLL';
function CHECK_OVERFLOW_7710_CRAIT:integer;external 'LCARD_32.DLL';
procedure ENABLE_7710_CRAIT(Slot:integer; Mode:integer);external 'LCARD_32.DLL';
function FINISH_READ_7710_CRAIT(Slot_301:integer):double;external 'LCARD_32.DLL';
function FINISH_READ_CODE_7710_CRAIT(Slot_301:integer):longint;external 'LCARD_32.DLL';
function IS_7710_PRESENT_CRAIT(Slot_301:integer):integer;external 'LCARD_32.DLL';
function IS_7710_READY_CRAIT(Slot_301:integer):integer;external 'LCARD_32.DLL';
function READ_7710_CRAIT(Slot_301:integer):double;external 'LCARD_32.DLL';
function READ_CODE_7710_CRAIT(Slot_301:integer):longint;external 'LCARD_32.DLL';
procedure RESET_FILTER_7710_CRAIT;external 'LCARD_32.DLL';
procedure SELF_CALIBR_7710_CRAIT(Slot_301:integer; Gain:integer);external 'LCARD_32.DLL';
procedure SET_CHANNEL_7710_CRAIT(Slot_301:integer; ExtChan:integer);external 'LCARD_32.DLL';
function CREATE_CHANNEL_LC201(Channel:integer; Gain:integer; UvxOpened:integer; ConnectDAC:integer
):integer;external 'LCARD_32.DLL';
procedure KADR_LC227(Slot:integer; Scale:integer; Mask:integer; var Dest
);external 'LCARD_32.DLL';
function SET_CALIBRATION_LC227(Slot:integer):integer;external 'LCARD_32.DLL';
procedure SET_CALIBRATION_LC227_ALL;external 'LCARD_32.DLL';
function GET_LC201_CONNECTDAC_MODE:integer;external 'LCARD_32.DLL';
procedure SET_LC201_CONNECTDAC_MODE(aConnectDACMode:integer);external 'LCARD_32.DLL';
procedure INIT_LC201_FROM_FILE(Slot_201:integer; var FileName; CalibrMode:integer; Freq:longint; 
var GainsForChan; 
InterDelayVal:integer; 
aPage1_Fifo:integer; 
aPage2_Fifo:integer
);external 'LCARD_32.DLL';
procedure INIT_LC201_FROM_PPZU(Slot_201:integer; Freq:longint; var GainsForChan; InterDelayVal:integer; 
aPage1_Fifo:integer; 
aPage2_Fifo:integer
);external 'LCARD_32.DLL';
procedure KADR_LC451(Slot:integer; Mode:integer; Scale:integer; Mask:integer; 
var Dest
);external 'LCARD_32.DLL';
procedure INIT_MODULE_LC201(Slot:integer; CalibrMode:integer; Freq:longint; var CurrentModes; 
InterDelayVal:integer; 
aPage1_Fifo:integer; 
aPage2_Fifo:integer
);external 'LCARD_32.DLL';
procedure TRANSMIT_CALIBR_DATA201_TO_PPZU(Slot:integer; var FileName; var GainSet);external 'LCARD_32.DLL';
function IN_BYTE(Port:cardinal):cardinal;external 'LCARD_32.DLL';
function IN_WORD(Port:cardinal):cardinal;external 'LCARD_32.DLL';
function OUT_BYTE(Port:cardinal; Value:cardinal):cardinal;external 'LCARD_32.DLL';
function OUT_WORD(Port:cardinal; Value:cardinal):cardinal;external 'LCARD_32.DLL';
procedure RESET_SYNMODE;external 'LCARD_32.DLL';
procedure SET_SYNMODE_ADC(Slot_301:word; SourceSynSlot:word; LogSynChan:word; SynDir:word; 
SynLevel:word
);external 'LCARD_32.DLL';
procedure SET_SYNMODE_TTL(SMode:word; SynSlot:word; SynChan:word; Dir:word);external 'LCARD_32.DLL';
procedure START_SYNSOFT;external 'LCARD_32.DLL';
procedure SYNSOFT_CC(Slot_301:word; NChannel:word; var Channels; NKadr:word; 
Rate:word; 
var Datad
);external 'LCARD_32.DLL';
function LOADBIOS_MODULE_CC(xSlot:integer; var FileName; ModuleType:integer):integer;external 'LCARD_32.DLL';
function CREATE_CHANNEL_LC101(Channel:integer; Gain:integer; Mode:integer):integer;external 'LCARD_32.DLL';
function CREATE_CHANNEL_LC102(Channel:integer; Gain:integer; Mode:integer):integer;external 'LCARD_32.DLL';
function CREATE_CHANNEL_LC104(Channel:integer; Gain:integer; Mode:integer):integer;external 'LCARD_32.DLL';
function CREATE_CHANNEL_LC111(Channel:integer; Gain:integer; Mode:integer):integer;external 'LCARD_32.DLL';
function CREATE_CHANNEL_LC210(Channel:integer; UvxOpened:integer; BaseChan:integer):integer;external 'LCARD_32.DLL';
procedure DEINSTALLLOGIO;external 'LCARD_32.DLL';
procedure INSTALLLOGIO;external 'LCARD_32.DLL';
function CREATE_CONTROL_WORD_LC302(Slot:smallint; Channel:smallint; Datad:smallint):word;external 'LCARD_32.DLL';
function CREATE_FAST_CHAN_CC(ModuleType:smallint; Slot:smallint; LogChan:word):word;external 'LCARD_32.DLL';
procedure KADR_OUT_LC302_FAST_CC(Slot302:smallint; NChan:smallint; var CtrlWrdBuff);external 'LCARD_32.DLL';
procedure OUT_LC302_FAST_CC(Slot302:smallint; Datad:word);external 'LCARD_32.DLL';
procedure READ_FAST_KADR_CC(Nch:smallint; var Datad);external 'LCARD_32.DLL';
function READ_FAST_SAMPLE_CC(CtrlWrdFast:word):smallint;external 'LCARD_32.DLL';
function LOADCRAIT(CraitType:integer; Adr:integer):integer;external 'LCARD_32.DLL';
function AUTO_PREPARE_MODULE(ModuleCode:smallint):word;external 'LCARD_32.DLL';
function _GET_DATA:word;external 'LCARD_32.DLL';
procedure _PUT_DATA(Data:word);external 'LCARD_32.DLL';
procedure _SEND_COMMAND(Command:word);external 'LCARD_32.DLL';
function FAST_LOADING_LC010(var BiosCode):integer;external 'LCARD_32.DLL';
function FAST_LOADING_LCI01(var BiosCode):integer;external 'LCARD_32.DLL';
procedure COMMAND_L1221(CommandD:cardinal);external 'LCARD_32.DLL';
procedure GET_DATA_MEMORY_L1221(var DataPointer; Count:cardinal; Address:cardinal);external 'LCARD_32.DLL';
function GET_DM_WORD_L1221(Address:cardinal):cardinal;external 'LCARD_32.DLL';
function LOAD_ADSP2186(var BiosCode):cardinal;external 'LCARD_32.DLL';
procedure PUT_DATA_MEMORY_L1221(var DataPointer; Count:cardinal; Address:cardinal);external 'LCARD_32.DLL';
procedure PUT_DM_WORD_L1221(Address:cardinal; DataD:cardinal);external 'LCARD_32.DLL';
function INIT_INTR(Vector:pointer):THANDLE;external 'LCARD_32.DLL';
procedure DELAY(Count:cardinal);external 'LCARD_32.DLL';
procedure SET_DELAY(Value:cardinal);external 'LCARD_32.DLL';
function LOAD_DSP_DM(var FileName):integer;external 'LCARD_32.DLL';
function LOAD_DSP_EXT_PM(var FileName):integer;external 'LCARD_32.DLL';
procedure LOAD_DSP_INT_PM(var BiosCode);external 'LCARD_32.DLL';
function LOAD_INT_PM(var FileName):pointer;external 'LCARD_32.DLL';
procedure RESET_AD_L1221;external 'LCARD_32.DLL';
procedure CONFIG_FIFO_L750(FifoSize:cardinal);external 'LCARD_32.DLL';
procedure CONFIG_INPUT_L750(InputMode:longbool);external 'LCARD_32.DLL';
procedure DISABLE_PLATA_INT_L750;external 'LCARD_32.DLL';
procedure DIS_EEPROM_WRITE_L750;external 'LCARD_32.DLL';
procedure ENABLE_PLATA_INT_L750;external 'LCARD_32.DLL';
procedure ENA_EEPROM_WRITE_L750;external 'LCARD_32.DLL';
function GET_DM_WORD_L750(Address:cardinal):cardinal;external 'LCARD_32.DLL';
function LOAD_BIOS_L750(var BiosCode):longbool;external 'LCARD_32.DLL';
procedure OUTDA_L750(DAC_Val:cardinal);external 'LCARD_32.DLL';
function PLATA_TEST_L750:longbool;external 'LCARD_32.DLL';
procedure PUT_DM_WORD_L750(Address:cardinal; DataD:cardinal);external 'LCARD_32.DLL';
procedure PUT_TRM_BYTE_L750(Address:cardinal; Datad:cardinal);external 'LCARD_32.DLL';
function READ_EEPROM_L750(Address:cardinal):cardinal;external 'LCARD_32.DLL';
procedure RESET_DSP_L750;external 'LCARD_32.DLL';
function SAMPLE_L750:integer;external 'LCARD_32.DLL';
procedure SELECT_INPUT_MODE_L750(Mode:cardinal);external 'LCARD_32.DLL';
procedure SETCHANNEL_L750(Chan:cardinal);external 'LCARD_32.DLL';
procedure SET_DA_NUMBER_L750(DAC_Num:cardinal);external 'LCARD_32.DLL';
procedure SET_REFERENCE_L750(RefVolt:longbool);external 'LCARD_32.DLL';
procedure SET_TIMER_SCALE_L750(Scale:cardinal);external 'LCARD_32.DLL';
procedure SOFT_L750(var DataD; NKadr:dword; var Channels; Nch:cardinal; Rate:cardinal
);external 'LCARD_32.DLL';
procedure STREAM_L750(var DataD; Npoint:dword; Channel:cardinal; Rate:cardinal
);external 'LCARD_32.DLL';
procedure SYNCHRO_MODE_L750(SynchroMode:longbool);external 'LCARD_32.DLL';
procedure TTL_CONFIG_L750(TTL_Mode:cardinal);external 'LCARD_32.DLL';
function TTL_INPUT_L750:cardinal;external 'LCARD_32.DLL';
procedure TTL_OUTPUT_L750(DataD:cardinal);external 'LCARD_32.DLL';
procedure WRITE_DA_L750(DAC_Num:cardinal; DAC_Val:cardinal);external 'LCARD_32.DLL';
procedure WRITE_EEPROM_L750(Address:cardinal; DataD:cardinal);external 'LCARD_32.DLL';
function IN_DWORD(Port:cardinal):dword;external 'LCARD_32.DLL';
function OUT_DWORD(Port:cardinal; Value:dword):dword;external 'LCARD_32.DLL';
procedure REP_IN_BYTE(Port:cardinal; Count:dword; var DataD);external 'LCARD_32.DLL';
procedure REP_IN_DWORD(Port:cardinal; Count:dword; var DataD);external 'LCARD_32.DLL';
procedure REP_IN_WORD(Port:cardinal; Count:dword; var DataD);external 'LCARD_32.DLL';
procedure REP_OUT_BYTE(Port:cardinal; Count:dword; var DataD);external 'LCARD_32.DLL';
procedure REP_OUT_DWORD(Port:cardinal; Count:dword; var DataD);external 'LCARD_32.DLL';
procedure REP_OUT_WORD(Port:cardinal; Count:dword; var DataD);external 'LCARD_32.DLL';
procedure DSP_COMMAND_L750(Command:cardinal);external 'LCARD_32.DLL';
procedure GET_DATA_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);external 'LCARD_32.DLL';
function GET_PM_WORD_L750(Address:cardinal):cardinal;external 'LCARD_32.DLL';
procedure GET_PROGRAM_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);external 'LCARD_32.DLL';
function GET_TRM_BYTE_L750(Address:cardinal):cardinal;external 'LCARD_32.DLL';
function GET_TRM_WORD_L750(Address:cardinal):cardinal;external 'LCARD_32.DLL';
procedure PUT_DATA_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);external 'LCARD_32.DLL';
procedure PUT_PM_WORD_L750(Address:cardinal; DataD:cardinal);external 'LCARD_32.DLL';
procedure PUT_PROGRAM_MEMORY_L750(Address:cardinal; Npoint:cardinal; var DataD);external 'LCARD_32.DLL';
procedure PUT_TRM_DWORD_L750(Datad:dword);external 'LCARD_32.DLL';
procedure PUT_TRM_WORD_L750(Address:cardinal; Datad:cardinal);external 'LCARD_32.DLL';
procedure SETRATE_L750(Rate:cardinal);external 'LCARD_32.DLL';
function SET_ADC_FREQ_L750(Freq:cardinal):cardinal;external 'LCARD_32.DLL';
procedure SET_DATA_ADDRESS_L750(Address:cardinal);external 'LCARD_32.DLL';
function ADCHAN_L750(Chan:cardinal):integer;external 'LCARD_32.DLL';
procedure SPELT_AMPLIFIER_OLD_TIGER(Number:cardinal; Coded:cardinal);external 'LCARD_32.DLL';
procedure SPELT_FILTER_OLD_TIGER(FilterNumber:cardinal; CutFrequency:cardinal);external 'LCARD_32.DLL';
function CALIBR_LC212(xSlot:word; xType:word; IsUseFlash:word):word;external 'LCARD_32.DLL';
procedure CREATE_CHANNEL_LC212(Slot:word; Chan:word; Diapazon:word);external 'LCARD_32.DLL';
function GET_LC212_DATA(xSlot:word; NPoints:word; var xData):word;external 'LCARD_32.DLL';
procedure IDMA_FORCE_IRQ2(xSlot:word);external 'LCARD_32.DLL';
procedure IDMA_FORCE_RESET(Slot:word);external 'LCARD_32.DLL';
procedure IDMA_GET_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);external 'LCARD_32.DLL';
function IDMA_GET_DM_WORD(Slot:word; Addr:word):word;external 'LCARD_32.DLL';
procedure IDMA_PUT_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);external 'LCARD_32.DLL';
procedure IDMA_PUT_DM_WORD(Slot:word; Addr:word; xData:word);external 'LCARD_32.DLL';
procedure LC212_COLD_REBOOT(xSlot:word);external 'LCARD_32.DLL';
function LOAD_LC212(Slot:word; var FileName):word;external 'LCARD_32.DLL';
procedure RESET_LC212_AD7730(xSlot:word);external 'LCARD_32.DLL';
procedure RESTORE_LC212(xSlot:word);external 'LCARD_32.DLL';
procedure SET_FIFO_SIZE_LC212(xSlot:word; xLen:word);external 'LCARD_32.DLL';
procedure SET_MODE_LC212(Slot:word; Mode:word; HiRef:word; FreqCode:word; AC:word
);external 'LCARD_32.DLL';
procedure START_LC212(Slot:word; Mask:word; IsUseFlash:word);external 'LCARD_32.DLL';
procedure STOP_LC212(Slot:word);external 'LCARD_32.DLL';
procedure WRITEPM_V(Address:cardinal; Value:cardinal);external 'LCARD_32.DLL';
procedure STOP_LC212_FOR_CALIBR(xSlot:word; StopCalibrType:word);external 'LCARD_32.DLL';
procedure CONFIGURE_FAST_KADR_CC(Nch:smallint; var Buffer; ModuleType:word);external 'LCARD_32.DLL';
procedure OUTDA_LC352(slot:word; Coded:word; Atten:word; SwType:word);external 'LCARD_32.DLL';
procedure OUTDA_LC352_VOLT(slot:word; Volts:double; Atten:word; SwType:word);external 'LCARD_32.DLL';
function PROGRAM_LC352(Slot:word; Ampl:double; ModeConnect:word; var Freq; 
Sigtype:word; 
var Atten; 
a:word; 
b:word
):word;external 'LCARD_32.DLL';
procedure READ_FAST_KADR111_CC(NCH111:word; var Buffer);external 'LCARD_32.DLL';
procedure SETU_LC352(U:double);external 'LCARD_32.DLL';
procedure GET_FILTERS_INFO_LC212(xSlot:word; var xIirOn; var xFirOn; var xDec; var xloadIir; 
var xloadFir; 
var xtaps
);external 'LCARD_32.DLL';
function LOAD_FILTER_LC212(xSlot:word; FilterType:word; var FilterFileName):word;external 'LCARD_32.DLL';
procedure MANAGE_FILTERS_LC212(xSlot:word; xIirOn:word; xFirOn:word);external 'LCARD_32.DLL';
procedure RESET_DIGITAL_FILTERS_LC212(xSlot:word);external 'LCARD_32.DLL';
procedure RESET_POINTER_LC212(xSlot:word);external 'LCARD_32.DLL';
function GET_LC114_DATA_FOR_CHANNEL(Slot:word; FifoLength:word; Lc114Nch:word; N:word; 
var BufferLc114; 
Lc114Channel:word; 
CodacBit:word
):word;external 'LCARD_32.DLL';
function GET_LC114_DS1820_TEMP(Slot:word):double;external 'LCARD_32.DLL';
function GET_LC114_MODULE_TEMP(Slot:word):double;external 'LCARD_32.DLL';
function LOAD_BIOS_LC114(Slot:word; var NameBIOS):word;external 'LCARD_32.DLL';
function READY_LC114_SAMPLES(Slot:word; SlotLC114_1:word; SlotLC114_2:word):word;external 'LCARD_32.DLL';
procedure SEND_COMMAND_LC114(Slot:word; Command:word; Wait:word);external 'LCARD_32.DLL';
function SET_LC114_CALIBR(Slot:word; WaitNewSamples:word):word;external 'LCARD_32.DLL';
procedure SET_LC114_CONTROL_WORDS(Slot:word; Lc114AutoCalibrType:word; Lc114CommutatorType:word; var pLc114Range; 
WaitNewSamples:word
);external 'LCARD_32.DLL';
procedure SET_LC114_DECIMATION(Slot:word; Decimate:word; WaitNewSamples:word);external 'LCARD_32.DLL';
procedure SET_LC114_FIFO(Slot:word; MaskForChannels:word; FifoLength:word; WaitNewSaples:word
);external 'LCARD_32.DLL';
function SET_LC114_FILTER(Slot:word; var FileName; var NormalizatorName; WaitNewSaples:word
):word;external 'LCARD_32.DLL';
procedure SET_LC114_PROGRAM_VERSION(Slot:word; Version:word; WaitNewSamples:word);external 'LCARD_32.DLL';
procedure SHOW_SELF_SLAVE_FOR_LC114_UNIT2(Slot:word; SlotLC114_1:word; SlotLC114_2:word);external 'LCARD_32.DLL';
procedure START_MASTER_LC114(Slot:word; SlotLC114_1:word; SlotLC114_2:word; WaitNewSamples:word
);external 'LCARD_32.DLL';
function CHECK_OVERFLOW_LC202(Slot:word; Channel:word):word;external 'LCARD_32.DLL';
function FIFO_CONFIG_LC202(Slot:word; AddressIndex:word; Length:word):word;external 'LCARD_32.DLL';
function FLASH_READ_LC202(Slot:word; FAddress:word; var FByte):word;external 'LCARD_32.DLL';
function FLASH_WRITE_LC202(Slot:word; FAddress:word; FByte:word):word;external 'LCARD_32.DLL';
function GET_DATA_LC202(Slot:word; N_Points:word; var Buffer):word;external 'LCARD_32.DLL';
function GET_FI_LC202(Slot:word; var FI):word;external 'LCARD_32.DLL';
function LOAD_BIOS_LC202(Slot:word; var NameBIOS):word;external 'LCARD_32.DLL';
function LOAD_COEF_LC202(Slot:word):word;external 'LCARD_32.DLL';
function SEND_COMMAND_LC202(Slot:word; Command:word):word;external 'LCARD_32.DLL';
function SET_ATTENUATION_LC202(Slot:word; Attenuation:word):word;external 'LCARD_32.DLL';
function SET_DSP_TYPE_LC202(Slot:word; DSP_Type:word):word;external 'LCARD_32.DLL';
function SET_FO_LC202(Slot:word; FO:word):word;external 'LCARD_32.DLL';
function SET_GAIN_LC202(Slot:word; Gain:word; Channel:word):word;external 'LCARD_32.DLL';
function SET_INPUT_MODE_LC202(Slot:word; InputMode:word):word;external 'LCARD_32.DLL';
function SET_POSTOYANKA_LC202(Slot:word; ConstLevel:word):word;external 'LCARD_32.DLL';
function SET_RATE_LC202(Slot:word; Rate:word; FreqDiv_256or384:word):word;external 'LCARD_32.DLL';
function SYNCHRO_CONFIG_LC202(Slot:word; SynType:word; SynSens:word; SynBuf:word; SynMode:word; 
AdCh:word; 
AdP:word
):word;external 'LCARD_32.DLL';
function TEST_CIRCUIT_LC212(xSlot:word; var States):word;external 'LCARD_32.DLL';
procedure XIDMA_GET_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);external 'LCARD_32.DLL';
function XIDMA_GET_DM_WORD(Slot:word; Addr:word):word;external 'LCARD_32.DLL';
procedure XIDMA_PUT_DM_ARRAY(Slot:word; Addr:word; NPoint:word; var xBuffer);external 'LCARD_32.DLL';
procedure XIDMA_PUT_DM_WORD(Slot:word; Addr:word; xData:word);external 'LCARD_32.DLL';
procedure IDMA301_CONFIG_CC(Slot_301:word; NChannel:word; var Channels; Rate:word; 
xFifoSize:word; 
var NModulesIdma; 
var TableEnaAddr; 
var TableMainIDMA
);external 'LCARD_32.DLL';
procedure IDMA301_IRQ_INPUT_CC(var xPointers; var xFlags);external 'LCARD_32.DLL';
function IDMA301_IRQ_START_CC(Vector:pointer):THANDLE;external 'LCARD_32.DLL';
procedure IDMA301_IRQ_STOP_CC;external 'LCARD_32.DLL';
procedure IDMA301_PREPARE_LC212(xSlot:word; var TableEnaAdr; var TableMain);external 'LCARD_32.DLL';
procedure SET_ENA_FLAG_LC212(xSlot:word; EnaFlag:word);external 'LCARD_32.DLL';
procedure IDMA301_INPUT_CC(var Datad; var IDs);external 'LCARD_32.DLL';
procedure IDMA301_START_CC;external 'LCARD_32.DLL';
procedure IDMA301_STOP_CC;external 'LCARD_32.DLL';
function GET_LPT_DELAY_CC:word;external 'LCARD_32.DLL';
procedure SET_LPT_DELAY_CC(DelayVal:word);external 'LCARD_32.DLL';
procedure IDMA301_PREPARE_LC202(xSlot:word; var TableEnaAdr; var TableMain);external 'LCARD_32.DLL';
procedure CONFIG_LC302_ON_FLY(xNwrd:word; var xData);external 'LCARD_32.DLL';
function LOAD_BIOS_LCIDE(var FileName):integer;external 'LCARD_32.DLL';
procedure SET_BASE_ADDRESS_IDE(BaseAddrData:integer; BaseAddrCtrl:integer);external 'LCARD_32.DLL';
procedure SET_DELAY_IDE(DelayValue:integer);external 'LCARD_32.DLL';
procedure MAIN_INP111_OUT302(var Datad; NWords:word; var Data302; N302:word);external 'LCARD_32.DLL';
function START_INP111_OUT302(Vector:pointer):THANDLE;external 'LCARD_32.DLL';
procedure STOP_INP111_OUT302;external 'LCARD_32.DLL';
function GET_BASE_ADDRESS:integer;external 'LCARD_32.DLL';
procedure HANDL_SET_LC116_CURRENT(Slot:integer; Scale:integer; Channel:integer; CalibrData:integer
);external 'LCARD_32.DLL';
function READ_LC116_CALIBR(Slot:integer; var Data):integer;external 'LCARD_32.DLL';
function SET_LC116_CURRENT(Slot:integer; Scale:integer; Channel:integer):integer;external 'LCARD_32.DLL';
procedure WRITE_LC116_CALIBR(Slot:integer; var Data);external 'LCARD_32.DLL';
function GET_LC114_DATA_FOR_CHANNELS(Slot:word; FifoLength:word; Lc114Nch:word; N:word; 
var BufferLc114; 
CodacBit:word
):word;external 'LCARD_32.DLL';
function LC114_CHECK_FIFO(Slot:smallint):smallint;external 'LCARD_32.DLL';
function LC114_GET_ADC_TYPE(Slot:smallint):smallint;external 'LCARD_32.DLL';
function LC114_GET_CDATA1(Slot:smallint; NC:smallint):smallint;external 'LCARD_32.DLL';
procedure LC114_GET_CDATA16(Slot:smallint; var CData);external 'LCARD_32.DLL';
function LC114_GET_DS1820(Slot:smallint):double;external 'LCARD_32.DLL';
procedure LC114_GET_FIFO(Slot:smallint; var FIFO_Buf; half:smallint);external 'LCARD_32.DLL';
function LC114_GET_FIFO_POINTER(Slot:smallint):smallint;external 'LCARD_32.DLL';
function LC114_LOAD_BIOS(Slot:word; var Bios_Name):smallint;external 'LCARD_32.DLL';
procedure LC114_LOAD_CALIBRATION_COEF(Slot:smallint);external 'LCARD_32.DLL';
function LC114_LOAD_FILTR(Slot:smallint; var Filtr_Name):smallint;external 'LCARD_32.DLL';
function LC114_PUT_DQI_HIGH(Slot:smallint):smallint;external 'LCARD_32.DLL';
function LC114_PUT_DQI_LOW(Slot:smallint):smallint;external 'LCARD_32.DLL';
procedure LC114_SET_BOARD_MODE(Slot:smallint; Mode:smallint);external 'LCARD_32.DLL';
procedure LC114_SET_CALIBRATION_COEF(Slot:smallint; var CalibrCoef);external 'LCARD_32.DLL';
procedure LC114_SET_CBAND1(Slot:smallint; Nc:char; CBand:char);external 'LCARD_32.DLL';
procedure LC114_SET_CBAND16(Slot:smallint; var CBands);external 'LCARD_32.DLL';
procedure LC114_SET_CMASK(Slot:smallint; CMask:word);external 'LCARD_32.DLL';
procedure LC114_SET_DECIMATION(Slot:smallint; Dec_K:smallint);external 'LCARD_32.DLL';
procedure LC114_SET_FIFO(Slot:smallint; FIFO_Size:smallint);external 'LCARD_32.DLL';
procedure LC114_SET_FILTR(Slot:smallint; FiltrFlag:char);external 'LCARD_32.DLL';
procedure LC114_SET_ZCALIBRATION(Slot:smallint; CalibrFlag:char);external 'LCARD_32.DLL';
function LC114_START(Slot:smallint):smallint;external 'LCARD_32.DLL';
function LC114_STOP(Slot:smallint):smallint;external 'LCARD_32.DLL';
function LC114_WRITE_FLASH(Slot:smallint; var CalibrCoef):smallint;external 'LCARD_32.DLL';
function LC114_CHECK_TC(Slot:smallint):word;external 'LCARD_32.DLL';
function GET_SERR:dword;external 'LCARD_32.DLL';
procedure RST_SERR(Val:dword);external 'LCARD_32.DLL';
procedure LOAD_DATA_LC352_BY8192(Slot:word; DatSz:word; ShiftVal:word; var Datax);external 'LCARD_32.DLL';

End.
