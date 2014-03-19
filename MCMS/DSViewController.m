//
//  DSViewController.m
//  MCMS
//
//  Created by Dan Szeezil on 3/18/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "DSViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"


@interface DSViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    NSMutableArray *creatures;
    
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property (weak, nonatomic) IBOutlet UITextField *magicalCreatureTextField;

@end



@implementation DSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    MagicalCreature *moe = [[MagicalCreature alloc] init];
    moe.name = @"Moe";
    moe.description = @"Short & Mean";
    
    MagicalCreature *larry = [[MagicalCreature alloc] init];
    larry.name = @"Larry";
    larry.description = @"Bald & Kind";
    
    MagicalCreature *curly = [[MagicalCreature alloc] init];
    curly.name = @"Curly";
    curly.description = @"Fat & Funny";
    
    creatures = [NSMutableArray arrayWithObjects:moe, larry, curly, nil];
   
    
    self.magicalCreatureTextField.delegate = self;
    
}

// to reload after returning from name change
-(void) viewWillAppear:(BOOL)animated {
    
    [self.myTableView reloadData];
}


-(IBAction)unwindFromCreatureVC:(UIStoryboardSegue *)sender {
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return creatures.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MagicalCreature *creature = [creatures objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
    
    cell.textLabel.text = creature.name;
//    cell.detailTextLabel.text = creature.description;
    
    return cell;
}


- (IBAction)onAddButtonPressed:(UIButton *)sender {
    
    
//  ADD IF STMT TO CHECK FOR BLANK ENTRY
    
    MagicalCreature *new = [[MagicalCreature alloc] init];
    new.name = self.magicalCreatureTextField.text;
    
    [creatures addObject:new];
    
    [self.magicalCreatureTextField resignFirstResponder];
    
    [self.myTableView reloadData];
    
    self.magicalCreatureTextField.text = @"";
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:sender];
    
    MagicalCreature *thisCreature = [creatures objectAtIndex:indexPath.row];

    CreatureViewController *newVC = segue.destinationViewController;
    
    newVC.creature = thisCreature;
    
}




@end









