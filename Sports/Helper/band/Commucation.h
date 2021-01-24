//
//  Commucation.h
//  InBodyBandSDK_iOS
//

#ifndef Commucation_h
#define Commucation_h


#endif /* Commucation_h */


#import <UIKit/UIKit.h>
#import "UARTPeripheral.h"

// Connection status
typedef enum
{
    IDLE = 0,
    SCANNING,
    CONNECTED,
    CONNECTING,
    STOPSCANN,
    UPGRADING,
    UPGRADED
} ConnectionState;

typedef enum
{
    NONE = 0,
    TIMEOUT = -1,
    TRYAGAIN = -2,
    ABNORMALTIMEOUT = -3,
    NODEVICE = -4,
    MULTIDEVICE = -5,
    READY = -6,
    CANCEL = -7,
    COMPLETE = -8,
    NODEVICETIMEOUT = -9,
    WEIGHTCHECK = -10,
} ErrorCode;

typedef enum
{
    FAIL = 0,
    SUCCESS = 1,
    PAIRED = 2,
    NOTPAIRED = 3,
    
    ON = 1,
    OFF = 0,
    
    POUND = 1,
    KG = 0,
} ResultCode;

typedef enum
{
    ET_BenchPress = 1,       // 0x01 : 벤치프레스
    ET_KettleBelling = 2,    // 0x02 : 케틀벨 링
    ET_ShoulderPress = 3,    // 0x03 : 숄더프레스
    
    ET_Crunch = 17,           // 0x11 : 크런치
    ET_Plank = 18,            // 0x12 : 플랭크
    ET_DeadLift = 19,         // 0x13 : 데드 리프트
    
    ET_Squat = 33,            // 0x21 : 스쿼트
    ET_Lunge =34,            // 0x22 : 런지
    ET_WallSit = 35,          // 0x23 : Wall Sit
    
    ET_JumpingJack = 49,      // 0x31 : 점핑잭
    ET_Burpee = 50,           // 0x32 : 버핏
    ET_HipBridge = 51,        // 0x33 : 힙브릿지
} EZTraining;

typedef enum
{
    ET_Ready = 1, // 0x01 : 운동 준비
    ET_Start = 2, // 0x02 : 운동 시작
    ET_Count = 3, // 0x03 : 운동 회수 전달
    ET_Pause = 4, // 0x04 : 운동 잠시 멈춤
    ET_Resume = 5, // 0x05 : 운동 다시 시작
    ET_Stop = 6, // 0x06 : 운동 종료
    
} ET_Action;



// 내부적으로 사용
typedef enum
{
    STATUS_CONNECTING,
    STATUS_NO_DIVICE_SCANED,
    STATUS_MULTI_DIVICE_SCANED,
    STATUS_SEND,
    STATUS_RESEND,
    STATUS_RECEIVE,
    STATUS_RECONNECTING,
    STATUS_CONNECTED,
    STATUS_CAN_NOT_CONNECTING,
    STATUS_DISCONNECTED,
    STATUS_DEVICE_REMOVED,
    STATUS_FIRMWARE_UPGRADE,
    STATUS_FIRMWARE_UPGRADE_DONE,
    STATUS_ETC,
} LogStatus;

@interface Commucation : NSObject

// Transfer actual data
+ (void) Comm_SendData:         (unsigned char*)Buf length:(int)len Peripheral:(UARTPeripheral*)currentPeripheral;

// Handler AI command data
+ (NSData*) Comm_MakeAI:        (NSString *)gender Height:(double)height Weight:(double)weight Age:(int)age ShortType:(BOOL)type bTimeFormat:(BOOL)bTimeFormat;

// Handler AP command data
+ (NSData*) Comm_MakeAP:(NSString *)_mobilenumber;

// Handler HC command data
+ (NSData*) Comm_MakeHC:        (NSString *)gender Height:(double)height Age:(int)age;

// Make frame according to protocol
+ (NSData*) Comm_fncSendCommand:(unsigned char)cmd1 cmd2:(unsigned char)cmd2 data:(NSData *)data DevideName:(NSString*)deviceName;

// Handler AK command data
+ (NSData*) Comm_GetAKCommand;

// Parsing InBodyDial Data
+ (NSString*) Comm_ReadH20Data:(NSData*) data;

// Parsing InBodyOn Data
+ (NSString*) Comm_ReadOnData:(NSData*) data;

// Parsing Sleep Data
+ (NSString*) Comm_ReadSleepData:(NSData*) data PrevSleep:(NSString*)Sleep;

// Parsing InBodyBand Body composition Data
+ (NSString*) Comm_ReadBandBodyFatData:(NSData*) data;

// Parsing InBodyBand Activity Data
+ (NSDictionary*) Comm_ReadACData:(NSData*) data;

// Parsing InBodyBand Activity Data
+ (NSDictionary*) Comm_ReadAEData:(NSData*) data;

+ (NSString*) Commm_GetMinMaxValue: (double) age
                            Gender:(NSString*) gender    	// M,F
                                HT:(double) inputHT
                                WT:(double) inputWT
                               BFM:(double) inputBFM        // Body Fat Mass
                               SMM:(double) inputSMM        // Muscle Mass
                               PBF:(double) inputPBF        // Percent Body Fat
                               BMI:(double) inputBMI        // kg/m2
                               WHR:(double) inputWHR        // Default 0
                               VFL:(int) inputVfl;
@end
