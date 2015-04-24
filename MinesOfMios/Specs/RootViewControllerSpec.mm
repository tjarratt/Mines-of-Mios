#import <Cedar-iOS/Cedar-iOS.h>
#import "UIControl+Spec.h"

#import "RootViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RootViewControllerSpec)

describe(@"ViewController", ^{
    __block RootViewController *subject;
    __block Script *script;

    beforeEach(^{
        script = [[Script alloc] initWithMessages:@[@"one", @"two", @"three"]];
        subject = [[RootViewController alloc] initWithScript:script];
        subject.view should_not be_nil;
    });

    it(@"should set its background color to black", ^{
        UIColor *backgroundColor = subject.view.backgroundColor;
        CGFloat white;
        [backgroundColor getWhite:&white alpha:nil];

        white should be_close_to(0);
    });

    it(@"shows the user the first message in the script", ^{
        subject.label.text should equal(@"one");
    });

    it(@"has a button the user can tap", ^{
        subject.button.titleLabel.text should equal(@"Breathe");
    });

    context(@"when the user taps on the button", ^{
        beforeEach(^{
            [subject.button tap];
        });

        it(@"updates the text in the label", ^{
            subject.label.text should equal(@"two");
        });
    });
});

SPEC_END
