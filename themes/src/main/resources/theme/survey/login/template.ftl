<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>PlanESG Auth</title>
    <meta name="description" content="Description for PlanESG Authentication"/>
    <meta name="google" content="notranslate"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="theme-color" content="#000000"/>
    <meta property="og:title" content="PlanESG">
    <!--  <meta property="og:image" content="https://esgapp.planesg.ai/content/images/esg_ad.png">-->
    <!--  <meta property="og:image:width" content="700">-->
    <!--  <meta property="og:image:height" content="350">-->
    <meta property="og:url" content="https://dataapp.planesg.ai">
    <meta property="og:site_name" content="PlanESG">
    <meta property="og:type" content="website">

    <meta name="robots" content="noindex, nofollow">

      <#if properties.meta?has_content>
          <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
          </#list>
      </#if>
    <title>${msg("auth-page.title")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico"/>
      <#if properties.styles?has_content>
          <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
          </#list>
      </#if>
      <#if properties.scripts?has_content>
          <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
          </#list>
      </#if>
      <#if scripts??>
          <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
          </#list>
      </#if>
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Google buttons -->
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <!-- Google tag (gtag.js) -->
    <script>
      console.log('window.location.host:' + window.location.host, navigator.userAgent);

      var tagId = null;
      if (window.location.host === "dataapp.planesg.ai" ||
          window.location.host === "esgapp.planesg.ai" ||
          window.location.host === "companyapp.planesg.ai" ||
          window.location.host === "auth.planesg.ai") {
        tagId = "G-WQ4NK8X6B8";
      } else if (window.location.host === "datademo.planesg.ai" ||
          window.location.host === "esgdemo.planesg.ai" ||
          window.location.host === "companydemo.planesg.ai" ||
          window.location.host === "authdemo.planesg.ai") {
        tagId = "G-PCYV8WVNSN";
      } else if (window.location.host === "datatest.planesg.ai" ||
          window.location.host === "esgtest.planesg.ai" ||
          window.location.host === "companytest.planesg.ai" ||
          window.location.host === "authtest.planesg.ai") {
        tagId = "G-16X9E3XHKZ";
      } else if (window.location.host === "surveyapp.meback.ai" ||
          window.location.host === "auth.meback.ai") {
        tagId = "G-XSMKR926KY";
      } else if (window.location.host === "surveytest.meback.ai" ||
          window.location.host === "authtest.meback.ai") {
        tagId = "G-KNG4052WD6";
      }

      if (tagId !== undefined && tagId !== null) {
        var newScript = document.createElement("script");
        newScript.type = "text/javascript";
        newScript.setAttribute("async", "true");
        newScript.setAttribute("src", "https://www.googletagmanager.com/gtag/js?id=" + tagId);
        document.documentElement.firstChild.appendChild(newScript);
        window.dataLayer = window.dataLayer || [];

        function gtag() {
          dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', tagId);
      }

      if (window.location.host === "dataapp.planesg.ai" ||
          window.location.host === "esgapp.planesg.ai" ||
          window.location.host === "companyapp.planesg.ai" ||
          window.location.host === "auth.planesg.ai") {
        (function (h, o, t, j, a, r) {
          h.hj = h.hj || function () {
            (h.hj.q = h.hj.q || []).push(arguments)
          };
          h._hjSettings = {hjid: 3379839, hjsv: 6};
          a = o.getElementsByTagName('head')[0];
          r = o.createElement('script');
          r.async = 1;
          r.src = t + h._hjSettings.hjid + j + h._hjSettings.hjsv;
          a.appendChild(r);
        })(window, document, 'https://static.hotjar.com/c/hotjar-', '.js?sv=');
      }
    </script>

    <script>
      function clickSubmit(formId) {
        document.getElementById(formId).submit();
        return false;
      }

      function getSurveyHomeUrl() {
        var url = window.location.href;
        console.log(url);
        if (url.includes("esgtest.planesg.ai")) {
          return "https://esgtest.planesg.ai";
        } else if (url.includes("datatest.planesg.ai")) {
          return "https://datatest.planesg.ai";
        } else if (url.includes("companytest.planesg.ai")) {
          return "https://companytest.planesg.ai";
        } else if (url.includes("esgdemo.planesg.ai")) {
            return "https://esgdemo.planesg.ai";
        } else if (url.includes("datademo.planesg.ai")) {
            return "https://datademo.planesg.ai";
        } else if (url.includes("companydemo.planesg.ai")) {
            return "https://companydemo.planesg.ai";
        } else if (url.includes("esgapp.planesg.ai")) {
          return "https://esgapp.planesg.ai";
        } else if (url.includes("dataapp.planesg.ai")) {
          return "https://dataapp.planesg.ai";
        } else if (url.includes("companyapp.planesg.ai")) {
          return "https://companyapp.planesg.ai";
        } else if (url.includes("authtest.planesg.ai")) {
          return "https://datatest.planesg.ai";
        } else if (url.includes("authdemo.planesg.ai")) {
          return "https://datademo.planesg.ai";
        } else if (url.includes("auth.planesg.ai")) {
          return "https://dataapp.planesg.ai";
        } else {
          return "http://localhost:8080";
        }
      }

      function goToUrl(url) {
        // console.log(url);
        if (url.includes("/auth/realms/survey/account") ||
            url.includes("/auth/?client_id=web_app") ||
            url.includes("/auth/realms/survey/login-actions/authenticate?client_id=web_app")
        ) {
          url = getSurveyHomeUrl();
          // console.log('modified url:' + url);
        }
        window.location.href = url;
        return false;
      }

      function displayAlert(message) {
        alert(message);
      }

      const REGEX_NUMBER = /[0-9]/;
      const REGEX_LOWER_CASE_ALPHABET = /[a-z]/;
      const REGEX_UPPER_CASE_ALPHABET = /[A-Z]/;
      const REGEX_SPECIAL_CHARACTER = /[~!@#$%^&*()_+|<>?:{}]/;
      const PASSWORD_STRENGTH_LEVEL_WEAK = 0;
      const PASSWORD_STRENGTH_LEVEL_NORMAL = 1;
      const PASSWORD_STRENGTH_LEVEL_STRONG = 2;

      const REGEX_EMAIL = /^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$/;
      const REGEX_PHONE_NUMBER = /^01(?:[016789])-?(\d{3}|\d{4})-?\d{4}$/;
      const REGEX_NAME = /^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/;
      const REGEX_NOT_BLANK = /^\S+/;

      function isValueTrue(inputValue) {
        if (inputValue !== undefined && inputValue !== null &&
            (inputValue === true || inputValue === "true")) {
          return true;
        } else {
          return false;
        }
      }

      function enterKeyPressed(clickElementId) {
        console.log('enterKeyPressed begin', clickElementId)
        if (window.event.keyCode == 13) {
          console.log('enterKeyPressed pressed', clickElementId)
          document.getElementById(clickElementId).click();
        }
      }

      function displayAgreementRequiredErrorMessage() {
        // console.log('displayAgreementRequiredErrorMessage');
        // document.getElementById('register-validation-accept-agreement').classList.remove("survey_content_hide");
        document.getElementById('register-validation-accept-agreement').classList.remove(
            "survey_content_hide");
        // document.getElementById('register-button').classList.add("survey_content_disabled");
      }

      function hideAgreementRequiredErrorMessage() {
        // console.log('hideAgreementRequiredErrorMessage');
        document.getElementById('register-validation-accept-agreement').classList.add(
            "survey_content_hide");
        // document.getElementById('register-button').classList.remove("survey_content_disabled");
      }

      function getElementValueById(elementId) {
        var localElement = document.getElementById(elementId);
        if (localElement) {
          return localElement.value;
        } else {
          return null;
        }
      }

      function isAgreementRequired(updateAllAgreement, inputValidateAllFields) {
        var localAllAgreement = getElementValueById('allAgreement');
        var localServiceAgreement = getElementValueById('serviceAgreement');
        var localPrivacyAgreement = getElementValueById('privacyAgreement');
        var localMarketingAgreement = getElementValueById('marketingAgreement');

        // console.log('isAgreementRequired', updateAllAgreement, inputValidateAllFields,
        //     localAllAgreement, localServiceAgreement, localPrivacyAgreement,
        //     localMarketingAgreement);
        if (updateAllAgreement === true) {
          if (isValueTrue(localServiceAgreement) &&
              isValueTrue(localPrivacyAgreement) &&
              isValueTrue(localMarketingAgreement)) {
            allAgreementChecked();
          } else {
            allAgreementUnchecked();
          }
        }
        // if (isValueTrue(localServiceAgreement) && isValueTrue(localPrivacyAgreement)) {
          // document.getElementById('register-agreement-section').classList.remove("survey_error");
          // document.getElementById('register-agreement-option-section').classList.remove(
          //     "survey_error");
          // hideAgreementRequiredErrorMessage();
        // } else {
          // document.getElementById('register-agreement-section').classList.add("survey_error");
          // document.getElementById('register-agreement-option-section').classList.add(
          //     "survey_error");
          // displayAgreementRequiredErrorMessage();
        // }
      }

      function validatePassword(inputElement) {
        if (!inputElement) {
          return 0;
        }
        var inputPassword = inputElement.value;
        // console.log('validatePassword:' + inputPassword);
        var numberExists = false;
        var lowerCaseAlphabetExists = false;
        var upperCaseAlphabetExists = false;
        var specialCharacterExists = false;
        var lengthGreaterThanSeven = false;
        var validCount = 0;
        if (inputPassword) {
          if (REGEX_NUMBER.test(inputPassword) === true) {
            numberExists = true;
            validCount++;
          }
          if (REGEX_LOWER_CASE_ALPHABET.test(inputPassword) === true) {
            lowerCaseAlphabetExists = true;
            validCount++;
          }
          if (REGEX_UPPER_CASE_ALPHABET.test(inputPassword) === true) {
            upperCaseAlphabetExists = true;
            validCount++;
          }
          if (REGEX_SPECIAL_CHARACTER.test(inputPassword) === true) {
            specialCharacterExists = true;
            validCount++;
          }
          if (inputPassword.length >= 8 && inputPassword.length <= 12) {
            lengthGreaterThanSeven = true;
          } else {
            validCount = 0;
          }
        }
        // console.log('validatePassword:' + inputPassword, validCount, numberExists,
        //     lowerCaseAlphabetExists, upperCaseAlphabetExists, specialCharacterExists,
        //     lengthGreaterThanSeven);

        var passwordStrengthGroupElement = document.getElementById(
            'survey_password-strength-group');
        if (passwordStrengthGroupElement) {
          if (!inputPassword || inputPassword.length < 1) {
            passwordStrengthGroupElement.classList.add("survey_content_hide");
          } else {
            passwordStrengthGroupElement.classList.remove("survey_content_hide");
          }
        }
        var spanElement = document.getElementById('survey_password-strength-value-span');
        if (spanElement) {
          if (validCount >= 3 && lengthGreaterThanSeven === true) {
            spanElement.classList.remove("survey_content_weak");
            spanElement.classList.remove("survey_content_normal");
            spanElement.classList.remove("survey_content_strong");
            spanElement.classList.add("survey_content_strong");
            spanElement.innerHTML = "${msg("survey_password-strength-strong")}";
          } else if (validCount === 2 && lengthGreaterThanSeven === true) {
            spanElement.classList.remove("survey_content_weak");
            spanElement.classList.remove("survey_content_normal");
            spanElement.classList.remove("survey_content_strong");
            spanElement.classList.add("survey_content_normal");
            spanElement.innerHTML = "${msg("survey_password-strength-normal")}";
          } else {
            spanElement.classList.remove("survey_content_weak");
            spanElement.classList.remove("survey_content_normal");
            spanElement.classList.remove("survey_content_strong");
            spanElement.classList.add("survey_content_weak");
            spanElement.innerHTML = "${msg("survey_password-strength-weak")}";
          }
        }
        return validCount;
      }

      function allAgreementChecked() {
        // console.log('allAgreementChecked');
        document.getElementById('allAgreement').value = true;
        document.getElementById('all-agreement-checkbox').classList.remove("all-agreement-checkbox-svg");
        document.getElementById('all-agreement-checkbox').classList.add("all-agreement-checkbox-checked-svg");
      }

      function allAgreementUnchecked() {
        // console.log('allAgreementUnchecked');
        document.getElementById('allAgreement').value = false;
        document.getElementById('all-agreement-checkbox').classList.remove("all-agreement-checkbox-checked-svg");
        document.getElementById('all-agreement-checkbox').classList.add("all-agreement-checkbox-svg");
      }

      function onAllAgreementClick(inputValue) {
        var checkedValue = document.getElementById('allAgreement').value;
        // console.log('onAllAgreementClick', checkedValue, inputValue);
        if (inputValue) {
          checkedValue = !inputValue;
        }
        if (isValueTrue(checkedValue)) {
          allAgreementUnchecked();
          onServiceAgreementClick(false, false, false);
          onPrivacyAgreementClick(false, false, false);
          onMarketingAgreementClick(false, false, false);
        } else {
          allAgreementChecked();
          onServiceAgreementClick(true, false, false);
          onPrivacyAgreementClick(true, false, false);
          onMarketingAgreementClick(true, false, false);
        }
        // console.log(document.getElementById('all-agreement-checkbox'));
        isAgreementRequired(false, true);
      }

      function onAllAgreementDropdownClick() {
        var checkedValue = document.getElementById('all-agreement-dropdown').value;
        // console.log('onAllAgreementDropdownClick', checkedValue);
        if (isValueTrue(checkedValue)) {
          document.getElementById('all-agreement-dropdown').value = false;
          document.getElementById('div-all-agreement-dropdown').classList.remove(
              "dropdown-clicked");
          document.getElementById('div-all-agreement-dropdown').classList.add("dropdown-default");
          document.getElementById('register-agreement-option-section').classList.add(
              "survey_content_hide");
          // document.getElementById('agreement_next_section').classList.remove("margin-top-155");
        } else {
          document.getElementById('all-agreement-dropdown').value = true;
          document.getElementById('div-all-agreement-dropdown').classList.remove(
              "dropdown-default");
          document.getElementById('div-all-agreement-dropdown').classList.add("dropdown-clicked");
          document.getElementById('register-agreement-option-section').classList.remove(
              "survey_content_hide");
          // document.getElementById('agreement_next_section').classList.add("margin-top-155");
        }
        // console.log(document.getElementById('all-agreement-dropdown'));
      }

      function onServiceAgreementClick(inputValue, updateAllAgreement, inputValidateAllFields) {
        var checkedValue = document.getElementById('serviceAgreement').value;
        // console.log('onServiceAgreementClick', checkedValue, inputValue, updateAllAgreement,
        //     inputValidateAllFields);
        if (inputValue) {
          checkedValue = !inputValue;
        }
        if (isValueTrue(checkedValue)) {
          document.getElementById('serviceAgreement').value = false;
          document.getElementById('service-agreement-checkbox').classList.remove(
              "small-agreement-checkbox-checked-svg");
          document.getElementById('service-agreement-checkbox').classList.add(
              "small-agreement-checkbox-svg");
        } else {
          document.getElementById('serviceAgreement').value = true;
          document.getElementById('service-agreement-checkbox').classList.remove(
              "small-agreement-checkbox-svg");
          document.getElementById('service-agreement-checkbox').classList.add(
              "small-agreement-checkbox-checked-svg");
        }
        // console.log(document.getElementById('service-agreement-checkbox'));
        isAgreementRequired(updateAllAgreement, inputValidateAllFields);
      }

      function onPrivacyAgreementClick(inputValue, updateAllAgreement, inputValidateAllFields) {
        var checkedValue = document.getElementById('privacyAgreement').value;
        // console.log('onPrivacyAgreementClick', checkedValue, inputValue, updateAllAgreement,
        //     inputValidateAllFields);
        if (inputValue) {
          checkedValue = !inputValue;
        }
        if (isValueTrue(checkedValue)) {
          document.getElementById('privacyAgreement').value = false;
          document.getElementById('privacy-agreement-checkbox').classList.remove(
              "small-agreement-checkbox-checked-svg");
          document.getElementById('privacy-agreement-checkbox').classList.add(
              "small-agreement-checkbox-svg");
        } else {
          document.getElementById('privacyAgreement').value = true;
          document.getElementById('privacy-agreement-checkbox').classList.remove(
              "small-agreement-checkbox-svg");
          document.getElementById('privacy-agreement-checkbox').classList.add(
              "small-agreement-checkbox-checked-svg");
        }
        // console.log(document.getElementById('privacy-agreement-checkbox'));
        isAgreementRequired(updateAllAgreement, inputValidateAllFields);
      }

      function onMarketingAgreementClick(inputValue, updateAllAgreement, inputValidateAllFields) {
        var checkedValue = document.getElementById('marketingAgreement').value;
        // console.log('onMarketingAgreementClick', checkedValue, inputValue, updateAllAgreement,
        //     inputValidateAllFields);
        if (inputValue) {
          checkedValue = !inputValue;
        }
        if (isValueTrue(checkedValue)) {
          document.getElementById('marketingAgreement').value = false;
          document.getElementById('marketing-agreement-checkbox').classList.remove(
              "small-agreement-checkbox-checked-svg");
          document.getElementById('marketing-agreement-checkbox').classList.add(
              "small-agreement-checkbox-svg");
        } else {
          document.getElementById('marketingAgreement').value = true;
          document.getElementById('marketing-agreement-checkbox').classList.remove(
              "small-agreement-checkbox-svg");
          document.getElementById('marketing-agreement-checkbox').classList.add(
              "small-agreement-checkbox-checked-svg");
        }
        // console.log(document.getElementById('marketing-agreement-checkbox'));
        isAgreementRequired(updateAllAgreement, inputValidateAllFields);
      }

      function openNewWindows(newUrl, height, width) {
        var features = 'height=' + height + ',width=' + width;
        window.open(newUrl, '_blank', features);
      }

      function createErrorElement(text) {
        const errorDiv = document.createElement('div');
        const span = document.createElement('span');
        span.textContent = text;
        errorDiv.className = 'survey_error-text';
        errorDiv.append(span);
        return errorDiv;
      }

      $(document).ready(function () {
        const emailErrorSpan = createErrorElement('이메일 주소가 유효하지 않습니다.');
        const nameErrorSpan = createErrorElement('이름은 표준 한글 또는 영문만 입력가능합니다.');
        const phoneNumberErrorSpan = createErrorElement('휴대폰 번호가 유효하지 않습니다.');
        const companyErrorSpan = createErrorElement('첫 단어에 공백이 포함될 수 없습니다.');
        const refCodeErrorSpan = createErrorElement('첫 단어에 공백이 포함될 수 없습니다.');
        let isValid1 = false;
        if ($('#email')[0]) {
          isValid1 = REGEX_EMAIL.test($('#email')[0].value);  // email
        }
        let isValid2 = false;
        if ($('#password')[0]) {
          isValid2 = !!$('#password')[0].value; // pwd
        }
        let isValid3 = false;
        if ($('#name')[0]) {
          isValid3 = REGEX_NAME.test($('#name')[0].value); // name
        }
        // let isValid4 = false;
        // if ($('#mobilePhoneNumber')[0]) {
        //   isValid4 = REGEX_PHONE_NUMBER.test($('#mobilePhoneNumber')[0].value); // phone
        // }
        let isValid4 = true;
        let isValid5 = true;  // company
        let isValid6 = true;  // ref Code
        let isValid7 = false; // service
        let isValid8 = false; // privacy
        let isValid9 = false;  // marketing

        function checkValid() {
          const registerButton = $('#register-button')[0];
          // console.log('registerButton checkValid', isValid1, isValid2, isValid3, isValid4, isValid5,
          //     isValid6, isValid7, isValid8, isValid9);
          if (isValid1 && isValid2 && isValid3 && isValid4 && isValid5 && isValid5 && isValid6
              && isValid7 && isValid8 && isValid9) {
            registerButton?.classList.remove('survey_content_disabled');

            // console.error(isValid1, isValid2, isValid3, isValid4, isValid5, isValid5, isValid6
            //     , isValid7, isValid8, isValid9);
            return true;
          } else {
            registerButton?.classList.add('survey_content_disabled');
            // console.warn(isValid1, isValid2, isValid3, isValid4, isValid5, isValid5, isValid6
            //     , isValid7, isValid8, isValid9);
            return false;
          }
        }

        function registerSubmit(formId) {
          if (!checkValid()) {
            console.log('registerSubmit error exists');
            return false;
          }
          var passwordConfirmElement = document.getElementById('password-confirm');
          if (passwordConfirmElement) {
            passwordConfirmElement.value = document.getElementById('password').value;
          }
          clickSubmit(formId);
        }

        checkValid();

        $('#register-button').on('click', this, function (event) {
          if (isValid1 && isValid2 && isValid3 && isValid4 && isValid5 && isValid5 && isValid6
              && isValid7 && isValid8 && isValid9) {
            var updateProfileForm = document.getElementById('kc-update-profile-form');
            if (updateProfileForm) {
              registerSubmit('kc-update-profile-form');
            } else {
              registerSubmit('kc-register-form');
            }
          }
        });

        $("#email").keyup(function () {
          const inputElement = $('#email')[0];
          const inputValue = inputElement.value;
          if (REGEX_EMAIL.test(inputValue) || inputValue === undefined || inputValue === null
              || inputValue.length === 0) {
            inputElement.className = '';
            if (inputElement.nextElementSibling !== null) {
              inputElement.parentNode.removeChild(emailErrorSpan);
            }
            isValid1 = REGEX_EMAIL.test(inputValue);
          } else {
            inputElement.className = 'survey_error';
            if (inputElement.nextElementSibling === null) {
              inputElement.parentNode.appendChild(emailErrorSpan);
            }
            isValid1 = false;
          }
          checkValid();
        });

        $("#naverId").keyup(function () {
          const inputElement = $('#naverId')[0];
          const inputValue = inputElement.value + '@naver.com';
          if (REGEX_EMAIL.test(inputValue) || inputValue === undefined || inputValue === null
              || inputValue.length === 0) {
            inputElement.className = '';
            if (inputElement.nextElementSibling !== null) {
              inputElement.parentNode.removeChild(emailErrorSpan);
            }
            isValid1 = REGEX_EMAIL.test(inputValue);
            if (isValid1) {
              const inputElement = $('#email')[0];
              inputElement.value = inputValue;
            }
          } else {
            inputElement.className = 'survey_error';
            if (inputElement.nextElementSibling === null) {
              inputElement.parentNode.appendChild(emailErrorSpan);
            }
            isValid1 = false;
          }
          checkValid();
        });

        $("#password").keyup(function () {
          const inputElement = $('#password')[0];
          const inputValue = inputElement.value;
          if (validatePassword(inputElement) >= 3 || inputValue === undefined || inputValue
              === null
              || inputValue.length === 0) {
            inputElement.className = '';
            if (inputElement.nextElementSibling !== null) {
            }
            isValid2 = validatePassword(inputElement) >= 3;
          } else {
            inputElement.className = 'survey_error';
            if (inputElement.nextElementSibling === null) {
            }
            isValid2 = false;
          }
          checkValid();
        });

        $("#name").keyup(function () {
          const inputElement = $('#name')[0];
          const inputValue = inputElement.value;
          if (REGEX_NAME.test(inputValue) || inputValue === undefined || inputValue === null
              || inputValue.length === 0) {
            inputElement.className = '';
            if (inputElement.nextElementSibling !== null) {
              inputElement.parentNode.removeChild(nameErrorSpan);
            }
            isValid3 = REGEX_NAME.test(inputValue);
          } else {
            inputElement.className = 'survey_error';
            if (inputElement.nextElementSibling === null) {
              inputElement.parentNode.appendChild(nameErrorSpan);
            }
            isValid3 = false;
          }
          checkValid();
        });

        $("#mobilePhoneNumber").keyup(function () {
          const inputElement = $('#mobilePhoneNumber')[0];
          const inputValue = inputElement.value;
          if (REGEX_PHONE_NUMBER.test(inputValue) || inputValue === undefined || inputValue === null
              || inputValue.length === 0) {
            inputElement.className = '';
            if (inputElement.nextElementSibling !== null) {
              inputElement.parentNode.removeChild(phoneNumberErrorSpan);
            }
            isValid4 = REGEX_PHONE_NUMBER.test(inputValue);
          } else {
            inputElement.className = 'survey_error';
            if (inputElement.nextElementSibling === null) {
              inputElement.parentNode.appendChild(phoneNumberErrorSpan);
            }
            isValid4 = false;
          }
          checkValid();
        });

        $("#company").keyup(function () {
          const inputElement = $('#company')[0];
          const inputValue = inputElement.value;
          if (REGEX_NOT_BLANK.test(inputValue) || inputValue === undefined || inputValue === null
              || inputValue.length === 0) {
            inputElement.className = '';
            if (inputElement.nextElementSibling !== null) {
              inputElement.parentNode.removeChild(companyErrorSpan);
            }
            isValid5 = true
          } else {
            inputElement.className = 'survey_error';
            if (inputElement.nextElementSibling === null) {
              inputElement.parentNode.appendChild(companyErrorSpan);
            }
            isValid5 = false;
          }
          checkValid();
        });

        $("#referredByCode").keyup(function () {
          const inputElement = $('#referredByCode')[0];
          const inputValue = inputElement.value;
          if (REGEX_NOT_BLANK.test(inputValue) || inputValue === undefined || inputValue === null
              || inputValue.length === 0) {
            inputElement.className = '';
            if (inputElement.nextElementSibling !== null) {
              inputElement.parentNode.removeChild(refCodeErrorSpan);
            }
            isValid6 = true
          } else {
            inputElement.className = 'survey_error';
            if (inputElement.nextElementSibling === null) {
              inputElement.parentNode.appendChild(refCodeErrorSpan);
            }
            isValid6 = false;
          }
          checkValid();
        });

        $('.register-agreement-checkbox').on('click', this, function (event) {
          onAllAgreementClick();
          const checkedValue = isValueTrue(document.getElementById('allAgreement').value);
          isValid7 = checkedValue;
          isValid8 = checkedValue;
          isValid9 = checkedValue;
          checkValid();
        });

        $('.register-agreement-checkbox-small').on('click', this, function (event) {
          const inputElement = this.nextElementSibling;
          switch (inputElement.id) {
            case 'serviceAgreement':
              onServiceAgreementClick(undefined, true, true);
              isValid7 = isValueTrue(inputElement.value);
              break;
            case 'privacyAgreement':
              onPrivacyAgreementClick(undefined, true, true);
              isValid8 = isValueTrue(inputElement.value);
              break;
            case 'marketingAgreement':
              onMarketingAgreementClick(undefined, true, true);
              isValid9 = isValueTrue(inputElement.value);
              break;
            default:
              break;
          }
          checkValid();
        });
      });

    </script>
  </head>

  <body>
  <div class="survey_main">
      <#--    <div class="survey_content_top">-->
      <#--      <div class="survey_content_top_img" onclick="goToUrl('${url.homeUrl}')">-->

      <#--      </div>-->
      <#--    </div>-->
    <div class="survey_content_top">
      <div class="survey_content_top_img" onclick="goToUrl('${url.homeUrl}')">
        <img src="${url.resourcesPath}/img/logo.svg" alt=""Logo">
      </div>
    </div>
    <div class="survey_content_main">
      <div class="survey_content_left">
      </div>
      <div class="survey_content_right">
        <div class="survey_content_body">
            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert alert-${message.type}">
                  <#if message.type = 'success'><span
                    class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                  <#if message.type = 'warning'><span
                    class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                  <#if message.type = 'error'><span
                    class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <#if message.type = 'info'><span
                    class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
              </div>
            </#if>
            <#nested "form">
        </div>
        <div class="survey_content_bottom">
          <div class="survey_content_bottom_copyright">
            <span>${msg("survey_footer_copypright")}</span>
          </div>
          <div class="survey_content_bottom_terms_use"
               onclick="openNewWindows('https://www.planesg.ai/policy-service', 800, 1000)">
            <span>${msg("survey_footer_terms_use")}</span>
          </div>
          <div class="survey_content_bottom_privacy_policy"
               onclick="openNewWindows('https://www.planesg.ai/policy-privacy', 800, 1000)">
            <span>${msg("survey_footer_privacy_policy")}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  </body>
  </html>
</#macro>
