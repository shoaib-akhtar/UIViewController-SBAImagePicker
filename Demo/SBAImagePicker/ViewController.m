//
//  ViewController.m
//  SBAImagePicker
//
//  Created by ShoaibAkhtar on 01/10/2017.
//  Copyright © 2017 ShoaibAkhtar. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+SBAImagePicker.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showPicker:(id)sender {
    
    [self showImagePickerControlerWithBlock:^(id image) {
        self.imageView.image=image;
    }];
    
    
    [self showImagePickerControlerWithTitle:@"SBAImagePicker" cameraTitle:@"Capture with camera" libraryTitle:@"Pick from library" cancel:@"Cancel" allowEditing:false block:^(id image) {
        
    }];
}


@end
