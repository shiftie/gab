<section class="page home" data-page="home">
    <div class="parallax-slideshow">
        <?php while($this->block('home-slider')->loop()){ ?>
            <?php
            if($this->editmode){
                ?>
                <div class="row">
                    <div class="large-6 columns">
                        <?php echo $this->image('test', array('thumbnail' => 'responsive')); ?>
                    </div>
                    <div class="large-6 columns">
                        <?php
                        echo $this->input('title', array('placeholder' => 'Title', 'class' => 'input'));
                        echo $this->wysiwyg('content', [
                            'width' => 500,
                            'height' => 250
                        ]);
                        echo $this->href('link', array('placeholder' => 'Link'));
                        ?>
                    </div>
                </div>
                <?php
            }else{
                ?>
                <div class="wrapper <?php if($this->block('home-slider')->getCurrent() === 0){ ?>current<?php } ?>">
                    <a href="<?php echo $this->href('link'); ?>">See Project</a>
                    <div class="cover-container">
                        <div class="cover responsive-bg">
                            <?php echo $this->image('test', array('thumbnail' => 'responsive')); ?>
                        </div>
                    </div>
                    <article class="content-container">
                        <div class="content">
                            <header class="title-container">
                                <div class="title">
                                    <?php echo $this->input('title'); ?>
                                </div>
                            </header>
                            <div class="description-container">
                                <div class="description">
                                    <?php echo $this->wysiwyg('content'); ?>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <?php
            }
            ?>
        <?php } ?>
        </div>
</section>
