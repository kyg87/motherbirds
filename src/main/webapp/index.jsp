<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>Ion.RangeSlider - test</title>
<!--     <link rel="stylesheet" href="resource/css/normalize.css" />
    <link rel="stylesheet" href="resource/css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="resource/css/ion.rangeSlider.skinFlat.css" /> -->
    <link href="/Motherbirds/resource/css/normalize.css" type="text/css" rel="stylesheet" />
    <link href="/Motherbirds/resource/css/ion.rangeSlider.css" type="text/css" rel="stylesheet" />
    <link href="/Motherbirds/resource/css/ion.rangeSlider.skinFlat.css" type="text/css" rel="stylesheet" />
</head>
<body>


<!-- Page contents -->
<div style="position: relative; padding: 200px;">

    <div>
        <input type="text" id="range" value="" name="range" />
    </div>

</div>




<!-- All JS -->
<script src="resource/js/jquery-1.12.3.min.js"></script>
<script src="resource/js/ion.rangeSlider.js"></script>

<script>

    $(function () {

        $("#range").ionRangeSlider({
            hide_min_max: true,
            keyboard: true,
            min: 0,
            max: 5000,
            from: 1000,
            to: 4000,
            type: 'double',
            step: 1,
            prefix: "$",
            grid: true
        });

    });
</script>




</body>
</html>
