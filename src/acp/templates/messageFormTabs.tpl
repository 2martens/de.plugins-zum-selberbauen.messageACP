<div class="tabMenuContainer" data-active="{*$activeTabMenuItem*}" data-store="activeTabMenuItem">
	<nav class="tabMenu">
		<ul>
			{if MODULE_SMILEY}<li><a href="#smilies" title="{lang}wcf.smiley.smilies{/lang}">{lang}wcf.smiley.smilies{/lang}</a></li>{/if}
			{if MODULE_ATTACHMENT && $attachmentHandler !== null}<li><a href="#attachments" title="{lang}wcf.attachment.attachments{/lang}">{lang}wcf.attachment.attachments{/lang}</a></li>{/if}
			<li><a href="#settings" title="{lang}wcf.message.settings{/lang}">{lang}wcf.message.settings{/lang}</a></li>
			{event name='tabMenuItems'}
		</ul>
	</nav>
	
	{if MODULE_SMILEY}{include file='messageFormSmilies'}{/if}
	{if MODULE_ATTACHMENT && $attachmentHandler !== null}{include file='messageFormAttachments'}{/if}
	
	{include file='messageFormSettings'}
	
	{event name='tabMenuContent'}
</div>

<script type="text/javascript">
	//<![CDATA[
	$(function() {
		WCF.TabMenu.init();
	});
	//]]>
</script>