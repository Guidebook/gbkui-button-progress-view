//
//  ViewController.m
//  GBKUIButtonProgressViewExample
//
//  Created by Mike Sprague on 12/15/15.
//  Copyright (c) 2015 Guidebook. All rights reserved.
//

#import "ViewController.h"
#import "GBKUIButtonProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet GBKUIButtonProgressView *downloadButton;
@property (strong, nonatomic) NSOperationQueue *fakeDownloadRequest;
@property (nonatomic, assign) BOOL isDownloaded;
@property (nonatomic, readonly) BOOL isDownloading;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fakeDownloadRequest = [NSOperationQueue new];
    self.fakeDownloadRequest.maxConcurrentOperationCount = 1;
    
    [self.downloadButton addTarget:self action:@selector(downloadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.downloadButton.initialTitle = @"Download";
    self.downloadButton.completeTitle = @"Open";
}

-(void)downloadButtonPressed:(id)sender {
    // Update the button's state based on your downloading item's state
    if(!self.isDownloading && !self.isDownloaded) {
        [self.downloadButton startProgressing];
        [self downloadItem];
    } else if(self.isDownloaded) {
        [self openItem];
    } else {
        [self cancelDownloadingItem];
        [self.downloadButton setProgress:0 animated:YES withCompletion:^{
            [self.downloadButton reset];
        }];
    }
}

-(void)downloadItem {
    [self.fakeDownloadRequest cancelAllOperations];
    ViewController * __weak weakSelf = self;
    
    [self.fakeDownloadRequest addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.2];
        [weakSelf downloadProgressed:0.1];
    }];
    [self.fakeDownloadRequest addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.4];
        [weakSelf downloadProgressed:0.4];
    }];
    [self.fakeDownloadRequest addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:1.0];
        [weakSelf downloadProgressed:0.7];
    }];
    [self.fakeDownloadRequest addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.2];
        [weakSelf downloadCompleted];
    }];
}

-(void)openItem {
    self.isDownloaded = NO;
    [self.downloadButton reset];
}

-(void)cancelDownloadingItem {
    [self.fakeDownloadRequest cancelAllOperations];
    [self.downloadButton reset];
}

-(void)downloadProgressed:(CGFloat)progress {
    // Update the download button's progress when you get a progress update from your item
    [self.downloadButton setProgress:progress animated:YES];
}

-(void)downloadCompleted {
    [self.downloadButton completeProgressing];
    self.isDownloaded = YES;
}

-(BOOL)isDownloading {
    return self.fakeDownloadRequest.operationCount > 0;
}
@end
