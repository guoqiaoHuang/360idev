//
//  UIViewController+KTCompositeView.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (KTCompositeView)

- (void)addSubview:(UIView *)subview toPlaceholder:(UIView *)placeholder;

@end
