//
//  HttpClient.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-4.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import "HttpClient.h"
#import "Reachability.h"
#import "AlertUtils.h"


static HttpClient *client;

@implementation HttpClient

+ (HttpClient *)sharedInstance{
    if(client == nil){
        client = [[HttpClient alloc] init];
    }
    return client;
}


- (BOOL)checkNetworkAvailable{
    
    Reachability *netReach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus status = [netReach currentReachabilityStatus];
    //    NSLog(@"status %i",status);
    
    if(status == NotReachable){
        [AlertUtils showMessage:@"网络无法连接"];
    }
    return status != NotReachable;
}

- (NSString *)postUrl:(NSString *)url data:(NSDictionary *)data{
    
    
    NSMutableString *postData = [NSMutableString stringWithString:@""];
    
    if(data != nil){
        for(NSString *key in data){
            id value = [data objectForKey:key];
            if(key != nil && value != nil){
                [postData appendFormat:@"%@=%@&",key,value];
            }
        }
        if([postData length] > 1){
            [postData deleteCharactersInRange:NSMakeRange([postData length]-1, 1)];
        }
    }
    
    @try {
        NSHTTPURLResponse *response;
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
        [request setTimeoutInterval:8];
        NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        [request release];
        
        if(response.statusCode == 200){
            
            return [[[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding] autorelease];
            
        }else{
            NSLog(@"statusCode = %i",response.statusCode);
        }

    }
    @catch (NSException *exception) {
        NSLog(@"NSException: %@",[exception reason]);
    }
    
    return nil;
}


- (NSString *)getUrl:(NSString *)url{
    
    @try {
        NSHTTPURLResponse *response;
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"GET"];
        [request setTimeoutInterval:8];
        NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        [request release];
        
        if(response.statusCode == 200){
            
            return [[[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding] autorelease];
            
        }else{
            NSLog(@"statusCode = %i",response.statusCode);
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"NSException: %@",[exception reason]);
    }
    
    return nil;
}



@end
