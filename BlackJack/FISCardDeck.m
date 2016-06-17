//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Colin Walsh on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"
#import "FISCard.h"


@implementation FISCardDeck

-(instancetype) init {
    return [self initWithRemainingCards:[[NSMutableArray alloc]init] DealtCards:[[NSMutableArray alloc]init]];}

-(instancetype)initWithRemainingCards:(NSMutableArray*)remainingCards DealtCards:(NSMutableArray*)dealtCards{
    self = [super init];
    
    if (self) {
        _remainingCards = remainingCards;
        _dealtCards = dealtCards;
        
        [self makeDeck];
    }
    
    return self;}

-(NSString*)description {
    
    NSMutableString* deckCountAndCardOutput = [[NSMutableString alloc]init];
    
    
    [deckCountAndCardOutput appendFormat:@"count: %li\ncards:\n", [self.remainingCards count]];
    
    for (NSUInteger i = 0; i < [self.remainingCards count]; i++) {
        
        [deckCountAndCardOutput appendFormat:@" %@ ", self.remainingCards[i]];
        
    }
    
    NSLog(@"%@", deckCountAndCardOutput);
    
    
    return deckCountAndCardOutput;
}

-(void)makeDeck{
    // FISCard *card = [[FISCard alloc] init];
    
    for (NSString* suits in [FISCard validSuits]) {
        for (NSString* rank in [FISCard validRanks]) {
            FISCard *card = [[FISCard alloc] initWithSuit:suits rank:rank];
            [self.remainingCards addObject:card];
        }
    }
}

-(FISCard*)drawNextCard{
    
    if ([self.remainingCards count] > 0){
        NSUInteger randomDraw = arc4random_uniform([self.remainingCards count]);
        FISCard* card = [self.remainingCards objectAtIndex:randomDraw];
        
        [self.dealtCards addObject:card];
        [self.remainingCards removeObject:card];
        
        return card;
    }
    else {
        return nil;}
    
}
-(void)resetDeck{
    [self gatherDealtCards];
    [self shuffleRemainingCards];
    [self.dealtCards removeAllObjects];
    
    
}
-(void)gatherDealtCards{
    
    for (FISCard* dealtCards in self.dealtCards) {
        [self.remainingCards addObject:dealtCards];
    }
    
    [self.dealtCards removeAllObjects];
    
}
-(void)shuffleRemainingCards{
    
    for (NSUInteger i = 0; i < [self.remainingCards count]; i++) {
        [self drawNextCard];
    }
    
    for (FISCard* card in self.dealtCards) {
        [self.remainingCards addObject:card];
    }
    
    
    
    
    
    
    
    
}

@end
