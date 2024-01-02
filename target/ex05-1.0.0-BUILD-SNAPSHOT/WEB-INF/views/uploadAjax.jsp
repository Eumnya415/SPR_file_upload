<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upload with Ajax</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function (){
            $("#uploadBtn").on("click", function (e){
                let formData = new FormData();
                let inputFile = $("input[name='uploadFile']");
                let files = inputFile[0].files;
                console.log(files);

                //add File Data to formData
                for(var i = 0; i < files.length; i++){

                    formData.append("uploadFile", files[i]);

                }

                $.ajax({
                    url: '/uploadAjaxAction',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                        alert("Uploaded");
                    }
                });//$.ajax
            });
        });
    </script>
</head>
<body>
<h1>Upload with Ajax</h1>


<div class='uploadDiv'>
    <input type='file' name='uploadFile' multiple>
</div>

<button id="uploadBtn">Upload</button>

</body>
</html>
