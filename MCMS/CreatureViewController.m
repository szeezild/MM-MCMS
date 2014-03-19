//
//  CreatureViewController.m
//  MCMS
//
//  Created by Dan Szeezil on 3/18/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
{
    BOOL isEditModeEnabled;
    
}


@property (weak, nonatomic) IBOutlet UILabel *creatureName;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;



@end

@implementation CreatureViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.creatureName.text = self.creature.name;

    if (self.creature.name.length == 0) {
        self.creatureName.text = @"Unknown";
    }

    isEditModeEnabled = NO;
}


- (IBAction)onEditButtonPressed:(UIButton *)sender {
    
    if (!isEditModeEnabled) {
        
        [sender setTitle:@"Working" forState:UIControlStateNormal];
        isEditModeEnabled = YES;
        self.creatureName.alpha = 0;
        self.nameTextField.alpha = 1;
        self.nameTextField.text = self.creatureName.text;
        
        
    } else {
        
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        isEditModeEnabled = NO;
        self.creatureName.alpha = 1;
        self.nameTextField.alpha = 0;

    }
}



- (IBAction)onSaveButtonPressed:(UIButton *)sender {
    
    self.creatureName.text = self.nameTextField.text;

//  set the creature obj name property to the nameTextField
    self.creature.name = self.nameTextField.text;

//  I need to reload the previous myTableView to show the name change - use viewWillAppear in VC.m
    
    [self.nameTextField resignFirstResponder];

}


@end









