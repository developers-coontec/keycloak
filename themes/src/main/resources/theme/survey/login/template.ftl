<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="robots" content="noindex, nofollow">

      <#if properties.meta?has_content>
          <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
          </#list>
      </#if>
    <title>${msg("survey_page-title")}</title>
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
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <!-- Google Tag Manager -->
    <script>
      console.log('window.location.host:' + window.location.host, navigator.userAgent);
      if (window.location.host === "app.meback.ai" ||
          window.location.host === "auth.meback.ai") {

        // (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        //       new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        //     j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        //     'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        // })(window,document,'script','dataLayer','GTM-123');

        // var newScript = document.createElement("script");
        // newScript.type = "text/javascript";
        // newScript.setAttribute("async", "true");
        // newScript.setAttribute("src", "https://www.googletagmanager.com/gtag/js?id=G-FQ0HPGWL4V");
        // document.documentElement.firstChild.appendChild(newScript);
        // window.dataLayer = window.dataLayer || [];
        // function gtag(){dataLayer.push(arguments);}
        // gtag('js', new Date());
        //
        // gtag('config', 'G-FQ0HPGWL4V');

        // (function(h,o,t,j,a,r){
        //   h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        //   h._hjSettings={hjid:2363464,hjsv:6};
        //   a=o.getElementsByTagName('head')[0];
        //   r=o.createElement('script');r.async=1;
        //   r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        //   a.appendChild(r);
        // })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
      }
    </script>
    <!-- End Google Tag Manager -->

    <script>
      function clickSubmit(formId) {
        document.getElementById(formId).submit();
        return false;
      }

      function getSurveyHomeUrl() {
        var url = window.location.href;
        if (url.includes("authtest.meback.ai")) {
          return "https://test.meback.ai";
        } else if (url.includes("authdemo.meback.ai")) {
          return "https://demo.meback.ai";
        } else if (url.includes("auth.meback.ai")) {
          return "https://app.meback.ai";
        } else {
          return "http://localhost:8080";
        }
      }

      function goToUrl(url) {
        console.log(url);
        if (url.includes("/auth/realms/survey/account") ||
            url.includes("/auth/?client_id=web_app") ||
            url.includes("/auth/realms/survey/login-actions/authenticate?client_id=web_app")
        ) {
          url = getSurveyHomeUrl();
          console.log('modified url:' + url);
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

      function displayAgreementRequiredErrorMessage() {
        console.log('displayAgreementRequiredErrorMessage');
        // document.getElementById('register-validation-accept-agreement').classList.remove("survey_content_hide");
        document.getElementById('register-validation-accept-agreement').classList.remove(
            "survey_content_hide");
        // document.getElementById('register-button').classList.add("survey_content_disabled");
      }

      function hideAgreementRequiredErrorMessage() {
        console.log('hideAgreementRequiredErrorMessage');
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

        console.log('isAgreementRequired', updateAllAgreement, inputValidateAllFields,
            localAllAgreement, localServiceAgreement, localPrivacyAgreement,
            localMarketingAgreement);
        if (updateAllAgreement === true) {
          if (isValueTrue(localServiceAgreement) &&
              isValueTrue(localPrivacyAgreement) &&
              isValueTrue(localMarketingAgreement)) {
            allAgreementChecked();
          } else {
            allAgreementUnchecked();
          }
        }
        if (isValueTrue(localServiceAgreement) && isValueTrue(localPrivacyAgreement)) {
          document.getElementById('register-agreement-section').classList.remove("survey_error");
          document.getElementById('register-agreement-option-section').classList.remove(
              "survey_error");
          // hideAgreementRequiredErrorMessage();
        } else {
          document.getElementById('register-agreement-section').classList.add("survey_error");
          document.getElementById('register-agreement-option-section').classList.add(
              "survey_error");
          // displayAgreementRequiredErrorMessage();
        }
      }

      function validatePassword(inputElement) {
        if (!inputElement) {
          return 0;
        }
        var inputPassword = inputElement.value;
        console.log('validatePassword:' + inputPassword);
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
        console.log('validatePassword:' + inputPassword, validCount, numberExists,
            lowerCaseAlphabetExists, upperCaseAlphabetExists, specialCharacterExists,
            lengthGreaterThanSeven);

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
        console.log('allAgreementChecked');
        document.getElementById('allAgreement').value = true;
        document.getElementById('all-agreement-checkbox').classList.remove("survey_content_hide");
      }

      function allAgreementUnchecked() {
        console.log('allAgreementUnchecked');
        document.getElementById('allAgreement').value = false;
        document.getElementById('all-agreement-checkbox').classList.add("survey_content_hide");
      }

      function onAllAgreementClick(inputValue) {
        var checkedValue = document.getElementById('allAgreement').value;
        console.log('onAllAgreementClick', checkedValue, inputValue);
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
        console.log('onAllAgreementDropdownClick', checkedValue);
        if (isValueTrue(checkedValue)) {
          document.getElementById('all-agreement-dropdown').value = false;
          document.getElementById('div-all-agreement-dropdown').classList.remove(
              "dropdown-clicked");
          document.getElementById('div-all-agreement-dropdown').classList.add("dropdown-default");
          document.getElementById('register-agreement-option-section').classList.add(
              "survey_content_hide");
          document.getElementById('survey_login_social_links').classList.remove("margin-top-155");
        } else {
          document.getElementById('all-agreement-dropdown').value = true;
          document.getElementById('div-all-agreement-dropdown').classList.remove(
              "dropdown-default");
          document.getElementById('div-all-agreement-dropdown').classList.add("dropdown-clicked");
          document.getElementById('register-agreement-option-section').classList.remove(
              "survey_content_hide");
          document.getElementById('survey_login_social_links').classList.add("margin-top-155");
        }
        // console.log(document.getElementById('all-agreement-dropdown'));
      }

      function onServiceAgreementClick(inputValue, updateAllAgreement, inputValidateAllFields) {
        var checkedValue = document.getElementById('serviceAgreement').value;
        console.log('onServiceAgreementClick', checkedValue, inputValue, updateAllAgreement,
            inputValidateAllFields);
        if (inputValue) {
          checkedValue = !inputValue;
        }
        if (isValueTrue(checkedValue)) {
          document.getElementById('serviceAgreement').value = false;
          document.getElementById('service-agreement-checkbox').classList.add(
              "survey_content_hide");
        } else {
          document.getElementById('serviceAgreement').value = true;
          document.getElementById('service-agreement-checkbox').classList.remove(
              "survey_content_hide");
        }
        // console.log(document.getElementById('service-agreement-checkbox'));
        isAgreementRequired(updateAllAgreement, inputValidateAllFields);
      }

      function onPrivacyAgreementClick(inputValue, updateAllAgreement, inputValidateAllFields) {
        var checkedValue = document.getElementById('privacyAgreement').value;
        console.log('onPrivacyAgreementClick', checkedValue, inputValue, updateAllAgreement,
            inputValidateAllFields);
        if (inputValue) {
          checkedValue = !inputValue;
        }
        if (isValueTrue(checkedValue)) {
          document.getElementById('privacyAgreement').value = false;
          document.getElementById('privacy-agreement-checkbox').classList.add(
              "survey_content_hide");
        } else {
          document.getElementById('privacyAgreement').value = true;
          document.getElementById('privacy-agreement-checkbox').classList.remove(
              "survey_content_hide");
        }
        // console.log(document.getElementById('privacy-agreement-checkbox'));
        isAgreementRequired(updateAllAgreement, inputValidateAllFields);
      }

      function onMarketingAgreementClick(inputValue, updateAllAgreement, inputValidateAllFields) {
        var checkedValue = document.getElementById('marketingAgreement').value;
        console.log('onMarketingAgreementClick', checkedValue, inputValue, updateAllAgreement,
            inputValidateAllFields);
        if (inputValue) {
          checkedValue = !inputValue;
        }
        if (isValueTrue(checkedValue)) {
          document.getElementById('marketingAgreement').value = false;
          document.getElementById('marketing-agreement-checkbox').classList.add(
              "survey_content_hide");
        } else {
          document.getElementById('marketingAgreement').value = true;
          document.getElementById('marketing-agreement-checkbox').classList.remove(
              "survey_content_hide");
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
        let isValid9 = true;  // marketing

        function checkValid() {
          const registerButton = $('#register-button')[0];
          console.log('registerButton checkValid', isValid1, isValid2, isValid3, isValid4, isValid5,
              isValid6, isValid7, isValid8, isValid9);
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
          isValid9 = true;
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
              isValid9 = true;
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
  <script>
    // (function() {
    //   var w = window;
    //   if (w.ChannelIO) {
    //     return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    //   }
    //   var ch = function() {
    //     ch.c(arguments);
    //   };
    //   ch.q = [];
    //   ch.c = function(args) {
    //     ch.q.push(args);
    //   };
    //   w.ChannelIO = ch;
    //   function l() {
    //     if (w.ChannelIOInitialized) {
    //       return;
    //     }
    //     w.ChannelIOInitialized = true;
    //     var s = document.createElement('script');
    //     s.type = 'text/javascript';
    //     s.async = true;
    //     s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
    //     s.charset = 'UTF-8';
    //     var x = document.getElementsByTagName('script')[0];
    //     x.parentNode.insertBefore(s, x);
    //   }
    //   if (document.readyState === 'complete') {
    //     l();
    //   } else if (window.attachEvent) {
    //     window.attachEvent('onload', l);
    //   } else {
    //     window.addEventListener('DOMContentLoaded', l, false);
    //     window.addEventListener('load', l, false);
    //   }
    // })();
    // ChannelIO('boot', {
    //   "pluginKey": "f6c60dea-3acd-447a-82b8-f07f48c45ca5"
    // });
  </script>
  <div class="survey_main">
    <div class="survey_content_top">
      <div class="survey_content_top_img" onclick="goToUrl('${url.homeUrl}')">

      </div>
    </div>
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
             onclick="openNewWindows('https://www.meback.ai/policy/service.html', 800, 800)">
          <span>${msg("survey_footer_terms_use")}</span>
        </div>
        <div class="survey_content_bottom_privacy_policy"
             onclick="openNewWindows('https://www.meback.ai/policy/privacy.html', 800, 800)">
          <span>${msg("survey_footer_privacy_policy")}</span>
        </div>
      </div>
    </div>
  </div>
  </body>
  </html>
</#macro>
