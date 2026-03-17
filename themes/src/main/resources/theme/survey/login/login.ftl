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
      <div class="survey_content_button_group">
        <div id="login-button" class="survey_button" onclick="clickSubmit('kc-form-login')">
          <span>${msg("login-button")}</span>
        </div>
      </div>

      <div class="survey_content_links">
          <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div class="survey_content_locale">
              <div id="kc-locale-wrapper">
                <div id="kc-locale-dropdown">
                  <a href="#" id="kc-current-locale-link">${locale.current}</a>
                  <ul>
                      <#list locale.supported as l>
                        <li>
                          <a href="${l.url}">${l.label}</a>
                        </li>
                      </#list>
                  </ul>
                </div>
              </div>
            </div>
          </#if>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
