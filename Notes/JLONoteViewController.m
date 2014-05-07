//
//  JLONoteViewController.m
//  Notes
//
//  Created by Javier Llaca on 4/23/14.
//  Copyright (c) 2014 Llaca. All rights reserved.
//

#import "JLONoteViewController.h"

@interface JLONoteViewController ()

@end

@implementation JLONoteViewController

- (id)initWithNote:(JLONote *)note
{
    self = [super init];
    if (self) {
        _note = note;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitle:_note.title];
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGSize navBarSize = self.navigationController.navigationBar.frame.size;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10,
        screenSize.width - 20, screenSize.height - navBarSize.height)];
    
    _body = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, 0)];
    _body.textAlignment = NSTextAlignmentJustified;
    _body.text = _note.body;
    _body.textColor = [UIColor blackColor];
    [_body setFont:[UIFont systemFontOfSize:18]];
    [_body sizeToFit];
    
    // We want the width of the image to fit the width of the scroll view
    double ratio = _note.image.size.width / _scrollView.frame.size.width;
    
    _image = [[UIImageView alloc] initWithFrame: CGRectMake(0, _body.frame.size.height + 20,
                            _note.image.size.width / ratio, _note.image.size.height / ratio)];
    _image.image = _note.image;
    
    [_scrollView addSubview:_body];
    [_scrollView addSubview:_image];
    
    // Set content size of scroll view to fit the body and image of note
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width,
                    _body.frame.size.height + 20 + _image.frame.size.height)];
    [self.view addSubview:_scrollView];
}

@end
