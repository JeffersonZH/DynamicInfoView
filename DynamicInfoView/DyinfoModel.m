//
//  DyinfoModel.m
//  RailTraffic
//
//  Created by MagicStudio on 12-12-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DyinfoModel.h"

@implementation DyinfoModel
@synthesize infoid;
@synthesize sname;
@synthesize desc;
@synthesize etype;
@synthesize btime;
@synthesize etime;
@synthesize ptime;
@synthesize linename;
@synthesize viewstate;

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.infoid forKey:@"infoid"];
    [aCoder encodeObject:self.sname forKey:@"sname"];
    [aCoder encodeObject:self.desc forKey:@"desc"];
    [aCoder encodeInt:self.etype forKey:@"etype"];
    [aCoder encodeObject:self.btime forKey:@"btime"];
    [aCoder encodeObject:self.etime forKey:@"etime"];
    [aCoder encodeObject:self.ptime forKey:@"ptime"];
    [aCoder encodeObject:self.linename forKey:@"linename"];
    [aCoder encodeBool:self.viewstate forKey:@"viewstate"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.infoid = [aDecoder decodeObjectForKey:@"infoid"];
        self.sname = [aDecoder decodeObjectForKey:@"sname"];
        self.desc = [aDecoder decodeObjectForKey:@"desc"];
        self.etype = [aDecoder decodeIntForKey:@"etype"];
        self.btime = [aDecoder decodeObjectForKey:@"btime"];
        self.etime = [aDecoder decodeObjectForKey:@"etime"];
        self.ptime = [aDecoder decodeObjectForKey:@"ptime"];
        self.linename = [aDecoder decodeObjectForKey:@"linename"];
        self.viewstate = [aDecoder decodeBoolForKey:@"viewstate"];
    }
    return self;
}
@end
