<section class="contact">
    <div class="white-bg"></div>
    <div class="content">
        <div class="typo typo-1">
            GAB
        </div>
        <div class="typo typo-2">
            BB
        </div>
        <div class="typo typo-3">
            OS
        </div>
        <div class="text">
            <?php echo $this->wysiwyg('text', array('enterMode' => 2)); ?>
            <div class="links">
                <ul>
                <?php while ($this->block('links')->loop()) { ?>
                    <li>
                        <?php echo $this->link('link'); ?>
                    </li>
                <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</section>
