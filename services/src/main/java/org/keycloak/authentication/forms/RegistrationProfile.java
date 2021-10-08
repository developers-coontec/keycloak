/*
 * Copyright 2016 Red Hat, Inc. and/or its affiliates
 * and other contributors as indicated by the @author tags.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.keycloak.authentication.forms;

import static org.keycloak.utils.IdentityProviderUtils.splitNames;
import static org.keycloak.utils.IdentityProviderUtils.stripMobilePhoneNumber;

import java.util.Random;
import org.jboss.resteasy.spi.HttpRequest;
import org.keycloak.Config;
import org.keycloak.authentication.FormAction;
import org.keycloak.authentication.FormActionFactory;
import org.keycloak.authentication.FormContext;
import org.keycloak.events.Details;
import org.keycloak.events.Errors;
import org.keycloak.forms.login.LoginFormsProvider;
import org.keycloak.models.AuthenticationExecutionModel;
import org.keycloak.models.Constants;
import org.keycloak.models.IUser;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserModel;
import org.keycloak.models.utils.FormMessage;
import org.keycloak.provider.ProviderConfigProperty;
import org.keycloak.services.messages.Messages;
import org.keycloak.services.validation.Validation;
import org.keycloak.userprofile.UserProfileContext;
import org.keycloak.userprofile.ValidationException;
import org.keycloak.userprofile.UserProfile;
import org.keycloak.userprofile.UserProfileProvider;

import javax.ws.rs.core.MultivaluedMap;
import java.util.List;

/**
 * @author <a href="mailto:bill@burkecentral.com">Bill Burke</a>
 * @version $Revision: 1 $
 */
public class RegistrationProfile implements FormAction, FormActionFactory {
    public static final String PROVIDER_ID = "registration-profile-action";


    public static void populateLastNameFirstNameUsingName(MultivaluedMap<String, String> formData) {
        String inputName = formData.getFirst(Constants.FIELD_NAME);
        if (!Validation.isBlank(inputName)) {
            List<String> splittedName = splitNames(inputName);
            if (splittedName.size() > 0) {
                formData.putSingle(Constants.FIELD_FIRST_NAME, splittedName.get(0));
                if (splittedName.size() > 1) {
                    formData.putSingle(Validation.FIELD_LAST_NAME, splittedName.get(1));
                }
            }
        }
    }


    public static void populateReferredByCode(HttpRequest httpRequest, MultivaluedMap<String, String> formData) {
        Object referralCodeObject = httpRequest.getAttribute(Constants.FIELD_REFERRAL_CODE);
        String referralCode = referralCodeObject != null ? referralCodeObject.toString() : null;
        if (referralCode != null){
            formData.add(Constants.FIELD_REFERRED_BY_CODE, referralCode);
        }
    }

    public static String getBooleanValue(MultivaluedMap<String, String> formData, String propertyName) {
        String value = formData.getFirst(propertyName);
        if (value == null || value.isEmpty()) {
            value = "false";
        }
        return value;
    }

    public static void populateFormFields(HttpRequest httpRequest, IUser user, MultivaluedMap<String, String> formData) {
        populateFormFields(httpRequest, formData);
        user.setFirstName(formData.getFirst(Constants.FIELD_FIRST_NAME));
        user.setLastName(formData.getFirst(Constants.FIELD_LAST_NAME));
        user.setEmail(formData.getFirst(Constants.FIELD_EMAIL));

        populateAttributes(user, formData);
    }

    public static void populateDefaultValues(MultivaluedMap<String, String> formData) {
        String referralCode = generateReferralCode();
        formData.add(Constants.FIELD_REFERRAL_CODE, referralCode);
        String currentLocale = formData.getFirst(Constants.FIELD_LOCALE);
        if (currentLocale == null || currentLocale.isEmpty()) {
            formData.add(Constants.FIELD_LOCALE, "ko");
        }
    }

    public static void populateFormFields(HttpRequest httpRequest, MultivaluedMap<String, String> formData) {
        populateLastNameFirstNameUsingName(formData);
        populateReferredByCode(httpRequest, formData);
        populateDefaultValues(formData);
    }

    public static String generateReferralCode() {
        int leftLimit = 48; // numeral '0'
//        int rightLimit = 122; // letter 'z'
        int rightLimit = 90; // letter 'Z'
        int targetStringLength = 6;
        Random random = new Random();

        String generatedString = random.ints(leftLimit, rightLimit + 1)
            .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
            .limit(targetStringLength)
            .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
            .toString();

        return generatedString.toUpperCase();
    }

    public static void populateAttributes(IUser user, MultivaluedMap<String, String> formData) {
        String mobilePhoneNumber = formData.getFirst(Constants.FIELD_MOBILE_PHONE_NUMBER);
        mobilePhoneNumber = stripMobilePhoneNumber(mobilePhoneNumber);
        if (mobilePhoneNumber != null) {
            user.setSingleAttribute(Constants.FIELD_MOBILE_PHONE_NUMBER, mobilePhoneNumber);
        }
        String company = formData.getFirst(Constants.FIELD_COMPANY);
        if (company != null && !company.isEmpty()) {
            user.setSingleAttribute(Constants.FIELD_COMPANY, company);
        }

        String birthDate = formData.getFirst(Constants.FIELD_BIRTH_DATE);
        if (birthDate != null && !birthDate.isEmpty()) {
            user.setSingleAttribute(Constants.FIELD_BIRTH_DATE, birthDate);
        }
        String profileImageUrl = formData.getFirst(Constants.FIELD_PROFILE_IMAGE_URL);
        if (profileImageUrl != null && !profileImageUrl.isEmpty()) {
            user.setSingleAttribute(Constants.FIELD_PROFILE_IMAGE_URL, profileImageUrl);
        }
        String profileThumbnailImageUrl = formData.getFirst(Constants.FIELD_PROFILE_THUMBNAIL_IMAGE_URL);
        if (profileThumbnailImageUrl != null && !profileThumbnailImageUrl.isEmpty()) {
            user.setSingleAttribute(Constants.FIELD_PROFILE_THUMBNAIL_IMAGE_URL, profileThumbnailImageUrl);
        }
        String genderCode = formData.getFirst(Constants.FIELD_GENDER_CODE);
        if (genderCode != null && !genderCode.isEmpty()) {
            user.setSingleAttribute(Constants.FIELD_GENDER_CODE, genderCode);
        }
        String referredByCode = formData.getFirst(Constants.FIELD_REFERRED_BY_CODE);
        if (referredByCode != null){
            referredByCode = referredByCode.trim();
            if (!referredByCode.isEmpty()){
                user.setSingleAttribute(Constants.FIELD_REFERRED_BY_CODE, referredByCode.toUpperCase());
            }
        }
        String currentLocale = user.getFirstAttribute(Constants.FIELD_LOCALE);
        if (currentLocale == null || currentLocale.isEmpty()) {
            user.setSingleAttribute(Constants.FIELD_LOCALE, "ko");
        }
        String referralCode = generateReferralCode();
        user.setSingleAttribute(Constants.FIELD_REFERRAL_CODE, referralCode);
        user.setSingleAttribute(Constants.FIELD_SERVICE_AGREEMENT, getBooleanValue(formData, Constants.FIELD_SERVICE_AGREEMENT));
        user.setSingleAttribute(Constants.FIELD_PRIVACY_AGREEMENT, getBooleanValue(formData, Constants.FIELD_PRIVACY_AGREEMENT));
        user.setSingleAttribute(Constants.FIELD_MARKETING_AGREEMENT, getBooleanValue(formData, Constants.FIELD_MARKETING_AGREEMENT));
    }
    @Override
    public String getHelpText() {
        return "Validates email, first name, and last name attributes and stores them in user data.";
    }

    @Override
    public List<ProviderConfigProperty> getConfigProperties() {
        return null;
    }

    @Override
    public void validate(org.keycloak.authentication.ValidationContext context) {
        MultivaluedMap<String, String> formData = context.getHttpRequest().getDecodedFormParameters();

        context.getEvent().detail(Details.REGISTER_METHOD, "form");

        UserProfileProvider profileProvider = context.getSession().getProvider(UserProfileProvider.class);
        UserProfile profile = profileProvider.create(UserProfileContext.REGISTRATION_PROFILE, formData);

        try {
            profile.validate();
        } catch (ValidationException pve) {
            List<FormMessage> errors = Validation.getFormErrorsFromValidation(pve.getErrors());

            if (pve.hasError(Messages.EMAIL_EXISTS, Messages.INVALID_EMAIL)) {
                context.getEvent().detail(Details.EMAIL, profile.getAttributes().getFirstValue(UserModel.EMAIL));
            }

            if (pve.hasError(Messages.EMAIL_EXISTS)) {
                context.error(Errors.EMAIL_IN_USE);
                formData.remove("email");
            } else
                context.error(Errors.INVALID_REGISTRATION);

            context.validationError(formData, errors);

            return;
        }

        context.success();
    }

    @Override
    public void success(FormContext context) {
        UserModel user = context.getUser();
        MultivaluedMap<String, String> formData = context.getHttpRequest().getDecodedFormParameters();
        populateFormFields(context.getHttpRequest(), user, formData);
        UserProfileProvider provider = context.getSession().getProvider(UserProfileProvider.class);
        provider.create(UserProfileContext.REGISTRATION_PROFILE, context.getHttpRequest().getDecodedFormParameters(), user).update();
    }

    @Override
    public void buildPage(FormContext context, LoginFormsProvider form) {
        // complete
    }

    @Override
    public boolean requiresUser() {
        return false;
    }

    @Override
    public boolean configuredFor(KeycloakSession session, RealmModel realm, UserModel user) {
        return true;
    }

    @Override
    public void setRequiredActions(KeycloakSession session, RealmModel realm, UserModel user) {

    }

    @Override
    public boolean isUserSetupAllowed() {
        return false;
    }


    @Override
    public void close() {

    }

    @Override
    public String getDisplayType() {
        return "Profile Validation";
    }

    @Override
    public String getReferenceCategory() {
        return null;
    }

    @Override
    public boolean isConfigurable() {
        return false;
    }

    private static AuthenticationExecutionModel.Requirement[] REQUIREMENT_CHOICES = {
            AuthenticationExecutionModel.Requirement.REQUIRED,
            AuthenticationExecutionModel.Requirement.DISABLED
    };
    @Override
    public AuthenticationExecutionModel.Requirement[] getRequirementChoices() {
        return REQUIREMENT_CHOICES;
    }
    @Override
    public FormAction create(KeycloakSession session) {
        return this;
    }

    @Override
    public void init(Config.Scope config) {

    }

    @Override
    public void postInit(KeycloakSessionFactory factory) {

    }

    @Override
    public String getId() {
        return PROVIDER_ID;
    }
}
