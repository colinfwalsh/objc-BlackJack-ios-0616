//
//  FISCard.h
//  OOP-Cards-Model
//
//  Created by Colin Walsh on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

@property (strong, readonly) NSString* suit;
@property (strong, readonly) NSString* rank;
@property (strong, readonly) NSString* cardLabel;
@property (readonly) NSUInteger cardValue;

-(instancetype)initWithSuit:(NSString*)suit rank:(NSString*)rank;

-(instancetype)initWithSuit:(NSString*)suit rank:(NSString*)rank cardLabel:(NSString*)cardLabel cardValue:(NSUInteger)cardValue;

+(NSArray*)validSuits;
+(NSArray*)validRanks;

@end
