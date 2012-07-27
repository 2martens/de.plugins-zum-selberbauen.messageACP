<div id="smilies" class="smiliesContent tabMenuContent container containerPadding{if $smileyCategories|count} tabMenuContainer{/if}">
	{capture assign=__defaultSmilies}
		{include file='__messageFormSmilies' smilies=$defaultSmilies}
	{/capture}
	
	{if $smileyCategories|count}
		<nav class="menu">
			<ul>
				<li><a href="#smilies-0">{lang}wcf.smilies.default{/lang}</a></li>
				{foreach from=$smileyCategories item=smileyCategory}
					<li><a href="#smilies-{@$smileyCategory->smileyCategoryID}" data-smiley-category-id="{@$smileyCategory->smileyCategoryID}">{$smileyCategory->title|language}</a></li>
				{/foreach}
			</ul>
		</nav>
		
		<div id="smilies-0" class="hidden">
			{@$__defaultSmilies}
		</div>
		
		{foreach from=$smileyCategories item=smileyCategory}
			<div id="smilies-{@$smileyCategory->smileyCategoryID}" class="hidden"></div>
		{/foreach}
		
		<script type="text/javascript">
			//<![CDATA[
			$(function() {
				new WCF.Message.Smilies();
			});
			//]]>
		</script>
	{else}
		{@$__defaultSmilies}
	{/if}
</div>