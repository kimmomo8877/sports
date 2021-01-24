//
//  BLEController.h
//  InBodyBandSDK_iOS
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Commucation.h"

@protocol InBodySDKDelegate
- (void) Evt_StatusLog:(NSString*)log Status:(LogStatus)status ErrorCode:(int)ErrorCode;
- (void) Evt_DetailLog:(NSString*)log Status:(LogStatus)status;
- (void) Evt_Connect;
- (void) Evt_DisConnect;
- (void) Evt_StopScan;
- (void) Evt_BLEUpdateState:(BOOL)isPaired;
- (void) Evt_SendFrame:(NSData*) data;
- (void) Evt_UpdateScannedPeripheral:(NSArray*)list;
@end

@interface BLEController : UIViewController <CBCentralManagerDelegate, UARTPeripheralDelegate>
{
    Boolean SDK_bDisconnect; // disconnect flag
    Boolean SDK_bReceviedAK;
    Boolean SDK_bUseFirmwareUpgreade;
}

@property CBPeripheral*         SDK_discovered_peripheral;
@property UARTPeripheral*       SDK_currentPeripheral;
@property ConnectionState       SDK_state;
@property CBCentralManager*     SDK_cm;
@property id<InBodySDKDelegate> SDK_delegate;

// BLE Initalize
- (void) InitBluetooth;

// Stop scanning
- (void) SDK_StopScan;

// Scanning device with device name
- (void) SDK_ScanDevice:    (Boolean)init;

// Scanning device and return scanned list with device name
- (void) SDK_ScanDeviceWithReturnList:(Boolean)Init;

// Connect selected scanned device
- (void) connectPeripheral:(CBPeripheral*)peripheral advertisementData:(NSDictionary *)advertisementData;

// Variable Initalize
- (void) SDK_InitVariable:  (double)_height Weight:(double)_weight Age:(int)_age Gender:(NSString*)_Gender delegate:(id<InBodySDKDelegate>) delegate;

// Make frame according to protocol
- (void) SDK_fncSendCommand:(unsigned char)cmd1 cmd2:(unsigned char)cmd2 data:(NSData *)data;

// Set Device name
- (void) SDK_SetDeviceName: (NSString*) Name;

// Remove previously connected InBodyBAND / InBodyDial information
- (void) SDK_RemoveDevice;

// connect with already connected device
-(Boolean) SDK_CheckPreviousDevice;

- (NSDictionary*) SDK_GetDeviceInfo;

- (void) SDK_OTAFilePath:(NSString*) _OTAFilePath;

@end
