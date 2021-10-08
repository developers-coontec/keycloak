<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <script>
    function isEmailValid(email) {
      var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(String(email).toLowerCase());
    }

    function emailOnChange(value) {
      if (buttonEnabled(value)) {
        document.getElementById('submitDiv').classList.remove("survey-content-disabled");
      } else {
        document.getElementById('submitDiv').classList.add("survey-content-disabled");
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
    <div class="survey-content survey-content-reset-password">
      <div class="survey-content-title">
          ${msg("reset-password-content-title")}
      </div>
      <div class="survey-content-subtitle">
          ${msg("reset-password-content-subtitle")?no_esc}
      </div>
      <div class="survey-divider"></div>
      <div class="survey-content-input-group ">
        <div class="survey-content-input-label margin-left-20">
          <span>${msg("register-content-email")}</span>
        </div>
        <div class="survey-content-input-text">
          <input id="email" name="username" type="text"
                 autocomplete="email"
                 maxlength="300"
                 autofocus onchange="emailOnChange(event.target.value)"
                 placeholder="${msg("survey-content-email-placeholder")}"/>
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
          <div id="submitDiv" class="survey-button survey-content-disabled"
               onclick="validateAndSubmit('kc-reset-password-form')">
            <span>${msg("reset-password-button")}</span>
          </div>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
