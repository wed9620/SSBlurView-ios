//
//  SSBillStyleAlertView.h
//  SSBillStyleAlert
//
//  Created by Sergey Shinkarenko on 5/23/18.
//  Copyright © 2018 Sergey Shinkarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBlurAlert : UIView

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

-(instancetype)initWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok;
-(instancetype)initWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleCancel:(void(^)(void))onCancel handleOK:(void(^)(void))onOK;
-(instancetype)initWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleOK:(void(^)(void))onOK;

+(instancetype)alertWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok;
+(instancetype)alertWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleCancel:(void(^)(void))onCancel handleOK:(void(^)(void))onOK;
+(instancetype)alertWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleOK:(void(^)(void))onOK;

@end
