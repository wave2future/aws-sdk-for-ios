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

#import "ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequestMarshaller.h"

@implementation ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequest *)registerInstancesWithLoadBalancerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"RegisterInstancesWithLoadBalancer"           forKey:@"Action"];
    [request setParameterValue:@"2010-07-01"   forKey:@"Version"];

    [request setDelegate:[registerInstancesWithLoadBalancerRequest delegate]];
    [request setCredentials:[registerInstancesWithLoadBalancerRequest credentials]];
    [request setEndpoint:[registerInstancesWithLoadBalancerRequest requestEndpoint]];

    if (registerInstancesWithLoadBalancerRequest != nil) {
        if (registerInstancesWithLoadBalancerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerInstancesWithLoadBalancerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (registerInstancesWithLoadBalancerRequest != nil) {
        int instancesListIndex = 1;
        for (ElasticLoadBalancingInstance *instancesListValue in registerInstancesWithLoadBalancerRequest.instances) {
            if (instancesListValue != nil) {
                if (instancesListValue.instanceId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", instancesListValue.instanceId] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Instances", instancesListIndex, @"InstanceId"]];
                }
            }

            instancesListIndex++;
        }
    }


    return [request autorelease];
}

@end

