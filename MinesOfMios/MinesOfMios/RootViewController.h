#import <UIKit/UIKit.h>
#import "Script.h"

@interface RootViewController : UIViewController

- (instancetype)initWithScript:(Script *)script;

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIButton *button;

- (IBAction)didTapBreathe:(id)sender;

@end


@interface RootViewController (UnavailableMethods)

- (instancetype)init NS_UNAVAILABLE;

@end