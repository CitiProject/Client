//
//  AWSUserFileManager.h
//
// Copyright 2016 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to
// copy, distribute and modify it.
//
#import <AWSCore/AWSCore.h>
#import "AWSContentManager.h"

@class AWSLocalContent;
@class AWSUserFileManagerConfiguration;

NS_ASSUME_NONNULL_BEGIN

/**
 * `AWSUserFileManager` inherits from `AWSContentManager` and adds the upload capabilities.
 *
 * The User File Manager uploads and downloads files from Amazon S3. It caches downloaded
 * files locally on the device in a size-limited cache. Downloaded files may be pinned
 * to the cache, so that they are not automatically removed when the cache size limit
 * is exceeded. The User File Manager provides access to two folders in the Amazon S3 bucket,
 * one called "public/" for public files, which are accessible to any user of the app,
 * and one called "private/" which contains a sub-folder for each Amazon Cognito
 * identified user. Files in the user's private folder can only be accessed by that user.
 * The User File Manager serves as the application's interface into the file-related
 * functionality of the User Data Storage feature.
 * Requires the AWSS3 framework of AWSiOSSDK.
 */
@interface AWSUserFileManager : AWSContentManager

/**
 *  The list of currently uploading contents.
 */
@property (nonatomic, readonly) NSArray<AWSLocalContent *> *uploadingContents;

/**
 Returns the default User File Manager singleton instance configured using the information provided in `Info.plist` file.
 
 *Swift*
 
    let userFileManager = AWSUserFileManager.defaultUserFileManager()
 
 *Objective-C*
 
    AWSUserFileManager *userFileManager = [AWSUserFileManager defaultFileManager];
 
 */
+ (instancetype)defaultUserFileManager;

/**
 Creates a helper client for AWSUserFileManager for specified configuration with mentioned key.
 Use this method only if you require a helper client with specific configuration.
 
 For example, set the configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*
 
     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        let userFileManagerConfiguration = AWSUserFileManagerConfiguration(bucketName: "myBucket", serviceConfiguration: configuration)
        AWSUserFileManager.registerUserFileManagerWithConfiguration(userFileManagerConfiguration, forKey: "USWest2BucketManager")
     
        return true
     }
 
 *Objective-C*
 
     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                        identityPoolId:@"YourIdentityPoolId"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
        credentialsProvider:credentialsProvider];
        AWSUserFileManagerConfiguration *userFileManagerConfiguration = [[AWSUserFileManager alloc] initWithBucketName:@"myBucketName"
                                                                                                  serviceConfiguration:configuration];
        [AWSUserFileManager registerUserFileManagerWithConfiguration:userFileManagerConfiguration 
                                                              forKey:@"USWest2BucketManager"];
     
        return YES;
     }
 
 Then call the following to get the helper client:
 
 *Swift*
 
    let userFilemanager = AWSUserFileManager(forKey: "USWest2BucketManager")
 
 *Objective-C*
 
    AWSUserFileManager *userFileManager = [AWSUserFileManager userFileManagerForKey:@"USWest2BucketManager"];
 
 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.
 
 @param  userFileManagerConfiguration    AWSUserFileManagerConfiguration object for the manager.
 @param  key                             A string to identify the helper client.
 */
+ (void)registerUserFileManagerWithConfiguration:(AWSUserFileManagerConfiguration *)userFileManagerConfiguration
                                          forKey:(NSString *)key;

/**
 Retrieves the helper client associated with the key. You need to call `+ registerUserFileManagerWithConfiguration:forKey:` before invoking this method. If `+ registerUserFileManagerWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.
 
 *Swift*
 
	let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
	let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
	let userFileManagerConfiguration = AWSUserFileManagerConfiguration(bucketName: "myBucket", serviceConfiguration: configuration)
	AWSUserFileManager.registerUserFileManagerWithConfiguration(userFileManagerConfiguration, forKey: "USWest2BucketManager")
 
 *Objective-C*
 
	AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
																									identityPoolId:@"YourIdentityPoolId"];
	AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
	credentialsProvider:credentialsProvider];
	AWSUserFileManagerConfiguration *userFileManagerConfiguration = [[AWSUserFileManager alloc] initWithBucketName:@"myBucketName"
																							  serviceConfiguration:configuration];
	[AWSUserFileManager registerUserFileManagerWithConfiguration:userFileManagerConfiguration 
														  forKey:@"USWest2BucketManager"];
 
 Then call the following to get the helper client:
 
 *Swift*
 
 let UserFilemanager = AWSUserFileManager.UserFileManager(forKey: "USWest2BucketManager")
 
 *Objective-C*
 
 AWSUserFileManager *UserFileManager = [AWSUserFileManager UserFileManagerForKey:@"USWest2BucketManager"];

 
 @param  key  A string to identify the helper client.
 @return An instance of AWSUserFileManager for specified key.
 */
+ (instancetype)UserFileManagerForKey:(NSString *)key NS_SWIFT_NAME(UserFileManager(forKey:));

/**
 Removes the helper client associated with the key and release it.
 
 *Swift*
 
    AWSUserFileManager.removeUserFileManagerForKey("USWest2BucketManager")
 
 *Objective-C*
 
    [AWSUserFileManager removeUserFileManagerForKey:@"USWest2BucketManager"];
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the helper client.
 */
+ (void)removeUserFileManagerForKey:(NSString *)key;

/**
 Returns an instance of `AWSLocalContent`. You use this method to create an instance of `AWSLocalContent` to upload data to an Amazon S3 bucket with the specified key.

 *Swift*

    func uploadWithData(data: NSData, forKey key: String) {
 
        let userFilemanager = AWSUserFileManager(forKey: "KeyUsedToRegister")
        let localContent = userFilemanager.localContentWithData(data, key: key)
        localContent.uploadWithPinOnCompletion(..., progressBlock: ..., completionHandler: ...)
    }
 
 *Objective-C*

    - (void)uploadWithData:(NSData *)data forKey:(NSString *)key {
 
        AWSUserFileManager *userFileManager = [AWSUserFileManager userFileManagerForKey:@"KeyUsedToRegister"];
        AWSLocalContent *localContent = [self.manager localContentWithData:data
                                                                       key:key];
        [localContent uploadWithPinOnCompletion:...
                                  progressBlock:...
                              completionHandler:...];
    }
 
 @param data The data to be uploaded.
 @param key  The Amazon S3 key.

 @return An instance of `AWSLocalContent` that represents data to be uploaded.
 */
- (AWSLocalContent *)localContentWithData:(nullable NSData *)data
                                      key:(NSString *)key;

@end

/**
 *  A category to add remote file removal to `AWSContent`.
 */
@interface AWSContent(AWSUserFileManager)

/**
 Removes the remote file associated with `AWSContent`.

 *Swift*
 
    func removeContent(content: AWSContent) {
        content.removeRemoteContentWithCompletionHandler({(content: AWSContent?, error: NSError?) -> Void in
            if let error = error {
                print("Failed to delete an object from the remote server. \(error)")
            } else {
                print("Success")
                // Do something further
            }
        })
    }
 
 *Objective-C*
 
    - (void)removeContent:(AWSContent *)content {
        [content removeRemoteContentWithCompletionHandler:^(AWSContent *content, NSError *error) {
            if (error) {
                NSLog(@"Failed to delete an object from the remote server. %@", error);
            } else {
                NSLog(@"Success");
                // Do something further
            }
        }];
    }
 
 @param completionHandler The completion handler block.
 */
- (void)removeRemoteContentWithCompletionHandler:(void(^ _Nullable)(AWSContent * _Nullable content, NSError * _Nullable error))completionHandler;

@end

/**
 *  A representation of the local content that may not exist in the Amazon S3 bucket yet. When uploading data to an S3 bucket, you first need to create an instance of this class.
 */
@interface AWSLocalContent : AWSContent

/**
 Uploads data associated with the local content.
 
 *Swift*
 
    func uploadWithData(data: NSData, forKey key: String) {
 
        let userFilemanager = AWSUserFileManager(forKey: "KeyUsedToRegister")
        let localContent = userFilemanager.localContentWithData(data, key: key)
        localContent.uploadWithPinOnCompletion(false, progressBlock: {(content: AWSLocalContent?, progress: NSProgress?) -> Void in
            // handle progress here
            }, completionHandler: {(content: AWSContent?, error: NSError?) -> Void in
                if let error = error {
                    // handle error here
                    print("Error occured in uploading: \(error)")
                    return
                }
                // handle successful upload here
            })
    }
 
 *Objective-C*
 
    - (void)uploadWithData:(NSData *)data forKey:(NSString *)key {
 
        AWSUserFileManager *userFileManager = [AWSUserFileManager userFileManagerForKey:@"KeyUsedToRegister"];
        AWSLocalContent *localContent = [self.manager localContentWithData:data
                                                                       key:key];
        [localContent uploadWithPinOnCompletion:NO
                                  progressBlock:^(AWSLocalContent *content, NSProgress *progress) {
                                    // handle progress here
                                  }
                                  completionHandler:^(AWSContent *content, NSError *error) {
                                    if (error) {
                                        // handle error here
                                        NSLog(@"Error occured in uploading: %@", error);
                                        return;
                                    }
                                    // perform tasks after successful upload
                                  }];
    }

 @param pinOnCompletion   When set to `YES`, it pins the content after finishing uploading it.
 @param progressBlock     The upload progress block.
 @param completionHandler The completion handler block.
 */
- (void)uploadWithPinOnCompletion:(BOOL)pinOnCompletion
                    progressBlock:(void(^ _Nullable)(AWSLocalContent *content, NSProgress *progress))progressBlock
                completionHandler:(void(^ _Nullable)(AWSLocalContent * _Nullable content, NSError * _Nullable error))completionHandler;

@end

/**
 * `AWSUserFileManagerConfiguration` is the configuration object for `AWSUserFileManager` class.
 *
 */
@interface AWSUserFileManagerConfiguration: NSObject

@property (nonatomic, assign, readonly) AWSServiceConfiguration *serviceConfiguration;
@property (nonatomic, readonly) NSString *bucketName;

/**
 Returns an instance of `AWSUserFileManagerConfiguration`. Use this as the configuration object for AWSUserFileManager.
 
 *Swift*
 
     let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
     let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
 
     let userFileManagerConfiguration = AWSUserFileManagerConfiguration(bucketName: "myBucket", serviceConfiguration: configuration)
 
     AWSUserFileManager.registerUserFileManagerWithConfiguration(userFileManagerConfiguration, forKey: "USWest2BucketManager")
 
 *Objective-C*
 
     AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                     identityPoolId:@"YourIdentityPoolId"];
     AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                          credentialsProvider:credentialsProvider];
     AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = configuration;
     AWSUserFileManagerConfiguration *userFileManagerConfiguration = [[AWSUserFileManager alloc] initWithBucketName:@"myBucketName"
                                                                                               serviceConfiguration:configuration];
     [AWSUserFileManager registerUserFileManagerWithConfiguration:userFileManagerConfiguration
                                                           forKey:@"USWest2BucketManager"];

 @param  bucketName              Name of the bucket
 @param  serviceConfiguration    AWSServiceConfiguration object; nil for default configuration
 @return an instance of AWSUserFileManagerConfiguration
 */
- (instancetype)initWithBucketName:(NSString *)bucketName
              serviceConfiguration:(nullable AWSServiceConfiguration *)serviceConfiguration;

/**
 Returns an instance of `AWSUserFileManagerConfiguration` using the default service configuration. Use this as the configuration object for AWSUserFileManager.

 *Swift*
 
     let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
     let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
     AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration
     
     let userFileManagerConfiguration = AWSUserFileManagerConfiguration(bucketName: "myBucket")
     
     AWSUserFileManager.registerUserFileManagerWithConfiguration(userFileManagerConfiguration, forKey: "USWest2BucketManager")
 
 *Objective-C*
 
     AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                     identityPoolId:@"YourIdentityPoolId"];
     AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                          credentialsProvider:credentialsProvider];
     AWSUserFileManagerConfiguration *userFileManagerConfiguration = [[AWSUserFileManager alloc] initWithBucketName:@"myBucketName"];
     [AWSUserFileManager registerUserFileManagerWithConfiguration:userFileManagerConfiguration
                                                           forKey:@"USWest2BucketManager"];
 
 
 @param  bucketName              Name of the bucket
 @return an instance of AWSUserFileManagerConfiguration
 */
- (instancetype)initWithBucketName:(NSString *)bucketName;

@end

NS_ASSUME_NONNULL_END
