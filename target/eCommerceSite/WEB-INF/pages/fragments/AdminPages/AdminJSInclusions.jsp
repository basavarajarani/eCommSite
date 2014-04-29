
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- external javascript
	================================================== -->
<!-- Placed at the end of the document so the pages load faster -->



<spring:url value="/static/js/bootstrap-transition.js" htmlEscape="true"
	var="bstransitionjs" />
<script src="${bstransitionjs}"></script>

<spring:url value="/static/js/bootstrap-alert.js" htmlEscape="true"
	var="bsalertjs" />
<script src="${bsalertjs}"></script>

<spring:url value="/static/js/bootstrap-modal.js" htmlEscape="true"
	var="bsmodal" />
<script src="${bsmodal}"></script>


<spring:url value="/static/js/bootstrap-dropdown.js" htmlEscape="true"
	var="bsdropdown" />
<script src="${bsdropdown}"></script>

<spring:url value="/static/js/bootstrap-scrollspy.js" htmlEscape="true"
	var="bsscrollspyjs" />
<script src="${bsscrollspyjs}"></script>

<spring:url value="/static/js/bootstrap-tab.js" htmlEscape="true"
	var="bstabjs" />
<script src="${bstabjs}"></script>

<spring:url value="/static/js/bootstrap-tooltip.js" htmlEscape="true"
	var="bstooltipjs" />
<script src="${bstooltipjs}"></script>

<spring:url value="/static/js/bootstrap-popover.js" htmlEscape="true"
	var="bspopoverjs" />
<script src="${bspopoverjs}"></script>

<spring:url value="/static/js/bootstrap-button.js" htmlEscape="true"
	var="bsbuttonjs" />
<script src="${bsbuttonjs}"></script>

<spring:url value="/static/js/bootstrap-collapse.js" htmlEscape="true"
	var="bscollapsejs" />
<script src="${bscollapsejs}"></script>

<spring:url value="/static/js/bootstrap-carousel.js" htmlEscape="true"
	var="bscarousel" />
<script src="${bscarousel}"></script>

<spring:url value="/static/js/bootstrap-typeahead.js" htmlEscape="true"
	var="bstypeaheadjs" />
<script src="${bstypeaheadjs}"></script>

<spring:url value="/static/js/bootstrap-affix.js" htmlEscape="true"
	var="bsaffixjs" />
<script src="${bsaffixjs}"></script>

<spring:url value="/static/js/holder.js" htmlEscape="true"
	var="holderjs" />
<script src="${holderjs}"></script>

<spring:url value="/static/js/prettify.js" htmlEscape="true"
	var="prettifyjs" />
<script src="${prettifyjs}"></script>

<spring:url value="/static/js/application.js" htmlEscape="true"
	var="applicationjs" />
<script src="${applicationjs}"></script>

<spring:url value="/static/js/jquery.history.js" htmlEscape="true"
	var="jqueryhistoryjs" />
<script src="${jqueryhistoryjs}"></script>

<spring:url value="/static/js/jquery.browser.min.js" htmlEscape="true" var="jquerybrowserjs"/>
<script src="${jquerybrowserjs}"></script>

<spring:url value="/static/js/jquery.cleditor.min.js" htmlEscape="true"
	var="jquerycleditorjs" />
<script src="${jquerycleditorjs}"></script>

<script>
	$(document).ready(function() {
		$(".cleditor").cleditor();
	});
</script>


