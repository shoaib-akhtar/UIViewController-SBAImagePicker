//
//  UIViewController+SBAImagePicker.h
//  SBAImagePicker
//
//  Created by ShoaibAkhtar on 01/10/2017.
//  Copyright © 2017 ShoaibAkhtar. All rights reserved.
//
// SBAImagePicker is light weight extension of UIViewController. With the help of SBAImagePicker you can now easily capture image from camera or gallery in a simple block based implementation.
#import <UIKit/UIKit.h>
typedef void(^ImagePickerBlock)(id image);

@interface UIViewController (SBAImagePicker)
-(void)showImagePickerControlerWithBlock:(ImagePickerBlock)block;
-(void)showImagePickerControlerWithTitle:(NSString*)title cameraTitle:(NSString*)cameraTitle libraryTitle:(NSString*)libraryTitle cancel:(NSString*)cancel allowEditing:(BOOL)allowEditing  block:(ImagePickerBlock)block;


@end
