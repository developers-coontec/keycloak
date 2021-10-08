<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="survey-content survey-content-info">
    <div class="survey-content-title">
        ${msg("login-content-title")}
    </div>
    <div class="survey-content-subtitle survey-info-text">
        ${message.summary}
    </div>
    <div class="survey-content-footer">
        <#if pageRedirectUri??>
          <div class="survey-link-text survey-content-footer-login" onclick="goToUrl('${pageRedirectUri}')">
            <span>${msg("survey-go-back-to-application-link")}</span>
          </div>
        <#elseif actionUri??>
          <div class="survey-link-text survey-content-footer-login" onclick="goToUrl('${actionUri}')">
            <span>${msg("survey-proceed-with-action")}</span>
          </div>
        <#elseif client.baseUrl??>
          <div class="survey-link-text survey-content-footer-login" onclick="goToUrl('${client.baseUrl}')">
            <span>${msg("survey-go-back-to-application-link")}</span>
          </div>
        </#if>
    </div>
  </div>
</@layout.registrationLayout>