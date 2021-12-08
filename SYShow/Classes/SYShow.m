
#import "SYShow.h"

#define SYShowScreen [UIScreen mainScreen]

@interface SYShow ()

@property (nonatomic, assign) SYShowOption innerOption;

@property (nonatomic, assign) BOOL enableDismiss;

@end

@implementation SYShow

+ (void)show:(nonnull UIView *)view option:(SYShowOption)option backgroundColor:(nullable UIColor *)backgroundColor enableDismiss:(BOOL)dismiss {
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    SYShow * backgroundView = [[SYShow alloc] initWithFrame:SYShowScreen.bounds];
    backgroundView.innerOption = option;
    backgroundView.enableDismiss = dismiss;
    backgroundView.backgroundColor = backgroundColor != nil ? backgroundColor : [[UIColor blackColor] colorWithAlphaComponent:0.1];
    backgroundView.alpha = 0;
    [window addSubview:backgroundView];
    [backgroundView addSubview:view];
    
    [backgroundView animationView:view animationIn:YES withOption:option];
}

+ (void)dismiss:(UIView *)view {
    SYShow * backgroundView = (SYShow *)view.superview;
    [backgroundView animationView:view animationIn:NO withOption:backgroundView.innerOption];
}

- (void)animationView:(UIView *)view animationIn:(BOOL)animationIn withOption:(SYShowOption)option {
    
    if (animationIn && option == SYShowOptionFromCenter) {
        view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height / 2);
        view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    } else if (!animationIn && option == SYShowOptionFromCenter) {
        view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } else if (animationIn && option == SYShowOptionFromBottom) {
        view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height + view.bounds.size.height / 2);
    }  else if (!animationIn && option == SYShowOptionFromBottom) {
        view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height / 2);
    } else if (animationIn && option == SYShowOptionFromBottomToSheet) {
        view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height + view.bounds.size.height / 2);
    } else if (!animationIn && option == SYShowOptionFromBottomToSheet) {
        view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height - view.bounds.size.height / 2);
    }
    
    dispatch_block_t animations = ^{
        if (animationIn && option == SYShowOptionFromCenter) {
            view.transform = CGAffineTransformMakeScale(1, 1);
        } else if (!animationIn && option == SYShowOptionFromCenter) {
            view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        } else if (animationIn && option == SYShowOptionFromBottom) {
            view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height / 2);
        } else if (!animationIn && option == SYShowOptionFromBottom) {
            view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height +       view.bounds.size.height / 2);
        } else if (animationIn && option == SYShowOptionFromBottomToSheet) {
            view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height - view.bounds.size.height / 2);
        } else if (!animationIn && option == SYShowOptionFromBottomToSheet) {
            view.center = CGPointMake(SYShowScreen.bounds.size.width / 2, SYShowScreen.bounds.size.height +       view.bounds.size.height / 2);
        }
        self.alpha = animationIn ? 1.0 : 0.0;
    };
    [UIView animateWithDuration:0.3 animations:animations completion:^(BOOL finished) {
        if (!animationIn) {
            [self removeFromSuperview];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView * view = touches.anyObject.view;
    if ([view isEqual:self] && self.enableDismiss) {
        [SYShow dismiss:[view subviews].lastObject];
    }
}

@end
