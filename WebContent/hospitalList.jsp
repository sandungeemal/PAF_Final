<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Health Care System</title>
	
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
	 
    <style>

        .elementz {
            border:none;
            background-image:none;
            background-color:transparent;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            outline: none;
            -webkit-appearance: none;
            color: #000;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0, 0, 0); /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content1 {
            background-color: #fefefe;
            margin: auto;
            width: 40%;
            height: 80%;
            overflow-y: scroll;
            padding: 20px;
            border: 1px solid #888;
        }

        /* The Close Button */
        .close1 {
            color: #aaaaaa;
            float: right;
            margin-left: 95%;
            font-size: 28px;
            font-weight: bold;
        }

        .close1:hover,
        .close1:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-file {
            position: relative;
            overflow: hidden;
        }
        .btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }

        #img-upload{
            width: 100%;
        }

        .my-error-class {
            color: red;
        }

        .my-valid-class {
            color: green;
        }
    </style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
	        <a class="navbar-brand" href="profileServlet">Health Care System</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav ml-auto">
	                <% if(session.getAttribute("userEmail")==null){ %>
	                <li class="nav-item">
	                    <a class="nav-link" href="login.jsp">Login</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="register.jsp">Register</a>
	                </li>
	                <%}else{ %>
	                <li class="nav-item">
	                    <a class="nav-link" href="logoutServlet">Logout</a>
	                </li>
	                <%} %>
	            </ul>
	
	        </div>
        </div>
	</nav>
    <div class="container">
		
<br>
<p></p>
		<main class="login-form">
	        <div class="row justify-content-center">
	            <div class="col-md-10">
	                <div class="card">
	                	<div class="card-header">Add Hospital</div>
	                    <div class="card-body">
	                        <form id="hospital">
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Name</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="name1" class="form-control" name="name1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">No Of Wards</label>
	                                <div class="col-md-6">
	                                    <input type="number" id="wards1" class="form-control" name="wards1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">No Of Beds</label>
	                                <div class="col-md-6">
	                                    <input type="number" id="beds1" class="form-control" name="beds1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">No Of Channeling Rooms</label>
	                                <div class="col-md-6">
	                                    <input type="number" id="rooms1" class="form-control" name="rooms1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Address</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="address1" class="form-control" name="address1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">City</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="city1" class="form-control" name="city1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Phone Number</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="phone1" class="form-control" name="phone1">
	                                </div>
	                            </div>
	                            
	                            <div class="col-md-6 offset-md-4">
	                                <button type="submit" class="btn btn-primary">
	                                    Add
	                                </button>
	                            </div>
	                    	</form>
	                    </div>
	                    <div class="card-header">Hospital List</div>
	                    <div class="card-body">
	                        <div class="p-1" id="usersDiv">
	            			</div>
	                    </div>
	                </div>
	            </div>
	        </div>
		</main>
	</div>

</body>
</html>
<div id="popupEdit" class="modal">
    <div class="modal-content1" style="height: 70%">
        <span class="close">&times;</span>
        <br>
        <div class="col-md-12">
            <form  id="editForm">
                <input type="hidden" id="edit_id">
                <div class="form-group">
                    <label for="Email">Name</label>
                    <input type="text" id="e_name" class="form-control" name="e_name">
                </div>
                <div class="form-group">
                    <label for="Email">No Of Wards</label>
                    <input type="number" id="wards" class="form-control" name="wards">
                </div>
                <div class="form-group">
                    <label for="subject">No Of Beds</label>
                    <input type="number" id="beds" class="form-control" name="beds">
                </div>
                <div class="form-group">
                    <label for="message">No Of Channeling Rooms</label>
                    <input type="number" id="rooms" class="form-control" name="rooms">
                </div>
                <div class="form-group">
                    <label for="message">Address</label>
                    <input type="text" id="address" class="form-control" name="address">
                </div>
                <div class="form-group">
                    <label for="message">City</label>
                    <input type="text" id="city" class="form-control" name="city">
                </div>
                <div class="form-group">
                    <label for="message">Phone</label>
                    <input type="number" id="phone" class="form-control" name="phone">
                </div>
                <input type="submit" value="Submit" class="btn btn-primary">
            </form>
        </div>
    </div>
</div>

<script>

$(document).ready(function () {

    $("#hospital").validate({
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        rules: {
        	name1: "required",
        	wards1: {
                number: true,
                required: true
            },
        	beds1: {
                number: true,
                required: true
            },
            rooms1: {
                number: true,
                required: true
            },
            address1: "required",
            city1: "required",
            phone1: {
            	minlength: 10,
        		maxlength: 10,
                number: true,
                required: true
            }
        },
        messages: {
        	name1: "Name is Required!",
        	wards1: {
                number: "only numbers!",
                required: "Wards Required!"
            },
            beds1: {
                number: "only numbers!",
                required: "Beds Required!"
            },
            rooms1: {
                number: "only numbers!",
                required: "Rooms Required!"
            },
            address1: "Address is Required!",
            city1: "City Required!",
            phone1: {
            	minlength: "incorrect phone number!",
        		maxlength: "incorrect phone number!",
                number: "only numbers!",
                required: "Phone Number Required!"
            }
        },
        submitHandler: function () {
            var datas = JSON.stringify({
                "name" : $('#name1').val(),
                "wards" : $('#wards1').val(),
                "beds" : $('#beds1').val(),
                "rooms" : $('#rooms1').val(),
                "address" : $('#address1').val(),
                "city" : $('#city1').val(),
                "phone" : $('#phone1').val()
            });

            $.ajax({
                type: "POST",
                url: 'hospital/host',
                dataType : 'json',
				contentType : 'application/json',
				data: datas,
                success: function(data){
                	if(data['success']=="1"){
						swal("Success!", "Added Successfull!", "success");
						$("#hospital")[0].reset();
						reload();
					}else if(data['success']=="0"){
						swal({
				            title: "Error",
				            text: "This Hospital is Already Exists!",
				            icon: "warning",
				            dangerMode: true,
				        });
						$('#name').val("");
					}
                },
                failure: function(errMsg) {
                	swal({
			            title: "Error",
			            text: "Connection Error!",
			            icon: "warning",
			            dangerMode: true,
			        });
                }
            });
        }
    });

    $("#hospital").submit(function(e) {
        e.preventDefault();
    });

});

</script>
<script>

    var popupEdit = document.getElementById("popupEdit");

    var span = document.getElementsByClassName("close")[0];

    span.onclick = function () {
        popupEdit.style.display = "none";
    }

    function edit(id) {

    	$.ajax({
            type: "POST",
            url: "hospital/host/get",
            data: JSON.stringify({ 'id' : id}),
            dataType: "json",
			contentType : 'application/json',
            success: function(data){
                console.log(data['name']);
                $(e_name).val(data['name']),
                $(beds).val(data['beds']),
                $(wards).val(data['wards']),
                $(rooms).val(data['rooms']),
                $(edit_id).val(data['id']),
                $(address).val(data['address']),
                $(city).val(data['city']),
                $(phone).val(data['phone']),
                popupEdit.style.display = "block";
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });

        
    }
    
    function deletes(id) {

    	$.ajax({
            type: "DELETE",
            url: "hospital/host",
            data: JSON.stringify({ 'id' : id}),
            dataType: "json",
			contentType : 'application/json',
            success: function(data){
            	if(data['success']=="1"){
					swal("Success!", "Delete Successfull!", "success");
					reload();
				}else if(data['success']=="0"){
					swal({
			            title: "Error",
			            text: "Delete Unsuccessful!",
			            icon: "warning",
			            dangerMode: true,
			        });
				}
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });

        
    }

    $(document).ready(function () {

        $("#editForm").validate({
            errorClass: "my-error-class",
            validClass: "my-valid-class",
            rules: {
            	e_name: "required",
            	wards: {
                    number: true,
                    required: true
                },
            	beds: {
                    number: true,
                    required: true
                },
                rooms: {
                    number: true,
                    required: true
                },
                address: "required",
                city: "required",
                phone: {
                	minlength: 10,
            		maxlength: 10,
                    number: true,
                    required: true
                }
            },
            messages: {
            	e_name: "Name Required!",
            	wards: {
                    number: "only numbers!",
                    required: "Wards Required!"
                },
                beds: {
                    number: "only numbers!",
                    required: "Beds Required!"
                },
                rooms: {
                    number: "only numbers!",
                    required: "Rooms Required!"
                },
                address: "Address Required!",
                city: "City Required!",
                phone: {
                	minlength: "incorrect phone number!",
            		maxlength: "incorrect phone number!",
                    number: "only numbers!",
                    required: "Phone Number Required!"
                }
            },
            submitHandler: function () {
                var datas = JSON.stringify({
                    "id" : $('#edit_id').val(),
                    "name" : $('#e_name').val(),
                    "wards" : $('#wards').val(),
                    "beds" : $('#beds').val(),
                    "rooms" : $('#rooms').val(),
                    "address" : $('#address').val(),
                    "city" : $('#city').val(),
                    "phone" : $('#phone').val()
                });

                $.ajax({
                    type: "PUT",
                    url: 'hospital/host',
                    dataType : 'json',
    				contentType : 'application/json',
    				data: datas,
                    success: function(data){
                    	if(data['success']=="1"){
    						swal("Success!", "Edit Successfull!", "success");
    						$("#editForm")[0].reset();
    						popupEdit.style.display = "none";
    						reload();
    					}else if(data['success']=="0"){
    						swal({
    				            title: "Error",
    				            text: "This Hospital is Already Exists!",
    				            icon: "warning",
    				            dangerMode: true,
    				        });
    						$('#name').val("");
    					}
                    },
                    failure: function(errMsg) {
                    	swal({
    			            title: "Error",
    			            text: "Connection Error!",
    			            icon: "warning",
    			            dangerMode: true,
    			        });
                    }
                });
            }
        });

        $("#editForm").submit(function(e) {
            e.preventDefault();
        });

    });

    
    function reload(){
    	$.ajax({
            type: "GET",
            url: "hospital/host",
            success: function(data){
            	$("#usersDiv").html(data);
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });
    }
    
    reload();
    
</script>