//
//  ViewController.h
//  DynamicInfoView
//
//  Created by zjf on 16/8/29.
//  Copyright © 2016年 ctfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TextVerticalFlowView;

@interface ViewController : UIViewController
{
    TextVerticalFlowView * dynFlowView;
    NSTimer * dynTimer;
}

@end

