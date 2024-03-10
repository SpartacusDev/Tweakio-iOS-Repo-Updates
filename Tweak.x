#import "Tweak.h"


@implementation TWiOSRepoUpdatesApi

- (instancetype)init {
    self = [super init];
    if (self) {
        self.prefsValue = @"com.spartacus.tweakio.iosrepoupdates";
        self.name = @"iOS Repo Updates";
        self.apiDescription = @"Made by relisiuol. Fast, tells exact price for a package, piracy-free and no offline repos.";
        self.privacyPolicy = [NSURL URLWithString:@"https://www.ios-repo-updates.com/privacy/"];
        self.tos = [NSURL URLWithString:@"https://www.ios-repo-updates.com/terms/"];
        self.options = nil;
    }
    return self;
}

- (void)search:(NSString *)query error:(NSError **)error completionHandler:(void (^)(NSArray<Result *> *))completionHandler {
    query = [query stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *api = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://api.ios-repo-updates.com/1.0/search?s=%@", query]];
    NSData *data = [NSData dataWithContentsOfURL:api];
    if (!data) {
        *error = [[NSError alloc] initWithDomain:@"com.spartacus.tweakio" code:1 userInfo:@{   
            NSLocalizedDescriptionKey: @"Failed to retrieve data",
            NSLocalizedFailureReasonErrorKey: @"Failed to retrive data from iOS Repo Updates",
        }];
        return;
    }

    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
    NSMutableArray *resultsArray = [NSMutableArray array];

    for (NSDictionary *result in results[@"packages"]) {
        NSString *iconURL;
        if (((NSObject *)result[@"packageIcon"]).class == NSNull.class || [result[@"packageIcon"] isEqual:@""] || [result[@"packageIcon"] hasPrefix:@"file://"] || ((NSObject *)results[@"packageIcon"]).class == NSNull.class) {
            iconURL = (NSString *)[NSNull null];
        }
        else
            iconURL = result[@"packageIcon"];

        NSDictionary *data = @{
            @"name": result[@"name"],
            @"package": result[@"identifier"],
            @"version": result[@"latestVersion"],
            @"description": result[@"description"],
            @"author": result[@"author"] && ((NSObject *)result[@"author"]).class != NSNull.class ? result[@"author"] : @"UNKNOWN",
            @"price": result[@"price"],
            @"repo": [[%c(Repo) alloc] initWithURL:[NSURL URLWithString:result[@"repository"][@"uri"]] andName:result[@"repository"][@"key"]],
            @"icon url": iconURL.class == NSNull.class ? iconURL : [iconURL hasPrefix:@"http"] ? [NSURL URLWithString:iconURL] : [NSURL fileURLWithPath:iconURL],
            @"depiction": [result objectForKey:@"depiction"] && ((NSObject *)result[@"depiction"]).class != NSNull.class ? [NSURL URLWithString:result[@"depiction"]] ?: [NSURL URLWithString:@""] : [NSURL URLWithString:@""],
            @"section": result[@"section"],
            @"architecture": result[@"latestArchitecture"]
        };
        [resultsArray addObject:[[%c(Result) alloc] initWithDictionary:data]];
    }
    completionHandler([resultsArray copy]);
}

@end

%ctor {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    class_setSuperclass(TWiOSRepoUpdatesApi.class, %c(TWBaseApi));
#pragma clang diagnostic pop
}