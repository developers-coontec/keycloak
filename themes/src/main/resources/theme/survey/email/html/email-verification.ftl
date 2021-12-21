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
      font-family: 'NanumSquare', 'Noto Sans KR', sans-serif;
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
    style="font-family: 'NanumSquare', 'Noto Sans KR', sans-serif; font-weight: 400; background-color: #ffffff;"
    th:inline="text">
<div class="email-content"
     style="display: block; margin-left: auto; margin-right: auto; width: 800px; margin-top: 23px; border: solid 1px #dddddd; background-color: #ffffff;">
  <div class="email-header"
       style="display: inline-block; vertical-align: top; height: 60px; width: 100%;">
    <a href="${homeUrl}" class="email-header-logo" target="_blank"
       style="text-decoration: none;">
      <img class="logo logo-margin"
           style="margin-left: 20px; margin-top: 11px; width: 100px; height: 40px; object-fit: contain;"
           src="https://survey-email.s3.ap-northeast-2.amazonaws.com/logo%403x.png"/>
    </a>
  </div>
  <div class="survey-info-container"
       style="display: block; height: auto; font-stretch: normal; font-style: normal; letter-spacing: normal; text-align: center;">
    <div class="survey-info-box"
         style="display: block; margin-left: auto; margin-right: auto; width: 400px">
      <div class="survey-title"
           style="display: block; margin-left: auto; margin-right: auto; margin-top: 20px;">
        <span class="survey_title_text"
              style="font-size: 17px; font-weight: bold; line-height: 1.29; color: #303542;">
          ${msg("emailVerificationTitle","${name}")?no_esc}
        </span>
      </div>
      <div class="survey-subtitle"
           style="display: block; margin-left: auto; margin-right: auto; margin-top: 20px;">
        <span class="survey_subtitle_text"
              style="font-size: 15px; font-weight: normal; line-height: 1.33; color: #303542;">
          ${msg("emailVerificationSubtitle")?no_esc}
        </span>
      </div>
      <a href="${mainButtonUrl}" target="_blank2" style="height: 40px; text-decoration: none;">
        <div class="email-main-button"
             style=" padding: 13px; margin-top: 20px; border-radius: 4px; box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.1); background-color: #1eafd8;">
          <span class="email-main-button-label"
                style="font-size: 15px; font-weight: 500; line-height: 1.47; color: #ffffff;">
            ${msg("emailVerificationButton")?no_esc}
          </span>
        </div>
      </a>
      <div class="survey-email-footer"
           style="display: block; margin-top: 40px; margin-left: auto; margin-right: auto; margin-bottom: 128px;">
        <span class="survey-email_footer_text"
              style="display: block; font-size: 11px; font-weight: normal; line-height: 1.45; color: #9196a3;">
          ${msg("emailVerificationFooter")?no_esc}
        </span>
      </div>
    </div>
  </div>
</div>
</body>
</html>
