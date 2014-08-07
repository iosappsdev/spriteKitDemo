//
//  Data.m
//  spriteKitDemo
//
//  Created by Ricardo Ruiz on 8/5/14.
//  Copyright (c) 2014 iOS Apps Development. All rights reserved.
//

#import "Data.h"

@implementation Data {
    NSString *filePath;
    NSArray *currentWordList;
}

- (NSArray *)getDataWithLessonID:(int)lessonID {
    
    switch (lessonID) {
        case 1:{
            // Create File Path
            filePath = [[NSBundle mainBundle] pathForResource:@"wordList_lesson1" ofType:@"txt"];
        }
            break;
        case 2:{
            
        }
            break;
        case 3:{
            
        }
            break;
            
        default:
            break;
    }
    
    // Load Array From File Path
    currentWordList = [[NSString stringWithContentsOfFile:filePath usedEncoding:nil error:nil] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    return currentWordList;
}

@end
