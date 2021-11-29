<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="survey_content survey_content_error">
    <div class="survey_content_title">
        ${msg("login-content-title")}
    </div>
    <div class="survey_content_subtitle survey_error-text">
        ${message.summary?no_esc}
    </div>
    <div class="survey_content_bottom">
        <#if client?? && client.baseUrl?has_content>
          <div class="survey_link_text survey_content_bottom-login" onclick="goToUrl('${client.baseUrl}')">
            <span>${msg("survey_go-back-to-application-link")}</span>
          </div>
        <#else>
          <div class="survey_link_text survey_content_bottom-login" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("survey_go-back-to-login-link")}</span>
          </div>
        </#if>
    </div>
  </div>
</@layout.registrationLayout>