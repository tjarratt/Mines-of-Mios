#import <Cedar/Cedar.h>
#import "Script.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ScriptSpec)

describe(@"Script", ^{
    __block Script *subject;
    __block NSString *message;

    beforeEach(^{
        subject = [[Script alloc] initWithMessages:@[@"hello", @"goodbye", @"why are you poking me?"]];
    });

    context(@"when the script is started", ^{
        beforeEach(^{
            message = [subject advance];
        });

        it(@"gives you the first message in the script", ^{
            message should equal(@"hello");
        });

        context(@"when the script is advanced again", ^{
            beforeEach(^{
                message = [subject advance];
            });

            it(@"gives you the second message in the script", ^{
                message should equal(@"goodbye");
            });

            context(@"when the script is advanced a third time", ^{
                beforeEach(^{
                    message = [subject advance];
                });

                it(@"gives you the second message in the script", ^{
                    message should equal(@"why are you poking me?");
                });

                context(@"if it script is advanced further", ^{
                    beforeEach(^{
                        message = [subject advance];
                    });

                    it(@"gives you back nil", ^{
                        message should be_nil;
                    });
                });
            });
        });
    });
});

SPEC_END
