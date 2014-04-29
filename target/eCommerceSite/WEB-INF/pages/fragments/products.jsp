    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular.min.js"></script>
	
	<spring:url value="/static/js/hello.js" var="hellojs" />
    	<script src="${hellojs}"></script>

<div ng-app="myapp">
	<div ng-controller="HelloController" >
		<h2>Hello {{helloTo.title}} !</h2>
	</div>
</div>
