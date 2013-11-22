//
//  SharedHospitais.h
//  MedMOB
//
//  Created by Thiago Oliveira on 11/22/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedHospitais : NSObject
+(SharedHospitais *)sharedHospitais;
- (NSArray *) allItems;

@property NSArray *searchItems;


@end
