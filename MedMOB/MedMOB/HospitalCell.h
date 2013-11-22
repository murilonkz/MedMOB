//
//  HospitalCell.h
//  MedMOB
//
//  Created by Marcelo Bruzetti on 22/11/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet UILabel *lblDistancia;
@property (weak, nonatomic) IBOutlet UILabel *lblTelefone;
- (IBAction)ExibirMapa:(id)sender;

@end
