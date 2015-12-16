# GBKUIButtonProgressView
Inspired by Apple’s download progress buttons in the app store

![gif](http://petelada.com/images/plada-loading-button.gif)

# Installation
## Cocoapods
`pod 'GBKUIButtonProgressView', git: 'https://github.com/Guidebook/gbkui-button-progress-view'`

## Manually add to your project
Just add the files in `GBKUIButtonProgressView/` to your project

# Usage
* Create the button as a custom view in your xib, or create it programatically
* Make sure that you don't have a constraint for it's width (it shrinks)--you might need to set the Intrinsic Content Size to "Placeholder" in your xib to avoid errors

![intrinsic content size](https://s3.amazonaws.com/f.cl.ly/items/3r3i1I383h1l1f2f3314/Image%202015-12-15%20at%204.48.08%20PM.png?v=aa7b2b4a)

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

To change the tint color, simply:
```objc
self.downloadButton.tintColor = [UIColor redColor];
```

See the example for more info.

# Todos
* Polish the API a bit
* Allow it to be IBDesignable
