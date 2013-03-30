<div id="attachments" class="jsOnly formAttachmentContent tabMenuContent container containerPadding">
	<ul class="formAttachmentList clearfix"{if !$attachmentHandler->getAttachmentList()|count} style="display: none"{/if}>
		{foreach from=$attachmentHandler->getAttachmentList() item=$attachment}
			<li class="box48">
				{if $attachment->tinyThumbnailType}
					<img src="{link controller='Attachment' object=$attachment}tiny=1{/link}" alt="" class="thumbnail" />
				{else}
					<span class="icon icon48 icon-paper-clip"></span>
				{/if}
				
				<div>
					<hgroup>
						<h1><a href="{link controller='Attachment' object=$attachment}{/link}"{if $attachment->isImage} title="{$attachment->filename}" class="jsImageViewer"{/if}>{$attachment->filename}</a></h1>
						<h2><small>{@$attachment->filesize|filesize}</small></h2>
					</hgroup>
					
					<ul>
						<li><span class="icon icon16 icon-remove pointer jsTooltip jsDeleteButton " title="{lang}wcf.global.button.delete{/lang}" data-object-id="{@$attachment->attachmentID}" data-confirm-message="{lang}wcf.attachment.delete.sure{/lang}"></span></li>
						<li><span class="icon icon16 icon-paste pointer jsTooltip jsButtonInsertAttachment" title="{lang}wcf.attachment.insert{/lang}" data-object-id="{@$attachment->attachmentID}" /></li>
					</ul>
				</div>
			</li>
		{/foreach}
	</ul>
	
	<dl class="wide">
		<dd>
			<div></div>
			<small>{lang}wcf.attachment.upload.limits{/lang}</small>
		</dd>
	</dl>
</div>

<script type="text/javascript" src="{@$__wcf->getPath()}js/WCF.Attachment.js"></script>
<script type="text/javascript">
	//<![CDATA[
	$(function() {
		WCF.Language.addObject({
			'wcf.attachment.upload.error.invalidExtension': '{lang}wcf.attachment.upload.error.invalidExtension{/lang}',
			'wcf.attachment.upload.error.tooLarge': '{lang}wcf.attachment.upload.error.tooLarge{/lang}',
			'wcf.attachment.upload.error.reachedLimit': '{lang}wcf.attachment.upload.error.reachedLimit{/lang}',
			'wcf.attachment.upload.error.reachedRemainingLimit': '{lang}wcf.attachment.upload.error.reachedRemainingLimit{/lang}',
			'wcf.attachment.upload.error.uploadFailed': '{lang}wcf.attachment.upload.error.uploadFailed{/lang}',
			'wcf.global.button.upload': '{lang}wcf.global.button.upload{/lang}',
			'wcf.attachment.insert': '{lang}wcf.attachment.insert{/lang}',
			'wcf.attachment.delete.sure': '{lang}wcf.attachment.delete.sure{/lang}'
		});
		
		new WCF.Attachment.Upload($('#attachments > dl > dd > div'), $('#attachments > ul'), '{@$attachmentObjectType}', '{@$attachmentObjectID}', '{$tmpHash|encodeJS}', '{@$attachmentParentObjectID}', {@$attachmentHandler->getMaxCount()}, '{@$wysiwygContainerID}');
		new WCF.Action.Delete('wcf\\data\\attachment\\AttachmentAction', '.formAttachmentList > li');
	});
	//]]>
</script>

<input type="hidden" name="tmpHash" value="{$tmpHash}" />