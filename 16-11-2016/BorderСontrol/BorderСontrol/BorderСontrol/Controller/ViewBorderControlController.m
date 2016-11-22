//
//  ViewBorderControlController.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 22.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBorderControlController.h"
#import "ViewBorderControl.h"
#import "CountryController.h"
#import "Helper.h"
#import "BorderControlItemMovable.h"
#import "JsonWork.h"

@implementation ViewBorderControlController

//typedef NSArray <CountryController *> typeOfControllersArray;
typedef NSArray <BorderControlItemMovable *> typeOfControllersArray;


+ (instancetype)sharedInstance
{
    static ViewBorderControlController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ViewBorderControlController alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        viewOfProgmam = [ViewBorderControl new];
    }

    return self;
}

- (void)initiateBorderControlGame {

    typeOfControllersArray *countryControllerArray  = [self getCountryControllerArray];

    int numberOfresident = 0;
    for (int i = 0; i < [countryControllerArray count]; i++) {
        CountryController *processCountryController = countryControllerArray[i].countryController;
        numberOfresident = [viewOfProgmam setNumberOfResident:[processCountryController nameOfModelCountry]];

        processCountryController.numberOfResidentsInCountry = numberOfresident;
    }


    //2. Create Residents for country
    [self createCountryResidents:countryControllerArray];

    //3.
    NSMutableArray *countryControllerArrayInUse = [countryControllerArray mutableCopy];

    while (true) {
        //1. chose country controller
        int randomTickCountry = [Helper getRandomInt:(int)([countryControllerArrayInUse count]) min:0];
        BorderControlItemMovable *instanseInArray = countryControllerArrayInUse[randomTickCountry];
        CountryController *selectedCountryController = instanseInArray.countryController;

        //2. move any person to wherever they deserve
        [selectedCountryController moveAcrossBorderAnyOfResydent];

        //some cheking:
        if ([selectedCountryController numberOfResidentsInResidentSet] == 0) {
            //move all items from receptionCenterSet -> emigrantSet
            [selectedCountryController moveAllPeopleToAnotherCountryArea:instanseInArray.destinationCountry];

            [countryControllerArrayInUse removeObject:instanseInArray];
        }

        if ([countryControllerArrayInUse count] == 0) {
            break;
        }
    }

    //prepare & show the game result
    [self prepareShowTheGameResult:countryControllerArray];
}

- (void)prepareShowTheGameResult:(typeOfControllersArray *)countryControllerArray {
    NSMutableDictionary *dictData = [[NSMutableDictionary alloc] init];

    //        Скільком мешканцям кожної країни вдалося перетнути кордон.
    //        Скільком мешканцям з правопорушеннями вдалося перетнути кордон.
    //        Скільки мешканців потрапили у в’язницю.
    //        Скільки мешканців затримав кожен охоронець.
    //        Скільки кримінальних мешканців випадає на країну.


    /*
     1.1 - successfullyCrossedTheBorder
     1.2 - residentsWithOffenseManagedToCrossTheBorder
     1.3 - residentWereInJail
     1.4 - criminalInhabitantsInTheCountry
     1.5 - residentsDelayedEveryGuard
     */
    NSMutableDictionary *dictSuccessfullyCrossed = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dictResidentsWithOffense = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dictResidentWereInJail = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dictcriminalInhabitantsInTheCountry = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dictResidentsDelayedEveryGuard = [[NSMutableDictionary alloc] init];
//    NSMutableDictionary *dictGuardHunt = [[NSMutableDictionary alloc] init];


    for (BorderControlItemMovable *objectItem in countryControllerArray) {
        CountryController *controller = objectItem.countryController;

        //1.1 - successfullyCrossedTheBorder
        [dictSuccessfullyCrossed setValue: [self
                                            getValueInProcentForAnalitic:controller.successfullyCrossedTheBorder
                                            controller:controller]
                                   forKey: [controller nameOfModelCountry]];
        //1.2
        [dictResidentsWithOffense setValue:[self
                                            getValueInProcentForAnalitic:controller.residentsWithOffenseManagedToCrossTheBorder
                                            controller:controller]
                                    forKey: [controller nameOfModelCountry]];
        //1.3
        [dictResidentWereInJail setValue:[self
                                          getValueInProcentForAnalitic:controller.residentWereInJail
                                          controller:controller]
                                  forKey: [controller nameOfModelCountry]];
        //1.4
        int criminalInhabitantsInTheCountry = controller.residentsWithOffenseManagedToCrossTheBorder + controller.residentWereInJail;
        [dictcriminalInhabitantsInTheCountry setValue:[self
                                          getValueInProcentForAnalitic:criminalInhabitantsInTheCountry
                                          controller:controller]
                                  forKey: [controller nameOfModelCountry]];
        //1.5
        Country *country = [controller getModelInstanse];
        for (PrisonItem *prisonItem in country.prisonSet.descriptionInArray) {
            NSString *nameOfGuardMan = [NSString stringWithString:prisonItem.guardMan.name];
            int valueInDictionary = [[dictResidentsDelayedEveryGuard valueForKey:nameOfGuardMan] intValue];

            valueInDictionary++;

            [dictResidentsDelayedEveryGuard setValue:[NSNumber numberWithInt:valueInDictionary] forKey:nameOfGuardMan];
        }
    }

    //collect data
    [dictData setValue: dictResidentsWithOffense forKey:@"residentsWithOffenseManagedToCrossTheBorder"];
    [dictData setValue: dictSuccessfullyCrossed forKey:@"successfullyCrossedTheBorder"];
    [dictData setValue: dictResidentWereInJail forKey:@"residentWereInJail"];
    [dictData setValue: dictcriminalInhabitantsInTheCountry forKey:@"criminalInhabitantsInTheCountry"];
    [dictData setValue: dictResidentsDelayedEveryGuard forKey:@"residentsDelayedEveryGuard"];

    NSString *jsonString = [JsonWork createJsonData:dictData];


    //output info:
    [viewOfProgmam showLogOfProgramWork:jsonString];

}

- (NSString *)getValueInProcentForAnalitic:(int)value
                                controller:(CountryController *)controller {
    float howMutch = [controller calculateValueInPrecentOfOvelAll:value];
    NSString *howMutchStr = [NSString stringWithFormat:@"%.2f %%", howMutch];

    return howMutchStr;
}

//MARK: class functions
- (void) createCountryResidents:(typeOfControllersArray *)countryControllerArray {
    for (BorderControlItemMovable *itemMovable in countryControllerArray) {
        CountryController *controller = itemMovable.countryController;

        [controller initiateResidents];

        [controller.borderController initiateGuards: 20];
    }
}

- (typeOfControllersArray *) getCountryControllerArray {

    Country *uSA = [[Country new] initWithName:@"USA"];
    CountryController *usaCountryController = [[CountryController new] initWithModel: uSA];

    Country *mexico = [[Country new] initWithName:@"Mexico"];
    CountryController *mexicoCountryController = [[CountryController new] initWithModel: mexico];


    BorderControlItemMovable *usaContryMovable = [[BorderControlItemMovable new]
                                                  initWithData:usaCountryController
                                                  destination:mexico];
    BorderControlItemMovable *mexicoContryMovable = [[BorderControlItemMovable new]
                                                     initWithData:mexicoCountryController
                                                     destination:uSA];

    typeOfControllersArray *countryControllerArray = [NSArray arrayWithObjects: usaContryMovable,
                                                      mexicoContryMovable,
                                                      nil];
    
    
    return countryControllerArray;
}

@end
