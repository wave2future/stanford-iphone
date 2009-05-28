#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PolyView : UIView {
	int numberOfSides;

}

@property int numberOfSides;
@property (readonly) NSArray *pointsForPolygonInRect;


@end
