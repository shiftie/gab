<section class="page project <?php if(!$this->editmode){ echo  \Pimcore\File::getValidFilename($this->input('project-title')); } ?>" data-page="project">
	<article>
		<header>
			<h1>
				<?php
				echo $this->input('project-title', array('placeholder' => 'Title'));
				?>
			</h1>
			<div class="responsive-bg">
				<?php echo $this->image('test', array('thumbnail' => 'responsive')); ?>
			</div>
			<?php if(!$this->editmode){ ?>
				<button class="scroll-indicator">
					Scroll to Explore
				</button>
			<?php } ?>
		</header>
		<div class="content">
			<?php while($this->block('contentblock')->loop()) { ?>
				<?php if($this->editmode) { ?>
					<?php echo $this->select('blocktype',array(
						'store' => array(
							array('one', 'one column'),
							array('two', 'two columns'),
							array('three', 'three columns'),
							array('four', 'four columns'),
							array('one-full', 'one-full column'),
						),
						'reload' => true
					)); ?>
				<?php } ?>

				<?php if(!$this->select('blocktype')->isEmpty()) {
					echo $this->template('default/blocks/project/'.$this->select('blocktype')->getData().'.php');
				} ?>
			<?php } ?>
		</div>
	</article>
	<?php if(!$this->editmode){ ?>
		<section class="next-project">
			<?php
			$key = $this->document->key;
			$parent = Document::getById($this->document->parentId);
			$i = 0;
			foreach ($parent->getChilds() as $child) {
				if($next){
					$next = $child;
					break;
				}else if($child->key === $key){
					if($i >= count($parent->getChilds()) - 1){
						$next = $parent->getChilds()[0];
					}else{
						$next = $parent->getChilds()[$i + 1];
					}
				}
				$i++;
			}
			?>

			<div>
				Next project
			</div>
			<a href="<?php echo $next->getFullPath(); ?>">
				<?php echo $next->getElement('project-title'); ?>
			</a>
		</section>
	<?php } ?>
</section>
