<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EDGE,chrome=1">
    <meta http-equiv="content-language" content="<?php echo $this->currentLang; ?>" />
    <meta content='width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0' name='viewport' />

    <meta property="og:title" content="<?php echo $this->document->getTitle(); ?>" />
    <meta property="og:url" content="<?php echo $_SERVER['HTTP_HOST'] . $this->document->getFullPath(); ?>" />
    <meta property="og:image" content="/static/img/logo.jpg" />
    <meta property="og:description" content="<?php echo $this->document->getDescription(); ?>" />
    <meta property="og:type" content="Portfolio" />
	<title>
		<?php echo $this->document->getTitle(); ?>
	</title>
	<?php if($this->getProperty('environment') === 'prod'){ ?>
		<link rel="stylesheet" type="text/css" href="/static/dist/styles.css">
	<?php }else{ ?>
		<link rel="stylesheet" type="text/css" href="/static/css/main.css">
		<link rel="stylesheet" type="text/css" href="/static/css/pimcore.css">
	<?php } ?>
</head>
<body class="page-<?php echo $this->document->getKey()?$this->document->getKey():'home'; ?>">
	<?php if(!$this->editmode){ ?>
		<?php echo $this->template('default/menu.php'); ?>
		<?php echo $this->inc(Document::getByPath('/contact')); ?>
	<?php } ?>
	<?php echo $this->layout()->content; ?>

	<?php if(!$this->editmode){ ?>
		<?php if($this->getProperty('environment') === 'prod'){ ?>
			<script type="text/javascript" src="/static/dist/script.js"></script>
		<?php }else{ ?>
			<script type="text/javascript" src="/static/js/vendor/picturefill.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/greensock/TimelineMax.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/greensock/TweenMax.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/greensock/easing/EasePack.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/jquery-1.12.0.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/pubsub.js"></script>
			<script type="text/javascript" src="/static/js/vendor/jquery.touchSwipe.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/jquery.mousewheel.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/ScrollMagic.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/animation.gsap.min.js"></script>
			<script type="text/javascript" src="/static/js/vendor/jquery.scrollTo.min.js"></script>			
			<script type="text/javascript" src="/static/js/classes/App.js"></script>
			<script type="text/javascript" src="/static/js/classes/Utils.js"></script>
			<script type="text/javascript" src="/static/js/classes/Pages.js"></script>
			<script type="text/javascript" src="/static/js/classes/Loader.js"></script>
			<script type="text/javascript" src="/static/js/classes/Menu.js"></script>
			<script type="text/javascript" src="/static/js/classes/ParallaxSlideshow.js"></script>
			<script type="text/javascript" src="/static/js/main.js"></script>
		<?php } ?>
	<?php } ?>

</body>
</html>
