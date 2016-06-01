<?php echo $header; ?>
    <div class="container">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php if(isset($breadcrumb['href'])): ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php else:?>
                    <li><?php echo $breadcrumb['text']; ?></li>
                <?php endif;?>
            <?php } ?>
        </ul>
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
        <?php } ?>
        <div class="row"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
                <h1><?php echo $heading_title; ?></h1>
                <form action="<?php echo $save; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                    <fieldset>
                        <legend><?php echo $text_your_details; ?></legend>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $name_entry; ?> </label>
                            <div class="col-sm-10">
                                <input type="text" name="name" value="<?php echo isset($name)?$name:''; ?>" placeholder="<?php echo $name_entry; ?>" id="input-name" class="form-control" />
                                <?php if (isset($error_name)) { ?>
                                    <div class="text-danger"><?php echo $error_name; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $material_entry; ?> </label>
                            <div class="col-sm-10">
                                <?php foreach($materials as $material):?>
                                    <div>
                                    <input type="checkbox" name="material[]" value="<?=$material['material_id']?>" id="input-material_<?=$material['material_id']?>" />
                                    <?=$material['name'];?>
                                        <div style="display: none;">
                                            <?=$material['desciption'];?>
                                        </div>
                                    </div>
                                <?php endforeach;?>
                                <div>
                                    <input type="checkbox" name="material[-1]" value="-1" id="input-material_other" />
                                    Другое
                                        <input type="text" name="material_other" value="" placeholder="Введите наименование материала" id="input-material-other" class="form-control" style="display: none" />
                                </div>
                                <?php if (isset($error_material)) { ?>
                                    <div class="text-danger"><?php echo $error_material; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <script>
                            $("#input-material_other").click(function(){
                                $("#input-material-other").toggle();
                            });
                        </script>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $size_entry; ?> </label>
                            <div class="col-sm-10">
                                <input type="text" name="size" value="<?php echo isset($name)?$name:''; ?>" placeholder="050x200" id="input-size" class="form-control size" />
                                <a href="<?=$shtanec_popup?>" class="fancybox" data-toggle="modal" data-target="#myModal">Выбрать штанец</a>
                                <?php if (isset($error_size)) { ?>
                                    <div class="text-danger"><?php echo $error_size; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <script>
                            $("#input-size").inputmask('999x999');
                        </script>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-firstname">Описание </label>
                            <div class="col-sm-10">
                                <textarea type="text" rows="5" name="description" placeholder="Описание" id="input-description" class="form-control description" ><?php echo isset($description)?$description:''; ?></textarea>
                            </div>
                        </div>

                        <!--span class="btn btn-success fileinput-button">
                            <i class="glyphicon glyphicon-plus"></i>
                            <span>Select files...</span>
                            <input id="fileupload" type="file" name="files[]" multiple>
                        </span>
                        <div id="progress" class="progress">
                            <div class="progress-bar progress-bar-success"></div>
                        </div>

                        <div id="files" class="files"></div-->

                    </fieldset>
                    <div class="buttons clearfix">
                        <div class="pull-right">
                            <input type="submit" value="Сохранить" class="btn btn-primary" />
                        </div>
                    </div>
                </form>
                <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
    </div>
<script>
    $('#fileupload').fileupload({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        autoUpload: false,
    });
</script>
<?php echo $footer; ?>