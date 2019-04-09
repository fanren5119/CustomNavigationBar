//
//  PinkiePopInteractiveTransition.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkiePopInteractiveTransition.h"

@implementation PinkiePopInteractiveTransition

- (void)respondsToGesture:(UIGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:gesture.view];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat scale = point.x / screenWidth;
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.isInteracting = YES;
            [self.nav popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:scale];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            self.isInteracting = NO;
            if (scale > 0.5){
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}


@end
