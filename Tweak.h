#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Repo : NSObject

NS_ASSUME_NONNULL_BEGIN
- (instancetype)initWithURL:(NSURL *)url andName:(NSString *)name;
NS_ASSUME_NONNULL_END

@end

@interface TWBaseApi : NSObject

NS_ASSUME_NONNULL_BEGIN
@property (nonatomic, strong) NSString *prefsValue;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *apiDescription;
NS_ASSUME_NONNULL_END
@property (nonatomic, strong, nullable) NSURL *privacyPolicy;
@property (nonatomic, strong, nullable) NSURL *tos;
@property (nonatomic, strong, nullable) NSArray<NSString *> *options;

NS_ASSUME_NONNULL_BEGIN
- (void)search:(NSString *)query error:(NSError **)error completionHandler:(void (^)(NSArray<id> *))completionHandler;
NS_ASSUME_NONNULL_END

@end

@interface TWiOSRepoUpdatesApi : NSObject

NS_ASSUME_NONNULL_BEGIN
@property (nonatomic, strong) NSString *prefsValue;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *apiDescription;
NS_ASSUME_NONNULL_END
@property (nonatomic, strong, nullable) NSURL *privacyPolicy;
@property (nonatomic, strong, nullable) NSURL *tos;
@property (nonatomic, strong, nullable) NSArray<NSString *> *options;

@end
