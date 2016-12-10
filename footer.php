<!--Javasscript Files-->
<script type="text/javascript" src="views/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="views/plugins/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="views/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="views/js/bootbox.min.js"></script>
<script type="text/javascript" src="views/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="views/js/additional-methods.min.js"></script>
<script type="text/javascript" src="views/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//data table declaration
	    $('.datatable').DataTable();

	    //message
	    if(operation){
	    	message(operation, val);
	    }
	});
</script>
</body>
</html>