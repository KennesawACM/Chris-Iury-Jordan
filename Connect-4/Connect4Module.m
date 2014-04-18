//
//  Connect4Module.m
//  Connect-4
//
//  Created by Jordan Thomas on 4/18/14.
//  Copyright (c) 2014 iury bessa. All rights reserved.
//

#import "Connect4Module.h"
#define Red 1
#define Blue 2
#define None 0


@implementation Connect4Module

-(void) setRow: (int *) row{
    
}

-(void) setColumn: (int *) row{
    
}

-(int *) getRow{
    return 0;
}

-(int *) getColumn{
    return 0;
}

-(bool) isColumnFull: (int) row{
    BOOL test = FALSE;
    if(grid[row][5] != 0){
        test =  true;
    }
    return test;
}

-(int) dropCoin:(int) column:(int) coin{
    return 0;
}

-(BOOL) isWinner:(int) column{
    return true;
}

-(int)checkColumn:(int) row{
    int num;
    for (int i = 0; i < 7; i++)
    {
        if(grid[row][i] == None)
        {
            
        }
    }
    return 0;
}
@end
