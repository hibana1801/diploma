<?php
session_start();

if(!isset($_SESSION['userId']))
{
  header('location:login.php');
}
 ?>
<?php require "assets/function.php" ?>
<?php require 'assets/db.php';?>
<!DOCTYPE html>
<html>
<head>
  <title><?php echo siteTitle(); ?></title>
  <?php require "assets/autoloader.php" ?>
  <style type="text/css">
  <?php include 'css/customStyle.css'; ?>

  </style>
  <?php 
  $notice="";
   ?>
</head>
<body style="background: #ECF0F5;padding:0;margin:0">
<div class="dashboard" style="position: fixed;width: 18%;height: 100%;background:#222D32">
  <div style="background:#357CA5;padding: 14px 3px;color:white;font-size: 15pt;text-align: center;text-shadow: 1px 1px 11px black">
    <a href="index.php" style="color: white;text-decoration: none;"><?php echo strtoupper(siteName()); ?> </a>
  </div>

  <div style="background: #1A2226;font-size: 10pt;padding: 11px;color: #79978F">MAIN NAVIGATION</div>
  <div>
    <div style="background:#1E282C;color: white;padding: 13px 17px;border-left: 3px solid #3C8DBC;"><span><i class="fa fa-dashboard fa-fw"></i> Control panel</span></div>
    <div class="item">
      <ul class="nostyle zero">
        <a href="index.php"><li ><i class="fa fa-circle-o fa-fw"></i> Main</li></a>
        <a href="inventeries.php"><li><i class="fa fa-circle-o fa-fw"></i> Accounting</li></a>
       <a href="addnew.php"><li style="color: white"><i class="fa fa-circle-o fa-fw"></i> Add a new position</li></a>
        <a href="reports.php"><li><i class="fa fa-circle-o fa-fw"></i> Report</li></a>
      </ul><
    </div>
  </div>
  <div style="background:#1E282C;color: white;padding: 13px 17px;border-left: 3px solid #3C8DBC;"><span><i class="fa fa-globe fa-fw"></i> Settings</span></div>
  <div class="item">
      <ul class="nostyle zero">
          <a href="sitesetting.php"><li><i class="fa fa-circle-o fa-fw"></i> Application settings</li></a>
          <a href="profile.php"><li><i class="fa fa-circle-o fa-fw"></i> Profile settings</li></a>
          <a href="accountSetting.php"><li><i class="fa fa-circle-o fa-fw"></i> Account settings</li></a>
          <a href="logout.php"><li><i class="fa fa-circle-o fa-fw"></i> Logout</li></a>
      </ul><
    </div>
</div>
<div class="marginLeft" >
  <div style="color:white;background:#3C8DBC" >
    <div class="pull-right flex rightAccount" style="padding-right: 11px;padding: 7px;">
      <div><img src="photo/<?php echo $user['pic'] ?>" style='width: 41px;height: 33px;' class='img-circle'></div>
      <div style="padding: 8px"><?php echo ucfirst($user['name']) ?></div>
    </div>
    <div class="clear"></div>
  </div>
<div class="account" style="display: none;">
  <div style="background: #3C8DBC;padding: 22px;" class="center">
    <img src="photo/<?php echo $user['pic'] ?>" style='width: 100px;height: 100px; margin:auto;' class='img-circle img-thumbnail'>
    <br><br>
    <span style="font-size: 13pt;color:#CEE6F0"><?php echo $user['name'] ?></span><br>
    <span style="color: #CEE6F0;font-size: 10pt">User since:<?php echo $user['date']; ?></span>
  </div>
  <div style="padding: 11px;">
    <a href="profile.php"><button class="btn btn-default" style="border-radius:0">Profile</button>
    <a href="logout.php"><button class="btn btn-default pull-right" style="border-radius: 0">Log out</button></a>
  </div>
</div>
<?php 
if (isset($_POST['saveProduct'])) {
if ($con->query("insert into inventeries (catId,supplier,name,unit,price,quantity,description,company) values ('$_POST[catId]','$_POST[supplier]','$_POST[name]','$_POST[unit]','$_POST[price]','$_POST[quantity]','$_POST[discription]','$_POST[company]')")) {
  $notice ="<div class='alert alert-success'>Successfully Saved</div>";
}
else{
  $notice ="<div class='alert alert-danger'>Error is:".$con->error."</div>";
}
}


if (isset($_POST['updateItem'])) {
  $itemID=$_GET['item'];
if ($con->query("Update inventeries set supplier='$_POST[supplier]',name='$_POST[name]' ,unit='$_POST[unit]',price='$_POST[price]',quantity='$_POST[quantity]',company='$_POST[company]' where id=$itemID")) {
  $notice ="<div class='alert alert-success'>Added successfully</div>";

}
else{
  $notice ="<div class='alert alert-danger'>Error is:".$con->error."</div>";
}
}


if(isset($_GET['item']))  {
  $itemID=$_GET['item'];
  $row=$con->query("select * from inventeries where id=$itemID");
  $row=$row->fetch_assoc();
 ?>

<div class="content2">
<ol class="breadcrumb ">
        <li><a href="index.php"><i class="fa fa-dashboard"></i> Control panel</a></li>
        <li class="active">Edit position</li>
    </ol>
    <?php echo $notice ?>
    <div style="width: 55%;margin: auto;padding: 22px;" class="well well-sm center">

      <h4>Edit position</h4><hr>
      <form method="POST">
         <div class="form-group">
            <label for="some" class="col-form-label">Name</label>
          <input type="text" name="name" class="form-control" id="some" value=<?php echo $row['name']; ?> required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Dosage</label>
            <input type="text" name="unit" placeholder="i.e 50mg" class="form-control" id="some" value=<?php echo $row['unit']; ?> required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Price per unit</label>
            <input type="number" name="price"  class="form-control" id="some" value=<?php echo $row['price']; ?> required>
          </div>
    <div class="form-group">
            <label for="some" class="col-form-label">Number</label>
            <input type="number" name="quantity"  class="form-control" id="some" value=<?php echo $row['quantity']; ?> required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Doctor`s name</label>
            <input type="text" name="supplier"  class="form-control" id="some" value=<?php echo $row['supplier']; ?> required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Name of the hospital</label>
            <input type="text" name="company"  class="form-control" id="some" value=<?php echo $row['company']; ?> required>
          </div>

          <div class="center">
            <button type="submit" name="updateItem" class="btn btn-primary">Save</button>
          </div>
        </form>
    </div>
</div>
<?php 
}
else {
 ?>



  <div class="content2">
<ol class="breadcrumb ">
        <li><a href="index.php"><i class="fa fa-dashboard"></i> Control panel</a></li>
        <li class="active">Add a new position</li>
    </ol>
    <?php echo $notice ?>
    <div style="width: 55%;margin: auto;padding: 22px;" class="well well-sm center">

      <h4>Add New Product</h4><hr>
      <form method="POST">
         <div class="form-group">
            <label for="some" class="col-form-label">Name</label>
            <input type="text" name="name" class="form-control" id="some" required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Dosage</label>
            <input type="text" name="unit" placeholder="i.e 50mg" class="form-control" id="some" required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Price per unit</label>
            <input type="number" name="price"  class="form-control" id="some" required>
          </div>
    <div class="form-group">
            <label for="some" class="col-form-label">Number</label>
            <input type="number" name="quantity"  class="form-control" id="some" required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Doctor's name</label>
            <input type="text" name="supplier"  class="form-control" id="some" required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Name of the hospital</label>
            <input type="text" name="company"  class="form-control" id="some" required>
          </div>
          <div class="form-group">
            <label for="some" class="col-form-label">Choose a category</label>
            <select class="form-control" required name="catId">
              <option selected disabled value="">Please select a category</option>
            <?php getAllCat(); ?>
              
            </select>
          </div>
           <div class="form-group">
            <label for="some" class="col-form-label">Description</label>
          <textarea class="form-control" name="discription" required placeholder="Enter a description here"></textarea>
          </div>
          <div class="center">
            <button type="submit" name="saveProduct" class="btn btn-primary">Save</button>
            <button type="reset" class="btn btn-success">Cancel</button>
          </div>
        </form>
    </div>
</div>
<?php } ?>
</body>
</html>

<script type="text/javascript">
  $(document).ready(function(){$(".rightAccount").click(function(){$(".account").fadeToggle();});});
</script>

