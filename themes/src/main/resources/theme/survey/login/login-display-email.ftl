<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <div class="survey_content survey_content_display-email">
    <div class="survey_content_title">
        ${msg("display-email-content-title")?no_esc}
    </div>
    <div class="survey_content_subtitle">
        <#if email?? >
            ${email}
        <#else>
            ${msg("id-not-found")}
        </#if>
    </div>
    <div class="survey_divider"></div>
    <div class="survey_content_bottom margin-bottom-20">
      <div class="survey_content_bottom-left">
        <div class="survey_link_text " onclick="goToUrl('${url.loginUrl}')">
          <span>${msg("survey_go-back-to-login-link")}</span>
        </div>
      </div>
      <div class="survey_content_bottom-right">
          <#if email?? >
            <div id="resetPassword" class="survey_button"
                 onclick="goToUrl('${url.loginResetCredentialsUrl}')">
              <span>${msg("reset-password-button")}</span>
            </div>
          </#if>
      </div>
    </div>
  </div>
  </div>
</@layout.registrationLayout>