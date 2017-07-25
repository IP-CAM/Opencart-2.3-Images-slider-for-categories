<div id="catSlider">
    <div class="slickSlider">
        <?php
            if(!empty($slides)){
                foreach($slides as $slide){
                    ?>
                        <div class="slide">
                            <?php if(!empty($slide['link'])) { ?>
                                <a href="<?=$slide['link']?>">
                            <?php } ?>
                                    <img src="<?=$slide['image']?>" title="" />
                            <?php if(!empty($slide['link'])) { ?>
                                </a>
                            <?php } ?>
                        </div>
                    <?php
                }
            }
        ?>
    </div>
</div>
<script type="text/javascript">
    jQuery('.slickSlider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        <?php if($effect == 'fade') echo "fade: true,";?>
        <?php
            switch($bullets){
                case 0: echo "arrows: false, dots: false,"; break;
                case 1: echo "arrows: true, dots: true,"; break;
                case 2: echo "arrows: true, dots: false,"; break;
                case 3: echo "arrows: false, dots: true,"; break;
            }
        ?>
        <?php if($autoplay) echo "autoplay: true,";?>
        <?php if($autoplay_speed > 0) echo "autoplaySpeed: {$autoplay_speed},";?>
    })
</script>