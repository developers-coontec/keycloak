<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
  <div class="survey_content survey_content_verify-email">
    <div class="survey_content_title">
      <span>${msg("verify-email-content-title")}</span>
    </div>
    <div class="survey_content_subtitle">
        ${msg("verify-email-content-subtitle", '${email}')?no_esc}
    </div>
      <#--    <div class="survey_content_email-address">-->
      <#--      <span>${Session["authenticatedUser"]["email"]}</span>-->
      <#--      <span>${account.email}</span>-->
      <#--    </div>-->
    <div class="survey_content_links ">
      <div class="survey_content_button_group">
        <div id="verify-email-button" class="survey_button"
             onclick="goToUrl('${url.loginAction}')">
          <span>${msg("verify-email-link")}</span>
        </div>
      </div>
    </div>
  </div>
</@layout.registrationLayout>