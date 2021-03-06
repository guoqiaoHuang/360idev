//
//  JSONParsingAppDelegate.m
//  JSONParsing
//
//  Created by Kirby Turner on 4/14/10.
//  Copyright White Peak Software Inc 2010. All rights reserved.
//

#import "JSONParsingAppDelegate.h"
#import "JSON.h"

@implementation JSONParsingAppDelegate

@synthesize window;

- (void)callWebServiceWithUsername:(NSString *)username usingFormat:(NSString*)format {
   NSString *encodedUsername = [username stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   NSString *urlString = [NSString stringWithFormat:@"http://api.twitter.com/1/statuses/user_timeline/%@.%@", encodedUsername, format];
   NSURL *url = [NSURL URLWithString:urlString];
   NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
   NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
   [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
   responseData = [[NSMutableData alloc] init];
   [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
   [responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
   [connection release];
   
   NSString *responseString = [NSString stringWithUTF8String:[responseData bytes]];
   NSLog(@"%@", responseString);
   
   SBJSON *parser = [[SBJSON alloc] init];
   NSArray *data = [parser objectWithString:responseString];
   NSDictionary *tweetData = [data objectAtIndex:0];
   NSLog(@"Last tweet: %@", [tweetData valueForKey:@"text"]);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
   NSLog(@"Error: %@", [error localizedDescription]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch

	[self callWebServiceWithUsername:@"kirbyt" usingFormat:@"json"];
   [window makeKeyAndVisible];
   
   return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
