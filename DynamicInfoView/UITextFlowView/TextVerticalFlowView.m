//
//  TextVerticalFlowView.m
//  RailTraffic
//
//  Created by Lion User on 20/03/2013.
//
//

#import "TextVerticalFlowView.h"
#define SPACE 20

@implementation TextVerticalFlowView

- (CGRect)moveNewPoint:(CGPoint)point rect:(CGRect)rect
{
    CGSize tmpSize;
    tmpSize.height = rect.size.height + (rect.origin.y - point.y);
    tmpSize.width = rect.size.width + (rect.origin.x - point.x);
    
    return CGRectMake(point.x, point.y, tmpSize.width, tmpSize.height);
}

- (void)startRun
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:_speedOfFlow target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)cancelRun
{
    if (_timer) {
        [_timer invalidate];
    }
}

- (void)timerAction
{
    static CGFloat offsetOnce = -1;
    _YOffset += offsetOnce;
    if (_YOffset + _heightOfText <= 0)
    {
        _YOffset += _heightOfText;
        _YOffset += SPACE;
    }
    
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame TextFont:(UIFont *)font TextColor:(UIColor *)textColor Text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
//        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
//        self.layer.cornerRadius = 3;
//        self.layer.borderColor = [UIColor whiteColor].CGColor;
//        self.layer.borderWidth = 1;
        
        _speedOfFlow = 0.1;
        _font = font;
        _textColor = textColor;
        _text = text;
        
        NSArray *arrayText = [_text componentsSeparatedByString:@"\n\n"];
        for (int i = 0; i < arrayText.count; i++) {
            _heightOfText += [[arrayText objectAtIndex:i]sizeWithFont:_font constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:UILineBreakModeCharacterWrap].height + _font.lineHeight;
        }
       // _heightOfText = font.lineHeight * arrayText.count*2;
        
        if (_heightOfText > frame.size.height) {
            _isNeedFlow = YES;
            [self startRun];
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat XOffset = 10;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, _textColor.CGColor);
    if (_isNeedFlow) {
        rect = [self moveNewPoint:CGPointMake(XOffset, _YOffset) rect:rect];
        while (rect.size.height >= 0) {
            [_text drawInRect:rect withFont:_font];
            rect = [self moveNewPoint:CGPointMake(rect.origin.x, rect.origin.y + _heightOfText +SPACE) rect:rect];
        }
    }
    else
    {
        rect.origin.x = XOffset;
        [_text drawInRect:rect withFont:_font];
    }
}

- (void)setText:(NSString *)text
{
    _text = text;
    [self cancelRun];
    
    _heightOfText = 0;
    NSArray *arrayText = [_text componentsSeparatedByString:@"\n\n"];
    for (int i = 0; i < arrayText.count; i++) {
        _heightOfText += [[arrayText objectAtIndex:i]sizeWithFont:_font constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:UILineBreakModeCharacterWrap].height + _font.lineHeight;
    }
    
    if (_heightOfText > self.frame.size.height) {
        _isNeedFlow = YES;
        [self startRun];
    }
    else
    {
        [self setNeedsDisplay];
    }
}

- (void)setSpeedFlow:(CGFloat)speed
{
    _speedOfFlow = speed;
}
@end
