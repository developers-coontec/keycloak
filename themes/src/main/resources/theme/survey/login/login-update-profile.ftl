<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
        method="post">
    <script>

      function onLoadFunction() {
        console.log('onLoadFunction');
        isAgreementRequired(false);
        onAllAgreementDropdownClick();
      }

      window.addEventListener('load', onLoadFunction);
    </script>
    <input id="password" name="password" type="hidden" value="1111QWwwe!">
    <input name="email" type="hidden" value="${(user.email!'')}">
    <input name="naverIdRequired" type="hidden" value="${(naverIdRequired!'')}">
    <div class="survey_content survey_content_register">
      <div class="survey_content_title">
          ${msg("login-update-profile-content-title")}
      </div>
      <div class="survey_content_subtitle">
          ${msg("login-update-profile-content-subtitle", "${(socialName!'')}")}
          <#if naverIdRequired == "true">
            <br/><br/>${msg("survey_content_naver-description", "${(user.email!'')}")?no_esc}
          </#if>
      </div>
        <#if naverIdRequired == "false">
          <div class="survey_content_input_group ">
            <div class="survey_content_input_label">
              <span>${msg("register-content-email")}</span>
            </div>
            <div class="survey_content_input_text survey_content_disabled">
              <input id="email" name="email1" type="text" disabled
                     value="${(user.email!'')}"/>
            </div>
          </div>
        </#if>
        <#if naverIdRequired == "true">
          <div class="survey_content_input_group ">
            <div class="survey_content_input_label">
              <span>${msg("register-content-naver-id")}</span>
            </div>
            <div class="survey_content_input_text">
              <input id="email" name="email1" type="hidden" value=""/>
              <input id="naverId" name="naverId" type="text"
                     value="${(naverId!user.naverId!'')}"
                     maxlength="300"
                     placeholder="${msg("survey_content_naver-id-placeholder")}"/>
            </div>
          </div>
        </#if>
      <div class="survey_content_input_group ">
        <div class="survey_content_input_label">
          <span>${msg("register-content-name")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="name" name="name" type="text"
                 value="${(name!user.name!'')}"
                 maxlength="200"
                 placeholder="${msg("survey_content_name-placeholder")}"/>
        </div>
      </div>
<#--      <div class="survey_content_input_group ">-->
<#--        <div class="survey_content_input_label">-->
<#--          <span>${msg("register-content-mobile-phone-number")}</span>-->
<#--        </div>-->
<#--        <div class="survey_content_input_text">-->
<#--          <input id="mobilePhoneNumber" name="mobilePhoneNumber" type="text"-->
<#--                 autocomplete="mobilePhoneNumber"-->
<#--                 maxlength="100"-->
<#--                 value="${(mobilePhoneNumber!user.mobilePhoneNumber!'')}"-->
<#--                 placeholder="${msg("survey_content_mobile-phone-number-placeholder")}"/>-->
<#--        </div>-->
<#--      </div>-->
      <div class="survey_content_input_group ">
        <div class="survey_content_input_label">
          <span>${msg("register-content-company")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="company" name="company" type="text"
                 autocomplete="company"
                 maxlength="200"
                 value="${(company!user.company!'')}"
                 placeholder="${msg("survey_content_company-placeholder")}"/>
        </div>
      </div>
<#--      <div class="survey_content_input_group ">-->
<#--        <div class="survey_content_input_label">-->
<#--          <span>${msg("register-content-referral-code")}</span>-->
<#--        </div>-->
<#--        <div class="survey_content_input_text">-->
<#--            <#if referredByCode?? && referredByCode?has_content >-->
<#--              <input id="referredByCode" name="referredByCode1" type="text"-->
<#--                     disabled class="survey_content_disabled"-->
<#--                     value="${(referredByCode!'')}"/>-->
<#--              <input name="referredByCode" type="hidden"-->
<#--                     value="${(referredByCode!'')}"/>-->
<#--            <#else>-->
<#--              <input id="referredByCode" name="referredByCode" type="text"-->
<#--                     autocomplete="off" maxlength="6"-->
<#--                     value="${(referredByCode!'')}"/>-->
<#--            </#if>-->
<#--        </div>-->
<#--      </div>-->
      <div id="register-agreement-section" class="register-agreement margin-top-20">
        <div class="register-agreement-select">
          <div class="register-agreement-checkbox"
          >
            <div id="all-agreement-checkbox"
                 class="all-agreement-checkbox-checked-svg survey_content_hide"></div>
          </div>
          <input id="allAgreement" name="allAgreement" type="hidden"/>
          <input id="all-agreement-dropdown" name="allAgreementDropdown" type="hidden"/>
          <div class="register-agreement-text">
            <span>${msg("register-content-all-agreement")}</span>
          </div>
          <div id="div-all-agreement-dropdown" class="all-agreement-dropdown dropdown-default"
               onclick="onAllAgreementDropdownClick()">
          </div>
        </div>
        <div id="register-agreement-option-section"
             class="register-agreement-select-options survey_content_hide">
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="service-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg survey_content_hide"></div>
            </div>
            <input id="serviceAgreement" name="serviceAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.planesg.ai/policy-service', 800, 1000)">
              <span>${msg("register-content-service-agreement")}</span>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="privacy-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg survey_content_hide"></div>
            </div>
            <input id="privacyAgreement" name="privacyAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.planesg.ai/policy-privacy', 800, 1000)">
              <span>${msg("register-content-privacy-agreement")}</span>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="marketing-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg survey_content_hide"></div>
            </div>
            <input id="marketingAgreement" name="marketingAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.planesg.ai/policy-marketing', 800, 1000)">
              <span>${msg("register-content-marketing-agreement")}</span>
            </div>
          </div>
        </div>
        <div id="register-validation-accept-agreement"
             class="register-validation-agreement survey_content_hide">
          <span>${msg("survey_validation-require-accept")}</span>
        </div>
      </div>
      <div id="agreement_next_section" class="survey_content_links update_profile_content_links">
        <div class="survey_content_button_group">
          <div id="register-button" class="survey_button">
            <span>${msg("register-button")}</span>
          </div>
        </div>
        <div class="survey_content_link_group margin-top-32">
          <div class="survey_link_description">
            <span>${msg("register-login-msg")}</span>
          </div>
          <div class="register-login survey_link_text margin-left-10" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("register-login-link")}</span>
          </div>
        </div>
      </div>
    </div>
      <#--      <#if user.editUsernameAllowed>-->
      <#--        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">-->
      <#--          <div class="${properties.kcLabelWrapperClass!}">-->
      <#--            <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>-->
      <#--          </div>-->
      <#--          <div class="${properties.kcInputWrapperClass!}">-->
      <#--            <input type="text" id="username" name="username" value="${(user.username!'')}"-->
      <#--                   class="${properties.kcInputClass!}"/>-->
      <#--          </div>-->
      <#--        </div>-->
      <#--      </#if>-->
      <#--    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">-->
      <#--      <div class="${properties.kcLabelWrapperClass!}">-->
      <#--        <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>-->
      <#--      </div>-->
      <#--      <div class="${properties.kcInputWrapperClass!}">-->
      <#--        <input type="text" id="email" name="email" value="${(user.email!'')}" class="${properties.kcInputClass!}"/>-->
      <#--      </div>-->
      <#--    </div>-->

      <#--    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">-->
      <#--      <div class="${properties.kcLabelWrapperClass!}">-->
      <#--        <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>-->
      <#--      </div>-->
      <#--      <div class="${properties.kcInputWrapperClass!}">-->
      <#--        <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}"-->
      <#--               class="${properties.kcInputClass!}"/>-->
      <#--      </div>-->
      <#--    </div>-->

      <#--    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">-->
      <#--      <div class="${properties.kcLabelWrapperClass!}">-->
      <#--        <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>-->
      <#--      </div>-->
      <#--      <div class="${properties.kcInputWrapperClass!}">-->
      <#--        <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}"-->
      <#--               class="${properties.kcInputClass!}"/>-->
      <#--      </div>-->
      <#--    </div>-->

      <#--    <div class="${properties.kcFormGroupClass!}">-->
      <#--      <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">-->
      <#--        <div class="${properties.kcFormOptionsWrapperClass!}">-->
      <#--        </div>-->
      <#--      </div>-->

      <#--      <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">-->
      <#--          <#if isAppInitiatedAction??>-->
      <#--            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"-->
      <#--                   type="submit" value="${msg("doSubmit")}"/>-->
      <#--            <button-->
      <#--            class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}"-->
      <#--            type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>-->
      <#--          <#else>-->
      <#--            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"-->
      <#--                   type="submit" value="${msg("doSubmit")}"/>-->
      <#--          </#if>-->
      <#--      </div>-->
      <#--    </div>-->
  </form>
</@layout.registrationLayout>
