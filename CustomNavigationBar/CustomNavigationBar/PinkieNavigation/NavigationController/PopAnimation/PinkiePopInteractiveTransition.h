//
//  PinkiePopInteractiveTransition.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinkieNagigationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkiePopInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL                          isInteracting;
@property (nonatomic, assign) PinkieNagigationController    *nav;

- (void)respondsToGesture:(UIGestureRecognizer *)gesture;

@end

NS_ASSUME_NONNULL_END
