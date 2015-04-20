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

//Addresses in memory
@property (weak, nonatomic) IBOutlet UILabel *lbAdd1;
@property (weak, nonatomic) IBOutlet UILabel *lbAdd2;
@property (weak, nonatomic) IBOutlet UILabel *lbAdd3;
@property (weak, nonatomic) IBOutlet UILabel *lbAdd4;
@property (weak, nonatomic) IBOutlet UILabel *lbAddVal1;
@property (weak, nonatomic) IBOutlet UILabel *lbAddVal2;
@property (weak, nonatomic) IBOutlet UILabel *lbAddVal3;
@property (weak, nonatomic) IBOutlet UILabel *lbAddVal4;


- (IBAction)btNext:(id)sender;
- (IBAction)btPlay:(id)sender;
- (IBAction)btBack:(id)sender;

//Variable and function labels
@property (strong, nonatomic) IBOutlet UITextField *tfModifyVar1;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyVar2;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyVar3;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyFunc;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyFuncVar1;
@property (strong, nonatomic) IBOutlet UITextField *tfModifyFuncVar2;

//Variable and function labels
@property (strong, nonatomic) IBOutlet UILabel *lbVar1;
@property (strong, nonatomic) IBOutlet UILabel *lbVar11;
@property (strong, nonatomic) IBOutlet UILabel *lbVar12;

//Upper function variables
@property (strong, nonatomic) IBOutlet UILabel *lbVar13;
@property (strong, nonatomic) IBOutlet UILabel *lbVar14;
@property (strong, nonatomic) IBOutlet UILabel *lbVar15;
@property (strong, nonatomic) IBOutlet UILabel *lbVar16;

@property (strong, nonatomic) IBOutlet UILabel *lbVar2;
@property (strong, nonatomic) IBOutlet UILabel *lbVar21;
@property (strong, nonatomic) IBOutlet UILabel *lbVar22;

//Upper function variables
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

//Animation labels
@property (strong, nonatomic) IBOutlet UILabel *lbAnim1;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim2;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim3;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim4;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim5;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim6;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim7;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim8;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim9;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim10;
@property (strong, nonatomic) IBOutlet UILabel *lbAnim11;


@property (strong, nonatomic) IBOutlet UIButton *btConfiguration;
- (IBAction)modifyNames:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *lbFunction;
@end

