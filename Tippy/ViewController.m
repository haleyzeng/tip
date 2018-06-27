//
//  ViewController.m
//  Tippy
//
//  Created by Haley Zeng on 6/26/18.
//  Copyright © 2018 Haley Zeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalValueLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onLongPress:(id)sender {
    NSLog(@"Hello");

    self.billField.text = @"";
    
    [UIView animateWithDuration:0.0 animations:^{
        self.tipLabel.alpha = 0;
        self.tipValueLabel.alpha = 0;
        self.totalLabel.alpha = 0;
        self.totalValueLabel.alpha = 0;
    }];
    self.tipValueLabel.text = @"$0.00";
    self.totalValueLabel.text = @"$0.00";
 
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[ @(0.15), @(0.18), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipValueLabel.text = [NSString stringWithFormat:@"$%.2f",tip];
    self.totalValueLabel.text = [NSString stringWithFormat:@"$%.2f",total];

}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 1;
        self.tipValueLabel.alpha = 1;
        self.totalLabel.alpha = 1;
        self.totalValueLabel.alpha = 1;
    }];
    
}





@end
