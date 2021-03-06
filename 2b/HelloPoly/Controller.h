#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolyView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet PolygonShape *polygon;
	IBOutlet PolyView *polyView;
}
- (IBAction)decrease;
- (IBAction)increase;
- (void)awakeFromNib;
- (void)updateInterface;
@end
