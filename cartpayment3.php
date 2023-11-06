
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verification</title>
    
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .btnSubmit{
      background:#4cb7ff;
      padding: 8px 20px;
      border:#47abef 1px solid;
      border-radius:3px;
      width: 100%;
      color:#fff;
    }

    form{
      position: absolute;
      top: 50%;
      left:50%;
    }
</style>
<body>

   <div class="final-container">
     <form action="" method="post">
        <input type="submit" name="submit" value="Proceed To Pay">
     </form>
     <?php
       if(isset($_POST['submit']))
       {
        echo"
          <script>
             alert('Payment Successfull');
             window.location.href='index.php';
          </script>
        
        ";
        
       }
     ?>
   </div>























   <!-- <div class="container">
     <div class="error"></div>
     <form action="" id="frm-mobile-verification">
       <div class="form-heading">Mobile Number Verification</div>
       <div class="form-row">
          <input type="number"  id="mobile" class="form-input" placeholder="Enter 10 digit mobile">
       </div>
       <input type="button" value="Send OTP" class="btnSubmit" onClick="sendOTP();">
     </form>
   </div> -->

   <!-- <script src="jquery-1.10.2.min.js" type="text/javascript"></script> -->
   <script src="js/verification.js"></script>
</body>
</html>