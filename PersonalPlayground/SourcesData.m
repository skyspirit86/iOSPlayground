//
//  SourcesData.m
//  PersonalPlayground
//
//  Created by Varga Zolt on 6/11/17.
//  Copyright © 2017 Varga Zolt. All rights reserved.
//

#import "SourcesData.h"

@implementation SourcesData

- (id) initWithId: (NSString *) sID andName: (NSString *) sName andDesciption: (NSString *) sDescription andURL: (NSString *) sURL andCategory: (NSString *) sCategory andLanguage: (NSString *) sLanguage andCountry: (NSString *) sCountry
{
    self = [super init];
    if (self) {
        _sourceId = sID;
        _sourceName = sName;
        _sourceDescription = sDescription;
        _sourceURL = sURL;
        _sourceCategory = sCategory;
        _sourcelanguage = sLanguage;
        _sourceCountry = sCountry;
    }
    return self;
}

@end
