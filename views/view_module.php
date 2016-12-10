<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading"><h4><?php print $helper->settitle('Module'); ?></h4></div>
			<div class="panel-body">	
				<?php
					if ($helper->txtoperation == "add" or $helper->txtoperation == "edit"){
				?>
						<form name="fmodule" autocomplete="off" id="fmodule" method="post" action="?v=module">
						<input type="hidden" name="txtmodule_id" id="txtmodule_id" value="<?php print $txtmodule_id?>">
						<div class="form-group">
							<label for="txtname">Name: </label>
							<input type="text" name="txtname" id="txtname" placeholder="Enter Name" class="form-control" value="<?php print $txtname; ?>"/>
						</div>
						<div class="form-group">
							<label for="txticon_class">Icon Class: </label>
							<input type="text" name="txticon_class" id="txticon_class" placeholder="Enter Icon Class" class="form-control" value="<?php print $txticon_class; ?>">
						</div>
						<div class="form-group">
							<label for="txtposition">Position: </label>
							<input type="text" name="txtposition" id="txtposition" placeholder="Enter Position" class="form-control" value="<?php print $txtposition; ?>">
						</div>
						<input type="hidden" name="txtoperation" id="txtoperation" value="<?php print $helper->txtoperation; ?>"/>
						<button class="btn btn-success" name="btnsave" id="btnsave" type="submit"><i class="fa fa-floppy-o"></i> Save</button>
						<a class="btn btn-danger" href="?v=module"><i class="fa fa-remove"></i> Cancel</a>
					</form>
				<?php }else{ ?>
					<a href="?v=module&txtoperation=new" class="btn btn-success"><i class="fa fa-plus"></i> New</a>
					<br>
					<br>
					<table class="table table-bordered table-striped datatable">
						<thead>
							<th>ID</th>
							<th>Name</th>
							<th>Position</th>
							<th>-</th>
						</thead>
						<tbody>
							<?php print $cad; ?>
						</tbody>
					</table>
				<?php }?>
			</div>
	</div>
</div>