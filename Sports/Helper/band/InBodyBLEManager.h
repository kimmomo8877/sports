//
//  InBodyBLEManager.h
//  InBodyBandSDK_iOS
//
//  Created by Jongheun Shin on 2018. 1. 8..
//  Copyright © 2018년 InBody. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import "BLEController.h"

//헬스킷 주석 start
//#import "GSHealthKitManager.h"
//헬스킷 주석 end

@interface InBodyBLEManager : BLEController <InBodySDKDelegate>
{
    id target;
    int m_nAge;
    double m_dHeight;
    double m_dWeight;
    NSString* m_strGender;
    NSString* m_strDeviceName;
    NSString* m_strLastCommand;
    
    SEL m_Callback;
    
    SEL m_CallbackSync;
    SEL m_CallbackSetMobileNumber;
    SEL m_CallbackBand1Setting;
    SEL m_CallbackBand2Setting;
    SEL m_CallbackAlarm;
    SEL m_CallbackStartBCA;
    SEL m_CallbackGetBCA;
    SEL m_CallbackStartHR;
    SEL m_CallbackGetHR;
    SEL m_CallbackActivity;
    SEL m_CallbackSleep;
    SEL m_CallbackWait;
    
    SEL m_CallbackH20;
    SEL m_CallbackInBodyON;
    SEL m_CallbackAbnormal;
    SEL m_CallbackEZTraining;
    
    SEL m_CallbackGetPPGHR;
    SEL m_CallbackGetEcgRawDataCnt;
    SEL m_CallbackGetEcgRawData;
    SEL m_CallbackStartEcgPpg;
    
    BOOL m_bDataClear;
    BOOL m_bIsUpgrade;
    BOOL m_bTimeFormat;
    
    int m_nONLanguage;
    int m_nONUnit;
    int m_nONSound;
    
    float m_nDataCnt;
    
    //헬스킷 주석 start
//    GSHealthKitManager* HealthKit;
    //헬스킷 주석 end
}

+ (InBodyBLEManager *)SharedManager;

- (void) SetInBodyONWithCallback:(SEL)_Callback Language:(int)_Language Unit:(int)_Unit Sound:(int)_Sound;
// 인바디 온 콜백 지정

- (void) SetH20WithCallback:(SEL)_Callback;
// 인다비 다이얼 콜백 지정

- (void) InitSDKWithCallback:(double)_Height Weight:(double)_Weight Age:(int)_Age Gender:(NSString*)_Gender DeviceName:(NSString*)_DeviceName Delegate:(id)_Delegate AbnormalDisconnect:(SEL)_AbnormalDisconnect Callback:(SEL)_Callback UseHealthKit:(BOOL)_HealthKit;
// 객체 초기화

- (void) ConnectDisconnectWithCallback:(SEL)_Callback IsNeedScanList:(BOOL)_isNeedScanList;
// 블루투스 연결 컨트롤

- (void) connectSelectedPeripheral:(CBPeripheral*)peripheral advertisementData:(NSDictionary *)advertisementData;
// 선택된 블루투스 장비에 연결

- (void) RemoveDeviceWithCallback:(SEL)_Callback;
// 연결된 제품 삭제

- (void) SelectDeviceWithCallback:(NSString*)_DeviceName Callback:(SEL)_Callback;
// 제품명 변경

- (void) SetSyncWithCallback:(SEL)_Callback;
// 밴드 진동 표시

- (void) SetMobileNumberWithCallback:(SEL)_Callback MobileNumber:(NSString*)_mobilenumber;
// 밴드2에 전화번호 정보 전송

- (void) GetBcaDataWithCallback:(SEL)_Callback ClearData:(BOOL)_ClearData;
// 누적된 인바디 데이터 가져오기 BCA : {"Date":"2018-01-09", "Time":"13:33:28", "PBF":16.0, "SMM":28.6, "BFM":9.8, "WEIGHT":60.0, "IsComplete":0}

- (void) GetHRDataWithCallback:(SEL)_Callback ClearData:(BOOL)_ClearData;
// 누적된 심박 데이터 가져오기 HR : {"Date":"2018-01-09", "Time":"13:36:28", "HR":75, "IsComplete":0}

- (void) GetActivityDataWithCallback:(SEL)_Callback ClearData:(BOOL)_ClearData;
// 보행 데이터 가져오기 ACT : {"Date":"2018-01-09", "Time":"12:00:00", "Walk":122, "WalkTime":1, "WalkCalories":4, "WalkDistance":78, "Run":28, "RunTime":0, "RunCalories":1, "RunDistance":23, "IsComplete":0}

- (void) GetSleepDataWithCallback:(SEL)_Callback ClearData:(BOOL)_ClearData;
// 수면 데이터 가져오기 Sleep : {"Sleep":"20171218,1030,1045,1046,1056,1057,1130,1132,1142,1144,1150", "IsComplete":0}

- (void) StartBandInBodyTestWithCallback:(SEL)_Callback ProPBF:(double)_ProPBF ProWT:(double)_ProWT IsGuestMode:(BOOL)_IsGuestMode IsPBFMode:(BOOL)_IsPBFMode;
// 인바디 밴드로 인바디 검사 BCA : {"Date":"2018-01-09", "Time":"13:33:28", "PBF":16.0, "SMM":28.6, "BFM":9.8, "WEIGHT":60.0, "IsComplete":1}

- (void) StartBandHRTestWithCallback:(SEL)_Callback IsGuestMode:(BOOL)_IsGuestMode;
// 인바디 밴드로 심박수 검사 HR : {"Date":"2018-01-09", "Time":"13:36:28", "HR":75, "IsComplete":1}

- (void) SetProfileSyncWithCallback:(SEL)_Callback;
// 신상정보 세팅

- (void) SetProfileWithoutSync:(double)_height Weight:(double)_weight Age:(int)_age Gender:(NSString*)_Gender isTimeFormat24:(BOOL)_isTimeFormat24;
// 신상정보만 변경

- (NSDictionary*) GetDeviceInfo;
// 펌웨어 버전 배터리, 시리얼 확인

- (void) StartFirmwareUpgradeWithCallback:(SEL)_Callback OTAFilePath:(NSString*)_OTAFilePath;
// 펌웨어 업그레이드

- (void) SetWaitWithCallback:(SEL)_Callback;
// 통신대기

- (void) SetBand1SettingWithCallback:(SEL)_Callback value:(NSData*)_Value;
// 밴드 세팅값 설정

- (void) SetBand2SettingWithCallback:(SEL)_Callback value:(NSData*)_Value;
// 밴드 세팅값 설정

- (void) SetBandTimeAlarmWithCallback:(SEL)_Callback value:(NSData*)_Value;
// 밴드 시간 알람 설정

- (void) SetEZtrainingWithCallback:(SEL)_Callback EZTraining:(int)_EZTraining EZAction:(int)_EZAction Count:(int)_Count;
// 이지트레이닝

- (void) SetBandFactoryReset:(SEL)_Callback;
// 공장초기화

- (void) RequestHealthkitPermission;

// 부정맥 관련
- (void) GetPPGHRWithCallback:(SEL)_Callback ClearData:(BOOL)_ClearData;

- (void) GetEcgRawDataCntWithCallback:(SEL)_Callback ClearData:(BOOL)_ClearData;

- (void) GetEcgRawDataWithCallback:(SEL)_Callback ClearData:(BOOL)_ClearData Index:(int)index;

- (void) StartEcgPpgWithCallback:(SEL)_Callback Seconds:(int)_seconds;

- (NSString*) GetMinMaxValue: (double) age Gender:(NSString*) gender HT:(double) inputHT WT:(double) inputWT BFM:(double) inputBFM SMM:(double) inputSMM PBF:(double) inputPBF BMI:(double) inputBMI WHR:(double) inputWHR VFL:(int) inputVfl;
@end
