//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Colin Walsh on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype) init {
    return [self initWithDeck:[[FISCardDeck alloc] init] House:[[FISBlackjackPlayer alloc] initWithName:@"House"] Player:[[FISBlackjackPlayer alloc] initWithName:@"Player"]];
}

- (instancetype) initWithDeck:(FISCardDeck*)deck House:(FISBlackjackPlayer*)house Player:(FISBlackjackPlayer*)player{
    self = [super init];
    
    if (self) {
        _deck = deck;
        _house = house;
        _player = player;
    }
    
    return self;}

-(void)playBlackjack{
    self.deck.resetDeck;
    
    self.house.resetForNewGame;
    self.player.resetForNewGame;
    
    [self dealNewRound];
    
    for (NSUInteger i = 0; i < 3; i++) {
        [self processPlayerTurn];
        [self processHouseTurn];
        
        if (self.player.busted == true){
            [self incrementWinsAndLossesForHouseWins:[self houseWins]];
            break;}
        else if (self.house.busted == true){
            [self incrementWinsAndLossesForHouseWins:[self houseWins]];
            break;}
    }
    
    NSLog(@"%@ \n %@", self.player.description, self.house.description);
    
    
}

-(void)dealNewRound{
    [self dealCardToPlayer];
    [self dealCardToPlayer];
    
    [self dealCardToHouse];
    [self dealCardToHouse];
}

-(void)dealCardToPlayer{
    [self.player acceptCard:[self.deck drawNextCard]];
}

-(void)dealCardToHouse{
    [self.house acceptCard:[self.deck drawNextCard]];
}

-(void)processPlayerTurn{
    
    if (([self.player shouldHit] == true && self.player.stayed == false) && self.player.busted == false) {
        [self dealCardToPlayer];
    }
    
    
}

-(void)processHouseTurn{
    if (([self.house shouldHit] == true && self.house.stayed == false) && self.house.busted == false) {
        [self dealCardToHouse];
    }
}

-(BOOL)houseWins{
    
    if (self.player.busted == true) {
        return YES;
    }
    
    else if (self.house.busted == true){
        return NO;
    }
    
    else if (self.house.blackjack == YES && self.player.blackjack == YES){
        return NO;
    }
    
    else if (self.house.handscore >= self.player.handscore){
        return YES;
    }
    
    else if (self.house.handscore < self.player.handscore){
        return NO;
    }
    
    else {
        return NO;}
}

-(void)incrementWinsAndLossesForHouseWins:(BOOL)housewins{
    if (housewins == YES) {
       self.house.wins += 1;
        self.player.losses += 1;
    }
    else {
        self.player.wins += 1;
        self.house.losses += 1;}
}

@end
