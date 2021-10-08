<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
  <div class="survey-content survey-content-verify-email">
    <div class="survey-content-title">
      <span>${msg("verify-email-content-title")}</span>
    </div>
    <div class="survey-content-subtitle">
        ${msg("verify-email-content-subtitle", '${email}')?no_esc}
    </div>
      <#--    <div class="survey-content-email-address">-->
      <#--      <span>${Session["authenticatedUser"]["email"]}</span>-->
      <#--      <span>${account.email}</span>-->
      <#--    </div>-->
    <div class="survey-divider"></div>
    <div class="survey-content-footer margin-bottom-20">
      <div class="survey-content-footer-left">
      </div>
      <div class="survey-content-footer-right">
        <div id="verify-email-button" class="survey-button"
             onclick="goToUrl('${url.loginAction}')">
          <span>${msg("verify-email-link")}</span>
        </div>
      </div>
    </div>
  </div>
</@layout.registrationLayout>