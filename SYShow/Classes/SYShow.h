
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SYShowOption) {
    SYShowOptionFromBottom,
    SYShowOptionFromCenter,
    SYShowOptionFromBottomToSheet
};

@interface SYShow : UIView

/// 你给我一个view，我给你弹出来
/// @param view view
/// @param option 展示方式
/// @param backgroundColor 背景色，如果为nil，则默认为black alpha 0.1
/// @param dismiss 点击view空白处是否允许移除view
+ (void)show:(nonnull UIView *)view
      option:(SYShowOption)option
backgroundColor:(nullable UIColor *)backgroundColor
enableDismiss:(BOOL)dismiss;

/// 移除弹窗
/// @param view view
+ (void)dismiss:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
