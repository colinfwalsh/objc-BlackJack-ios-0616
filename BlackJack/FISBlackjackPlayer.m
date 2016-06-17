//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Colin Walsh on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

- (instancetype)init {
    return [self initWithName:@"" CardsInHand:[[NSMutableArray alloc]init] AceInHand:NO BlackJack:NO Busted:NO Stayed:NO Handscore:0 Wins:0 Losses:0];
}

- (instancetype)initWithName:(NSString*)name{
    return [self initWithName:name CardsInHand:[[NSMutableArray alloc]init] AceInHand:NO BlackJack:NO Busted:NO Stayed:NO Handscore:0 Wins:0 Losses:0];
}

- (instancetype)initWithName:(NSString*)name CardsInHand:(NSMutableArray*) cardsInHand AceInHand:(BOOL)aceInHand BlackJack:(BOOL)blackjack Busted:(BOOL)busted Stayed:(BOOL)stayed Handscore:(NSUInteger)handscore Wins:(NSUInteger)wins Losses:(NSUInteger)losses{
    self = [super init];
    
    if (self) {
        _name = name;
        _cardsInHand = cardsInHand;
        _aceInHand = aceInHand;
        _blackjack = blackjack;
        _busted = busted;
        _stayed = stayed;
        _handscore = handscore;
        _wins = wins;
        _losses = losses;
    }
    
    
    return self;}

- (NSString*)description {
    NSMutableString* descriptionReturn = [[NSMutableString alloc] init];
    
    [descriptionReturn appendFormat:@"\n name: %@\n cards:\n", self.name];
    
    for (NSUInteger i = 0; i < [self.cardsInHand count]; i++) {
        
        [descriptionReturn appendFormat:@ " %@\n", self.cardsInHand[i]];
        
    }
    
    [descriptionReturn appendFormat:@" handscore: %lu \n ace: %d \n stayed: %d \n blackjack: %d \n busted: %d \n wins: %lu \n losses: %lu \n", self.handscore, (int)self.aceInHand, (int)self.stayed, (int)self.blackjack, (int)self.busted, self.wins, self.losses];
    
    return descriptionReturn;
}

- (void)resetForNewGame{
    [self.cardsInHand removeAllObjects];
    self.handscore = 0;
    self.aceInHand = NO;
    self.blackjack = NO;
    self.busted = NO;
    self.stayed = NO;
}

- (void)acceptCard:(FISCard*)card{
    
    NSUInteger sum = 0;
    
    if (card.cardValue == 1){
        self.aceInHand = YES;
    }
    
    if (self.aceInHand == YES && self.handscore <= 11) {
        sum += 10;
    }
    
    [self.cardsInHand addObject:card];
    
    for (FISCard* card in self.cardsInHand) {
        sum += card.cardValue;
    }
    self.handscore = sum;
    
    if (sum == 21) {
        self.blackjack = YES;
    }
    
    if (sum > 21) {
        self.busted = YES;
    }
    
}

- (BOOL)shouldHit{
    if (self.handscore >= 16) {
        self.stayed = YES;
        return NO;
    }
    
    else {
        return YES;
    }
}

@end
