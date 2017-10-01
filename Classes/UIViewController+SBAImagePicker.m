//
//  UIViewController+SBAImagePicker.m
//  SBAImagePicker
//
//  Created by ShoaibAkhtar on 01/10/2017.
//  Copyright © 2017 ShoaibAkhtar. All rights reserved.
//

#import "UIViewController+SBAImagePicker.h"
#import <objc/runtime.h>

@interface UIViewController (Private)
@property (nonatomic,strong) ImagePickerBlock block;
@end

@implementation UIViewController (Private)
@dynamic block;

-(void)setBlock:(ImagePickerBlock)block
{
      objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(ImagePickerBlock)block
{
    return objc_getAssociatedObject(self, @selector(block));
}
@end


@interface UIViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end


@implementation UIViewController (SBAImagePicker)
-(void)showImagePickerControlerWithTitle:(NSString*)title cameraTitle:(NSString*)cameraTitle libraryTitle:(NSString*)libraryTitle cancel:(NSString*)cancel allowEditing:(BOOL)allowEditing  block:(ImagePickerBlock)block
{
    self.block = block;
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* camera=[UIAlertAction actionWithTitle:cameraTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePickerController animated:YES completion:^{
                
            }];
            [imagePickerController setAllowsEditing:allowEditing];
            
        }
        else
        {
            [self showAlertWithMessageText:NSLocalizedString(@"Error", nil) inforTxt:NSLocalizedString(@"Sorry! Camera is not available",nil) btnTitle:NSLocalizedString(@"Ok", nil)];
        }
        
    }];
    
    UIAlertAction* picture=[UIAlertAction actionWithTitle:libraryTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [imagePickerController setAllowsEditing:allowEditing];
            
            
            [self presentViewController:imagePickerController animated:YES completion:^{
            }];
        }
        else
        {
            [self showAlertWithMessageText:NSLocalizedString(@"Error", nil) inforTxt:NSLocalizedString(@"Sorry! Photo Library is not available",nil) btnTitle:NSLocalizedString(@"Ok", nil)];
        }
        
        
    }];
    
    UIAlertAction* cancelAction=[UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [controller addAction:camera];
    [controller addAction:picture];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];

}
-(void)showImagePickerControlerWithBlock:(ImagePickerBlock)block
{
    [self showImagePickerControlerWithTitle:NSLocalizedString(@"SBAImagePicker", nil) cameraTitle:NSLocalizedString(@"Take Photo", nil) libraryTitle:NSLocalizedString(@"Choose From Gallery", nil) cancel:NSLocalizedString(@"Cancel", nil) allowEditing:false block:block];
}


#pragma mark - ImagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if([info valueForKey:UIImagePickerControllerOriginalImage]){
        
        UIImage *chosenImage =info[UIImagePickerControllerOriginalImage];
        if (self.block) {
            self.block(chosenImage);
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)showAlertWithMessageText:(NSString*)msgTxt inforTxt:(NSString*)infoText btnTitle:(NSString*)btnTitle
{
    UIAlertController* alertController=[UIAlertController alertControllerWithTitle:msgTxt message:infoText preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
