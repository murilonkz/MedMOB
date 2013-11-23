//
//  SharedHospitais.m
//  MedMOB
//
//  Created by Thiago Oliveira on 11/22/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "SharedHospitais.h"
#import "Hospital.h"
#import "MapaViewController.h"

@interface SharedHospitais(){
    NSMutableArray *allItems;
}
@end

@implementation SharedHospitais
@synthesize searchItems;

+(SharedHospitais *)sharedHospitais{
    static SharedHospitais *sharedHospitais = nil;
    if (!sharedHospitais){
        sharedHospitais = [[super alloc]init];
    }
    return  sharedHospitais;
}

- (id)init
{
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc]init];
        [self createHospitais];
    }
    return self;
}

-(NSArray *)allItems{
    return allItems;
}


-(void)createHospitais{
    Hospital *hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Santa Cruz"];
    [hospital setTelefone:@"(41) 3312-3000"];
    [hospital setEndereco:@"Avenida do Batel - Batel - Curitiba"];
    NSArray *especialidades = @[@"Geral",@"Emergencia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.44406808028211];
    [hospital setLongitude:-49.2909513741314];
    [hospital setDistancy:40];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Nossa Senhora das Graças"];
    [hospital setTelefone:@"(41) 3240-6060"];
    [hospital setEndereco:@"Rua Alcides Munhoz, 433 - Mercês - Curitiba"];
    especialidades = @[@"Geral"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.421037247040488];
    [hospital setLongitude:-49.29015309748387];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
}

-(void)calculateAllDistancy{
    Hospital *hospital = nil;
    for (int count = 0; count < [searchItems count] ; count++) {
        hospital = [searchItems objectAtIndex:count];
        MapaViewController *mapa = [[MapaViewController alloc]init];
        //(double)latOrigem : (double)longOrigem : (double)latDestino : (double)longDestino
        [hospital setDistancy:[mapa CalcularDistancia:2 :2 :hospital.latitude :hospital.longitude]];
        
    }
}



@end
