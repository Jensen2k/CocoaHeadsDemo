//
//  DetailViewController.h
//  cocoatest
//
//  Created by Martin Jensen on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate> {
    NSString *identifier;
}

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSString *identifier;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

-(void)actOnSegue;
-(void)feedback;
-(void)questions;
-(void)crash;
-(void)logging;
-(void)checkpoint;

-(void)notAMethod;

@end

