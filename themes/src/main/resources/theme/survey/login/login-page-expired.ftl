<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="survey-content survey-content-expired">
    <div class="survey-content-title">
        ${msg("expired-content-title")}
    </div>
    <div class="survey-divider"></div>
    <div class="survey-content-footer margin-bottom-20">
      <div class="survey-content-footer-left">
        <div class="survey-link-text survey-content-ib-vt"
             onclick="goToUrl('${url.loginRestartFlowUrl}')">
          <span>${msg("pageExpiredMsg1")}</span>
        </div>
      </div>
      <div class="survey-content-footer-right">
        <div class="survey-link-text survey-content-ib-vt margin-left-20"
             onclick="goToUrl('${url.loginAction}')">
          <span>${msg("pageExpiredMsg2")}</span>
        </div>
      </div>
    </div>
  </div>
</@layout.registrationLayout>