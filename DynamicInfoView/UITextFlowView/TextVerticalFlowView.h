//
//  TextVerticalFlowView.h
//  RailTraffic
//
//  Created by Lion User on 20/03/2013.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TextVerticalFlowView : UIView
{
    NSTimer *_timer;
    
    NSString *_text;
    
    BOOL _isNeedFlow;
    
    CGRect _frame;
    
    UIFont *_font;
    
    CGFloat _YOffset;
    
    CGFloat _heightOfText;
    
    UIColor *_textColor;
    
    CGFloat _speedOfFlow;
}

- (id)initWithFrame:(CGRect)frame TextFont:(UIFont *)font TextColor:(UIColor *)textColor Text:(NSString *)text;

- (void)setText:(NSString *)text;

- (void)setSpeedFlow:(CGFloat)speed;
@end
