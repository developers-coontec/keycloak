<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
  <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
    <script>
      function onLoadFunction() {
        console.log('onLoadFunction');
      }

      window.addEventListener('load', onLoadFunction);
    </script>
    <input type="text" id="username" name="username" value="${username}" autocomplete="username"
           readonly="readonly" style="display:none;"/>
    <input type="password" id="password" name="password" autocomplete="current-password"
           style="display:none;"/>
    <div class="survey-content survey-content-update-password">
      <div class="survey-content-title">
          ${msg("update-password-content-title")}
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("update-password-content-new-password")}</span>
          <span
              class="update-password-content-new-password-description">${msg("update-password-content-new-password-description")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="password-new" name="password-new" type="password" autofocus
                 autocomplete="new-password"
                 placeholder="${msg("survey-content-password-placeholder")}"
                 maxlength="100"
                 onchange="validatePassword(this)"/>
          <div id="survey-password-strength-group"
               class="survey-password-strength survey-content-hide">
            <div class="survey-password-strength-text">
              <span>${msg("survey-password-strength-text")} :</span>
            </div>
            <div class="survey-password-strength-value">
              <span id="survey-password-strength-value-span"></span>
            </div>
          </div>
        </div>
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("update-password-content-new-confirm-password")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="password-confirm" name="password-confirm" type="password"
                 autocomplete="new-password"
                 placeholder="${msg("survey-content-confirm-password-placeholder")}"
                 maxlength="100"
                 onchange="validatePassword(this)"/>
        </div>
      </div>
    </div>
    <div class="survey-divider"></div>
    <div class="survey-content-footer margin-bottom-20">
      <div class="survey-content-footer-left">
        <div class="survey-link-text survey-content-footer-login"
             onclick="goToUrl('${url.loginUrl}')">
          <span>${msg("survey-go-back-to-login-link")}</span>
        </div>
      </div>
      <div class="survey-content-footer-right">
        <div class="survey-button" onclick="clickSubmit('kc-passwd-update-form')">
          <span>${msg("update-password-button")}</span>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
