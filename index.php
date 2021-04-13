<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="https://freepngimg.com/thumb/dollar/64020-dollar-gold-sign-free-transparent-image-hd-thumb.png">
<!-- <a href="https://www.freeiconspng.com/img/5646">Cash Payment Icon</a> -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Aplikasi SPP</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="AdminLTE-3.1.0/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="AdminLTE-3.1.0/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="AdminLTE-3.1.0/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  </head>
<body class="hold-transition login-page" style="background-image: url('https://images.hdqwalls.com/download/binary-code-abstract-lu-1366x768.jpg');  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;">
<div class="login-box">
  <div class="login-logo">
    <a href="AdminLTE-3.1.0/index2.html" style="color:white"><b>APLIKASI SPP</b></a>
  </div>
  
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
     <?php
		if(isset($_GET['pesan'])){
			if($_GET['pesan']=="regisok"){
				echo '<div class="alert alert-success alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-exclamation-triangle"></i> Sukses!</h5>
                  Registrasi berhasil!
                </div>';
			}else if($_GET['pesan']=="gagal"){
				echo '<div class="alert alert-warning alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-exclamation-triangle"></i> Gagal!</h5>
                  Username / Password tidak tepat!
                </div>     ';
			}
			else if($_GET['pesan']=="logout"){
				echo '<p class="login-box-msg">Anda berhasil logout</p>';
			}else {
				echo '<p class="login-box-msg">Login User</p>';
			}
		
		}else {
				echo '<p class="login-box-msg">Login User</p>';
			}
		?>	 
				 <form action="cek_login.php" method="post">
        <div class="input-group mb-3">
          <input type="text" name="username" class="form-control" placeholder="Username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
		    <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
        </div>
      </form>
	  </div>

<!-- jQuery -->
<script src="AdminLTE-3.1.0/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="AdminLTE-3.1.0/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="AdminLTE-3.1.0/dist/js/adminlte.min.js"></script>

</body>
</html>
