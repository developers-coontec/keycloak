<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <script>
    function isEmailValid(email) {
      var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(String(email).toLowerCase());
    }

    function emailOnChange(value) {
      if (buttonEnabled(value)) {
        document.getElementById('submitDiv').classList.remove("survey_content_disabled");
      } else {
        document.getElementById('submitDiv').classList.add("survey_content_disabled");
      }
    }

    function buttonEnabled(inputEmail) {
      if (inputEmail !== undefined && inputEmail != null && inputEmail.length > 0 && isEmailValid(
          inputEmail)) {
        return true;
      } else {
        return false;
      }
    }

    function validateAndSubmit(formId) {
      var email = document.getElementById('email').value;
      if (buttonEnabled(email)) {
        clickSubmit(formId);
      }
    }
  </script>
  <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
    <div class="survey_content survey_content_reset-password">
      <div class="survey_content_title">
          ${msg("reset-password-content-title")}
      </div>
      <div class="survey_content_subtitle">
          ${msg("reset-password-content-subtitle")?no_esc}
      </div>
      <div class="survey_content_input_group ">
        <div class="survey_content_input_label">
          <span>${msg("register-content-email")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="email" name="username" type="text"
                 autocomplete="email"
                 maxlength="300"
                 onkeyup="enterKeyPressed('submitDiv')"
                 autofocus onchange="emailOnChange(event.target.value)"
                 placeholder="${msg("survey_content_email-placeholder")}"/>
        </div>
      </div>
      <div class="survey_content_links">
        <div class="survey_content_button_group">
          <div id="submitDiv" class="survey_button survey_content_disabled"
               onclick="validateAndSubmit('kc-reset-password-form')">
            <span>${msg("reset-password-button")}</span>
          </div>
        </div>
        <div class="survey_content_link_group ">
          <div class="survey_link_text survey_content_bottom-login"
               onclick="goToUrl('${url.loginUrl}')">
            <span>${msg("survey_go-back-to-login-link")}</span>
          </div>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
