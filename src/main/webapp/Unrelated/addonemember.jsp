<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/app.js"></script>

    <script>

    function toAlert()
    { alert("This is just a test!"); }
</script>

<script>



        function  addUser(){
            alert("This is the beginning of assUser function");
            var name = document.getElementById('name').value;
            if(name==''){        alert('Name is required');        return;        }

            var address = document.getElementById('address').value;

            if(address==''){      alert('address is required');        return;        }

             var id = document.getElementById('id').value;

            if(id==''){       alert('id is required');        return;        }

             var regNo = document.getElementById('regNo').value;

            if(regNo==''){        alert('regNo is required');        return;        }

             var expiryDate = document.getElementById('expiryDate').value;

            if(expiryDate==''){        alert('expiryDate is required');        return;        }


            var url = "name=" + name + "&address="+ address + "&id="+ id + "regNo="+ regNo + "expiryDate="+ expiryDate;
            console.log(url);
            var param = {
              params:url,
              method:"POST",
              callback:function(data){
                if(data.success){
                       document.getElementById('result').innerHTML = data.message;
                                 }

                else{
                  document.getElementById('result').innerHTML = data.message;
                      }

                                     }
                          }
           AssignmentJsLib.add.call(param);
        }
    </script>
</head>
<body>
<h1>===Welcome to Member Manager ===</h1>
<h4>Use the form below to add a new member</h4>
<hr/>

<%@ include file="./Page/membernavbar.jsp" %>

    <form action="#" method="post" onsubmit="return false">
        Name: <input id="name" type="text" name="name" required/>
        Address: <input id="address" type="text" name="address" required/>
        Id: <input id="id" type="text" name="id" required/>
        Registration No: <input id="regNo" type="text" name="regNo" required/>
        ExpiryDate: <input id="expiryDate" type="text" name="expiryDate" required/>
        <input type="submit" value="Add Member"  />
        <button onclick="addUser()">Alert </button>
    </form>
<p id='result'></p>

</body>

</html>