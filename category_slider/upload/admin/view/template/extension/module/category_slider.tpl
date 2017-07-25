<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-maincategory" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-maincategory"
                      class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>

                        <div class="col-sm-10">
                            <select name="category_slider_status" id="input-status" class="form-control">
                                <?php if ($category_slider_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-effect"><?php echo $entry_effect; ?></label>

                        <div class="col-sm-10">
                            <select name="category_slider_effect" id="input-effect" class="form-control">
                                <option value="slide" <?=($category_slider_effect == 'slide') ? 'selected' : ''?>><?php echo $select_effect_slide; ?></option>
                                <option value="fade" <?=($category_slider_effect == 'fade') ? 'selected' : ''?>><?php echo $select_effect_fade; ?></option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-bullets"><?php echo $entry_bullets; ?></label>

                        <div class="col-sm-10">
                            <select name="category_slider_bullets" id="input-bullets" class="form-control">
                                <option value="0" <?=($category_slider_bullets == '0') ? 'selected' : ''?>><?php echo $select_bullets_disable; ?></option>
                                <option value="1" <?=($category_slider_bullets == '1') ? 'selected' : ''?>><?php echo $select_bullets_all; ?></option>
                                <option value="2" <?=($category_slider_bullets == '2') ? 'selected' : ''?>><?php echo $select_bullets_arrows; ?></option>
                                <option value="3" <?=($category_slider_bullets == '3') ? 'selected' : ''?>><?php echo $select_bullets_bullets; ?></option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-autoplay"><?php echo $select_autoplay; ?></label>

                        <div class="col-sm-10">
                            <select name="category_slider_autoplay" id="input-autoplay" class="form-control">
                                <?php if ($category_slider_autoplay) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-autoplay-speed"><?php echo $select_autoplay_time; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="category_slider_autoplay_speed" id="input-autoplay-speed" class="form-control" value="<?=$category_slider_autoplay_speed?>" placeholder="<?=$select_autoplay_time?>" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-depth"><?php echo $entry_max_depth; ?></label>

                        <div class="col-sm-10">
                            <select name="category_slider_max_depth" id="input-depth" class="form-control">
                                <option value="0" <?=($category_slider_max_depth == '0') ? 'selected' : ''?>>0</option>
                                <option value="1" <?=($category_slider_max_depth == '1') ? 'selected' : ''?>>1</option>
                                <option value="2" <?=($category_slider_max_depth == '2') ? 'selected' : ''?>>2</option>
                                <option value="3" <?=($category_slider_max_depth == '3') ? 'selected' : ''?>>3</option>
                                <option value="4" <?=($category_slider_max_depth == '4') ? 'selected' : ''?>>4</option>
                                <option value="5" <?=($category_slider_max_depth == '5') ? 'selected' : ''?>>5</option>
                                <option value="6" <?=($category_slider_max_depth == '6') ? 'selected' : ''?>>6</option>
                                <option value="7" <?=($category_slider_max_depth == '7') ? 'selected' : ''?>>7</option>
                                <option value="8" <?=($category_slider_max_depth == '8') ? 'selected' : ''?>>8</option>
                                <option value="9" <?=($category_slider_max_depth == '9') ? 'selected' : ''?>>9</option>
                                <option value="10" <?=($category_slider_max_depth == '10') ? 'selected' : ''?>>10</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="category_slider_width"><?=$entry_size?></label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-sm-6">
                                    <input type="text" name="category_slider_width" value="<?=$category_slider_width?>" placeholder="<?=$entry_width?>" id="category_slider_width" class="form-control">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="category_slider_height" value="<?=$category_slider_height?>" placeholder="<?=$entry_height?>" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="col-sm-10">
                    </div>
                    <div class="col-sm-2">
                        Category slider v.1.0
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
<?php echo $footer; ?>