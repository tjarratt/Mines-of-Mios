#import "RootViewController.h"
#import "Script.h"

@interface RootViewController ()

@property (nonatomic, strong) Script *script;

@end

@implementation RootViewController

- (instancetype)initWithScript:(Script *)script;
{
    self = [super init];
    if (self) {
        self.script = script;
    }

    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.label.text = self.script.advance;
}

- (IBAction)didTapBreathe:(id)sender {
    self.label.text = self.script.advance;
}
@end
