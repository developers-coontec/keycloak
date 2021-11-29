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
    <div class="survey_content_links margin-top-20">
        <#if email?? >
          <div class="survey_content_button_group">
            <div id="resetPassword" class="survey_button"
                 onclick="goToUrl('${url.loginResetCredentialsUrl}')">
              <span>${msg("reset-password-button")}</span>
            </div>
          </div>
        </#if>
      <div class="survey_content_link_group margin-top-32">
        <div class="survey_link_text " onclick="goToUrl('${url.loginUrl}')">
          <span>${msg("survey_go-back-to-login-link")}</span>
        </div>
      </div>
    </div>
  </div>
  </div>
</@layout.registrationLayout>