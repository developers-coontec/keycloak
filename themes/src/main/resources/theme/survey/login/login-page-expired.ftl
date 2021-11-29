<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="survey_content survey_content_expired">
    <div class="survey_content_title">
        ${msg("expired-content-title")}
    </div>
    <div class="survey_divider"></div>
    <div class="survey_content_bottom margin-bottom-20">
      <div class="survey_content_bottom-left">
        <div class="survey_link_text survey_content_ib-vt"
             onclick="goToUrl('${url.loginRestartFlowUrl}')">
          <span>${msg("pageExpiredMsg1")}</span>
        </div>
      </div>
      <div class="survey_content_bottom-right">
        <div class="survey_link_text survey_content_ib-vt margin-left-20"
             onclick="goToUrl('${url.loginAction}')">
          <span>${msg("pageExpiredMsg2")}</span>
        </div>
      </div>
    </div>
  </div>
</@layout.registrationLayout>