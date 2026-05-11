#import <UIKit/UIKit.h>

@interface RebellionAlert : UIView
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIButton *rightsButton;
@property (nonatomic, strong) UIButton *thanksButton;
- (void)show;
@end

@implementation RebellionAlert

- (instancetype)init {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        
        _alertView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width - 280) / 2, -300, 280, 220)];
        _alertView.backgroundColor = [UIColor colorWithRed:0.12 green:0.14 blue:0.16 alpha:1.0];
        _alertView.layer.cornerRadius = 15;
        _alertView.layer.shadowColor = [UIColor blackColor].CGColor;
        _alertView.layer.shadowOpacity = 0.5;
        _alertView.layer.shadowOffset = CGSizeMake(0, 5);
        _alertView.layer.shadowRadius = 10;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 260, 30)];
        _titleLabel.text = @"Welcome !";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:22];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_alertView addSubview:_titleLabel];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, 260, 80)];
        _messageLabel.text = @"#Slm Wla T3lm\nThis Mod Pack was Made By\nrebellion";
        _messageLabel.textColor = [UIColor lightGrayColor];
        _messageLabel.font = [UIFont systemFontOfSize:15];
        _messageLabel.numberOfLines = 3;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [_alertView addSubview:_messageLabel];
        
        _rightsButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _rightsButton.frame = CGRectMake(15, 155, 115, 45);
        [_rightsButton setTitle:@"Rights" forState:UIControlStateNormal];
        [_rightsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rightsButton.backgroundColor = [UIColor colorWithRed:0.20 green:0.22 blue:0.25 alpha:1.0];
        _rightsButton.layer.cornerRadius = 8;
        [_rightsButton addTarget:self action:@selector(showRights) forControlEvents:UIControlEventTouchUpInside];
        [_alertView addSubview:_rightsButton];
        
        _thanksButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _thanksButton.frame = CGRectMake(150, 155, 115, 45);
        [_thanksButton setTitle:@"Thanks" forState:UIControlStateNormal];
        [_thanksButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _thanksButton.backgroundColor = [UIColor colorWithRed:0.18 green:0.49 blue:0.96 alpha:1.0];
        _thanksButton.layer.cornerRadius = 8;
        [_thanksButton addTarget:self action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
        [_alertView addSubview:_thanksButton];
        
        [self addSubview:_alertView];
    }
    return self;
}

- (void)show {
    UIWindow *keyWindow = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in scene.windows) {
                    if (window.isKeyWindow) {
                        keyWindow = window;
                        break;
                    }
                }
            }
        }
    }
    if (!keyWindow) {
        keyWindow = [UIApplication sharedApplication].keyWindow;
    }
    
    [keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        self.alertView.frame = CGRectMake((self.frame.size.width - 280) / 2, (self.frame.size.height - 220) / 2, 280, 220);
    } completion:nil];
}

- (void)dismissAlert {
    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        self.alertView.frame = CGRectMake((self.frame.size.width - 280) / 2, self.frame.size.height + 50, 280, 220);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)showRights {
    UIAlertController *friendsAlert = [UIAlertController alertControllerWithTitle:@"Brothers & Support"
                                                                          message:@""
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    NSString *namesText = @"Rebellion - rebellion - Smith - Nmraany\nZiad - Nomas - AlNader - Budz\n٣٤ - Tami - Retired";
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:namesText];
    
    [attrString addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:11.0],
        NSForegroundColorAttributeName: [[UIColor whiteColor] colorWithAlphaComponent:0.5]
    } range:NSMakeRange(0, namesText.length)];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [attrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, namesText.length)];
    
    [friendsAlert setValue:attrString forKey:@"attributedMessage"];
    
    UIAlertAction *telegramAction = [UIAlertAction actionWithTitle:@"Telegram"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
        NSURL *telegramURL = [NSURL URLWithString:@"https://t.me/eightevils"];
        if ([[UIApplication sharedApplication] canOpenURL:telegramURL]) {
            [[UIApplication sharedApplication] openURL:telegramURL options:@{} completionHandler:nil];
        }
    }];
    
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Close"
                                                          style:UIAlertActionStyleCancel
                                                        handler:nil];
                                                        
    [friendsAlert addAction:telegramAction];
    [friendsAlert addAction:closeAction];
    
    UIWindow *keyWindow = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in scene.windows) {
                    if (window.isKeyWindow) {
                        keyWindow = window;
                        break;
                    }
                }
            }
        }
    }
    if (!keyWindow) {
        keyWindow = [UIApplication sharedApplication].keyWindow;
    }
    
    [keyWindow.rootViewController presentViewController:friendsAlert animated:YES completion:nil];
}

@end

%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            RebellionAlert *alert = [[RebellionAlert alloc] init];
            [alert show];
        });
    });
}

%end
