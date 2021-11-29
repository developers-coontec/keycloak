<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <script>
    function inputValueChange(value) {
      var submitElement = document.getElementById('submitDiv');
      // console.log(submitElement);
      // console.log(submitElement.classList);
      if (buttonEnabled()) {
        submitElement.classList.remove("survey_content_disabled");
      } else {
        submitElement.classList.add("survey_content_disabled");
      }
      // console.log(submitElement.classList);
    }

    function buttonEnabled() {
      var nameValue = document.getElementById('name').value;
      var mobilePhoneNumberValue = document.getElementById('mobilePhoneNumber').value;
      // console.log(nameValue, mobilePhoneNumberValue);
      if (nameValue && nameValue.length > 0 &&
          mobilePhoneNumberValue && mobilePhoneNumberValue.length > 0) {
        // console.log('buttonEnabled true');
        return true;
      } else {
        // console.log('buttonEnabled false');
        return false;
      }
    }

    function validateAndSubmit(formId) {
      if (buttonEnabled()) {
        clickSubmit(formId);
      }
    }
  </script>
  <form id="kc-find-email-form" action="${url.loginAction}" method="post">
    <div class="survey_content survey_content_find-email">
      <div class="survey_content_title">
          ${msg("find-email-content-title")?no_esc}
      </div>
      <div class="survey_content_subtitle">
          ${msg("find-email-content-subtitle")?no_esc}
      </div>
      <div class="survey_divider"></div>
      <div class="survey_content_input_group">
        <div class="survey_content_input_label margin-left-20">
          <span>${msg("find-email-content-name")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="name" name="name" type="text"
                 autocomplete="name"
                 maxlength="300"
                 autofocus onchange="inputValueChange(event.target.value)"
                 value="${(name!'')}"
                 placeholder="${msg("survey_content_name-placeholder")}"/>
        </div>
      </div>
      <div class="survey_divider"></div>
      <div class="survey_content_input_group">
        <div class="survey_content_input_label margin-left-20">
          <span>${msg("find-email-content-mobile-phone-number")}</span>
        </div>
        <div class="survey_content_input_text">
          <input id="mobilePhoneNumber" name="mobilePhoneNumber" type="text"
                 autocomplete="mobilePhoneNumber"
                 maxlength="100"
                 onchange="inputValueChange(event.target.value)"
                 value="${(mobilePhoneNumber!'')}"
                 placeholder="${msg("survey_content_mobile-phone-number-placeholder")}"/>
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
          <div id="submitDiv" class="survey_button survey_content_disabled"
               onclick="validateAndSubmit('kc-find-email-form')">
            <span>${msg("find-email-button")}</span>
          </div>
        </div>
      </div>
    </div>
  </form>
</@layout.registrationLayout>
