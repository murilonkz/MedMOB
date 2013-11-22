//
//  Hospital.h
//  MedMOB
//
//  Created by Thiago Oliveira on 11/22/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hospital : NSObject

@property NSArray *especialidades;
@property NSString *nome;
@property NSString *endereco;
@property NSString *telefone;
@property double latitude;
@property double longitude;
@property double distancy;

@end
