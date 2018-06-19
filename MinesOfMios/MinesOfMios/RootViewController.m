#import "RootViewController.h"
#import "TableSomethingTableViewController.h"
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

- (IBAction)didTapDrinkMe:(id)sender {
    UIViewController *newViewController = [[TableSomethingTableViewController alloc] init];
    [self presentViewController:newViewController animated:YES completion:nil];
}

@end
