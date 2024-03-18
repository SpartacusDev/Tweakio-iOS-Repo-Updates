#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Repo : NSObject

NS_ASSUME_NONNULL_BEGIN
- (instancetype)initWithURL:(NSURL *)url andName:(NSString *)name;
NS_ASSUME_NONNULL_END

@end

@interface Result : NSObject

NS_ASSUME_NONNULL_BEGIN
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *package;
@property (nonatomic, strong, readonly) NSString *version;
@property (nonatomic, strong, readonly) NSString *packageDescription;
@property (nonatomic, strong, readonly) NSString *author;
@property (nonatomic, strong, readonly) UIImage *icon;
@property (nonatomic, strong, readonly) NSURL *downloadURL;
@property (assign, readonly) BOOL free;
@property (nonatomic, strong, readonly) Repo *repo;
@property (nonatomic, strong, readonly) NSURL *iconURL;
@property (nonatomic, strong, readonly) NSURL *depiction;
@property (nonatomic, strong, readonly) NSString *section;
@property (nonatomic, strong, readonly) NSString *price;
@property (nonatomic, strong, readonly) NSString *architecture;

- (instancetype)initWithDictionary:(NSDictionary *)dataDictionary;
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
- (void)search:(NSString *)query completionHandler:(void (^)(NSArray<Result *> *, NSError *))completionHandler;
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
