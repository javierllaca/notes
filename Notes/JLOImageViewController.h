//
//  JLOImageViewController.h
//  Notes
//
//  Created by Javier Llaca on 4/23/14.
//  Copyright (c) 2014 Llaca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLOImageViewController : UIViewController <UIImagePickerControllerDelegate,
    UINavigationControllerDelegate>

// buttons
@property UIButton *takePhoto;
@property UIButton *choosePhoto;

// pickers
@property UIImagePickerController *pickFromCamera;
@property UIImagePickerController *pickFromLibrary;

// image and container
@property UIImageView *imageView;
@property UIImage *image;

// properties from past view controllers
@property NSString *noteTitle;
@property NSString *noteBody;

// custom constructor
- (id)initWithTitle:(NSString *)title Body:(NSString *)body;

@end
