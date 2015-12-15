# GBKUIButtonProgressView
Inspired by Apple’s download progress buttons in the app store

![gif](http://petelada.com/images/plada-loading-button.gif)

# Installation
## Cocoapods
pod 'GBKUIButtonProgressView', git: 'https://github.com/Guidebook/gbkui-button-progress-view'

## Manually add to your project
Just add the two files `GBKUIButtonProgressView.h/m` to your project

# Usage
```objc
// Add a target (like a regular button)
[self.downloadButton addTarget:self action:@selector(downloadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

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

-(void)downloadProgressed:(CGFloat)progress {
  // Update the download button's progress when you get a progress update from your item
  [self.downloadButton setProgress:progress animated:YES];
}
```
