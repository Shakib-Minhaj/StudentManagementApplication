<!DOCTYPE html>
<head>
    <title>Search Page</title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
</head>

<body>
<div>
    <br><br>
    <label>Name</label>
    <g:textField name = "search" id = "search" />
    <br><br>
    <button id = "button" name = "button">Search</button>

    <p id = "hidden"></p>
</div>
</body>

<script>

    $(document).ready(function(){

        $('#button').click(function() {

            var URL="${createLink(controller:'sms',action:'searchStudent')}"
            var studentSearch = $('#search').val();

            if(studentSearch == "") { //empty constraint
                alert('Search box is empty');
                return false;
            }

            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{search:studentSearch},
                success:function(data)
                {
                    $('#hidden').html(data);
                }
            })
        })

    })
</script>
</html>