//
//  ViewController.h
//  function_sim
//
//  Created by Diego Garza on 3/23/15.
//  Copyright (c) 2015 Diego Garza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *iMemory;
@property (weak, nonatomic) IBOutlet UIImageView *iArrow;
- (IBAction)btNext:(id)sender;
- (IBAction)btPlay:(id)sender;
- (IBAction)btBack:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lbFunction;
@end

