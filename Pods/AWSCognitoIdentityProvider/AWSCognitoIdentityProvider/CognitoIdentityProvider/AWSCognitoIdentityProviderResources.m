//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSCognitoIdentityProviderResources.h"
#import <AWSCore/AWSLogging.h>

@interface AWSCognitoIdentityProviderResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSCognitoIdentityProviderResources

+ (instancetype)sharedInstance {
    static AWSCognitoIdentityProviderResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSCognitoIdentityProviderResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2016-04-18\",\
    \"endpointPrefix\":\"cognito-idp\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Cognito Identity Provider\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"AWSCognitoIdentityProviderService\"\
  },\
  \"operations\":{\
    \"AddCustomAttributes\":{\
      \"name\":\"AddCustomAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddCustomAttributesRequest\"},\
      \"output\":{\"shape\":\"AddCustomAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Adds additional user attributes to the user pool schema.</p>\"\
    },\
    \"AdminConfirmSignUp\":{\
      \"name\":\"AdminConfirmSignUp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminConfirmSignUpRequest\"},\
      \"output\":{\"shape\":\"AdminConfirmSignUpResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyFailedAttemptsException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"PasswordResetRequiredException\"}\
      ],\
      \"documentation\":\"<p>Confirms user registration as an admin without using a confirmation code. Works on any user.</p>\"\
    },\
    \"AdminDeleteUser\":{\
      \"name\":\"AdminDeleteUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminDeleteUserRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a user as an administrator. Works on any user.</p>\"\
    },\
    \"AdminDeleteUserAttributes\":{\
      \"name\":\"AdminDeleteUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminDeleteUserAttributesRequest\"},\
      \"output\":{\"shape\":\"AdminDeleteUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p>\"\
    },\
    \"AdminDisableUser\":{\
      \"name\":\"AdminDisableUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminDisableUserRequest\"},\
      \"output\":{\"shape\":\"AdminDisableUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Disables the specified user as an administrator. Works on any user.</p>\"\
    },\
    \"AdminEnableUser\":{\
      \"name\":\"AdminEnableUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminEnableUserRequest\"},\
      \"output\":{\"shape\":\"AdminEnableUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Enables the specified user as an administrator. Works on any user.</p>\"\
    },\
    \"AdminForgetDevice\":{\
      \"name\":\"AdminForgetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminForgetDeviceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Forgets the device, as an administrator.</p>\"\
    },\
    \"AdminGetDevice\":{\
      \"name\":\"AdminGetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminGetDeviceRequest\"},\
      \"output\":{\"shape\":\"AdminGetDeviceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Gets the device, as an administrator.</p>\"\
    },\
    \"AdminGetUser\":{\
      \"name\":\"AdminGetUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminGetUserRequest\"},\
      \"output\":{\"shape\":\"AdminGetUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p>\"\
    },\
    \"AdminInitiateAuth\":{\
      \"name\":\"AdminInitiateAuth\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminInitiateAuthRequest\"},\
      \"output\":{\"shape\":\"AdminInitiateAuthResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"MFAMethodNotFoundException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"}\
      ],\
      \"documentation\":\"<p>Initiates the authentication flow, as an administrator.</p>\"\
    },\
    \"AdminListDevices\":{\
      \"name\":\"AdminListDevices\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminListDevicesRequest\"},\
      \"output\":{\"shape\":\"AdminListDevicesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Lists devices, as an administrator.</p>\"\
    },\
    \"AdminResetUserPassword\":{\
      \"name\":\"AdminResetUserPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminResetUserPasswordRequest\"},\
      \"output\":{\"shape\":\"AdminResetUserPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p>\"\
    },\
    \"AdminRespondToAuthChallenge\":{\
      \"name\":\"AdminRespondToAuthChallenge\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminRespondToAuthChallengeRequest\"},\
      \"output\":{\"shape\":\"AdminRespondToAuthChallengeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"MFAMethodNotFoundException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"AliasExistsException\"}\
      ],\
      \"documentation\":\"<p>Responds to an authentication challenge, as an administrator.</p>\"\
    },\
    \"AdminSetUserSettings\":{\
      \"name\":\"AdminSetUserSettings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminSetUserSettingsRequest\"},\
      \"output\":{\"shape\":\"AdminSetUserSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Sets all the user settings for a specified user name. Works on any user.</p>\"\
    },\
    \"AdminUpdateDeviceStatus\":{\
      \"name\":\"AdminUpdateDeviceStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminUpdateDeviceStatusRequest\"},\
      \"output\":{\"shape\":\"AdminUpdateDeviceStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Updates the device status as an administrator.</p>\"\
    },\
    \"AdminUpdateUserAttributes\":{\
      \"name\":\"AdminUpdateUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminUpdateUserAttributesRequest\"},\
      \"output\":{\"shape\":\"AdminUpdateUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user.</p>\"\
    },\
    \"AdminUserGlobalSignOut\":{\
      \"name\":\"AdminUserGlobalSignOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminUserGlobalSignOutRequest\"},\
      \"output\":{\"shape\":\"AdminUserGlobalSignOutResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Signs out users from all devices, as an administrator.</p>\"\
    },\
    \"ChangePassword\":{\
      \"name\":\"ChangePassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ChangePasswordRequest\"},\
      \"output\":{\"shape\":\"ChangePasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Changes the password for a specified user in a user pool.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"ConfirmDevice\":{\
      \"name\":\"ConfirmDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmDeviceRequest\"},\
      \"output\":{\"shape\":\"ConfirmDeviceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"UsernameExistsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Confirms tracking of the device. This API call is the call that beings device tracking.</p>\"\
    },\
    \"ConfirmForgotPassword\":{\
      \"name\":\"ConfirmForgotPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmForgotPasswordRequest\"},\
      \"output\":{\"shape\":\"ConfirmForgotPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"TooManyFailedAttemptsException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"}\
      ],\
      \"documentation\":\"<p>Allows a user to enter a code provided when they reset their password to update their password.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"ConfirmSignUp\":{\
      \"name\":\"ConfirmSignUp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmSignUpRequest\"},\
      \"output\":{\"shape\":\"ConfirmSignUpResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyFailedAttemptsException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"UserNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Confirms registration of a user and handles the existing alias from a previous user.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"CreateUserPool\":{\
      \"name\":\"CreateUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateUserPoolRequest\"},\
      \"output\":{\"shape\":\"CreateUserPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p>\"\
    },\
    \"CreateUserPoolClient\":{\
      \"name\":\"CreateUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateUserPoolClientRequest\"},\
      \"output\":{\"shape\":\"CreateUserPoolClientResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates the user pool client.</p>\"\
    },\
    \"DeleteUser\":{\
      \"name\":\"DeleteUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows a user to delete one's self.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"DeleteUserAttributes\":{\
      \"name\":\"DeleteUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserAttributesRequest\"},\
      \"output\":{\"shape\":\"DeleteUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the attributes for a user.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"DeleteUserPool\":{\
      \"name\":\"DeleteUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserPoolRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified Amazon Cognito user pool.</p>\"\
    },\
    \"DeleteUserPoolClient\":{\
      \"name\":\"DeleteUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserPoolClientRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows the developer to delete the user pool client.</p>\"\
    },\
    \"DescribeUserPool\":{\
      \"name\":\"DescribeUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUserPoolRequest\"},\
      \"output\":{\"shape\":\"DescribeUserPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns the configuration information and metadata of the specified user pool.</p>\"\
    },\
    \"DescribeUserPoolClient\":{\
      \"name\":\"DescribeUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUserPoolClientRequest\"},\
      \"output\":{\"shape\":\"DescribeUserPoolClientResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Client method for returning the configuration information and metadata of the specified user pool client.</p>\"\
    },\
    \"ForgetDevice\":{\
      \"name\":\"ForgetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ForgetDeviceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Forgets the specified device.</p>\"\
    },\
    \"ForgotPassword\":{\
      \"name\":\"ForgotPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ForgotPasswordRequest\"},\
      \"output\":{\"shape\":\"ForgotPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the password for the specified client ID or username.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"GetDevice\":{\
      \"name\":\"GetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDeviceRequest\"},\
      \"output\":{\"shape\":\"GetDeviceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the device.</p>\"\
    },\
    \"GetUser\":{\
      \"name\":\"GetUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetUserRequest\"},\
      \"output\":{\"shape\":\"GetUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the user attributes and metadata for a user.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"GetUserAttributeVerificationCode\":{\
      \"name\":\"GetUserAttributeVerificationCode\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetUserAttributeVerificationCodeRequest\"},\
      \"output\":{\"shape\":\"GetUserAttributeVerificationCodeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Gets the user attribute verification code for the specified attribute name.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"GlobalSignOut\":{\
      \"name\":\"GlobalSignOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GlobalSignOutRequest\"},\
      \"output\":{\"shape\":\"GlobalSignOutResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Signs out users from all devices.</p>\"\
    },\
    \"InitiateAuth\":{\
      \"name\":\"InitiateAuth\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"InitiateAuthRequest\"},\
      \"output\":{\"shape\":\"InitiateAuthResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"}\
      ],\
      \"documentation\":\"<p>Initiates the authentication flow.</p>\"\
    },\
    \"ListDevices\":{\
      \"name\":\"ListDevices\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDevicesRequest\"},\
      \"output\":{\"shape\":\"ListDevicesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the devices.</p>\"\
    },\
    \"ListUserPoolClients\":{\
      \"name\":\"ListUserPoolClients\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUserPoolClientsRequest\"},\
      \"output\":{\"shape\":\"ListUserPoolClientsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the clients that have been created for the specified user pool.</p>\"\
    },\
    \"ListUserPools\":{\
      \"name\":\"ListUserPools\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUserPoolsRequest\"},\
      \"output\":{\"shape\":\"ListUserPoolsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the user pools associated with an AWS account.</p>\"\
    },\
    \"ListUsers\":{\
      \"name\":\"ListUsers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUsersRequest\"},\
      \"output\":{\"shape\":\"ListUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the users in the Amazon Cognito user pool.</p>\"\
    },\
    \"ResendConfirmationCode\":{\
      \"name\":\"ResendConfirmationCode\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResendConfirmationCodeRequest\"},\
      \"output\":{\"shape\":\"ResendConfirmationCodeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"UserNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"RespondToAuthChallenge\":{\
      \"name\":\"RespondToAuthChallenge\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RespondToAuthChallengeRequest\"},\
      \"output\":{\"shape\":\"RespondToAuthChallengeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"MFAMethodNotFoundException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"AliasExistsException\"}\
      ],\
      \"documentation\":\"<p>Responds to the authentication challenge.</p>\"\
    },\
    \"SetUserSettings\":{\
      \"name\":\"SetUserSettings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetUserSettingsRequest\"},\
      \"output\":{\"shape\":\"SetUserSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Sets the user settings like multi-factor authentication (MFA). If MFA is to be removed for a particular attribute pass the attribute with code delivery as null. If null list is passed, all MFA options are removed.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"SignUp\":{\
      \"name\":\"SignUp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SignUpRequest\"},\
      \"output\":{\"shape\":\"SignUpResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"UsernameExistsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"}\
      ],\
      \"documentation\":\"<p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"UpdateDeviceStatus\":{\
      \"name\":\"UpdateDeviceStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDeviceStatusRequest\"},\
      \"output\":{\"shape\":\"UpdateDeviceStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the device status.</p>\"\
    },\
    \"UpdateUserAttributes\":{\
      \"name\":\"UpdateUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserAttributesRequest\"},\
      \"output\":{\"shape\":\"UpdateUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"}\
      ],\
      \"documentation\":\"<p>Allows a user to update a specific attribute (one at a time).</p>\",\
      \"authtype\":\"none\"\
    },\
    \"UpdateUserPool\":{\
      \"name\":\"UpdateUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserPoolRequest\"},\
      \"output\":{\"shape\":\"UpdateUserPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified user pool with the specified attributes.</p>\"\
    },\
    \"UpdateUserPoolClient\":{\
      \"name\":\"UpdateUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserPoolClientRequest\"},\
      \"output\":{\"shape\":\"UpdateUserPoolClientResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows the developer to update the specified user pool client and password policy.</p>\"\
    },\
    \"VerifyUserAttribute\":{\
      \"name\":\"VerifyUserAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyUserAttributeRequest\"},\
      \"output\":{\"shape\":\"VerifyUserAttributeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Verifies the specified user attributes in the user pool.</p>\",\
      \"authtype\":\"none\"\
    }\
  },\
  \"shapes\":{\
    \"AddCustomAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"CustomAttributes\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to add custom attributes.</p>\"\
        },\
        \"CustomAttributes\":{\
          \"shape\":\"CustomAttributesListType\",\
          \"documentation\":\"<p>An array of custom attributes, such as Mutable and Name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to add custom attributes.</p>\"\
    },\
    \"AddCustomAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to add custom attributes.</p>\"\
    },\
    \"AdminConfirmSignUpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for which you want to confirm user registration.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name for which you want to confirm user registration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to confirm user registration.</p>\"\
    },\
    \"AdminConfirmSignUpResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to confirm registration.</p>\"\
    },\
    \"AdminDeleteUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"UserAttributeNames\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to delete user attributes.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user from which you would like to delete attributes.</p>\"\
        },\
        \"UserAttributeNames\":{\
          \"shape\":\"AttributeNameListType\",\
          \"documentation\":\"<p>An array of strings representing the user attribute names you wish to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete user attributes as an administrator.</p>\"\
    },\
    \"AdminDeleteUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response received from the server for a request to delete user attributes.</p>\"\
    },\
    \"AdminDeleteUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to delete the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user as an administrator.</p>\"\
    },\
    \"AdminDisableUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to disable the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to disable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to disable any user as an administrator.</p>\"\
    },\
    \"AdminDisableUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response received from the server to disable the user as an administrator.</p>\"\
    },\
    \"AdminEnableUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to enable the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to ebable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request that enables the user as an administrator.</p>\"\
    },\
    \"AdminEnableUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to enable a user as an administrator.</p>\"\
    },\
    \"AdminForgetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sends the forgot device request, as an administrator.</p>\"\
    },\
    \"AdminGetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceKey\",\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get the device, as an administrator.</p>\"\
    },\
    \"AdminGetDeviceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Device\"],\
      \"members\":{\
        \"Device\":{\
          \"shape\":\"DeviceType\",\
          \"documentation\":\"<p>The device.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Gets the device response, as an administrator.</p>\"\
    },\
    \"AdminGetUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to get information about the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get the specified user as an administrator.</p>\"\
    },\
    \"AdminGetUserResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Username\"],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user about whom you are receiving information.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p>\"\
        },\
        \"UserCreateDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user was created.</p>\"\
        },\
        \"UserLastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user was last modified.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Indicates that the status is enabled.</p>\"\
        },\
        \"UserStatus\":{\
          \"shape\":\"UserStatusType\",\
          \"documentation\":\"<p>The user status. Can be one of the following:</p> <ul> <li>UNCONFIRMED - User has been created but not confirmed.</li> <li>CONFIRMED - User has been confirmed.</li> <li>ARCHIVED - User is no longer active.</li> <li>COMPROMISED - User is disabled due to a potential security threat.</li> <li>UNKNOWN - User status is not known.</li> </ul>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p>Specifies the options for MFA (e.g., email or phone number).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server from the request to get the specified user as an administrator.</p>\"\
    },\
    \"AdminInitiateAuthRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\",\
        \"AuthFlow\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the Amazon Cognito user pool.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The client app ID.</p>\"\
        },\
        \"AuthFlow\":{\
          \"shape\":\"AuthFlowType\",\
          \"documentation\":\"<p>The authentication flow.</p>\"\
        },\
        \"AuthParameters\":{\
          \"shape\":\"AuthParametersType\",\
          \"documentation\":\"<p>The authentication parameters.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>The client app metadata.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Initiates the authorization request, as an administrator.</p>\"\
    },\
    \"AdminInitiateAuthResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters.</p>\"\
        },\
        \"AuthenticationResult\":{\"shape\":\"AuthenticationResultType\"}\
      },\
      \"documentation\":\"<p>Initiates the authentication response, as an administrator.</p>\"\
    },\
    \"AdminListDevicesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the devices request.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list devices, as an administrator.</p>\"\
    },\
    \"AdminListDevicesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Devices\":{\
          \"shape\":\"DeviceListType\",\
          \"documentation\":\"<p>The devices in the list of devices response.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Lists the device's response, as an administrator.</p>\"\
    },\
    \"AdminResetUserPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to reset the user's password.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user whose password you wish to reset.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to reset a user's password as an administrator.</p>\"\
    },\
    \"AdminResetUserPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server to reset a user password as an administrator.</p>\"\
    },\
    \"AdminRespondToAuthChallengeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\",\
        \"ChallengeName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the Amazon Cognito user pool.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The client ID.</p>\"\
        },\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge.</p>\"\
        },\
        \"ChallengeResponses\":{\
          \"shape\":\"ChallengeResponsesType\",\
          \"documentation\":\"<p>The challenge response.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request to respond to the authentication challenge, as an administrator.</p>\"\
    },\
    \"AdminRespondToAuthChallengeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters.</p>\"\
        },\
        \"AuthenticationResult\":{\"shape\":\"AuthenticationResultType\"}\
      },\
      \"documentation\":\"<p>Responds to the authentication challenge, as an administrator.</p>\"\
    },\
    \"AdminSetUserSettingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"MFAOptions\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to set the user's settings, such as MFA options.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user for whom you wish to set user settings.</p>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p>Specifies the options for MFA (e.g., email or phone number).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to set user settings as an administrator.</p>\"\
    },\
    \"AdminSetUserSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server to set user settings as an administrator.</p>\"\
    },\
    \"AdminUpdateDeviceStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID></p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceRememberedStatus\":{\
          \"shape\":\"DeviceRememberedStatusType\",\
          \"documentation\":\"<p>The status indicating whether a device has been remembered or not.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request to update the device status, as an administrator.</p>\"\
    },\
    \"AdminUpdateDeviceStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The status response from the request to update the device, as an administrator.</p>\"\
    },\
    \"AdminUpdateUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"UserAttributes\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to update user attributes.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user for whom you want to update user attributes.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the user's attributes as an administrator.</p>\"\
    },\
    \"AdminUpdateUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to update user attributes as an administrator.</p>\"\
    },\
    \"AdminUserGlobalSignOutRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request to sign out of all devices, as an administrator.</p>\"\
    },\
    \"AdminUserGlobalSignOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The global signot response, as an administrator.</p>\"\
    },\
    \"AliasAttributeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"phone_number\",\
        \"email\",\
        \"preferred_username\"\
      ]\
    },\
    \"AliasAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AliasAttributeType\"}\
    },\
    \"AliasExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message sent to the user when an alias exists.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user tries to confirm the account with an email or phone number that has already been supplied as an alias from a different account. This exception tells user that an account with this email or phone already exists.</p>\",\
      \"exception\":true\
    },\
    \"ArnType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:[\\\\w+=/,.@-]+:[\\\\w+=/,.@-]+:([\\\\w+=/,.@-]*)?:[0-9]+:[\\\\w+=/,.@-]+(:[\\\\w+=/,.@-]+)?(:[\\\\w+=/,.@-]+)?\"\
    },\
    \"AttributeDataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"String\",\
        \"Number\",\
        \"DateTime\",\
        \"Boolean\"\
      ]\
    },\
    \"AttributeListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeType\"}\
    },\
    \"AttributeNameListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeNameType\"}\
    },\
    \"AttributeNameType\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"AttributeType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The name of the attribute.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"AttributeValueType\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies whether the attribute is standard or custom.</p>\"\
    },\
    \"AttributeValueType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"sensitive\":true\
    },\
    \"AuthFlowType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USER_SRP_AUTH\",\
        \"REFRESH_TOKEN_AUTH\",\
        \"CUSTOM_AUTH\",\
        \"ADMIN_NO_SRP_AUTH\"\
      ]\
    },\
    \"AuthParametersType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"AuthenticationResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token of the authentication result.</p>\"\
        },\
        \"ExpiresIn\":{\
          \"shape\":\"IntegerType\",\
          \"documentation\":\"<p>The expiration period of the authentication result.</p>\"\
        },\
        \"TokenType\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The token type of the authentication result.</p>\"\
        },\
        \"RefreshToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The refresh token of the authentication result.</p>\"\
        },\
        \"IdToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The ID token of the authentication result.</p>\"\
        },\
        \"NewDeviceMetadata\":{\
          \"shape\":\"NewDeviceMetadataType\",\
          \"documentation\":\"<p>The new device metadata from an authentication result.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result type of the authentication result.</p>\"\
    },\
    \"BooleanType\":{\"type\":\"boolean\"},\
    \"ChallengeNameType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SMS_MFA\",\
        \"PASSWORD_VERIFIER\",\
        \"CUSTOM_CHALLENGE\",\
        \"DEVICE_SRP_AUTH\",\
        \"DEVICE_PASSWORD_VERIFIER\",\
        \"ADMIN_NO_SRP_AUTH\"\
      ]\
    },\
    \"ChallengeParametersType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"ChallengeResponsesType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"ChangePasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PreviousPassword\",\
        \"ProposedPassword\"\
      ],\
      \"members\":{\
        \"PreviousPassword\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The old password in the change password request.</p>\"\
        },\
        \"ProposedPassword\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The new password in the change password request.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token in the change password request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to change a user password.</p>\"\
    },\
    \"ChangePasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response from the server to the change password request.</p>\"\
    },\
    \"ClientIdType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+]+\",\
      \"sensitive\":true\
    },\
    \"ClientMetadataType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"ClientNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\s+=,.@-]+\"\
    },\
    \"ClientPermissionListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ClientPermissionType\"}\
    },\
    \"ClientPermissionType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"ClientSecretType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+]+\",\
      \"sensitive\":true\
    },\
    \"CodeDeliveryDetailsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CodeDeliveryDetailsType\"}\
    },\
    \"CodeDeliveryDetailsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Destination\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The destination for the code delivery details.</p>\"\
        },\
        \"DeliveryMedium\":{\
          \"shape\":\"DeliveryMediumType\",\
          \"documentation\":\"<p>The delivery medium (email message or phone number).</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The name of the attribute in the code delivery details type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of code delivery details being returned from the server.</p>\"\
    },\
    \"CodeDeliveryFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message sent when a verification code fails to deliver successfully.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a verification code fails to deliver successfully.</p>\",\
      \"exception\":true\
    },\
    \"CodeMismatchException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message provided when the code mismatch exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown if the provided code does not match what the server was expecting.</p>\",\
      \"exception\":true\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message provided when the concurrent exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown if two or more modifications are happening concurrently.</p>\",\
      \"exception\":true\
    },\
    \"ConfirmDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceSecretVerifierConfig\":{\
          \"shape\":\"DeviceSecretVerifierConfigType\",\
          \"documentation\":\"<p>The configuration of the device secret verifier.</p>\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"DeviceNameType\",\
          \"documentation\":\"<p>The device name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Confirms the device request.</p>\"\
    },\
    \"ConfirmDeviceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserConfirmationNecessary\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Indicates whether the user confirmation is necessary to confirm the device response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Confirms the device response.</p>\"\
    },\
    \"ConfirmForgotPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\",\
        \"ConfirmationCode\",\
        \"Password\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user for whom you want to enter a code to retrieve a forgotten password.</p>\"\
        },\
        \"ConfirmationCode\":{\
          \"shape\":\"ConfirmationCodeType\",\
          \"documentation\":\"<p>The confirmation code sent by a user's request to retrieve a forgotten password.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The password sent by sent by a user's request to retrieve a forgotten password.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request representing the confirmation for a password reset.</p>\"\
    },\
    \"ConfirmForgotPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response from the server that results from a user's request to retrieve a forgotten password.</p>\"\
    },\
    \"ConfirmSignUpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\",\
        \"ConfirmationCode\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user whose registration you wish to confirm.</p>\"\
        },\
        \"ConfirmationCode\":{\
          \"shape\":\"ConfirmationCodeType\",\
          \"documentation\":\"<p>The confirmation code sent by a user's request to confirm registration.</p>\"\
        },\
        \"ForceAliasCreation\":{\
          \"shape\":\"ForceAliasCreation\",\
          \"documentation\":\"<p>Boolean to be specified to force user confirmation irrespective of existing alias. By default set to False. If this parameter is set to True and the phone number/email used for sign up confirmation already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user being confirmed. If set to False, the API will throw an <b>AliasExistsException</b> error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to confirm registration of a user.</p>\"\
    },\
    \"ConfirmSignUpResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the registration confirmation.</p>\"\
    },\
    \"ConfirmationCodeType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"CreateUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to create a user pool client.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name for the user pool client you would like to create.</p>\"\
        },\
        \"GenerateSecret\":{\
          \"shape\":\"GenerateSecret\",\
          \"documentation\":\"<p> Boolean to specify whether you want to generate a secret for the user pool client being created.</p>\"\
        },\
        \"RefreshTokenValidity\":{\
          \"shape\":\"RefreshTokenValidityType\",\
          \"documentation\":\"<p>Refreshes the token validity.</p>\"\
        },\
        \"ReadAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The read attributes.</p>\"\
        },\
        \"WriteAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The write attributes.</p>\"\
        },\
        \"ExplicitAuthFlows\":{\
          \"shape\":\"ExplicitAuthFlowsListType\",\
          \"documentation\":\"<p>The explicit authentication flows.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to create a user pool client.</p>\"\
    },\
    \"CreateUserPoolClientResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClient\":{\
          \"shape\":\"UserPoolClientType\",\
          \"documentation\":\"<p>The user pool client that was just created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to create a user pool client.</p>\"\
    },\
    \"CreateUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PoolName\"],\
      \"members\":{\
        \"PoolName\":{\
          \"shape\":\"UserPoolNameType\",\
          \"documentation\":\"<p>A string used to name the user pool.</p>\"\
        },\
        \"Policies\":{\
          \"shape\":\"UserPoolPolicyType\",\
          \"documentation\":\"<p>The policies associated with the new user pool.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>The Lambda trigger configuration information for the new user pool.</p>\"\
        },\
        \"AutoVerifiedAttributes\":{\
          \"shape\":\"VerifiedAttributesListType\",\
          \"documentation\":\"<p>The attributes to be auto-verified. Possible values: <b>email</b>, <b>phone_number</b>.</p>\"\
        },\
        \"AliasAttributes\":{\
          \"shape\":\"AliasAttributesListType\",\
          \"documentation\":\"<p>Attributes supported as an alias for this user pool. Possible values: <b>phone_number</b>, <b>email</b>, or <b>preferred_username</b>.</p>\"\
        },\
        \"SmsVerificationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>A string representing the SMS verification message.</p>\"\
        },\
        \"EmailVerificationMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>A string representing the email verification message.</p>\"\
        },\
        \"EmailVerificationSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>A string representing the email verification subject.</p>\"\
        },\
        \"SmsAuthenticationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>A string representing the SMS authentication message.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>Specifies MFA configuration details.</p>\"\
        },\
        \"DeviceConfiguration\":{\
          \"shape\":\"DeviceConfigurationType\",\
          \"documentation\":\"<p>The device configuration.</p>\"\
        },\
        \"EmailConfiguration\":{\
          \"shape\":\"EmailConfigurationType\",\
          \"documentation\":\"<p>The email configuration.</p>\"\
        },\
        \"SmsConfiguration\":{\
          \"shape\":\"SmsConfigurationType\",\
          \"documentation\":\"<p>The SMS configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to create a user pool.</p>\"\
    },\
    \"CreateUserPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPool\":{\
          \"shape\":\"UserPoolType\",\
          \"documentation\":\"<p>A container for the user pool details.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to create a user pool.</p>\"\
    },\
    \"CustomAttributeNameType\":{\
      \"type\":\"string\",\
      \"max\":20,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"CustomAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SchemaAttributeType\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"DateType\":{\"type\":\"timestamp\"},\
    \"DeleteUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserAttributeNames\"],\
      \"members\":{\
        \"UserAttributeNames\":{\
          \"shape\":\"AttributeNameListType\",\
          \"documentation\":\"<p>An array of strings representing the user attribute names you wish to delete.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token used in the request to delete user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete user attributes.</p>\"\
    },\
    \"DeleteUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server to delete user attributes.</p>\"\
    },\
    \"DeleteUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to delete the client.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user pool client.</p>\"\
    },\
    \"DeleteUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user pool.</p>\"\
    },\
    \"DeleteUserRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token from a request to delete a user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user.</p>\"\
    },\
    \"DeliveryMediumType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SMS\",\
        \"EMAIL\"\
      ]\
    },\
    \"DescribeUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to describe.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to describe a user pool client.</p>\"\
    },\
    \"DescribeUserPoolClientResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClient\":{\
          \"shape\":\"UserPoolClientType\",\
          \"documentation\":\"<p>The user pool client from a server response to describe the user pool client.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server from a request to describe the user pool client.</p>\"\
    },\
    \"DescribeUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to describe.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to describe the user pool.</p>\"\
    },\
    \"DescribeUserPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPool\":{\
          \"shape\":\"UserPoolType\",\
          \"documentation\":\"<p>The container of metadata returned by the server to describe the pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response to describe the user pool.</p>\"\
    },\
    \"DeviceConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeRequiredOnNewDevice\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Indicates whether a challenge is required on a new device. Only applicable to a new device.</p>\"\
        },\
        \"DeviceOnlyRememberedOnUserPrompt\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>If true, a device is only remembered on user prompt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of configuration for the user pool's device tracking.</p>\"\
    },\
    \"DeviceKeyType\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]+_[0-9a-f-]+\"\
    },\
    \"DeviceListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeviceType\"}\
    },\
    \"DeviceNameType\":{\
      \"type\":\"string\",\
      \"max\":150,\
      \"min\":1\
    },\
    \"DeviceRememberedStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"remembered\",\
        \"not_remembered\"\
      ]\
    },\
    \"DeviceSecretVerifierConfigType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PasswordVerifier\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The password verifier.</p>\"\
        },\
        \"Salt\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The salt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The device verifier against which it will be authenticated.</p>\"\
    },\
    \"DeviceType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>The device attributes.</p>\"\
        },\
        \"DeviceCreateDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date of the device.</p>\"\
        },\
        \"DeviceLastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date of the device.</p>\"\
        },\
        \"DeviceLastAuthenticatedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date in which the device was last authenticated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The device type.</p>\"\
    },\
    \"EmailAddressType\":{\
      \"type\":\"string\",\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+@[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"EmailConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the email source.</p>\"\
        },\
        \"ReplyToEmailAddress\":{\
          \"shape\":\"EmailAddressType\",\
          \"documentation\":\"<p>The REPLY-TO email address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The email configuration type.</p>\"\
    },\
    \"EmailVerificationMessageType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":6,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]*\\\\{####\\\\}[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]*\"\
    },\
    \"EmailVerificationSubjectType\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s]+\"\
    },\
    \"ExpiredCodeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the expired code exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown if a code has expired.</p>\",\
      \"exception\":true\
    },\
    \"ExplicitAuthFlowsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExplicitAuthFlowsType\"}\
    },\
    \"ExplicitAuthFlowsType\":{\
      \"type\":\"string\",\
      \"enum\":[\"ADMIN_NO_SRP_AUTH\"]\
    },\
    \"ForceAliasCreation\":{\"type\":\"boolean\"},\
    \"ForgetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeviceKey\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token for the forgotten device request.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to forget the device.</p>\"\
    },\
    \"ForgotPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user for whom you want to enter a code to retrieve a forgotten password.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to reset a user's password.</p>\"\
    },\
    \"ForgotPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetails\":{\"shape\":\"CodeDeliveryDetailsType\"}\
      },\
      \"documentation\":\"<p>Respresents the response from the server regarding the request to reset a password.</p>\"\
    },\
    \"GenerateSecret\":{\"type\":\"boolean\"},\
    \"GetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeviceKey\"],\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get the device.</p>\"\
    },\
    \"GetDeviceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Device\"],\
      \"members\":{\
        \"Device\":{\
          \"shape\":\"DeviceType\",\
          \"documentation\":\"<p>The device.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Gets the device response.</p>\"\
    },\
    \"GetUserAttributeVerificationCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AttributeName\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token returned by the server response to get the user attribute verification code.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The attribute name returned by the server response to get the user attribute verification code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get user attribute verification.</p>\"\
    },\
    \"GetUserAttributeVerificationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetails\":{\
          \"shape\":\"CodeDeliveryDetailsType\",\
          \"documentation\":\"<p>The code delivery details returned by the server response to get the user attribute verification code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The verification code response returned by the server response to get the user attribute verification code.</p>\"\
    },\
    \"GetUserRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token returned by the server response to get information about the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get information about the user.</p>\"\
    },\
    \"GetUserResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Username\",\
        \"UserAttributes\"\
      ],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to retrieve from the get user request.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p>Specifies the options for MFA (e.g., email or phone number).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server from the request to get information about the user.</p>\"\
    },\
    \"GlobalSignOutRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to sign out all devices.</p>\"\
    },\
    \"GlobalSignOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response to the request to sign out all devices.</p>\"\
    },\
    \"InitiateAuthRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AuthFlow\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"AuthFlow\":{\
          \"shape\":\"AuthFlowType\",\
          \"documentation\":\"<p>The authentication flow.</p>\"\
        },\
        \"AuthParameters\":{\
          \"shape\":\"AuthParametersType\",\
          \"documentation\":\"<p>The authentication parameters.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>The client app's metadata.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The client ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Initiates the authentication request.</p>\"\
    },\
    \"InitiateAuthResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters.</p>\"\
        },\
        \"AuthenticationResult\":{\"shape\":\"AuthenticationResultType\"}\
      },\
      \"documentation\":\"<p>Initiates the authentication response.</p>\"\
    },\
    \"IntegerType\":{\"type\":\"integer\"},\
    \"InternalErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws an internal error exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito encounters an internal error.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidEmailRoleAccessPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when you have an unverified email address or the identity policy is not set on an email address that Amazon Cognito can access.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito is not allowed to use your email identity. HTTP status code: 400.</p>\",\
      \"exception\":true\
    },\
    \"InvalidLambdaResponseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service throws an invalid AWS Lambda response exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters an invalid AWS Lambda response.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service throws an invalid parameter exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters an invalid parameter.</p>\",\
      \"exception\":true\
    },\
    \"InvalidPasswordException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service throws an invalid user password exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters an invalid password.</p>\",\
      \"exception\":true\
    },\
    \"InvalidSmsRoleAccessPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message retuned when the invalid SMS role access policy exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is returned when the role provided for SMS configuration does not have permission to publish using Amazon SNS.</p>\",\
      \"exception\":true\
    },\
    \"InvalidSmsRoleTrustRelationshipException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the role trust relationship for the SMS message is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the trust relationship is invalid for the role provided for SMS configuration. This can happen if you do not trust <b>cognito-idp.amazonaws.com</b> or the external ID provided in the role does not match what is provided in the SMS configuration for the user pool.</p>\",\
      \"exception\":true\
    },\
    \"InvalidUserPoolConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the user pool configuration is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the user pool configuration is invalid.</p>\",\
      \"exception\":true\
    },\
    \"LambdaConfigType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PreSignUp\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A pre-registration AWS Lambda trigger.</p>\"\
        },\
        \"CustomMessage\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A custom Message AWS Lambda trigger.</p>\"\
        },\
        \"PostConfirmation\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A post-confirmation AWS Lambda trigger.</p>\"\
        },\
        \"PreAuthentication\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A pre-authentication AWS Lambda trigger.</p>\"\
        },\
        \"PostAuthentication\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A post-authentication AWS Lambda trigger.</p>\"\
        },\
        \"DefineAuthChallenge\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>Defines the authentication challenge.</p>\"\
        },\
        \"CreateAuthChallenge\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>Creates an authentication challenge.</p>\"\
        },\
        \"VerifyAuthChallengeResponse\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>Verifies the authentication challenge response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the type of configuration for AWS Lambda triggers.</p>\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws a limit exceeded exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user exceeds the limit for a requested AWS resource.</p>\",\
      \"exception\":true\
    },\
    \"ListDevicesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccessToken\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access tokens for the request to list devices.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the device request.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token for the list request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list the devices.</p>\"\
    },\
    \"ListDevicesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Devices\":{\
          \"shape\":\"DeviceListType\",\
          \"documentation\":\"<p>The devices returned in the list devices response.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token for the list device response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response to list devices.</p>\"\
    },\
    \"ListUserPoolClientsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to list user pool clients.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"QueryLimit\",\
          \"documentation\":\"<p>The maximum number of results you want the request to return when listing the user pool clients.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list the user pool clients.</p>\"\
    },\
    \"ListUserPoolClientsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClients\":{\
          \"shape\":\"UserPoolClientListType\",\
          \"documentation\":\"<p>The user pool clients in the response that lists user pool clients.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server that lists user pool clients.</p>\"\
    },\
    \"ListUserPoolsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MaxResults\"],\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PoolQueryLimitType\",\
          \"documentation\":\"<p>The maximum number of results you want the request to return when listing the user pools.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list user pools.</p>\"\
    },\
    \"ListUserPoolsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPools\":{\
          \"shape\":\"UserPoolListType\",\
          \"documentation\":\"<p>The user pools from the response to list users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response to list user pools.</p>\"\
    },\
    \"ListUsersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for which you want to list users.</p>\"\
        },\
        \"AttributesToGet\":{\
          \"shape\":\"SearchedAttributeNamesListType\",\
          \"documentation\":\"<p>The attributes to get from the request to list users.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the request to list users.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        },\
        \"Filter\":{\
          \"shape\":\"UserFilterType\",\
          \"documentation\":\"<p>The filter for the list users request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list users.</p>\"\
    },\
    \"ListUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Users\":{\
          \"shape\":\"UsersListType\",\
          \"documentation\":\"<p>The users returned in the request to list users.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the request to list users.</p>\"\
    },\
    \"MFAMethodNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws an MFA method not found exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito cannot find a multi-factor authentication (MFA) method.</p>\",\
      \"exception\":true\
    },\
    \"MFAOptionListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MFAOptionType\"}\
    },\
    \"MFAOptionType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeliveryMedium\":{\
          \"shape\":\"DeliveryMediumType\",\
          \"documentation\":\"<p>The delivery medium (email message or SMS message) to send the MFA code.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The attribute name of the MFA option type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the different settings for multi-factor authentication (MFA).</p>\"\
    },\
    \"MessageType\":{\"type\":\"string\"},\
    \"NewDeviceMetadataType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceGroupKey\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The device group key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The new device metadata type.</p>\"\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a not authorized exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception gets thrown when a user is not authorized.</p>\",\
      \"exception\":true\
    },\
    \"NumberAttributeConstraintsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinValue\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The minimum value of an attribute that is of the number data type.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The maximum value of an attribute that is of the number data type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The minimum and maximum value of an attribute that is of the number data type.</p>\"\
    },\
    \"PaginationKey\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"PaginationKeyType\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"PasswordPolicyMinLengthType\":{\
      \"type\":\"integer\",\
      \"max\":99,\
      \"min\":6\
    },\
    \"PasswordPolicyType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinimumLength\":{\
          \"shape\":\"PasswordPolicyMinLengthType\",\
          \"documentation\":\"<p>The minimum length of the password policy that you have set. Cannot be less than 6.</p>\"\
        },\
        \"RequireUppercase\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one uppercase letter in their password.</p>\"\
        },\
        \"RequireLowercase\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one lowercase letter in their password.</p>\"\
        },\
        \"RequireNumbers\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one number in their password.</p>\"\
        },\
        \"RequireSymbols\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one symbol in their password.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The password policy type.</p>\"\
    },\
    \"PasswordResetRequiredException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when a password reset is required.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a password reset is required.</p>\",\
      \"exception\":true\
    },\
    \"PasswordType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":6,\
      \"pattern\":\"[\\\\S]+\",\
      \"sensitive\":true\
    },\
    \"PoolQueryLimitType\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":1\
    },\
    \"QueryLimit\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":1\
    },\
    \"QueryLimitType\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":0\
    },\
    \"RefreshTokenValidityType\":{\
      \"type\":\"integer\",\
      \"max\":3650,\
      \"min\":0\
    },\
    \"ResendConfirmationCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user to whom you wish to resend a confirmation code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to resend the confirmation code.</p>\"\
    },\
    \"ResendConfirmationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetails\":{\"shape\":\"CodeDeliveryDetailsType\"}\
      },\
      \"documentation\":\"<p>The response from the server when the Amazon Cognito service makes the request to resend a confirmation code.</p>\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a resource not found exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service cannot find the requested resource.</p>\",\
      \"exception\":true\
    },\
    \"RespondToAuthChallengeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"ChallengeName\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The client ID.</p>\"\
        },\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session.</p>\"\
        },\
        \"ChallengeResponses\":{\
          \"shape\":\"ChallengeResponsesType\",\
          \"documentation\":\"<p>The responses to the authentication challenge.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request to respond to an authentication challenge.</p>\"\
    },\
    \"RespondToAuthChallengeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The challenge name.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters.</p>\"\
        },\
        \"AuthenticationResult\":{\"shape\":\"AuthenticationResultType\"}\
      },\
      \"documentation\":\"<p>The response to respond to the authentication challenge.</p>\"\
    },\
    \"SchemaAttributeType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CustomAttributeNameType\",\
          \"documentation\":\"<p>A schema attribute of the name type.</p>\"\
        },\
        \"AttributeDataType\":{\
          \"shape\":\"AttributeDataType\",\
          \"documentation\":\"<p>The attribute data type.</p>\"\
        },\
        \"DeveloperOnlyAttribute\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether the attribute type is developer only.</p>\"\
        },\
        \"Mutable\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether the attribute can be changed once it has been created.</p>\"\
        },\
        \"Required\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether a user pool attribute is required. If the attribute is required and the user does not provide a value, registration or sign-in will fail.</p>\"\
        },\
        \"NumberAttributeConstraints\":{\
          \"shape\":\"NumberAttributeConstraintsType\",\
          \"documentation\":\"<p>Specifies the constraints for an attribute of the number type.</p>\"\
        },\
        \"StringAttributeConstraints\":{\
          \"shape\":\"StringAttributeConstraintsType\",\
          \"documentation\":\"<p>Specifies the constraints for an attribute of the string type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the schema attribute.</p>\"\
    },\
    \"SchemaAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SchemaAttributeType\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"SearchPaginationTokenType\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"SearchedAttributeNamesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeNameType\"}\
    },\
    \"SecretHashType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+=/]+\",\
      \"sensitive\":true\
    },\
    \"SessionType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"SetUserSettingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"MFAOptions\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token for the set user settings request.</p>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p>Specifies the options for MFA (e.g., email or phone number).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to set user settings.</p>\"\
    },\
    \"SetUserSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response from the server for a set user settings request.</p>\"\
    },\
    \"SignUpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\",\
        \"Password\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to register.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The password of the user you wish to register.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p>\"\
        },\
        \"ValidationData\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>The validation data in the request to register a user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to register a user.</p>\"\
    },\
    \"SignUpResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserConfirmed\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A response from the server indicating that a user registration has been confirmed.</p>\"\
        },\
        \"CodeDeliveryDetails\":{\"shape\":\"CodeDeliveryDetailsType\"}\
      },\
      \"documentation\":\"<p>The response from the server for a registration request.</p>\"\
    },\
    \"SmsConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnsCallerArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) caller.</p>\"\
        },\
        \"ExternalId\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The external ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The SMS configuratoin type.</p>\"\
    },\
    \"SmsVerificationMessageType\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":6,\
      \"pattern\":\".*\\\\{####\\\\}.*\"\
    },\
    \"StatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"StringAttributeConstraintsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinLength\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The minimum length of an attribute value of the string type.</p>\"\
        },\
        \"MaxLength\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The maximum length of an attribute value of the string type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of constraints associated with an attribute of the string type.</p>\"\
    },\
    \"StringType\":{\"type\":\"string\"},\
    \"TokenModelType\":{\
      \"type\":\"string\",\
      \"pattern\":\"[A-Za-z0-9-_=.]+\",\
      \"sensitive\":true\
    },\
    \"TooManyFailedAttemptsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a too many failed attempts exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception gets thrown when the user has made too many failed attempts for a given action (e.g., sign in).</p>\",\
      \"exception\":true\
    },\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a too many requests exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception gets thrown when the user has made too many requests for a given operation.</p>\",\
      \"exception\":true\
    },\
    \"UnexpectedLambdaException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns an unexpected AWS Lambda exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception gets thrown when the Amazon Cognito service encounters an unexpected exception with the AWS Lambda service.</p>\",\
      \"exception\":true\
    },\
    \"UpdateDeviceStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceRememberedStatus\":{\
          \"shape\":\"DeviceRememberedStatusType\",\
          \"documentation\":\"<p>The status of whether a device is remembered.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the device status.</p>\"\
    },\
    \"UpdateDeviceStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response to the request to update the device status.</p>\"\
    },\
    \"UpdateUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserAttributes\"],\
      \"members\":{\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token for the request to update user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update user attributes.</p>\"\
    },\
    \"UpdateUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetailsList\":{\
          \"shape\":\"CodeDeliveryDetailsListType\",\
          \"documentation\":\"<p>The code delivery details list from the server for the request to update user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to update user attributes.</p>\"\
    },\
    \"UpdateUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to update the user pool client.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name from the update user pool client request.</p>\"\
        },\
        \"RefreshTokenValidity\":{\
          \"shape\":\"RefreshTokenValidityType\",\
          \"documentation\":\"<p>The validity of the refresh token.</p>\"\
        },\
        \"ReadAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The read-only attributes of the user pool.</p>\"\
        },\
        \"WriteAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The writeable attributes of the user pool.</p>\"\
        },\
        \"ExplicitAuthFlows\":{\
          \"shape\":\"ExplicitAuthFlowsListType\",\
          \"documentation\":\"<p>Explicit authentication flows.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the user pool client.</p>\"\
    },\
    \"UpdateUserPoolClientResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClient\":{\
          \"shape\":\"UserPoolClientType\",\
          \"documentation\":\"<p>The user pool client value from the response from the server when an update user pool client request is made.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to update the user pool client.</p>\"\
    },\
    \"UpdateUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to update.</p>\"\
        },\
        \"Policies\":{\
          \"shape\":\"UserPoolPolicyType\",\
          \"documentation\":\"<p>A container with the policies you wish to update in a user pool.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>The AWS Lambda configuration information from the request to update the user pool.</p>\"\
        },\
        \"AutoVerifiedAttributes\":{\
          \"shape\":\"VerifiedAttributesListType\",\
          \"documentation\":\"<p>The attributes that are automatically verified when the Amazon Cognito service makes a request to update user pools.</p>\"\
        },\
        \"SmsVerificationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>A container with information about the SMS verification message.</p>\"\
        },\
        \"EmailVerificationMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the email verification message.</p>\"\
        },\
        \"EmailVerificationSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>The subject of the email verfication message</p>\"\
        },\
        \"SmsAuthenticationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the SMS authentication message.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>Can be one of the following values:</p> <ul> <li><code>OFF</code> - MFA tokens are not required and cannot be specified during user registration.</li> <li><code>ON</code> - MFA tokens are required for all user registrations. You can only specify required when you are initially creating a user pool.</li> <li><code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</li> </ul>\"\
        },\
        \"DeviceConfiguration\":{\
          \"shape\":\"DeviceConfigurationType\",\
          \"documentation\":\"<p>Device configuration.</p>\"\
        },\
        \"EmailConfiguration\":{\
          \"shape\":\"EmailConfigurationType\",\
          \"documentation\":\"<p>Email configuration.</p>\"\
        },\
        \"SmsConfiguration\":{\
          \"shape\":\"SmsConfigurationType\",\
          \"documentation\":\"<p>SMS configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the user pool.</p>\"\
    },\
    \"UpdateUserPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server when you make a request to update the user pool.</p>\"\
    },\
    \"UserFilterType\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"UserLambdaValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a user validation exception with the AWS Lambda service.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception gets thrown when the Amazon Cognito service encounters a user validation exception with the AWS Lambda service.</p>\",\
      \"exception\":true\
    },\
    \"UserNotConfirmedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when a user is not confirmed successfully.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user is not confirmed successfully.</p>\",\
      \"exception\":true\
    },\
    \"UserNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when a user is not found.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user is not found.</p>\",\
      \"exception\":true\
    },\
    \"UserPoolClientDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to describe the user pool client.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name from the user pool client description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The description of the user poool client.</p>\"\
    },\
    \"UserPoolClientListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserPoolClientDescription\"}\
    },\
    \"UserPoolClientType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool client.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name from the user pool request of the client type.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"ClientSecret\":{\
          \"shape\":\"ClientSecretType\",\
          \"documentation\":\"<p>The client secret from the user pool request of the client type.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date from the user pool request of the client type.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date from the user pool request of the client type.</p>\"\
        },\
        \"RefreshTokenValidity\":{\
          \"shape\":\"RefreshTokenValidityType\",\
          \"documentation\":\"<p>The validity of the refresh token.</p>\"\
        },\
        \"ReadAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The Read-only attributes.</p>\"\
        },\
        \"WriteAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The writeable attributes.</p>\"\
        },\
        \"ExplicitAuthFlows\":{\
          \"shape\":\"ExplicitAuthFlowsListType\",\
          \"documentation\":\"<p>The explicit authentication flows.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A user pool of the client type.</p>\"\
    },\
    \"UserPoolDescriptionType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID in a user pool description.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"UserPoolNameType\",\
          \"documentation\":\"<p>The name in a user pool description.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>The AWS Lambda configuration information in a user pool description.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusType\",\
          \"documentation\":\"<p>The user pool status in a user pool description.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date in a user pool description.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date in a user pool description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A user pool description.</p>\"\
    },\
    \"UserPoolIdType\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]+.[0-9a-zA-Z-]+\"\
    },\
    \"UserPoolListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserPoolDescriptionType\"}\
    },\
    \"UserPoolMfaType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"ON\",\
        \"OPTIONAL\"\
      ]\
    },\
    \"UserPoolNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\s+=,.@-]+\"\
    },\
    \"UserPoolPolicyType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PasswordPolicy\":{\
          \"shape\":\"PasswordPolicyType\",\
          \"documentation\":\"<p>A container with information about the user pool password policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of policy in a user pool.</p>\"\
    },\
    \"UserPoolType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the user pool.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"UserPoolNameType\",\
          \"documentation\":\"<p>The name of the user pool.</p>\"\
        },\
        \"Policies\":{\
          \"shape\":\"UserPoolPolicyType\",\
          \"documentation\":\"<p>A container describing the policies associated with a user pool.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>A container describing the AWS Lambda triggers associated with a user pool.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusType\",\
          \"documentation\":\"<p>The status of a user pool.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date of a user pool.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date of a user pool.</p>\"\
        },\
        \"SchemaAttributes\":{\
          \"shape\":\"SchemaAttributesListType\",\
          \"documentation\":\"<p>A container with the schema attributes of a user pool.</p>\"\
        },\
        \"AutoVerifiedAttributes\":{\
          \"shape\":\"VerifiedAttributesListType\",\
          \"documentation\":\"<p>Specifies the attributes that are auto-verified in a user pool.</p>\"\
        },\
        \"AliasAttributes\":{\
          \"shape\":\"AliasAttributesListType\",\
          \"documentation\":\"<p>Specifies the attributes that are aliased in a user pool.</p>\"\
        },\
        \"SmsVerificationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the SMS verification message.</p>\"\
        },\
        \"EmailVerificationMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the email verification message.</p>\"\
        },\
        \"EmailVerificationSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>The subject of the email verification message.</p>\"\
        },\
        \"SmsAuthenticationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the SMS authentication message.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>Can be one of the following values:</p> <ul> <li><code>OFF</code> - MFA tokens are not required and cannot be specified during user registration.</li> <li><code>ON</code> - MFA tokens are required for all user registrations. You can only specify required when you are initially creating a user pool.</li> <li><code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</li> </ul>\"\
        },\
        \"DeviceConfiguration\":{\
          \"shape\":\"DeviceConfigurationType\",\
          \"documentation\":\"<p>The device configuration.</p>\"\
        },\
        \"EstimatedNumberOfUsers\":{\
          \"shape\":\"IntegerType\",\
          \"documentation\":\"<p>A number estimating the size of the user pool.</p>\"\
        },\
        \"EmailConfiguration\":{\
          \"shape\":\"EmailConfigurationType\",\
          \"documentation\":\"<p>The email configuration.</p>\"\
        },\
        \"SmsConfiguration\":{\
          \"shape\":\"SmsConfigurationType\",\
          \"documentation\":\"<p>The SMS configuration.</p>\"\
        },\
        \"SmsConfigurationFailure\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The reason why the SMS configuration cannot send the message(s) to your users.</p>\"\
        },\
        \"EmailConfigurationFailure\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The reason why the email configuration cannot send the messages to your users.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container with information about the user pool type.</p>\"\
    },\
    \"UserStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNCONFIRMED\",\
        \"CONFIRMED\",\
        \"ARCHIVED\",\
        \"COMPROMISED\",\
        \"UNKNOWN\",\
        \"RESET_REQUIRED\"\
      ]\
    },\
    \"UserType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to describe.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>A container with information about the user type attributes.</p>\"\
        },\
        \"UserCreateDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date of the user.</p>\"\
        },\
        \"UserLastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date of the user.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether the user is enabled.</p>\"\
        },\
        \"UserStatus\":{\
          \"shape\":\"UserStatusType\",\
          \"documentation\":\"<p>The user status. Can be one of the following:</p> <ul> <li>UNCONFIRMED - User has been created but not confirmed.</li> <li>CONFIRMED - User has been confirmed.</li> <li>ARCHIVED - User is no longer active.</li> <li>COMPROMISED - User is disabled due to a potential security threat.</li> <li>UNKNOWN - User status is not known.</li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The user type.</p>\"\
    },\
    \"UsernameExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws a user name exists exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito encounters a user name that already exists in the user pool.</p>\",\
      \"exception\":true\
    },\
    \"UsernameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\",\
      \"sensitive\":true\
    },\
    \"UsersListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserType\"}\
    },\
    \"VerifiedAttributeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"phone_number\",\
        \"email\"\
      ]\
    },\
    \"VerifiedAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VerifiedAttributeType\"}\
    },\
    \"VerifyUserAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AttributeName\",\
        \"Code\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>Represents the access token of the request to verify user attributes.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The attribute name in the request to verify user attributes.</p>\"\
        },\
        \"Code\":{\
          \"shape\":\"ConfirmationCodeType\",\
          \"documentation\":\"<p>The verification code in the request to verify user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to verify user attributes.</p>\"\
    },\
    \"VerifyUserAttributeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A container representing the response from the server from the request to verify user attributes.</p>\"\
    }\
  },\
  \"documentation\":\"<p>You can create a user pool in Amazon Cognito Identity to manage directories and users. You can authenticate a user to obtain tokens related to user identity and access policies.</p> <p>This API reference provides information about user pools in Amazon Cognito Identity.</p> <p>For more information, see <a href=\\\"https://aws.amazon.com/cognito/\\\">Amazon Cognito</a>.</p>\"\
}";
}

@end
