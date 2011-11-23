//
//  MasterViewController.h
//  cocoatest
//
//  Created by Martin Jensen on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

enum Sections {
    kCheckPoint = 0,
    kLogging,
    kQuestion,
    kFeedback,
    kCrash,
    NUM_SECTIONS
};

@end
