//
//  Data.h
//  spriteKitDemo
//
//  Created by Ricardo Ruiz on 8/5/14.
//  Copyright (c) 2014 iOS Apps Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
@property (nonatomic,strong) NSString *currentWord;
@property (nonatomic,strong) NSArray *currentWordList;
@property (nonatomic,strong) NSString *filePath;

- (NSArray *)getDataWithLessonID:(int)lessonID;

@end
