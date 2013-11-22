//
//  HospitalCell.m
//  MedMOB
//
//  Created by Marcelo Bruzetti on 22/11/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "HospitalCell.h"
#import "HospitaisViewController.h"

@implementation HospitalCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"PUDIM");
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)ExibirMapa:(id)sender {
    HospitaisViewController *hvc = [[HospitaisViewController alloc]init];
    [hvc ExibirMapaController];
}
@end
