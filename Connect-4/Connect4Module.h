//
//  Connect4Module.h
//  Connect-4
//
//  Created by Jordan Thomas on 4/18/14.
//  Copyright (c) 2014 iury bessa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connect4Module : NSObject
{
    int *grid[7][6];
}
-(void)init;
-(bool) isColumnFull: (int) full;
-(int) dropCoin:(int) column;
-(BOOL) isWinner;



@end
