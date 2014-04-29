
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="body">
	<div id="mainpagebody">
		<sec:authorize ifNotGranted="ROLE_ANONYMOUS"> 
			<p style="font-weight:bold;"> Dear ${userFullName},<p>
		</sec:authorize>
		<div id="welcome">Welcome to Presens Health Care.</div>
		<div id="welcomeintrotext" class="welcomeintrotext">Presens
			Health Care. is the first leading company in selling Silver Fibre
			garments. With more than 10 years of experience, we have increased
			our product range in home and health care products, medical devices,
			medical products and gift items. Our quality wins the heart of many
			consumers. Our commitment is to provide good services and excellent
			quality products to ensure the safety of our consumers as well as
			keeping a good reputation."</div>
	</div>


	<div id="slider" class="nivoSlider">
		<spring:url value="/static/images/EveryDay MarkUp - web small.jpg"
			var="EverydayMarkupWebSmall" />
		<img src="${EverydayMarkupWebSmall }" alt="" />
		<spring:url value="/static/images/Sports White MarkUp-web small.jpg"
			var="SportsWhiteMarkUpWebSmall" />
		<img src="${SportsWhiteMarkUpWebSmall}" alt="" title="#htmlcaption" />
	</div>

	<div id="htmlcaption" class="nivo-html-caption">
		<strong>This</strong> is an example of a <em>HTML</em> caption with <a
			href="#">a link</a>.
	</div>

</div>