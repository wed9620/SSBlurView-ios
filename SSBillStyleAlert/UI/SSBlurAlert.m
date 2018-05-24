//
//  SSBillStyleAlertView.m
//  SSBillStyleAlert
//
//  Created by Sergey Shinkarenko on 5/23/18.
//  Copyright © 2018 Sergey Shinkarenko. All rights reserved.
//

#import "SSBlurAlert.h"

typedef void (^CompletionBlock)(void);

@interface SSBlurAlert ()

@property(nonatomic, copy) CompletionBlock cancelBlock;
@property(nonatomic, copy) CompletionBlock okBlock;

@end

@implementation SSBlurAlert

-(instancetype)initWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok {

    NSString * nibName = NSStringFromClass([self class]);
    self = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] firstObject];

    self.headerLabel.text = header;
    self.messageLabel.text = message;
    self.cancelButton.titleLabel.text = cancel;
    self.okButton.titleLabel.text = ok;

    return self;
}

-(instancetype)initWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleCancel:(void (^)(void))onCancel handleOK:(void (^)(void))onOK {

    NSString * nibName = NSStringFromClass([self class]);
    self = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] firstObject];

    self.headerLabel.text = header;
    self.messageLabel.text = message;
    self.cancelButton.titleLabel.text = cancel;
    self.okButton.titleLabel.text = ok;

    self.cancelBlock = onCancel;
    self.okBlock = onOK;

    return self;
}

-(instancetype)initWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleOK:(void (^)(void))onOK {

    NSString * nibName = NSStringFromClass([self class]);
    self = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] firstObject];

    self.headerLabel.text = header;
    self.messageLabel.text = message;
    self.cancelButton.titleLabel.text = cancel;
    self.okButton.titleLabel.text = ok;

    self.okBlock = onOK;
    
    return self;
}

+(instancetype)alertWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok {

    return [[SSBlurAlert alloc] initWithHeader:header message:message cancel:cancel andOK:ok];
}

+(instancetype)alertWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleOK:(void (^)(void))onOK {

    return [[SSBlurAlert alloc] initWithHeader:header message:message cancel:cancel andOK:ok handleOK:onOK];
}

+(instancetype)alertWithHeader:(NSString *)header message:(NSString *)message cancel:(NSString *)cancel andOK:(NSString *)ok handleCancel:(void (^)(void))onCancel handleOK:(void (^)(void))onOK {

    return [[SSBlurAlert alloc] initWithHeader:header message:message cancel:cancel andOK:ok handleCancel:onCancel handleOK:onOK];
}

- (IBAction)cancelPressed:(id)sender {

    if (self.cancelBlock) {

        self.cancelBlock();
    } else {

        [self removeFromSuperview];
    }
}

- (IBAction)okPressed:(id)sender {

    if (self.okBlock) {

        self.okBlock();
    } else {

        [self removeFromSuperview];
    }
}

@end
