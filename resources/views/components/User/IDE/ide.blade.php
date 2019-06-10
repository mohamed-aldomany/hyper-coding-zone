<!DOCTYPE html>
<html>
<head>
    <title>Web Editor</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.2/ace.js" charset="utf-8"></script>
	<link href="/css/user/userCSS.css" rel="stylesheet">
</head>
<style>
    body {
		/* margin-top:60px; */
        padding: 0;
        width: 100%;
        height: 100%;
        width: 100%;
        color: black;
        font-size: 14px;
        font-family: Verdana, Geneva, sans-serif;
        background-color: white;
    }
    #continar {
        margin-top: 50px;
        height: 100%;
        width: auto;
        white-space: nowrap;
        overflow: hidden;
        position: relative;
    }
    #htmleditor {
        height: 100%;
        min-height: 50vh;
        width: 33%;
        display: inline-block;
    }
    #csseditor {
        height: 100%;
        min-height: 50vh;
        width: 33%;
        display: inline-block;
    }
    #jseditor {
        height: 100%;
        min-height: 50vh;
        width: 33%;
        display: inline-block;
    }
    #result {
        bottom: 0;
        width: 100%;
        height: 50%;

    }
</style>
<body>
    @include('partials.navbar')
    <div id="continar" class="alert alert-success" role="alert">
        <div id="htmleditor"></div>
        <div id="csseditor"></div>
        <div id="jseditor"></div>
    </div>
    <iframe id="result" frameborder="0"></iframe>	
		
</body>
    <script type="text/javascript">
        function update(){
            var res = document.getElementById('result').contentWindow.document;
            res.open();
            res.write(eh.getValue());
            res.write('<style>'+ec.getValue()+'</style>');
            res.write(ej.getValue());
            res.close();
        }
        function seteditor(){

            /*html*/
            window.eh = ace.edit("htmleditor");
            eh.setTheme("ace/theme/chrome");
            eh.session.setMode("ace/mode/html");
            eh.setValue(`<!DOCTYPE html>
<html>
<head>
</head>

<body>
</body>

</html>`,1);

            eh.focus(); 
            eh.setOptions({
                fontSize: "12pt"
            });
            /*css*/
            window.ec = ace.edit("csseditor");
            ec.setTheme("ace/theme/chrome");
            ec.session.setMode("ace/mode/css");
            ec.setOptions({
            fontSize: "12pt",
            
        });

        /*js*/
        window.ej = ace.edit("jseditor");
        ej.setTheme("ace/theme/chrome");
        ej.session.setMode("ace/mode/javascript");
        ej.setOptions({
        fontSize: "12pt",});
            eh.getSession().on('change',function(){
                update();
            });

            ec.getSession().on('change',function(){
                update();
            });

            ej.getSession().on('change',function(){
                update();
            });
        }
        seteditor();
        update();
	</script>
	<script src="/js/user/userJS.js"></script>
</body>
</html>