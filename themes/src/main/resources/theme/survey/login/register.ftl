<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <form id="kc-register-form" class="survey_form" action="${url.registrationAction}"
        method="post">
    <script>

      function onLoadFunction() {
        console.log('onLoadFunction');
        isAgreementRequired(false);
        onAllAgreementDropdownClick();
      }

      window.addEventListener('load', onLoadFunction);
    </script>
    <div class="survey_content survey_content_register">
      <div class="survey_content_title">
          ${msg("register-content-title")}
      </div>
      <div class="survey_content_input_group ">
        <div class="survey_content_input_label">
          <span>${msg("register-content-email")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="email" name="email" type="text"
                 autocomplete="email"
                 value="${(register.formData.email!'')}"
                 maxlength="300"
                 placeholder="${msg("survey_content_email-placeholder")}"/>
        </div>
      </div>
      <div class="survey_content_input_group">
        <div class="survey_content_input_label">
          <span>${msg("register-content-password")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="password" name="password" type="password" autocomplete="new-password"
                 maxlength="100"
                 placeholder="${msg("survey_content_password-placeholder")}"
          />
          <input id="password-confirm" name="password-confirm" type="hidden"/>
          <div id="survey_password-strength-group"
               class="survey_password-strength survey_content_hide">
            <div class="survey_password-strength-text">
              <span>${msg("survey_password-strength-text")} :</span>
            </div>
            <div class="survey_password-strength-value">
              <span id="survey_password-strength-value-span"></span>
            </div>
          </div>
        </div>
        <div class="survey_flex_br"></div>
        <div class="survey_content_input_description">
            <span
                class="register-content-label-password-description">${msg("register-content-password-description")}</span>
        </div>
      </div>
      <div class="survey_content_input_group ">
        <div class="survey_content_input_label">
          <span>${msg("register-content-name")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="name" name="name" type="text"
                 value="${(register.formData.name!'')}"
                 maxlength="200"
                 placeholder="${msg("survey_content_name-placeholder")}"/>
        </div>
      </div>
<#--      <div class="survey_content_input_group">-->
<#--        <div class="survey_content_input_label">-->
<#--          <span>${msg("register-content-mobile-phone-number")}</span>-->
<#--        </div>-->
<#--        <div class="survey_content_input_text">-->
<#--          <input id="mobilePhoneNumber" name="mobilePhoneNumber" type="text"-->
<#--                 autocomplete="mobilePhoneNumber"-->
<#--                 value="${(register.formData.mobilePhoneNumber!'')}"-->
<#--                 maxlength="100"-->
<#--                 placeholder="${msg("survey_content_mobile-phone-number-placeholder")}"/>-->
<#--        </div>-->
<#--      </div>-->
      <div class="survey_content_input_group">
        <div class="survey_content_input_label">
          <span>${msg("register-content-company")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="company" name="company" type="text"
                 autocomplete="off"
                 maxlength="200"
                 value="${(register.formData.company!'')}"
                 placeholder="${msg("survey_content_company-placeholder")}"/>
        </div>
      </div>
<#--      <div class="survey_content_input_group ">-->
<#--        <div class="survey_content_input_label">-->
<#--          <span>${msg("register-content-referral-code")}</span>-->
<#--        </div>-->
<#--        <div class="survey_content_input_text">-->
<#--            <#if register.formData.referredByCode?? && register.formData.referredByCode?has_content >-->
<#--              <input id="referredByCode" name="referredByCode1" type="text"-->
<#--                     disabled class="survey_content_disabled"-->
<#--                     value="${(register.formData.referredByCode!'')}"/>-->
<#--              <input name="referredByCode" type="hidden"-->
<#--                     value="${(register.formData.referredByCode!'')}"/>-->
<#--            <#else>-->
<#--              <input id="referredByCode" name="referredByCode" type="text"-->
<#--                     autocomplete="off" maxlength="6"-->
<#--                     value="${(register.formData.referredByCode!'')}"/>-->
<#--            </#if>-->
<#--        </div>-->
<#--      </div>-->
      <div id="register-agreement-section" class="register-agreement ">
        <div class="register-agreement-select">
          <div class="register-agreement-checkbox">
            <div id="all-agreement-checkbox"
                 class="all-agreement-checkbox-svg"></div>
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
             class="register-agreement-select-options">
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small">
              <div id="service-agreement-checkbox"
                   class="small-agreement-checkbox-svg"></div>
            </div>
            <input id="serviceAgreement" name="serviceAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.planesg.ai/policy-service', 800, 1000)">
              <span>${msg("register-content-service-agreement")}</span>
            </div>
            <div class="register-agreement-checkbox-small-right">
              <div class="small-agreement-arrow-right-svg"></div>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small">
              <div id="privacy-agreement-checkbox"
                   class="small-agreement-checkbox-svg"></div>
            </div>
            <input id="privacyAgreement" name="privacyAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.planesg.ai/policy-privacy', 800, 1000)">
              <span>${msg("register-content-privacy-agreement")}</span>
            </div>
            <div class="register-agreement-checkbox-small-right">
              <div class="small-agreement-arrow-right-svg"></div>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small">
              <div id="marketing-agreement-checkbox"
                   class="small-agreement-checkbox-svg "></div>
            </div>
            <input id="marketingAgreement" name="marketingAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.planesg.ai/policy-marketing', 800, 1000)">
              <span>${msg("register-content-marketing-agreement")}</span>
            </div>
            <div class="register-agreement-checkbox-small-right">
              <div class="small-agreement-arrow-right-svg"></div>
            </div>
          </div>
        </div>
        <div id="register-validation-accept-agreement"
             class="register-validation-agreement survey_content_hide">
          <span>${msg("survey_validation-require-accept")}</span>
        </div>
      </div>
      <div id="agreement_next_section" class="survey_login_social_links">
          <#if realm.password && social.providers??>
            <div class="survey_login_social_link_group">
                <#list social.providers as p>
                    <#if p.alias == "google">
                      <div class="survey_login_social_link survey_login_social_link_${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')">
                        <div id="g_id_onload"
                             data-client_id="${p.clientId}"
                             data-context="signin"
                             data-ux_mode="redirect"
                                <#--                             data-login_uri="${p.loginUrl}"-->
                             data-callback="login_callback"
                             data-auto_prompt="false">
                        </div>

                        <div class="g_id_signin"
                             data-type="standard"
                             data-size="large"
                             data-theme="outline"
                             data-text="sign_in_with"
                             data-shape="rectangular"
                             data-height="56"
                             data-width="390">
                        </div>
                      </div>
                      <div class="survey_flex_br"></div>
                    </#if>
                </#list>
                <#--                <#list social.providers as p>-->
                <#--                    <#if p.alias == "kakao">-->
                <#--                      <div class="survey_login_social_link survey_login_social_link_${p.alias}"-->
                <#--                           onclick="goToUrl('${p.loginUrl}')">-->
                <#--                        <div-->
                <#--                            class="survey_login_social_link_img survey_login_social_link_${p.alias}-svg">-->
                <#--                        </div>-->
                <#--                        <div class="survey_login_social_link_text">-->
                <#--                          <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                        </div>-->
                <#--                      </div>-->
                <#--                      <div class="survey_flex_br"></div>-->
                <#--                    </#if>-->
                <#--                </#list>-->
                <#--                <#list social.providers as p>-->
                <#--                    <#if p.alias == "naver">-->
                <#--                      <div class="survey_login_social_link survey_login_social_link_${p.alias}"-->
                <#--                           onclick="goToUrl('${p.loginUrl}')">-->
                <#--                        <div-->
                <#--                            class="survey_login_social_link_img survey_login_social_link_${p.alias}-svg">-->
                <#--                        </div>-->
                <#--                        <div class="survey_login_social_link_text">-->
                <#--                          <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                        </div>-->
                <#--                      </div>-->
                <#--                      <div class="survey_flex_br"></div>-->
                <#--                    </#if>-->
                <#--                </#list>-->
                <#--              <#list social.providers as p>-->
                <#--                    <#if p.alias == "facebook">-->
                <#--                      <div class="survey_login_social_link survey_login_social_link_${p.alias}" onclick="goToUrl('${p.loginUrl}')">-->
                <#--                      <div class="survey_login_social_link_img survey_login_social_link_${p.alias}-svg">-->
                <#--                      </div>-->
                <#--                      <div class="survey_login_social_link_text">-->
                <#--                        <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                      </div>-->
                <#--                    </div>-->
                <#--            <div class="survey_flex_br"></div>-->
                <#--                  </#if>-->
                <#--              </#list>-->
            </div>
          </#if>
      </div>
      <div class="survey_content_button_group">
        <div id="register-button" class="survey_button ">
          <span>${msg("register-button")}</span>
        </div>
      </div>
      <div class="survey_content_links">

        <div class="survey_content_link_group margin-top-32">
          <div class="survey_link_description">
            <span>${msg("login-content-forgot-id-or-password-msg")}</span>
          </div>
<#--          <div class="survey_login_forgot_id survey_link_text margin-left-10"-->
<#--               onclick="goToUrl('${url.loginFindEmailUrl}')">-->
<#--            <span>${msg("login-content-forgot-id")}</span>-->
<#--          </div>-->
<#--          <div class="survey_content_or margin-left-10">-->
<#--            <span>|</span>-->
<#--          </div>-->
          <div class="survey_login_forgot_password survey_link_text margin-left-10"
               onclick="goToUrl('${url.loginResetCredentialsUrl}')">
            <span>${msg("login-content-forgot-password")}</span>
          </div>
        </div>
        <div class="survey_content_link_group">
          <div class="survey_link_description">
            <span>${msg("register-login-msg")}</span>
          </div>
          <div class="register-login survey_link_text margin-left-10" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("register-login-link")}</span>
          </div>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
