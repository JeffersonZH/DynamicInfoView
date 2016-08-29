//
//  DyinfoModel.h
//  RailTraffic
//
//  Created by MagicStudio on 12-12-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DyinfoModel : NSObject <NSCoding>
@property (nonatomic, copy) NSString *infoid;
@property (nonatomic, copy) NSString *sname;
@property (nonatomic, copy) NSString *desc;
@property int etype;
@property (nonatomic, copy) NSString *btime;
@property (nonatomic, copy) NSString *etime;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *linename;
@property BOOL viewstate;
@end