<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <form id="kc-register-form" class="survey-form" action="${url.registrationAction}"
        method="post">
    <script>

      function onLoadFunction() {
        console.log('onLoadFunction');
        isAgreementRequired(false);
      }

      window.addEventListener('load', onLoadFunction);
    </script>
    <div class="survey-content survey-content-register">
      <div class="survey-content-title">
          ${msg("register-content-title")}
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group ">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("register-content-email")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="email" name="email" type="text"
                 autocomplete="email"
                 value="${(register.formData.email!'')}"
                 maxlength="300"
                 placeholder="${msg("survey-content-email-placeholder")}"/>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("register-content-password")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="password" name="password" type="password" autocomplete="new-password"
                 maxlength="100"
                 placeholder="${msg("survey-content-password-placeholder")}"
          />
          <input id="password-confirm" name="password-confirm" type="hidden"/>
          <div id="survey-password-strength-group"
               class="survey-password-strength survey-content-hide">
            <div class="survey-password-strength-text">
              <span>${msg("survey-password-strength-text")} :</span>
            </div>
            <div class="survey-password-strength-value">
              <span id="survey-password-strength-value-span"></span>
            </div>
          </div>
        </div>
        <div class="survey-flex-br"></div>
        <div class="survey-content-input-description">
            <span
                class="register-content-label-password-description">${msg("register-content-password-description")}</span>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group ">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("register-content-name")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="name" name="name" type="text"
                 value="${(register.formData.name!'')}"
                 maxlength="200"
                 placeholder="${msg("survey-content-name-placeholder")}"/>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("register-content-mobile-phone-number")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="mobilePhoneNumber" name="mobilePhoneNumber" type="text"
                 autocomplete="mobilePhoneNumber"
                 value="${(register.formData.mobilePhoneNumber!'')}"
                 maxlength="100"
                 placeholder="${msg("survey-content-mobile-phone-number-placeholder")}"/>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group ">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("register-content-company")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="company" name="company" type="text"
                 autocomplete="off"
                 maxlength="200"
                 value="${(register.formData.company!'')}"
                 placeholder="${msg("survey-content-company-placeholder")}"/>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group ">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("register-content-referral-code")}</span>
        </div>
        <div class="survey-content-input-text">
            <#if register.formData.referredByCode?? && register.formData.referredByCode?has_content >
              <input id="referredByCode" name="referredByCode1" type="text"
                     disabled class="survey-content-disabled"
                     value="${(register.formData.referredByCode!'')}"/>
              <input name="referredByCode" type="hidden"
                     value="${(register.formData.referredByCode!'')}"/>
            <#else>
              <input id="referredByCode" name="referredByCode" type="text"
                     autocomplete="off" maxlength="6"
                     value="${(register.formData.referredByCode!'')}"/>
            </#if>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div id="register-agreement-section" class="register-agreement">
        <div class="register-agreement-select">
          <div class="register-agreement-checkbox"
          >
            <div id="all-agreement-checkbox"
                 class="all-agreement-checkbox-checked-svg survey-content-hide"></div>
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
             class="register-agreement-select-options survey-content-hide">
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="service-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg survey-content-hide"></div>
            </div>
            <input id="serviceAgreement" name="serviceAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.survey.com/service/', 800, 800)">
              <span>${msg("register-content-service-agreement")}</span>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="privacy-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg survey-content-hide"></div>
            </div>
            <input id="privacyAgreement" name="privacyAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.survey.com/privacy/', 800, 800)">
              <span>${msg("register-content-privacy-agreement")}</span>
            </div>
          </div>
          <div class="register-agreement-select-section-row">
            <div class="register-agreement-checkbox-small"
            >
              <div id="marketing-agreement-checkbox"
                   class="small-agreement-checkbox-checked-svg survey-content-hide"></div>
            </div>
            <input id="marketingAgreement" name="marketingAgreement" type="hidden">
            <div class="register-agreement-text-small"
                 onclick="openNewWindows('https://www.survey.com/agreement-marketing/', 800, 800)">
              <span>${msg("register-content-marketing-agreement")}</span>
            </div>
          </div>
        </div>
        <div id="register-validation-accept-agreement"
             class="register-validation-agreement survey-content-hide">
          <span>${msg("survey-validation-require-accept")}</span>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-footer">
        <div class="survey-content-footer-left">
          <div class="register-login-text">
            <span>${msg("register-login-msg")}</span>
          </div>
          <div class="register-login" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("register-login-link")}</span>
          </div>
        </div>
        <div class="survey-content-footer-right">
          <div id="register-button" class="survey-button ">
            <span>${msg("register-button")}</span>
          </div>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-login-social-links">
          <#if realm.password && social.providers??>
            <div class="survey-login-social-link-group">
                <#list social.providers as p>
                    <#if p.alias == "google">
                      <div class="survey-login-social-link survey-login-social-link-${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')">
                        <div
                            class="survey-login-social-link-img survey-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="survey-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                      <div class="survey-flex-br"></div>
                    </#if>
                </#list>
                <#list social.providers as p>
                    <#if p.alias == "kakao">
                      <div class="survey-login-social-link survey-login-social-link-${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')">
                        <div
                            class="survey-login-social-link-img survey-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="survey-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                      <div class="survey-flex-br"></div>
                    </#if>
                </#list>
                <#list social.providers as p>
                    <#if p.alias == "naver">
                      <div class="survey-login-social-link survey-login-social-link-${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')">
                        <div
                            class="survey-login-social-link-img survey-login-social-link-${p.alias}-svg">
                        </div>
                        <div class="survey-login-social-link-text">
                          <span>${msg("login-social-${p.alias}")}</span>
                        </div>
                      </div>
                      <div class="survey-flex-br"></div>
                    </#if>
                </#list>
                <#--              <#list social.providers as p>-->
                <#--                    <#if p.alias == "facebook">-->
                <#--                      <div class="survey-login-social-link survey-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">-->
                <#--                      <div class="survey-login-social-link-img survey-login-social-link-${p.alias}-svg">-->
                <#--                      </div>-->
                <#--                      <div class="survey-login-social-link-text">-->
                <#--                        <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                      </div>-->
                <#--                    </div>-->
                <#--            <div class="survey-flex-br"></div>-->
                <#--                  </#if>-->
                <#--              </#list>-->
            </div>
          </#if>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
