#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    [self.window makeKeyAndVisible];

    NSArray *messages = @[
                          @"The last thing you remember is the sound of rocks falling all around you.",
                          @"Your arm is pinned, but you can hear rumbling noises in the distance",
                          @"Wouldn't it be nice if this had a happy ending ?",
                          @"Wouldn't it be nice if Tim had wrote a complete script ?",
                          @"Well I hope you aren't disappointed when this abruptly ends in a way that no one could possib..."
                          ];
    Script *script = [[Script alloc] initWithMessages:messages];

    RootViewController *viewController = [[RootViewController alloc] initWithScript:script];
    self.window.rootViewController = viewController;

    return YES;
}

@end
