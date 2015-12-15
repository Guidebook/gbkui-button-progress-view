//
//  GBKUIProgressButton.h
//  Pods
//
//  Created by Peter Lada.
//
//

#import <UIKit/UIKit.h>

@interface GBKUIButtonProgressView : UIView

@property (assign, nonatomic) BOOL disabled;
@property (assign, nonatomic, readonly) CGFloat progress;
@property (assign, nonatomic, readonly) BOOL isProgressing;
@property (assign, nonatomic, readonly) BOOL isComplete;

- (void)startProgressing;
- (void)completeProgressing;
- (void)reset;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated withCompletion:(void(^)())completion;
- (void)setInitialTitle:(NSString*)title;
- (void)setCompleteTitle:(NSString*)title;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
