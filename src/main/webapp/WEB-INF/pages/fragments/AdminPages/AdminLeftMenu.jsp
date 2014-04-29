
<!-- left menu starts -->
<div class="span2 main-menu-span">
	<div class="well nav-collapse sidebar-nav">
		<ul class="nav nav-tabs nav-stacked main-menu">
			<li class="nav-header hidden-tablet">Main</li>
			<li><a class="ajax-link" href="<%=request.getContextPath()%>"><i
					class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>
			<li><a class="ajax-link"
				href="<%=request.getContextPath()%>/useroperations"><i
					class="icon-user"></i><span class="hidden-tablet"> Users</span></a></li>
			<li><a class="ajax-link"
				href="<%=request.getContextPath()%>/createProductCategory"><i
					class="icon-tags"></i><span class="hidden-tablet"> Product
						Categories</span></a></li>
			<li><a class="ajax-link"
				href="<%=request.getContextPath()%>/productoperations"><i
					class="icon-list-alt"></i><span class="hidden-tablet">
						Products</span></a></li>
			<li><a class="ajax-link" href="#"><i class="icon-shopping-cart"></i><span
					class="hidden-tablet"> Orders</span></a></li>
			<li><a class="ajax-link" href="#"><i class="icon-shopping-cart"></i><span
					class="hidden-tablet"> Sales</span></a></li>
			<li class="nav-header hidden-tablet">Settings</li>
			<li><a class="ajax-link" href="#"> Google Settings</a></li>
		</ul>
		<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input
			id="is-ajax" type="checkbox"> Ajax on menu</label>
	</div>
	<!--/.well -->
</div>
<!--/span-->
<!-- left menu ends -->
