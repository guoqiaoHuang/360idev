/*
	SDZArrayOfGeocoderIntersectionResult.h
	The implementation of properties and methods for the SDZArrayOfGeocoderIntersectionResult array.
	Generated by SudzC.com
*/
#import "SDZArrayOfGeocoderIntersectionResult.h"
#import "SDZGeocoderIntersectionResult.h"

@implementation SDZArrayOfGeocoderIntersectionResult

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[[SDZArrayOfGeocoderIntersectionResult alloc] initWithNode: node] autorelease];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				SDZGeocoderIntersectionResult* value = [[SDZGeocoderIntersectionResult newWithNode: child] object];
				if(value != nil) {
					[self addObject: value];
				}
			}
		}
		return self;
	}
	
	+ (NSMutableString*) serialize: (NSArray*) array
	{
		NSMutableString* s = [NSMutableString string];
		for(id item in array) {
			[s appendString: [item serialize: @"GeocoderIntersectionResult"]];
		}
		return s;
	}
@end
