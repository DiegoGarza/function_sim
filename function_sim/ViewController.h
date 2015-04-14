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
@property (strong, nonatomic) IBOutlet UITextField *tfModifyVar1;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyVar2;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyVar3;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyFunc;
@property (strong, nonatomic) IBOutlet UILabel *lbVar1;
@property (strong, nonatomic) IBOutlet UILabel *lbVar11;
@property (strong, nonatomic) IBOutlet UILabel *lbVar12;
@property (strong, nonatomic) IBOutlet UILabel *lbVar13;
@property (strong, nonatomic) IBOutlet UILabel *lbVar14;
@property (strong, nonatomic) IBOutlet UILabel *lbVar15;
@property (strong, nonatomic) IBOutlet UILabel *lbVar16;
@property (strong, nonatomic) IBOutlet UILabel *lbVar2;
@property (strong, nonatomic) IBOutlet UILabel *lbVar21;
@property (strong, nonatomic) IBOutlet UILabel *lbVar22;
@property (strong, nonatomic) IBOutlet UILabel *lbVar23;
@property (strong, nonatomic) IBOutlet UILabel *lbVar24;
@property (strong, nonatomic) IBOutlet UILabel *lbVar25;
@property (strong, nonatomic) IBOutlet UILabel *lbVar26;
@property (strong, nonatomic) IBOutlet UILabel *lbVar3;
@property (strong, nonatomic) IBOutlet UILabel *lbVar31;
@property (strong, nonatomic) IBOutlet UILabel *lbFunc;
@property (strong, nonatomic) IBOutlet UILabel *lbFunc1;
@property (strong, nonatomic) IBOutlet UISwitch *swVar1;
@property (strong, nonatomic) IBOutlet UISwitch *swVar2;

@property (strong, nonatomic) IBOutlet UIButton *btConfiguration;
- (IBAction)modifyNames:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *lbFunction;
@end

