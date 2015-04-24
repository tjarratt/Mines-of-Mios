#import <Cedar-iOS/Cedar-iOS.h>

#import "ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpecSpec)

describe(@"ViewController", ^{
    __block ViewController *subject;

    beforeEach(^{
        subject = [[ViewController alloc] init];
        subject.view should_not be_nil;
    });

    it(@"should greet the user", ^{
        subject.label.text should equal(@"hello");
    });
});

SPEC_END
