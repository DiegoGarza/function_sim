//
//  ViewController.m
//  function_sim
//
//  Created by Diego Garza on 3/23/15.
//  Copyright (c) 2015 Diego Garza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property BOOL configurationFlag;
@property (strong, nonatomic) NSDictionary *config;
@property (strong, nonatomic) NSMutableArray *labels;
@property (nonatomic) BOOL play;
@property (nonatomic) BOOL leftRef;
@property (nonatomic) BOOL rightRef;
@property (nonatomic) BOOL bothRef;
@property (nonatomic) NSInteger step;
@property (nonatomic) NSInteger timer;
@property (nonatomic) NSInteger labelsSize;
@property (nonatomic) NSInteger staticValue1;
@property (nonatomic) NSInteger staticValue2;
@property (nonatomic) NSInteger staticValueResult;
@property (nonatomic) NSInteger staticValueFunction1;
@property (nonatomic) NSInteger staticValueFunction2;
@property (nonatomic) NSTimer *animationTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Setup and hiding
    _leftRef = false;
    _rightRef = false;
    _bothRef = false;
    [self setupAndHiding];
    
    _labels = [NSMutableArray arrayWithObjects:_lbAnim1,_lbAnim2,_lbAnim3,_lbAnim4,_lbAnim5,_lbAnim6,_lbAnim7,_lbAnim8,_lbAnim9,_lbAnim10,_lbAnim11, nil];
    _labelsSize = _labels.count;
    
    _timer = 2;
    
    //Load config from plist
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *docfilePath = [basePath stringByAppendingPathComponent:@"Property List.plist"];
    self.config = [[NSDictionary alloc] initWithContentsOfFile: docfilePath];
    _tfModifyVar1.text = [_config objectForKey:@"nomVar1"];
    _tfModifyVar2.text = [_config objectForKey:@"nomVar2"];
    _tfModifyVar3.text = [_config objectForKey:@"nomVar3"];
    _tfModifyFuncVar1.text = [_config objectForKey:@"nomFuncVar1"];
    _tfModifyFuncVar2.text = [_config objectForKey:@"nomFuncVar2"];
    _tfStaticValue1.text = [_config objectForKey:@"staticValue1"];
    _tfStaticValue2.text = [_config objectForKey:@"staticValue2"];
    _tfStaticVarValue1.text = [_config objectForKey:@"staticVarValue1"];
    _tfStaticVarValue2.text = [_config objectForKey:@"staticVarValue2"];
    _tfModifyFunc.text = [_config objectForKey:@"nomFunc"];
    _swVar1.on = [[_config objectForKey:@"refVar1"] boolValue];
    _swVar2.on = [[_config objectForKey:@"refVar2"] boolValue];
    _tfTimer.text = [NSString stringWithFormat:@"%ld", (long) _timer];
    
    if(_swVar1.on && _swVar2.on){
        _bothRef = true;
    }
    else if(_swVar1.on){
        _leftRef = true;
    }
    else if(_swVar2.on){
        _rightRef = true;
    }
    
    //Set names
    [self setLabelsAndReferences];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}

- (IBAction)btNext:(id)sender {
    if(_step != _labelsSize-1)
        [self animation:@"next"];
}

- (IBAction)btPlay:(id)sender {
    if(!_play){
        [sender setImage:[UIImage imageNamed:@"pause@2x.png"] forState:UIControlStateSelected];
        [sender setSelected:YES];
        _play = true;
        [self animation:@"go"];
    }
    else {
        [sender setImage:[UIImage imageNamed:@"play@2x.png"] forState:UIControlStateNormal];
        [sender setSelected:NO];
        _play = false;
        [self animation:@"stop"];
    }
}

- (IBAction)btBack:(id)sender {
    if(_step != -1)
        [self animation:@"back"];
}

- (IBAction)clicksReset:(id)sender {
    [self setupAndHiding];
}

- (void) animation:(NSString*) action {
    if ([action isEqualToString:@"go"]) {
         _animationTimer = [NSTimer scheduledTimerWithTimeInterval:(double) _timer
                                             target:self
                                           selector:@selector(doSomethingWhenTimeIsUp:)
                                           userInfo:nil
                                            repeats:YES];
    }
    else if ([action isEqualToString:@"stop"]) {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
    else if ([action isEqualToString:@"next"]) {
        _step = (_step+1) % _labelsSize;
        [[self.labels objectAtIndex:_step] setHidden:NO];
        _step--;
        
        switch (_step) {
            case -1:
                break;
            case 0:
                _lbAddVal1.hidden = NO;
                _lbAddVal2.hidden = NO;
                _lbAddVal3.hidden = NO;
                _lbAdd1.hidden = NO;
                _lbAdd2.hidden = NO;
                _lbAdd3.hidden = NO;
                _lbAdd1.text = @"---";
                _lbAdd2.text = @"---";
                _lbAdd3.text = @"---";
                break;
            case 1:
                _iArrow.hidden = NO;
                _lbAdd1.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1];
                break;
            case 2:
                _lbAdd2.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2];
                [self makeAnimation:50 y:160];
                break;
            case 3:
                [self makeAnimation:50 y:250];
                break;
            case 4:
                if(_leftRef){
                    _lbAddVal5.hidden = NO;
                    _lbAdd5.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2];
                    _lbAdd5.hidden = NO;
                    [self makeAnimation:50 y:430];
                }
                else if(_rightRef) {
                    _lbAddVal4.hidden = NO;
                    _lbAdd4.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1];
                    _lbAdd4.hidden = NO;
                    [self makeAnimation:50 y:340];
                }
                else if(_bothRef){
                    
                }
                else{
                    _lbAddVal4.hidden = NO;
                    _lbAddVal5.hidden = NO;
                    _lbAdd4.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1];
                    _lbAdd5.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2];
                    _lbAdd4.hidden = NO;
                    _lbAdd5.hidden = NO;
                    [self makeAnimation:50 y:340];
                }
                break;
            case 5:
                _lbAddVal6.hidden = NO;
                _lbAdd6.text = @"---";
                _lbAdd6.hidden = NO;
                [self makeAnimation:50 y:520];
                break;
            case 6:
                if(_leftRef){
                    _lbAdd1.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1 + _staticValueFunction1];
                    [self makeAnimation:50 y:80];
                }
                else if(_bothRef){
                    _lbAdd1.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1 + _staticValueFunction1];
                    [self makeAnimation:50 y:80];
                }
                else{
                    _lbAdd4.hidden = NO;
                    _lbAdd4.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1 + _staticValueFunction1];
                    [self makeAnimation:50 y:340];
                }
                break;
            case 7:
                if(_rightRef){
                    _lbAdd2.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2 + _staticValueFunction2];
                    [self makeAnimation:50 y:160];
                }
                else if (_bothRef){
                    _lbAdd2.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2 + _staticValueFunction2];
                    [self makeAnimation:50 y:160];
                }
                else {
                    _lbAdd5.hidden = NO;
                    _lbAdd5.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2 + _staticValueFunction2];
                    [self makeAnimation:50 y:430];
                }
                break;
            case 8:
                 _lbAdd6.hidden = NO;
                _lbAdd6.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1 + _staticValueFunction1 + _staticValueFunction2 + _staticValue2];
                [self makeAnimation:50 y:520];
                break;
            case 9:
                _lbAdd3.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1 + _staticValueFunction1 + _staticValueFunction2 + _staticValue2];
                _lbAdd3.hidden = NO;
                _lbAdd4.hidden = YES;
                _lbAdd5.hidden = YES;
                _lbAdd6.hidden = YES;
                _lbAddVal4.hidden = YES;
                _lbAddVal5.hidden = YES;
                _lbAddVal6.hidden = YES;
                [self makeAnimation:50 y:250];
                break;
            default:
                break;
        }
        
        if (_step < 0) {
            _step = _labelsSize + _step;
        }
        
        [[self.labels objectAtIndex:_step] setHidden:YES];
         _step = (_step+1) %_labelsSize;
         
    }
    else if ([action isEqualToString:@"back"] && _step!= 0) {
        _step--;
        if (_step < 0) {
            _step = _labelsSize + _step;
        }
        [[self.labels objectAtIndex:_step] setHidden:NO];
        _step = (_step+1) %_labelsSize;
        [[self.labels objectAtIndex:_step] setHidden:YES];
        _step--;
        
        switch (_step) {
            case -1:
                break;
            case 0:
                _lbAddVal1.hidden = YES;
                _lbAddVal2.hidden = YES;
                _lbAddVal3.hidden = YES;
                _lbAdd1.hidden = YES;
                _lbAdd2.hidden = YES;
                _lbAdd3.hidden = YES;
                break;
            case 1:
                _iArrow.hidden = YES;
                _lbAdd1.hidden = NO;
                _lbAdd1.text = @"---";
                break;
            case 2:
                _lbAdd2.hidden = NO;
                _lbAdd2.text = @"---";
                [self makeAnimation:50 y:80];
                break;
            case 3:
                _lbAdd3.hidden = NO;
                _lbAdd3.text = @"---";
                [self makeAnimation:50 y:165];
                break;
            case 4:
                _lbAddVal4.hidden = YES;
                _lbAddVal5.hidden = YES;
                _lbAdd4.hidden = YES;
                _lbAdd5.hidden = YES;
                [self makeAnimation:50 y:250];
                break;
            case 5:
                if(_leftRef){
                    _lbAddVal6.hidden = YES;
                    _lbAdd6.hidden = YES;
                    [self makeAnimation:50 y:430];
                }
                else if(_bothRef){
                    _lbAddVal6.hidden = YES;
                    _lbAdd6.hidden = YES;
                    [self makeAnimation:50 y:250];
                }
                else {
                    _lbAddVal6.hidden = YES;
                    _lbAdd6.hidden = YES;
                    [self makeAnimation:50 y:340];
                }
                break;
            case 6:
                if(_leftRef){
                    _lbAdd1.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1];
                    _lbAdd1.hidden = NO;
                    [self makeAnimation:50 y:520];
                }
                else if(_rightRef){
                    _lbAdd4.hidden = NO;
                    _lbAdd4.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1];
                    [self makeAnimation:50 y:520];
                }
                else if(_bothRef){
                    _lbAdd1.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1];
                    _lbAdd1.hidden = NO;
                    [self makeAnimation:50 y:520];
                }
                else {
                    _lbAdd4.hidden = NO;
                    _lbAdd4.text = [NSString stringWithFormat:@"%ld", (long) _staticValue1];
                    [self makeAnimation:50 y:520];
                }
                break;
            case 7:
                if(_leftRef) {
                    _lbAdd5.hidden = NO;
                    _lbAdd5.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2];
                    [self makeAnimation:50 y:80];
                }
                else if(_rightRef){
                    _lbAdd2.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2];
                    _lbAdd2.hidden = NO;
                    [self makeAnimation:50 y:340];
                }
                else if(_bothRef){
                    _lbAdd2.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2];
                    _lbAdd2.hidden = NO;
                    [self makeAnimation:50 y:80];
                }
                else {
                    _lbAdd5.hidden = NO;
                    _lbAdd5.text = [NSString stringWithFormat:@"%ld", (long) _staticValue2];
                    [self makeAnimation:50 y:340];
                }
                break;
            case 8:
                _lbAdd6.text = @"---";
                _lbAdd6.hidden = NO;
                if(_rightRef)
                    [self makeAnimation:50 y:160];
                else if(_leftRef)
                    [self makeAnimation:50 y:430];
                else if(_bothRef)
                    [self makeAnimation:50 y:160];
                else
                    [self makeAnimation:50 y:430];
                break;
            case 9:
                if(_leftRef){
                    _lbAdd3.text = @"---";
                    _lbAdd3.hidden = NO;
                    _lbAdd5.hidden = NO;
                    _lbAdd6.hidden = NO;
                    _lbAddVal5.hidden = NO;
                    _lbAddVal6.hidden = NO;
                    [self makeAnimation:50 y:520];
                }
                else if(_rightRef){
                    _lbAdd3.text = @"---";
                    _lbAdd3.hidden = NO;
                    _lbAdd4.hidden = NO;
                    _lbAdd6.hidden = NO;
                    _lbAddVal4.hidden = NO;
                    _lbAddVal6.hidden = NO;
                    [self makeAnimation:50 y:520];
                }
                else if(_bothRef){
                    _lbAdd3.text = @"---";
                    _lbAdd3.hidden = NO;
                    _lbAdd6.hidden = NO;
                    _lbAddVal6.hidden = NO;
                    [self makeAnimation:50 y:520];
                }
                else {
                    _lbAdd3.text = @"---";
                    _lbAdd3.hidden = NO;
                    _lbAdd4.hidden = NO;
                    _lbAdd5.hidden = NO;
                    _lbAdd6.hidden = NO;
                    _lbAddVal4.hidden = NO;
                    _lbAddVal5.hidden = NO;
                    _lbAddVal6.hidden = NO;
                    [self makeAnimation:50 y:520];
                }
                break;
            default:
                break;
        }
    }
}

-(void) makeAnimation:(int)x y:(int)y{
    [UIView animateWithDuration:0.5 animations:^{
        self.iArrow.center = CGPointMake(x, y);
    } completion:^(BOOL finished){
    }];
}

- (void) doSomethingWhenTimeIsUp:(NSTimer*)t {
    if(_step != _labelsSize-1)
        [self animation:@"next"];
    else {
        [self btPlay:_btPlay];
        _play = false;
        [self animation:@"stop"];
    }
}

//Shows the configuration buttons and modifies
- (IBAction)modifyNames:(id)sender {
    //Show configuration controls
    if(!_configurationFlag) {
        _tfTimer.hidden = NO;
        _lbTimer.hidden = NO;
        _tfModifyVar1.hidden = NO;
        _tfModifyVar2.hidden = NO;
        _tfModifyVar3.hidden = NO;
        _tfModifyFuncVar1.hidden = NO;
        _tfModifyFuncVar2.hidden = NO;
        _tfModifyFunc.hidden = NO;
        _swVar1.hidden = NO;
        _swVar2.hidden = NO;
        _tfStaticVarValue1.hidden = NO;
        _tfStaticVarValue2.hidden = NO;
        _tfStaticValue1.hidden = NO;
        _tfStaticValue2.hidden = NO;
        _configurationFlag = true;
        [_btConfiguration setTitle:@"Done" forState:UIControlStateNormal];
    }
    //Hide controls and modify
    else {
        //Modify names
        [self setLabelsAndReferences];
        
        //Modify plist
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
        NSMutableDictionary *plist = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        NSString *docfilePath = [basePath stringByAppendingPathComponent:@"Property List.plist"];
        [plist setObject:_tfModifyVar1.text forKey:@"nomVar1"];
        [plist setObject:_tfModifyVar2.text forKey:@"nomVar2"];
        [plist setObject:_tfModifyVar3.text forKey:@"nomVar3"];
        [plist setObject:_tfModifyFuncVar1.text forKey:@"nomFuncVar1"];
        [plist setObject:_tfModifyFuncVar2.text forKey:@"nomFuncVar2"];
        [plist setObject:_tfStaticVarValue1.text forKey:@"staticVarValue1"];
        [plist setObject:_tfStaticVarValue2.text forKey:@"staticVarValue2"];
        [plist setObject:_tfStaticValue1.text forKey:@"staticValue1"];
        [plist setObject:_tfStaticValue2.text forKey:@"staticValue2"];
        [plist setObject:_tfModifyFunc.text forKey:@"nomFunc"];
        [plist setObject:[NSNumber numberWithBool:_swVar1.isOn] forKey:@"refVar1"];
        [plist setObject:[NSNumber numberWithBool:_swVar2.isOn] forKey:@"refVar2"];
        [plist writeToFile:docfilePath atomically:YES];
        _timer = [_tfTimer.text integerValue];
        
        _bothRef = false;
        _leftRef = false;
        _rightRef = false;
        
        if(_swVar1.on && _swVar2.on){
            _bothRef = true;
        }
        else if(_swVar1.on){
            _leftRef = true;
        }
        else if(_swVar2.on){
            _rightRef = true;
        }
        
        //Hide config
        _tfTimer.hidden = YES;
        _lbTimer.hidden = YES;
        _tfModifyVar1.hidden = YES;
        _tfModifyVar2.hidden = YES;
        _tfModifyVar3.hidden = YES;
        _tfModifyFuncVar1.hidden = YES;
        _tfModifyFuncVar2.hidden = YES;
        _tfStaticVarValue1.hidden = YES;
        _tfStaticVarValue2.hidden = YES;
        _tfStaticValue1.hidden = YES;
        _tfStaticValue2.hidden = YES;
        _tfModifyFunc.hidden = YES;
        _swVar1.hidden = YES;
        _swVar2.hidden = YES;
        [self setupAndHiding];
        [_btConfiguration setTitle:@"Configuration" forState:UIControlStateNormal];
        _configurationFlag = false;
    }
}

- (void) setLabelsAndReferences {
    if(_swVar1.isOn) {
        NSString *var = _tfModifyFuncVar1.text;
        _lbVar13.text = [NSString stringWithFormat:@"&%@", var];
    }
    else {
        _lbVar13.text = _tfModifyFuncVar1.text;
    }
    if(_swVar2.isOn) {
        NSString *var = _tfModifyFuncVar2.text;
        _lbVar23.text = [NSString stringWithFormat:@"&%@", var];
    }
    else {
        _lbVar23.text = _tfModifyFuncVar2.text;
    }
    
    //Values of variables
    _staticValue1=[_tfStaticVarValue1.text integerValue];
    _staticValue2=[_tfStaticVarValue2.text integerValue];
    _staticValueResult=0;
    _staticValueFunction1=[_tfStaticValue1.text integerValue];
    _staticValueFunction2=[_tfStaticValue2.text integerValue];
    
    //Main var1
    _lbVar1.text = _tfModifyVar1.text;
    _lbVar11.text = _tfModifyVar1.text;
    _lbVar12.text = _tfModifyVar1.text;
    
    //Function var1
    _lbVar14.text = _tfModifyFuncVar1.text;
    _lbVar15.text = _tfModifyFuncVar1.text;
    _lbVar16.text = _tfModifyFuncVar1.text;
    
    //Main var2
    _lbVar2.text = _tfModifyVar2.text;
    _lbVar21.text = _tfModifyVar2.text;
    _lbVar22.text = _tfModifyVar2.text;
    
    //Function var2
    _lbVar24.text = _tfModifyFuncVar2.text;
    _lbVar25.text = _tfModifyFuncVar2.text;
    _lbVar26.text = _tfModifyFuncVar2.text;
    
    //Main Var3
    _lbVar3.text = _tfModifyVar3.text;
    _lbVar31.text = _tfModifyVar3.text;
    
    //Function name
    _lbFunc.text = _tfModifyFunc.text;
    _lbFunc1.text = _tfModifyFunc.text;
    
    //Static Variable values
    _lbStaticVarValue1.text = [NSString stringWithFormat:@"= %ld;", (long) [_tfStaticVarValue1.text integerValue]];
    _lbStaticVarValue2.text = [NSString stringWithFormat:@"= %ld;", (long) [_tfStaticVarValue2.text integerValue]];
    _lbStaticValue1.text = [NSString stringWithFormat:@"+ %ld;", (long) [_tfStaticValue1.text integerValue]];
    _lbStaticValue2.text = [NSString stringWithFormat:@"+ %ld;", (long) [_tfStaticValue2.text integerValue]];
    
    _lbAddVal1.text = _tfModifyVar1.text;
    _lbAddVal2.text = _tfModifyVar2.text;
    _lbAddVal3.text = _tfModifyVar3.text;
    _lbAddVal4.text = _tfModifyFuncVar1.text;
    _lbAddVal5.text = _tfModifyFuncVar2.text;
    _lbAddVal6.text = [NSString stringWithFormat:@"result"];
}

-(void) setupAndHiding {
    _animationTimer = nil;
    _lbTimer.hidden = YES;
    _tfTimer.hidden = YES;
    _tfModifyVar1.hidden = YES;
    _tfModifyVar2.hidden = YES;
    _tfModifyVar3.hidden = YES;
    _tfModifyFuncVar1.hidden = YES;
    _tfModifyFuncVar2.hidden = YES;
    _tfModifyFunc.hidden = YES;
    _lbAnim1.hidden = YES;
    _lbAnim2.hidden = YES;
    _lbAnim3.hidden = YES;
    _lbAnim4.hidden = YES;
    _lbAnim5.hidden = YES;
    _lbAnim6.hidden = YES;
    _lbAnim7.hidden = YES;
    _lbAnim8.hidden = YES;
    _lbAnim9.hidden = YES;
    _lbAnim10.hidden = YES;
    _lbAnim11.hidden = YES;
    _swVar1.hidden = YES;
    _swVar2.hidden = YES;
    _configurationFlag = false;
    _play = false;
    _step = -1;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    CGPoint start = [_iArrow center];
    start.x = 50;
    start.y = 80;
    [_iArrow setCenter: start];
    [UIView commitAnimations];
    
    _tfStaticVarValue1.hidden = YES;
    _tfStaticVarValue2.hidden = YES;
    _tfStaticValue1.hidden = YES;
    _tfStaticValue2.hidden = YES;
    _iArrow.hidden = YES;
    _lbAdd1.hidden = YES;
    _lbAdd2.hidden = YES;
    _lbAdd3.hidden = YES;
    _lbAdd4.hidden = YES;
    _lbAdd5.hidden = YES;
    _lbAdd6.hidden = YES;
    _lbAddVal1.hidden = YES;
    _lbAddVal2.hidden = YES;
    _lbAddVal3.hidden = YES;
    _lbAddVal4.hidden = YES;
    _lbAddVal5.hidden = YES;
    _lbAddVal6.hidden = YES;
}
@end
