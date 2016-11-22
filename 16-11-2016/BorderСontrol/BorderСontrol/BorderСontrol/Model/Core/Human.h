//
//  Human.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 19.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Human_h
#define Human_h

@interface Human : NSObject

@property (readwrite, strong, nonatomic) NSString *name;
@property (readwrite, strong, nonatomic) NSString *classPrefix;

- (instancetype)init;
- (instancetype)initWithRandomParameters;

@end

#endif /* Human_h */
