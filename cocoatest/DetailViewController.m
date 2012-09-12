//
//  DetailViewController.m
//  cocoatest
//
//  Created by Martin Jensen on 23.11.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize identifier;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    NSLog(@"Appeared with segue: %@", self.identifier);
    
    [self actOnSegue];
    
    
}

-(void)actOnSegue {
    
    if ([identifier isEqualToString:@"checkpoint"]) {
        [self checkpoint];
    } else if([identifier isEqualToString:@"logging"]) {
        [self logging];
    } else if([identifier isEqualToString:@"questions"]) {
        [self questions];
    } else if([identifier isEqualToString:@"feedback"]) {
        [self feedback];
    } else if([identifier isEqualToString:@"crash"]) {
        [self crash];
    }
    
}

-(void)feedback {
    [TestFlight openFeedbackView];
    self.detailDescriptionLabel.text = @"Feedback, bitches!";
}
-(void)questions {
    [TestFlight passCheckpoint:@"Questions"];
    self.detailDescriptionLabel.text = @"Time for questions!";
}
-(void)crash {
    TFLog(@"Crashing");
    [self notAMethod];
}
-(void)logging {
    TFLog(@"This is a logging");
    self.detailDescriptionLabel.text = @"I just told something to TestFlightApp";
}
-(void)checkpoint {
    self.detailDescriptionLabel.text = @"Just passed a checkpoint!";
    [TestFlight passCheckpoint:@"This is a checkpoint"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
