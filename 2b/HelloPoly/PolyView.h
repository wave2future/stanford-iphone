#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolyView : UIView {
	IBOutlet PolygonShape *polygon;
}

@property PolygonShape *polygon;
@property (readonly) NSArray *pointsForPolygonInRect;


@end
