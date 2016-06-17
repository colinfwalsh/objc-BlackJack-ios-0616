//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Colin Walsh on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard ()

@property (strong, readwrite) NSString* suit;
@property (strong, readwrite) NSString* rank;
@property (strong, readwrite) NSString* cardLabel;
@property (readwrite) NSUInteger cardValue;

@end

@implementation FISCard



-(instancetype)init {
    return [self initWithSuit:@"!" rank:@"N" cardLabel:@"" cardValue:1];
}

-(instancetype)initWithSuit:(NSString*)suit rank:(NSString*)rank{
    return [self initWithSuit:suit rank:rank cardLabel:@"" cardValue:1];
}

-(instancetype)initWithSuit:(NSString*)suit rank:(NSString*)rank cardLabel:(NSString*)cardLabel cardValue:(NSUInteger)cardValue{
    self = [super init];
    
    
    
    cardValue = [[FISCard validRanks] indexOfObject:rank] + 1;
    
    if (cardValue > 10) {
        cardValue = 10;
    }
    
    if (self) {
        _suit = suit;
        _rank = rank;
        _cardLabel = [NSString stringWithFormat:@"%@%@", suit, rank];
        _cardValue = cardValue;
    }
    
    return self;
}

-(NSString*)description {
    return self.cardLabel;
}

+(NSArray*)validSuits{
    return @[@"♠",@"♥",@"♣",@"♦"];
}
+(NSArray*)validRanks{
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

@end
