//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        
        [self resetBoard];

    }

    return self;
}

-(void)resetBoard
{
    NSArray *row1 = @[@"",@"",@""];
    NSArray *row2 = @[@"",@"",@""];
    NSArray *row3 = @[@"",@"",@""];
    
    self.board = [[NSMutableArray alloc]initWithArray: @[[row1 mutableCopy],[row2 mutableCopy],[row3 mutableCopy]]];
 
// Alternative
//
//    self.board = [[NSMutableArray alloc]initWithArray:@[[@[@"",@"",@""]mutableCopy],
//                                                        [@[@"",@"",@""]mutableCopy],
//                                                        [@[@"",@"",@""]mutableCopy]]];
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    
    NSMutableString *rowColumn = self.board[column][row];
    
    return rowColumn;

}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *canPlay = [self playerAtColumn:column row:row];
    
    if ([canPlay isEqualToString:@"X"] || [canPlay isEqualToString:@"O"]){
        return NO;
    }
    
    else {
        return YES;
    }
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{

    if ([self canPlayAtColumn:column row:row]){
        self.board[column][row] = @"X";
    }
    
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    
    if ([self canPlayAtColumn:column row:row]){
        self.board[column][row] = @"O";
    }
    
}

-(NSString *)winningPlayer
{
    
    NSString *win = [[NSMutableString alloc]init];;
    

    //COLUMN
    if ([[self playerAtColumn:0 row:0] isEqualToString:[self playerAtColumn:0 row:1]] &&
        [[self playerAtColumn:0 row:1] isEqualToString:[self playerAtColumn:0 row:2]]){
                
        win = [self playerAtColumn:0 row:0];
    }
            
    if ([[self playerAtColumn:1 row:0] isEqualToString:[self playerAtColumn:1 row:1]] &&
        [[self playerAtColumn:1 row:1] isEqualToString:[self playerAtColumn:1 row:2]]){
                
        win = [self playerAtColumn:1 row:0];
    }
            
    if ([[self playerAtColumn:2 row:0] isEqualToString:[self playerAtColumn:2 row:1]] &&
        [[self playerAtColumn:2 row:1] isEqualToString:[self playerAtColumn:2 row:2]]){
                
        win = [self playerAtColumn:2 row:0];
    }

    
    //ROW
    if ([[self playerAtColumn:0 row:0] isEqualToString:[self playerAtColumn:1 row:0]] &&
        [[self playerAtColumn:1 row:0] isEqualToString:[self playerAtColumn:2 row:0]]){
        
        win = [self playerAtColumn:0 row:0];
    }
            
    if ([[self playerAtColumn:0 row:1] isEqualToString:[self playerAtColumn:1 row:1]] &&
        [[self playerAtColumn:1 row:1] isEqualToString:[self playerAtColumn:2 row:1]]){
                
        win = [self playerAtColumn:0 row:1];
    }
            
    if ([[self playerAtColumn:0 row:2] isEqualToString:[self playerAtColumn:1 row:2]] &&
        [[self playerAtColumn:1 row:2] isEqualToString:[self playerAtColumn:2 row:2]]){
        
        win = [self playerAtColumn:0 row:2];
    }
            

    
    //Diagonal
    if ([[self playerAtColumn:0 row:0] isEqualToString:[self playerAtColumn:1 row:1]] &&
        [[self playerAtColumn:1 row:1] isEqualToString:[self playerAtColumn:2 row:2]]){
        
        win = [self playerAtColumn:0 row:0];
                
    }
            
    if ([[self playerAtColumn:2 row:0] isEqualToString:[self playerAtColumn:1 row:1]] &&
        [[self playerAtColumn:1 row:1] isEqualToString:[self playerAtColumn:0 row:2]]){
                
        win = [self playerAtColumn:2 row:0];
                
    }



    return win;
}

-(BOOL)isADraw
{

    NSUInteger full = 0;
    
    for (NSUInteger i = 0; i < 3; i++){
        for (NSUInteger j = 0; j < 3; j++){
            if ([self.board[i][j] isEqualToString:@"X"] || [self.board[i][j] isEqualToString:@"O"]){
                
                full++;
                
                if (full == 9){
                    return YES;
                }
            }
            
        }
    }
    
    return NO;
}
    


@end
