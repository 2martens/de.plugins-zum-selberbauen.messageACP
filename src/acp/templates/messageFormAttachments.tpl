<div id="attachments" class="formAttachmentContent tabMenuContent container containerPadding">
	<ul class="formAttachmentList clearfix"{if !$attachmentHandler->getAttachmentList()|count} style="display: none"{/if}>
		{foreach from=$attachmentHandler->getAttachmentList() item=$attachment}
			<li class="box48">
				<img src="{link controller='Attachment' object=$attachment}tiny=1{/link}" alt="" class="thumbnail" />
				
				<div>
					<hgroup>
						<h1>{$attachment->filename}</h1>
						<h2><small>{@$attachment->filesize|filesize}</small></h2>
					</hgroup>
					
					<ul>
						<li><img src="{icon}delete{/icon}" alt="" title="{lang}wcf.global.button.delete{/lang}" class="jsDeleteButton jsTooltip" data-object-id="{@$attachment->attachmentID}" data-confirm-message="{lang}wcf.attachment.delete.sure{/lang}" /></li>
					</ul>
				</div>
			</li>
		{/foreach}
	</ul>
	
	<dl>
		<dd>
			<div></div>
			<small>Maximum number of attachments: {#$attachmentHandler->getMaxCount()}<br />
Maximum file size: {@$attachmentHandler->getMaxSize()|filesize}<br />
Allowed file extensions: {', '|implode:$attachmentHandler->getAllowedExtensions()}</small>
		</dd>
	</dl>
</div>

<script type="text/javascript" src="{@$__wcf->getPath()}js/WCF.Attachment.js"></script>
<script type="text/javascript">
	//<![CDATA[
	$(function() {
		new WCF.Attachment.Upload($('#attachments > dl > dd > div'), $('#attachments > ul'), '{@$attachmentObjectType}', '{@$attachmentObjectID}', '{$tmpHash|encodeJS}', '{@$attachmentParentObjectID}');
		new WCF.Action.Delete('wcf\\data\\attachment\\AttachmentAction', $('.formAttachmentList > li'));
	});
	//]]>
</script>

<input type="hidden" name="tmpHash" value="{$tmpHash}" />