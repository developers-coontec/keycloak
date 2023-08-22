<!DOCTYPE html>
<html xmlns:th="http://www.w3.org/1999/xhtml">

<head>
  <meta charset="UTF-8">
  <title>PlanESG</title>
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
     style="display: block; margin-left: auto; margin-right: auto; width: 780px; min-width: 780px; max-width: 780px; background: #FFFFFF;">
  <table cellpadding="40" style="width: 780px; background: #FFFFFF;">
    <tr>
      <td>
        <table style="width: 700px;">
          <tr>
            <td style="width: 550px;">
              <a href="${homeUrl}" class="email-header-logo" target="_blank"
                 style="text-decoration: none; width: 110px; margin-right: auto">
                <img class="logo logo-margin"
                     style="width: 110px; height: 22px; object-fit: contain;"
                     src="https://plan-esg-resources.s3.ap-northeast-2.amazonaws.com/images/logo.png"/>
              </a>
            </td>
            <td style="width: 150px; text-align: right;">
           <span class="header_subtitle_text"
                 style="width: 150px; font-size: 12px; font-weight: 400; line-height: 18px; text-align: right; letter-spacing: -0.005em; color: #808080;">
              ${msg("emailPasswordResetHeaderSub")?no_esc}
          </span>
            </td>
          </tr>
        </table>
        <table cellpadding="35" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table style="width: 700px; ">
          <tr>
            <td>
           <span class="email_title_text"
                 style="font-style: normal; font-weight: 900; font-size: 28px; line-height: 34px; letter-spacing: -0.005em; color: #121212;">
              ${msg("emailPasswordResetTitle1","${name}")?no_esc}
          </span>
            </td>
          </tr>
        </table>
        <table cellpadding="20" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table style="width: 700px; ">
          <tr>
            <td>
          <span class="email_inupt_message_text"
                style="font-weight: 400;font-size: 16px;line-height: 28px; letter-spacing: -0.005em;">
             ${msg("emailPasswordResetTitle2","${name}")?no_esc}
          </span>
            </td>
          </tr>
        </table>
        <table cellpadding="10" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table cellpadding="20" cellspacing="0" style="width: 700px; background: #F2F5FC;">
          <tr>
            <td>
           <span class="email_inupt_message_text"
                 style="font-weight: 700;font-size: 16px;line-height: 28px;letter-spacing: -0.005em;color: #121212;">
             ${msg("emailPasswordResetMessage","${name}")?no_esc}
      </span>
            </td>
          </tr>
        </table>
        <table cellpadding="20" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table cellspacing="0" cellpadding="7" style="width: 700px;">
          <tr>
            <td style="width: 245px; height: 42px; background: #ffffff; border: none;"></td>
            <td style="width: 210px; height: 42px; background: #309EEE; border-radius: 3px; text-align: center; vertical-align: center;">
              <a th:href="${mainButtonUrl}" target="_blank2"
                 style="text-decoration: none;">
                  <span class="email-main-button-label"
                        style="font-weight: 700; font-size: 16px; vertical-align: center; line-height:normal; text-align: center; letter-spacing: -0.005em; color: #FFFFFF;">
                      ${msg("emailPasswordResetButton")?no_esc}
                  </span>
              </a>
            </td>
            <td style="width: 245px; height: 42px; background: #ffffff; border: none;"></td>
          </tr>
        </table>
        <table cellpadding="30" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table cellpadding="0" cellspacing="0" style="height: 1px; width: 700px;">
          <tr>
            <td style="height: 1px; width: 700px; background: #808080;"></td>
          </tr>
        </table>
        <table cellpadding="20" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table style="width: 700px;">
          <tr>
            <td>
                <span class="email_footer_text"
                      style="font-size: 16px;font-weight: 400; line-height: 28px; letter-spacing: -0.005em; text-align: left; color: #121212;">
                  ${msg("emailFooter1")?no_esc}
                </span>
            </td>
          </tr>
        </table>
        <table cellpadding="12" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table style="width: 700px;">
          <tr>
            <td>
                 <span class="email_footer_text"
                       style="font-size: 12px;font-weight: 400;line-height: 18px;letter-spacing: -0.005em;text-align: left; color: #808080;">
                     ${msg("emailFooter2")?no_esc}
                </span>
            </td>
          </tr>
        </table>
        <table cellpadding="10" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
<div class="email-company"
     style="display: block; margin-left: auto; margin-right: auto; width: 780px; min-width: 780px; max-width: 780px; background: #F5F5F5; font-family: 'Noto Sans KR'; font-style: normal; font-weight: 400; font-size: 12px;line-height: 18px; letter-spacing: -0.005em; color: #808080;">
  <table cellpadding="40" style="width: 780px; background: #F5F5F5;">
    <tr>
      <td>
        <table style="width: 700px;">
          <tr>
            <td style="width: 150px;">
               <span class="email_company_tel"
                     style="font-family: 'Noto Sans KR'; font-style: normal; font-weight: 400; font-size: 12px;line-height: 18px; letter-spacing: -0.005em; color: #808080;">
                    ${msg("emailCompanyTel")?no_esc}
                </span>
            </td>
            <td style="width: 550px;">
               <span class="email_company_email"
                     style="font-family: 'Noto Sans KR'; font-style: normal; font-weight: 400; font-size: 12px;line-height: 18px; letter-spacing: -0.005em; color: #808080;">
                  ${msg("emailCompanyEmail")?no_esc}
              </span>
            </td>
          </tr>
        </table>
        <table cellpadding="12" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table style="width: 700px; ">
          <tr>
            <td>
              <span class="email_company_address"
                    style="font-family: 'Noto Sans KR'; font-style: normal; font-weight: 400; font-size: 12px;line-height: 18px; letter-spacing: -0.005em; color: #808080;">
                ${msg("emailCompanyAddress")?no_esc}
              </span>
            </td>
          </tr>
        </table>
        <table style="width: 700px; ">
          <tr>
            <td>
              <span class="email_company_copyright"
                    style="font-family: 'Noto Sans KR'; font-style: normal; font-weight: 400; font-size: 12px;line-height: 18px; letter-spacing: -0.005em; color: #808080;">
                ${msg("emailCompanyCopyright")?no_esc}
              </span>
            </td>
          </tr>
        </table>
        <table cellpadding="12" style="width: 700px;">
          <tr>
            <td></td>
          </tr>
        </table>
        <table style="width: 700px; ">
          <tr>
            <td>
              <span class="email_company_etc"
                    style="font-family: 'Noto Sans KR'; font-style: normal; font-weight: 400; font-size: 12px;line-height: 18px; letter-spacing: -0.005em; color: #808080;">
                 ${msg("emailCompanyEtc")?no_esc}
              </span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
