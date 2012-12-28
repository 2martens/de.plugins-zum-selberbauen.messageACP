{if !$supportPaste|isset}{assign var=supportPaste value=false}{/if}
{foreach from=$messages item=message}
	<article class="message messageReduced" data-link="{@$message->getLink()}" data-username="{$message->getUsername()}">
		<div>
			<section class="messageContent">
				<div>
					<header class="messageHeader">
						<div class="messageCredits box32">
							{if $userProfiles[$message->getUserID()]|isset}
								<a href="{link controller='User' object=$userProfiles[$message->getUserID()]}{/link}" class="framed">{@$userProfiles[$message->getUserID()]->getAvatar()->getImageTag(32)}</a>
							{/if}
							<div>
								<p>{if $userProfiles[$message->getUserID()]|isset}<a href="{link controller='User' object=$userProfiles[$message->getUserID()]}{/link}">{$message->getUsername()}</a>{else}{$message->getUsername()}{/if}<p>
								
								{@$message->getTime()|time}
							</div>
						</div>
						
						<h1 class="messageTitle"><a href="{@$message->getLink()}">{$message->getTitle()}</a></h1>
					</header>
					
					<div class="messageBody">
						<div>
							<div class="messageText">
								<ul>
									{foreach from=$message key=quoteID item=quote}
										<li data-quote-id="{@$quoteID}">
											<span>
												<input type="checkbox" value="1" class="jsRemoveQuote" />
												{if $supportPaste}<img src="{icon}add{/icon}" alt="" class="jsTooltip icon16 jsInsertQuote" title="{lang}wcf.message.quote.insertQuote{/lang}" />{/if}
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