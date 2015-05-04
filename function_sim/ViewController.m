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
@property (nonatomic) NSInteger step;
@property (nonatomic) NSInteger labelsSize;
@property (nonatomic) NSTimer *animationTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Setup and hiding
    [self setupAndHiding];
    
    _labels = [NSMutableArray arrayWithObjects:_lbAnim1,_lbAnim2,_lbAnim3,_lbAnim4,_lbAnim5,_lbAnim6,_lbAnim7,_lbAnim8,_lbAnim9,_lbAnim10,_lbAnim11, nil];
    _labelsSize = _labels.count;
    
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
    _tfModifyFunc.text = [_config objectForKey:@"nomFunc"];
    _swVar1.on = [[_config objectForKey:@"refVar1"] boolValue];
    _swVar2.on = [[_config objectForKey:@"refVar1"] boolValue];
    
    //Set names
    [self setLabelsAndReferences];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btNext:(id)sender {
    if(_step != _labelsSize-1)
        [self animation:@"next"];
}

- (IBAction)btPlay:(id)sender {
    if(!_play){
        _play = true;
        [self animation:@"go"];
    }
    else {
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
         _animationTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
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
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                CGPoint start = [_iArrow center];
                start.x = 700;
                //start.y = 42;
                
                // if(start.y > 1900){
                //  start.y = 42;
                //}
                //start.y += 90;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
            case -1:
                break;
            case 0:
                _lbAddVal1.hidden = NO;
                 _lbAddVal2.hidden = NO;
                _lbAddVal3.hidden = NO;
                break;
            case 1:
                _iArrow.hidden = NO;
                _lbAdd1.hidden = NO;
                break;
            case 2:
                _lbAdd2.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 80;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 3:
                //_lbAdd3.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 160;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 4:
                _lbAddVal4.hidden = NO;
                _lbAddVal5.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 260;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 5:
                _lbAddVal6.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 450;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 6:
                _lbAdd4.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 260;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 7:
                _lbAdd5.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 340;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 8:
                _lbAdd6.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 450;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 9:
                _lbAdd3.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 170;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            default:
                break;
        }
        
        if(_step >= 2 ){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5];
            // move and adjust views here
            CGPoint start = [_iArrow center];
            start.x = 700;
            start.y += 80;
            
          
            
            //start.y += 90;
            [_iArrow setCenter: start];
            [UIView commitAnimations];
        
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
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                CGPoint start = [_iArrow center];
                start.x = 700;
                //start.y = 42;
                
                // if(start.y > 1900){
                //  start.y = 42;
                //}
                //start.y += 90;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                
            case -1:
                break;
            case 0:
                _lbAddVal1.hidden = YES;
                _lbAddVal2.hidden = YES;
                _lbAddVal3.hidden = YES;
                break;
            case 1:
                _iArrow.hidden = YES;
                _lbAdd1.hidden = YES;
                break;
            case 2:
                _lbAdd2.hidden = YES;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 80;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 3:
                //_lbAdd3.hidden = NO;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 165;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 4:
                _lbAddVal4.hidden = YES;
                _lbAddVal5.hidden = YES;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 250;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 5:
                _lbAddVal6.hidden = YES;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 340;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 6:
                _lbAdd4.hidden = YES;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 520;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 7:
                _lbAdd5.hidden = YES;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 340;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 8:
                _lbAdd6.hidden = YES;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 430;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            case 9:
                _lbAdd3.hidden = YES;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.5];
                start.x = 700;
                start.y = 520;
                [_iArrow setCenter: start];
                [UIView commitAnimations];
                break;
            default:
                break;
        }
    }
}

- (void) doSomethingWhenTimeIsUp:(NSTimer*)t {
    if(_step != _labelsSize-1)
        [self animation:@"next"];
    else
        [self animation:@"stop"];
}

//Shows the configuration buttons and modifies
- (IBAction)modifyNames:(id)sender {
    //Show configuration controls
    if(!_configurationFlag) {
        _tfModifyVar1.hidden = NO;
        _tfModifyVar2.hidden = NO;
        _tfModifyVar3.hidden = NO;
        _tfModifyFuncVar1.hidden = NO;
        _tfModifyFuncVar2.hidden = NO;
        _tfModifyFunc.hidden = NO;
        _swVar1.hidden = NO;
        _swVar2.hidden = NO;
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
        [plist setObject:_tfModifyFunc.text forKey:@"nomFunc"];
        [plist setObject:[NSNumber numberWithBool:_swVar1.isOn] forKey:@"refVar1"];
        [plist setObject:[NSNumber numberWithBool:_swVar2.isOn] forKey:@"refVar2"];
        [plist writeToFile:docfilePath atomically:YES];
        
        //Hide config
        _tfModifyVar1.hidden = YES;
        _tfModifyVar2.hidden = YES;
        _tfModifyVar3.hidden = YES;
        _tfModifyFuncVar1.hidden = YES;
        _tfModifyFuncVar2.hidden = YES;
        _tfModifyFunc.hidden = YES;
        _swVar1.hidden = YES;
        _swVar2.hidden = YES;
        [_btConfiguration setTitle:@"Configuration" forState:UIControlStateNormal];
    }
    _configurationFlag = !_configurationFlag;
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
    
    _lbAddVal1.text = _tfModifyVar1.text;
    _lbAddVal2.text = _tfModifyVar2.text;
    _lbAddVal3.text = _tfModifyVar3.text;
    _lbAddVal4.text = _tfModifyFuncVar1.text;
    _lbAddVal5.text = _tfModifyFuncVar2.text;
    _lbAddVal6.text = [NSString stringWithFormat:@"result"];
}

-(void) setupAndHiding {
    _animationTimer = nil;
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
    start.x = 700;
    start.y = 80;
    [_iArrow setCenter: start];
    [UIView commitAnimations];
    
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
