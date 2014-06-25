<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">

  <title>Галерея</title>

  <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
  <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta charset="utf-8">
</head>
<body class="background-dark wysihtml5-supported">
    <jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Login" />
</jsp:include>

<script src="<c:url value="/resources/lib/jssor.slider.mini.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/jssor.core.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/jssor.utils.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/jssor.slider.js"/>"></script>
    <script>
        jQuery(document).ready(function ($) {
            var _SlideshowTransitions = [
            //Zoom- in
            {$Duration: 1200, $Zoom: 1, $Easing: { $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseOutQuad }, $Opacity: 2 },
            //Zoom+ out
            {$Duration: 1000, $Zoom: 11, $SlideOut: true, $Easing: { $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 },
            //Rotate Zoom- in
            {$Duration: 1200, $Zoom: 1, $Rotate: true, $During: { $Zoom: [0.2, 0.8], $Rotate: [0.2, 0.8] }, $Easing: { $Zoom: $JssorEasing$.$EaseSwing, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseSwing }, $Opacity: 2, $Round: { $Rotate: 0.5} },
            //Rotate Zoom+ out
            {$Duration: 1000, $Zoom: 11, $Rotate: true, $SlideOut: true, $Easing: { $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8} },

            //Zoom HDouble- in
            {$Duration: 1200, $Cols: 2, $Zoom: 1, $FlyDirection: 1, $Assembly: 2049, $ChessMode: { $Column: 15 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.5, $Opacity: 2 },
            //Zoom HDouble+ out
            {$Duration: 1200, $Cols: 2, $Zoom: 11, $SlideOut: true, $FlyDirection: 1, $Assembly: 2049, $ChessMode: { $Column: 15 }, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 4, $Opacity: 2 },

            //Rotate Zoom- in L
            {$Duration: 1200, $Zoom: 1, $Rotate: true, $During: { $Left: [0.2, 0.8], $Zoom: [0.2, 0.8], $Rotate: [0.2, 0.8] }, $FlyDirection: 1, $Easing: { $Left: $JssorEasing$.$EaseSwing, $Zoom: $JssorEasing$.$EaseSwing, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseSwing }, $ScaleHorizontal: 0.6, $Opacity: 2, $Round: { $Rotate: 0.5} },
            //Rotate Zoom+ out R
            {$Duration: 1000, $Zoom: 11, $Rotate: true, $SlideOut: true, $FlyDirection: 2, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $ScaleHorizontal: 4, $Opacity: 2, $Round: { $Rotate: 0.8} },
            //Rotate Zoom- in R
            {$Duration: 1200, $Zoom: 1, $Rotate: true, $During: { $Left: [0.2, 0.8], $Zoom: [0.2, 0.8], $Rotate: [0.2, 0.8] }, $FlyDirection: 2, $Easing: { $Left: $JssorEasing$.$EaseSwing, $Zoom: $JssorEasing$.$EaseSwing, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseSwing }, $ScaleHorizontal: 0.6, $Opacity: 2, $Round: { $Rotate: 0.5} },
            //Rotate Zoom+ out L
            {$Duration: 1000, $Zoom: 11, $Rotate: true, $SlideOut: true, $FlyDirection: 1, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $ScaleHorizontal: 4, $Opacity: 2, $Round: { $Rotate: 0.8} },

            //Rotate HDouble- in
            {$Duration: 1200, $Cols: 2, $Zoom: 1, $Rotate: true, $FlyDirection: 5, $Assembly: 2049, $ChessMode: { $Column: 15 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseOutQuad, $Rotate: $JssorEasing$.$EaseInCubic }, $ScaleHorizontal: 0.5, $ScaleVertical: 0.3, $Opacity: 2, $Round: { $Rotate: 0.7} },
            //Rotate HDouble- out
            {$Duration: 1000, $Cols: 2, $Zoom: 1, $Rotate: true, $SlideOut: true, $FlyDirection: 5, $Assembly: 2049, $ChessMode: { $Column: 15 }, $Easing: { $Left: $JssorEasing$.$EaseInExpo, $Top: $JssorEasing$.$EaseInExpo, $Zoom: $JssorEasing$.$EaseInExpo, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $ScaleHorizontal: 0.5, $ScaleVertical: 0.3, $Opacity: 2, $Round: { $Rotate: 0.7} },
            //Rotate VFork in
            {$Duration: 1200, $Rows: 2, $Zoom: 11, $Rotate: true, $FlyDirection: 6, $Assembly: 2049, $ChessMode: { $Row: 28 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseOutQuad, $Rotate: $JssorEasing$.$EaseInCubic }, $ScaleHorizontal: 4, $ScaleVertical: 2, $Opacity: 2, $Round: { $Rotate: 0.7} },
            //Rotate HFork in
            {$Duration: 1200, $Cols: 2, $Zoom: 11, $Rotate: true, $FlyDirection: 5, $Assembly: 2049, $ChessMode: { $Column: 19 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseOutQuad, $Rotate: $JssorEasing$.$EaseInCubic }, $ScaleHorizontal: 1, $ScaleVertical: 2, $Opacity: 2, $Round: { $Rotate: 0.8} }
            ];

            var _CaptionTransitions = [];
            _CaptionTransitions["L"] = { $Duration: 800, $FlyDirection: 1, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL1"] = { $Duration: 800, $FlyDirection: 2, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL2"] = { $Duration: 800, $FlyDirection: 4, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL3"] = { $Duration: 800, $FlyDirection: 8, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL4"] = { $Duration: 800, $FlyDirection: 5, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL5"] = { $Duration: 800, $FlyDirection: 6, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL6"] = { $Duration: 800, $FlyDirection: 9, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL7"] = { $Duration: 800, $FlyDirection: 10, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL8"] = { $Duration: 800, $FlyDirection: 2, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL9"] = { $Duration: 800, $FlyDirection: 4, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL10"] = { $Duration: 800, $FlyDirection: 8, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL11"] = { $Duration: 800, $FlyDirection: 5, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL12"] = { $Duration: 800, $FlyDirection: 6, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL13"] = { $Duration: 800, $FlyDirection: 9, $Easing: $JssorEasing$.$EaseInCubic };
                        _CaptionTransitions["BL0"] = { $Duration: 800, $FlyDirection: 10, $Easing: $JssorEasing$.$EaseInCubic };

            var options = {
                $CaptionSliderOptions: {
                                    $Class: $JssorCaptionSlider$,
                                    $CaptionTransitions: _CaptionTransitions,
                                    $PlayInMode: 0,
                                    $PlayOutMode: 0
                },
                $AutoPlay: false,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false

                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 600,                                //Specifies default duration (swipe) for slide in milliseconds


                $ArrowNavigatorOptions: {                       //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                },

                $ThumbnailNavigatorOptions: {                       //[Optional] Options to specify and enable thumbnail navigator or not
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $ActionMode: 1,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $Lanes: 2,                                      //[Optional] Specify lanes to arrange thumbnails, default value is 1
                    $SpacingX: 14,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $SpacingY: 12,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 6,                             //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 156,                          //[Optional] The offset position to park thumbnail
                    $Orientation: 2                                //[Optional] Orientation to arrange thumbnails, 1 horizental, 2 vertical, default value is 1
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth)
                    jssor_slider1.$SetScaleWidth(Math.max(Math.min(parentWidth, 960), 300));
                else
                    window.setTimeout(ScaleSlider, 30);
            }

            ScaleSlider();

            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                $(window).bind('resize', ScaleSlider);
            }


            //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
            //    $(window).bind("orientationchange", ScaleSlider);
            //}
            //responsive code end
        });
    </script>
    <!-- Jssor Slider Begin -->
    <!-- You can move inline styles to css file or css block. -->

<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Галерея</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">
                <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 960px;
                    height: 480px; background: #191919; overflow: hidden;">

                    <!-- Loading Screen -->
                    <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                        <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                            background-color: #000000; top: 0px; left: 0px;width: 100%;height:100%;">
                        </div>
                        <div style="position: absolute; display: block; background: url(resources/img/loading.gif) no-repeat center center;
                            top: 0px; left: 0px;width: 100%;height:100%;">
                        </div>
                    </div>

                    <!-- Slides Container -->
                    <div u="slides" style="cursor: move; position: absolute; left: 240px; top: 0px; width: 720px; height: 480px; overflow: hidden;">
                        <c:forEach items="${sliderImg}" var="item">
                            <div>
                              <img u="image" src="<c:url value="/resources/img/fashionPictures/${item.link}"/>">
                                <div u="caption" t="${item.slider}" style="position: absolute; top: 30px; left: 30px; width: 50px;height: 50px;">
                                    <span class="label label-info"><h2>${item.caption}</h2></span>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                    <!-- Arrow Navigator Skin Begin -->
                    <style>
                        /* jssor slider arrow navigator skin 05 css */
                        /*
                        .jssora05l              (normal)
                        .jssora05r              (normal)
                        .jssora05l:hover        (normal mouseover)
                        .jssora05r:hover        (normal mouseover)
                        .jssora05ldn            (mousedown)
                        .jssora05rdn            (mousedown)
                        */
                        .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn
                        {
                            position: absolute;
                            cursor: pointer;
                            display: block;
                            background: url(resources/img/a17.png) no-repeat;
                            overflow:hidden;
                        }
                        .jssora05l { background-position: -10px -40px; }
                        .jssora05r { background-position: -70px -40px; }
                        .jssora05l:hover { background-position: -130px -40px; }
                        .jssora05r:hover { background-position: -190px -40px; }
                        .jssora05ldn { background-position: -250px -40px; }
                        .jssora05rdn { background-position: -310px -40px; }
                    </style>
                    <!-- Arrow Left -->
                    <span u="arrowleft" class="jssora05l" style="width: 40px; height: 40px; top: 158px; left: 248px;">
                    </span>
                    <!-- Arrow Right -->
                    <span u="arrowright" class="jssora05r" style="width: 40px; height: 40px; top: 158px; right: 8px">
                    </span>
                    <!-- Arrow Navigator Skin End -->

                    <!-- Thumbnail Navigator Skin 02 Begin -->
                    <div u="thumbnavigator" class="jssort02" style="position: absolute; width: 240px; height: 480px; left:0px; bottom: 0px;">

                        <!-- Thumbnail Item Skin Begin -->
                        <style>
                            /* jssor slider thumbnail navigator skin 02 css */
                            /*
                            .jssort02 .p            (normal)
                            .jssort02 .p:hover      (normal mouseover)
                            .jssort02 .pav          (active)
                            .jssort02 .pav:hover    (active mouseover)
                            .jssort02 .pdn          (mousedown)
                            */
                            .jssort02 .w
                            {
                                position: absolute;
                                top: 0px;
                                left: 0px;
                                width: 100%;
                                height: 100%;
                            }
                            .jssort02 .c
                            {
                                position: absolute;
                                top: 0px;
                                left: 0px;
                                width: 95px;
                                height: 62px;
                                border: #000 2px solid;
                            }
                            .jssort02 .p:hover .c, .jssort02 .pav:hover .c, .jssort02 .pav .c
                            {
                                background: url(resources//img/t01.png) center center;
                                border-width: 0px;
                                top: 2px;
                                left: 2px;
                                width: 95px;
                                height: 62px;
                            }
                            .jssort02 .p:hover .c, .jssort02 .pav:hover .c
                            {
                                top: 0px;
                                left: 0px;
                                width: 97px;
                                height: 64px;
                                border: #fff 1px solid;
                            }
                        </style>
                        <div u="slides" style="cursor: move;">
                            <div u="prototype" class="p" style="position: absolute; width: 99px; height: 66px; top: 0; left: 0">
                                <div class=w><thumbnailtemplate style=" width: 100%; height: 100%; border: none;position:absolute; top: 0; left: 0;"></thumbnailtemplate></div>
                                <div class=c>
                                </div>
                            </div>
                        </div>
                        <!-- Thumbnail Item Skin End -->
                    </div>
                    <!-- Thumbnail Navigator Skin End -->
                </div>
                <!-- Jssor Slider End -->
        </section>
    </div>
</div>
</body>
</html>