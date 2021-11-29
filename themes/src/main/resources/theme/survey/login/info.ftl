<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="survey_content survey_content_info">
    <div class="survey_content_title">
        ${msg("login-content-title")}
    </div>
    <div class="survey_content_subtitle survey_info-text">
        ${message.summary}
    </div>
    <div class="survey_content_bottom">
        <#if pageRedirectUri??>
          <div class="survey_link_text survey_content_bottom-login" onclick="goToUrl('${pageRedirectUri}')">
            <span>${msg("survey_go-back-to-application-link")}</span>
          </div>
        <#elseif actionUri??>
          <div class="survey_link_text survey_content_bottom-login" onclick="goToUrl('${actionUri}')">
            <span>${msg("survey_proceed-with-action")}</span>
          </div>
        <#elseif client.baseUrl??>
          <div class="survey_link_text survey_content_bottom-login" onclick="goToUrl('${client.baseUrl}')">
            <span>${msg("survey_go-back-to-application-link")}</span>
          </div>
        </#if>
    </div>
  </div>
</@layout.registrationLayout>