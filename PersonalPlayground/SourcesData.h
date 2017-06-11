//
//  SourcesData.h
//  PersonalPlayground
//
//  Created by Varga Zolt on 6/11/17.
//  Copyright © 2017 Varga Zolt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SourcesData : NSObject

@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, strong) NSString *sourceName;
@property (nonatomic, strong) NSString *sourceDescription;
@property (nonatomic, strong) NSString *sourceURL;
@property (nonatomic, strong) NSString *sourceCategory;
@property (nonatomic, strong) NSString *sourcelanguage;
@property (nonatomic, strong) NSString *sourceCountry;

- (id) initWithId: (NSString *) sID andName: (NSString *) sName andDesciption: (NSString *) sDescription andURL: (NSString *) sURL andCategory: (NSString *) sCategory andLanguage: (NSString *) sLanguage andCountry: (NSString *) sCountry;

@end
