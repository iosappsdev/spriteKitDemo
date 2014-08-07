//
//  MyScene.m
//  spriteKitDemo
//
//  Created by Ricardo Ruiz on 8/5/14.
//  Copyright (c) 2014 iOS Apps Development. All rights reserved.
//

#import "MyScene.h"
#import "Data.h"


@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        synthesizer = [[AVSpeechSynthesizer alloc]init];
        
        
        Data *localModel = [[Data alloc]init];
        _localModel = [localModel getDataWithLessonID:1];
        modelObjectIndex = 0;
        
        self.backgroundColor = [SKColor grayColor];
        myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
        myLabel.fontSize = 120;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        SKLabelNode *next = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE"];
        next.text = @"Next";
        next.fontSize = 90;
        next.position = CGPointMake(10,10);
        [self addChild:next];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    /*for (UITouch *touch in touches) {
        //CGPoint location = [touch locationInNode:self];
        
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }*/
    
    speech = [AVSpeechUtterance speechUtteranceWithString:[_localModel objectAtIndex:modelObjectIndex]];
    // Speech Rate/Speed
    [speech setRate:0.050f];
    // Speech Volume
    [speech setVolume:0.8f];
    [synthesizer speakUtterance:speech];
    
    if (modelObjectIndex <= 8) {
        
        myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
        modelObjectIndex++;
    } else if (modelObjectIndex == 9) {
        
        myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
        modelObjectIndex = 0;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
