<!DOCTYPE html>
<head>
    <title>Add Student</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
</head>

<body>
<br><br>
<div>

    <label>Name</label>
    <g:textField name = "name" value = "" id = "name" />
    <br><br>
    <label>Age</label>
    <g:textField name = "age" value = "" id = "age"/>
    <br><br>
    <button id = "button" name = "button" onClick = "addStd()">Add</button>

</div>
</body>

<script>
    function addStd() {
        $(document).ready(function() {
            var name = $('#name').val();
            var age = $('#age').val();


            if(name == "") { //empty constraint
                alert('Name field is empty');
                return false;
            }

            if(age == "") { //empty contraint of age field
                alert('Age field is empty');
                return false;
            }

            var conv_to_num = Number(age);  //Converting String input to number

            if(isNaN(conv_to_num) || !Number.isInteger(conv_to_num)) //Checking if age is integer
            {
                alert("Age should be integer");
                return false;
            }

            var URL="${createLink(controller:'sms',action:'addStudent')}"

            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{name:name, age:age},
                success:function(data)
                {
                    alert(data);
                }
            })

        })
    }

</script>


</html>