#import "PolyView.h"

@implementation PolyView

@synthesize numberOfSides;


- (void)drawRect:(CGRect)rect { 
	CGContextRef context = UIGraphicsGetCurrentContext(); 	
	CGRect bounds = [self bounds];
	NSArray *points = [self pointsForPolygonInRect:bounds numberOfSides:[self numberOfSides]];
	[points retain];
	
	CGContextBeginPath (context); 
	
	for(NSValue *value in points) {
		CGPoint point = [value CGPointValue]; 
		if([points indexOfObject:value] == 0) {
			CGContextMoveToPoint (context, point.x, point.y); 
		} else {
			CGContextAddLineToPoint (context, point.x, point.y); 
		}
	}
	
	CGContextClosePath (context); 
	[[UIColor redColor] setFill]; 
	[[UIColor blackColor] setStroke]; 
	CGContextDrawPath (context, kCGPathFillStroke); 
}

- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result; 
} 


@end
