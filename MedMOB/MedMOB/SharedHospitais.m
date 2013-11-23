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
    NSArray *especialidades = @[@"Clínica Geral",
                                @"Reumatologia",
                                @"Saúde Mental",
                                @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.429013];
    [hospital setLongitude:-49.289474];
    [hospital setDistancy:40];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Nossa Senhora das Graças"];
    [hospital setTelefone:@"(41) 3240-6060"];
    [hospital setEndereco:@"Rua Alcides Munhoz, 433 - Mercês - Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Dermatologia",
                       @"Ginecologia",
                       @"Neurologia",
                       @"Oftalmologia",
                       @"Oncologia",
                       @"Ortopedia",
                       @"Otorrinolaringologia",
                       @"Pediatria",
                       @"Pneumonologia",
                       @"Reumatologia",
                       @"Saúde Mental",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.420699];
    [hospital setLongitude:-49.290633];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Universitário Evangélico"];
    [hospital setTelefone:@"(41) 3240-5000"];
    [hospital setEndereco:@"Alameda Augusto Stellfeld, 1908 - Bigorrilho, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Dermatologia",
                       @"Emergencia",
                       @"Endocrinologia",
                       @"Oftalmologia",
                       @"Otorrinolaringologia",
                       @"Pediatria",
                       @"Pneumonologia",
                       @"Saúde Mental",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.434648707552316];
    [hospital setLongitude:-49.29207059999999];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Erasto Gaertner"];
    [hospital setTelefone:@"(41) 3361-5000"];
    [hospital setEndereco:@"R. Dr. Ovande do Amaral, 201 - Jardim América, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Pediatria",
                       @"Cardiologia",
                       @"Geriatria",
                       @"Oncologia",
                       @"Reumatologia",
                       @"Saúde Mental",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.452575];
    [hospital setLongitude:-49.238362];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Cardiológico Costantini"];
    [hospital setTelefone:@"(41) 3013-9000"];
    [hospital setEndereco:@"R. Pedro Collere, 890 - Vila Isabel, Curitiba"];
    especialidades = @[@"Oncologia",
                       @"Ortopedia",
                       @"Otorrinolaringologia",
                       @"Pediatria"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.462417];
    [hospital setLongitude:-49.299431];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Centro Médico Hospitalar Sugisawa"];
    [hospital setTelefone:@"(41) 3259-6500"];
    [hospital setEndereco:@"Av. Iguaçu, 1236 - Rebouças, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Oftalmologia",
                       @"Cardiologia",
                       @"Geriatria",
                       @"Ginecologia",
                       @"Saúde Mental",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.443459];
    [hospital setLongitude:-49.273521];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Universitário Cajuru"];
    [hospital setTelefone:@"(41) 3271-3000"];
    [hospital setEndereco:@"Av. São José, 300 - Cristo Rei, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Pediatria",
                       @"Cardiologia",
                       @"Geriatria",
                       @"Neurologia",
                       @"Saúde Mental",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.435136];
    [hospital setLongitude:-49.245486];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Pequeno Príncipe"];
    [hospital setTelefone:@"(41) 3310-1010"];
    [hospital setEndereco:@"R. Des. Motta, 1070, Batel, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Dermatologia",
                       @"Endocrinologia",
                       @"Oftalmologia",
                       @"Pediatria",
                       @"Cardiologia",
                       @"Pediatria",
                       @"Pneumonologia",
                       @"Reumatologia",
                       @"Saúde Mental",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.443313];
    [hospital setLongitude:-49.276772];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital São Lucas"];
    [hospital setTelefone:@"(41) 3250-5511"];
    [hospital setEndereco:@"Av. João Gualberto, 1946 - Juvevê"];
    especialidades = @[@"Clínica Geral",
                       @"Dermatologia",
                       @"Emergencia",
                       @"Endocrinologia",
                       @"Ginecologia",
                       @"Neurologia",
                       @"Oncologia",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.409012];
    [hospital setLongitude:-49.257374];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital IPO"];
    [hospital setTelefone:@"(41) 3314-1500"];
    [hospital setEndereco:@"Av. República Argentina, 2069 - Água Verde, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Cardiologia",
                       @"Geriatria",
                       @"Ginecologia",
                       @"Otorrinolaringologia",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.463192];
    [hospital setLongitude:-49.290934];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Pilar"];
    [hospital setTelefone:@"(41) 3072-7272"];
    [hospital setEndereco:@"R. Des. Hugo Simas, 322 - Bom Retiro, Curitiba"];
    especialidades = @[@"Endocrinologia",
                       @"Oftalmologia",
                       @"Ginecologia",
                       @"Neurologia",
                       @"Oftalmologia",
                       @"Otorrinolaringologia",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.414555];
    [hospital setLongitude:-49.279003];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital da Cruz Vermelha"];
    [hospital setTelefone:@"(41) 3016-6622"];
    [hospital setEndereco:@"Av. Vicente Machado, 1310 - Batel, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Neurologia",
                       @"Oftalmologia",
                       @"Oncologia",
                       @"Ortopedia",
                       @"Otorrinolaringologia",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.437801];
    [hospital setLongitude:-49.28926];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital São Vicente"];
    [hospital setTelefone:@"(41) 3111-3000"];
    [hospital setEndereco:@"Av. Vicente Machado, 401 - Centro, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Endocrinologia",
                       @"Oftalmologia",
                       @"Neurologia",
                       @"Oftalmologia",
                       @"Pneumonologia",
                       @"Reumatologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.434594];
    [hospital setLongitude:-49.28043];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital de Clínicas UFPR"];
    [hospital setTelefone:@"(41) 3360-1864"];
    [hospital setEndereco:@"Rua General Carneiro, 181 - Alto da Glória, Curitiba"];
    especialidades = @[@"Cardiologia",
                       @"Geriatria",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.42409];
    [hospital setLongitude:-49.261107];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Vita Batel"];
    [hospital setTelefone:@"(41) 3883-8482"];
    [hospital setEndereco:@"R. Alf. Ângelo Sampaio, 1896 - Batel, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Dermatologia",
                       @"Cardiologia",
                       @"Ginecologia",
                       @"Pneumonologia",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.437035];
    [hospital setLongitude:-49.286942];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Marcelino Champagnat"];
    [hospital setTelefone:@"(41) 3087-7600"];
    [hospital setEndereco:@"Av. Pres. Affonso Camargo, 1399 - Cristo Rei, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Oftalmologia",
                       @"Pediatria",
                       @"Cardiologia",
                       @"Geriatria",
                       @"Saúde Mental",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.435407];
    [hospital setLongitude:-49.246259];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital XV"];
    [hospital setTelefone:@"(41) 3218-2000"];
    [hospital setEndereco:@"R. Quinze de Novembro, 2223 - Alto da XV, Curitiba"];
    especialidades = @[@"Clínica Geral",
                       @"Oftalmologia",
                       @"Neurologia",
                       @"Oncologia",
                       @"Ortopedia",
                       @"Pediatria",
                       @"Reumatologia",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.425912];
    [hospital setLongitude:-49.252739];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
    
    hospital = [[Hospital alloc]init];
    [hospital setNome:@"Hospital Nossa Senhora do Pilar"];
    [hospital setTelefone:@"(41) 3076-3064"];
    [hospital setEndereco:@"R. Des. Hugo Simas, 295 - Bom Retiro, Curitiba"];
    especialidades = @[@"Emergencia",
                       @"Cardiologia",
                       @"Geriatria",
                       @"Ginecologia",
                       @"Neurologia",
                       @"Urologia"];
    [hospital setEspecialidades:especialidades];
    [hospital setLatitude:-25.414788];
    [hospital setLongitude:-49.278874];
    [hospital setDistancy:20];
    
    [allItems addObject:hospital];
}

-(void)calculateAllDistancy{
    Hospital *hospital = nil;
    for (int count = 0; count < [searchItems count] ; count++) {
        hospital = [searchItems objectAtIndex:count];
        MapaViewController *mapa = [[MapaViewController alloc]init];
        NSMutableArray *pos = [mapa PegarPosicaoAtual];
        NSLog(@"%f", [mapa CalcularDistancia:[[pos objectAtIndex:0]doubleValue] :[[pos objectAtIndex:1]doubleValue] :hospital.latitude :hospital.longitude]);
        double dist = [mapa CalcularDistancia:[[pos objectAtIndex:0]doubleValue] :[[pos objectAtIndex:1]doubleValue] :hospital.latitude :hospital.longitude];
        dist = dist / 1000;
        [hospital setDistancy:dist];
        
    }
}



@end
