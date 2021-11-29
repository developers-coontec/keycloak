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
    <div class="survey_content survey_content_update-password">
      <div class="survey_content_title">
          ${msg("update-password-content-title")}
      </div>
      <div class="survey_divider"></div>
      <div class="survey_content_input_group">
        <div class="survey_content_input_label margin-left-20">
          <span>${msg("update-password-content-new-password")}</span>
          <span
              class="update-password-content-new-password-description">${msg("update-password-content-new-password-description")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="password-new" name="password-new" type="password" autofocus
                 autocomplete="new-password"
                 placeholder="${msg("survey_content_password-placeholder")}"
                 maxlength="100"
                 onchange="validatePassword(this)"/>
          <div id="survey_password-strength-group"
               class="survey_password-strength survey_content_hide">
            <div class="survey_password-strength-text">
              <span>${msg("survey_password-strength-text")} :</span>
            </div>
            <div class="survey_password-strength-value">
              <span id="survey_password-strength-value-span"></span>
            </div>
          </div>
        </div>
      </div>
      <div class="survey_divider"></div>
      <div class="survey_content_input_group">
        <div class="survey_content_input_label margin-left-20">
          <span>${msg("update-password-content-new-confirm-password")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="password-confirm" name="password-confirm" type="password"
                 autocomplete="new-password"
                 placeholder="${msg("survey_content_confirm-password-placeholder")}"
                 maxlength="100"
                 onchange="validatePassword(this)"/>
        </div>
      </div>
    </div>
    <div class="survey_divider"></div>
    <div class="survey_content_bottom margin-bottom-20">
      <div class="survey_content_bottom-left">
        <div class="survey_link_text survey_content_bottom-login"
             onclick="goToUrl('${url.loginUrl}')">
          <span>${msg("survey_go-back-to-login-link")}</span>
        </div>
      </div>
      <div class="survey_content_bottom-right">
        <div class="survey_button" onclick="clickSubmit('kc-passwd-update-form')">
          <span>${msg("update-password-button")}</span>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
