#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    [self.window makeKeyAndVisible];

    NSArray *messages = @[@"The last thing you remember is the sound of rocks falling all around you.", @"Your arm is pinned, but you can hear rumbling noises in the distance"];
    Script *script = [[Script alloc] initWithMessages:messages];

    RootViewController *viewController = [[RootViewController alloc] initWithScript:script];
    self.window.rootViewController = viewController;

    return YES;
}

@end
