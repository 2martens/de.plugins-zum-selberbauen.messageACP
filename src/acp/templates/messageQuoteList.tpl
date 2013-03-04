{if !$supportPaste|isset}{assign var=supportPaste value=false}{/if}
{foreach from=$messages item=message}
	<article class="message messageReduced marginTop" data-link="{@$message->getLink()}" data-username="{$message->getUsername()}">
		<div>
			<section class="messageContent">
				<div>
					<header class="messageHeader">
						<div class="box32">
							{if $userProfiles[$message->getUserID()]|isset}
								<a href="{link controller='User' object=$userProfiles[$message->getUserID()]}{/link}" class="framed">{@$userProfiles[$message->getUserID()]->getAvatar()->getImageTag(32)}</a>
							{/if}
							
							<hgroup class="messageHeadline">
								<h1><a href="{@$message->getLink()}">{$message->getTitle()}</a></h1>
								<h2>
									<span class="username">{if $userProfiles[$message->getUserID()]|isset}<a href="{link controller='User' object=$userProfiles[$message->getUserID()]}{/link}">{$message->getUsername()}</a>{else}{$message->getUsername()}{/if}</span>
									{@$message->getTime()|time}
								</h2>
							</hgroup>
						</div>
					</header>
					
					<div class="messageBody">
						<div>
							<div class="messageText">
								<ul>
									{foreach from=$message key=quoteID item=quote}
										<li data-quote-id="{@$quoteID}">
											<span>
												<input type="checkbox" value="1" class="jsRemoveQuote" />
												{if $supportPaste}<span class="icon icon16 icon-plus jsTooltip jsInsertQuote" title="{lang}wcf.message.quote.insertQuote{/lang}"></span>{/if}
											</span>
											
											<div class="jsQuote">
												{@$quote}
											</div>
											<div class="jsFullQuote">
												{@$message->getFullQuote($quoteID)}
											</div>
										</li>
									{/foreach}
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</article>
{/foreach}