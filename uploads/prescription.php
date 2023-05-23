<div class="center-div-register w-100" style="margin-top:80px;">
    <div class="card-wrapper w-100">
        <div class="card-style w-100" style="border-radius:25px; box-shadow: 0px 0px 10px 0px; ">
            <div id="login-form">
                <h2 class="material-header" style="text-align : center;">Upload Prescription</h2>
                <form action="" method="post" enctype = "multipart/form-data">
                    Select image file to upload:
                    <input type="file" class="w-60 material-input" name="image">
                    <?php
                        if($user->get_session()){
                    ?>
                    <input type="submit" class="material-button-main" value="Upload Image" name="submit">
                    <br><br><br>
                    <?php
                            if(isset($_FILES['image'])){
                                date_default_timezone_set('Asia/Calcutta');
                                $date = date('d-m-Y-H-i-s', time());
                                $username=$_SESSION['c_username'];
                                $errors= array();
                                $file_name = $_FILES['image']['name'];
                                $file_size =$_FILES['image']['size'];
                                $file_type=$_FILES['image']['type'];
                                $file_tmp =$_FILES['image']['tmp_name'];
                                $tmp = explode('.', $_FILES['image']['name']);
                                $newfilename = $username . '-' . $date . '-' . end($tmp);
                                $file_ext=strtolower(end($tmp));
                                $extensions= array("jpeg","jpg","png");
                                $check = getimagesize($file_tmp);
                                            
                                if($check !== false) {
                                    echo 'File submitted is a valid image file.';
                                } else {
                                    $errors[]="invalid image";
                                    echo 'Not a valid image file.<br>Please check image once before uploading again.';
                                }
        
                                if(in_array($file_ext,$extensions)=== false){
                                    $errors[]="invalid extension";
                                    echo '<br>Extension not allowed, please choose a JPG or PNG file.';
                                }
                                    
                                if($file_size > 10485760){
                                    $errors[]='file size exceeded';
                                    echo '<br>File size must not exceed 10 MB';
                                }
                                    
                                if(empty($errors)==true){
                                    move_uploaded_file($file_tmp,"prescription/" . $newfilename.$file_name);
                                    echo "<br>File Uploaded Successfully";
                                }
                    ?>
                    <br><br>
                    <p>
                        <ul>
                            <strong><li>Sent File : </strong><?php echo $_FILES['image']['name']; ?></li>
                            <strong><li>File Size : </strong><?php echo $_FILES['image']['size']/1048576; ?> MB </li>
                            <strong><li>File Type : </strong><?php echo $_FILES['image']['type'] ?></li>
                        </ul>
                    </p>
                    <?php
                            }
                        }else {
                    ?>
                <table>
                    <tr class="product-link select-product" onclick="div_show()"> 
                        <td style="border-radius: 2px;float: right;font-size: 12px;color: white;background-color: #58b072;font-weight: 500;padding: 8px 18px 8px 18px;
                        letter-spacing: 0.5px;text-align: center;margin:20px 0px 10px 400px;text-transform: uppercase;">Upload Image</td>
                    </tr>
                </table>                   
                    <?php
                        }
                    ?>
                    <br>
                    <p>It might take 1-2 hours for our doctors to examine your prescription and suggest respective medicines with proper dosage.</p>
                    <p>You will get a notification once the doctor complete examining your prescription and prepares dosage with suggested medicines.</p>
                </form>
            </div>
        </div>
    </div>
</div>