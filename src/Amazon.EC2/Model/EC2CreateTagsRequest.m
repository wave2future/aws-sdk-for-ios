/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "EC2CreateTagsRequest.h"


@implementation EC2CreateTagsRequest

@synthesize resources;
@synthesize tags;


-(id)init
{
    if (self = [super init]) {
        resources = [[NSMutableArray alloc] initWithCapacity:1];
        tags      = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithResources:(NSMutableArray *)theResources andTags:(NSMutableArray *)theTags
{
    if (self = [self init]) {
        self.resources = theResources;
        self.tags      = theTags;
    }

    return self;
}


-(void)addTag:(EC2Tag *)tag
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tag];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Resources: %@,", resources] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [resources release];
    [tags release];

    [super dealloc];
}


@end
