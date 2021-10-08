<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <div class="survey-content survey-content-display-email">
    <div class="survey-content-title">
        ${msg("display-email-content-title")?no_esc}
    </div>
    <div class="survey-content-subtitle">
        <#if email?? >
            ${email}
        <#else>
            ${msg("id-not-found")}
        </#if>
    </div>
    <div class="survey-divider"></div>
    <div class="survey-content-footer margin-bottom-20">
      <div class="survey-content-footer-left">
        <div class="survey-link-text " onclick="goToUrl('${url.loginUrl}')">
          <span>${msg("survey-go-back-to-login-link")}</span>
        </div>
      </div>
      <div class="survey-content-footer-right">
          <#if email?? >
            <div id="resetPassword" class="survey-button"
                 onclick="goToUrl('${url.loginResetCredentialsUrl}')">
              <span>${msg("reset-password-button")}</span>
            </div>
          </#if>
      </div>
    </div>
  </div>
  </div>
</@layout.registrationLayout>