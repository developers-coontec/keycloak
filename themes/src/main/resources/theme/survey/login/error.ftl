<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="survey-content survey-content-error">
    <div class="survey-content-title">
        ${msg("login-content-title")}
    </div>
    <div class="survey-content-subtitle survey-error-text">
        ${message.summary?no_esc}
    </div>
    <div class="survey-content-footer">
        <#if client?? && client.baseUrl?has_content>
          <div class="survey-link-text survey-content-footer-login" onclick="goToUrl('${client.baseUrl}')">
            <span>${msg("survey-go-back-to-application-link")}</span>
          </div>
        <#else>
          <div class="survey-link-text survey-content-footer-login" onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("survey-go-back-to-login-link")}</span>
          </div>
        </#if>
    </div>
  </div>
</@layout.registrationLayout>