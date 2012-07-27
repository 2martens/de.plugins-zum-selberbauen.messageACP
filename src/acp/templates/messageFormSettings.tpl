<fieldset id="settings" class="settingsContent tabMenuContent container containerPadding">
	<dl class="wide">
		<dd>
			<label for="parseURL"><input id="parseURL" name="parseURL" type="checkbox" value="1"{if $parseURL} checked="checked"{/if} /> {lang}wcf.message.settings.parseURL{/lang}</label>
			<small>{lang}wcf.message.settings.parseURL.description{/lang}</small>
		</dd>
		<dd>
			<label for="enableSmilies"><input id="enableSmilies" name="enableSmilies" type="checkbox" value="1"{if $enableSmilies} checked="checked"{/if} /> {lang}wcf.message.settings.enableSmilies{/lang}</label>
			<small>{lang}wcf.message.settings.enableSmilies.description{/lang}</small>
		</dd>
		<dd>
			<label for="enableBBCodes"><input id="enableBBCodes" name="enableBBCodes" type="checkbox" value="1"{if $enableBBCodes} checked="checked"{/if} /> {lang}wcf.message.settings.enableBBCodes{/lang}</label>
			<small>{lang}wcf.message.settings.enableBBCodes.description{/lang}</small>
		</dd>
		{if $__wcf->getSession()->getPermission('user.message.canUseHtml')}
			<dd>
				<label for="enableHtml"><input id="enableHtml" name="enableHtml" type="checkbox" value="1"{if $enableHtml} checked="checked"{/if} /> {lang}wcf.message.settings.enableHtml{/lang}</label>
				<small>{lang}wcf.message.settings.enableHtml.description{/lang}</small>
			</dd>
		{/if}
		{event name='settings'}
	</dl>
</fieldset>
