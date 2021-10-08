<#import "template.ftl" as layout>
<@layout.registrationLayout displayWide=(realm.password && social.providers??); section>
  <form id="kc-form-login" class="survey-form" onsubmit="login.disabled = true; return true;"
        action="${url.loginAction}" method="post">
    <div class="survey-content survey-content-login">
      <div class="survey-content-title">
          ${msg("login-content-title")}
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("login-content-label-email")}</span>
        </div>
        <div class="survey-content-input-text">
            <#if usernameEditDisabled??>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}"
                     type="text" disabled
                     maxlength="300"
                     placeholder="${msg("survey-content-email-placeholder")}"/>
            <#else>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}"
                     type="text" autofocus
                     maxlength="300"
                     autocomplete="off" placeholder="${msg("survey-content-email-placeholder")}"/>
            </#if>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("login-content-label-password")}</span>
        </div>
        <div class="survey-content-input-text">
          <input tabindex="2" id="password" name="password" type="password" autocomplete="off"
                 maxlength="100"
                 placeholder="${msg("survey-content-password-placeholder")}"/>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-footer">
        <div class="survey-content-footer-left">
          <div class="survey-login-forgot-id survey-link-text"
               onclick="goToUrl('${url.loginFindEmailUrl}')">
            <span>${msg("login-content-forgot-id")}</span>
          </div>
          <div class="survey-login-forgot-password survey-link-text margin-left-20"
               onclick="goToUrl('${url.loginResetCredentialsUrl}')">
            <span>${msg("login-content-forgot-password")}</span>
          </div>
          <div class="survey-login-register survey-link-text margin-left-20"
               onclick="goToUrl('${url.registrationUrl}')">
            <span>${msg("login-register-link")}</span>
          </div>
        </div>
        <div class="survey-content-footer-right">
          <div class="survey-button" onclick="clickSubmit('kc-form-login')">
            <span>${msg("login-button")}</span>
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
                <#--                <#list social.providers as p>-->
                <#--                    <#if p.alias == "facebook">-->
                <#--                      <div class="survey-login-social-link survey-login-social-link-${p.alias}" onclick="goToUrl('${p.loginUrl}')">-->
                <#--                        <div class="survey-login-social-link-img survey-login-social-link-${p.alias}-svg">-->
                <#--                        </div>-->
                <#--                        <div class="survey-login-social-link-text">-->
                <#--                          <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                        </div>-->
                <#--                      </div>-->
                <#--              <div class="survey-flex-br"></div>-->
                <#--                    </#if>-->
                <#--                </#list>-->
            </div>
          </#if>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
