/*
 
 This is UART profile and no special need to be modified
 
 */

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

// Data receiving event delegate
@protocol UARTPeripheralDelegate

// BLE service discover event
- (void) didServiceDiscovered:  (NSError*)error;

// Data receive event
- (void) didReceiveData:        (CBCharacteristic*)characteristic error:(NSError *)error;

@optional
- (void) didReadHardwareRevisionString:(NSString *) string;

@end

@interface UARTPeripheral : NSObject <CBPeripheralDelegate>
{
    //다이얼 블루투스 모듈 신규 변수
    NSArray* DialCharacteristicUUID;
    
    // RX credits granted to the peripheral
    NSInteger localUARTCreditsCount;
    NSInteger pendingLocalUARTCreditsCount;
    // TX credits granted by the peripheral
    NSInteger remoteUARTCreditsCount;
    // UART MTU size of local side
    NSInteger pendingLocalUartMtuSize;
    
    /**
     *  Maximum number of local credits that shall be granted to the remote device.
     *
     *  A credit is defined as the permission to send one data packet of 1 to 20 bytes.
     *  Receiving a UART data packet (1 to 20 bytes) from the remote device decrements the local credit counter by 1.
     *  As soon as the local credit counter reaches minLocalUARTCreditsCount, a number of (maxLocalUARTCreditsCount - minLocalUARTCreditsCount) credits will automatically be granted to the remote device;
     *  the local credit counter will then have the value of maxLocalUARTCreditsCount.
     *
     *  maxLocalUARTCreditsCount shall only be set to values > minLocalUARTCreditsCount and <= 255.
     *  Default value is 255.
     */
    NSInteger maxLocalUARTCreditsCount;
    
    /**
     *  Minimum number of local credits that shall be granted to the remote device.
     *
     *  A credit is defined as the permission to send one data packet of 1 to 20 bytes.
     *  Receiving a UART data packet (1 to 20 bytes) from the remote device decrements the local credit counter by 1.
     *  As soon as the local credit counter reaches minLocalUARTCreditsCount, a number of (maxLocalUARTCreditsCount - minLocalUARTCreditsCount) credits will automatically be granted to the remote device;
     *  the local credit counter will then have the value of maxLocalUARTCreditsCount.
     *
     *  minLocalUARTCreditsCount shall only be set to values < maxLocalUARTCreditsCount and >= 0.
     *  Default value is 32.
     */
    NSInteger minLocalUARTCreditsCount;
}

@property CBPeripheral* peripheral;
@property NSString*     deviceName;
@property id<UARTPeripheralDelegate> delegate;

// Get UUID string
+ (NSDictionary*)   uartServiceUUID;

// Start searching for service when connected with InBodyBAND / InBodyDial
- (void) didConnect;

// Additional process for disconnection
- (void) didDisconnect;

// Asynchronous data transfer
- (void) writeString:(NSData *) string;

- (UARTPeripheral*) initWithPeripheral:(CBPeripheral*)peripheral delegate:(id<UARTPeripheralDelegate>) delegate device:(NSString*) deviceName;

@end
