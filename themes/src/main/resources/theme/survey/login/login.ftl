<#import "template.ftl" as layout>
<@layout.registrationLayout displayWide=(realm.password && social.providers??); section>
  <form id="kc-form-login" class="survey_form" onsubmit="login.disabled = true; return true;"
        action="${url.loginAction}" method="post">
    <div class="survey_content survey_content_login">
      <div class="survey_content_title">
          ${msg("login-content-title")}
      </div>
      <div class="survey_content_input_group">
        <div class="survey_content_input_label">
          <span>${msg("login-content-label-email")}</span>
        </div>
        <div class="survey_content_input_text">
            <#if usernameEditDisabled??>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}"
                     type="text" disabled
                     maxlength="300"
                     placeholder="${msg("survey_content_email-placeholder")}"/>
            <#else>
              <input tabindex="1" id="username" name="username" value="${(login.username!'')}"
                     type="text" autofocus
                     maxlength="300"
                     onkeyup="enterKeyPressed('login-button')"
                     autocomplete="off" placeholder="${msg("survey_content_email-placeholder")}"/>
            </#if>
        </div>
      </div>
      <div class="survey_content_input_group">
        <div class="survey_content_input_label">
          <span>${msg("login-content-label-password")}</span>
        </div>
        <div class="survey_content_input_text">
          <input tabindex="2" id="password" name="password" type="password" autocomplete="off"
                 maxlength="100"
                 onkeyup="enterKeyPressed('login-button')"
                 placeholder="${msg("survey_content_password-placeholder")}"/>
        </div>
      </div>
      <div class="survey_login_social_links">
          <#if realm.password && social.providers??>
            <div class="survey_login_social_link_group">
                <#list social.providers as p>
                    <#if p.alias == "google">
                      <div class="survey_login_social_link survey_login_social_link_${p.alias}"
                           onclick="goToUrl('${p.loginUrl}')"
                      >
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
                             data-shape="rectangular"
<#--                             data-theme="outline"-->
<#--                             data-theme="filled_blue"-->
                             data-theme="filled_black"
                             data-text="signin_with"
                             data-size="large"
                             data-logo_alignment="left"
                             data-width="360">
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
                <#--                <#list social.providers as p>-->
                <#--                    <#if p.alias == "facebook">-->
                <#--                      <div class="survey_login_social_link survey_login_social_link_${p.alias}" onclick="goToUrl('${p.loginUrl}')">-->
                <#--                        <div class="survey_login_social_link_img survey_login_social_link_${p.alias}-svg">-->
                <#--                        </div>-->
                <#--                        <div class="survey_login_social_link_text">-->
                <#--                          <span>${msg("login-social-${p.alias}")}</span>-->
                <#--                        </div>-->
                <#--                      </div>-->
                <#--              <div class="survey_flex_br"></div>-->
                <#--                    </#if>-->
                <#--                </#list>-->
            </div>
          </#if>
      </div>
      <div class="survey_content_links">
        <div class="survey_content_button_group">
          <div id="login-button" class="survey_button" onclick="clickSubmit('kc-form-login')">
            <span>${msg("login-button")}</span>
          </div>
        </div>
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
            <span>${msg("login-register-msg")}</span>
          </div>
          <div class="survey_login_register survey_link_text margin-left-10"
               onclick="goToUrl('${url.registrationUrl}')">
            <span>${msg("login-register-link")}</span>
          </div>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
