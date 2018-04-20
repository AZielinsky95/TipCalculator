//
//  ViewController.m
//  TipCalculator
//
//  Created by Alejandro Zielinsky on 2018-04-20.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;

//@property (weak, nonatomic) IBOutlet UITextField *tipPercentage;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentage;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *tipAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.billAmountTextField.delegate = self;
    [self.billAmountTextField addTarget:self
                  action:@selector(textFieldDidChange)
        forControlEvents:UIControlEventEditingChanged];
    [self.slider addTarget:self
                  action:@selector(textFieldDidChange)
        forControlEvents:UIControlEventValueChanged];
}

- (IBAction)adjustTipPercentage:(UISlider *)sender
{
    self.tipPercentage.text = [NSString stringWithFormat:@"%0.2f", self.slider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidChange
{
    [self calculateTip];
}

//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
//    return YES;
//}
//
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
//
//    [self.view endEditing:YES];
//    return YES;
//}

//- (void)keyboardDidShow:(NSNotification *)notification
//{
//    // Assign new frame to your view
//    [self.view setFrame:CGRectMake(0,-110,self.view.bounds.size.width,self.view.bounds.size.height)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
//
//}
//
//-(void)keyboardDidHide:(NSNotification *)notification
//{
//    [self.view setFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)];
//}


// delegate fires when the return key is tapped which allows us to respond accordingly
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"%d: %s",__LINE__, __PRETTY_FUNCTION__);
    return YES;
}


- (void)calculateTip
{
    float result = 0;
    
    float tipToCalculate = [self.billAmountTextField.text floatValue];
    
    float tipPercent = [self.tipPercentage.text floatValue];
    
    tipPercent = tipPercent / 100;
    
    result = tipToCalculate * tipPercent;
    
    self.tipAmount.text = [NSString stringWithFormat:@"%0.2f",result];
}

@end
