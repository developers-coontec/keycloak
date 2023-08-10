<!DOCTYPE html>
<html xmlns:th="http://www.w3.org/1999/xhtml">

<head>
  <meta charset="UTF-8">
  <title>Survey</title>
  <script type="text/javascript"></script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet"
        type="text/css">
  <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
  <style type="text/css" th:inline="text">
    @import url("https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css");

    body {
      font-family: 'Noto Sans KR', 'NanumSquare', sans-serif;
      font-weight: 400;
      background-color: #ffffff;
    }

    a:hover,
    a:active,
    a:link,
    a:visited {
      text-decoration: none;
      border: none;
    }
  </style>
</head>

<body
    style="font-family: 'NanumSquare', 'Noto Sans KR', sans-serif; font-weight: 400; background: #F8F9FA;"
    th:inline="text">
<div class="email-content"
     style="display: block; margin-left: auto; margin-right: auto; min-width: 365px; max-width: 620px; padding: 40px; background: #FFFFFF;">
  <div class="email-header"
       style="display: inline-flex; align-content: center; height: 22px; width: 100%; justify-content: space-between; margin-bottom: 70px;">
    <a href="${homeUrl}" class="email-header-logo" target="_blank"
       style="text-decoration: none; width: 110px; margin-right: auto">
      <img class="logo logo-margin"
           style="width: 110px; height: 22px; object-fit: contain;"
           src="https://plan-esg-resources.s3.ap-northeast-2.amazonaws.com/images/logo.png"/>
    </a>
    <span class="header_subtitle_text"
          style="width: 110px; font-size: 12px; font-weight: 400; line-height: 18px; text-align: right; letter-spacing: -0.005em; color: #808080;">
      ${msg("emailPasswordResetHeaderSub")?no_esc}
    </span>

  </div>
  <div class="email-info-container"
       style="display: block; height: auto; font-stretch: normal; font-style: normal; letter-spacing: normal; text-align: start; justify-content: center">
    <div class="email-title1"
         style="display: block;">
      <span class="email_title_text"
            style="font-style: normal; font-weight: 900; font-size: 28px; line-height: 34px; letter-spacing: -0.005em; color: #121212;">
        ${msg("emailPasswordResetTitle1","${name}")?no_esc}
      </span>
    </div>
    <div class="email-title2" style="margin-top: 40px;">
      <span class="survey_inupt_message_text"
            style="font-weight: 400;font-size: 16px;line-height: 28px; letter-spacing: -0.005em;">
        ${msg("emailPasswordResetTitle2","${name}")?no_esc}
      </span>
    </div>
    <div class="email-inputMessage"
         style="margin-top: 20px; padding: 20px; background: #F2F5FC;">
      <span class="email_inupt_message_text"
            style="font-weight: 700;font-size: 16px;line-height: 28px;letter-spacing: -0.005em;color: #121212;">
        ${msg("emailPasswordResetMessage","${name}")?no_esc}
      </span>
    </div>
    <a href="${mainButtonUrl}" target="_blank2"
       style="text-decoration: none; margin-top: 40px; margin-left: auto; margin-right: auto; height: 56px; justify-content: center">
      <div class="email-main-button"
           style=" padding: 14px 20px; text-align: center; width: 160px; margin-top: 40px; height: 28px; margin-left: auto; margin-right: auto; background: #309EEE; border-radius: 3px;">
        <span class="email-main-button-label"
              style="font-weight: 700; font-size: 16px; line-height: 28px; text-align: center; letter-spacing: -0.005em; color: #FFFFFF;">
           ${msg("emailPasswordResetButton")?no_esc}
        </span>
      </div>
    </a>
    <div class="email-divider"
         style="display: block; margin-top: 60px; height: 1px; background: #808080;"></div>
    <div class="email-footer1" style="display: block; margin-top: 40px;">
      <span class="email_footer_text"
            style="font-size: 16px;font-weight: 400; line-height: 28px; letter-spacing: -0.005em; text-align: left; color: #121212;">
        ${msg("emailFooter1")?no_esc}
      </span>
    </div>
    <div class="email-footer2"
         style="display: block; margin-top: 24px; margin-bottom: 20px;">
      <span class="email_footer_text"
            style="font-size: 12px;font-weight: 400;line-height: 18px;letter-spacing: -0.005em;text-align: left; color: #808080;">
        ${msg("emailFooter2")?no_esc}
      </span>
    </div>
  </div>
</div>
<div class="email-company"
     style="display: block; margin-left: auto; margin-right: auto; min-width: 365px; max-width: 620px; background: #F5F5F5; padding: 40px; font-family: 'Noto Sans KR'; font-style: normal; font-weight: 400; font-size: 12px;line-height: 18px; letter-spacing: -0.005em; color: #808080;">
  <div class="email-company1" style="display: block;">
    <span class="email_company_tel"
          style="margin-right: 28px">
      ${msg("emailCompanyTel")?no_esc}
    </span>
    <span class="email_company_email">
      ${msg("emailCompanyEmail")?no_esc}
    </span>
  </div>
  <div class="email-company2"
       style="display: block; margin-top: 24px;">
    <span class="email_company_address">
      ${msg("emailCompanyAddress")?no_esc}
    </span>
  </div>
  <div class="email-company3"
       style="display: block;">
    <span class="email_company_copyright">
      ${msg("emailCompanyCopyright")?no_esc}
    </span>
  </div>
  <div class="email-company4"
       style="display: block; margin-top: 24px;">
    <span class="email_company_etc">
      ${msg("emailCompanyEtc")?no_esc}
    </span>
  </div>
</div>

</body>
</html>
