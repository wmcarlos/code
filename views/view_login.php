<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading"><h4>Login</h4></div>
		<div class="panel-body">
			<form name="flogin" id="flogin" method="post" action="?v=login">
				<div class="form-group">
					<label for="txtusername">Username: </label>
					<input type="text" name="txtusername" placeholder="Enter Username" id="txtusername" class="form-control">
				</div>
				<div class="form-group">
					<label for="txtpassword">Password: </label>
					<input type="password" name="txtpassword" id="txtpassword" class="form-control" placeholder="Enter Password">
				</div>
				<input type="hidden" name="txtoperation" id="txtoperation" value="login"/>
				<button type="submit" name="btnlogin" class="btn btn-success" id="btnlogin"><i class="fa fa-sign-in"></i> Login</button>
			</form>
		</div>
	</div>
</div>