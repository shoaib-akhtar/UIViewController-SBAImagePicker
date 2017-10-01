# UIViewController+SBAImagePicker
=============================================

SBAImagePicker is light weight extension of UIViewController. With the help of SBAImagePicker you can now easily capture image from camera or gallery in a simple block based implementation.


Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'UIViewController+SBAImagePicker'
```


Usage
-----


```objc
    [self showImagePickerControlerWithBlock:^(id image) {
    	// Do whatever you want to do with image
    }];
```

```obj

	[self showImagePickerControlerWithTitle:@"SBAImagePicker" cameraTitle:@"Capture with camera" libraryTitle:@"Pick from library" cancel:@"Cancel" allowEditing:false block:^(id image) {
        // Do whatever you want to do with image
    }];

```

![](https://preview.ibb.co/mG8S6G/Simulator_Screen_Shot_01_Oct_2017_3_42_24_PM.png)


License
-------

UIViewController+SBAImagePicker is under [MIT](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) file for more info.
