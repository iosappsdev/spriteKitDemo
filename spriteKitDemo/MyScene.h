//
//  MyScene.h
//  spriteKitDemo
//

//  Copyright (c) 2014 iOS Apps Development. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@import AVFoundation;
@interface MyScene : SKScene<UIAlertViewDelegate> {
    AVSpeechSynthesizer *synthesizer;
    AVSpeechUtterance *speech;
    NSArray *_localModel;
    int modelObjectIndex;
    
    SKLabelNode *myLabel;
}
@end
